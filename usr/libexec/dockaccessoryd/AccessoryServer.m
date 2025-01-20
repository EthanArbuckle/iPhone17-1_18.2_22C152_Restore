@interface AccessoryServer
- (_TtC14dockaccessoryd15AccessoryServer)init;
- (void)accessoryServer:(id)a3 authenticateUUID:(id)a4 token:(id)a5;
- (void)accessoryServer:(id)a3 confirmUUID:(id)a4 token:(id)a5;
- (void)accessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6;
- (void)accessoryServer:(id)a3 didFinishAuth:(id)a4;
- (void)accessoryServer:(id)a3 didReceiveBadPasswordThrottleAttemptsWithDelay:(int64_t)a4;
- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4;
- (void)accessoryServer:(id)a3 didUpdateCategory:(id)a4;
- (void)accessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4;
- (void)accessoryServer:(id)a3 didUpdateName:(id)a4;
- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristic:(id)a4 value:(id)a5;
- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6;
- (void)accessoryServer:(id)a3 promptUserForPasswordWithType:(unint64_t)a4;
- (void)accessoryServer:(id)a3 requestUserPermission:(int64_t)a4 accessoryInfo:(id)a5 error:(id)a6;
- (void)accessoryServer:(id)a3 updatePairingProgress:(int64_t)a4;
- (void)accessoryServer:(id)a3 validateCert:(id)a4 model:(id)a5;
- (void)accessoryServer:(id)a3 validateUUID:(id)a4 token:(id)a5 model:(id)a6;
- (void)accessoryServerDidUpdateStateNumber:(id)a3;
- (void)accessoryServerNeedsOwnershipToken:(id)a3;
@end

@implementation AccessoryServer

- (void)accessoryServer:(id)a3 promptUserForPasswordWithType:(unint64_t)a4
{
  id v7 = a3;
  v8 = self;
  sub_100153A94(a3, a4);
}

- (void)accessoryServer:(id)a3 requestUserPermission:(int64_t)a4 accessoryInfo:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  id v14 = a6;
  sub_100162D54(a3, a4);
}

- (void)accessoryServer:(id)a3 didReceiveBadPasswordThrottleAttemptsWithDelay:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_1001694E8("accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay");
}

- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4
{
  id v7 = a3;
  v8 = self;
  id v9 = a4;
  sub_100154904(a3, (uint64_t)a4);
}

- (void)accessoryServer:(id)a3 updatePairingProgress:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_1001694E8("accessoryServer:updatePairingProgress");
}

- (void)accessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6
{
  unint64_t v8 = (unint64_t)a4;
  if (a4)
  {
    sub_100099C7C(0, &qword_1002A9780);
    unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  sub_100163D08(a3, v8, (uint64_t)a6);

  swift_bridgeObjectRelease();
}

- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6
{
  if (a4) {
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a5;
  id v12 = self;
  sub_1001655A8(a3, v9);

  swift_bridgeObjectRelease();
}

- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristic:(id)a4 value:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15 = self;
  id v12 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = v13;

  sub_10015F078(a3, a4, v12, v14);
  sub_1000A6240((uint64_t)v12, (unint64_t)v14);
}

- (void)accessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1001694E8("accessoryServer:didUpdateHasPairings");
}

- (void)accessoryServerDidUpdateStateNumber:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001694E8("accessoryServerDidUpdateStateNumber");
}

- (void)accessoryServer:(id)a3 didUpdateCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_1001694E8("accessoryServer:didUpdateCategory");
}

- (void)accessoryServer:(id)a3 didUpdateName:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  id v7 = self;
  sub_1001694E8("accessoryServer:didUpdateName");

  swift_bridgeObjectRelease();
}

- (void)accessoryServer:(id)a3 validateUUID:(id)a4 token:(id)a5 model:(id)a6
{
  uint64_t v11 = sub_1000992E8(&qword_1002AAA20);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  id v16 = a3;
  if (!a5)
  {
    id v25 = a6;
    v26 = self;
    unint64_t v21 = 0xF000000000000000;
    if (a6) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    goto LABEL_9;
  }
  id v17 = a5;
  id v18 = a6;
  v19 = self;
  a5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  if (!a6) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;

LABEL_9:
  sub_100160038(v16, (uint64_t)v13, (uint64_t)a5, v21, v22, v24);
  swift_bridgeObjectRelease();
  sub_1000A9990((uint64_t)a5, v21);

  sub_1000A61E4((uint64_t)v13, &qword_1002AAA20);
}

- (void)accessoryServer:(id)a3 validateCert:(id)a4 model:(id)a5
{
  id v6 = a4;
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    id v10 = self;
    id v11 = v6;
    id v6 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;

    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  id v14 = a3;
  id v15 = a5;
  id v16 = self;
  unint64_t v13 = 0xF000000000000000;
  if (a5)
  {
LABEL_3:
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_5:
  sub_1001694E8("accessoryServer:validateCert");
  swift_bridgeObjectRelease();
  sub_1000A9990((uint64_t)v6, v13);
}

- (void)accessoryServer:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  uint64_t v9 = sub_1000992E8(&qword_1002AAA20);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  if (a5)
  {
    id v15 = a5;
    id v16 = self;
    a5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    v19 = self;
    unint64_t v18 = 0xF000000000000000;
  }
  sub_100169230(v14);
  sub_1000A9990((uint64_t)a5, v18);

  sub_1000A61E4((uint64_t)v11, &qword_1002AAA20);
}

- (void)accessoryServer:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  uint64_t v9 = sub_1000992E8(&qword_1002AAA20);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  if (a5)
  {
    id v15 = a5;
    id v16 = self;
    a5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    v19 = self;
    unint64_t v18 = 0xF000000000000000;
  }
  sub_100160CC0(v14, (uint64_t)v11, (uint64_t)a5, v18);
  sub_1000A9990((uint64_t)a5, v18);

  sub_1000A61E4((uint64_t)v11, &qword_1002AAA20);
}

- (void)accessoryServer:(id)a3 didFinishAuth:(id)a4
{
  id v7 = a3;
  id v8 = self;
  id v9 = a4;
  sub_100161254(a3, (uint64_t)a4);
}

- (void)accessoryServerNeedsOwnershipToken:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001694E8("accessoryServerNeedsOwnershipToken");
}

- (_TtC14dockaccessoryd15AccessoryServer)init
{
  return (_TtC14dockaccessoryd15AccessoryServer *)sub_1001616C0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd15AccessoryServer_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15AccessoryServer_virtualEventService);
}

@end