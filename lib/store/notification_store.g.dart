// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationStore on NotificationStoreBase, Store {
  final _$hasPermissionAtom = Atom(name: 'NotificationStoreBase.hasPermission');

  @override
  bool get hasPermission {
    _$hasPermissionAtom.reportRead();
    return super.hasPermission;
  }

  @override
  set hasPermission(bool value) {
    _$hasPermissionAtom.reportWrite(value, super.hasPermission, () {
      super.hasPermission = value;
    });
  }

  final _$NotificationStoreBaseActionController =
      ActionController(name: 'NotificationStoreBase');

  @override
  void init() {
    final _$actionInfo = _$NotificationStoreBaseActionController.startAction(
        name: 'NotificationStoreBase.init');
    try {
      return super.init();
    } finally {
      _$NotificationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasPermission: ${hasPermission}
    ''';
  }
}
