@interface PUPXPhotoKitAddStacksActionPerformer
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitAddStacksActionPerformer

- (void)performUserInteractionTask
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  if ((unint64_t)[v3 count] < 2)
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
  else
  {
    v4 = PXMap();
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:45998 userInfo:0];
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [v4 componentsJoinedByString:@", "];
      int v8 = 138543618;
      v9 = v5;
      __int16 v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, "Failed to create stack from assets: %{public}@ assetUUIDs: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v5];
  }
}

uint64_t __66__PUPXPhotoKitAddStacksActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return @"(Internal) Add Stacks";
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F90618] sharedInstance];
  int v7 = [v6 canShowInternalUI];

  if (v7
    && ([MEMORY[0x1E4F90578] sharedInstance],
        int v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 enableStacksReviewUI],
        v8,
        v9))
  {
    __int16 v10 = [v5 selectedIndexPaths];
    BOOL v11 = [v10 count] > 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end