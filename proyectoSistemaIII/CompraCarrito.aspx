﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CompraCarrito.aspx.cs" Inherits="proyectoSistemaIII.CompraCarrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron"  style="background-color:white">
				<table class="table-responsive">
				<tbody>     
                    <tr>
                        <td>
                            <h3>Lista de Productos</h3>                                                       
                            <asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton1" width="120" height="120" runat="server" ImageUrl="http://localhost:22024/Imagenes/carro-de-compras.jpg" OnClick="ImageButton1_Click" /><!-- descargar la imgen para el carrito-->
                        </td>
                    </tr>               
					<tr>
						<td>							

						    <asp:DataList ID="DataList1" runat="server" DataKeyField="codproducto" DataSourceID="SqlDataSource1" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand" CssClass="table table-responsive">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/Imagenes/"+Eval("imagen") %>' CssClass="img-fluid" />
                                    <br />
                                    <br />
                                    Código :
                                    <asp:Label ID="codproductoLabel" runat="server" Text='<%# Eval("codproducto") %>' />
                                    <br />
                                    Producto :
                                    <asp:Label ID="desproductoLabel" runat="server" Text='<%# Eval("desproducto") %>' />
                                    <br />
                                    Categoria :
                                    <asp:Label ID="codcategoriaLabel" runat="server" Text='<%# Eval("codcategoria") %>' />
                                    <br />
                                    Precio :
                                    <asp:Label ID="preproductoLabel" runat="server" Text='<%# Eval("preproducto") %>' />
                                    <br />
                                    Cantidad :
                                    <asp:Label ID="canproductoLabel" runat="server" Text='<%# Eval("canproducto") %>' />
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Agregar al Carrito" CssClass="btn btn-success" />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>

						    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDVENTAS_5ConnectionString %>" SelectCommand="SELECT * FROM [Productos]"></asp:SqlDataSource>

						</td>
                        						
					</tr>

					
				</tbody>
			</table>
			</div>
		</div>
	</div>
</div>
    
    
</asp:Content>
