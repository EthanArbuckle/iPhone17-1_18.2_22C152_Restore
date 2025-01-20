@interface HandleFetchedSharedLibraryInvitation
@end

@implementation HandleFetchedSharedLibraryInvitation

uint64_t ___HandleFetchedSharedLibraryInvitation_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void ___HandleFetchedSharedLibraryInvitation_block_invoke_685(id *a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLSharedLibraryGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      id v8 = a1[4];
      id v9 = a1[5];
      *(_DWORD *)buf = 138543618;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Will restore declined Shared Library invitation: %@", buf, 0x16u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___HandleFetchedSharedLibraryInvitation_block_invoke_686;
    v14[3] = &unk_1E5DAF9D0;
    id v10 = a1[5];
    id v15 = a1[4];
    id v16 = a1[6];
    id v17 = a1[7];
    id v18 = a1[8];
    id v20 = a1[9];
    id v19 = a1[5];
    [v10 restoreDeclinedInvitationWithCompletion:v14];
  }
  else
  {
    if (v7)
    {
      id v11 = a1[4];
      id v12 = a1[5];
      *(_DWORD *)buf = 138543618;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: User canceled restore of declined Shared Library invitation: %@", buf, 0x16u);
    }

    v13 = (void (**)(id, uint64_t, void))a1[9];
    if (v13) {
      v13[2](v13, 1, 0);
    }
  }
}

void ___HandleFetchedSharedLibraryInvitation_block_invoke_686(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL v7 = PLSharedLibraryGetLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Did restore declined Shared Library invitation: %@", buf, 0x16u);
    }

    _ViewInvitation(*(void **)(a1 + 40), v5, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 32), *(void **)(a1 + 72));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to restore declined Shared Library invitation: %@, error: %@", buf, 0x20u);
    }

    id v12 = PXLocalizedSharedLibraryString(@"PXSharedLibraryFetchInvitationFailureAlertTitle_Transient");
    v13 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
    v14 = *(void **)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___HandleFetchedSharedLibraryInvitation_block_invoke_687;
    v15[3] = &unk_1E5DD3280;
    id v17 = *(id *)(a1 + 72);
    id v16 = v6;
    PXPresentFailureWithLocalizedTitle(v12, v13, 0, v16, v14, v15);
  }
}

uint64_t ___HandleFetchedSharedLibraryInvitation_block_invoke_687(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

@end