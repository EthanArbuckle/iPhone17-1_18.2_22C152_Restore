@interface UIKBFeedbackLog
@end

@implementation UIKBFeedbackLog

void ___UIKBFeedbackLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIKBFeedbackGenerator");
  v1 = (void *)qword_1EB2601A8;
  qword_1EB2601A8 = (uint64_t)v0;
}

@end