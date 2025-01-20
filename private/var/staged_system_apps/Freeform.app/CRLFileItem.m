@interface CRLFileItem
- (BOOL)isPreviewable;
- (BOOL)isSelectable;
- (BOOL)isShareable;
- (BOOL)placeHolderDataNeedsDownload;
- (BOOL)shouldCacheBackingAssetOnCopy;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem;
- (NSString)previewTooltip;
- (NSURL)url;
- (_TtC8Freeform8CRLAsset)metadataPayload;
- (id)promisedDataForPublicType:(id)a3;
- (void)updateGeometryToReplaceBoardItem:(id)a3;
@end

@implementation CRLFileItem

- (NSURL)url
{
  uint64_t v3 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_100A5AE04(v6);

  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSURL *)v11;
}

- (_TtC8Freeform8CRLAsset)metadataPayload
{
  v2 = self;
  Class v3 = sub_100A5B0AC();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (NSString)previewTooltip
{
  sub_100A5DD84();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  type metadata accessor for CRLFileLayout();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  type metadata accessor for CRLFileRep();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  type metadata accessor for CRLFileEditor();

  return (Class)swift_getObjCClassFromMetadata();
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  uint64_t v2 = self;
  sub_100A5D570();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v12 = sub_100BE7384((uint64_t)v9);
  unint64_t v14 = v13;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  if (v14 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100514260(v12, v14);
  }

  return isa;
}

- (void)updateGeometryToReplaceBoardItem:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  sub_100A5D88C(v4);
}

- (BOOL)placeHolderDataNeedsDownload
{
  uint64_t v2 = self;
  Class v3 = sub_100A5B0AC();
  uint64_t v4 = *(void *)((char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24);
  uint64_t v5 = *(void *)((char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 32);
  sub_10050F848((Class)((char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v4);
  char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 64))(v4, v5);

  return v6 & 1;
}

- (void).cxx_destruct
{
}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 1;
}

@end