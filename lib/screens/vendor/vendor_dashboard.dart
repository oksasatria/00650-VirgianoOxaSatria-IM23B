import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class VendorDashboard extends StatefulWidget {
  const VendorDashboard({super.key});

  @override
  State<VendorDashboard> createState() => _VendorDashboardState();
}

class _VendorDashboardState extends State<VendorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Tugas Saya (Vendor)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context); // Kembali ke login
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Info Event ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.event, color: Colors.white, size: 40),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pernikahan Akbar & Rina',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '10 Oktober 2026 • Gedung Serbaguna',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Urutan Tugas Anda',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),

            // --- List Tugas ---
            // Tugas 1: Sudah Selesai (Di-approve Admin)
            _buildTaskCard(
              taskName: '1. Loading Barang & Material',
              status: 'Approved',
              isLocked: false,
              description: 'Membawa semua material dekorasi ke lokasi.',
            ),

            // Tugas 2: Aktif (Bisa dikerjakan dan dilaporkan)
            _buildTaskCard(
              taskName: '2. Pemasangan Rangka Panggung',
              status: 'In Progress',
              isLocked: false,
              description:
                  'Merakit besi rangka panggung utama sesuai blueprint.',
            ),

            // Tugas 3: Terkunci (Menunggu tugas 2 di-approve)
            _buildTaskCard(
              taskName: '3. Dekorasi Bunga & Lighting',
              status: 'Locked',
              isLocked: true,
              description: 'Memasang hiasan bunga dan lampu sorot di panggung.',
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget Card untuk List Tugas ---
  Widget _buildTaskCard({
    required String taskName,
    required String status,
    required bool isLocked,
    required String description,
  }) {
    Color statusColor;
    IconData statusIcon;

    if (status == 'Approved') {
      statusColor = successColor;
      statusIcon = Icons.check_circle;
    } else if (status == 'In Progress') {
      statusColor = accentColor;
      statusIcon = Icons.play_circle_fill;
    } else {
      statusColor = Colors.grey;
      statusIcon = Icons.lock;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isLocked ? Colors.grey.shade200 : Colors.white,
      elevation: isLocked ? 0 : 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    taskName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isLocked ? Colors.grey : primaryColor,
                    ),
                  ),
                ),
                Icon(statusIcon, color: statusColor),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: isLocked ? Colors.grey : Colors.black87,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),

            // Tombol Aksi (Hanya muncul jika tugas sedang "In Progress")
            if (status == 'In Progress')
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Nanti kita arahkan ke halaman Form Laporan
                    print('Buka form laporan untuk tugas ini');
                  },
                  icon: const Icon(Icons.camera_alt, size: 18),
                  label: const Text('Buat Laporan Selesai'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

            // Teks Status jika sudah selesai
            if (status == 'Approved')
              const Text(
                'Disetujui oleh Admin',
                style: TextStyle(
                  color: successColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
