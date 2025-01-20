@interface PXPhotosViewOptionsToolbarController
- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3;
- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3;
- (BOOL)shouldHideAccessoryViewsOnScroll;
- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3;
- (PXPhotosLensControl)photosLensControl;
- (PXPhotosViewOptionsModel)model;
- (PXPhotosViewOptionsToolbarController)initWithModel:(id)a3 containerView:(id)a4;
- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3;
- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3;
- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3;
- (void)_updateAccessoryViews;
- (void)_updateLensControl;
- (void)backdropGroupNameDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosLensControl:(id)a3 didSelectItem:(id)a4;
- (void)photosLensControl:(id)a3 didTapOnAlreadySelectedItem:(id)a4;
- (void)scrollViewControllerDidEndScrolling:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)setPhotosLensControl:(id)a3;
- (void)setShouldHideAccessoryViewsOnScroll:(BOOL)a3;
@end

@implementation PXPhotosViewOptionsToolbarController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLensControl, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_userScrollVelocityFilter, 0);
}

- (void)setPhotosLensControl:(id)a3
{
}

- (PXPhotosLensControl)photosLensControl
{
  return self->_photosLensControl;
}

- (void)setShouldHideAccessoryViewsOnScroll:(BOOL)a3
{
  self->_shouldHideAccessoryViewsOnScroll = a3;
}

- (BOOL)shouldHideAccessoryViewsOnScroll
{
  return self->_shouldHideAccessoryViewsOnScroll;
}

- (PXPhotosViewOptionsModel)model
{
  return self->_model;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXPhotosViewOptionsModelObserverContext == a5)
  {
    id v18 = v8;
    if ((v6 & 8) != 0)
    {
      v9 = [(PXPhotosViewOptionsToolbarController *)self model];
      v10 = [v9 lensControlItems];
      v11 = [(PXPhotosViewOptionsToolbarController *)self photosLensControl];
      [v11 setItems:v10];

      v12 = [(PXPhotosViewOptionsToolbarController *)self model];
      v13 = [v12 lensControlItems];
      v14 = [(PXPhotosViewOptionsToolbarController *)self photosLensControl];
      [v14 setEnabledItems:v13];

      id v8 = v18;
    }
    if ((v6 & 4) != 0)
    {
      v15 = [(PXPhotosViewOptionsToolbarController *)self model];
      v16 = [v15 selectedLensControlItem];
      v17 = [(PXPhotosViewOptionsToolbarController *)self photosLensControl];
      [v17 setSelectedItem:v16];

      id v8 = v18;
    }
  }
}

- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3
{
  return 0.0;
}

- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3
{
  return 1;
}

- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3
{
  v3 = [(PXSecondaryToolbarController *)self contentView];
  objc_msgSend(v3, "sizeThatFits:", 320.0, 200.0);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3
{
  return 0;
}

- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3
{
  return 2;
}

- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3
{
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  userScrollVelocityFilter = self->_userScrollVelocityFilter;
  self->_userScrollVelocityFilter = 0;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4 = a3;
  self->_isScrolledAtBottom = [v4 isScrolledAtEdge:3 tolerance:100.0];
  userScrollVelocityFilter = self->_userScrollVelocityFilter;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PXPhotosViewOptionsToolbarController_scrollViewControllerDidScroll___block_invoke;
  v7[3] = &unk_1E5DB7220;
  id v8 = v4;
  id v6 = v4;
  [(PXNumberFilter *)userScrollVelocityFilter performChanges:v7];
  [(PXPhotosViewOptionsToolbarController *)self _updateAccessoryViews];
}

void __70__PXPhotosViewOptionsToolbarController_scrollViewControllerDidScroll___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 visibleRect];
  [v3 setInput:CGRectGetMidY(v5)];
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  id v4 = +[PXVelocityNumberFilter gestureVelocityFilter];
  userScrollVelocityFilter = self->_userScrollVelocityFilter;
  self->_userScrollVelocityFilter = v4;
}

- (void)photosLensControl:(id)a3 didTapOnAlreadySelectedItem:(id)a4
{
  id v5 = [(PXSecondaryToolbarController *)self actionHandler];
  [v5 secondaryToolbarController:self scrollToBottomAnimated:1];
}

- (void)photosLensControl:(id)a3 didSelectItem:(id)a4
{
  id v5 = a4;
  id v6 = +[PXLemonadeSettings sharedInstance];
  uint64_t v7 = [v6 yearsAndMonthsMode];

  if (v7)
  {
    id v8 = [(PXPhotosViewOptionsToolbarController *)self model];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__PXPhotosViewOptionsToolbarController_photosLensControl_didSelectItem___block_invoke;
    v16[3] = &unk_1E5DCFF98;
    id v17 = v5;
    [v8 performChanges:v16];
  }
  else
  {
    double v9 = [v5 identifier];
    v10 = v9;
    if (v9 == @"years"
      || (char v11 = [(__CFString *)v9 isEqual:@"years"], v10, (v11 & 1) != 0)
      || ([v5 identifier],
          v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
          v12 == @"months"))
    {
    }
    else
    {
      v13 = v12;
      char v14 = [(__CFString *)v12 isEqual:@"months"];

      if ((v14 & 1) == 0) {
        goto LABEL_10;
      }
    }
    id v15 = +[PXAlert show:&__block_literal_global_78167];
  }
LABEL_10:
}

uint64_t __72__PXPhotosViewOptionsToolbarController_photosLensControl_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedLensControlItem:*(void *)(a1 + 32)];
}

uint64_t __72__PXPhotosViewOptionsToolbarController_photosLensControl_didSelectItem___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notImplementedWithTrackingRadar:116589942];
}

- (void)_updateAccessoryViews
{
  id v3 = +[PXKitSettings sharedInstance];
  [(PXNumberFilter *)self->_userScrollVelocityFilter output];
  double v5 = v4;
  double v6 = -v4;
  if (v5 >= 0.0) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  [v3 smallestSignificantScrollVelocity];
  if (v7 > v8 || self->_isScrolledAtBottom)
  {
    BOOL v9 = v5 < 0.0
      && !self->_isScrolledAtBottom
      && [(PXPhotosViewOptionsToolbarController *)self shouldHideAccessoryViewsOnScroll];
    v10 = [(PXSecondaryToolbarController *)self leadingAccessoryView];
    [v10 alpha];
    BOOL v12 = v11 >= 0.001;

    if (((v9 ^ v12) & 1) == 0)
    {
      if (v9) {
        double v13 = 0.0;
      }
      else {
        double v13 = 1.0;
      }
      char v14 = [(PXSecondaryToolbarController *)self leadingAccessoryView];
      id v15 = [(PXSecondaryToolbarController *)self trailingAccessoryView];
      v16 = (void *)MEMORY[0x1E4FB1EB0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke;
      v23[3] = &unk_1E5DD0D90;
      id v24 = v14;
      double v26 = v13;
      id v25 = v15;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke_2;
      v19[3] = &unk_1E5DB7070;
      BOOL v22 = v9;
      id v20 = v24;
      id v21 = v25;
      id v17 = v25;
      id v18 = v24;
      [v16 animateWithDuration:v23 animations:v19 completion:0.2];
    }
  }
}

uint64_t __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  double v2 = *(double *)(a1 + 48);
  id v3 = *(void **)(a1 + 40);
  return [v3 setAlpha:v2];
}

uint64_t __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:*(unsigned char *)(a1 + 48) == 0];
  BOOL v2 = *(unsigned char *)(a1 + 48) == 0;
  id v3 = *(void **)(a1 + 40);
  return [v3 setUserInteractionEnabled:v2];
}

- (void)_updateLensControl
{
  id v8 = [(PXPhotosViewOptionsToolbarController *)self model];
  id v3 = [(PXPhotosViewOptionsToolbarController *)self photosLensControl];
  double v4 = [(PXSecondaryToolbarController *)self backdropGroupName];
  [v3 setBackdropGroupName:v4];

  double v5 = [v8 lensControlItems];
  [v3 setItems:v5];

  double v6 = [v8 lensControlItems];
  [v3 setEnabledItems:v6];

  double v7 = [v8 selectedLensControlItem];
  [v3 setSelectedItem:v7];
}

- (void)backdropGroupNameDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosViewOptionsToolbarController;
  [(PXSecondaryToolbarController *)&v3 backdropGroupNameDidChange];
  [(PXPhotosViewOptionsToolbarController *)self _updateLensControl];
}

- (PXPhotosViewOptionsToolbarController)initWithModel:(id)a3 containerView:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPhotosViewOptionsToolbarController.m", 38, @"Invalid parameter not satisfying: %@", @"model" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PXPhotosViewOptionsToolbarController.m", 39, @"Invalid parameter not satisfying: %@", @"containerView" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PXPhotosViewOptionsToolbarController;
  double v11 = [(PXSecondaryToolbarController *)&v19 initWithContainerView:v10 styleGuideProvider:self];
  BOOL v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model, a3);
    [(PXPhotosViewOptionsModel *)v12->_model registerChangeObserver:v12 context:&PXPhotosViewOptionsModelObserverContext];
    double v13 = objc_alloc_init(PXPhotosLensControl);
    photosLensControl = v12->_photosLensControl;
    v12->_photosLensControl = v13;

    id v15 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
    [(PXPhotosLensControl *)v12->_photosLensControl setContentBackgroundColor:v15];

    [(PXPhotosLensControl *)v12->_photosLensControl setDelegate:v12];
    v12->_shouldHideAccessoryViewsOnScroll = 1;
    [(PXPhotosViewOptionsToolbarController *)v12 _updateLensControl];
    [(PXSecondaryToolbarController *)v12 setContentView:v12->_photosLensControl];
  }

  return v12;
}

@end