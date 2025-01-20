@interface UIUserInterfaceStyleArbiterLogger
@end

@implementation UIUserInterfaceStyleArbiterLogger

void ___UIUserInterfaceStyleArbiterLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UserInterfaceStyleArbiter");
  v1 = (void *)_MergedGlobals_1233;
  _MergedGlobals_1233 = (uint64_t)v0;
}

@end