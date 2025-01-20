@interface UIMotionEffectCoreMotionEventProvider
@end

@implementation UIMotionEffectCoreMotionEventProvider

uint64_t __62___UIMotionEffectCoreMotionEventProvider_stopGeneratingEvents__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setDeviceMotionCallback:0 info:0 interval:0 fsync:0.0];
}

uint64_t __63___UIMotionEffectCoreMotionEventProvider_startGeneratingEvents__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  [v2 deviceMotionUpdateInterval];
  return objc_msgSend(v2, "setDeviceMotionCallback:info:interval:fsync:", _HandleNewDeviceMotion, v1, 0);
}

@end