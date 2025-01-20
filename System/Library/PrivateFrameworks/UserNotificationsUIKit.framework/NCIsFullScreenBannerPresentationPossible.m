@interface NCIsFullScreenBannerPresentationPossible
@end

@implementation NCIsFullScreenBannerPresentationPossible

void ___NCIsFullScreenBannerPresentationPossible_block_invoke()
{
  id v1 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v1 userInterfaceIdiom] == 1) {
    char v0 = 0;
  }
  else {
    char v0 = _os_feature_enabled_impl();
  }
  _NCIsFullScreenBannerPresentationPossible___isFullScreenBannerPresentationPossible = v0;
}

@end