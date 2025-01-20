@interface SBHLibraryMutableCategoryMap
- (void)addApplicationIdentifier:(id)a3 forCategoryIdentifier:(id)a4;
- (void)addCategoryIdentifier:(id)a3;
- (void)removeCategoryIdentifier:(id)a3;
- (void)setLocalizedCategoryName:(id)a3 forCategoryIdentifier:(id)a4;
- (void)setSortedApplicationIdentifiers:(id)a3 forCategoryIdentifier:(id)a4;
- (void)sortApplicationIdentifiersForCategoryIdentifier:(id)a3 descriptors:(id)a4;
- (void)updateRecentlyAddedCategoryFromMap:(id)a3;
@end

@implementation SBHLibraryMutableCategoryMap

- (void)setSortedApplicationIdentifiers:(id)a3 forCategoryIdentifier:(id)a4
{
  id v9 = a3;
  v6 = self->super._sortedApplicationIdentifiersByCategoryIdentifier;
  id v7 = a4;
  uint64_t v8 = [v7 predictionCategoryID];
  if ([v9 count] || v8 == 7) {
    [(NSMutableDictionary *)v6 setObject:v9 forKeyedSubscript:v7];
  }
  else {
    [(NSMutableDictionary *)v6 removeObjectForKey:v7];
  }
}

- (void)addCategoryIdentifier:(id)a3
{
}

- (void)removeCategoryIdentifier:(id)a3
{
  sortedApplicationIdentifiersByCategoryIdentifier = self->super._sortedApplicationIdentifiersByCategoryIdentifier;
  id v5 = a3;
  [(NSMutableDictionary *)sortedApplicationIdentifiersByCategoryIdentifier removeObjectForKey:v5];
  [(NSMutableDictionary *)self->super._localizedCategoryNameByCategoryIdentifier removeObjectForKey:v5];
  [(NSMutableOrderedSet *)self->super._categoryIdentifiers removeObject:v5];
}

- (void)setLocalizedCategoryName:(id)a3 forCategoryIdentifier:(id)a4
{
  id v8 = a3;
  v6 = self->super._localizedCategoryNameByCategoryIdentifier;
  id v7 = a4;
  if ([v8 length]) {
    [(NSMutableDictionary *)v6 setObject:v8 forKeyedSubscript:v7];
  }
  else {
    [(NSMutableDictionary *)v6 removeObjectForKey:v7];
  }
}

- (void)sortApplicationIdentifiersForCategoryIdentifier:(id)a3 descriptors:(id)a4
{
  sortedApplicationIdentifiersByCategoryIdentifier = self->super._sortedApplicationIdentifiersByCategoryIdentifier;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)sortedApplicationIdentifiersByCategoryIdentifier objectForKeyedSubscript:v8];
  id v10 = (id)[v9 mutableCopy];

  [v10 sortUsingDescriptors:v7];
  [(SBHLibraryMutableCategoryMap *)self setSortedApplicationIdentifiers:v10 forCategoryIdentifier:v8];
}

- (void)addApplicationIdentifier:(id)a3 forCategoryIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->super._categoryIdentifiers;
  if (([(NSMutableOrderedSet *)self->super._categoryIdentifiers containsObject:v7] & 1) == 0) {
    [(NSMutableOrderedSet *)v8 addObject:v7];
  }
  id v9 = [(NSMutableDictionary *)self->super._sortedApplicationIdentifiersByCategoryIdentifier objectForKey:v7];
  if (([v9 containsObject:v6] & 1) == 0)
  {
    if (v9)
    {
      uint64_t v10 = [v9 arrayByAddingObject:v6];

      id v9 = (void *)v10;
    }
    else
    {
      v11[0] = v6;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    [(NSMutableDictionary *)self->super._sortedApplicationIdentifiersByCategoryIdentifier setObject:v9 forKey:v7];
  }
}

- (void)updateRecentlyAddedCategoryFromMap:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBHLibraryMutableCategoryMap_updateRecentlyAddedCategoryFromMap___block_invoke;
  v7[3] = &unk_1E6AAF8E8;
  id v8 = v4;
  id v9 = self;
  id v5 = v4;
  id v6 = (void (**)(void *, uint64_t))_Block_copy(v7);
  v6[2](v6, 4);
}

void __67__SBHLibraryMutableCategoryMap_updateRecentlyAddedCategoryFromMap___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) categoryIdentifierForProactiveCategoryIdentifier:a2];
  id v4 = [*(id *)(a1 + 40) categoryIdentifierForProactiveCategoryIdentifier:a2];
  if (v6)
  {
    if (!v4)
    {
      id v4 = (void *)[v6 copy];
      [*(id *)(a1 + 40) addCategoryIdentifier:v4];
    }
    id v5 = [*(id *)(a1 + 32) sortedApplicationIdentifiersForCategoryIdentifier:v6];
    [*(id *)(a1 + 40) setSortedApplicationIdentifiers:v5 forCategoryIdentifier:v4];
  }
  else
  {
    if (!v4) {
      goto LABEL_8;
    }
    [*(id *)(a1 + 40) removeCategoryIdentifier:v4];
  }

LABEL_8:
}

@end