@interface ISOQuotaClient
+ (id)shared;
- (id)failsafeDelayedOfferJsonContext;
- (id)parseDelayedOffer:(id)a3;
- (id)parseDelayedOfferFromJson:(id)a3;
- (id)parseNotification:(id)a3;
- (void)clearNotificationState:(id)a3;
- (void)isNotificationPending:(id)a3;
- (void)logFailsafeEvent:(id)a3;
- (void)newOffer:(id)a3 andCallback:(id)a4;
@end

@implementation ISOQuotaClient

- (id)parseNotification:(id)a3
{
  return 0;
}

- (void)newOffer:(id)a3 andCallback:(id)a4
{
  id v4 = +[ISONotificationContent notImplementedException];
}

- (void)isNotificationPending:(id)a3
{
  id v3 = a3;
  id v4 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v4);
}

- (void)clearNotificationState:(id)a3
{
  id v3 = a3;
  id v4 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v4);
}

- (id)parseDelayedOfferFromJson:(id)a3
{
  id v3 = a3;
  id v4 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v4);
}

- (id)parseDelayedOffer:(id)a3
{
  id v3 = a3;
  id v4 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v4);
}

- (id)failsafeDelayedOfferJsonContext
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

- (void)logFailsafeEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v4);
}

+ (id)shared
{
  return +[ISOSharedInstance get];
}

@end