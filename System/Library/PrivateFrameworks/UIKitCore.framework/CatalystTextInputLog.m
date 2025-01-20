@interface CatalystTextInputLog
@end

@implementation CatalystTextInputLog

void __CatalystTextInputLog_UIKit_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.textinput.catalyst", "UIKit");
  v1 = (void *)CatalystTextInputLog_UIKit_log;
  CatalystTextInputLog_UIKit_log = (uint64_t)v0;
}

@end