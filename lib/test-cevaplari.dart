import 'soru.dart';

class TestVeri
{
  int _soruIndexi = 0;

  final List <Soru> _soruBankasi = [
    Soru(soruMetni: "❓ Yazıcı, bilgisayardaki bir çıkış birimidir.", soruYaniti: true),
    Soru(soruMetni: "❓ PDF, taşınabilir belge biçimidir.", soruYaniti: true),
    Soru(soruMetni: "❓ '.xlsx' varsayılan text dosya formatıdır.", soruYaniti: false),
    Soru(soruMetni: "❓ 1 GigaByte(GB), 2048 KiloByte(KB) etmektedir.", soruYaniti: false),
    Soru(soruMetni: "❓ Farklı konumdaki birden çok dosyanın seçilmesi için fare ile birlikte 'ALT' tuşu kullanılır.", soruYaniti: false),
    Soru(soruMetni: "❓ Bellek, işlemci tarafından gerçekleştirilmesi beklenen talimatları, bu talimatlar tarafından gerek duyulan veriyi ve veri işleme sonuçlarını saklayan elektronik bileşenlerden oluşur.", soruYaniti: true),
    Soru(soruMetni: "❓ 'ALT + DELETE' tuş kombinasyonu bir dosyayı kalıcı olarak silmeye yarar.", soruYaniti: false)
  ];

  String getSoruMetni() // bu artık bir fonksiyon yani bir metot
  {
    return _soruBankasi[_soruIndexi].soruMetni;
  }

  bool getSoruYaniti()
  {
    return _soruBankasi[_soruIndexi].soruYaniti;
  }

  void sonrakiSoru()
  {
    if (_soruIndexi < _soruBankasi.length - 1)
    {
      _soruIndexi++;
    }
  }

  bool testBittiMi()
  {
    if (_soruIndexi >= _soruBankasi.length - 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void indexSifirla()
  {
    _soruIndexi = 0;
  }
}