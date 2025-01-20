@interface CRLCommandSetFreehandDrawingShapeItemSnappedShapeType
- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)init;
- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)initWithFreehandDrawingShapeItem:(id)a3 snappedShapeType:(int64_t)a4;
- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)initWithId:(id)a3 snappedShapeType:(int64_t)a4;
@end

@implementation CRLCommandSetFreehandDrawingShapeItemSnappedShapeType

- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)initWithId:(id)a3 snappedShapeType:(int64_t)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR____TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType_id, v10, v6);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType_snappedShapeType) = (Class)a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandSetFreehandDrawingShapeItemSnappedShapeType();
  v14.receiver = self;
  v14.super_class = v11;
  v12 = [(CRLCommand *)&v14 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v12;
}

- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)initWithFreehandDrawingShapeItem:(id)a3 snappedShapeType:(int64_t)a4
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v13 = a3;
  uint64_t v14 = swift_retain();
  v12(v14);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v16 = [(CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *)self initWithId:isa snappedShapeType:a4];

  return v16;
}

- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)init
{
  result = (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType_id;
  uint64_t v3 = type metadata accessor for UUID();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end