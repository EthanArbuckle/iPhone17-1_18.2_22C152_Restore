@interface CRLCommandGroup
- (BOOL)committed;
- (BOOL)isEmpty;
- (BOOL)supportsSimultaneousExecutionWithOtherCommands;
- (NSArray)commands;
- (NSString)actionString;
- (_TtC8Freeform15CRLCommandGroup)init;
- (_TtC8Freeform15CRLCommandGroup)initWithCommands:(id)a3;
- (void)addCommand:(id)a3;
- (void)addCommandIfNotNil:(id)a3;
- (void)addCommands:(id)a3;
- (void)setActionString:(id)a3;
- (void)setCommands:(id)a3;
@end

@implementation CRLCommandGroup

- (BOOL)committed
{
  v2 = self;
  char v3 = sub_1008553C0();

  return v3 & 1;
}

- (NSArray)commands
{
  swift_beginAccess();
  type metadata accessor for CRLCommand();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setCommands:(id)a3
{
  type metadata accessor for CRLCommand();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC8Freeform15CRLCommandGroup)initWithCommands:(id)a3
{
  type metadata accessor for CRLCommand();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = [(CRLCommandGroup *)self init];
  v6 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
  swift_beginAccess();
  uint64_t *v6 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)actionString
{
  NSArray v2 = self;
  sub_10085521C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setActionString:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup__actionString);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (BOOL)supportsSimultaneousExecutionWithOtherCommands
{
  NSArray v2 = self;
  BOOL v3 = sub_100855948();

  return v3;
}

- (BOOL)isEmpty
{
  NSArray v2 = self;
  char v3 = sub_100855AD8();

  return v3 & 1;
}

- (void)addCommandIfNotNil:(id)a3
{
  if (a3)
  {
    v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
    swift_beginAccess();
    id v6 = a3;
    v7 = self;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
  }
}

- (void)addCommand:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
  swift_beginAccess();
  id v6 = a3;
  v7 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
}

- (void)addCommands:(id)a3
{
  type metadata accessor for CRLCommand();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  uint64_t v4 = self;
  unint64_t v5 = swift_bridgeObjectRetain();
  sub_1006E1FE0(v5);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform15CRLCommandGroup)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands) = (Class)_swiftEmptyArrayStorage;
  char v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup__actionString);
  uint64_t v4 = (objc_class *)type metadata accessor for CRLCommandGroup();
  *char v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(CRLCommand *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end