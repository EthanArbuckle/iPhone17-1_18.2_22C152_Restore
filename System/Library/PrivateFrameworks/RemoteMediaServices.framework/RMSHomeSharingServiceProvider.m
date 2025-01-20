@interface RMSHomeSharingServiceProvider
- (id)searchScope;
- (id)searchType;
- (int64_t)serviceDiscoverySource;
@end

@implementation RMSHomeSharingServiceProvider

- (id)searchType
{
  return @"_home-sharing._tcp.";
}

- (id)searchScope
{
  CFPreferencesAppSynchronize(@"com.apple.RemoteMediaServices");
  v2 = 0;
  if (!CFPreferencesGetAppBooleanValue(@"AllowAnyHomeSharingID", @"com.apple.RemoteMediaServices", 0))
  {
    v3 = [MEMORY[0x263F49A98] defaultStore];
    v4 = [v3 groupID];

    v5 = &stru_26F083878;
    if (v4) {
      v5 = v4;
    }
    v2 = v5;
  }
  return v2;
}

- (int64_t)serviceDiscoverySource
{
  return 1;
}

@end