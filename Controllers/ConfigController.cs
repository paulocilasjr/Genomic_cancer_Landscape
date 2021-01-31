using SNP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SNP.Controllers
{
    public class ConfigController : Controller
    {

        #region categoria
        public ActionResult Categoria()
        {
            List<Categoria> list = new List<Categoria>();

            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                list = ent.Categoria.AsNoTracking().ToList();
            }

            return View(list);
        }

        public ActionResult NovaCategoria(int? ID)
        {
            //editar
            if (ID > 0)
            {
                Categoria cat = new Categoria();
                //tratamento para o nulo
                Int64 idTratado = 0;
                idTratado = Convert.ToInt64(ID);

                using (GENPsCEntities1 ent = new GENPsCEntities1())
                {
                    cat = ent.Categoria.AsNoTracking().SingleOrDefault(x => x.ID == idTratado);
                }
                return View(cat);
            }
            else //inserir
            {
                return View(new Categoria());
            }
        }

        public ActionResult SalvarCategoria(Categoria model)
        {
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                if (model.ID > 0)//edit
                {
                    Categoria cat = ent.Categoria.SingleOrDefault(x => x.ID == model.ID);
                    cat.Nome = model.Nome;
                    cat.Cor = model.Cor;
                }
                else //insert
                {
                    ent.Categoria.Add(model);
                }
                ent.SaveChanges();
            }

            return RedirectToAction("Categoria");
        }

        public ActionResult ExcluirCategoria(int ID)
        {
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                Categoria cat = ent.Categoria.SingleOrDefault(x => x.ID == ID);
                ent.Categoria.Remove(cat);
                ent.SaveChanges();
            }

            return RedirectToAction("Categoria");
        }
        #endregion

        #region subcategoria
        public ActionResult SubCategoria()
        {
            List<vw_Categoria_x_SubCategoria> list = new List<vw_Categoria_x_SubCategoria>();

            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                list = ent.vw_Categoria_x_SubCategoria.AsNoTracking().ToList();
            }

            return View(list);
        }

        public ActionResult NovaSubCategoria(int? ID)
        {
            //preenche a viewbag com a lista de categorias para montar a tela
            List<Categoria> listCategorias = new List<Categoria>();
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                listCategorias = ent.Categoria.AsNoTracking().ToList();
            }
            ViewBag.ListaCategorias = listCategorias;

            //editar
            if (ID > 0)
            {
                Subcategoria cat = new Subcategoria();
                //tratamento para o nulo
                Int64 idTratado = 0;
                idTratado = Convert.ToInt64(ID);

                using (GENPsCEntities1 ent = new GENPsCEntities1())
                {
                    cat = ent.Subcategoria.AsNoTracking().SingleOrDefault(x => x.ID == idTratado);
                }
                return View(cat);
            }
            else //inserir
            {
                return View(new Subcategoria());
            }
        }

        public ActionResult SalvarSubCategoria(Subcategoria model)
        {
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                if (model.ID > 0)//edit
                {
                    Subcategoria subcat = ent.Subcategoria.SingleOrDefault(x => x.ID == model.ID);
                    subcat.Nome = model.Nome;
                    subcat.ID_CATEGORIA = model.ID_CATEGORIA;
                }
                else //insert
                {
                    ent.Subcategoria.Add(model);
                }
                ent.SaveChanges();
            }

            return RedirectToAction("SubCategoria");
        }

        public ActionResult ExcluirSubCategoria(int ID)
        {
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                Subcategoria subcat = ent.Subcategoria.SingleOrDefault(x => x.ID == ID);
                ent.Subcategoria.Remove(subcat);
                ent.SaveChanges();
            }

            return RedirectToAction("SubCategoria");
        }

        #endregion

        #region SNPs
        public ActionResult SNPs()
        {
            List<vw_SNPs_x_Cancer> list = new List<vw_SNPs_x_Cancer>();

            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                list = ent.vw_SNPs_x_Cancer.AsNoTracking().ToList();
            }

            return View(list);
        }

        public ActionResult NovaSNPs(int? ID)
        {
            //preenche a viewbag com a lista de cancer para montar a tela
            List<Cancer> listCancer = new List<Cancer>();
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                listCancer = ent.Cancer.AsNoTracking().ToList();
            }
            ViewBag.ListaCancer = listCancer;

            //editar
            if (ID > 0)
            {
                SNPs snps = new Models.SNPs();
                //tratamento para o nulo
                Int64 idTratado = 0;
                idTratado = Convert.ToInt64(ID);

                using (GENPsCEntities1 ent = new GENPsCEntities1())
                {
                    snps = ent.SNPs.AsNoTracking().SingleOrDefault(x => x.ID == idTratado);
                }
                return View(snps);
            }
            else //inserir
            {
                return View(new SNPs());
            }
        }

        public ActionResult SalvarSNPs(SNPs model)
        {
            //validação das informações para inserir
            model.Nome = string.IsNullOrEmpty(model.Nome) ? "" : model.Nome;
            model.Localizacao = string.IsNullOrEmpty(model.Localizacao) ? "" : model.Localizacao;
            model.Mecanismo = string.IsNullOrEmpty(model.Mecanismo) ? "" : model.Mecanismo;
            model.Ordem = model.Ordem > 0 ? model.Ordem : 99;
            model.TargetGene = string.IsNullOrEmpty(model.TargetGene) ? "" : model.TargetGene;
            model.ID_CANCER = model.ID_CANCER > 0 ? model.ID_CANCER : 0;

            //insere ou não
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                if (model.ID > 0)//edit
                {
                    SNPs snps = ent.SNPs.SingleOrDefault(x => x.ID == model.ID);
                    snps.Nome = model.Nome;
                    snps.Localizacao =  model.Localizacao;
                    snps.Mecanismo = model.Mecanismo;
                    snps.Ordem = model.Ordem;
                    snps.TargetGene = model.TargetGene;
                    snps.ID_CANCER = model.ID_CANCER;
                }
                else //insert
                {
                    ent.SNPs.Add(model);
                }
                ent.SaveChanges();
            }

            return RedirectToAction("SNPs");
        }

        public ActionResult ExcluirSNPs(int ID)
        {
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                SNPs snps = ent.SNPs.SingleOrDefault(x => x.ID == ID);
                ent.SNPs.Remove(snps);
                ent.SaveChanges();
            }

            return RedirectToAction("SNPs");
        }

        #endregion

        #region Cancer
        // GET: Config
        public ActionResult Cancer()
        {
            List<Cancer> list = new List<Cancer>();

            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                list = ent.Cancer.ToList();
            }

            return View(list);
        }

        public ActionResult NovoCancer(int? ID)
        {
            Int64 idTratado = 0;
            idTratado = Convert.ToInt64(ID);

            //encontrar os que já foram selecionados
            List<SNPs> ListaSNPS = new List<SNPs>();
            List<vw_Categoria_x_SubCategoria> ListaCategoriasSubCategorias = new List<vw_Categoria_x_SubCategoria>();
            List<Cancer_x_SNP> selecionados = new List<Cancer_x_SNP>();
            List<Cancer_x_Subcategoria> selecionadosCSC = new List<Cancer_x_Subcategoria>();
            List<REL_Cancer_x_Subcategoria_x_SNP> rel = new List<REL_Cancer_x_Subcategoria_x_SNP>();

            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                selecionados = ent.Cancer_x_SNP.Where(x => x.ID_Cancer == idTratado).ToList();
                selecionadosCSC = ent.Cancer_x_Subcategoria.Where(x => x.ID_CANCER == idTratado).ToList();
                ListaSNPS = ent.SNPs.ToList();
                ListaCategoriasSubCategorias = ent.vw_Categoria_x_SubCategoria.ToList();
                ViewBag.SNPInfo = ent.REL_Cancer_x_Subcategoria_x_SNP.Where(x => x.ID_CANCER == ID).ToList();
            }

            ViewBag.ListaCSCSelecionados = selecionadosCSC;
            ViewBag.ListaCategoriasSubCategorias = ListaCategoriasSubCategorias;

            ViewBag.ListaSNPSSelecionados = selecionados;
            ViewBag.ListaSNPS = ListaSNPS;

            //editar
            if (ID > 0)
            {
                Cancer cancer = new Models.Cancer();
                //tratamento para o nulo

                using (GENPsCEntities1 ent = new GENPsCEntities1())
                {
                    cancer = ent.Cancer.AsNoTracking().SingleOrDefault(x => x.ID == idTratado);
                }
                return View(cancer);
            }
            else //inserir
            {
                return View(new Cancer());
            }
        }

        public ActionResult SalvarCancer(Cancer model, string listaSNPs, string listaCSC)
        {
            //validação das informações para inserir
            model.Nome = string.IsNullOrEmpty(model.Nome) ? "" : model.Nome;

            //insere ou não
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                if (model.ID > 0)//edit
                {
                    Cancer cancer = ent.Cancer.SingleOrDefault(x => x.ID == model.ID);
                    cancer.Nome = model.Nome;

                    //apagar todos
                    var todosCancerSNPs = ent.Cancer_x_SNP.ToList();
                    ent.Cancer_x_SNP.RemoveRange(todosCancerSNPs);
                    ent.SaveChanges();

                    //apagar todos cat e sub
                    var todosCancerCSC = ent.Cancer_x_Subcategoria.ToList();
                    ent.Cancer_x_Subcategoria.RemoveRange(todosCancerCSC);
                    ent.SaveChanges();

                    //inserir os novos selecionados snps
                    var s = listaSNPs.Split(',');
                    if (s != null && s.Count() > 0)
                    {
                        foreach (var item in s)
                        {
                            Cancer_x_SNP novo = new Cancer_x_SNP
                            {
                                ID_Cancer = model.ID,
                                ID_SNPS = Convert.ToInt64(item)
                            };
                            ent.Cancer_x_SNP.Add(novo);
                            ent.SaveChanges();
                        }
                    }

                    //inserir os novos selecionados csc
                    var s2 = listaCSC.Split(',');
                    if (s2 != null && s.Count() > 0)
                    {
                        foreach (var item in s2)
                        {
                            Cancer_x_Subcategoria novo = new Cancer_x_Subcategoria
                            {
                                ID_CANCER = model.ID,
                                ID_SUBCATEGORIA = Convert.ToInt64(item)
                            };
                            ent.Cancer_x_Subcategoria.Add(novo);
                            ent.SaveChanges();
                        }
                    }
                }
                else //insert
                {
                    ent.Cancer.Add(model);

                    //insere um novo snps
                    var s = listaSNPs.Split(',');
                    if (s != null && s.Count() > 0)
                    {
                        foreach (var item in s)
                        {
                            Cancer_x_SNP novo = new Cancer_x_SNP
                            {
                                ID_Cancer = model.ID,
                                ID_SNPS = Convert.ToInt64(item)
                            };
                            ent.Cancer_x_SNP.Add(novo);
                            ent.SaveChanges();
                        }
                    }

                    //inserir os novos selecionados csc
                    var s2 = listaCSC.Split(',');
                    if (s2 != null && s.Count() > 0)
                    {
                        foreach (var item in s2)
                        {
                            Cancer_x_Subcategoria novo = new Cancer_x_Subcategoria
                            {
                                ID_CANCER = model.ID,
                                ID_SUBCATEGORIA = Convert.ToInt64(item)
                            };
                            ent.Cancer_x_Subcategoria.Add(novo);
                            ent.SaveChanges();
                        }
                    }
                }
                ent.SaveChanges();
            }

            return RedirectToAction("Cancer");
        }

        public ActionResult ExcluirCancer(int ID)
        {
            using (GENPsCEntities1 ent = new GENPsCEntities1())
            {
                Cancer cancer = ent.Cancer.SingleOrDefault(x => x.ID == ID);
                ent.Cancer.Remove(cancer);
                ent.SaveChanges();
            }

            return RedirectToAction("Cancer");
        }

        public bool SalvaEstudo(string obj, bool valor, long idCancer)
        {
            //switcher_CAT_SNP
            try
            {
                var objSplit = obj.Split('_');
                var snp = Convert.ToInt64(objSplit[2]);
                var sub = Convert.ToInt64(objSplit[1]);
                if (valor)
                {
                    //insere na base
                    using (GENPsCEntities1 ent = new GENPsCEntities1())
                    {
                        REL_Cancer_x_Subcategoria_x_SNP rel = new REL_Cancer_x_Subcategoria_x_SNP
                        {
                            ID_CANCER = idCancer,
                            ID_SNP = snp,
                            ID_SUBCATEGORIA = sub
                        };

                        ent.REL_Cancer_x_Subcategoria_x_SNP.Add(rel);
                        ent.SaveChanges();
                    }
                }
                else // remove a informação
                {
                    using (GENPsCEntities1 ent = new GENPsCEntities1())
                    {
                        var rel = ent.REL_Cancer_x_Subcategoria_x_SNP.Single(x=> x.ID_CANCER == idCancer 
                                                                            && x.ID_SNP == snp
                                                                            && x.ID_SUBCATEGORIA == sub);
                        ent.REL_Cancer_x_Subcategoria_x_SNP.Remove(rel);
                        ent.SaveChanges();
                    }
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        
        #endregion

        // GET: Config

    }
}