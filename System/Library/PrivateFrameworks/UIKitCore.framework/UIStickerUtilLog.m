@interface UIStickerUtilLog
@end

@implementation UIStickerUtilLog

void ___UIStickerUtilLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "_UIStickerUtil");
  v1 = (void *)_MergedGlobals_1275;
  _MergedGlobals_1275 = (uint64_t)v0;
}

@end