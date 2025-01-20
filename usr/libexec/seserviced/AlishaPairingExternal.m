@interface AlishaPairingExternal
+ (_TtC10seserviced21AlishaPairingExternal)shared;
- (_TtC10seserviced21AlishaPairingExternal)init;
- (id)readAPDU;
- (id)sendAPDU:(id)a3;
- (void)endSession;
- (void)pairingEndedWithError:(id)a3;
- (void)requestOwnerPairingWithSession:(id)a3 delegate:(id)a4;
- (void)startFirstApproachFor:(id)a3;
- (void)startHceEmulation;
- (void)startTransactionEmulationFor:(id)a3;
- (void)stopHceEmulation;
- (void)stopOwnerPairing;
- (void)stopTransactionEmulation;
@end

@implementation AlishaPairingExternal

+ (_TtC10seserviced21AlishaPairingExternal)shared
{
  if (qword_100453650 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1004684F8;

  return (_TtC10seserviced21AlishaPairingExternal *)v2;
}

- (void)requestOwnerPairingWithSession:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100068B24(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)stopOwnerPairing
{
  v2 = self;
  sub_10006AD40((uint64_t)&unk_10040FDC0, (uint64_t)sub_10006D394, (uint64_t)&unk_10040FDD8);
}

- (void)startHceEmulation
{
  v2 = self;
  sub_10006AD40((uint64_t)&unk_10040FD70, (uint64_t)sub_10006D38C, (uint64_t)&unk_10040FD88);
}

- (void)stopHceEmulation
{
  v2 = self;
  sub_10006AD40((uint64_t)&unk_10040FD20, (uint64_t)sub_10006D384, (uint64_t)&unk_10040FD38);
}

- (void)startTransactionEmulationFor:(id)a3
{
}

- (void)stopTransactionEmulation
{
  v2 = self;
  sub_10006AD40((uint64_t)&unk_10040FC80, (uint64_t)sub_10006D32C, (uint64_t)&unk_10040FC98);
}

- (void)pairingEndedWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_100069FC8((uint64_t)a3);
}

- (id)sendAPDU:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  uint64_t v9 = sub_10006A3F0(v6, v8);
  sub_10006D144(v6, v8);

  if (v9)
  {
    v10 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)readAPDU
{
  v2 = self;
  uint64_t v3 = sub_10006A7A4();

  if (v3)
  {
    id v4 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)endSession
{
  v2 = self;
  sub_10006AD40((uint64_t)&unk_10040FBE0, (uint64_t)sub_10006D2A0, (uint64_t)&unk_10040FBF8);
}

- (void)startFirstApproachFor:(id)a3
{
}

- (_TtC10seserviced21AlishaPairingExternal)init
{
  return (_TtC10seserviced21AlishaPairingExternal *)sub_10006C288();
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10seserviced21AlishaPairingExternal_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10006D414((uint64_t)self + OBJC_IVAR____TtC10seserviced21AlishaPairingExternal_delegate);
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end