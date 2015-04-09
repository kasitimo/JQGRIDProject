<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyFirstAjax.aspx.cs" Inherits="EntityFreamwork.MyFirstAjax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.11.2.min.js"></script>
        <script>
            $(function () {

                $("#BtnBindData").on("click", function () {

                    $.ajax({
                        contentType: "application/json; charset=uft-8",
                        data: JSON.stringify({ dummy: "" }),
                        url: "MyFirstAjax.aspx/GetAllCategories",                        
                        type: "POST",
                        dataType: 'json',               
                        success: function (data)         
                        {
                            Result = data.d;
                            $.each(Result, function (key, value) {
                                $("#DropDownList1").append($("<option></option>").val
                                (value.ID).html(value.Name));
                            });
                        },
                        error: function (XMLHttpRequest, testStatus, errowThrow) {
                            var errorResponse = jQuery.parseJSON(XMLHttpRequest.responseText);
                            alert(errorResponse);
                        }
                    });
                });
            });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="button" id="BtnBindData" value="Click"/>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
    </form>
</body>
</html>
