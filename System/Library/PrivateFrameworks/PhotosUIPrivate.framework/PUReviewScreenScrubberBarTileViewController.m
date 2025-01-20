@interface PUReviewScreenScrubberBarTileViewController
- (PUBrowsingViewModel)browsingViewModel;
- (PUReviewScreenBarsModel)barsModel;
- (PUReviewScreenScrubberBar)_scrubberBar;
- (id)loadView;
- (void)_setScrubberBar:(id)a3;
- (void)_updateViews;
- (void)_updateVisibilityAnimated:(BOOL)a3;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBarsModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUReviewScreenScrubberBarTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scrubberBar, 0);
  objc_storeStrong((id *)&self->_barsModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (void)_setScrubberBar:(id)a3
{
}

- (PUReviewScreenScrubberBar)_scrubberBar
{
  return self->__scrubberBar;
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
  id v7 = [(PUReviewScreenScrubberBarTileViewController *)self browsingViewModel];

  if (v7 == v6 && [v8 chromeVisibilityDidChange]) {
    [(PUReviewScreenScrubberBarTileViewController *)self _updateVisibilityAnimated:1];
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenScrubberBarTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUReviewScreenScrubberBarTileViewController *)self setBarsModel:0];
  [(PUReviewScreenScrubberBarTileViewController *)self setBrowsingViewModel:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PUReviewScreenScrubberBarContext != a5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUReviewScreenScrubberBarTileViewController.m" lineNumber:101 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PUReviewScreenScrubberBarTileViewController *)self _updateViews];
}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUReviewScreenScrubberBarTileViewController *)self browsingViewModel];
  id v6 = v5;
  if (!v5)
  {
    id v8 = [(PUReviewScreenScrubberBarTileViewController *)self _scrubberBar];
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
  id v8 = [(PUReviewScreenScrubberBarTileViewController *)self _scrubberBar];
  if (!v3) {
    goto LABEL_10;
  }
  double v9 = PUChromeAnimationDuration(v6);
LABEL_9:
  v12 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PUReviewScreenScrubberBarTileViewController__updateVisibilityAnimated___block_invoke;
  v13[3] = &unk_1E5F2E0A8;
  id v8 = v8;
  id v14 = v8;
  double v15 = v7;
  [v12 animateWithDuration:6 delay:v13 options:0 animations:v9 completion:0.0];

LABEL_11:
}

uint64_t __73__PUReviewScreenScrubberBarTileViewController__updateVisibilityAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateViews
{
  id v6 = [(PUReviewScreenScrubberBarTileViewController *)self barsModel];
  BOOL v3 = [(PUReviewScreenScrubberBarTileViewController *)self _scrubberBar];
  if ([v6 shouldPlaceScrubberInScrubberBar])
  {
    v4 = [(PUReviewScreenScrubberBarTileViewController *)self barsModel];
    v5 = [v4 accessoryView];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 setScrubber:v5];
    }
  }
}

- (void)setBarsModel:(id)a3
{
  v5 = (PUReviewScreenBarsModel *)a3;
  barsModel = self->_barsModel;
  if (barsModel != v5)
  {
    double v7 = v5;
    [(PUReviewScreenBarsModel *)barsModel unregisterChangeObserver:self context:PUReviewScreenScrubberBarContext];
    objc_storeStrong((id *)&self->_barsModel, a3);
    [(PUReviewScreenBarsModel *)self->_barsModel registerChangeObserver:self context:PUReviewScreenScrubberBarContext];
    [(PUReviewScreenScrubberBarTileViewController *)self _updateViews];
    v5 = v7;
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    double v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    [(PUReviewScreenScrubberBarTileViewController *)self _updateVisibilityAnimated:0];
    v5 = v7;
  }
}

- (id)loadView
{
  BOOL v3 = objc_alloc_init(PUReviewScreenScrubberBar);
  scrubberBar = self->__scrubberBar;
  self->__scrubberBar = v3;

  v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
  [(PUReviewScreenScrubberBar *)self->__scrubberBar setBackgroundColor:v5];

  [(PUReviewScreenScrubberBarTileViewController *)self _updateViews];
  id v6 = self->__scrubberBar;
  return v6;
}

@end