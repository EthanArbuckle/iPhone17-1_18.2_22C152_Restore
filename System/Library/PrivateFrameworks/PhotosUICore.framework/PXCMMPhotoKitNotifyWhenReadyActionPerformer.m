@interface PXCMMPhotoKitNotifyWhenReadyActionPerformer
- (void)performBackgroundTask;
@end

@implementation PXCMMPhotoKitNotifyWhenReadyActionPerformer

- (void)performBackgroundTask
{
  v4 = [(PXCMMActionPerformer *)self session];
  v5 = [v4 dataSourceManager];
  v6 = [v5 dataSource];

  if ([v6 numberOfSections] >= 1)
  {
    uint64_t v17 = [v6 identifier];
    long long v18 = xmmword_1AB359AA0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    id v7 = [v6 assetCollectionAtSectionIndexPath:&v17];
    if (v7)
    {
      v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        v14 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
        [v11 handleFailureInMethod:a2, self, @"PXCMMPhotoKitNotifyWhenReadyActionPerformer.m", 28, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assetCollection", v13, v14 object file lineNumber description];
      }
      unint64_t v9 = [v6 numberOfItemsInSection:0];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__PXCMMPhotoKitNotifyWhenReadyActionPerformer_performBackgroundTask__block_invoke;
      v16[3] = &unk_1E5DD3158;
      v16[4] = self;
      PXMomentShareRequestNotificationOnUploadCompletion(v8, v9, v16);

      goto LABEL_10;
    }
    [v6 numberOfItemsInSection:0];
  }
  v10 = PLSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Found no moment share to notify on upload completion", buf, 2u);
  }

  [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
LABEL_10:
}

uint64_t __68__PXCMMPhotoKitNotifyWhenReadyActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

@end