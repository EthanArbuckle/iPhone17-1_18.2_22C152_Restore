@interface AXSGrayscaleEnabled
@end

@implementation AXSGrayscaleEnabled

uint64_t ___AXSGrayscaleEnabled_block_invoke()
{
  char v1 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSGrayscaleEnabledPreference, &v1);
  if (v1) {
    _kAXSCacheGrayscaleEnabled = result;
  }
  return result;
}

@end