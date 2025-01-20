@interface VKCVisualSearchResultItemView
- (BOOL)automaticallyShowVisualSearchResults;
- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3;
- (BOOL)didProcessResult;
- (BOOL)isShowingVisualResultsPane;
- (BOOL)observingInteractionDidFinish;
- (BOOL)pulsing;
- (BOOL)shouldShowDots;
- (CALayer)iconInLookupButtonLayer;
- (CALayer)pinLayer;
- (CALayer)pulsingLayer;
- (CATransform3D)_initialDotAnimationTransform;
- (CATransform3D)_pinEndTransform;
- (CATransform3D)_transformForButtonScale;
- (CGPoint)_offsetForPinBubbleFrameWithDirection:(int64_t)a3 pinBubbleBounds:(CGRect)a4;
- (CGPoint)pointForVisualSearchIcon;
- (CGRect)_pinButtonRect;
- (CGRect)_rectForViewSpace:(CGRect)a3;
- (CGRect)boundsFromVisualSearchResult;
- (CGRect)currentImageRectForLayerContents;
- (CGRect)rectForIndicatorDot;
- (CGSize)_pinSizeForViewScale;
- (CGSize)cachedDotSize;
- (NSData)userReportPayload;
- (NSString)currentRVItemID;
- (NSString)description;
- (UIImage)imageForButton;
- (UIImage)tintedImageForButton;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (VKCLookupButton)lookupButton;
- (VKCVisualSearchResultItem)visualSearchResultItem;
- (VKCVisualSearchResultItemView)initWithVisualSearchResultItem:(id)a3;
- (VKCVisualSearchResultItemViewDelegate)delegate;
- (double)_screenZoomScale;
- (double)contentSizeScaleFactor;
- (double)lookupButtonSize;
- (id)_defaultSymbolName;
- (id)_queryForProcessingResult;
- (id)_queryString;
- (id)_symbolNameForItem;
- (id)circlePathForPinBubbleWithDirection:(int64_t)a3 withRadius:(double)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)trianglePathForPinBubbleWithDirection:(int64_t)a3 withRadius:(double)a4;
- (int64_t)_pinArrowDirection;
- (int64_t)interfaceOrientation;
- (int64_t)status;
- (void)_animatePin:(BOOL)a3;
- (void)_didDismissVisualResultsPane:(id)a3;
- (void)_updateLayout;
- (void)animateToVisualResultsPane:(BOOL)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginAnimatingDotAfterDelay:(double)a3;
- (void)dealloc;
- (void)deviceOrientationDidChange:(id)a3;
- (void)didDismissVisualResultsPane;
- (void)didFinishAnimatingDots;
- (void)didTap:(id)a3;
- (void)hideDots;
- (void)layoutSubviews;
- (void)removePulsing;
- (void)setAutomaticallyShowVisualSearchResults:(BOOL)a3;
- (void)setCachedDotSize:(CGSize)a3;
- (void)setCurrentImageRectForLayerContents:(CGRect)a3;
- (void)setCurrentRVItemID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidProcessResult:(BOOL)a3;
- (void)setIconInLookupButtonLayer:(id)a3;
- (void)setImageContentsInLayer:(id)a3 withMaterialLayer:(id)a4 withRect:(CGRect)a5;
- (void)setImageContentsInLayer:(id)a3 withRect:(CGRect)a4;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setIsShowingVisualResultsPane:(BOOL)a3;
- (void)setLookupButton:(id)a3;
- (void)setObservingInteractionDidFinish:(BOOL)a3;
- (void)setPinLayer:(id)a3;
- (void)setPulsingLayer:(id)a3;
- (void)setShouldShowDots:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setUserReportPayload:(id)a3;
- (void)setVisualSearchResultItem:(id)a3;
- (void)showLookupUIPaneForResultItem;
- (void)showPinForTappedDot;
- (void)showVisualResultsPane;
- (void)tintedImageForButton;
- (void)updateIndicatorDotForState;
- (void)updatePinLayerFrame;
@end

@implementation VKCVisualSearchResultItemView

- (void)dealloc
{
  if (!self->_observingInteractionDidFinish)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = getkDDRVInteractionDidFinishNotification_0();
    [v3 removeObserver:self name:v4 object:0];
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F437D8] object:0];

  v6.receiver = self;
  v6.super_class = (Class)VKCVisualSearchResultItemView;
  [(VKCVisualSearchResultItemView *)&v6 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
  uint64_t v6 = [v5 queryID];
  v7 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
  v8 = [v7 analysis];
  v9 = [v3 stringWithFormat:@"<%@: %p> queryID: %llu analysisID: %d", v4, self, v6, objc_msgSend(v8, "analysisRequestID")];

  return (NSString *)v9;
}

- (VKCVisualSearchResultItemView)initWithVisualSearchResultItem:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VKCVisualSearchResultItemView;
  uint64_t v6 = [(VKCVisualSearchResultItemView *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualSearchResultItem, a3);
    v8 = objc_alloc_init(VKCLookupButton);
    lookupButton = v7->_lookupButton;
    v7->_lookupButton = v8;

    [(VKCVisualSearchResultItemView *)v7 lookupButtonSize];
    -[VKCLookupButton setFrame:](v7->_lookupButton, "setFrame:", 0.0, 0.0, v10, v10);
    [(VKCVisualSearchResultItemView *)v7 addSubview:v7->_lookupButton];
    uint64_t v11 = [MEMORY[0x1E4F39BE8] layer];
    iconInLookupButtonLayer = v7->_iconInLookupButtonLayer;
    v7->_iconInLookupButtonLayer = (CALayer *)v11;

    uint64_t v13 = [MEMORY[0x1E4F39BE8] layer];
    pulsingLayer = v7->_pulsingLayer;
    v7->_pulsingLayer = (CALayer *)v13;

    [(VKCLookupButton *)v7->_lookupButton setAccessibilityIdentifier:@"com.apple.visionkit.visualSearchIndicator"];
    [(VKCVisualSearchResultItemView *)v7 setPulsing:1];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v16 = (id)[(VKCVisualSearchResultItemView *)v7 registerForTraitChanges:v15 withAction:sel__updateLayout];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v7 action:sel_didTap_];
    [(VKCLookupButton *)v7->_lookupButton addGestureRecognizer:v17];
    [(VKCVisualSearchResultItemView *)v7 setTapGestureRecognizer:v17];
    v18 = v7->_lookupButton;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v7];
    [(VKCLookupButton *)v18 addInteraction:v19];

    objc_initWeak(&location, v7);
    v20 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__VKCVisualSearchResultItemView_initWithVisualSearchResultItem___block_invoke;
    block[3] = &unk_1E6BF3E48;
    id v27 = v5;
    v21 = v7;
    v28 = v21;
    objc_copyWeak(&v29, &location);
    dispatch_async(v20, block);

    v21->_interfaceOrientation = 0;
    v22 = [MEMORY[0x1E4F42948] currentDevice];
    [v22 beginGeneratingDeviceOrientationNotifications];

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v24 = [MEMORY[0x1E4F42948] currentDevice];
    [v23 addObserver:v21 selector:sel_deviceOrientationDidChange_ name:*MEMORY[0x1E4F437D8] object:v24];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __64__VKCVisualSearchResultItemView_initWithVisualSearchResultItem___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_INFO, "Pre loading image for visual search item: %@, %@", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = (id)[WeakRetained tintedImageForButton];
}

- (double)lookupButtonSize
{
  [(VKCVisualSearchResultItemView *)self contentSizeScaleFactor];
  return v2 * 22.0;
}

- (double)contentSizeScaleFactor
{
  double v2 = [(VKCVisualSearchResultItemView *)self traitCollection];
  objc_msgSend(v2, "vk_contentSizeScaleFactor");
  double v4 = v3;

  return fmax(v4, 1.0);
}

- (CGRect)boundsFromVisualSearchResult
{
  double v3 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
  [v3 normalizedBoundingBox];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(VKCVisualSearchResultItemView *)self delegate];
  [v12 contentsRect];
  double v14 = v13;
  v15 = [(VKCVisualSearchResultItemView *)self superview];
  [v15 bounds];
  double v17 = v14 * v16;
  v18 = [(VKCVisualSearchResultItemView *)self delegate];
  [v18 contentsRect];
  double v20 = v19;
  v21 = [(VKCVisualSearchResultItemView *)self superview];
  [v21 bounds];
  double v23 = v20 * v22;
  v24 = [(VKCVisualSearchResultItemView *)self superview];
  [v24 bounds];
  double v26 = v25;
  id v27 = [(VKCVisualSearchResultItemView *)self delegate];
  [v27 contentsRect];
  double v29 = v26 * v28;
  v30 = [(VKCVisualSearchResultItemView *)self superview];
  [v30 bounds];
  double v32 = v31;
  v33 = [(VKCVisualSearchResultItemView *)self delegate];
  [v33 contentsRect];
  double v35 = v32 * v34;

  v36 = [(VKCVisualSearchResultItemView *)self superview];
  [v36 bounds];
  double v38 = v9 * v37;
  v39 = [(VKCVisualSearchResultItemView *)self delegate];
  [v39 contentsRect];
  double v41 = v38 * v40;

  v42 = [(VKCVisualSearchResultItemView *)self superview];
  [v42 bounds];
  double v44 = v11 * v43;
  v45 = [(VKCVisualSearchResultItemView *)self delegate];
  [v45 contentsRect];
  double v47 = v44 * v46;

  double v48 = round(v17 + v5 * v29);
  double v49 = round(v23 + v7 * v35);
  double v50 = round(v41);
  double v51 = round(v47);
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (CGPoint)pointForVisualSearchIcon
{
  double v3 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
  [v3 normalizedIconLocation];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(VKCVisualSearchResultItemView *)self superview];
  [v8 bounds];
  double v10 = v5 * v9;
  double v11 = [(VKCVisualSearchResultItemView *)self delegate];
  [v11 contentsRect];
  double v13 = v10 * v12;
  double v14 = [(VKCVisualSearchResultItemView *)self superview];
  [v14 bounds];
  double v16 = v7 * v15;
  double v17 = [(VKCVisualSearchResultItemView *)self delegate];
  [v17 contentsRect];
  double v19 = v16 * v18;

  double v20 = v13;
  double v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != a3)
  {
    if (interfaceOrientation) {
      [getDDRevealBridgeClass() underlyingViewDisappeared:self->_lookupButton];
    }
    if (a3) {
      self->_int64_t interfaceOrientation = a3;
    }
  }
}

- (int64_t)interfaceOrientation
{
  double v2 = [(VKCVisualSearchResultItemView *)self window];
  double v3 = [v2 windowScene];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

- (void)deviceOrientationDidChange:(id)a3
{
  id v5 = [(VKCVisualSearchResultItemView *)self window];
  int64_t v4 = [v5 windowScene];
  -[VKCVisualSearchResultItemView setInterfaceOrientation:](self, "setInterfaceOrientation:", [v4 interfaceOrientation]);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKCVisualSearchResultItemView;
  [(VKCVisualSearchResultItemView *)&v3 layoutSubviews];
  [(VKCVisualSearchResultItemView *)self _updateLayout];
}

- (void)_updateLayout
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(VKCVisualSearchResultItemView *)self boundsFromVisualSearchResult];
  -[VKCVisualSearchResultItemView setFrame:](self, "setFrame:");
  [(VKCVisualSearchResultItemView *)self updateIndicatorDotForState];
  [(VKCVisualSearchResultItemView *)self updatePulsingLayer];
  objc_super v3 = (void *)MEMORY[0x1E4F39CF8];
  [v3 commit];
}

- (CGRect)rectForIndicatorDot
{
  [(VKCVisualSearchResultItemView *)self lookupButtonSize];
  -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:", 0.0, 0.0, v3, v3);
  double v5 = v4;
  [(VKCVisualSearchResultItemView *)self bounds];
  double v10 = VKMCenterOfRect(v6, v7, v8, v9);
  double v12 = VKMRectWithCenterAndSize(v10, v11, v5);
  double v16 = VKMAliasRoundedRectForScale(v12, v13, v14, v15, 1.0);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateIndicatorDotForState
{
  int64_t status = self->_status;
  if (status == 1)
  {
    [(VKCVisualSearchResultItemView *)self lookupButtonSize];
    double v23 = v22;
    -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:", 0.0, 0.0, v23, v23);
    double v25 = v24 / v23;
    [(VKCVisualSearchResultItemView *)self _transformForButtonScale];
    double v26 = [(VKCLookupButton *)self->_lookupButton layer];
    v31[4] = v31[12];
    v31[5] = v31[13];
    v31[6] = v31[14];
    v31[7] = v31[15];
    v31[0] = v31[8];
    v31[1] = v31[9];
    v31[2] = v31[10];
    v31[3] = v31[11];
    [v26 setTransform:v31];

    id v27 = [(VKCLookupButton *)self->_lookupButton layer];
    [v27 setBorderWidth:v25 + v25];

    id v28 = [MEMORY[0x1E4F428B8] whiteColor];
    uint64_t v29 = [v28 CGColor];
    v30 = [(VKCLookupButton *)self->_lookupButton layer];
    [v30 setBorderColor:v29];

    [(CALayer *)self->_iconInLookupButtonLayer setOpacity:0.0];
  }
  else
  {
    if (status) {
      return;
    }
    [(VKCVisualSearchResultItemView *)self rectForIndicatorDot];
    -[VKCLookupButton setFrame:](self->_lookupButton, "setFrame:");
    double v4 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIView *)self->_lookupButton setVk_backgroundColor:v4];

    [(VKCVisualSearchResultItemView *)self rectForIndicatorDot];
    double v6 = v5 * 0.5;
    CGFloat v7 = [(VKCLookupButton *)self->_lookupButton layer];
    [v7 setCornerRadius:v6];

    id v8 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v9 = [v8 CGColor];
    double v10 = [(VKCLookupButton *)self->_lookupButton layer];
    [v10 setShadowColor:v9];

    double v11 = [(VKCLookupButton *)self->_lookupButton layer];
    LODWORD(v12) = 1053609165;
    [v11 setShadowOpacity:v12];

    CGFloat v13 = [(VKCLookupButton *)self->_lookupButton layer];
    [v13 setShadowRadius:4.0];

    CGFloat v14 = [(VKCLookupButton *)self->_lookupButton layer];
    objc_msgSend(v14, "setShadowOffset:", 0.0, 5.0);

    CGFloat v15 = [(VKCLookupButton *)self->_lookupButton layer];
    [v15 setMasksToBounds:0];

    double v16 = [(VKCLookupButton *)self->_lookupButton layer];
    [v16 setBorderWidth:0.0];

    CATransform3DMakeScale(&v33, 1.0, 1.0, 1.0);
    double v17 = [(VKCLookupButton *)self->_lookupButton layer];
    CATransform3D v32 = v33;
    [v17 setTransform:&v32];

    double v18 = [(CALayer *)self->_iconInLookupButtonLayer superlayer];

    if (!v18)
    {
      double v20 = [(VKCLookupButton *)self->_lookupButton layer];
      [v20 addSublayer:self->_iconInLookupButtonLayer];
    }
    LODWORD(v19) = 1.0;
    [(CALayer *)self->_iconInLookupButtonLayer setOpacity:v19];
    iconInLookupButtonLayer = self->_iconInLookupButtonLayer;
    [(VKCLookupButton *)self->_lookupButton bounds];
    -[VKCVisualSearchResultItemView setImageContentsInLayer:withRect:](self, "setImageContentsInLayer:withRect:", iconInLookupButtonLayer);
  }
  [(VKCVisualSearchResultItemView *)self updatePulsingLayer];
}

- (CGRect)_rectForViewSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(VKCVisualSearchResultItemView *)self window];
  uint64_t v9 = [v8 screen];
  double v10 = [v9 fixedCoordinateSpace];
  double v11 = [(VKCVisualSearchResultItemView *)self coordinateSpace];
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (UIImage)imageForButton
{
  double v3 = (void *)MEMORY[0x1E4F42A80];
  double v4 = [(VKCVisualSearchResultItemView *)self _symbolNameForItem];
  double v5 = objc_msgSend(v3, "vk_symbolImageWithName:", v4);

  if (!v5)
  {
    double v6 = (void *)MEMORY[0x1E4F42A80];
    CGFloat v7 = [(VKCVisualSearchResultItemView *)self _defaultSymbolName];
    double v5 = objc_msgSend(v6, "vk_symbolImageWithName:", v7);
  }
  return (UIImage *)v5;
}

- (UIImage)tintedImageForButton
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  tintedImageForButton = self->_tintedImageForButton;
  if (!tintedImageForButton)
  {
    double v4 = self;
    objc_sync_enter(v4);
    if (!self->_tintedImageForButton)
    {
      double v5 = [(VKCVisualSearchResultItemView *)v4 imageForButton];
      if (!v5)
      {
        double v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          CGFloat v7 = [(VKCVisualSearchResultItemView *)v4 visualSearchResultItem];
          [(VKCVisualSearchResultItemView *)v7 tintedImageForButton];
        }

        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((image) != nil)", "-[VKCVisualSearchResultItemView tintedImageForButton]", 0, 0, @"Expected non-nil value for '%s'", "image");
      }
      id v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:1.0];
      [v5 size];
      objc_msgSend(v5, "vk_imageWithTint:size:", v8);
      uint64_t v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      double v10 = self->_tintedImageForButton;
      self->_tintedImageForButton = v9;
    }
    objc_sync_exit(v4);

    tintedImageForButton = self->_tintedImageForButton;
  }
  return tintedImageForButton;
}

- (id)_symbolNameForItem
{
  double v2 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
  double v3 = [v2 glyphName];

  return v3;
}

- (id)_defaultSymbolName
{
  return @"doc.text.magnifyingglass";
}

- (void)removePulsing
{
  [(CALayer *)self->_pulsingLayer setOpacity:0.0];
  pulsingLayer = self->_pulsingLayer;
  [(CALayer *)pulsingLayer removeAllAnimations];
}

- (void)animateToVisualResultsPane:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = @"animateOut";
  if (a3) {
    double v5 = @"animateIn";
  }
  double v6 = v5;
  if (self->_pinLayer) {
    [(VKCVisualSearchResultItemView *)self _animatePin:v3];
  }
  CGFloat v7 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  [v7 setDamping:20.0];
  [v7 setStiffness:380.0];
  [v7 setDuration:0.4936];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  [(VKCVisualSearchResultItemView *)self _transformForButtonScale];
  if (v3)
  {
    long long v33 = v41;
    long long v34 = v42;
    long long v35 = v43;
    long long v36 = v44;
    long long v29 = v37;
    long long v30 = v38;
    long long v31 = v39;
    long long v32 = v40;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v28[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v28[7] = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v28[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v28[5] = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v28[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v28[3] = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v28[0] = *MEMORY[0x1E4F39B10];
    v28[1] = v11;
    double v12 = [MEMORY[0x1E4F29238] valueWithBytes:v28 objCType:"{CATransform3D=dddddddddddddddd}"];
    uint64_t v13 = &unk_1F357DE40;
    float v14 = 0.0;
    double v15 = &unk_1F357DE50;
  }
  else
  {
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v34 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v35 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v36 = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v29 = *MEMORY[0x1E4F39B10];
    long long v30 = v18;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v32 = v19;
    v27[6] = v43;
    v27[7] = v44;
    v27[4] = v41;
    v27[5] = v42;
    v27[2] = v39;
    v27[3] = v40;
    v27[0] = v37;
    v27[1] = v38;
    double v12 = [MEMORY[0x1E4F29238] valueWithBytes:v27 objCType:"{CATransform3D=dddddddddddddddd}"];
    uint64_t v13 = &unk_1F357DE50;
    float v14 = 1.0;
    double v15 = &unk_1F357DE40;
  }
  [v7 setFromValue:v12];

  v26[4] = v33;
  v26[5] = v34;
  v26[6] = v35;
  v26[7] = v36;
  v26[0] = v29;
  v26[1] = v30;
  v26[2] = v31;
  v26[3] = v32;
  double v20 = [MEMORY[0x1E4F29238] valueWithBytes:v26 objCType:"{CATransform3D=dddddddddddddddd}"];
  [v7 setToValue:v20];

  double v21 = [(VKCLookupButton *)self->_lookupButton layer];
  v25[4] = v33;
  v25[5] = v34;
  v25[6] = v35;
  v25[7] = v36;
  v25[0] = v29;
  v25[1] = v30;
  v25[2] = v31;
  v25[3] = v32;
  [v21 setTransform:v25];

  double v22 = [(VKCLookupButton *)self->_lookupButton layer];
  [v22 addAnimation:v7 forKey:@"buttonScaleAnimation"];

  double v23 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v23 setDuration:0.2];
  [v23 setFromValue:v13];
  [v23 setToValue:v15];
  *(float *)&double v24 = v14;
  [(CALayer *)self->_iconInLookupButtonLayer setOpacity:v24];
  [v23 setDelegate:self];
  [v23 setValue:v6 forKey:@"animationName"];
  [(CALayer *)self->_iconInLookupButtonLayer addAnimation:v23 forKey:@"iconImageAnimation"];
}

- (CATransform3D)_transformForButtonScale
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CGRect result = CATransform3DMakeScale(&v9, 0.3, 0.3, 1.0);
  long long v5 = *(_OWORD *)&v9.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v9.m31;
  *(_OWORD *)&retstr->m33 = v5;
  long long v6 = *(_OWORD *)&v9.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v9.m41;
  *(_OWORD *)&retstr->m43 = v6;
  long long v7 = *(_OWORD *)&v9.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v9.m11;
  *(_OWORD *)&retstr->m13 = v7;
  long long v8 = *(_OWORD *)&v9.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v9.m21;
  *(_OWORD *)&retstr->m23 = v8;
  return result;
}

- (void)_animatePin:(BOOL)a3
{
  BOOL v3 = a3;
  v45[2] = *MEMORY[0x1E4F143B8];
  long long v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  [v5 setDamping:20.0];
  [v5 setStiffness:380.0];
  [v5 setDuration:0.4936];
  long long v6 = (void *)MEMORY[0x1E4F29238];
  long long v7 = (_OWORD *)MEMORY[0x1E4F39B10];
  if (v3)
  {
    [(VKCVisualSearchResultItemView *)self _pinEndTransform];
    long long v8 = [v6 valueWithBytes:v44 objCType:"{CATransform3D=dddddddddddddddd}"];
    [v5 setFromValue:v8];

    long long v9 = v7[5];
    v43[4] = v7[4];
    v43[5] = v9;
    long long v10 = v7[7];
    v43[6] = v7[6];
    v43[7] = v10;
    long long v11 = v7[1];
    v43[0] = *v7;
    v43[1] = v11;
    long long v12 = v7[3];
    v43[2] = v7[2];
    v43[3] = v12;
    uint64_t v13 = [MEMORY[0x1E4F29238] valueWithBytes:v43 objCType:"{CATransform3D=dddddddddddddddd}"];
    float v14 = &unk_1F357DC38;
    double v15 = &unk_1F357DC50;
  }
  else
  {
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v42[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v42[5] = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v42[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v42[7] = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v42[0] = *MEMORY[0x1E4F39B10];
    v42[1] = v18;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v42[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v42[3] = v19;
    double v20 = [MEMORY[0x1E4F29238] valueWithBytes:v42 objCType:"{CATransform3D=dddddddddddddddd}"];
    [v5 setFromValue:v20];

    double v21 = (void *)MEMORY[0x1E4F29238];
    [(VKCVisualSearchResultItemView *)self _pinEndTransform];
    uint64_t v13 = [v21 valueWithBytes:v41 objCType:"{CATransform3D=dddddddddddddddd}"];
    float v14 = &unk_1F357DC50;
    double v15 = &unk_1F357DC38;
  }
  [v5 setToValue:v13];

  double v22 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v22 setDamping:20.0];
  [v22 setStiffness:380.0];
  [v22 setDuration:0.4936];
  [v22 setFromValue:v14];
  [v22 setToValue:v15];
  double v23 = [MEMORY[0x1E4F39B38] animation];
  v45[0] = v5;
  v45[1] = v22;
  double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v23 setAnimations:v24];

  [v23 setDuration:0.4936];
  if (v3)
  {
    long long v25 = v7[5];
    long long v37 = v7[4];
    long long v38 = v25;
    long long v26 = v7[7];
    long long v39 = v7[6];
    long long v40 = v26;
    long long v27 = v7[1];
    long long v33 = *v7;
    long long v34 = v27;
    long long v28 = v7[3];
    long long v35 = v7[2];
    long long v36 = v28;
    float v29 = 1.0;
  }
  else
  {
    [(VKCVisualSearchResultItemView *)self _pinEndTransform];
    float v29 = 0.0;
  }
  pinLayer = self->_pinLayer;
  v32[4] = v37;
  v32[5] = v38;
  v32[6] = v39;
  v32[7] = v40;
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v35;
  void v32[3] = v36;
  [(CALayer *)pinLayer setTransform:v32];
  *(float *)&double v31 = v29;
  [(CALayer *)self->_pinLayer setOpacity:v31];
  [(CALayer *)self->_pinLayer addAnimation:v23 forKey:@"pinAnimation"];
}

- (CATransform3D)_pinEndTransform
{
  [(VKCVisualSearchResultItemView *)self _pinSizeForViewScale];
  double v6 = v5;
  double v8 = v7;
  memset(&v18, 0, sizeof(v18));
  CATransform3DMakeScale(&v18, 0.01, 0.01, 0.01);
  memset(&v17, 0, sizeof(v17));
  int64_t v9 = [(VKCVisualSearchResultItemView *)self _pinArrowDirection];
  if (v9 == 3)
  {
    double v11 = -0.5;
LABEL_9:
    double v13 = v6 * v11;
    double v12 = 0.0;
    goto LABEL_10;
  }
  if (v9 == 1)
  {
    double v10 = 0.5;
    goto LABEL_7;
  }
  if (v9)
  {
    double v11 = 0.5;
    goto LABEL_9;
  }
  double v10 = -0.5;
LABEL_7:
  double v12 = v8 * v10;
  double v13 = 0.0;
LABEL_10:
  CATransform3DMakeTranslation(&v17, v13, v12, 0.0);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3D a = v18;
  CATransform3D v15 = v17;
  return CATransform3DConcat(retstr, &a, &v15);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  double v5 = objc_msgSend(a3, "valueForKey:", @"animationName", a4);
  if ([v5 isEqualToString:@"animateOut"])
  {
    [(CALayer *)self->_pinLayer removeFromSuperlayer];
    pinLayer = self->_pinLayer;
    self->_pinLayer = 0;
  }
  else if ([v5 isEqualToString:@"animateIn"])
  {
    double v7 = [(VKCVisualSearchResultItemView *)self delegate];
    double v8 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
    [v8 normalizedBoundingBox];
    objc_msgSend(v7, "visualSearchItemView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self);

    [(VKCVisualSearchResultItemView *)self showLookupUIPaneForResultItem];
  }
  else if ([v5 isEqualToString:@"dotAnimateIn"])
  {
    int64_t v9 = [(VKCVisualSearchResultItemView *)self layer];
    LODWORD(v10) = 1.0;
    [v9 setOpacity:v10];

    CATransform3DMakeScale(&v13, 1.0, 1.0, 1.0);
    double v11 = [(VKCVisualSearchResultItemView *)self layer];
    CATransform3D v12 = v13;
    [v11 setTransform:&v12];
  }
}

- (void)setImageContentsInLayer:(id)a3 withRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v40 = (CALayer *)a3;
  VKMScaledRect(x, y, width, height, 0.5);
  double v9 = VKMRectWithSize();
  double v13 = VKMCenterRectOverRect(v9, v10, v11, v12, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (self->_iconInLookupButtonLayer != v40
    || ([(VKCVisualSearchResultItemView *)self currentImageRectForLayerContents],
        v43.origin.CGFloat x = v13,
        v43.origin.CGFloat y = v15,
        v43.size.CGFloat width = v17,
        v43.size.CGFloat height = v19,
        !CGRectEqualToRect(v42, v43)))
  {
    -[VKCVisualSearchResultItemView setCurrentImageRectForLayerContents:](self, "setCurrentImageRectForLayerContents:", v13, v15, v17, v19);
    double v20 = [(VKCVisualSearchResultItemView *)self tintedImageForButton];
    -[CALayer setContents:](v40, "setContents:", objc_msgSend(v20, "vk_cgImage"));
    [v20 size];
    double v23 = VKMFitOrFillSizeInRect(0, v21, v22, v13, v15, v17, v19);
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    long long v30 = [(VKCVisualSearchResultItemView *)self window];
    double v31 = [v30 screen];
    [v31 scale];
    double v33 = VKMAliasRoundedRectForScale(v23, v25, v27, v29, v32);
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    -[CALayer setFrame:](v40, "setFrame:", v33, v35, v37, v39);
  }
}

- (void)setImageContentsInLayer:(id)a3 withMaterialLayer:(id)a4 withRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  -[VKCVisualSearchResultItemView setImageContentsInLayer:withRect:](self, "setImageContentsInLayer:withRect:", v12, x, y, width, height);
  id v14 = [v11 visualStylingProviderForCategory:*MEMORY[0x1E4F5C320]];

  double v13 = [v14 visualStylingForStyle:*MEMORY[0x1E4F5C338]];
  objc_msgSend(v12, "mt_replaceAllVisualStylingWithStyling:", v13);
}

- (void)showPinForTappedDot
{
  [(CALayer *)self->_pinLayer removeFromSuperlayer];
  pinLayer = self->_pinLayer;
  self->_pinLayer = 0;

  double v4 = [MEMORY[0x1E4F39BE8] layer];
  double v5 = self->_pinLayer;
  self->_pinLayer = v4;

  LODWORD(v6) = 1.0;
  [(CALayer *)self->_pinLayer setOpacity:v6];
  double v7 = [(VKCVisualSearchResultItemView *)self layer];
  [v7 addSublayer:self->_pinLayer];

  [(VKCVisualSearchResultItemView *)self _pinSizeForViewScale];
  double v9 = v8;
  [(VKCVisualSearchResultItemView *)self _screenZoomScale];
  double v11 = v9 + v10 * -6.0;
  int64_t v12 = [(VKCVisualSearchResultItemView *)self _pinArrowDirection];
  [(VKCVisualSearchResultItemView *)self updatePinLayerFrame];
  id v25 = [MEMORY[0x1E4F39C88] layer];
  [(CALayer *)self->_pinLayer bounds];
  objc_msgSend(v25, "setFrame:");
  double v13 = [(VKCVisualSearchResultItemView *)self trianglePathForPinBubbleWithDirection:v12 withRadius:v11];
  id v14 = [(VKCVisualSearchResultItemView *)self circlePathForPinBubbleWithDirection:v12 withRadius:v11];
  objc_msgSend(v13, "vk_appendBezierPath:", v14);

  objc_msgSend(v25, "setPath:", objc_msgSend(v13, "vk_CGPath"));
  id v15 = objc_alloc_init(MEMORY[0x1E4F5C340]);
  [v15 setRecipe:*MEMORY[0x1E4F5C2C0]];
  [v15 setWeighting:1.0];
  [(CALayer *)self->_pinLayer bounds];
  objc_msgSend(v15, "setFrame:");
  [v15 setMask:v25];
  [(CALayer *)self->_pinLayer addSublayer:v15];
  [(UIView *)self vk_viewPointRatioFromWindow];
  double v17 = v16;
  id v18 = [MEMORY[0x1E4F428B8] blackColor];
  -[CALayer setShadowColor:](self->_pinLayer, "setShadowColor:", [v18 CGColor]);

  double v19 = v17 * 0.1;
  *(float *)&double v19 = v17 * 0.1;
  [(CALayer *)self->_pinLayer setShadowOpacity:v19];
  [(CALayer *)self->_pinLayer setShadowRadius:v17 * 10.0];
  -[CALayer setShadowOffset:](self->_pinLayer, "setShadowOffset:", 0.0, v17 + v17);
  [(CALayer *)self->_pinLayer setMasksToBounds:0];
  v27.origin.double x = VKMRectWithSize();
  CGRect v28 = CGRectInset(v27, (v9 - v11) * 0.5, (v9 - v11) * 0.5);
  double x = v28.origin.x;
  double y = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  double v24 = [MEMORY[0x1E4F39BE8] layer];
  -[VKCVisualSearchResultItemView setImageContentsInLayer:withMaterialLayer:withRect:](self, "setImageContentsInLayer:withMaterialLayer:withRect:", v24, v15, x, y, width, height);
  [(CALayer *)self->_pinLayer addSublayer:v24];
}

- (CGRect)_pinButtonRect
{
  double v2 = 66.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 66.0;
  result.size.double height = v5;
  result.size.double width = v2;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGSize)_pinSizeForViewScale
{
  [(VKCVisualSearchResultItemView *)self _pinButtonRect];
  -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:");
  double v4 = v3;
  double v6 = v5;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (double)_screenZoomScale
{
  [(VKCVisualSearchResultItemView *)self _pinButtonRect];
  -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:");
  double v4 = v3;
  [(VKCVisualSearchResultItemView *)self _pinButtonRect];
  return v4 / v5;
}

- (int64_t)_pinArrowDirection
{
  double v3 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
  double v4 = [v3 domainInfo];
  double v5 = [v4 domain];
  char v6 = [v5 isEqual:@"com.apple.argos.domain_key.dogs"];

  if (v6) {
    return 0;
  }
  double v8 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
  double v9 = [v8 domainInfo];
  double v10 = [v9 domain];
  int v11 = [v10 isEqual:@"com.apple.argos.domain_key.cats"];

  return v11 ^ 1u;
}

- (void)updatePinLayerFrame
{
  int64_t v3 = [(VKCVisualSearchResultItemView *)self _pinArrowDirection];
  [(VKCVisualSearchResultItemView *)self _pinSizeForViewScale];
  double v5 = v4;
  double v7 = v6;
  [(VKCVisualSearchResultItemView *)self _offsetForPinBubbleFrameWithDirection:v3 pinBubbleBounds:VKMRectWithSize()];
  double v9 = v8;
  double v11 = v10;
  [(VKCLookupButton *)self->_lookupButton frame];
  double v16 = VKMCenterOfRect(v12, v13, v14, v15);
  double v17 = VKMAddPoints(v9, v11, v16);
  double v20 = VKMRectWithOriginAndSize(v18, v17, v19, v5, v7);
  pinLayer = self->_pinLayer;
  [(CALayer *)pinLayer setFrame:v20];
}

- (CGPoint)_offsetForPinBubbleFrameWithDirection:(int64_t)a3 pinBubbleBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  [(VKCVisualSearchResultItemView *)self _screenZoomScale];
  double v9 = v8 * 3.0;
  switch(a3)
  {
    case 0:
      double v10 = width * -0.5;
      [(VKCLookupButton *)self->_lookupButton frame];
      double v12 = v9 + v11 * 0.5;
      break;
    case 1:
      double v10 = width * -0.5;
      [(VKCLookupButton *)self->_lookupButton frame];
      double v12 = v13 * -0.5 - height - v9;
      break;
    case 2:
      [(VKCLookupButton *)self->_lookupButton frame];
      double v14 = -0.5;
      double v10 = v15 * -0.5 - width - v9;
      goto LABEL_7;
    case 3:
      [(VKCLookupButton *)self->_lookupButton frame];
      double v10 = v9 + v16 * 0.5;
      double v14 = -0.5;
LABEL_7:
      double v12 = height * v14;
      break;
    default:
      double v10 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      break;
  }
  double v17 = v10;
  result.double y = v12;
  result.double x = v17;
  return result;
}

- (id)circlePathForPinBubbleWithDirection:(int64_t)a3 withRadius:(double)a4
{
  [(CALayer *)self->_pinLayer bounds];
  double v9 = VKMCenterOfRect(v5, v6, v7, v8);
  double v11 = VKMRectWithCenterAndSize(v9, v10, a4);
  double v12 = (void *)MEMORY[0x1E4F427D0];
  return (id)[v12 bezierPathWithOvalInRect:v11];
}

- (id)trianglePathForPinBubbleWithDirection:(int64_t)a3 withRadius:(double)a4
{
  [(CALayer *)self->_pinLayer bounds];
  double v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  double v10 = a4 / 6.0;
  double v11 = (v8 - a4) * 0.5 + 1.0;
  switch(a3)
  {
    case 0:
      [(CALayer *)self->_pinLayer bounds];
      double v12 = v10 * 0.5;
      CGFloat v13 = CGRectGetMidX(v27) - v12;
      [(CALayer *)self->_pinLayer bounds];
      objc_msgSend(v9, "moveToPoint:", v13, v11 + CGRectGetMinY(v28));
      [(CALayer *)self->_pinLayer bounds];
      double MidX = CGRectGetMidX(v29);
      [(CALayer *)self->_pinLayer bounds];
      objc_msgSend(v9, "vk_addLineToPoint:", MidX, CGRectGetMinY(v30));
      [(CALayer *)self->_pinLayer bounds];
      double v15 = v12 + CGRectGetMidX(v31);
      [(CALayer *)self->_pinLayer bounds];
      double MaxY = v11 + CGRectGetMinY(v32);
      goto LABEL_7;
    case 1:
      [(CALayer *)self->_pinLayer bounds];
      double v17 = v10 * 0.5;
      CGFloat v18 = CGRectGetMidX(v33) - v17;
      [(CALayer *)self->_pinLayer bounds];
      objc_msgSend(v9, "moveToPoint:", v18, CGRectGetMaxY(v34) - v11);
      [(CALayer *)self->_pinLayer bounds];
      double v19 = v17 + CGRectGetMidX(v35);
      [(CALayer *)self->_pinLayer bounds];
      objc_msgSend(v9, "vk_addLineToPoint:", v19, CGRectGetMaxY(v36) - v11);
      [(CALayer *)self->_pinLayer bounds];
      double v15 = CGRectGetMidX(v37);
      [(CALayer *)self->_pinLayer bounds];
      double MaxY = CGRectGetMaxY(v38);
      goto LABEL_7;
    case 2:
      [(CALayer *)self->_pinLayer bounds];
      CGFloat v20 = CGRectGetMaxX(v39) - v11;
      [(CALayer *)self->_pinLayer bounds];
      double v21 = v10 * 0.5;
      objc_msgSend(v9, "moveToPoint:", v20, CGRectGetMidY(v40) - v21);
      [(CALayer *)self->_pinLayer bounds];
      double MaxX = CGRectGetMaxX(v41);
      [(CALayer *)self->_pinLayer bounds];
      objc_msgSend(v9, "vk_addLineToPoint:", MaxX, CGRectGetMidY(v42));
      [(CALayer *)self->_pinLayer bounds];
      double v15 = CGRectGetMaxX(v43) - v11;
      goto LABEL_6;
    case 3:
      [(CALayer *)self->_pinLayer bounds];
      double v23 = v11 + CGRectGetMinX(v44);
      [(CALayer *)self->_pinLayer bounds];
      double v21 = v10 * 0.5;
      objc_msgSend(v9, "moveToPoint:", v23, CGRectGetMidY(v45) - v21);
      [(CALayer *)self->_pinLayer bounds];
      double MinX = CGRectGetMinX(v46);
      [(CALayer *)self->_pinLayer bounds];
      objc_msgSend(v9, "vk_addLineToPoint:", MinX, CGRectGetMidY(v47));
      [(CALayer *)self->_pinLayer bounds];
      double v15 = v11 + CGRectGetMinX(v48);
LABEL_6:
      [(CALayer *)self->_pinLayer bounds];
      double MaxY = v21 + CGRectGetMidY(v49);
LABEL_7:
      objc_msgSend(v9, "vk_addLineToPoint:", v15, MaxY);
      [v9 closePath];
      break;
    default:
      break;
  }
  return v9;
}

- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(VKCVisualSearchResultItemView *)self _rectForViewSpace:VKMRectWithSize()];
  double v7 = v6;
  double v8 = [(VKCVisualSearchResultItemView *)self lookupButton];
  [v8 frame];
  double v13 = VKMCenterOfRect(v9, v10, v11, v12);
  double v15 = VKMRectWithCenterAndSize(v13, v14, v7);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  double v22 = v15;
  uint64_t v23 = v17;
  uint64_t v24 = v19;
  uint64_t v25 = v21;
  CGFloat v26 = x;
  CGFloat v27 = y;
  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v26);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (([(VKCVisualSearchResultItemView *)self isHidden] & 1) != 0
    || !-[VKCVisualSearchResultItemView containsVisualSearchItemAtPoint:](self, "containsVisualSearchItemAtPoint:", x, y))
  {
    double v7 = 0;
  }
  else
  {
    double v7 = [(VKCVisualSearchResultItemView *)self lookupButton];
  }
  return v7;
}

- (void)didTap:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(VKCVisualSearchResultItemView *)self delegate];
  int v9 = objc_msgSend(v8, "visualSearchItemView:shouldBeginAtPoint:", self, v5, v7);

  if (v9)
  {
    CGFloat v10 = [(VKCVisualSearchResultItemView *)self visualSearchResultItem];
    [v10 setCurrentInvocationType:1];

    [(VKCVisualSearchResultItemView *)self showVisualResultsPane];
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self->_lookupButton];
  double v5 = [MEMORY[0x1E4F42CA8] effectWithPreview:v4];
  double v6 = [MEMORY[0x1E4F42CC0] styleWithEffect:v5 shape:0];

  return v6;
}

- (void)beginAnimatingDotAfterDelay:(double)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  [(VKCVisualSearchResultItemView *)self hideDots];
  [(VKCVisualSearchResultItemView *)self setShouldShowDots:1];
  [(VKCVisualSearchResultItemView *)self _updateLayout];
  double v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v5 setFromValue:&unk_1F357DE50];
  [v5 setToValue:&unk_1F357DE40];
  double v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  [v6 setDamping:20.0];
  [v6 setStiffness:770.0];
  [v6 setDuration:0.73763];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  [(VKCVisualSearchResultItemView *)self _initialDotAnimationTransform];
  long long v20 = v28;
  long long v21 = v29;
  long long v22 = v30;
  long long v23 = v31;
  long long v16 = v24;
  long long v17 = v25;
  long long v18 = v26;
  long long v19 = v27;
  double v7 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v16];
  [v6 setFromValue:v7];

  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v21 = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v23 = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v16 = *MEMORY[0x1E4F39B10];
  long long v17 = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v19 = v11;
  CGFloat v12 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v16];
  [v6 setToValue:v12];

  double v13 = [MEMORY[0x1E4F39B38] animation];
  [v13 setDuration:0.4];
  v32[0] = v5;
  v32[1] = v6;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v13 setAnimations:v14];

  [v13 setBeginTime:CACurrentMediaTime() + a3];
  [v13 setDelegate:self];
  [v13 setValue:@"dotAnimateIn" forKey:@"animationName"];
  [v13 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v13 setRemovedOnCompletion:0];
  double v15 = [(VKCVisualSearchResultItemView *)self layer];
  [v15 addAnimation:v13 forKey:@"animateIn"];
}

- (CATransform3D)_initialDotAnimationTransform
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CGPoint result = CATransform3DMakeScale(&v9, 0.1, 0.1, 0.1);
  long long v5 = *(_OWORD *)&v9.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v9.m31;
  *(_OWORD *)&retstr->m33 = v5;
  long long v6 = *(_OWORD *)&v9.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v9.m41;
  *(_OWORD *)&retstr->m43 = v6;
  long long v7 = *(_OWORD *)&v9.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v9.m11;
  *(_OWORD *)&retstr->m13 = v7;
  long long v8 = *(_OWORD *)&v9.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v9.m21;
  *(_OWORD *)&retstr->m23 = v8;
  return result;
}

- (void)didFinishAnimatingDots
{
  if ([(VKCVisualSearchResultItemView *)self shouldShowDots])
  {
    if (self->_automaticallyShowVisualSearchResults)
    {
      int64_t v3 = [(VKCVisualSearchResultItemView *)self delegate];
      [(VKCVisualSearchResultItemView *)self bounds];
      int v8 = objc_msgSend(v3, "visualSearchItemView:shouldBeginAtPoint:", self, VKMCenterOfRect(v4, v5, v6, v7));

      if (v8)
      {
        [(VKCVisualSearchResultItemView *)self showVisualResultsPane];
      }
    }
  }
}

- (void)hideDots
{
  [(VKCVisualSearchResultItemView *)self setShouldShowDots:0];
  id v3 = [(VKCVisualSearchResultItemView *)self layer];
  [v3 setOpacity:0.0];
}

- (void)showVisualResultsPane
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    CGFloat v7 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Visual search activated: %@", (uint8_t *)&v6, 0xCu);
  }

  if (!self->_isShowingVisualResultsPane)
  {
    self->_int64_t status = 1;
    self->_isShowingVisualResultsPane = 1;
    [(VKCVisualSearchResultItemView *)self updateIndicatorDotForState];
    CGFloat v4 = [(VKCVisualSearchResultItemView *)self traitCollection];
    int v5 = objc_msgSend(v4, "vk_hasCompactWidth");

    if (v5)
    {
      [(VKCVisualSearchResultItemView *)self showPinForTappedDot];
      [(CALayer *)self->_pinLayer setOpacity:0.0];
    }
    [(VKCVisualSearchResultItemView *)self animateToVisualResultsPane:1];
  }
}

- (void)_didDismissVisualResultsPane:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  int v6 = [v4 object];

  VKDynamicCast(v5, (uint64_t)v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v14 clientHints];
  CATransform3D v9 = VKDynamicCast(v7, (uint64_t)v8);

  if (v9)
  {
    long long v10 = [(VKCVisualSearchResultItemView *)self currentRVItemID];
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      CGFloat v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v13 = getkDDRVInteractionDidFinishNotification_0();
      [v12 removeObserver:self name:v13 object:0];

      [(VKCVisualSearchResultItemView *)self setObservingInteractionDidFinish:0];
      [(VKCVisualSearchResultItemView *)self setCurrentRVItemID:0];
      [(VKCVisualSearchResultItemView *)self didDismissVisualResultsPane];
    }
  }
}

- (void)didDismissVisualResultsPane
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Visual search pane was dismissed: %@", (uint8_t *)&v5, 0xCu);
  }

  self->_isShowingVisualResultsPane = 0;
  self->_int64_t status = 0;
  [(VKCVisualSearchResultItemView *)self animateToVisualResultsPane:0];
  [(VKCVisualSearchResultItemView *)self updateIndicatorDotForState];
  [(VKCVisualSearchResultItemView *)self setNeedsLayout];
  id v4 = [(VKCVisualSearchResultItemView *)self delegate];
  [v4 visualSearchItemViewDidDismissController:self];
}

- (id)_queryString
{
  double v2 = VKBundle();
  id v3 = [v2 localizedStringForKey:@"VK_RESULTS_LOOKUP_PANEL_TITLE" value:@"VK_RESULTS_LOOKUP_PANEL_TITLE" table:@"Localizable"];

  return v3;
}

- (id)_queryForProcessingResult
{
  objc_initWeak(&location, self);
  id v3 = +[VKCImageAnalyzerRequest newQueryIDForParsec];
  id v4 = objc_alloc(MEMORY[0x1E4F962F8]);
  int v5 = [(VKCVisualSearchResultItemView *)self _queryString];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke;
  v8[3] = &unk_1E6BF0A18;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = v3;
  int v6 = (void *)[v4 initWithTitle:v5 clientIdentifier:@"com.apple.mediaanalysisd" userAgent:@"VisualIntelligence/1" queryID:v3 queryProvider:v8];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a4;
  if (a2 && a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    CATransform3D v9 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained didProcessResult])
      {
        long long v10 = [v9 visualSearchResultItem];
        int v11 = [v10 searchItem];
        CGFloat v12 = [v11 searchSections];
        v7[2](v7, v12, 0);

        double v13 = [v9 delegate];
        [v13 visualSearchItemView:v9 didProcessResultsWithDuration:0.0];

        id v14 = +[VKImageAnalyzerMadInterface sharedInterface];
        uint64_t v15 = *(void *)(a1 + 48);
        long long v16 = [v9 visualSearchResultItem];
        uint64_t v17 = [v16 queryID];
        long long v18 = [v9 visualSearchResultItem];
        [v14 didShowVisualSearchCachedResultsForQueryID:v15 cachedResultQueryID:v17 item:v18];
      }
      else
      {
        long long v20 = [MEMORY[0x1E4F1C9C8] now];
        long long v21 = [*(id *)(a1 + 32) delegate];
        long long v22 = [v9 visualSearchResultItem];
        v30[0] = v22;
        long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_2;
        v25[3] = &unk_1E6BF09F0;
        id v26 = v20;
        long long v27 = v9;
        uint64_t v29 = *(void *)(a1 + 48);
        long long v28 = v7;
        id v24 = v20;
        [v21 generateVisualSearchResultForItems:v23 queryID:v29 completionHandler:v25];
      }
    }
  }
  else
  {
    long long v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_cold_1(a1, v19);
    }

    v7[2](v7, 0, 0);
  }
}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3;
  v11[3] = &unk_1E6BF09C8;
  id v12 = *(id *)(a1 + 32);
  id v13 = v7;
  uint64_t v8 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v6;
  uint64_t v17 = *(void *)(a1 + 56);
  id v16 = v8;
  id v9 = v6;
  id v10 = v7;
  vk_performBlockOnMainThread(v11);
}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v4 = v3;

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3_cold_1((uint64_t *)(a1 + 40), a1, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v21 = 138412290;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_DEFAULT, "Successfully processed visual search results: %@", (uint8_t *)&v21, 0xCu);
    }

    id v9 = [*(id *)(a1 + 56) userFeedbackPayload];
    [*(id *)(a1 + 48) setUserReportPayload:v9];

    [*(id *)(a1 + 48) setDidProcessResult:1];
    id v10 = [*(id *)(a1 + 56) resultItems];
    int v11 = [v10 firstObject];
    id v12 = [v11 searchItem];
    id v13 = [*(id *)(a1 + 48) visualSearchResultItem];
    [v13 setSearchItem:v12];

    uint64_t v14 = *(void *)(a1 + 72);
    id v15 = [*(id *)(a1 + 48) visualSearchResultItem];
    [v15 setQueryID:v14];

    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = [*(id *)(a1 + 48) visualSearchResultItem];
    long long v18 = [v17 searchItem];
    long long v19 = [v18 searchSections];
    (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v19, 0);

    long long v20 = [*(id *)(a1 + 48) delegate];
    [v20 visualSearchItemView:*(void *)(a1 + 48) didProcessResultsWithDuration:v4];
  }
}

- (void)showLookupUIPaneForResultItem
{
  double v3 = [(VKCVisualSearchResultItemView *)self _queryForProcessingResult];
  id v4 = objc_alloc(MEMORY[0x1E4F962F0]);
  uint64_t v5 = [(VKCVisualSearchResultItemView *)self _queryString];
  id v6 = objc_msgSend(v4, "initWithSearchQuery:rangeInContext:", v3, 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v5, "length"));

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__VKCVisualSearchResultItemView_showLookupUIPaneForResultItem__block_invoke;
  v13[3] = &unk_1E6BF0A40;
  v13[4] = self;
  [v6 setReportAnIssueExtendedBlock:v13];
  id v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [v7 UUIDString];

  [(VKCVisualSearchResultItemView *)self setCurrentRVItemID:v8];
  [v6 setClientHints:v8];
  id v9 = [(VKCVisualSearchResultItemView *)self delegate];
  [v9 addMetadataToVSFeedbackItem:v6];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v11 = getkDDRVInteractionDidFinishNotification_0();
  [v10 addObserver:self selector:sel__didDismissVisualResultsPane_ name:v11 object:0];

  [(VKCVisualSearchResultItemView *)self setObservingInteractionDidFinish:1];
  objc_msgSend(getDDRevealBridgeClass(), "performDefaultActionForRVItem:view:location:fallbackMenuInteraction:context:", v6, self->_lookupButton, 0, MEMORY[0x1E4F1CC08], *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v12 = [(VKCVisualSearchResultItemView *)self delegate];
  [v12 visualSearchItemViewDidActivateVSItem:self];
}

void __62__VKCVisualSearchResultItemView_showLookupUIPaneForResultItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 delegate];
  uint64_t v8 = [*(id *)(a1 + 32) userReportPayload];
  [v9 submitVisualSearchUserFeedbackForReportIdentifier:v7 userFeedbackPayload:v8 sfReportData:v6];
}

- (VKCVisualSearchResultItemViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCVisualSearchResultItemViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VKCVisualSearchResultItem)visualSearchResultItem
{
  return self->_visualSearchResultItem;
}

- (void)setVisualSearchResultItem:(id)a3
{
}

- (NSData)userReportPayload
{
  return self->_userReportPayload;
}

- (void)setUserReportPayload:(id)a3
{
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (BOOL)automaticallyShowVisualSearchResults
{
  return self->_automaticallyShowVisualSearchResults;
}

- (void)setAutomaticallyShowVisualSearchResults:(BOOL)a3
{
  self->_automaticallyShowVisualSearchResults = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (VKCLookupButton)lookupButton
{
  return self->_lookupButton;
}

- (void)setLookupButton:(id)a3
{
}

- (CALayer)iconInLookupButtonLayer
{
  return self->_iconInLookupButtonLayer;
}

- (void)setIconInLookupButtonLayer:(id)a3
{
}

- (CGSize)cachedDotSize
{
  double width = self->_cachedDotSize.width;
  double height = self->_cachedDotSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedDotSize:(CGSize)a3
{
  self->_cachedDotSize = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (CALayer)pinLayer
{
  return self->_pinLayer;
}

- (void)setPinLayer:(id)a3
{
}

- (CALayer)pulsingLayer
{
  return self->_pulsingLayer;
}

- (void)setPulsingLayer:(id)a3
{
}

- (BOOL)didProcessResult
{
  return self->_didProcessResult;
}

- (void)setDidProcessResult:(BOOL)a3
{
  self->_didProcessResult = a3;
}

- (BOOL)isShowingVisualResultsPane
{
  return self->_isShowingVisualResultsPane;
}

- (void)setIsShowingVisualResultsPane:(BOOL)a3
{
  self->_isShowingVisualResultsPane = a3;
}

- (NSString)currentRVItemID
{
  return self->_currentRVItemID;
}

- (void)setCurrentRVItemID:(id)a3
{
}

- (BOOL)observingInteractionDidFinish
{
  return self->_observingInteractionDidFinish;
}

- (void)setObservingInteractionDidFinish:(BOOL)a3
{
  self->_observingInteractionDidFinish = a3;
}

- (BOOL)shouldShowDots
{
  return self->_shouldShowDots;
}

- (void)setShouldShowDots:(BOOL)a3
{
  self->_shouldShowDots = a3;
}

- (CGRect)currentImageRectForLayerContents
{
  double x = self->_currentImageRectForLayerContents.origin.x;
  double y = self->_currentImageRectForLayerContents.origin.y;
  double width = self->_currentImageRectForLayerContents.size.width;
  double height = self->_currentImageRectForLayerContents.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentImageRectForLayerContents:(CGRect)a3
{
  self->_currentImageRectForLayerContents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRVItemID, 0);
  objc_storeStrong((id *)&self->_pulsingLayer, 0);
  objc_storeStrong((id *)&self->_pinLayer, 0);
  objc_storeStrong((id *)&self->_iconInLookupButtonLayer, 0);
  objc_storeStrong((id *)&self->_lookupButton, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userReportPayload, 0);
  objc_storeStrong((id *)&self->_visualSearchResultItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tintedImageForButton, 0);
}

- (void)tintedImageForButton
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "imageForButton returned nil for Result item: %@", buf, 0xCu);
}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Server access was not permitted: %@", (uint8_t *)&v3, 0xCu);
}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 48);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Could not process analysis result with error: %@, %@", (uint8_t *)&v5, 0x16u);
}

@end