@interface VKCImageCustomHighlightView
- (BOOL)isConfiguringHighlights;
- (CALayer)highlightShadowLayer;
- (CAShapeLayer)highlightColorLayer;
- (CAShapeLayer)highlightLayer;
- (CGAffineTransform)transformForHighlightLayerInCurrentBounds;
- (CGRect)currentContentsRectInLayerCoordinates;
- (NSArray)highlightRanges;
- (NSArray)matchedRanges;
- (NSArray)selectionRects;
- (NSMutableArray)highlightDots;
- (UIBezierPath)borderedNormalizedHighlightPath;
- (UIBezierPath)normalizedHighlightPath;
- (UIColor)highlightColor;
- (VKCImageCustomHighlightView)initWithDelegate:(id)a3;
- (VKCImageCustomHighlightViewDelegate)highlightViewDelegate;
- (void)_configureHighlightDotForRanges:(id)a3;
- (void)beginHighlightWithRanges:(id)a3 animated:(BOOL)a4;
- (void)clearHighlightsAnimated:(BOOL)a3;
- (void)clearHighlightsAnimated:(BOOL)a3 hideLayers:(BOOL)a4;
- (void)layoutSubviews;
- (void)normalizedVisibleRectDidChange;
- (void)performHighlightForRanges:(id)a3 animated:(BOOL)a4 isReplacingResults:(BOOL)a5;
- (void)setBorderedNormalizedHighlightPath:(id)a3;
- (void)setHighlightColorLayer:(id)a3;
- (void)setHighlightDots:(id)a3;
- (void)setHighlightLayer:(id)a3;
- (void)setHighlightRanges:(id)a3;
- (void)setHighlightShadowLayer:(id)a3;
- (void)setHighlightViewDelegate:(id)a3;
- (void)setIsConfiguringHighlights:(BOOL)a3;
- (void)setMatchedRanges:(id)a3;
- (void)setNormalizedHighlightPath:(id)a3;
- (void)setSelectionRects:(id)a3;
- (void)updateHighlightLayerGeometry;
- (void)updateHighlightLayerGeometryIfVisible;
@end

@implementation VKCImageCustomHighlightView

- (VKCImageCustomHighlightView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKCImageCustomHighlightView;
  v5 = [(VKCImageCustomHighlightView *)&v16 init];
  if (v5)
  {
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    highlightShadowLayer = v5->_highlightShadowLayer;
    v5->_highlightShadowLayer = v6;

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    highlightLayer = v5->_highlightLayer;
    v5->_highlightLayer = v8;

    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    highlightColorLayer = v5->_highlightColorLayer;
    v5->_highlightColorLayer = v10;

    v12 = [(VKCImageCustomHighlightView *)v5 layer];
    [v12 addSublayer:v5->_highlightShadowLayer];
    [v12 addSublayer:v5->_highlightLayer];
    [v12 addSublayer:v5->_highlightColorLayer];
    objc_storeWeak((id *)&v5->_highlightViewDelegate, v4);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    highlightDots = v5->_highlightDots;
    v5->_highlightDots = v13;
  }
  return v5;
}

- (UIColor)highlightColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] systemYellowColor];
}

- (void)normalizedVisibleRectDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageCustomHighlightView;
  [(VKCImageBaseOverlayView *)&v4 normalizedVisibleRectDidChange];
  v3 = [(VKCImageCustomHighlightView *)self highlightDots];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_7];
}

uint64_t __61__VKCImageCustomHighlightView_normalizedVisibleRectDidChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vk_setNeedsLayout");
}

- (void)clearHighlightsAnimated:(BOOL)a3
{
}

- (void)clearHighlightsAnimated:(BOOL)a3 hideLayers:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v12 = [(VKCImageCustomHighlightView *)self highlightLayer];
  v7 = [(VKCImageCustomHighlightView *)self highlightColorLayer];
  v8 = [(VKCImageCustomHighlightView *)self highlightShadowLayer];
  v9 = [(VKCImageCustomHighlightView *)self highlightDots];
  v10 = [v12 sublayers];
  [v10 makeObjectsPerformSelector:sel_removeFromSuperlayer];

  [v9 makeObjectsPerformSelector:sel_removeFromSuperview];
  [v9 removeAllObjects];
  if (v4)
  {
    [MEMORY[0x1E4F39CF8] begin];
    BOOL v11 = !v5;
    [MEMORY[0x1E4F39CF8] setDisableActions:v11];
    if (!v11) {
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.25];
    }
    [v12 setOpacity:0.0];
    [v7 setOpacity:0.0];
    [v8 setOpacity:0.0];
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)updateHighlightLayerGeometryIfVisible
{
  [(VKCImageCustomHighlightView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (VKMRectIsFinite(v3, v5, v7, v9))
  {
    v12.origin.x = v4;
    v12.origin.y = v6;
    v12.size.width = v8;
    v12.size.height = v10;
    if (!CGRectIsEmpty(v12))
    {
      [(VKCImageCustomHighlightView *)self updateHighlightLayerGeometry];
    }
  }
}

- (void)updateHighlightLayerGeometry
{
  if (![(VKCImageCustomHighlightView *)self isConfiguringHighlights])
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
  }
  double v3 = [(VKCImageCustomHighlightView *)self highlightLayer];
  CGFloat v4 = [(VKCImageCustomHighlightView *)self highlightColorLayer];
  double v5 = [(VKCImageCustomHighlightView *)self highlightShadowLayer];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  [(VKCImageCustomHighlightView *)self transformForHighlightLayerInCurrentBounds];
  [(VKCImageCustomHighlightView *)self currentContentsRectInLayerCoordinates];
  double v7 = v6;
  double v9 = v8;
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  [v3 setAffineTransform:v28];
  objc_msgSend(v3, "setPosition:", v7, v9);
  v27[0] = v29;
  v27[1] = v30;
  v27[2] = v31;
  [v4 setAffineTransform:v27];
  objc_msgSend(v4, "setPosition:", v7, v9);
  id v10 = [MEMORY[0x1E4F428B8] blueColor];
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  [(VKCImageCustomHighlightView *)self currentContentsRectInLayerCoordinates];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, v15, v17);
  v19 = [(VKCImageCustomHighlightView *)self normalizedHighlightPath];
  v20 = (void *)[v19 copy];

  CGAffineTransform v25 = v26;
  objc_msgSend(v20, "vk_applyTransform:", &v25);
  objc_msgSend(v5, "setFrame:", v12, v14, v16, v18);
  objc_msgSend(v5, "setShadowPath:", objc_msgSend(v20, "vk_CGPath"));
  id v21 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  [v5 bounds];
  objc_msgSend(v21, "setFrame:");
  v22 = [(VKCImageCustomHighlightView *)self borderedNormalizedHighlightPath];
  v23 = (void *)[v22 copy];

  CGAffineTransform v25 = v26;
  objc_msgSend(v23, "vk_applyTransform:", &v25);
  objc_msgSend(v21, "setPath:", objc_msgSend(v23, "vk_CGPath"));
  id v24 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v21, "setFillColor:", objc_msgSend(v24, "CGColor"));

  [v21 setFillRule:*MEMORY[0x1E4F39FB8]];
  [v5 setMask:v21];
  if (![(VKCImageCustomHighlightView *)self isConfiguringHighlights]) {
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (CGRect)currentContentsRectInLayerCoordinates
{
  double v3 = [(VKCImageCustomHighlightView *)self layer];
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
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGAffineTransform)transformForHighlightLayerInCurrentBounds
{
  [(VKCImageCustomHighlightView *)self currentContentsRectInLayerCoordinates];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  return CGAffineTransformMakeScale(retstr, v4, v5);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageCustomHighlightView;
  [(VKCImageCustomHighlightView *)&v3 layoutSubviews];
  [(VKCImageCustomHighlightView *)self updateHighlightLayerGeometryIfVisible];
}

- (void)beginHighlightWithRanges:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  double v6 = [(VKCImageCustomHighlightView *)self highlightRanges];
  if ([v6 count]) {
    BOOL v7 = [v11 count] != 0;
  }
  else {
    BOOL v7 = 0;
  }

  [(VKCImageCustomHighlightView *)self setHighlightRanges:v11];
  BOOL v8 = [v11 count] == 0;
  [(VKCImageCustomHighlightView *)self setIsConfiguringHighlights:1];
  [(VKCImageCustomHighlightView *)self clearHighlightsAnimated:v8 hideLayers:v7 ^ 1];
  if ([v11 count])
  {
    CGFloat v9 = [(VKCImageCustomHighlightView *)self highlightViewDelegate];
    double v10 = [v9 highlightView:self selectionRectsForRanges:v11];
    [(VKCImageCustomHighlightView *)self setSelectionRects:v10];

    [(VKCImageCustomHighlightView *)self performHighlightForRanges:v11 animated:v4 isReplacingResults:v7];
  }
  [(VKCImageCustomHighlightView *)self setIsConfiguringHighlights:0];
}

- (void)performHighlightForRanges:(id)a3 animated:(BOOL)a4 isReplacingResults:(BOOL)a5
{
  double v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v46 = a3;
  id v7 = objc_alloc_init(v6);
  BOOL v8 = [(VKCImageBaseOverlayView *)self recognitionResult];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __85__VKCImageCustomHighlightView_performHighlightForRanges_animated_isReplacingResults___block_invoke;
  v48[3] = &unk_1E6BF1A50;
  id v9 = v7;
  id v49 = v9;
  id v44 = v8;
  id v50 = v44;
  [v46 enumerateObjectsUsingBlock:v48];
  double v10 = [(VKCImageBaseOverlayView *)self recognitionResult];
  [v10 imageSize];
  double v13 = VKMAspectRatio(v11, v12);

  id v45 = v9;
  CGFloat v14 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v9, v13, 0.2, 0.25);
  CGFloat v15 = (void *)[v14 copy];
  [(VKCImageCustomHighlightView *)self setNormalizedHighlightPath:v15];

  double v16 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v14, "vk_appendBezierPath:", v16);

  double v17 = (void *)[v14 copy];
  [(VKCImageCustomHighlightView *)self setBorderedNormalizedHighlightPath:v17];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v18 = [(VKCImageCustomHighlightView *)self highlightShadowLayer];
  double v19 = [(VKCImageCustomHighlightView *)self highlightLayer];
  double v20 = [(VKCImageCustomHighlightView *)self highlightColorLayer];
  double v21 = [MEMORY[0x1E4F428B8] blackColor];
  id v22 = [v21 colorWithAlphaComponent:0.25];
  objc_msgSend(v19, "setFillColor:", objc_msgSend(v22, "CGColor"));

  uint64_t v23 = *MEMORY[0x1E4F39FB8];
  [v19 setFillRule:*MEMORY[0x1E4F39FB8]];
  double v24 = [(VKCImageCustomHighlightView *)self highlightColor];
  double v25 = objc_msgSend(v24, "vk_colorWithMaxSaturation");
  objc_msgSend(v25, "vk_colorWith20PercentOpacity");
  id v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v26, "CGColor"));

  [v19 setFillRule:v23];
  [(VKCImageCustomHighlightView *)self updateHighlightLayerGeometry];
  [(UIView *)self vk_viewLengthFromWindowLength:15.0];
  objc_msgSend(v18, "setShadowRadius:");
  [(UIView *)self vk_viewLengthFromWindowLength:5.0];
  objc_msgSend(v18, "setShadowOffset:", 0.0, v27);
  id v28 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v18, "setShadowColor:", objc_msgSend(v28, "CGColor"));

  LODWORD(v29) = 0.25;
  [v18 setShadowOpacity:v29];
  [(VKCImageCustomHighlightView *)self _configureHighlightDotForRanges:v46];

  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] begin];
  if (a4)
  {
    long long v30 = [(VKCImageCustomHighlightView *)self normalizedHighlightPath];
    objc_msgSend(v20, "setPath:", objc_msgSend(v30, "vk_CGPath"));

    objc_msgSend(v19, "setPath:", objc_msgSend(v14, "vk_CGPath"));
    LODWORD(v31) = 1.0;
    [v18 setOpacity:v31];
    LODWORD(v32) = 1.0;
    [v19 setOpacity:v32];
    LODWORD(v33) = 1.0;
    [v20 setOpacity:v33];
    v35 = v44;
    v34 = v45;
    if (!a5)
    {
      v36 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v36 setFromValue:&unk_1F357DB18];
      [v36 setToValue:&unk_1F357DB30];
      [v36 setDuration:0.25];
      v37 = (void *)[v36 copy];
      [v18 addAnimation:v37 forKey:0];

      v38 = (void *)[v36 copy];
      [v19 addAnimation:v38 forKey:0];

      [v20 addAnimation:v36 forKey:0];
    }
  }
  else
  {
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v39 = [(VKCImageCustomHighlightView *)self normalizedHighlightPath];
    objc_msgSend(v20, "setPath:", objc_msgSend(v39, "vk_CGPath"));

    objc_msgSend(v19, "setPath:", objc_msgSend(v14, "vk_CGPath"));
    LODWORD(v40) = 1.0;
    [v18 setOpacity:v40];
    LODWORD(v41) = 1.0;
    [v19 setOpacity:v41];
    LODWORD(v42) = 1.0;
    [v20 setOpacity:v42];
    v35 = v44;
    v34 = v45;
  }
  [MEMORY[0x1E4F39CF8] commit];
}

void __85__VKCImageCustomHighlightView_performHighlightForRanges_animated_isReplacingResults___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) normalizedSelectionQuadsForRange:a2];
  [v2 addObjectsFromArray:v3];
}

- (void)_configureHighlightDotForRanges:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(VKCImageBaseOverlayView *)self recognitionResult];
  [(VKCImageBaseOverlayView *)self contentsRect];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke;
  v18[3] = &unk_1E6BF1A78;
  id v19 = v6;
  id v20 = v7;
  double v21 = self;
  uint64_t v22 = v8;
  uint64_t v23 = v9;
  uint64_t v24 = v10;
  uint64_t v25 = v11;
  id v12 = v7;
  id v13 = v6;
  [v5 enumerateObjectsUsingBlock:v18];

  [v13 sortUsingComparator:&__block_literal_global_58_0];
  CGFloat v14 = [(VKCImageCustomHighlightView *)self highlightColor];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke_3;
  v16[3] = &unk_1E6BF1AC0;
  v16[4] = self;
  id v17 = v14;
  id v15 = v14;
  [v13 enumerateObjectsUsingBlock:v16];
}

void __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "selectionRectsForRange:documentView:contentRect:", a2, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
}

uint64_t __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = NSNumber;
  id v5 = a3;
  id v6 = [a2 quad];
  [v6 maxHeight];
  id v7 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v5 quad];

  [v9 maxHeight];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

void __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v25 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  id v6 = [*(id *)(a1 + 32) highlightLayer];
  [v25 rect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v6, "convertRect:fromLayer:", v15, v8, v10, v12, v14);
  objc_msgSend(v5, "setFrame:");

  if (a3 <= 7)
  {
    double v16 = [[VKCTextHighlightDot alloc] initWithColor:*(void *)(a1 + 40)];
    id v17 = [v25 quad];
    [v17 sideLength];
    -[VKCTextHighlightDot setQuadSideLength:](v16, "setQuadSideLength:");

    [(VKCTextHighlightDot *)v16 setTextHighlightLayer:v5];
    double v18 = [v25 quad];
    [v18 vertexCentroid];
    double v21 = VKMRectWithCenterAndSize(v19, v20, 20.0);

    [v25 rect];
    [(VKCTextHighlightDot *)v16 setFrame:VKMAddPoints(v22, v23, v21)];
    uint64_t v24 = [*(id *)(a1 + 32) highlightDots];
    [v24 addObject:v16];

    [*(id *)(a1 + 32) addSubview:v16];
  }
}

- (VKCImageCustomHighlightViewDelegate)highlightViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightViewDelegate);
  return (VKCImageCustomHighlightViewDelegate *)WeakRetained;
}

- (void)setHighlightViewDelegate:(id)a3
{
}

- (NSArray)highlightRanges
{
  return self->_highlightRanges;
}

- (void)setHighlightRanges:(id)a3
{
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (void)setSelectionRects:(id)a3
{
}

- (NSArray)matchedRanges
{
  return self->_matchedRanges;
}

- (void)setMatchedRanges:(id)a3
{
}

- (CAShapeLayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
}

- (CALayer)highlightShadowLayer
{
  return self->_highlightShadowLayer;
}

- (void)setHighlightShadowLayer:(id)a3
{
}

- (CAShapeLayer)highlightColorLayer
{
  return self->_highlightColorLayer;
}

- (void)setHighlightColorLayer:(id)a3
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

- (BOOL)isConfiguringHighlights
{
  return self->_isConfiguringHighlights;
}

- (void)setIsConfiguringHighlights:(BOOL)a3
{
  self->_isConfiguringHighlights = a3;
}

- (NSMutableArray)highlightDots
{
  return self->_highlightDots;
}

- (void)setHighlightDots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDots, 0);
  objc_storeStrong((id *)&self->_borderedNormalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_normalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_highlightColorLayer, 0);
  objc_storeStrong((id *)&self->_highlightShadowLayer, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_matchedRanges, 0);
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_storeStrong((id *)&self->_highlightRanges, 0);
  objc_destroyWeak((id *)&self->_highlightViewDelegate);
}

@end