@interface CRLCommandSetFreehandDrawingShapeItemPKData
- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)init;
- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)initWithFreehandDrawingShapeItem:(id)a3 strokePathCompactData:(id)a4 maskPath:(id)a5;
- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)initWithId:(id)a3 strokePathCompactData:(id)a4 maskPath:(id)a5;
@end

@implementation CRLCommandSetFreehandDrawingShapeItemPKData

- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)initWithId:(id)a3 strokePathCompactData:(id)a4 maskPath:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  id v12 = a5;
  v13 = (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *)sub_100518560((uint64_t)v10, a4, a5);

  return v13;
}

- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)initWithFreehandDrawingShapeItem:(id)a3 strokePathCompactData:(id)a4 maskPath:(id)a5
{
  v22 = self;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = swift_retain();
  v13(v17);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v19 = [(CRLCommandSetFreehandDrawingShapeItemPKData *)v22 initWithId:isa strokePathCompactData:v15 maskPath:v16];

  return v19;
}

- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)init
{
  result = (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData_strokePathCompactData));
  v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData_maskPath);
}

@end