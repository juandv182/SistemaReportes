<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaGORE.Pages.Login" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <div class="container">
        <div class="box" style="max-width: 400px; margin: auto; text-align: center;">
            <h1 class="title">Herramienta de Gestión y Monitoreo</h1>
            <h2 class="subtitle">GORE Ayacucho</h2>

      
            <form id="form1" runat="server">
                <div class="field">
                    <label class="label">Usuario</label>
                    <div class="control">
                        <asp:TextBox runat="server" ID="usuario" CssClass="input" placeholder="Ingrese su usuario"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Contraseña</label>
                    <div class="control">
                        <asp:TextBox runat="server" ID="clave" CssClass="input" TextMode="Password" placeholder="Ingrese su contraseña"></asp:TextBox>
                    </div>
                </div>

                <!-- Integración de Google reCAPTCHA -->
                <div class="field">
                    <div class="g-recaptcha" data-sitekey="6Lds-sYqAAAAAHGvoGx5hsuy0ojxqkPExhZF8CuQ"></div>
                </div>

                <asp:Button runat="server" ID="ingresar" CssClass="button is-primary is-fullwidth" Text="Ingresar" OnClick="ingresar_Click"/>
            </form>
        </div>
    </div>
</body>
</html>
