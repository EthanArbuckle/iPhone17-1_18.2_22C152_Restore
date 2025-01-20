@interface PUUserTransformTileViewController
- (BOOL)isZoomedIn;
- (BOOL)pointInsideContentView:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (BOOL)userInteractionEnabled;
- (BOOL)userTransformView:(id)a3 shouldReceiveTouchAtPoint:(CGPoint)a4;
- (CGPoint)offsetWhileApplyingInsets;
- (NSString)_identifier;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingViewModel)browsingViewModel;
- (PUDisplayTileTransform)displayTileTransform;
- (PUUserTransformTileLayoutInfo)userTransformTileLayoutInfo;
- (PUUserTransformTileViewController)initWithReuseIdentifier:(id)a3;
- (PUUserTransformTileViewControllerDelegate)delegate;
- (PUUserTransformView)userTransformView;
- (UIView)interactionHostView;
- (double)minimumScaleWhileApplyingInsets;
- (id)_userInputOriginIdentifier;
- (id)loadView;
- (void)_handleAssetViewModelChange:(id)a3;
- (void)_handleBrowsingViewModelChange:(id)a3;
- (void)_setIdentifier:(id)a3;
- (void)_setUserTransformView:(id)a3;
- (void)_updateAssetViewModelIsZoomedIn;
- (void)_updateAssetViewModelProperties;
- (void)_updateDisplayTileTransform;
- (void)_updateInteractionHostViewRegistration;
- (void)_updateMinimumZoomScale:(BOOL)a3;
- (void)_updateUserInteractionEnabled;
- (void)_updateUserTransformOffset:(BOOL)a3;
- (void)_updateUserTransformPadding;
- (void)_updateUserTransformView:(id)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)dealloc;
- (void)didChangeAnimating;
- (void)didChangeIsOnPrimaryDisplay;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayTileTransform:(id)a3;
- (void)setMinimumScaleWhileApplyingInsets:(double)a3;
- (void)setOffsetWhileApplyingInsets:(CGPoint)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)userTransformViewDidChangeIsZoomedIn:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)zoomInOnLocationFromProvider:(id)a3;
- (void)zoomOutAnimated:(BOOL)a3;
@end

@implementation PUUserTransformTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHostView, 0);
  objc_storeStrong((id *)&self->__identifier, 0);
  objc_storeStrong((id *)&self->_displayTileTransform, 0);
  objc_storeStrong((id *)&self->_userTransformView, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CGPoint)offsetWhileApplyingInsets
{
  double x = self->_offsetWhileApplyingInsets.x;
  double y = self->_offsetWhileApplyingInsets.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)minimumScaleWhileApplyingInsets
{
  return self->_minimumScaleWhileApplyingInsets;
}

- (UIView)interactionHostView
{
  return self->_interactionHostView;
}

- (void)_setIdentifier:(id)a3
{
}

- (NSString)_identifier
{
  return self->__identifier;
}

- (PUDisplayTileTransform)displayTileTransform
{
  return self->_displayTileTransform;
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)_setUserTransformView:(id)a3
{
}

- (PUUserTransformView)userTransformView
{
  return self->_userTransformView;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUUserTransformTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUUserTransformTileViewControllerDelegate *)WeakRetained;
}

- (void)userTransformViewDidChangeIsZoomedIn:(id)a3
{
  [(PUUserTransformTileViewController *)self _updateUserTransformOffset:1];
  [(PUUserTransformTileViewController *)self _updateAssetViewModelIsZoomedIn];
}

- (BOOL)userTransformView:(id)a3 shouldReceiveTouchAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v7, x, y);

  if (self->_delegateRespondsTo.shouldReceiveTouchAtLocationFromProvider)
  {
    v9 = [(PUUserTransformTileViewController *)self delegate];
    char v10 = [v9 userTransformTileViewController:self shouldReceiveTouchAtLocationFromProvider:v8];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUUserTransformTileViewController *)self assetViewModel];

  if (v7 == v9)
  {
    [(PUUserTransformTileViewController *)self _handleAssetViewModelChange:v6];
  }
  else
  {
    id v8 = [(PUUserTransformTileViewController *)self browsingViewModel];

    if (v8 == v9) {
      [(PUUserTransformTileViewController *)self _handleBrowsingViewModelChange:v6];
    }
  }
}

- (void)_updateAssetViewModelProperties
{
  if ([(PUTileController *)self isActive])
  {
    v3 = [(PUUserTransformTileViewController *)self assetViewModel];
    v4 = [(PUUserTransformTileViewController *)self displayTileTransform];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PUUserTransformTileViewController__updateAssetViewModelProperties__block_invoke;
    v7[3] = &unk_1E5F2E908;
    v7[4] = self;
    id v8 = v3;
    id v9 = v4;
    id v5 = v4;
    id v6 = v3;
    [v6 performChanges:v7];
  }
}

void __68__PUUserTransformTileViewController__updateAssetViewModelProperties__block_invoke(id *a1)
{
  [a1[4] _updateAssetViewModelIsZoomedIn];
  v2 = [a1[4] userTransformView];
  objc_msgSend(a1[5], "setUserTransformingTile:", objc_msgSend(v2, "isUserInteracting"));

  id v3 = [a1[6] modelTileTransform];
  [a1[5] setModelTileTransform:v3];
}

- (void)_updateAssetViewModelIsZoomedIn
{
  if ([(PUTileController *)self isActive])
  {
    id v3 = [(PUUserTransformTileViewController *)self assetViewModel];
    v4 = [(PUUserTransformTileViewController *)self userTransformView];
    int v5 = [v4 hasUserZoomedIn];

    if (v5 != [v3 isZoomedIn])
    {
      if (v5)
      {
        id v6 = v12;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        id v7 = __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke;
LABEL_7:
        v6[2] = v7;
        v6[3] = &unk_1E5F2ED10;
        id v10 = v3;
        v6[4] = v10;
        [v10 performChanges:v6];

        goto LABEL_8;
      }
      id v8 = [(PUUserTransformTileViewController *)self userTransformView];
      int v9 = [v8 isTrackingZoomGesture];

      if ((v9 & 1) == 0)
      {
        id v6 = v11;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        id v7 = __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke_2;
        goto LABEL_7;
      }
    }
LABEL_8:
  }
}

uint64_t __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsZoomedIn:1];
}

uint64_t __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsZoomedIn:0];
}

- (BOOL)isZoomedIn
{
  v2 = [(PUUserTransformTileViewController *)self userTransformView];
  char v3 = [v2 hasUserZoomedIn];

  return v3;
}

- (void)zoomOutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUUserTransformTileViewController *)self userTransformView];
  [v4 zoomOut:v3];
}

- (void)zoomInOnLocationFromProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(PUUserTransformTileViewController *)self userTransformView];
  [v5 zoomInOnLocationFromProvider:v4];
}

- (void)_updateInteractionHostViewRegistration
{
  if ([(PUTileViewController *)self isOnPrimaryDisplay])
  {
    id v4 = [(PUUserTransformTileViewController *)self assetViewModel];
    BOOL v3 = [(PUUserTransformTileViewController *)self interactionHostView];
    [v4 registerView:v3 forImageAnalysisInteractionHostMode:1];
  }
}

- (id)_userInputOriginIdentifier
{
  BOOL v3 = NSString;
  id v4 = [(PUUserTransformTileViewController *)self _identifier];
  id v5 = [(PUUserTransformTileViewController *)self userTransformView];
  [v5 bounds];
  v12.width = v6;
  v12.height = v7;
  id v8 = NSStringFromCGSize(v12);
  int v9 = [v3 stringWithFormat:@"%@ size=%@", v4, v8];

  return v9;
}

- (void)_updateUserInteractionEnabled
{
  BOOL v3 = ![(PUTileController *)self isAnimating]
    && [(PUUserTransformTileViewController *)self userInteractionEnabled];
  id v4 = [(PUTileViewController *)self view];
  [v4 setUserInteractionEnabled:v3];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    [(PUUserTransformTileViewController *)self _updateUserInteractionEnabled];
  }
}

- (BOOL)pointInsideContentView:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v7, x, y);

  int v9 = [(PUUserTransformTileViewController *)self userTransformView];
  LOBYTE(v7) = [v9 contentContainsLocationFromProvider:v8];

  return (char)v7;
}

- (void)didChangeIsOnPrimaryDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformTileViewController;
  [(PUTileViewController *)&v3 didChangeIsOnPrimaryDisplay];
  [(PUUserTransformTileViewController *)self _updateInteractionHostViewRegistration];
}

- (void)didChangeAnimating
{
  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformTileViewController;
  [(PUTileController *)&v3 didChangeAnimating];
  [(PUUserTransformTileViewController *)self _updateUserInteractionEnabled];
}

- (void)_updateUserTransformPadding
{
  id v8 = [(PUUserTransformTileViewController *)self displayTileTransform];
  [v8 transformPadding];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(PUUserTransformTileViewController *)self userTransformView];
  objc_msgSend(v7, "setScrollPadding:", v4, v6);
}

- (void)_updateUserTransformOffset:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(PUUserTransformTileViewController *)self userTransformView];
  double v5 = [(PUUserTransformTileViewController *)self browsingViewModel];
  int v6 = [v12 hasUserZoomedIn];
  if (v5) {
    int v7 = [v5 isChromeVisible];
  }
  else {
    int v7 = 0;
  }
  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled]) {
    BOOL v8 = v6 == 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(PUUserTransformTileViewController *)self offsetWhileApplyingInsets];
  }
  objc_msgSend(v12, "setOffset:animated:", v3, v10, v11);
}

- (void)_updateUserTransformView:(id)a3
{
  id v25 = a3;
  double v4 = [(PUUserTransformTileViewController *)self userTransformView];
  if (v25 && v4)
  {
    [v25 contentPixelSize];
    double v6 = v5;
    double v8 = v7;
    [v25 untransformedContentFrame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(PUUserTransformTileViewController *)self displayTileTransform];
    if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
    {
      v18 = [(PUUserTransformTileViewController *)self assetViewModel];
      if ([v18 isAccessoryViewVisible])
      {
        v19 = [(PUUserTransformTileViewController *)self assetViewModel];
        [v19 contentOffsetForAccessoryFullyVisible];
        if (v21 == *(double *)(MEMORY[0x1E4F1DAD8] + 8) && v20 == *MEMORY[0x1E4F1DAD8]) {
          uint64_t v23 = 7;
        }
        else {
          uint64_t v23 = 0;
        }
      }
      else
      {
        uint64_t v23 = 7;
      }

      v24 = [MEMORY[0x1E4F90300] sharedInstance];
      objc_msgSend(v4, "setPreferToFillOnDoubleTap:", objc_msgSend(v24, "doubleTapFillsScreen"));
    }
    else if ([v17 hasUserInput])
    {
      uint64_t v23 = 7;
    }
    else
    {
      uint64_t v23 = 2;
    }
    objc_msgSend(v4, "setContentPixelSize:", v6, v8);
    objc_msgSend(v4, "setUntransformedContentFrame:", v10, v12, v14, v16);
    [v4 setEnabledInteractions:v23];
    [(PUUserTransformTileViewController *)self _updateUserTransformOffset:0];
  }
}

- (PUUserTransformTileLayoutInfo)userTransformTileLayoutInfo
{
  double v4 = [(PUTileController *)self layoutInfo];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      double v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PUUserTransformTileViewController.m", 254, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.layoutInfo", v8, v9 object file lineNumber description];
    }
  }
  return (PUUserTransformTileLayoutInfo *)v4;
}

- (void)_updateMinimumZoomScale:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PUUserTransformTileViewController *)self browsingViewModel];
  double v6 = 1.0;
  if (v5)
  {
    double v7 = (void *)v5;
    double v8 = [(PUUserTransformTileViewController *)self browsingViewModel];
    char v9 = [v8 isPresentedForPreview];

    if ((v9 & 1) == 0)
    {
      double v10 = [(PUUserTransformTileViewController *)self browsingViewModel];
      char v11 = [v10 isChromeVisible];

      if ((v11 & 1) != 0
        || ([(PUUserTransformTileViewController *)self browsingViewModel],
            double v12 = objc_claimAutoreleasedReturnValue(),
            uint64_t v13 = [v12 lastChromeVisibilityChangeReason],
            v12,
            v13 == 2))
      {
        [(PUUserTransformTileViewController *)self minimumScaleWhileApplyingInsets];
        double v6 = v14;
      }
    }
  }
  id v15 = [(PUUserTransformTileViewController *)self userTransformView];
  [v15 setMinimumZoomScale:v3 animated:v6];
}

- (void)_updateDisplayTileTransform
{
  BOOL v3 = [(PUUserTransformTileViewController *)self userTransformView];
  double v4 = [(PUUserTransformTileViewController *)self assetViewModel];
  uint64_t v5 = [v4 modelTileTransform];

  double v6 = [(PUUserTransformTileViewController *)self userTransformTileLayoutInfo];
  [v6 untransformedContentFrame];
  double v8 = v7;
  double v10 = v9;
  char v11 = [(PUTileViewController *)self view];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v16 = [(PUUserTransformTileViewController *)self assetViewModel];
  v17 = [v16 secondDisplayTileTransform];
  v18 = +[PUDisplayTileTransform displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:](PUDisplayTileTransform, "displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:", v5, v17, 1.0, v8, v10, v13, v15);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  if (v3) {
    [v3 userAffineTransform];
  }
  v19 = [(PUUserTransformTileViewController *)self _userInputOriginIdentifier];
  int v20 = [v3 hasUserZoomedIn];
  v22[0] = v23;
  v22[1] = v24;
  v22[2] = v25;
  double v21 = (void *)[v18 newDisplayTileTransformWithUserAffineTransform:v22 userInputOriginIdentifier:v19 isZoomedOut:v20 ^ 1u];
  [(PUUserTransformTileViewController *)self setDisplayTileTransform:v21];
}

- (void)_handleBrowsingViewModelChange:(id)a3
{
  if ([a3 chromeVisibilityDidChange])
  {
    [(PUUserTransformTileViewController *)self _updateMinimumZoomScale:1];
    [(PUUserTransformTileViewController *)self _updateUserTransformOffset:1];
  }
}

- (void)setMinimumScaleWhileApplyingInsets:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_minimumScaleWhileApplyingInsets = a3;
    [(PUUserTransformTileViewController *)self _updateMinimumZoomScale:0];
  }
}

- (void)setOffsetWhileApplyingInsets:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_offsetWhileApplyingInsets = &self->_offsetWhileApplyingInsets;
  if ((PXPointApproximatelyEqualToPoint() & 1) == 0)
  {
    p_offsetWhileApplyingInsets->CGFloat x = x;
    p_offsetWhileApplyingInsets->CGFloat y = y;
    [(PUUserTransformTileViewController *)self _updateUserTransformOffset:0];
  }
}

- (void)setDisplayTileTransform:(id)a3
{
  uint64_t v5 = (PUDisplayTileTransform *)a3;
  if (self->_displayTileTransform != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_displayTileTransform, a3);
    [(PUUserTransformTileViewController *)self _updateAssetViewModelProperties];
    uint64_t v5 = v6;
  }
}

- (void)_handleAssetViewModelChange:(id)a3
{
  id v11 = a3;
  if ([v11 accessoryViewVisibilityChanged])
  {
    double v4 = [(PUUserTransformTileViewController *)self assetViewModel];
    int v5 = [v4 isAccessoryViewVisible];

    if (v5)
    {
      double v6 = [(PUUserTransformTileViewController *)self userTransformView];
      [v6 zoomOut:1];
    }
  }
  if ([v11 accessoryViewVisibilityChanged])
  {
    double v7 = [(PUUserTransformTileViewController *)self userTransformTileLayoutInfo];
    [(PUUserTransformTileViewController *)self _updateUserTransformView:v7];
  }
  if ([v11 isZoomedInChanged]) {
    [(PUUserTransformTileViewController *)self _updateUserTransformOffset:1];
  }
  if ([v11 isFullyOutOfFocusChanged])
  {
    double v8 = [(PUUserTransformTileViewController *)self assetViewModel];
    int v9 = [v8 isFullyOutOfFocus];

    if (v9)
    {
      double v10 = [(PUUserTransformTileViewController *)self userTransformView];
      [v10 zoomOut:0];
    }
  }
}

- (void)applyLayoutInfo:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PUUserTransformTileViewController.m", 132, @"Invalid parameter not satisfying: %@", @"[layoutInfo isKindOfClass:[PUUserTransformTileLayoutInfo class]]" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)PUUserTransformTileViewController;
  [(PUTileViewController *)&v42 applyLayoutInfo:v5];
  [(PUUserTransformTileViewController *)self _updateUserTransformView:v5];
  [(PUUserTransformTileViewController *)self _updateUserTransformPadding];
  [(PUUserTransformTileViewController *)self _updateDisplayTileTransform];
  double v6 = [(PUUserTransformTileViewController *)self userTransformView];
  [v6 layoutIfNeeded];

  double v7 = [(PUUserTransformTileViewController *)self delegate];
  double v8 = [v5 indexPath];
  uint64_t v9 = [v7 userTransformTileViewController:self insetModeForItemAtIndexPath:v8];

  if (v9 != 2)
  {
    [(PUUserTransformTileViewController *)self setMinimumScaleWhileApplyingInsets:1.0];
    double v27 = *MEMORY[0x1E4F1DAD8];
    double v28 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_21:
    v33 = self;
    goto LABEL_22;
  }
  [v5 untransformedContentFrame];
  [v5 chromeInsets];
  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
  {
    double v10 = [MEMORY[0x1E4F90300] sharedInstance];
    int v11 = [v10 insetAllContent];

    if (v11)
    {
      double v12 = [MEMORY[0x1E4F90300] sharedInstance];
      [v12 minimumMarginForInsetContent];
      PXEdgeInsetsMaxEachEdge();
    }
  }
  [v5 size];
  double v36 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v37 = *MEMORY[0x1E4F1DAD8];
  PXRectWithOriginAndSize();
  PXEdgeInsetsInsetRect();
  CGFloat rect = v13;
  CGFloat v38 = v14;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  PXSizeGetAspectRatio();
  PFSizeWithAspectRatioFittingSize();
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  double x = v43.origin.x;
  CGFloat y = v43.origin.y;
  CGFloat width = v43.size.width;
  CGFloat height = v43.size.height;
  double MinX = CGRectGetMinX(v43);
  v44.origin.double x = rect;
  v44.origin.CGFloat y = v38;
  CGFloat v39 = v16;
  CGFloat v40 = v18;
  v44.size.CGFloat width = v16;
  v44.size.CGFloat height = v18;
  if (MinX >= CGRectGetMinX(v44))
  {
    v46.origin.double x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v46);
    v47.size.CGFloat height = v18;
    v47.origin.double x = rect;
    v47.origin.CGFloat y = v38;
    v47.size.CGFloat width = v16;
    if (MaxX <= CGRectGetMaxX(v47))
    {
      CGFloat v24 = y;
      CGFloat v25 = height;
      CGFloat v26 = width;
    }
    else
    {
      v48.size.CGFloat height = v18;
      v48.origin.double x = rect;
      v48.origin.CGFloat y = v38;
      v48.size.CGFloat width = v16;
      double v35 = CGRectGetMaxX(v48);
      v49.origin.double x = x;
      CGFloat v24 = y;
      v49.origin.CGFloat y = y;
      CGFloat v26 = width;
      v49.size.CGFloat width = width;
      CGFloat v25 = height;
      v49.size.CGFloat height = height;
      double x = v35 - CGRectGetWidth(v49);
    }
  }
  else
  {
    CGFloat v24 = y;
    CGFloat v25 = height;
    CGFloat v26 = width;
    v45.size.CGFloat height = v40;
    v45.origin.double x = rect;
    v45.origin.CGFloat y = v38;
    v45.size.CGFloat width = v39;
    double x = CGRectGetMinX(v45);
  }
  v50.origin.double x = x;
  v50.origin.CGFloat y = v24;
  CGFloat v30 = v26;
  v50.size.CGFloat width = v26;
  v50.size.CGFloat height = v25;
  double MinY = CGRectGetMinY(v50);
  v51.size.CGFloat height = v40;
  v51.origin.double x = rect;
  v51.origin.CGFloat y = v38;
  v51.size.CGFloat width = v39;
  if (MinY >= CGRectGetMinY(v51))
  {
    v53.origin.double x = x;
    v53.origin.CGFloat y = v24;
    v53.size.CGFloat width = v30;
    v53.size.CGFloat height = v25;
    double MaxY = CGRectGetMaxY(v53);
    v54.size.CGFloat height = v40;
    v54.origin.double x = rect;
    v54.origin.CGFloat y = v38;
    v54.size.CGFloat width = v39;
    if (MaxY > CGRectGetMaxY(v54))
    {
      v55.size.CGFloat height = v40;
      v55.origin.double x = rect;
      v55.origin.CGFloat y = v38;
      v55.size.CGFloat width = v39;
      CGRectGetMaxY(v55);
      v56.origin.double x = x;
      v56.origin.CGFloat y = v24;
      v56.size.CGFloat width = v30;
      v56.size.CGFloat height = v25;
      CGRectGetHeight(v56);
    }
  }
  else
  {
    v52.size.CGFloat height = v40;
    v52.origin.double x = rect;
    v52.origin.CGFloat y = v38;
    v52.size.CGFloat width = v39;
    CGRectGetMinY(v52);
  }
  if ((PXSizeIsEmpty() & 1) == 0 && (PXSizeIsEmpty() & 1) == 0)
  {
    PXAffineTransformMakeFromRects();
    PXAffineTransformGetUniformScale();
    -[PUUserTransformTileViewController setMinimumScaleWhileApplyingInsets:](self, "setMinimumScaleWhileApplyingInsets:");
    PXRectGetCenter();
    PXRectGetCenter();
    PXPointSubtract();
    goto LABEL_21;
  }
  [(PUUserTransformTileViewController *)self setMinimumScaleWhileApplyingInsets:1.0];
  v33 = self;
  double v28 = v36;
  double v27 = v37;
LABEL_22:
  -[PUUserTransformTileViewController setOffsetWhileApplyingInsets:](v33, "setOffsetWhileApplyingInsets:", v27, v28);
}

- (void)setAssetViewModel:(id)a3
{
  id v5 = (PUAssetViewModel *)a3;
  p_assetViewModel = &self->_assetViewModel;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    double v14 = v5;
    double v8 = [(PUUserTransformTileViewController *)self interactionHostView];
    [(PUAssetViewModel *)assetViewModel unregisterView:v8 forImageAnalysisInteractionHostMode:1];

    [(PUAssetViewModel *)*p_assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)*p_assetViewModel registerChangeObserver:self];
    uint64_t v9 = [(id)objc_opt_class() description];
    double v10 = [MEMORY[0x1E4F29128] UUID];
    int v11 = [v10 UUIDString];
    double v12 = [v9 stringByAppendingString:v11];

    [(PUUserTransformTileViewController *)self _setIdentifier:v12];
    [(PUUserTransformTileViewController *)self setDisplayTileTransform:0];
    double v13 = [(PUUserTransformTileViewController *)self userTransformTileLayoutInfo];
    [(PUUserTransformTileViewController *)self _updateUserTransformView:v13];

    [(PUUserTransformTileViewController *)self _updateInteractionHostViewRegistration];
    id v5 = v14;
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  id v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    double v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    [(PUUserTransformTileViewController *)self _updateMinimumZoomScale:0];
    [(PUUserTransformTileViewController *)self _updateUserTransformOffset:0];
    id v5 = v7;
  }
}

- (id)loadView
{
  double v4 = [(PUUserTransformTileViewController *)self userTransformView];

  if (v4)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUUserTransformTileViewController.m", 91, @"Invalid parameter not satisfying: %@", @"[self userTransformView] == nil" object file lineNumber description];
  }
  id v5 = -[PUUserTransformView initWithFrame:]([PUUserTransformView alloc], "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
  [(PUUserTransformView *)v5 setDelegate:self];
  [(PUUserTransformTileViewController *)self _setUserTransformView:v5];
  double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  interactionHostView = self->_interactionHostView;
  self->_interactionHostView = v6;

  [(UIView *)self->_interactionHostView setClipsToBounds:1];
  [(PUUserTransformView *)v5 setHostedView:self->_interactionHostView];
  double v8 = [(PUUserTransformTileViewController *)self userTransformTileLayoutInfo];
  [(PUUserTransformTileViewController *)self _updateUserTransformView:v8];

  [(PUUserTransformTileViewController *)self _updateMinimumZoomScale:0];
  [(PUUserTransformTileViewController *)self _updateInteractionHostViewRegistration];
  return v5;
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUUserTransformTileViewController *)self setBrowsingViewModel:0];
  [(PUUserTransformTileViewController *)self setAssetViewModel:0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->didChangeIsUserInteracting = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->shouldReceiveTouchAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
  }
}

- (void)dealloc
{
  objc_super v3 = [(PUUserTransformView *)self->_userTransformView delegate];

  if (v3 == self) {
    [(PUUserTransformView *)self->_userTransformView setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)PUUserTransformTileViewController;
  [(PUTileViewController *)&v4 dealloc];
}

- (PUUserTransformTileViewController)initWithReuseIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUUserTransformTileViewController;
  CGPoint result = [(PUTileController *)&v4 initWithReuseIdentifier:a3];
  if (result)
  {
    result->_userInteractionEnabled = 1;
    result->_minimumScaleWhileApplyingInsets = 1.0;
  }
  return result;
}

@end