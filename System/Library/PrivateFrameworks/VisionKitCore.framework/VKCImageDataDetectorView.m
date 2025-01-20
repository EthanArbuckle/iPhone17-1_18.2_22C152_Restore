@interface VKCImageDataDetectorView
- (BOOL)allowLongPressDDActivationOnly;
- (BOOL)dataDetectorElementView:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)highlightSelectableItems;
- (BOOL)needsElementFrameUpdate;
- (BOOL)shouldFilterElementForSpecialCase:(id)a3;
- (CGRect)boundsUsedToCalculateElementFrames;
- (CGRect)contentsRectUsedToCalculateElementFrames;
- (CGRect)frameForDataDetectorElement:(id)a3;
- (CGRect)previewImageBoundsForDataDetectorElementView:(id)a3;
- (NSArray)allElements;
- (NSArray)displayedElementViews;
- (NSArray)displayedElements;
- (NSArray)unfilteredElements;
- (NSMutableSet)_displayedElementViews;
- (VKCImageDataDetectorView)initWithFrame:(CGRect)a3;
- (VKCImageDataDetectorViewDelegate)delegate;
- (id)closestElementToPoint:(CGPoint)a3 maxDistance:(double)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)presentingViewControllerForInteractionWithDataDetectorElementView:(id)a3;
- (id)previewForDataDetectorElementView:(id)a3;
- (id)previewImageForDataDetectorElementView:(id)a3;
- (id)viewSpaceQuadsForDataDetectorElement:(id)a3;
- (unint64_t)dataDetectorTypes;
- (void)activateLongPressDataDetectorAtPoint:(CGPoint)a3 maxDistance:(double)a4;
- (void)dataDetectorElementView:(id)a3 analyticsEventOccured:(id)a4;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)loadDataDetectorViewsFromDisplayedElements;
- (void)setAllElements:(id)a3;
- (void)setAllowLongPressDDActivationOnly:(BOOL)a3;
- (void)setBoundsUsedToCalculateElementFrames:(CGRect)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setContentsRectUsedToCalculateElementFrames:(CGRect)a3;
- (void)setCustomAnalyticsIdentifier:(id)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedElements:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightSelectableItems:(BOOL)a3;
- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4;
- (void)setRecognitionResult:(id)a3;
- (void)setUnfilteredElements:(id)a3;
- (void)set_displayedElementViews:(id)a3;
- (void)updateAllElementViewFrames;
- (void)updateAllElementViewFramesIfNecessary;
- (void)updateDisplayedElements;
- (void)willDismissMenuForDataDetectorElementView:(id)a3;
- (void)willDisplayMenuForDataDetectorElementView:(id)a3;
@end

@implementation VKCImageDataDetectorView

- (VKCImageDataDetectorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView;
  v3 = -[VKCImageBaseOverlayView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    displayedElementViews = v3->__displayedElementViews;
    v3->__displayedElementViews = v4;

    CGPoint v6 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v3->_boundsUsedToCalculateElementFrames.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v3->_boundsUsedToCalculateElementFrames.size = v7;
    v3->_contentsRectUsedToCalculateElementFrames.origin = v6;
    v3->_contentsRectUsedToCalculateElementFrames.size = v7;
  }
  return v3;
}

- (void)setRecognitionResult:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKCImageDataDetectorView;
  id v4 = a3;
  [(VKCImageBaseOverlayView *)&v7 setRecognitionResult:v4];
  v5 = objc_msgSend(v4, "dataDetectors", v7.receiver, v7.super_class);
  [(VKCImageDataDetectorView *)self setAllElements:v5];

  CGPoint v6 = [v4 unfilteredDataDetectors];

  [(VKCImageDataDetectorView *)self setUnfilteredElements:v6];
  [(VKCImageDataDetectorView *)self updateDisplayedElements];
}

- (NSArray)displayedElementViews
{
  v2 = [(VKCImageDataDetectorView *)self _displayedElementViews];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
  [(VKCImageDataDetectorView *)self updateDisplayedElements];
}

- (void)setContentsRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageBaseOverlayView setContentsRect:](&v4, sel_setContentsRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageDataDetectorView *)self updateAllElementViewFramesIfNecessary];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageDataDetectorView;
  [(VKCImageDataDetectorView *)&v3 layoutSubviews];
  [(VKCImageDataDetectorView *)self updateAllElementViewFramesIfNecessary];
}

- (void)didMoveToSuperview
{
  v8.receiver = self;
  v8.super_class = (Class)VKCImageDataDetectorView;
  [(VKCImageDataDetectorView *)&v8 didMoveToSuperview];
  uint64_t v3 = [(VKCImageDataDetectorView *)self superview];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(VKCImageDataDetectorView *)self displayedElementViews];
    if ([v5 count])
    {
    }
    else
    {
      CGPoint v6 = [(VKCImageDataDetectorView *)self displayedElements];
      uint64_t v7 = [v6 count];

      if (v7) {
        [(VKCImageDataDetectorView *)self loadDataDetectorViewsFromDisplayedElements];
      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageDataDetectorView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageDataDetectorView *)self updateAllElementViewFramesIfNecessary];
}

- (void)setCustomAnalyticsIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView;
  [(VKCImageBaseOverlayView *)&v9 setCustomAnalyticsIdentifier:v4];
  v5 = [(VKCImageDataDetectorView *)self _displayedElementViews];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__VKCImageDataDetectorView_setCustomAnalyticsIdentifier___block_invoke;
  v7[3] = &unk_1E6BF3830;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __57__VKCImageDataDetectorView_setCustomAnalyticsIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomAnalyticsIdentifier:*(void *)(a1 + 32)];
}

- (void)activateLongPressDataDetectorAtPoint:(CGPoint)a3 maxDistance:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = -[VKCImageDataDetectorView closestElementToPoint:maxDistance:](self, "closestElementToPoint:maxDistance:");
  objc_super v9 = [(VKCImageDataDetectorView *)self _displayedElementViews];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__VKCImageDataDetectorView_activateLongPressDataDetectorAtPoint_maxDistance___block_invoke;
  v13[3] = &unk_1E6BF3858;
  id v10 = v8;
  id v14 = v10;
  v11 = objc_msgSend(v9, "vk_objectPassingTest:", v13);

  if (!v11)
  {
    v12 = VKMUIStringForPoint(x, y);
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "elementView != ((void *)0)", "-[VKCImageDataDetectorView activateLongPressDataDetectorAtPoint:maxDistance:]", 0, 0, @"Attempting to activate a long press data detector but no elementView was found. point: %@ maxDistance: %f", v12, *(void *)&a4);
  }
  [v11 manuallyActivateLongPressMenuInteraction];
}

BOOL __77__VKCImageDataDetectorView_activateLongPressDataDetectorAtPoint_maxDistance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dataDetectorElement];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)setAllowLongPressDDActivationOnly:(BOOL)a3
{
  if (self->_allowLongPressDDActivationOnly != a3)
  {
    self->_allowLongPressDDActivationOnldouble y = a3;
    BOOL v4 = [(VKCImageDataDetectorView *)self _displayedElementViews];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__VKCImageDataDetectorView_setAllowLongPressDDActivationOnly___block_invoke;
    v5[3] = &__block_descriptor_33_e40_v24__0__VKCDataDetectorElementView_8_B16l;
    BOOL v6 = a3;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

uint64_t __62__VKCImageDataDetectorView_setAllowLongPressDDActivationOnly___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowLongPressDDActivationOnly:*(unsigned __int8 *)(a1 + 32)];
}

- (void)updateDisplayedElements
{
  uint64_t v3 = [(VKCImageDataDetectorView *)self allElements];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__VKCImageDataDetectorView_updateDisplayedElements__block_invoke;
  v5[3] = &unk_1E6BF38A0;
  void v5[4] = self;
  BOOL v4 = objc_msgSend(v3, "vk_objectsPassingTest:", v5);
  [(VKCImageDataDetectorView *)self setDisplayedElements:v4];

  [(VKCImageDataDetectorView *)self loadDataDetectorViewsFromDisplayedElements];
}

uint64_t __51__VKCImageDataDetectorView_updateDisplayedElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 520);
  uint64_t v5 = [v3 dataDetectorTypes] & v4;
  if (v5 == [v3 dataDetectorTypes]) {
    uint64_t v6 = [*(id *)(a1 + 32) shouldFilterElementForSpecialCase:v3] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)shouldFilterElementForSpecialCase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCImageBaseOverlayView *)self recognitionResult];
  if ([v4 dataDetectorTypes] == 4)
  {
    [v5 imageSize];
    double v7 = v6;
    double v8 = VKMRectWithSize();
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    v15 = [v4 quad];
    [v15 boundingBox];
    VKMRectFromNormalizedSubrect(v8, v10, v12, v14, v16, v17, v18, v19);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    v28 = [MEMORY[0x1E4F42F80] currentTraitCollection];
    if (!objc_msgSend(v28, "vk_isRTL")) {
      double v7 = 0.0;
    }

    VKMDistanceToRect(v7, 0.0, v21, v23, v25, v27);
    BOOL v30 = v29 < 120.0;
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView;
  id v4 = -[VKCImageDataDetectorView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = objc_opt_class();
  double v6 = VKDynamicCast(v5, (uint64_t)v4);
  double v7 = v6;
  if (v6 && [v6 ignoresHitTest])
  {

    id v4 = 0;
  }

  return v4;
}

- (void)loadDataDetectorViewsFromDisplayedElements
{
  id v3 = [(VKCImageDataDetectorView *)self superview];

  if (v3)
  {
    id v4 = [(VKCImageDataDetectorView *)self _displayedElementViews];
    [v4 makeObjectsPerformSelector:sel_removeFromSuperview];
    [v4 removeAllObjects];
    uint64_t v5 = [(VKCImageDataDetectorView *)self unfilteredElements];
    double v6 = [(VKCImageDataDetectorView *)self displayedElements];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = [(VKCImageDataDetectorView *)self allowLongPressDDActivationOnly];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__VKCImageDataDetectorView_loadDataDetectorViewsFromDisplayedElements__block_invoke;
    v11[3] = &unk_1E6BF38C8;
    id v12 = v5;
    double v13 = self;
    id v14 = v4;
    uint64_t v15 = v7;
    BOOL v16 = v8;
    id v9 = v4;
    id v10 = v5;
    [v6 enumerateObjectsUsingBlock:v11];
    [(VKCImageDataDetectorView *)self updateAllElementViewFrames];
  }
}

void __70__VKCImageDataDetectorView_loadDataDetectorViewsFromDisplayedElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(objc_class **)(a1 + 56);
  id v4 = a2;
  id v7 = (id)[[v3 alloc] initWithDataDetectorElement:v4 unfilteredElements:*(void *)(a1 + 32)];

  uint64_t v5 = [*(id *)(a1 + 40) customAnalyticsIdentifier];
  [v7 setCustomAnalyticsIdentifier:v5];

  double v6 = [*(id *)(a1 + 40) analysisResult];
  objc_msgSend(v7, "setAnalysisRequestID:", objc_msgSend(v6, "analysisRequestID"));

  [*(id *)(a1 + 48) addObject:v7];
  [v7 setDelegate:*(void *)(a1 + 40)];
  [v7 setAllowLongPressDDActivationOnly:*(unsigned __int8 *)(a1 + 64)];
  [*(id *)(a1 + 40) addSubview:v7];
}

- (void)updateAllElementViewFramesIfNecessary
{
  if ([(VKCImageDataDetectorView *)self needsElementFrameUpdate])
  {
    [(VKCImageDataDetectorView *)self updateAllElementViewFrames];
  }
}

- (void)updateAllElementViewFrames
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(VKCImageDataDetectorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VKCImageBaseOverlayView *)self contentsRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (VKMRectHasArea(v4, v6, v8, v10) && VKMRectHasArea(v12, v14, v16, v18))
  {
    -[VKCImageDataDetectorView setBoundsUsedToCalculateElementFrames:](self, "setBoundsUsedToCalculateElementFrames:", v4, v6, v8, v10);
    -[VKCImageDataDetectorView setContentsRectUsedToCalculateElementFrames:](self, "setContentsRectUsedToCalculateElementFrames:", v12, v14, v16, v18);
    CGFloat v19 = [(VKCImageDataDetectorView *)self _displayedElementViews];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __54__VKCImageDataDetectorView_updateAllElementViewFrames__block_invoke;
    v23[3] = &unk_1E6BF3830;
    v23[4] = self;
    [v19 enumerateObjectsUsingBlock:v23];
  }
  else
  {
    double v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      CGFloat v21 = VKMUIStringForRect(v4, v6, v8, v10);
      double v22 = VKMUIStringForRect(v12, v14, v16, v18);
      *(_DWORD *)buf = 138412546;
      CGFloat v25 = v21;
      __int16 v26 = 2112;
      CGFloat v27 = v22;
      _os_log_error_impl(&dword_1DB266000, v20, OS_LOG_TYPE_ERROR, "Attempting to update all DD element frames, but the bounds or contentsRect are invalid. Bounds: %@, contentsRect: %@ , skipping", buf, 0x16u);
    }
  }
}

void __54__VKCImageDataDetectorView_updateAllElementViewFrames__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 dataDetectorElement];
  [v2 frameForDataDetectorElement:v4];
  objc_msgSend(v3, "setFrame:");
}

- (BOOL)needsElementFrameUpdate
{
  v2 = self;
  [(VKCImageDataDetectorView *)self bounds];
  double v31 = v4;
  double v32 = v3;
  double v6 = v5;
  double v8 = v7;
  [(VKCImageBaseOverlayView *)v2 contentsRect];
  double v35 = v10;
  double v36 = v9;
  double v33 = v12;
  double v34 = v11;
  [(VKCImageDataDetectorView *)v2 boundsUsedToCalculateElementFrames];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(VKCImageDataDetectorView *)v2 contentsRectUsedToCalculateElementFrames];
  double v22 = v21;
  double v24 = v23;
  double v29 = v26;
  double v30 = v25;
  LOBYTE(v2) = VKMSizeIsEmptyOrHasNanOrInf(v6, v8);
  BOOL v27 = VKMNearlyEqualRects(v32, v31, v6, v8, v14, v16, v18, v20);
  return (v2 | v27 & VKMNearlyEqualRects(v36, v35, v34, v33, v22, v24, v30, v29)) ^ 1;
}

- (CGRect)frameForDataDetectorElement:(id)a3
{
  id v4 = a3;
  [(VKCImageBaseOverlayView *)self contentsRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [v4 quad];

  double v14 = objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", self, v6, v8, v10, v12);

  [v14 boundingBox];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (id)viewSpaceQuadsForDataDetectorElement:(id)a3
{
  id v4 = a3;
  [(VKCImageBaseOverlayView *)self contentsRect];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  double v13 = self;
  double v14 = [v4 boundingQuads];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__VKCImageDataDetectorView_viewSpaceQuadsForDataDetectorElement___block_invoke;
  v18[3] = &unk_1E6BF38F0;
  double v19 = v13;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;
  uint64_t v23 = v12;
  double v15 = v13;
  double v16 = objc_msgSend(v14, "vk_compactMap:", v18);

  return v16;
}

uint64_t __65__VKCImageDataDetectorView_viewSpaceQuadsForDataDetectorElement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)closestElementToPoint:(CGPoint)a3 maxDistance:(double)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__17;
  double v25 = __Block_byref_object_dispose__17;
  id v26 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FF0000000000000;
  [(VKCImageBaseOverlayView *)self contentsRect];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  double v16 = [(VKCImageDataDetectorView *)self displayedElementViews];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__VKCImageDataDetectorView_closestElementToPoint_maxDistance___block_invoke;
  v19[3] = &unk_1E6BF3918;
  *(double *)&v19[7] = a4;
  *(CGFloat *)&v19[8] = x;
  *(CGFloat *)&v19[9] = y;
  v19[10] = v9;
  v19[11] = v11;
  v19[12] = v13;
  v19[13] = v15;
  v19[4] = self;
  v19[5] = v20;
  v19[6] = &v21;
  [v16 enumerateObjectsUsingBlock:v19];

  id v17 = (id)v22[5];
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __62__VKCImageDataDetectorView_closestElementToPoint_maxDistance___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  [v6 frame];
  v30.origin.CGFloat x = VKMRectFromAddingSize(v7, v8, v9, v10, *(double *)(a1 + 56));
  if (CGRectContainsPoint(v30, *(CGPoint *)(a1 + 64)))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v11 = objc_msgSend(v6, "dataDetectorElement", 0);
    uint64_t v12 = [v11 boundingQuads];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 32), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
          objc_msgSend(v17, "mininumDistanceToPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
          double v19 = v18;
          double v20 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          if (v19 < v20)
          {
            uint64_t v21 = [v6 dataDetectorElement];
            uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v23 = *(void **)(v22 + 40);
            *(void *)(v22 + 40) = v21;

            *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;
            double v20 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          }
          if (v20 <= 0.0)
          {
            *a4 = 1;

            goto LABEL_14;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)setHighlightSelectableItems:(BOOL)a3
{
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlightSelectableItems != a3) {
    self->_highlightSelectableItems = a3;
  }
}

- (BOOL)dataDetectorElementView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  id v4 = self;
  objc_msgSend(a3, "convertPoint:toView:", self, a4.x, a4.y);
  double v6 = v5;
  double v8 = v7;
  CGFloat v9 = [(VKCImageDataDetectorView *)v4 delegate];
  LOBYTE(v4) = objc_msgSend(v9, "dataDetectorView:dataDetectorInteractionShouldBeginAtPoint:", v4, v6, v8);

  return (char)v4;
}

- (void)willDisplayMenuForDataDetectorElementView:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 dataDetectorElement];
    double v7 = [(VKCImageBaseOverlayView *)self analysisResult];
    int v9 = 138412546;
    CGFloat v10 = v6;
    __int16 v11 = 1024;
    int v12 = [v7 analysisRequestID];
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Presenting menu for DD: %@ : id: %d", (uint8_t *)&v9, 0x12u);
  }
  double v8 = [(VKCImageDataDetectorView *)self delegate];
  [v8 willDisplayMenuForDataDetectorView:self];
}

- (void)willDismissMenuForDataDetectorElementView:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 dataDetectorElement];
    double v7 = [(VKCImageBaseOverlayView *)self analysisResult];
    int v9 = 138412546;
    CGFloat v10 = v6;
    __int16 v11 = 1024;
    int v12 = [v7 analysisRequestID];
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing menu for DD: %@ : id: %d", (uint8_t *)&v9, 0x12u);
  }
  double v8 = [(VKCImageDataDetectorView *)self delegate];
  [v8 willDismissMenuForDataDetectorView:self];
}

- (id)presentingViewControllerForInteractionWithDataDetectorElementView:(id)a3
{
  id v4 = [(VKCImageDataDetectorView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [v4 presentingViewControllerForInteractionWithDataDetectorView:self];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)previewForDataDetectorElementView:(id)a3
{
  id v4 = a3;
  double v5 = [(VKCImageDataDetectorView *)self delegate];
  double v6 = [v5 previewForDataDetectorElementView:v4];

  return v6;
}

- (id)previewImageForDataDetectorElementView:(id)a3
{
  id v4 = a3;
  double v5 = [(VKCImageDataDetectorView *)self delegate];
  double v6 = [v5 previewImageForDataDetectorElementView:v4];

  return v6;
}

- (CGRect)previewImageBoundsForDataDetectorElementView:(id)a3
{
  [(VKCImageDataDetectorView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v5, v7, v9, v11, v12, v13, v14, v15);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)dataDetectorElementView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageDataDetectorView *)self delegate];
  [v6 dataDetectorView:self analyticsEventOccured:v5];
}

- (VKCImageDataDetectorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCImageDataDetectorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (NSArray)displayedElements
{
  return self->_displayedElements;
}

- (void)setDisplayedElements:(id)a3
{
}

- (NSArray)unfilteredElements
{
  return self->_unfilteredElements;
}

- (void)setUnfilteredElements:(id)a3
{
}

- (BOOL)highlightSelectableItems
{
  return self->_highlightSelectableItems;
}

- (BOOL)allowLongPressDDActivationOnly
{
  return self->_allowLongPressDDActivationOnly;
}

- (NSArray)allElements
{
  return self->_allElements;
}

- (void)setAllElements:(id)a3
{
}

- (NSMutableSet)_displayedElementViews
{
  return self->__displayedElementViews;
}

- (void)set_displayedElementViews:(id)a3
{
}

- (CGRect)boundsUsedToCalculateElementFrames
{
  double x = self->_boundsUsedToCalculateElementFrames.origin.x;
  double y = self->_boundsUsedToCalculateElementFrames.origin.y;
  double width = self->_boundsUsedToCalculateElementFrames.size.width;
  double height = self->_boundsUsedToCalculateElementFrames.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundsUsedToCalculateElementFrames:(CGRect)a3
{
  self->_boundsUsedToCalculateElementFrames = a3;
}

- (CGRect)contentsRectUsedToCalculateElementFrames
{
  double x = self->_contentsRectUsedToCalculateElementFrames.origin.x;
  double y = self->_contentsRectUsedToCalculateElementFrames.origin.y;
  double width = self->_contentsRectUsedToCalculateElementFrames.size.width;
  double height = self->_contentsRectUsedToCalculateElementFrames.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentsRectUsedToCalculateElementFrames:(CGRect)a3
{
  self->_contentsRectUsedToCalculateElementFrames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayedElementViews, 0);
  objc_storeStrong((id *)&self->_allElements, 0);
  objc_storeStrong((id *)&self->_unfilteredElements, 0);
  objc_storeStrong((id *)&self->_displayedElements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __61__VKCImageDataDetectorView_macOS_pathForDataDetectorElement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 path];
}

id __56__VKCImageDataDetectorView_macOS_setupButtonForElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v4 = a2;
  if (a4 - 1 == a3) {
    double v4 = *(void **)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  CGFloat v7 = [v4 normalizedQuadFromView:v5];

  return v7;
}

@end