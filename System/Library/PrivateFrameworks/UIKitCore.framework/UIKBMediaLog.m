@interface UIKBMediaLog
@end

@implementation UIKBMediaLog

void ___UIKBMediaLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIKBMediaLog");
  v1 = (void *)qword_1EB260480;
  qword_1EB260480 = (uint64_t)v0;
}

void ___UIKBMediaLog_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIKBMediaLog");
  v1 = (void *)qword_1EB260C00;
  qword_1EB260C00 = (uint64_t)v0;
}

@end