@interface UIViewServiceUIBehaviorProxy
@end

@implementation UIViewServiceUIBehaviorProxy

void __54___UIViewServiceUIBehaviorProxy__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllEnqueuedInvocations];
  v2 = *(void **)(a1 + 32);
  _UIDeallocOnMainThread(v2);
}

@end