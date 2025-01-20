@interface TSWPEquationRep
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)directlyManagesLayerContent;
- (CALayer)equationLayer;
- (CGRect)clipRect;
- (CGRect)visibleBoundsForTilingLayer:(id)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)screenScaleDidChange;
- (void)setEquationLayer:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)willBeRemoved;
@end

@implementation TSWPEquationRep

- (void)dealloc
{
  if (self->_equationLayer)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEquationRep dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 33, @"layer should have been cleaned up in willBeRemoved");
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPEquationRep;
  [(TSDRep *)&v5 dealloc];
}

- (void)willBeRemoved
{
  [(CALayer *)self->_equationLayer setDelegate:0];

  self->_equationLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationRep;
  [(TSDRep *)&v3 willBeRemoved];
}

- (BOOL)containsPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)didUpdateLayer:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)TSWPEquationRep;
  -[TSDRep didUpdateLayer:](&v30, sel_didUpdateLayer_);
  if ([(TSDLayout *)[(TSDRep *)self layout] equationIsValid])
  {
    if (!self->_equationLayer)
    {
      objc_super v5 = objc_alloc_init(TSDTilingLayer);
      self->_equationLayer = &v5->super;
      [(TSDTilingLayer *)v5 setDelegate:self];
      -[CALayer setAnchorPoint:](self->_equationLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
      -[CALayer setContentsScale:](self->_equationLayer, "setContentsScale:");
    }
    [(TSWPEquationRep *)self clipRect];
    double v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v14 = [(TSDRep *)self layout];
    if (v14) {
      [(TSDAbstractLayout *)v14 transformInRoot];
    }
    else {
      memset(&v29, 0, sizeof(v29));
    }
    v31.origin.double x = v7;
    v31.origin.double y = v9;
    v31.size.double width = v11;
    v31.size.double height = v13;
    CGRect v32 = CGRectApplyAffineTransform(v31, &v29);
    double width = v32.size.width;
    double height = v32.size.height;
    v17 = [(TSDRep *)self layout];
    if (v17)
    {
      [(TSDAbstractLayout *)v17 transformInRoot];
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
    }
    double v18 = TSDTransformScale((double *)&v26);
    double v19 = TSDMultiplyPointScalar(v7, v9, v18);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:]([(TSDRep *)self interactiveCanvasController], "convertUnscaledToBoundsRect:", v19, v20, width, height);
    CGRect v34 = CGRectIntegral(v33);
    double x = v34.origin.x;
    double y = v34.origin.y;
    double v23 = v34.size.width;
    double v24 = v34.size.height;
    [(CALayer *)self->_equationLayer bounds];
    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.double width = v23;
    v36.size.double height = v24;
    if (!CGRectEqualToRect(v35, v36))
    {
      -[CALayer setBounds:](self->_equationLayer, "setBounds:", x, y, v23, v24);
      [a3 bounds];
      [(CALayer *)self->_equationLayer setPosition:TSDSubtractPoints(x, y, v25)];
      [(CALayer *)self->_equationLayer setNeedsDisplay];
    }
    if (-[CALayer superlayer](self->_equationLayer, "superlayer", v26, v27, v28, *(void *)&v29.a, *(void *)&v29.b, *(void *)&v29.c, *(void *)&v29.d, *(void *)&v29.tx, *(void *)&v29.ty) != a3)[a3 addSublayer:self->_equationLayer]; {
  }
    }
}

- (void)screenScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationRep;
  [(TSDRep *)&v3 screenScaleDidChange];
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  -[CALayer setContentsScale:](self->_equationLayer, "setContentsScale:");
}

- (void)setNeedsDisplay
{
  if ([(TSDLayout *)[(TSDRep *)self layout] equationIsValid]
    && [(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    objc_super v3 = [(TSDRep *)self interactiveCanvasController];
    equationLayer = self->_equationLayer;
    [(TSDInteractiveCanvasController *)v3 setNeedsDisplayOnLayer:equationLayer];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(TSDLayout *)[(TSDRep *)self layout] equationIsValid])
  {
    if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
    {
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.double width = width;
      v19.size.double height = height;
      if (!CGRectIsNull(v19))
      {
        v20.origin.double x = x;
        v20.origin.double y = y;
        v20.size.double width = width;
        v20.size.double height = height;
        if (!CGRectIsEmpty(v20))
        {
          -[TSDRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
          double v9 = v8;
          double v11 = v10;
          double v13 = v12;
          double v15 = v14;
          v16 = [(TSDRep *)self interactiveCanvasController];
          equationLayer = self->_equationLayer;
          -[TSDInteractiveCanvasController setNeedsDisplayInRect:onLayer:](v16, "setNeedsDisplayInRect:onLayer:", equationLayer, v9, v11, v13, v15);
        }
      }
    }
  }
}

- (CGRect)clipRect
{
  objc_super v3 = (void *)[(TSDLayout *)[(TSDRep *)self layout] equationLayout];
  if (!v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPEquationRep clipRect]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 134, @"invalid nil value for '%s'", "equationLayout");
  }
  v26.receiver = self;
  v26.super_class = (Class)TSWPEquationRep;
  [(TSDRep *)&v26 clipRect];
  double v7 = v6;
  double v9 = v8;
  double width = v10;
  double height = v12;
  if ([(TSDLayout *)[(TSDRep *)self layout] equationIsValid])
  {
    [v3 erasableBounds];
    CGRect v28 = CGRectIntegral(v27);
    double x = v28.origin.x;
    double y = v28.origin.y;
    double width = v28.size.width;
    double height = v28.size.height;
    [v3 height];
    double v7 = x + 0.0;
    double v9 = v16 + y;
    v17 = (void *)[(TSDLayout *)[(TSDRep *)self layout] textShadow];
    if ([v17 isEnabled])
    {
      objc_msgSend(v17, "shadowBoundsForRect:", v7, v9, width, height);
      double v7 = v18;
      double v9 = v19;
      double width = v20;
      double height = v21;
    }
  }
  double v22 = v7;
  double v23 = v9;
  double v24 = width;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  if ([(TSDLayout *)[(TSDRep *)self layout] equationIsValid])
  {
    CGContextSaveGState(a3);
    CGContextSetFillColorWithColor(a3, (CGColorRef)[(TSDLayout *)[(TSDRep *)self layout] textColor]);
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)[(TSDLayout *)[(TSDRep *)self layout] textColor]);
    uint64_t v5 = (void *)[(TSDLayout *)[(TSDRep *)self layout] textShadow];
    [(TSDCanvas *)self->super.mCanvas viewScale];
    objc_msgSend(v5, "applyToContext:viewScale:flipped:", a3, 0);
    double v6 = (void *)[(TSDLayout *)[(TSDRep *)self layout] equationLayout];
    if (!v6)
    {
      double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPEquationRep drawInContext:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 175, @"invalid nil value for '%s'", "equationLayout");
    }
    [v6 height];
    objc_msgSend(v6, "renderIntoContext:offset:", a3, 0.0, v9);
    CGContextRestoreGState(a3);
  }
}

- (void)drawInLayerContext:(CGContext *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEquationRep drawInLayerContext:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:185 description:@"shouldn't draw into our own layer"];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_equationLayer == a3)
  {
    CGContextSaveGState(a4);
    [(TSDRep *)self setupForDrawingInLayer:self->_equationLayer context:a4];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[(TSDLayout *)[(TSDRep *)self layout] textColor]);
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)[(TSDLayout *)[(TSDRep *)self layout] textColor]);
    double v6 = (void *)[(TSDLayout *)[(TSDRep *)self layout] textShadow];
    [(TSDCanvas *)self->super.mCanvas viewScale];
    objc_msgSend(v6, "applyToContext:viewScale:flipped:", a4, -[CALayer contentsAreFlipped](self->_equationLayer, "contentsAreFlipped"), v7);
    uint64_t v8 = (void *)[(TSDLayout *)[(TSDRep *)self layout] equationLayout];
    if (!v8)
    {
      double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPEquationRep drawLayer:inContext:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 203, @"invalid nil value for '%s'", "equationLayout");
    }
    [v8 height];
    objc_msgSend(v8, "renderIntoContext:offset:", a4, 0.0, v11);
    [(TSDRep *)self didDrawInLayer:self->_equationLayer context:a4];
    CGContextRestoreGState(a4);
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if (self->_equationLayer == a3) {
    return (id)[MEMORY[0x263EFF9D0] null];
  }
  else {
    return 0;
  }
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  uint64_t v4 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v4 visibleBoundsForTilingLayer:a3];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CALayer)equationLayer
{
  return self->_equationLayer;
}

- (void)setEquationLayer:(id)a3
{
}

@end