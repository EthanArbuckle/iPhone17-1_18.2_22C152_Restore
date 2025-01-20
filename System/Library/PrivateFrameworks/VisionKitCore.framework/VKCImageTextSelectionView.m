@interface VKCImageTextSelectionView
+ (BOOL)sceneAwareLookupEnabled;
- (BOOL)containsSelectedTextAtPoint:(CGPoint)a3;
- (BOOL)containsTextAtPoint:(CGPoint)a3;
- (BOOL)highlightSelectableItems;
- (BOOL)imageContainsPoint:(CGPoint)a3;
- (BOOL)longPressDataDetectorsInTextMode;
- (CALayer)highlightShadowLayer;
- (CAShapeLayer)highlightLayer;
- (CGAffineTransform)transformForHighlightLayerInCurrentBounds;
- (CGPoint)selectionQuadsVertexCentroid;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)currentContentsRectInLayerCoordinates;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)highlightLayerStartContentsRect;
- (NSArray)allLineQuads;
- (NSAttributedString)attributedText;
- (NSAttributedString)selectedAttributedText;
- (NSString)selectedText;
- (NSString)text;
- (OS_dispatch_queue)analyticsQueue;
- (UIBezierPath)borderedNormalizedHighlightPath;
- (UIBezierPath)normalizedHighlightPath;
- (VKCImageTextSelectionView)initWithFrame:(CGRect)a3;
- (VKCImageTextSelectionViewDelegate)textSelectionDelegate;
- (VKTextRange)documentRange;
- (VKTextRange)selectedVKRange;
- (id)attributedTextInRange:(id)a3;
- (id)boundedPositionFromPosition:(id)a3;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(unint64_t)a4;
- (id)closestBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4 maxDistance:(double)a5;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)closestQuadForBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4 maxDistance:(double)a5;
- (id)positionFromPosition:(id)a3 inDirection:(unint64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(unint64_t)a4;
- (id)quadsForAllWordsForCurrentLayout;
- (id)selectionRectsForRange:(id)a3;
- (id)summaryDescription;
- (id)textInRange:(id)a3;
- (id)textQueryProvider;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(unint64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (void)performHighlightSelectableTextAnimated:(BOOL)a3;
- (void)sendAnalyticsEventWithSelector:(SEL)a3 type:(int64_t)a4 source:(int64_t)a5;
- (void)setAllLineQuads:(id)a3;
- (void)setAnalyticsQueue:(id)a3;
- (void)setBorderedNormalizedHighlightPath:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDocumentRange:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightLayer:(id)a3;
- (void)setHighlightLayerStartContentsRect:(CGRect)a3;
- (void)setHighlightSelectableItems:(BOOL)a3;
- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightShadowLayer:(id)a3;
- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3;
- (void)setNormalizedHighlightPath:(id)a3;
- (void)setRecognitionResult:(id)a3;
- (void)setSelectedVKRange:(id)a3;
- (void)setTextQueryProvider:(id)a3;
- (void)setTextSelectionDelegate:(id)a3;
- (void)updateHighlightLayerContentIfVisible;
- (void)updateHighlightLayerGeometry;
- (void)updateHighlightLayerGeometryIfVisible;
@end

@implementation VKCImageTextSelectionView

- (id)quadsForAllWordsForCurrentLayout
{
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(VKCImageTextSelectionView *)self text];
  uint64_t v4 = objc_msgSend(v3, "vk_range");
  uint64_t v6 = v5;

  v28 = [(VKCImageTextSelectionView *)self text];
  unint64_t v7 = v4 + v6;
  if (v4 + v6)
  {
    unint64_t v8 = 0;
    p_superclass = &OBJC_METACLASS___VKCRemoveBackgroundResult.superclass;
    do
    {
      v10 = [(VKCImageBaseOverlayView *)self recognitionResult];
      v11 = [p_superclass + 204 positionWithOffset:v8];
      v12 = [v10 smallestSelectableRangeForPosition:v11];
      uint64_t v13 = [v12 nsRange];
      uint64_t v15 = v14;

      if (v13 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0)
      {
        ++v8;
      }
      else
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v18 = objc_msgSend(v28, "vk_substringWithRange:", v13, v15);
        v19 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v13, v15);
        [(VKCImageTextSelectionView *)self selectionRectsForRange:v19];
        v21 = v20 = p_superclass;
        v22 = [v21 firstObject];

        v23 = [v22 quad];
        [v22 rect];
        v24 = objc_msgSend(v23, "quadFromAddingPoint:");

        [v17 setObject:v18 forKeyedSubscript:VKCMockResultTextKey];
        v25 = [v24 dictionaryRepresentation];
        [v17 setObject:v25 forKeyedSubscript:VKCMockResultQuadKey];

        v26 = +[VKCMockHelper plistFromRange:](VKCMockHelper, "plistFromRange:", v13, v15);
        [v17 setObject:v26 forKeyedSubscript:VKCMockResultRangeKey];

        [v29 addObject:v17];
        unint64_t v8 = v13 + v15;

        p_superclass = v20;
      }
    }
    while (v8 < v7);
  }

  return v29;
}

+ (BOOL)sceneAwareLookupEnabled
{
  if (sceneAwareLookupEnabled_onceToken != -1) {
    dispatch_once(&sceneAwareLookupEnabled_onceToken, &__block_literal_global_4);
  }
  return sceneAwareLookupEnabled_sSceneAwareLookupEnabled;
}

uint64_t __52__VKCImageTextSelectionView_sceneAwareLookupEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  sceneAwareLookupEnabled_sSceneAwareLookupEnabled = result;
  return result;
}

- (VKCImageTextSelectionView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VKCImageTextSelectionView;
  v3 = -[VKCImageBaseOverlayView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.VisionKit.textAnalytics", v4);
    analyticsQueue = v3->_analyticsQueue;
    v3->_analyticsQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (NSArray)allLineQuads
{
  allLineQuads = self->_allLineQuads;
  if (!allLineQuads)
  {
    uint64_t v4 = [(VKCImageBaseOverlayView *)self recognitionResult];
    dispatch_queue_t v5 = [v4 allLineQuads];
    uint64_t v6 = self->_allLineQuads;
    self->_allLineQuads = v5;

    allLineQuads = self->_allLineQuads;
  }
  return allLineQuads;
}

- (NSString)text
{
  v2 = [(VKCImageBaseOverlayView *)self recognitionResult];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (NSAttributedString)attributedText
{
  v2 = [(VKCImageBaseOverlayView *)self recognitionResult];
  v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (CGPoint)selectionQuadsVertexCentroid
{
  v3 = [(VKCImageTextSelectionView *)self selectedVKRange];
  uint64_t v4 = [(VKCImageTextSelectionView *)self selectionRectsForRange:v3];
  dispatch_queue_t v5 = objc_msgSend(v4, "vk_compactMap:", &__block_literal_global_43);

  if ([v5 count])
  {
    +[VKQuad vertexCentroidFromQuads:v5];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

id __57__VKCImageTextSelectionView_selectionQuadsVertexCentroid__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 quad];
  [v2 rect];
  double v5 = v4;
  double v7 = v6;

  double v8 = objc_msgSend(v3, "quadFromAddingPoint:", v5, v7);

  return v8;
}

- (void)setRecognitionResult:(id)a3
{
  id v4 = a3;
  double v5 = [(VKCImageBaseOverlayView *)self recognitionResult];

  v14.receiver = self;
  v14.super_class = (Class)VKCImageTextSelectionView;
  [(VKCImageBaseOverlayView *)&v14 setRecognitionResult:v4];

  double v6 = [(VKCImageTextSelectionView *)self text];
  uint64_t v7 = objc_msgSend(v6, "vk_range");
  double v9 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v7, v8);
  [(VKCImageTextSelectionView *)self setDocumentRange:v9];

  double v10 = +[VKTextRange emptyRange];
  [(VKCImageTextSelectionView *)self setSelectedVKRange:v10];

  allLineQuads = self->_allLineQuads;
  self->_allLineQuads = 0;

  if ([(VKCImageTextSelectionView *)self highlightSelectableItems])
  {
    v12 = [(VKCImageBaseOverlayView *)self recognitionResult];

    if (v12)
    {
      [(VKCImageTextSelectionView *)self performHighlightSelectableTextAnimated:v5 == 0];
    }
    else
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      uint64_t v13 = [(VKCImageTextSelectionView *)self highlightLayer];
      [v13 setHidden:1];

      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

- (void)setHighlightSelectableItems:(BOOL)a3
{
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlightSelectableItems != a3)
  {
    BOOL v4 = a4;
    self->_highlightSelectableItems = a3;
    if (a3)
    {
      [(VKCImageTextSelectionView *)self performHighlightSelectableTextAnimated:a4];
    }
    else
    {
      double v6 = [(VKCImageTextSelectionView *)self highlightLayer];
      uint64_t v7 = [(VKCImageTextSelectionView *)self highlightShadowLayer];
      if (v4)
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setAnimationDuration:0.15];
        [v6 setOpacity:0.0];
        [v7 setOpacity:0.0];
        uint64_t v8 = (void *)MEMORY[0x1E4F39CF8];
        uint64_t v9 = MEMORY[0x1E4F143A8];
        uint64_t v10 = 3221225472;
        double v11 = __66__VKCImageTextSelectionView_setHighlightSelectableItems_animated___block_invoke;
        v12 = &unk_1E6BF12B8;
        id v13 = v6;
        id v14 = v7;
        [v8 setCompletionBlock:&v9];
        objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v9, v10, v11, v12);
      }
      else
      {
        [v6 removeAllAnimations];
        [v6 setPath:0];
        [v6 setHidden:1];
        [v7 setHidden:1];
        [v7 setMask:0];
        [v7 setShadowPath:0];
      }
    }
  }
}

uint64_t __66__VKCImageTextSelectionView_setHighlightSelectableItems_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPath:0];
  [*(id *)(a1 + 32) setHidden:1];
  [*(id *)(a1 + 40) setHidden:1];
  [*(id *)(a1 + 40) setMask:0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setShadowPath:0];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageTextSelectionView;
  -[VKCImageTextSelectionView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageTextSelectionView *)self updateHighlightLayerGeometryIfVisible];
}

- (NSString)selectedText
{
  v3 = [(VKCImageTextSelectionView *)self text];
  objc_super v4 = [(VKCImageTextSelectionView *)self selectedVKRange];
  double v5 = objc_msgSend(v3, "vk_substringWithVKRange:", v4);

  return (NSString *)v5;
}

- (NSAttributedString)selectedAttributedText
{
  v3 = [(VKCImageTextSelectionView *)self selectedVKRange];
  objc_super v4 = [(VKCImageTextSelectionView *)self attributedTextInRange:v3];

  return (NSAttributedString *)v4;
}

- (void)updateHighlightLayerContentIfVisible
{
  if ([(VKCImageTextSelectionView *)self highlightSelectableItems])
  {
    [(VKCImageTextSelectionView *)self performHighlightSelectableTextAnimated:0];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VKCImageTextSelectionView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)VKCImageTextSelectionView;
  -[VKCImageTextSelectionView setBounds:](&v25, sel_setBounds_, x, y, width, height);
  [(VKCImageTextSelectionView *)self bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v26.origin.double x = v9;
  v26.origin.double y = v11;
  v26.size.double width = v13;
  v26.size.double height = v15;
  v27.origin.double x = v17;
  v27.origin.double y = v19;
  v27.size.double width = v21;
  v27.size.double height = v23;
  if (!CGRectEqualToRect(v26, v27))
  {
    [(VKCImageTextSelectionView *)self updateHighlightLayerGeometryIfVisible];
    v24 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
    objc_msgSend(v24, "textSelectionView:boundsDidChangeFromRect:toRect:", self, v9, v11, v13, v15, v17, v19, v21, v23);
  }
}

- (void)updateHighlightLayerGeometryIfVisible
{
  if ([(VKCImageTextSelectionView *)self highlightSelectableItems])
  {
    [(VKCImageTextSelectionView *)self updateHighlightLayerGeometry];
  }
}

- (void)updateHighlightLayerGeometry
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v3 = [(VKCImageTextSelectionView *)self highlightLayer];
  objc_super v4 = [(VKCImageTextSelectionView *)self highlightShadowLayer];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  [(VKCImageTextSelectionView *)self transformForHighlightLayerInCurrentBounds];
  [(VKCImageTextSelectionView *)self currentContentsRectInLayerCoordinates];
  double v6 = v5;
  double v8 = v7;
  v25[0] = v26;
  v25[1] = v27;
  v25[2] = v28;
  [v3 setAffineTransform:v25];
  objc_msgSend(v3, "setPosition:", v6, v8);
  [(VKCImageTextSelectionView *)self currentContentsRectInLayerCoordinates];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeScale(&v24, v13, v15);
  double v17 = [(VKCImageTextSelectionView *)self normalizedHighlightPath];
  double v18 = (void *)[v17 copy];

  CGAffineTransform v23 = v24;
  objc_msgSend(v18, "vk_applyTransform:", &v23);
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v4, "setFrame:", v10, v12, v14, v16);
  objc_msgSend(v4, "setShadowPath:", objc_msgSend(v18, "vk_CGPath"));
  id v19 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  objc_msgSend(v19, "setAnchorPoint:", 0.5, 0.5);
  [v4 bounds];
  objc_msgSend(v19, "setFrame:");
  double v20 = [(VKCImageTextSelectionView *)self borderedNormalizedHighlightPath];
  double v21 = (void *)[v20 copy];

  CGAffineTransform v23 = v24;
  objc_msgSend(v21, "vk_applyTransform:", &v23);
  objc_msgSend(v19, "setPath:", objc_msgSend(v21, "vk_CGPath"));
  id v22 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v19, "setFillColor:", objc_msgSend(v22, "CGColor"));

  [v19 setFillRule:*MEMORY[0x1E4F39FB8]];
  [v4 setMask:v19];
  [MEMORY[0x1E4F39CF8] commit];
}

- (id)summaryDescription
{
  id v2 = [(VKCImageTextSelectionView *)self text];
  v3 = objc_msgSend(v2, "vk_substringToIndex:", 40);

  return v3;
}

- (CGRect)currentContentsRectInLayerCoordinates
{
  v3 = [(VKCImageTextSelectionView *)self layer];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v5, v7, v9, v11, v12, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGAffineTransform)transformForHighlightLayerInCurrentBounds
{
  [(VKCImageTextSelectionView *)self currentContentsRectInLayerCoordinates];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  return CGAffineTransformMakeScale(retstr, v4, v5);
}

- (void)performHighlightSelectableTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = [(VKCImageBaseOverlayView *)self recognitionResult];
  double v6 = [(VKCImageTextSelectionView *)self text];
  uint64_t v7 = objc_msgSend(v6, "vk_range");
  CGFloat v9 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v7, v8);
  double v10 = [v5 normalizedSelectionQuadsForRange:v9];

  CGFloat v11 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  CGFloat v12 = [v11 nonTextNormalizedHighlightAllQuadsForTextSelectionView:self];

  CGFloat v13 = [(VKCImageBaseOverlayView *)self recognitionResult];
  [v13 imageSize];
  double v16 = VKMAspectRatio(v14, v15);

  objc_msgSend(MEMORY[0x1E4F427D0], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v10, v16, 0.2, 0.25);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  if ([v12 count])
  {
    double v17 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v12, v16, 0.07, 0.02);
    uint64_t v18 = objc_msgSend(v32, "vk_unionAndFlattenWithPath:", v17);

    id v32 = (id)v18;
  }
  double v19 = [(VKCImageTextSelectionView *)self highlightShadowLayer];
  double v20 = [(VKCImageTextSelectionView *)self highlightLayer];
  double v21 = (void *)[v32 copy];
  [(VKCImageTextSelectionView *)self setNormalizedHighlightPath:v21];

  double v22 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v32, "vk_appendBezierPath:", v22);

  double v23 = (void *)[v32 copy];
  [(VKCImageTextSelectionView *)self setBorderedNormalizedHighlightPath:v23];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [v20 setHidden:1];
  objc_msgSend(v20, "setPath:", objc_msgSend(v32, "vk_CGPath"));
  double v24 = [MEMORY[0x1E4F428B8] blackColor];
  id v25 = [v24 colorWithAlphaComponent:0.25];
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v25, "CGColor"));

  [v20 setFillRule:*MEMORY[0x1E4F39FB8]];
  [(VKCImageTextSelectionView *)self updateHighlightLayerGeometry];
  [v20 setOpacity:0.0];
  [v19 setHidden:1];
  [v19 setOpacity:0.0];
  [(UIView *)self vk_viewLengthFromWindowLength:15.0];
  objc_msgSend(v19, "setShadowRadius:");
  [(UIView *)self vk_viewLengthFromWindowLength:5.0];
  objc_msgSend(v19, "setShadowOffset:", 0.0, v26);
  id v27 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v19, "setShadowColor:", objc_msgSend(v27, "CGColor"));

  LODWORD(v28) = 0.25;
  [v19 setShadowOpacity:v28];
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] begin];
  double v29 = 0.15;
  if (!v3) {
    double v29 = 0.0;
  }
  [MEMORY[0x1E4F39CF8] setAnimationDuration:v29];
  [v20 setHidden:0];
  LODWORD(v30) = 1.0;
  [v20 setOpacity:v30];
  [v19 setHidden:0];
  LODWORD(v31) = 1.0;
  [v19 setOpacity:v31];
  [MEMORY[0x1E4F39CF8] commit];
}

- (CAShapeLayer)highlightLayer
{
  highlightLayer = self->_highlightLayer;
  if (!highlightLayer)
  {
    id v4 = [(VKCImageTextSelectionView *)self highlightShadowLayer];
    CGFloat v5 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    double v6 = self->_highlightLayer;
    self->_highlightLayer = v5;

    uint64_t v7 = [(VKCImageTextSelectionView *)self layer];
    [v7 addSublayer:self->_highlightLayer];

    highlightLayer = self->_highlightLayer;
  }
  return highlightLayer;
}

- (CALayer)highlightShadowLayer
{
  highlightShadowLayer = self->_highlightShadowLayer;
  if (!highlightShadowLayer)
  {
    id v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    CGFloat v5 = self->_highlightShadowLayer;
    self->_highlightShadowLayer = v4;

    -[CALayer setBounds:](self->_highlightShadowLayer, "setBounds:", 0.0, 0.0, 1.0, 1.0);
    double v6 = [(VKCImageTextSelectionView *)self layer];
    [v6 addSublayer:self->_highlightShadowLayer];

    highlightShadowLayer = self->_highlightShadowLayer;
  }
  return highlightShadowLayer;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(unint64_t)a4
{
  if (a4 == 3) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = -1;
  }
  if (a4 == 2) {
    return 1;
  }
  else {
    return v4;
  }
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(VKCImageTextSelectionView *)self documentRange];
  if ([v5 length])
  {
    double v6 = [v5 end];
    unsigned int v7 = [v4 isEqual:v6];

    uint64_t v8 = [v4 offset];
    CGFloat v9 = +[VKTextRange rangeWithStartOffset:v8 - v7 endOffset:v8 - v7 + 1];
    [(VKCImageTextSelectionView *)self firstRectForRange:v9];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(VKCImageBaseOverlayView *)self recognitionResult];
  CGFloat v9 = objc_msgSend(v8, "characterRangeAtPoint:", v5, v7);

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  double v5 = [a3 positionByAddingOffset:a4];
  double v6 = [(VKCImageTextSelectionView *)self boundedPositionFromPosition:v5];

  return v6;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 offset];
  uint64_t v7 = [v5 offset];

  return v6 - v7;
}

- (id)positionFromPosition:(id)a3 inDirection:(unint64_t)a4 offset:(int64_t)a5
{
  if (a4 == 2) {
    int64_t v7 = -a5;
  }
  else {
    int64_t v7 = a5;
  }
  uint64_t v8 = [a3 positionByAddingOffset:v7];
  CGFloat v9 = [(VKCImageTextSelectionView *)self boundedPositionFromPosition:v8];

  return v9;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(unint64_t)a4
{
  if (a4 == 3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = -1;
  }
  id v6 = a3;
  int64_t v7 = [v6 positionByAddingOffset:v5];
  uint64_t v8 = [(VKCImageTextSelectionView *)self boundedPositionFromPosition:v7];

  CGFloat v9 = [[VKTextRange alloc] initWithStart:v6 end:v8];
  return v9;
}

- (id)boundedPositionFromPosition:(id)a3
{
  double v4 = (VKTextPosition *)a3;
  uint64_t v5 = [(VKTextPosition *)v4 offset];
  id v6 = [(VKCImageTextSelectionView *)self text];
  uint64_t v7 = VKMClampInt(v5, 0, [v6 length]);

  uint64_t v8 = v4;
  if (v7 != [(VKTextPosition *)v4 offset])
  {
    uint64_t v8 = [[VKTextPosition alloc] initWithOffset:v7];
  }
  return v8;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(VKCImageTextSelectionView *)self documentRange];
  uint64_t v7 = -[VKCImageTextSelectionView closestPositionToPoint:withinRange:](self, "closestPositionToPoint:withinRange:", v6, x, y);

  return v7;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
  double v9 = v8;
  double v11 = v10;
  double v12 = [(VKCImageBaseOverlayView *)self recognitionResult];
  double v13 = objc_msgSend(v12, "closestPositionToPoint:withinRange:", v7, v9, v11);

  return v13;
}

- (id)closestQuadForBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4 maxDistance:(double)a5
{
  id v6 = -[VKCImageTextSelectionView closestBlockOfType:toPoint:maxDistance:](self, "closestBlockOfType:toPoint:maxDistance:", a3, a4.x, a4.y, a5);
  if (v6)
  {
    [(VKCImageBaseOverlayView *)self contentsRect];
    id v7 = objc_msgSend(v6, "vk_quadConvertedToView:withContentsRect:", self);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)closestBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4 maxDistance:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  double v11 = v10;
  double v13 = v12;
  double v14 = [(VKCImageBaseOverlayView *)self recognitionResult];
  double v15 = objc_msgSend(v14, "closestBlockOfType:toPoint:", a3, v11, v13);

  if (v15)
  {
    [(VKCImageBaseOverlayView *)self contentsRect];
    double v16 = objc_msgSend(v15, "vk_quadConvertedToView:withContentsRect:", self);
    if ((objc_msgSend(v16, "containsPoint:", x, y) & 1) != 0
      || a5 > 0.0 && (objc_msgSend(v16, "mininumDistanceToPoint:", x, y), v17 <= a5))
    {
      id v18 = v15;
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 offset];
  if (v7 >= [v6 offset])
  {
    uint64_t v9 = [v5 offset];
    int64_t v8 = v9 > [v6 offset];
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageBaseOverlayView *)self recognitionResult];
  [(VKCImageBaseOverlayView *)self contentsRect];
  objc_msgSend(v5, "firstRectForRange:documentView:contentRect:", v4, self);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(unint64_t)a4
{
  uint64_t v5 = [a3 nsRange];
  uint64_t v7 = v5 + v6;
  if (((1 << a4) & 0x34) == 0) {
    uint64_t v7 = v5;
  }
  if (a4 <= 5) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v5;
  }
  double v9 = [[VKTextPosition alloc] initWithOffset:v8];
  return v9;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCImageBaseOverlayView *)self recognitionResult];
  [(VKCImageBaseOverlayView *)self contentsRect];
  uint64_t v6 = objc_msgSend(v5, "selectionRectsForRange:documentView:contentRect:", v4, self);

  return v6;
}

- (id)textInRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCImageTextSelectionView *)self text];
  uint64_t v6 = objc_msgSend(v5, "vk_substringWithVKRange:", v4);

  return v6;
}

- (id)attributedTextInRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCImageBaseOverlayView *)self recognitionResult];
  uint64_t v6 = [v5 convertPlainTextRangeToAttributedRange:v4];

  uint64_t v7 = [(VKCImageTextSelectionView *)self attributedText];
  uint64_t v8 = objc_msgSend(v7, "vk_attributedSubstringFromVKRange:", v6);

  return v8;
}

- (BOOL)containsTextAtPoint:(CGPoint)a3
{
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = [(VKCImageTextSelectionView *)self allLineQuads];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__VKCImageTextSelectionView_containsTextAtPoint___block_invoke;
  v11[3] = &__block_descriptor_48_e23_B32__0__VKQuad_8Q16_B24l;
  v11[4] = v5;
  v11[5] = v7;
  char v9 = objc_msgSend(v8, "vk_containsObjectPassingTest:", v11);

  return v9;
}

uint64_t __49__VKCImageTextSelectionView_containsTextAtPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (BOOL)containsSelectedTextAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(VKCImageTextSelectionView *)self selectedVKRange];
  if ([v6 isEmpty])
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v8 = -[VKCImageTextSelectionView closestBlockOfType:toPoint:maxDistance:](self, "closestBlockOfType:toPoint:maxDistance:", 48, x, y, 0.0);
    if (v8)
    {
      char v9 = [(VKCImageBaseOverlayView *)self recognitionResult];
      double v10 = [v9 sourceVNDocument];
      double v11 = objc_msgSend(v8, "vk_textBlock");
      uint64_t v12 = [v10 rangeOfTextBlock:v11];
      uint64_t v14 = v13;

      char v7 = objc_msgSend(v6, "intersectsNSRange:", v12, v14);
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

- (BOOL)imageContainsPoint:(CGPoint)a3
{
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0x3FF0000000000000;
  uint64_t v10 = 0x3FF0000000000000;
  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v4);
}

- (void)sendAnalyticsEventWithSelector:(SEL)a3 type:(int64_t)a4 source:(int64_t)a5
{
  uint64_t v9 = [(VKCImageTextSelectionView *)self text];
  uint64_t v10 = [(VKCImageTextSelectionView *)self selectedVKRange];
  double v11 = [(VKCImageBaseOverlayView *)self recognitionResult];
  uint64_t v12 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  objc_initWeak(&location, self);
  uint64_t v13 = [(VKCImageTextSelectionView *)self analyticsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke;
  block[3] = &unk_1E6BF1590;
  id v19 = v10;
  id v20 = v9;
  v23[1] = (id)a3;
  v23[2] = (id)a4;
  v23[3] = (id)a5;
  id v21 = v11;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v9;
  id v17 = v10;
  objc_copyWeak(v23, &location);
  dispatch_async(v13, block);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) length];
  uint64_t v3 = [*(id *)(a1 + 40) length];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "vk_checkedSubstringWithVKRange:", *(void *)(a1 + 32));
  uint64_t v5 = objc_msgSend(v4, "vk_wordCount");

  uint64_t v6 = -[VKAnalyticsTextEvent initWithSelectionLength:totalLength:selectionWordCount:macOSSelector:includesRichPasteBoardContent:eventType:source:customIdentifier:]([VKAnalyticsTextEvent alloc], "initWithSelectionLength:totalLength:selectionWordCount:macOSSelector:includesRichPasteBoardContent:eventType:source:customIdentifier:", v2, v3, v5, *(void *)(a1 + 72), [*(id *)(a1 + 48) containsRichPasteboardElementsForRange:*(void *)(a1 + 32)], *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 56));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke_2;
  v8[3] = &unk_1E6BF1568;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  uint64_t v7 = v6;
  uint64_t v9 = v7;
  vk_dispatchMainAfterDelay(v8, 0.0);

  objc_destroyWeak(&v10);
}

void __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained textSelectionDelegate];
    [v3 textSelectionView:v4 analyticsEventOccured:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (id)textQueryProvider
{
  if ([(id)objc_opt_class() sceneAwareLookupEnabled])
  {
    objc_initWeak(&location, self);
    uint64_t v3 = [(VKCImageBaseOverlayView *)self recognitionResult];
    objc_initWeak(&from, v3);

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__VKCImageTextSelectionView_textQueryProvider__block_invoke;
    v7[3] = &unk_1E6BF1608;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    id v4 = (void *)MEMORY[0x1E018E600](v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = (void *)MEMORY[0x1E018E600](v4);

  return v5;
}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained recognitionResult],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        id v10 = objc_loadWeakRetained((id *)(a1 + 40)),
        v10,
        v9,
        v9 == v10))
  {
    double v11 = [v8 textSelectionDelegate];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_2;
    v12[3] = &unk_1E6BF15E0;
    id v13 = v6;
    [v11 generateTextualVisualSearchResultForQueryInfo:v5 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3;
  v11[3] = &unk_1E6BF15B8;
  id v12 = v7;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v7;
  vk_performBlockOnMainThread(v11);
}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch.text");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3_cold_1(v2, v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) searchSections];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v5, 0);
  }
}

- (VKCImageTextSelectionViewDelegate)textSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textSelectionDelegate);
  return (VKCImageTextSelectionViewDelegate *)WeakRetained;
}

- (void)setTextSelectionDelegate:(id)a3
{
}

- (VKTextRange)documentRange
{
  return self->_documentRange;
}

- (void)setDocumentRange:(id)a3
{
}

- (VKTextRange)selectedVKRange
{
  return self->_selectedVKRange;
}

- (void)setSelectedVKRange:(id)a3
{
}

- (BOOL)highlightSelectableItems
{
  return self->_highlightSelectableItems;
}

- (BOOL)longPressDataDetectorsInTextMode
{
  return self->_longPressDataDetectorsInTextMode;
}

- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3
{
  self->_longPressDataDetectorsInTextMode = a3;
}

- (void)setTextQueryProvider:(id)a3
{
}

- (void)setAllLineQuads:(id)a3
{
}

- (void)setHighlightLayer:(id)a3
{
}

- (void)setHighlightShadowLayer:(id)a3
{
}

- (UIBezierPath)normalizedHighlightPath
{
  return self->_normalizedHighlightPath;
}

- (void)setNormalizedHighlightPath:(id)a3
{
}

- (UIBezierPath)borderedNormalizedHighlightPath
{
  return self->_borderedNormalizedHighlightPath;
}

- (void)setBorderedNormalizedHighlightPath:(id)a3
{
}

- (CGRect)highlightLayerStartContentsRect
{
  double x = self->_highlightLayerStartContentsRect.origin.x;
  double y = self->_highlightLayerStartContentsRect.origin.y;
  double width = self->_highlightLayerStartContentsRect.size.width;
  double height = self->_highlightLayerStartContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHighlightLayerStartContentsRect:(CGRect)a3
{
  self->_highlightLayerStartContentsRect = a3;
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (void)setAnalyticsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_borderedNormalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_normalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_highlightShadowLayer, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_allLineQuads, 0);
  objc_storeStrong(&self->_textQueryProvider, 0);
  objc_storeStrong((id *)&self->_selectedVKRange, 0);
  objc_storeStrong((id *)&self->_documentRange, 0);
  objc_destroyWeak((id *)&self->_textSelectionDelegate);
}

uint64_t __51__VKCImageTextSelectionView_iOS_hitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

id __46__VKCImageTextSelectionView_iOS__addShortcut___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "Add Shortcut: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  return objc_msgSendSuper2(&v6, sel__addShortcut_, v4);
}

id __41__VKCImageTextSelectionView_iOS__lookup___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "Lookup: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  return objc_msgSendSuper2(&v6, sel__lookup_, v4);
}

void __41__VKCImageTextSelectionView_iOS__define___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)VKCImageTextSelectionView_iOS;
  objc_msgSendSuper2(&v5, sel__define_, v2);
  uint64_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Define: %@", buf, 0xCu);
  }
}

id __44__VKCImageTextSelectionView_iOS__translate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "Translate: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  return objc_msgSendSuper2(&v6, sel__translate_, v4);
}

void __40__VKCImageTextSelectionView_iOS__share___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(double **)(*(void *)(a1 + 32) + 8);
  CGFloat v4 = v3[4];
  CGFloat v5 = v3[5];
  CGFloat v6 = v3[6];
  CGFloat v7 = v3[7];
  id v8 = a2;
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v5;
  v27.size.CGFloat width = v6;
  v27.size.CGFloat height = v7;
  if (CGRectIsNull(v27))
  {
    [v8 rect];
    CGFloat x = v9;
    CGFloat y = v11;
    CGFloat width = v13;
    CGFloat height = v15;
  }
  else
  {
    id v17 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    [v8 rect];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v29.origin.CGFloat x = v19;
    v29.origin.CGFloat y = v21;
    v29.size.CGFloat width = v23;
    v29.size.CGFloat height = v25;
    CGRect v28 = CGRectUnion(v17[1], v29);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
  }
  double v26 = *(CGFloat **)(*(void *)(a1 + 32) + 8);
  v26[4] = x;
  v26[5] = y;
  v26[6] = width;
  v26[7] = height;
}

void __40__VKCImageTextSelectionView_iOS__share___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) selectedText];
  uint64_t v3 = [*(id *)(a1 + 32) selectedAttributedText];
  CGFloat v4 = [*(id *)(a1 + 32) textSelectionDelegate];
  CGFloat v5 = [v4 textSelectionView:*(void *)(a1 + 32) updateStringForCopy:v2];

  CGFloat v6 = [*(id *)(a1 + 32) textSelectionDelegate];
  CGFloat v7 = [v6 textSelectionView:*(void *)(a1 + 32) updateAttributedStringForCopy:v3];

  if (v2 == v5 && v3 == v7)
  {
    double v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_DEFAULT, "share: %@", buf, 0xCu);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    v12.receiver = *(id *)(a1 + 32);
    v12.super_class = (Class)VKCImageTextSelectionView_iOS;
    objc_msgSendSuper2(&v12, sel__share_, v11);
  }
  else
  {
    [*(id *)(a1 + 32) presentShareSheetForCustomStrings:v5 attributedString:v7];
  }
}

void __84__VKCImageTextSelectionView_iOS_presentShareSheetForCustomStrings_attributedString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(double **)(*(void *)(a1 + 32) + 8);
  CGFloat v4 = v3[4];
  CGFloat v5 = v3[5];
  CGFloat v6 = v3[6];
  CGFloat v7 = v3[7];
  id v8 = a2;
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v5;
  v27.size.CGFloat width = v6;
  v27.size.CGFloat height = v7;
  if (CGRectIsNull(v27))
  {
    [v8 rect];
    CGFloat x = v9;
    CGFloat y = v11;
    CGFloat width = v13;
    CGFloat height = v15;
  }
  else
  {
    id v17 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    [v8 rect];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v29.origin.CGFloat x = v19;
    v29.origin.CGFloat y = v21;
    v29.size.CGFloat width = v23;
    v29.size.CGFloat height = v25;
    CGRect v28 = CGRectUnion(v17[1], v29);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
  }
  double v26 = *(CGFloat **)(*(void *)(a1 + 32) + 8);
  v26[4] = x;
  v26[5] = y;
  v26[6] = width;
  v26[7] = height;
}

void __66__VKCImageTextSelectionView_iOS_processHasSnapshotDragEntitlement__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    *(void *)cf = 0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.QuartzCore.global-capture", (CFErrorRef *)cf);
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID()) {
        char v5 = [v3 BOOLValue];
      }
      else {
        char v5 = 0;
      }
      processHasSnapshotDragEntitlement_sHasEntitlement = v5;
      CFRelease(v3);
    }
    CFRelease(v1);
    if (*(void *)cf)
    {
      CGFloat v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __66__VKCImageTextSelectionView_iOS_processHasSnapshotDragEntitlement__block_invoke_cold_1((uint64_t *)cf, v6);
      }

      CFRelease(*(CFTypeRef *)cf);
    }
  }
  CGFloat v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = VKMUIStringForBool(processHasSnapshotDragEntitlement_sHasEntitlement);
    *(_DWORD *)cf = 138412290;
    *(void *)&cf[4] = v8;
    _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_DEFAULT, "Process has SnapshotDragEntitlement: %@", cf, 0xCu);
  }
}

uint64_t __74__VKCImageTextSelectionView_iOS_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __81__VKCImageTextSelectionView_iOS_targetedDragPreviewWithLabelsForCurrentSelection__block_invoke(uint64_t a1, void *a2)
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 rect];
  double v5 = v4;
  [MEMORY[0x1E4F42A30] systemFontSize];
  double v7 = v6 / v5;
  id v8 = [MEMORY[0x1E4F42A30] systemFontOfSize:v5];
  [v3 rect];
  double v10 = v9;
  double v12 = v11;
  double v15 = VKMSubtractPoints(v13, v14, *(double *)(a1 + 40));
  double v17 = v16;
  double v18 = -[VKCDragImageLabel initWithFrame:]([VKCDragImageLabel alloc], "initWithFrame:", v15, v16, v10, v12);
  [(VKCDragImageLabel *)v18 setFont:v8];
  -[VKCDragImageLabel setCustomEdgeInsets:](v18, "setCustomEdgeInsets:", 0.0, v7, 0.0, v7);
  CGFloat v19 = [v3 _transcript];
  [(VKCDragImageLabel *)v18 setText:v19];

  double v20 = [MEMORY[0x1E4F428B8] labelColor];
  CGFloat v21 = objc_msgSend(v20, "vk_colorWith80PercentOpacity");
  [(VKCDragImageLabel *)v18 setTextColor:v21];

  [(VKCDragImageLabel *)v18 setTextAlignment:3];
  double v22 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [(VKCDragImageLabel *)v18 setBackgroundColor:v22];

  [(VKCDragImageLabel *)v18 setAdjustsFontSizeToFitWidth:1];
  id v23 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(VKCDragImageLabel *)v18 frame];
  double v24 = objc_msgSend(v23, "initWithFrame:");
  CGFloat v25 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  double v26 = objc_msgSend(v25, "vk_colorWith80PercentOpacity");
  [v24 setBackgroundColor:v26];

  [v24 addSubview:v18];
  [*(id *)(a1 + 32) addSubview:v24];
  CGRect v27 = [(VKCDragImageLabel *)v18 text];
  uint64_t v28 = *MEMORY[0x1E4F42508];
  uint64_t v76 = *MEMORY[0x1E4F42508];
  v77[0] = v8;
  CGRect v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
  [v27 sizeWithAttributes:v29];
  double v31 = v30;
  double v33 = v32;

  objc_msgSend(v24, "setFrame:", v15, v17, v10, v12);
  [v24 setBounds:VKMRectWithSize()];
  [v24 bounds];
  -[VKCDragImageLabel setFrame:](v18, "setFrame:");
  if (v5 < 20.0)
  {
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F42A30], "systemFontOfSize:");

    [(VKCDragImageLabel *)v18 setFont:v34];
    v35 = [(VKCDragImageLabel *)v18 text];
    uint64_t v74 = v28;
    uint64_t v75 = v34;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    [v35 sizeWithAttributes:v36];
    double v38 = v37;

    [v24 bounds];
    double v43 = VKMCenterOfRect(v39, v40, v41, v42);
    [(VKCDragImageLabel *)v18 setFrame:VKMRectWithCenterAndSize(v43, v44, v38)];
    memset(&v72, 0, 48);
    CGAffineTransformMakeScale((CGAffineTransform *)&v72, v31 / v38, v31 / v38);
    v73[0] = *(_OWORD *)&v72.m11;
    v73[1] = *(_OWORD *)&v72.m13;
    v73[2] = *(_OWORD *)&v72.m21;
    [(VKCDragImageLabel *)v18 setTransform:v73];
    id v8 = (void *)v34;
  }
  v45 = [v24 layer];
  [v45 setCornerRadius:v33 * 0.1];

  v46 = [v24 layer];
  [v46 setMasksToBounds:1];

  memset(&v72, 0, sizeof(v72));
  CATransform3DMakeScale(&v72, v31 / v10, v33 / v12, 1.0);
  CATransform3D v71 = v72;
  v47 = [v24 layer];
  CATransform3D v70 = v71;
  [v47 setTransform:&v70];

  memset(v69, 0, sizeof(v69));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v48 = [v24 layer];
  v49 = [v3 quad];
  +[VKQuad transformToConvertLayer:v48 intoQuad:v49 frame:v69];

  long long v57 = v65;
  long long v58 = v66;
  long long v59 = v67;
  long long v60 = v68;
  long long v53 = v61;
  long long v54 = v62;
  long long v55 = v63;
  long long v56 = v64;
  v50 = [v24 layer];
  v52[4] = v57;
  v52[5] = v58;
  v52[6] = v59;
  v52[7] = v60;
  v52[0] = v53;
  v52[1] = v54;
  v52[2] = v55;
  v52[3] = v56;
  [v50 setTransform:v52];

  v51 = [v24 layer];
  objc_msgSend(v51, "setPosition:", v15, v17);
}

id __66__VKCImageTextSelectionView_iOS_selectedTextPathsConvertedToView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 quad];
  [v3 rect];
  double v6 = v5;
  double v8 = v7;

  double v9 = objc_msgSend(v4, "quadFromAddingPoint:", v6, v8);

  id v10 = v9;
  double v11 = v10;
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = v10;
  if (v12)
  {
    double v13 = v10;
    if (v12 != *(void *)(a1 + 40))
    {
      double v13 = objc_msgSend(v10, "quadByConvertingFromView:toView:isNormalized:");
    }
  }
  double v14 = [v13 path];

  return v14;
}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v3, 0xCu);
}

void __66__VKCImageTextSelectionView_iOS_processHasSnapshotDragEntitlement__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Failed to check if SnapshotDragEntitlement is set: %@", (uint8_t *)&v3, 0xCu);
}

@end