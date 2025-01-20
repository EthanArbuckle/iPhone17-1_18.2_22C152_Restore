@interface SDDeferrableOperation
- (BOOL)returnHasActiveTimer;
- (SDDeferrableOperation)init;
- (SDDeferrableOperation)initWithIdentifier:(id)a3 queue:(id)a4 operation:(id)a5;
- (id)returnPreventUntilDate;
- (void)addReason:(id)a3;
- (void)pushPreventionDateForReason:(id)a3 newDate:(id)a4;
- (void)removeReason:(id)a3;
- (void)scheduleOperation;
@end

@implementation SDDeferrableOperation

- (SDDeferrableOperation)initWithIdentifier:(id)a3 queue:(id)a4 operation:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  id v11 = a4;
  v12 = (SDDeferrableOperation *)sub_100421BD8(v7, v9, v11, (uint64_t)sub_100421BD0, v10);

  swift_release();
  return v12;
}

- (void)addReason:(id)a3
{
}

- (void)removeReason:(id)a3
{
}

- (void)pushPreventionDateForReason:(id)a3 newDate:(id)a4
{
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  sub_10041CA18(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)scheduleOperation
{
  v2 = self;
  sub_10041DAD0();
}

- (id)returnPreventUntilDate
{
  uint64_t v3 = sub_10000A844((uint64_t *)&unk_100975040);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR___SDDeferrableOperation_preventUntilDate;
  swift_beginAccess();
  sub_10024A330((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_100975040);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return isa;
}

- (BOOL)returnHasActiveTimer
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDDeferrableOperation_mainTimer) != 0;
}

- (SDDeferrableOperation)init
{
  result = (SDDeferrableOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR___SDDeferrableOperation_preventUntilDate, (uint64_t *)&unk_100975040);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end