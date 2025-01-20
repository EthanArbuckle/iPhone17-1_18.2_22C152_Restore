@interface UIFeedbackBackBoardEngine
@end

@implementation UIFeedbackBackBoardEngine

void __44___UIFeedbackBackBoardEngine__internalQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UIKit.FeedbackBackBoardEngineInternal", v2);
  v1 = (void *)_MergedGlobals_1_19;
  _MergedGlobals_1_19 = (uint64_t)v0;
}

void __42___UIFeedbackBackBoardEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB25BE90;
  qword_1EB25BE90 = (uint64_t)v1;
}

uint64_t __51___UIFeedbackBackBoardEngine__playFeedback_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackData:forFeedback:atTime:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __44___UIFeedbackBackBoardEngine__stopFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopFeedbackData:forFeedback:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

@end