@interface ViewInvitation
@end

@implementation ViewInvitation

void ___ViewInvitation_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Will review invitation", buf, 0xCu);
  }

  v4 = [[PXSharedLibraryViewInvitationActionPerformer alloc] initWithSharedLibraryStatusProvider:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___ViewInvitation_block_invoke_719;
  v8[3] = &unk_1E5DD2B90;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 72);
  [(PXSharedLibraryViewInvitationActionPerformer *)v4 performActionWithInvitation:v5 legacyDevicesFallbackMonitor:v6 presentationEnvironment:v7 completionHandler:v8];
}

void ___ViewInvitation_block_invoke_720(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationAlertTitle_HasPreview_iOS");
  [v3 setTitle:v4];

  uint64_t v5 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationAlertMessage_HasPreview");
  [v3 setMessage:v5];

  uint64_t v6 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationAlert_ExitSetup");
  [v3 addActionWithTitle:v6 style:0 action:*(void *)(a1 + 32)];

  uint64_t v7 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationAlert_Cancel");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___ViewInvitation_block_invoke_2;
  v8[3] = &unk_1E5DD3128;
  id v9 = *(id *)(a1 + 40);
  [v3 addActionWithTitle:v7 style:1 action:v8];
}

void ___ViewInvitation_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(@"Delete Shared Library Preview");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void ___ViewInvitation_block_invoke_719(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (a2)
  {
    uint64_t v6 = PLSharedLibraryGetLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    int v17 = 138543362;
    uint64_t v18 = v7;
    v8 = "%{public}@: Did review invitation";
LABEL_7:
    uint64_t v12 = v6;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint32_t v14 = 12;
    goto LABEL_10;
  }
  BOOL IsUserCanceledError = PXAssistantIsUserCanceledError(v5);
  id v10 = PLSharedLibraryGetLog();
  uint64_t v6 = v10;
  if (IsUserCanceledError)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    int v17 = 138543362;
    uint64_t v18 = v11;
    v8 = "%{public}@: User canceled review of invitation";
    goto LABEL_7;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_11;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  int v17 = 138543618;
  uint64_t v18 = v15;
  __int16 v19 = 2112;
  id v20 = v5;
  v8 = "%{public}@: Failed to review invitation: %@";
  uint64_t v12 = v6;
  os_log_type_t v13 = OS_LOG_TYPE_ERROR;
  uint32_t v14 = 22;
LABEL_10:
  _os_log_impl(&dword_1A9AE7000, v12, v13, v8, (uint8_t *)&v17, v14);
LABEL_11:

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

@end