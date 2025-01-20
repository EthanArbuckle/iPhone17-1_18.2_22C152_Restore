@interface ISONotificationPendingResponse
- (BOOL)isNotificationPending;
- (id)error;
- (id)maxDelayTimestampMillis;
@end

@implementation ISONotificationPendingResponse

- (id)error
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

- (BOOL)isNotificationPending
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

- (id)maxDelayTimestampMillis
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

@end