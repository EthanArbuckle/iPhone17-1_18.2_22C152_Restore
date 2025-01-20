@interface PXSharedLibraryAcceptInvitation
@end

@implementation PXSharedLibraryAcceptInvitation

void ___PXSharedLibraryAcceptInvitation_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLSharedLibraryGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Did accept Shared Library invitation: %{public}@", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543618;
      v24 = v10;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to accept Shared Library invitation: %{public}@, error: %@", buf, 0x16u);
    }
    v11 = [*(id *)(a1 + 32) sourceLibraryInfo];
    id v21 = 0;
    id v22 = 0;
    char v12 = [v11 presentCustomInformationForError:v5 customTitle:&v22 customMessage:&v21];
    id v13 = v22;
    id v14 = v21;
    if ((v12 & 1) == 0)
    {
      uint64_t v15 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAcceptInvitationFailureAlertTitle_Transient");

      uint64_t v16 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");

      id v13 = (id)v15;
      id v14 = (id)v16;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = ___PXSharedLibraryAcceptInvitation_block_invoke_741;
    v18[3] = &unk_1E5DD3280;
    v17 = *(void **)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    id v19 = v5;
    PXPresentFailureWithLocalizedTitle(v13, v14, 0, v19, v17, v18);
  }
}

uint64_t ___PXSharedLibraryAcceptInvitation_block_invoke_741(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

@end