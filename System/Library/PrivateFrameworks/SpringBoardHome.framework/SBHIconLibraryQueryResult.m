@interface SBHIconLibraryQueryResult
+ (id)nullQueryResults;
+ (void)_hydrateSnapshot:(id)a3 fromIcons:(id)a4 query:(id)a5 outCollationStrategy:(id *)a6 outIconForItemIdentifier:(id *)a7 outSortMethodology:(unint64_t *)a8 sortComparator:(id)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQueryResult:(id)a3;
- (BOOL)isNullQueryResult;
- (NSArray)sectionIdentifiers;
- (NSArray)sectionIndexTitles;
- (NSDiffableDataSourceSnapshot)snapshot;
- (NSSet)icons;
- (SBHIconLibraryQuery)query;
- (SBHIconLibraryQueryResult)initWithQuery:(id)a3 icons:(id)a4 snapshot:(id)a5 collationStrategy:(id)a6 iconForitemIdentifier:(id)a7 sortMethodology:(unint64_t)a8;
- (SBHIconLibraryQueryResult)initWithQuery:(id)a3 icons:(id)a4 sortComparator:(id)a5;
- (SBHLocalizedIndexedCollationStrategy)collationStrategy;
- (id)_firstExtantSectionWithCollationIndexGreaterThan:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)iconAtIndexPath:(id)a3;
- (id)iconForItemIdentifier:(id)a3;
- (id)iconsForSectionAtIndex:(unint64_t)a3;
- (id)indexPathForIcon:(id)a3;
- (id)itemIdentifierForIcon:(id)a3;
- (id)sectionIdentifierAtIndex:(unint64_t)a3;
- (id)sectionIdentifierForIcon:(id)a3;
- (id)titleForSectionAtIndex:(int64_t)a3;
- (id)titleForSectionIdentifier:(id)a3;
- (int64_t)indexOfSectionForSectionIndexTitleAtIndex:(int64_t)a3;
- (int64_t)indexOfSectionIdentifier:(id)a3;
- (unint64_t)sortMethodology;
- (unint64_t)totalNumberOfItems;
- (void)setCollationStrategy:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation SBHIconLibraryQueryResult

+ (id)nullQueryResults
{
  if (nullQueryResults_onceToken != -1) {
    dispatch_once(&nullQueryResults_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)nullQueryResults_nullQueryResults;
  return v2;
}

void __45__SBHIconLibraryQueryResult_nullQueryResults__block_invoke()
{
  v0 = [SBHIconLibraryQueryResult alloc];
  v4 = [[SBHIconLibraryQuery alloc] initWithSearchString:0];
  v1 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v2 = [(SBHIconLibraryQueryResult *)v0 initWithQuery:v4 icons:v1 sortComparator:0];
  v3 = (void *)nullQueryResults_nullQueryResults;
  nullQueryResults_nullQueryResults = v2;
}

- (SBHIconLibraryQueryResult)initWithQuery:(id)a3 icons:(id)a4 snapshot:(id)a5 collationStrategy:(id)a6 iconForitemIdentifier:(id)a7 sortMethodology:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SBHIconLibraryQueryResult;
  v20 = [(SBHIconLibraryQueryResult *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_query, a3);
    uint64_t v22 = [v16 copy];
    icons = v21->_icons;
    v21->_icons = (NSSet *)v22;

    uint64_t v24 = [v17 copy];
    snapshot = v21->_snapshot;
    v21->_snapshot = (NSDiffableDataSourceSnapshot *)v24;

    objc_storeStrong((id *)&v21->_collationStrategy, a6);
    uint64_t v26 = [v19 copy];
    iconForItemIdentifier = v21->_iconForItemIdentifier;
    v21->_iconForItemIdentifier = (NSDictionary *)v26;

    v21->_sortMethodology = a8;
    uint64_t v28 = _gQueryResultIdx++;
    v21->_totalNumberOfItems = 0x7FFFFFFFFFFFFFFFLL;
    v21->_queryResultIdx = v28;
  }

  return v21;
}

- (SBHIconLibraryQueryResult)initWithQuery:(id)a3 icons:(id)a4 sortComparator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  uint64_t v18 = 1;
  id v16 = 0;
  id v17 = 0;
  [(id)objc_opt_class() _hydrateSnapshot:v11 fromIcons:v9 query:v10 outCollationStrategy:&v17 outIconForItemIdentifier:&v16 outSortMethodology:&v18 sortComparator:v8];

  id v12 = v17;
  id v13 = v16;
  v14 = [(SBHIconLibraryQueryResult *)self initWithQuery:v10 icons:v9 snapshot:v11 collationStrategy:v12 iconForitemIdentifier:v13 sortMethodology:v18];

  return v14;
}

- (BOOL)isEqualToQueryResult:(id)a3
{
  v4 = (SBHIconLibraryQueryResult *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (self == v4)
  {
    BOOL v19 = 1;
    goto LABEL_10;
  }
  v6 = [(SBHIconLibraryQueryResult *)v4 snapshot];
  v7 = [(SBHIconLibraryQueryResult *)self snapshot];
  int v8 = BSEqualObjects();

  if (!v8) {
    goto LABEL_8;
  }
  id v9 = [(SBHIconLibraryQueryResult *)v5 query];
  id v10 = [(SBHIconLibraryQueryResult *)self query];
  int v11 = BSEqualObjects();

  if (!v11) {
    goto LABEL_8;
  }
  id v12 = [(SBHIconLibraryQueryResult *)v5 icons];
  id v13 = [(SBHIconLibraryQueryResult *)self icons];
  int v14 = BSEqualObjects();

  if (!v14) {
    goto LABEL_8;
  }
  id v15 = [(SBHIconLibraryQueryResult *)v5 collationStrategy];
  id v16 = [(SBHIconLibraryQueryResult *)self collationStrategy];
  int v17 = BSEqualObjects();

  if (v17)
  {
    uint64_t v18 = [(SBHIconLibraryQueryResult *)v5 sortMethodology];
    BOOL v19 = v18 == [(SBHIconLibraryQueryResult *)self sortMethodology];
  }
  else
  {
LABEL_8:
    BOOL v19 = 0;
  }
LABEL_10:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHIconLibraryQueryResult *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(SBHIconLibraryQueryResult *)self isEqualToQueryResult:v4];
  }

  return v5;
}

- (BOOL)isNullQueryResult
{
  v3 = +[SBHIconLibraryQueryResult nullQueryResults];
  LOBYTE(self) = [(SBHIconLibraryQueryResult *)self isEqual:v3];

  return (char)self;
}

+ (void)_hydrateSnapshot:(id)a3 fromIcons:(id)a4 query:(id)a5 outCollationStrategy:(id *)a6 outIconForItemIdentifier:(id *)a7 outSortMethodology:(unint64_t *)a8 sortComparator:(id)a9
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v11 = a4;
  id v53 = a5;
  id v54 = a9;
  id v12 = [v53 searchString];
  uint64_t v46 = [v12 length];

  v48 = [MEMORY[0x1E4F1CA60] dictionary];
  id v13 = objc_opt_new();
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v11;
  uint64_t v15 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    LOBYTE(v17) = 0;
    uint64_t v18 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "sbh_iconLibraryItemIdentifier");
        objc_msgSend(v13, "bs_setSafeObject:forKey:", v20, v21);

        if (v17)
        {
          int v17 = 1;
        }
        else
        {
          id v22 = v20;
          if ([v22 isBookmarkIcon])
          {
            v23 = [v22 webClip];
            int v17 = [v23 isAppClip];
          }
          else
          {
            int v17 = 0;
          }
        }
        uint64_t v24 = (void *)MEMORY[0x1E4F4B7E0];
        v25 = [v20 applicationBundleID];
        uint64_t v26 = [v24 applicationWithBundleIdentifier:v25];

        if (([v26 isHidden] & 1) == 0) {
          [v14 addObject:v20];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v16);
  }
  else
  {
    int v17 = 0;
  }

  if (v46)
  {
    uint64_t v74 = SBHLibrarySectionIdentifierNone;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
    uint64_t v28 = 0;
  }
  else
  {
    if ([v14 count])
    {
      BSDispatchQueueAssertNotMain();
      if (v17) {
        +[SBHLocalizedIndexedCollationStrategy dimSumCollationStrategy];
      }
      else {
      uint64_t v28 = +[SBHLocalizedIndexedCollationStrategy defaultCollationStrategy];
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    v27 = [v28 sectionTitles];
  }
  v47 = v27;
  uint64_t v29 = [v27 count];
  objc_super v30 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v29];
  v31 = [MEMORY[0x1E4F28F50] pointerArrayWithOptions:0];
  [v31 setCount:v29];
  if (v46)
  {
    [v30 addObject:SBHLibrarySectionIdentifierNone];
    v32 = v52;
  }
  else
  {
    v32 = v52;
    if (v29)
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        v34 = SBHLibrarySectionIdentifierForSectionWithIndex(v28, j);
        [v30 addObject:v34];
      }
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke;
  aBlock[3] = &unk_1E6AB3500;
  id v35 = v14;
  id v64 = v35;
  BOOL v69 = v46 == 0;
  id v36 = v28;
  id v65 = v36;
  id v37 = v30;
  id v66 = v37;
  id v38 = v48;
  id v67 = v38;
  id v39 = v31;
  id v68 = v39;
  v40 = (void (**)(void))_Block_copy(aBlock);
  v41 = v40;
  if (v36) {
    dispatch_sync(MEMORY[0x1E4F14428], v40);
  }
  else {
    v40[2](v40);
  }
  if (a8)
  {
    unint64_t v42 = v36 != 0;
    if (v54) {
      unint64_t v42 = 2;
    }
    *a8 = v42;
  }
  if (v32)
  {
    v43 = [v39 allObjects];
    [v32 appendSectionsWithIdentifiers:v43];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke_2;
    v56[3] = &unk_1E6AB3528;
    id v57 = v38;
    BOOL v62 = v46 == 0;
    id v58 = v36;
    id v61 = v54;
    id v59 = v53;
    id v60 = v32;
    v44 = (void (**)(void))_Block_copy(v56);
    v45 = v44;
    if (v36) {
      dispatch_sync(MEMORY[0x1E4F14428], v44);
    }
    else {
      v44[2](v44);
    }
  }
  if (a6) {
    *a6 = v36;
  }
  if (a7) {
    *a7 = v13;
  }
}

void __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 72)) {
          uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "sectionForObject:collationStringSelector:", *(void *)(*((void *)&v11 + 1) + 8 * i), sel__sbhIconLibraryCollationString, (void)v11);
        }
        else {
          uint64_t v8 = 0;
        }
        id v9 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v8, (void)v11);
        id v10 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
        if (!v10)
        {
          id v10 = [MEMORY[0x1E4F1CA48] array];
          [*(id *)(a1 + 56) setObject:v10 forKeyedSubscript:v9];
          [*(id *)(a1 + 64) replacePointerAtIndex:v8 withPointer:v9];
        }
        [v10 addObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      long long v14 = sel__sbhIconLibraryCollationString;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, v14);
        if (*(unsigned char *)(a1 + 72))
        {
          id v9 = *(void **)(a1 + 40);
          if (v9)
          {
            id v10 = [v9 sortedArrayFromArray:v8 collationStringSelector:v14];
            int v11 = 0;
            goto LABEL_14;
          }
          uint64_t v12 = 0;
LABEL_12:
          int v11 = 0;
          goto LABEL_13;
        }
        uint64_t v12 = *(void *)(a1 + 64);
        if (v12) {
          goto LABEL_12;
        }
        uint64_t v12 = [*(id *)(a1 + 48) comparator];
        int v11 = 1;
        v1 = (void *)v12;
LABEL_13:
        id v10 = [v8 sortedArrayUsingComparator:v12];
LABEL_14:
        long long v13 = objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_117_0);

        if (v11) {
        [*(id *)(a1 + 56) appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[SBHIconLibraryQueryResult allocWithZone:a3];
  uint64_t v5 = (void *)[(SBHIconLibraryQuery *)self->_query copy];
  uint64_t v6 = (void *)[(NSSet *)self->_icons copy];
  uint64_t v7 = (void *)[(NSDiffableDataSourceSnapshot *)self->_snapshot copy];
  collationStrategy = self->_collationStrategy;
  id v9 = (void *)[(NSDictionary *)self->_iconForItemIdentifier copy];
  id v10 = [(SBHIconLibraryQueryResult *)v4 initWithQuery:v5 icons:v6 snapshot:v7 collationStrategy:collationStrategy iconForitemIdentifier:v9 sortMethodology:self->_sortMethodology];

  return v10;
}

- (NSArray)sectionIdentifiers
{
  return [(NSDiffableDataSourceSnapshot *)self->_snapshot sectionIdentifiers];
}

- (unint64_t)totalNumberOfItems
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t totalNumberOfItems = self->_totalNumberOfItems;
  if (totalNumberOfItems == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(NSDiffableDataSourceSnapshot *)self->_snapshot sectionIdentifiers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t totalNumberOfItems = 0;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          totalNumberOfItems += [(NSDiffableDataSourceSnapshot *)self->_snapshot numberOfItemsInSection:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t totalNumberOfItems = 0;
    }

    self->_unint64_t totalNumberOfItems = totalNumberOfItems;
  }
  return totalNumberOfItems;
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return [(NSDiffableDataSourceSnapshot *)self->_snapshot indexOfSectionIdentifier:a3];
}

- (id)itemIdentifierForIcon:(id)a3
{
  id v3 = a3;
  if ([v3 isLeafIcon])
  {
    uint64_t v4 = objc_msgSend(v3, "sbh_iconLibraryItemIdentifier");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)sectionIdentifierForIcon:(id)a3
{
  id v4 = a3;
  query = self->_query;
  uint64_t v6 = self->_collationStrategy;
  uint64_t v7 = query;
  uint64_t v8 = [(SBHIconLibraryQuery *)v7 searchString];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = (id)SBHLibrarySectionIdentifierNone;
  }
  else
  {
    long long v11 = [(SBHLocalizedIndexedCollationStrategy *)v6 sectionTitles];
    unint64_t v12 = [(SBHLocalizedIndexedCollationStrategy *)v6 sectionForObject:v4 collationStringSelector:sel__sbhIconLibraryCollationString];
    if (v12 >= [v11 count])
    {
      id v10 = 0;
    }
    else
    {
      long long v13 = [v11 objectAtIndex:v12];
      long long v14 = [(SBHIconLibraryQuery *)v7 searchString];
      uint64_t v15 = [v14 length];

      if (v15)
      {
        id v16 = (id)SBHLibrarySectionIdentifierNone;
      }
      else
      {
        id v16 = [NSString stringWithFormat:@"section-(%lu)-%@-indexable", v12, v13];
      }
      id v10 = v16;
    }
  }

  return v10;
}

- (id)iconForItemIdentifier:(id)a3
{
  return [(NSDictionary *)self->_iconForItemIdentifier objectForKeyedSubscript:a3];
}

- (id)titleForSectionIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:SBHLibrarySectionIdentifierNone])
  {
    uint64_t v5 = &stru_1F2FA0300;
  }
  else
  {
    uint64_t v6 = [(SBHLocalizedIndexedCollationStrategy *)self->_collationStrategy sectionTitles];
    id v7 = v4;
    uint64_t v8 = objc_msgSend(v7, "rangeOfString:options:range:", @""), 0, 9, objc_msgSend(v7, "length") - 9);
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v11 = objc_msgSend(v7, "substringWithRange:", 9, v8 + v9);
      uint64_t v10 = [v11 integerValue];
    }
    uint64_t v5 = [v6 objectAtIndexedSubscript:v10];
  }
  return v5;
}

- (NSArray)sectionIndexTitles
{
  return [(SBHLocalizedIndexedCollationStrategy *)self->_collationStrategy sectionIndexTitles];
}

- (int64_t)indexOfSectionForSectionIndexTitleAtIndex:(int64_t)a3
{
  uint64_t v5 = SBHLibrarySectionIdentifierForSectionWithIndex(self->_collationStrategy, a3);
  uint64_t v6 = [(SBHIconLibraryQueryResult *)self snapshot];
  id v7 = [v6 sectionIdentifiers];

  if ([v7 containsObject:v5])
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [(SBHIconLibraryQueryResult *)self _firstExtantSectionWithCollationIndexGreaterThan:a3];
  }
  uint64_t v9 = v8;
  if (v8) {
    int64_t v10 = [v7 indexOfObject:v8];
  }
  else {
    int64_t v10 = [v7 count] - 1;
  }

  return v10;
}

- (id)_firstExtantSectionWithCollationIndexGreaterThan:(int64_t)a3
{
  uint64_t v5 = [(SBHIconLibraryQueryResult *)self snapshot];
  uint64_t v6 = [v5 sectionIdentifiers];

  id v7 = [(SBHLocalizedIndexedCollationStrategy *)self->_collationStrategy sectionIndexTitles];
  unint64_t v8 = [v7 count];

  unint64_t v9 = a3 + 1;
  if (v9 >= v8)
  {
LABEL_4:
    int64_t v10 = 0;
  }
  else
  {
    while (1)
    {
      int64_t v10 = SBHLibrarySectionIdentifierForSectionWithIndex(self->_collationStrategy, v9);
      if ([v6 containsObject:v10]) {
        break;
      }

      if (v8 == ++v9) {
        goto LABEL_4;
      }
    }
  }

  return v10;
}

- (id)indexPathForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHIconLibraryQueryResult *)self sectionIdentifierForIcon:v4];
  if (v5)
  {
    uint64_t v6 = [(SBHIconLibraryQueryResult *)self itemIdentifierForIcon:v4];
    int64_t v7 = [(SBHIconLibraryQueryResult *)self indexOfSectionIdentifier:v5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = 0;
    }
    else
    {
      int64_t v9 = v7;
      int64_t v10 = [(SBHIconLibraryQueryResult *)self snapshot];
      long long v11 = [v10 itemIdentifiersInSectionWithIdentifier:v5];
      uint64_t v12 = [v11 indexOfObject:v6];

      unint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:v9];
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)sectionIdentifierAtIndex:(unint64_t)a3
{
  id v4 = [(SBHIconLibraryQueryResult *)self sectionIdentifiers];
  if ([v4 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndex:a3];
  }

  return v5;
}

- (id)iconAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SBHIconLibraryQueryResult sectionIdentifierAtIndex:](self, "sectionIdentifierAtIndex:", [v4 indexAtPosition:0]);
  if (v5)
  {
    uint64_t v6 = [(SBHIconLibraryQueryResult *)self snapshot];
    int64_t v7 = [v6 itemIdentifiersInSectionWithIdentifier:v5];
    if (!v7
      || (unint64_t v8 = [v4 indexAtPosition:1], v8 == 0x7FFFFFFFFFFFFFFFLL)
      || (unint64_t v9 = v8, v8 >= [v7 count]))
    {
      long long v11 = 0;
    }
    else
    {
      int64_t v10 = [v7 objectAtIndex:v9];
      long long v11 = [(SBHIconLibraryQueryResult *)self iconForItemIdentifier:v10];
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (id)titleForSectionAtIndex:(int64_t)a3
{
  uint64_t v5 = [(SBHIconLibraryQueryResult *)self sectionIdentifiers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];

  int64_t v7 = [(SBHIconLibraryQueryResult *)self titleForSectionIdentifier:v6];

  return v7;
}

- (id)iconsForSectionAtIndex:(unint64_t)a3
{
  id v4 = [(SBHIconLibraryQueryResult *)self sectionIdentifierAtIndex:a3];
  uint64_t v5 = [(SBHIconLibraryQueryResult *)self snapshot];
  uint64_t v6 = [v5 itemIdentifiersInSectionWithIdentifier:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SBHIconLibraryQueryResult_iconsForSectionAtIndex___block_invoke;
  v9[3] = &unk_1E6AB0858;
  v9[4] = self;
  int64_t v7 = objc_msgSend(v6, "bs_mapNoNulls:", v9);

  return v7;
}

uint64_t __52__SBHIconLibraryQueryResult_iconsForSectionAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) iconForItemIdentifier:a2];
}

- (SBHIconLibraryQuery)query
{
  return self->_query;
}

- (NSSet)icons
{
  return self->_icons;
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (unint64_t)sortMethodology
{
  return self->_sortMethodology;
}

- (SBHLocalizedIndexedCollationStrategy)collationStrategy
{
  return self->_collationStrategy;
}

- (void)setCollationStrategy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collationStrategy, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_iconForItemIdentifier, 0);
}

@end