<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TestjqGrid.aspx.cs" Inherits="EntityFreamwork.TestjqGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $("#grid").jqGrid({
                colNames: [
                    "ID", "Name", "Description", "Unit", "Price"
                ],
                colModel: [
                    { name: "ID" },
                    { name: "Name" },
                    { name: "Description"},
                    { name: "Unit" },
                    { name: "Price" ,formatter:"currency"}
                ],
                viewreccords: true,
                mtype: 'POST',
                rowNum: 5,
                rowList: [3,5],
                height: "auto",
                datatype: 'json',
                gridview: true,
                loadonce: true,
                url: "TestjqGrid.aspx/GetAllProduct",
                ajaxGridOptions: { contentType: "application/json; charset=uft-8" },
                pager: $("#jpggrid"),
                serializeGridData: function (postData) {
                    //postData.name = $("#txtProduct").val();
                    return JSON.stringify(postData);
                },
                beforeSelectRow: function (rowID, e) {
                    return false;
                },
                jsonReader: {
                    repeatitems: false,
                    root: function (obj) {
                        return obj.d;
                    }
                }
            })
        });
     //  theGrid.jqGrid("seGridParam")
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="grid" border="1">
    </table>
    <div id="jpggrid"></div>
</asp:Content>
