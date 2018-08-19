<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="MyStore3.Pages.Listing" MasterPageFile="~/Pages/Store.Master" Culture="ru-RU" UICulture="ru-RU" %>
<%@ Import Namespace="System.Web.Routing" %>

<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">
        
        <asp:Repeater ItemType="MyStore3.Models.Game"
            SelectMethod="GetGames" runat="server">
            <ItemTemplate>
                <div class="item">
                    <h3><%# Item.Name %></h3>
                    <%# Item.Description %>
                    <h4><%# Item.Price.ToString("c") %></h4>
                    <button name="add" type="submit" value="<%# Item.GameId %>">
                        Добавить в корзину
                    </button>
                </div>
            </ItemTemplate>
        </asp:Repeater>

           <%
 //               foreach (MyStore3.Models.Game game in GetGames())
 //               {
 //                   Response.Write(String.Format(@"
 //                       <div class='item'>
 //                           <h3>{0}</h3>
 //                           {1}
 //                           <h4>{2:c}</h4> 
 //                           <button name='add' type='submit' vlue='{3}'>
 //                       </div>", 
 //                       game.Name, game.Description, game.Price, game.GameId));
 //               }
            %>
        </div>
        <div class="pager">
        <%
            for (int i = 1; i <= MaxPage; i++)
            {
                string path = RouteTable.Routes.GetVirtualPath(null, null,
                    new RouteValueDictionary() { { "page", i } }).VirtualPath;

                Response.Write(
                    String.Format("<a href='{0}' {1}>{2}</a>",
                        path, i == CurrentPage ? "class='selected'" : "", i));

                //Response.Write(
                //    String.Format("<a href='/Pages/Listing.aspx?page={0}' {1}>{2}</a>",
                //        i, i == CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
</asp:Content>