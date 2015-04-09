using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntityFreamwork
{
    public partial class TestjqGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<Product> GetAllProduct()
        {
            return new OrderBussiness().GetAllProduct();
        }


        //[WebMethod]
        //public static List<ProductCategory> GetAllProduct2()
        //{
        //    List<ProductCategory> xxx;
        //    using(Practice4Entities context = new Practice4Entities())
        //    {
        //        context.Configuration.LazyLoadingEnabled = false;
        //        xxx = context.ProductCategories.ToList();
        //    }
        //    return xxx;
        //}
    }
}