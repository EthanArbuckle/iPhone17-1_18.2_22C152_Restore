@interface PopoverCatalogViewController
- (CatalogViewController)primaryCatalogViewController;
- (PopoverCatalogViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_preferredHeightForStartPage;
- (double)maxContentHeight;
- (double)requiredContentWidth;
- (id)completionsViewController;
- (id)completionsViewControllerIfLoaded;
- (id)startPageViewController;
- (id)universalSearchFirstTimeExperienceViewController;
- (void)didGainOwnershipOfCompletionsViewController;
- (void)didGainOwnershipOfStartPageViewController;
- (void)didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController;
- (void)resetStartPagePreferredHeight;
- (void)setPrimaryCatalogViewController:(id)a3;
- (void)updateStartPagePreferredContentSize;
- (void)viewWillLayoutSubviews;
@end

@implementation PopoverCatalogViewController

- (id)universalSearchFirstTimeExperienceViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  v3 = [WeakRetained universalSearchFirstTimeExperienceViewController];

  return v3;
}

- (id)startPageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  v3 = [WeakRetained startPageViewController];

  return v3;
}

- (double)requiredContentWidth
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  [WeakRetained requiredContentWidth];
  double v4 = v3;

  return v4;
}

- (double)maxContentHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  [WeakRetained maxContentHeight];
  double v4 = v3;

  return v4;
}

- (id)completionsViewControllerIfLoaded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  double v3 = [WeakRetained completionsViewControllerIfLoaded];

  return v3;
}

- (void)setPrimaryCatalogViewController:(id)a3
{
}

- (PopoverCatalogViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PopoverCatalogViewController;
  double v4 = [(PopoverCatalogViewController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PopoverCatalogViewController *)v4 traitOverrides];
    [v6 setNSIntegerValue:1 forTrait:objc_opt_class()];

    v7 = v5;
  }

  return v5;
}

- (void)viewWillLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PopoverCatalogViewController;
  [(AbstractCatalogViewController *)&v20 viewWillLayoutSubviews];
  double v3 = [(PopoverCatalogViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(PopoverCatalogViewController *)self completionsViewControllerIfLoaded];
  if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v12])
  {
    v13 = [v12 tableView];
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
    [v12 updateContentInsets];
    objc_msgSend(v13, "setScrollIndicatorInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
  v14 = [(PopoverCatalogViewController *)self startPageViewController];
  BOOL v15 = [(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v14];

  if (v15)
  {
    v16 = [(PopoverCatalogViewController *)self startPageViewController];
    v17 = [v16 view];

    objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v17, "setLayoutMargins:");
  }
  v18 = [(PopoverCatalogViewController *)self universalSearchFirstTimeExperienceViewController];
  if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v18])
  {
    v19 = [v18 view];
    objc_msgSend(v19, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)updateStartPagePreferredContentSize
{
  [(PopoverCatalogViewController *)self requiredContentWidth];
  double v4 = v3;
  [(PopoverCatalogViewController *)self _preferredHeightForStartPage];
  double v6 = v5;
  id v7 = [(PopoverCatalogViewController *)self startPageViewController];
  objc_msgSend(v7, "setPreferredContentSize:", v4, v6);
}

- (void)resetStartPagePreferredHeight
{
  self->_startPagePreferredHeight = 0.0;
}

- (double)_preferredHeightForStartPage
{
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];

  double v4 = [(PopoverCatalogViewController *)self primaryCatalogViewController];
  double v5 = [v4 delegate];
  int v6 = [v5 catalogViewControllerPresentingInPortraitAspectRatio:v4];

  if (v6)
  {
    [v4 navigationBarHeight];
    _SFRoundFloatToPixels();
    double startPagePreferredHeight = v7;
  }
  else
  {
    double startPagePreferredHeight = self->_startPagePreferredHeight;
  }

  return startPagePreferredHeight;
}

- (id)completionsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  double v3 = [WeakRetained completionsViewController];

  return v3;
}

- (void)didGainOwnershipOfCompletionsViewController
{
  id v7 = [(PopoverCatalogViewController *)self completionsViewController];
  [v7 setShowsWebSearchTipIfExists:1];
  v2 = [v7 tableView];
  double v3 = (void *)MEMORY[0x1E4FB1EA0];
  double v4 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultPopoverBackgroundEffect");
  double v5 = [v3 _effectForBlurEffect:v4 vibrancyStyle:120];
  [v2 setSeparatorEffect:v5];

  int v6 = [v2 indexPathsForVisibleRows];
  [v2 reloadRowsAtIndexPaths:v6 withRowAnimation:5];
}

- (void)didGainOwnershipOfStartPageViewController
{
  id v5 = [(PopoverCatalogViewController *)self startPageViewController];
  objc_msgSend(v5, "setAdditionalSafeAreaInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v5 setBackgroundDisplayMode:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  double v4 = [WeakRetained startPageController];
  [v4 setShowingAsPopover:1];
}

- (void)didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController
{
  id v4 = [(PopoverCatalogViewController *)self universalSearchFirstTimeExperienceViewController];
  v2 = [MEMORY[0x1E4FB1618] clearColor];
  double v3 = [v4 view];
  [v3 setBackgroundColor:v2];
}

- (CatalogViewController)primaryCatalogViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  return (CatalogViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end