@interface CRLCommandSetAccessibilityDescription
- (NSString)accessibilityDescription;
- (NSUUID)id;
- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)init;
- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)initWithBoardItem:(id)a3 accessibilityDescription:(id)a4;
- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)initWithId:(id)a3 accessibilityDescription:(id)a4;
@end

@implementation CRLCommandSetAccessibilityDescription

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (NSString)accessibilityDescription
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)initWithId:(id)a3 accessibilityDescription:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_id, v9, v5);
  v13 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_accessibilityDescription);
  uint64_t *v13 = v10;
  v13[1] = v12;
  v14 = (objc_class *)type metadata accessor for CRLCommandSetAccessibilityDescription();
  v17.receiver = self;
  v17.super_class = v14;
  v15 = [(CRLCommand *)&v17 init];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v15;
}

- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)initWithBoardItem:(id)a3 accessibilityDescription:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = *(void (**)(void))((swift_isaMask & *(void *)a3) + 0x88);
  id v12 = a3;
  v11();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v15 = [(CRLCommandSetAccessibilityDescription *)self initWithId:isa accessibilityDescription:v14];

  return v15;
}

- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)init
{
  result = (_TtC8Freeform37CRLCommandSetAccessibilityDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v2 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_id;
  uint64_t v3 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end