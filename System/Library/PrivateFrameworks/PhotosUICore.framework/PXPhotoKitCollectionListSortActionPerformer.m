@interface PXPhotoKitCollectionListSortActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (int64_t)menuActionStateForCollectionList:(id)a3 actionType:(id)a4;
- (_TtC12PhotosUICore43PXPhotoKitCollectionListSortActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitCollectionListSortActionPerformer

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return objc_msgSend(a3, sel_px_isSharedAlbum) ^ 1;
}

- (void)performBackgroundTask
{
  v2 = self;
  sub_1AA574354();
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  id v8 = a4;
  sub_1AA574B24(v5, v7);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (int64_t)menuActionStateForCollectionList:(id)a3 actionType:(id)a4
{
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  swift_getObjCClassMetadata();
  id v8 = a3;
  int64_t v9 = sub_1AA5747F0(a3, v5, v7);

  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC12PhotosUICore43PXPhotoKitCollectionListSortActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  sub_1AB23A76C();
  type metadata accessor for PXActionParameterKey(0);
  sub_1A9BF9C7C((unint64_t *)&unk_1E9832F30);
  sub_1AB23A4DC();
  id v7 = a4;
  id v8 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  int64_t v9 = (void *)sub_1AB23A4CC();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PXPhotoKitCollectionListSortActionPerformer();
  uint64_t v10 = [(PXPhotoKitCollectionListActionPerformer *)&v12 initWithActionType:v8 collectionList:v7 parameters:v9];

  return v10;
}

@end