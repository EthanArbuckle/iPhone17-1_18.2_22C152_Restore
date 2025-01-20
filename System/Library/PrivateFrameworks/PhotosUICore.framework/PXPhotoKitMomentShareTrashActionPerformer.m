@interface PXPhotoKitMomentShareTrashActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitMomentShareTrashActionPerformer

- (void)performBackgroundTask
{
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2110, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2110, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v10 object file lineNumber description];
  }

LABEL_3:
  PLSharingGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ActionPerformerTrashMomentShare", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PXPhotoKitMomentShareTrashActionPerformer_performBackgroundTask__block_invoke;
  v13[3] = &unk_1E5DD3158;
  v13[4] = self;
  PXTrashMomentShare(v4, v13);
}

void __66__PXPhotoKitMomentShareTrashActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  PLSharingGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "ActionPerformerTrashMomentShare", " enableTelemetry=YES ", buf, 2u);
    }
  }

  id v8 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __66__PXPhotoKitMomentShareTrashActionPerformer_performBackgroundTask__block_invoke_902(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)performUserInteractionTask
{
  id v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v22);
    v23 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2059, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v21, v23 object file lineNumber description];
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2059, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v21 object file lineNumber description];
  }

LABEL_3:
  v24 = _TrashMomentShareActionTitle(v4);
  uint64_t v5 = objc_msgSend(v4, "px_momentShareType");
  if (!v5)
  {
    os_signpost_id_t v6 = @"PXCMMStopSharingAlertMessage";
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    os_signpost_id_t v6 = @"PXCMMDeclineSharingAlertMessage";
LABEL_7:
    os_signpost_id_t v7 = PXLocalizedStringFromTable(v6, @"PhotosUICore");
    goto LABEL_9;
  }
  os_signpost_id_t v7 = 0;
LABEL_9:
  id v8 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5DD36F8;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_2;
  v30[3] = &unk_1E5DD36F8;
  v30[4] = self;
  v10 = _Block_copy(v30);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_3;
  v29[3] = &unk_1E5DD36F8;
  v29[4] = self;
  v11 = (void (**)(void))_Block_copy(v29);
  v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v7 preferredStyle:0];
  v13 = (void *)MEMORY[0x1E4FB1410];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_4;
  v27[3] = &unk_1E5DCE788;
  id v14 = v9;
  id v28 = v14;
  v15 = [v13 actionWithTitle:v24 style:2 handler:v27];
  [v12 addAction:v15];

  v16 = (void *)MEMORY[0x1E4FB1410];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_5;
  v25[3] = &unk_1E5DCE788;
  id v26 = v10;
  id v17 = v10;
  v18 = [v16 actionWithTitle:v8 style:1 handler:v25];
  [v12 addAction:v18];

  if (![(PXActionPerformer *)self presentViewController:v12]) {
    v11[2](v11);
  }
}

uint64_t __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

void __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [*(id *)(a1 + 32) assetCollection];
  objc_msgSend(v2, "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1001, @"User cancelled action to trash a CMM share: %@", v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:v4];
}

void __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [*(id *)(a1 + 32) assetCollection];
  objc_msgSend(v2, "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"Failed to present confirmation alert to trash a CMM share: %@", v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:v4];
}

uint64_t __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  if (a5) {
    uint64_t v5 = (__CFString *)a5;
  }
  else {
    uint64_t v5 = &stru_1F00B0030;
  }
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeTrashMomentShare" systemImageName:v5];
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"xmark.circle";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  os_signpost_id_t v7 = objc_msgSend(a4, "assetCollection", a3);
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    id v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2038, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2038, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v12 object file lineNumber description];
  }

LABEL_3:
  id v8 = _TrashMomentShareActionTitle(v7);

  return v8;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  os_signpost_id_t v6 = [a3 assetCollection];
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2032, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2032, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  BOOL v7 = [v6 assetCollectionType] == 7;

  return v7;
}

@end