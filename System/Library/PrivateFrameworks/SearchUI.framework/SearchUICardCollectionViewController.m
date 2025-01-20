@interface SearchUICardCollectionViewController
- (BOOL)rowSelectionAppearanceEnabled;
- (BOOL)showsVerticalScrollIndicator;
- (CGSize)collectionViewContentSize;
- (Class)restorationContextClass;
- (SFCard)card;
- (SearchUICardCollectionViewController)init;
- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4;
- (id)tableView;
- (void)reloadViews;
- (void)setCard:(id)a3;
- (void)setRowSelectionAppearanceEnabled:(BOOL)a3;
- (void)setShouldUseInsetRoundedSections:(BOOL)a3;
- (void)setShouldUseStandardSectionInsets:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)tableView;
- (void)updateTopPadding;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SearchUICardCollectionViewController

- (SearchUICardCollectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICardCollectionViewController;
  v2 = [(SearchUICollectionViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SearchUICardCollectionViewController *)v2 setRowSelectionAppearanceEnabled:1];
  }
  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUICardCollectionViewController;
  [(SearchUICollectionViewController *)&v12 viewDidDisappear:a3];
  v4 = [(SearchUICardCollectionViewController *)self navigationController];
  objc_super v5 = [v4 visibleViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [(SearchUICollectionViewController *)self feedbackListener];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    v8 = [(SearchUICardCollectionViewController *)self navigationController];
    v9 = [v8 interactivePopGestureRecognizer];
    if ([v9 state] < 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }

    v4 = (void *)[objc_alloc(MEMORY[0x1E4F99F48]) initWithEvent:v10];
    v11 = [(SearchUICollectionViewController *)self tableModel];
    objc_msgSend(v4, "setQueryId:", objc_msgSend(v11, "queryId"));

    objc_super v5 = [(SearchUICollectionViewController *)self feedbackListener];
    [v5 cardViewDidDisappear:v4];
  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SearchUICardCollectionViewController *)self collectionView];
  [v4 setShowsVerticalScrollIndicator:v3];
}

- (BOOL)showsVerticalScrollIndicator
{
  v2 = [(SearchUICardCollectionViewController *)self collectionView];
  char v3 = [v2 showsVerticalScrollIndicator];

  return v3;
}

- (void)reloadViews
{
  char v3 = [(SearchUICardCollectionViewController *)self collectionView];
  [v3 reloadData];

  id v4 = [(SearchUICardCollectionViewController *)self collectionView];
  [v4 layoutIfNeeded];
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUICardCollectionViewController;
  [(SearchUICollectionViewController *)&v4 setShouldUseInsetRoundedSections:a3];
  [(SearchUICardCollectionViewController *)self updateTopPadding];
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUICardCollectionViewController;
  [(SearchUICollectionViewController *)&v4 setShouldUseStandardSectionInsets:a3];
  [(SearchUICardCollectionViewController *)self updateTopPadding];
}

- (void)updateTopPadding
{
  double v3 = 0.0;
  if ([(SearchUICollectionViewController *)self shouldUseInsetRoundedSections])
  {
    if ([(SearchUICollectionViewController *)self shouldUseStandardSectionInsets]) {
      double v3 = 16.0;
    }
    else {
      double v3 = 12.0;
    }
  }
  id v4 = [(SearchUICardCollectionViewController *)self collectionView];
  objc_msgSend(v4, "setContentInset:", v3, 0.0, 0.0, 0.0);
}

- (CGSize)collectionViewContentSize
{
  v2 = [(SearchUICardCollectionViewController *)self collectionView];
  double v3 = [v2 collectionViewLayout];
  [v3 collectionViewContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SearchUICollectionViewController *)self cardViewDelegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v10 = [v6 cardSection];

  if (!v10) {
    goto LABEL_5;
  }
  v11 = [(SearchUICollectionViewController *)self cardViewDelegate];
  objc_super v12 = [v6 cardSection];
  v13 = [v11 customViewControllerForCardSection:v12];

  if (v13)
  {
    [(SearchUICardCollectionViewController *)self addChildViewController:v13];
    v14 = [v6 cardSection];
    v15 = [v14 description];

    v16 = [(SearchUICardCollectionViewController *)self collectionView];
    [v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:v15];

    v17 = [(SearchUICardCollectionViewController *)self collectionView];
    v18 = [v17 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];

    [v18 setEmbeddedViewController:v13];
  }
  else
  {
LABEL_5:
    v20.receiver = self;
    v20.super_class = (Class)SearchUICardCollectionViewController;
    v18 = [(SearchUICollectionViewController *)&v20 cellForRowModel:v6 atIndexPath:v7];
    if (![(SearchUICardCollectionViewController *)self rowSelectionAppearanceEnabled])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v18, "setSearchui_focusStyle:", 6);
      }
    }
  }

  return v18;
}

- (id)tableView
{
  double v3 = [(SearchUICardCollectionViewController *)self collectionView];
  [v3 setScrollEnabled:0];

  double v4 = [(SearchUICardCollectionViewController *)self collectionView];
  [v4 _setSafeAreaInsetsFrozen:1];

  double v5 = SearchUIGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[SearchUICardCollectionViewController tableView](v5);
  }

  return 0;
}

- (Class)restorationContextClass
{
  return (Class)objc_opt_class();
}

- (SFCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
}

- (BOOL)rowSelectionAppearanceEnabled
{
  return self->_rowSelectionAppearanceEnabled;
}

- (void)setRowSelectionAppearanceEnabled:(BOOL)a3
{
  self->_rowSelectionAppearanceEnabled = a3;
}

- (void).cxx_destruct
{
}

- (void)tableView
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E45B5000, log, OS_LOG_TYPE_FAULT, "Dont dip in to SearchUI to get this use scrollEnabled on SearchUICardViewController", v1, 2u);
}

@end