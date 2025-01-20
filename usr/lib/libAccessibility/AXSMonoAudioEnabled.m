@interface AXSMonoAudioEnabled
@end

@implementation AXSMonoAudioEnabled

uint64_t ___AXSMonoAudioEnabled_block_invoke()
{
  char v1 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSMonoAudioEnabledPreference, &v1);
  if (v1) {
    _kAXSCacheMonoAudioEnabled = result;
  }
  return result;
}

@end