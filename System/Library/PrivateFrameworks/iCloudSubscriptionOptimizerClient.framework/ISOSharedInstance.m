@interface ISOSharedInstance
+ (id)get;
- (ISOSharedInstance)init;
@end

@implementation ISOSharedInstance

+ (id)get
{
  id v2 = _s33iCloudSubscriptionOptimizerClient14SharedInstanceC3getSo08ISOQuotaD0CyFZ_0();
  return v2;
}

- (ISOSharedInstance)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharedInstance();
  return [(ISOSharedInstance *)&v3 init];
}

@end