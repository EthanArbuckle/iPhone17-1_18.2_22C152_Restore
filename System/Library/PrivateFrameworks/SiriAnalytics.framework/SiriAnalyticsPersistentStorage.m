@interface SiriAnalyticsPersistentStorage
+ (SiriAnalyticsDataVault)dataVault;
- (SiriAnalyticsPersistentStorage)init;
@end

@implementation SiriAnalyticsPersistentStorage

+ (SiriAnalyticsDataVault)dataVault
{
  swift_getObjCClassMetadata();
  id v2 = static PersistentStorage.dataVault.getter();
  return (SiriAnalyticsDataVault *)v2;
}

- (SiriAnalyticsPersistentStorage)init
{
  return (SiriAnalyticsPersistentStorage *)PersistentStorage.init()();
}

@end