@interface TSWPTextMagnifierVerticalRanged
+ (id)sharedRangedMagnifier;
- (BOOL)shouldHideCanvasLayer;
- (TSWPTextMagnifierVerticalRanged)initWithDefaultFrame;
- (double)currentOffset;
- (id)maskImageName;
- (id)overlayImageName;
- (id)underlayImageName;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)dealloc;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)remove;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrame;
- (void)zoomLeftAnimation;
- (void)zoomRightAnimation;
@end

@implementation TSWPTextMagnifierVerticalRanged

+ (id)sharedRangedMagnifier
{
  id result = (id)+[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier]::SharedInstance;
  if (!+[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier]::SharedInstance)
  {
    id result = [[TSWPTextMagnifierVerticalRanged alloc] initWithDefaultFrame];
    +[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier]::SharedInstance = (uint64_t)result;
  }
  return result;
}

- (TSWPTextMagnifierVerticalRanged)initWithDefaultFrame
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierVerticalRanged;
  return -[TSWPTextMagnifierRanged initWithFrame:](&v3, sel_initWithFrame_, 0.0, 0.0, 65.0, 150.0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPTextMagnifierVerticalRanged;
  [(TSWPTextMagnifierRanged *)&v2 dealloc];
}

- (void)zoomLeftAnimation
{
  memset(&v8, 0, sizeof(v8));
  [(TSWPTextMagnifierVerticalRanged *)self bounds];
  CGFloat MaxX = CGRectGetMaxX(v9);
  CGAffineTransformMakeTranslation(&v8, MaxX * 0.5, 0.0);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  CGAffineTransform v8 = v7;
  CGAffineTransform v5 = v7;
  [(TSWPTextMagnifierVerticalRanged *)self setTransform:&v5];
  [(TSWPTextMagnifierVerticalRanged *)self setAlpha:0.0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__TSWPTextMagnifierVerticalRanged_zoomLeftAnimation__block_invoke;
  v4[3] = &unk_2646AF7B8;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.1];
}

uint64_t __52__TSWPTextMagnifierVerticalRanged_zoomLeftAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [*(id *)(a1 + 32) setTransform:v4];
}

- (void)zoomRightAnimation
{
  [(TSWPTextMagnifierRanged *)self animationPoint];
  self->super._magnificationPoint.x = v3 + -8.0;
  self->super._magnificationPoint.y = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke;
  v6[3] = &unk_2646AF7B8;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke_2;
  v5[3] = &unk_2646B09F8;
  v5[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v6 animations:v5 completion:0.2];
}

uint64_t __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFrame];
  memset(&v8, 0, sizeof(v8));
  [*(id *)(a1 + 32) bounds];
  CGFloat MaxX = CGRectGetMaxX(v9);
  CGAffineTransformMakeTranslation(&v8, MaxX * 0.5, 0.0);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  CGAffineTransform v8 = v7;
  double v3 = *(void **)(a1 + 32);
  CGAffineTransform v5 = v7;
  [v3 setTransform:&v5];
  return [*(id *)(a1 + 32) setAlpha:0.25];
}

uint64_t __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) remove];
  long long v2 = *(void **)(a1 + 32);

  return [v2 setTarget:0];
}

- (double)currentOffset
{
  double result = 19.0;
  if (!self->super._inPlace)
  {
    [(TSWPTextMagnifierRanged *)self offset];
    return v3 + 41.0 + 7.0;
  }
  return result;
}

- (void)updateFrame
{
  double v3 = (void *)[(TSWPTextMagnifierVerticalRanged *)self superview];
  [(TSWPTextMagnifierRanged *)self magnificationPoint];
  objc_msgSend(v3, "convertPoint:fromView:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](-[TSWPTextMagnifierRanged target](self, "target"), "interactiveCanvasController"), "layerHost"), "canvasView"), v4, v5);
  double v7 = v6;
  double v9 = v8;
  [(TSWPTextMagnifierVerticalRanged *)self bounds];
  double v11 = v10 * 0.5;
  self->super._inPlace = v7 + v10 * 0.5 + -41.0 < 45.0;
  [(TSWPTextMagnifierVerticalRanged *)self currentOffset];
  double v13 = v7 - v12;
  if (v13 < v11) {
    double v13 = v11;
  }
  double v14 = round(v13) + -0.5;
  double v15 = round(v9) + 0.5;

  -[TSWPTextMagnifierVerticalRanged setCenter:](self, "setCenter:", v14, v15);
}

- (void)remove
{
  [(TSWPTextMagnifierRenderer *)self->super._magnifierRenderer tearDown];
  [(TSWPTextMagnifierVerticalRanged *)self removeFromSuperview];
  [(TSWPTextMagnifierVerticalRanged *)self setAlpha:1.0];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(TSWPTextMagnifierVerticalRanged *)self setTransform:v4];
  -[TSWPTextMagnifierRanged setFrame:](self, "setFrame:", 0.0, 0.0, 65.0, 150.0);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  objc_msgSend(+[TSWPTextMagnifierCaret sharedCaretMagnifier](TSWPTextMagnifierCaret, "sharedCaretMagnifier"), "stopMagnifying:", 0);
  [(TSWPTextMagnifierRanged *)self setTarget:a3];
  [(TSWPTextMagnifierTimeWeightedPoint *)self->super._weightedPoint clearHistory];
  [(TSWPTextMagnifierRanged *)self setAutoscrollDirections:0];
  [(TSWPTextMagnifierVerticalRanged *)self setNeedsLayout];
  [(TSWPTextMagnifierRanged *)self setNeedsDisplay];
  if (![(TSWPTextMagnifierVerticalRanged *)self window]) {
    objc_msgSend(+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:", objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "canvasView")), "addSubview:", self);
  }
  double v13 = 0.0;
  if (x >= 0.0) {
    double v13 = x;
  }
  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", round(v13), round(y));
  -[TSWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6)
  {
    [(TSWPTextMagnifierVerticalRanged *)self zoomLeftAnimation];
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    [(TSWPTextMagnifierVerticalRanged *)self zoomRightAnimation];
  }
  else
  {
    [(TSWPTextMagnifierVerticalRanged *)self remove];
    [(TSWPTextMagnifierRanged *)self setTarget:0];
  }
  self->super._magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);

  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", v4, v5);
}

- (id)underlayImageName
{
  return @"kb-magnifier-vertical-ranged-lo";
}

- (id)overlayImageName
{
  return @"kb-magnifier-vertical-ranged-hi";
}

- (id)maskImageName
{
  return @"kb-magnifier-vertical-ranged-mask";
}

- (BOOL)shouldHideCanvasLayer
{
  [(TSDRep *)[(TSWPTextMagnifierRanged *)self target] interactiveCanvasController];
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
  uint64_t v61 = *MEMORY[0x263EF8340];
  BOOL v6 = [(TSDRep *)[(TSWPTextMagnifierRanged *)self target] interactiveCanvasController];
  objc_opt_class();
  [(TSDInteractiveCanvasController *)v6 layerHost];
  double v7 = (void *)TSUDynamicCast();
  double v8 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)v6 layerHost] canvasView];
  [(TSWPTextMagnifierVerticalRanged *)self frame];
  objc_msgSend(v8, "convertRect:fromView:", -[TSWPTextMagnifierVerticalRanged superview](self, "superview"), v9 + -18.0, v11, v10 + -3.0 + -18.0, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  CGContextSaveGState(a4);
  [(TSWPTextMagnifierVerticalRanged *)self frame];
  CGFloat v22 = v21;
  [(TSWPTextMagnifierVerticalRanged *)self frame];
  CGFloat v24 = v23;
  v25 = (CGImage *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierVerticalRanged maskImageName](self, "maskImageName"), TSWPBundle(), 0), "CGImage");
  v62.origin.double x = 0.0;
  v62.origin.double y = 0.0;
  v62.size.width = v22;
  v62.size.height = v24;
  CGContextClipToMask(a4, v62, v25);
  if (v6)
  {
    v26 = (void *)[v7 backgroundColorForMagnifier];
    if (v26)
    {
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v26 CGColor]);
      v63.origin.double x = 0.0;
      v63.origin.double y = 0.0;
      v63.size.width = v22;
      v63.size.height = v24;
      CGContextFillRect(a4, v63);
    }
  }
  CGContextScaleCTM(a4, 1.2, 1.2);
  [(TSWPTextMagnifierVerticalRanged *)self currentOffset];
  double v28 = v27;
  objc_opt_class();
  [(TSDEditorController *)[(TSDInteractiveCanvasController *)v6 editorController] textInputEditor];
  v29 = (void *)[(id)TSUDynamicCast() selection];
  unint64_t v30 = [[(TSDKnobTracker *)[(TSDRep *)[(TSWPTextMagnifierRanged *)self target] currentKnobTracker] knob] tag];
  if (v30 == 11) {
    uint64_t v31 = [v29 start];
  }
  else {
    uint64_t v31 = [v29 end];
  }
  uint64_t v32 = v31;
  double v33 = v14 + v28;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v34 = [(TSWPRep *)[(TSWPTextMagnifierRanged *)self target] columns];
  uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    v50 = v6;
    v51 = v8;
    v52 = a4;
    uint64_t v37 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v57 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v40 = objc_msgSend(v39, "lineFragmentForCharIndex:knobTag:selectionType:", v32, v30, objc_msgSend(v29, "type"));
        if (v40)
        {
          uint64_t v41 = v40;
          float64x2_t v42 = 0uLL;
          float64x2_t v43 = 0uLL;
          float64x2_t v44 = 0uLL;
          float64x2_t v45 = 0uLL;
          if (v39)
          {
            objc_msgSend(v39, "transformFromWP", 0.0, 0.0, 0.0);
            float64x2_t v42 = 0uLL;
            float64x2_t v44 = v53;
            float64x2_t v45 = v54;
            float64x2_t v43 = v55;
          }
          v46 = [(TSWPTextMagnifierRanged *)self target];
          -[TSDRep convertNaturalPointToUnscaledCanvas:](v46, "convertNaturalPointToUnscaledCanvas:", v48, v49);
          -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v50, "convertUnscaledToBoundsPoint:");
          double v33 = 21.0 - v47;
          goto LABEL_19;
        }
      }
      uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v36) {
        continue;
      }
      break;
    }
LABEL_19:
    double v8 = v51;
    a4 = v52;
  }
  CGContextTranslateCTM(a4, v33, -v16);
  CGContextTranslateCTM(a4, v18 * -0.100000001, v20 * -0.100000001);
  objc_msgSend((id)objc_msgSend(v8, "canvasLayer"), "renderInContext:", a4);
  CGContextRestoreGState(a4);
}

@end