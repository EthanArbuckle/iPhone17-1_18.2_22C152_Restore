@interface NCDeviceIsRunningInternalBuild
@end

@implementation NCDeviceIsRunningInternalBuild

uint64_t ___NCDeviceIsRunningInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  _NCDeviceIsRunningInternalBuild___internalBuild = result;
  return result;
}

@end