@interface CRLCommandSetImageMedia
- (NSUUID)id;
- (_TtC8Freeform23CRLCommandSetImageMedia)init;
- (_TtC8Freeform23CRLCommandSetImageMedia)initWithId:(id)a3 imageData:(id)a4 thumbnailData:(id)a5;
- (_TtC8Freeform23CRLCommandSetImageMedia)initWithImageItem:(id)a3 imageData:(id)a4 thumbnailData:(id)a5;
- (_TtC8Freeform8CRLAsset)imageData;
- (_TtC8Freeform8CRLAsset)thumbnailData;
@end

@implementation CRLCommandSetImageMedia

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform23CRLCommandSetImageMedia_imageData));
}

- (_TtC8Freeform8CRLAsset)thumbnailData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform23CRLCommandSetImageMedia_thumbnailData));
}

- (_TtC8Freeform23CRLCommandSetImageMedia)initWithId:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)self + OBJC_IVAR____TtC8Freeform23CRLCommandSetImageMedia_id, v12, v8);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLCommandSetImageMedia_imageData) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLCommandSetImageMedia_thumbnailData) = (Class)a5;
  v13 = (objc_class *)type metadata accessor for CRLCommandSetImageMedia();
  v18.receiver = self;
  v18.super_class = v13;
  id v14 = a4;
  id v15 = a5;
  v16 = [(CRLCommand *)&v18 init];
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v16;
}

- (_TtC8Freeform23CRLCommandSetImageMedia)initWithImageItem:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  v22 = self;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v19 = [(CRLCommandSetImageMedia *)v22 initWithId:isa imageData:v15 thumbnailData:v16];

  return v19;
}

- (_TtC8Freeform23CRLCommandSetImageMedia)init
{
  result = (_TtC8Freeform23CRLCommandSetImageMedia *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCommandSetImageMedia_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLCommandSetImageMedia_thumbnailData);
}

@end