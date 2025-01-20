@interface CSDProcessObserver
- (CSDProcessObserver)init;
- (CSDProcessObserver)initWithBundleIdentifiers:(id)a3 queue:(id)a4;
- (CSDProcessObserver)initWithQueue:(id)a3;
- (id)fetchCurrentProcessStatesForBundleIdentifier:(id)a3;
- (id)processIdentifiersForBundleIdentifier:(id)a3;
- (id)processStateChanged;
- (id)processStateChangedWithBundleID;
- (id)processStatesForBundleIdentifier:(id)a3;
- (id)processStatesForCallSource:(id)a3;
- (int)currentProcessIdentifier;
- (void)fetchCurrentProcessStatesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)processStatesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)setProcessStateChanged:(id)a3;
- (void)setProcessStateChangedWithBundleID:(id)a3;
@end

@implementation CSDProcessObserver

- (CSDProcessObserver)initWithQueue:(id)a3
{
  return (CSDProcessObserver *)sub_10024F0B0(a3);
}

- (CSDProcessObserver)initWithBundleIdentifiers:(id)a3 queue:(id)a4
{
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDProcessObserver *)sub_10024F180(v5, a4);
}

- (int)currentProcessIdentifier
{
  v2 = self;
  pid_t v3 = j__getpid();

  return v3;
}

- (id)processStateChanged
{
  uint64_t v2 = sub_1002512E8();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10027AC80;
    v6[3] = &unk_10050EB08;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setProcessStateChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100222660;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_100251660((uint64_t)v4, v5, &OBJC_IVAR___CSDProcessObserver_processStateChanged, (uint64_t (*)(uint64_t, uint64_t))sub_100235A1C);
}

- (id)processStateChangedWithBundleID
{
  uint64_t v2 = sub_10025147C();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1002514A4;
    v6[3] = &unk_10050EAB8;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setProcessStateChangedWithBundleID:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1002541E4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_100251660((uint64_t)v4, v5, &OBJC_IVAR___CSDProcessObserver_processStateChangedWithBundleID, (uint64_t (*)(uint64_t, uint64_t))sub_100208490);
}

- (id)processIdentifiersForBundleIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_100251680();

  swift_bridgeObjectRelease();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (id)processStatesForBundleIdentifier:(id)a3
{
  return sub_100251A44(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_100251898);
}

- (void)processStatesForBundleIdentifier:(id)a3 completion:(id)a4
{
  NSArray v5 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_100251AE0();

  swift_bridgeObjectRelease();

  swift_release();
}

- (id)fetchCurrentProcessStatesForBundleIdentifier:(id)a3
{
  return sub_100251A44(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10024E5A8);
}

- (void)fetchCurrentProcessStatesForBundleIdentifier:(id)a3 completion:(id)a4
{
  NSArray v5 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_100251AE0();

  swift_bridgeObjectRelease();

  swift_release();
}

- (CSDProcessObserver)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100208490(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDProcessObserver_processStateChanged));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDProcessObserver_processStateChangedWithBundleID);

  sub_100208490(v3);
}

- (id)processStatesForCallSource:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  sub_100251F04(v4);

  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

@end