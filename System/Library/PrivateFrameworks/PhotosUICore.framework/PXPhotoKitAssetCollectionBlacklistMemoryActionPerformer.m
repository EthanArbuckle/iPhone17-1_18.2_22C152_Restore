@interface PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (BOOL)_didUserConfirmDeleteOfMemory;
- (BOOL)_doesUserActionRequireDisambiguation:(id)a3 outResolvedAction:(id *)a4 outAlertActionsForDisambiguation:(id *)a5 alertActionHandler:(id)a6;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer

- (void)performBackgroundTask
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer *)self _didUserConfirmDeleteOfMemory])
  {
    v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v5 = +[PXMemoriesRelatedSettings sharedInstance];
        uint64_t v6 = [v5 deleteBehavior];

        v7 = PLMemoriesGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = @"delete";
          if (v6 != 1) {
            v8 = 0;
          }
          if (!v6) {
            v8 = @"reject";
          }
          v9 = v8;
          *(_DWORD *)buf = 138412546;
          v27 = v9;
          __int16 v28 = 2112;
          v29 = v4;
          _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Will %@ memory: %@", buf, 0x16u);
        }
        if (v6 == 1)
        {
          v12 = [[PXDeleteCollectionsAction alloc] initWithCollection:v4];
        }
        else if (v6)
        {
          v12 = 0;
        }
        else
        {
          v10 = [PXRejectMemoriesAction alloc];
          v25 = v4;
          v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
          v12 = [(PXMemoriesAction *)v10 initWithMemories:v11];

          [(PXDeleteCollectionsAction *)v12 setRejectReason:1];
        }
        v13 = [(PXActionPerformer *)self undoManager];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __80__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performBackgroundTask__block_invoke;
        v21[3] = &unk_1E5DC63E8;
        id v22 = v4;
        v23 = self;
        uint64_t v24 = v6;
        id v14 = v4;
        [(PXAction *)v12 executeWithUndoManager:v13 completionHandler:v21];

        return;
      }
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v18);
      v19 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v15 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1312, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v17, v19 object file lineNumber description];
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v15 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1312, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v17 object file lineNumber description];
    }

    goto LABEL_4;
  }
  if ([(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self isBlockingMemoryFeature])
  {
    id v20 = [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self userResponse];
    -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer applyBlacklistFeatureWithActionType:](self, "applyBlacklistFeatureWithActionType:");
  }
  else
  {
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:0];
  }
}

void __80__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v7 = *MEMORY[0x1E4F56548];
    v40[0] = *(void *)(a1 + 32);
    uint64_t v8 = *MEMORY[0x1E4F56560];
    v39[0] = v7;
    v39[1] = v8;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v40[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    [v6 sendEvent:@"com.apple.photos.CPAnalytics.assetCollectionBlocked" withPayload:v11];

    v12 = (void *)MEMORY[0x1E4F56658];
    uint64_t v13 = *(void *)(a1 + 32);
    v37[1] = v8;
    v38[0] = v13;
    v37[0] = v7;
    id v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v38[1] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    [v12 sendEvent:@"com.apple.photos.CPAnalytics.userFeedback.negative.memoryFeature.none" withPayload:v16];

    v17 = PLMemoriesGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 48);
      v19 = @"delete";
      if (v18 != 1) {
        v19 = 0;
      }
      if (v18) {
        id v20 = v19;
      }
      else {
        id v20 = @"reject";
      }
      v21 = v20;
      uint64_t v22 = *(void *)(a1 + 32);
      int v31 = 138412546;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v22;
      v23 = "Did %@ memory: %@";
      uint64_t v24 = v17;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      uint32_t v26 = 22;
LABEL_16:
      _os_log_impl(&dword_1A9AE7000, v24, v25, v23, (uint8_t *)&v31, v26);
    }
  }
  else
  {
    v17 = PLMemoriesGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 48);
      __int16 v28 = @"delete";
      if (v27 != 1) {
        __int16 v28 = 0;
      }
      if (v27) {
        v29 = v28;
      }
      else {
        v29 = @"reject";
      }
      v21 = v29;
      uint64_t v30 = *(void *)(a1 + 32);
      int v31 = 138412802;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v30;
      __int16 v35 = 2112;
      id v36 = v5;
      v23 = "Failed to %@ memory: %@, error: %@";
      uint64_t v24 = v17;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      uint32_t v26 = 32;
      goto LABEL_16;
    }
  }

  [*(id *)(a1 + 40) completeBackgroundTaskWithSuccess:a2 error:v5];
}

- (BOOL)_didUserConfirmDeleteOfMemory
{
  v2 = [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self userResponse];
  char v3 = [v2 isEqualToString:@"PXAssetCollectionActionTypeBlockMemory"];

  return v3;
}

- (void)performUserInteractionTask
{
  char v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5DD36F8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  id v5 = [(PXActionPerformer *)self actionType];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_2;
  v21[3] = &unk_1E5DB51E8;
  void v21[4] = self;
  id v6 = v3;
  id v22 = v6;
  id v7 = v5;
  id v23 = v7;
  id v8 = v4;
  id v24 = v8;
  v9 = (void (**)(void *, id))_Block_copy(v21);
  id v19 = 0;
  id v20 = 0;
  BOOL v10 = [(PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer *)self _doesUserActionRequireDisambiguation:v7 outResolvedAction:&v20 outAlertActionsForDisambiguation:&v19 alertActionHandler:v9];
  id v11 = v20;
  id v12 = v19;
  if (v10)
  {
    uint64_t v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    [v13 _setActions:v12];
    id v14 = (void *)MEMORY[0x1E4FB1410];
    v15 = PXLocalizedStringFromTable(@"PXBlockConfirmationDialogButtonTitle_Cancel", @"PhotosUICore");
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_3;
    v17[3] = &unk_1E5DCE788;
    id v18 = v8;
    v16 = [v14 actionWithTitle:v15 style:1 handler:v17];
    [v13 addAction:v16];

    [(PXActionPerformer *)self presentViewController:v13];
  }
  else
  {
    v9[2](v9, v11);
  }
}

uint64_t __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

void __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  char v3 = [*(id *)(a1 + 32) _memoryFeatureFromMemory:*(void *)(a1 + 40) forActionType:v5];
  if ([v5 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePerson"])
  {
    [*(id *)(a1 + 32) setIsBlockingMemoryFeature:1];
    [*(id *)(a1 + 32) setUserResponse:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) suggestLessPeopleInMemory:*(void *)(a1 + 40)];
  }
  else if (v5)
  {
    v4 = +[PXMemoriesBlacklistUtilities accessoryUIViewSpecForBlacklistedFeature:v3];
    [*(id *)(a1 + 32) confirmBlacklistingUserAction:v5 viewSpec:v4];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_doesUserActionRequireDisambiguation:(id)a3 outResolvedAction:(id *)a4 outAlertActionsForDisambiguation:(id *)a5 alertActionHandler:(id)a6
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  v19[0] = @"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate";
  v19[1] = @"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval";
  v19[2] = @"PXAssetCollectionActionTypeBlockMemoryFeatureHoliday";
  v19[3] = @"PXAssetCollectionActionTypeBlockMemoryFeaturePlace";
  v19[4] = @"PXAssetCollectionActionTypeBlockMemoryFeaturePerson";
  BOOL v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a3;
  id v12 = [v10 arrayWithObjects:v19 count:5];
  LOBYTE(v10) = [v12 containsObject:v11];

  if (v10)
  {
    BOOL v13 = 0;
  }
  else
  {
    id v14 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    v15 = objc_msgSend(v14, "px_blockableFeatureActions");
    unint64_t v16 = [v15 count];
    BOOL v13 = v16 > 1;
    if (v16 >= 2)
    {
      v9;
      PXMap();
    }
    v17 = [v15 lastObject];
    *a4 = [v17 actionType];
  }
  return v13;
}

id __166__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer__doesUserActionRequireDisambiguation_outResolvedAction_outAlertActionsForDisambiguation_alertActionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4FB1410];
  id v5 = [v3 localizedTitle];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __166__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer__doesUserActionRequireDisambiguation_outResolvedAction_outAlertActionsForDisambiguation_alertActionHandler___block_invoke_2;
  v10[3] = &unk_1E5DC7010;
  id v6 = *(id *)(a1 + 32);
  id v11 = v3;
  id v12 = v6;
  id v7 = v3;
  id v8 = [v4 actionWithTitle:v5 style:0 handler:v10];

  return v8;
}

void __166__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer__doesUserActionRequireDisambiguation_outResolvedAction_outAlertActionsForDisambiguation_alertActionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) actionType];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (BOOL)isActionDestructive
{
  return 0;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeBlockMemory" systemImageName:a5];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"memories.badge.minus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryCardActionMenuItemFeatureLess", @"PhotosUICore");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6 = [a3 assetCollection];
  if (!objc_msgSend(v6, "px_isMemory"))
  {
    char v8 = 0;
    goto LABEL_6;
  }
  id v7 = v6;
  if (!v7)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1206, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v12 object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v13 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v13);
    id v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1206, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v12, v14 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_4:
  char v8 = objc_msgSend(v7, "px_canPerformFeatureLessAction");

LABEL_6:
  return v8;
}

@end