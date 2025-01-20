@interface SUSUIPreferencesChanged
@end

@implementation SUSUIPreferencesChanged

uint64_t ____SUSUIPreferencesChanged_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadPreferences", a1, a1);
}

@end