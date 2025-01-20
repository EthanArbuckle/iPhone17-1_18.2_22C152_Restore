@interface PKPassView
- (BOOL)_visibleFaceShouldClipForCurrentViewMode:(double *)a3;
- (BOOL)canShowBarcode;
- (BOOL)frontFaceBodyContentCreated;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isFrontFaceExpanded;
- (BOOL)isModallyPresented;
- (BOOL)isPaused;
- (CGRect)frameOfVisibleFace;
- (CGSize)sizeOfFront;
- (CGSize)sizeOfFrontFace;
- (NSString)uniqueID;
- (PKAccount)associatedAccount;
- (PKPass)pass;
- (PKPassDynamicState)passState;
- (PKPassFaceViewRendererState)rendererState;
- (PKPassView)initWithPass:(id)a3;
- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4;
- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4 suppressedContent:(unint64_t)a5;
- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4 suppressedContent:(unint64_t)a5 rendererState:(id)a6;
- (PKPassViewDelegate)delegate;
- (double)modalShadowVisibility;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)observers;
- (id)snapshotOfFrontFace;
- (id)snapshotOfFrontFaceWithRequestedSize:(CGSize)a3;
- (id)snapshotOfPassView;
- (id)snapshotViewOfVisibleFaceAfterScreenUpdates:(BOOL)a3;
- (int64_t)_frontFaceBackgroundModeForContentMode;
- (int64_t)contentMode;
- (unint64_t)_regionsForCurrentModes;
- (unint64_t)suppressedContent;
- (void)_applyContentMode:(BOOL)a3;
- (void)_updateFrontFaceSuppressedContent;
- (void)_updateHighEndLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4;
- (void)_updateLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4;
- (void)_updateLowEndLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4;
- (void)addPassViewObserver:(id)a3;
- (void)dealloc;
- (void)didAuthenticate;
- (void)didTransact;
- (void)drawFrontFaceAtSize:(CGSize)a3;
- (void)invalidate;
- (void)layoutSubviews;
- (void)passFaceViewExpandButtonTapped:(id)a3;
- (void)passcodeLockManager:(id)a3 didReceivePasscodeSet:(BOOL)a4;
- (void)presentDiff:(id)a3 completion:(id)a4;
- (void)removePassViewObserver:(id)a3;
- (void)setAssociatedAccount:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setContentMode:(int64_t)a3 animated:(BOOL)a4 withDelay:(double)a5;
- (void)setDelegate:(id)a3;
- (void)setDimmer:(double)a3 animated:(BOOL)a4;
- (void)setFrontFaceExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setModalShadowVisibility:(double)a3;
- (void)setModalShadowVisibility:(double)a3 animated:(BOOL)a4;
- (void)setModalShadowVisibility:(double)a3 animated:(BOOL)a4 withDelay:(double)a5;
- (void)setModallyPresented:(BOOL)a3;
- (void)setPassState:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPaymentBarcodeData:(id)a3;
- (void)setSuppressedContent:(unint64_t)a3;
- (void)tapRecognized:(id)a3;
- (void)updateValidityDisplay;
@end

@implementation PKPassView

- (CGSize)sizeOfFront
{
  [(PKPassFrontFaceView *)self->_frontFace contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPass)pass
{
  return self->_pass;
}

- (CGSize)sizeOfFrontFace
{
  [(PKPass *)self->_pass style];

  PKPassFrontFaceContentSize();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_applyContentMode:(BOOL)a3
{
  v4 = (void *)MEMORY[0x1A6224460](self, a2, a3);
  if ([(PKPass *)self->_pass passType] == PKPassTypeSecureElement) {
    pass = self->_pass;
  }
  else {
    pass = 0;
  }
  v6 = pass;
  [(PKPassFaceView *)self->_frontFace setBackgroundMode:[(PKPassView *)self _frontFaceBackgroundModeForContentMode]];
  [(PKPassFaceView *)self->_frontFace setVisibleRegions:[(PKPassView *)self _regionsForCurrentModes]];
  v7 = [(PKPass *)v6 dynamicLayerConfiguration];

  int64_t contentMode = self->_contentMode;
  BOOL v9 = contentMode == 5;
  BOOL v10 = contentMode > 2;
  if (v7) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = v9;
  }
  [(PKPassFaceView *)self->_frontFace setLiveMotionEnabled:v11];
  if (self->_contentMode < 2 || self->_contentLoaded) {
    goto LABEL_16;
  }
  if ([(PKPass *)self->_pass isContentLoaded])
  {
    self->_contentLoaded = 1;
LABEL_15:
    [(PKPassFaceView *)self->_frontFace createContentViewsWithFade:0];
    goto LABEL_16;
  }
  if (self->_contentMode > 3)
  {
    self->_contentLoaded = 1;
    [(PKPass *)self->_pass loadContentSync];
    goto LABEL_15;
  }
  if (!self->_contentLoading)
  {
    self->_contentLoading = 1;
    objc_initWeak(&location, self);
    v12 = self->_pass;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __32__PKPassView__applyContentMode___block_invoke;
    v18 = &unk_1E59CA7F8;
    objc_copyWeak(&v19, &location);
    [(PKPass *)v12 loadContentAsyncWithCompletion:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
LABEL_16:
  id location = 0;
  BOOL v13 = -[PKPassView _visibleFaceShouldClipForCurrentViewMode:](self, "_visibleFaceShouldClipForCurrentViewMode:", &location, v15, v16, v17, v18);
  frontFace = self->_frontFace;
  if (v13)
  {
    [(PKPassFaceView *)frontFace setClipsContent:1];
    [(PKPassFaceView *)self->_frontFace setClippedContentHeight:*(double *)&location];
  }
  else
  {
    [(PKPassFaceView *)frontFace setClipsContent:0];
  }
  [(PKPassView *)self setNeedsLayout];
}

- (BOOL)_visibleFaceShouldClipForCurrentViewMode:(double *)a3
{
  int64_t contentMode = self->_contentMode;
  if (contentMode == 2)
  {
    double v7 = 80.0;
  }
  else
  {
    if (contentMode != 1) {
      return 0;
    }
    [(PKPass *)self->_pass style];
    PKPassFaceSliverHeight();
    double v7 = v6;
  }
  [(PKPassFrontFaceView *)self->_frontFace contentSize];
  if (v8 <= v7) {
    return 0;
  }
  if (a3) {
    *a3 = v7;
  }
  return 1;
}

- (unint64_t)_regionsForCurrentModes
{
  int64_t contentMode = self->_contentMode;
  unint64_t v3 = 3;
  if (contentMode <= 1) {
    unint64_t v3 = 1;
  }
  if (contentMode <= 3) {
    return v3;
  }
  else {
    return v3 | 4;
  }
}

- (int64_t)_frontFaceBackgroundModeForContentMode
{
  return (unint64_t)(self->_contentMode - 3) < 3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setModalShadowVisibility:(double)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  double v5 = fmax(fmin(a3, 1.0), 0.0);
  if (self->_modalShadowVisibility != v5)
  {
    self->_modalShadowVisibility = v5;
    [(PKPassView *)self _updateLayerShadowAnimated:a4 withDelay:a5];
  }
}

- (void)setModalShadowVisibility:(double)a3 animated:(BOOL)a4
{
}

- (void)setDimmer:(double)a3 animated:(BOOL)a4
{
}

- (void)setPaused:(BOOL)a3
{
}

- (NSString)uniqueID
{
  return (NSString *)[(PKPass *)self->_pass uniqueID];
}

- (void)setDelegate:(id)a3
{
}

- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4 suppressedContent:(unint64_t)a5 rendererState:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)PKPassView;
  BOOL v13 = -[PKPassView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v13)
  {
    v14 = (void *)MEMORY[0x1A6224460]();
    uint64_t v15 = [v11 displayProfile];
    v13->_suppressedContent = a5;
    objc_storeStrong((id *)&v13->_rendererState, a6);
    v13->_observersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_pass, a3);
    uint64_t v16 = +[PKPassColorProfile profileForDisplayProfile:v15];
    colorProfile = v13->_colorProfile;
    v13->_colorProfile = (PKPassColorProfile *)v16;

    v18 = +[PKPassFaceView newFrontFaceViewForStyle:](PKPassFaceView, "newFrontFaceViewForStyle:", [v11 style]);
    frontFace = v13->_frontFace;
    v13->_frontFace = v18;

    [(PKPassFaceView *)v13->_frontFace setModallyPresented:v13->_modallyPresented];
    [(PKPassFaceView *)v13->_frontFace setPass:v13->_pass colorProfile:v13->_colorProfile];
    [(PKPassFaceView *)v13->_frontFace setDelegate:v13];
    [(PKPassView *)v13 _updateFrontFaceSuppressedContent];
    [(PKPassView *)v13 addSubview:v13->_frontFace];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v13 action:sel_tapRecognized_];
    tapRecognizer = v13->_tapRecognizer;
    v13->_tapRecognizer = (UITapGestureRecognizer *)v20;

    [(UITapGestureRecognizer *)v13->_tapRecognizer setDelegate:v13];
    [(UITapGestureRecognizer *)v13->_tapRecognizer setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v13->_tapRecognizer setNumberOfTouchesRequired:1];
    [(PKPassView *)v13 addGestureRecognizer:v13->_tapRecognizer];
    +[PKAppIntentUIUtilities annotateView:v13 withEntityForPass:v11];
    v13->_int64_t contentMode = a4;
    [(PKPassView *)v13 _applyContentMode:0];
    [(PKPassView *)v13 sizeToFit];
    uint64_t v22 = [MEMORY[0x1E4F84950] sharedManager];
    passcodeLockManager = v13->_passcodeLockManager;
    v13->_passcodeLockManager = (PKPasscodeLockManager *)v22;

    [(PKPasscodeLockManager *)v13->_passcodeLockManager addObserver:v13];
    v24 = NSString;
    v25 = [v11 uniqueID];
    v26 = [v24 stringWithFormat:@"PKPassView.%@", v25];

    [(PKPassView *)v13 setAccessibilityIdentifier:v26];
    [(PKPassView *)v13 setAccessibilityIgnoresInvertColors:1];
  }

  return v13;
}

- (void)setPassState:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v5 = (PKPassDynamicState *)a3;
  if (self->_passState != v5)
  {
    objc_storeStrong((id *)&self->_passState, a3);
    [(PKPassView *)self _updateFrontFaceSuppressedContent];
    double v6 = [(PKPassView *)self observers];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 passView:self didUpdatePassState:v5];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_updateFrontFaceSuppressedContent
{
  int v3 = [(PKPass *)self->_pass isExpired];
  int v4 = [(PKPass *)self->_pass isVoided];
  int v5 = [(PKPass *)self->_pass hasValidNFCPayload];
  int v6 = 1;
  if ((self->_suppressedContent & 0x40) != 0)
  {
    unsigned int v7 = 1;
  }
  else
  {
    unsigned int v7 = 1;
    if (v5 && PKValueAddedServicesEnabled())
    {
      int v6 = 0;
      unsigned int v7 = [(PKPass *)self->_pass isValid] ^ 1;
    }
  }
  unint64_t suppressedContent = self->_suppressedContent;
  if ((suppressedContent & 0x80) != 0)
  {
    uint64_t v10 = 0;
    if ((suppressedContent & 0x200) != 0)
    {
LABEL_11:
      int v11 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = [(PKPass *)self->_pass barcode];
    if (v9) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 0;
    }

    unint64_t suppressedContent = self->_suppressedContent;
    if ((suppressedContent & 0x200) != 0) {
      goto LABEL_11;
    }
  }
  if ([(PKPass *)self->_pass liveRenderingRequiresEnablement])
  {
    long long v12 = [(PKPassDynamicState *)self->_passState liveRender];
    int v11 = [v12 enabled];
  }
  else
  {
    int v11 = 1;
  }
LABEL_16:
  if ((v6 | v10) == 1 || ((v3 | v4) & 1) == 0)
  {
    if ((self->_suppressedContent & 0x800) != 0) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v7 ^ 1;
    }
  }
  else
  {
    uint64_t v13 = 2;
  }
  [(PKPassFrontFaceView *)self->_frontFace setBottomRightItem:v13];
  [(PKPassFrontFaceView *)self->_frontFace setShowsBarcodeView:v10];
  [(PKPassFrontFaceView *)self->_frontFace setShowsLinkedApp:(suppressedContent & 0x20) == 0];
  frontFace = self->_frontFace;
  if (v11)
  {
    [(PKPassFaceView *)frontFace setShowsLiveRendering:1 rendererState:self->_rendererState];
    rendererState = self->_rendererState;
    self->_rendererState = 0;
  }
  else
  {
    [(PKPassFaceView *)frontFace setShowsLiveRendering:0 rendererState:0];
  }
  [(PKPassFrontFaceView *)self->_frontFace setShowsLiveBalance:(self->_suppressedContent & 0x400) == 0];
  uint64_t v16 = [(PKPassDynamicState *)self->_passState relevancyModel];
  uint64_t v17 = [v16 relevancyActive];

  v18 = self->_frontFace;

  [(PKPassFrontFaceView *)v18 setRelevancyActive:v17];
}

- (id)observers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  int v4 = [(NSHashTable *)self->_observers allObjects];
  int v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_observersLock);

  return v5;
}

- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4 suppressedContent:(unint64_t)a5
{
  return [(PKPassView *)self initWithPass:a3 content:a4 suppressedContent:a5 rendererState:0];
}

- (void)setContentMode:(int64_t)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  int64_t contentMode = self->_contentMode;
  if (contentMode != a3)
  {
    BOOL v7 = a4;
    contentModeUpdateTimer = self->_contentModeUpdateTimer;
    if (contentModeUpdateTimer)
    {
      dispatch_source_cancel(contentModeUpdateTimer);
      int v11 = self->_contentModeUpdateTimer;
      self->_contentModeUpdateTimer = 0;

      int64_t contentMode = self->_contentMode;
    }
    self->_priorContentMode = contentMode;
    self->_int64_t contentMode = a3;
    if (a5 <= 0.0 || self->_priorContentMode < a3)
    {
      [(PKPassView *)self _applyContentMode:v7];
    }
    else
    {
      long long v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      uint64_t v13 = self->_contentModeUpdateTimer;
      self->_contentModeUpdateTimer = v12;

      long long v14 = self->_contentModeUpdateTimer;
      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      objc_initWeak(&location, self);
      uint64_t v16 = self->_contentModeUpdateTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __48__PKPassView_setContentMode_animated_withDelay___block_invoke;
      handler[3] = &unk_1E59CB0B0;
      objc_copyWeak(&v18, &location);
      BOOL v19 = v7;
      dispatch_source_set_event_handler(v16, handler);
      dispatch_resume((dispatch_object_t)self->_contentModeUpdateTimer);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PKPassView;
  [(PKPassView *)&v18 layoutSubviews];
  [(PKPassView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(PKPassFrontFaceView *)self->_frontFace frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(PKPassFrontFaceView *)self->_frontFace contentSize];
  -[PKPassFrontFaceView frameForAlignmentRect:](self->_frontFace, "frameForAlignmentRect:", v4, v6, v15, v16);
  -[PKPassFrontFaceView setFrame:](self->_frontFace, "setFrame:");
  [(PKPassFrontFaceView *)self->_frontFace frame];
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  if (!CGRectEqualToRect(v19, v20))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained faceFrameDidChangeForPassView:self];
    }
  }
}

- (PKPassView)initWithPass:(id)a3
{
  return [(PKPassView *)self initWithPass:a3 content:1];
}

- (PKPassView)initWithPass:(id)a3 content:(int64_t)a4
{
  return [(PKPassView *)self initWithPass:a3 content:a4 suppressedContent:0];
}

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(PKPasscodeLockManager *)self->_passcodeLockManager removeObserver:self];
  double v3 = self->_suppressingIdentifier;
  double v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __21__PKPassView_dealloc__block_invoke;
    v7[3] = &unk_1E59CF598;
    CGFloat v8 = v3;
    _AccessSuppressionSetForMutation(v7);
  }
  contentModeUpdateTimer = self->_contentModeUpdateTimer;
  if (contentModeUpdateTimer) {
    dispatch_source_cancel(contentModeUpdateTimer);
  }

  v6.receiver = self;
  v6.super_class = (Class)PKPassView;
  [(PKPassView *)&v6 dealloc];
}

uint64_t __21__PKPassView_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKPassFaceView *)self->_frontFace invalidate];
  }
}

- (void)addPassViewObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    double v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    objc_super v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)removePassViewObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassView;
  -[PKPassView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (PKPassView *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 == self) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  frontFace = self->_frontFace;
  [a4 locationInView:frontFace];

  return -[WLEasyToHitCustomView pointInside:withEvent:](frontFace, "pointInside:withEvent:", 0);
}

- (void)tapRecognized:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passViewTapped:self];
  }
}

- (void)setPaymentBarcodeData:(id)a3
{
}

- (CGRect)frameOfVisibleFace
{
  frontFace = self->_frontFace;
  [(PKPassFrontFaceView *)frontFace frame];

  -[PKPassFrontFaceView alignmentRectForFrame:](frontFace, "alignmentRectForFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)snapshotOfFrontFace
{
  [(PKPassView *)self layoutIfNeeded];
  [(PKPassView *)self frameOfVisibleFace];

  return -[PKPassView snapshotOfFrontFaceWithRequestedSize:](self, "snapshotOfFrontFaceWithRequestedSize:", v3, v4);
}

- (id)snapshotOfFrontFaceWithRequestedSize:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == a3.width && v4 == a3.height)
  {
    v23 = 0;
  }
  else
  {
    double height = a3.height;
    double width = a3.width;
    unint64_t suppressedContent = self->_suppressedContent;
    BOOL modallyPresented = self->_modallyPresented;
    if (suppressedContent != (suppressedContent | 0x377)) {
      -[PKPassView setSuppressedContent:](self, "setSuppressedContent:");
    }
    [(PKPassView *)self setModallyPresented:1];
    [(PKPassView *)self layoutIfNeeded];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke;
    aBlock[3] = &unk_1E59CF5C0;
    BOOL v43 = modallyPresented;
    BOOL v44 = suppressedContent != (suppressedContent | 0x377);
    aBlock[4] = self;
    aBlock[5] = suppressedContent;
    double v11 = (void (**)(void))_Block_copy(aBlock);
    [(PKPassFrontFaceView *)self->_frontFace frame];
    if (v3 == v12 && v4 == v13)
    {
      v11[2](v11);
      v23 = 0;
    }
    else
    {
      double v15 = v12;
      double v16 = v13;
      -[PKPassFrontFaceView alignmentRectForFrame:](self->_frontFace, "alignmentRectForFrame:");
      double v19 = v17;
      BOOL v20 = v18 != height || v17 != width;
      if (v20)
      {
        double v21 = height * (v17 / v18);
        if (v21 > width) {
          double v21 = width;
        }
        double v22 = v21 / v17;
        double v15 = round(v15 * (v21 / v17));
        double v16 = round(v16 * (v21 / v17));
        double v19 = round(v17 * (v21 / v17));
        double v18 = round(v18 * (v21 / v17));
      }
      else
      {
        double v22 = 1.0;
      }
      double v39 = v18;
      id v24 = objc_alloc(MEMORY[0x1E4FB17D8]);
      v25 = [MEMORY[0x1E4FB17E0] preferredFormat];
      v26 = objc_msgSend(v24, "initWithSize:format:", v25, v15, v16);

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke_2;
      v40[3] = &unk_1E59CF5E8;
      BOOL v41 = v20;
      *(double *)&v40[5] = v22;
      v40[4] = self;
      v27 = [v26 imageWithActions:v40];
      [(PKPassFaceView *)self->_frontFace alignmentRectInsets];
      double v31 = v30;
      double v33 = v32;
      if (v20)
      {
        PKFloatRoundToPixel();
        double v33 = v34;
        PKFloatRoundToPixel();
        double v31 = v35;
        double v36 = v15 - v33 - v19;
        double v37 = v16 - v35 - v39;
      }
      else
      {
        double v37 = v28;
        double v36 = v29;
      }
      v11[2](v11);
      v23 = objc_msgSend(v27, "imageWithAlignmentRectInsets:", v31, v33, v37, v36);
    }
  }

  return v23;
}

uint64_t __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setModallyPresented:*(unsigned __int8 *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 49))
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setSuppressedContent:v4];
  }
  return result;
}

void __51__PKPassView_snapshotOfFrontFaceWithRequestedSize___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  if (*(unsigned char *)(a1 + 48)) {
    CGContextScaleCTM(v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  [v4 renderInContext:v3];

  CGContextRestoreGState(v3);
}

- (id)snapshotOfPassView
{
  [(PKPassView *)self layoutIfNeeded];
  [(PKPassView *)self bounds];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == v3 && v5 == v4)
  {
    double v15 = 0;
  }
  else
  {
    double v7 = v3;
    double v8 = v4;
    unint64_t suppressedContent = self->_suppressedContent;
    BOOL modallyPresented = self->_modallyPresented;
    if (suppressedContent != (suppressedContent | 0x377)) {
      -[PKPassView setSuppressedContent:](self, "setSuppressedContent:", *MEMORY[0x1E4F1DB30], v5);
    }
    [(PKPassView *)self setModallyPresented:1];
    [(PKPassView *)self layoutIfNeeded];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__PKPassView_snapshotOfPassView__block_invoke;
    aBlock[3] = &unk_1E59CF5C0;
    BOOL v19 = modallyPresented;
    BOOL v20 = suppressedContent != (suppressedContent | 0x377);
    aBlock[4] = self;
    aBlock[5] = suppressedContent;
    double v11 = (void (**)(void))_Block_copy(aBlock);
    id v12 = objc_alloc(MEMORY[0x1E4FB17D8]);
    double v13 = [MEMORY[0x1E4FB17E0] preferredFormat];
    CGFloat v14 = objc_msgSend(v12, "initWithSize:format:", v13, v7, v8);

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__PKPassView_snapshotOfPassView__block_invoke_2;
    v17[3] = &unk_1E59CDA50;
    v17[4] = self;
    double v15 = [v14 imageWithActions:v17];
    v11[2](v11);
  }

  return v15;
}

uint64_t __32__PKPassView_snapshotOfPassView__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setModallyPresented:*(unsigned __int8 *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 49))
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setSuppressedContent:v4];
  }
  return result;
}

void __32__PKPassView_snapshotOfPassView__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  uint64_t v4 = [*(id *)(a1 + 32) layer];
  [v4 renderInContext:v3];

  CGContextRestoreGState(v3);
}

- (id)snapshotViewOfVisibleFaceAfterScreenUpdates:(BOOL)a3
{
  uint64_t v4 = [(PKPassFrontFaceView *)self->_frontFace snapshotViewAfterScreenUpdates:a3];
  double v5 = [(PKPassView *)self layer];
  double v6 = [(PKPassFrontFaceView *)self->_frontFace layer];
  double v7 = [v4 layer];
  [v5 bounds];
  uint64_t v45 = v9;
  uint64_t v46 = v8;
  double v11 = v10;
  double v13 = v12;
  [v7 bounds];
  uint64_t v43 = v15;
  uint64_t v44 = v14;
  uint64_t v41 = v17;
  uint64_t v42 = v16;
  [v7 anchorPoint];
  uint64_t v39 = v19;
  uint64_t v40 = v18;
  [v5 position];
  double v21 = v20;
  double v23 = v22;
  [v5 anchorPoint];
  double v25 = v21 - v24 * v11;
  double v27 = v23 - v26 * v13;
  [v6 position];
  double v29 = v28;
  double v31 = v30;
  [v6 bounds];
  double v33 = v32;
  double v35 = v34;
  [v6 anchorPoint];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __58__PKPassView_snapshotViewOfVisibleFaceAfterScreenUpdates___block_invoke;
  v47[3] = &unk_1E59CF610;
  v47[4] = v7;
  *(double *)&v47[5] = v25;
  *(double *)&v47[6] = v27;
  *(double *)&v47[7] = v29 - v36 * v33;
  *(double *)&v47[8] = v31 - v37 * v35;
  v47[9] = v46;
  v47[10] = v45;
  *(double *)&v47[11] = v11;
  *(double *)&v47[12] = v13;
  v47[13] = v40;
  v47[14] = v39;
  v47[15] = v44;
  v47[16] = v43;
  v47[17] = v42;
  v47[18] = v41;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v47];

  return v4;
}

uint64_t __58__PKPassView_snapshotViewOfVisibleFaceAfterScreenUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPosition:", vmlaq_f64(vaddq_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*(float64x2_t *)(a1 + 56), *(float64x2_t *)(a1 + 72))), *(float64x2_t *)(a1 + 136), *(float64x2_t *)(a1 + 104)));
}

- (void)drawFrontFaceAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t suppressedContent = self->_suppressedContent;
  BOOL modallyPresented = self->_modallyPresented;
  if (suppressedContent != (suppressedContent | 0x377)) {
    -[PKPassView setSuppressedContent:](self, "setSuppressedContent:");
  }
  [(PKPassView *)self setModallyPresented:1];
  [(PKPassView *)self layoutIfNeeded];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__PKPassView_drawFrontFaceAtSize___block_invoke;
  aBlock[3] = &unk_1E59CF5C0;
  BOOL v17 = modallyPresented;
  BOOL v18 = suppressedContent != (suppressedContent | 0x377);
  aBlock[4] = self;
  aBlock[5] = suppressedContent;
  uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [(PKPassView *)self bounds];
  if (v10 != width || v11 != height) {
    CGContextScaleCTM(CurrentContext, width / v10, height / v11);
  }
  [(PKPassFrontFaceView *)self->_frontFace frame];
  if (v12 != *MEMORY[0x1E4F1DAD8] || v13 != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
    CGContextTranslateCTM(CurrentContext, v12, v13);
  }
  uint64_t v15 = [(PKPassFrontFaceView *)self->_frontFace layer];
  [v15 renderInContext:CurrentContext];

  CGContextRestoreGState(CurrentContext);
  v8[2](v8);
}

uint64_t __34__PKPassView_drawFrontFaceAtSize___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setModallyPresented:*(unsigned __int8 *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 49))
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setSuppressedContent:v4];
  }
  return result;
}

- (BOOL)canShowBarcode
{
  return PKValueAddedServicesEnabledForPass() != 0;
}

- (void)setSuppressedContent:(unint64_t)a3
{
  self->_unint64_t suppressedContent = a3;
  [(PKPassView *)self _updateFrontFaceSuppressedContent];
}

- (PKPassFaceViewRendererState)rendererState
{
  return [(PKPassFaceView *)self->_frontFace rendererState];
}

- (BOOL)frontFaceBodyContentCreated
{
  return [(PKPassFaceView *)self->_frontFace bodyContentCreated];
}

- (BOOL)isPaused
{
  return [(PKPassFaceView *)self->_frontFace isPaused];
}

- (void)setModallyPresented:(BOOL)a3
{
  if (self->_modallyPresented != a3)
  {
    BOOL v3 = a3;
    self->_BOOL modallyPresented = a3;
    -[PKPassFaceView setModallyPresented:](self->_frontFace, "setModallyPresented:");
    if ((PKRunningInRemoteContext() & 1) == 0)
    {
      if (self->_modallyPresented)
      {
        double v5 = [(PKPass *)self->_pass uniqueID];
        double v6 = (void *)[v5 copy];
      }
      else
      {
        double v6 = 0;
      }
      double v7 = self->_suppressingIdentifier;
      objc_storeStrong((id *)&self->_suppressingIdentifier, v6);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __34__PKPassView_setModallyPresented___block_invoke;
      uint64_t v16 = &unk_1E59CF638;
      BOOL v17 = v7;
      id v18 = v6;
      id v8 = v6;
      uint64_t v9 = v7;
      _AccessSuppressionSetForMutation(&v13);
    }
    double v10 = +[PKPassViewUserActivityManager sharedInstance];
    double v11 = v10;
    if (v3)
    {
      CGFloat v12 = [(PKPassView *)self pass];
      [v11 startedViewingPass:v12];
    }
    else
    {
      [v10 endedViewingPass];
    }
  }
}

void __34__PKPassView_setModallyPresented___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "removeObject:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "addObject:");
    id v3 = v4;
  }
}

- (void)setModalShadowVisibility:(double)a3
{
}

- (void)setContentMode:(int64_t)a3
{
}

- (void)setContentMode:(int64_t)a3 animated:(BOOL)a4
{
}

void __48__PKPassView_setContentMode_animated_withDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    dispatch_source_cancel(WeakRetained[59]);
    dispatch_source_t v3 = v4[59];
    v4[59] = 0;

    [(dispatch_source_t *)v4 _applyContentMode:*(unsigned __int8 *)(a1 + 40)];
    id WeakRetained = v4;
  }
}

- (void)didAuthenticate
{
}

- (void)didTransact
{
}

- (void)setFrontFaceExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  double v6 = [(PKPass *)self->_pass barcodeSettings];

  if (v6)
  {
    [(PKPassView *)self layoutIfNeeded];
    [(PKPassView *)self setNeedsLayout];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PKPassView_setFrontFaceExpanded_animated___block_invoke;
    aBlock[3] = &unk_1E59CA7D0;
    aBlock[4] = self;
    double v7 = _Block_copy(aBlock);
    [(PKPassFaceView *)self->_frontFace setViewExpanded:v4];
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 2, v7, 0);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained passViewDidResize:self animated:1];
    }
  }
}

uint64_t __44__PKPassView_setFrontFaceExpanded_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  double v2 = *(void **)(*(void *)(a1 + 32) + 408);

  return [v2 layoutIfNeeded];
}

- (BOOL)isFrontFaceExpanded
{
  return [(PKPassFaceView *)self->_frontFace viewExpanded];
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
}

- (void)updateValidityDisplay
{
}

- (void)_updateLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4
{
  BOOL v5 = a3;
  if (PKIsLowEndDevice())
  {
    [(PKPassView *)self _updateLowEndLayerShadowAnimated:v5 withDelay:a4];
  }
  else
  {
    [(PKPassView *)self _updateHighEndLayerShadowAnimated:v5 withDelay:a4];
  }
}

- (void)_updateLowEndLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4
{
}

- (void)_updateHighEndLayerShadowAnimated:(BOOL)a3 withDelay:(double)a4
{
  BOOL v5 = a3;
  [(PKRemoveableAnimationTrackerStore *)self->_delayedAnimations preempt];
  double v7 = [(PKPassView *)self layer];
  double modalShadowVisibility = self->_modalShadowVisibility;
  [v7 shadowRadius];
  double v10 = v9;
  double v11 = self->_modalShadowVisibility;
  [v7 shadowOpacity];
  float v13 = v12;
  if (self->_modallyPresented)
  {
    id v14 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.09803922 alpha:1.0];
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    objc_msgSend(v7, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  double v15 = modalShadowVisibility * 10.0;
  double v16 = v11 * 0.27;
  if (v5)
  {
    double v17 = v13;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = 0;
    double v20 = 0.0;
    uint64_t v21 = 0;
    if (v15 != v10)
    {
      double v22 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"shadowRadius"];
      objc_msgSend(v22, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, v15);
      [v18 addObject:v22];
      double v23 = [v22 fromValue];
      [v23 doubleValue];
      uint64_t v21 = v24;

      [v22 duration];
      double v20 = fmax(v25, 0.0);
    }
    if (v16 != v17)
    {
      double v26 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"shadowOpacity"];
      objc_msgSend(v26, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v17, v16);
      [v18 addObject:v26];
      double v27 = [v26 fromValue];
      [v27 doubleValue];
      uint64_t v19 = v28;

      [v26 duration];
      double v20 = fmax(v29, v20);
    }
    if ([v18 count])
    {
      double v30 = [MEMORY[0x1E4F39B38] animation];
      [v30 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v30 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
      [v30 setBeginTime:a4];
      [v30 setDuration:v20 + a4];
      [v30 setAnimations:v18];
      delayedAnimations = self->_delayedAnimations;
      if (!delayedAnimations)
      {
        double v32 = (PKRemoveableAnimationTrackerStore *)objc_alloc_init(MEMORY[0x1E4F84F38]);
        double v33 = self->_delayedAnimations;
        self->_delayedAnimations = v32;

        delayedAnimations = self->_delayedAnimations;
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __58__PKPassView__updateHighEndLayerShadowAnimated_withDelay___block_invoke;
      v35[3] = &__block_descriptor_48_e38_v24__0__CALayer_8__CAAnimationGroup_16l;
      v35[4] = v21;
      v35[5] = v19;
    }
  }
  [v7 setShadowRadius:v15];
  *(float *)&double v34 = v16;
  [v7 setShadowOpacity:v34];
}

void __58__PKPassView__updateHighEndLayerShadowAnimated_withDelay___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 shadowRadius];
  [v6 setShadowRadius:v3 + *(double *)(a1 + 32)];
  [v6 shadowOpacity];
  double v5 = *(double *)(a1 + 40) + v4;
  *(float *)&double v5 = v5;
  [v6 setShadowOpacity:v5];
}

- (void)passcodeLockManager:(id)a3 didReceivePasscodeSet:(BOOL)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKPassView_passcodeLockManager_didReceivePasscodeSet___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__PKPassView_passcodeLockManager_didReceivePasscodeSet___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFrontFaceSuppressedContent];
  double v2 = *(void **)(a1 + 32);

  return [v2 setNeedsLayout];
}

- (void)passFaceViewExpandButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passViewExpandButtonTapped:self];
  }
}

void __32__PKPassView__applyContentMode___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PKPassView__applyContentMode___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __32__PKPassView__applyContentMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 464) = 0;
    if (!*((unsigned char *)WeakRetained + 465))
    {
      float v4 = WeakRetained;
      int v3 = [WeakRetained[64] isContentLoaded];
      id v2 = v4;
      if (v3)
      {
        *((unsigned char *)v4 + 465) = 1;
        [v4[51] createContentViewsWithFade:1];
        id v2 = v4;
      }
    }
  }
}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (PKPassDynamicState)passState
{
  return self->_passState;
}

- (BOOL)isModallyPresented
{
  return self->_modallyPresented;
}

- (double)modalShadowVisibility
{
  return self->_modalShadowVisibility;
}

- (PKPassViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassViewDelegate *)WeakRetained;
}

- (PKAccount)associatedAccount
{
  return self->_associatedAccount;
}

- (void)setAssociatedAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passState, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_delayedAnimations, 0);
  objc_storeStrong((id *)&self->_contentModeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_suppressingIdentifier, 0);
  objc_storeStrong((id *)&self->_passcodeLockManager, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_rendererState, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);

  objc_storeStrong((id *)&self->_frontFace, 0);
}

@end