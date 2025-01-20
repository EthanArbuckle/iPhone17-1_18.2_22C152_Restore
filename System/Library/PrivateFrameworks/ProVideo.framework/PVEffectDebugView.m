@interface PVEffectDebugView
+ (id)documentBoundsLayerWithFrame:(CGRect)a3 options:(id)a4;
+ (id)hitAreaShapeLayerWithFrame:(CGRect)a3 options:(id)a4;
+ (id)objectBoundsLayerWithFrame:(CGRect)a3 options:(id)a4;
+ (id)outputROILayerWithFrame:(CGRect)a3 options:(id)a4;
+ (id)textBoundsLayerWithFrame:(CGRect)a3 options:(id)a4;
- (CALayer)rootLayer;
- (CALayer)textBoundingBoxesContainerLayer;
- (CALayer)textCornerPointsContainerLayer;
- (CAShapeLayer)cornerPointsLayer;
- (CAShapeLayer)documentBoundingBoxLayer;
- (CAShapeLayer)hitAreaMinimumSizeBoundingBoxLayer;
- (CAShapeLayer)hitAreaPointsLayer;
- (CAShapeLayer)hitAreaShapeLayer;
- (CAShapeLayer)midpointLayer;
- (CAShapeLayer)objectAlignedBoundingBoxLayer;
- (CAShapeLayer)originCrosshairLayer;
- (CAShapeLayer)originLayer;
- (CAShapeLayer)outputROILayer;
- (CAShapeLayer)userPointsLayer;
- (CAShapeLayer)userPointsTransformedLayer;
- (CAShapeLayer)userRectsLayer;
- (CAShapeLayer)userRectsTransformedLayer;
- (CATransformLayer)rootTransformLayer;
- (PVEffectDebugOptionsView)optionsView;
- (PVEffectDebugView)initWithCoder:(id)a3;
- (PVEffectDebugView)initWithFrame:(CGRect)a3;
- (PVEffectDebugView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (PVEffectDebugViewDelegate)delegate;
- (PVEffectDebugViewOptions)options;
- (UIView)rootContainerView;
- (id)userPointsToDraw;
- (id)userRectsToDraw;
- (void)setCornerPointsLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentBoundingBoxLayer:(id)a3;
- (void)setHitAreaMinimumSizeBoundingBoxLayer:(id)a3;
- (void)setHitAreaPointsLayer:(id)a3;
- (void)setHitAreaShapeLayer:(id)a3;
- (void)setMidpointLayer:(id)a3;
- (void)setObjectAlignedBoundingBoxLayer:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOptionsView:(id)a3;
- (void)setOriginCrosshairLayer:(id)a3;
- (void)setOriginLayer:(id)a3;
- (void)setOutputROILayer:(id)a3;
- (void)setRootContainerView:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setRootTransformLayer:(id)a3;
- (void)setTextBoundingBoxesContainerLayer:(id)a3;
- (void)setTextCornerPointsContainerLayer:(id)a3;
- (void)setUserPointsLayer:(id)a3;
- (void)setUserPointsTransformedLayer:(id)a3;
- (void)setUserRectsLayer:(id)a3;
- (void)setUserRectsTransformedLayer:(id)a3;
- (void)setupViews;
- (void)updateBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6;
- (void)updateCrosshairLayer:(id)a3 center:(CGPoint)a4 color:(id)a5 size:(CGSize)a6 thickness:(CGSize)a7;
- (void)updateDottedBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8;
- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6;
- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6 borderWidth:(double)a7 borderColor:(id)a8 borderPhase:(double)a9 borderDashPattern:(id)a10;
- (void)updateFilledPolygonLayer:(id)a3 path:(CGPath *)a4 fillColor:(id)a5;
- (void)updatePointsLayers:(id)a3 points:(id)a4 colors:(id)a5 size:(double)a6;
- (void)updatePolygonLayer:(id)a3 points:(id)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8;
- (void)updateUserPoints:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 points:(id)a6;
- (void)updateUserRects:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 rects:(id)a6;
- (void)updateWithEffectFrame:(id)a3;
@end

@implementation PVEffectDebugView

- (PVEffectDebugView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PVEffectDebugView;
  v3 = -[PVEffectDebugView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PVEffectDebugView *)v3 setupViews];
  }
  return v4;
}

- (PVEffectDebugView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVEffectDebugView;
  v10 = -[PVEffectDebugView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(PVEffectDebugView *)v10 setDelegate:v9];
    [(PVEffectDebugView *)v11 setupViews];
  }

  return v11;
}

- (PVEffectDebugView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PVEffectDebugView;
  v3 = [(PVEffectDebugView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PVEffectDebugView *)v3 setupViews];
  }
  return v4;
}

- (void)setupViews
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PVEffectDebugView *)self setRootContainerView:v4];

  v5 = [(PVEffectDebugView *)self rootContainerView];
  [v5 setUserInteractionEnabled:0];

  objc_super v6 = [(PVEffectDebugView *)self rootContainerView];
  [v6 setHidden:1];

  v7 = [(PVEffectDebugView *)self rootContainerView];
  [(PVEffectDebugView *)self addSubview:v7];

  v8 = [(PVEffectDebugView *)self rootContainerView];
  id v9 = [v8 layer];
  [(PVEffectDebugView *)self setRootLayer:v9];

  v10 = [MEMORY[0x1E4F39D10] layer];
  [(PVEffectDebugView *)self setRootTransformLayer:v10];

  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_super v13 = [(PVEffectDebugView *)self rootTransformLayer];
  objc_msgSend(v13, "setAnchorPoint:", v11, v12);

  v14 = [(PVEffectDebugView *)self rootLayer];
  v15 = [(PVEffectDebugView *)self rootTransformLayer];
  [v14 addSublayer:v15];

  v16 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setDocumentBoundingBoxLayer:v16];

  v17 = [(PVEffectDebugView *)self rootTransformLayer];
  v18 = [(PVEffectDebugView *)self documentBoundingBoxLayer];
  [v17 addSublayer:v18];

  v19 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setOutputROILayer:v19];

  v20 = [(PVEffectDebugView *)self rootTransformLayer];
  v21 = [(PVEffectDebugView *)self outputROILayer];
  [v20 addSublayer:v21];

  v22 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setObjectAlignedBoundingBoxLayer:v22];

  v23 = [(PVEffectDebugView *)self rootTransformLayer];
  v24 = [(PVEffectDebugView *)self objectAlignedBoundingBoxLayer];
  [v23 addSublayer:v24];

  v25 = [MEMORY[0x1E4F39BE8] layer];
  [(PVEffectDebugView *)self setTextBoundingBoxesContainerLayer:v25];

  v26 = [(PVEffectDebugView *)self rootLayer];
  v27 = [(PVEffectDebugView *)self textBoundingBoxesContainerLayer];
  [v26 addSublayer:v27];

  v28 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setHitAreaShapeLayer:v28];

  v29 = [(PVEffectDebugView *)self rootLayer];
  v30 = [(PVEffectDebugView *)self hitAreaShapeLayer];
  [v29 addSublayer:v30];

  v31 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setHitAreaMinimumSizeBoundingBoxLayer:v31];

  v32 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
  [v32 setZPosition:-1.0];

  v33 = [(PVEffectDebugView *)self rootLayer];
  v34 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
  [v33 addSublayer:v34];

  v35 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
  LODWORD(v36) = 1050253722;
  [v35 setOpacity:v36];

  v37 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setMidpointLayer:v37];

  v38 = [(PVEffectDebugView *)self midpointLayer];
  [v38 setZPosition:10.0];

  v39 = [(PVEffectDebugView *)self rootLayer];
  v40 = [(PVEffectDebugView *)self midpointLayer];
  [v39 addSublayer:v40];

  v41 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setOriginLayer:v41];

  v42 = [(PVEffectDebugView *)self rootLayer];
  v43 = [(PVEffectDebugView *)self originLayer];
  [v42 addSublayer:v43];

  v44 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setOriginCrosshairLayer:v44];

  v45 = [(PVEffectDebugView *)self rootTransformLayer];
  v46 = [(PVEffectDebugView *)self originCrosshairLayer];
  [v45 addSublayer:v46];

  v47 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setCornerPointsLayer:v47];

  v48 = [(PVEffectDebugView *)self cornerPointsLayer];
  [v48 setZPosition:10.0];

  v49 = [(PVEffectDebugView *)self rootLayer];
  v50 = [(PVEffectDebugView *)self cornerPointsLayer];
  [v49 addSublayer:v50];

  v51 = [MEMORY[0x1E4F39BE8] layer];
  [(PVEffectDebugView *)self setTextCornerPointsContainerLayer:v51];

  v52 = [(PVEffectDebugView *)self rootLayer];
  v53 = [(PVEffectDebugView *)self textCornerPointsContainerLayer];
  [v52 addSublayer:v53];

  v54 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setHitAreaPointsLayer:v54];

  v55 = [(PVEffectDebugView *)self rootLayer];
  v56 = [(PVEffectDebugView *)self hitAreaPointsLayer];
  [v55 addSublayer:v56];

  v57 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setUserRectsLayer:v57];

  v58 = [(PVEffectDebugView *)self rootLayer];
  v59 = [(PVEffectDebugView *)self userRectsLayer];
  [v58 addSublayer:v59];

  v60 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setUserRectsTransformedLayer:v60];

  v61 = [(PVEffectDebugView *)self rootTransformLayer];
  v62 = [(PVEffectDebugView *)self userRectsTransformedLayer];
  [v61 addSublayer:v62];

  v63 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setUserPointsLayer:v63];

  v64 = [(PVEffectDebugView *)self rootLayer];
  v65 = [(PVEffectDebugView *)self userPointsLayer];
  [v64 addSublayer:v65];

  v66 = [MEMORY[0x1E4F39C88] layer];
  [(PVEffectDebugView *)self setUserPointsTransformedLayer:v66];

  v67 = [(PVEffectDebugView *)self rootTransformLayer];
  v68 = [(PVEffectDebugView *)self userPointsTransformedLayer];
  [v67 addSublayer:v68];

  id v71 = [(PVEffectDebugView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v71 pvEffectDebugViewOptions], (uint64_t v69 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v69 = +[PVEffectDebugViewOptions options];
  }
  v70 = (void *)v69;
  [(PVEffectDebugView *)self setOptions:v69];
}

- (void)updateDottedBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v16 = a8;
  id v17 = a6;
  id v18 = a3;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  pv_CGRect_to_NSArray(v22);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  v19 = [MEMORY[0x1E4F428B8] clearColor];
  setShapeLayerPathFromPointsWithStyle(v18, v20, v19, v17, v16, a7, a5);
}

- (void)updateBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a6;
  id v13 = a3;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  pv_CGRect_to_NSArray(v17);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = [MEMORY[0x1E4F428B8] clearColor];
  setShapeLayerPathFromPointsWithStyle(v13, v15, v14, v12, 0, 0.0, a5);
}

- (void)updatePolygonLayer:(id)a3 points:(id)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8
{
  id v13 = (void *)MEMORY[0x1E4F428B8];
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v13 clearColor];
  setShapeLayerPathFromPointsWithStyle(v17, v16, v18, v15, v14, a7, a5);
}

- (void)updateFilledPolygonLayer:(id)a3 path:(CGPath *)a4 fillColor:(id)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F428B8];
  id v9 = a5;
  v10 = [v8 clearColor];
  id v11 = v9;
  id v14 = v7;
  uint64_t v12 = [v11 CGColor];

  [v14 setFillColor:v12];
  id v13 = v10;
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v13, "CGColor"));
  [v14 setLineDashPhase:0.0];
  [v14 setLineDashPattern:0];
  [v14 setLineWidth:0.0];
  [v14 setPath:a4];
}

- (void)updatePointsLayers:(id)a3 points:(id)a4 colors:(id)a5 size:(double)a6
{
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = *(void *)"";
  v13[2] = __59__PVEffectDebugView_updatePointsLayers_points_colors_size___block_invoke;
  v13[3] = &unk_1E6168800;
  double v16 = a6;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __59__PVEffectDebugView_updatePointsLayers_points_colors_size___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  objc_super v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 CGPointValue];
  double v8 = v7;
  double v10 = v9;

  double v11 = *(double *)(a1 + 48);
  id v12 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 % objc_msgSend(*(id *)(a1 + 40), "count"));
  v19.origin.CGFloat x = v8 - v11 * 0.5;
  v19.origin.CGFloat y = v10 - v11 * 0.5;
  v19.size.CGFloat width = v11;
  v19.size.CGFloat height = v11;
  id v13 = CGPathCreateWithEllipseInRect(v19, 0);
  id v14 = [MEMORY[0x1E4F428B8] clearColor];
  id v15 = v12;
  id v17 = v5;
  objc_msgSend(v17, "setFillColor:", objc_msgSend(v15, "CGColor"));
  id v16 = v14;
  objc_msgSend(v17, "setStrokeColor:", objc_msgSend(v16, "CGColor"));
  [v17 setLineDashPhase:0.0];
  [v17 setLineDashPattern:0];
  [v17 setLineWidth:0.0];
  [v17 setPath:v13];

  CGPathRelease(v13);
}

- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  CGFloat v11 = a5 + a5;
  id v12 = a6;
  v20.origin.double x = x - v11 * 0.5;
  v20.origin.double y = y - v11 * 0.5;
  v20.size.CGFloat width = v11;
  v20.size.CGFloat height = v11;
  id v13 = CGPathCreateWithEllipseInRect(v20, 0);
  id v14 = [MEMORY[0x1E4F428B8] clearColor];
  id v15 = v12;
  id v18 = v10;
  uint64_t v16 = [v15 CGColor];

  [v18 setFillColor:v16];
  id v17 = v14;
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  [v18 setLineDashPhase:0.0];
  [v18 setLineDashPattern:0];
  [v18 setLineWidth:0.0];
  [v18 setPath:v13];

  CGPathRelease(v13);
}

- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6 borderWidth:(double)a7 borderColor:(id)a8 borderPhase:(double)a9 borderDashPattern:(id)a10
{
  double y = a4.y;
  double x = a4.x;
  id v18 = a3;
  id v19 = a8;
  id v20 = a10;
  CGFloat v21 = a5 + a5;
  id v22 = a6;
  v32.origin.double x = x - v21 * 0.5;
  v32.origin.double y = y - v21 * 0.5;
  v32.size.CGFloat width = v21;
  v32.size.CGFloat height = v21;
  v23 = CGPathCreateWithEllipseInRect(v32, 0);
  id v24 = v22;
  id v30 = v18;
  id v25 = v19;
  id v26 = v20;
  uint64_t v27 = [v24 CGColor];

  [v30 setFillColor:v27];
  id v28 = v25;
  uint64_t v29 = [v28 CGColor];

  [v30 setStrokeColor:v29];
  [v30 setLineDashPhase:a9];
  [v30 setLineDashPattern:v26];

  [v30 setLineWidth:a7];
  [v30 setPath:v23];

  CGPathRelease(v23);
}

- (void)updateCrosshairLayer:(id)a3 center:(CGPoint)a4 color:(id)a5 size:(CGSize)a6 thickness:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v9 = a6.height;
  double v10 = a6.width;
  double y = a4.y;
  double x = a4.x;
  id v14 = a5;
  id v15 = a3;
  crosshairPointsWithSizeAndCenterPoint(v10, v9, width, height, x, y);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [MEMORY[0x1E4F428B8] clearColor];
  setShapeLayerPathFromPointsWithStyle(v15, v17, v14, v16, 0, 0.0, 0.0);
}

- (void)updateUserRects:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 rects:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_msgSend(v9, "setHidden:", objc_msgSend(v11, "count") == 0);
  objc_msgSend(v10, "setHidden:", objc_msgSend(v9, "isHidden"));
  if (([v9 isHidden] & 1) == 0)
  {
    id v12 = [v9 sublayers];
    id v13 = (void *)[v12 copy];

    [v13 enumerateObjectsUsingBlock:&__block_literal_global_0];
    id v14 = [v10 sublayers];
    id v15 = (void *)[v14 copy];

    [v15 enumerateObjectsUsingBlock:&__block_literal_global_84];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = *(void *)"";
    v16[2] = __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke_3;
    v16[3] = &unk_1E6168848;
    double v19 = a5;
    id v17 = v9;
    id v18 = v10;
    [v11 enumerateObjectsUsingBlock:v16];
  }
}

uint64_t __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

uint64_t __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

void __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke_3(uint64_t x0_0, void *a2)
{
  id v15 = a2;
  char v3 = [v15 ignoreTransform];
  [v15 strokeWidth];
  double v5 = v4;
  if ((v3 & 1) == 0) {
    double v5 = v4 / *(double *)(x0_0 + 48);
  }
  objc_super v6 = [MEMORY[0x1E4F39C88] layer];
  [v15 frame];
  double v7 = pv_CGRect_to_NSArray(v17);
  double v8 = [v15 fillColor];
  id v9 = [v15 strokeColor];
  [v15 lineDashPhase];
  double v11 = v10;
  id v12 = [v15 lineDashPattern];
  setShapeLayerPathFromPointsWithStyle(v6, v7, v8, v9, v12, v11, v5);

  int v13 = [v15 ignoreTransform];
  uint64_t v14 = 40;
  if (v13) {
    uint64_t v14 = 32;
  }
  [*(id *)(x0_0 + v14) addSublayer:v6];
}

- (void)updateUserPoints:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 points:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_msgSend(v10, "setHidden:", objc_msgSend(v12, "count") == 0);
  objc_msgSend(v11, "setHidden:", objc_msgSend(v10, "isHidden"));
  if (([v10 isHidden] & 1) == 0)
  {
    int v13 = [v10 sublayers];
    uint64_t v14 = (void *)[v13 copy];

    [v14 enumerateObjectsUsingBlock:&__block_literal_global_87];
    id v15 = [v11 sublayers];
    uint64_t v16 = (void *)[v15 copy];

    [v16 enumerateObjectsUsingBlock:&__block_literal_global_89];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = *(void *)"";
    v17[2] = __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_3;
    v17[3] = &unk_1E6168898;
    double v20 = a5;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    [v12 enumerateObjectsUsingBlock:v17];
  }
}

uint64_t __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

uint64_t __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

void __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 ignoreTransform];
  [v3 radius];
  double v6 = v5;
  if ((v4 & 1) == 0) {
    double v6 = v5 / *(double *)(a1 + 56);
  }
  char v7 = [v3 ignoreTransform];
  [v3 strokeWidth];
  double v9 = v8;
  if ((v7 & 1) == 0) {
    double v9 = v8 / *(double *)(a1 + 56);
  }
  id v10 = [v3 lineDashPattern];
  if (([v3 ignoreTransform] & 1) == 0 && objc_msgSend(v10, "count"))
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = *(void *)"";
    uint64_t v29 = __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_4;
    id v30 = &unk_1E6168870;
    id v12 = v11;
    id v31 = v12;
    uint64_t v32 = *(void *)(a1 + 56);
    [v10 enumerateObjectsUsingBlock:&v27];
    id v13 = v12;

    id v10 = v13;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F39C88], "layer", v27, v28, v29, v30);
  id v15 = *(void **)(a1 + 32);
  [v3 center];
  double v17 = v16;
  double v19 = v18;
  double v20 = [v3 fillColor];
  CGFloat v21 = [v3 strokeColor];
  [v3 lineDashPhase];
  double v23 = v22;
  id v24 = [v3 lineDashPattern];
  objc_msgSend(v15, "updateFilledCircleLayer:center:radius:fillColor:borderWidth:borderColor:borderPhase:borderDashPattern:", v14, v20, v21, v24, v17, v19, v6, v9, v23);

  int v25 = [v3 ignoreTransform];
  uint64_t v26 = 48;
  if (v25) {
    uint64_t v26 = 40;
  }
  [*(id *)(a1 + v26) addSublayer:v14];
}

void __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = NSNumber;
  [a2 doubleValue];
  id v7 = [v5 numberWithDouble:v6 / *(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

- (void)updateWithEffectFrame:(id)a3
{
  uint64_t v301 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PVEffectDebugView *)self options];
  char v6 = [v5 isEnabled];

  if (!v4 || (v6 & 1) == 0)
  {
    v156 = [(PVEffectDebugView *)self rootContainerView];
    [v156 setHidden:1];

    goto LABEL_69;
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v7 = [(PVEffectDebugView *)self rootContainerView];
  [v7 setHidden:0];

  [v4 viewSize];
  double v9 = v8;
  double v11 = v10;
  v302.origin.double x = 0.0;
  v302.origin.double y = 0.0;
  v302.size.double width = v9;
  v302.size.double height = v11;
  double MidX = CGRectGetMidX(v302);
  v303.origin.double x = 0.0;
  v303.origin.double y = 0.0;
  v303.size.double width = v9;
  v303.size.double height = v11;
  double MidY = CGRectGetMidY(v303);
  long long v288 = 0u;
  long long v289 = 0u;
  long long v287 = 0u;
  [(PVEffectDebugView *)self transform];
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v286[0] = *MEMORY[0x1E4F1DAB8];
  v286[1] = v14;
  v286[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PVEffectDebugView *)self setTransform:v286];
  -[PVEffectDebugView setFrame:](self, "setFrame:", 0.0, 0.0, v9, v11);
  v285[0] = v287;
  v285[1] = v288;
  v285[2] = v289;
  [(PVEffectDebugView *)self setTransform:v285];
  id v15 = [(PVEffectDebugView *)self rootContainerView];
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v9, v11);

  double v16 = [(PVEffectDebugView *)self rootTransformLayer];
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v284[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v284[5] = v17;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v284[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v284[7] = v18;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v284[0] = *MEMORY[0x1E4F39B10];
  v284[1] = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v284[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v284[3] = v20;
  [v16 setTransform:v284];

  CGFloat v21 = [(PVEffectDebugView *)self rootTransformLayer];
  objc_msgSend(v21, "setBounds:", 0.0, 0.0, v9, v11);

  double v22 = *MEMORY[0x1E4F1DAD8];
  double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v24 = [(PVEffectDebugView *)self rootTransformLayer];
  double v263 = v23;
  objc_msgSend(v24, "setPosition:", v22, v23);

  long long v282 = 0u;
  long long v283 = 0u;
  long long v280 = 0u;
  long long v281 = 0u;
  memset(&v279[16], 0, 64);
  [v4 transformInfo];
  double v25 = fmax(fabs(*(double *)&v280), 0.001);
  [v4 transform];
  long long v264 = v279[11];
  long long v267 = v279[9];
  long long v255 = v279[10];
  long long v257 = v279[8];
  long long v259 = v279[15];
  long long v261 = v279[13];
  long long v253 = v279[14];
  long long v254 = v279[12];
  uint64_t v26 = [(PVEffectDebugView *)self rootTransformLayer];
  v279[0] = v257;
  v279[1] = v267;
  v279[2] = v255;
  v279[3] = v264;
  v279[4] = v254;
  v279[5] = v261;
  v279[6] = v253;
  v279[7] = v259;
  [v26 setTransform:v279];

  uint64_t v27 = [(PVEffectDebugView *)self documentBoundingBoxLayer];
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v9, v11);

  uint64_t v28 = [(PVEffectDebugView *)self documentBoundingBoxLayer];
  objc_msgSend(v28, "setPosition:", MidX, MidY);

  uint64_t v29 = [(PVEffectDebugView *)self outputROILayer];
  objc_msgSend(v29, "setBounds:", 0.0, 0.0, v9, v11);

  id v30 = [(PVEffectDebugView *)self outputROILayer];
  objc_msgSend(v30, "setPosition:", MidX, MidY);

  id v31 = [(PVEffectDebugView *)self objectAlignedBoundingBoxLayer];
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, v9, v11);

  uint64_t v32 = [(PVEffectDebugView *)self objectAlignedBoundingBoxLayer];
  objc_msgSend(v32, "setPosition:", MidX, MidY);

  v33 = [(PVEffectDebugView *)self textBoundingBoxesContainerLayer];
  objc_msgSend(v33, "setBounds:", 0.0, 0.0, v9, v11);

  v34 = [(PVEffectDebugView *)self textBoundingBoxesContainerLayer];
  objc_msgSend(v34, "setPosition:", MidX, MidY);

  v35 = [(PVEffectDebugView *)self originLayer];
  objc_msgSend(v35, "setBounds:", 0.0, 0.0, v9, v11);

  double v36 = [(PVEffectDebugView *)self originLayer];
  objc_msgSend(v36, "setPosition:", MidX, MidY);

  v37 = [(PVEffectDebugView *)self originCrosshairLayer];
  objc_msgSend(v37, "setBounds:", 0.0, 0.0, v9, v11);

  v38 = [(PVEffectDebugView *)self originCrosshairLayer];
  objc_msgSend(v38, "setPosition:", MidX, MidY);

  v39 = [(PVEffectDebugView *)self midpointLayer];
  objc_msgSend(v39, "setBounds:", 0.0, 0.0, v9, v11);

  v40 = [(PVEffectDebugView *)self midpointLayer];
  objc_msgSend(v40, "setPosition:", MidX, MidY);

  v41 = [(PVEffectDebugView *)self cornerPointsLayer];
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v9, v11);

  v42 = [(PVEffectDebugView *)self cornerPointsLayer];
  objc_msgSend(v42, "setPosition:", MidX, MidY);

  v43 = [(PVEffectDebugView *)self textCornerPointsContainerLayer];
  objc_msgSend(v43, "setBounds:", 0.0, 0.0, v9, v11);

  v44 = [(PVEffectDebugView *)self textCornerPointsContainerLayer];
  objc_msgSend(v44, "setPosition:", MidX, MidY);

  v45 = [(PVEffectDebugView *)self hitAreaPointsLayer];
  objc_msgSend(v45, "setBounds:", 0.0, 0.0, v9, v11);

  v46 = [(PVEffectDebugView *)self hitAreaPointsLayer];
  objc_msgSend(v46, "setPosition:", MidX, MidY);

  v47 = [(PVEffectDebugView *)self userRectsLayer];
  objc_msgSend(v47, "setBounds:", 0.0, 0.0, v9, v11);

  v48 = [(PVEffectDebugView *)self userRectsLayer];
  objc_msgSend(v48, "setPosition:", MidX, MidY);

  v49 = [(PVEffectDebugView *)self userRectsTransformedLayer];
  objc_msgSend(v49, "setBounds:", 0.0, 0.0, v9, v11);

  v50 = [(PVEffectDebugView *)self userRectsTransformedLayer];
  objc_msgSend(v50, "setPosition:", MidX, MidY);

  v51 = [(PVEffectDebugView *)self userPointsLayer];
  objc_msgSend(v51, "setBounds:", 0.0, 0.0, v9, v11);

  v52 = [(PVEffectDebugView *)self userPointsLayer];
  objc_msgSend(v52, "setPosition:", MidX, MidY);

  v53 = [(PVEffectDebugView *)self userPointsTransformedLayer];
  double v260 = v9;
  double v258 = v11;
  objc_msgSend(v53, "setBounds:", 0.0, 0.0, v9, v11);

  v54 = [(PVEffectDebugView *)self userPointsTransformedLayer];
  objc_msgSend(v54, "setPosition:", MidX, MidY);

  v55 = [(PVEffectDebugView *)self options];
  int v56 = [v55 showDocumentBoundingBox];

  uint64_t v57 = v56 ^ 1u;
  v58 = [(PVEffectDebugView *)self documentBoundingBoxLayer];
  [v58 setHidden:v57];

  if ((v57 & 1) == 0)
  {
    [v4 effectSize];
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    int v63 = [v4 effectOrigin];
    uint64_t v64 = 0;
    double v296 = 0.0;
    double v297 = 0.0;
    __asm { FMOV            V1.2D, #1.0 }
    long long v298 = xmmword_1B7E733D0;
    long long v299 = _Q1;
    long long v300 = xmmword_1B7E733E0;
    while (1)
    {
      double v265 = *(double *)((char *)&v296 + v64);
      double v268 = *(double *)((char *)&v296 + v64 + 8);
      if (v63 == 2) {
        break;
      }
      CGFloat v70 = v23;
      CGFloat v71 = v22;
      if (v63 != 1) {
        goto LABEL_9;
      }
      memset(&v290, 0, sizeof(v290));
      CGAffineTransformMakeScale(&v290, v60, v62);
      CGAffineTransform v291 = v290;
      CGAffineTransformTranslate(&v292, &v291, v22, 1.0);
      CGAffineTransform v290 = v292;
      CGAffineTransform v291 = v292;
      CGAffineTransformScale(&v292, &v291, 1.0, -1.0);
LABEL_10:
      CGAffineTransform v290 = v292;
      *(float64x2_t *)((char *)&v296 + v64) = vaddq_f64(*(float64x2_t *)&v292.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v292.a, v265), vmulq_n_f64(*(float64x2_t *)&v292.c, v268)));
      v64 += 16;
      if (v64 == 64)
      {
        uint64_t v72 = 0;
        double v73 = -1.79769313e308;
        double v74 = 1.79769313e308;
        double v75 = -1.79769313e308;
        double v76 = 1.79769313e308;
        do
        {
          double v77 = *(double *)((char *)&v296 + v72);
          double v78 = *(double *)((char *)&v296 + v72 + 8);
          if (v77 < v76) {
            double v76 = *(double *)((char *)&v296 + v72);
          }
          if (v77 > v75) {
            double v75 = *(double *)((char *)&v296 + v72);
          }
          if (v78 > v73) {
            double v73 = *(double *)((char *)&v296 + v72 + 8);
          }
          if (v78 < v74) {
            double v74 = *(double *)((char *)&v296 + v72 + 8);
          }
          v72 += 16;
        }
        while (v72 != 64);
        double v79 = v75 - v76;
        double v80 = v73 - v74;
        v81 = [(PVEffectDebugView *)self documentBoundingBoxLayer];
        v82 = [(PVEffectDebugView *)self options];
        v83 = [v82 documentBoundingBoxColor];
        v84 = [NSNumber numberWithDouble:8.0 / v25];
        v295[0] = v84;
        v85 = [NSNumber numberWithDouble:5.0 / v25];
        v295[1] = v85;
        v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v295 count:2];
        -[PVEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v81, v83, v86, v76, v74, v79, v80, 2.0 / v25, 0.0);

        goto LABEL_22;
      }
    }
    CGFloat v70 = -0.5;
    CGFloat v71 = -0.5;
LABEL_9:
    memset(&v290, 0, sizeof(v290));
    CGAffineTransformMakeScale(&v290, v60, v62);
    CGAffineTransform v291 = v290;
    CGAffineTransformTranslate(&v292, &v291, v71, v70);
    goto LABEL_10;
  }
LABEL_22:
  v87 = [(PVEffectDebugView *)self options];
  int v88 = [v87 showOutputROI];

  uint64_t v89 = v88 ^ 1u;
  v90 = [(PVEffectDebugView *)self outputROILayer];
  [v90 setHidden:v89];

  if (v89) {
    goto LABEL_41;
  }
  double v256 = v25;
  [v4 outputROI];
  double v92 = v91;
  double v94 = v93;
  double v96 = v95;
  double v98 = v97;
  [v4 effectSize];
  double v100 = v99;
  double v102 = v101;
  [v4 effectSize];
  double v104 = v103;
  CGFloat v262 = v22;
  double v106 = v105;
  int v107 = [v4 effectOrigin];
  uint64_t v108 = 0;
  double v296 = v92;
  double v297 = v94;
  *(double *)&long long v298 = v92 + v96;
  *((double *)&v298 + 1) = v94;
  *(double *)&long long v299 = v92 + v96;
  *((double *)&v299 + 1) = v94 + v98;
  *(double *)&long long v300 = v92;
  *((double *)&v300 + 1) = v94 + v98;
  double v109 = v104 / v100;
  double v110 = v100 * -0.5;
  double v111 = v106 / v102;
  do
  {
    double v266 = *(double *)((char *)&v296 + v108);
    double v269 = *(double *)((char *)&v296 + v108 + 8);
    if (v107 == 2)
    {
      double v112 = v102 * -0.5;
      CGFloat v113 = v110;
    }
    else
    {
      double v112 = v263;
      CGFloat v113 = v262;
      if (v107 == 1)
      {
        memset(&v290, 0, sizeof(v290));
        CGAffineTransformMakeScale(&v290, v109, v111);
        CGAffineTransform v291 = v290;
        CGAffineTransformTranslate(&v292, &v291, v262, v102);
        CGAffineTransform v290 = v292;
        CGAffineTransform v291 = v292;
        CGAffineTransformScale(&v292, &v291, 1.0, -1.0);
        goto LABEL_29;
      }
    }
    memset(&v290, 0, sizeof(v290));
    CGAffineTransformMakeScale(&v290, v109, v111);
    CGAffineTransform v291 = v290;
    CGAffineTransformTranslate(&v292, &v291, v113, v112);
LABEL_29:
    CGAffineTransform v290 = v292;
    *(float64x2_t *)((char *)&v296 + v108) = vaddq_f64(*(float64x2_t *)&v292.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v292.a, v266), vmulq_n_f64(*(float64x2_t *)&v292.c, v269)));
    v108 += 16;
  }
  while (v108 != 64);
  uint64_t v114 = 0;
  double v115 = -1.79769313e308;
  double v116 = 1.79769313e308;
  double v117 = -1.79769313e308;
  double v118 = 1.79769313e308;
  do
  {
    double v119 = *(double *)((char *)&v296 + v114);
    double v120 = *(double *)((char *)&v296 + v114 + 8);
    if (v119 < v118) {
      double v118 = *(double *)((char *)&v296 + v114);
    }
    if (v119 > v117) {
      double v117 = *(double *)((char *)&v296 + v114);
    }
    if (v120 > v115) {
      double v115 = *(double *)((char *)&v296 + v114 + 8);
    }
    if (v120 < v116) {
      double v116 = *(double *)((char *)&v296 + v114 + 8);
    }
    v114 += 16;
  }
  while (v114 != 64);
  double v121 = v117 - v118;
  double v122 = v115 - v116;
  v123 = [(PVEffectDebugView *)self outputROILayer];
  double v25 = v256;
  v124 = [(PVEffectDebugView *)self options];
  v125 = [v124 outputROIColor];
  v126 = [NSNumber numberWithDouble:6.0 / v256];
  v294[0] = v126;
  v127 = [NSNumber numberWithDouble:4.0 / v256];
  v294[1] = v127;
  v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:v294 count:2];
  -[PVEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v123, v125, v128, v118, v116, v121, v122, 2.0 / v256, 10.0 / v256);

  double v22 = v262;
LABEL_41:
  v129 = [(PVEffectDebugView *)self options];
  int v130 = [v129 showObjectAlignedBoundingBox];

  uint64_t v131 = v130 ^ 1u;
  v132 = [(PVEffectDebugView *)self objectAlignedBoundingBoxLayer];
  [v132 setHidden:v131];

  if ((v131 & 1) == 0)
  {
    v133 = [(PVEffectDebugView *)self objectAlignedBoundingBoxLayer];
    [v4 objectBounds];
    double v134 = v22;
    double v136 = v135;
    double v138 = v137;
    double v140 = v139;
    double v142 = v141;
    v143 = [(PVEffectDebugView *)self options];
    v144 = [v143 objectAlignedBoundingBoxColor];
    v145 = [NSNumber numberWithDouble:3.0 / v25];
    v293[0] = v145;
    v146 = [NSNumber numberWithDouble:3.0 / v25];
    v293[1] = v146;
    v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:v293 count:2];
    double v148 = v136;
    double v22 = v134;
    -[PVEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v133, v144, v147, v148, v138, v140, v142, 2.0 / v25, 0.0);
  }
  v149 = [(PVEffectDebugView *)self options];
  if ([v149 showTextBoundingBoxes])
  {
    v150 = [v4 textFrames];
    uint64_t v151 = [v150 count];

    v152 = [(PVEffectDebugView *)self textBoundingBoxesContainerLayer];
    [v152 setHidden:v151 == 0];

    if (v151)
    {
      v153 = [(PVEffectDebugView *)self textBoundingBoxesContainerLayer];
      v154 = [v4 textFrames];
      ensureNSublayers(v153, [v154 count]);

      v155 = [v4 textFrames];
      v273[0] = MEMORY[0x1E4F143A8];
      v273[1] = *(void *)"";
      v273[2] = __43__PVEffectDebugView_updateWithEffectFrame___block_invoke;
      v273[3] = &unk_1E61688C0;
      uint64_t v275 = 0;
      uint64_t v276 = 0;
      v273[4] = self;
      double v277 = v260;
      double v278 = v258;
      id v274 = v4;
      [v155 enumerateObjectsUsingBlock:v273];
    }
  }
  else
  {

    v157 = [(PVEffectDebugView *)self textBoundingBoxesContainerLayer];
    [v157 setHidden:1];
  }
  v158 = [(PVEffectDebugView *)self options];
  int v159 = [v158 showHitAreaShape];

  v160 = [(PVEffectDebugView *)self hitAreaShapeLayer];
  v161 = v160;
  if (v159)
  {
    [v160 setHidden:0];

    v162 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    [v162 setHidden:0];

    v163 = [(PVEffectDebugView *)self hitAreaShapeLayer];
    v164 = [v4 hitAreaPoints];
    v165 = [(PVEffectDebugView *)self options];
    v166 = [v165 hitAreaShapeColor];
    [(PVEffectDebugView *)self updatePolygonLayer:v163 points:v164 borderWidth:v166 borderColor:&unk_1F11EC580 borderPhase:2.0 borderDashPattern:0.0];

    v167 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    ensureNSublayers(v167, 1uLL);

    v168 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    v169 = [v168 sublayers];
    v170 = [v169 firstObject];

    uint64_t v171 = [v4 hitAreaPath];
    v172 = [(PVEffectDebugView *)self options];
    v173 = [v172 hitAreaShapeColor];
    [(PVEffectDebugView *)self updateFilledPolygonLayer:v170 path:v171 fillColor:v173];

    v174 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    uint64_t v175 = [v4 expandedHitAreaPath];
    v176 = [(PVEffectDebugView *)self options];
    v177 = [v176 hitAreaShapeColor];
    [(PVEffectDebugView *)self updateFilledPolygonLayer:v174 path:v175 fillColor:v177];
  }
  else
  {
    [v160 setHidden:1];

    v170 = [(PVEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    [v170 setHidden:1];
  }

  v178 = [(PVEffectDebugView *)self options];
  int v179 = [v178 showCornerPoints];

  uint64_t v180 = v179 ^ 1u;
  v181 = [(PVEffectDebugView *)self cornerPointsLayer];
  [v181 setHidden:v180];

  if ((v180 & 1) == 0)
  {
    v182 = [(PVEffectDebugView *)self cornerPointsLayer];
    ensureNSublayers(v182, 4uLL);

    v183 = [(PVEffectDebugView *)self cornerPointsLayer];
    v184 = [v183 sublayers];

    [v4 cornerPoints];
    v185 = PVCGPointQuad_to_NSArray(&v272);
    v186 = [(PVEffectDebugView *)self options];
    v187 = [v186 cornerPointColors];
    [(PVEffectDebugView *)self updatePointsLayers:v184 points:v185 colors:v187 size:4.0];
  }
  v188 = [(PVEffectDebugView *)self options];
  int v189 = [v188 showOrigin];

  uint64_t v190 = v189 ^ 1u;
  v191 = [(PVEffectDebugView *)self originLayer];
  [v191 setHidden:v190];

  if ((v190 & 1) == 0)
  {
    v192 = [(PVEffectDebugView *)self originLayer];
    [v4 center];
    double v193 = v22;
    double v195 = v194;
    double v197 = v196;
    v198 = [(PVEffectDebugView *)self options];
    v199 = [v198 originColor];
    -[PVEffectDebugView updateFilledCircleLayer:center:radius:fillColor:](self, "updateFilledCircleLayer:center:radius:fillColor:", v192, v199, v195, v197, 6.0);

    v200 = [(PVEffectDebugView *)self originCrosshairLayer];
    v201 = [MEMORY[0x1E4F428B8] blackColor];
    -[PVEffectDebugView updateCrosshairLayer:center:color:size:thickness:](self, "updateCrosshairLayer:center:color:size:thickness:", v200, v201, v193, v263, 10.0 / v25, 10.0 / v25, 2.0 / v25, 2.0 / v25);
  }
  v202 = [(PVEffectDebugView *)self options];
  int v203 = [v202 showMidpoint];

  uint64_t v204 = v203 ^ 1u;
  v205 = [(PVEffectDebugView *)self midpointLayer];
  [v205 setHidden:v204];

  if ((v204 & 1) == 0)
  {
    v206 = [(PVEffectDebugView *)self midpointLayer];
    [v4 midpoint];
    double v208 = v207;
    double v210 = v209;
    v211 = [(PVEffectDebugView *)self options];
    v212 = [v211 midpointColor];
    -[PVEffectDebugView updateFilledCircleLayer:center:radius:fillColor:](self, "updateFilledCircleLayer:center:radius:fillColor:", v206, v212, v208, v210, 1.5);
  }
  v213 = [(PVEffectDebugView *)self options];
  if ([v213 showTextCornerPoints])
  {
    v214 = [v4 textFrames];
    uint64_t v215 = [v214 count];

    v216 = [(PVEffectDebugView *)self textCornerPointsContainerLayer];
    [v216 setHidden:v215 == 0];

    if (v215)
    {
      v217 = [(PVEffectDebugView *)self textCornerPointsContainerLayer];
      v218 = [v4 textFrames];
      ensureNSublayers(v217, 4 * [v218 count]);

      v219 = [(PVEffectDebugView *)self textCornerPointsContainerLayer];
      v220 = [v219 sublayers];

      v221 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v220, "count"));
      v222 = [v4 textFrames];
      v270[0] = MEMORY[0x1E4F143A8];
      v270[1] = *(void *)"";
      v270[2] = __43__PVEffectDebugView_updateWithEffectFrame___block_invoke_97;
      v270[3] = &unk_1E61688E8;
      id v271 = v221;
      id v223 = v221;
      [v222 enumerateObjectsUsingBlock:v270];

      v224 = [(PVEffectDebugView *)self options];
      v225 = [v224 textCornerPointColors];
      [(PVEffectDebugView *)self updatePointsLayers:v220 points:v223 colors:v225 size:4.0];

      goto LABEL_61;
    }
  }
  else
  {

    v220 = [(PVEffectDebugView *)self textCornerPointsContainerLayer];
    [v220 setHidden:1];
LABEL_61:
  }
  v226 = [(PVEffectDebugView *)self options];
  int v227 = [v226 showHitAreaPoints];

  uint64_t v228 = v227 ^ 1u;
  v229 = [(PVEffectDebugView *)self hitAreaPointsLayer];
  [v229 setHidden:v228];

  if ((v228 & 1) == 0)
  {
    v230 = [(PVEffectDebugView *)self hitAreaPointsLayer];
    v231 = [v4 hitAreaPoints];
    ensureNSublayers(v230, [v231 count]);

    v232 = [(PVEffectDebugView *)self hitAreaPointsLayer];
    v233 = [v232 sublayers];

    v234 = [v4 hitAreaPoints];
    v235 = [(PVEffectDebugView *)self options];
    v236 = [v235 hitAreaPointColors];
    [(PVEffectDebugView *)self updatePointsLayers:v233 points:v234 colors:v236 size:4.0];
  }
  v237 = [(PVEffectDebugView *)self options];
  int v238 = [v237 showUserRects];

  uint64_t v239 = v238 ^ 1u;
  v240 = [(PVEffectDebugView *)self userRectsLayer];
  [v240 setHidden:v239];

  v241 = [(PVEffectDebugView *)self userRectsTransformedLayer];
  [v241 setHidden:v239];

  if ((v239 & 1) == 0)
  {
    v242 = [(PVEffectDebugView *)self userRectsLayer];
    v243 = [(PVEffectDebugView *)self userRectsTransformedLayer];
    v244 = [(PVEffectDebugView *)self userRectsToDraw];
    [(PVEffectDebugView *)self updateUserRects:v242 transformedLayer:v243 effectScale:v244 rects:v25];
  }
  v245 = [(PVEffectDebugView *)self options];
  int v246 = [v245 showUserPoints];

  uint64_t v247 = v246 ^ 1u;
  v248 = [(PVEffectDebugView *)self userPointsLayer];
  [v248 setHidden:v247];

  v249 = [(PVEffectDebugView *)self userPointsTransformedLayer];
  [v249 setHidden:v247];

  if ((v247 & 1) == 0)
  {
    v250 = [(PVEffectDebugView *)self userPointsLayer];
    v251 = [(PVEffectDebugView *)self userPointsTransformedLayer];
    v252 = [(PVEffectDebugView *)self userPointsToDraw];
    [(PVEffectDebugView *)self updateUserPoints:v250 transformedLayer:v251 effectScale:v252 points:v25];
  }
  [MEMORY[0x1E4F39CF8] commit];
LABEL_69:
}

void __43__PVEffectDebugView_updateWithEffectFrame___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = [*(id *)(a1 + 32) textBoundingBoxesContainerLayer];
  id v7 = [v6 sublayers];
  double v8 = [v7 objectAtIndexedSubscript:a3];

  ensureNSublayers(v8, 1uLL);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v55[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v55[5] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v55[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v55[7] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v55[0] = *MEMORY[0x1E4F39B10];
  v55[1] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v55[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v55[3] = v12;
  [v8 setTransform:v55];
  objc_msgSend(v8, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v8, "setPosition:", *MEMORY[0x1E4F1DAD8], v14);
  objc_msgSend(v8, "setAnchorPoint:", v13, v14);
  if (v5)
  {
    [v5 transform];
    long long v16 = v47;
    long long v15 = v48;
    long long v18 = v49;
    long long v17 = v50;
    long long v20 = v51;
    long long v19 = v52;
    long long v21 = v53;
    long long v22 = v54;
  }
  else
  {
    long long v21 = 0uLL;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v22 = 0uLL;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v20 = 0uLL;
    long long v19 = 0uLL;
    long long v18 = 0uLL;
    long long v17 = 0uLL;
    long long v16 = 0uLL;
    long long v15 = 0uLL;
    long long v47 = 0u;
    long long v48 = 0u;
  }
  v46[0] = v16;
  v46[1] = v15;
  v46[2] = v18;
  v46[3] = v17;
  v46[4] = v20;
  v46[5] = v19;
  v46[6] = v21;
  v46[7] = v22;
  [v8 setTransform:v46];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  if (v5) {
    objc_msgSend(v5, "transformInfo", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }
  double v23 = fmax(fabs(0.0), 0.001);
  id v24 = objc_msgSend(v8, "sublayers", v42, v43, v44, v45);
  double v25 = [v24 firstObject];

  uint64_t v26 = [*(id *)(a1 + 32) options];
  uint64_t v27 = [v26 textBoundingBoxColors];
  uint64_t v28 = [*(id *)(a1 + 40) textFrames];
  uint64_t v29 = objc_msgSend(v27, "objectAtIndexedSubscript:", a3 % objc_msgSend(v28, "count"));

  id v30 = *(void **)(a1 + 32);
  [v5 objectBounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [NSNumber numberWithDouble:6.0 / v23];
  v56[0] = v39;
  v40 = [NSNumber numberWithDouble:3.0 / v23];
  v56[1] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  objc_msgSend(v30, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v25, v29, v41, v32, v34, v36, v38, 2.0 / v23, 0.0);
}

void __43__PVEffectDebugView_updateWithEffectFrame___block_invoke_97(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    [a2 cornerPoints];
  }
  else {
    memset(&v4, 0, sizeof(v4));
  }
  id v3 = PVCGPointQuad_to_NSArray(&v4);
  [v2 addObjectsFromArray:v3];
}

- (id)userRectsToDraw
{
  v2 = [(PVEffectDebugView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 pvEffectDebugViewUserRectsToDraw];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)userPointsToDraw
{
  v2 = [(PVEffectDebugView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 pvEffectDebugViewUserPointsToDraw];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)documentBoundsLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)MEMORY[0x1E4F39C88];
  id v9 = a4;
  long long v10 = [v8 layer];
  objc_msgSend(v10, "setFrame:", x, y, width, height);
  [v10 bounds];
  long long v11 = pv_CGRect_to_NSArray(v37);
  long long v12 = [MEMORY[0x1E4F428B8] clearColor];
  double v13 = [v9 documentBoundingBoxColor];
  setShapeLayerPathFromPointsWithStyle(v10, v11, v12, v13, &unk_1F11EC598, 0.0, 2.0);

  ensureNSublayers(v10, 2uLL);
  [v10 bounds];
  CGFloat v14 = v38.origin.x;
  CGFloat v15 = v38.origin.y;
  CGFloat v16 = v38.size.width;
  CGFloat v17 = v38.size.height;
  double MidX = CGRectGetMidX(v38);
  v39.origin.double x = v14;
  v39.origin.double y = v15;
  v39.size.double width = v16;
  v39.size.double height = v17;
  double MidY = CGRectGetMidY(v39);
  v40.origin.double x = MidX + -6.0;
  v40.origin.double y = MidY + -6.0;
  v40.size.double width = 12.0;
  v40.size.double height = 12.0;
  long long v20 = CGPathCreateWithEllipseInRect(v40, 0);
  long long v21 = crosshairPointsWithSizeAndCenterPoint(10.0, 10.0, 2.0, 2.0, MidX, MidY);
  long long v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = *(void *)"";
  v34[2] = __makeCircleCrosshairWithSizeAndCenterPoint_block_invoke;
  v34[3] = &unk_1E6168938;
  id v35 = v22;
  id v23 = v22;
  [v21 enumerateObjectsWithOptions:2 usingBlock:v34];
  closed_CGPath_with_points = pv_create_closed_CGPath_with_points(v23);
  MutableCopdouble y = CGPathCreateMutableCopy(v20);
  CGPathAddPath(MutableCopy, 0, closed_CGPath_with_points);
  CGPathRelease(v20);
  CGPathRelease(closed_CGPath_with_points);

  uint64_t v26 = [v10 sublayers];
  uint64_t v27 = [v26 objectAtIndexedSubscript:0];
  uint64_t v28 = [v9 originColor];

  uint64_t v29 = [MEMORY[0x1E4F428B8] clearColor];
  id v30 = v28;
  id v31 = v27;
  objc_msgSend(v31, "setFillColor:", objc_msgSend(v30, "CGColor"));
  id v32 = v29;
  objc_msgSend(v31, "setStrokeColor:", objc_msgSend(v32, "CGColor"));
  [v31 setLineDashPhase:0.0];
  [v31 setLineDashPattern:0];
  [v31 setLineWidth:0.0];
  [v31 setPath:MutableCopy];

  CGPathRelease(MutableCopy);

  return v10;
}

+ (id)outputROILayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)MEMORY[0x1E4F39C88];
  id v9 = a4;
  long long v10 = [v8 layer];
  objc_msgSend(v10, "setFrame:", x, y, width, height);
  [v10 bounds];
  long long v11 = pv_CGRect_to_NSArray(v16);
  long long v12 = [MEMORY[0x1E4F428B8] clearColor];
  double v13 = [v9 outputROIColor];

  setShapeLayerPathFromPointsWithStyle(v10, v11, v12, v13, &unk_1F11EC5B0, 10.0, 2.0);

  return v10;
}

+ (id)objectBoundsLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F39C88] layer];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  [v9 bounds];
  long long v10 = pv_CGRect_to_NSArray(v37);
  long long v11 = [MEMORY[0x1E4F428B8] clearColor];
  long long v12 = [v8 objectAlignedBoundingBoxColor];
  setShapeLayerPathFromPointsWithStyle(v9, v10, v11, v12, &unk_1F11EC5C8, 0.0, 2.0);

  ensureNSublayers(v9, [v10 count]);
  double v13 = [v9 sublayers];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = *(void *)"";
  id v32 = __56__PVEffectDebugView_objectBoundsLayerWithFrame_options___block_invoke;
  double v33 = &unk_1E6168910;
  id v34 = v10;
  id v35 = v8;
  id v14 = v8;
  id v15 = v10;
  [v13 enumerateObjectsUsingBlock:&v30];

  ensureNSublayers(v9, objc_msgSend(v15, "count", v30, v31, v32, v33) + 1);
  [v9 bounds];
  CGFloat v16 = v38.origin.x;
  CGFloat v17 = v38.origin.y;
  CGFloat v18 = v38.size.width;
  CGFloat v19 = v38.size.height;
  double MidX = CGRectGetMidX(v38);
  v39.origin.double x = v16;
  v39.origin.double y = v17;
  v39.size.double width = v18;
  v39.size.double height = v19;
  v40.origin.double y = CGRectGetMidY(v39) + -1.5;
  v40.size.double width = 3.0;
  v40.size.double height = 3.0;
  v40.origin.double x = MidX + -1.5;
  long long v21 = CGPathCreateWithEllipseInRect(v40, 0);
  long long v22 = [v9 sublayers];
  id v23 = [v22 lastObject];
  id v24 = [v14 midpointColor];
  double v25 = [MEMORY[0x1E4F428B8] clearColor];

  id v26 = v24;
  id v27 = v23;
  objc_msgSend(v27, "setFillColor:", objc_msgSend(v26, "CGColor"));
  id v28 = v25;
  objc_msgSend(v27, "setStrokeColor:", objc_msgSend(v28, "CGColor"));
  [v27 setLineDashPhase:0.0];
  [v27 setLineDashPattern:0];
  [v27 setLineWidth:0.0];
  [v27 setPath:v21];

  CGPathRelease(v21);

  return v9;
}

void __56__PVEffectDebugView_objectBoundsLayerWithFrame_options___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  char v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 CGPointValue];
  double v8 = v7;
  double v10 = v9;

  v20.origin.double x = v8 + -2.0;
  v20.origin.double y = v10 + -2.0;
  v20.size.double width = 4.0;
  v20.size.double height = 4.0;
  long long v11 = CGPathCreateWithEllipseInRect(v20, 0);
  long long v12 = [*(id *)(a1 + 40) cornerPointColors];
  double v13 = [*(id *)(a1 + 40) cornerPointColors];
  id v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", a3 % objc_msgSend(v13, "count"));
  id v15 = [MEMORY[0x1E4F428B8] clearColor];
  id v16 = v14;
  id v18 = v5;
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v16, "CGColor"));
  id v17 = v15;
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  [v18 setLineDashPhase:0.0];
  [v18 setLineDashPattern:0];
  [v18 setLineWidth:0.0];
  [v18 setPath:v11];

  CGPathRelease(v11);
}

+ (id)textBoundsLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F39C88] layer];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  [v9 bounds];
  double v10 = pv_CGRect_to_NSArray(v22);
  long long v11 = [MEMORY[0x1E4F428B8] clearColor];
  long long v12 = [v8 textBoundingBoxColors];
  double v13 = [v12 firstObject];
  setShapeLayerPathFromPointsWithStyle(v9, v10, v11, v13, &unk_1F11EC5E0, 0.0, 2.0);

  ensureNSublayers(v9, [v10 count]);
  id v14 = [v9 sublayers];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = *(void *)"";
  v18[2] = __54__PVEffectDebugView_textBoundsLayerWithFrame_options___block_invoke;
  v18[3] = &unk_1E6168910;
  id v19 = v10;
  id v20 = v8;
  id v15 = v8;
  id v16 = v10;
  [v14 enumerateObjectsUsingBlock:v18];

  return v9;
}

void __54__PVEffectDebugView_textBoundsLayerWithFrame_options___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  char v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 CGPointValue];
  double v8 = v7;
  double v10 = v9;

  v20.origin.double x = v8 + -2.0;
  v20.origin.double y = v10 + -2.0;
  v20.size.double width = 4.0;
  v20.size.double height = 4.0;
  long long v11 = CGPathCreateWithEllipseInRect(v20, 0);
  long long v12 = [*(id *)(a1 + 40) textCornerPointColors];
  double v13 = [*(id *)(a1 + 40) textCornerPointColors];
  id v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", a3 % objc_msgSend(v13, "count"));
  id v15 = [MEMORY[0x1E4F428B8] clearColor];
  id v16 = v14;
  id v18 = v5;
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v16, "CGColor"));
  id v17 = v15;
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  [v18 setLineDashPhase:0.0];
  [v18 setLineDashPattern:0];
  [v18 setLineWidth:0.0];
  [v18 setPath:v11];

  CGPathRelease(v11);
}

+ (id)hitAreaShapeLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F39C88] layer];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  double v10 = [v8 hitAreaShapeColor];
  [v9 bounds];
  double v12 = (v11 + -8.0) * 0.5;
  [v9 bounds];
  CGFloat v13 = v45.origin.x;
  CGFloat v14 = v45.origin.y;
  CGFloat v15 = v45.size.width;
  CGFloat v16 = v45.size.height;
  double MidX = CGRectGetMidX(v45);
  v46.origin.double x = v13;
  v46.origin.double y = v14;
  v46.size.double width = v15;
  v46.size.double height = v16;
  double MidY = CGRectGetMidY(v46);
  id v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  double v20 = 0.0;
  int v21 = 5;
  do
  {
    __double2 v22 = __sincos_stret(v20 * 1.25663706 + 3.14159265);
    __double2 v23 = __sincos_stret(v20 * 1.25663706 + 3.14159265 + 0.628318531);
    id v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", MidX + v12 * v22.__sinval, MidY + v12 * v22.__cosval);
    [v19 addObject:v24];

    double v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", MidX + v12 * 0.5 * v23.__sinval, MidY + v12 * 0.5 * v23.__cosval);
    [v19 addObject:v25];

    double v20 = v20 + 1.0;
    --v21;
  }
  while (v21);
  id v26 = [MEMORY[0x1E4F428B8] clearColor];
  setShapeLayerPathFromPointsWithStyle(v9, v19, v26, v10, &unk_1F11EC5F8, 0.0, 2.0);

  ensureNSublayers(v9, 0xAuLL);
  id v27 = [v9 sublayers];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = *(void *)"";
  v41[2] = __56__PVEffectDebugView_hitAreaShapeLayerWithFrame_options___block_invoke;
  v41[3] = &unk_1E6168910;
  id v42 = v19;
  id v43 = v8;
  id v28 = v8;
  id v29 = v19;
  [v27 enumerateObjectsUsingBlock:v41];

  uint64_t v30 = [MEMORY[0x1E4F39C88] layer];

  LODWORD(v31) = 1050253722;
  [v30 setOpacity:v31];
  [v30 setZPosition:-1.0];
  [v9 addSublayer:v30];
  ensureNSublayers(v30, 2uLL);
  id v32 = (const CGPath *)[v9 path];
  double v33 = [v30 sublayers];
  id v34 = [v33 objectAtIndexedSubscript:0];

  id v35 = v10;
  objc_msgSend(v34, "setFillColor:", objc_msgSend(v35, "CGColor"));
  [v34 setPath:v32];

  double v36 = [v30 sublayers];
  CGRect v37 = [v36 objectAtIndexedSubscript:1];

  id v38 = v35;
  objc_msgSend(v37, "setFillColor:", objc_msgSend(v38, "CGColor"));
  expanded_closed_CGPath_with_CGPath = pv_create_expanded_closed_CGPath_with_CGPath(v32, 8.0);
  [v37 setPath:expanded_closed_CGPath_with_CGPath];
  CGPathRelease(expanded_closed_CGPath_with_CGPath);

  return v9;
}

void __56__PVEffectDebugView_hitAreaShapeLayerWithFrame_options___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  char v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 CGPointValue];
  double v8 = v7;
  double v10 = v9;

  v20.origin.double x = v8 + -1.5;
  v20.origin.double y = v10 + -1.5;
  v20.size.double width = 3.0;
  v20.size.double height = 3.0;
  double v11 = CGPathCreateWithEllipseInRect(v20, 0);
  double v12 = [*(id *)(a1 + 40) hitAreaPointColors];
  CGFloat v13 = [*(id *)(a1 + 40) hitAreaPointColors];
  CGFloat v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", a3 % objc_msgSend(v13, "count"));
  CGFloat v15 = [MEMORY[0x1E4F428B8] clearColor];
  id v16 = v14;
  id v18 = v5;
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v16, "CGColor"));
  id v17 = v15;
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  [v18 setLineDashPhase:0.0];
  [v18 setLineDashPattern:0];
  [v18 setLineWidth:0.0];
  [v18 setPath:v11];

  CGPathRelease(v11);
}

- (PVEffectDebugViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (CATransformLayer)rootTransformLayer
{
  return self->_rootTransformLayer;
}

- (void)setRootTransformLayer:(id)a3
{
}

- (CAShapeLayer)documentBoundingBoxLayer
{
  return self->_documentBoundingBoxLayer;
}

- (void)setDocumentBoundingBoxLayer:(id)a3
{
}

- (CAShapeLayer)outputROILayer
{
  return self->_outputROILayer;
}

- (void)setOutputROILayer:(id)a3
{
}

- (CAShapeLayer)objectAlignedBoundingBoxLayer
{
  return self->_objectAlignedBoundingBoxLayer;
}

- (void)setObjectAlignedBoundingBoxLayer:(id)a3
{
}

- (CALayer)textBoundingBoxesContainerLayer
{
  return self->_textBoundingBoxesContainerLayer;
}

- (void)setTextBoundingBoxesContainerLayer:(id)a3
{
}

- (CAShapeLayer)hitAreaShapeLayer
{
  return self->_hitAreaShapeLayer;
}

- (void)setHitAreaShapeLayer:(id)a3
{
}

- (CAShapeLayer)hitAreaMinimumSizeBoundingBoxLayer
{
  return self->_hitAreaMinimumSizeBoundingBoxLayer;
}

- (void)setHitAreaMinimumSizeBoundingBoxLayer:(id)a3
{
}

- (CAShapeLayer)midpointLayer
{
  return self->_midpointLayer;
}

- (void)setMidpointLayer:(id)a3
{
}

- (CAShapeLayer)originLayer
{
  return self->_originLayer;
}

- (void)setOriginLayer:(id)a3
{
}

- (CAShapeLayer)originCrosshairLayer
{
  return self->_originCrosshairLayer;
}

- (void)setOriginCrosshairLayer:(id)a3
{
}

- (CAShapeLayer)cornerPointsLayer
{
  return self->_cornerPointsLayer;
}

- (void)setCornerPointsLayer:(id)a3
{
}

- (CALayer)textCornerPointsContainerLayer
{
  return self->_textCornerPointsContainerLayer;
}

- (void)setTextCornerPointsContainerLayer:(id)a3
{
}

- (CAShapeLayer)hitAreaPointsLayer
{
  return self->_hitAreaPointsLayer;
}

- (void)setHitAreaPointsLayer:(id)a3
{
}

- (CAShapeLayer)userRectsLayer
{
  return self->_userRectsLayer;
}

- (void)setUserRectsLayer:(id)a3
{
}

- (CAShapeLayer)userRectsTransformedLayer
{
  return self->_userRectsTransformedLayer;
}

- (void)setUserRectsTransformedLayer:(id)a3
{
}

- (CAShapeLayer)userPointsLayer
{
  return self->_userPointsLayer;
}

- (void)setUserPointsLayer:(id)a3
{
}

- (CAShapeLayer)userPointsTransformedLayer
{
  return self->_userPointsTransformedLayer;
}

- (void)setUserPointsTransformedLayer:(id)a3
{
}

- (PVEffectDebugOptionsView)optionsView
{
  return self->_optionsView;
}

- (void)setOptionsView:(id)a3
{
}

- (PVEffectDebugViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PVEffectDebugViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_optionsView, 0);
  objc_storeStrong((id *)&self->_userPointsTransformedLayer, 0);
  objc_storeStrong((id *)&self->_userPointsLayer, 0);
  objc_storeStrong((id *)&self->_userRectsTransformedLayer, 0);
  objc_storeStrong((id *)&self->_userRectsLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaPointsLayer, 0);
  objc_storeStrong((id *)&self->_textCornerPointsContainerLayer, 0);
  objc_storeStrong((id *)&self->_cornerPointsLayer, 0);
  objc_storeStrong((id *)&self->_originCrosshairLayer, 0);
  objc_storeStrong((id *)&self->_originLayer, 0);
  objc_storeStrong((id *)&self->_midpointLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaMinimumSizeBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaShapeLayer, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxesContainerLayer, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_outputROILayer, 0);
  objc_storeStrong((id *)&self->_documentBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_rootTransformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end