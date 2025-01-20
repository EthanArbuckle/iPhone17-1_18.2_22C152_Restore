@interface SBHLibraryCategoryMapProviderDefaultSource
- (NSString)sourceName;
- (SBHLibraryCategoryMapProviderDefaultSource)initWithIconModel:(id)a3;
- (SBHLibraryCategoryMapProviderSourceDelegate)delegate;
- (void)_requestRefresh:(id)a3;
- (void)requestLibraryCategoryMapWithOptions:(unint64_t)a3 existingLibraryCategoryMap:(id)a4 forbiddenApplicationIdentifiers:(id)a5 sessionId:(unint64_t)a6 queue:(id)a7 completion:(id)a8;
- (void)setDelegate:(id)a3;
@end

@implementation SBHLibraryCategoryMapProviderDefaultSource

- (SBHLibraryCategoryMapProviderDefaultSource)initWithIconModel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryCategoryMapProviderDefaultSource;
  v6 = [(SBHLibraryCategoryMapProviderDefaultSource *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconModel, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__requestRefresh_ name:@"SBIconModelDidAddIconNotification" object:v7->_iconModel];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v7 selector:sel__requestRefresh_ name:@"SBIconModelDidReloadIconsNotification" object:v7->_iconModel];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__requestRefresh_ name:@"SBIconModelWillRemoveIconNotification" object:v7->_iconModel];
  }
  return v7;
}

- (NSString)sourceName
{
  return (NSString *)@"default";
}

- (void)requestLibraryCategoryMapWithOptions:(unint64_t)a3 existingLibraryCategoryMap:(id)a4 forbiddenApplicationIdentifiers:(id)a5 sessionId:(unint64_t)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v44 = a5;
  v11 = a7;
  id v41 = a8;
  queue = v11;
  BSDispatchQueueAssert();
  objc_super v12 = self->_iconModel;
  v42 = [(SBHIconModel *)v12 leafIcons];
  v13 = [v42 allObjects];
  v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_28];

  v15 = objc_opt_new();
  v16 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v59;
    uint64_t v21 = 3000;
    id v46 = v17;
    v47 = v12;
    uint64_t v45 = *(void *)v59;
    do
    {
      uint64_t v22 = 0;
      uint64_t v48 = v19;
      do
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v58 + 1) + 8 * v22);
        v24 = objc_msgSend(v23, "applicationBundleID", v41);
        if ([(SBHIconModel *)v12 isIconVisible:v23]
          && ([v23 isFolderIcon] & 1) == 0
          && ([v23 isWidgetIcon] & 1) == 0
          && (!v24 || ([v44 containsObject:v24] & 1) == 0))
        {
          uint64_t v49 = v22;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          v25 = [v23 iTunesCategoriesOrderedByRelevancy];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (!v26)
          {
            uint64_t v29 = v21;
            goto LABEL_27;
          }
          uint64_t v27 = v26;
          v50 = v23;
          uint64_t v28 = *(void *)v55;
          uint64_t v29 = v21;
          while (1)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v55 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v31 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              if (([v15 categoriesContainApplicationIdentifier:v31] & 1) == 0)
              {
                uint64_t v32 = [v16 objectForKey:v31];
                if (v32)
                {
                  v33 = (SBHLibraryCategoryIdentifier *)v32;
                  if (v24) {
                    goto LABEL_19;
                  }
LABEL_21:
                  v36 = [v50 leafIdentifier];
                  [v15 addApplicationIdentifier:v36 forCategoryIdentifier:v33];
                }
                else
                {
                  v34 = [SBHLibraryCategoryIdentifier alloc];
                  uint64_t v35 = v29++;
                  v33 = [(SBHLibraryCategoryIdentifier *)v34 initWithPredictionCategoryID:v35 localizedDisplayNameKey:v31];
                  [v16 setObject:v33 forKey:v31];
                  if (!v24) {
                    goto LABEL_21;
                  }
LABEL_19:
                  [v15 addApplicationIdentifier:v24 forCategoryIdentifier:v33];
                }

                continue;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v54 objects:v62 count:16];
            if (!v27)
            {
LABEL_27:
              uint64_t v21 = v29;

              id v17 = v46;
              objc_super v12 = v47;
              uint64_t v20 = v45;
              uint64_t v19 = v48;
              uint64_t v22 = v49;
              break;
            }
          }
        }

        ++v22;
      }
      while (v22 != v19);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v19);
  }

  v37 = [v15 categoryIdentifiers];
  v38 = [v37 sortedArrayUsingComparator:&__block_literal_global_9];
  [v15 setCategoryIdentifiers:v38];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_3;
  block[3] = &unk_1E6AAD7E0;
  id v52 = v15;
  id v53 = v41;
  id v39 = v15;
  id v40 = v41;
  dispatch_async(queue, block);
}

uint64_t __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 leafIdentifier];
  v6 = [v4 leafIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedDisplayName];
  v6 = [v4 localizedDisplayName];

  uint64_t v7 = [v5 compare:v6 options:64];
  return v7;
}

uint64_t __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_requestRefresh:(id)a3
{
  id v4 = [(SBHLibraryCategoryMapProviderDefaultSource *)self delegate];
  [v4 requestLibraryCategoryMapUpdateWithRefreshOptions:6 source:self];
}

- (SBHLibraryCategoryMapProviderSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHLibraryCategoryMapProviderSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end