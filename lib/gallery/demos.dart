// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../demo/all.dart';
import 'icons.dart';

class GalleryDemoCategory {
  const GalleryDemoCategory._({ this.name, this.icon });
  @required final String name;
  @required final IconData icon;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other))
      return true;
    if (runtimeType != other.runtimeType)
      return false;
    final GalleryDemoCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}

const GalleryDemoCategory _kMaterialComponents = GalleryDemoCategory._(
  name: 'Professor',
  icon: GalleryIcons.account_box,
);

const GalleryDemoCategory _kDisciplinas = GalleryDemoCategory._(
  name: 'Disciplinas',
  icon: GalleryIcons.cards,
);

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    @required this.buildRoute,
  }) : assert(title != null),
       assert(category != null),
       assert(routeName != null),
       assert(buildRoute != null);

  final String title;
  final IconData icon;
  final String subtitle;
  final GalleryDemoCategory category;
  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

List<GalleryDemo> _buildGalleryDemos() {
  final List<GalleryDemo> galleryDemos = <GalleryDemo>[

    // Material Components
    new GalleryDemo(
      title: 'Notas',
      subtitle: 'Consulta de Notas',
      icon: GalleryIcons.data_table,
      category: _kMaterialComponents,
      routeName: DataTableDemo.routeName,
      buildRoute: (BuildContext context) => new DataTableDemo(),
    ),
    new GalleryDemo(
      title: 'Professor',
      subtitle: 'Cadastro de Professores',
      icon: GalleryIcons.text_fields_alt,
      category: _kMaterialComponents,
      routeName: TextFormFieldDemo.routeName,
      buildRoute: (BuildContext context) => const TextFormFieldDemo(),
    ),

    new GalleryDemo(
      title: 'Disciplinas',
      subtitle: 'Consulta de Disciplinas',
      icon: GalleryIcons.bottom_navigation,
      category: _kDisciplinas,
      routeName: BottomNavigationDemo.routeName,
      buildRoute: (BuildContext context) => new BottomNavigationDemo(),
    ),

  ];
  return galleryDemos;
}

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

final Set<GalleryDemoCategory> kAllGalleryDemoCategories =
  kAllGalleryDemos.map<GalleryDemoCategory>((GalleryDemo demo) => demo.category).toSet();

final Map<GalleryDemoCategory, List<GalleryDemo>> kGalleryCategoryToDemos =
  new Map<GalleryDemoCategory, List<GalleryDemo>>.fromIterable(
    kAllGalleryDemoCategories,
    value: (dynamic category) {
      return kAllGalleryDemos.where((GalleryDemo demo) => demo.category == category).toList();
    },
  );
