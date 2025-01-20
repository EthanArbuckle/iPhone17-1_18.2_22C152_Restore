@interface UIPeripheralHostLogger
@end

@implementation UIPeripheralHostLogger

void ___UIPeripheralHostLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIPeripheralHost");
  v1 = (void *)qword_1EB261C38;
  qword_1EB261C38 = (uint64_t)v0;
}

@end