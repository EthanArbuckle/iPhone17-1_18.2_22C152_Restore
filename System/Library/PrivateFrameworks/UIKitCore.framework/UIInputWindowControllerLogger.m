@interface UIInputWindowControllerLogger
@end

@implementation UIInputWindowControllerLogger

void ___UIInputWindowControllerLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "InputWindowController");
  v1 = (void *)qword_1EB25C3D0;
  qword_1EB25C3D0 = (uint64_t)v0;
}

@end