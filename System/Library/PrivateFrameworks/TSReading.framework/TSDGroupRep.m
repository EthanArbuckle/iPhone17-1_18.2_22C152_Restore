@interface TSDGroupRep
+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (BOOL)directlyManagesLayerContent;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isDraggable;
- (BOOL)shouldShowCommentHighlight;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CGColor)selectionHighlightColor;
- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3;
- (CGRect)clipRect;
- (CGRect)frameInUnscaledCanvas;
- (Class)layerClass;
- (id)allRepsContainedInGroup;
- (void)processChangedProperty:(int)a3;
- (void)recursivelyDrawInContext:(CGContext *)a3;
- (void)setNeedsDisplay;
@end

@implementation TSDGroupRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isDraggable
{
  return 1;
}

- (CGRect)clipRect
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  mChildReps = self->super.mChildReps;
  uint64_t v7 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(mChildReps);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "clipRect", *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx);
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        v20 = objc_msgSend((id)objc_msgSend(v11, "layout"), "geometry");
        if (v20) {
          [v20 transform];
        }
        else {
          memset(&v25, 0, sizeof(v25));
        }
        v32.origin.CGFloat x = v13;
        v32.origin.CGFloat y = v15;
        v32.size.CGFloat width = v17;
        v32.size.CGFloat height = v19;
        CGRect v36 = CGRectApplyAffineTransform(v32, &v25);
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        CGRect v34 = CGRectUnion(v33, v36);
        CGFloat x = v34.origin.x;
        CGFloat y = v34.origin.y;
        CGFloat width = v34.size.width;
        CGFloat height = v34.size.height;
      }
      uint64_t v8 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (void)recursivelyDrawInContext:(CGContext *)a3
{
  v5 = [(TSDAbstractLayout *)[(TSDRep *)self layout] geometry];
  if (v5) {
    [(TSDLayoutGeometry *)v5 transform];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  CGContextConcatCTM(a3, &v14);
  [(TSDGroupRep *)self clipRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  if ([(TSDRep *)self masksToBounds])
  {
    v15.origin.CGFloat x = v7;
    v15.origin.CGFloat y = v9;
    v15.size.CGFloat width = v11;
    v15.size.CGFloat height = v13;
    CGContextClipToRect(a3, v15);
    CGContextSaveGState(a3);
  }
  else
  {
    CGContextSaveGState(a3);
    v16.origin.CGFloat x = v7;
    v16.origin.CGFloat y = v9;
    v16.size.CGFloat width = v11;
    v16.size.CGFloat height = v13;
    CGContextClipToRect(a3, v16);
  }
  -[TSDGroupRep drawInContext:](self, "drawInContext:", a3, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
  CGContextRestoreGState(a3);
  [(TSDRep *)self recursivelyDrawChildrenInContext:a3];
}

- (BOOL)shouldShowSelectionHighlight
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((TSDGroupRep *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] topLevelContainerRepForEditing] == self)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    mChildReps = self->super.mChildReps;
    uint64_t v5 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(mChildReps);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isInDynamicOperation]) {
            return 0;
          }
        }
        uint64_t v6 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v10 objects:v14 count:16];
        BOOL result = 1;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDGroupRep;
    return [(TSDRep *)&v9 shouldShowSelectionHighlight];
  }
  return result;
}

- (CGColor)selectionHighlightColor
{
  if ((TSDGroupRep *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] topLevelContainerRepForEditing] == self)
  {
    if (selectionHighlightColor_sOnce_0 != -1) {
      dispatch_once(&selectionHighlightColor_sOnce_0, &__block_literal_global_44);
    }
    return (CGColor *)selectionHighlightColor_sTopLevelContainerSelectionHighlightColor;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDGroupRep;
    return [(TSDRep *)&v4 selectionHighlightColor];
  }
}

CGColorRef __38__TSDGroupRep_selectionHighlightColor__block_invoke()
{
  CGColorRef result = CGColorRetain((CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.85, 0.85, 0.85, 1.0), "CGColor"));
  selectionHighlightColor_sTopLevelContainerSelectionHighlightColor = (uint64_t)result;
  return result;
}

- (CGRect)frameInUnscaledCanvas
{
  id v2 = [(TSDLayout *)[(TSDRep *)self layout] pureGeometryInRoot];

  [v2 frame];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)shouldShowCommentHighlight
{
  double v3 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] topLevelContainerRepForEditing];
  if (v3)
  {
    double v4 = (TSDGroupRep *)v3;
    while (v4 != self)
    {
      objc_opt_class();
      [(TSDRep *)v4 parentRep];
      double v4 = (TSDGroupRep *)TSUDynamicCast();
      if (!v4) {
        goto LABEL_5;
      }
    }
    return 0;
  }
  else
  {
LABEL_5:
    v6.receiver = self;
    v6.super_class = (Class)TSDGroupRep;
    return [(TSDRep *)&v6 shouldShowCommentHighlight];
  }
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v3 = [(TSDRep *)self layout];
  if (v3) {
    [(TSDAbstractLayout *)v3 transformInRoot];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CGAffineTransformInvert(&v9, &v8);
  float64x2_t v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  double v5 = v4.f64[1];
  result.double x = v4.f64[0];
  result.double y = v5;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  uint64_t v14 = *(void *)&a3.x;
  double y = a3.y;
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v3 = (void *)[(NSMutableArray *)self->super.mChildReps reverseObjectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    float64x2_t v15 = (float64x2_t)vdupq_lane_s64(v14, 0);
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        CGAffineTransform v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
        CGAffineTransform v9 = objc_msgSend((id)objc_msgSend(v8, "layout", *(void *)&v15.f64[0]), "geometry");
        if (v9)
        {
          [v9 inverseTransform];
          float64x2_t v10 = v17;
          float64x2_t v11 = v18;
          float64x2_t v12 = v19;
        }
        else
        {
          float64x2_t v18 = 0u;
          float64x2_t v19 = 0u;
          float64x2_t v12 = 0uLL;
          float64x2_t v10 = 0uLL;
          float64x2_t v11 = 0uLL;
          float64x2_t v17 = 0u;
        }
        if (objc_msgSend(v8, "containsPoint:", vaddq_f64(v12, vmlaq_f64(vmulq_n_f64(v11, y), v15, v10))))
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v17 = *(void *)&a3.x;
  double y = a3.y;
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = (void *)[(NSMutableArray *)self->super.mChildReps reverseObjectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    float64x2_t v18 = (float64x2_t)vdupq_lane_s64(v17, 0);
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        float64x2_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        float64x2_t v12 = objc_msgSend((id)objc_msgSend(v11, "layout", *(void *)&v18.f64[0]), "geometry");
        if (v12)
        {
          [v12 inverseTransform];
          float64x2_t v13 = v20;
          float64x2_t v14 = v21;
          float64x2_t v15 = v22;
        }
        else
        {
          float64x2_t v21 = 0u;
          float64x2_t v22 = 0u;
          float64x2_t v15 = 0uLL;
          float64x2_t v13 = 0uLL;
          float64x2_t v14 = 0uLL;
          float64x2_t v20 = 0u;
        }
        if (objc_msgSend(v11, "containsPoint:withSlop:", vaddq_f64(v15, vmlaq_f64(vmulq_n_f64(v14, y), v18, v13)), width, height))
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = (void *)[(NSMutableArray *)self->super.mChildReps reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "intersectsUnscaledRect:", x, y, width, height))
        {
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v8;
}

- (void)processChangedProperty:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDGroupRep;
  [(TSDRep *)&v4 processChangedProperty:*(void *)&a3];
  [(TSDCanvas *)self->super.super.mCanvas layoutInvalidated];
}

- (void)setNeedsDisplay
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)TSDGroupRep;
  [(TSDRep *)&v12 setNeedsDisplay];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  mChildReps = self->super.mChildReps;
  uint64_t v4 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mChildReps);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setNeedsDisplay];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)allRepsContainedInGroup
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(TSDContainerRep *)self childReps];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v9, "allRepsContainedInGroup"));
        }
        else {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(TSDContainerRep *)self childReps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) wantsToHandleTapsWhenLocked])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  -[TSDGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  id v6 = -[TSDRep hitReps:withSlop:](self, "hitReps:withSlop:");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if ([v11 wantsToHandleTapsOnContainingGroup]
          && (objc_msgSend(v11, "handleSingleTapAtPoint:", x, y) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  -[TSDGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  id v4 = -[TSDContainerRep hitRep:](self, "hitRep:");
  if (v4)
  {
    uint64_t v5 = v4;
    if (objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id v6 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor];
      objc_opt_class();
      [(TSDRep *)self info];
      [(TSDCanvasEditor *)v6 setSelection:[(TSDCanvasEditor *)v6 canvasSelectionWithInfos:0 andContainer:TSUDynamicCast()]];
      uint64_t v7 = (void *)[v5 repForSelecting];
      uint64_t v8 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor];
      objc_opt_class();
      [v7 info];
      [(TSDCanvasEditor *)v8 setSelectionToInfo:TSUDynamicCast()];
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  uint64_t v5 = (void *)TSUDynamicCast();
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "childReps"), "count");
  double v7 = 0.0;
  if (v6 == objc_msgSend((id)objc_msgSend(v5, "childReps"), "count"))
  {
    unint64_t v8 = objc_msgSend((id)objc_msgSend(v4, "childReps"), "count");
    if (v8)
    {
      uint64_t v9 = 0;
      double v10 = 0.0;
      while (1)
      {
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v4, "childReps"), "objectAtIndex:", v9);
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v5, "childReps"), "objectAtIndex:", v9);
        long long v13 = objc_opt_class();
        if (![v13 isEqual:objc_opt_class()]) {
          break;
        }
        [(id)objc_opt_class() magicMoveAttributeMatchPercentBetweenOutgoingObject:v11 incomingObject:v12];
        double v10 = v10 + v14;
        if (v8 == ++v9) {
          return v10 / (double)v8;
        }
      }
    }
    else
    {
      double v10 = 0.0;
      return v10 / (double)v8;
    }
  }
  return v7;
}

@end