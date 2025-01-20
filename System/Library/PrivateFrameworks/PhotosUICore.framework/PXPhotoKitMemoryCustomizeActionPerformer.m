@interface PXPhotoKitMemoryCustomizeActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (_TtC12PhotosUICore40PXPhotoKitMemoryCustomizeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitMemoryCustomizeActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  id v5 = objc_msgSend(v4, sel_assetCollection);
  self;
  BOOL v6 = swift_dynamicCastObjCClass() != 0;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v6;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA5BC870();
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5 = a4;
  swift_unknownObjectRetain();
  BOOL v6 = (void *)sub_1AB23A72C();
  id v7 = PXLocalizedString(v6);

  sub_1AB23A76C();
  swift_unknownObjectRelease();

  v8 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = (void *)sub_1AB23A72C();
  return v4;
}

- (_TtC12PhotosUICore40PXPhotoKitMemoryCustomizeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  sub_1AB23A76C();
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PXPhotoKitMemoryCustomizeActionPerformer();
  v11 = [(PXAssetCollectionActionPerformer *)&v13 initWithActionType:v10 assetCollectionReference:v8 displayTitleInfo:v9];

  return v11;
}

@end