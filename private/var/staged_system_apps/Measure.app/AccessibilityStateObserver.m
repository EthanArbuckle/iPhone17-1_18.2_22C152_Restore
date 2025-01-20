@interface AccessibilityStateObserver
+ (_TtC7Measure26AccessibilityStateObserver)shared;
+ (void)setShared:(id)a3;
- (BOOL)isModeForMeasuring;
- (NSArray)orderedWorldLineIDs;
- (NSDictionary)worldLines;
- (NSDictionary)worldPoints;
- (NSDictionary)worldRectangles;
- (NSString)snapDivisionsDescription;
- (NSString)snapDivisionsLineID;
- (_TtC7Measure26AccessibilityStateObserver)init;
- (int64_t)snapWorldPointType;
@end

@implementation AccessibilityStateObserver

+ (_TtC7Measure26AccessibilityStateObserver)shared
{
  if (qword_1004C2E58 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1004F8638;

  return (_TtC7Measure26AccessibilityStateObserver *)v2;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1004C2E58;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_1004F8638;
  qword_1004F8638 = (uint64_t)v4;
}

- (_TtC7Measure26AccessibilityStateObserver)init
{
  uint64_t v3 = OBJC_IVAR____TtC7Measure26AccessibilityStateObserver_implementation;
  type metadata accessor for AccessibilityStateObserverBridge();
  swift_allocObject();
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1001C9A00();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AccessibilityStateObserver();
  v5 = [(AccessibilityStateObserver *)&v7 init];
  (*(void **)((char *)&v5->super.isa + OBJC_IVAR____TtC7Measure26AccessibilityStateObserver_implementation))[9] = &off_100492AD8;
  swift_unknownObjectWeakAssign();
  return v5;
}

- (int64_t)snapWorldPointType
{
  v2 = self;
  int64_t v3 = sub_1001CA24C();

  return v3;
}

- (NSString)snapDivisionsDescription
{
  return (NSString *)sub_1001CA608(self, (uint64_t)a2, (void (*)(void))sub_1001CA32C);
}

- (NSString)snapDivisionsLineID
{
  return (NSString *)sub_1001CA608(self, (uint64_t)a2, (void (*)(void))sub_1001CA688);
}

- (BOOL)isModeForMeasuring
{
  return 1;
}

- (NSDictionary)worldLines
{
  uint64_t v2 = qword_1004C29D8;
  result = self;
  id v4 = result;
  if (v2 != -1) {
    result = (NSDictionary *)swift_once();
  }
  if (qword_1004F7FF0)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();

    type metadata accessor for WorldLine();
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (NSDictionary *)v5.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSDictionary)worldPoints
{
  uint64_t v2 = qword_1004C29D8;
  result = self;
  id v4 = result;
  if (v2 != -1) {
    result = (NSDictionary *)swift_once();
  }
  if (qword_1004F7FF0)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();

    type metadata accessor for WorldPoint();
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (NSDictionary *)v5.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSDictionary)worldRectangles
{
  uint64_t v2 = self;
  sub_1001CA9B8();

  type metadata accessor for WorldRectangle();
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

- (NSArray)orderedWorldLineIDs
{
  uint64_t v2 = qword_1004C29D8;
  result = self;
  id v4 = result;
  if (v2 != -1) {
    result = (NSArray *)swift_once();
  }
  if (qword_1004F7FF0)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();

    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (NSArray *)v5.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end