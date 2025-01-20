@interface PXSharedLibraryCreatePreview
@end

@implementation PXSharedLibraryCreatePreview

void ___PXSharedLibraryCreatePreview_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v13 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Failed to create Shared Library preview: %@", buf, 0xCu);
    }

    v11 = PXLocalizedSharedLibraryString(@"PXSharedLibraryCreateSharedLibraryPreviewFailureAlertTitle");
    v14 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = ___PXSharedLibraryCreatePreview_block_invoke_736;
    v19[3] = &unk_1E5DD3280;
    v15 = *(void **)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v20 = v6;
    PXPresentFailureWithLocalizedTitle(v11, v14, 0, v20, v15, v19);

    goto LABEL_16;
  }
  int v7 = [*(id *)(a1 + 32) isCancelled];
  v8 = PLSharedLibraryGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      v16 = [v5 identifier];
      *(_DWORD *)buf = 138543362;
      id v23 = v16;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Did create Shared Library preview: %{public}@", buf, 0xCu);
    }
    v17 = [*(id *)(a1 + 40) sharedLibraryRule];
    v11 = [v17 assetLocalIdentifiers];

    if (![*(id *)(a1 + 40) autoSharePolicy] && objc_msgSend(v11, "count"))
    {
      [v5 moveAssetsWithLocalIdentifiersToSharedLibrary:v11 completion:*(void *)(a1 + 56)];
      goto LABEL_16;
    }
    uint64_t v18 = *(void *)(a1 + 56);
    if (!v18)
    {
LABEL_16:

      goto LABEL_17;
    }
    v12 = *(void (**)(void))(v18 + 16);
LABEL_15:
    v12();
    goto LABEL_16;
  }
  if (v9)
  {
    v10 = [v5 identifier];
    *(_DWORD *)buf = 138543362;
    id v23 = v10;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "User canceled creation of Shared Library preview: %{public}@", buf, 0xCu);
  }
  if (*(void *)(a1 + 56))
  {
    v11 = PXSharedLibraryUserCanceledErrorWithDebugDescription(@"Create Preview");
    v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_15;
  }
LABEL_17:
}

uint64_t ___PXSharedLibraryCreatePreview_block_invoke_736(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

@end