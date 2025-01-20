@interface CRLCommandReplaceImageWithImageSubject
- (BOOL)isBackgroundRemoved;
- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithId:(id)a3 imageData:(id)a4 isBackgroundRemoved:(BOOL)a5 thumbnailData:(id)a6;
- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithId:(id)a3 imageData:(id)a4 thumbnailData:(id)a5;
- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithImageItem:(id)a3 imageData:(id)a4 isBackgroundRemoved:(BOOL)a5 thumbnailData:(id)a6;
- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithImageItem:(id)a3 imageData:(id)a4 thumbnailData:(id)a5;
@end

@implementation CRLCommandReplaceImageWithImageSubject

- (BOOL)isBackgroundRemoved
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8Freeform38CRLCommandReplaceImageWithImageSubject_isBackgroundRemoved);
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithId:(id)a3 imageData:(id)a4 isBackgroundRemoved:(BOOL)a5 thumbnailData:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v16);
  v18 = (char *)&v26 - v17;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform38CRLCommandReplaceImageWithImageSubject_isBackgroundRemoved) = a5;
  v19 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v19(v14, v18, v10);
  v19((char *)self + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_id, v14, v10);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_imageData) = (Class)a4;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_thumbnailData) = (Class)a6;
  v20 = (objc_class *)type metadata accessor for CRLCommandReplaceImage();
  v26.receiver = self;
  v26.super_class = v20;
  id v21 = a4;
  id v22 = a6;
  v23 = [(CRLCommandReplaceImage *)&v26 init];
  v24 = *(void (**)(char *, uint64_t))(v11 + 8);
  v24(v14, v10);
  v24(v18, v10);
  return v23;
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithImageItem:(id)a3 imageData:(id)a4 isBackgroundRemoved:(BOOL)a5 thumbnailData:(id)a6
{
  BOOL v23 = a5;
  id v22 = self;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  uint64_t v18 = swift_retain();
  v14(v18);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v20 = [(CRLCommandReplaceImageWithImageSubject *)v22 initWithId:isa imageData:v16 isBackgroundRemoved:v23 thumbnailData:v17];

  return v20;
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithImageItem:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  id v22 = self;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = swift_retain();
  v13(v17);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v19 = [(CRLCommandReplaceImageWithImageSubject *)v22 initWithId:isa imageData:v15 isBackgroundRemoved:0 thumbnailData:v16];

  return v19;
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithId:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  __chkstk_darwin(v7 - 8, v8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a4;
  id v10 = a5;
  result = (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end