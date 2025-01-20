@interface UIFeedbackPreciseDispatchAfter
@end

@implementation UIFeedbackPreciseDispatchAfter

void ___UIFeedbackPreciseDispatchAfter_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  dispatch_source_cancel(v2);
}

@end