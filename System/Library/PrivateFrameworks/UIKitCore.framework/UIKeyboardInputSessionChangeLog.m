@interface UIKeyboardInputSessionChangeLog
@end

@implementation UIKeyboardInputSessionChangeLog

void ___UIKeyboardInputSessionChangeLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "InputSessionChange");
  v1 = (void *)_UIKeyboardInputSessionChangeLog_log;
  _UIKeyboardInputSessionChangeLog_log = (uint64_t)v0;
}

@end