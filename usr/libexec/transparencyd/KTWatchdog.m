@interface KTWatchdog
+ (BOOL)isInDebugger;
- (NSString)description;
- (_TtC13transparencyd10KTWatchdog)init;
- (_TtC13transparencyd10KTWatchdog)initWithControl:(id)a3;
- (id)checkWatchDogs;
- (void)addWithNamed:(id)a3 watcher:(id)a4;
- (void)resume;
- (void)runWatchDog;
- (void)stopWatchDog;
@end

@implementation KTWatchdog

- (_TtC13transparencyd10KTWatchdog)initWithControl:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC13transparencyd10KTWatchdog *)sub_1000FA9B8((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (NSString)description
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v3 = self;
  v2();
  sub_100080E08(&qword_1003222B8);
  sub_1000C1468((unint64_t *)&unk_1003222C0, &qword_1003222B8);
  sub_100090D14();
  uint64_t v4 = Sequence<>.joined(separator:)();
  v6 = v5;
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 62;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

+ (BOOL)isInDebugger
{
  return _s13transparencyd10KTWatchdogC12isInDebuggerSbyFZ_0() & 1;
}

- (void)resume
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  uint64_t v4 = self;
  uint64_t v3 = v2();
  swift_unknownObjectRelease();
  if (!v3) {
    (*(void (**)(void))((swift_isaMask & (uint64_t)v4->super.isa) + 0xD8))();
  }
}

- (void)addWithNamed:(id)a3 watcher:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  KTWatchdog.add(named:watcher:)(v6, v8, (uint64_t)sub_1000FB804, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (id)checkWatchDogs
{
  uint64_t v3 = type metadata accessor for DispatchPredicate();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd10KTWatchdog_workQueue);
  void *v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  uint64_t v8 = self;
  id v9 = v7;
  LOBYTE(self) = _dispatchPreconditionTest(_:)();
  id result = (id)(*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if (self)
  {
    uint64_t v11 = (*(uint64_t (**)(id))((swift_isaMask & (uint64_t)v8->super.isa) + 0x88))(result);
    v12 = v8;
    sub_1000FB3E4((uint64_t)_swiftEmptyArrayStorage, v11, v12);
    swift_bridgeObjectRelease();

    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return v13.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)runWatchDog
{
  v2 = self;
  sub_1000F9368();
}

- (void)stopWatchDog
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  uint64_t v3 = self;
  if (v2())
  {
    swift_getObjectType();
    OS_dispatch_source.cancel()();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC13transparencyd10KTWatchdog)init
{
  id result = (_TtC13transparencyd10KTWatchdog *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13transparencyd10KTWatchdog_log;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC13transparencyd10KTWatchdog_pending;
  uint64_t v6 = sub_100080E08(&qword_1003222F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end