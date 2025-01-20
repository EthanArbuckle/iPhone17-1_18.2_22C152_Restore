@interface SUPreferencesChanged
@end

@implementation SUPreferencesChanged

uint64_t ____SUPreferencesChanged_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8 = *(void **)(a1 + 32);
  SULogInfo(@"%s: Reloading the current preferences now", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"void __SUPreferencesChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)_block_invoke");
  [v8 _loadPreferences];
  return [v8 preference:0 didChangeTo:0];
}

@end