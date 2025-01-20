@interface ExitSharedLibraryOrPreview
@end

@implementation ExitSharedLibraryOrPreview

void ___ExitSharedLibraryOrPreview_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (a2)
  {
    v6 = PLSharedLibraryGetLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [*(id *)(a1 + 40) identifier];
    int v18 = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    v21 = v8;
    v9 = "%{public}@: Did exit Shared Library or preview: %{public}@";
LABEL_7:
    v13 = v6;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    uint32_t v15 = 22;
    goto LABEL_10;
  }
  int IsUserCanceledError = PXSharedLibraryIsUserCanceledError(v5);
  v11 = PLSharedLibraryGetLog();
  v6 = v11;
  if (IsUserCanceledError)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    v8 = [*(id *)(a1 + 40) identifier];
    int v18 = 138543618;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v8;
    v9 = "%{public}@: User canceled exit Shared Library or preview: %{public}@";
    goto LABEL_7;
  }
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_11;
  }
  uint64_t v16 = *(void *)(a1 + 32);
  v8 = [*(id *)(a1 + 40) identifier];
  int v18 = 138543874;
  uint64_t v19 = v16;
  __int16 v20 = 2114;
  v21 = v8;
  __int16 v22 = 2112;
  id v23 = v5;
  v9 = "%{public}@: Failed to exit Shared Library or preview: %{public}@, error: %@";
  v13 = v6;
  os_log_type_t v14 = OS_LOG_TYPE_ERROR;
  uint32_t v15 = 32;
LABEL_10:
  _os_log_impl(&dword_1A9AE7000, v13, v14, v9, (uint8_t *)&v18, v15);

LABEL_11:
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, a2, v5);
  }
}

@end