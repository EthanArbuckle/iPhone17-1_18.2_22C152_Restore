@interface UIImageLoadingLog
@end

@implementation UIImageLoadingLog

void ___UIImageLoadingLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "ImageLoading");
  v1 = (void *)_MergedGlobals_1_9;
  _MergedGlobals_1_9 = (uint64_t)v0;
}

@end