@interface SearchUITableModel
+ (BOOL)resultHasHorizontallyGroupedCardSections:(id)a3;
+ (BOOL)shouldDisplayChevronForRowModel:(id)a3 previousRowModel:(id)a4 nextRowModel:(id)a5 nextCardsEnabled:(BOOL)a6;
+ (id)rowModelForCardSection:(id)a3 result:(id)a4;
+ (id)tableModelWithCardSections:(id)a3 isInline:(BOOL)a4 queryId:(unint64_t)a5;
+ (id)tableModelWithCardSections:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 shouldCombine:(BOOL)a7;
+ (id)tableModelWithResult:(id)a3;
+ (id)tableModelWithResults:(id)a3;
+ (id)tableModelWithSections:(id)a3 expandedSections:(id)a4 expandedCollectionCardSections:(id)a5;
- (BOOL)indexPathExists:(id)a3;
- (BOOL)rowWillFillBackgroundWithContentAtIndexPath:(id)a3;
- (BOOL)shouldDisplayChevronForIndexPath:(id)a3 nextCardsEnabled:(BOOL)a4;
- (BOOL)shouldLeaveSpaceForChevronForIndexPath:(id)a3;
- (NSArray)sections;
- (NSArray)tableRowModel;
- (SearchUITableModel)initWithQueryId:(unint64_t)a3;
- (id)cardSectionForIndexPath:(id)a3;
- (id)description;
- (id)indexPathForResultInFirstTwoSections:(id)a3;
- (id)indexPathForRowModel:(id)a3;
- (id)removeRowModel:(id)a3;
- (id)resultForIndexPath:(id)a3;
- (id)rowModelForIndexPath:(id)a3;
- (id)sectionForIndex:(unint64_t)a3;
- (id)updatedTableModelByDeletingSectionIndex:(unint64_t)a3;
- (id)updatedTableModelWithExpandedSections:(id)a3 expandedCollectionCardSections:(id)a4 hiddenSections:(id)a5 atSectionIndex:(unint64_t)a6;
- (int)separatorStyleForIndexPath:(id)a3;
- (int64_t)numberOfRowsForSection:(int64_t)a3;
- (unint64_t)indexOfSection:(id)a3;
- (unint64_t)numberOfSections;
- (unint64_t)queryId;
- (void)enumerateRowModels:(id)a3;
- (void)replaceResult:(id)a3 withResult:(id)a4 completion:(id)a5;
- (void)setSections:(id)a3;
- (void)setTableRowModel:(id)a3;
@end

@implementation SearchUITableModel

- (unint64_t)queryId
{
  return self->_queryId;
}

+ (id)tableModelWithSections:(id)a3 expandedSections:(id)a4 expandedCollectionCardSections:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [[SearchUIDataSourceSnapshotBuilder alloc] initWithExpandedSections:v9 expandedCollectionSections:v8];

  v11 = [v7 firstObject];
  v12 = [v11 results];
  v13 = [v12 firstObject];
  uint64_t v14 = [v13 queryId];
  if (!v14)
  {
    v15 = [v7 lastObject];
    v16 = [v15 results];
    v17 = [v16 firstObject];
    uint64_t v14 = [v17 queryId];
  }
  v18 = [[SearchUITableModel alloc] initWithQueryId:v14];
  v19 = [(SearchUIDataSourceSnapshotBuilder *)v10 buildRowModelsFromResultSections:v7 queryId:v14];
  v20 = (void *)[v19 mutableCopy];
  [(SearchUITableModel *)v18 setTableRowModel:v20];

  [(SearchUITableModel *)v18 setSections:v7];
  return v18;
}

- (void)setTableRowModel:(id)a3
{
}

- (void)setSections:(id)a3
{
}

- (SearchUITableModel)initWithQueryId:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUITableModel;
  result = [(SearchUITableModel *)&v5 init];
  if (result) {
    result->_queryId = a3;
  }
  return result;
}

- (void)enumerateRowModels:(id)a3
{
  v19 = (void (**)(id, void *))a3;
  v4 = [(SearchUITableModel *)self tableRowModel];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [(SearchUITableModel *)self tableRowModel];
      id v8 = [v7 objectAtIndexedSubscript:v6];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          v11 = [(SearchUITableModel *)self tableRowModel];
          v12 = [v11 objectAtIndexedSubscript:v6];
          v13 = [v12 objectAtIndexedSubscript:v10];
          v19[2](v19, v13);

          ++v10;
          uint64_t v14 = [(SearchUITableModel *)self tableRowModel];
          v15 = [v14 objectAtIndexedSubscript:v6];
          unint64_t v16 = [v15 count];
        }
        while (v10 < v16);
      }
      ++v6;
      v17 = [(SearchUITableModel *)self tableRowModel];
      unint64_t v18 = [v17 count];
    }
    while (v6 < v18);
  }
}

- (NSArray)tableRowModel
{
  return self->_tableRowModel;
}

- (NSArray)sections
{
  return self->_sections;
}

+ (BOOL)shouldDisplayChevronForRowModel:(id)a3 previousRowModel:(id)a4 nextRowModel:(id)a5 nextCardsEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 nextCard];
  v13 = [v11 nextCard];

  uint64_t v14 = [v10 nextCard];

  if ((TLKSnippetModernizationEnabled() & 1) == 0)
  {
    if (v6 && v12 && v12 != v13 && v12 != v14 || ([v9 isQuerySuggestion] & 1) != 0)
    {
      BOOL v15 = 1;
      goto LABEL_9;
    }
    if ([MEMORY[0x1E4FAE198] isMacOS])
    {
      v17 = [v9 identifyingResult];
      BOOL v15 = [v17 type] == 7;

      goto LABEL_9;
    }
  }
  BOOL v15 = 0;
LABEL_9:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableRowModel, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

+ (BOOL)resultHasHorizontallyGroupedCardSections:(id)a3
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

+ (id)tableModelWithCardSections:(id)a3 isInline:(BOOL)a4 queryId:(unint64_t)a5
{
  return (id)[a1 tableModelWithCardSections:a3 result:0 isInline:a4 queryId:a5 shouldCombine:0];
}

+ (id)tableModelWithCardSections:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 shouldCombine:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a3;
  v13 = [[SearchUITableModel alloc] initWithQueryId:a6];
  uint64_t v14 = objc_opt_new();
  BOOL v15 = [v14 buildRowModelsFromCardSections:v12 result:v11 isInline:v9 queryId:a6];

  if (v7)
  {
    uint64_t v16 = [v14 buildCombinedRowModelsFromRowModels:v15 result:v11];

    BOOL v15 = (void *)v16;
  }
  v17 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];
  v22[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v20 = [v17 arrayWithArray:v19];
  [(SearchUITableModel *)v13 setTableRowModel:v20];

  return v13;
}

+ (id)tableModelWithResult:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    BOOL v6 = [v4 arrayWithObjects:&v9 count:1];

    BOOL v7 = objc_msgSend(a1, "tableModelWithResults:", v6, v9, v10);
  }
  else
  {
    BOOL v7 = 0;
  }
  return v7;
}

+ (id)tableModelWithResults:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setResults:v4];

  v9[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  BOOL v7 = [a1 tableModelWithSections:v6 expandedSections:0 expandedCollectionCardSections:0];

  return v7;
}

- (id)updatedTableModelWithExpandedSections:(id)a3 expandedCollectionCardSections:(id)a4 hiddenSections:(id)a5 atSectionIndex:(unint64_t)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(SearchUITableModel *)self sections];
  uint64_t v14 = (void *)[v13 mutableCopy];

  if (v12)
  {
    BOOL v15 = [v14 objectAtIndexedSubscript:a6];
    [v15 setIsInitiallyHidden:1];

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a6, objc_msgSend(v12, "count"));
    [v14 removeObjectAtIndex:a6];
    [v14 insertObjects:v12 atIndexes:v16];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v12;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "setIsInitiallyHidden:", 0, (void)v24);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }
  }
  v22 = [(id)objc_opt_class() tableModelWithSections:v14 expandedSections:v10 expandedCollectionCardSections:v11];

  return v22;
}

- (id)updatedTableModelByDeletingSectionIndex:(unint64_t)a3
{
  id v4 = [(SearchUITableModel *)self sections];
  id v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectAtIndex:a3];
  BOOL v6 = [(id)objc_opt_class() tableModelWithSections:v5 expandedSections:0 expandedCollectionCardSections:0];

  return v6;
}

- (unint64_t)numberOfSections
{
  v2 = [(SearchUITableModel *)self tableRowModel];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)replaceResult:(id)a3 withResult:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v40 = a4;
  v41 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = (id)objc_opt_new();
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __58__SearchUITableModel_replaceResult_withResult_completion___block_invoke;
  v42[3] = &unk_1E6E727D0;
  v42[4] = &v43;
  [(SearchUITableModel *)self enumerateRowModels:v42];
  id v9 = [SearchUIDataSourceSnapshotBuilder alloc];
  id v10 = objc_opt_new();
  id v11 = objc_opt_new();
  id v12 = (void *)[(id)v44[5] copy];
  v13 = objc_opt_new();
  uint64_t v14 = [(SearchUIDataSourceSnapshotBuilder *)v9 initWithExpandedSections:v10 expandedCollectionSections:v11 rowModelIdentifiers:v12 sectionModelIdentifiers:v13];

  BOOL v15 = [(SearchUIDataSourceSnapshotBuilder *)v14 buildRowModelsFromResult:v8];
  v39 = v14;
  uint64_t v16 = [(SearchUIDataSourceSnapshotBuilder *)v14 buildRowModelsFromResult:v40];
  id v17 = [v15 firstObject];
  uint64_t v18 = [(SearchUITableModel *)self indexPathForRowModel:v17];

  if (v18)
  {
    uint64_t v19 = [v18 section];
    v38 = v18;
    uint64_t v20 = [v18 row];
    v21 = [(SearchUITableModel *)self tableRowModel];
    v22 = [v21 objectAtIndexedSubscript:v19];
    v23 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v20, objc_msgSend(v15, "count"));
    [v22 removeObjectsAtIndexes:v23];

    long long v24 = [(SearchUITableModel *)self tableRowModel];
    long long v25 = [v24 objectAtIndexedSubscript:v19];
    long long v26 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v20, objc_msgSend(v16, "count"));
    [v25 insertObjects:v16 atIndexes:v26];

    long long v27 = objc_opt_new();
    v28 = objc_opt_new();
    id v37 = v8;
    uint64_t v29 = objc_opt_new();
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v31 = objc_msgSend(v16, "count", v37);
      unint64_t v32 = [v15 count];
      unint64_t v33 = v31 <= v32 ? v32 : v31;
      if (i >= v33) {
        break;
      }
      v34 = [MEMORY[0x1E4F28D58] indexPathForRow:v20 + i inSection:v19];
      if (i >= [v16 count] || (unint64_t v35 = objc_msgSend(v15, "count"), v36 = v27, i >= v35))
      {
        if (i >= [v16 count]) {
          v36 = v28;
        }
        else {
          v36 = v29;
        }
      }
      [v36 addObject:v34];
    }
    if ([v27 count]) {
      v41[2](v41, 1, v27);
    }
    if ([v28 count]) {
      v41[2](v41, 2, v28);
    }
    if ([v29 count]) {
      v41[2](v41, 0, v29);
    }

    id v8 = v37;
    uint64_t v18 = v38;
  }

  _Block_object_dispose(&v43, 8);
}

void __58__SearchUITableModel_replaceResult_withResult_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 itemIdentifier];
  [v2 addObject:v3];
}

- (id)removeRowModel:(id)a3
{
  id v4 = [(SearchUITableModel *)self indexPathForRowModel:a3];
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 section];
    BOOL v7 = [(SearchUITableModel *)self tableRowModel];
    if (v6 >= [v7 count])
    {
    }
    else
    {
      unint64_t v8 = [v5 row];
      id v9 = [(SearchUITableModel *)self tableRowModel];
      id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
      unint64_t v11 = [v10 count];

      if (v8 < v11)
      {
        id v12 = [(SearchUITableModel *)self tableRowModel];
        v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
        objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(v5, "row"));

        id v14 = v5;
        goto LABEL_7;
      }
    }
  }
  id v14 = 0;
LABEL_7:

  return v14;
}

+ (id)rowModelForCardSection:(id)a3 result:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = objc_opt_new();
  unint64_t v8 = [v7 buildRowModelFromCardSection:v6 result:v5];

  return v8;
}

- (int64_t)numberOfRowsForSection:(int64_t)a3
{
  id v4 = [(SearchUITableModel *)self tableRowModel];
  id v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 count];

  return v6;
}

- (BOOL)indexPathExists:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || [v4 row] < 0 || objc_msgSend(v5, "section") < 0)
  {
    BOOL v11 = 0;
  }
  else
  {
    unint64_t v6 = [v5 section];
    BOOL v7 = [(SearchUITableModel *)self tableRowModel];
    if (v6 >= [v7 count])
    {
      BOOL v11 = 0;
    }
    else
    {
      unint64_t v8 = [v5 row];
      id v9 = [(SearchUITableModel *)self tableRowModel];
      id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
      BOOL v11 = v8 < [v10 count];
    }
  }

  return v11;
}

- (id)rowModelForIndexPath:(id)a3
{
  id v4 = a3;
  if ([(SearchUITableModel *)self indexPathExists:v4])
  {
    id v5 = [(SearchUITableModel *)self tableRowModel];
    unint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    BOOL v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)resultForIndexPath:(id)a3
{
  id v3 = [(SearchUITableModel *)self rowModelForIndexPath:a3];
  id v4 = [v3 identifyingResult];

  return v4;
}

- (id)sectionForIndex:(unint64_t)a3
{
  id v5 = [(SearchUITableModel *)self sections];
  if ([v5 count] <= a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v6 = [(SearchUITableModel *)self sections];
    BOOL v7 = [v6 objectAtIndexedSubscript:a3];
  }
  return v7;
}

- (unint64_t)indexOfSection:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUITableModel *)self sections];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)cardSectionForIndexPath:(id)a3
{
  id v3 = [(SearchUITableModel *)self rowModelForIndexPath:a3];
  id v4 = [v3 cardSection];

  return v4;
}

- (BOOL)shouldDisplayChevronForIndexPath:(id)a3 nextCardsEnabled:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  BOOL v7 = [(SearchUITableModel *)self rowModelForIndexPath:v6];
  unint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v6, "row") - 1, objc_msgSend(v6, "section"));
  id v9 = [(SearchUITableModel *)self rowModelForIndexPath:v8];

  id v10 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v11 = [v6 row] + 1;
  uint64_t v12 = [v6 section];

  v13 = [v10 indexPathForRow:v11 inSection:v12];
  id v14 = [(SearchUITableModel *)self rowModelForIndexPath:v13];

  LOBYTE(v4) = [(id)objc_opt_class() shouldDisplayChevronForRowModel:v7 previousRowModel:v9 nextRowModel:v14 nextCardsEnabled:v4];
  return v4;
}

- (BOOL)shouldLeaveSpaceForChevronForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUITableModel *)self rowModelForIndexPath:v4];
  id v6 = [v5 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, objc_msgSend(v4, "section"));
    BOOL v9 = [(SearchUITableModel *)self shouldDisplayChevronForIndexPath:v8 nextCardsEnabled:1];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int)separatorStyleForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUITableModel *)self rowModelForIndexPath:v4];
  id v6 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v7 = [v4 row] + 1;
  uint64_t v8 = [v4 section];

  BOOL v9 = [v6 indexPathForRow:v7 inSection:v8];
  id v10 = [(SearchUITableModel *)self rowModelForIndexPath:v9];

  int v11 = [v5 separatorStyle];
  if (!v11)
  {
    if ([v10 prefersNoSeparatorAbove]) {
      int v11 = 1;
    }
    else {
      int v11 = 3;
    }
  }
  if (v11 == 3 && v10)
  {
    if ([v10 hasLeadingImage]) {
      int v11 = 3;
    }
    else {
      int v11 = 2;
    }
  }

  return v11;
}

- (BOOL)rowWillFillBackgroundWithContentAtIndexPath:(id)a3
{
  id v3 = [(SearchUITableModel *)self rowModelForIndexPath:a3];
  char v4 = [v3 fillsBackgroundWithContent];

  return v4;
}

- (id)indexPathForRowModel:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v5 = [(SearchUITableModel *)self tableRowModel];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v40;
      unint64_t v33 = v5;
      uint64_t v29 = *(void *)v40;
      do
      {
        uint64_t v10 = 0;
        uint64_t v11 = v8;
        uint64_t v28 = v8 + v7;
        do
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = 0;
            uint64_t v17 = *(void *)v36;
            uint64_t v30 = v7;
            uint64_t v34 = v11;
            while (2)
            {
              uint64_t v18 = 0;
              uint64_t v31 = v16 + v15;
              uint64_t v32 = v16;
              do
              {
                if (*(void *)v36 != v17) {
                  objc_enumerationMutation(v13);
                }
                id v19 = *(id *)(*((void *)&v35 + 1) + 8 * v18);
                if (v19 == v4) {
                  goto LABEL_26;
                }
                uint64_t v20 = [v4 identifyingResult];
                v21 = [v19 identifyingResult];
                if (v20 == v21)
                {
                  v22 = [v4 identifyingResult];
                  if (v22)
                  {

LABEL_26:
                    long long v26 = [MEMORY[0x1E4F28D58] indexPathForRow:v32 + v18 inSection:v34];

                    id v5 = v33;
                    goto LABEL_27;
                  }
                }
                v23 = [v4 cardSection];
                long long v24 = [v19 cardSection];
                if (v23 == v24)
                {
                  long long v25 = [v4 cardSection];

                  if (v25) {
                    goto LABEL_26;
                  }
                }
                else
                {
                }
                ++v18;
              }
              while (v15 != v18);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
              uint64_t v7 = v30;
              uint64_t v16 = v31;
              id v5 = v33;
              uint64_t v11 = v34;
              uint64_t v9 = v29;
              if (v15) {
                continue;
              }
              break;
            }
          }

          ++v11;
          ++v10;
        }
        while (v10 != v7);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
        long long v26 = 0;
        uint64_t v8 = v28;
      }
      while (v7);
    }
    else
    {
      long long v26 = 0;
    }
LABEL_27:
  }
  else
  {
    long long v26 = 0;
  }

  return v26;
}

- (id)indexPathForResultInFirstTwoSections:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_22;
  }
  id v5 = [(SearchUITableModel *)self tableRowModel];
  unint64_t v6 = [v5 count];

  uint64_t v7 = 2;
  if (v6 < 2) {
    uint64_t v7 = v6;
  }
  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(SearchUITableModel *)self tableRowModel];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v8];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        unint64_t v12 = 0;
        do
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v13 = [(SearchUITableModel *)self tableRowModel];
          uint64_t v14 = [v13 objectAtIndexedSubscript:v8];
          uint64_t v15 = [v14 objectAtIndexedSubscript:v12];
          uint64_t v16 = [v15 results];

          uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v30;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v30 != v19) {
                  objc_enumerationMutation(v16);
                }
                if (*(id *)(*((void *)&v29 + 1) + 8 * i) == v4)
                {
                  long long v26 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:v8];

                  goto LABEL_24;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          ++v12;
          v21 = [(SearchUITableModel *)self tableRowModel];
          v22 = [v21 objectAtIndexedSubscript:v8];
          unint64_t v23 = [v22 count];
        }
        while (v12 < v23);
      }
      ++v8;
      long long v24 = [(SearchUITableModel *)self tableRowModel];
      unint64_t v25 = [v24 count];

      long long v26 = 0;
      if (v25 >= 2) {
        unint64_t v27 = 2;
      }
      else {
        unint64_t v27 = v25;
      }
    }
    while (v8 < v27);
  }
  else
  {
LABEL_22:
    long long v26 = 0;
  }
LABEL_24:

  return v26;
}

- (id)description
{
  id v3 = objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)SearchUITableModel;
  id v4 = [(SearchUITableModel *)&v8 description];
  [v3 appendString:v4];

  id v5 = [(SearchUITableModel *)self tableRowModel];
  unint64_t v6 = [v5 description];
  [v3 appendFormat:@"\n %@", v6];

  return v3;
}

@end