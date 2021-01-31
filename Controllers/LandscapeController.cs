using SNP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SNP.Controllers
{
    public class LandscapeController : Controller
    {
        // GET: Landscape
        public ActionResult Index(int? ID)
        {
            //encontrar os que já foram selecionados
            List<SNPs> ListaSNPS = new List<SNPs>();
            List<vw_Categoria_x_SubCategoria> ListaCategoriasSubCategorias = new List<vw_Categoria_x_SubCategoria>();
            List<Cancer_x_SNP> selecionados = new List<Cancer_x_SNP>();
            List<Cancer_x_Subcategoria> selecionadosCSC = new List<Cancer_x_Subcategoria>();
            List<REL_Cancer_x_Subcategoria_x_SNP> rel = new List<REL_Cancer_x_Subcategoria_x_SNP>();

            Int64 idTratado = 0;
            if (ID == null)
            {
                long cancer = 0;
                using (GENPsCEntities1 ent = new GENPsCEntities1())
                {
                    cancer = ent.Cancer.Select(x=> x.ID).FirstOrDefault();
                    idTratado = cancer;
                }
            }
            else
            {
                idTratado = Convert.ToInt64(ID);
            }

            if (idTratado > 0)
            {
                using (GENPsCEntities1 ent = new GENPsCEntities1())
                {
                    selecionados = ent.Cancer_x_SNP.Where(x => x.ID_Cancer == idTratado).ToList();
                    selecionadosCSC = ent.Cancer_x_Subcategoria.Where(x => x.ID_CANCER == idTratado).ToList();
                    ListaSNPS = ent.SNPs.ToList();
                    ListaCategoriasSubCategorias = ent.vw_Categoria_x_SubCategoria.ToList();
                    ViewBag.SNPInfo = ent.REL_Cancer_x_Subcategoria_x_SNP.Where(x => x.ID_CANCER == idTratado).ToList();
                }
            }

            ViewBag.ListaCSCSelecionados = selecionadosCSC;
            ViewBag.ListaCategoriasSubCategorias = ListaCategoriasSubCategorias;

            ViewBag.ListaSNPSSelecionados = selecionados;
            ViewBag.ListaSNPS = ListaSNPS;

            return View();
        }
    }
}