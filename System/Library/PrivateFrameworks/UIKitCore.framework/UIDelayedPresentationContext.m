@interface UIDelayedPresentationContext
@end

@implementation UIDelayedPresentationContext

void __57___UIDelayedPresentationContext_beginDelayedPresentation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delayingController];
  [v1 _cancelDelayedPresentation:1];
}

@end