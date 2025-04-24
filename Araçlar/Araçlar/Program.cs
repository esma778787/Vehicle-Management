using System;
using System.Collections.Generic;

namespace Araçlar
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Kişi> kişiler = new List<Kişi>();

            Console.Write("Kaç kişi eklemek istersiniz? ");
            int kişiSayısı = int.Parse(Console.ReadLine());

            for (int i = 0; i < kişiSayısı; i++)
            {
                Console.WriteLine($"Kişi {i + 1} bilgilerini girin:");
                Kişi kişi = KişiBilgisiEkle();
                kişiler.Add(kişi);
            }


            Console.WriteLine("Kişiler ve Araçları:");
            for (int i = 0; i < kişiler.Count; i++)
            {
                Console.WriteLine($"Kişi {i + 1} Bilgileri:");
                Console.WriteLine("Ad: Gizli");
                Console.WriteLine("Soyad: Gizli");
                Console.WriteLine("Doğum Yılı: Gizli");
                Console.WriteLine("TCKimlik No: Gizli");
                Console.WriteLine();

                Console.WriteLine("Araç Listesi:");
                foreach (Araç araç in kişiler[i].Arabalar)
                {
                    Console.WriteLine($"Araç Şasi Numarası: {GizliBilgi(araç.ŞasiNo)}");
                    Console.WriteLine($"Marka: {araç.Marka}");
                    Console.WriteLine($"Model Yılı: {araç.ModelYılı}");
                    Console.WriteLine($"Edinme Tarihi: {araç.EdinmeTarihi.ToShortDateString()}");
                    Console.WriteLine($"Önceki Sahibin Adı: {ÖncekiSahibinAdi(araç.SahipNumarası, kişiler)}");

                }
                Console.WriteLine("---------");
            }

            Console.Write("Bir tuşa basın...");
            Console.ReadKey();
        }

        static Kişi KişiBilgisiEkle()
        {
            Console.Write("Adınızı girin: ");
            string ad = Console.ReadLine();

            Console.Write("Soyadınızı girin: ");
            string soyad = Console.ReadLine();

            Console.Write("Doğum yılınızı girin: ");
            int doğumYılı = int.Parse(Console.ReadLine());

            Console.Write("TC Kimlik Numaranızı girin: ");
            string tcKimlikNo = Console.ReadLine();

            List<Araç> araçlar = new List<Araç>();

            for (int i = 0; i < 4; i++)
            {
                Console.WriteLine($"Araç {i + 1} bilgilerini girin:");
                Araç araç = AraçBilgisiEkle();
                araç.SahipNumarası = i + 1;
                araçlar.Add(araç);
            }

            Kişi kişi = new Kişi(ad, soyad, doğumYılı, tcKimlikNo, araçlar);
            return kişi;
        }

        static Araç AraçBilgisiEkle()
        {
            Console.Write("Araç Şasi Numarası girin: ");
            string şasiNo = Console.ReadLine();

            Console.Write("Araç Model Yılı girin: ");
            int modelYılı = int.Parse(Console.ReadLine());

            Console.Write("Araç Marka girin: ");
            string marka = Console.ReadLine();

            Console.Write("Araç Edinme Tarihi (YYYY-MM-DD) girin: ");
            DateTime edinmeTarihi = DateTime.Parse(Console.ReadLine());

            Console.Write("Araç Edinme Fiyatı girin: ");
            decimal edinmeFiyatı = decimal.Parse(Console.ReadLine());

            Araç araç = new Araç(şasiNo, modelYılı, marka, edinmeTarihi, edinmeFiyatı);
            return araç;
        }

        static string GizliBilgi(string bilgi)
        {

            return new string('*', bilgi.Length);
        }

        static string ÖncekiSahibinAdi(int sahipNumarası, List<Kişi> kişiler)
        {

            int öncekiSahipNumarası = sahipNumarası - 2;
            if (öncekiSahipNumarası >= 0 && öncekiSahipNumarası < kişiler.Count)
            {
                return kişiler[öncekiSahipNumarası].Ad;
            }
            return "Bilinmiyor";
        }
    }

    class Kişi
    {
        public string Ad { get; private set; }
        public string Soyad { get; private set; }
        public int DoğumYılı { get; private set; }
        public string TCKimlikNo { get; private set; }
        public List<Araç> Arabalar { get; private set; }

        public Kişi(string ad, string soyad, int doğumYılı, string tcKimlikNo, List<Araç> arabalar)
        {
            Ad = ad;
            Soyad = soyad;
            DoğumYılı = doğumYılı;
            TCKimlikNo = tcKimlikNo;
            Arabalar = arabalar;
        }
    }
    class Araç
    {
        public string ŞasiNo { get; private set; }
        public int ModelYılı { get; private set; }
        public string Marka { get; private set; }
        public DateTime EdinmeTarihi { get; private set; }
        public decimal EdinmeFiyatı { get; private set; }
        public int SahipNumarası { get; set; }

        public Araç(string şasiNo, int modelYılı, string marka, DateTime edinmeTarihi, decimal edinmeFiyatı)
        {
            ŞasiNo = şasiNo;
            ModelYılı = modelYılı;
            Marka = marka;
            EdinmeTarihi = edinmeTarihi;
            EdinmeFiyatı = edinmeFiyatı;
        }
    }
}
