@interface UIDictationGlowEffectLog
@end

@implementation UIDictationGlowEffectLog

void ___UIDictationGlowEffectLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "DictationGlowEffect");
  v1 = (void *)_MergedGlobals_1236;
  _MergedGlobals_1236 = (uint64_t)v0;
}

@end