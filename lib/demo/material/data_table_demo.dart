// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dessert {
  Dessert(this.name, this.bim1, this.bim2, this.bim3, this.bim4, this.status);
  final String name;
  final double bim1;
  final double bim2;
  final double bim3;
  final double bim4;
  final String status;

  bool selected = false;
}

class DessertDataSource extends DataTableSource {
  final List<Dessert> _desserts = <Dessert>[
    new Dessert('Adriele Cristina Lopes',               7.0,  6.0,  7.0,  4.0,  'Abandono'),
    new Dessert('Amanda Aparecida de Oliveira ',        7.8,  9.0,  7.0,  4.3,  'Remanejado'),
    new Dessert('Ariane Inari',                         6.0, 10.0,  7.0,  6.0,  ''),
    new Dessert('Aryel Olmedo de olivira',              6.0,  3.7,  7.0,  4.3,  ''),
    new Dessert('Damaris Cassiano dos Santos',          8.0, 10.0,  7.0,  3.9,  ''),
    new Dessert('Edson Antonio Gonçalves Ferreira',     6.0,  0.0,  7.0,  0.0,  ''),
    new Dessert('Evandor Augusto Soares Amaro',         6.0,  0.2,  7.0,  0.0,  ''),
    new Dessert('Flavia Fernanda Alevato',              6.0,  3.2,  7.0,  6.5,  'Transferido'),
    new Dessert('Gabriel Fernandes dos Santos',         9.0,  8.0,  7.0,  4.9,  ''),
    new Dessert('Jhonathan Rafael dos Santos',          6.0,  6.0,  7.0,  7.0,  ''),

    new Dessert('Amanda Cristina Castro',               6.0,  6.0,  7.0,  4.0,  ''),
    new Dessert('Carlos Cristina Ramos',                6.0,  9.0,  7.0,  4.3,  ''),
    new Dessert('Eduardo Almeida Lopes',                6.0,  6.0,  7.0,  6.0,  ''),
    new Dessert('Denilson Silva Lopes',                 6.0,  3.7,  7.0,  4.3,  ''),
    new Dessert('Denis Cristina Lopes',                 6.0,  1.0,  7.0,  3.9,  ''),
    new Dessert('Saulo Silva Lopes',                    6.0,  0.0,  7.0,  0.0,  ''),
    new Dessert('Vitória Cristina Santos',              6.0,  0.2,  7.0,  0.0,  ''),
    new Dessert('Roberto Cristina Matos',               6.0,  3.2,  7.0,  6.5,  ''),
    new Dessert('Flavio Matos Lopes',                   6.0,  5.0,  7.0,  4.9,  ''),
    new Dessert('Roberta Lopes',                        6.0,  6.0,  7.0,  7.0,  ''),

    new Dessert('Frozen yogurt with honey',             6.0,  6.0,  7.0,  4.0,  'Remanejado'),
    new Dessert('Ice cream sandwich with honey',        6.0,  9.0,  7.0,  4.3,  ''),
    new Dessert('Eclair with honey',                    6.0,  6.0,  7.0,  6.0,  ''),
    new Dessert('Cupcake with honey',                   6.0,  3.7,  7.0,  4.3,  ''),
    new Dessert('Gingerbread with honey',               6.0,  6.0,  7.0,  3.9,  ''),
    new Dessert('Jelly bean with honey',                6.0,  0.0,  7.0,  0.0,  ''),
    new Dessert('Lollipop with honey',                  6.0,  0.2,  7.0,  0.0,  ''),
    new Dessert('Honeycomb with honey',                 6.0,  3.2,  7.0,  6.5,  ''),
    new Dessert('Donut with honey',                     6.0,  5.0,  7.0,  4.9,  ''),
    new Dessert('KitKat with honey',                    6.0,  6.0,  7.0,  7.0,  ''),

    new Dessert('Frozen yogurt with milk',              6.0,  8.4,  7.0,  2.0,  'Abandono'),
    new Dessert('Ice cream sandwich with milk',         6.0, 10.4,  7.0,  2.3,  'Transferido'),
    new Dessert('Eclair with milk',                     6.0,  8.4,  7.0,  4.0,  ''),
    new Dessert('Cupcake with milk',                    6.0,  6.1,  7.0,  2.3,  ''),
    new Dessert('Gingerbread with milk',                6.0,  8.4,  7.0,  1.9,  ''),
    new Dessert('Jelly bean with milk',                 6.0,  2.4,  7.0,  8.0,  ''),
    new Dessert('Lollipop with milk',                   6.0,  2.6,  7.0,  8.0,  ''),
    new Dessert('Honeycomb with milk',                  10.0,  5.6,  7.0,  4.5,  ''),
    new Dessert('Donut with milk',                      9.0,  7.4,  7.0,  2.9,  ''),
    new Dessert('KitKat with milk',                     8.0,  8.4,  7.0,  5.0,  ''),

  ];

  void _sort<T>(Comparable<T> getField(Dessert d), bool ascending) {
    _desserts.sort((Dessert a, Dessert b) {
      if (!ascending) {
        final Dessert c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length)
      return null;
    final Dessert dessert = _desserts[index];
    return new DataRow.byIndex(
      index: index,
      selected: dessert.selected,
      onSelectChanged: (bool value) {
        if (dessert.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          dessert.selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        new DataCell(new Text('${dessert.name}')),
        new DataCell(new Text('${dessert.bim1}')),
        new DataCell(new Text('${dessert.bim2.toStringAsFixed(1)}')),
        new DataCell(new Text('${dessert.bim3}')),
        new DataCell(new Text('${dessert.bim4.toStringAsFixed(1)}')),
        new DataCell(new Text('${dessert.status}')),
      ]
    );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (Dessert dessert in _desserts)
      dessert.selected = checked;
    _selectedCount = checked ? _desserts.length : 0;
    notifyListeners();
  }
}

class DataTableDemo extends StatefulWidget {
  static const String routeName = '/material/data-table';

  @override
  _DataTableDemoState createState() => new _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;
  final DessertDataSource _dessertsDataSource = new DessertDataSource();

  void _sort<T>(Comparable<T> getField(Dessert d), int columnIndex, bool ascending) {
    _dessertsDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('Notas')),
      body: new ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          new PaginatedDataTable(
            header: const Text('Boletim Aluno'),
            rowsPerPage: _rowsPerPage,
            onRowsPerPageChanged: (int value) { setState(() { _rowsPerPage = value; }); },
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            onSelectAll: _dessertsDataSource._selectAll,
            columns: <DataColumn>[
              new DataColumn(
                label: const Text('Aluno'),
                onSort: (int columnIndex, bool ascending) => _sort<String>((Dessert d) => d.name, columnIndex, ascending)
              ),
              new DataColumn(
                label: const Text('1° Bimestre'),
                tooltip: 'Notas 1° Bimestre',
                numeric: true,
                onSort: (int columnIndex, bool ascending) => _sort<num>((Dessert d) => d.bim1, columnIndex, ascending)
              ),
              new DataColumn(
                label: const Text('2° Bimestre'),
                numeric: true,
                onSort: (int columnIndex, bool ascending) => _sort<num>((Dessert d) => d.bim2, columnIndex, ascending)
              ),
              new DataColumn(
                label: const Text('3° Bimestre'),
                numeric: true,
                onSort: (int columnIndex, bool ascending) => _sort<num>((Dessert d) => d.bim3, columnIndex, ascending)
              ),
              new DataColumn(
                label: const Text('4° Bimestre'),
                numeric: true,
                onSort: (int columnIndex, bool ascending) => _sort<num>((Dessert d) => d.bim4, columnIndex, ascending)
              ),
              new DataColumn(
                label: const Text('Status'),
                numeric: true,
                onSort: (int columnIndex, bool ascending) => _sort<String>((Dessert d) => d.status, columnIndex, ascending)
              ),

            ],
            source: _dessertsDataSource
          )
        ]
      )
    );
  }
}
