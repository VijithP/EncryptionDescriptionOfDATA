using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.IO;


namespace EncryptionDecryptionApp
{
    class Program
    {

       DAL DataAccessLayer = new DAL();
       public  static void Main(string[] args)
        {

            string loggedInUser = "Admin";
            string encryptionKey = "App@2020";


            Console.WriteLine("Encryption & Decryption ");
            Console.WriteLine("Two Level Encryption & Decryption : C# code level & SQL Level");
            Console.WriteLine("_______________________________");
           
            string path = "";
            path = @"D:\RD\ENCRYPTION_DECRYPTION_GIT\EncryptionDecryptionApp\EncryptionDecryptionApp\HRFiletoupload.xlsx";

            List<string> filePath = new List<string>() { path };
            
            Program pg = new Program();
            pg.FileUpload(filePath, loggedInUser, encryptionKey);

            pg.ConfidentialData(encryptionKey);
            Console.ReadKey();



        }




        public string FileUpload(List<string> lstFIlePaths, string loggedInUser, string key)
        {

            string result = "";
            try
            {
                foreach (string filePath in lstFIlePaths)
                {
                var sheetName = "Sheet1";

                var connectionString = $@"
                        Provider=Microsoft.ACE.OLEDB.12.0;
                        Data Source={filePath};
                        Extended Properties=""Excel 12.0 Xml;HDR=YES""
                    ";

                //Creating and opening a data connection to the Excel sheet 
                using (var conn = new OleDbConnection(connectionString))
                {
                    conn.Open();

                    var cmd = conn.CreateCommand();
                    cmd.CommandText = $"SELECT * FROM [{sheetName}$]";
                    DataTable dt = new DataTable();
                    //dt.Columns.Contains("")

                    using (var rdr = cmd.ExecuteReader())
                    {

                        string[] dbColumns = new string[] { "HRData_ID,int,1", "Emp_ID,int,2", "Emp_Name,string,3", "Current_CTC,string,4", "Created_By,string,5", "Created_Dt,DateTime,6", "Updated_By,string,7", "Updated_Dt,DateTime,8" };
                        string[] mandateColumns = new string[] { "Emp_ID", "Emp_Name", "Current_CTC" };
                        int count = 0;

                        dt.Load(rdr);

                        if (dt.Columns.Count > 0)
                        {
                            foreach (string dbColumn in dbColumns)
                            {
                                Dictionary<string, Type> types = new Dictionary<string, Type>();
                                types.Add("string", typeof(string));
                                types.Add("int", typeof(int));
                                types.Add("int?", typeof(int?));
                                types.Add("DateTime", typeof(DateTime));
                                types.Add("Float", typeof(float));
                                string[] dbcolumnsplit = dbColumn.Split(',');

                                if (!dt.Columns.Contains(dbcolumnsplit[0]))
                                {

                                    dt.Columns.Add(dbcolumnsplit[0], types[dbcolumnsplit[1]]).SetOrdinal(Convert.ToInt32(dbcolumnsplit[2]) - 1);

                                    if (mandateColumns.Contains(dbcolumnsplit[0]))
                                    {
                                        count++;
                                    }
                                }
                                else
                                {
                                    dt.Columns[dbcolumnsplit[0]].SetOrdinal(Convert.ToInt32(dbcolumnsplit[2]) - 1);
                                    if (mandateColumns.Contains(dbcolumnsplit[0]))
                                    {
                                        count++;
                                    }
                                }
                            }
                        }
                        if (count != 3)
                        {
                            result = "Upload excel is not in correct format.";
                        }
                        else
                        {
                            dt.AcceptChanges();
                            foreach (DataRow dr in dt.Rows) // search whole table
                            {

                                if (dr["Emp_ID"].ToString() != null && dr["Emp_ID"].ToString() != "")
                                {
                                    dr["HRData_ID"] = 0;
                                    dr["Current_CTC"] = dr["Current_CTC"].ToString().AESEncryptData(key);

                                }
                                else
                                {
                                    dr.Delete();
                                }
                            }
                            dt.AcceptChanges();
                            result = DataAccessLayer.UploadFile(dt, loggedInUser);
                            Console.WriteLine(result);
                            Console.WriteLine("----------------------");

                        }
                    }
                }
            }
        }
            catch (Exception ex) {
                result = ex.Message;
                throw ex;
            }
            return result;
        }
        public void ConfidentialData(string key)
        {
            try
            {
              DataSet ds=  DataAccessLayer.ExecuteDataSet();

                DataTable dt = ds.Tables[0];

                Console.WriteLine("");
                Console.WriteLine("Employee data from DB");
                Console.WriteLine("__________________________________________");


                foreach(DataRow dr in dt.Rows)
                {

                    string value = ExtensionMethods.AESDecryptData(dr["Current_CTC"].ToString(), key);
                    Console.WriteLine("{0} - {1} - {2}", dr["Emp_ID"].ToString(), dr["Emp_Name"].ToString(), ExtensionMethods.AESDecryptData(dr["Current_CTC"].ToString(), key));
                }

            }
            catch (Exception)
            {

                throw;
            }
        }



    }
}
