@interface SearchUIDataSourceSnapshotBuilder
- (BOOL)resultHasHorizontallyGroupedCardSections:(id)a3;
- (NSMutableSet)rowModelIdentifiers;
- (NSMutableSet)sectionModelIdentifiers;
- (NSSet)expandedCollectionSections;
- (NSSet)expandedSections;
- (SearchUIDataSourceSnapshotBuilder)init;
- (SearchUIDataSourceSnapshotBuilder)initWithExpandedSections:(id)a3 expandedCollectionSections:(id)a4;
- (SearchUIDataSourceSnapshotBuilder)initWithExpandedSections:(id)a3 expandedCollectionSections:(id)a4 rowModelIdentifiers:(id)a5 sectionModelIdentifiers:(id)a6;
- (SearchUIDataSourceSnapshotBuilder)initWithSnapshot:(id)a3;
- (id)asyncRowManagersForCardSections:(id)a3;
- (id)buildCombinedRowModelsFromRowModels:(id)a3 result:(id)a4;
- (id)buildRowModelFromCardSection:(id)a3 result:(id)a4;
- (id)buildRowModelsFromCardSections:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6;
- (id)buildRowModelsFromResult:(id)a3;
- (id)buildRowModelsFromResultSections:(id)a3 queryId:(unint64_t)a4;
- (id)buildRowModelsFromSectionModels:(id)a3;
- (id)buildSectionFromRowModels:(id)a3 section:(id)a4;
- (id)buildSectionsFromResultSections:(id)a3 queryId:(unint64_t)a4;
- (id)buildSectionsFromRowModels:(id)a3 fromSection:(id)a4;
- (id)buildSectionsFromRowModels:(id)a3 fromSections:(id)a4;
- (id)buildSnapshotForSectionModels:(id)a3;
- (id)buildSnapshotFromResultSections:(id)a3 queryId:(unint64_t)a4;
- (id)buildSnapshotFromTableModel:(id)a3;
- (id)buildUISectionFromResultSection:(id)a3 collectionSection:(id)a4;
- (id)generateComposedItemIdentifierForResults:(id)a3;
- (id)generateItemIdentifier:(id)a3 cardSection:(id)a4;
- (id)generateIterativeIdentifierForBaseIdentifier:(id)a3 withUnavailableIdentifiers:(id)a4;
- (id)generateSectionIdentifier:(id)a3 collectionSection:(id)a4;
- (id)gridLayoutsForCardSections:(id)a3;
- (id)resultsForMultiResultRowInSection:(id)a3 startingAtIndex:(unint64_t)a4;
- (void)setExpandedCollectionSections:(id)a3;
- (void)setExpandedSections:(id)a3;
- (void)setRowModelIdentifiers:(id)a3;
- (void)setSectionModelIdentifiers:(id)a3;
@end

@implementation SearchUIDataSourceSnapshotBuilder

- (SearchUIDataSourceSnapshotBuilder)initWithExpandedSections:(id)a3 expandedCollectionSections:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v10 = [(SearchUIDataSourceSnapshotBuilder *)self initWithExpandedSections:v7 expandedCollectionSections:v6 rowModelIdentifiers:v8 sectionModelIdentifiers:v9];

  return v10;
}

- (SearchUIDataSourceSnapshotBuilder)initWithExpandedSections:(id)a3 expandedCollectionSections:(id)a4 rowModelIdentifiers:(id)a5 sectionModelIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SearchUIDataSourceSnapshotBuilder;
  v15 = [(SearchUIDataSourceSnapshotBuilder *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_expandedSections, a3);
    objc_storeStrong((id *)&v16->_expandedCollectionSections, a4);
    uint64_t v17 = [v13 mutableCopy];
    rowModelIdentifiers = v16->_rowModelIdentifiers;
    v16->_rowModelIdentifiers = (NSMutableSet *)v17;

    uint64_t v19 = [v14 mutableCopy];
    sectionModelIdentifiers = v16->_sectionModelIdentifiers;
    v16->_sectionModelIdentifiers = (NSMutableSet *)v19;
  }
  return v16;
}

- (id)buildRowModelsFromResultSections:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v49 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v5;
  uint64_t v50 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v62;
    v53 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v62 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v6;
        id v7 = *(void **)(*((void *)&v61 + 1) + 8 * v6);
        v54 = objc_opt_new();
        v8 = [v7 results];
        uint64_t v9 = [v8 count];

        if (v9)
        {
          uint64_t v10 = 0;
          do
          {
            id v11 = [v7 results];
            uint64_t v12 = [v11 count] - v10;

            if ([v7 maxInitiallyVisibleResults])
            {
              id v13 = [(SearchUIDataSourceSnapshotBuilder *)self expandedSections];
              if (([v13 containsObject:v7] & 1) == 0)
              {
                uint64_t v14 = [v7 maxInitiallyVisibleResults];
                if (v12 >= (unint64_t)(v14 - v10)) {
                  uint64_t v12 = v14 - v10;
                }
              }
            }
            if (v12 < 1) {
              break;
            }
            v15 = [v7 results];
            v16 = [v15 objectAtIndexedSubscript:v10];

            uint64_t v17 = objc_opt_new();
            v18 = [(SearchUIDataSourceSnapshotBuilder *)self resultsForMultiResultRowInSection:v7 startingAtIndex:v10];
            if (v18)
            {
              uint64_t v19 = v18;
              unint64_t v20 = [v18 count];
              if (v20 >= v12) {
                unint64_t v21 = v12;
              }
              else {
                unint64_t v21 = v20;
              }
              objc_super v22 = objc_msgSend(v19, "subarrayWithRange:", 0, v21);

              if ([(SearchUIDataSourceSnapshotBuilder *)self resultHasHorizontallyGroupedCardSections:v16])
              {
                [v22 firstObject];
                uint64_t v23 = v55 = v10;
                v24 = +[SearchUIUtilities cardSectionsForRenderingResult:v23];

                v25 = [v24 firstObject];
                objc_opt_class();
                LOBYTE(v23) = objc_opt_isKindOfClass();

                v26 = [(SearchUIDataSourceSnapshotBuilder *)self generateItemIdentifier:v16 cardSection:0];
                BOOL v27 = (v23 & 1) == 0;
                uint64_t v10 = v55;
                v28 = off_1E6E71898;
                if (v27) {
                  v28 = off_1E6E71860;
                }
                v29 = (SearchUIMultiResultRowModel *)[objc_alloc(*v28) initWithResults:v22 itemIdentifier:v26 builder:self];
              }
              else
              {
                v31 = [SearchUIMultiResultRowModel alloc];
                v24 = [(SearchUIDataSourceSnapshotBuilder *)self generateComposedItemIdentifierForResults:v22];
                v29 = [(SearchUIMultiResultRowModel *)v31 initWithResults:v22 itemIdentifier:v24];
              }

              [v17 addObject:v29];
              uint64_t v56 = v10 + [v22 count] - 1;
            }
            else
            {
              if (+[SearchUIUtilities resultBlockedForScreenTime:](SearchUIUtilities, "resultBlockedForScreenTime:", v16)&& ![v16 isLocalApplicationResult])
              {
                v42 = [(SearchUIDataSourceSnapshotBuilder *)self generateItemIdentifier:v16 cardSection:0];
                v43 = [[SearchUIScreenTimeResultsRowModel alloc] initWithSection:v7 result:v16 itemIdentifier:v42];
                [v54 addObject:v43];

                break;
              }
              uint64_t v56 = v10;
              objc_super v22 = +[SearchUIUtilities cardSectionsForRenderingResult:v16];
              v29 = [(SearchUIDataSourceSnapshotBuilder *)self buildRowModelsFromCardSections:v22 result:v16 isInline:1 queryId:a4];
              v30 = [(SearchUIDataSourceSnapshotBuilder *)self buildCombinedRowModelsFromRowModels:v29 result:v16];
              [v17 addObjectsFromArray:v30];
            }
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v32 = v17;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v65 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v58 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  v37 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  v38 = [v16 sectionBundleIdentifier];
                  if ([v38 isEqual:@"com.apple.spotlight.tophits"])
                  {
                    [v37 setIsTopHit:1];
                  }
                  else
                  {
                    v39 = [v7 bundleIdentifier];
                    objc_msgSend(v37, "setIsTopHit:", objc_msgSend(v39, "isEqual:", @"com.apple.spotlight.tophits"));
                  }
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v65 count:16];
              }
              while (v34);
            }

            [v54 addObjectsFromArray:v32];
            uint64_t v10 = v56 + 1;
            v40 = [v7 results];
            unint64_t v41 = [v40 count];

            self = v53;
          }
          while (v56 + 1 < v41);
        }
        [v49 addObject:v54];

        uint64_t v6 = v51 + 1;
      }
      while (v51 + 1 != v50);
      uint64_t v44 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      uint64_t v50 = v44;
    }
    while (v44);
  }

  v45 = (void *)[v49 copy];
  return v45;
}

- (id)resultsForMultiResultRowInSection:(id)a3 startingAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 results];
  v8 = [v7 objectAtIndexedSubscript:a4];
  BOOL v9 = [(SearchUIDataSourceSnapshotBuilder *)self resultHasHorizontallyGroupedCardSections:v8];

  uint64_t v10 = [v6 results];
  unint64_t v11 = [v10 count];

  if (v11 <= a4)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    while (1)
    {
      id v13 = [v6 results];
      uint64_t v14 = [v13 objectAtIndexedSubscript:a4];

      BOOL v15 = [(SearchUIDataSourceSnapshotBuilder *)self resultHasHorizontallyGroupedCardSections:v14];
      if (![v14 renderHorizontallyWithOtherResultsInCategory] || ((v9 ^ v15) & 1) != 0) {
        break;
      }
      if (!v12) {
        uint64_t v12 = objc_opt_new();
      }
      [v12 addObject:v14];

      ++a4;
      v16 = [v6 results];
      unint64_t v17 = [v16 count];

      if (a4 >= v17) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:

  return v12;
}

- (BOOL)resultHasHorizontallyGroupedCardSections:(id)a3
{
  id v3 = a3;
  v4 = +[SearchUIUtilities cardSectionsForRenderingResult:v3];
  if ([v4 count]) {
    char v5 = [v3 renderHorizontallyWithOtherResultsInCategory];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)generateComposedItemIdentifierForResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    v8 = @"c";
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v11 = [(SearchUIDataSourceSnapshotBuilder *)self generateItemIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * v9) cardSection:0];
        uint64_t v12 = [(SearchUIDataSourceSnapshotBuilder *)self rowModelIdentifiers];
        [v12 removeObject:v11];

        v8 = [NSString stringWithFormat:@"%@-%@", v10, v11];

        ++v9;
        uint64_t v10 = v8;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    v8 = @"c";
  }
  id v13 = [(SearchUIDataSourceSnapshotBuilder *)self rowModelIdentifiers];
  uint64_t v14 = [(SearchUIDataSourceSnapshotBuilder *)self generateIterativeIdentifierForBaseIdentifier:v8 withUnavailableIdentifiers:v13];

  return v14;
}

- (NSMutableSet)rowModelIdentifiers
{
  return self->_rowModelIdentifiers;
}

- (id)generateItemIdentifier:(id)a3 cardSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 requestedTopic];
  uint64_t v9 = [v8 identifier];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = [v7 cardSectionId];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v6 identifier];
    }
    id v11 = v14;
  }
  BOOL v15 = [NSString stringWithFormat:@"%@", v11];
  long long v16 = [(SearchUIDataSourceSnapshotBuilder *)self rowModelIdentifiers];
  long long v17 = [(SearchUIDataSourceSnapshotBuilder *)self generateIterativeIdentifierForBaseIdentifier:v15 withUnavailableIdentifiers:v16];

  return v17;
}

- (id)generateIterativeIdentifierForBaseIdentifier:(id)a3 withUnavailableIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = 0;
  uint64_t v9 = v7;
  if (!v7) {
    goto LABEL_3;
  }
  while (([v6 containsObject:v9] & 1) != 0)
  {
    do
    {
LABEL_3:
      uint64_t v10 = [NSString stringWithFormat:@"%@-%ld", v7, v8];

      ++v8;
      uint64_t v9 = (void *)v10;
    }
    while (!v10);
  }
  [v6 addObject:v9];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionModelIdentifiers, 0);
  objc_storeStrong((id *)&self->_rowModelIdentifiers, 0);
  objc_storeStrong((id *)&self->_expandedCollectionSections, 0);
  objc_storeStrong((id *)&self->_expandedSections, 0);
}

- (id)buildSnapshotFromTableModel:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v22 = a3;
  id obj = [v22 tableRowModel];
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              BOOL v15 = [(SearchUIDataSourceSnapshotBuilder *)self rowModelIdentifiers];
              long long v16 = [v14 itemIdentifier];
              [v15 addObject:v16];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v5);
  }

  long long v17 = [v22 tableRowModel];
  long long v18 = [v22 sections];
  long long v19 = [(SearchUIDataSourceSnapshotBuilder *)self buildSectionsFromRowModels:v17 fromSections:v18];

  unint64_t v20 = [(SearchUIDataSourceSnapshotBuilder *)self buildSnapshotForSectionModels:v19];

  return v20;
}

- (id)buildSnapshotForSectionModels:(id)a3
{
  v74[2] = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v3 = +[SearchUIContactCache sharedCache];
  v74[0] = v3;
  uint64_t v4 = +[SearchUIScreenTimeManager sharedInstance];
  v74[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];

  uint64_t v6 = objc_opt_new();
  id v7 = [v5 arrayByAddingObject:v6];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v7;
  uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v66;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v8;
        id v9 = *(void **)(*((void *)&v65 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_new();
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v47 = v43;
        uint64_t v11 = [v47 countByEnumeratingWithState:&v61 objects:v72 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v62 != v13) {
                objc_enumerationMutation(v47);
              }
              BOOL v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v16 = [v15 rowModels];
              uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v71 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v58;
                do
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v58 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v21 = [v9 itemsToBatchPreFetchForRowModel:*(void *)(*((void *)&v57 + 1) + 8 * j)];
                    if ([v21 count]) {
                      [v10 addObjectsFromArray:v21];
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v57 objects:v71 count:16];
                }
                while (v18);
              }
            }
            uint64_t v12 = [v47 countByEnumeratingWithState:&v61 objects:v72 count:16];
          }
          while (v12);
        }

        if ([v10 count])
        {
          id v22 = [v9 cacheToPrewarm];
          uint64_t v23 = [v10 allObjects];
          [v22 getObjectsForKeys:v23 completionHandler:&__block_literal_global_43];
        }
        uint64_t v8 = v45 + 1;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v44);
  }

  v46 = objc_opt_new();
  long long v24 = objc_opt_new();
  long long v25 = objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v48 = v43;
  uint64_t v26 = [v48 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v54 != v28) {
          objc_enumerationMutation(v48);
        }
        long long v30 = *(void **)(*((void *)&v53 + 1) + 8 * k);
        [v24 addObject:v30];
        [v30 prepareForSnapshot];
        long long v31 = objc_opt_new();
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v32 = [v30 rowModels];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v69 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v50;
          do
          {
            for (uint64_t m = 0; m != v34; ++m)
            {
              if (*(void *)v50 != v35) {
                objc_enumerationMutation(v32);
              }
              [v31 addObject:*(void *)(*((void *)&v49 + 1) + 8 * m)];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v69 count:16];
          }
          while (v34);
        }

        [v25 addObject:v31];
      }
      uint64_t v27 = [v48 countByEnumeratingWithState:&v53 objects:v70 count:16];
    }
    while (v27);
  }

  [v46 appendSectionsWithIdentifiers:v24];
  if ([v24 count])
  {
    unint64_t v37 = 0;
    do
    {
      v38 = [v25 objectAtIndexedSubscript:v37];
      v39 = [v24 objectAtIndexedSubscript:v37];
      [v46 appendItemsWithIdentifiers:v38 intoSectionWithIdentifier:v39];

      ++v37;
    }
    while (v37 < [v24 count]);
  }

  return v46;
}

- (id)buildSectionsFromRowModels:(id)a3 fromSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v6 objectAtIndexedSubscript:v9];
      uint64_t v11 = [v7 objectAtIndexedSubscript:v9];
      uint64_t v12 = [(SearchUIDataSourceSnapshotBuilder *)self buildSectionsFromRowModels:v10 fromSection:v11];
      [v8 addObjectsFromArray:v12];

      ++v9;
    }
    while (v9 < [v6 count]);
  }
  uint64_t v13 = (void *)[v8 copy];

  return v13;
}

- (id)buildSectionsFromRowModels:(id)a3 fromSection:(id)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke;
  aBlock[3] = &unk_1E6E74578;
  aBlock[4] = self;
  id v8 = v7;
  id v97 = v8;
  unint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_2;
  v91[3] = &unk_1E6E745A0;
  id v73 = v11;
  id v92 = v73;
  id v12 = v10;
  id v93 = v12;
  v94 = self;
  v75 = v9;
  v95 = v75;
  uint64_t v13 = _Block_copy(v91);
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_3;
  v88[3] = &unk_1E6E745C8;
  v72 = v13;
  id v90 = v72;
  id v71 = v12;
  id v89 = v71;
  v79 = (void (**)(void *, SearchUILeadingTrailingSectionModel *))_Block_copy(v88);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v6;
  uint64_t v81 = [obj countByEnumeratingWithState:&v84 objects:v101 count:16];
  if (v81)
  {
    uint64_t v14 = *(void *)v85;
    id v74 = v8;
    v76 = self;
    uint64_t v77 = *(void *)v85;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v85 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v84 + 1) + 8 * v15);
        uint64_t v17 = [v16 cardSection];
        uint64_t v18 = [v16 queryId];
        uint64_t v19 = [v16 identifyingResult];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v17;
          uint64_t v21 = [v20 cardSections];
          uint64_t v80 = [(SearchUIDataSourceSnapshotBuilder *)self buildRowModelsFromCardSections:v21 result:v19 isInline:1 queryId:v18];

          v83 = [(SearchUIDataSourceSnapshotBuilder *)self buildUISectionFromResultSection:v8 collectionSection:v20];
          id v22 = [v20 cardSections];
          v82 = v19;
          if ([v22 count] == 2)
          {
            uint64_t v23 = [v20 cardSections];
            long long v24 = [v23 objectAtIndexedSubscript:1];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (+[SearchUIUtilities isIpad])
              {

                goto LABEL_26;
              }
              int v46 = [MEMORY[0x1E4FAE198] isMacOS];

              self = v76;
              if (v46)
              {
LABEL_26:
                v36 = objc_opt_new();
                id v47 = [v20 cardSections];
                id v48 = [v47 objectAtIndexedSubscript:0];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                long long v50 = [v20 cardSections];
                uint64_t v51 = [v50 objectAtIndexedSubscript:0];
                long long v52 = (void *)v51;
                if (isKindOfClass)
                {

                  long long v53 = [v52 cardSections];
                  long long v54 = (void *)[v53 copy];
                  unint64_t v55 = 0x1E4F1C000;
                }
                else
                {
                  uint64_t v100 = v51;
                  unint64_t v55 = 0x1E4F1C000uLL;
                  long long v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
                  long long v53 = v52;
                  long long v52 = v50;
                }
                [v36 setLeadingCardSections:v54];

                long long v63 = [v20 cardSections];
                long long v64 = [v63 objectAtIndexedSubscript:1];
                v99 = v64;
                long long v65 = [*(id *)(v55 + 2424) arrayWithObjects:&v99 count:1];
                [v36 setTrailingCardSections:v65];

                v39 = [[SearchUILeadingTrailingSectionModel alloc] initWithCardSection:v36 rowModels:obj result:v82 queryId:v18 section:v83];
                v79[2](v79, v39);
                id v8 = v74;
                self = v76;
                uint64_t v14 = v77;
                unint64_t v37 = (void *)v80;
LABEL_33:

                uint64_t v19 = v82;
                goto LABEL_34;
              }
LABEL_18:
              uint64_t v33 = [v20 collectionStyle];
              uint64_t v34 = v33;
              if (v33) {
                id v35 = v33;
              }
              else {
                id v35 = (id)objc_opt_new();
              }
              v36 = v35;
              unint64_t v37 = (void *)v80;

              v38 = [(SearchUIDataSourceSnapshotBuilder *)self expandedCollectionSections];
              v39 = [v36 searchUISectionModelForCardRowModels:v80 section:v83 expandedCollectionSections:v38];

              if (v39) {
                v79[2](v79, v39);
              }
              goto LABEL_33;
            }

            self = v76;
          }

          goto LABEL_18;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v25 = [(SearchUIDataSourceSnapshotBuilder *)self generateItemIdentifier:v19 cardSection:v17];
          id v26 = v17;
          uint64_t v27 = [[SearchUIHorizontallyScrollingCardSectionRowModel alloc] initWithResult:v19 cardSection:v26 queryId:v18 itemIdentifier:v25 builder:self];

          uint64_t v28 = [(SearchUIDataSourceSnapshotBuilder *)self buildUISectionFromResultSection:v8 collectionSection:0];
          long long v29 = [(SearchUIHorizontallyScrollingCardSectionRowModel *)v27 cardSectionRowModels];
          long long v30 = +[SearchUISectionModel sectionModelWithScrollingRowModels:v29 numberOfRows:[(SearchUIHorizontallyScrollingCardSectionRowModel *)v27 numberOfRows] section:v28];
          v79[2](v79, v30);

          uint64_t v14 = v77;
LABEL_15:

          goto LABEL_34;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v25 = [v16 cardSectionRowModels];
          long long v31 = v75[2]();
          id v32 = +[SearchUISectionModel sectionModelWithGridRowModels:v25 numberOfColumns:0 gridStyle:0 section:v31 expandedCollectionSections:0];
          v79[2](v79, v32);

          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v40 = v16;
          unint64_t v41 = [v40 cardSectionRowModels];
          uint64_t v42 = [v40 numberOfRows];
          id v43 = v75[2]();

          uint64_t v44 = v42;
          uint64_t v14 = v77;
          uint64_t v45 = +[SearchUISectionModel sectionModelWithScrollingRowModels:v41 numberOfRows:v44 section:v43];
          v79[2](v79, v45);

LABEL_30:
          goto LABEL_34;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v41 = objc_opt_new();
          long long v56 = (void *)MEMORY[0x1E4F9A378];
          id v57 = v16;
          long long v58 = [v17 sectionTitle];
          long long v59 = [v56 textWithString:v58];
          [v41 setTitle:v59];

          id v98 = v57;
          long long v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
          long long v61 = [(SearchUIDataSourceSnapshotBuilder *)self buildUISectionFromResultSection:v8 collectionSection:v41];

          long long v62 = +[SearchUISectionModel sectionModelWithScrollingRowModels:v60 numberOfRows:1 section:v61];
          v79[2](v79, v62);

          uint64_t v14 = v77;
          goto LABEL_30;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v66 = [SearchUILeadingTrailingSectionModel alloc];
          long long v67 = v75[2]();
          long long v25 = [(SearchUILeadingTrailingSectionModel *)v66 initWithCardSection:v17 rowModels:MEMORY[0x1E4F1CBF0] result:v19 queryId:v18 section:v67];

          v79[2](v79, v25);
          goto LABEL_15;
        }
        [v73 addObject:v16];
LABEL_34:

        ++v15;
      }
      while (v81 != v15);
      uint64_t v68 = [obj countByEnumeratingWithState:&v84 objects:v101 count:16];
      uint64_t v81 = v68;
    }
    while (v68);
  }

  v72[2](v72);
  id v69 = v71;

  return v69;
}

uint64_t __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v3 = *(void **)(a1 + 48);
    uint64_t v5 = (void *)[*(id *)(a1 + 32) copy];
    id v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v7 = [v3 buildSectionFromRowModels:v5 section:v6];
    objc_msgSend(v4, "fm_safeAddObject:", v7);

    id v8 = *(void **)(a1 + 32);
    return [v8 removeAllObjects];
  }
  return result;
}

uint64_t __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) buildUISectionFromResultSection:*(void *)(a1 + 40) collectionSection:0];
}

- (id)buildUISectionFromResultSection:(id)a3 collectionSection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SearchUIDataSourceSnapshotBuilder *)self generateSectionIdentifier:v7 collectionSection:v6];
  unint64_t v9 = +[SearchUISection sectionWithResultSection:v7 collectionCardSection:v6 sectionIdentifier:v8];

  return v9;
}

- (id)generateSectionIdentifier:(id)a3 collectionSection:(id)a4
{
  id v6 = a4;
  id v7 = [a3 bundleIdentifier];
  id v8 = v7;
  if (v7)
  {
    unint64_t v9 = v7;
  }
  else
  {
    uint64_t v10 = [v6 cardSectionId];
    uint64_t v11 = (void *)v10;
    id v12 = @"unknown";
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    unint64_t v9 = v12;
  }
  uint64_t v13 = [(SearchUIDataSourceSnapshotBuilder *)self sectionModelIdentifiers];
  uint64_t v14 = [(SearchUIDataSourceSnapshotBuilder *)self generateIterativeIdentifierForBaseIdentifier:v9 withUnavailableIdentifiers:v13];

  return v14;
}

- (NSMutableSet)sectionModelIdentifiers
{
  return self->_sectionModelIdentifiers;
}

- (id)buildSectionFromRowModels:(id)a3 section:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(SearchUIDataSourceSnapshotBuilder *)self expandedCollectionSections];
    unint64_t v9 = +[SearchUISectionModel sectionModelWithRows:v6 drawPlattersIfNecessary:1 section:v7 expandedCollectionSections:v8];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (NSSet)expandedCollectionSections
{
  return self->_expandedCollectionSections;
}

- (SearchUIDataSourceSnapshotBuilder)init
{
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(SearchUIDataSourceSnapshotBuilder *)self initWithExpandedSections:v3 expandedCollectionSections:v4];

  return v5;
}

- (SearchUIDataSourceSnapshotBuilder)initWithSnapshot:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [v4 itemIdentifiers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v30 + 1) + 8 * v11) itemIdentifier];
        [v5 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v13 = objc_msgSend(v4, "sectionIdentifiers", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v26 + 1) + 8 * v17) section];
        uint64_t v19 = [v18 sectionIdentifier];
        [v5 addObject:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }

  id v20 = objc_opt_new();
  uint64_t v21 = objc_opt_new();
  id v22 = (void *)[v5 copy];
  uint64_t v23 = (void *)[v6 copy];
  long long v24 = [(SearchUIDataSourceSnapshotBuilder *)self initWithExpandedSections:v20 expandedCollectionSections:v21 rowModelIdentifiers:v22 sectionModelIdentifiers:v23];

  return v24;
}

- (id)buildSnapshotFromResultSections:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v5 = [(SearchUIDataSourceSnapshotBuilder *)self buildSectionsFromResultSections:a3 queryId:a4];
  id v6 = [(SearchUIDataSourceSnapshotBuilder *)self buildSnapshotForSectionModels:v5];

  return v6;
}

- (id)buildSectionsFromResultSections:(id)a3 queryId:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SearchUIDataSourceSnapshotBuilder *)self buildRowModelsFromResultSections:v6 queryId:a4];
  uint64_t v8 = [(SearchUIDataSourceSnapshotBuilder *)self buildSectionsFromRowModels:v7 fromSections:v6];

  return v8;
}

void __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  [*(id *)(a1 + 32) addObject:v5];
}

- (id)buildRowModelsFromSectionModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "rowModels", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)buildRowModelsFromResult:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[SearchUIUtilities cardSectionsForRenderingResult:v4];
    uint64_t v6 = -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](self, "buildRowModelsFromCardSections:result:isInline:queryId:", v5, v4, [v5 count] != 0, objc_msgSend(v4, "queryId"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)buildRowModelFromCardSection:(id)a3 result:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v13 = a3;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [v6 arrayWithObjects:&v13 count:1];

    uint64_t v10 = -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](self, "buildRowModelsFromCardSections:result:isInline:queryId:", v9, v7, 0, objc_msgSend(v7, "queryId", v13, v14));

    uint64_t v11 = [v10 firstObject];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)buildRowModelsFromCardSections:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6
{
  BOOL v83 = a5;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v86 = (id)objc_opt_new();
  long long v84 = [(SearchUIDataSourceSnapshotBuilder *)self gridLayoutsForCardSections:v8];
  id v89 = self;
  v82 = [(SearchUIDataSourceSnapshotBuilder *)self asyncRowManagersForCardSections:v8];
  id v73 = [[SearchUIRFCardSectionRowModelProvider alloc] initWithCardSections:v8];
  if (!v8 && v9)
  {
    uint64_t v10 = [(SearchUIDataSourceSnapshotBuilder *)self generateItemIdentifier:v9 cardSection:0];
    uint64_t v11 = -[SearchUIDetailedRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:]([SearchUIDetailedRowModel alloc], "initWithResult:cardSection:isInline:queryId:itemIdentifier:", v9, 0, 0, [v9 queryId], v10);
    [v86 addObject:v11];
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = v96;
    uint64_t v15 = *(void *)v100;
    uint64_t v16 = &off_1E6E71000;
    id v87 = v9;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v100 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v99 + 1) + 8 * v17);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        v96[0] = __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke;
        v96[1] = &unk_1E6E745F0;
        v96[2] = v89;
        id v19 = v9;
        id v97 = v19;
        id v98 = v18;
        id v20 = (void (**)(void))_Block_copy(aBlock);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = [v84 objectForKey:v18];
          id v22 = [SearchUIGridRowModel alloc];
          uint64_t v23 = v20[2](v20);
          long long v24 = [(SearchUIGridRowModel *)v22 initWithResult:v19 cardSection:v18 gridLayoutManager:v21 queryId:a6 itemIdentifier:v23];

          if (![(SearchUIGridRowModel *)v24 shouldHide]) {
            [v86 addObject:v24];
          }

          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v25 = [v82 objectForKey:v18];
          long long v26 = [SearchUIWatchListCardRowModel alloc];
          long long v27 = v20[2](v20);
          long long v28 = [(SearchUIWatchListCardRowModel *)v26 initWithResult:v19 cardSection:v18 asyncRowManager:v25 queryId:a6 itemIdentifier:v27];

          id v9 = v87;
          [v86 addObject:v28];

          goto LABEL_53;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v29 = SearchUICommandRowModel;
          goto LABEL_51;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v79 = MEMORY[0x1E4E84260]();
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke_2;
          v90[3] = &unk_1E6E74618;
          v90[4] = v89;
          id v30 = v19;
          BOOL v94 = v83;
          id v91 = v30;
          unint64_t v93 = a6;
          id v31 = v86;
          id v92 = v31;
          long long v32 = (void (**)(void, id, id))_Block_copy(v90);
          id v33 = v18;
          objc_opt_class();
          uint64_t v81 = v30;
          if (objc_opt_isKindOfClass()) {
            uint64_t v34 = v30;
          }
          else {
            uint64_t v34 = 0;
          }
          id v80 = v34;
          id v35 = objc_opt_new();
          if (_os_feature_enabled_impl())
          {
            uint64_t v36 = +[SearchUIUtilities bundleIdentifierForApp:15];
            [v35 addObject:v36];
          }
          if (_os_feature_enabled_impl())
          {
            unint64_t v37 = +[SearchUIUtilities bundleIdentifierForApp:25];
            [v35 addObject:v37];
          }
          if (_os_feature_enabled_impl())
          {
            v38 = +[SearchUIUtilities bundleIdentifierForApp:12];
            [v35 addObject:v38];
          }
          if (_os_feature_enabled_impl())
          {
            v39 = +[SearchUIUtilities bundleIdentifierForApp:17];
            [v35 addObject:v39];
          }
          v78 = v35;
          if (objc_msgSend(v33, "isTopHit", v73)) {
            goto LABEL_46;
          }
          uint64_t v40 = [v81 applicationBundleIdentifier];
          unint64_t v41 = (void *)v40;
          if (v40) {
            uint64_t v42 = (__CFString *)v40;
          }
          else {
            uint64_t v42 = &stru_1F40279D8;
          }
          if (([v35 containsObject:v42] & 1) == 0)
          {
            uint64_t v77 = v32;
            uint64_t v43 = [v81 resultBundleId];
            uint64_t v44 = (void *)v43;
            if (v43) {
              uint64_t v45 = (__CFString *)v43;
            }
            else {
              uint64_t v45 = &stru_1F40279D8;
            }
            if (([v35 containsObject:v45] & 1) == 0)
            {
              v76 = [v33 attributeSet];
              uint64_t v46 = [v76 bundleID];
              v75 = (void *)v46;
              if (v46) {
                id v47 = (__CFString *)v46;
              }
              else {
                id v47 = &stru_1F40279D8;
              }
              if ([v35 containsObject:v47])
              {

                goto LABEL_44;
              }
              char v74 = _os_feature_enabled_impl();

              long long v32 = v77;
              if ((v74 & 1) == 0)
              {
                v77[2](v77, v80, v33);
                unint64_t v55 = (void *)v79;
                goto LABEL_59;
              }
LABEL_46:
              id v48 = v31;
              uint64_t v49 = v15;
              long long v50 = v14;
              uint64_t v51 = v32;
              long long v52 = [SearchUIArchivedRowModel alloc];
              long long v53 = v20[2](v20);
              long long v54 = [(SearchUIArchivedRowModel *)v52 initWithResult:v81 cardSection:v33 isInline:v83 queryId:a6 itemIdentifier:v53];

              if ([(SearchUIArchivedRowModel *)v54 hasView])
              {
                [v48 addObject:v54];
                unint64_t v55 = (void *)v79;
                long long v32 = v51;
              }
              else
              {
                long long v32 = v51;
                v51[2](v51, v80, v33);
                unint64_t v55 = (void *)v79;
              }

              uint64_t v14 = v50;
              uint64_t v15 = v49;
LABEL_59:
              [v80 clearBackendData];

LABEL_13:
              id v9 = v87;
LABEL_54:
              uint64_t v16 = &off_1E6E71000;
              goto LABEL_55;
            }
LABEL_44:

            long long v32 = v77;
          }

          goto LABEL_46;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          long long v29 = SearchUIDetailedRowModel;
          goto LABEL_51;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v59 = [SearchUIDetailedRowModel alloc];
          id v57 = v20[2](v20);
          uint64_t v58 = [(SearchUIDetailedRowModel *)v59 initWithResult:v19 suggestion:v18 queryId:a6 itemIdentifier:v57];
          goto LABEL_52;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v60 = v18;
          long long v61 = [SearchUIImageGridRowModel alloc];
          long long v62 = v20[2](v20);
          long long v25 = [(SearchUIImageGridRowModel *)v61 initWithResult:v19 cardSection:v60 isInline:v83 queryId:a6 itemIdentifier:v62 builder:v89];

          [v86 addObject:v25];
          goto LABEL_53;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v63 = v18;
          long long v64 = [v63 cardSections];
          long long v65 = [(SearchUIDataSourceSnapshotBuilder *)v89 buildRowModelsFromCardSections:v64 result:v19 isInline:1 queryId:a6];

          long long v66 = [SearchUICombinedCardSectionRowModel alloc];
          long long v67 = v20[2](v20);
          uint64_t v68 = [(SearchUICombinedCardSectionRowModel *)v66 initWithResult:v19 cardSectionRowModels:v65 cardSection:v63 dataSourceIdentifier:v67];

          id v9 = v87;
          [v86 addObject:v68];

          uint64_t v16 = &off_1E6E71000;
        }
        else
        {
          if (![v16[437] supportsConfigurationForCardSection:v18])
          {
            long long v29 = SearchUICardSectionRowModel;
LABEL_51:
            id v56 = [v29 alloc];
            id v57 = v20[2](v20);
            uint64_t v58 = [v56 initWithResult:v19 cardSection:v18 isInline:v83 queryId:a6 itemIdentifier:v57];
LABEL_52:
            long long v25 = (SearchUIImageGridRowModel *)v58;

            [v86 addObject:v25];
LABEL_53:

            goto LABEL_54;
          }
          if (([v16[437] shouldHideViewForCardSection:v18] & 1) == 0)
          {
            id v69 = v20[2](v20);
            v70 = [(SearchUIRFCardSectionRowModelProvider *)v73 rowModelFor:v18 result:v19 isInline:v83 queryId:a6 itemIdentifier:v69];

            uint64_t v16 = &off_1E6E71000;
            [v86 addObject:v70];
          }
        }
LABEL_55:

        ++v17;
      }
      while (v13 != v17);
      uint64_t v71 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
      uint64_t v13 = v71;
    }
    while (v71);
  }

  return v86;
}

uint64_t __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) generateItemIdentifier:*(void *)(a1 + 40) cardSection:*(void *)(a1 + 48)];
}

void __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 backendData];
  [v7 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F22B68]];

  id v8 = [v6 fallbackCardSection];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v6 fallbackCardSection];
    v16[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v12 = [v9 buildRowModelsFromCardSections:v11 result:*(void *)(a1 + 40) isInline:*(unsigned __int8 *)(a1 + 64) queryId:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA5DE0] resultBuilderWithResult:v5];
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v11 = [v10 buildResult];
    uint64_t v12 = [v13 buildRowModelsFromResult:v11];
  }
  uint64_t v14 = v12;
  uint64_t v15 = [v12 firstObject];

  if (v15) {
    [*(id *)(a1 + 48) addObject:v15];
  }
}

- (id)buildCombinedRowModelsFromRowModels:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v29 = a4;
  id v30 = (id)objc_opt_new();
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v5 objectAtIndexedSubscript:v6];
      id v33 = [v7 punchouts];
      id v8 = [v7 nextCard];
      id v9 = [v7 cardSection];
      uint64_t v10 = [v9 command];

      id v31 = v7;
      long long v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
      ++v6;
      uint64_t v34 = v8;
      while (v6 < [v5 count])
      {
        id v11 = v5;
        uint64_t v12 = [v5 objectAtIndexedSubscript:v6];
        uint64_t v13 = [v12 cardSection];
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v15 = [v12 punchouts];
        uint64_t v16 = [v12 nextCard];
        uint64_t v17 = [v12 cardSection];
        uint64_t v18 = [v17 command];

        if (v8)
        {
          LODWORD(v8) = [v16 isEqual:v8];
          int v19 = 0;
          if (v10) {
            goto LABEL_7;
          }
        }
        else
        {
          int v19 = [v33 isEqualToArray:v15];
          if (v10)
          {
LABEL_7:
            int v20 = [v10 isEqual:v18];
            goto LABEL_10;
          }
        }
        int v20 = 0;
LABEL_10:
        if (((isKindOfClass | v8 | v19) & 1) != 0 || v20)
        {
          id v22 = [v12 cardSection];
          objc_opt_class();
          char v23 = objc_opt_isKindOfClass();

          id v8 = v34;
          if (v23)
          {
            char v21 = 0;
          }
          else
          {
            [v32 addObject:v12];
            ++v6;
            char v21 = 1;
          }
          id v5 = v11;
        }
        else
        {
          char v21 = 0;
          id v5 = v11;
          id v8 = v34;
        }

        if ((v21 & 1) == 0) {
          break;
        }
      }
      if ((unint64_t)[v32 count] < 2)
      {
        long long v26 = v31;
        [v30 addObject:v31];
      }
      else
      {
        long long v24 = [(SearchUIDataSourceSnapshotBuilder *)self generateItemIdentifier:v29 cardSection:0];
        long long v25 = [[SearchUICombinedCardSectionRowModel alloc] initWithResult:v29 cardSectionRowModels:v32 dataSourceIdentifier:v24];
        [v30 addObject:v25];

        long long v26 = v31;
      }
    }
    while (v6 < [v5 count]);
  }

  return v30;
}

- (id)asyncRowManagersForCardSections:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[SearchUIUtilities pointerKeyMapTable];
  id v5 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          uint64_t v12 = [v11 watchListItem];
          uint64_t v13 = [v12 watchListIdentifier];
          uint64_t v14 = [v13 length];

          if (v14)
          {
            uint64_t v15 = [v11 watchListItem];
            uint64_t v16 = [v15 watchListIdentifier];
            uint64_t v17 = [v5 objectForKeyedSubscript:v16];

            if (!v17)
            {
              uint64_t v18 = objc_opt_new();
              int v19 = [v11 watchListItem];
              int v20 = [v19 watchListIdentifier];
              [v5 setObject:v18 forKeyedSubscript:v20];
            }
            char v21 = [v11 watchListItem];
            id v22 = [v21 watchListIdentifier];
            char v23 = [v5 objectForKeyedSubscript:v22];
            [v23 addObject:v11];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v7);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v37 = [v5 allKeys];
  uint64_t v24 = [v37 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v37);
        }
        uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        id v29 = [v5 objectForKeyedSubscript:v28];
        id v30 = [[SearchUIWatchListCardsManager alloc] initWithWatchListIdentifier:v28];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v31 = v29;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v40;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v40 != v34) {
                objc_enumerationMutation(v31);
              }
              [v4 setObject:v30 forKey:*(void *)(*((void *)&v39 + 1) + 8 * k)];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v39 objects:v51 count:16];
          }
          while (v33);
        }
      }
      uint64_t v25 = [v37 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v25);
  }

  return v4;
}

- (id)gridLayoutsForCardSections:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[SearchUIUtilities pointerKeyMapTable];
  if ([v3 count])
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v3 objectAtIndexedSubscript:v5];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v25 = [v3 objectAtIndexedSubscript:v5];
        uint64_t v8 = [v25 tableIdentifier];
        id v9 = objc_opt_new();
        if (v5 + 1 < (unint64_t)[v3 count])
        {
          while (1)
          {
            uint64_t v10 = [v3 objectAtIndexedSubscript:v5 + 1];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            id v11 = [v3 objectAtIndexedSubscript:v5 + 1];
            uint64_t v12 = [v11 tableIdentifier];
            int v13 = [v8 isEqualToString:v12];

            if (!v13) {
              goto LABEL_11;
            }
            uint64_t v14 = [v3 objectAtIndexedSubscript:v5 + 1];
            [v9 addObject:v14];

            unint64_t v15 = [v3 count];
            uint64_t v16 = v5 + 1;
            unint64_t v17 = v5 + 2;
            ++v5;
            if (v17 >= v15) {
              goto LABEL_12;
            }
          }
        }
LABEL_11:
        uint64_t v16 = v5;
LABEL_12:
        uint64_t v18 = [[SearchUIGridLayoutManager alloc] initWithHeaderSection:v25 dataSections:v9];
        [v4 setObject:v18 forKey:v25];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v19 = v9;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v27 != v22) {
                objc_enumerationMutation(v19);
              }
              [v4 setObject:v18 forKey:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v21);
        }
      }
      else
      {
        uint64_t v16 = v5;
      }
      uint64_t v5 = v16 + 1;
    }
    while (v16 + 1 < (unint64_t)[v3 count]);
  }

  return v4;
}

- (NSSet)expandedSections
{
  return self->_expandedSections;
}

- (void)setExpandedSections:(id)a3
{
}

- (void)setExpandedCollectionSections:(id)a3
{
}

- (void)setRowModelIdentifiers:(id)a3
{
}

- (void)setSectionModelIdentifiers:(id)a3
{
}

@end