@interface WCM_CoreAnalyticsService
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)singleton;
- (WCM_CA_BTConnectedDevicesHandler)mBTConnectedDevicesHandler;
- (WCM_CoreAnalyticsService)init;
@end

@implementation WCM_CoreAnalyticsService

+ (id)singleton
{
  id result = (id)qword_10027D3A8;
  if (!qword_10027D3A8)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_CoreAnalyticsService;
    id result = [[[objc_msgSendSuper2(&v4, "allocWithZone:", 0) init];
    qword_10027D3A8 = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 singleton:a3];

  return v3;
}

- (WCM_CoreAnalyticsService)init
{
  v4.receiver = self;
  v4.super_class = (Class)WCM_CoreAnalyticsService;
  v2 = [(WCM_CoreAnalyticsService *)&v4 init];
  if (v2) {
    v2->_mBTConnectedDevicesHandler = objc_alloc_init(WCM_CA_BTConnectedDevicesHandler);
  }
  return v2;
}

- (WCM_CA_BTConnectedDevicesHandler)mBTConnectedDevicesHandler
{
  return self->_mBTConnectedDevicesHandler;
}

@end