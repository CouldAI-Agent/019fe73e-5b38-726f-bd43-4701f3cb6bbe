import 'package:flutter/material.dart';

void main() {
  runApp(const WokAndMoreApp());
}

class WokAndMoreApp extends StatelessWidget {
  const WokAndMoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wok & More Script',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepOrange,
          secondary: Colors.amber,
          surface: Color(0xFF1E1E1E),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ScriptScreen(),
      },
    );
  }
}

class ScriptScreen extends StatelessWidget {
  const ScriptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WOK & MORE 🔥'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: scriptSegments.length,
                  itemBuilder: (context, index) {
                    final segment = scriptSegments[index];
                    return _buildScriptCard(segment, index);
                  },
                ),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3E1204), Color(0xFF121212)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: const [
          Text(
            '20-Second Video Script',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '🎬 Street Cooking Promotional Ad',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF1E1E1E),
      child: Row(
        children: const [
          Icon(Icons.music_note, color: Colors.amber),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Background: Fast street vibe music + sizzling sound effects 🎵',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScriptCard(ScriptSegment segment, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.deepOrange.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: BorderSide(color: Colors.deepOrange.withOpacity(0.5)),
              ),
              child: Text(
                segment.time,
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Visuals
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.videocam_outlined, color: Colors.grey, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'VISUAL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        segment.visual,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(color: Colors.white12),
            ),
            
            // Voiceover
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.mic_none_outlined, color: Colors.amber, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'VOICEOVER',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.amber,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '“${segment.voiceover}”',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScriptSegment {
  final String time;
  final String visual;
  final String voiceover;

  const ScriptSegment({
    required this.time,
    required this.visual,
    required this.voiceover,
  });
}

const List<ScriptSegment> scriptSegments = [
  ScriptSegment(
    time: '0–3 sec',
    visual: 'Busy street, smoke, crowd, flames rising from wok',
    voiceover: 'Hungry? Stop right here!',
  ),
  ScriptSegment(
    time: '3–7 sec',
    visual: 'Chef tossing chowmein in a hot wok, fire flare 🔥',
    voiceover: 'Fresh chowmein, cooked live… fast, hot, and full of flavor!',
  ),
  ScriptSegment(
    time: '7–11 sec',
    visual: 'Close-up of noodles mixing with veggies & sauce',
    voiceover: 'Every bite packed with taste—street style, wok magic!',
  ),
  ScriptSegment(
    time: '11–15 sec',
    visual: 'Customers waiting, smiling, food being served',
    voiceover: 'Crowded? That means it’s worth it!',
  ),
  ScriptSegment(
    time: '15–20 sec',
    visual: 'Final plate served, logo "WOK & MORE"',
    voiceover: 'Wok & More—where flavor meets fire. Try it now!',
  ),
];
