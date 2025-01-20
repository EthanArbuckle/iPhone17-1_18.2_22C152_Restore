@interface CentralManager
- (_TtC12searchpartyd14CentralManager)init;
- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5;
- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6;
- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
@end

@implementation CentralManager

- (void)dealloc
{
  v2 = self;
  sub_101322AC0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14CentralManager_pairingAgent);
}

- (_TtC12searchpartyd14CentralManager)init
{
  result = (_TtC12searchpartyd14CentralManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10132D000(v4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  unint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_1013331AC(v12, v10, v13);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_101333D70(v7);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = self;
  sub_1013356E4((char *)a4, v9);
}

- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4
{
  sub_10001D4B0(0, (unint64_t *)&unk_101671CA0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  id v7 = self;
  Lock.callAsFunction<A>(_:)();

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_101335E24(v7);
}

- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v14 = a6;
  id v13 = self;
  sub_101336390(v11, v12);
}

- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v14 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  sub_101336B04(v11, v13, v10);
  sub_10001CFB8(v11, v13);
}

@end