@interface PUReviewScreenTopBarTileViewController
- (PUBrowsingViewModel)browsingViewModel;
- (PUReviewScreenBarsModel)barsModel;
- (PUReviewScreenTopBar)_topBar;
- (id)loadView;
- (void)_handleDoneButtonTapped:(id)a3;
- (void)_handleRetakeButtonTapped:(id)a3;
- (void)_setTopBar:(id)a3;
- (void)_updateBarLayout;
- (void)_updateControls;
- (void)_updateVisibilityAnimated:(BOOL)a3;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBarsModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUReviewScreenTopBarTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__topBar, 0);
  objc_storeStrong((id *)&self->_barsModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (void)_setTopBar:(id)a3
{
}

- (PUReviewScreenTopBar)_topBar
{
  return self->__topBar;
}

- (PUReviewScreenBarsModel)barsModel
{
  return self->_barsModel;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(PUReviewScreenTopBarTileViewController *)self browsingViewModel];

  if (v7 == v6 && [v8 chromeVisibilityDidChange]) {
    [(PUReviewScreenTopBarTileViewController *)self _updateVisibilityAnimated:1];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PUReviewScreenTopBarContext == a5)
  {
    char v5 = a4;
    [(PUReviewScreenTopBarTileViewController *)self _updateControls];
    if ((v5 & 0x20) != 0)
    {
      [(PUReviewScreenTopBarTileViewController *)self _updateBarLayout];
    }
  }
}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PUReviewScreenTopBarTileViewController *)self browsingViewModel];
  id v6 = v5;
  if (!v5)
  {
    id v8 = [(PUReviewScreenTopBarTileViewController *)self _topBar];
    double v7 = 1.0;
    if (v3)
    {
      v10 = +[PUOneUpSettings sharedInstance];
      [v10 chromeDefaultAnimationDuration];
      double v9 = v11;

      goto LABEL_9;
    }
LABEL_10:
    [v8 setAlpha:v7];
    goto LABEL_11;
  }
  if ([v5 isChromeVisible]) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  id v8 = [(PUReviewScreenTopBarTileViewController *)self _topBar];
  if (!v3) {
    goto LABEL_10;
  }
  double v9 = PUChromeAnimationDuration(v6);
LABEL_9:
  v12 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PUReviewScreenTopBarTileViewController__updateVisibilityAnimated___block_invoke;
  v13[3] = &unk_1E5F2E0A8;
  id v8 = v8;
  id v14 = v8;
  double v15 = v7;
  [v12 animateWithDuration:6 delay:v13 options:0 animations:v9 completion:0.0];

LABEL_11:
}

uint64_t __68__PUReviewScreenTopBarTileViewController__updateVisibilityAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateBarLayout
{
  id v7 = [(PUReviewScreenTopBarTileViewController *)self barsModel];
  BOOL v3 = [(PUReviewScreenTopBarTileViewController *)self _topBar];
  int v4 = [v7 useVerticalControlLayout];
  if (v4)
  {
    [v7 controlCenterAlignmentPoint];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  objc_msgSend(v3, "setDoneButtonCenterAlignmentPoint:", v5, v6);
  if ((v4 & [v7 lastControlAlignmentChangeForcedLayout]) == 1) {
    [v3 layoutIfNeeded];
  }
}

- (void)_updateControls
{
  id v6 = [(PUReviewScreenTopBarTileViewController *)self _topBar];
  BOOL v3 = [(PUReviewScreenTopBarTileViewController *)self barsModel];
  int v4 = [v3 availableControls];
  [v6 setAvailableButtons:v4];

  double v5 = [v3 enabledControls];
  [v6 setEnabledButtons:v5];

  objc_msgSend(v6, "setBackgroundStyle:", objc_msgSend(v3, "useVerticalControlLayout") ^ 1);
}

- (void)setBarsModel:(id)a3
{
  double v5 = (PUReviewScreenBarsModel *)a3;
  barsModel = self->_barsModel;
  if (barsModel != v5)
  {
    id v7 = v5;
    [(PUReviewScreenBarsModel *)barsModel unregisterChangeObserver:self context:PUReviewScreenTopBarContext];
    objc_storeStrong((id *)&self->_barsModel, a3);
    [(PUReviewScreenBarsModel *)self->_barsModel registerChangeObserver:self context:PUReviewScreenTopBarContext];
    [(PUReviewScreenTopBarTileViewController *)self _updateControls];
    [(PUReviewScreenTopBarTileViewController *)self _updateBarLayout];
    double v5 = v7;
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  double v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    id v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    [(PUReviewScreenTopBarTileViewController *)self _updateVisibilityAnimated:0];
    double v5 = v7;
  }
}

- (void)_handleRetakeButtonTapped:(id)a3
{
  id v3 = [(PUReviewScreenTopBarTileViewController *)self barsModel];
  [v3 invokeCallbackForBarButtonItemWithIdentifier:24];
}

- (void)_handleDoneButtonTapped:(id)a3
{
  id v3 = [(PUReviewScreenTopBarTileViewController *)self barsModel];
  [v3 invokeCallbackForBarButtonItemWithIdentifier:22];
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenTopBarTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUReviewScreenTopBarTileViewController *)self setBrowsingViewModel:0];
  [(PUReviewScreenTopBarTileViewController *)self setBarsModel:0];
}

- (id)loadView
{
  objc_super v3 = objc_alloc_init(PUReviewScreenTopBar);
  topBar = self->__topBar;
  self->__topBar = v3;

  double v5 = [(PUReviewScreenTopBar *)self->__topBar doneButton];
  [v5 addTarget:self action:sel__handleDoneButtonTapped_ forControlEvents:64];

  id v6 = [(PUReviewScreenTopBar *)self->__topBar retakeButton];
  [v6 addTarget:self action:sel__handleRetakeButtonTapped_ forControlEvents:64];

  [(PUReviewScreenTopBarTileViewController *)self _updateControls];
  id v7 = self->__topBar;
  return v7;
}

@end