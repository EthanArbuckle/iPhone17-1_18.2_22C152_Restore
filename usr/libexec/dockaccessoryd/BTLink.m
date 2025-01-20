@interface BTLink
- (_TtC14dockaccessoryd6BTLink)init;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
@end

@implementation BTLink

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10013FD14(v4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_100143804(v12, v10, v13);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100140380(v6, v7);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_100144090(v9, (uint64_t)a5);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_100140FCC(v8, v9, (uint64_t)a5);
}

- (_TtC14dockaccessoryd6BTLink)init
{
  return (_TtC14dockaccessoryd6BTLink *)sub_1001DA12C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd6BTLink_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_release();
  sub_1000A61E4((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd6BTLink_filter, (uint64_t *)&unk_1002AA6D0);
  sub_1000BF118(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd6BTLink_match));
  swift_release();

  sub_1000A61E4((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd6BTLink_delegate, (uint64_t *)&unk_1002AA690);
  swift_release();

  swift_bridgeObjectRelease();
}

@end