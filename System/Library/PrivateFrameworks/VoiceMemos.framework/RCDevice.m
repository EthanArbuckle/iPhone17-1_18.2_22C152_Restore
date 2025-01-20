@interface RCDevice
+ (double)audioInputWaveformFlushInterval;
+ (unint64_t)timeDisplayUpdateFrameInterval;
@end

@implementation RCDevice

+ (double)audioInputWaveformFlushInterval
{
  return 0.0666666667;
}

+ (unint64_t)timeDisplayUpdateFrameInterval
{
  if (_isSlowDevice_onceToken != -1) {
    dispatch_once(&_isSlowDevice_onceToken, &__block_literal_global_15);
  }
  return 0;
}

@end