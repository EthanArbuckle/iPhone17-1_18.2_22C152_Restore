@interface PXPhotosGridToggleFaceModeActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleFaceModeActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return 1;
}

- (void)performUserInteractionTask
{
  id v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  [v2 performChanges:&__block_literal_global_55383];
}

void __71__PXPhotosGridToggleFaceModeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setFaceModeEnabled:", objc_msgSend(v2, "isFaceModeEnabled") ^ 1);
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  if ([v3 isFaceModeEnabled]) {
    v4 = @"PXPhotosDetailsBarAssetModeButton";
  }
  else {
    v4 = @"PXPhotosDetailsBarFaceModeButton";
  }
  v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");

  return v5;
}

- (id)activitySystemImageName
{
  return @"face.smiling";
}

- (id)activityType
{
  id v2 = @"PXActivityTypeToggleFaceMode";
  return @"PXActivityTypeToggleFaceMode";
}

@end