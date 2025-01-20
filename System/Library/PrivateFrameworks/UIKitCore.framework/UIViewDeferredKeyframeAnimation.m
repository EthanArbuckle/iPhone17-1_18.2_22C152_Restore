@interface UIViewDeferredKeyframeAnimation
@end

@implementation UIViewDeferredKeyframeAnimation

uint64_t __67___UIViewDeferredKeyframeAnimation_animateFrameAtIndex_animations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __45___UIViewDeferredKeyframeAnimation__finalize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartTimes:");
}

@end