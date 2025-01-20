@interface MarketingNotificationService
- (BOOL)supportsHandling:(id)a3;
- (void)didReceive:(id)a3 withContentHandler:(id)a4;
- (void)serviceExtensionTimeWillExpire;
@end

@implementation MarketingNotificationService

- (BOOL)supportsHandling:(id)a3
{
  v4 = self;

  return [v4 shouldHandleServiceExtensionNotificationRequest:a3];
}

- (void)didReceive:(id)a3 withContentHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  swift_retain();
  sub_10001B38C(v7, (uint64_t)self, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_release();
}

- (void)serviceExtensionTimeWillExpire
{
  swift_retain();
  sub_10001B064();

  swift_release();
}

@end