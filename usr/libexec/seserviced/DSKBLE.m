@interface DSKBLE
- (_TtC10seserviced6DSKBLE)init;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdateControllerBTClockDictForPeripheral:(id)a4 results:(id)a5;
- (void)centralManager:(id)a3 didUpdateRSSIStatisticsDetectionForPeripheral:(id)a4 results:(id)a5 error:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation DSKBLE

- (_TtC10seserviced6DSKBLE)init
{
  return (_TtC10seserviced6DSKBLE *)sub_1000CF934();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced6DSKBLE_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000DB078(v4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  v10 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_100105844(v12, v10, (unint64_t)v13);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001072B0(v7);
}

- (void)centralManager:(id)a3 didUpdateControllerBTClockDictForPeripheral:(id)a4 results:(id)a5
{
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_100108508(v10, v8);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didUpdateRSSIStatisticsDetectionForPeripheral:(id)a4 results:(id)a5 error:(id)a6
{
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = (uint8_t *)a4;
  id v13 = self;
  id v14 = a6;
  sub_100108E74(v12, v10, (uint64_t)a6);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1000DBED8(v6, (uint64_t)a4);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_1000E1D98(v8, a4, (uint64_t)a5);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_1000E2608(v6, v4);
}

@end