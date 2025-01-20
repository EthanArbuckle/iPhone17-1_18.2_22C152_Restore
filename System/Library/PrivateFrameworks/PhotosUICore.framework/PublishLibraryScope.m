@interface PublishLibraryScope
@end

@implementation PublishLibraryScope

void ___PublishLibraryScope_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PublishLibraryScope", "", buf, 2u);
  }

  v10 = PLSharedLibraryGetLog();
  v11 = v10;
  if (v5)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    v12 = [*(id *)(a1 + 40) localIdentifier];
    *(_DWORD *)buf = 138543618;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v5;
    v13 = "Did publish library scope with identifier: %{public}@, URL: %@";
    v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v12 = [*(id *)(a1 + 40) localIdentifier];
    *(_DWORD *)buf = 138543618;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v6;
    v13 = "Failed to publish library scope with identifier: %{public}@, error: %@";
    v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1A9AE7000, v14, v15, v13, buf, 0x16u);

LABEL_10:
  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___PublishLibraryScope_block_invoke_649;
    block[3] = &unk_1E5DD0E78;
    id v20 = v16;
    id v18 = v5;
    id v19 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t ___PublishLibraryScope_block_invoke_649(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end