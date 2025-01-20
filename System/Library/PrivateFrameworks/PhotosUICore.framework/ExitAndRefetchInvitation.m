@interface ExitAndRefetchInvitation
@end

@implementation ExitAndRefetchInvitation

void ___ExitAndRefetchInvitation_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = [*(id *)(a1 + 32) shareURL];
    v7 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Will re-fetch Shared Library invitation for URL: %@", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = ___ExitAndRefetchInvitation_block_invoke_585;
    v17[3] = &unk_1E5DAFA70;
    id v21 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 32);
    id v19 = v6;
    id v20 = *(id *)(a1 + 48);
    id v9 = v6;
    [v8 fetchSharedLibraryForURL:v9 completionHandler:v17];

    v10 = v21;
  }
  else
  {
    v11 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Failed to exit current Shared Library invitation preview: %{public}@, error: %@", buf, 0x16u);
    }
    PXLocalizedSharedLibraryString(@"PXSharedLibraryPreviewInvitationFailureAlertTitle");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___ExitAndRefetchInvitation_block_invoke_593;
    v14[3] = &unk_1E5DD3280;
    v13 = *(void **)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v15 = v5;
    PXPresentFailureWithLocalizedTitle(v9, v10, 0, v15, v13, v14);
  }
}

void ___ExitAndRefetchInvitation_block_invoke_585(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
  v6 = [*(id *)(a1 + 32) sourceLibraryInfo];
  int v7 = [v6 isSharedLibraryNotFoundError:v5];
  v8 = PLSharedLibraryGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v10;
      v11 = "Re-fetch returned NO Shared Library invitation for URL: %@";
      v12 = v8;
      uint32_t v13 = 12;
LABEL_8:
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }
  else if (v9)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v14;
    __int16 v28 = 2112;
    id v29 = v5;
    v11 = "Failed to re-fetch Shared Library invitation for URL: %@, error: %@";
    v12 = v8;
    uint32_t v13 = 22;
    goto LABEL_8;
  }

  id v24 = 0;
  id v25 = 0;
  char v15 = [v6 presentCustomInformationForError:v5 customTitle:&v25 customMessage:&v24];
  id v16 = v25;
  id v17 = v24;
  if ((v15 & 1) == 0)
  {
    uint64_t v18 = PXLocalizedSharedLibraryString(@"PXSharedLibraryFetchInvitationFailureAlertTitle_Transient");

    uint64_t v19 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");

    id v16 = (id)v18;
    id v17 = (id)v19;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = ___ExitAndRefetchInvitation_block_invoke_589;
  v21[3] = &unk_1E5DD3280;
  id v20 = *(void **)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v22 = v5;
  PXPresentFailureWithLocalizedTitle(v16, v17, 0, v22, v20, v21);

LABEL_12:
}

uint64_t ___ExitAndRefetchInvitation_block_invoke_593(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t ___ExitAndRefetchInvitation_block_invoke_589(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

@end