@interface PUReviewScreenControlBarTileViewController
- (PUBrowsingViewModel)browsingViewModel;
- (PUReviewScreenBarsModel)barsModel;
- (PUReviewScreenControlBar)_controlBar;
- (id)_barControlsForModelControls:(id)a3 transitioning:(BOOL)a4;
- (id)loadView;
- (void)_handleEditButtonTapped:(id)a3;
- (void)_handleFunEffectsButtonTapped:(id)a3;
- (void)_handleMarkupButtonTapped:(id)a3;
- (void)_handleSendButtonTapped:(id)a3;
- (void)_setControlBar:(id)a3;
- (void)_updateBarLayout;
- (void)_updateControls;
- (void)_updateVisibilityAnimated:(BOOL)a3;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBarsModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUReviewScreenControlBarTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__controlBar, 0);
  objc_storeStrong((id *)&self->_barsModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (void)_setControlBar:(id)a3
{
}

- (PUReviewScreenControlBar)_controlBar
{
  return self->__controlBar;
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
  id v7 = [(PUReviewScreenControlBarTileViewController *)self browsingViewModel];

  if (v7 == v6 && [v8 chromeVisibilityDidChange]) {
    [(PUReviewScreenControlBarTileViewController *)self _updateVisibilityAnimated:1];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PUReviewScreenControlBarContext == a5)
  {
    char v5 = a4;
    [(PUReviewScreenControlBarTileViewController *)self _updateControls];
    if ((v5 & 0x20) != 0)
    {
      [(PUReviewScreenControlBarTileViewController *)self _updateBarLayout];
    }
  }
}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PUReviewScreenControlBarTileViewController *)self browsingViewModel];
  id v6 = v5;
  if (!v5)
  {
    id v8 = [(PUReviewScreenControlBarTileViewController *)self _controlBar];
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
  id v8 = [(PUReviewScreenControlBarTileViewController *)self _controlBar];
  if (!v3) {
    goto LABEL_10;
  }
  double v9 = PUChromeAnimationDuration(v6);
LABEL_9:
  v12 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PUReviewScreenControlBarTileViewController__updateVisibilityAnimated___block_invoke;
  v13[3] = &unk_1E5F2E0A8;
  id v8 = v8;
  id v14 = v8;
  double v15 = v7;
  [v12 animateWithDuration:6 delay:v13 options:0 animations:v9 completion:0.0];

LABEL_11:
}

uint64_t __72__PUReviewScreenControlBarTileViewController__updateVisibilityAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateBarLayout
{
  id v4 = [(PUReviewScreenControlBarTileViewController *)self barsModel];
  BOOL v3 = [(PUReviewScreenControlBarTileViewController *)self _controlBar];
  [v4 controlCenterAlignmentPoint];
  objc_msgSend(v3, "setLayoutCenterAlignmentPoint:");
  if ([v4 lastControlAlignmentChangeForcedLayout]) {
    [v3 layoutIfNeeded];
  }
}

- (void)_updateControls
{
  id v9 = [(PUReviewScreenControlBarTileViewController *)self barsModel];
  BOOL v3 = [(PUReviewScreenControlBarTileViewController *)self _controlBar];
  id v4 = [v9 availableControls];
  char v5 = -[PUReviewScreenControlBarTileViewController _barControlsForModelControls:transitioning:](self, "_barControlsForModelControls:transitioning:", v4, [v9 isTransitioningWithCamera]);
  [v3 setAvailableButtons:v5];

  id v6 = [v9 enabledControls];
  [v3 setEnabledButtons:v6];

  if ([v9 shouldPlaceScrubberInScrubberBar])
  {
    [v3 setAccessoryView:0];
  }
  else
  {
    double v7 = [v9 accessoryView];
    [v3 setAccessoryView:v7];
  }
  uint64_t v8 = [v9 useVerticalControlLayout];
  [v3 setUseTransparentBackground:v8];
  [v3 setShouldLayoutVertically:v8];
}

- (id)_barControlsForModelControls:(id)a3 transitioning:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4 && ([v5 containsObject:&unk_1F078CD10] & 1) != 0)
  {
    id v7 = (id)[v6 mutableCopy];
    [v7 removeObject:&unk_1F078CD10];
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (void)setBarsModel:(id)a3
{
  id v5 = (PUReviewScreenBarsModel *)a3;
  barsModel = self->_barsModel;
  if (barsModel != v5)
  {
    id v7 = v5;
    [(PUReviewScreenBarsModel *)barsModel unregisterChangeObserver:self context:PUReviewScreenControlBarContext];
    objc_storeStrong((id *)&self->_barsModel, a3);
    [(PUReviewScreenBarsModel *)self->_barsModel registerChangeObserver:self context:PUReviewScreenControlBarContext];
    [(PUReviewScreenControlBarTileViewController *)self _updateControls];
    [(PUReviewScreenControlBarTileViewController *)self _updateBarLayout];
    id v5 = v7;
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  id v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    id v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    [(PUReviewScreenControlBarTileViewController *)self _updateVisibilityAnimated:0];
    id v5 = v7;
  }
}

- (void)_handleSendButtonTapped:(id)a3
{
  id v3 = [(PUReviewScreenControlBarTileViewController *)self barsModel];
  [v3 invokeCallbackForBarButtonItemWithIdentifier:27];
}

- (void)_handleFunEffectsButtonTapped:(id)a3
{
  id v3 = [(PUReviewScreenControlBarTileViewController *)self barsModel];
  [v3 invokeCallbackForBarButtonItemWithIdentifier:26];
}

- (void)_handleMarkupButtonTapped:(id)a3
{
  id v3 = [(PUReviewScreenControlBarTileViewController *)self barsModel];
  [v3 invokeCallbackForBarButtonItemWithIdentifier:23];
}

- (void)_handleEditButtonTapped:(id)a3
{
  id v3 = [(PUReviewScreenControlBarTileViewController *)self barsModel];
  [v3 invokeCallbackForBarButtonItemWithIdentifier:25];
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenControlBarTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUReviewScreenControlBarTileViewController *)self setBrowsingViewModel:0];
  [(PUReviewScreenControlBarTileViewController *)self setBarsModel:0];
}

- (id)loadView
{
  objc_super v3 = objc_alloc_init(PUReviewScreenControlBar);
  controlBar = self->__controlBar;
  self->__controlBar = v3;

  id v5 = [(PUReviewScreenControlBar *)self->__controlBar sendButton];
  [v5 addTarget:self action:sel__handleSendButtonTapped_ forControlEvents:64];

  id v6 = [(PUReviewScreenControlBar *)self->__controlBar editButton];
  [v6 addTarget:self action:sel__handleEditButtonTapped_ forControlEvents:64];

  id v7 = [(PUReviewScreenControlBar *)self->__controlBar markupButton];
  [v7 addTarget:self action:sel__handleMarkupButtonTapped_ forControlEvents:64];

  uint64_t v8 = [(PUReviewScreenControlBar *)self->__controlBar funEffectsButton];
  [v8 addTarget:self action:sel__handleFunEffectsButtonTapped_ forControlEvents:64];

  [(PUReviewScreenControlBarTileViewController *)self _updateControls];
  id v9 = self->__controlBar;
  return v9;
}

@end