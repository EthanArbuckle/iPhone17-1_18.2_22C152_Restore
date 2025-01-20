@interface SFBookmarkFolderTouchIconProvider
@end

@implementation SFBookmarkFolderTouchIconProvider

void __42___SFBookmarkFolderTouchIconProvider_init__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4FB6060] readonlySafariBookmarkCollectionConfiguration];
  [v5 setSkipsExternalNotifications:1];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4FB60E8]) initWithConfiguration:v5 checkIntegrity:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

void __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke(uint64_t a1)
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "listWithID:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  uint64_t v3 = [v2 bookmarkArray];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke_2;
  v8[3] = &unk_1E54EA4A0;
  uint64_t v4 = *(void *)(a1 + 56);
  v8[4] = v9;
  v8[5] = v4;
  uint64_t v5 = objc_msgSend(v3, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  _Block_object_dispose(v9, 8);
}

id __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isFolder])
  {
    v7 = 0;
  }
  else
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= *(void *)(a1 + 40)) {
      *a4 = 1;
    }
    v7 = +[SFBookmarkTouchIconRequest requestWithBookmark:v6 iconGenerationEnabled:1];
  }

  return v7;
}

void __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) userInfo];
    uint64_t v4 = objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x1E4FB6130]);
    uint64_t v5 = [v4 intValue];

    id v6 = [WeakRetained[6] bookmarkWithID:v5];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 UUID];
      [WeakRetained contentOfFolderDidUpdateWithUUID:v8];
    }
    v9 = [WeakRetained allFolderUUIDs];
    v10 = [WeakRetained[6] validBookmarkUUIDsFromUUIDs:v9];
    if (v10)
    {
      v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke_2;
      v14[3] = &unk_1E54EA4C8;
      id v15 = v11;
      id v12 = v11;
      v13 = objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v14);
      [WeakRetained requestsWithFolderUUIDsDidBecomeInvalid:v13];
    }
  }
}

uint64_t __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

@end