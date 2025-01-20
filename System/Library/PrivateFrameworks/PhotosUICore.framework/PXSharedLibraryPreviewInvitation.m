@interface PXSharedLibraryPreviewInvitation
@end

@implementation PXSharedLibraryPreviewInvitation

void ___PXSharedLibraryPreviewInvitation_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLSharedLibraryGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Did preview Shared Library invitation: %{public}@", buf, 0xCu);
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
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to preview Shared Library invitation: %{public}@, error: %@", buf, 0x16u);
    }
    v11 = PXLocalizedSharedLibraryString(@"PXSharedLibraryPreviewInvitationFailureAlertTitle");
    v12 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___PXSharedLibraryPreviewInvitation_block_invoke_737;
    v14[3] = &unk_1E5DD3280;
    v13 = *(void **)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v15 = v5;
    PXPresentFailureWithLocalizedTitle(v11, v12, 0, v15, v13, v14);
  }
}

uint64_t ___PXSharedLibraryPreviewInvitation_block_invoke_737(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

@end