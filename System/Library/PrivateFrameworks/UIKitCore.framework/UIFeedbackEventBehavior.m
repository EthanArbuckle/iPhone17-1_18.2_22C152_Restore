@interface UIFeedbackEventBehavior
@end

@implementation UIFeedbackEventBehavior

void __42___UIFeedbackEventBehavior_eventOccurred___block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB25CBC8;
  qword_1EB25CBC8 = (uint64_t)v1;
}

uint64_t __50___UIFeedbackEventBehavior__activateAndPlayEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateAndPlayEvent:*(void *)(a1 + 40)];
}

@end