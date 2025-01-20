@interface TSWPTextMagnifierCaret
+ (id)sharedCaretMagnifier;
- (BOOL)shouldHideCanvasLayer;
- (BOOL)terminalPointPlacedCarefully;
- (CGPoint)animationPoint;
- (CGPoint)magnificationPoint;
- (CGPoint)offset;
- (CGPoint)terminalPoint;
- (NSString)maskImageName;
- (NSString)overlayImageName;
- (NSString)underlayImageName;
- (TSWPRep)target;
- (TSWPTextMagnifierCaret)initWithDefaultFrame;
- (double)yOffset;
- (void)autoscrollWillNotStart;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)dealloc;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)postAutoscrollPoint:(CGPoint)a3;
- (void)remove;
- (void)setAnimationPoint:(CGPoint)a3;
- (void)setAutoscrollDirections:(int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setNeedsDisplay;
- (void)setOffset:(CGPoint)a3;
- (void)setTarget:(id)a3;
- (void)setYOffset:(double)a3;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrameAndOffset;
- (void)zoomDownAnimation;
- (void)zoomUpAnimation;
@end

@implementation TSWPTextMagnifierCaret

+ (id)sharedCaretMagnifier
{
  id result = (id)+[TSWPTextMagnifierCaret sharedCaretMagnifier]::sharedInstance;
  if (!+[TSWPTextMagnifierCaret sharedCaretMagnifier]::sharedInstance)
  {
    id result = [[TSWPTextMagnifierCaret alloc] initWithDefaultFrame];
    +[TSWPTextMagnifierCaret sharedCaretMagnifier]::sharedInstance = (uint64_t)result;
  }
  return result;
}

- (void)setTarget:(id)a3
{
  target = self->_target;
  if (target != a3)
  {
    [(TSWPRep *)target enableCaretAnimation];

    self->_target = (TSWPRep *)a3;
    id v6 = a3;
    v7 = self->_target;
    [(TSWPRep *)v7 disableCaretAnimation];
  }
}

- (TSWPTextMagnifierCaret)initWithDefaultFrame
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPTextMagnifierCaret;
  v2 = -[TSWPTextMagnifierCaret initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 106.0, 106.0);
  if (v2)
  {
    -[TSWPTextMagnifierCaret setBackgroundColor:](v2, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    v2->_weightedPoint = objc_alloc_init(TSWPTextMagnifierTimeWeightedPoint);
    v3 = -[TSWPTextMagnifierRenderer initWithFrame:]([TSWPTextMagnifierRenderer alloc], "initWithFrame:", 0.0, 0.0, 106.0, 106.0);
    v2->_magnifierRenderer = v3;
    [(TSWPTextMagnifierRenderer *)v3 setDelegate:v2];
    [(TSWPTextMagnifierCaret *)v2 addSubview:v2->_magnifierRenderer];
  }
  return v2;
}

- (void)dealloc
{
  [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer setDelegate:0];
  [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer tearDown];

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierCaret;
  [(TSWPTextMagnifierCaret *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPTextMagnifierCaret;
  -[TSWPTextMagnifierCaret setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  [(TSWPTextMagnifierCaret *)self bounds];
  -[TSWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierCaret;
  [(TSWPTextMagnifierCaret *)&v3 setNeedsDisplay];
  [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer setNeedsDisplay];
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[TSWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.double x = x;
    self->_magnificationPoint.double y = y;
    [(TSWPTextMagnifierCaret *)self updateFrameAndOffset];
    magnifierRenderer = self->_magnifierRenderer;
    [(TSWPTextMagnifierRenderer *)magnifierRenderer canvasNeedsDisplay];
  }
}

- (CGPoint)terminalPoint
{
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint weightedPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3 = [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint historyCovers:0.5];
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:0.5];
  return v4 < 10.0 && v3;
}

- (CGPoint)animationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
}

- (void)setAutoscrollDirections:(int)a3
{
}

- (void)autoscrollWillNotStart
{
}

- (void)zoomUpAnimation
{
  memset(&v8, 0, sizeof(v8));
  [(TSWPTextMagnifierCaret *)self bounds];
  CGFloat MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  CGAffineTransform v8 = v7;
  CGAffineTransform v5 = v7;
  [(TSWPTextMagnifierCaret *)self setTransform:&v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__TSWPTextMagnifierCaret_zoomUpAnimation__block_invoke;
  v4[3] = &unk_2646AF7B8;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.075];
}

uint64_t __41__TSWPTextMagnifierCaret_zoomUpAnimation__block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v1;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [*(id *)(a1 + 32) setTransform:v3];
}

- (void)zoomDownAnimation
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke;
  _OWORD v3[3] = &unk_2646AF7B8;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke_2;
  v2[3] = &unk_2646B09F8;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:v2 completion:0.15];
}

uint64_t __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "type") != 3
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "type") != 5)
  {
    int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "isInsertionPoint");
    CGAffineTransform v7 = (void *)[*(id *)(a1 + 32) target];
    if (v6) {
      [v7 caretRect];
    }
    else {
      objc_msgSend(v7, "caretRectForCharIndex:caretAffinity:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "range"), 0);
    }
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "interactiveCanvasController"), "layerHost"), "canvasView");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v12, v13, v14, v15);
    objc_msgSend(v16, "convertRect:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), v17, v18, v19, v20);
    double v2 = v21;
    double v3 = v22;
    double v4 = v23;
    double v5 = v24;
  }
  v34.origin.double x = v2;
  v34.origin.double y = v3;
  v34.size.width = v4;
  v34.size.height = v5;
  if (CGRectIsEmpty(v34))
  {
    memset(&v32, 0, sizeof(v32));
    [*(id *)(a1 + 32) bounds];
    CGFloat MaxY = CGRectGetMaxY(v35);
    CGAffineTransformMakeTranslation(&v32, 0.0, MaxY * 0.5);
    CGAffineTransform v30 = v32;
    CGAffineTransformScale(&v31, &v30, 0.25, 0.25);
    CGAffineTransform v32 = v31;
    v26 = *(void **)(a1 + 32);
    CGAffineTransform v29 = v31;
    return [v26 setTransform:&v29];
  }
  else
  {
    v28 = *(void **)(a1 + 32);
    return objc_msgSend(v28, "setFrame:", v2, v3, v4, v5);
  }
}

uint64_t __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) remove];
  double v2 = *(void **)(a1 + 32);

  return [v2 setTarget:0];
}

- (void)remove
{
  [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer tearDown];
  [(TSWPTextMagnifierCaret *)self removeFromSuperview];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(TSWPTextMagnifierCaret *)self setTransform:v4];
  -[TSWPTextMagnifierCaret setFrame:](self, "setFrame:", 0.0, 0.0, 106.0, 106.0);
}

- (void)updateFrameAndOffset
{
  long long v3 = (void *)[(TSWPTextMagnifierCaret *)self superview];
  [(TSWPTextMagnifierCaret *)self magnificationPoint];
  objc_msgSend(v3, "convertPoint:fromView:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](-[TSWPTextMagnifierCaret target](self, "target"), "interactiveCanvasController"), "layerHost"), "canvasView"), v4, v5);
  double v7 = v6;
  double v9 = v8;
  [(TSWPTextMagnifierCaret *)self bounds];
  double v11 = v9 + v10 * 0.5;
  double v12 = v11 + -60.0;
  double v13 = v11 + -75.0;
  if (v12 >= 75.0) {
    double v14 = 60.0;
  }
  else {
    double v14 = v13;
  }
  [(TSWPTextMagnifierCaret *)self offset];
  double v16 = v7 + v15;
  [(TSWPTextMagnifierCaret *)self offset];
  self->_yOffset = v14;
  -[TSWPTextMagnifierCaret setCenter:](self, "setCenter:", round(v16), round(v9 + v17 - v14));
  [(TSWPTextMagnifierCaret *)self frame];
  CGRect v20 = CGRectIntegral(v19);

  -[TSWPTextMagnifierCaret setFrame:](self, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "stopMagnifying:", 0);
  objc_msgSend(+[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier](TSWPTextMagnifierVerticalRanged, "sharedRangedMagnifier"), "stopMagnifying:", 0);
  [(TSWPTextMagnifierCaret *)self setTarget:a3];
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint clearHistory];
  [(TSWPTextMagnifierCaret *)self setAutoscrollDirections:0];
  [(TSWPTextMagnifierCaret *)self setNeedsLayout];
  [(TSWPTextMagnifierCaret *)self setNeedsDisplay];
  if (![(TSWPTextMagnifierCaret *)self window]) {
    objc_msgSend(+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:", objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "canvasView")), "addSubview:", self);
  }
  -[TSWPTextMagnifierCaret setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  -[TSWPTextMagnifierCaret setOffset:](self, "setOffset:", x, y);
  if (v6)
  {
    [(TSWPTextMagnifierCaret *)self zoomUpAnimation];
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    [(TSWPTextMagnifierCaret *)self zoomDownAnimation];
  }
  else
  {
    [(TSWPTextMagnifierCaret *)self remove];
    [(TSWPTextMagnifierCaret *)self setTarget:0];
  }
  self->_magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
}

- (NSString)underlayImageName
{
  return 0;
}

- (NSString)overlayImageName
{
  return (NSString *)@"kb-loupe-hi";
}

- (NSString)maskImageName
{
  return (NSString *)@"kb-loupe-mask";
}

- (BOOL)shouldHideCanvasLayer
{
  [(TSDRep *)[(TSWPTextMagnifierCaret *)self target] interactiveCanvasController];
  objc_opt_class();
  uint64_t v2 = TSUDynamicCast();
  if (!v2) {
    return 1;
  }
  long long v3 = (void *)v2;
  objc_opt_class();
  [v3 layerHost];
  double v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return 1;
  }

  return [v4 shouldHideCanvasLayerInMagnifier];
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  BOOL v6 = [(TSDRep *)[(TSWPTextMagnifierCaret *)self target] interactiveCanvasController];
  double v7 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)v6 layerHost] canvasView];
  [(TSWPTextMagnifierCaret *)self frame];
  objc_msgSend(v7, "convertRect:fromView:", -[TSWPTextMagnifierCaret superview](self, "superview"), v8, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  TSUScreenScale();
  CGFloat v21 = v20;
  v35.width = v17;
  v35.height = v19;
  UIGraphicsBeginImageContextWithOptions(v35, 1, v21);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_opt_class();
  uint64_t v23 = TSUDynamicCast();
  if (v23)
  {
    double v24 = (void *)v23;
    objc_opt_class();
    [v24 layerHost];
    v25 = (void *)[(id)TSUDynamicCast() backgroundColorForMagnifier];
    if (v25)
    {
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v25 CGColor]);
      v36.origin.double x = 0.0;
      v36.origin.double y = 0.0;
      v36.size.width = v17;
      v36.size.height = v19;
      CGContextFillRect(CurrentContext, v36);
    }
  }
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextScaleCTM(CurrentContext, 1.2, 1.2);
  [(TSWPTextMagnifierCaret *)self yOffset];
  CGContextTranslateCTM(CurrentContext, -v13, -v15 - v26);
  CGContextTranslateCTM(CurrentContext, v17 * -0.100000001, v19 * -0.899999999);
  v27 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)v6 layerHost] canvasLayer];
  [v27 shadowOpacity];
  int v29 = v28;
  [v27 setShadowOpacity:0.0];
  [v27 renderInContext:CurrentContext];
  LODWORD(v30) = v29;
  [v27 setShadowOpacity:v30];
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGContextSaveGState(a4);
  CGAffineTransform v32 = (CGImage *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierCaret maskImageName](self, "maskImageName"), TSWPBundle(), 0), "CGImage");
  v37.origin.double x = 0.0;
  v37.origin.double y = 0.0;
  v37.size.width = v17;
  v37.size.height = v19;
  CGContextClipToMask(a4, v37, v32);
  v33 = [(UIImage *)ImageFromCurrentImageContext CGImage];
  v38.origin.double x = 0.0;
  v38.origin.double y = 0.0;
  v38.size.width = v17;
  v38.size.height = v19;
  CGContextDrawImage(a4, v38, v33);

  CGContextRestoreGState(a4);
}

- (TSWPRep)target
{
  return self->_target;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

@end