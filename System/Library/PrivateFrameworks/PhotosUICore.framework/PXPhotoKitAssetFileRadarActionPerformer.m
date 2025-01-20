@interface PXPhotoKitAssetFileRadarActionPerformer
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetFileRadarActionPerformer

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  v6 = (void *)MEMORY[0x1E4FB1818];
  id v7 = a3;
  v8 = [v6 systemImageNamed:@"ant"];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v8 style:0 target:v7 action:a4];

  return v9;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v5 = a3;
  v6 = +[PXRootSettings sharedInstance];
  int v7 = [v6 canShowInternalUI];

  if (v7) {
    char v8 = [v5 isAnyItemSelected];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)performUserInteractionTask
{
  v4 = [(PXPhotoKitAssetActionPerformer *)self radarConfigurationProvider];
  if (!v4)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPhotoKitAssetFileRadarActionPerformer.m", 36, @"Invalid parameter not satisfying: %@", @"radarConfigurationProvider" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5DB0C38;
  id v5 = v4;
  v17 = self;
  SEL v18 = a2;
  id v16 = v5;
  v6 = _Block_copy(aBlock);
  char v7 = [v5 includeAssetImages];
  int v8 = [v5 includeAssetThumbnails];
  if ((v7 & 1) != 0 || v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_5;
    v12[3] = &unk_1E5DB0C60;
    v12[4] = self;
    char v14 = v8;
    id v13 = v6;
    v9 = +[PXFeedbackTapToRadarUtilities alertControllerWithInternalReleaseAgreementAndCompletion:v12];
    if (![(PXActionPerformer *)self presentViewController:v9])
    {
      v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present the TTR internal release agreement");
      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v10];
    }
  }
  else
  {
    (*((void (**)(void *, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);
  }
}

void __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = a2;
  int v8 = [v5 radarConfiguration];
  if (!v8)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[6], a1[5], @"PXPhotoKitAssetFileRadarActionPerformer.m", 40, @"Invalid parameter not satisfying: %@", @"radarConfiguration" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_2;
  v19[3] = &unk_1E5DB0C10;
  id v9 = v8;
  id v20 = v9;
  [v7 enumerateObjectsUsingBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_3;
  v17[3] = &unk_1E5DB0C10;
  id v18 = v9;
  id v10 = v9;
  [v6 enumerateObjectsUsingBlock:v17];

  uint64_t v11 = [v7 count];
  [v10 setAttachmentsIncludeAnyUserAsset:v11 != 0];
  v12 = [v10 completionHandler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_4;
  v15[3] = &unk_1E5DD2B90;
  v15[4] = a1[5];
  id v16 = v12;
  id v13 = v12;
  [v10 setCompletionHandler:v15];
  PXFileRadarWithConfiguration(v10);
}

void __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = [v3 selectionSnapshot];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v7 = *(unsigned char *)(a1 + 48);
    id v8 = v5;
    id v9 = v6;
    id v10 = v4;
    uint64_t v11 = [v10 dataSource];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v12 = [v10 selectedIndexPaths];

        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = ___AssetAttachmentsForSelection_block_invoke;
        v22[3] = &unk_1E5DB0C88;
        char v26 = v7;
        id v23 = v11;
        id v24 = v8;
        id v25 = v9;
        id v13 = v11;
        id v14 = v8;
        id v15 = v9;
        [v12 enumerateItemIndexPathsUsingBlock:v22];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        return;
      }
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void _AssetAttachmentsForSelection(PXSelectionSnapshot *__strong, NSMutableArray<NSURL *> *__strong, NSMutableArray<NSURL *> *__strong, BOOL)");
      id v20 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v20);
      v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v16 handleFailureInFunction:v17, @"PXPhotoKitAssetFileRadarActionPerformer.m", 103, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v19, v21 file lineNumber description];
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void _AssetAttachmentsForSelection(PXSelectionSnapshot *__strong, NSMutableArray<NSURL *> *__strong, NSMutableArray<NSURL *> *__strong, BOOL)");
      id v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      [v16 handleFailureInFunction:v17, @"PXPhotoKitAssetFileRadarActionPerformer.m", 103, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v19 file lineNumber description];
    }

    goto LABEL_4;
  }
  [v3 completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addScreenshot:a2];
}

uint64_t __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAttachment:a2];
}

void __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
  if (a2)
  {
    [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to file TTR radar");
    [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

@end