// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dyno.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DynoImpl _$$DynoImplFromJson(Map<String, dynamic> json) => _$DynoImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      workingDirectory: json['workingDirectory'] as String,
      exec: json['exec'] as String,
    );

Map<String, dynamic> _$$DynoImplToJson(_$DynoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'workingDirectory': instance.workingDirectory,
      'exec': instance.exec,
    };
