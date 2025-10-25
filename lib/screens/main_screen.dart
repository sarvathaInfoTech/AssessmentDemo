import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/home_screen.dart';
import 'package:portfolio_app/screens/input_screen.dart';
import 'package:portfolio_app/screens/portfolio_screen.dart';
import 'package:portfolio_app/screens/profile_screen.dart';
import 'package:portfolio_app/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1; // Default to Portfolio tab

  final List<Widget> _screens = [
    const HomeScreen(),
    const PortfolioScreen(),
    const InputScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24.r),
            activeIcon: Column(
              children: [
                Container(
                  width: 20.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(1.r),
                  ),
                ),
                SizedBox(height: 4.h),
                Icon(Icons.home_outlined, size: 24.r, color: AppTheme.primaryColor),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline_rounded, size: 24.r),
            activeIcon: Column(
              children: [
                Container(
                  width: 20.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(1.r),
                  ),
                ),
                SizedBox(height: 4.h),
                Icon(Icons.work_outline_rounded, size: 24.r, color: AppTheme.primaryColor),
              ],
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input, size: 24.r),
            activeIcon: Column(
              children: [
                Container(
                  width: 20.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(1.r),
                  ),
                ),
                SizedBox(height: 4.h),
                Icon(Icons.input, size: 24.r, color: AppTheme.primaryColor),
              ],
            ),
            label: 'Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24.r),
            activeIcon: Column(
              children: [
                Container(
                  width: 20.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(1.r),
                  ),
                ),
                SizedBox(height: 4.h),
                Icon(Icons.person_outline, size: 24.r, color: AppTheme.primaryColor),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}