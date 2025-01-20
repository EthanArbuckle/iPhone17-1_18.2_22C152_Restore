@interface UIClippingFaultLog
@end

@implementation UIClippingFaultLog

void ___UIClippingFaultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runtime-issues", "Text Layout");
  v1 = (void *)qword_1EB25C2A0;
  qword_1EB25C2A0 = (uint64_t)v0;
}

@end