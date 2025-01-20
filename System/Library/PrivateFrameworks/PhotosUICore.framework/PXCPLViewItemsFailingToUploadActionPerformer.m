@interface PXCPLViewItemsFailingToUploadActionPerformer
- (void)performUserInteractionTask;
@end

@implementation PXCPLViewItemsFailingToUploadActionPerformer

- (void)performUserInteractionTask
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v7) = 138543362;
    *(void *)((char *)&v7 + 4) = @"FailedToUploadItemsAlbum";
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Will navigate to: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  *(void *)&long long v7 = MEMORY[0x1E4F143A8];
  *((void *)&v7 + 1) = 3221225472;
  v8 = ___NavigateToCollection_block_invoke;
  v9 = &unk_1E5DD2570;
  v10 = @"FailedToUploadItemsAlbum";
  id v11 = v3;
  id v6 = v3;
  objc_msgSend(v5, "px_navigateToCollectionSubtype:completionHandler:", 216, &v7);
}

@end