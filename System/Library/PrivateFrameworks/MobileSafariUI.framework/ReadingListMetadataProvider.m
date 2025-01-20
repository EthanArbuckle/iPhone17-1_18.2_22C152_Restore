@interface ReadingListMetadataProvider
- (ReadingListMetadataProvider)init;
- (void)fetchMetadataForBookmark:(id)a3 completion:(id)a4;
@end

@implementation ReadingListMetadataProvider

- (ReadingListMetadataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)ReadingListMetadataProvider;
  v2 = [(ReadingListMetadataProvider *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)fetchMetadataForBookmark:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke;
  v20 = &unk_1E6D7A7A8;
  id v7 = v5;
  id v21 = v7;
  id v8 = v6;
  id v22 = v8;
  v9 = (void (**)(void, void))MEMORY[0x1E4E42950](&v17);
  if (objc_msgSend(MEMORY[0x1E4F785B0], "hasSharedSiteMetadataManager", v17, v18, v19, v20))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F98BF0]);
    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v7 address];
    v13 = [v11 URLWithString:v12];
    v14 = (void *)[v10 initWithURL:v13];

    v15 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    id v16 = (id)[v15 registerOneTimeRequest:v14 priority:2 responseHandler:v9];
  }
  else
  {
    v9[2](v9, 0);
  }
}

void __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F98BE8] unpackMetadataFromResponse:a2];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 image];
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)MEMORY[0x1E4F98BC8];
      id v8 = [v5 platformImage];
      v9 = [v7 readingListThumbnailDataFromImage:v8];
    }
    else
    {
      v9 = 0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_2;
    v12[3] = &unk_1E6D7A780;
    id v15 = *(id *)(a1 + 40);
    id v13 = v4;
    id v14 = v9;
    id v11 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_cold_1(a1, v10);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_17;
    block[3] = &unk_1E6D77E70;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = v17;
  }
}

uint64_t __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 32) title];
  v3 = [*(id *)(a1 + 32) summary];
  v4 = [*(id *)(a1 + 32) imageMetadata];
  id v5 = [v4 URL];
  id v6 = [v5 absoluteString];
  (*(void (**)(uint64_t, uint64_t, id, void *, void *, void))(v2 + 16))(v2, 1, v7, v3, v6, *(void *)(a1 + 40));
}

void __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4[0] = 67109120;
  v4[1] = [v2 identifier];
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Error fetching metadata for Reading List item %d", (uint8_t *)v4, 8u);
}

@end