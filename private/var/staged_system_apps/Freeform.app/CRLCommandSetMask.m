@interface CRLCommandSetMask
- (CRLMaskInfo)maskInfo;
- (NSUUID)id;
- (_TtC8Freeform17CRLCommandSetMask)init;
- (_TtC8Freeform17CRLCommandSetMask)initWithId:(id)a3 maskInfo:(id)a4;
- (_TtC8Freeform17CRLCommandSetMask)initWithImageItem:(id)a3 maskGeometry:(id)a4 maskPath:(id)a5;
- (_TtC8Freeform17CRLCommandSetMask)initWithImageItem:(id)a3 maskInfo:(id)a4;
@end

@implementation CRLCommandSetMask

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (CRLMaskInfo)maskInfo
{
  return (CRLMaskInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_maskInfo));
}

- (_TtC8Freeform17CRLCommandSetMask)initWithId:(id)a3 maskInfo:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_id, v10, v6);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_maskInfo) = (Class)a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandSetMask();
  v15.receiver = self;
  v15.super_class = v11;
  id v12 = a4;
  v13 = [(CRLCommand *)&v15 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (_TtC8Freeform17CRLCommandSetMask)initWithImageItem:(id)a3 maskInfo:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = swift_retain();
  v12(v15);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v17 = [(CRLCommandSetMask *)self initWithId:isa maskInfo:v14];

  return v17;
}

- (_TtC8Freeform17CRLCommandSetMask)initWithImageItem:(id)a3 maskGeometry:(id)a4 maskPath:(id)a5
{
  return (_TtC8Freeform17CRLCommandSetMask *)sub_100B25300((char *)a3, a4, a5);
}

- (_TtC8Freeform17CRLCommandSetMask)init
{
  result = (_TtC8Freeform17CRLCommandSetMask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLCommandSetMask_maskInfo);
}

@end