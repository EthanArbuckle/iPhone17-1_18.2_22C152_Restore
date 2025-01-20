@interface AccessoryDelegateTrampoline
- (_TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline)init;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4;
@end

@implementation AccessoryDelegateTrampoline

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (a6) {
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v13 = self;
  sub_1008FD2EC(v9, v11, a4, v12, (uint64_t)a6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)accessoryConnectionDetached:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1008FDAB0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = 0;
  uint64_t v8 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  uint64_t v9 = self;
  sub_1008FE080(v6, v8, v4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for UUID();
  __chkstk_darwin(v4 - 8);
  swift_weakInit();
  uint64_t v5 = OBJC_IVAR____TtC12searchpartydP33_8DF307D51982B56654A13C398BADC9D727AccessoryDelegateTrampoline_workItemQueue;
  type metadata accessor for WorkItemQueue();
  uint64_t v6 = self;
  UUID.init()();
  *(Class *)((char *)&self->super.isa + v5) = (Class)WorkItemQueue.__allocating_init(name:identifier:)();

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(AccessoryDelegateTrampoline *)&v8 init];
}

- (void).cxx_destruct
{
  swift_weakDestroy();

  swift_release();
}

@end