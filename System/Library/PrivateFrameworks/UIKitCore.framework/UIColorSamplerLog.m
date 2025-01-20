@interface UIColorSamplerLog
@end

@implementation UIColorSamplerLog

void ___UIColorSamplerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIColorSampler");
  v1 = (void *)_MergedGlobals_1241;
  _MergedGlobals_1241 = (uint64_t)v0;
}

@end