import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/utils/app_theme.dart';
import 'package:portfolio_app/widgets/project_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  List<Project> _filteredProjects = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _filteredProjects = projectsList;
    
    _searchController.addListener(() {
      _filterProjects();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterProjects() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredProjects = projectsList;
      } else {
        _filteredProjects = projectsList
            .where((project) => 
                project.title.toLowerCase().contains(query) ||
                project.category.toLowerCase().contains(query) ||
                project.author.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: AppTheme.primaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_outlined, color: AppTheme.primaryColor),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Project'),
            Tab(text: 'Saved'),
            Tab(text: 'Shared'),
            Tab(text: 'Achievement'),
          ],
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          indicatorColor: AppTheme.primaryColor,
          indicatorWeight: 3.h,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: Colors.grey[600],
          dividerColor: Colors.transparent,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildProjectTab(),
          _buildEmptyTab('Saved'),
          _buildEmptyTab('Shared'),
          _buildEmptyTab('Achievement'),
        ],
      ),
    );
  }

  Widget _buildProjectTab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search a project',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                suffixIcon: Container(
                  margin: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 20.r),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: _filteredProjects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: _filteredProjects[index]);
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 24,
               child: Align(
                 alignment: Alignment.center,
                child: FloatingActionButton.extended(
                  backgroundColor: AppTheme.primaryColor,
                  onPressed: () {},
                  icon: Icon(Icons.filter_list, color: Colors.white),
                  label: Text(
                    'Filter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
               ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyTab(String title) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('$title Tab Content'),
      ),
    );
  }
}