@interface PXSharedLibraryViewInvitationActionPerformer
- (PXSharedLibrary)invitation;
- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor;
- (PXSharedLibraryStatusProvider)sharedLibrartyStatusProvider;
- (PXSharedLibraryViewInvitationActionPerformer)initWithSharedLibraryStatusProvider:(id)a3;
- (void)assistantController:(id)a3 completedWithError:(id)a4;
- (void)performActionWithInvitation:(id)a3 legacyDevicesFallbackMonitor:(id)a4 presentationEnvironment:(id)a5 completionHandler:(id)a6;
- (void)performUserInteractionTask;
- (void)setInvitation:(id)a3;
- (void)setLegacyDevicesFallbackMonitor:(id)a3;
@end

@implementation PXSharedLibraryViewInvitationActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_sharedLibrartyStatusProvider, 0);
}

- (void)setLegacyDevicesFallbackMonitor:(id)a3
{
}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (void)setInvitation:(id)a3
{
}

- (PXSharedLibrary)invitation
{
  return self->_invitation;
}

- (PXSharedLibraryStatusProvider)sharedLibrartyStatusProvider
{
  return self->_sharedLibrartyStatusProvider;
}

- (void)assistantController:(id)a3 completedWithError:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Invitation assistant completed with error: %@", buf, 0xCu);
  }

  [v7 setDelegate:0];
  v10 = [v7 context];
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXSharedLibraryViewInvitationActionPerformer.m", 79, @"%@ should be an instance inheriting from %@, but it is nil", @"assistantController.context", v17 object file lineNumber description];
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    v19 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXSharedLibraryViewInvitationActionPerformer.m", 79, @"%@ should be an instance inheriting from %@, but it is %@", @"assistantController.context", v17, v19 object file lineNumber description];

LABEL_16:
    if (v8) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_6:
    BOOL IsUserCanceledError = PXAssistantIsUserCanceledError(v8);
    v12 = PLSharedLibraryGetLog();
    v13 = v12;
    if (IsUserCanceledError)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Reply assistant cancelled by the user for context: %@", buf, 0xCu);
      }

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke;
      v24[3] = &unk_1E5DD32A8;
      v24[4] = self;
      id v25 = v8;
      [(PXActionPerformer *)self dismissViewController:v7 completionHandler:v24];
      v14 = v25;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Reply assistant failed for context: %@, error: %@", buf, 0x16u);
      }

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_29;
      v22[3] = &unk_1E5DD32A8;
      v22[4] = self;
      id v23 = v8;
      [(PXActionPerformer *)self dismissViewController:v7 completionHandler:v22];
      v14 = v23;
    }

    goto LABEL_20;
  }
LABEL_17:
  v20 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v10;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "Reply assistant completed for context: %@", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_30;
  v21[3] = &unk_1E5DD36F8;
  v21[4] = self;
  [(PXActionPerformer *)self dismissViewController:v7 completionHandler:v21];
LABEL_20:
}

uint64_t __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

uint64_t __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

uint64_t __87__PXSharedLibraryViewInvitationActionPerformer_assistantController_completedWithError___block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

- (void)performUserInteractionTask
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(PXSharedLibraryViewInvitationActionPerformer *)self invitation];
  v4 = [(PXSharedLibraryViewInvitationActionPerformer *)self sharedLibrartyStatusProvider];
  v5 = [(PXSharedLibraryViewInvitationActionPerformer *)self legacyDevicesFallbackMonitor];
  v6 = +[PXSharedLibraryAssistantContext replyAssistantContextWithSharedLibraryStatusProvider:v4 sharedLibrary:v3 legacyDevicesFallbackMonitor:v5];

  id v7 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Present invitation assistant with context: %@", (uint8_t *)&v12, 0xCu);
  }

  id v8 = [[PXAssistantController alloc] initWithContext:v6];
  [(PXAssistantController *)v8 setDelegate:self];
  if (![(PXActionPerformer *)self presentViewController:v8]) {
    PXAssertGetLog();
  }
  v9 = [v3 identifier];
  v10 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Invitation assistant presented. Marking shared library invitation as read %{public}@", (uint8_t *)&v12, 0xCu);
  }

  v11 = [MEMORY[0x1E4F1C9C8] now];
  PXPreferencesSetSharedLibraryInvitationLastSeenDate(v11, v9);
}

- (void)performActionWithInvitation:(id)a3 legacyDevicesFallbackMonitor:(id)a4 presentationEnvironment:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXSharedLibraryViewInvitationActionPerformer.m", 47, @"Invalid parameter not satisfying: %@", @"invitation" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXSharedLibraryViewInvitationActionPerformer.m", 48, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  [(PXSharedLibraryViewInvitationActionPerformer *)self setInvitation:v11];
  [(PXSharedLibraryViewInvitationActionPerformer *)self setLegacyDevicesFallbackMonitor:v12];
  [(PXActionPerformer *)self setPresentationEnvironment:v13];
  v17.receiver = self;
  v17.super_class = (Class)PXSharedLibraryViewInvitationActionPerformer;
  [(PXActionPerformer *)&v17 performActionWithCompletionHandler:v14];
}

- (PXSharedLibraryViewInvitationActionPerformer)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryViewInvitationActionPerformer;
  id v8 = [(PXActionPerformer *)&v10 initWithActionType:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_sharedLibrartyStatusProvider, a3);
  }

  return v8;
}

@end