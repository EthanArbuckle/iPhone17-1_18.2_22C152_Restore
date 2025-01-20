@interface CRLCommandSetImageItemGeometry
- (CRLCanvasInfoGeometry)imageGeometry;
- (CRLCanvasInfoGeometry)maskGeometry;
- (CRLPathSource)maskPathSource;
- (NSUUID)id;
- (_TtC8Freeform30CRLCommandSetImageItemGeometry)init;
- (_TtC8Freeform30CRLCommandSetImageItemGeometry)initWithId:(id)a3 imageGeometry:(id)a4 maskGeometry:(id)a5 maskPathSource:(id)a6;
- (_TtC8Freeform30CRLCommandSetImageItemGeometry)initWithImageItem:(id)a3 imageGeometry:(id)a4 maskGeometry:(id)a5 maskPathSource:(id)a6;
@end

@implementation CRLCommandSetImageItemGeometry

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (CRLCanvasInfoGeometry)imageGeometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_imageGeometry));
}

- (CRLCanvasInfoGeometry)maskGeometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskGeometry));
}

- (CRLPathSource)maskPathSource
{
  return (CRLPathSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskPathSource));
}

- (_TtC8Freeform30CRLCommandSetImageItemGeometry)initWithId:(id)a3 imageGeometry:(id)a4 maskGeometry:(id)a5 maskPathSource:(id)a6
{
  uint64_t v9 = type metadata accessor for UUID();
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (_TtC8Freeform30CRLCommandSetImageItemGeometry *)sub_1007A5478((uint64_t)v12, a4, a5, a6);

  return v16;
}

- (_TtC8Freeform30CRLCommandSetImageItemGeometry)initWithImageItem:(id)a3 imageGeometry:(id)a4 maskGeometry:(id)a5 maskPathSource:(id)a6
{
  uint64_t v9 = (char *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  return (_TtC8Freeform30CRLCommandSetImageItemGeometry *)sub_1007A4D00(v9, a4, a5, a6);
}

- (_TtC8Freeform30CRLCommandSetImageItemGeometry)init
{
  result = (_TtC8Freeform30CRLCommandSetImageItemGeometry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_imageGeometry));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskGeometry));
  v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskPathSource);
}

@end