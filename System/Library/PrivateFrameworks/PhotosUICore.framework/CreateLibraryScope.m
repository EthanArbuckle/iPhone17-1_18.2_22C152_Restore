@interface CreateLibraryScope
@end

@implementation CreateLibraryScope

void ___CreateLibraryScope_block_invoke(void *a1)
{
  v2 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationTitle");
  v3 = [MEMORY[0x1E4F39118] creationRequestForOwnedLibraryScopeInPreviewStateWithTitle:v2];
  v4 = [v3 placeholderForCreatedLibraryScope];
  uint64_t v5 = [v4 localIdentifier];
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = (void *)a1[4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___CreateLibraryScope_block_invoke_2;
  v18[3] = &unk_1E5DCAEA0;
  id v10 = v8;
  id v19 = v10;
  [v9 enumerateObjectsUsingBlock:v18];
  v11 = (void *)a1[5];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = ___CreateLibraryScope_block_invoke_3;
  v16 = &unk_1E5DCAEA0;
  id v17 = v10;
  id v12 = v10;
  [v11 enumerateObjectsUsingBlock:&v13];
  objc_msgSend(v3, "addParticipants:", v12, v13, v14, v15, v16);
}

void ___CreateLibraryScope_block_invoke_4(uint64_t a1, int a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(id *)(a1 + 32);
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "CreateLibraryScope", "", buf, 2u);
  }

  v9 = PLSharedLibraryGetLog();
  id v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Did create library scope with identifier: %{public}@", buf, 0xCu);
    }

    id v10 = [*(id *)(a1 + 40) librarySpecificFetchOptions];
    id v12 = (void *)MEMORY[0x1E4F39110];
    v26[0] = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    uint64_t v14 = [v12 fetchLibraryScopesWithLocalIdentifiers:v13 options:v10];

    v15 = [v14 firstObject];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Failed to create library scope with identifier: %{public}@, error: %@", buf, 0x16u);
    }
    v15 = 0;
  }

  id v17 = *(void **)(a1 + 48);
  if (v17)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___CreateLibraryScope_block_invoke_630;
    block[3] = &unk_1E5DD0E78;
    id v21 = v17;
    id v19 = v15;
    id v20 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t ___CreateLibraryScope_block_invoke_630(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void ___CreateLibraryScope_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F392F0] creationRequestForShareParticipantWithEmailAddress:a2 permission:3];
  v3 = [v4 placeholderForCreatedShareParticipant];
  [*(id *)(a1 + 32) addObject:v3];
}

void ___CreateLibraryScope_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F392F0] creationRequestForShareParticipantWithPhoneNumber:a2 permission:3];
  v3 = [v4 placeholderForCreatedShareParticipant];
  [*(id *)(a1 + 32) addObject:v3];
}

@end