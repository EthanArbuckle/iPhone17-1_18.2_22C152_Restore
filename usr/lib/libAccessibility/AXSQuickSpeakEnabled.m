@interface AXSQuickSpeakEnabled
@end

@implementation AXSQuickSpeakEnabled

uint64_t ___AXSQuickSpeakEnabled_block_invoke()
{
  char v1 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSQuickSpeakEnabledPreference, &v1);
  if (v1) {
    _kAXSCacheQuickSpeakEnabled = result;
  }
  return result;
}

@end