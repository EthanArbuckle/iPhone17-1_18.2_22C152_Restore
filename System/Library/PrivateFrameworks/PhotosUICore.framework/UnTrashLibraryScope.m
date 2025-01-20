@interface UnTrashLibraryScope
@end

@implementation UnTrashLibraryScope

void ___UnTrashLibraryScope_block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F39118];
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 untrashLibraryScopes:v2];
}

void ___UnTrashLibraryScope_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "UnTrashLibraryScope", "", buf, 2u);
  }

  v9 = PLSharedLibraryGetLog();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [*(id *)(a1 + 40) localIdentifier];
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Did un-trash library scope with identifier: %{public}@", buf, 0xCu);
    }
    v10 = [*(id *)(a1 + 48) librarySpecificFetchOptions];
    v12 = (void *)MEMORY[0x1E4F39110];
    v13 = [*(id *)(a1 + 40) localIdentifier];
    v27[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v15 = [v12 fetchLibraryScopesWithLocalIdentifiers:v14 options:v10];

    v16 = [v15 firstObject];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = [*(id *)(a1 + 40) localIdentifier];
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Failed to un-trash library scope with identifier: %{public}@, error: %@", buf, 0x16u);
    }
    v16 = 0;
  }

  v18 = *(void **)(a1 + 56);
  if (v18)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___UnTrashLibraryScope_block_invoke_662;
    block[3] = &unk_1E5DD0E78;
    id v22 = v18;
    id v20 = v16;
    id v21 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t ___UnTrashLibraryScope_block_invoke_662(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end