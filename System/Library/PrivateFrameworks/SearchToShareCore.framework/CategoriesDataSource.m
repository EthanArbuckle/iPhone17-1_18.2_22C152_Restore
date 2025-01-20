@interface CategoriesDataSource
- (BOOL)isGroupRow:(int64_t)a3;
- (BOOL)isScrolling;
- (BOOL)rowHasClearButton:(int64_t)a3;
- (CategoriesDataSource)initWithSearchModel:(id)a3;
- (NSArray)categories;
- (NSMutableArray)model;
- (NSMutableArray)recents;
- (STSCategorySelectionDelegate)selectionDelegate;
- (STSSearchModel)searchModel;
- (STSSearchModelUpdateDelegate)updateDelegate;
- (id)_searchResultIdentifierForSuggestion:(id)a3 recent:(BOOL)a4;
- (id)headerTitleForRow:(int64_t)a3;
- (id)recentQueries;
- (id)stringValueForRowAtIndex:(int64_t)a3;
- (id)visibleResultsForIndexPaths:(id)a3;
- (int64_t)numberOfRows;
- (void)_commitClearRecents;
- (void)addQueryToRecents:(id)a3;
- (void)didSelectItemAtIndex:(int64_t)a3;
- (void)sendRankSectionsFeedback;
- (void)setCategories:(id)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setRecents:(id)a3;
- (void)setSearchModel:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)updateModel;
- (void)updateRecents:(id)a3;
@end

@implementation CategoriesDataSource

- (CategoriesDataSource)initWithSearchModel:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CategoriesDataSource;
  v6 = [(CategoriesDataSource *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchModel, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    model = v7->_model;
    v7->_model = v8;

    categories = v7->_categories;
    v7->_categories = (NSArray *)MEMORY[0x263EFFA68];

    v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v12 = [v11 objectForKey:@"STSRecentQueries"];
    uint64_t v13 = [v12 mutableCopy];
    recents = v7->_recents;
    v7->_recents = (NSMutableArray *)v13;

    if (!v7->_recents)
    {
      uint64_t v15 = objc_opt_new();
      v16 = v7->_recents;
      v7->_recents = (NSMutableArray *)v15;
    }
    v17 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__CategoriesDataSource_initWithSearchModel___block_invoke;
    block[3] = &unk_264A053F0;
    v20 = v7;
    dispatch_async(v17, block);
  }
  return v7;
}

uint64_t __44__CategoriesDataSource_initWithSearchModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateModel];
}

- (void)updateModel
{
  [(NSMutableArray *)self->_model removeAllObjects];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSMutableArray *)self->_recents count])
  {
    v4 = objc_alloc_init(STSCategoryResult);
    [(STSCategoryResult *)v4 setType:2];
    id v5 = STSLocalizedString(@"RECENT");
    [(STSCategoryResult *)v4 setTitle:v5];

    [(STSCategoryResult *)v4 setClearButtonHidden:0];
    [(NSMutableArray *)self->_model addObject:v4];
    recents = self->_recents;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __35__CategoriesDataSource_updateModel__block_invoke;
    v19[3] = &unk_264A05418;
    v19[4] = self;
    id v20 = v3;
    [(NSMutableArray *)recents enumerateObjectsUsingBlock:v19];
  }
  v7 = objc_alloc_init(STSCategoryResult);
  [(STSCategoryResult *)v7 setType:2];
  v8 = STSLocalizedString(@"CATEGORIES");
  [(STSCategoryResult *)v7 setTitle:v8];

  [(STSCategoryResult *)v7 setClearButtonHidden:1];
  [(NSMutableArray *)self->_model addObject:v7];
  v9 = [(STSSearchModel *)self->_searchModel categoryList];
  v10 = (void *)[v9 copy];

  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __35__CategoriesDataSource_updateModel__block_invoke_2;
  v16 = &unk_264A05440;
  v17 = self;
  id v18 = v3;
  id v11 = v3;
  [v10 enumerateObjectsUsingBlock:&v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  objc_msgSend(WeakRetained, "searchModelUpdated", v13, v14, v15, v16, v17);
}

void __35__CategoriesDataSource_updateModel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8 = objc_alloc_init(STSCategoryResult);
  [(STSCategoryResult *)v8 setType:0];
  [(STSCategoryResult *)v8 setTitle:v3];
  v4 = (void *)[objc_alloc(MEMORY[0x263F67A10]) initWithSuggestion:v3 query:&stru_26E2ACAA8 score:3 type:0.0];
  [(STSCategoryResult *)v8 setSuggestion:v4];

  id v5 = objc_alloc_init(MEMORY[0x263F67A08]);
  v6 = [MEMORY[0x263F67A90] textWithString:v3];
  [v5 setTitle:v6];

  v7 = [*(id *)(a1 + 32) _searchResultIdentifierForSuggestion:v3 recent:1];

  [v5 setIdentifier:v7];
  [v5 setType:16];
  [v5 setResultBundleId:@"com.apple.hashtagimages.categorylist.recents.recent"];
  [v5 setSectionBundleIdentifier:@"com.apple.hashtagimages.categorylist.recents"];
  [(STSCategoryResult *)v8 setSearchResult:v5];
  [*(id *)(a1 + 40) addObject:v5];
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v8];
}

void __35__CategoriesDataSource_updateModel__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  v17 = objc_alloc_init(STSCategoryResult);
  [(STSCategoryResult *)v17 setType:1];
  v6 = [v5 suggestion];
  [(STSCategoryResult *)v17 setTitle:v6];

  [(STSCategoryResult *)v17 setSuggestion:v5];
  id v7 = objc_alloc_init(MEMORY[0x263F67A08]);
  v8 = [v5 fbr];
  [v7 setFbr:v8];

  v9 = (void *)MEMORY[0x263F67A90];
  v10 = [v5 suggestion];
  id v11 = [v9 textWithString:v10];
  [v7 setTitle:v11];

  v12 = *(void **)(a1 + 32);
  uint64_t v13 = [v5 suggestion];
  uint64_t v14 = [v12 _searchResultIdentifierForSuggestion:v13 recent:0];
  [v7 setIdentifier:v14];

  [v7 setResultBundleId:@"com.apple.hashtagimages.categorylist.categories.category"];
  [v7 setSectionBundleIdentifier:@"com.apple.hashtagimages.categorylist.categories"];
  uint64_t v15 = [v5 prediction];

  if (v15) {
    uint64_t v16 = 15;
  }
  else {
    uint64_t v16 = 17;
  }
  [v7 setType:v16];
  [(STSCategoryResult *)v17 setSearchResult:v7];
  if (a3 <= 0xF)
  {
    [*(id *)(a1 + 40) addObject:v7];
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:v17];
  }
}

- (void)_commitClearRecents
{
  id v3 = [MEMORY[0x263EFF980] array];
  recents = self->_recents;
  self->_recents = v3;

  [(CategoriesDataSource *)self updateModel];
  [(CategoriesDataSource *)self sendRankSectionsFeedback];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  [WeakRetained sendVisibleResultsFeedback];
}

- (id)_searchResultIdentifierForSuggestion:(id)a3 recent:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 length])
  {
    if (v4) {
      v6 = @"msgscat-recent:%@";
    }
    else {
      v6 = @"msgscat-cat:%@";
    }
    id v7 = objc_msgSend(NSString, "stringWithFormat:", v6, v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)recentQueries
{
  v2 = (void *)[(NSMutableArray *)self->_recents copy];

  return v2;
}

- (void)updateRecents:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] < 4)
  {
    v6 = (void *)[v4 mutableCopy];
  }
  else
  {
    id v5 = objc_msgSend(v4, "subarrayWithRange:", 0, 3);
    v6 = (void *)[v5 mutableCopy];
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v7 = [v6 count];
  if (v7 == [(NSMutableArray *)self->_recents count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__CategoriesDataSource_updateRecents___block_invoke;
    v8[3] = &unk_264A05468;
    v8[4] = self;
    v8[5] = &v9;
    [v6 enumerateObjectsUsingBlock:v8];
    if (!*((unsigned char *)v10 + 24)) {
      goto LABEL_9;
    }
  }
  else
  {
    *((unsigned char *)v10 + 24) = 1;
  }
  objc_storeStrong((id *)&self->_recents, v6);
  [(CategoriesDataSource *)self updateModel];
LABEL_9:
  _Block_object_dispose(&v9, 8);
}

void __38__CategoriesDataSource_updateRecents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  id v6 = a2;
  uint64_t v7 = [v5 objectAtIndex:a3];
  LOBYTE(v5) = [v6 isEqualToString:v7];

  if ((v5 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)addQueryToRecents:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  id v6 = [v4 whitespaceCharacterSet];
  uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([v7 length])
  {
    recents = self->_recents;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__CategoriesDataSource_addQueryToRecents___block_invoke;
    v14[3] = &unk_264A05490;
    id v9 = v7;
    id v15 = v9;
    uint64_t v10 = [(NSMutableArray *)recents indexOfObjectPassingTest:v14];
    uint64_t v11 = self->_recents;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)v11 insertObject:v9 atIndex:0];
      if ((unint64_t)[(NSMutableArray *)self->_recents count] >= 4) {
        [(NSMutableArray *)self->_recents removeLastObject];
      }
    }
    else
    {
      char v12 = [(NSMutableArray *)v11 objectAtIndex:v10];
      [(NSMutableArray *)self->_recents removeObjectAtIndex:v10];
      [(NSMutableArray *)self->_recents insertObject:v12 atIndex:0];
    }
    [(CategoriesDataSource *)self updateModel];
    uint64_t v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v13 setObject:self->_recents forKey:@"STSRecentQueries"];
    [v13 synchronize];
    [(CategoriesDataSource *)self updateModel];
  }
}

BOOL __42__CategoriesDataSource_addQueryToRecents___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) caseInsensitiveCompare:a2] == 0;
}

- (id)headerTitleForRow:(int64_t)a3
{
  if (a3 || ![(NSMutableArray *)self->_recents count]) {
    id v3 = @"CATEGORIES";
  }
  else {
    id v3 = @"RECENT";
  }
  id v4 = STSLocalizedString(v3);

  return v4;
}

- (BOOL)isGroupRow:(int64_t)a3
{
  if (!a3) {
    return 1;
  }
  return [(NSMutableArray *)self->_recents count] && [(NSMutableArray *)self->_recents count] + 1 == a3;
}

- (int64_t)numberOfRows
{
  return [(NSMutableArray *)self->_model count];
}

- (id)stringValueForRowAtIndex:(int64_t)a3
{
  id v3 = [(NSMutableArray *)self->_model objectAtIndex:a3];
  id v4 = [v3 title];

  return v4;
}

- (void)didSelectItemAtIndex:(int64_t)a3
{
  id v13 = [(NSMutableArray *)self->_model objectAtIndex:a3];
  id v4 = [v13 title];
  [(CategoriesDataSource *)self addQueryToRecents:v4];

  id v5 = [v13 searchResult];

  if (v5)
  {
    id v6 = +[STSFeedbackReporter sharedInstance];
    uint64_t v7 = [v13 searchResult];
    v8 = [v13 suggestion];
    [v6 didEngageCategoryResult:v7 suggestion:v8];
  }
  if ([v13 type] == 1)
  {
    id v9 = [v13 suggestion];
    uint64_t v10 = [v9 prediction];

    uint64_t v11 = [(CategoriesDataSource *)self selectionDelegate];
    char v12 = [v13 title];
    [v11 categoryViewController:self didSelectCategory:v12 suggested:v10 != 0];
  }
  else
  {
    if ([v13 type]) {
      goto LABEL_8;
    }
    uint64_t v11 = [(CategoriesDataSource *)self selectionDelegate];
    char v12 = [v13 title];
    [v11 categoryViewController:self didSelectRecent:v12];
  }

LABEL_8:
}

- (BOOL)rowHasClearButton:(int64_t)a3
{
  id v3 = [(NSMutableArray *)self->_model objectAtIndex:a3];
  char v4 = [v3 clearButtonHidden] ^ 1;

  return v4;
}

- (void)sendRankSectionsFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  model = self->_model;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __48__CategoriesDataSource_sendRankSectionsFeedback__block_invoke;
  char v12 = &unk_264A054B8;
  id v13 = v3;
  id v14 = v4;
  id v6 = v4;
  id v7 = v3;
  [(NSMutableArray *)model enumerateObjectsUsingBlock:&v9];
  v8 = +[STSFeedbackReporter sharedInstance];
  objc_msgSend(v8, "didLoadCategoryResults:recents:queryId:", v6, v7, -[STSSearchModel categoryListRequestQueryId](self->_searchModel, "categoryListRequestQueryId"));
}

void __48__CategoriesDataSource_sendRankSectionsFeedback__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 type] != 2)
  {
    if ([v5 type]) {
      id v3 = *(void **)(a1 + 40);
    }
    else {
      id v3 = *(void **)(a1 + 32);
    }
    id v4 = [v5 searchResult];
    [v3 addObject:v4];
  }
}

- (id)visibleResultsForIndexPaths:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__CategoriesDataSource_visibleResultsForIndexPaths___block_invoke;
  v11[3] = &unk_264A054E0;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];

  v8 = v12;
  id v9 = v7;

  return v9;
}

void __52__CategoriesDataSource_visibleResultsForIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectAtIndex:", objc_msgSend(a2, "row"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 type] != 2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [v5 searchResult];
    [v3 addObject:v4];
  }
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (STSSearchModelUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  return (STSSearchModelUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (STSCategorySelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (STSCategorySelectionDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (NSMutableArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
}

- (NSMutableArray)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);

  objc_destroyWeak((id *)&self->_updateDelegate);
}

@end