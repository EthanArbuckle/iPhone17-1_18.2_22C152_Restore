@interface InProcessAnimationLog
@end

@implementation InProcessAnimationLog

void ___InProcessAnimationLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIInProcessAnimationLog");
  v1 = (void *)_MergedGlobals_950;
  _MergedGlobals_950 = (uint64_t)v0;
}

@end