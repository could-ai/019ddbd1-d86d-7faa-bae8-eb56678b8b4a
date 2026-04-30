import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const Y2KGenApp());
}

const String defaultPrompt = """🩷 สร้างภาพพสร้างภาพพอร์ตเทรตสมจริง (ใบหน้าเหมือน100% ห้ามแก้ไข) ภาพถ่ายสไตล์ยุค 2000 ต้น ๆ ของ หญิงสาวผมยาวมัดผมทรงดังโงะ หลวมๆ ติดกิ๊บหนีบดำ แดงชมพูระเรื่อ ใสชุดที่แนบมาสีฟ้า
ถ่ายด้วยกล้องดิจิทัลคุณภาพต่ำ สไตล์ยุค 2000
ใช้แฟลชตรงพร้อมเอฟเฟกต์ฟุ้งนุ่มนวล (soft diffused glow), แสงแฟลชกระจายฟุ้ง, ไฮไลท์โอเวอร์เล็กน้อย, เนื้อภาพมีเกรนเล็กน้อย
อารมณ์ภาพดิบ ๆ ธรรมชาติ บรรยากาศวินเทจดิจิทัล อัตราส่วน 4:3 ภาพนิ่งแบบภาพยนตร์ ภาพถ่ายแฟชั่นบรรณาธิการ 8K ผลงานชิ้นเอกภาพเหมือนหญิงสาวที่สมจริงสะท้อนบนหน้าจอคอมพิวเตอร์ นั่งอยู่บนเก้าอี้คอมพิวเตอร์ในห้องมืดๆ มือกำลังถ่ายเซลฟี่ด้วย iPhone ภาพที่เห็นบนหน้าจอคอมพิวเตอร์เท่านั้น ผมทรงเดิม มัดผมหลวมๆ แก้มสีชมพู รอยยิ้มหวานๆ ลิ้นสั่นไหว สีหน้าน่ารัก สวมแว่นตาและ เงาสะท้อนอ่อนๆ ใบหน้า โทนสีอบอุ่น เกรนเล็กน้อย สไตล์กล้องดิจิทัลยุค 2000 โทนสีพาสเทลและโทนสีอ่อนๆ""";

class Y2KGenApp extends StatelessWidget {
  const Y2KGenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Y2K CamGen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Courier',
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF000080),
          surface: Color(0xFFC0C0C0),
        ),
        scaffoldBackgroundColor: const Color(0xFF008080),
      ),
      home: const DesktopScreen(),
    );
  }
}

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final TextEditingController _promptController =
      TextEditingController(text: defaultPrompt);
  bool _isGenerating = false;
  bool _hasGenerated = false;
  double _progress = 0.0;
  Timer? _timer;

  @override
  void dispose() {
    _promptController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _generateImage() {
    if (_isGenerating) return;

    setState(() {
      _isGenerating = true;
      _hasGenerated = false;
      _progress = 0.0;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.02;
        if (_progress >= 1.0) {
          _progress = 1.0;
          _isGenerating = false;
          _hasGenerated = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Desktop Icons
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              children: [
                Icon(Icons.computer, size: 48, color: Colors.white),
                const SizedBox(height: 4),
                const Text('My Computer', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 20),
                Icon(Icons.folder, size: 48, color: Colors.white),
                const SizedBox(height: 4),
                const Text('Y2K_Pics', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          
          // Main Application Window
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFC0C0C0),
                  border: Border(
                    top: const BorderSide(color: Colors.white, width: 2),
                    left: const BorderSide(color: Colors.white, width: 2),
                    right: const BorderSide(color: Color(0xFF808080), width: 2),
                    bottom: const BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF000080), Color(0xFF1084D0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                          const SizedBox(width: 8),
                          const Text(
                            'Y2K DigiCam Gen v1.0',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          _buildWindowButton(Icons.minimize),
                          const SizedBox(width: 2),
                          _buildWindowButton(Icons.check_box_outline_blank),
                          const SizedBox(width: 2),
                          _buildWindowButton(Icons.close),
                        ],
                      ),
                    ),
                    
                    // Menu Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          _buildMenuItem('File'),
                          _buildMenuItem('Edit'),
                          _buildMenuItem('View'),
                          _buildMenuItem('Help'),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFF808080)),
                    const Divider(height: 1, color: Colors.white),

                    // App Content
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Panel (Input)
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Prompt:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                _buildNeotextField(),
                                const SizedBox(height: 16),
                                _buildGenerateButton(),
                                const SizedBox(height: 16),
                                if (_isGenerating)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Rendering...'),
                                      const SizedBox(height: 4),
                                      _buildProgressBar(),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Right Panel (Output)
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Output Viewfinder:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                _buildOutputArea(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWindowButton(IconData icon) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFFC0C0C0),
        border: Border(
          top: const BorderSide(color: Colors.white),
          left: const BorderSide(color: Colors.white),
          right: const BorderSide(color: Color(0xFF808080)),
          bottom: const BorderSide(color: Color(0xFF808080)),
        ),
      ),
      child: Icon(icon, size: 14, color: Colors.black),
    );
  }

  Widget _buildMenuItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildNeotextField() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: const BorderSide(color: Color(0xFF808080), width: 2),
          left: const BorderSide(color: Color(0xFF808080), width: 2),
          right: const BorderSide(color: Colors.white, width: 2),
          bottom: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: TextField(
        controller: _promptController,
        maxLines: null,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8),
        ),
      ),
    );
  }

  Widget _buildGenerateButton() {
    return GestureDetector(
      onTap: _generateImage,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFC0C0C0),
          border: Border(
            top: const BorderSide(color: Colors.white, width: 2),
            left: const BorderSide(color: Colors.white, width: 2),
            right: const BorderSide(color: Color(0xFF808080), width: 2),
            bottom: const BorderSide(color: Color(0xFF808080), width: 2),
          ),
        ),
        child: const Center(
          child: Text(
            'GENERATE.EXE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: const BorderSide(color: Color(0xFF808080), width: 2),
          left: const BorderSide(color: Color(0xFF808080), width: 2),
          right: const BorderSide(color: Colors.white, width: 2),
          bottom: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: _progress,
        child: Container(
          color: const Color(0xFF000080),
        ),
      ),
    );
  }

  Widget _buildOutputArea() {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: const BorderSide(color: Color(0xFF808080), width: 2),
          left: const BorderSide(color: Color(0xFF808080), width: 2),
          right: const BorderSide(color: Colors.white, width: 2),
          bottom: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: _buildOutputContent(),
    );
  }

  Widget _buildOutputContent() {
    if (_isGenerating) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hourglass_empty, color: Colors.white, size: 32),
            const SizedBox(height: 16),
            Text(
              'Processing image...\n${(_progress * 100).toInt()}%',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontFamily: 'Courier'),
            ),
          ],
        ),
      );
    } else if (_hasGenerated) {
      // Y2K style processed image
      return Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            // Apply a warm, slightly washed out vintage filter
            colorFilter: const ColorFilter.matrix([
              1.2, 0.0, 0.0, 0.0, 20.0, // R
              0.0, 1.0, 0.0, 0.0, 10.0, // G
              0.0, 0.0, 0.8, 0.0, 0.0,  // B
              0.0, 0.0, 0.0, 1.0, 0.0,  // A
            ]),
            child: Image.network(
              // Placeholder portrait image that loosely fits the vibe
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(child: CircularProgressIndicator(color: Colors.green));
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'IMAGE_NOT_FOUND',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),
          // Vintage digicam overlay
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              'REC •\n${DateTime.now().year - 24}-04-30', // Simulating 2002
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)],
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              'HQ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)],
              ),
            ),
          ),
          // Subtle noise overlay
          IgnorePointer(
            child: Opacity(
              opacity: 0.15,
              child: Image.network(
                'https://www.transparenttextures.com/patterns/stardust.png',
                repeat: ImageRepeat.repeat,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: Text(
          'READY.\n\nAwaiting prompt input...',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontFamily: 'Courier'),
        ),
      );
    }
  }
}
