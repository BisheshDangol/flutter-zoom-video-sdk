import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkShareStatisticInfoPlatform
    extends PlatformInterface {
  ZoomVideoSdkShareStatisticInfoPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkShareStatisticInfoPlatform _instance =
      ZoomVideoSdkShareStatisticInfo("0");
  static ZoomVideoSdkShareStatisticInfoPlatform get instance => _instance;
  static set instance(ZoomVideoSdkShareStatisticInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<num> getBpf() async {
    throw UnimplementedError('getBpf() has not been implemented.');
  }

  Future<num> getFps() async {
    throw UnimplementedError('getFps() has not been implemented.');
  }

  Future<num> getHeight() async {
    throw UnimplementedError('getHeight() has not been implemented.');
  }

  Future<num> getWidth() async {
    throw UnimplementedError('getWidth() has not been implemented.');
  }
}

/// Zoom Video SDK Share Statistic Information
class ZoomVideoSdkShareStatisticInfo
    extends ZoomVideoSdkShareStatisticInfoPlatform {
  final String userId;

  ZoomVideoSdkShareStatisticInfo(this.userId);

  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  /// Get the video's bit rate.
  /// <br />Return the video's bit rate.
  @override
  Future<num> getBpf() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<num>('getUserShareBpf', params)
        .then<num>((num? value) => value ?? 0);
  }

  /// Get the video's Frames Per Second (FPS).
  /// <br />Return the video's Frames Per Second (FPS).
  @override
  Future<num> getFps() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<num>('getUserShareFps', params)
        .then<num>((num? value) => value ?? 0);
  }

  /// Get the video's frame height in pixels.
  /// <br />Return the video's frame height in pixels.
  @override
  Future<num> getHeight() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<num>('getUserShareHeight', params)
        .then<num>((num? value) => value ?? 0);
  }

  /// Get the video's frame height in pixels.
  /// <br />Return the video's frame height in pixels.
  @override
  Future<num> getWidth() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<num>('getUserShareWidth', params)
        .then<num>((num? value) => value ?? 0);
  }
}
