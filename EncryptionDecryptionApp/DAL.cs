using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace EncryptionDecryptionApp
{
    public class DAL
    {
        public string UploadFile(DataTable excelData, string loggedInUser)
        {
            string result = "";
           
            string SqlconnectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            using (var sqlcon = new SqlConnection(SqlconnectionString))
            {
                SqlCommand Sqlcmd = new SqlCommand("usp_UploadHRData", sqlcon);
                Sqlcmd.CommandType = CommandType.StoredProcedure;
                Sqlcmd.Parameters.AddWithValue("@UtypeExcelData", excelData);
                sqlcon.Open();
                Sqlcmd.ExecuteReader();
                sqlcon.Close();

                result = excelData.Rows.Count.ToString() + " Rows Uploaded Successfully !!!!!!!";

            }
            
            return result;
        }

        public DataSet ExecuteDataSet()
        {
            DataSet result = null;
            SqlConnection dbConn = null;
            SqlDataAdapter adp = null;
            string SqlconnectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            try
            {
                dbConn = new SqlConnection( SqlconnectionString);
                SqlCommand dbCmd = new SqlCommand();
                dbCmd.CommandText = "usp_GetConfidentialData";
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.Connection = dbConn;
                dbCmd.CommandTimeout = 1200;
                adp = new SqlDataAdapter(dbCmd);
                result = new DataSet();
                adp.Fill(result);
                dbConn.Close();
                dbConn.Dispose();
                dbCmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (dbConn.State == ConnectionState.Open)
                {
                    dbConn.Close();
                    dbConn.Dispose();
                }
            }
            return result;
        }

    }
}
