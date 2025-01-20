@interface WBSStartPageSectionManager
+ (NSArray)allSections;
+ (WBSStartPageSectionManager)defaultManager;
- (NSArray)cloudKitStartPageSectionOrder;
- (NSArray)enabledSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (NSArray)sections;
- (NSArray)suggestionsDataSourceSections;
- (WBSStartPageSectionManager)init;
- (WBSStartPageSectionManager)initWithStorage:(id)a3;
- (id)_migrateUnknownSectionIdentifiersIntoCurrentSections:(id)a3 didChangeSections:(BOOL *)a4;
- (id)readAndValidateSections;
- (id)sectionForIdentifier:(id)a3;
- (uint64_t)ensureSection:(uint64_t)a3 enabled:(void *)a4 inSectionData:;
- (void)_updateCloudKitStartPageSectionOrderPreferenceKey;
- (void)dealloc;
- (void)invalidateCache;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reorderSectionsToMatchOrderedIdentifiers:(id)a3;
- (void)resetToDefault;
- (void)saveSections:(id)a3 andUpdateInMemoryCache:(BOOL)a4;
- (void)setSectionIdentifier:(id)a3 enabled:(BOOL)a4;
- (void)setSectionsIdentifiers:(id)a3 enabledIndexes:(id)a4;
@end

@implementation WBSStartPageSectionManager

void __53__WBSStartPageSectionManager_readAndValidateSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v10 = v5;
  v7 = [v5 identifier];
  LODWORD(v6) = [v6 containsObject:v7];

  if (v6)
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = [v10 identifier];
    [v8 addObject:v9];
  }
}

id __59__WBSStartPageSectionManager_suggestionsDataSourceSections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 identifier];
  if ([v3 isEqualToString:@"frequentlyVisitedItemIdentifier"])
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [v2 identifier];
    if ([v5 isEqualToString:@"highlightsItemIdentifier"]) {
      id v4 = v2;
    }
    else {
      id v4 = 0;
    }
  }
  return v4;
}

void __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_2(void *a1, void *a2, unint64_t a3)
{
  id v14 = a2;
  id v5 = [v14 identifier];
  int v6 = [v5 isEqualToString:@"frequentlyVisitedItemIdentifier"];

  v7 = [v14 identifier];
  int v8 = [v7 isEqualToString:@"highlightsItemIdentifier"];

  if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled]) {
    BOOL v9 = (v6 | v8) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9 && [v14 isEnabled])
  {
    uint64_t v10 = *(void *)(a1[5] + 8);
    unint64_t v11 = *(void *)(v10 + 24);
    if (v11 >= a3) {
      unint64_t v11 = a3;
    }
    *(void *)(v10 + 24) = v11;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  v12 = (void *)a1[4];
  v13 = [v14 identifier];
  [v12 setObject:0 forKeyedSubscript:v13];
}

id __55__WBSStartPageSectionManager_enabledSectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 isEnabled];
  if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
  {
    id v4 = [v2 identifier];
    int v5 = [v4 isEqualToString:@"frequentlyVisitedItemIdentifier"];

    int v6 = [v2 identifier];
    int v7 = v5 | [v6 isEqualToString:@"exploreItemIdentifier"];

    int v8 = [v2 identifier];
    char v9 = v3 & ((v7 | [v8 isEqualToString:@"highlightsItemIdentifier"]) ^ 1);

    if ((v9 & 1) == 0)
    {
LABEL_3:
      uint64_t v10 = 0;
      goto LABEL_6;
    }
  }
  else if (!v3)
  {
    goto LABEL_3;
  }
  uint64_t v10 = [v2 identifier];
LABEL_6:

  return v10;
}

void __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (WBSStartPageSectionManager)initWithStorage:(id)a3
{
  id v4 = (WBSStartPageSectionManagerStorage *)a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSStartPageSectionManager;
  int v5 = [(WBSStartPageSectionManager *)&v9 init];
  v5->_lock._os_unfair_lock_opaque = 0;
  storage = v5->_storage;
  v5->_storage = v4;
  id v7 = v4;

  [(WBSStartPageSectionManagerStorage *)v5->_storage addObserver:v5 forKeyPath:@"StartPageSections" options:0 context:kvoContext];
  return v5;
}

- (NSArray)suggestionsDataSourceSections
{
  id v2 = [(WBSStartPageSectionManager *)self sections];
  int v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_71);

  return (NSArray *)v3;
}

- (NSArray)enabledSectionIdentifiers
{
  id v2 = [(WBSStartPageSectionManager *)self sections];
  int v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_74_0);

  return (NSArray *)v3;
}

- (NSArray)sections
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedSections = self->_cachedSections;
  if (cachedSections)
  {
    int v5 = (void *)[(NSArray *)cachedSections copy];
  }
  else
  {
    ++self->_ignoreChanges;
    os_unfair_lock_unlock(p_lock);
    int v5 = -[WBSStartPageSectionManager readAndValidateSections]((const os_unfair_lock *)self);
    os_unfair_lock_lock(p_lock);
    --self->_ignoreChanges;
    objc_storeStrong((id *)&self->_cachedSections, v5);
  }
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (id)readAndValidateSections
{
  v1 = (id *)a1;
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 8);
    id v2 = [v1[1] startPageSectionDescriptors];
    int v3 = (void *)[v2 mutableCopy];

    if (v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__WBSStartPageSectionManager_readAndValidateSections__block_invoke;
      v19[3] = &unk_1E5CA01C0;
      id v20 = v5;
      id v21 = v4;
      id v6 = v4;
      id v7 = v5;
      [v3 enumerateObjectsUsingBlock:v19];
      [v3 removeObjectsAtIndexes:v6];

      char v18 = 0;
      int v8 = [v1 _migrateUnknownSectionIdentifiersIntoCurrentSections:v3 didChangeSections:&v18];
      objc_super v9 = v8;
      if (v18)
      {
        id v10 = v8;

        if (v18) {
          [v1 saveSections:v10 andUpdateInMemoryCache:0];
        }
      }
      else
      {
        id v10 = v3;
      }
      v16 = (id *)v10;
    }
    else
    {
      unint64_t v11 = [(id)objc_opt_class() allSections];
      v12 = objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_94_3);
      v13 = (void *)[v12 mutableCopy];

      objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v9 = v14;
      if (v1[1] == v14)
      {
        if ([v14 BOOLForKey:@"HideFrequentlyVisitedSites"])
        {
          uint64_t v15 = indexOfSectionWithIdentifier(v13, @"frequentlyVisitedItemIdentifier");
          if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
            [v13 removeObjectAtIndex:v15];
          }
        }
      }
      [v1 saveSections:v13 andUpdateInMemoryCache:0];
      v16 = v13;
    }
    v1 = v16;
  }
  return v1;
}

- (id)_migrateUnknownSectionIdentifiersIntoCurrentSections:(id)a3 didChangeSections:(BOOL *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(id)objc_opt_class() allSections];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke;
  v67[3] = &unk_1E5CA0148;
  id v7 = v5;
  id v68 = v7;
  [v6 enumerateObjectsUsingBlock:v67];

  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = -1;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_2;
  v55[3] = &unk_1E5CA0170;
  v57 = &v63;
  v58 = &v59;
  id v8 = v7;
  id v56 = v8;
  [v39 enumerateObjectsUsingBlock:v55];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"suggestionsItemIdentifier"];
  if (v9 && v64[3] != -1)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v8 setObject:v10 forKeyedSubscript:@"suggestionsItemIdentifier"];
  }
  os_unfair_lock_lock(&self->_lock);
  unint64_t v11 = (void *)[(NSArray *)self->_cachedSections copy];
  os_unfair_lock_unlock(&self->_lock);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_3;
  v53[3] = &unk_1E5CA0198;
  id v12 = v8;
  id v54 = v12;
  [v11 enumerateObjectsUsingBlock:v53];
  v13 = [v12 keysSortedByValueUsingSelector:sel_compare_];
  id v14 = (void *)[v39 mutableCopy];
  v36 = (void *)v9;
  v37 = v11;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(obj);
        }
        char v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ([v18 isEqualToString:@"suggestionsItemIdentifier"]) {
          int v19 = *((unsigned __int8 *)v60 + 24);
        }
        else {
          int v19 = 1;
        }
        id v20 = [[WBSStartPageSectionDescriptor alloc] initWithIdentifier:v18 enabled:v19 != 0];
        id v21 = [v12 objectForKeyedSubscript:v18];
        unsigned int v22 = [v21 unsignedIntValue];

        [v14 insertObject:v20 atIndex:v22];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
    }
    while (v15);
  }

  v23 = [MEMORY[0x1E4F1CA80] set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v24 = v14;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v70 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(v24);
        }
        v28 = [*(id *)(*((void *)&v45 + 1) + 8 * j) identifier];
        [v23 addObject:v28];
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v70 count:16];
    }
    while (v25);
  }

  v29 = [MEMORY[0x1E4F1CA80] set];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v30 = v39;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v69 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v30);
        }
        v34 = [*(id *)(*((void *)&v41 + 1) + 8 * k) identifier];
        [v29 addObject:v34];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v69 count:16];
    }
    while (v31);
  }

  *a4 = [v23 isEqualToSet:v29] ^ 1;
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v24;
}

+ (NSArray)allSections
{
  v4[8] = *MEMORY[0x1E4F143B8];
  v4[0] = @"favoritesItemIdentifier";
  v4[1] = @"suggestionsItemIdentifier";
  v4[2] = @"frequentlyVisitedItemIdentifier";
  v4[3] = @"highlightsItemIdentifier";
  v4[4] = @"privacyReportIdentifier";
  v4[5] = @"readingListItemIdentifier";
  v4[6] = @"recentlyClosedTabsInTabGroupItemIdentifier";
  v4[7] = @"cloudTabsItemIdentifier";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];
  return (NSArray *)v2;
}

- (void)dealloc
{
  [(WBSStartPageSectionManagerStorage *)self->_storage removeObserver:self forKeyPath:@"StartPageSections" context:kvoContext];
  v3.receiver = self;
  v3.super_class = (Class)WBSStartPageSectionManager;
  [(WBSStartPageSectionManager *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSections, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

+ (WBSStartPageSectionManager)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_106);
  }
  id v2 = (void *)defaultManager_defaultManager;
  return (WBSStartPageSectionManager *)v2;
}

void __44__WBSStartPageSectionManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(WBSStartPageSectionManager);
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;
}

- (WBSStartPageSectionManager)init
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = [(WBSStartPageSectionManager *)self initWithStorage:v3];

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kvoContext == a6)
  {
    [(WBSStartPageSectionManager *)self invalidateCache];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WBSStartPageSectionManager;
    -[WBSStartPageSectionManager observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSArray)sectionIdentifiers
{
  id v2 = [(WBSStartPageSectionManager *)self sections];
  objc_super v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_77);

  return (NSArray *)v3;
}

uint64_t __48__WBSStartPageSectionManager_sectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)sectionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSStartPageSectionManager *)self sections];
  uint64_t v6 = indexOfSectionWithIdentifier(v5, v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (NSArray)cloudKitStartPageSectionOrder
{
  -[WBSStartPageSectionManager _updateCloudKitStartPageSectionOrderPreferenceKey](self);
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_super v3 = [v2 arrayForKey:*MEMORY[0x1E4F980B8]];

  return (NSArray *)v3;
}

- (void)_updateCloudKitStartPageSectionOrderPreferenceKey
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = *MEMORY[0x1E4F980B8];
    id v4 = [v2 arrayForKey:*MEMORY[0x1E4F980B8]];

    id v5 = (void *)[v4 mutableCopy];
    uint64_t v6 = [a1 sectionIdentifiers];
    id v7 = v6;
    if (v5)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __79__WBSStartPageSectionManager__updateCloudKitStartPageSectionOrderPreferenceKey__block_invoke;
      v9[3] = &unk_1E5CA00D0;
      id v10 = v6;
      id v11 = v4;
      id v7 = v7;
      [v5 sortUsingComparator:v9];
    }
    else
    {
      id v5 = (void *)[v6 mutableCopy];
    }

    id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 setObject:v5 forKey:v3];
  }
}

uint64_t __79__WBSStartPageSectionManager__updateCloudKitStartPageSectionOrderPreferenceKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) indexOfObject:v5];
  uint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = [*(id *)(a1 + 40) indexOfObject:v5];
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = [*(id *)(a1 + 40) indexOfObject:v6];
  }
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
  id v10 = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

- (void)resetToDefault
{
}

- (void)reorderSectionsToMatchOrderedIdentifiers:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        v13 = [NSNumber numberWithInteger:v9 + v11];
        [v5 setObject:v13 forKeyedSubscript:v12];

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v9 += v11;
    }
    while (v8);
  }

  id v14 = [(WBSStartPageSectionManager *)self sections];
  uint64_t v15 = (void *)[v14 mutableCopy];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__WBSStartPageSectionManager_reorderSectionsToMatchOrderedIdentifiers___block_invoke;
  v19[3] = &unk_1E5CA00F8;
  id v16 = v5;
  id v20 = v16;
  [v15 sortUsingComparator:v19];
  if (([v14 isEqualToArray:v15] & 1) == 0)
  {
    char v18 = 0;
    uint64_t v17 = [(WBSStartPageSectionManager *)self _migrateUnknownSectionIdentifiersIntoCurrentSections:v15 didChangeSections:&v18];

    [(WBSStartPageSectionManager *)self saveSections:v17 andUpdateInMemoryCache:1];
    uint64_t v15 = (void *)v17;
  }
}

uint64_t __71__WBSStartPageSectionManager_reorderSectionsToMatchOrderedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 identifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v6 identifier];

  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (v8)
  {
    if (v11) {
      uint64_t v12 = [v8 compare:v11];
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (void)setSectionsIdentifiers:(id)a3 enabledIndexes:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__WBSStartPageSectionManager_setSectionsIdentifiers_enabledIndexes___block_invoke;
  v15[3] = &unk_1E5CA0120;
  id v16 = v9;
  id v17 = v6;
  id v10 = v6;
  id v11 = v9;
  uint64_t v12 = objc_msgSend(v8, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v15);

  char v14 = 0;
  v13 = [(WBSStartPageSectionManager *)self _migrateUnknownSectionIdentifiersIntoCurrentSections:v12 didChangeSections:&v14];

  [(WBSStartPageSectionManager *)self saveSections:v13 andUpdateInMemoryCache:1];
}

WBSStartPageSectionDescriptor *__68__WBSStartPageSectionManager_setSectionsIdentifiers_enabledIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    id v6 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:]([WBSStartPageSectionDescriptor alloc], "initWithIdentifier:enabled:", v5, [*(id *)(a1 + 40) containsIndex:a3]);
  }

  return v6;
}

void __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v12 = v5;
  uint64_t v7 = [v5 identifier];
  id v8 = [v6 objectForKey:v7];

  if (v8)
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = *(void **)(a1 + 32);
    id v11 = [v12 identifier];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
}

- (void)setSectionIdentifier:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(WBSStartPageSectionManager *)self sections];
  id v8 = (void *)[v7 mutableCopy];

  if (-[WBSStartPageSectionManager ensureSection:enabled:inSectionData:]((uint64_t)self, v6, v4, v8))
  {
    [(WBSStartPageSectionManager *)self saveSections:v8 andUpdateInMemoryCache:1];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v11 = @"WBSStartPageSectionManagerSectionUserInfoKey";
    v12[0] = v6;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v9 postNotificationName:@"WBSStartPageSectionManagerSectionVisibilityChangedNotification" object:self userInfo:v10];
  }
}

- (uint64_t)ensureSection:(uint64_t)a3 enabled:(void *)a4 inSectionData:
{
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (!a1)
  {
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = indexOfSectionWithIdentifier(v8, v7);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [[WBSStartPageSectionDescriptor alloc] initWithIdentifier:v7 enabled:a3];
    [v9 addObject:v11];
  }
  else
  {
    uint64_t v12 = v10;
    id v11 = [v9 objectAtIndexedSubscript:v10];
    if ([(WBSStartPageSectionDescriptor *)v11 isEnabled] == a3)
    {
      uint64_t v14 = 0;
      goto LABEL_8;
    }
    v13 = [(WBSStartPageSectionDescriptor *)v11 sectionWithEnabled:a3];
    [v9 setObject:v13 atIndexedSubscript:v12];
  }
  uint64_t v14 = 1;
LABEL_8:

LABEL_9:
  return v14;
}

- (void)invalidateCache
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedSections = self->_cachedSections;
  self->_cachedSections = 0;

  int64_t ignoreChanges = self->_ignoreChanges;
  os_unfair_lock_unlock(p_lock);
  if (!ignoreChanges)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"WBSStartPageSectionManagerSectionsDidChangeNotification" object:self];
  }
}

- (void)saveSections:(id)a3 andUpdateInMemoryCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  -[WBSStartPageSectionManagerStorage setStartPageSectionDescriptors:](self->_storage, "setStartPageSectionDescriptors:");
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v6 = (NSArray *)[v8 copy];
    cachedSections = self->_cachedSections;
    self->_cachedSections = v6;

    os_unfair_lock_unlock(&self->_lock);
  }
}

WBSStartPageSectionDescriptor *__53__WBSStartPageSectionManager_readAndValidateSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[WBSStartPageSectionDescriptor alloc] initWithIdentifier:v2 enabled:1];

  return v3;
}

@end