@interface MPCPlayerPath
- (BOOL)isSystemPodcastsPath;
@end

@implementation MPCPlayerPath

- (BOOL)isSystemPodcastsPath
{
  v3 = [(MPCPlayerPath *)self bundleID];
  if ([(MPCPlayerPath *)self mediaRemotePlayerPath])
  {
    [(MPCPlayerPath *)self mediaRemotePlayerPath];
    MRNowPlayingPlayerPathGetClient();
    v4 = (void *)MRNowPlayingClientCopyBundleIdentifierHierarchy();
    if ([v4 count])
    {
      uint64_t v5 = [v4 lastObject];

      v3 = (void *)v5;
    }
  }
  unsigned __int8 v6 = [v3 isEqualToString:@"com.apple.podcasts"];

  return v6;
}

@end