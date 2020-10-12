﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace proyectoSistemaIII
{
    public partial class CompraCarrito : System.Web.UI.Page
    {
        DataTable dtb;
        DataTable carrito = new DataTable();

        //lista o pone los datos a los productos
        public void CargarDetalle()
        {
            if (Session["pedido"] == null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("codproducto", System.Type.GetType("System.String"));
                dtb.Columns.Add("desproducto", System.Type.GetType("System.String"));
                dtb.Columns.Add("preproducto", System.Type.GetType("System.Double"));
                dtb.Columns.Add("subtotal", System.Type.GetType("System.Double"));
                dtb.Columns.Add("canproducto", System.Type.GetType("System.Int32"));

                Session["pedido"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["pedido"] = Session["prueba"];
            }


        }

        //agregara un item la que seleccione el usuario
        public void AgregarItem(string cod, string des, double precio)
        {
            double total;
            int cantidad = 1;
            total = precio * cantidad;
            carrito = (DataTable)Session["pedido"];
            DataRow fila = carrito.NewRow();
            fila[0] = cod;
            fila[1] = des;
            fila[2] = precio;
            fila[3] = (int)cantidad;
            fila[4] = total;
            carrito.Rows.Add(fila);
            Session["pedido"] = carrito;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                CargarDetalle();
                lblAgregado.Text = "";
            }
        }

        //seleccionar dato al boton ponemos un comando que es "Seleccionar"
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null, nom = null;
            double precio = 0;
            if (e.CommandName == "Seleccionar")
            {
                DataList1.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList1.SelectedItem.FindControl("codproductoLabel")).Text;
                des = ((Label)this.DataList1.SelectedItem.FindControl("desproductoLabel")).Text;
                precio = double.Parse(((Label)this.DataList1.SelectedItem.FindControl("preproductoLabel")).Text);
                AgregarItem(cod, des, precio);

                lblAgregado.Text = "Producto Agregado: " + nom + " " + des;
                //Session["prueba"] = "Sesión usuario prueba";
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/ListaComprado.aspx");
        }


    }
}