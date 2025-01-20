@interface PXStoryRemoveAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)shouldPreventTargetedDismissalAnimation;
- (void)performUserInteractionTask;
@end

@implementation PXStoryRemoveAssetActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"minus.circle";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryActionTitle_HideFromMemory", @"PhotosUICore");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return a3 != 0;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isAnyItemSelected]
    && ([v8 dataSource],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 containsMultipleItems],
        v11,
        v12))
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___PXStoryRemoveAssetActionPerformer;
    unsigned __int8 v13 = objc_msgSendSuper2(&v15, sel_canPerformWithSelectionSnapshot_person_socialGroup_, v8, v9, v10);
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)performUserInteractionTask
{
  id v6 = [(PXStoryAssetActionPerformer *)self storyViewActionPerformer];
  if (v6)
  {
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
    v5 = [v3 setWithArray:v4];

    [v6 removeAssetsFromCuration:v5];
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (BOOL)shouldPreventTargetedDismissalAnimation
{
  return 1;
}

@end