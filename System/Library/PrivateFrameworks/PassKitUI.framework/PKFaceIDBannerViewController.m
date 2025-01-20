@interface PKFaceIDBannerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isBannerDetached;
- (BOOL)prefersFixedPortraitOrientation;
- (BOOL)preventsInteractiveDismissal;
- (NSString)associatedAppBundleIdentifier;
- (NSURL)launchURL;
- (PKBannerHandleState)bannerState;
- (PKBannerViewControllerPresentable)presentable;
- (PKFaceIDBannerViewController)init;
- (PKFaceIDBannerViewController)initWithCoder:(id)a3;
- (PKFaceIDBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredCustomLayout;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)_cancelRevokeTimer;
- (void)_revoke;
- (void)_revoked;
- (void)_updateGlyphState;
- (void)_updateKeyColor;
- (void)_updatePreferredContentSize;
- (void)_updateState;
- (void)dealloc;
- (void)loadView;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setBannerDetached:(BOOL)a3;
- (void)setBannerState:(id)a3;
- (void)setPresentable:(id)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation PKFaceIDBannerViewController

- (PKFaceIDBannerViewController)init
{
  return 0;
}

- (PKFaceIDBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKFaceIDBannerViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  [(LAUIPearlGlyphView *)self->_glyphView invalidate];
  revokeTimer = self->_revokeTimer;
  if (revokeTimer) {
    dispatch_source_cancel(revokeTimer);
  }
  if (self->_revokeBackgroundTask != *MEMORY[0x1E4FB2748])
  {
    v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v4 endBackgroundTask:self->_revokeBackgroundTask];
  }
  glyphLegibilityTimer = self->_glyphLegibilityTimer;
  if (glyphLegibilityTimer) {
    dispatch_source_cancel(glyphLegibilityTimer);
  }
  v6.receiver = self;
  v6.super_class = (Class)PKFaceIDBannerViewController;
  [(PKFaceIDBannerViewController *)&v6 dealloc];
}

- (void)loadView
{
  v18.receiver = self;
  v18.super_class = (Class)PKFaceIDBannerViewController;
  [(PKFaceIDBannerViewController *)&v18 loadView];
  v3 = [(PKFaceIDBannerViewController *)self view];
  [v3 setAutoresizingMask:0];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  v5 = (void *)[MEMORY[0x1E4F72FD0] createSystemApertureConfiguration];
  [v5 setInitialStyle:4];
  objc_super v6 = (LAUIPearlGlyphView *)[objc_alloc(MEMORY[0x1E4F72FD8]) initWithConfiguration:v5];
  glyphView = self->_glyphView;
  self->_glyphView = v6;

  v8 = self->_glyphView;
  if (v8
    && ([(LAUIPearlGlyphView *)v8 setFaceVisibility:7 animated:0],
        [(LAUIPearlGlyphView *)self->_glyphView setShakeEnabled:0],
        [(LAUIPearlGlyphView *)self->_glyphView setInApplicationContext:1],
        self->_glyphState < 5uLL))
  {
    -[LAUIPearlGlyphView setState:animated:](self->_glyphView, "setState:animated:");
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = self->_containerView;
    self->_containerView = v9;

    [(UIView *)self->_containerView setOpaque:0];
    v11 = self->_containerView;
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v11 setBackgroundColor:v12];

    [v3 addSubview:self->_containerView];
    v13 = objc_alloc_init(PKBlurView);
    glyphContainerView = self->_glyphContainerView;
    self->_glyphContainerView = v13;

    -[PKBlurView setAnchorPoint:](self->_glyphContainerView, "setAnchorPoint:", 0.5, 0.0);
    [(PKBlurView *)self->_glyphContainerView setOpaque:0];
    v15 = self->_glyphContainerView;
    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKBlurView *)v15 setBackgroundColor:v16];

    [(PKBlurView *)self->_glyphContainerView addSubview:self->_glyphView];
    [(UIView *)self->_containerView addSubview:self->_glyphContainerView];
    v17 = [(UIView *)self->_containerView layer];
    [v17 setAllowsHitTesting:0];

    [(UIView *)self->_containerView setUserInteractionEnabled:0];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)PKFaceIDBannerViewController;
  [(PKFaceIDBannerViewController *)&v55 viewWillLayoutSubviews];
  int64_t activeLayoutMode = self->_activeLayoutMode;
  if (activeLayoutMode == 4 || activeLayoutMode == 1)
  {
    v5 = [(PKFaceIDBannerViewController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = objc_msgSend(v5, "SBUISA_systemApertureObstructedAreaLayoutGuide");
    [v14 layoutFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    containerView = self->_containerView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](containerView, "setFrame:");
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", v5, v7, v9, v11, v13);
    double v25 = v24;
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", v5, v16, v18, v20, v22);
    double v27 = v26;
    double v29 = v28;

    unsigned int state = self->_state;
    if (state >= 7)
    {
      __break(1u);
    }
    else
    {
      unint64_t v31 = self->_activeLayoutMode;
      double v32 = *MEMORY[0x1E4F1DAD8];
      double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v34 = 69.0;
      -[PKBlurView setBounds:](self->_glyphContainerView, "setBounds:", *MEMORY[0x1E4F1DAD8], v33, 69.0, 69.0);
      -[LAUIPearlGlyphView setFrame:](self->_glyphView, "setFrame:", v32, v33, 69.0, 69.0);
      v37.n128_u64[1] = 0;
      memset(&v54, 0, sizeof(v54));
      if (v31 < 2 || ((0x47u >> state) & 1) != 0)
      {
        v37.n128_u64[0] = 0x4022286C43F5F916;
        v35.n128_u64[0] = 0x4022286C43F5F916;
        PKSizeRoundToPixel(v37, v35, v36);
        double v34 = v45;
        double v44 = v46;
        CATransform3DMakeScale(&v54, 0.131579, 0.131579, 1.0);
        double v43 = 0.0;
        double v42 = 66.6666667;
      }
      else
      {
        long long v38 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        *(_OWORD *)&v54.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        *(_OWORD *)&v54.m33 = v38;
        long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        *(_OWORD *)&v54.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        *(_OWORD *)&v54.m43 = v39;
        long long v40 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        *(_OWORD *)&v54.m11 = *MEMORY[0x1E4F39B10];
        *(_OWORD *)&v54.m13 = v40;
        long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        *(_OWORD *)&v54.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        *(_OWORD *)&v54.m23 = v41;
        double v42 = 0.0;
        double v43 = 1.0;
        double v44 = 69.0;
      }
      [(PKBlurView *)self->_glyphContainerView setAlpha:v43];
      glyphContainerView = self->_glyphContainerView;
      CATransform3D v53 = v54;
      [(PKBlurView *)glyphContainerView setTransform3D:&v53];
      [(PKBlurView *)self->_glyphContainerView setBlurRadius:v42];
      PKFloatRoundToPixel();
      double v49 = v25 + v48;
      v50 = self->_glyphContainerView;
      [(PKBlurView *)v50 anchorPoint];
      -[PKBlurView setCenter:](v50, "setCenter:", v49 + v51 * v34, v27 + v29 + v52 * v44);
    }
  }
}

- (void)_cancelRevokeTimer
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 1008);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 1008);
      *(void *)(a1 + 1008) = 0;
    }
    uint64_t v4 = *MEMORY[0x1E4FB2748];
    if (*(void *)(a1 + 1000) != *MEMORY[0x1E4FB2748])
    {
      v5 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v5 endBackgroundTask:*(void *)(a1 + 1000)];

      *(void *)(a1 + 1000) = v4;
    }
  }
}

void __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PKFaceIDBannerViewController _revoke]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)_revoke
{
  if (!*(unsigned char *)(a1 + 992))
  {
    uint64_t v2 = *(void *)(a1 + 1000);
    uint64_t v3 = *MEMORY[0x1E4FB2748];
    *(void *)(a1 + 1000) = *MEMORY[0x1E4FB2748];
    -[PKFaceIDBannerViewController _revoked](a1);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1096));
    [WeakRetained revoke];

    if (v2 != v3)
    {
      id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v5 endBackgroundTask:v2];
    }
  }
}

void __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PKFaceIDBannerViewController _revoke]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)_revoked
{
  if (a1 && !*(unsigned char *)(a1 + 992))
  {
    *(unsigned char *)(a1 + 992) = 1;
    [*(id *)(a1 + 1080) invalidate];
    -[PKFaceIDBannerViewController _cancelRevokeTimer](a1);
  }
}

- (void)_updateState
{
  if (val && !*((unsigned char *)val + 992))
  {
    int v2 = val[244];
    BOOL v3 = v2 == 3 || v2 == 6;
    if (v3 || v2 == 0)
    {
      BOOL v5 = !*((unsigned char *)val + 1088) || *((unsigned char *)val + 1020) || val[261] != 0;
      if (v2 == 3)
      {
        if (!v5 && !val[260])
        {
          id v9 = [val viewIfLoaded];
          if (v9)
          {
            [v9 bounds];
            objc_msgSend(val, "setPreferredContentSize:", v6, v7);
          }
          val[244] = 4;
          -[PKFaceIDBannerViewController _updatePreferredContentSize](val);
        }
      }
      else if (v2 == 6 || v2 == 0)
      {
        if (v5)
        {
          if (v2 == 6)
          {
            val[244] = 1;
            -[PKFaceIDBannerViewController _updatePreferredContentSize](val);
          }
        }
        else if (!val[260])
        {
          -[PKFaceIDBannerViewController _revoke]((uint64_t)val);
        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

- (void)_updatePreferredContentSize
{
  unsigned int v1 = val[244];
  if (v1 <= 6 && ((1 << v1) & 0x36) != 0)
  {
    if (!*((unsigned char *)val + 1018))
    {
      *((unsigned char *)val + 1018) = 1;
      *((unsigned char *)val + 1019) = 0;
      objc_initWeak(&location, val);
      BOOL v3 = [val systemApertureElementContext];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke;
      v4[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v5, &location);
      [v3 setElementNeedsUpdateWithCoordinatedAnimations:v4];

      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    __break(1u);
  }
}

void __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      uint64_t v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 134217984;
        double v6 = WeakRetained;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): appeared.", (uint8_t *)&v5, 0xCu);
      }

      --WeakRetained[260];
      if (*(unsigned char *)(a1 + 48)) {
        *((unsigned char *)WeakRetained + 1017) = 1;
      }
      -[PKFaceIDBannerViewController _updateGlyphState]((uint64_t)WeakRetained);
      -[PKFaceIDBannerViewController _updateState](WeakRetained);
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
  }
}

- (void)_updateGlyphState
{
  if (a1 && !*(void *)(a1 + 1032))
  {
    uint64_t v2 = [*(id *)(a1 + 984) glyphState];
    if (*(_DWORD *)(a1 + 976) && *(void *)(a1 + 1024) == 2 && *(unsigned char *)(a1 + 1017))
    {
      int v3 = *(char *)(a1 + 1020);
      if (v3 == 2)
      {
        uint64_t v5 = 4;
      }
      else
      {
        BOOL v4 = v3 == 1;
        uint64_t v5 = 3;
        if (!v4) {
          uint64_t v5 = v2;
        }
      }
      *(unsigned char *)(a1 + 1020) = 0;
    }
    else
    {
      uint64_t v5 = 2;
      if (!*(unsigned char *)(a1 + 1020)) {
        uint64_t v5 = v2;
      }
    }
    if (*(void *)(a1 + 1024) != v5)
    {
      *(void *)(a1 + 1024) = v5;
      -[PKFaceIDBannerViewController _updateKeyColor](a1);
      if ([(id)a1 isViewLoaded])
      {
        unint64_t v6 = *(void *)(a1 + 1024);
        if (*(_DWORD *)(a1 + 976))
        {
          if (v6 - 3 >= 2)
          {
            double v7 = 0.0;
            if (v6 == 2) {
              double v7 = dbl_1A0445D80[*(_DWORD *)(a1 + 1040) == 0];
            }
          }
          else
          {
            double v7 = 0.45;
          }
          ++*(_DWORD *)(a1 + 1044);
          -[PKFaceIDBannerViewController _updateState]((_DWORD *)a1);
          objc_initWeak(&location, (id)a1);
          if (v7 <= 0.0)
          {
            double v8 = 0;
          }
          else
          {
            double v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 3221225472;
            handler[2] = __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_2;
            handler[3] = &unk_1E59CB128;
            objc_copyWeak(&v19, &location);
            id v18 = &__block_literal_global_249;
            dispatch_source_set_event_handler(v8, handler);
            objc_storeStrong((id *)(a1 + 1032), v8);

            objc_destroyWeak(&v19);
          }
          unint64_t v9 = *(void *)(a1 + 1024);
          if (v9 == 4)
          {
            double v10 = [(id)a1 systemApertureElementContext];
            [v10 requestNegativeResponseAnimation];

            unint64_t v9 = *(void *)(a1 + 1024);
          }
          if (v9 < 5)
          {
            double v11 = *(void **)(a1 + 1080);
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v13[2] = __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_3;
            v13[3] = &unk_1E59E0B80;
            objc_copyWeak(v16, &location);
            double v12 = v8;
            v16[1] = *(id *)&v7;
            v14 = v12;
            id v15 = &__block_literal_global_249;
            [v11 setState:v9 animated:1 withCompletion:v13];

            objc_destroyWeak(v16);
            objc_destroyWeak(&location);
            return;
          }
        }
        else if (v6 < 5)
        {
          objc_msgSend(*(id *)(a1 + 1080), "setState:animated:");
          return;
        }
        __break(1u);
      }
    }
  }
}

void __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  int v3 = v2;
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v4 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_2;
    v11[3] = &unk_1E59CA7D0;
    id v12 = v2;
    [v4 performWithoutAnimation:v11];
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    double v8 = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_3;
    unint64_t v9 = &unk_1E59CAA98;
    id v10 = *(id *)(a1 + 40);
    dispatch_after(v5, MEMORY[0x1E4F14428], &v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 976) = 3;
  *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 1;
  objc_msgSend(v3, "setNeedsLayout", v6, v7, v8, v9);
  [v3 layoutIfNeeded];
  *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 0;
  if (*(unsigned char *)(a1 + 48)) {
    -[PKFaceIDBannerViewController _updateGlyphState](*(void *)(a1 + 32));
  }
}

uint64_t __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
}

uint64_t __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 976) = 6;
  *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 1;
  [*(id *)(a1 + 40) setNeedsLayout];
  uint64_t result = [*(id *)(a1 + 40) layoutIfNeeded];
  *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 0;
  return result;
}

void __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134217984;
      BOOL v4 = WeakRetained;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): shrunk.", (uint8_t *)&v3, 0xCu);
    }

    --WeakRetained[260];
    -[PKFaceIDBannerViewController _updateState](WeakRetained);
  }
}

- (void)_updateKeyColor
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 1024);
    if (v2 == 3 || v2 != 4 && ((int v3 = *(unsigned __int8 *)(a1 + 1020), v3 == 1) || v3 != 2 && v2)) {
      id v4 = *(id *)(a1 + 1056);
    }
    else {
      id v4 = 0;
    }
    if (*(id *)(a1 + 1048) != v4)
    {
      id v6 = v4;
      objc_storeStrong((id *)(a1 + 1048), v4);
      if (*(unsigned char *)(a1 + 1018))
      {
        *(unsigned char *)(a1 + 1019) = 1;
      }
      else
      {
        uint64_t v5 = [(id)a1 systemApertureElementContext];
        [v5 setElementNeedsUpdate];
      }
      id v4 = v6;
    }
  }
}

void __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[992])
  {
    int v3 = 5;
    switch(*((_DWORD *)WeakRetained + 244))
    {
      case 1:
        int v3 = 2;
        goto LABEL_5;
      case 2:
      case 5:
        goto LABEL_6;
      case 4:
LABEL_5:
        *((_DWORD *)WeakRetained + 244) = v3;
LABEL_6:
        objc_msgSend(WeakRetained, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        v2[1018] = 0;
        if (v2[1019])
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke_2;
          block[3] = &unk_1E59CA7D0;
          void block[4] = v2;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
        break;
      default:
        __break(1u);
        JUMPOUT(0x1A0393560);
    }
  }
}

void __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 1018) && *(unsigned char *)(v1 + 1019))
  {
    *(unsigned char *)(v1 + 1019) = 0;
    id v2 = [*(id *)(a1 + 32) systemApertureElementContext];
    [v2 setElementNeedsUpdate];
  }
}

void __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke(uint64_t a1, void *a2)
{
  val = a2;
  --val[261];
  -[PKFaceIDBannerViewController _updateGlyphState]((uint64_t)val);
  id v2 = val;
  if (!val[261])
  {
    -[PKFaceIDBannerViewController _updateState](val);
    id v2 = val;
  }
}

void __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    dispatch_source_cancel(WeakRetained[129]);
    dispatch_source_t v3 = v4[129];
    v4[129] = 0;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v4;
  }
}

void __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_source_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(NSObject **)(a1 + 32);
    id v6 = WeakRetained;
    if (v4)
    {
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      dispatch_activate(*(dispatch_object_t *)(a1 + 32));
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    dispatch_source_t v3 = v6;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPresentable:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_presentable, v5);
  id v4 = v5;
  if (v5 && self->_revoked)
  {
    [v5 revoke];
    id v4 = v5;
  }
}

- (void)setBannerDetached:(BOOL)a3
{
  if (self->_bannerDetached != a3)
  {
    self->_bannerDetached = a3;
    if (a3)
    {
      if (!self->_revoked)
      {
        -[PKFaceIDBannerViewController _cancelRevokeTimer]((uint64_t)self);
        objc_initWeak(&location, self);
        id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke;
        v12[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v13, &location);
        self->_revokeBackgroundTask = [v4 beginBackgroundTaskWithName:@"face_id.revoke" expirationHandler:v12];

        id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
        revokeTimer = self->_revokeTimer;
        self->_revokeTimer = v5;

        uint64_t v7 = self->_revokeTimer;
        dispatch_time_t v8 = dispatch_time(0, 10000000000);
        dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
        unint64_t v9 = self->_revokeTimer;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_3;
        handler[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v11, &location);
        dispatch_source_set_event_handler(v9, handler);
        dispatch_resume((dispatch_object_t)self->_revokeTimer);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[PKFaceIDBannerViewController _cancelRevokeTimer]((uint64_t)self);
    }
    -[PKFaceIDBannerViewController _updateState](self);
  }
}

- (PKBannerHandleState)bannerState
{
  return self->_bannerState;
}

- (void)setBannerState:(id)a3
{
  id v5 = (PKFaceIDBannerHandleState *)a3;
  if (v5)
  {
    dispatch_time_t v8 = v5;
    if ([(PKFaceIDBannerHandleState *)v5 type] != 1)
    {
      __break(1u);
      return;
    }
    id v5 = v8;
    if (self->_bannerState != v8)
    {
      objc_storeStrong((id *)&self->_bannerState, a3);
      uint64_t v6 = [(PKFaceIDBannerHandleState *)self->_bannerState glyphState];
      if (v6 == 3)
      {
        char v7 = 1;
      }
      else
      {
        if (v6 != 4)
        {
LABEL_9:
          -[PKFaceIDBannerViewController _updateGlyphState]((uint64_t)self);
          id v5 = v8;
          goto LABEL_10;
        }
        char v7 = 2;
      }
      self->_deferredGlyphState = v7;
      -[PKFaceIDBannerViewController _updateKeyColor]((uint64_t)self);
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (int64_t)contentRole
{
  return 1;
}

- (BOOL)prefersFixedPortraitOrientation
{
  return 1;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredCustomLayout
{
  return self->_state < 4u;
}

- (NSString)associatedAppBundleIdentifier
{
  return 0;
}

- (NSURL)launchURL
{
  return 0;
}

- (unint64_t)presentationBehaviors
{
  return 74;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  if (self->_activeLayoutMode != a3)
  {
    id v5 = [(PKFaceIDBannerViewController *)self viewIfLoaded];
    id v10 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      self->_int64_t activeLayoutMode = a3;
      uint64_t v6 = [(PKFaceIDBannerViewController *)self systemApertureElementContext];
      char v7 = [v6 requestAlertingAssertion];
      [v7 setAutomaticallyInvalidatable:0];

      [v10 setNeedsLayout];
    }
    else
    {
      self->_int64_t activeLayoutMode = a3;
      dispatch_time_t v8 = [(PKFaceIDBannerViewController *)self systemApertureElementContext];
      unint64_t v9 = [v8 requestAlertingAssertion];
      [v9 setAutomaticallyInvalidatable:0];
    }
  }
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  if (self->_revoked) {
    goto LABEL_20;
  }
  int state = self->_state;
  if (!state)
  {
LABEL_5:
    id v5 = v18;
    if ((self->_state & 0xFFFFFFFD) == 0)
    {
      uint64_t v6 = v5;
      if (v5)
      {
        int64_t activeLayoutMode = self->_activeLayoutMode;
        dispatch_time_t v8 = PKLogFacilityTypeGetObject();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        if (activeLayoutMode == 4)
        {
          if (v9)
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = self;
            _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): appearing.", buf, 0xCu);
          }

          ++self->_transitionAnimationCounter;
          BOOL v10 = self->_state == 0;
          objc_initWeak(&location, self);
          v28[0] = 0;
          v28[1] = v28;
          v28[2] = 0x2020000000;
          char v29 = 0;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke;
          double v32 = &unk_1E59CFCE0;
          double v33 = (PKFaceIDBannerViewController *)v28;
          objc_copyWeak(&v34, &location);
          BOOL v35 = v10;
          id v11 = _Block_copy(buf);
          uint64_t v21 = MEMORY[0x1E4F143A8];
          uint64_t v22 = 3221225472;
          v23 = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_14;
          double v24 = &unk_1E59E0B38;
          double v25 = self;
          BOOL v27 = v10;
          id v26 = v11;
          from[0] = (id)MEMORY[0x1E4F143A8];
          from[1] = (id)3221225472;
          from[2] = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_4;
          from[3] = &unk_1E59D04E8;
          id v12 = v26;
          id v20 = v12;
          [v6 animateAlongsideTransition:&v21 completion:from];

          objc_destroyWeak(&v34);
          _Block_object_dispose(v28, 8);
          objc_destroyWeak(&location);
        }
        else
        {
          if (v9)
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = activeLayoutMode;
            _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): deferring apperance while in mode %ld.", buf, 0x16u);
          }
        }
        goto LABEL_20;
      }
    }
LABEL_23:
    __break(1u);
  }
  if (state != 5)
  {
    if (state != 2) {
      goto LABEL_20;
    }
    goto LABEL_5;
  }
  id v13 = v18;
  if (self->_state != 5) {
    goto LABEL_23;
  }
  v14 = v13;
  if (!v13) {
    goto LABEL_23;
  }
  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): shrinking.", buf, 0xCu);
  }

  ++self->_transitionAnimationCounter;
  double v16 = [(PKFaceIDBannerViewController *)self view];
  objc_initWeak(from, self);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke;
  double v32 = &unk_1E59DC118;
  double v33 = self;
  id v17 = v16;
  id v34 = v17;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2;
  double v24 = &unk_1E59D63E0;
  objc_copyWeak((id *)&v25, from);
  [v14 animateAlongsideTransition:buf completion:&v21];
  objc_destroyWeak((id *)&v25);

  objc_destroyWeak(from);
LABEL_20:
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return 0;
}

- (PKBannerViewControllerPresentable)presentable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentable);

  return (PKBannerViewControllerPresentable *)WeakRetained;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (BOOL)isBannerDetached
{
  return self->_bannerDetached;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentable);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_glyphContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_successKeyColor, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_glyphLegibilityTimer, 0);
  objc_storeStrong((id *)&self->_revokeTimer, 0);

  objc_storeStrong((id *)&self->_bannerState, 0);
}

@end