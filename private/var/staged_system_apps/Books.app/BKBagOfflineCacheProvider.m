@interface BKBagOfflineCacheProvider
- (BOOL)runFromCache;
- (id)loadCache;
@end

@implementation BKBagOfflineCacheProvider

- (BOOL)runFromCache
{
  return +[JSAOfflineCache runFromCache];
}

- (id)loadCache
{
  return +[JSAProfileBagManager valuesFromOfflineCache];
}

@end