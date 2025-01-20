@interface PXPhotoKitPlayMovieAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createActivityWithActionManager:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)shouldExitSelectModeForState:(unint64_t)a3;
- (PXPhotoKitPlayMovieAssetActionPerformer)initWithActionType:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitPlayMovieAssetActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = _s12PhotosUICore37PhotoKitPlayMovieAssetActionPerformerC10canPerform4with6person11socialGroupSbSo19PXSelectionSnapshotC_So8PHPersonCSgSo08PHSocialO0CSgtFZ_0(v7);

  return v10 & 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return 1;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4 = a4;
  v5 = (void *)sub_1AB23A72C();
  id v6 = PXLocalizedString(v5);

  sub_1AB23A76C();
  id v7 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  v3 = (void *)sub_1AB23A72C();
  return v3;
}

+ (id)createActivityWithActionManager:(id)a3
{
  id v3 = _s12PhotosUICore37PhotoKitPlayMovieAssetActionPerformerC14createActivity4withSo10PXActivityCSgSo07PXPhotodgH7ManagerC_tFZ_0();
  return v3;
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return 0;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA014520();
}

- (PXPhotoKitPlayMovieAssetActionPerformer)initWithActionType:(id)a3
{
  sub_1AB23A76C();
  id v4 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotoKitPlayMovieAssetActionPerformer();
  v5 = [(PXActionPerformer *)&v7 initWithActionType:v4];

  return v5;
}

@end