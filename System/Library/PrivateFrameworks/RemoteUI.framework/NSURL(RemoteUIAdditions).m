@interface NSURL(RemoteUIAdditions)
- (uint64_t)rui_isSupportedNativeURL;
- (uint64_t)rui_isSupportedSafariURL;
@end

@implementation NSURL(RemoteUIAdditions)

- (uint64_t)rui_isSupportedNativeURL
{
  if (rui_isSupportedNativeURL_onceToken != -1) {
    dispatch_once(&rui_isSupportedNativeURL_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)rui_isSupportedNativeURL_supportedSchemes;
  v3 = [a1 scheme];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)rui_isSupportedSafariURL
{
  if (rui_isSupportedSafariURL_onceToken != -1) {
    dispatch_once(&rui_isSupportedSafariURL_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)rui_isSupportedSafariURL_supportedSafariSchemes;
  v3 = [a1 scheme];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

@end