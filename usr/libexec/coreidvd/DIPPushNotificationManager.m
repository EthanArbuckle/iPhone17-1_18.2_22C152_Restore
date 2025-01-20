@interface DIPPushNotificationManager
- (_TtC8coreidvd26DIPPushNotificationManager)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation DIPPushNotificationManager

- (_TtC8coreidvd26DIPPushNotificationManager)init
{
  return (_TtC8coreidvd26DIPPushNotificationManager *)sub_1005E8828();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v11 = self;
    id v7 = a4;
    uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    sub_10000C5F4(v8, v10);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1005ECDC0(a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd26DIPPushNotificationManager_dispatchQueue);
}

@end