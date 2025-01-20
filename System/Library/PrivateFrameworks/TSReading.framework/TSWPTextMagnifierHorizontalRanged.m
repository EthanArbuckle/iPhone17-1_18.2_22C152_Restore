@interface TSWPTextMagnifierHorizontalRanged
+ (id)sharedRangedMagnifier;
- (BOOL)shouldHideCanvasLayer;
- (BOOL)shouldIgnoreTextInputEditor;
- (TSWPTextMagnifierHorizontalRanged)initWithDefaultFrame;
- (double)currentOffset;
- (id)maskImageName;
- (id)overlayImageName;
- (id)underlayImageName;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)dealloc;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)remove;
- (void)setShouldIgnoreTextInputEditor:(BOOL)a3;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrame;
- (void)zoomDownAnimation;
- (void)zoomUpAnimation;
@end

@implementation TSWPTextMagnifierHorizontalRanged

+ (id)sharedRangedMagnifier
{
  return 0;
}

- (TSWPTextMagnifierHorizontalRanged)initWithDefaultFrame
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierHorizontalRanged;
  return -[TSWPTextMagnifierRanged initWithFrame:](&v3, sel_initWithFrame_, 0.0, 0.0, 145.0, 59.0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPTextMagnifierHorizontalRanged;
  [(TSWPTextMagnifierRanged *)&v2 dealloc];
}

- (void)zoomUpAnimation
{
  memset(&v8, 0, sizeof(v8));
  [(TSWPTextMagnifierHorizontalRanged *)self bounds];
  CGFloat MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  CGAffineTransform v8 = v7;
  CGAffineTransform v5 = v7;
  [(TSWPTextMagnifierHorizontalRanged *)self setTransform:&v5];
  [(TSWPTextMagnifierHorizontalRanged *)self setAlpha:0.0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__TSWPTextMagnifierHorizontalRanged_zoomUpAnimation__block_invoke;
  v4[3] = &unk_2646AF7B8;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.1];
}

uint64_t __52__TSWPTextMagnifierHorizontalRanged_zoomUpAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [*(id *)(a1 + 32) setTransform:v4];
}

- (void)zoomDownAnimation
{
  [(TSWPTextMagnifierRanged *)self animationPoint];
  self->super._magnificationPoint.x = v4;
  self->super._magnificationPoint.y = v3 + 8.0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke;
  v6[3] = &unk_2646AF7B8;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke_2;
  v5[3] = &unk_2646B09F8;
  v5[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v6 animations:v5 completion:0.2];
}

uint64_t __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFrame];
  memset(&v8, 0, sizeof(v8));
  [*(id *)(a1 + 32) bounds];
  CGFloat MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  CGAffineTransform v8 = v7;
  double v3 = *(void **)(a1 + 32);
  CGAffineTransform v5 = v7;
  [v3 setTransform:&v5];
  return [*(id *)(a1 + 32) setAlpha:0.25];
}

uint64_t __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke_2(uint64_t a1)
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
  double v3 = (void *)[(TSWPTextMagnifierHorizontalRanged *)self superview];
  [(TSWPTextMagnifierRanged *)self magnificationPoint];
  objc_msgSend(v3, "convertPoint:fromView:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](-[TSWPTextMagnifierRanged target](self, "target"), "interactiveCanvasController"), "layerHost"), "canvasView"), v4, v5);
  double v7 = v6;
  double v9 = v8;
  [(TSWPTextMagnifierHorizontalRanged *)self bounds];
  double v11 = v10 * 0.5;
  self->super._inPlace = v9 + v10 * 0.5 + -41.0 < 45.0;
  [(TSWPTextMagnifierHorizontalRanged *)self currentOffset];
  double v13 = v9 - v12;
  if (v13 >= v11) {
    double v14 = v13;
  }
  else {
    double v14 = v11;
  }
  double v15 = round(v7) + 0.5;
  double v16 = round(v14) + 0.5;

  -[TSWPTextMagnifierHorizontalRanged setCenter:](self, "setCenter:", v15, v16);
}

- (void)remove
{
  [(TSWPTextMagnifierRenderer *)self->super._magnifierRenderer tearDown];
  [(TSWPTextMagnifierHorizontalRanged *)self removeFromSuperview];
  [(TSWPTextMagnifierHorizontalRanged *)self setAlpha:1.0];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(TSWPTextMagnifierHorizontalRanged *)self setTransform:v4];
  -[TSWPTextMagnifierRanged setFrame:](self, "setFrame:", 0.0, 0.0, 145.0, 59.0);
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
  [(TSWPTextMagnifierHorizontalRanged *)self setNeedsLayout];
  [(TSWPTextMagnifierRanged *)self setNeedsDisplay];
  if (![(TSWPTextMagnifierHorizontalRanged *)self window]) {
    objc_msgSend(+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:", objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "canvasView")), "addSubview:", self);
  }
  if (y >= 0.0) {
    double v13 = y;
  }
  else {
    double v13 = 0.0;
  }
  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", round(x), round(v13));
  -[TSWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6)
  {
    [(TSWPTextMagnifierHorizontalRanged *)self zoomUpAnimation];
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    [(TSWPTextMagnifierHorizontalRanged *)self zoomDownAnimation];
  }
  else
  {
    [(TSWPTextMagnifierHorizontalRanged *)self remove];
    [(TSWPTextMagnifierRanged *)self setTarget:0];
  }
  self->super._magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  [(TSWPTextMagnifierHorizontalRanged *)self setShouldIgnoreTextInputEditor:0];
}

- (id)underlayImageName
{
  return @"kb-magnifier-ranged-lo";
}

- (id)overlayImageName
{
  return @"kb-magnifier-ranged-hi";
}

- (id)maskImageName
{
  return @"kb-magnifier-ranged-mask";
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
  uint64_t v49 = *MEMORY[0x263EF8340];
  BOOL v6 = [(TSDRep *)[(TSWPTextMagnifierRanged *)self target] interactiveCanvasController];
  objc_opt_class();
  [(TSDInteractiveCanvasController *)v6 layerHost];
  double v7 = (void *)TSUDynamicCast();
  double v8 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)v6 layerHost] canvasView];
  [(TSWPTextMagnifierHorizontalRanged *)self frame];
  objc_msgSend(v8, "convertRect:fromView:", -[TSWPTextMagnifierHorizontalRanged superview](self, "superview"), v11, v9 + 3.0, v12, v10 + -3.0 + -18.0);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  CGContextSaveGState(a4);
  [(TSWPTextMagnifierHorizontalRanged *)self frame];
  CGFloat v22 = v21;
  [(TSWPTextMagnifierHorizontalRanged *)self frame];
  CGFloat v24 = v23;
  v25 = (CGImage *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierHorizontalRanged maskImageName](self, "maskImageName"), TSWPBundle(), 0), "CGImage");
  v50.origin.double x = 0.0;
  v50.origin.double y = 0.0;
  v50.size.width = v22;
  v50.size.height = v24;
  CGContextClipToMask(a4, v50, v25);
  if (v6)
  {
    v26 = (void *)[v7 backgroundColorForMagnifier];
    if (v26)
    {
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v26 CGColor]);
      v51.origin.double x = 0.0;
      v51.origin.double y = 0.0;
      v51.size.width = v22;
      v51.size.height = v24;
      CGContextFillRect(a4, v51);
    }
  }
  CGContextScaleCTM(a4, 1.2, 1.2);
  [(TSWPTextMagnifierHorizontalRanged *)self currentOffset];
  double v28 = -v16 - v27;
  objc_opt_class();
  [(TSDEditorController *)[(TSDInteractiveCanvasController *)v6 editorController] textInputEditor];
  uint64_t v29 = TSUDynamicCast();
  if (v29 && !*(&self->super._inPlace + 1))
  {
    v30 = (void *)v29;
    objc_opt_class();
    [v30 selection];
    v31 = (void *)TSUDynamicCast();
    unint64_t v32 = [[(TSDKnobTracker *)[(TSDRep *)[(TSWPTextMagnifierRanged *)self target] currentKnobTracker] knob] tag];
    if ([v31 isVisual])
    {
      uint64_t v33 = v32 == 11 ? [v31 headChar] : objc_msgSend(v31, "tailChar");
    }
    else if (v32 == 11)
    {
      uint64_t v33 = [v31 start];
    }
    else
    {
      uint64_t v33 = v32
          ? [v31 end]
          : -[TSWPRep charIndexForPointWithPinning:]([(TSWPTextMagnifierRanged *)self target], "charIndexForPointWithPinning:", v14, v16);
    }
    uint64_t v34 = v33;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v35 = [(TSWPRep *)[(TSWPTextMagnifierRanged *)self target] columns];
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      v43 = v6;
      uint64_t v38 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v45 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "lineFragmentForCharIndex:knobTag:selectionType:", v34, v32, objc_msgSend(v31, "type"));
          if (v40)
          {
            -[TSDRep convertNaturalPointToUnscaledCanvas:]([(TSWPTextMagnifierRanged *)self target], "convertNaturalPointToUnscaledCanvas:", 0.0, *(double *)(v40 + 32) + *(double *)(v40 + 40));
            BOOL v6 = v43;
            -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v43, "convertUnscaledToBoundsPoint:");
            double v42 = v41;
            v52.origin.double x = v14;
            v52.origin.double y = v16;
            v52.size.width = v18;
            v52.size.height = v20;
            double v28 = CGRectGetHeight(v52) - v42 + -7.0;
            goto LABEL_25;
          }
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v37) {
          continue;
        }
        break;
      }
      BOOL v6 = v43;
    }
  }
LABEL_25:
  CGContextTranslateCTM(a4, -v14, v28);
  CGContextTranslateCTM(a4, v18 * -0.100000001, v20 * -0.100000001);
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "canvasLayer"), "renderInContext:", a4);
  CGContextRestoreGState(a4);
}

- (BOOL)shouldIgnoreTextInputEditor
{
  return *(&self->super._inPlace + 1);
}

- (void)setShouldIgnoreTextInputEditor:(BOOL)a3
{
  *(&self->super._inPlace + 1) = a3;
}

@end