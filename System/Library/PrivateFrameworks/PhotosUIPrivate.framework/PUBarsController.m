@interface PUBarsController
- (BOOL)_isUpdateBarsDisabled;
- (BOOL)isLocationFromProviderInBarsArea:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (BOOL)updateScheduled;
- (BOOL)wantsNavigationBarVisible;
- (BOOL)wantsToolbarVisible;
- (PUBarsController)init;
- (PUBarsController)initWithViewController:(id)a3 delegate:(id)a4;
- (PUBarsControllerDelegate)delegate;
- (PXUpdater)updater;
- (UIEdgeInsets)contentGuideInsets;
- (UIViewController)viewController;
- (int64_t)preferredBarStyle;
- (int64_t)updateBarsDisabledCount;
- (void)_invalidateGestureRecognizers;
- (void)_reenableUpdateBars;
- (void)_setNeedsUpdate;
- (void)_updateBars;
- (void)_updateGestureRecognizers;
- (void)_updateNowIfNeeded;
- (void)disableUpdateBarsForDuration:(double)a3;
- (void)invalidateBars;
- (void)invalidateContentGuideInsets;
- (void)setContentGuideInsets:(UIEdgeInsets)a3;
- (void)setUpdateBarsDisabledCount:(int64_t)a3;
- (void)setUpdateScheduled:(BOOL)a3;
- (void)updateIfNeeded;
@end

@implementation PUBarsController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setUpdateBarsDisabledCount:(int64_t)a3
{
  self->_updateBarsDisabledCount = a3;
}

- (int64_t)updateBarsDisabledCount
{
  return self->_updateBarsDisabledCount;
}

- (void)setUpdateScheduled:(BOOL)a3
{
  self->_updateScheduled = a3;
}

- (BOOL)updateScheduled
{
  return self->_updateScheduled;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PUBarsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUBarsControllerDelegate *)WeakRetained;
}

- (UIEdgeInsets)contentGuideInsets
{
  double top = self->_contentGuideInsets.top;
  double left = self->_contentGuideInsets.left;
  double bottom = self->_contentGuideInsets.bottom;
  double right = self->_contentGuideInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_reenableUpdateBars
{
  int64_t v3 = [(PUBarsController *)self updateBarsDisabledCount] - 1;
  [(PUBarsController *)self setUpdateBarsDisabledCount:v3];
  if (!v3)
  {
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)disableUpdateBarsForDuration:(double)a3
{
  [(PUBarsController *)self setUpdateBarsDisabledCount:[(PUBarsController *)self updateBarsDisabledCount] + 1];
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PUBarsController_disableUpdateBarsForDuration___block_invoke;
  v6[3] = &unk_1E5F2E530;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__PUBarsController_disableUpdateBarsForDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reenableUpdateBars];
}

- (BOOL)_isUpdateBarsDisabled
{
  return [(PUBarsController *)self updateBarsDisabledCount] > 0;
}

- (void)_updateNowIfNeeded
{
  [(PUBarsController *)self setUpdateScheduled:0];
  id v3 = [(PUBarsController *)self updater];
  [v3 updateIfNeeded];
}

- (void)_setNeedsUpdate
{
  if (![(PUBarsController *)self updateScheduled])
  {
    [(PUBarsController *)self setUpdateScheduled:1];
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __35__PUBarsController__setNeedsUpdate__block_invoke;
    v3[3] = &unk_1E5F2E530;
    objc_copyWeak(&v4, &location);
    dispatch_async(MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __35__PUBarsController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNowIfNeeded];
}

- (void)invalidateContentGuideInsets
{
  id v2 = [(PUBarsController *)self updater];
  [v2 setNeedsUpdateOf:sel_updateContentGuideInsets];
}

- (void)_updateGestureRecognizers
{
  if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
  {
    id v3 = [(PUBarsController *)self delegate];
    id v4 = [v3 barsControllerViewHostingGestureRecognizers:self];
  }
  else
  {
    id v4 = 0;
  }
  [(PUBarsController *)self updateGestureRecognizersWithHostingView:v4];
}

- (void)_invalidateGestureRecognizers
{
  id v2 = [(PUBarsController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateGestureRecognizers];
}

- (void)_updateBars
{
  if (![(PUBarsController *)self _isUpdateBarsDisabled])
  {
    [(PUBarsController *)self updateBars];
  }
}

- (void)invalidateBars
{
  id v2 = [(PUBarsController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateBars];
}

- (BOOL)isLocationFromProviderInBarsArea:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(PUBarsController *)self viewController];
  if (objc_msgSend(v5, "px_isVisible"))
  {
    [(PUBarsController *)self contentGuideInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = +[PUOneUpSettings sharedInstance];
    [v14 barsAreaVerticalOutset];
    double v16 = v15;

    double v17 = v7 + v16;
    double v18 = v11 + v16;
    v19 = [v5 view];
    [v19 bounds];
    CGFloat v21 = v9 + v20;
    CGFloat v23 = v17 + v22;
    CGFloat v25 = v24 - (v9 + v13);
    CGFloat v27 = v26 - (v17 + v18);
    [v4 locationInView:v19];
    v32.x = v28;
    v32.y = v29;
    v33.origin.x = v21;
    v33.origin.y = v23;
    v33.size.width = v25;
    v33.size.height = v27;
    BOOL v30 = !CGRectContainsPoint(v33, v32);
  }
  else
  {
    LOBYTE(v30) = 0;
  }

  return v30;
}

- (int64_t)preferredBarStyle
{
  return 0;
}

- (BOOL)wantsToolbarVisible
{
  return 1;
}

- (BOOL)wantsNavigationBarVisible
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (void)updateIfNeeded
{
  id v2 = [(PUBarsController *)self updater];
  [v2 updateIfNeeded];
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentGuideInsets.left
    || a3.top != self->_contentGuideInsets.top
    || a3.right != self->_contentGuideInsets.right
    || a3.bottom != self->_contentGuideInsets.bottom)
  {
    self->_contentGuideInsets = a3;
    if (self->_delegateFlags.respondsToContentGuideInsetsDidChange)
    {
      id v7 = [(PUBarsController *)self delegate];
      [v7 barsControllerContentGuideInsetsDidChange:self];
    }
  }
}

- (PUBarsController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBarsController.m", 52, @"%s is not available as initializer", "-[PUBarsController init]");

  abort();
}

- (PUBarsController)initWithViewController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUBarsController;
  double v8 = [(PUBarsController *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v8 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v8->_updater;
    v8->_updater = (PXUpdater *)v9;

    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateGestureRecognizers needsUpdate:1];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel_updateContentGuideInsets needsUpdate:1];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateBars needsUpdate:1];
    objc_storeWeak((id *)&v8->_delegate, v7);
    v8->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    v8->_delegateFlags.respondsToContentGuideInsetsDidChange = objc_opt_respondsToSelector() & 1;
    objc_storeWeak((id *)&v8->_viewController, v6);
  }

  return v8;
}

@end