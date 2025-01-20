@interface BKTUIOfflineCacheProvider
- (BOOL)generateCache;
- (BOOL)runFromCache;
- (NSArray)cacheDirCandidatesForPostLaunch;
- (NSArray)cacheFileCandidatesForPreLaunch;
@end

@implementation BKTUIOfflineCacheProvider

- (BOOL)runFromCache
{
  return +[JSAOfflineCache runFromCache];
}

- (BOOL)generateCache
{
  return +[JSAOfflineCache generateCache];
}

- (NSArray)cacheFileCandidatesForPreLaunch
{
  return (NSArray *)+[JSAOfflineCache cacheFileCandidatesForTUIPreLaunch];
}

- (NSArray)cacheDirCandidatesForPostLaunch
{
  return (NSArray *)+[JSAOfflineCache cacheDirCandidatesForTUIPostLaunch];
}

@end