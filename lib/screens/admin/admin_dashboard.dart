import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Dashboard EO (Admin)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Kembali ke halaman login
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ringkasan Event',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),

            // --- 1. Kartu Statistik ---
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    'Total\nVendor',
                    '8',
                    Icons.group,
                    accentColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    'Menunggu\nPersetujuan',
                    '3',
                    Icons.pending_actions,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    'Tugas\nSelesai',
                    '12',
                    Icons.check_circle,
                    successColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // --- 2. Daftar Laporan Menunggu Persetujuan ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Perlu Persetujuan Anda',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Nanti diarahkan ke halaman Approval Center penuh
                  },
                  child: const Text('Lihat Semua'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Simulasi List Laporan (Mock Data)
            _buildApprovalListItem(
              'Vendor Dekorasi',
              'Pemasangan Panggung Utama',
              '10 Okt 2026, 14:00',
            ),
            _buildApprovalListItem(
              'Vendor Sound System',
              'Instalasi Speaker Gantung',
              '10 Okt 2026, 15:30',
            ),
            _buildApprovalListItem(
              'Vendor Lighting',
              'Pengecekan Lampu Sorot',
              '10 Okt 2026, 16:00',
            ),
          ],
        ),
      ),
    );
  }

  // --- Fungsi Bantuan untuk Membuat Kartu Statistik (Reusable Widget) ---
  Widget _buildSummaryCard(
    String title,
    String count,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            count,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  // --- Fungsi Bantuan untuk Membuat List Item Persetujuan ---
  Widget _buildApprovalListItem(
    String vendorName,
    String taskName,
    String time,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.orange.withOpacity(0.2),
          child: const Icon(Icons.assignment, color: Colors.orange),
        ),
        title: Text(
          taskName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              vendorName,
              style: TextStyle(color: accentColor, fontWeight: FontWeight.w500),
            ),
            Text(time, style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          // Aksi ketika diklik (Buka detail laporan / gambar)
        },
      ),
    );
  }
}
