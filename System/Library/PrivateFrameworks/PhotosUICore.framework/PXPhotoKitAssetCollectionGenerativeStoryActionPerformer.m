@interface PXPhotoKitAssetCollectionGenerativeStoryActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
- (PXPhotoKitAssetCollectionGenerativeStoryActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionGenerativeStoryActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  char v6 = sub_1A9EFC56C(v5, a4);

  swift_unknownObjectRelease();
  return v6 & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5 = (void *)sub_1AB23A72C();
  return v5;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1A9EFB574();
}

- (PXPhotoKitAssetCollectionGenerativeStoryActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  sub_1AB23A76C();
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PhotoKitAssetCollectionGenerativeStoryActionPerformer();
  v11 = [(PXAssetCollectionActionPerformer *)&v13 initWithActionType:v10 assetCollectionReference:v8 displayTitleInfo:v9];

  return v11;
}

@end