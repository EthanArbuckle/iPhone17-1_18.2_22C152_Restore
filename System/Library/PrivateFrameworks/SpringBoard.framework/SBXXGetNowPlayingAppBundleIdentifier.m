@interface SBXXGetNowPlayingAppBundleIdentifier
@end

@implementation SBXXGetNowPlayingAppBundleIdentifier

void ___SBXXGetNowPlayingAppBundleIdentifier_block_invoke(uint64_t a1)
{
  id v6 = +[SBMediaController sharedInstance];
  v2 = [v6 nowPlayingApplication];
  uint64_t v3 = [v2 bundleIdentifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end