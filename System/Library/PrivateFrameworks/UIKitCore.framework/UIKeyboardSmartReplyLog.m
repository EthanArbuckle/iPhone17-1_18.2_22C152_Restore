@interface UIKeyboardSmartReplyLog
@end

@implementation UIKeyboardSmartReplyLog

void ___UIKeyboardSmartReplyLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "SmartReply");
  v1 = (void *)_UIKeyboardSmartReplyLog_log;
  _UIKeyboardSmartReplyLog_log = (uint64_t)v0;
}

@end