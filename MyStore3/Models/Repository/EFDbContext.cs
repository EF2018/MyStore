using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using MyStore3.Models;

namespace MyStore3.Models.Repository
{
    public class EFDbContext: DbContext
    {
        public DbSet<Game> Games { get; set; }
        public DbSet<Order> Orders { get; set; } 
    }
}