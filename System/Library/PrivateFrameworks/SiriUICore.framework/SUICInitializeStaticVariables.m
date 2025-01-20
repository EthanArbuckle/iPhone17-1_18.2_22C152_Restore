@interface SUICInitializeStaticVariables
@end

@implementation SUICInitializeStaticVariables

uint64_t ___SUICInitializeStaticVariables_block_invoke()
{
  v0 = objc_alloc_init(_SUICCheckGlyphSpringAnimationFactory);
  v1 = (void *)_SUICDefaultSpringAnimationFactory;
  _SUICDefaultSpringAnimationFactory = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.siriuicore.springAnimationFactory", 0);
  v3 = (void *)_SUICDefaultSpringAnimationFactoryQueue;
  _SUICDefaultSpringAnimationFactoryQueue = (uint64_t)v2;

  uint64_t v4 = [(id)_SUICDefaultSpringAnimationFactory springAnimationWithKeyPath:0];
  v5 = (void *)_SUICSpringAnimationTimingAnimation;
  _SUICSpringAnimationTimingAnimation = v4;

  uint64_t v6 = [(id)_SUICSpringAnimationTimingAnimation timingFunction];
  v7 = (void *)_SUICSpringAnimationTimingFunction;
  _SUICSpringAnimationTimingFunction = v6;

  uint64_t result = [(id)_SUICDefaultSpringAnimationFactory duration];
  _SUICDefaultSpringAnimationDuration = v9;
  return result;
}

@end