@interface PXCuratedLibraryFooterController
+ (int64_t)_modeForZoomLevel:(int64_t)a3;
- (BOOL)_shouldRevealPhotosFooterView;
- (BOOL)_shouldShowFooterForGridViewState;
- (BOOL)_shouldShowFooterForPresentedZoomLevel;
- (BOOL)footerNeedsReveal;
- (BOOL)hasAppeared;
- (BOOL)hasAppearedOnce;
- (BOOL)isFooterFullyMasked;
- (BOOL)isFooterVisible;
- (BOOL)isGridViewVisible;
- (BOOL)isPullingFooter;
- (BOOL)wantsFooter;
- (BOOL)wantsFooterMask;
- (PXAssetsDataSourceCountsController)itemCountsController;
- (PXCuratedLibraryFooterController)init;
- (PXCuratedLibraryFooterController)initWithGridView:(id)a3 layout:(id)a4 viewModel:(id)a5 itemsCountsController:(id)a6;
- (PXCuratedLibraryFooterControllerDelegate)delegate;
- (PXCuratedLibraryFooterViewModel)footerViewModelIfLoaded;
- (PXCuratedLibraryLayout)layout;
- (PXCuratedLibraryStyleGuide)styleGuide;
- (PXCuratedLibraryViewModel)viewModel;
- (PXGView)gridView;
- (PXPhotosGlobalFooterView)footerView;
- (PXUpdater)updater;
- (UIView)footerMaskView;
- (double)footerMaskVerticalOffset;
- (double)footerVisibleAmountIncludingSafeAreaInsets:(BOOL)a3;
- (id)footerViewModel;
- (id)presentingViewControllerForFooterViewModel:(id)a3;
- (void)_conditionallyRevealPhotosFooterView;
- (void)_conditionallyRevealPhotosFooterViewWithLastUserScrollTime:(double)a3;
- (void)_footerHasImportantInformationDidChange;
- (void)_invalidateFooter;
- (void)_invalidateFooterAlpha;
- (void)_invalidateFooterAndMaskVisibility;
- (void)_invalidateFooterMaskViewFrame;
- (void)_invalidateFooterMode;
- (void)_invalidateIsFooterVisible;
- (void)_invalidateWantsFooter;
- (void)_resetFooterViewModel;
- (void)_setNeedsUpdate;
- (void)_updateFooter;
- (void)_updateFooterAlpha;
- (void)_updateFooterAndMaskVisibility;
- (void)_updateFooterMaskViewFrame;
- (void)_updateFooterMode;
- (void)_updateIsFooterVisible;
- (void)_updateWantsFooter;
- (void)_viewDidStartScrolling;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4;
- (void)photosGlobalFooterViewDidChangeHeight:(id)a3;
- (void)scrollViewControllerContentBoundsDidChange:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterFullyMasked:(BOOL)a3;
- (void)setFooterMaskVerticalOffset:(double)a3;
- (void)setFooterMaskView:(id)a3;
- (void)setFooterNeedsReveal:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterViewModelIfLoaded:(id)a3;
- (void)setHasAppearedOnce:(BOOL)a3;
- (void)setIsFooterVisible:(BOOL)a3;
- (void)setWantsFooter:(BOOL)a3;
- (void)setWantsFooterMask:(BOOL)a3;
- (void)viewDidAppear;
@end

@implementation PXCuratedLibraryFooterController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerMaskView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_footerViewModelIfLoaded, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_itemCountsController, 0);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reusableFooterView, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_footerAutoScrollMinimumIdleTimer, 0);
}

- (BOOL)isFooterFullyMasked
{
  return self->_footerFullyMasked;
}

- (void)setFooterMaskView:(id)a3
{
}

- (UIView)footerMaskView
{
  return self->_footerMaskView;
}

- (PXPhotosGlobalFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterViewModelIfLoaded:(id)a3
{
}

- (BOOL)footerNeedsReveal
{
  return self->_footerNeedsReveal;
}

- (BOOL)hasAppearedOnce
{
  return self->_hasAppearedOnce;
}

- (BOOL)isFooterVisible
{
  return self->_isFooterVisible;
}

- (BOOL)wantsFooter
{
  return self->_wantsFooter;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXAssetsDataSourceCountsController)itemCountsController
{
  return self->_itemCountsController;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXCuratedLibraryLayout)layout
{
  return self->_layout;
}

- (PXGView)gridView
{
  return self->_gridView;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (double)footerMaskVerticalOffset
{
  return self->_footerMaskVerticalOffset;
}

- (BOOL)wantsFooterMask
{
  return self->_wantsFooterMask;
}

- (void)setDelegate:(id)a3
{
}

- (PXCuratedLibraryFooterControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCuratedLibraryFooterControllerDelegate *)WeakRetained;
}

- (id)presentingViewControllerForFooterViewModel:(id)a3
{
  v4 = [(PXCuratedLibraryFooterController *)self delegate];
  v5 = [v4 presentingViewControllerForFooterController:self];

  return v5;
}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  if (!self->_isUpdatingFooter)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __74__PXCuratedLibraryFooterController_photosGlobalFooterViewDidChangeHeight___block_invoke;
    v3[3] = &unk_1E5DC0320;
    v3[4] = self;
    [(PXCuratedLibraryFooterController *)self performChanges:v3];
  }
}

uint64_t __74__PXCuratedLibraryFooterController_photosGlobalFooterViewDidChangeHeight___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFooter];
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v7 = a4;
  v5 = [(PXCuratedLibraryFooterController *)self delegate];
  v6 = [v5 presentingViewControllerForFooterController:self];

  if (v7) {
    [v6 presentViewController:v7 animated:1 completion:0];
  }
  else {
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__PXCuratedLibraryFooterController_scrollViewControllerContentBoundsDidChange___block_invoke;
  v3[3] = &unk_1E5DC0320;
  v3[4] = self;
  [(PXCuratedLibraryFooterController *)self performChanges:v3];
}

uint64_t __79__PXCuratedLibraryFooterController_scrollViewControllerContentBoundsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFooter];
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PXCuratedLibraryFooterController_scrollViewControllerDidScroll___block_invoke;
  v3[3] = &unk_1E5DC0320;
  v3[4] = self;
  [(PXCuratedLibraryFooterController *)self performChanges:v3];
}

uint64_t __66__PXCuratedLibraryFooterController_scrollViewControllerDidScroll___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateWantsFooter];
  [*(id *)(a1 + 32) _invalidateIsFooterVisible];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateFooterMaskViewFrame];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)CuratedLibraryViewModelObserverContext_159683 == a5)
  {
    if ((([(PXCuratedLibraryViewModel *)self->_viewModel hideStatusFooterInSelectMode] | 0x44) & a4) != 0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke;
      v12[3] = &unk_1E5DC0348;
      v12[4] = self;
      v12[5] = a4;
      [(PXCuratedLibraryFooterController *)self performChanges:v12];
    }
    if ((a4 & 0x10000000) != 0) {
      [(PXCuratedLibraryFooterController *)self _resetFooterViewModel];
    }
  }
  else if ((void *)operator|| == a5)
  {
    if ((a4 & 0x4001) != 0)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke_2;
      v11[3] = &unk_1E5DC0320;
      v11[4] = self;
      [(PXCuratedLibraryFooterController *)self performChanges:v11];
    }
  }
  else
  {
    if ((void *)CuratedLibraryFooterViewModelObserverContext != a5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryFooterController.m" lineNumber:665 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((a4 & 0x40000) != 0) {
      [(PXCuratedLibraryFooterController *)self _footerHasImportantInformationDidChange];
    }
  }
}

uint64_t __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 40) & 4) != 0) {
    [*(id *)(a1 + 32) _invalidateFooterMode];
  }
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateWantsFooter];
}

uint64_t __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateWantsFooter];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateFooterAlpha];
}

- (void)_updateFooterAndMaskVisibility
{
  BOOL v3 = [(PXCuratedLibraryFooterController *)self isFooterFullyMasked];
  v4 = [(PXCuratedLibraryFooterController *)self footerMaskView];
  [v4 setHidden:v3];

  id v5 = [(PXCuratedLibraryFooterController *)self footerView];
  [v5 setHidden:v3];
}

- (void)_invalidateFooterAndMaskVisibility
{
  id v2 = [(PXCuratedLibraryFooterController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooterAndMaskVisibility];
}

- (void)_updateFooterMaskViewFrame
{
  id v36 = [(PXCuratedLibraryFooterController *)self footerMaskView];
  if (v36)
  {
    BOOL v3 = [(PXCuratedLibraryFooterController *)self gridView];
    v4 = [v3 scrollViewController];

    [v4 visibleRect];
    double v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;
    v13 = [(PXCuratedLibraryFooterController *)self styleGuide];
    [v13 secondaryToolbarPadding];
    double v15 = v14;
    double v17 = v16;

    double v18 = v10 - (v15 + v17);
    double v19 = v6 + v15;
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v10;
    v38.size.height = v12;
    double MaxY = CGRectGetMaxY(v38);
    [v4 contentInset];
    double v22 = MaxY - v21;
    [(PXCuratedLibraryFooterController *)self footerMaskVerticalOffset];
    double v24 = v23 + v22;
    v39.origin.x = v6;
    v39.origin.y = v8;
    v39.size.width = v10;
    v39.size.height = v12;
    double v25 = CGRectGetMaxY(v39);
    v40.origin.x = v19;
    v40.origin.y = v24;
    v40.size.width = v18;
    v40.size.height = v12;
    double v26 = v25 - CGRectGetMinY(v40);
    [v4 contentBounds];
    double v27 = CGRectGetMaxY(v41);
    v28 = [(PXCuratedLibraryFooterController *)self layout];
    [v28 padding];
    double v30 = v27 - v29;

    if (v24 >= v30) {
      double v31 = v24;
    }
    else {
      double v31 = v30;
    }
    double v32 = v31 + 1.0;
    objc_msgSend(v36, "setFrame:", v19, v31 + 1.0, v18, v26);
    v33 = [(PXCuratedLibraryFooterController *)self footerView];
    [v33 frame];
    double v35 = v34;

    -[PXCuratedLibraryFooterController setFooterFullyMasked:](self, "setFooterFullyMasked:", v35 + 1.0 >= v32, v35 + 1.0);
  }
  else
  {
    [(PXCuratedLibraryFooterController *)self setFooterFullyMasked:0];
  }
}

- (void)_invalidateFooterMaskViewFrame
{
  id v2 = [(PXCuratedLibraryFooterController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooterMaskViewFrame];
}

- (void)_updateFooterAlpha
{
  if (self->_needsFooterFrameChangeAnimation)
  {
    BOOL v3 = [(PXCuratedLibraryFooterController *)self footerView];
    [v3 setAlpha:0.0];

    self->_needsFooterFrameChangeAnimation = 0;
    double v4 = 1.0;
    double v5 = 0.4;
  }
  else
  {
    double v6 = [(PXCuratedLibraryFooterController *)self viewModel];
    double v7 = [v6 zoomablePhotosViewModel];
    int v8 = [v7 shouldHideSurroundingContent];

    if (v8) {
      double v4 = 0.0;
    }
    else {
      double v4 = 1.0;
    }
    double v5 = 0.2;
  }
  double v9 = [(PXCuratedLibraryFooterController *)self footerView];
  [v9 alpha];
  double v11 = v10;

  if (v11 != v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PXCuratedLibraryFooterController__updateFooterAlpha__block_invoke;
    v12[3] = &unk_1E5DD08D8;
    v12[4] = self;
    *(double *)&v12[5] = v4;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:v5];
  }
}

void __54__PXCuratedLibraryFooterController__updateFooterAlpha__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) footerView];
  [v2 setAlpha:v1];
}

- (void)_invalidateFooterAlpha
{
  id v2 = [(PXCuratedLibraryFooterController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooterAlpha];
}

- (void)_updateIsFooterVisible
{
  [(PXCuratedLibraryFooterController *)self footerVisibleAmountIncludingSafeAreaInsets:1];
  [(PXCuratedLibraryFooterController *)self setIsFooterVisible:v3 > 0.0];
}

- (void)_invalidateIsFooterVisible
{
  id v2 = [(PXCuratedLibraryFooterController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsFooterVisible];
}

- (void)_updateFooter
{
  BOOL isUpdatingFooter = self->_isUpdatingFooter;
  self->_BOOL isUpdatingFooter = 1;
  double v4 = [(PXCuratedLibraryFooterController *)self layout];
  [v4 padding];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PXCuratedLibraryFooterController *)self gridView];
  CGFloat v12 = [v11 scrollViewController];

  v13 = [(PXCuratedLibraryFooterController *)self footerView];
  BOOL v14 = [(PXCuratedLibraryFooterController *)self wantsFooter];
  if (v14)
  {
    if (!v13)
    {
      reusableFooterView = self->_reusableFooterView;
      if (reusableFooterView)
      {
        [(PXPhotosGlobalFooterView *)reusableFooterView setHidden:0];
        v13 = self->_reusableFooterView;
        double v16 = self->_reusableFooterView;
        self->_reusableFooterView = 0;
      }
      else
      {
        v13 = objc_alloc_init(PXPhotosGlobalFooterView);
        [(PXPhotosGlobalFooterView *)v13 setDelegate:self];
        [v12 addSubview:v13];
      }
    }
    double v19 = [(PXCuratedLibraryFooterController *)self footerViewModel];
    [(PXPhotosGlobalFooterView *)v13 setViewModel:v19];

    [v4 presentedPadding];
    [v12 scrollViewContentSize];
    -[PXPhotosGlobalFooterView sizeThatFits:](v13, "sizeThatFits:");
    if (v20 > 0.0) {
      [v4 bottomMargin];
    }
    [v12 visibleRect];
    [v12 contentInset];
    [v12 contentInset];
    [v4 padding];
    PXEdgeInsetsEqualToEdgeInsets();
  }
  if (v13)
  {
    double v17 = self->_reusableFooterView;
    self->_reusableFooterView = v13;
    double v18 = v13;

    [(PXPhotosGlobalFooterView *)self->_reusableFooterView setHidden:1];
  }
  objc_msgSend(v4, "setPadding:", v6, v8, 0.0, v10);
  [(PXCuratedLibraryFooterController *)self setFooterView:0];
  id v21 = [(PXCuratedLibraryFooterController *)self footerMaskView];
  BOOL v22 = [(PXCuratedLibraryFooterController *)self wantsFooterMask];
  if (v14 && v22)
  {
    if (!v21)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v23 = +[PXCuratedLibrarySettings sharedInstance];
      if ([v23 exaggerateContrast])
      {
        double v24 = [MEMORY[0x1E4FB1618] redColor];
        double v25 = [v24 colorWithAlphaComponent:0.5];
        [v21 setBackgroundColor:v25];
      }
      else
      {
        double v24 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        [v21 setBackgroundColor:v24];
      }

      [v21 setUserInteractionEnabled:0];
      [v12 addSubview:v21];
    }
    [(PXCuratedLibraryFooterController *)self setFooterMaskView:v21];
    [(PXCuratedLibraryFooterController *)self _updateFooterMaskViewFrame];
  }
  else
  {
    [v21 removeFromSuperview];

    [(PXCuratedLibraryFooterController *)self setFooterMaskView:0];
  }
  double v26 = [(PXCuratedLibraryFooterController *)self viewModel];
  self->_presentedZoomLevel = [v26 zoomLevel];

  self->_BOOL isUpdatingFooter = isUpdatingFooter;
}

uint64_t __49__PXCuratedLibraryFooterController__updateFooter__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFooterAlpha];
}

- (void)_invalidateFooter
{
  id v2 = [(PXCuratedLibraryFooterController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooter];
}

- (void)_resetFooterViewModel
{
  footerViewModel = self->_footerViewModel;
  if (footerViewModel)
  {
    [(PXCuratedLibraryFooterViewModel *)footerViewModel unregisterChangeObserver:self context:CuratedLibraryFooterViewModelObserverContext];
    double v4 = self->_footerViewModel;
    self->_footerViewModel = 0;

    [(PXCuratedLibraryFooterController *)self _updateFooter];
  }
}

- (void)_updateFooterMode
{
  double v3 = [(PXCuratedLibraryFooterController *)self footerViewModelIfLoaded];
  if (v3)
  {
    id v8 = v3;
    uint64_t v4 = [v3 mode];
    double v5 = [(PXCuratedLibraryFooterController *)self viewModel];
    uint64_t v6 = [v5 zoomLevel];

    uint64_t v7 = [(id)objc_opt_class() _modeForZoomLevel:v6];
    double v3 = v8;
    if (v4 != v7)
    {
      objc_msgSend(v8, "setMode:");
      [(PXCuratedLibraryFooterController *)self _invalidateFooter];
      double v3 = v8;
    }
  }
}

- (void)_invalidateFooterMode
{
  id v2 = [(PXCuratedLibraryFooterController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooterMode];
}

- (void)_updateWantsFooter
{
  if ([(PXCuratedLibraryFooterController *)self hasAppearedOnce])
  {
    double v3 = [(PXCuratedLibraryFooterController *)self viewModel];
    if ([v3 enableFooter]
      && [(PXCuratedLibraryFooterController *)self _shouldShowFooterForPresentedZoomLevel])
    {
      if ([(PXCuratedLibraryFooterController *)self _shouldShowFooterForGridViewState])
      {
        goto LABEL_7;
      }
      if ([(PXCuratedLibraryFooterController *)self wantsFooter])
      {
        uint64_t v6 = [v3 zoomablePhotosViewModel];
        double v5 = v6;
        if (!v6)
        {
          uint64_t v4 = 0;
          uint64_t v14 = 0;
          long long v12 = 0u;
          long long v13 = 0u;
          long long v10 = 0u;
          long long v11 = 0u;
          long long v8 = 0u;
          long long v9 = 0u;
          goto LABEL_16;
        }
        [v6 zoomState];
        int v7 = BYTE8(v11);

        if (v7)
        {
LABEL_7:
          if ((PXCuratedLibraryStateIsEmptyLibrary([v3 libraryState]) & 1) == 0
            && (![v3 isSelecting]
             || ([v3 hideStatusFooterInSelectMode] & 1) == 0))
          {
            uint64_t v4 = +[PXCuratedLibrarySettings sharedInstance];
            double v5 = (void *)([v4 hideStatusFooter] ^ 1);
LABEL_16:

            goto LABEL_13;
          }
        }
      }
    }
    double v5 = 0;
LABEL_13:
    -[PXCuratedLibraryFooterController setWantsFooter:](self, "setWantsFooter:", v5, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)_invalidateWantsFooter
{
  id v2 = [(PXCuratedLibraryFooterController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWantsFooter];
}

- (void)_footerHasImportantInformationDidChange
{
  double v3 = [(PXCuratedLibraryFooterController *)self footerViewModel];
  int v4 = [v3 hasImportantInformation];

  if (v4)
  {
    [(PXCuratedLibraryFooterController *)self _conditionallyRevealPhotosFooterView];
  }
}

- (void)_conditionallyRevealPhotosFooterView
{
  if ([(PXCuratedLibraryFooterController *)self _shouldRevealPhotosFooterView])
  {
    double v3 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "[Footer] Should auto-scroll, waiting for idle timer", (uint8_t *)&buf, 2u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke;
    v11[3] = &unk_1E5DC0320;
    v11[4] = self;
    [(PXCuratedLibraryFooterController *)self performChanges:v11];
    double lastUserScrollTime = self->_lastUserScrollTime;
    objc_initWeak(&buf, self);
    double v5 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke_2;
    v8[3] = &unk_1E5DCD798;
    objc_copyWeak(v9, &buf);
    v9[1] = *(id *)&lastUserScrollTime;
    uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:2.0];
    footerAutoScrollMinimumIdleTimer = self->_footerAutoScrollMinimumIdleTimer;
    self->_footerAutoScrollMinimumIdleTimer = v6;

    objc_destroyWeak(v9);
    objc_destroyWeak(&buf);
  }
}

uint64_t __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFooterNeedsReveal:1];
}

void __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _conditionallyRevealPhotosFooterViewWithLastUserScrollTime:*(double *)(a1 + 40)];
}

- (void)_conditionallyRevealPhotosFooterViewWithLastUserScrollTime:(double)a3
{
  footerAutoScrollMinimumIdleTimer = self->_footerAutoScrollMinimumIdleTimer;
  self->_footerAutoScrollMinimumIdleTimer = 0;

  if (self->_lastUserScrollTime == a3)
  {
    if ([(PXCuratedLibraryFooterController *)self _shouldRevealPhotosFooterView])
    {
      self->_footerDidAutoScroll = 1;
      long long v9 = [(PXCuratedLibraryFooterController *)self delegate];
      [v9 footerControllerRevealFooter:self];

      int v7 = v10;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      long long v8 = __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_3;
    }
    else
    {
      int v7 = v11;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      long long v8 = __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_2;
    }
  }
  else
  {
    uint64_t v6 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "[Footer] Suppressing auto-scroll: user scrolled", buf, 2u);
    }

    int v7 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    long long v8 = __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke;
  }
  v7[2] = v8;
  v7[3] = &unk_1E5DC0320;
  v7[4] = self;
  -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:");
}

uint64_t __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFooterNeedsReveal:0];
}

uint64_t __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFooterNeedsReveal:0];
}

uint64_t __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFooterNeedsReveal:0];
}

- (BOOL)_shouldRevealPhotosFooterView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(PXCuratedLibraryFooterController *)self isGridViewVisible])
  {
    if (self->_footerAutoScrollMinimumIdleTimer)
    {
      double v3 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        int v4 = "[Footer] Suppressing auto-scroll: Waiting for idle timer";
LABEL_7:
        _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v12, 2u);
      }
    }
    else
    {
      uint64_t v6 = [(PXCuratedLibraryFooterController *)self footerViewModel];
      char v7 = [v6 hasImportantInformation];

      if (v7)
      {
        long long v8 = [(PXCuratedLibraryFooterController *)self gridView];
        long long v9 = [v8 scrollViewController];
        long long v10 = [(PXCuratedLibraryFooterController *)self layout];
        [v10 padding];
        [v9 isScrolledAtEdge:3 tolerance:v11 + 1.0];

        [(PXCuratedLibraryFooterController *)self footerVisibleAmountIncludingSafeAreaInsets:0];
        PXFloatEqualToFloatWithTolerance();
      }
      double v3 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        int v4 = "[Footer] Suppressing auto-scroll: No important information";
        goto LABEL_7;
      }
    }
  }
  else
  {
    double v3 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      int v4 = "[Footer] Suppressing auto-scroll: Not visible";
      goto LABEL_7;
    }
  }

  return 0;
}

- (BOOL)_shouldShowFooterForPresentedZoomLevel
{
  double v3 = [(PXCuratedLibraryFooterController *)self viewModel];
  int v4 = [v3 specManager];
  double v5 = [v4 spec];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 4) {
    return 1;
  }
  int64_t presentedZoomLevel = self->_presentedZoomLevel;
  if (!presentedZoomLevel) {
    return 1;
  }
  long long v8 = [(PXCuratedLibraryFooterController *)self viewModel];
  BOOL v9 = presentedZoomLevel == [v8 zoomLevel];

  return v9;
}

- (BOOL)_shouldShowFooterForGridViewState
{
  double v3 = [(PXCuratedLibraryFooterController *)self viewModel];
  int v4 = [v3 specManager];
  double v5 = [v4 spec];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 4)
  {
    [(PXCuratedLibraryFooterController *)self footerVisibleAmountIncludingSafeAreaInsets:1];
    PXFloatGreaterThanFloat();
  }
  return 1;
}

- (BOOL)isPullingFooter
{
  double v3 = [(PXCuratedLibraryFooterController *)self gridView];
  int v4 = [v3 scrollViewController];

  double v5 = [(PXCuratedLibraryFooterController *)self gridView];
  uint64_t v6 = [v5 engine];
  char v7 = [v6 scrollViewSpeedometer];

  if ([v4 isScrolledAtEdge:3 tolerance:1.0]
    && ([v7 lastScrollDirection], v8 > 0.0))
  {
    char v9 = [v4 isTracking];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (double)footerVisibleAmountIncludingSafeAreaInsets:(BOOL)a3
{
  double v5 = [(PXCuratedLibraryFooterController *)self footerView];
  if (v5)
  {
    uint64_t v6 = [(PXCuratedLibraryFooterController *)self gridView];
    [v5 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    double v15 = [v6 scrollViewController];
    [v15 scrollViewVisibleRect];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    if (!a3)
    {
      [v6 safeAreaInsets];
      PXEdgeInsetsInsetRect();
    }
    v37.origin.CGFloat x = v17;
    v37.origin.CGFloat y = v19;
    v37.size.CGFloat width = v21;
    v37.size.CGFloat height = v23;
    v41.origin.CGFloat x = v8;
    v41.origin.CGFloat y = v10;
    v41.size.CGFloat width = v12;
    v41.size.CGFloat height = v14;
    CGRect v38 = CGRectIntersection(v37, v41);
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
    IsEmptCGFloat y = CGRectIsEmpty(v38);
    double v29 = v14;
    CGFloat v30 = v12;
    CGFloat v31 = v10;
    CGFloat v32 = v8;
    double v33 = 0.0;
    if (!IsEmpty)
    {
      v39.origin.CGFloat x = x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      CGFloat v34 = v29;
      v39.size.CGFloat height = height;
      double v35 = CGRectGetHeight(v39);
      v40.origin.CGFloat x = v32;
      v40.origin.CGFloat y = v31;
      v40.size.CGFloat width = v30;
      v40.size.CGFloat height = v34;
      double v33 = v35 / CGRectGetHeight(v40);
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (BOOL)isGridViewVisible
{
  id v2 = [(PXCuratedLibraryFooterController *)self gridView];
  double v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_viewDidStartScrolling
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_double lastUserScrollTime = v3;
}

- (void)viewDidAppear
{
  [(PXCuratedLibraryFooterController *)self setHasAppearedOnce:1];
  [(PXCuratedLibraryFooterController *)self _footerHasImportantInformationDidChange];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryFooterController;
  [(PXCuratedLibraryFooterController *)&v3 performChanges:a3];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryFooterController;
  [(PXCuratedLibraryFooterController *)&v4 didPerformChanges];
  objc_super v3 = [(PXCuratedLibraryFooterController *)self updater];
  [v3 updateIfNeeded];
}

- (void)setFooterFullyMasked:(BOOL)a3
{
  if (self->_footerFullyMasked != a3)
  {
    self->_footerFullyMasked = a3;
    [(PXCuratedLibraryFooterController *)self _invalidateFooterAndMaskVisibility];
  }
}

- (void)setIsFooterVisible:(BOOL)a3
{
  if (self->_isFooterVisible != a3)
  {
    self->_isFooterVisible = a3;
    objc_super v4 = [(PXCuratedLibraryFooterController *)self footerViewModel];
    id v5 = v4;
    if (self->_isFooterVisible) {
      [v4 didShowFooter];
    }
    else {
      [v4 didHideFooter];
    }
  }
}

- (void)setFooterView:(id)a3
{
  id v5 = (PXPhotosGlobalFooterView *)a3;
  if (self->_footerView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_footerView, a3);
    [(PXCuratedLibraryFooterController *)self _invalidateIsFooterVisible];
    [(PXCuratedLibraryFooterController *)self _invalidateFooterAlpha];
    id v5 = v6;
  }
}

- (void)setFooterMaskVerticalOffset:(double)a3
{
  if (self->_footerMaskVerticalOffset != a3)
  {
    self->_footerMaskVerticalOffset = a3;
    [(PXCuratedLibraryFooterController *)self _invalidateFooterMaskViewFrame];
  }
}

- (void)setWantsFooterMask:(BOOL)a3
{
  if (self->_wantsFooterMask != a3)
  {
    self->_wantsFooterMask = a3;
    [(PXCuratedLibraryFooterController *)self _invalidateFooter];
  }
}

- (void)setWantsFooter:(BOOL)a3
{
  if (self->_wantsFooter != a3)
  {
    self->_wantsFooter = a3;
    [(PXCuratedLibraryFooterController *)self _invalidateFooter];
  }
}

- (void)setFooterNeedsReveal:(BOOL)a3
{
  if (self->_footerNeedsReveal != a3)
  {
    self->_footerNeedsReveal = a3;
    [(PXCuratedLibraryFooterController *)self _invalidateWantsFooter];
  }
}

- (void)setHasAppearedOnce:(BOOL)a3
{
  if (self->_hasAppearedOnce != a3)
  {
    self->_hasAppearedOnce = a3;
    [(PXCuratedLibraryFooterController *)self _invalidateWantsFooter];
  }
}

- (PXCuratedLibraryFooterViewModel)footerViewModelIfLoaded
{
  return self->_footerViewModel;
}

- (id)footerViewModel
{
  footerViewModel = self->_footerViewModel;
  if (!footerViewModel)
  {
    objc_super v4 = [(PXCuratedLibraryFooterController *)self itemCountsController];
    id v5 = [(PXCuratedLibraryFooterController *)self viewModel];
    uint64_t v6 = [v5 cplUIStatusProvider];
    double v7 = [v5 analysisStatus];
    CGFloat v8 = -[PXCuratedLibraryFooterViewModel initWithItemCountsController:cplUIStatusProvider:analysisStatus:mode:viewModel:]([PXCuratedLibraryFooterViewModel alloc], "initWithItemCountsController:cplUIStatusProvider:analysisStatus:mode:viewModel:", v4, v6, v7, objc_msgSend((id)objc_opt_class(), "_modeForZoomLevel:", objc_msgSend(v5, "zoomLevel")), v5);
    double v9 = self->_footerViewModel;
    self->_footerViewModel = v8;

    [(PXCuratedLibraryFooterViewModel *)self->_footerViewModel setPresentingDelegate:self];
    [(PXCuratedLibraryFooterViewModel *)self->_footerViewModel registerChangeObserver:self context:CuratedLibraryFooterViewModelObserverContext];

    footerViewModel = self->_footerViewModel;
  }
  return footerViewModel;
}

- (PXCuratedLibraryFooterController)initWithGridView:(id)a3 layout:(id)a4 viewModel:(id)a5 itemsCountsController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXCuratedLibraryFooterController;
  double v15 = [(PXCuratedLibraryFooterController *)&v24 init];
  double v16 = v15;
  if (v15)
  {
    v15->_int64_t presentedZoomLevel = 0;
    objc_storeStrong((id *)&v15->_gridView, a3);
    CGFloat v17 = [(PXGView *)v16->_gridView scrollViewController];
    [v17 registerObserver:v16];
    objc_storeStrong((id *)&v16->_layout, a4);
    objc_storeStrong((id *)&v16->_viewModel, a5);
    [(PXCuratedLibraryViewModel *)v16->_viewModel registerChangeObserver:v16 context:CuratedLibraryViewModelObserverContext_159683];
    double v18 = [(PXCuratedLibraryViewModel *)v16->_viewModel zoomablePhotosViewModel];
    [v18 registerChangeObserver:v16 context:operator||];

    uint64_t v19 = [v13 styleGuide];
    styleGuide = v16->_styleGuide;
    v16->_styleGuide = (PXCuratedLibraryStyleGuide *)v19;

    objc_storeStrong((id *)&v16->_itemCountsController, a6);
    uint64_t v21 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v16];
    updater = v16->_updater;
    v16->_updater = (PXUpdater *)v21;

    [(PXUpdater *)v16->_updater setNeedsUpdateSelector:sel__setNeedsUpdate];
    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateFooterMode];
    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateWantsFooter];
    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateFooter];
    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateIsFooterVisible];
    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateFooterAlpha];
    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateFooterMaskViewFrame];
    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateFooterAndMaskVisibility];
  }
  return v16;
}

- (PXCuratedLibraryFooterController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryFooterController.m", 76, @"%s is not available as initializer", "-[PXCuratedLibraryFooterController init]");

  abort();
}

+ (int64_t)_modeForZoomLevel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 2) {
    return 2;
  }
  if (a3 == 3) {
    return 1;
  }
  if (!a3)
  {
    uint64_t v13 = v4;
    uint64_t v14 = v3;
    id v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v6, v5, v13, v14, v7, v8);
    [v12 handleFailureInMethod:a2 object:a1 file:@"PXCuratedLibraryFooterController.m" lineNumber:286 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

@end