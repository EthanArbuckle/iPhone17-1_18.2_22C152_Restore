@interface TUIOfflineCache
+ (TUIOfflineCacheProviding)provider;
+ (void)setProvider:(id)a3;
@end

@implementation TUIOfflineCache

+ (TUIOfflineCacheProviding)provider
{
  return (TUIOfflineCacheProviding *)(id)qword_2DF170;
}

+ (void)setProvider:(id)a3
{
}

@end