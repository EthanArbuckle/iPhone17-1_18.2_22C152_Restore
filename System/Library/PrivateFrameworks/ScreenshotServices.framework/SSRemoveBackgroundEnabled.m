@interface SSRemoveBackgroundEnabled
@end

@implementation SSRemoveBackgroundEnabled

uint64_t ___SSRemoveBackgroundEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _SSRemoveBackgroundEnabled_sRemoveBackgroundEnabled = result;
  return result;
}

@end