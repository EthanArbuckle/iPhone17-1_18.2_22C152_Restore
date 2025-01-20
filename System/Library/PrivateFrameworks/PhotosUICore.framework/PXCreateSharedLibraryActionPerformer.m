@interface PXCreateSharedLibraryActionPerformer
- (PXCreateSharedLibraryActionPerformer)initWithSharedLibraryStatusProvider:(id)a3;
- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor;
- (PXSharedLibraryStatusProvider)statusProvider;
- (void)assistantController:(id)a3 completedWithError:(id)a4;
- (void)performActionWithLegacyDevicesFallbackMonitor:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5;
- (void)performUserInteractionTask;
- (void)setLegacyDevicesFallbackMonitor:(id)a3;
@end

@implementation PXCreateSharedLibraryActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)setLegacyDevicesFallbackMonitor:(id)a3
{
}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (void)assistantController:(id)a3 completedWithError:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 setDelegate:0];
  v9 = [v7 context];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v22);
    v23 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXCreateSharedLibraryActionPerformer.m", 99, @"%@ should be an instance inheriting from %@, but it is %@", @"assistantController.context", v21, v23 object file lineNumber description];
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXCreateSharedLibraryActionPerformer.m", 99, @"%@ should be an instance inheriting from %@, but it is nil", @"assistantController.context", v21 object file lineNumber description];
  }

LABEL_3:
  if (v8)
  {
    if (PXAssistantIsUserCanceledError(v8))
    {
      v10 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Setup assistant cancelled by the user for context: %@", buf, 0xCu);
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke;
      v32[3] = &unk_1E5DD32A8;
      v32[4] = self;
      id v33 = v8;
      [(PXActionPerformer *)self dismissViewController:v7 completionHandler:v32];
      v11 = v33;
LABEL_21:

      goto LABEL_22;
    }
    if ([v8 code] != -1002)
    {
      v17 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v9;
        __int16 v36 = 2112;
        id v37 = v8;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Setup assistant failed for context: %@, error: %@", buf, 0x16u);
      }

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_226;
      v25[3] = &unk_1E5DD32A8;
      v25[4] = self;
      id v26 = v8;
      [(PXActionPerformer *)self dismissViewController:v7 completionHandler:v25];
      v11 = v26;
      goto LABEL_21;
    }
    v13 = [(PXCreateSharedLibraryActionPerformer *)self statusProvider];
    v14 = [v13 fetchSharedLibrary];
    if (v14 || ([v13 fetchPreview], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "Setup assistant cancelled by the user calling for destruction of progress for context: %@", buf, 0xCu);
      }

      v16 = [(PXActionPerformer *)self presentationEnvironment];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_223;
      v29[3] = &unk_1E5DD1CD8;
      v29[4] = self;
      id v30 = v7;
      id v31 = v8;
      _ExitSharedLibraryOrPreview(v14, 0, 1, v16, @"PXCreateSharedLibraryActionPerformer", v29);
    }
    else
    {
      v18 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "Setup assistant cancelled by the user with destruction of progress, but no preview library could be found to delete.", buf, 2u);
      }

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_225;
      v27[3] = &unk_1E5DD32A8;
      v27[4] = self;
      id v28 = v8;
      [(PXActionPerformer *)self dismissViewController:v7 completionHandler:v27];
    }
  }
  else
  {
    v12 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Setup assistant completed for context: %@", buf, 0xCu);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_227;
    v24[3] = &unk_1E5DD36F8;
    v24[4] = self;
    [(PXActionPerformer *)self dismissViewController:v7 completionHandler:v24];
  }
LABEL_22:
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

void __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_223(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_2;
  v3[3] = &unk_1E5DD32A8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 dismissViewController:v2 completionHandler:v3];
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_225(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_226(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_227(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __79__PXCreateSharedLibraryActionPerformer_assistantController_completedWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

- (void)performUserInteractionTask
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCreateSharedLibraryActionPerformer *)self statusProvider];
  uint64_t v4 = [v3 fetchSharedLibrary];
  uint64_t v5 = [v3 fetchExiting];
  if (v4 | v5) {
    PXAssertGetLog();
  }
  v6 = [v3 fetchPreview];
  id v7 = v6;
  if (v6
    && ([v6 owner],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isCurrentUser],
        v8,
        (v9 & 1) == 0))
  {
    v11 = [(PXCreateSharedLibraryActionPerformer *)self legacyDevicesFallbackMonitor];
    v13 = +[PXSharedLibraryAssistantContext replyAssistantContextWithSharedLibraryStatusProvider:v3 sharedLibrary:v7 legacyDevicesFallbackMonitor:v11];
  }
  else
  {
    if (_os_feature_enabled_impl()) {
      objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    }
    else {
    v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
    }
    v11 = [[PXSharedLibrarySourceLibraryInfoPhotoKit alloc] initWithPhotoLibrary:v10];

    v12 = [(PXCreateSharedLibraryActionPerformer *)self legacyDevicesFallbackMonitor];
    v13 = +[PXSharedLibraryAssistantContext setupAssistantContextWithSharedLibraryStatusProvider:v3 sharedLibrary:v7 sourceLibraryInfo:v11 legacyDevicesFallbackMonitor:v12];
  }
  v14 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Present setup assistant with context: %@", (uint8_t *)&v16, 0xCu);
  }

  v15 = [[PXAssistantController alloc] initWithContext:v13];
  [(PXAssistantController *)v15 setDelegate:self];
  if (![(PXActionPerformer *)self presentViewController:v15]) {
    PXAssertGetLog();
  }
}

- (void)performActionWithLegacyDevicesFallbackMonitor:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCreateSharedLibraryActionPerformer.m", 50, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];
  }
  [(PXCreateSharedLibraryActionPerformer *)self setLegacyDevicesFallbackMonitor:v9];
  [(PXActionPerformer *)self setPresentationEnvironment:v10];
  v13.receiver = self;
  v13.super_class = (Class)PXCreateSharedLibraryActionPerformer;
  [(PXActionPerformer *)&v13 performActionWithCompletionHandler:v11];
}

- (PXCreateSharedLibraryActionPerformer)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v10.receiver = self;
  v10.super_class = (Class)PXCreateSharedLibraryActionPerformer;
  id v8 = [(PXActionPerformer *)&v10 initWithActionType:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_statusProvider, a3);
  }

  return v8;
}

@end