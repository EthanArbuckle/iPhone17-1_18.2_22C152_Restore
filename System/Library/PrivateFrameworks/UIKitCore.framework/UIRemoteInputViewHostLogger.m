@interface UIRemoteInputViewHostLogger
@end

@implementation UIRemoteInputViewHostLogger

void ___UIRemoteInputViewHostLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIRemoteInputViewHost");
  v1 = (void *)_MergedGlobals_948;
  _MergedGlobals_948 = (uint64_t)v0;
}

@end