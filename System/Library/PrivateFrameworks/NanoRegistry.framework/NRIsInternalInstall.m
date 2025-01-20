@interface NRIsInternalInstall
@end

@implementation NRIsInternalInstall

uint64_t ___NRIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _NRIsInternalInstall___internalInstall = result;
  return result;
}

@end