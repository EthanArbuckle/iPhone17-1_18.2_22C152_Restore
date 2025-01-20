@interface PXPhotoKitTTRForLemonadeCollectionsActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitTTRForLemonadeCollectionsActionPerformer

- (void)performUserInteractionTask
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(PXActionPerformer *)self hostViewController];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if ([v4 isTransient])
  {
    v5 = [v4 localizedTitle];
    v6 = +[PXLemonadeDocumentsUtilities documentsLocalizedTitles];
    uint64_t v7 = [v6 containsObject:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = (void *)MEMORY[0x1E4F38EB8];
  v10 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v11 = [v9 fetchAssetsInAssetCollection:v10 options:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = +[PXFeedbackTapToRadarUtilities detailedDebugDescriptionFileForAsset:](PXFeedbackTapToRadarUtilities, "detailedDebugDescriptionFileForAsset:", *(void *)(*((void *)&v18 + 1) + 8 * v16), (void)v18);
        if (v17) {
          [v8 addObject:v17];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  +[PXTTRWorkflowFactory presentDefaultWorkFlowInViewController:v3 withContext:v7 attachmentFileUrls:v8];
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeFileRadar" systemImageName:a5];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"ant";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXTTRFileRadarTitle", @"PhotosUICore");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = +[PXRootSettings sharedInstance];
  char v5 = [v4 canShowInternalUI];

  return v5;
}

@end