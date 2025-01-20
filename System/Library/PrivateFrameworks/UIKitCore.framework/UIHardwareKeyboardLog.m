@interface UIHardwareKeyboardLog
@end

@implementation UIHardwareKeyboardLog

void ___UIHardwareKeyboardLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "HardwareKeyboard");
  v1 = (void *)qword_1EB25C4B8;
  qword_1EB25C4B8 = (uint64_t)v0;
}

@end