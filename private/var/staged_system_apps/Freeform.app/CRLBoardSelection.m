@interface CRLBoardSelection
- (BOOL)isEqual:(id)a3;
- (_TtC8Freeform17CRLBoardSelection)init;
- (int64_t)hash;
@end

@implementation CRLBoardSelection

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_100557A70((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_10052E2B0((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for CRLBoardSelection();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }

  BOOL v6 = 1;
LABEL_9:
  sub_10052E2B0((uint64_t)v11);
  return v6;
}

- (int64_t)hash
{
  type metadata accessor for CRLBoardSelection();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v4 = self;
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10052E310();
  int64_t v6 = StringProtocol.hash.getter();

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC8Freeform17CRLBoardSelection)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLBoardSelection();
  return [(CRLBoardSelection *)&v3 init];
}

@end