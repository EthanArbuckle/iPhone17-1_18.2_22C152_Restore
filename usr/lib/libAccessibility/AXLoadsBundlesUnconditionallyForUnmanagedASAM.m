@interface AXLoadsBundlesUnconditionallyForUnmanagedASAM
@end

@implementation AXLoadsBundlesUnconditionallyForUnmanagedASAM

uint64_t ___AXLoadsBundlesUnconditionallyForUnmanagedASAM_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  _AXLoadsBundlesUnconditionallyForUnmanagedASAM_LoadsBundlesUnconditionallyForUnmanagedASAM = result ^ 1;
  return result;
}

@end