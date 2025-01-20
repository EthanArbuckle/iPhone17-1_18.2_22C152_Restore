@interface PXPhotoKitAssetCollectionCustomizeActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (_TtC12PhotosUICore49PXPhotoKitAssetCollectionCustomizeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionCustomizeActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  char v5 = sub_1AA881770(v4);

  swift_unknownObjectRelease();
  return v5 & 1;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA880F54();
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5 = a4;
  swift_unknownObjectRetain();
  sub_1AA881940(v5);
  uint64_t v7 = v6;

  swift_unknownObjectRelease();
  if (v7)
  {
    v8 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  objc_msgSend(objc_msgSend(v4, sel_assetCollection), sel_px_isSharedAlbum);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  id v5 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC12PhotosUICore49PXPhotoKitAssetCollectionCustomizeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  sub_1AB23A76C();
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PXPhotoKitAssetCollectionCustomizeActionPerformer();
  v11 = [(PXAssetCollectionActionPerformer *)&v13 initWithActionType:v10 assetCollectionReference:v8 displayTitleInfo:v9];

  return v11;
}

@end