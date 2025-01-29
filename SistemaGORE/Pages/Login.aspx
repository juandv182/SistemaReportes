<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MP.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaGORE.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Inicio de Sesión
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="box" style="max-width: 400px; margin: auto; text-align: center;">
            <h1 class="title">Herramienta de Gestión y Monitoreo</h1>
            <h2 class="subtitle">GORE Ayacucho</h2>

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
        </div>
    </div>
</asp:Content>

