@interface WFInsetTableViewController
- (BOOL)_isRegularWidth;
- (BOOL)reloadDataOnUpdateSectionContentInset;
- (WFInsetTableViewController)init;
- (void)_updateSectionContentInsetWithAnimation:(BOOL)a3;
- (void)loadView;
- (void)setReloadDataOnUpdateSectionContentInset:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation WFInsetTableViewController

- (WFInsetTableViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)WFInsetTableViewController;
  v2 = [(WFInsetTableViewController *)&v4 init];
  [(WFInsetTableViewController *)v2 setReloadDataOnUpdateSectionContentInset:1];
  return v2;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)WFInsetTableViewController;
  [(WFInsetTableViewController *)&v4 loadView];
  v3 = [(WFInsetTableViewController *)self view];
  [v3 setLayoutMarginsFollowReadableWidth:1];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFInsetTableViewController;
  [(WFInsetTableViewController *)&v3 viewDidLayoutSubviews];
  [(WFInsetTableViewController *)self _updateSectionContentInsetWithAnimation:1];
}

- (void)_updateSectionContentInsetWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WFInsetTableViewController *)self _isRegularWidth];
  v6 = (double *)MEMORY[0x263F839B8];
  if (v5)
  {
    v7 = [(WFInsetTableViewController *)self view];
    [v7 layoutMargins];
    double v9 = v8;

    v10 = [(WFInsetTableViewController *)self view];
    [v10 safeAreaInsets];
    double v12 = v11;

    double v13 = 0.0;
    if (v12 <= 0.0)
    {
      v14 = [(WFInsetTableViewController *)self view];
      [v14 layoutMargins];
      double v13 = v15;
    }
  }
  else
  {
    double v13 = *MEMORY[0x263F839B8];
    double v9 = *MEMORY[0x263F839B8];
  }
  v16 = [(WFInsetTableViewController *)self tableView];
  [v16 _sectionContentInset];
  double v18 = v17;
  double v20 = v19;

  if (v9 != v18 || v13 != v20)
  {
    double v22 = *v6;
    if (v3 && self->_sectionContentInsetInitialized)
    {
      id v23 = [(WFInsetTableViewController *)self tableView];
      objc_msgSend(v23, "_setSectionContentInset:", v22, v9, v22, v13);
    }
    else
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __70__WFInsetTableViewController__updateSectionContentInsetWithAnimation___block_invoke;
      v24[3] = &unk_264756758;
      v24[4] = self;
      *(double *)&v24[5] = v22;
      *(double *)&v24[6] = v9;
      *(double *)&v24[7] = v22;
      *(double *)&v24[8] = v13;
      [MEMORY[0x263F82E00] performWithoutAnimation:v24];
      self->_sectionContentInsetInitialized = 1;
    }
  }
}

void __70__WFInsetTableViewController__updateSectionContentInsetWithAnimation___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  v6 = [*(id *)(a1 + 32) tableView];
  objc_msgSend(v6, "_setSectionContentInset:", v2, v3, v4, v5);

  if ([*(id *)(a1 + 32) reloadDataOnUpdateSectionContentInset])
  {
    id v7 = [*(id *)(a1 + 32) tableView];
    [v7 reloadData];
  }
}

- (BOOL)_isRegularWidth
{
  double v3 = [MEMORY[0x263F82DA0] traitCollectionWithHorizontalSizeClass:2];
  double v4 = [(WFInsetTableViewController *)self splitViewController];
  double v5 = [v4 traitCollection];
  char v6 = [v5 containsTraitsInCollection:v3];

  return v6;
}

- (BOOL)reloadDataOnUpdateSectionContentInset
{
  return self->_reloadDataOnUpdateSectionContentInset;
}

- (void)setReloadDataOnUpdateSectionContentInset:(BOOL)a3
{
  self->_reloadDataOnUpdateSectionContentInset = a3;
}

@end