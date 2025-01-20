@interface PUTileViewController
- (BOOL)_edgeAntialiasingEnabled;
- (BOOL)_isLoadingView;
- (BOOL)isContentViewEnabled;
- (BOOL)isOnPrimaryDisplay;
- (BOOL)isPresentationActive;
- (BOOL)isReadyForDisplay;
- (BOOL)isViewLoaded;
- (BOOL)wantsVisibleRectChanges;
- (CGRect)visibleRect;
- (NSArray)gestureRecognizers;
- (NSArray)viewsForApplyingBorder;
- (NSArray)viewsForApplyingCornerRadius;
- (NSTimer)_readinessTimer;
- (PXGradientView)bottomLegibilityView;
- (PXGradientView)topLegibilityView;
- (UIView)_maskView;
- (UIView)_tintView;
- (UIView)_visibleRectView;
- (UIView)contentView;
- (UIView)loadedView;
- (UIView)originalView;
- (UIView)view;
- (UIView)viewIfLoaded;
- (id)_onReadyToDisplayBlock;
- (id)loadView;
- (id)presentationLayoutInfo;
- (void)_handleReadinessForced:(BOOL)a3;
- (void)_invalidateTintView;
- (void)_setContentView:(id)a3;
- (void)_setEdgeAntialiasingEnabled:(BOOL)a3;
- (void)_setGestureRecognizers:(id)a3;
- (void)_setLoadedView:(id)a3;
- (void)_setLoadingView:(BOOL)a3;
- (void)_setMaskView:(id)a3;
- (void)_setOnReadyToDisplayBlock:(id)a3;
- (void)_setReadinessTimer:(id)a3;
- (void)_setReadyForDisplay:(BOOL)a3;
- (void)_setTintView:(id)a3;
- (void)_setView:(id)a3;
- (void)_setVisibleRectView:(id)a3;
- (void)_updateDynamicStateDebugging;
- (void)_updateTintView;
- (void)_updateVisibleRectView;
- (void)addToTilingView:(id)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)dealloc;
- (void)didChangeVisibleRect;
- (void)notifyWhenReadyForDisplayWithTimeOut:(double)a3 completionHandler:(id)a4;
- (void)prepareForReuse;
- (void)removeAllAnimations;
- (void)setBottomLegibilityView:(id)a3;
- (void)setContentViewEnabled:(BOOL)a3;
- (void)setIsOnPrimaryDisplay:(BOOL)a3;
- (void)setTopLegibilityView:(id)a3;
@end

@implementation PUTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLegibilityView, 0);
  objc_storeStrong((id *)&self->_topLegibilityView, 0);
  objc_storeStrong((id *)&self->__maskView, 0);
  objc_storeStrong((id *)&self->__readinessTimer, 0);
  objc_storeStrong(&self->__onReadyToDisplayBlock, 0);
  objc_storeStrong((id *)&self->__visibleRectView, 0);
  objc_storeStrong((id *)&self->__tintView, 0);
  objc_storeStrong((id *)&self->_loadedView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

- (BOOL)isReadyForDisplay
{
  return self->_isReadyForDisplay;
}

- (void)setBottomLegibilityView:(id)a3
{
}

- (PXGradientView)bottomLegibilityView
{
  return self->_bottomLegibilityView;
}

- (void)setTopLegibilityView:(id)a3
{
}

- (PXGradientView)topLegibilityView
{
  return self->_topLegibilityView;
}

- (void)_setMaskView:(id)a3
{
}

- (UIView)_maskView
{
  return self->__maskView;
}

- (BOOL)_edgeAntialiasingEnabled
{
  return self->__edgeAntialiasingEnabled;
}

- (void)_setReadinessTimer:(id)a3
{
}

- (NSTimer)_readinessTimer
{
  return self->__readinessTimer;
}

- (void)_setOnReadyToDisplayBlock:(id)a3
{
}

- (id)_onReadyToDisplayBlock
{
  return self->__onReadyToDisplayBlock;
}

- (void)_setVisibleRectView:(id)a3
{
}

- (UIView)_visibleRectView
{
  return self->__visibleRectView;
}

- (void)_setTintView:(id)a3
{
}

- (UIView)_tintView
{
  return self->__tintView;
}

- (void)_setLoadingView:(BOOL)a3
{
  self->__loadingView = a3;
}

- (BOOL)_isLoadingView
{
  return self->__loadingView;
}

- (void)_setLoadedView:(id)a3
{
}

- (UIView)loadedView
{
  return self->_loadedView;
}

- (BOOL)isOnPrimaryDisplay
{
  return self->_isOnPrimaryDisplay;
}

- (void)_setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isContentViewEnabled
{
  return self->_contentViewEnabled;
}

- (void)_setView:(id)a3
{
}

- (void)_setGestureRecognizers:(id)a3
{
}

- (void)_setEdgeAntialiasingEnabled:(BOOL)a3
{
  if (self->__edgeAntialiasingEnabled != a3)
  {
    self->__edgeAntialiasingEnabled = a3;
    -[PUTileViewController setEdgeAntialiasingEnabled:](self, "setEdgeAntialiasingEnabled:");
  }
}

- (void)_handleReadinessForced:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUTileViewController *)self _onReadyToDisplayBlock];
  if (v5 && ([(PUTileViewController *)self isReadyForDisplay] || v3))
  {
    [(PUTileViewController *)self _setOnReadyToDisplayBlock:0];
    v6 = [(PUTileViewController *)self _readinessTimer];
    [v6 invalidate];

    [(PUTileViewController *)self _setReadinessTimer:0];
    id v7 = v5;
    px_dispatch_on_main_queue();
  }
}

uint64_t __47__PUTileViewController__handleReadinessForced___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)notifyWhenReadyForDisplayWithTimeOut:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  [(PUTileViewController *)self _setOnReadyToDisplayBlock:v6];
  [(PUTileViewController *)self _handleReadinessForced:0];
  id v7 = [(PUTileViewController *)self _onReadyToDisplayBlock];

  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __79__PUTileViewController_notifyWhenReadyForDisplayWithTimeOut_completionHandler___block_invoke;
    v13 = &unk_1E5F2E530;
    objc_copyWeak(&v14, &location);
    v9 = objc_msgSend(v8, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, &v10, a3);
    -[PUTileViewController _setReadinessTimer:](self, "_setReadinessTimer:", v9, v10, v11, v12, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __79__PUTileViewController_notifyWhenReadyForDisplayWithTimeOut_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleReadinessForced:1];
}

- (void)_setReadyForDisplay:(BOOL)a3
{
  if (self->_isReadyForDisplay != a3)
  {
    self->_isReadyForDisplay = a3;
    [(PUTileViewController *)self _handleReadinessForced:0];
  }
}

- (void)_updateVisibleRectView
{
  BOOL v3 = +[PUTilingViewSettings sharedInstance];
  if ([v3 showVisibleRects]) {
    BOOL v4 = [(PUTileViewController *)self isViewLoaded];
  }
  else {
    BOOL v4 = 0;
  }

  v5 = [(PUTileViewController *)self _visibleRectView];
  if (v4)
  {
    id v16 = v5;
    id v6 = [(PUTileViewController *)self view];
    if (!v16)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v8 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.100000001];
      [v7 setBackgroundColor:v8];

      v9 = [v7 layer];
      id v10 = [MEMORY[0x1E4FB1618] greenColor];
      objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

      [v9 setBorderWidth:2.0];
      [v7 setOpaque:0];
      [v6 addSubview:v7];
      [(PUTileViewController *)self _setVisibleRectView:v7];
    }
    [(PUTileViewController *)self visibleRect];
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
    IsEmptdouble y = CGRectIsEmpty(v18);
    if (!IsEmpty) {
      objc_msgSend(v16, "setFrame:", x, y, width, height);
    }
    [v16 setHidden:IsEmpty];
  }
  else
  {
    if (!v5) {
      goto LABEL_13;
    }
    id v16 = v5;
    [v5 removeFromSuperview];
    [(PUTileViewController *)self _setVisibleRectView:0];
  }
  v5 = v16;
LABEL_13:
}

- (void)_invalidateTintView
{
  BOOL v3 = [(PUTileViewController *)self _tintView];
  [v3 removeFromSuperview];

  [(PUTileViewController *)self _setTintView:0];
}

- (void)_updateTintView
{
  BOOL v3 = +[PUTilingViewSettings sharedInstance];
  int v4 = [v3 tintTiles];

  uint64_t v5 = [(PUTileViewController *)self _tintView];
  id v6 = (void *)v5;
  if (!v4)
  {
    id v16 = (void *)v5;
    [(PUTileViewController *)self _invalidateTintView];
    goto LABEL_6;
  }
  if (!v5)
  {
    id v16 = 0;
    BOOL v7 = [(PUTileViewController *)self isViewLoaded];
    id v6 = 0;
    if (v7)
    {
      v8 = [(PUTileViewController *)self view];
      id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [v8 bounds];
      id v10 = objc_msgSend(v9, "initWithFrame:");
      [v10 setAutoresizingMask:18];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:1];
      [v8 addSubview:v10];
      [(PUTileViewController *)self _setTintView:v10];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v12 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", (double)fmod(v11 / 10.0, 1.0), 1.0, 1.0, 1.0);
      v13 = [v12 colorWithAlphaComponent:0.5];
      [v10 setBackgroundColor:v13];

      [v10 setOpaque:0];
      id v14 = [v10 layer];
      id v15 = v12;
      objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));
      [v14 setBorderWidth:2.0];

LABEL_6:
      id v6 = v16;
    }
  }
}

- (void)_updateDynamicStateDebugging
{
  BOOL v3 = +[PUTilingViewSettings sharedInstance];
  int v4 = [v3 showSnapshottableTiles];

  if (v4)
  {
    uint64_t v5 = [(PUTileViewController *)self view];
    id v6 = [v5 layer];

    id v7 = [MEMORY[0x1E4FB1618] redColor];
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    BOOL v8 = [(PUTileController *)self shouldAvoidInPlaceSnapshottedFadeOut];
    double v9 = 0.0;
    if (v8) {
      double v9 = 10.0;
    }
    [v6 setBorderWidth:v9];
    objc_initWeak(&location, self);
    dispatch_time_t v10 = dispatch_time(0, 50000000);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__PUTileViewController__updateDynamicStateDebugging__block_invoke;
    v11[3] = &unk_1E5F2E530;
    objc_copyWeak(&v12, &location);
    dispatch_after(v10, MEMORY[0x1E4F14428], v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __52__PUTileViewController__updateDynamicStateDebugging__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDynamicStateDebugging];
}

- (void)didChangeVisibleRect
{
  v3.receiver = self;
  v3.super_class = (Class)PUTileViewController;
  [(PUTileController *)&v3 didChangeVisibleRect];
  [(PUTileViewController *)self _updateVisibleRectView];
}

- (BOOL)wantsVisibleRectChanges
{
  v9.receiver = self;
  v9.super_class = (Class)PUTileViewController;
  unsigned __int8 v3 = [(PUTileController *)&v9 wantsVisibleRectChanges];
  int v4 = +[PUTilingViewSettings sharedInstance];
  if ([v4 showVisibleRects])
  {
    uint64_t v5 = [(PUTileController *)self layoutInfo];
    id v6 = [v5 tileKind];
    char v7 = [v6 isEqualToString:@"PUTileKindItemContent"];

    v3 |= v7;
  }

  return v3;
}

- (CGRect)visibleRect
{
  if ([(PUTileViewController *)self isViewLoaded])
  {
    unsigned __int8 v3 = [(PUTileController *)self tilingView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(PUTileViewController *)self view];
    objc_msgSend(v12, "convertRect:fromView:", v3, v5, v7, v9, v11);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v12 bounds];
    v36.origin.CGFloat x = v21;
    v36.origin.CGFloat y = v22;
    v36.size.CGFloat width = v23;
    v36.size.CGFloat height = v24;
    v33.origin.CGFloat x = v14;
    v33.origin.CGFloat y = v16;
    v33.size.CGFloat width = v18;
    v33.size.CGFloat height = v20;
    CGRect v34 = CGRectIntersection(v33, v36);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (void)removeAllAnimations
{
  id v4 = [(PUTileViewController *)self view];
  objc_msgSend(v4, "pu_removeAllGeometryAnimationsRecursively:", 0);
  id v3 = [(PUTileViewController *)self loadedView];
  if (v4 != v3) {
    objc_msgSend(v3, "pu_removeAllGeometryAnimationsRecursively:", 0);
  }
}

- (NSArray)viewsForApplyingCornerRadius
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PUTileViewController *)self isViewLoaded])
  {
    id v3 = [(PUTileViewController *)self view];
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSArray)viewsForApplyingBorder
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PUTileViewController *)self isViewLoaded])
  {
    id v3 = [(PUTileViewController *)self view];
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)applyLayoutInfo:(id)a3
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v79 = [MEMORY[0x1E4F28B00] currentHandler];
    [v79 handleFailureInMethod:a2, self, @"PUTileViewController.m", 259, @"Invalid parameter not satisfying: %@", @"layoutInfo != nil" object file lineNumber description];
  }
  double v6 = [(PUTileController *)self tilingView];
  if (!v6)
  {
    v80 = [MEMORY[0x1E4F28B00] currentHandler];
    [v80 handleFailureInMethod:a2, self, @"PUTileViewController.m", 262, @"Invalid parameter not satisfying: %@", @"tilingView != nil" object file lineNumber description];
  }
  [v5 center];
  double v8 = v7;
  double v10 = v9;
  double v11 = [v5 coordinateSystem];
  id v12 = [v6 contentCoordinateSystem];
  double v13 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v11, v12, v8, v10);
  double v15 = v14;

  CGFloat v16 = [(PUTileViewController *)self view];
  [v16 center];
  if (v18 != v13 || v17 != v15)
  {
    if (!CGFloatIsValid() || (CGFloatIsValid() & 1) == 0)
    {
      v89 = [MEMORY[0x1E4F28B00] currentHandler];
      v112.CGFloat x = v13;
      v112.CGFloat y = v15;
      v85 = NSStringFromCGPoint(v112);
      [v5 center];
      v81 = NSStringFromCGPoint(v113);
      v87 = [v5 coordinateSystem];
      [v87 coordinateSystemOrigin];
      v82 = NSStringFromCGPoint(v114);
      v83 = [v6 contentCoordinateSystem];
      [v83 coordinateSystemOrigin];
      v84 = NSStringFromCGPoint(v115);
      [v89 handleFailureInMethod:a2, self, @"PUTileViewController.m", 267, @"invalid converted center: %@, from %@ + coordinate origins: %@ to %@", v85, v81, v82, v84 object file lineNumber description];
    }
    objc_msgSend(v16, "setCenter:", v13, v15);
  }
  v88 = v6;
  [v5 alpha];
  v86 = v16;
  objc_msgSend(v16, "setAlpha:");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PUTileViewController_applyLayoutInfo___block_invoke;
  aBlock[3] = &unk_1E5F2C7F0;
  id v19 = v5;
  id v106 = v19;
  CGFloat v20 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  CGFloat v21 = [(PUTileViewController *)self viewsForApplyingCornerRadius];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v101 objects:v110 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v102 != v24) {
          objc_enumerationMutation(v21);
        }
        v20[2](v20, *(void *)(*((void *)&v101 + 1) + 8 * i));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v101 objects:v110 count:16];
    }
    while (v23);
  }

  if ([(PUTileViewController *)self isContentViewEnabled])
  {
    v26 = [(PUTileViewController *)self contentView];
    ((void (**)(void *, void *))v20)[2](v20, v26);
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v27 = [(PUTileViewController *)self viewsForApplyingBorder];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v97 objects:v109 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v98;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v98 != v30) {
          objc_enumerationMutation(v27);
        }
        double v32 = [*(id *)(*((void *)&v97 + 1) + 8 * j) layer];
        [v19 borderWidth];
        objc_msgSend(v32, "setBorderWidth:");
        id v33 = [v19 borderColor];
        objc_msgSend(v32, "setBorderColor:", objc_msgSend(v33, "CGColor"));
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v97 objects:v109 count:16];
    }
    while (v29);
  }

  double v34 = *MEMORY[0x1E4F1DAD8];
  double v35 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v36 = v35;
  double v37 = *MEMORY[0x1E4F1DAD8];
  if ([(PUTileViewController *)self isContentViewEnabled])
  {
    [v19 parallaxOffset];
    double v37 = -v38;
    double v36 = -v39;
  }
  [v19 size];
  objc_msgSend(v86, "setBounds:", v37, v36, v40, v41);
  long long v42 = 0uLL;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v94 = 0u;
  if (v5)
  {
    [v19 transform];
    long long v42 = 0uLL;
  }
  *(_OWORD *)&v93.m41 = v42;
  *(_OWORD *)&v93.m43 = v42;
  *(_OWORD *)&v93.m31 = v42;
  *(_OWORD *)&v93.m33 = v42;
  *(_OWORD *)&v93.m21 = v42;
  *(_OWORD *)&v93.m23 = v42;
  *(_OWORD *)&v93.m11 = v42;
  *(_OWORD *)&v93.m13 = v42;
  *(_OWORD *)&m.m11 = v94;
  *(_OWORD *)&m.m13 = v95;
  *(_OWORD *)&m.m21 = v96;
  CATransform3DMakeAffineTransform(&v93, (CGAffineTransform *)&m);
  [v19 zPosition];
  CATransform3D v91 = v93;
  CATransform3DTranslate(&m, &v91, 0.0, 0.0, v43);
  CATransform3D v93 = m;
  v44 = [v86 layer];
  CATransform3D m = v93;
  [v44 setTransform:&m];

  double v45 = *((double *)&v94 + 1);
  if (*((double *)&v94 + 1) != 0.0)
  {
    v46 = +[PUTilingViewSettings sharedInstance];
    int v47 = [v46 allowsEdgeAntialiasing];

    if (v47) {
      [(PUTileViewController *)self _setEdgeAntialiasingEnabled:1];
    }
  }
  objc_msgSend(v19, "size", v45);
  double v49 = v48;
  [v19 verticalLegibilityFraction];
  double v51 = v49 * v50;
  [v19 cropInsets];
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  id v60 = [(PUTileViewController *)self topLegibilityView];
  if (!v60 && v51 > 0.0)
  {
    id v60 = objc_alloc_init(MEMORY[0x1E4F90260]);
    v61 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    v108[0] = v61;
    v62 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
    v108[1] = v62;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
    [v60 setColors:v63];

    [v60 setLocations:&unk_1F078B768];
    objc_msgSend(v60, "setStartPoint:", v34, v35);
    objc_msgSend(v60, "setEndPoint:", 0.0, 1.0);
    [v60 setUserInteractionEnabled:0];
    [v86 addSubview:v60];
    [(PUTileViewController *)self setTopLegibilityView:v60];
  }
  if (v60)
  {
    [v86 bringSubviewToFront:v60];
    if (v51 == 0.0)
    {
      [v60 setAlpha:0.0];
    }
    else
    {
      [v60 setAlpha:1.0];
      [v86 bounds];
      objc_msgSend(v60, "setFrame:", 0.0, v53);
    }
  }
  id v64 = [(PUTileViewController *)self bottomLegibilityView];
  if (!v64 && v51 > 0.0)
  {
    id v64 = objc_alloc_init(MEMORY[0x1E4F90260]);
    v65 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    v107[0] = v65;
    v66 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
    v107[1] = v66;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
    [v64 setColors:v67];

    [v64 setLocations:&unk_1F078B780];
    objc_msgSend(v64, "setStartPoint:", 0.0, 1.0);
    objc_msgSend(v64, "setEndPoint:", v34, v35);
    [v64 setUserInteractionEnabled:0];
    [v86 addSubview:v64];
    [(PUTileViewController *)self setBottomLegibilityView:v64];
  }
  if (v64)
  {
    [v86 bringSubviewToFront:v64];
    if (v51 == 0.0)
    {
      [v64 setAlpha:0.0];
    }
    else
    {
      [v64 setAlpha:1.0];
      [v86 bounds];
      double v69 = v68 - v57 - v51;
      [v86 bounds];
      objc_msgSend(v64, "setFrame:", 0.0, v69);
    }
  }
  BOOL v70 = v55 == *(double *)(MEMORY[0x1E4FB2848] + 8);
  if (v53 != *MEMORY[0x1E4FB2848]) {
    BOOL v70 = 0;
  }
  if (v59 != *(double *)(MEMORY[0x1E4FB2848] + 24)) {
    BOOL v70 = 0;
  }
  BOOL v71 = v57 == *(double *)(MEMORY[0x1E4FB2848] + 16) && v70;
  v72 = [(PUTileViewController *)self _maskView];
  if (!v72 && !v71)
  {
    id v73 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v86 bounds];
    v72 = objc_msgSend(v73, "initWithFrame:");
    v74 = [MEMORY[0x1E4FB1618] whiteColor];
    [v72 setBackgroundColor:v74];

    [v72 setOpaque:1];
    [v86 setMaskView:v72];
    [(PUTileViewController *)self _setMaskView:v72];
  }
  if (v72)
  {
    [v86 bounds];
    objc_msgSend(v72, "setFrame:", v55 + v75, v53 + v76, v77 - (v55 + v59), v78 - (v53 + v57));
  }
  v90.receiver = self;
  v90.super_class = (Class)PUTileViewController;
  [(PUTileController *)&v90 applyLayoutInfo:v19];
}

void __40__PUTileViewController_applyLayoutInfo___block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 layer];
  [*(id *)(a1 + 32) cornerRadius];
  double v4 = v3;
  id v5 = [*(id *)(a1 + 32) cornerCurve];
  uint64_t v6 = [*(id *)(a1 + 32) cornerMask];
  [v8 setCornerCurve:v5];
  if (v6 && [v8 maskedCorners] != v6) {
    [v8 setMaskedCorners:v6];
  }
  [v8 cornerRadius];
  if (v4 != v7) {
    [v8 setCornerRadius:v4];
  }
}

- (BOOL)isPresentationActive
{
  v2 = [(PUTileViewController *)self view];
  double v3 = [v2 layer];
  double v4 = [v3 presentationLayer];

  return v4 != 0;
}

- (id)presentationLayoutInfo
{
  v37.receiver = self;
  v37.super_class = (Class)PUTileViewController;
  double v4 = [(PUTileController *)&v37 presentationLayoutInfo];
  if (!v4)
  {
    double v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PUTileViewController.m" lineNumber:226 description:@"missing layout info"];
  }
  id v5 = [(PUTileViewController *)self view];
  if (!v5)
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PUTileViewController.m" lineNumber:229 description:@"missing view"];
  }
  uint64_t v6 = [v5 layer];
  double v7 = [v6 presentationLayer];
  id v8 = v7;
  if (!v7 || [v7 isHidden])
  {
    id v9 = v6;

    id v8 = v9;
  }
  [v8 position];
  double v11 = v10;
  double v13 = v12;
  [v8 bounds];
  double v15 = v14;
  double v17 = v16;
  [v8 opacity];
  float v19 = v18;
  long long v20 = 0uLL;
  memset(&v36, 0, sizeof(v36));
  if (v8)
  {
    [v8 transform];
    long long v20 = 0uLL;
  }
  *(_OWORD *)&v35.c = v20;
  *(_OWORD *)&v35.tCGFloat x = v20;
  *(_OWORD *)&v35.a = v20;
  CATransform3D v34 = v36;
  CATransform3DGetAffineTransform(&v35, &v34);
  double m43 = v36.m43;
  uint64_t v22 = [(PUTileController *)self tilingView];
  if (!v22)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"PUTileViewController.m" lineNumber:245 description:@"missing tiling view"];
  }
  uint64_t v23 = [v22 fixedCoordinateSystem];
  uint64_t v24 = [v22 contentCoordinateSystem];
  double v25 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v24, v23, v11, v13);
  double v27 = v26;

  uint64_t v28 = [(PUTileController *)self layoutInfo];
  *(_OWORD *)&v34.m11 = *(_OWORD *)&v35.a;
  *(_OWORD *)&v34.m13 = *(_OWORD *)&v35.c;
  *(_OWORD *)&v34.m21 = *(_OWORD *)&v35.tx;
  uint64_t v29 = objc_msgSend(v28, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v34, v23, v25, v27, v15, v17, v19, m43);

  return v29;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PUTileViewController;
  [(PUTileController *)&v4 prepareForReuse];
  double v3 = [(PUTileViewController *)self view];
  [v3 setHidden:0];

  [(PUTileViewController *)self _updateTintView];
  [(PUTileViewController *)self _handleReadinessForced:1];
}

- (void)becomeReusable
{
  v4.receiver = self;
  v4.super_class = (Class)PUTileViewController;
  [(PUTileController *)&v4 becomeReusable];
  [(PUTileViewController *)self setIsOnPrimaryDisplay:0];
  double v3 = [(PUTileViewController *)self view];
  [v3 setHidden:1];

  [(PUTileViewController *)self _invalidateTintView];
  [(PUTileViewController *)self _setEdgeAntialiasingEnabled:0];
  [(PUTileController *)self setShouldPreserveCurrentContent:0];
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (NSArray)gestureRecognizers
{
  if (![(PUTileViewController *)self isViewLoaded]) {
    id v3 = [(PUTileViewController *)self loadView];
  }
  gestureRecognizers = self->_gestureRecognizers;
  return gestureRecognizers;
}

- (void)setIsOnPrimaryDisplay:(BOOL)a3
{
  if (self->_isOnPrimaryDisplay != a3)
  {
    self->_isOnPrimaryDisplaCGFloat y = a3;
    [(PUTileViewController *)self didChangeIsOnPrimaryDisplay];
  }
}

- (UIView)originalView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUTileViewController *)self view];
  if ([(PUTileViewController *)self isContentViewEnabled])
  {
    objc_super v4 = [v3 subviews];
    [v4 count];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v11 = v10;

            id v3 = v11;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return (UIView *)v3;
}

- (void)setContentViewEnabled:(BOOL)a3
{
  if (self->_contentViewEnabled != a3)
  {
    BOOL v3 = a3;
    self->_contentViewEnabled = a3;
    if ([(PUTileViewController *)self isViewLoaded])
    {
      id v20 = [(PUTileViewController *)self view];
      uint64_t v6 = [(PUTileViewController *)self view];
      uint64_t v7 = [v6 isHidden];

      if (v3)
      {
        uint64_t v8 = [v20 superview];
        id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        [v20 frame];
        double v10 = objc_msgSend(v9, "initWithFrame:");
        [v10 setClipsToBounds:1];
        [v20 removeFromSuperview];
        [v10 bounds];
        objc_msgSend(v20, "setFrame:");
        [v20 setAutoresizingMask:18];
        [v20 setHidden:0];
        [v10 addSubview:v20];
        [v8 addSubview:v10];
        [(PUTileViewController *)self _setView:v10];
        [(PUTileViewController *)self _setContentView:v10];
      }
      else
      {
        id v11 = [v20 subviews];
        uint64_t v12 = [v11 count];

        if (v12 != 1)
        {
          uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"PUTileViewController.m" lineNumber:137 description:@"Only able to disable contentView if there is a single child view available to promote."];
        }
        id v13 = [(PUTileViewController *)self contentView];

        long long v14 = v20;
        if (v20 != v13)
        {
          float v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:a2, self, @"PUTileViewController.m", 138, @"Invalid parameter not satisfying: %@", @"view == [self contentView]" object file lineNumber description];

          long long v14 = v20;
        }
        long long v15 = [v14 subviews];
        uint64_t v8 = [v15 lastObject];

        [v8 removeFromSuperview];
        [v20 frame];
        objc_msgSend(v8, "setFrame:");
        [v20 removeFromSuperview];
        long long v16 = [(PUTileController *)self tilingView];
        [v16 addSubview:v8];

        [(PUTileViewController *)self _setView:v20];
        [(PUTileViewController *)self _setContentView:0];
      }

      double v17 = [(PUTileViewController *)self view];
      [v17 setHidden:v7];
    }
  }
}

- (UIView)viewIfLoaded
{
  return self->_view;
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    if ([(PUTileViewController *)self _isLoadingView])
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PUTileViewController.m", 83, @"Tried to access the view property while it is loading, which isn't supported." object file lineNumber description];
    }
    [(PUTileViewController *)self _setLoadingView:1];
    id v5 = [(PUTileViewController *)self loadView];
    [(PUTileViewController *)self _setLoadedView:v5];
    if ([(PUTileViewController *)self isContentViewEnabled])
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [v5 frame];
      uint64_t v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      [(UIView *)v7 setClipsToBounds:1];
      [(UIView *)v7 bounds];
      objc_msgSend(v5, "setFrame:");
      [v5 setAutoresizingMask:18];
      [(UIView *)v7 addSubview:v5];
    }
    else
    {
      uint64_t v7 = v5;
    }
    uint64_t v8 = self->_view;
    self->_view = v7;

    [(PUTileViewController *)self _setLoadingView:0];
    [(PUTileViewController *)self _updateTintView];
    [(PUTileViewController *)self _updateVisibleRectView];
    [(PUTileViewController *)self viewDidLoad];

    view = self->_view;
  }
  return view;
}

- (id)loadView
{
  if (self->_view)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUTileViewController.m", 76, @"Invalid parameter not satisfying: %@", @"_view == nil" object file lineNumber description];
  }
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  BOOL v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

- (void)addToTilingView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUTileViewController *)self view];
  [v4 addSubview:v5];
  id v6 = [(PUTileViewController *)self gestureRecognizers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addGestureRecognizer:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)dealloc
{
  BOOL v3 = [(PUTileViewController *)self _onReadyToDisplayBlock];
  id v4 = v3;
  if (v3)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __31__PUTileViewController_dealloc__block_invoke;
    uint64_t v10 = &unk_1E5F2EBA0;
    id v11 = v3;
    px_dispatch_on_main_queue();
  }
  [(PUTileViewController *)self _setOnReadyToDisplayBlock:0];
  id v5 = [(PUTileViewController *)self _readinessTimer];
  [v5 invalidate];

  [(PUTileViewController *)self _setReadinessTimer:0];
  v6.receiver = self;
  v6.super_class = (Class)PUTileViewController;
  [(PUTileViewController *)&v6 dealloc];
}

uint64_t __31__PUTileViewController_dealloc__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end