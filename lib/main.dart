import 'package:flutter/material.dart';

void main() => runApp(AmmarApp());

class AmmarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'عَمّار',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: SplashScreen(),
    );
  }
}

// 1 - البداية
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('عَمّار', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 60, fontWeight: FontWeight.bold)),
            Text('AMMAR', style: TextStyle(color: Color(0xFFD4AF37), letterSpacing: 5)),
            SizedBox(height: 30),
            Text('السلام عليكم ورحمة الله وبركاته،\nأهلاً بك في تطبيق عَمّار', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 16)),
            SizedBox(height: 30),
            TextField(decoration: InputDecoration(hintText: 'اكتب اسمك هنا', hintStyle: TextStyle(color: Colors.white54), filled: true, fillColor: Color(0xFF1A1A1A), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), prefixIcon: Icon(Icons.person, color: Color(0xFFD4AF37)))),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2E7D32), minimumSize: Size(double.infinity, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())),
              child: Text('ابدأ رحلتك مع عَمّار', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ]),
        ),
      ),
    );
  }
}

// 2 - الرئيسية
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        SizedBox(height: 60),
        Text('عَمّار', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 45, fontWeight: FontWeight.bold)),
        Text('AMMAR', style: TextStyle(color: Color(0xFFD4AF37), letterSpacing: 6, fontSize: 12)),
        SizedBox(height: 20),
        Text('السلام عليكم\nأهلاً بك، حان وقت الذكر', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 20),
        Expanded(child: GridView.count(crossAxisCount: 2, padding: EdgeInsets.all(16), crossAxisSpacing: 12, mainAxisSpacing: 12, children: [
          _card(context, 'صلاتي', 'أوقات الصلاة', Icons.mosque, SalatyScreen()),
          _card(context, 'دعائي', 'أذكار الصباح والمساء', Icons.front_hand, AzkariScreen()),
          _card(context, 'وردي', 'الورد اليومي', Icons.menu_book, WirdiScreen()),
          _card(context, 'تسابيحي', 'عداد التسبيح', Icons.circle, TasabihScreen()),
          _card(context, 'أسماء الله', 'الـ 99 اسم', Icons.favorite, AsmaAllahScreen()),
        ])),
      ]),
      bottomNavigationBar: _bottomNav(context, 0),
    );
  }
  Widget _card(BuildContext ctx, String t, String d, IconData icon, Widget go) {
    return GestureDetector(onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => go)),
      child: Container(decoration: BoxDecoration(color: Color(0xFF1A1A1A), border: Border.all(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: Color(0xFFD4AF37), size: 36),
          SizedBox(height: 10),
          Text(t, style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 4),
          Text(d, style: TextStyle(color: Colors.white70, fontSize: 11), textAlign: TextAlign.center),
        ])));
  }
}

// 3 - صلاتي
class SalatyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('صلاتي', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 28, fontWeight: FontWeight.bold)), centerTitle: true, leading: BackButton(color: Color(0xFFD4AF37))),
      body: SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(children: [
        Text('١٤ جمادى الأولى ١٤٤٦ هـ', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 12)),
        SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.location_on, color: Color(0xFFD4AF37), size: 16), Text(' مكة المكرمة', style: TextStyle(color: Colors.white70, fontSize: 13))]),
        SizedBox(height: 25),
        Container(padding: EdgeInsets.all(25), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xFFD4AF37), width: 2)), child: Column(children: [Text('القبلة', style: TextStyle(color: Colors.white)), SizedBox(height: 5), Icon(Icons.explore, color: Color(0xFFD4AF37), size: 30), Text('127°', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold))])),
        SizedBox(height: 25),
        Align(alignment: Alignment.centerRight, child: Text('مواقيت الصلاة', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
        SizedBox(height: 10),
        _prayerRow('الفجر', '05:12', false),
        _prayerRow('الظهر', '12:05', false),
        _prayerRow('العصر • القادمة', '15:32', true),
        _prayerRow('المغرب', '17:55', false),
        _prayerRow('العشاء', '19:20', false),
      ])),
      bottomNavigationBar: _bottomNav(context, 0),
    );
  }
  Widget _prayerRow(String name, String time, bool active) {
    return Container(margin: EdgeInsets.only(top: 8), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: active ? Color(0xFF1A1A1A) : Colors.transparent, border: Border.all(color: active ? Color(0xFFD4AF37) : Colors.white24), borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(name, style: TextStyle(color: active ? Color(0xFFD4AF37) : Colors.white, fontWeight: active ? FontWeight.bold : FontWeight.normal)), Text(time, style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold))]));
  }
}

// 4 - أذكاري
class AzkariScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text('أذكاري', style: TextStyle(color: Color(0xFFD4AF37))), centerTitle: true, leading: BackButton(color: Color(0xFFD4AF37))),
      body: ListView(padding: EdgeInsets.all(16), children: [
        _azkarCard('أذكار الصباح', '33 ذكراً', '33/33', 'مكتمل'),
        _azkarCard('أذكار المساء', '33 ذكراً', '18/33', 'قيد التقدم'),
        _azkarCard('أذكار النوم', '11 ذكراً', '0/11', 'لم يبدأ'),
        _azkarCard('أدعية الأنبياء', 'من القرآن', '5/20', 'قيد التقدم'),
      ]), bottomNavigationBar: _bottomNav(context, 1));
  }
  Widget _azkarCard(String t, String d, String num, String status) {
    return Container(margin: EdgeInsets.only(bottom: 12), padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFF111111), border: Border.all(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(12)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 16, fontWeight: FontWeight.bold)), Text(d, style: TextStyle(color: Colors.white70, fontSize: 12))]), Column(children: [Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xFFD4AF37))), child: Text(num, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 12))), SizedBox(height: 4), Text(status, style: TextStyle(color: Colors.white54, fontSize: 10))])]));
  }
}

// 5 - تسابيحي
class TasabihScreen extends StatefulWidget { @override _TasabihScreenState createState() => _TasabihScreenState(); }
class _TasabihScreenState extends State<TasabihScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text('تسابيحي', style: TextStyle(color: Color(0xFFD4AF37))), centerTitle: true, leading: BackButton(color: Color(0xFFD4AF37))),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(width: 200, height: 200, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xFFD4AF37), width: 3)), child: Center(child: Text('$count', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 70, fontWeight: FontWeight.bold)))),
        SizedBox(height: 30),
        _tasbihBtn('سبحان الله'),
        _tasbihBtn('الحمد لله'),
        _tasbihBtn('الله أكبر'),
        SizedBox(height: 20),
        TextButton(onPressed: () => setState(() => count = 0), child: Text('إعادة', style: TextStyle(color: Colors.white54))),
      ]), bottomNavigationBar: _bottomNav(context, 2));
  }
  Widget _tasbihBtn(String txt) {
    return GestureDetector(onTap: () => setState(() => count++), child: Container(margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8), padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(30)), child: Center(child: Text(txt, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18)))));
  }
}

// 6 - وردي
class WirdiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text('وِردي', style: TextStyle(color: Color(0xFFD4AF37))), centerTitle: true, leading: BackButton(color: Color(0xFFD4AF37))),
      body: ListView(padding: EdgeInsets.all(16), children: [
        Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(10)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('سورة البقرة - 62%', style: TextStyle(color: Colors.white)), SizedBox(height: 8), LinearProgressIndicator(value: 0.62, color: Color(0xFFD4AF37), backgroundColor: Colors.white24), SizedBox(height: 8), Text('متبقي 27 صفحة', style: TextStyle(color: Colors.white54, fontSize: 12))])),
      ]), bottomNavigationBar: _bottomNav(context, 3));
  }
}

// 7 - أسماء الله الحسنى
class AsmaAllahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text('أسماء الله الحسنى', style: TextStyle(color: Color(0xFFD4AF37))), centerTitle: true, leading: BackButton(color: Color(0xFFD4AF37))),
      body: ListView(padding: EdgeInsets.all(16), children: [
        _nameCard('الرَّحْمَنُ'),
        _nameCard('الرَّحِيمُ'),
        _nameCard('المَلِكُ'),
        _nameCard('القُدُّوسُ'),
        _nameCard('السَّلَامُ'),
      ]), bottomNavigationBar: _bottomNav(context, 3));
  }
  Widget _nameCard(String ar) {
    return Container(margin: EdgeInsets.only(bottom: 10), padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(12)), child: Center(child: Text(ar, style: TextStyle(color: Color(0xFFD4AF37), fontSize: 28))));
  }
}

Widget _bottomNav(BuildContext context, int active) {
  return Container(padding: EdgeInsets.symmetric(vertical: 10), decoration: BoxDecoration(color: Color(0xFF111111), border: Border(top: BorderSide(color: Color(0xFFD4AF37)))),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _navItem(Icons.home, 'الرئيسية', active == 0),
      _navItem(Icons.mosque, 'صلاتي', active == 1),
      _navItem(Icons.circle, 'تسابيحي', active == 2),
      _navItem(Icons.menu_book, 'وردي', active == 3),
    ]));
}
Widget _navItem(IconData icon, String label, bool active) {
  return Column(children: [Icon(icon, color: active ? Color(0xFFD4AF37) : Colors.white54, size: 22), SizedBox(height: 2), Text(label, style: TextStyle(color: active ? Color(0xFFD4AF37) : Colors.white54, fontSize: 10))]);
}
