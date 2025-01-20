@interface CRLFreehandDrawingTransformRep
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)p_isInDrawingMode;
- (BOOL)p_isInDrawingTransformMode;
- (BOOL)p_shouldDisplayAnimatedSelectionOutline;
- (BOOL)p_siblingLayoutInLayoutState:(int)a3;
- (BOOL)p_toolkitWantsToSuppressKnobs;
- (BOOL)pathContainsPoint:(CGPoint)a3;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable;
- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3;
- (BOOL)willHandleResizingLayoutForRep:(id)a3;
- (CRLFreehandDrawingTransformRep)initWithLayout:(id)a3 canvas:(id)a4;
- (NSArray)decoratorOverlayRenderables;
- (id)additionalRepsToResize;
- (id)ancestorRepForDrawingIntoLayer;
- (id)dynamicResizeDidBegin;
- (id)overlayRenderables;
- (id)p_calculateLayerRelativePathForAffordance;
- (id)p_siblingReps;
- (id)p_transformLayout;
- (void)documentModeDidChange;
- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3;
- (void)dynamicFreeTransformDidEndWithTracker:(id)a3;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)dynamicallyFreeTransformingWithTracker:(id)a3;
- (void)dynamicallyResizingWithTracker:(id)a3;
- (void)invalidateSubselectionAffordance;
- (void)willBeRemoved;
@end

@implementation CRLFreehandDrawingTransformRep

- (CRLFreehandDrawingTransformRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingTransformRep;
  v4 = [(CRLCanvasRep *)&v8 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    v4->_viewScaleForCurrentLayerRelativePath = 0.0;
    v6 = [(CRLCanvasRep *)v4 interactiveCanvasController];
    [v6 addDecorator:v5];
  }
  return v5;
}

- (void)invalidateSubselectionAffordance
{
  currentLayerRelativePath = self->_currentLayerRelativePath;
  self->_currentLayerRelativePath = 0;

  self->_viewScaleForCurrentLayerRelativePath = 0.0;
  [(CRLCanvasRenderable *)self->_blackPathRenderable removeAnimationForKey:@"linePhase"];
  [(CRLCanvasRenderable *)self->_whitePathRenderable removeAnimationForKey:@"linePhase"];
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v4 invalidateOverlayLayersForRep:self];
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return 0;
}

- (BOOL)pathContainsPoint:(CGPoint)a3
{
  currentLayerRelativePath = self->_currentLayerRelativePath;
  if (currentLayerRelativePath) {
    LOBYTE(currentLayerRelativePath) = -[CRLBezierPath containsPoint:](currentLayerRelativePath, "containsPoint:", a3.x, a3.y);
  }
  return (char)currentLayerRelativePath;
}

- (id)overlayRenderables
{
  v32.receiver = self;
  v32.super_class = (Class)CRLFreehandDrawingTransformRep;
  uint64_t v3 = [(CRLCanvasRep *)&v32 overlayRenderables];
  id v4 = (void *)v3;
  v5 = &__NSArray0__struct;
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  if ([(CRLFreehandDrawingTransformRep *)self p_shouldDisplayAnimatedSelectionOutline])
  {
    BOOL v7 = +[CRLFreehandDrawingToolMarquee wasLastMarqueeClockwise];
    blackPathRenderable = self->_blackPathRenderable;
    if (!blackPathRenderable)
    {
      v9 = +[CRLColor blackColor];
      v10 = +[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableOfColor:v9 offsetDashes:0];
      v11 = self->_blackPathRenderable;
      self->_blackPathRenderable = v10;

      blackPathRenderable = self->_blackPathRenderable;
    }
    v12 = [(CRLCanvasRenderable *)blackPathRenderable animationForKey:@"linePhase"];

    if (!v12)
    {
      v13 = self->_blackPathRenderable;
      v14 = +[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableAnimationWithOffsetDashes:0 clockwise:v7];
      [(CRLCanvasRenderable *)v13 addAnimation:v14 forKey:@"linePhase"];
    }
    whitePathRenderable = self->_whitePathRenderable;
    if (!whitePathRenderable)
    {
      v16 = +[CRLColor whiteColor];
      v17 = +[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableOfColor:v16 offsetDashes:1];
      v18 = self->_whitePathRenderable;
      self->_whitePathRenderable = v17;

      whitePathRenderable = self->_whitePathRenderable;
    }
    v19 = [(CRLCanvasRenderable *)whitePathRenderable animationForKey:@"linePhase"];

    if (!v19)
    {
      v20 = self->_whitePathRenderable;
      v21 = +[CRLFreehandDrawingToolMarquee dottedMarqueeRenderableAnimationWithOffsetDashes:1 clockwise:v7];
      [(CRLCanvasRenderable *)v20 addAnimation:v21 forKey:@"linePhase"];
    }
    v22 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v22 viewScale];
    double v24 = v23;

    if (!self->_currentLayerRelativePath || v24 != self->_viewScaleForCurrentLayerRelativePath)
    {
      v25 = [(CRLFreehandDrawingTransformRep *)self p_calculateLayerRelativePathForAffordance];
      currentLayerRelativePath = self->_currentLayerRelativePath;
      self->_currentLayerRelativePath = v25;

      [(CRLCanvasShapeRenderable *)self->_blackPathRenderable setPath:[(CRLBezierPath *)self->_currentLayerRelativePath CGPath]];
      [(CRLCanvasShapeRenderable *)self->_whitePathRenderable setPath:[(CRLBezierPath *)self->_currentLayerRelativePath CGPath]];
      self->_viewScaleForCurrentLayerRelativePath = v24;
    }
    BOOL v27 = +[CATransaction disableActions];
    +[CATransaction setDisableActions:1];
    [(CRLCanvasRep *)self layerFrameInScaledCanvas];
    -[CRLCanvasRenderable setFrame:](self->_blackPathRenderable, "setFrame:");
    [(CRLCanvasRep *)self layerFrameInScaledCanvas];
    -[CRLCanvasRenderable setFrame:](self->_whitePathRenderable, "setFrame:");
    +[CATransaction setDisableActions:v27];
    v28 = self->_whitePathRenderable;
    v33[0] = self->_blackPathRenderable;
    v33[1] = v28;
    v29 = +[NSArray arrayWithObjects:v33 count:2];
    uint64_t v30 = [v6 arrayByAddingObjectsFromArray:v29];

    id v6 = (id)v30;
  }

  return v6;
}

- (id)ancestorRepForDrawingIntoLayer
{
  return 0;
}

- (BOOL)shouldShowKnobs
{
  uint64_t v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v4 = [v3 isInDynamicOperation];

  unsigned __int8 v5 = [(CRLFreehandDrawingTransformRep *)self p_siblingLayoutInLayoutState:4];
  if ([(CRLFreehandDrawingTransformRep *)self p_isInDrawingTransformMode]) {
    return v4 ^ 1 | v5;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldCreateSelectionKnobs
{
  unsigned __int8 v3 = [(CRLFreehandDrawingTransformRep *)self p_siblingLayoutInLayoutState:2];
  unsigned __int8 v4 = [(CRLFreehandDrawingTransformRep *)self p_siblingLayoutInLayoutState:3];
  unsigned __int8 v5 = [(CRLFreehandDrawingTransformRep *)self p_siblingLayoutInLayoutState:5];
  return [(CRLFreehandDrawingTransformRep *)self p_isInDrawingTransformMode] & ~v3 & ((v4 | v5) ^ 1);
}

- (BOOL)shouldShowSelectionHighlight
{
  if ([(CRLFreehandDrawingTransformRep *)self p_isInDrawingTransformMode])
  {
    unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned int v4 = [v3 isInDynamicOperation] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)documentModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingTransformRep;
  [(CRLCanvasRep *)&v3 documentModeDidChange];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (void)willBeRemoved
{
  objc_super v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 removeDecorator:self];

  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingTransformRep;
  [(CRLCanvasRep *)&v4 willBeRemoved];
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)p_transformLayout
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (id)p_calculateLayerRelativePathForAffordance
{
  uint64_t v3 = [(CRLFreehandDrawingTransformRep *)self p_transformLayout];
  objc_super v4 = [v3 representedShapeLayouts];

  if ([v4 count])
  {
    unsigned __int8 v5 = [v4 allObjects];
    id v6 = [(CRLCanvasRep *)self canvas];
    [v6 viewScale];
    double v7 = 1.0;
    if (v8 > 0.0)
    {
      [v6 viewScale];
      double v7 = v9;
    }
    v10 = +[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:](CRLFreehandDrawingShapeTracingHelper, "unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:", v5, 10.0 / v7);
    memset(&v18, 0, sizeof(v18));
    v11 = [(CRLCanvasRep *)self layout];
    v12 = v11;
    if (v11) {
      [v11 transformInRoot];
    }
    else {
      memset(&v16, 0, sizeof(v16));
    }
    CGAffineTransformInvert(&t1, &v16);
    [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
    CGAffineTransformConcat(&v18, &t1, &t2);

    CGAffineTransform v14 = v18;
    [v10 transformUsingAffineTransform:&v14];
  }
  else
  {
    v10 = +[CRLBezierPath bezierPath];
  }

  return v10;
}

- (BOOL)p_shouldDisplayAnimatedSelectionOutline
{
  BOOL v3 = [(CRLFreehandDrawingTransformRep *)self p_toolkitWantsToSuppressKnobs];
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    objc_super v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned __int8 v5 = [v4 layerHost];
    id v6 = [v5 asiOSCVC];

    double v7 = [v6 smartSelectionManager];
    uint64_t v8 = objc_opt_class();
    double v9 = [(CRLCanvasRep *)self info];
    v10 = sub_1002469D0(v8, v9);

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = [v10 representedShapeInfos];
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          CGAffineTransform v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v17 = objc_opt_class();
          CGAffineTransform v18 = sub_1002469D0(v17, v16);
          if (v18
            && [v7 doesCurrentSmartSelectedDrawingShapeItemsContainDrawingShapeItem:v18])
          {

            BOOL v3 = 0;
            goto LABEL_13;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (BOOL)p_toolkitWantsToSuppressKnobs
{
  v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v3 = [v2 freehandDrawingToolkit];
  unsigned __int8 v4 = [v3 wantsToSuppressKnobsOnTransformReps];

  return v4;
}

- (BOOL)p_isInDrawingMode
{
  v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v3 = [v2 freehandDrawingToolkit];
  unsigned __int8 v4 = [v3 isInDrawingMode];

  return v4;
}

- (BOOL)p_isInDrawingTransformMode
{
  BOOL v3 = [(CRLFreehandDrawingTransformRep *)self p_isInDrawingMode];
  if (v3) {
    LOBYTE(v3) = ![(CRLFreehandDrawingTransformRep *)self p_toolkitWantsToSuppressKnobs];
  }
  return v3;
}

- (BOOL)p_siblingLayoutInLayoutState:(int)a3
{
  unsigned __int8 v5 = (objc_class *)objc_opt_class();
  id v6 = [(CRLCanvasRep *)self layout];
  double v7 = [v6 parent];
  uint64_t v8 = sub_10024715C(v5, v7);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v9 = [v8 children];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) layoutState] == a3)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (id)dynamicResizeDidBegin
{
  v16.receiver = self;
  v16.super_class = (Class)CRLFreehandDrawingTransformRep;
  BOOL v3 = [(CRLCanvasRep *)&v16 dynamicResizeDidBegin];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned __int8 v4 = [(CRLFreehandDrawingTransformRep *)self p_siblingReps];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(CRLFreehandDrawingTransformRep **)(*((void *)&v12 + 1) + 8 * i);
        if (v9 != self && [*(id *)(*((void *)&v12 + 1) + 8 * i) isSelected]) {
          id v10 = [(CRLFreehandDrawingTransformRep *)v9 dynamicResizeDidBegin];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingTransformRep;
  [(CRLCanvasRep *)&v15 dynamicallyResizingWithTracker:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(CRLFreehandDrawingTransformRep *)self p_siblingReps];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(CRLFreehandDrawingTransformRep **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (v10 != self && [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) isSelected]) {
          [(CRLFreehandDrawingTransformRep *)v10 dynamicallyResizingWithTracker:v4];
        }
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CRLFreehandDrawingTransformRep *)self p_siblingReps];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(CRLFreehandDrawingTransformRep **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (v10 != self && [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) isSelected]) {
          [v4 applyNewBoundsToRep:v10];
        }
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(CRLCanvasRep *)self invalidateKnobs];
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingTransformRep;
  [(CRLCanvasRep *)&v11 dynamicResizeDidEndWithTracker:v4];
}

- (BOOL)willHandleResizingLayoutForRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasRep *)self parentRep];
  id v6 = [v4 parentRep];

  return v5 == v6;
}

- (id)p_siblingReps
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = [(CRLCanvasRep *)self layout];
  id v5 = [v4 parent];
  id v6 = sub_10024715C(v3, v5);

  if (v6 && ([v6 info], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    double v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v10 = [v6 info];
    objc_super v11 = [v9 repForInfo:v10];
    long long v12 = sub_10024715C(v8, v11);

    long long v13 = [v12 childReps];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)additionalRepsToResize
{
  BOOL v3 = +[NSMutableSet set];
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLCanvasRep *)self info];
  id v6 = sub_1002469D0(v4, v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 representedShapeInfos];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [(CRLCanvasRep *)self interactiveCanvasController];
        long long v14 = [v13 repForInfo:v12];
        [v3 addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v3;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingTransformRep;
  [(CRLCanvasRep *)&v15 dynamicFreeTransformDidBeginWithTracker:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(CRLFreehandDrawingTransformRep *)self p_siblingReps];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(CRLFreehandDrawingTransformRep **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (v10 != self && [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) isSelected]) {
          [(CRLFreehandDrawingTransformRep *)v10 dynamicFreeTransformDidBeginWithTracker:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingTransformRep;
  [(CRLCanvasRep *)&v15 dynamicallyFreeTransformingWithTracker:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(CRLFreehandDrawingTransformRep *)self p_siblingReps];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(CRLFreehandDrawingTransformRep **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (v10 != self && [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) isSelected]) {
          [(CRLFreehandDrawingTransformRep *)v10 dynamicallyFreeTransformingWithTracker:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CRLFreehandDrawingTransformRep *)self p_siblingReps];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(CRLFreehandDrawingTransformRep **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (v10 != self && [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) isSelected]) {
          [v4 applyNewBoundsToRep:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(CRLCanvasRep *)self invalidateKnobs];
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingTransformRep;
  [(CRLCanvasRep *)&v11 dynamicFreeTransformDidEndWithTracker:v4];
}

- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasRep *)self parentRep];
  id v6 = [v4 parentRep];

  return v5 == v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayerRelativePath, 0);
  objc_storeStrong((id *)&self->_whitePathRenderable, 0);

  objc_storeStrong((id *)&self->_blackPathRenderable, 0);
}

@end