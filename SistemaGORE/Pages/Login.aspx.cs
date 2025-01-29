using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaGORE.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Cache-Control", "no-store");
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString());
        string Patron = "Gilat";

        protected void ingresar_Click(object sender, EventArgs e)
        {
            if (ValidarCaptcha())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_login", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Usuario", System.Data.SqlDbType.VarChar).Value = usuario.Text;
                    cmd.Parameters.Add("@Clave", System.Data.SqlDbType.VarChar).Value = clave.Text;
                    cmd.Parameters.Add("@Patron", System.Data.SqlDbType.VarChar).Value = Patron;

                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.Read())
                    {
                        Session["Id_rol"] = rd[4].ToString();
                        Session["usuario"] = rd[1].ToString();
                        Response.Redirect("index.aspx");
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Response.Write("<script>alert('Error en el inicio de sesión');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Por favor, verifica el reCAPTCHA');</script>");
            }
        }

        private bool ValidarCaptcha()
        {
            string captchaResponse = Request.Form["g-recaptcha-response"];
            string secretKey = "6Lds-sYqAAAAANbz-4FVfgeCuSVVK00nVHLu5Wm4";

            var client = new WebClient();
            string reply = client.DownloadString($"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={captchaResponse}");

            JavaScriptSerializer js = new JavaScriptSerializer();
            var obj = js.Deserialize<dynamic>(reply);
            return obj["success"];
        }
    }
}