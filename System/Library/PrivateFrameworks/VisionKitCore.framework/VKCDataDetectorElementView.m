@interface VKCDataDetectorElementView
- (BOOL)allowLongPressDDActivationOnly;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)ignoresHitTest;
- (BOOL)isAccessibilityElement;
- (BOOL)isPerformingManualContextInvocation;
- (BOOL)isPointInQuad:(CGPoint)a3;
- (BOOL)shouldUseBCSAction;
- (CAShapeLayer)highlightPathLayer;
- (CGRect)rectForMrcActionInViewController:(id)a3;
- (NSArray)allDataDetectorElements;
- (NSArray)subQuadsInBoundsCoordinates;
- (NSDictionary)dataDetectorContext;
- (NSString)customAnalyticsIdentifier;
- (UIBezierPath)highlightPath;
- (UIContextMenuInteraction)menuInteraction;
- (UIPointerInteraction)pointerInteraction;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (VKCBaseDataDetectorElement)dataDetectorElement;
- (VKCDataDetectorElementView)initWithDataDetectorElement:(id)a3 unfilteredElements:(id)a4;
- (VKCDataDetectorElementViewDelegate)delegate;
- (VKCMRCDataDetectorElement)mrcElement;
- (VKQuad)boundingQuadInBoundsCoordinates;
- (double)lineWithForAverageSubquadHeight;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (id)analyticsEventWithDDType:(int64_t)a3;
- (id)calcPathForUnderline;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)presentingViewControllerForInteraction;
- (int)analysisRequestID;
- (unint64_t)accessibilityTraits;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didTap:(id)a3;
- (void)highlighter:(id)a3 shouldHighlight:(BOOL)a4;
- (void)layoutSubviews;
- (void)manuallyActivateLongPressMenuInteraction;
- (void)sendAnalyticsEventIfNecessaryForDDType:(int64_t)a3;
- (void)setAllowLongPressDDActivationOnly:(BOOL)a3;
- (void)setAnalysisRequestID:(int)a3;
- (void)setCustomAnalyticsIdentifier:(id)a3;
- (void)setDataDetectorContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightPath:(id)a3;
- (void)setHighlightPathLayer:(id)a3;
- (void)setIsPerformingManualContextInvocation:(BOOL)a3;
- (void)setMenuInteraction:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)updateHighlightPath;
@end

@implementation VKCDataDetectorElementView

- (VKCDataDetectorElementView)initWithDataDetectorElement:(id)a3 unfilteredElements:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VKCDataDetectorElementView;
  v9 = [(VKCDataDetectorElementView *)&v21 init];
  if (v9)
  {
    if (!v7) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((element) != nil)", "-[VKCDataDetectorElementView initWithDataDetectorElement:unfilteredElements:]", 0, 0, @"Expected non-nil value for '%s'", "element");
    }
    objc_storeStrong((id *)&v9->_dataDetectorElement, a3);
    objc_storeStrong((id *)&v9->_allDataDetectorElements, a4);
    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    highlightPathLayer = v9->_highlightPathLayer;
    v9->_highlightPathLayer = v10;

    [(CAShapeLayer *)v9->_highlightPathLayer setContentsGravity:*MEMORY[0x1E4F3A3E0]];
    id v12 = [MEMORY[0x1E4F428B8] clearColor];
    -[CAShapeLayer setFillColor:](v9->_highlightPathLayer, "setFillColor:", [v12 CGColor]);

    v13 = [(VKCDataDetectorElementView *)v9 layer];
    [v13 addSublayer:v9->_highlightPathLayer];

    [(VKCDataDetectorElementView *)v9 setAccessibilityIdentifier:@"com.apple.visionkit.dataDetectorElementView"];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F428F8]) initWithDelegate:v9];
    menuInteraction = v9->_menuInteraction;
    v9->_menuInteraction = (UIContextMenuInteraction *)v14;

    [(VKCDataDetectorElementView *)v9 addInteraction:v9->_menuInteraction];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v9];
    pointerInteraction = v9->_pointerInteraction;
    v9->_pointerInteraction = (UIPointerInteraction *)v16;

    [(VKCDataDetectorElementView *)v9 addInteraction:v9->_pointerInteraction];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v9 action:sel_didTap_];
    [v18 setDelegate:v9];
    [(VKCDataDetectorElementView *)v9 addGestureRecognizer:v18];
    [(VKCDataDetectorElementView *)v9 setTapGestureRecognizer:v18];
    v19 = [(VKCDataDetectorElementView *)v9 mrcElement];
    [v19 setDelegate:v9];
  }
  return v9;
}

- (BOOL)shouldUseBCSAction
{
  v2 = [(VKCDataDetectorElementView *)self mrcElement];
  v3 = [v2 barcodeAction];
  BOOL v4 = v3 != 0;

  return v4;
}

- (VKCMRCDataDetectorElement)mrcElement
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  v5 = VKDynamicCast(v3, (uint64_t)v4);

  return (VKCMRCDataDetectorElement *)v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKCDataDetectorElementView;
  [(VKCDataDetectorElementView *)&v3 layoutSubviews];
  [(VKCDataDetectorElementView *)self updateHighlightPath];
}

- (void)updateHighlightPath
{
  if ((vk_isSeedBuild() & 1) == 0)
  {
    objc_super v3 = [(VKCDataDetectorElementView *)self calcPathForUnderline];
    [(VKCDataDetectorElementView *)self setHighlightPath:v3];

    BOOL v4 = [(VKCDataDetectorElementView *)self highlightPath];
    uint64_t v5 = objc_msgSend(v4, "vk_CGPath");
    v6 = [(VKCDataDetectorElementView *)self highlightPathLayer];
    [v6 setPath:v5];

    [(VKCDataDetectorElementView *)self lineWithForAverageSubquadHeight];
    double v8 = v7;
    v9 = [(VKCDataDetectorElementView *)self highlightPathLayer];
    [v9 setLineWidth:v8];

    id v12 = [MEMORY[0x1E4F428B8] systemGrayColor];
    uint64_t v10 = [v12 CGColor];
    v11 = [(VKCDataDetectorElementView *)self highlightPathLayer];
    [v11 setStrokeColor:v10];
  }
}

- (void)setAllowLongPressDDActivationOnly:(BOOL)a3
{
  if (self->_allowLongPressDDActivationOnly != a3)
  {
    self->_allowLongPressDDActivationOnly = a3;
    [(VKCDataDetectorElementView *)self updateHighlightPath];
    BOOL v4 = !self->_allowLongPressDDActivationOnly;
    id v5 = [(VKCDataDetectorElementView *)self pointerInteraction];
    [v5 setEnabled:v4];
  }
}

- (double)lineWithForAverageSubquadHeight
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  int v4 = [v3 isTextDataDetector];

  double v5 = 2.0;
  if (v4)
  {
    v6 = [(VKCDataDetectorElementView *)self subQuadsInBoundsCoordinates];
    if ([v6 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        double v11 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "maxHeight", (void)v16);
            double v11 = v11 + v13;
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
      else
      {
        double v11 = 0.0;
      }

      unint64_t v14 = [v7 count];
      if (v11 / (double)v14 * 0.07 >= 1.0) {
        double v5 = v11 / (double)v14 * 0.07;
      }
      else {
        double v5 = 1.0;
      }
    }
  }
  return v5;
}

- (id)calcPathForUnderline
{
  objc_super v3 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  int v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if (![v3 isTextDataDetector]
    || [(VKCDataDetectorElementView *)self allowLongPressDDActivationOnly])
  {
    [v4 isMRCDataDetector];
LABEL_5:
    id v5 = 0;
    goto LABEL_6;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  uint64_t v8 = [(VKCDataDetectorElementView *)self subQuadsInBoundsCoordinates];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__VKCDataDetectorElementView_calcPathForUnderline__block_invoke;
  v9[3] = &unk_1E6BF1190;
  id v5 = v7;
  id v10 = v5;
  [v8 enumerateObjectsUsingBlock:v9];

LABEL_6:
  return v5;
}

uint64_t __50__VKCDataDetectorElementView_calcPathForUnderline__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v4 bottomLeft];
  objc_msgSend(v3, "moveToPoint:");
  id v5 = *(void **)(a1 + 32);
  [v4 bottomRight];
  double v7 = v6;
  double v9 = v8;

  return objc_msgSend(v5, "vk_addLineToPoint:", v7, v9);
}

- (NSArray)subQuadsInBoundsCoordinates
{
  [(VKCDataDetectorElementView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  double v11 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  [v11 boundingBox];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;

  v20 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  uint64_t v21 = [v20 boundingQuads];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__VKCDataDetectorElementView_subQuadsInBoundsCoordinates__block_invoke;
  v24[3] = &__block_descriptor_96_e22__32__0__VKQuad_8q16q24l;
  v24[4] = v13;
  v24[5] = v15;
  v24[6] = v17;
  v24[7] = v19;
  v24[8] = v4;
  v24[9] = v6;
  v24[10] = v8;
  v24[11] = v10;
  v22 = objc_msgSend(v21, "vk_compactMap:", v24);

  return (NSArray *)v22;
}

id __57__VKCDataDetectorElementView_subQuadsInBoundsCoordinates__block_invoke(double *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "subquadFromRect:", a1[4], a1[5], a1[6], a1[7]);
  uint64_t v4 = objc_msgSend(v3, "quadMultipliedBySize:", a1[10], a1[11]);

  return v4;
}

- (VKQuad)boundingQuadInBoundsCoordinates
{
  uint64_t v3 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  [v3 boundingBox];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  uint64_t v13 = [v12 quad];

  [(VKCDataDetectorElementView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = objc_msgSend(v13, "subquadFromRect:", v5, v7, v9, v11);
  uint64_t v19 = objc_msgSend(v18, "quadMultipliedBySize:", v15, v17);

  return (VKQuad *)v19;
}

- (NSDictionary)dataDetectorContext
{
  if (!self->_dataDetectorContext)
  {
    uint64_t v3 = [(VKCDataDetectorElementView *)self dataDetectorElement];
    double v4 = [v3 scannerResult];

    double v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v6 = [(VKCDataDetectorElementView *)self allDataDetectorElements];
    double v7 = objc_msgSend(v6, "vk_compactMap:", &__block_literal_global_25);

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    double v8 = (void *)getkDataDetectorsAllResultsKeySymbolLoc_ptr_0;
    uint64_t v31 = getkDataDetectorsAllResultsKeySymbolLoc_ptr_0;
    if (!getkDataDetectorsAllResultsKeySymbolLoc_ptr_0)
    {
      double v9 = (void *)DataDetectorsUILibrary_3();
      v29[3] = (uint64_t)dlsym(v9, "kDataDetectorsAllResultsKey");
      getkDataDetectorsAllResultsKeySymbolLoc_ptr_0 = v29[3];
      double v8 = (void *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (v8)
    {
      [(NSDictionary *)v5 vk_setNonNilObject:v7 forKey:*v8];
      double v10 = [(VKCDataDetectorElementView *)self dataDetectorElement];
      double v11 = [v10 groupedElementData];
      [(NSDictionary *)v5 vk_addEntriesFromNonNilDictionary:v11];

      if (vk_isSeedBuild())
      {
        uint64_t v12 = objc_alloc_init(VKCDataDetectorCatalystRevealHighlighter);
        [(VKCDataDetectorCatalystRevealHighlighter *)v12 setDelegate:self];
        [(VKCDataDetectorCatalystRevealHighlighter *)v12 setElementView:self];
        uint64_t v28 = 0;
        v29 = &v28;
        uint64_t v30 = 0x2020000000;
        uint64_t v13 = (void *)getkDDHighlighterKeySymbolLoc_ptr_0;
        uint64_t v31 = getkDDHighlighterKeySymbolLoc_ptr_0;
        if (!getkDDHighlighterKeySymbolLoc_ptr_0)
        {
          double v14 = (void *)DataDetectorsUILibrary_3();
          v29[3] = (uint64_t)dlsym(v14, "kDDHighlighterKey");
          getkDDHighlighterKeySymbolLoc_ptr_0 = v29[3];
          uint64_t v13 = (void *)v29[3];
        }
        _Block_object_dispose(&v28, 8);
        if (!v13)
        {
LABEL_21:
          v27 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
          _Block_object_dispose(&v28, 8);
          _Unwind_Resume(v27);
        }
        [(NSDictionary *)v5 vk_setNonNilObject:v12 forKey:*v13];
      }
      double v15 = [(VKCDataDetectorElementView *)self dataDetectorElement];
      double v16 = [v15 scannerResult];
      double v17 = [v16 value];
      uint64_t v18 = [v17 length];

      if (!v18)
      {
LABEL_15:
        dataDetectorContext = self->_dataDetectorContext;
        self->_dataDetectorContext = v5;

        goto LABEL_16;
      }
      uint64_t v19 = [v4 value];
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      v20 = (void *)getkDataDetectorsMiddleTextSymbolLoc_ptr;
      uint64_t v31 = getkDataDetectorsMiddleTextSymbolLoc_ptr;
      if (!getkDataDetectorsMiddleTextSymbolLoc_ptr)
      {
        uint64_t v21 = (void *)DataDetectorsUILibrary_3();
        v29[3] = (uint64_t)dlsym(v21, "kDataDetectorsMiddleText");
        getkDataDetectorsMiddleTextSymbolLoc_ptr = v29[3];
        v20 = (void *)v29[3];
      }
      _Block_object_dispose(&v28, 8);
      if (v20)
      {
        [(NSDictionary *)v5 setObject:v19 forKeyedSubscript:*v20];

        goto LABEL_15;
      }
    }
    else
    {
      getkDDRVInteractionDidFinishNotification_cold_1();
    }
    getkDDRVInteractionDidFinishNotification_cold_1();
    goto LABEL_21;
  }
LABEL_16:
  id DDContextMenuActionClass_0 = getDDContextMenuActionClass_0();
  v24 = self->_dataDetectorContext;
  [(VKCDataDetectorElementView *)self bounds];
  v25 = objc_msgSend(DDContextMenuActionClass_0, "updateContext:withSourceRect:", v24);
  return (NSDictionary *)v25;
}

id __49__VKCDataDetectorElementView_dataDetectorContext__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 scannerResult];
  uint64_t v3 = [v2 coreResult];

  return v3;
}

- (void)didTap:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  if (-[VKCDataDetectorElementView isPointInQuad:](self, "isPointInQuad:"))
  {
    double v8 = [(VKCDataDetectorElementView *)self delegate];
    int v9 = objc_msgSend(v8, "dataDetectorElementView:shouldBeginAtPoint:", self, v5, v7);

    if (v9)
    {
      [(VKCDataDetectorElementView *)self setIsPerformingManualContextInvocation:1];
      double v10 = [(VKCDataDetectorElementView *)self dataDetectorElement];
      double v11 = [v10 scannerResult];

      if (v11 && (vk_isSeedBuild() & 1) == 0)
      {
        uint64_t v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          double v14 = [(VKCDataDetectorElementView *)self dataDetectorElement];
          int v21 = 138412546;
          v22 = v14;
          __int16 v23 = 1024;
          int v24 = [(VKCDataDetectorElementView *)self analysisRequestID];
          _os_log_impl(&dword_1DB266000, v13, OS_LOG_TYPE_DEFAULT, "Performing default action for DD: %@, %d", (uint8_t *)&v21, 0x12u);
        }
        double v15 = [(VKCDataDetectorElementView *)self dataDetectorElement];
        double v16 = [v15 scannerResult];
        uint64_t v17 = [v16 coreResult];

        id DDContextMenuActionClass_0 = getDDContextMenuActionClass_0();
        uint64_t v19 = [(VKCDataDetectorElementView *)self menuInteraction];
        v20 = [(VKCDataDetectorElementView *)self dataDetectorContext];
        objc_msgSend(DDContextMenuActionClass_0, "performDefaultActionWithResult:inView:atLocation:withMenuInteraction:context:", v17, self, v19, v20, v5, v7);
      }
      else
      {
        uint64_t v12 = [(VKCDataDetectorElementView *)self menuInteraction];
        objc_msgSend(v12, "_presentMenuAtLocation:", v5, v7);
      }
      [(VKCDataDetectorElementView *)self sendAnalyticsEventIfNecessaryForDDType:0];
      [(VKCDataDetectorElementView *)self setIsPerformingManualContextInvocation:0];
    }
  }
}

- (BOOL)ignoresHitTest
{
  v2 = [(VKCDataDetectorElementView *)self pointerInteraction];
  char v3 = [v2 isEnabled] ^ 1;

  return v3;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self];
  double v5 = [MEMORY[0x1E4F42C88] effectWithPreview:v4];
  double v6 = [MEMORY[0x1E4F42CC0] styleWithEffect:v5 shape:0];

  return v6;
}

- (void)manuallyActivateLongPressMenuInteraction
{
  id v4 = [(VKCDataDetectorElementView *)self menuInteraction];
  char v3 = [(VKCDataDetectorElementView *)self boundingQuadInBoundsCoordinates];
  [v3 vertexCentroid];
  objc_msgSend(v4, "_presentMenuAtLocation:");
}

- (void)sendAnalyticsEventIfNecessaryForDDType:(int64_t)a3
{
  id v5 = [(VKCDataDetectorElementView *)self analyticsEventWithDDType:a3];
  if (v5)
  {
    id v4 = [(VKCDataDetectorElementView *)self delegate];
    [v4 dataDetectorElementView:self analyticsEventOccured:v5];
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "[(VKCDataDetectorElementView *)"Trying to send an analytics event sendAnalyticsEventIfNecessaryForDDType:bailing""]);
  }
}

- (id)analyticsEventWithDDType:(int64_t)a3
{
  id v5 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  if ([v5 isMRCDataDetector])
  {
    double v6 = [VKAnalyticsMRCEvent alloc];
LABEL_5:
    uint64_t v7 = objc_opt_class();
    double v8 = VKCheckedDynamicCast(v7, (uint64_t)v5);
    int v9 = [(VKCDataDetectorElementView *)self customAnalyticsIdentifier];
    double v10 = [(VKAnalyticsMRCEvent *)v6 initWithElement:v8 eventType:a3 customIdentifier:v9];

    goto LABEL_7;
  }
  if ([v5 isTextDataDetector])
  {
    double v6 = [VKAnalyticsDDEvent alloc];
    goto LABEL_5;
  }
  double v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VKCDataDetectorElementView *)self tapGestureRecognizer];
  if (v8 == v6)
  {
    BOOL v9 = [(VKCDataDetectorElementView *)self allowLongPressDDActivationOnly];

    if (!v9)
    {
      [v7 locationInView:self];
      BOOL v10 = -[VKCDataDetectorElementView isPointInQuad:](self, "isPointInQuad:");
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (id)presentingViewControllerForInteraction
{
  char v3 = [(VKCDataDetectorElementView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 presentingViewControllerForInteractionWithDataDetectorElementView:self],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [MEMORY[0x1E4F42FF8] _viewControllerForFullScreenPresentationFromView:self];
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[VKCDataDetectorElementView isPointInQuad:](self, "isPointInQuad:", a4, a3.x, a3.y)) {
    id v5 = self;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  return v6;
}

- (BOOL)isPointInQuad:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(VKCDataDetectorElementView *)self isHidden]) {
    return 0;
  }
  [(VKCDataDetectorElementView *)self alpha];
  if (v6 <= 0.0) {
    return 0;
  }
  id v7 = [(VKCDataDetectorElementView *)self boundingQuadInBoundsCoordinates];
  char v8 = objc_msgSend(v7, "containsPoint:", x, y);

  return v8;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(VKCDataDetectorElementView *)self delegate];
  int v8 = objc_msgSend(v7, "dataDetectorElementView:shouldBeginAtPoint:", self, x, y);

  if (v8)
  {
    BOOL v9 = [(VKCDataDetectorElementView *)self isPerformingManualContextInvocation];
    BOOL v10 = @"manualInvocation";
    if (!v9) {
      BOOL v10 = 0;
    }
    double v11 = v10;
    if ([(VKCDataDetectorElementView *)self shouldUseBCSAction])
    {
      uint64_t v12 = [(VKCDataDetectorElementView *)self mrcElement];
      uint64_t v13 = [(VKCDataDetectorElementView *)self presentingViewControllerForInteraction];
      [v12 setPresentingViewControllerForMrcAction:v13];

      double v14 = [v12 mrcMenu];
      double v15 = (void *)MEMORY[0x1E4F428F0];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __84__VKCDataDetectorElementView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
      v24[3] = &unk_1E6BF3018;
      id v25 = v14;
      id v16 = v14;
      uint64_t v17 = [v15 configurationWithIdentifier:v11 previewProvider:&__block_literal_global_79 actionProvider:v24];
    }
    else
    {
      id DDContextMenuActionClass_0 = getDDContextMenuActionClass_0();
      uint64_t v19 = [(VKCDataDetectorElementView *)self dataDetectorElement];
      v20 = [v19 scannerResult];
      uint64_t v21 = [v20 coreResult];
      v22 = [(VKCDataDetectorElementView *)self dataDetectorContext];
      uint64_t v17 = [DDContextMenuActionClass_0 contextMenuConfigurationWithResult:v21 inView:self context:v22 menuIdentifier:v11];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  return v17;
}

uint64_t __84__VKCDataDetectorElementView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __84__VKCDataDetectorElementView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(VKCDataDetectorElementView *)self delegate];
  double v6 = [v5 previewForDataDetectorElementView:self];

  if (!v6)
  {
    uint64_t v30 = [(VKCDataDetectorElementView *)self delegate];
    uint64_t v31 = [v30 previewImageForDataDetectorElementView:self];

    if (v31)
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
      [v32 setImage:v31];
      v33 = [(VKCDataDetectorElementView *)self delegate];
      [v33 previewImageBoundsForDataDetectorElementView:self];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;

      objc_msgSend(v32, "setFrame:", v35, v37, v39, v41);
      [(VKCDataDetectorElementView *)self frame];
      double v15 = objc_msgSend(v32, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, VKMSubtractPoints(v42, v43, v35));
      [(VKCDataDetectorElementView *)self bounds];
      double v8 = v44;
      double v10 = v45;
      CGFloat v12 = v46;
      CGFloat v14 = v47;
      double v6 = self;
    }
    else
    {
      double v15 = 0;
      double v6 = 0;
      CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v8 = *MEMORY[0x1E4F1DB28];
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    }

    if (v15) {
      goto LABEL_3;
    }
LABEL_10:
    v29 = 0;
    goto LABEL_11;
  }
  [(VKCDataDetectorElementView *)self bounds];
  -[VKCDataDetectorElementView convertRect:toView:](self, "convertRect:toView:", v6);
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v15 = -[VKCDataDetectorElementView resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](v6, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
  if (!v15) {
    goto LABEL_10;
  }
LABEL_3:
  id v16 = [(VKCDataDetectorElementView *)self boundingQuadInBoundsCoordinates];
  uint64_t v17 = [v16 quadByConvertingFromView:self toView:v6 isNormalized:0];

  uint64_t v18 = objc_msgSend(v17, "quadFromSubtractingPoint:", v8, v10);

  uint64_t v19 = [v18 path];
  id v20 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  [v18 maxHeight];
  double v22 = v21 * 0.15;
  __int16 v23 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  if ([v23 isMRCDataDetector]) {
    double v22 = 0.0;
  }

  int v24 = (void *)MEMORY[0x1E4F427D0];
  v49[0] = v19;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v26 = objc_msgSend(v24, "vk_groupAndRoundPaths:radius:offset:", v25, v22, 0.0);

  [v20 setVisiblePath:v26];
  id v27 = objc_alloc(MEMORY[0x1E4F42ED0]);
  uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42D00]), "initWithContainer:center:", v6, VKMCenterOfRect(v8, v10, v12, v14));
  v29 = (void *)[v27 initWithView:v15 parameters:v20 target:v28];

LABEL_11:
  return v29;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [(VKCDataDetectorElementView *)self delegate];
  [v6 willDisplayMenuForDataDetectorElementView:self];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a4;
  double v7 = [(VKCDataDetectorElementView *)self delegate];
  [v7 willDismissMenuForDataDetectorElementView:self];

  uint64_t v8 = objc_opt_class();
  double v9 = [v6 identifier];

  double v10 = VKDynamicCast(v8, (uint64_t)v9);
  int v11 = [v10 isEqual:@"manualInvocation"];

  [(VKCDataDetectorElementView *)self sendAnalyticsEventIfNecessaryForDDType:v11 ^ 1u];
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = 0;
  CGFloat v14 = &v13;
  uint64_t v15 = 0x2050000000;
  double v10 = (void *)getDDContextMenuConfigurationClass_softClass;
  uint64_t v16 = getDDContextMenuConfigurationClass_softClass;
  if (!getDDContextMenuConfigurationClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getDDContextMenuConfigurationClass_block_invoke;
    v12[3] = &unk_1E6BF0A90;
    v12[4] = &v13;
    __getDDContextMenuConfigurationClass_block_invoke((uint64_t)v12);
    double v10 = (void *)v14[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v13, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 performPreviewActionForMenuWithAnimator:v9];
  }
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 identifier];

  id v7 = VKDynamicCast(v5, (uint64_t)v6);
  LODWORD(v4) = [v7 isEqualToString:@"manualInvocation"];

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F43130] defaultStyle];
    [v8 setPreferredLayout:3];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)highlighter:(id)a3 shouldHighlight:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  id v6 = [(VKCDataDetectorElementView *)self highlightPathLayer];
  id v7 = v6;
  if (v4)
  {
    id v8 = [v13 elementView];
    id v9 = [v8 boundingQuadInBoundsCoordinates];
    double v10 = [v9 path];
    objc_msgSend(v7, "setPath:", objc_msgSend(v10, "vk_CGPath"));

    [(UIView *)self vk_viewPointRatioFromWindow];
    [v7 setLineWidth:v11 + v11];
    id v12 = [MEMORY[0x1E4F428B8] yellowColor];
    objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    [v7 setHidden:0];
  }
  else
  {
    [v6 setHidden:1];
  }
}

- (id)accessibilityIdentifier
{
  return @"com.apple.visionkit.dataDetectorElementView";
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4F43518];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(VKCDataDetectorElementView *)self dataDetectorElement];
  char v3 = [v2 scannerResult];
  BOOL v4 = [v3 value];

  return v4;
}

- (CGRect)rectForMrcActionInViewController:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(VKCDataDetectorElementView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = [v4 view];

    -[VKCDataDetectorElementView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (VKCBaseDataDetectorElement)dataDetectorElement
{
  return self->_dataDetectorElement;
}

- (NSArray)allDataDetectorElements
{
  return self->_allDataDetectorElements;
}

- (VKCDataDetectorElementViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCDataDetectorElementViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)customAnalyticsIdentifier
{
  return self->_customAnalyticsIdentifier;
}

- (void)setCustomAnalyticsIdentifier:(id)a3
{
}

- (int)analysisRequestID
{
  return self->_analysisRequestID;
}

- (void)setAnalysisRequestID:(int)a3
{
  self->_analysisRequestID = a3;
}

- (CAShapeLayer)highlightPathLayer
{
  return self->_highlightPathLayer;
}

- (void)setHighlightPathLayer:(id)a3
{
}

- (UIBezierPath)highlightPath
{
  return self->_highlightPath;
}

- (void)setHighlightPath:(id)a3
{
}

- (BOOL)isPerformingManualContextInvocation
{
  return self->_isPerformingManualContextInvocation;
}

- (void)setIsPerformingManualContextInvocation:(BOOL)a3
{
  self->_isPerformingManualContextInvocation = a3;
}

- (BOOL)allowLongPressDDActivationOnly
{
  return self->_allowLongPressDDActivationOnly;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (void)setMenuInteraction:(id)a3
{
}

- (void)setDataDetectorContext:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dataDetectorContext, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
  objc_storeStrong((id *)&self->_highlightPath, 0);
  objc_storeStrong((id *)&self->_highlightPathLayer, 0);
  objc_storeStrong((id *)&self->_customAnalyticsIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allDataDetectorElements, 0);
  objc_storeStrong((id *)&self->_dataDetectorElement, 0);
}

@end