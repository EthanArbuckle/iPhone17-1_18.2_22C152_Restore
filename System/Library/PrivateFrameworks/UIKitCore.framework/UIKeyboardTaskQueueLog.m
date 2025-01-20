@interface UIKeyboardTaskQueueLog
@end

@implementation UIKeyboardTaskQueueLog

void ___UIKeyboardTaskQueueLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "KeyboardTaskQueue");
  v1 = (void *)_UIKeyboardTaskQueueLog_log;
  _UIKeyboardTaskQueueLog_log = (uint64_t)v0;
}

@end