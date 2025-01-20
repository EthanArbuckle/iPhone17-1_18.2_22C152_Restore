@interface MAPreferencesIsInternalAllowed
@end

@implementation MAPreferencesIsInternalAllowed

uint64_t ___MAPreferencesIsInternalAllowed_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MAPreferencesIsInternalAllowed__isAppleInternal = result;
  return result;
}

@end