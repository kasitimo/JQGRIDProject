using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntityFreamwork
{
    public class OrderBussiness
    {
        public List<ProductCategory> GetAllProductCategory()
        {
            using (OrderEntities context = new OrderEntities())
            {
                context.Configuration.LazyLoadingEnabled = false; 
                System.Data.Entity.DbSet<ProductCategory> productCates = context.ProductCategories;
                return productCates.ToList();
            }
        }
        public List<Product> GetAllProduct()
        {
            using (OrderEntities context = new OrderEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                System.Data.Entity.DbSet<Product> productCates = context.Products;
                return productCates.ToList();
            }

        }
        public string GetProductCategoryName(int id)
        {
            using (OrderEntities context = new OrderEntities())
            {
                return context.ProductCategories.Where(p => p.ID == id).FirstOrDefault().Name;
            }
        }
        public int AddProductCategory(string name)
        {
            using (OrderEntities context = new OrderEntities())
            {
                ProductCategory obj = new ProductCategory() { Name = name };
                context.ProductCategories.Add(obj);
                context.SaveChanges();
                return obj.ID;
            }
        }
        public void UpdateProductCategory(int id, string name)
        {
            using (OrderEntities context = new OrderEntities())
            {
                ProductCategory obj = context.ProductCategories.Where(p => p.ID == id).FirstOrDefault();
                if (obj!=null)
                {
                    obj.Name = name;
                }
                context.SaveChanges();
            }
        }
        public void DeleteProductCategory(int id)
        {
            using (OrderEntities context = new OrderEntities())
            {
                ProductCategory obj = context.ProductCategories.Where(p => p.ID == id).FirstOrDefault();
                context.ProductCategories.Remove(obj);
                context.SaveChanges();
            }
        }


    }
}