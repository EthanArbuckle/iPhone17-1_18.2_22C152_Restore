@interface NewsNotificationService
- (_TtC32NewsNotificationServiceExtension23NewsNotificationService)init;
- (void)didReceiveNotificationRequest:(id)a3 withContentHandler:(id)a4;
- (void)serviceExtensionTimeWillExpire;
@end

@implementation NewsNotificationService

- (void)didReceiveNotificationRequest:(id)a3 withContentHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10001CAE8(v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)serviceExtensionTimeWillExpire
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService);
  if (v2) {
    [v2 serviceExtensionTimeWillExpire];
  }
}

- (_TtC32NewsNotificationServiceExtension23NewsNotificationService)init
{
  return (_TtC32NewsNotificationServiceExtension23NewsNotificationService *)sub_10001C79C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end