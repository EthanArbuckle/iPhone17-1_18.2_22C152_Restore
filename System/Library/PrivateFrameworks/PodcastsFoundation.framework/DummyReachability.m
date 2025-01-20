@interface DummyReachability
- (BOOL)isGlobalCellularEnabled;
- (BOOL)isPodcastsCellularDownloadsEnabled;
- (BOOL)isReachable;
- (BOOL)isReachableViaCellular;
- (BOOL)isReachableViaWifi;
@end

@implementation DummyReachability

- (BOOL)isReachableViaCellular
{
  return 1;
}

- (BOOL)isGlobalCellularEnabled
{
  return 1;
}

- (BOOL)isReachable
{
  return 1;
}

- (BOOL)isReachableViaWifi
{
  return 1;
}

- (BOOL)isPodcastsCellularDownloadsEnabled
{
  return 1;
}

@end