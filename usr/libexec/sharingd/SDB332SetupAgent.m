@interface SDB332SetupAgent
+ (_TtC16DaemoniOSLibrary16SDB332SetupAgent)shared;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSString)machServiceName;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (_TtC16DaemoniOSLibrary16SDB332SetupAgent)init;
- (void)activate;
- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7;
- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5;
- (void)blePairingDataUpdate:(id)a3 pairType:(int)a4 pairData:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7;
- (void)blePairingInfoUpdate:(id)a3 pairType:(int)a4 pairInfoList:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7;
- (void)blePairingStateUpdate:(id)a3 validMask:(unsigned int)a4 btRadioOn:(BOOL)a5 pairingState:(int)a6 pairingModeOn:(BOOL)a7 accessory:(id)a8 blePairingUUID:(id)a9;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)dealloc;
- (void)enableBluetoothTapped;
- (void)pairTapped;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)resetUIUpdatesFlagWithUndimScreen:(BOOL)a3;
- (void)showEducationUIIfNecessary;
- (void)startBatteryScannerForPeripheral:(id)a3;
- (void)startScanning;
- (void)stopBatteryScanner;
- (void)stopScanning;
@end

@implementation SDB332SetupAgent

+ (_TtC16DaemoniOSLibrary16SDB332SetupAgent)shared
{
  if (qword_10096A0C8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1009949F0;

  return (_TtC16DaemoniOSLibrary16SDB332SetupAgent *)v2;
}

- (void)dealloc
{
  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for SDB332SetupAgent(0);
  [(SDXPCDaemon *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_orientationObserver));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_systemMonitor));
  swift_bridgeObjectRelease();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_lastB332WeWantedToPair, &qword_100974EA0);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_powerSourceMonitor));
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_lastAccessoryDetachTimestamp, (uint64_t *)&unk_100975040);
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC16DaemoniOSLibrary16SDB332SetupAgent)init
{
  return (_TtC16DaemoniOSLibrary16SDB332SetupAgent *)sub_10061F1E0();
}

- (void)activate
{
  v2 = self;
  sub_10061F8D4();
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100650454((uint64_t)&unk_1008E30E8, (uint64_t)sub_1006551BC, (uint64_t)&unk_1008E3100);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_100644454(v6, (uint64_t)a4);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100650704();
}

- (void)pairTapped
{
  v2 = self;
  sub_100644AE4();
}

- (void)showEducationUIIfNecessary
{
  v2 = self;
  sub_100650454((uint64_t)&unk_1008E3048, (uint64_t)sub_100655160, (uint64_t)&unk_1008E3060);
}

- (NSString)machServiceName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSXPCInterface)exportedInterface
{
  id v2 = [self interfaceWithProtocol:&OBJC_PROTOCOL___SDB332AgentProtocol];

  return (NSXPCInterface *)v2;
}

- (NSXPCInterface)remoteObjectInterface
{
  id v2 = (void *)sub_1006509C4();

  return (NSXPCInterface *)v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_100650B50(v4);

  return v6 & 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006450C8(v4);
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006454DC(v4);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006458D8(v4);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100650E48(v7);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_100650FF4(v9);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_10065180C(v9);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = self;
  sub_100651E50(v9);
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_1006521E0(v10, v11, a5);
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  id v10 = self;
  sub_100652AC4(v9);
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10064639C(v6, v7);
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100647C38((uint64_t)v6, v7);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_100653130(v6);
}

- (void)resetUIUpdatesFlagWithUndimScreen:(BOOL)a3
{
  id v4 = self;
  sub_100648890(a3);
}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = self;
  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v22 = v21;

  uint64_t v23 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v26 = v25;

  sub_1006533F8(v12, v14, v20, v22, v23, v24, v26);
  sub_100250CC4(v24, v26);
  swift_bridgeObjectRelease();
  sub_100250CC4(v20, v22);

  swift_bridgeObjectRelease();
}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  sub_100653724(v8, v10, v14, v16);
  sub_100250CC4(v14, v16);

  swift_bridgeObjectRelease();
}

- (void)blePairingStateUpdate:(id)a3 validMask:(unsigned int)a4 btRadioOn:(BOOL)a5 pairingState:(int)a6 pairingModeOn:(BOOL)a7 accessory:(id)a8 blePairingUUID:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  v19 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  sub_100653A10(a4, a5, a6, a7);
  sub_100250CC4(v16, v18);
}

- (void)blePairingInfoUpdate:(id)a3 pairType:(int)a4 pairInfoList:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a7;
  uint64_t v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  sub_100653CE4(v10);
  sub_100250CC4(v14, v16);

  swift_bridgeObjectRelease();
}

- (void)blePairingDataUpdate:(id)a3 pairType:(int)a4 pairData:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unint64_t v22 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  sub_100653FB0(a4, v16, v18);
  sub_100250CC4(v19, v21);
  sub_100250CC4(v16, v18);
}

- (void)startScanning
{
  id v2 = self;
  sub_10064C588();
}

- (void)stopScanning
{
  id v2 = self;
  sub_10064C8C4();
}

- (void)startBatteryScannerForPeripheral:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10064CAD8(v4);
}

- (void)stopBatteryScanner
{
  id v2 = self;
  sub_10064EAA8();
}

- (void)enableBluetoothTapped
{
  if (qword_10096A0B0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000B47C(v0, (uint64_t)qword_10097C7F0);
  v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "enableBluetoothTapped", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [self sharedMonitor];
  if (v4)
  {
    id v5 = v4;
    [v4 setBluetoothEnabled:1];
  }
  else
  {
    __break(1u);
  }
}

@end