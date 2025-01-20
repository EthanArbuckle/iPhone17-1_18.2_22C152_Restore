@interface PUAccessoryTileViewController
- (BOOL)_isPhoneAndLandscape;
- (BOOL)_needsUpdate;
- (BOOL)_wasActiveOnLastMasterContentOffsetChange;
- (BOOL)isLocationFromProviderInContentArea:(id)a3;
- (CGRect)_contentBounds;
- (CGRect)_keyboardFrame;
- (CGRect)_untransformedMasterContentFrame;
- (PUAccessoryContentViewController)_contentViewController;
- (PUAccessoryContentViewController)_loadedContentViewController;
- (PUAccessoryTileViewController)initWithReuseIdentifier:(id)a3;
- (PUAccessoryTileViewControllerDelegate)delegate;
- (PUAssetReference)assetReference;
- (PUAssetViewModel)assetViewModel;
- (UIEdgeInsets)_contentInsets;
- (UIView)_contentView;
- (double)_editorHeightDelta;
- (double)_minimumVisibleHeight;
- (id)accessoryContentViewControllerViewHostingGestureRecognizers:(id)a3;
- (int64_t)_contentInsetsChangeReason;
- (void)_handleScheduledUpdate;
- (void)_invalidateContentBounds;
- (void)_invalidateContentViewController;
- (void)_invalidateContentViewMetrics;
- (void)_invalidateLoadedContentViewController;
- (void)_invalidateMasterContentOffset;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_performChanges:(id)a3;
- (void)_setContentBounds:(CGRect)a3;
- (void)_setContentInsets:(UIEdgeInsets)a3;
- (void)_setContentInsetsChangeReason:(int64_t)a3;
- (void)_setContentView:(id)a3;
- (void)_setContentViewController:(id)a3;
- (void)_setEditorHeightDelta:(double)a3;
- (void)_setKeyboardFrame:(CGRect)a3;
- (void)_setLoadedContentViewController:(id)a3;
- (void)_setMinimumVisibleHeight:(double)a3;
- (void)_setNeedsUpdate;
- (void)_setUntransformedMasterContentFrame:(CGRect)a3;
- (void)_setWasActiveOnLastMasterContentOffsetChange:(BOOL)a3;
- (void)_updateContentBoundsIfNeeded;
- (void)_updateContentViewControllerIfNeeded;
- (void)_updateContentViewMetricsIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateLoadedContentViewControllerIfNeeded;
- (void)_updateMasterContentOffsetIfNeeded;
- (void)accessoryContentViewController:(id)a3 editorHeightDidChange:(double)a4;
- (void)accessoryContentViewControllerContentBoundsDidChange:(id)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)dealloc;
- (void)didChangeActive;
- (void)setAssetReference:(id)a3;
- (void)setAssetViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUAccessoryTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__loadedContentViewController, 0);
  objc_storeStrong((id *)&self->__contentViewController, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setEditorHeightDelta:(double)a3
{
  self->__editorHeightDelta = a3;
}

- (double)_editorHeightDelta
{
  return self->__editorHeightDelta;
}

- (void)_setWasActiveOnLastMasterContentOffsetChange:(BOOL)a3
{
  self->__wasActiveOnLastMasterContentOffsetChange = a3;
}

- (BOOL)_wasActiveOnLastMasterContentOffsetChange
{
  return self->__wasActiveOnLastMasterContentOffsetChange;
}

- (double)_minimumVisibleHeight
{
  return self->__minimumVisibleHeight;
}

- (void)_setContentInsetsChangeReason:(int64_t)a3
{
  self->__contentInsetsChangeReason = a3;
}

- (int64_t)_contentInsetsChangeReason
{
  return self->__contentInsetsChangeReason;
}

- (CGRect)_keyboardFrame
{
  double x = self->__keyboardFrame.origin.x;
  double y = self->__keyboardFrame.origin.y;
  double width = self->__keyboardFrame.size.width;
  double height = self->__keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)_contentInsets
{
  double top = self->__contentInsets.top;
  double left = self->__contentInsets.left;
  double bottom = self->__contentInsets.bottom;
  double right = self->__contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)_untransformedMasterContentFrame
{
  double x = self->__untransformedMasterContentFrame.origin.x;
  double y = self->__untransformedMasterContentFrame.origin.y;
  double width = self->__untransformedMasterContentFrame.size.width;
  double height = self->__untransformedMasterContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_contentBounds
{
  double x = self->__contentBounds.origin.x;
  double y = self->__contentBounds.origin.y;
  double width = self->__contentBounds.size.width;
  double height = self->__contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (PUAccessoryContentViewController)_loadedContentViewController
{
  return self->__loadedContentViewController;
}

- (PUAccessoryContentViewController)_contentViewController
{
  return self->__contentViewController;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUAccessoryTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAccessoryTileViewControllerDelegate *)WeakRetained;
}

- (void)_keyboardWillHide:(id)a3
{
  v4 = [(PUAccessoryTileViewController *)self assetViewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PUAccessoryTileViewController__keyboardWillHide___block_invoke;
  v7[3] = &unk_1E5F2ED10;
  id v8 = v4;
  id v5 = v4;
  [v5 performChanges:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PUAccessoryTileViewController__keyboardWillHide___block_invoke_2;
  v6[3] = &unk_1E5F2ED10;
  v6[4] = self;
  [(PUAccessoryTileViewController *)self _performChanges:v6];
}

uint64_t __51__PUAccessoryTileViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditStyle:0 changeReason:2];
}

uint64_t __51__PUAccessoryTileViewController__keyboardWillHide___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setKeyboardFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  v2 = *(void **)(a1 + 32);
  return [v2 _setContentInsetsChangeReason:3];
}

- (void)_keyboardWillShow:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__PUAccessoryTileViewController__keyboardWillShow___block_invoke;
  v14[3] = &unk_1E5F2E058;
  v14[4] = self;
  v14[5] = v7;
  v14[6] = v9;
  v14[7] = v11;
  v14[8] = v13;
  [(PUAccessoryTileViewController *)self _performChanges:v14];
}

uint64_t __51__PUAccessoryTileViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  return [v2 _setContentInsetsChangeReason:2];
}

- (void)accessoryContentViewController:(id)a3 editorHeightDidChange:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__PUAccessoryTileViewController_accessoryContentViewController_editorHeightDidChange___block_invoke;
  v4[3] = &unk_1E5F2E0A8;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  [(PUAccessoryTileViewController *)self _performChanges:v4];
}

uint64_t __86__PUAccessoryTileViewController_accessoryContentViewController_editorHeightDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setEditorHeightDelta:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) _invalidateContentViewMetrics];
  v2 = *(void **)(a1 + 32);
  return [v2 _setContentInsetsChangeReason:1];
}

- (void)accessoryContentViewControllerContentBoundsDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__PUAccessoryTileViewController_accessoryContentViewControllerContentBoundsDidChange___block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUAccessoryTileViewController *)self _performChanges:v3];
}

uint64_t __86__PUAccessoryTileViewController_accessoryContentViewControllerContentBoundsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContentBounds];
}

- (id)accessoryContentViewControllerViewHostingGestureRecognizers:(id)a3
{
  id v5 = a3;
  if (!self->_delegateFlags.respondsToViewHostingGestureRecognizers
    || ([(PUAccessoryTileViewController *)self delegate],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 accessoryTileViewControllerViewHostingGestureRecognizers:self],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    uint64_t v8 = [(PUAccessoryTileViewController *)self _contentViewController];
    int v9 = [v8 isViewLoaded];

    if (!v9
      || ([(PUAccessoryTileViewController *)self _contentViewController],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v10 view],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v7))
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PUAccessoryTileViewController.m" lineNumber:592 description:@"missing viewHostingGestureRecognizers"];

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_isPhoneAndLandscape
{
  v2 = [(PUAccessoryTileViewController *)self _contentViewController];
  v3 = [v2 traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v7 = [v6 windows];
  uint64_t v8 = [v7 firstObject];
  int v9 = [v8 windowScene];
  uint64_t v10 = [v9 interfaceOrientation];

  return (unint64_t)(v10 - 3) < 2;
}

- (void)_updateMasterContentOffsetIfNeeded
{
  if (self->_needsUpdateFlags.masterContentOffset)
  {
    self->_needsUpdateFlags.masterContentOffset = 0;
    [(PUAccessoryTileViewController *)self _contentBounds];
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
    IsEmptCGFloat y = CGRectIsEmpty(v32);
    BOOL v8 = [(PUTileController *)self isActive];
    if ((IsEmpty & 1) == 0)
    {
      double v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      uint64_t v25 = *MEMORY[0x1E4F1DAD8];
      [(PUAccessoryTileViewController *)self _untransformedMasterContentFrame];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v33);
      v34.origin.CGFloat x = v10;
      v34.origin.CGFloat y = v12;
      v34.size.CGFloat width = v14;
      v34.size.CGFloat height = v16;
      double v18 = MinY - CGRectGetMaxY(v34);
      if (v18 <= 0.0) {
        double v19 = v18;
      }
      else {
        double v19 = 0.0;
      }
      if (v8) {
        double v20 = v19;
      }
      else {
        double v20 = v24;
      }
      if (v8 == [(PUAccessoryTileViewController *)self _wasActiveOnLastMasterContentOffsetChange])
      {
        if ((unint64_t)([(PUAccessoryTileViewController *)self _contentInsetsChangeReason]- 1) >= 3)uint64_t v21 = 2; {
        else
        }
          uint64_t v21 = 3;
      }
      else
      {
        uint64_t v21 = 1;
      }
      v22 = [(PUAccessoryTileViewController *)self assetViewModel];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__PUAccessoryTileViewController__updateMasterContentOffsetIfNeeded__block_invoke;
      v26[3] = &unk_1E5F2E058;
      id v27 = v22;
      uint64_t v28 = v25;
      double v29 = v20;
      uint64_t v30 = v21;
      double v31 = v19;
      id v23 = v22;
      [v23 performChanges:v26];
    }
    [(PUAccessoryTileViewController *)self _setWasActiveOnLastMasterContentOffsetChange:v8 & ~IsEmpty];
  }
}

uint64_t __67__PUAccessoryTileViewController__updateMasterContentOffsetIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentOffset:changeReason:", *(void *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v2 = *(double *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "setContentOffsetForAccessoryFullyVisible:", 0.0, v2);
}

- (void)_invalidateMasterContentOffset
{
  self->_needsUpdateFlags.masterContentOffset = 1;
  [(PUAccessoryTileViewController *)self _setNeedsUpdate];
}

- (void)_updateContentBoundsIfNeeded
{
  if (self->_needsUpdateFlags.contentBounds)
  {
    self->_needsUpdateFlags.contentBounds = 0;
    id v21 = [(PUAccessoryTileViewController *)self _contentView];
    if (v21)
    {
      v3 = [(PUTileViewController *)self view];
      uint64_t v4 = [(PUAccessoryTileViewController *)self _loadedContentViewController];
      [v4 contentBoundsInCoordinateSpace:v3];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;

      [v3 bounds];
      v25.origin.double x = v13;
      v25.origin.double y = v14;
      v25.size.double width = v15;
      v25.size.double height = v16;
      v23.origin.double x = v6;
      v23.origin.double y = v8;
      v23.size.double width = v10;
      v23.size.double height = v12;
      CGRect v24 = CGRectIntersection(v23, v25);
      double x = v24.origin.x;
      double y = v24.origin.y;
      double width = v24.size.width;
      double height = v24.size.height;
    }
    else
    {
      double x = *MEMORY[0x1E4F1DB20];
      double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    -[PUAccessoryTileViewController _setContentBounds:](self, "_setContentBounds:", x, y, width, height);
  }
}

- (void)_invalidateContentBounds
{
  self->_needsUpdateFlags.contentBounds = 1;
  [(PUAccessoryTileViewController *)self _setNeedsUpdate];
}

- (void)_updateContentViewMetricsIfNeeded
{
  if (!self->_needsUpdateFlags.contentViewMetrics) {
    return;
  }
  self->_needsUpdateFlags.contentViewMetrics = 0;
  v3 = [(PUAccessoryTileViewController *)self _contentView];
  if (v3)
  {
    id v94 = v3;
    uint64_t v4 = [(PUTileViewController *)self view];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    objc_msgSend(v94, "setFrame:");
    if (self->_delegateFlags.respondsToShouldUseSquareImageWhenShowingAccessoryView)
    {
      CGFloat v13 = [(PUAccessoryTileViewController *)self delegate];
      char v14 = [v13 accessoryTileViewControllerShouldUseSquareImageWhenShowingAccessoryView:self] ^ 1;

      BOOL v15 = [(PUAccessoryTileViewController *)self _isPhoneAndLandscape];
      char v16 = 1;
      if ((v14 & 1) == 0 && v15)
      {
        double v89 = v6;
        double v17 = v10;
        [v94 bounds];
        CGFloat x = v96.origin.x;
        double y = v96.origin.y;
        double width = v96.size.width;
        double height = v96.size.height;
        double v22 = CGRectGetHeight(v96);
        PXSizeGetAspectRatio();
        if (v23 < 2.0)
        {
          v97.origin.CGFloat x = x;
          v97.origin.double y = y;
          v97.size.double width = width;
          v97.size.double height = height;
          double v24 = CGRectGetWidth(v97);
          v98.origin.CGFloat x = x;
          v98.origin.double y = y;
          v98.size.double width = width;
          v98.size.double height = height;
          double v22 = v24 - CGRectGetHeight(v98);
        }
        objc_msgSend(v94, "setFrame:", v22, y, width - v22, height);
        char v16 = 0;
        CGFloat v10 = v17;
        CGFloat v6 = v89;
      }
    }
    else
    {
      [(PUAccessoryTileViewController *)self _isPhoneAndLandscape];
      char v16 = 1;
      char v14 = 1;
    }
    if (self->_delegateFlags.respondsToWillHideToolbarWhenShowingAccessoryView)
    {
      CGRect v25 = [(PUAccessoryTileViewController *)self delegate];
      int v26 = [v25 accessoryTileViewControllerWillHideToolbarWhenShowingAccessoryView:self];
    }
    else
    {
      int v26 = 0;
    }
    id v27 = [(PUAccessoryTileViewController *)self _loadedContentViewController];
    objc_msgSend(v27, "px_safeAreaInsets");
    double v29 = v28;
    [v27 preferredContentSize];
    double v31 = v30;
    CGFloat v32 = v6;
    CGFloat v33 = v8;
    CGFloat v34 = v10;
    CGFloat v35 = v12;
    if (v14)
    {
      double v36 = CGRectGetHeight(*(CGRect *)&v32);
      v37 = +[PUOneUpSettings sharedInstance];
      [v37 accessoryInitialTopPosition];
      double v39 = 1.0 - v38;
      double v40 = v29;
      if ((v26 & 1) == 0) {
        [(PUAccessoryTileViewController *)self _contentInsets];
      }
      double v41 = -(v40 - v36 * v39);

      [(PUAccessoryTileViewController *)self _minimumVisibleHeight];
      if (v42 < v31) {
        double v42 = v31;
      }
      if (v42 >= v41) {
        double v43 = v41;
      }
      else {
        double v43 = v42;
      }
    }
    else
    {
      double v44 = CGRectGetWidth(*(CGRect *)&v32);
      v45 = +[PUOneUpSettings sharedInstance];
      int v46 = [v45 squareImageCapToHalfHeight];

      if (v46)
      {
        v99.origin.CGFloat x = v6;
        v99.origin.double y = v8;
        v99.size.double width = v10;
        v99.size.double height = v12;
        double v47 = CGRectGetHeight(v99) * 0.5;
        if (v47 < v44) {
          double v44 = v47;
        }
      }
      v100.origin.CGFloat x = v6;
      v100.origin.double y = v8;
      v100.size.double width = v10;
      v100.size.double height = v12;
      double v48 = CGRectGetHeight(v100) - v44;
      double v49 = v29;
      if ((v26 & 1) == 0) {
        [(PUAccessoryTileViewController *)self _contentInsets];
      }
      double v43 = v48 - v49;
      double v41 = v43;
    }
    uint64_t v50 = MEMORY[0x1E4FB2848];
    [(PUAccessoryTileViewController *)self _editorHeightDelta];
    if (v51 != 0.0)
    {
      int v52 = PXFloatEqualToFloatWithTolerance();
      [(PUAccessoryTileViewController *)self _editorHeightDelta];
      double v54 = v31 + v53;
      if (v31 + v53 >= v41) {
        double v54 = v41;
      }
      double v55 = v43 + v53;
      if (v52) {
        double v55 = v54;
      }
      if (v41 >= v55) {
        double v43 = v55;
      }
      else {
        double v43 = v41;
      }
      [(PUAccessoryTileViewController *)self _setEditorHeightDelta:0.0];
    }
    double v92 = *(double *)(v50 + 8);
    double v93 = *(double *)(v50 + 24);
    [(PUAccessoryTileViewController *)self _contentInsets];
    if (!v26) {
      double v29 = v56;
    }
    v101.origin.CGFloat x = v6;
    v101.origin.double y = v8;
    v101.size.double width = v10;
    v101.size.double height = v12;
    CGFloat rect = v12;
    CGFloat v57 = v8;
    double v91 = CGRectGetHeight(v101) - v29 - v43;
    [(PUAccessoryTileViewController *)self _keyboardFrame];
    CGFloat v58 = v10;
    double v59 = v102.origin.x;
    CGFloat v60 = v6;
    double v61 = v102.origin.y;
    double v62 = v102.size.width;
    double v63 = v102.size.height;
    if (CGRectIsNull(v102))
    {
      if (v16)
      {
        double v65 = v92;
        double v64 = v93;
        double v66 = v91;
LABEL_60:
        objc_msgSend(v27, "setContentInsets:changeReason:", -[PUAccessoryTileViewController _contentInsetsChangeReason](self, "_contentInsetsChangeReason", *(void *)&v86, *(void *)&v87), v66, v65, v29, v64);

        v3 = v94;
        goto LABEL_61;
      }
      double v65 = v92;
      double v64 = v93;
      if (self->_delegateFlags.respondsToWillHideNavigationBarWhenShowingAccessoryView)
      {
        v83 = [(PUAccessoryTileViewController *)self delegate];
        char v84 = [v83 accessoryTileViewControllerWillHideNavigationBarWhenShowingAccessoryView:self];

        double v66 = 0.0;
        if (v84) {
          goto LABEL_60;
        }
      }
    }
    else
    {
      if (v61 < 0.0) {
        double v61 = 0.0;
      }
      v67 = [MEMORY[0x1E4FB1438] sharedApplication];
      v68 = objc_msgSend(v67, "px_firstKeyWindow");
      objc_msgSend(v4, "convertRect:fromView:", v68, v59, v61, v62, v63);
      CGFloat v70 = v69;
      CGFloat v72 = v71;
      CGFloat v74 = v73;
      CGFloat v76 = v75;

      CGFloat v90 = v60;
      v103.origin.CGFloat x = v60;
      CGFloat v86 = v58;
      CGFloat v87 = v57;
      v103.origin.double y = v57;
      v103.size.double width = v58;
      v103.size.double height = rect;
      double MaxY = CGRectGetMaxY(v103);
      v104.origin.CGFloat x = v70;
      v104.origin.double y = v72;
      v104.size.double width = v74;
      v104.size.double height = v76;
      double v78 = MaxY - CGRectGetMinY(v104);
      if (v29 < v78) {
        double v29 = v78;
      }
      if (objc_opt_respondsToSelector())
      {
        [(PUAccessoryTileViewController *)self _contentInsets];
        objc_msgSend(v27, "setMaxVisibleContentInsetsWhenInEdit:");
      }
      double v79 = 0.0;
      if (objc_opt_respondsToSelector())
      {
        [v27 minimumContentSize];
        double v79 = v80;
      }
      v105.origin.CGFloat x = v70;
      v105.origin.double y = v72;
      v105.size.double width = v74;
      v105.size.double height = v76;
      double MinY = CGRectGetMinY(v105);
      v106.origin.CGFloat x = v90;
      v106.size.double width = v58;
      v106.origin.double y = v57;
      v106.size.double height = rect;
      double v82 = MinY - CGRectGetMinY(v106) - v79;
      double v65 = v92;
      if (v91 < v82) {
        double v82 = v91;
      }
      if (v82 >= 0.0) {
        double v66 = v82;
      }
      else {
        double v66 = 0.0;
      }
      double v64 = v93;
      if (v16) {
        goto LABEL_60;
      }
    }
    [(PUAccessoryTileViewController *)self _contentInsets];
    double v66 = v85;
    goto LABEL_60;
  }
LABEL_61:
}

- (void)_invalidateContentViewMetrics
{
  self->_needsUpdateFlags.contentViewMetrics = 1;
  [(PUAccessoryTileViewController *)self _setNeedsUpdate];
}

- (void)_updateLoadedContentViewControllerIfNeeded
{
  if (self->_needsUpdateFlags.loadedContentViewController)
  {
    self->_needsUpdateFlags.loadedContentViewController = 0;
    if ([(PUTileViewController *)self isViewLoaded])
    {
      v3 = [(PUAccessoryTileViewController *)self _contentViewController];
    }
    else
    {
      v3 = 0;
    }
    uint64_t v4 = [(PUAccessoryTileViewController *)self assetViewModel];
    [v4 focusValue];
    double v6 = fabs(v5);

    if (v6 >= 1.0)
    {
      dispatch_time_t v7 = dispatch_time(0, 250000000);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __75__PUAccessoryTileViewController__updateLoadedContentViewControllerIfNeeded__block_invoke;
      v8[3] = &unk_1E5F2ECC8;
      v8[4] = self;
      id v9 = v3;
      dispatch_after(v7, MEMORY[0x1E4F14428], v8);
    }
    else
    {
      [(PUAccessoryTileViewController *)self _setLoadedContentViewController:v3];
    }
  }
}

uint64_t __75__PUAccessoryTileViewController__updateLoadedContentViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLoadedContentViewController:*(void *)(a1 + 40)];
}

- (void)_invalidateLoadedContentViewController
{
  self->_needsUpdateFlags.loadedContentViewController = 1;
  [(PUAccessoryTileViewController *)self _setNeedsUpdate];
}

- (void)_updateContentViewControllerIfNeeded
{
  if (self->_needsUpdateFlags.contentViewController)
  {
    self->_needsUpdateFlags.contentViewController = 0;
    v3 = [(PUAccessoryTileViewController *)self assetReference];

    if (v3)
    {
      uint64_t v4 = [(PUAccessoryTileViewController *)self delegate];
      id v5 = [v4 accessoryTileViewControllerAccessoryViewController:self];
    }
    else
    {
      id v5 = 0;
    }
    [(PUAccessoryTileViewController *)self _setContentViewController:v5];
  }
}

- (void)_invalidateContentViewController
{
  self->_needsUpdateFlags.contentViewController = 1;
  [(PUAccessoryTileViewController *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PUAccessoryTileViewController *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PUAccessoryTileViewController *)self _updateContentViewControllerIfNeeded];
    [(PUAccessoryTileViewController *)self _updateLoadedContentViewControllerIfNeeded];
    [(PUAccessoryTileViewController *)self _updateContentViewMetricsIfNeeded];
    [(PUAccessoryTileViewController *)self _updateContentBoundsIfNeeded];
    [(PUAccessoryTileViewController *)self _updateMasterContentOffsetIfNeeded];
    [(PUAccessoryTileViewController *)self _setContentInsetsChangeReason:0];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_handleScheduledUpdate
{
  self->_isUpdateScheduled = 0;
  [(PUAccessoryTileViewController *)self _performChanges:0];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates && !self->_isUpdateScheduled)
  {
    self->_isUpdateScheduled = 1;
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __48__PUAccessoryTileViewController__setNeedsUpdate__block_invoke;
    v2[3] = &unk_1E5F2E530;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x1E4F14428], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __48__PUAccessoryTileViewController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleScheduledUpdate];
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.contentViewController
      || self->_needsUpdateFlags.loadedContentViewController
      || self->_needsUpdateFlags.contentViewMetrics
      || self->_needsUpdateFlags.contentBounds
      || self->_needsUpdateFlags.masterContentOffset;
}

- (void)_performChanges:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  double v6 = v4;
  if (v4)
  {
    v4[2](v4);
    uint64_t v4 = v6;
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PUAccessoryTileViewController *)self _updateIfNeeded];
    uint64_t v4 = v6;
  }
}

- (void)_setMinimumVisibleHeight:(double)a3
{
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    self->__minimumVisibleHeight = a3;
    [(PUAccessoryTileViewController *)self _invalidateContentViewMetrics];
    [(PUAccessoryTileViewController *)self _setContentInsetsChangeReason:1];
  }
}

- (void)_setKeyboardFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_keyboardFrame = &self->__keyboardFrame;
  if (!CGRectEqualToRect(a3, self->__keyboardFrame))
  {
    p_keyboardFrame->origin.CGFloat x = x;
    p_keyboardFrame->origin.CGFloat y = y;
    p_keyboardFrame->size.CGFloat width = width;
    p_keyboardFrame->size.CGFloat height = height;
    [(PUAccessoryTileViewController *)self _invalidateContentViewMetrics];
  }
}

- (void)_setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->__contentInsets.left
    || a3.top != self->__contentInsets.top
    || a3.right != self->__contentInsets.right
    || a3.bottom != self->__contentInsets.bottom)
  {
    self->__contentInsets = a3;
    [(PUAccessoryTileViewController *)self _invalidateContentViewMetrics];
  }
}

- (void)_setUntransformedMasterContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_untransformedMasterContentFrame = &self->__untransformedMasterContentFrame;
  if (!CGRectEqualToRect(a3, self->__untransformedMasterContentFrame))
  {
    p_untransformedMasterContentFrame->origin.CGFloat x = x;
    p_untransformedMasterContentFrame->origin.CGFloat y = y;
    p_untransformedMasterContentFrame->size.CGFloat width = width;
    p_untransformedMasterContentFrame->size.CGFloat height = height;
    [(PUAccessoryTileViewController *)self _invalidateMasterContentOffset];
    [(PUAccessoryTileViewController *)self _invalidateContentViewMetrics];
  }
}

- (void)_setContentBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentBounds = &self->__contentBounds;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_contentBounds->origin.CGFloat x = x;
    p_contentBounds->origin.CGFloat y = y;
    p_contentBounds->size.CGFloat width = width;
    p_contentBounds->size.CGFloat height = height;
    [(PUAccessoryTileViewController *)self _invalidateMasterContentOffset];
  }
}

- (void)_setContentView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->__contentView != v5)
  {
    dispatch_time_t v7 = v5;
    objc_storeStrong((id *)&self->__contentView, a3);
    double v6 = [(UIView *)self->__contentView layer];
    [v6 setAllowsGroupOpacity:0];

    [(PUAccessoryTileViewController *)self _invalidateContentViewMetrics];
    [(PUAccessoryTileViewController *)self _invalidateContentBounds];
    id v5 = v7;
  }
}

- (void)_setLoadedContentViewController:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v6 = (PUAccessoryContentViewController *)a3;
  p_loadedContentViewController = &self->__loadedContentViewController;
  if (self->__loadedContentViewController != v6)
  {
    if ([(PUTileViewController *)self isViewLoaded])
    {
      CGFloat v8 = [(PUTileViewController *)self view];
    }
    else
    {
      CGFloat v8 = 0;
    }
    if (*p_loadedContentViewController)
    {
      id v9 = [(PUAccessoryContentViewController *)*p_loadedContentViewController view];
      CGFloat v10 = [v9 superview];

      if (v10 == v8)
      {
        [(PUAccessoryContentViewController *)*p_loadedContentViewController willMoveToParentViewController:0];
        double v11 = [(PUAccessoryContentViewController *)*p_loadedContentViewController view];
        [v11 removeFromSuperview];

        [(PUAccessoryContentViewController *)*p_loadedContentViewController removeFromParentViewController];
        CGFloat v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v12 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];

        CGFloat v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v13 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
      }
    }
    objc_storeStrong((id *)&self->__loadedContentViewController, a3);
    if (*p_loadedContentViewController)
    {
      char v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

      BOOL v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

      char v16 = [(PUAccessoryTileViewController *)self delegate];
      double v17 = [v16 accessoryTileViewControllerHostViewController:self];

      if (v17
        && [v17 isViewLoaded]
        && ([v17 view],
            double v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v8 isDescendantOfView:v18],
            v18,
            (v19 & 1) != 0))
      {
        [v17 addChildViewController:*p_loadedContentViewController];
        double v20 = [(PUAccessoryContentViewController *)*p_loadedContentViewController view];
        if (!v8)
        {
          double v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:a2 object:self file:@"PUAccessoryTileViewController.m" lineNumber:191 description:@"missing container view"];
        }
        [v8 addSubview:v20];
        id v21 = [v8 layer];
        [v21 setAllowsGroupOpacity:0];

        [(PUAccessoryContentViewController *)*p_loadedContentViewController didMoveToParentViewController:v17];
      }
      else
      {
        double v22 = PLUIGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412802;
          CGRect v25 = self;
          __int16 v26 = 2112;
          id v27 = v17;
          __int16 v28 = 2112;
          double v29 = v8;
          _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEFAULT, "%@: hostViewController %@ doesn't contain containerView %@", (uint8_t *)&v24, 0x20u);
        }

        double v20 = 0;
      }
    }
    else
    {
      double v20 = 0;
    }
    [(PUAccessoryTileViewController *)self _setContentView:v20];
  }
}

- (void)_setContentViewController:(id)a3
{
  id v5 = (PUAccessoryContentViewController *)a3;
  p_contentViewController = &self->__contentViewController;
  contentViewController = self->__contentViewController;
  if (contentViewController != v5)
  {
    id v9 = v5;
    CGFloat v8 = [(PUAccessoryContentViewController *)contentViewController accessoryContentViewControllerDelegate];

    if (v8 == self) {
      [(PUAccessoryContentViewController *)*p_contentViewController setAccessoryContentViewControllerDelegate:0];
    }
    objc_storeStrong((id *)&self->__contentViewController, a3);
    [(PUAccessoryContentViewController *)*p_contentViewController setAccessoryContentViewControllerDelegate:self];
    [(PUAccessoryTileViewController *)self _invalidateLoadedContentViewController];
    id v5 = v9;
  }
}

- (BOOL)isLocationFromProviderInContentArea:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAccessoryTileViewController *)self _contentView];
  if (v5)
  {
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;
    CGFloat v10 = [(PUAccessoryTileViewController *)self _loadedContentViewController];
    char v11 = objc_msgSend(v10, "contentAreaContainsPoint:inCoordinateSpace:", v5, v7, v9);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)didChangeActive
{
  v3.receiver = self;
  v3.super_class = (Class)PUAccessoryTileViewController;
  [(PUTileController *)&v3 didChangeActive];
  [(PUAccessoryTileViewController *)self _invalidateMasterContentOffset];
}

- (void)setAssetReference:(id)a3
{
  id v5 = (PUAssetReference *)a3;
  if (self->_assetReference != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_assetReference, a3);
    [(PUAccessoryTileViewController *)self _invalidateContentViewController];
    id v5 = v6;
  }
}

- (void)setAssetViewModel:(id)a3
{
  id v5 = (PUAssetViewModel *)a3;
  if (self->_assetViewModel != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAccessoryTileViewController *)self _invalidateMasterContentOffset];
    id v5 = v6;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillHideToolbarWhenShowingAccessoryView = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillHideNavigationBarWhenShowingAccessoryView = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldUseSquareImageWhenShowingAccessoryView = objc_opt_respondsToSelector() & 1;
  }
}

- (void)applyLayoutInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUAccessoryTileViewController;
  [(PUTileViewController *)&v8 applyLayoutInfo:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PUAccessoryTileViewController_applyLayoutInfo___block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUAccessoryTileViewController *)self _performChanges:v6];
}

uint64_t __49__PUAccessoryTileViewController_applyLayoutInfo___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) untransformedContentFrame];
  objc_msgSend(v2, "_setUntransformedMasterContentFrame:");
  objc_super v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) contentInsets];
  objc_msgSend(v3, "_setContentInsets:");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) minimumVisibleHeight];
  return objc_msgSend(v4, "_setMinimumVisibleHeight:");
}

- (void)becomeReusable
{
  v4.receiver = self;
  v4.super_class = (Class)PUAccessoryTileViewController;
  [(PUTileViewController *)&v4 becomeReusable];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PUAccessoryTileViewController_becomeReusable__block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUAccessoryTileViewController *)self _performChanges:v3];
}

uint64_t __47__PUAccessoryTileViewController_becomeReusable__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setEditorHeightDelta:0.0];
  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 32) setAssetViewModel:0];
  double v2 = *(void **)(a1 + 32);
  return [v2 setAssetReference:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUAccessoryTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PUAccessoryTileViewController *)self _invalidateLoadedContentViewController];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUAccessoryTileViewController;
  [(PUTileViewController *)&v4 dealloc];
}

- (PUAccessoryTileViewController)initWithReuseIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUAccessoryTileViewController;
  CGRect result = [(PUTileController *)&v5 initWithReuseIdentifier:a3];
  if (result)
  {
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->__keyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->__keyboardFrame.size = v4;
  }
  return result;
}

@end