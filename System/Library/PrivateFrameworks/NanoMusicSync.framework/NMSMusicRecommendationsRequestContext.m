@interface NMSMusicRecommendationsRequestContext
- (BOOL)_hasDownloadableSongsForModelObject:(id)a3;
- (BOOL)_recentMusicContainsModelObject:(id)a3;
- (MPModelForYouRecommendationsResponse)forYouResponse;
- (MPModelResponse)heavyRotationResponse;
- (MPModelResponse)libraryRecentMusicResponse;
- (MPModelResponse)starterPackResponse;
- (MPModelStoreBrowseResponse)editorialBrowseResponse;
- (NSOrderedSet)recommendations;
- (NSSet)modelObjects;
- (unint64_t)minimumNumberOfRecentMusicModelObjects;
- (unint64_t)numberOfRecentMusicModelObjects;
- (void)_processRecentMusicItem:(id)a3 section:(id)a4 identifier:(id)a5;
- (void)_processResponsesIfNeeded;
- (void)setEditorialBrowseResponse:(id)a3;
- (void)setForYouResponse:(id)a3;
- (void)setHeavyRotationResponse:(id)a3;
- (void)setLibraryRecentMusicResponse:(id)a3;
- (void)setMinimumNumberOfRecentMusicModelObjects:(unint64_t)a3;
- (void)setStarterPackResponse:(id)a3;
@end

@implementation NMSMusicRecommendationsRequestContext

- (void)setForYouResponse:(id)a3
{
  v5 = (MPModelForYouRecommendationsResponse *)a3;
  p_forYouResponse = &self->_forYouResponse;
  if (self->_forYouResponse != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_forYouResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v8;
  }

  MEMORY[0x270F9A758](p_forYouResponse, v5);
}

- (void)setHeavyRotationResponse:(id)a3
{
  v5 = (MPModelResponse *)a3;
  p_heavyRotationResponse = &self->_heavyRotationResponse;
  if (self->_heavyRotationResponse != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_heavyRotationResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v8;
  }

  MEMORY[0x270F9A758](p_heavyRotationResponse, v5);
}

- (void)setLibraryRecentMusicResponse:(id)a3
{
  v5 = (MPModelResponse *)a3;
  p_libraryRecentMusicResponse = &self->_libraryRecentMusicResponse;
  if (self->_libraryRecentMusicResponse != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_libraryRecentMusicResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v8;
  }

  MEMORY[0x270F9A758](p_libraryRecentMusicResponse, v5);
}

- (void)setEditorialBrowseResponse:(id)a3
{
  v5 = (MPModelStoreBrowseResponse *)a3;
  p_editorialBrowseResponse = &self->_editorialBrowseResponse;
  if (self->_editorialBrowseResponse != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_editorialBrowseResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v8;
  }

  MEMORY[0x270F9A758](p_editorialBrowseResponse, v5);
}

- (void)setStarterPackResponse:(id)a3
{
  v5 = (MPModelResponse *)a3;
  p_starterPackResponse = &self->_starterPackResponse;
  if (self->_starterPackResponse != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_starterPackResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v8;
  }

  MEMORY[0x270F9A758](p_starterPackResponse, v5);
}

- (unint64_t)numberOfRecentMusicModelObjects
{
  [(NMSMusicRecommendationsRequestContext *)self _processResponsesIfNeeded];
  recentMusicModelObjects = self->_recentMusicModelObjects;

  return [(NSMutableOrderedSet *)recentMusicModelObjects count];
}

- (NSSet)modelObjects
{
  [(NMSMusicRecommendationsRequestContext *)self _processResponsesIfNeeded];
  v3 = [MEMORY[0x263EFF9C0] set];
  v4 = [(NSMutableOrderedSet *)self->_recentMusicModelObjects set];
  [v3 unionSet:v4];

  v5 = (void *)[v3 copy];

  return (NSSet *)v5;
}

- (NSOrderedSet)recommendations
{
  [(NMSMusicRecommendationsRequestContext *)self _processResponsesIfNeeded];
  v3 = [MEMORY[0x263EFF9B0] orderedSet];
  if ([(NSMutableOrderedSet *)self->_recentMusicModelObjects count])
  {
    v4 = [NMSMusicRecommendation alloc];
    v5 = [(NMSMusicRecommendation *)v4 initWithIdentifier:NMSRecommendationRecentMusicIdentifier title:0 items:self->_recentMusicModelObjects];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return (NSOrderedSet *)v6;
}

- (void)_processResponsesIfNeeded
{
  if (!self->_recentMusicModelObjects)
  {
    v3 = [MEMORY[0x263EFF9B0] orderedSet];
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = v3;

    v5 = [(MPModelForYouRecommendationsResponse *)self->_forYouResponse results];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke;
    v14[3] = &unk_264633F58;
    v14[4] = self;
    [v5 enumerateSectionsUsingBlock:v14];

    v6 = [(MPModelResponse *)self->_heavyRotationResponse results];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_206;
    v13[3] = &unk_264633FA8;
    v13[4] = self;
    [v6 enumerateSectionsUsingBlock:v13];

    v7 = [(MPModelResponse *)self->_libraryRecentMusicResponse results];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_2;
    v12[3] = &unk_264633FD0;
    v12[4] = self;
    [v7 enumerateItemsUsingBlock:v12];

    v8 = [(MPModelStoreBrowseResponse *)self->_editorialBrowseResponse results];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_217;
    v11[3] = &unk_264633FA8;
    v11[4] = self;
    [v8 enumerateSectionsUsingBlock:v11];

    v9 = [(MPModelResponse *)self->_starterPackResponse results];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_223;
    v10[3] = &unk_264633FA8;
    v10[4] = self;
    [v9 enumerateSectionsUsingBlock:v10];
  }
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 title];
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2050;
    uint64_t v14 = [v3 groupType];
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (ForYou) Section %@ with type: %{public}lu", (uint8_t *)&v11, 0x16u);
  }
  if ([v3 groupType] == 6)
  {
    if ([v3 numberOfItems] >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        v7 = [v3 itemAtIndex:v6];
        if ([v7 itemType] == 2)
        {
          id v8 = [v7 playlist];
        }
        else if ([v7 itemType] == 1)
        {
          id v8 = [v7 album];
        }
        else
        {
          id v8 = v7;
        }
        v9 = v8;
        [*(id *)(a1 + 32) _processRecentMusicItem:v8 section:v3 identifier:@"ForYou"];

        ++v6;
      }
      while (v6 < [v3 numberOfItems]);
    }
  }
  else
  {
    v10 = NMLogForCategory(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v3;
      _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (ForYou) Ignored section: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_206(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = NMLogForCategory(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 title];
    *(_DWORD *)buf = 138412546;
    __int16 v13 = v7;
    __int16 v14 = 2050;
    uint64_t v15 = [v5 sectionType];
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Heavy Rotation) Section %@ with type: %{public}lu", buf, 0x16u);
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) results];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_207;
  v10[3] = &unk_264633F80;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v9 = v5;
  [v8 enumerateItemsInSectionAtIndex:a3 usingBlock:v10];
}

uint64_t __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_207(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _processRecentMusicItem:a2 section:*(void *)(a1 + 40) identifier:@"Heavy Rotation"];
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a2;
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (v7 >= [*(id *)(a1 + 32) minimumNumberOfRecentMusicModelObjects])
  {
    id v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) minimumNumberOfRecentMusicModelObjects];
      int v10 = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Library) Reached maximum of %lu items.", (uint8_t *)&v10, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) _processRecentMusicItem:v6 section:0 identifier:@"Library"];
  }
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_217(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = NMLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 title];
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    __int16 v18 = 2050;
    uint64_t v19 = [v7 sectionType];
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Editorial) Section %@ with type: %{public}lu", buf, 0x16u);
  }
  int v10 = [*(id *)(*(void *)(a1 + 32) + 56) results];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_218;
  v13[3] = &unk_264633FF8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = a4;
  v13[4] = v11;
  id v12 = v7;
  [v10 enumerateItemsInSectionAtIndex:a3 usingBlock:v13];
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_218(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (v7 >= [*(id *)(a1 + 32) minimumNumberOfRecentMusicModelObjects])
  {
    int v10 = NMLogForCategory(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 32) minimumNumberOfRecentMusicModelObjects];
      int v12 = 134217984;
      uint64_t v13 = v11;
      _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Editorial) Reached maximum of %lu items.", (uint8_t *)&v12, 0xCu);
    }

    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v6 innerObject];
    [v8 _processRecentMusicItem:v9 section:*(void *)(a1 + 40) identifier:@"Editorial"];
  }
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_223(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = NMLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 title];
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    __int16 v18 = 2050;
    uint64_t v19 = [v7 sectionType];
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Starter Pack) Section %@ with type: %{public}lu", buf, 0x16u);
  }
  int v10 = [*(id *)(*(void *)(a1 + 32) + 40) results];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_224;
  v13[3] = &unk_264634020;
  uint64_t v11 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = a4;
  v13[4] = v11;
  id v12 = v7;
  [v10 enumerateItemsInSectionAtIndex:a3 usingBlock:v13];
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_224(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a2;
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (v7 >= [*(id *)(a1 + 32) minimumNumberOfRecentMusicModelObjects])
  {
    id v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) minimumNumberOfRecentMusicModelObjects];
      int v10 = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Starter Pack) Reached maximum of %lu items.", (uint8_t *)&v10, 0xCu);
    }

    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) _processRecentMusicItem:v6 section:*(void *)(a1 + 40) identifier:@"Starter Pack"];
  }
}

- (BOOL)_recentMusicContainsModelObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  recentMusicModelObjects = self->_recentMusicModelObjects;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__NMSMusicRecommendationsRequestContext__recentMusicContainsModelObject___block_invoke;
  v8[3] = &unk_264634048;
  id v6 = v4;
  id v9 = v6;
  int v10 = &v11;
  [(NSMutableOrderedSet *)recentMusicModelObjects enumerateObjectsUsingBlock:v8];
  LOBYTE(recentMusicModelObjects) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)recentMusicModelObjects;
}

void __73__NMSMusicRecommendationsRequestContext__recentMusicContainsModelObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 identifiers];
  id v9 = [v7 identifiers];

  LODWORD(v7) = [v8 intersectsSet:v9];
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)_processRecentMusicItem:(id)a3 section:(id)a4 identifier:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = NMLogForCategory(5);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v8;
        __int16 v16 = 2114;
        id v17 = v7;
        int v10 = "[Recommendation] (Processing) (Recent Music) (%@) Ignored unsupported item: %{public}@";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 type] == 1)
  {
    id v9 = NMLogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v7;
      int v10 = "[Recommendation] (Processing) (Recent Music) (%@) Ignored smart playlist: %{public}@";
LABEL_16:
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (![(NMSMusicRecommendationsRequestContext *)self _hasDownloadableSongsForModelObject:v7])
  {
    id v9 = NMLogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v7;
      int v10 = "[Recommendation] (Processing) (RecentMusic) (%@) Ignored item without any downloadable songs: %{public}@";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v11 = [(NMSMusicRecommendationsRequestContext *)self _recentMusicContainsModelObject:v7];
  uint64_t v12 = NMLogForCategory(5);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (RecentMusic) (%@) Ignored duplicate item: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (v13)
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (%@) Picked item: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    [(NSMutableOrderedSet *)self->_recentMusicModelObjects addObject:v7];
  }
LABEL_18:
}

- (BOOL)_hasDownloadableSongsForModelObject:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 identifiers];
  id v5 = [v4 library];
  uint64_t v6 = [v5 persistentID];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F573F8];
    id v8 = (void *)MEMORY[0x263F57420];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v10 = (uint64_t *)MEMORY[0x263F573A8];
    if ((isKindOfClass & 1) == 0) {
      int v10 = (uint64_t *)MEMORY[0x263F573B0];
    }
    uint64_t v11 = *v10;
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    BOOL v13 = [NSNumber numberWithUnsignedLongLong:v6];
    int v14 = [v12 setWithObject:v13];
    uint64_t v15 = [v8 predicateWithProperty:v11 values:v14];
    v26[0] = v15;
    __int16 v16 = (void *)MEMORY[0x263F57458];
    id v17 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57378] equalToInt64:-1];
    uint64_t v18 = [v16 predicateWithPredicate:v17];
    v26[1] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    uint64_t v20 = [v7 predicateMatchingPredicates:v19];

    objc_opt_class();
    LOBYTE(v15) = objc_opt_isKindOfClass();
    v21 = (void *)MEMORY[0x263F57470];
    v22 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
    if (v15) {
      [v21 queryWithLibrary:v22 predicate:v20 orderingTerms:0 usingSections:0];
    }
    else {
    v24 = [v21 allItemsQueryWithLibrary:v22 predicate:v20 orderingTerms:0 usingSections:0];
    }

    char v23 = [v24 hasEntities];
  }
  else
  {
    char v23 = 1;
  }

  return v23;
}

- (unint64_t)minimumNumberOfRecentMusicModelObjects
{
  return self->_minimumNumberOfRecentMusicModelObjects;
}

- (void)setMinimumNumberOfRecentMusicModelObjects:(unint64_t)a3
{
  self->_minimumNumberOfRecentMusicModelObjects = a3;
}

- (MPModelResponse)heavyRotationResponse
{
  return self->_heavyRotationResponse;
}

- (MPModelResponse)libraryRecentMusicResponse
{
  return self->_libraryRecentMusicResponse;
}

- (MPModelResponse)starterPackResponse
{
  return self->_starterPackResponse;
}

- (MPModelForYouRecommendationsResponse)forYouResponse
{
  return self->_forYouResponse;
}

- (MPModelStoreBrowseResponse)editorialBrowseResponse
{
  return self->_editorialBrowseResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialBrowseResponse, 0);
  objc_storeStrong((id *)&self->_forYouResponse, 0);
  objc_storeStrong((id *)&self->_starterPackResponse, 0);
  objc_storeStrong((id *)&self->_libraryRecentMusicResponse, 0);
  objc_storeStrong((id *)&self->_heavyRotationResponse, 0);

  objc_storeStrong((id *)&self->_recentMusicModelObjects, 0);
}

@end