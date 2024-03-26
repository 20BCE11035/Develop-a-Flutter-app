import 'package:flutter/material.dart';

void main() {
  runApp(EmployeeApp());
}

class Employee {
  final String name;
  final int yearsWithOrganization;
  final bool isActive;

  Employee({
    required this.name,
    required this.yearsWithOrganization,
    required this.isActive,
  });
}

class EmployeeApp extends StatelessWidget {
  final List<Employee> employees = [
    Employee(name: "John Doe", yearsWithOrganization: 3, isActive: true),
    Employee(name: "Jane Smith", yearsWithOrganization: 6, isActive: true),
    Employee(name: "Alice Johnson", yearsWithOrganization: 8, isActive: false),
    Employee(name: "Bob Brown", yearsWithOrganization: 4, isActive: true),
    // Add more employees as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Employee List'),
        ),
        body: ListView.builder(
          itemCount: employees.length,
          itemBuilder: (BuildContext context, int index) {
            final employee = employees[index];
            final isOver5YearsActive = employee.yearsWithOrganization > 5 && employee.isActive;
            return ListTile(
              title: Text(employee.name),
              subtitle: Text(
                'Years with organization: ${employee.yearsWithOrganization}\nActive: ${employee.isActive ? "Yes" : "No"}',
                style: TextStyle(
                  color: isOver5YearsActive ? Colors.green : null,
                ),
              ),
              trailing: isOver5YearsActive ? Icon(Icons.check, color: Colors.green) : null,
            );
          },
        ),
      ),
    );
  }
}
