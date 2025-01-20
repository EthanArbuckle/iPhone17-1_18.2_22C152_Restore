@interface DIPWatch
- (_TtC8coreidvd8DIPWatch)init;
- (void)dealloc;
- (void)identityRemoteDeviceService:(id)a3 didReceiveEvent:(unint64_t)a4 fromRemoteDeviceWithID:(id)a5;
@end

@implementation DIPWatch

- (_TtC8coreidvd8DIPWatch)init
{
  return (_TtC8coreidvd8DIPWatch *)sub_10001C89C();
}

- (void)dealloc
{
  v2 = self;
  sub_10001CE3C();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd8DIPWatch_delegate;

  sub_100025D08((uint64_t)v3);
}

- (void)identityRemoteDeviceService:(id)a3 didReceiveEvent:(unint64_t)a4 fromRemoteDeviceWithID:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  id v11 = a3;
  v12 = self;
  sub_10001F394(v11, a4, v8, v10);

  swift_bridgeObjectRelease();
}

@end