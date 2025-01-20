@interface STSCategoryViewController
- (BOOL)sendFeedbackOnViewDidAppear;
- (NSArray)categories;
- (NSArray)recents;
- (NSMutableArray)model;
- (STSCategoryViewController)init;
- (STSCategoryViewControllerDelegate)selectionDelegate;
- (STSSearchModel)searchModel;
- (UIEdgeInsets)contentInset;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_searchResultIdentifierForSuggestion:(id)a3 recent:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_commitClearRecents;
- (void)_reportFeedbackDisplayedResultsDidScroll:(BOOL)a3;
- (void)clearButton:(id)a3 pressedForCategoryResult:(id)a4;
- (void)reload;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)sendRankSectionsFeedback;
- (void)sendVisibleResultsFeedback;
- (void)setCategories:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setModel:(id)a3;
- (void)setRecents:(id)a3;
- (void)setSearchModel:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setSendFeedbackOnViewDidAppear:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateContentOffset:(double)a3;
- (void)updateModel;
- (void)updateRecents:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STSCategoryViewController

- (STSCategoryViewController)init
{
  v18.receiver = self;
  v18.super_class = (Class)STSCategoryViewController;
  v2 = [(STSCategoryViewController *)&v18 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    model = v2->_model;
    v2->_model = v3;

    categories = v2->_categories;
    v6 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_categories = (NSArray *)MEMORY[0x263EFFA68];

    recents = v2->_recents;
    v2->_recents = v6;

    v2->_isScrolling = 0;
    v8 = objc_alloc_init(STSCategoryView);
    v9 = [(STSCategoryView *)v8 tableView];
    [v9 setDataSource:v2];

    v10 = [(STSCategoryView *)v8 tableView];
    [v10 setDelegate:v2];

    v11 = [(STSCategoryView *)v8 tableView];
    [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"CategoryCell"];

    v12 = [(STSCategoryView *)v8 tableView];
    [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"CategoryTitleCell"];

    v13 = [(STSCategoryView *)v8 tableView];
    [v13 setSeparatorStyle:1];

    [(STSCategoryViewController *)v2 setView:v8];
    v14 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__STSCategoryViewController_init__block_invoke;
    block[3] = &unk_264A053F0;
    v17 = v2;
    dispatch_async(v14, block);
  }
  return v2;
}

uint64_t __33__STSCategoryViewController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateModel];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)STSCategoryViewController;
  [(STSCategoryViewController *)&v3 viewDidLoad];
  [(STSCategoryViewController *)self updateModel];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v5 = [(STSCategoryViewController *)self view];
  objc_super v3 = [v5 tableView];
  v4 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  [v3 scrollToRowAtIndexPath:v4 atScrollPosition:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  if ([(STSCategoryViewController *)self sendFeedbackOnViewDidAppear])
  {
    [(STSCategoryViewController *)self setSendFeedbackOnViewDidAppear:0];
    [(STSCategoryViewController *)self sendVisibleResultsFeedback];
  }
}

- (UIEdgeInsets)contentInset
{
  v2 = [(STSCategoryViewController *)self view];
  [v2 contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v8 = [(STSCategoryViewController *)self view];
  double v7 = [v8 tableView];
  objc_msgSend(v7, "setContentInset:", top, left, bottom, right);
}

- (void)updateContentOffset:(double)a3
{
  id v9 = [(STSCategoryViewController *)self view];
  double v5 = [v9 tableView];
  double v6 = [(STSCategoryViewController *)self view];
  double v7 = [v6 tableView];
  [v7 contentInset];
  objc_msgSend(v5, "setContentOffset:", -v8, a3);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  double v4 = (objc_class *)MEMORY[0x263F82E00];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 bounds];
  double v8 = v7;

  id v9 = objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v8, 0.0);

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_model count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = -[NSMutableArray objectAtIndex:](self->_model, "objectAtIndex:", [v7 row]);
  unint64_t v9 = [v8 type];
  if (v9 >= 2)
  {
    if (v9 == 2)
    {
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"CategoryTitleCell" forIndexPath:v7];
      [v10 setSelectionStyle:0];
      v22 = [v10 textLabel];
      v23 = [v8 title];
      [v22 setText:v23];

      objc_msgSend(v10, "setClearButtonHidden:", objc_msgSend(v8, "clearButtonHidden"));
      [v10 setResult:v8];
      [v10 setSelectionDelegate:self];
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = [v6 dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:v7];
    double v11 = [v10 textLabel];
    double v12 = [v8 title];
    [v11 setText:v12];

    double v13 = [v10 textLabel];
    double v14 = [MEMORY[0x263F825C8] systemPinkColor];
    [v13 setTextColor:v14];

    v15 = [v10 textLabel];
    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83628]];
    [v15 setFont:v16];

    v17 = [v8 searchResult];
    if (v17)
    {
      BOOL isScrolling = self->_isScrolling;

      if (isScrolling)
      {
        v19 = +[STSFeedbackReporter sharedInstance];
        v20 = [v8 searchResult];
        v25[0] = v20;
        v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
        [v19 didShowResults:v21 scrolling:1];
      }
    }
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSMutableArray objectAtIndex:](self->_model, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if ([v13 type] == 1)
  {
    id v5 = [v13 suggestion];
    id v6 = [v5 prediction];

    id v7 = [(STSCategoryViewController *)self selectionDelegate];
    double v8 = [v13 title];
    [v7 categoryViewController:self didSelectCategory:v8 suggested:v6 != 0];
  }
  else
  {
    if ([v13 type]) {
      goto LABEL_6;
    }
    id v7 = [(STSCategoryViewController *)self selectionDelegate];
    double v8 = [v13 title];
    [v7 categoryViewController:self didSelectRecent:v8];
  }

LABEL_6:
  unint64_t v9 = [v13 searchResult];

  if (v9)
  {
    double v10 = +[STSFeedbackReporter sharedInstance];
    double v11 = [v13 searchResult];
    double v12 = [v13 suggestion];
    [v10 didEngageCategoryResult:v11 suggestion:v12];
  }
}

- (void)updateModel
{
  [(NSMutableArray *)self->_model removeAllObjects];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSArray *)self->_recents count])
  {
    double v4 = objc_alloc_init(STSCategoryResult);
    [(STSCategoryResult *)v4 setType:2];
    id v5 = STSLocalizedString(@"RECENT");
    [(STSCategoryResult *)v4 setTitle:v5];

    [(STSCategoryResult *)v4 setClearButtonHidden:0];
    [(NSMutableArray *)self->_model addObject:v4];
    recents = self->_recents;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__STSCategoryViewController_updateModel__block_invoke;
    v14[3] = &unk_264A05418;
    v14[4] = self;
    id v15 = v3;
    [(NSArray *)recents enumerateObjectsUsingBlock:v14];
  }
  id v7 = objc_alloc_init(STSCategoryResult);
  [(STSCategoryResult *)v7 setType:2];
  double v8 = STSLocalizedString(@"CATEGORIES");
  [(STSCategoryResult *)v7 setTitle:v8];

  [(STSCategoryResult *)v7 setClearButtonHidden:1];
  [(NSMutableArray *)self->_model addObject:v7];
  unint64_t v9 = [(STSSearchModel *)self->_searchModel categoryList];
  double v10 = (void *)[v9 copy];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__STSCategoryViewController_updateModel__block_invoke_2;
  v12[3] = &unk_264A05440;
  v12[4] = self;
  id v13 = v3;
  id v11 = v3;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __40__STSCategoryViewController_updateModel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v8 = objc_alloc_init(STSCategoryResult);
  [(STSCategoryResult *)v8 setType:0];
  [(STSCategoryResult *)v8 setTitle:v3];
  double v4 = (void *)[objc_alloc(MEMORY[0x263F67A10]) initWithSuggestion:v3 query:&stru_26E2ACAA8 score:3 type:0.0];
  [(STSCategoryResult *)v8 setSuggestion:v4];

  id v5 = objc_alloc_init(MEMORY[0x263F67A08]);
  id v6 = [MEMORY[0x263F67A90] textWithString:v3];
  [v5 setTitle:v6];

  id v7 = [*(id *)(a1 + 32) _searchResultIdentifierForSuggestion:v3 recent:1];

  [v5 setIdentifier:v7];
  [v5 setType:16];
  [v5 setResultBundleId:@"com.apple.hashtagimages.categorylist.recents.recent"];
  [v5 setSectionBundleIdentifier:@"com.apple.hashtagimages.categorylist.recents"];
  [(STSCategoryResult *)v8 setSearchResult:v5];
  [*(id *)(a1 + 40) addObject:v5];
  [*(id *)(*(void *)(a1 + 32) + 1032) addObject:v8];
}

void __40__STSCategoryViewController_updateModel__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  v17 = objc_alloc_init(STSCategoryResult);
  [(STSCategoryResult *)v17 setType:1];
  id v6 = [v5 suggestion];
  [(STSCategoryResult *)v17 setTitle:v6];

  [(STSCategoryResult *)v17 setSuggestion:v5];
  id v7 = objc_alloc_init(MEMORY[0x263F67A08]);
  double v8 = [v5 fbr];
  [v7 setFbr:v8];

  unint64_t v9 = (void *)MEMORY[0x263F67A90];
  double v10 = [v5 suggestion];
  id v11 = [v9 textWithString:v10];
  [v7 setTitle:v11];

  double v12 = *(void **)(a1 + 32);
  id v13 = [v5 suggestion];
  double v14 = [v12 _searchResultIdentifierForSuggestion:v13 recent:0];
  [v7 setIdentifier:v14];

  [v7 setResultBundleId:@"com.apple.hashtagimages.categorylist.categories.category"];
  [v7 setSectionBundleIdentifier:@"com.apple.hashtagimages.categorylist.categories"];
  id v15 = [v5 prediction];

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
    [*(id *)(*(void *)(a1 + 32) + 1032) addObject:v17];
  }
}

- (void)clearButton:(id)a3 pressedForCategoryResult:(id)a4
{
  id v5 = a3;
  id v6 = +[STSAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v7 = [v6 view];
  double v8 = [MEMORY[0x263F825C8] systemPinkColor];
  [v7 setTintColor:v8];

  unint64_t v9 = (void *)MEMORY[0x263F82400];
  double v10 = STSLocalizedString(@"CLEAR_RECENTS_ACTION_TITLE");
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke;
  v23[3] = &unk_264A05690;
  v23[4] = self;
  id v11 = [v9 actionWithTitle:v10 style:0 handler:v23];

  double v12 = (void *)MEMORY[0x263F82400];
  id v13 = STSLocalizedString(@"CANCEL");
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke_2;
  v21 = &unk_264A05690;
  id v22 = v6;
  id v14 = v6;
  id v15 = [v12 actionWithTitle:v13 style:1 handler:&v18];

  objc_msgSend(v14, "addAction:", v11, v18, v19, v20, v21);
  [v14 addAction:v15];
  [v14 setModalPresentationStyle:7];
  uint64_t v16 = [v14 popoverPresentationController];
  [v5 bounds];
  objc_msgSend(v16, "setSourceRect:");

  v17 = [v14 popoverPresentationController];
  [v17 setSourceView:v5];

  [(STSCategoryViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitClearRecents];
}

uint64_t __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_commitClearRecents
{
  recents = self->_recents;
  self->_recents = (NSArray *)MEMORY[0x263EFFA68];

  [(STSCategoryViewController *)self updateModel];
  double v4 = [(STSCategoryViewController *)self view];
  id v5 = [v4 tableView];
  [v5 reloadData];

  [(STSCategoryViewController *)self sendRankSectionsFeedback];
  [(STSCategoryViewController *)self sendVisibleResultsFeedback];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  [WeakRetained categoryViewControllerDidSelectClearRecentsButton:self];
}

- (void)updateRecents:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] < 4)
  {
    id v5 = (void *)[v4 copy];
  }
  else
  {
    id v5 = objc_msgSend(v4, "subarrayWithRange:", 0, 3);
  }
  id v6 = v5;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = [v5 count];
  if (v7 == [(NSArray *)self->_recents count])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__STSCategoryViewController_updateRecents___block_invoke;
    v10[3] = &unk_264A05468;
    v10[4] = self;
    v10[5] = &v11;
    [v6 enumerateObjectsUsingBlock:v10];
    if (!*((unsigned char *)v12 + 24)) {
      goto LABEL_9;
    }
  }
  else
  {
    *((unsigned char *)v12 + 24) = 1;
  }
  objc_storeStrong((id *)&self->_recents, v6);
  [(STSCategoryViewController *)self updateModel];
LABEL_9:
  double v8 = [(STSCategoryViewController *)self view];
  unint64_t v9 = [v8 tableView];
  [v9 reloadData];

  _Block_object_dispose(&v11, 8);
}

void __43__STSCategoryViewController_updateRecents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 1024);
  id v6 = a2;
  uint64_t v7 = [v5 objectAtIndex:a3];
  LOBYTE(v5) = [v6 isEqualToString:v7];

  if ((v5 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)reload
{
  id v3 = [(STSCategoryViewController *)self view];
  v2 = [v3 tableView];
  [v2 reloadData];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_BOOL isScrolling = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  [WeakRetained categoryViewControllerScrollViewWillBeginDragging:self];

  [(STSCategoryViewController *)self _reportFeedbackDisplayedResultsDidScroll:0];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_BOOL isScrolling = 0;
}

- (id)_searchResultIdentifierForSuggestion:(id)a3 recent:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 length])
  {
    if (v4) {
      id v6 = @"msgscat-recent:%@";
    }
    else {
      id v6 = @"msgscat-cat:%@";
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)sendRankSectionsFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  model = self->_model;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __53__STSCategoryViewController_sendRankSectionsFeedback__block_invoke;
  double v12 = &unk_264A054B8;
  id v13 = v3;
  id v14 = v4;
  id v6 = v4;
  id v7 = v3;
  [(NSMutableArray *)model enumerateObjectsUsingBlock:&v9];
  double v8 = +[STSFeedbackReporter sharedInstance];
  objc_msgSend(v8, "didLoadCategoryResults:recents:queryId:", v6, v7, -[STSSearchModel categoryListRequestQueryId](self->_searchModel, "categoryListRequestQueryId"));
}

void __53__STSCategoryViewController_sendRankSectionsFeedback__block_invoke(uint64_t a1, void *a2)
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

- (void)sendVisibleResultsFeedback
{
  id v3 = [(STSCategoryViewController *)self view];
  id v4 = [v3 tableView];
  id v5 = [v4 indexPathsForVisibleRows];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__STSCategoryViewController_sendVisibleResultsFeedback__block_invoke;
  double v12 = &unk_264A054E0;
  id v13 = self;
  id v7 = v6;
  id v14 = v7;
  [v5 enumerateObjectsUsingBlock:&v9];
  if (objc_msgSend(v7, "count", v9, v10, v11, v12, v13))
  {
    double v8 = +[STSFeedbackReporter sharedInstance];
    [v8 didShowResults:v7 scrolling:0];
  }
}

void __55__STSCategoryViewController_sendVisibleResultsFeedback__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1032), "objectAtIndex:", objc_msgSend(a2, "row"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 type] != 2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [v5 searchResult];
    [v3 addObject:v4];
  }
}

- (void)_reportFeedbackDisplayedResultsDidScroll:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_displayedResults count])
  {
    id v5 = +[STSFeedbackReporter sharedInstance];
    id v6 = (void *)[(NSMutableArray *)self->_displayedResults copy];
    [v5 didShowResults:v6 scrolling:v3];

    displayedResults = self->_displayedResults;
    [(NSMutableArray *)displayedResults removeAllObjects];
  }
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
}

- (STSCategoryViewControllerDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (STSCategoryViewControllerDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (BOOL)sendFeedbackOnViewDidAppear
{
  return self->_sendFeedbackOnViewDidAppear;
}

- (void)setSendFeedbackOnViewDidAppear:(BOOL)a3
{
  self->_sendFeedbackOnViewDidAppear = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)recents
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_searchModel, 0);

  objc_storeStrong((id *)&self->_displayedResults, 0);
}

@end