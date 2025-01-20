@interface IsInternalInstall
@end

@implementation IsInternalInstall

uint64_t ___IsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _IsInternalInstall___internalInstall = result;
  return result;
}

@end