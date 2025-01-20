@interface StringFromPreferencesStackSignals
@end

@implementation StringFromPreferencesStackSignals

uint64_t ___StringFromPreferencesStackSignals_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) length];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 appendString:@"|"];
  }
  return result;
}

@end