@interface SSLinksInPhotosEnabled
@end

@implementation SSLinksInPhotosEnabled

uint64_t ___SSLinksInPhotosEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _SSLinksInPhotosEnabled___SSLinksInPhotosEnabled = result;
  return result;
}

@end