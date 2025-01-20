@interface NUANFLinkedContentProvider
- (FCContentContext)contentContext;
- (NSDictionary)linkedHeadlines;
- (NSDictionary)linkedIssues;
- (NSDictionary)linkedTags;
- (NUANFLinkedContentProvider)initWithContentContext:(id)a3;
- (id)headlineForIdentifier:(id)a3;
- (id)issueForIdentifier:(id)a3;
- (id)loadLinkedArticlesWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5;
- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 completion:(id)a5;
- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 priority:(int64_t)a5 completion:(id)a6;
- (id)loadLinkedIssuesWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5;
- (id)loadLinkedTagsWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5;
- (id)tagForIdentifier:(id)a3;
- (void)setLinkedHeadlines:(id)a3;
- (void)setLinkedIssues:(id)a3;
- (void)setLinkedTags:(id)a3;
@end

@implementation NUANFLinkedContentProvider

- (NUANFLinkedContentProvider)initWithContentContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFLinkedContentProvider;
  v6 = [(NUANFLinkedContentProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentContext, a3);
  }

  return v7;
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 completion:(id)a5
{
  return [(NUANFLinkedContentProvider *)self loadLinkedContentForHeadline:a3 withContext:a4 priority:0 completion:a5];
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  dispatch_block_t block = a6;
  v11 = [v9 linkedArticleIDs];
  v12 = (void *)[v11 mutableCopy];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x263EFF980] array];
  }
  v15 = v14;

  v16 = [v9 identifier];
  [v15 addObject:v16];

  v17 = [v9 linkedIssueIDs];
  v18 = (void *)[v17 mutableCopy];
  v19 = v18;
  v45 = v9;
  int64_t v42 = a5;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x263EFF980] array];
  }
  v21 = v20;

  v22 = [MEMORY[0x263EFF980] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v44 = v10;
  v23 = [v10 documentController];
  v24 = [v23 additions];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v54 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v30 = [v29 URL];
          v31 = objc_msgSend(v30, "fc_NewsArticleID");
          objc_msgSend(v15, "fc_safelyAddObject:", v31);

          v32 = objc_msgSend(v30, "fc_NewsIssueID");
          objc_msgSend(v21, "fc_safelyAddObject:", v32);

          v33 = objc_msgSend(v30, "fc_feldsparTagID");
          objc_msgSend(v22, "fc_safelyAddObject:", v33);
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v26);
  }

  v34 = [MEMORY[0x263EFF980] array];
  v35 = dispatch_group_create();
  int64_t v36 = v42;
  if ([v15 count])
  {
    dispatch_group_enter(v35);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke;
    v51[3] = &unk_2645FE4C8;
    v52 = v35;
    v37 = [(NUANFLinkedContentProvider *)self loadLinkedArticlesWithIDs:v15 priority:v42 completion:v51];
    [v34 addObject:v37];
  }
  if (objc_msgSend(v21, "count", v42))
  {
    dispatch_group_enter(v35);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2;
    v49[3] = &unk_2645FE4C8;
    v50 = v35;
    v38 = [(NUANFLinkedContentProvider *)self loadLinkedIssuesWithIDs:v21 priority:v36 completion:v49];
    [v34 addObject:v38];
  }
  if ([v22 count])
  {
    dispatch_group_enter(v35);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_3;
    v47[3] = &unk_2645FE4C8;
    v48 = v35;
    v39 = [(NUANFLinkedContentProvider *)self loadLinkedTagsWithIDs:v22 priority:v36 completion:v47];
    [v34 addObject:v39];
  }
  dispatch_group_notify(v35, MEMORY[0x263EF83A0], block);
  v40 = [MEMORY[0x263F594E8] groupCancelHandlerWithCancelHandlers:v34];

  return v40;
}

void __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke(uint64_t a1)
{
}

void __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2(uint64_t a1)
{
}

void __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_3(uint64_t a1)
{
}

- (id)headlineForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NUANFLinkedContentProvider *)self linkedHeadlines];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)issueForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NUANFLinkedContentProvider *)self linkedIssues];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)tagForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NUANFLinkedContentProvider *)self linkedTags];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)loadLinkedArticlesWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = objc_alloc(MEMORY[0x263F59368]);
    v11 = [(NUANFLinkedContentProvider *)self contentContext];
    v12 = (void *)[v10 initWithContext:v11 articleIDs:v8 ignoreCacheForArticleIDs:0];

    [v12 setQualityOfService:FCInferQualityOfServiceFromRelativePriority()];
    [v12 setRelativePriority:a4];
    [v12 setFetchCompletionQueue:MEMORY[0x263EF83A0]];
    objc_initWeak(location, self);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_2;
    v18 = &unk_2645FF8F8;
    objc_copyWeak(&v20, location);
    id v19 = v9;
    [v12 setFetchCompletionBlock:&v15];
    v13 = objc_msgSend(MEMORY[0x263F08A48], "fc_sharedConcurrentQueue", v15, v16, v17, v18);
    [v13 addOperation:v12];

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    location[1] = (id)MEMORY[0x263EF8330];
    location[2] = (id)3221225472;
    location[3] = __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke;
    location[4] = &unk_2645FF8D0;
    v22 = (void (**)(void))v9;
    v22[2]();

    v12 = 0;
  }

  return v12;
}

uint64_t __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke(uint64_t a1)
{
  return 0;
}

void __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if ([v3 status])
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_4;
      v20[3] = &unk_2645FE158;
      id v21 = *(id *)(a1 + 32);
      __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_4((uint64_t)v20);
      v7 = v21;
    }
    else
    {
      uint64_t v15 = v6;
      v7 = [MEMORY[0x263EFF9A0] dictionary];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = [v3 fetchedObject];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            id v14 = [v13 identifier];
            [v7 setObject:v13 forKey:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v10);
      }

      id v6 = v15;
      [v15 setLinkedHeadlines:v7];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_3;
    v22[3] = &unk_2645FE158;
    id v23 = *(id *)(a1 + 32);
    __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_3((uint64_t)v22);
    id v6 = v23;
  }
}

uint64_t __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadLinkedIssuesWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = objc_alloc(MEMORY[0x263F59510]);
    uint64_t v11 = [(NUANFLinkedContentProvider *)self contentContext];
    v12 = (void *)[v10 initWithContext:v11 issueIDs:v8];

    [v12 setQualityOfService:FCInferQualityOfServiceFromRelativePriority()];
    [v12 setRelativePriority:a4];
    objc_initWeak(location, self);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    long long v17 = __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke_2;
    long long v18 = &unk_2645FF920;
    objc_copyWeak(&v20, location);
    id v19 = v9;
    [v12 setFetchCompletionHandler:&v15];
    v13 = objc_msgSend(MEMORY[0x263F08A48], "fc_sharedConcurrentQueue", v15, v16, v17, v18);
    [v13 addOperation:v12];

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    location[1] = (id)MEMORY[0x263EF8330];
    location[2] = (id)3221225472;
    location[3] = __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke;
    location[4] = &unk_2645FF8D0;
    v22 = (void (**)(void))v9;
    v22[2]();

    v12 = 0;
  }

  return v12;
}

uint64_t __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke(uint64_t a1)
{
  return 0;
}

void __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v7 = [MEMORY[0x263EFF9A0] dictionary];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "identifier", (void)v14);
          [v7 setObject:v8 forKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v10);
    }

    [v6 setLinkedIssues:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke_3;
    v18[3] = &unk_2645FE158;
    id v19 = *(id *)(a1 + 32);
    __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke_3((uint64_t)v18);
    id v6 = v19;
  }
}

uint64_t __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadLinkedTagsWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    uint64_t v10 = [(NUANFLinkedContentProvider *)self contentContext];
    uint64_t v11 = [v10 tagController];
    v12 = [v11 fetchOperationForTagsWithIDs:v8];

    [v12 setQualityOfService:FCInferQualityOfServiceFromRelativePriority()];
    [v12 setRelativePriority:a4];
    objc_initWeak(location, self);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    long long v17 = __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_2;
    long long v18 = &unk_2645FF8F8;
    objc_copyWeak(&v20, location);
    id v19 = v9;
    [v12 setFetchCompletionBlock:&v15];
    v13 = objc_msgSend(MEMORY[0x263F08A48], "fc_sharedConcurrentQueue", v15, v16, v17, v18);
    [v13 addOperation:v12];

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    location[1] = (id)MEMORY[0x263EF8330];
    location[2] = (id)3221225472;
    location[3] = __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke;
    location[4] = &unk_2645FF8D0;
    v22 = (void (**)(void))v9;
    v22[2]();

    v12 = 0;
  }

  return v12;
}

uint64_t __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke(uint64_t a1)
{
  return 0;
}

void __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if ([v3 status])
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_4;
      v8[3] = &unk_2645FE158;
      id v9 = *(id *)(a1 + 32);
      __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_4((uint64_t)v8);
    }
    else
    {
      v7 = [v3 fetchedObject];
      [v6 setLinkedTags:v7];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_3;
    v10[3] = &unk_2645FE158;
    id v11 = *(id *)(a1 + 32);
    __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_3((uint64_t)v10);
    id v6 = v11;
  }
}

uint64_t __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NSDictionary)linkedHeadlines
{
  return self->_linkedHeadlines;
}

- (void)setLinkedHeadlines:(id)a3
{
}

- (NSDictionary)linkedTags
{
  return self->_linkedTags;
}

- (void)setLinkedTags:(id)a3
{
}

- (NSDictionary)linkedIssues
{
  return self->_linkedIssues;
}

- (void)setLinkedIssues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedIssues, 0);
  objc_storeStrong((id *)&self->_linkedTags, 0);
  objc_storeStrong((id *)&self->_linkedHeadlines, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end