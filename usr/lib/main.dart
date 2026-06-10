import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GEDSI Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1), // Professional blue
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default but clean
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PresentationScreen(),
      },
    );
  }
}

class SlideData {
  final String title;
  final String? subtitle;
  final List<String> points;

  SlideData({
    required this.title,
    this.subtitle,
    this.points = const [],
  });
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<SlideData> _slides = [
    SlideData(
      title: 'स्थानीय तहमा लैङ्गिक समानता, अपाङ्गता र सामाजिक समावेशीकरण (GEDSI) परीक्षण',
      subtitle: 'नेपाल सरकारको दृष्टिकोण र औचित्य',
    ),
    SlideData(
      title: 'GEDSI परीक्षण के हो?',
      points: [
        'नीति, बजेट, र कार्यक्रमहरूमा लैङ्गिक र समावेशी दृष्टिकोणको मूल्याङ्कन।',
        'पछाडि पारिएका र सीमान्तकृत वर्गहरूको राज्यको स्रोतसाधनमा पहुँचको सुनिश्चितता।',
        'विकासका प्रतिफलहरू समान रूपमा वितरण भएको छ वा छैन भन्ने लेखाजोखा।',
      ],
    ),
    SlideData(
      title: 'नेपाल सरकारको दृष्टिकोण',
      points: [
        "'समृद्ध नेपाल, सुखी नेपाली' को राष्ट्रिय लक्ष्य प्राप्ति।",
        'नेपालको संविधानले सुनिश्चित गरेको समानता र समावेशी सिद्धान्तको प्रभावकारी कार्यान्वयन।',
        'राज्यका हरेक संरचना र तहमा लक्षित वर्गको समानुपातिक र अर्थपूर्ण प्रतिनिधित्व।',
      ],
    ),
    SlideData(
      title: 'स्थानीय तहमा GEDSI परीक्षण किन?',
      points: [
        'सेवा प्रवाहमा प्रभावकारिता र न्यायोचित वितरण सुनिश्चित गर्न।',
        'लक्षित वर्ग (महिला, बालबालिका, दलित, जनजाति, अपाङ्गता भएका व्यक्ति, ज्येष्ठ नागरिक) को बजेट र कार्यक्रममा पहुँच बढाउन।',
        'स्थानीय आवश्यकता, सवाल र समस्याहरूको यथार्थ सम्बोधन गर्न।',
      ],
    ),
    SlideData(
      title: 'सुशासन र पारदर्शिता प्रवर्द्धन',
      points: [
        'स्थानीय स्रोत र साधनको सही सदुपयोग तथा समतामूलक विनियोजन।',
        'स्थानीय सरकारको जवाफदेहिता र उत्तरदायित्वमा वृद्धि।',
        'योजना तर्जुमा र निर्णय प्रक्रियामा समुदायको अर्थपूर्ण सहभागिता प्रवर्द्धन।',
      ],
    ),
    SlideData(
      title: 'दीगो विकास लक्ष्य (SDGs) को प्राप्ति',
      points: [
        'गरिबी निवारण र असमानता न्यूनीकरण (लक्ष्य १, ५ र १० मा विशेष योगदान)।',
        'स्थानीयकरण मार्फत दीगो विकासका लक्ष्यहरू छिटो र प्रभावकारी रूपमा हासिल गर्न।',
        "'कोही पनि पछाडि नछुटून्' (Leave No One Behind) भन्ने विश्वव्यापी मान्यताको पालना।",
      ],
    ),
    SlideData(
      title: 'निष्कर्ष',
      points: [
        'GEDSI परीक्षण केवल कानुनी प्रक्रिया मात्र नभई सामाजिक न्याय र समतामूलक समाज निर्माणको बलियो आधार हो।',
        'यसले स्थानीय तहलाई बढी समावेशी, लोकतान्त्रिक, पारदर्शी र जनमुखी बनाउँछ।',
        'मूल मन्त्र: "सबैको सहभागिता, सबैको विकास।"',
      ],
    ),
  ];

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return SlideWidget(slide: _slides[index]);
                },
              ),
            ),
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: _currentPage > 0 ? _prevPage : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text('अघिल्लो'),
          ),
          Text(
            'स्लाइड ${_currentPage + 1} / ${_slides.length}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextButton.icon(
            onPressed: _currentPage < _slides.length - 1 ? _nextPage : null,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('अर्को'),
          ),
        ],
      ),
    );
  }
}

class SlideWidget extends StatelessWidget {
  final SlideData slide;

  const SlideWidget({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    final bool isTitleSlide = slide.points.isEmpty;

    return Container(
      padding: const EdgeInsets.all(32.0),
      color: isTitleSlide ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isTitleSlide ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                slide.title,
                textAlign: isTitleSlide ? TextAlign.center : TextAlign.left,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isTitleSlide
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.primary,
                      height: 1.3,
                    ),
              ),
              if (slide.subtitle != null) ...[
                const SizedBox(height: 24),
                Text(
                  slide.subtitle!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
                      ),
                ),
              ],
              if (slide.points.isNotEmpty) ...[
                const SizedBox(height: 48),
                ...slide.points.map((point) => Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 28,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              point,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    height: 1.5,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
