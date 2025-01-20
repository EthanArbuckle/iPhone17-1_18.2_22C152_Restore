@interface TSDShapeRep
+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4;
- (BOOL)canBeUsedForImageMask;
- (BOOL)canDrawInParallel;
- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3;
- (BOOL)canMakePathEditable;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)i_editMenuOverlapsEndKnobs;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isDraggable;
- (BOOL)isEditingChildRep;
- (BOOL)isEditingPath;
- (BOOL)isInvisible;
- (BOOL)isPathEditable;
- (BOOL)p_beginApplyOpacity:(CGContext *)a3 forDrawingInOneStep:(BOOL)a4;
- (BOOL)p_canApplyFillToLayer;
- (BOOL)p_canApplyStrokeToLayer;
- (BOOL)p_drawsSelfInOneStep;
- (BOOL)p_pathIsAxisAlignedRect;
- (BOOL)shadowOnChildrenDisabled;
- (BOOL)shouldExpandHitRegionWhenSmall;
- (BOOL)shouldHideSelectionHighlightDueToRectangularPath;
- (BOOL)shouldShowAdditionalKnobs;
- (BOOL)shouldShowAdvancedGradientKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowShadow;
- (BOOL)shouldShowSmartShapeKnobs;
- (CGAffineTransform)naturalToEditablePathSpaceTransform;
- (CGRect)clipRect;
- (CGRect)frameInUnscaledCanvas;
- (CGRect)layerFrameInScaledCanvas;
- (CGRect)layerFrameInScaledCanvasRelativeToParent;
- (CGRect)targetRectForEditMenu;
- (TSDShapeRep)initWithLayout:(id)a3 canvas:(id)a4;
- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4;
- (id)additionalLayersOverLayer;
- (id)editablePathSource;
- (id)imageOfStroke:(CGRect *)a3;
- (id)overlayLayers;
- (id)pathSourceForSelectionHighlightBehavior;
- (id)shapeInfo;
- (id)shapeLayout;
- (unint64_t)enabledKnobMask;
- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4;
- (void)addSelectionKnobsToArray:(id)a3;
- (void)didUpdateLayer:(id)a3;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)invalidateEffectLayersForChildren;
- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5;
- (void)p_beginDynamicallyResizingOrMovingLineEnd;
- (void)p_drawChildrenWithoutOpacityInContext:(CGContext *)a3;
- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6;
- (void)p_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 andStroke:(id)a5 inContext:(CGContext *)a6 useFastDrawing:(BOOL)a7;
- (void)p_endApplyOpacity:(CGContext *)a3 apply:(BOOL)a4;
- (void)p_endDynamicallyResizingOrMovingLineEnd;
- (void)processChangedProperty:(int)a3;
- (void)recursivelyDrawChildrenInContext:(CGContext *)a3;
- (void)setShadowOnChildrenDisabled:(BOOL)a3;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)willBeRemoved;
- (void)willUpdateLayer:(id)a3;
@end

@implementation TSDShapeRep

- (TSDShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDShapeRep;
  v4 = [(TSDRep *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    if (![(TSDShapeRep *)v4 shapeInfo] || ![(TSDShapeRep *)v5 shapeLayout])
    {

      v5 = 0;
    }
    objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeInfo](v5, "shapeInfo"), "fill"), "addInterest");
  }
  return v5;
}

- (id)shapeInfo
{
  objc_opt_class();
  [(TSDRep *)self info];

  return (id)TSUDynamicCast();
}

- (id)shapeLayout
{
  objc_opt_class();
  [(TSDRep *)self layout];

  return (id)TSUDynamicCast();
}

- (CGRect)frameInUnscaledCanvas
{
  v10.receiver = self;
  v10.super_class = (Class)TSDShapeRep;
  [(TSDRep *)&v10 frameInUnscaledCanvas];
  double v4 = v3;
  double v6 = v5;
  if (!self->mFrameInUnscaledCanvasIsValid)
  {
    id v7 = [(TSDShapeRep *)self shapeLayout];
    v8 = v7;
    if (v7) {
      [v7 transformInRoot];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    [v8 shapeFrameWithTransform:v9];
    self->mFrameInUnscaledCanvasRelativeToSuper = CGRectOffset(v11, -v4, -v6);
    self->mFrameInUnscaledCanvasIsValid = 1;
  }
  return CGRectOffset(self->mFrameInUnscaledCanvasRelativeToSuper, v4, v6);
}

- (CGRect)layerFrameInScaledCanvas
{
  if ([(TSDShapeRep *)self directlyManagesLayerContent])
  {
    mCanvas = self->super.super.mCanvas;
    [(TSDShapeRep *)self frameInUnscaledCanvas];
    -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
    double v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    double v13 = TSDAliasRoundedRectForScale(v5, v7, v9, v11, v12);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TSDShapeRep;
    [(TSDRep *)&v17 layerFrameInScaledCanvas];
  }
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)layerFrameInScaledCanvasRelativeToParent
{
  v15.receiver = self;
  v15.super_class = (Class)TSDShapeRep;
  [(TSDRep *)&v15 layerFrameInScaledCanvasRelativeToParent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(TSDShapeRep *)self isInvisible] && TSDRectHasNaNComponents())
  {
    double v4 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TSDShapeRep;
  -[TSDRep layoutInRootChangedFrom:to:translatedOnly:](&v7, sel_layoutInRootChangedFrom_to_translatedOnly_, a3, a4);
  if (!a5) {
    self->mFrameInUnscaledCanvasIsValid = 0;
  }
}

- (BOOL)directlyManagesLayerContent
{
  BOOL mDirectlyManagesLayerContent = self->mDirectlyManagesLayerContent;
  if ([(TSDShapeRep *)self isInvisible]
    || [(TSDShapeRep *)self p_canApplyStrokeToLayer]
    && [(TSDShapeRep *)self p_canApplyFillToLayer])
  {
    BOOL result = 1;
    self->BOOL mDirectlyManagesLayerContent = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDShapeRep;
    BOOL result = [(TSDRep *)&v6 directlyManagesLayerContent];
    self->BOOL mDirectlyManagesLayerContent = result;
    if (mDirectlyManagesLayerContent && !result)
    {
      id v5 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerForRep:self];
      [v5 setContents:0];
      [v5 setBackgroundColor:0];
      [v5 setBorderColor:0];
      [v5 setBorderWidth:0.0];
      objc_msgSend(v5, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
      return self->mDirectlyManagesLayerContent;
    }
  }
  return result;
}

- (CGRect)clipRect
{
  v2.receiver = self;
  v2.super_class = (Class)TSDShapeRep;
  [(TSDStyledRep *)&v2 clipRect];
  return CGRectInset(v3, -1.0, -1.0);
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)TSDShapeRep;
  [(TSDRep *)&v3 willBeRemoved];
  objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "fill"), "removeInterest");
}

- (BOOL)p_beginApplyOpacity:(CGContext *)a3 forDrawingInOneStep:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(TSDStyledRep *)self opacity];
  if (v7 >= 1.0) {
    return 0;
  }
  CGContextSetAlpha(a3, v7);
  if (a4) {
    return 0;
  }
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] size];
  double x = TSDRectWithSize();
  double y = v10;
  double width = v12;
  double height = v14;
  id v16 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if (v16)
  {
    objc_super v17 = v16;
    if ([v16 isFrame])
    {
      objc_msgSend(v17, "coverageRect:", x, y, width, height);
      double x = v18;
      double y = v19;
      double width = v20;
      double height = v21;
    }
  }
  v22 = (void *)TSUProtocolCast();
  if (v22)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = objc_msgSend(v22, "childReps", 0);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v27), "layout"), "frame");
          v41.origin.double x = v28;
          v41.origin.double y = v29;
          v41.size.double width = v30;
          v41.size.double height = v31;
          v38.origin.double x = x;
          v38.origin.double y = y;
          v38.size.double width = width;
          v38.size.double height = height;
          CGRect v39 = CGRectUnion(v38, v41);
          double x = v39.origin.x;
          double y = v39.origin.y;
          double width = v39.size.width;
          double height = v39.size.height;
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v25);
    }
  }
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  CGContextBeginTransparencyLayerWithRect(a3, v40, 0);
  return 1;
}

- (void)p_endApplyOpacity:(CGContext *)a3 apply:(BOOL)a4
{
  if (a4) {
    CGContextEndTransparencyLayer(a3);
  }
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  objc_opt_class();
  objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
  double v7 = (void *)TSUDynamicCast();
  if (v7)
  {
    [v7 addBitmapsToRenderingQualityInfo:a3 forShapeRep:self inContext:a4];
  }
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3
{
  BOOL v5 = [(TSDShapeRep *)self p_beginApplyOpacity:a3 forDrawingInOneStep:0];
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeRep;
  [(TSDRep *)&v6 recursivelyDrawChildrenInContext:a3];
  [(TSDShapeRep *)self p_endApplyOpacity:a3 apply:v5];
}

- (void)p_drawChildrenWithoutOpacityInContext:(CGContext *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDShapeRep;
  [(TSDRep *)&v3 recursivelyDrawChildrenInContext:a3];
}

- (void)drawInLayerContext:(CGContext *)a3
{
}

- (BOOL)isEditingChildRep
{
  return 0;
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  if (![(TSDShapeRep *)self isInvisible]
    || !v10 && ([(TSDStyledRep *)self opacity], v15 == 0.0))
  {
    [(TSDShapeRep *)self p_drawInContext:a3 withContent:v12 withStroke:v11 withOpacity:v10];
  }
  if (v8 && (!self->mShadowOnChildrenDisabled || !a7))
  {
    if (v10)
    {
      [(TSDShapeRep *)self recursivelyDrawChildrenInContext:a3];
    }
    else
    {
      [(TSDShapeRep *)self p_drawChildrenWithoutOpacityInContext:a3];
    }
  }
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  int v11 = [(TSDCanvas *)[(TSDRep *)self canvas] shouldSuppressBackgrounds];
  if (v11 != TSDCGContextHasBackgroundsSuppressed((uint64_t)a3))
  {
    BOOL v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDShapeRep p_drawInContext:withContent:withStroke:withOpacity:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeRep.m"), 436, @"Canvas and CGContext disagree about whether we are suppressing backgrounds");
  }
  id v14 = [(TSDShapeRep *)self shapeInfo];
  id v15 = [(TSDShapeRep *)self shapeLayout];
  uint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "path"), "CGPath");
  if ((v8 || v7) && v16)
  {
    CGContextSaveGState(a3);
    BOOL v17 = v6
       && [(TSDShapeRep *)self p_beginApplyOpacity:a3 forDrawingInOneStep:[(TSDShapeRep *)self p_drawsSelfInOneStep]];
    [v15 pathBounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGContextTranslateCTM(a3, -v18, -v20);
    [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
    double v23 = v22 * TSDCGContextAssociatedScreenScale((uint64_t)a3);
    long long v51 = *MEMORY[0x263F00148];
    long long v52 = v51;
    id v24 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
    if ([v24 shouldRender]) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }
    id v49 = 0;
    id v50 = 0;
    objc_msgSend(v15, "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v50, &v49, &v52, &v51, v23, v25);
    BOOL v47 = v17;
    if ([v15 pathIsOpen])
    {
      if ([v14 headLineEnd]) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = [v14 tailLineEnd] != 0;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
    uint64_t v27 = 0;
    if (v7 && v50)
    {
      if ([v50 shouldRender] && objc_msgSend(v50, "isFrame"))
      {
        CGFloat v28 = [TSDFrameRep alloc];
        uint64_t v27 = [(TSDFrameRep *)v28 initWithTSDFrame:v50];
      }
      else
      {
        uint64_t v27 = 0;
      }
    }
    if (v8)
    {
      if (v27 && [v50 hasMask])
      {
        CGContextSaveGState(a3);
        id v29 = v50;
        [v15 pathBoundsWithoutStroke];
        objc_msgSend(v29, "coverageRect:");
        -[TSDFrameRep applyMaskForRectWithCoverage:toContext:](v27, "applyMaskForRectWithCoverage:toContext:", a3);
        [(TSDFrameRep *)v27 blendMaskBeforeRenderingImageInContext:a3];
        int v30 = 1;
      }
      else
      {
        int v30 = 0;
      }
      CGFloat v31 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
      if (v31)
      {
        long long v32 = v31;
        if ((([v31 isClear] | v11) & 1) == 0)
        {
          [(TSDRep *)self boundsForStandardKnobs];
          CGRect v54 = CGRectOffset(v53, v19, v21);
          objc_msgSend(v32, "paintPath:naturalBounds:inContext:isPDF:", objc_msgSend(v49, "CGPath"), a3, -[TSDCanvas isDrawingIntoPDF](-[TSDRep canvas](self, "canvas"), "isDrawingIntoPDF"), v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
        }
      }
      if (v30) {
        CGContextRestoreGState(a3);
      }
    }
    if (v7 && v50 && [v50 shouldRender])
    {
      if (v27)
      {
        [v15 pathBoundsWithoutStroke];
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        CGContextGetCTM(&v48, a3);
        -[TSDFrameRep frameRect:inContext:withTotalScale:](v27, "frameRect:inContext:withTotalScale:", a3, v34, v36, v38, v40, TSDTransformScale(&v48.a));
      }
      else
      {
        if (v26 && (objc_msgSend((id)objc_msgSend(v50, "color"), "alphaComponent"), v41 < 1.0))
        {
          CGContextSaveGState(a3);
          objc_msgSend((id)objc_msgSend(v50, "color"), "alphaComponent");
          CGContextSetAlpha(a3, v42);
          CGContextBeginTransparencyLayer(a3, 0);
          id v43 = v50;
          if (v50 == v46)
          {
            id v43 = (id)[v46 mutableCopy];
            id v50 = v43;
          }
          uint64_t v44 = objc_msgSend((id)objc_msgSend(v43, "color"), "colorWithAlphaComponent:", 1.0);
          [v50 setColor:v44];
          int v45 = 1;
        }
        else
        {
          int v45 = 0;
        }
        objc_msgSend(v50, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", objc_msgSend(v49, "CGPath"), 0, a3, 0, 0, 0);
        if (v26)
        {
          CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(v50, "color"), "CGColor"));
          CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(v50, "color"), "CGColor"));
          [(TSDShapeRep *)self p_drawLineEndForHead:1 withDelta:v50 andStroke:a3 inContext:0 useFastDrawing:v51];
          [(TSDShapeRep *)self p_drawLineEndForHead:0 withDelta:v50 andStroke:a3 inContext:0 useFastDrawing:v52];
        }
        if (v45)
        {
          CGContextEndTransparencyLayer(a3);
          CGContextRestoreGState(a3);
        }
      }
    }

    if (v6) {
      [(TSDShapeRep *)self p_endApplyOpacity:a3 apply:v47];
    }
    CGContextRestoreGState(a3);
  }
}

- (id)imageOfStroke:(CGRect *)a3
{
  CGFloat v5 = *MEMORY[0x263F001A8];
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v9 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if (v9 && [v9 shouldRender])
  {
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "frame");
    CGFloat v5 = v10;
    CGFloat v6 = v11;
    CGFloat v7 = v12;
    CGFloat v8 = v13;
    id v14 = TSDBitmapContextCreate(11, v12);
    [(TSDShapeRep *)self p_drawInContext:v14 withContent:0 withStroke:1 withOpacity:0];
    Image = CGBitmapContextCreateImage(v14);
    uint64_t v16 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:Image];
    CGContextRelease(v14);
    CGImageRelease(Image);
  }
  else
  {
    uint64_t v16 = 0;
  }
  a3->origin.double x = v5;
  a3->origin.double y = v6;
  a3->size.double width = v7;
  a3->size.double height = v8;
  return v16;
}

- (void)willUpdateLayer:(id)a3
{
  id v5 = [(TSDShapeRep *)self shapeInfo];
  CGFloat v6 = (void *)[v5 shadow];
  CGFloat v7 = objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "fill");
  int v8 = [v7 isOpaque];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 |= objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "imageData"), "filename"), "pathExtension"), "lowercaseString"), "isEqualToString:", @"jpg");
  }
  if (v7
    && v8
    && (([v5 opacity], v9 == 1.0) || fabs(v9 + -1.0) < 0.000000999999997)
    && (objc_msgSend((id)objc_msgSend(v5, "stroke"), "isFrame") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v5, "geometry"), "angle"), v10 == 0.0))
  {
    if (v6 && [v6 isEnabled])
    {
      uint64_t v11 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathSource");
      if (v11)
      {
        double v12 = (void *)v11;
        [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
        CGFloat v14 = v13;
        memset(&v40, 0, sizeof(v40));
        id v15 = (void *)[v5 geometry];
        objc_msgSend((id)objc_msgSend(v5, "geometry"), "size");
        double v17 = v16;
        objc_msgSend((id)objc_msgSend(v5, "geometry"), "size");
        if (v15) {
          objc_msgSend(v15, "transformBasedOnRect:", 0.0, 0.0, v17, v18);
        }
        else {
          memset(&v40, 0, sizeof(v40));
        }
        CGAffineTransform v38 = v40;
        memset(&v39, 0, sizeof(v39));
        CGAffineTransformScale(&v39, &v38, v14, v14);
        double v22 = objc_msgSend((id)objc_msgSend(v12, "interiorWrapPath"), "copy");
        CGAffineTransform v38 = v39;
        [v22 transformUsingAffineTransform:&v38];
        double v23 = (void *)[v5 stroke];
        if (![v23 shouldRender]) {
          double v23 = 0;
        }
        double v26 = 0.0;
        if (v23)
        {
          if (([v23 isFrame] & 1) == 0)
          {
            [v23 width];
            double v24 = v14 * v27;
            double v26 = 1.0;
            if (v24 > 1.0)
            {
              TSURound();
              double v26 = v24;
            }
          }
        }
        *(float *)&double v24 = v14;
        *(float *)&double v25 = v26;
        CGFloat v28 = (void *)[v22 aliasedPathWithViewScale:v24 effectiveStrokeWidth:v25];
        if (v26 > 0.0)
        {
          CGFloat v29 = v26 * 0.5;
          CGFloat v28 = objc_msgSend(v28, "bezierPathByOffsettingPath:joinStyle:withThreshold:", (int)objc_msgSend(v23, "join"), v29, 1.0);
          CGAffineTransformMakeTranslation(&v37, v29, v29);
          [v28 transformUsingAffineTransform:&v37];
        }
        objc_msgSend(a3, "setShadowPath:", objc_msgSend(v28, "CGPath"));

        [v6 opacity];
        *(float *)&double v30 = v30;
        [a3 setShadowOpacity:v30];
        [v6 radius];
        [a3 setShadowRadius:v14 * v31 * 0.5];
        objc_msgSend(a3, "setShadowColor:", objc_msgSend(v6, "color"));
        [v6 angle];
        double v33 = v32;
        objc_msgSend((id)objc_msgSend(v5, "geometry"), "angle");
        double v35 = v33 - v34;
        v38.a = 0.0;
        v38.b = 0.0;
        [v6 offset];
        TSDOriginRotate(&v38.a, v14 * v36, v35 * 0.0174532925);
        objc_msgSend(a3, "setShadowOffset:", v38.a, v38.b);
      }
    }
    else
    {
      [a3 setShadowOpacity:0.0];
      [a3 setShadowPath:0];
    }
  }
  else if (v6 && [v6 isEnabled])
  {
    if (!self->super.mShadowLayer)
    {
      CGFloat v19 = objc_alloc_init(TSDTilingLayer);
      self->super.mShadowLayer = &v19->super;
      [(TSDTilingLayer *)v19 setDelegate:self];
      [(CALayer *)self->super.mShadowLayer setNeedsDisplay];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        mShadowLayer = self->super.mShadowLayer;
        [(CALayer *)mShadowLayer setTilingMode:1];
      }
    }
  }
  else
  {
    CGFloat v21 = self->super.mShadowLayer;
    if (v21)
    {
      [(CALayer *)v21 setDelegate:0];

      self->super.mShadowLayer = 0;
    }
  }
}

- (void)didUpdateLayer:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TSDShapeRep;
  -[TSDStyledRep didUpdateLayer:](&v16, sel_didUpdateLayer_);
  [(TSDStyledRep *)self opacity];
  double v6 = v5;
  [a3 opacity];
  double v8 = v7;
  if (v6 != v8)
  {
    *(float *)&double v8 = v6;
    [a3 setOpacity:v8];
  }
  if ([(TSDShapeRep *)self isInvisible])
  {
    [a3 setContents:0];
  }
  else if (![(TSDShapeRep *)self directlyManagesLayerContent] {
         && ([a3 tilingSafeHasContents] & 1) == 0)
  }
  {
    [a3 setNeedsDisplay];
  }
  if ([(TSDShapeRep *)self directlyManagesLayerContent])
  {
    [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
    double v10 = v9;
    if ([(TSDShapeRep *)self p_canApplyFillToLayer])
    {
      if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"))
      {
        objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"), "applyToCALayer:withScale:", a3, v10);
      }
      else
      {
        [a3 setContents:0];
        [a3 setBackgroundColor:0];
      }
    }
    if ([(TSDShapeRep *)self p_canApplyStrokeToLayer])
    {
      if ([(TSDLayout *)[(TSDRep *)self layout] stroke])
      {
        [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
        id v15 = 0;
        objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout", 0, 0, 0, 0, 0), "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v15, &v14, &v13, &v12, v10 * v11);
        objc_msgSend(v15, "applyToRepRenderable:withScale:", +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", a3), v10);
      }
      else
      {
        [a3 setBorderColor:0];
        [a3 setBorderWidth:0.0];
      }
    }
  }
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(TSDShapeRep *)self shapeLayout];
  int v7 = [v6 pathIsOpen];
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v9 = 40.0 / v8;
  [(TSDRep *)self naturalBounds];
  if (v7) {
    *(CGRect *)&uint64_t v10 = CGRectInset(*(CGRect *)&v10, -v9, -v9);
  }
  v28.double x = x;
  v28.double y = y;
  BOOL v14 = CGRectContainsPoint(*(CGRect *)&v10, v28);
  if (v14)
  {
    id v15 = [(TSDShapeRep *)self shapeInfo];
    uint64_t v16 = objc_msgSend((id)objc_msgSend(v6, "path"), "CGPath");
    if (!v16)
    {
LABEL_25:
      LOBYTE(v14) = v16 != 0;
      return v14;
    }
    double v17 = TSDBitmapContextCreate(2, 1.0);
    Data = CGBitmapContextGetData(v17);
    [v6 pathBounds];
    CGContextTranslateCTM(v17, -v19, -v20);
    CGContextTranslateCTM(v17, -x, -y);
    if (([v6 pathIsLineSegment] & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "paintPath:inContext:", v16, v17);
      if (*Data)
      {
        LODWORD(v16) = 1;
LABEL_24:
        CGContextRelease(v17);
        goto LABEL_25;
      }
    }
    CGFloat v21 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
    if ([(TSDStroke *)v21 drawsOutsideStrokeBounds])
    {
      double v22 = 0;
      if (!v7) {
        goto LABEL_10;
      }
    }
    else
    {
      double v22 = objc_alloc_init(TSDMutableStroke);
      [(TSDMutableStroke *)v21 width];
      -[TSDMutableStroke setWidth:](v22, "setWidth:");
      CGFloat v21 = v22;
      if (!v7)
      {
LABEL_10:
        double v23 = 0;
        if (!v21) {
          goto LABEL_22;
        }
        goto LABEL_16;
      }
    }
    CGFloat v21 = (TSDMutableStroke *)[(TSDMutableStroke *)v21 mutableCopy];
    [(TSDMutableStroke *)v21 width];
    if (v24 < v9) {
      [(TSDMutableStroke *)v21 setWidth:v9];
    }
    [(TSDMutableStroke *)v21 setPattern:+[TSDStrokePattern solidPattern]];
    -[TSDMutableStroke setColor:](v21, "setColor:", [MEMORY[0x263F7C808] blackColor]);
    [(TSDMutableStroke *)v21 setCap:1];
    double v23 = v21;
    if (!v21) {
      goto LABEL_22;
    }
LABEL_16:
    if ([(TSDStroke *)v21 shouldRender])
    {
      [(TSDStroke *)v21 paintPath:v16 wantsInteriorStroke:0 inContext:v17 useFastDrawing:1 parameterized:0 shouldReverseDrawOrder:0];
      LODWORD(v16) = *Data != 0;
      if (*Data || ((v7 ^ 1) & 1) != 0) {
        goto LABEL_23;
      }
      if ([v15 headLineEnd] || objc_msgSend(v15, "tailLineEnd"))
      {
        CGContextSetStrokeColorWithColor(v17, (CGColorRef)[(TSUColor *)[(TSDMutableStroke *)v21 color] CGColor]);
        double v25 = *MEMORY[0x263F00148];
        double v26 = *(double *)(MEMORY[0x263F00148] + 8);
        -[TSDShapeRep p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 1, v21, v17, 1, *MEMORY[0x263F00148], v26);
        -[TSDShapeRep p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 0, v21, v17, 1, v25, v26);
        LODWORD(v16) = *Data != 0;
LABEL_23:

        goto LABEL_24;
      }
    }
LABEL_22:
    LODWORD(v16) = 0;
    goto LABEL_23;
  }
  return v14;
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  id v2 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if (v2) {
    return [v2 shouldRender] ^ 1;
  }
  else {
    return 1;
  }
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "stroke");
  if (v8)
  {
    [v8 width];
    double v10 = v9 * 0.5;
  }
  else
  {
    double v10 = 1.0;
  }
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  if (6.0 / v11 > v10)
  {
    [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
    double v10 = 6.0 / v12;
  }
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] size];
  v18.origin.double x = TSDRectWithSize();
  CGRect v19 = CGRectInset(v18, -v10, -v10);
  v17.double x = x;
  v17.double y = y;
  if (!CGRectContainsPoint(v19, v17)) {
    return 3.40282347e38;
  }
  objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathBounds");
  double v14 = TSDAddPoints(x, y, v13);
  objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), "distanceToPoint:elementIndex:tValue:threshold:", 0, 0, v14, v15, 0.0);
  if (a4)
  {
    if (result < v10) {
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "i_wrapPath"), "copy");
  double v9 = [(TSDRep *)self layout];
  if (v9) {
    [(TSDAbstractLayout *)v9 transformInRoot];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [v8 transformUsingAffineTransform:v12];
  char v10 = objc_msgSend(v8, "intersectsRect:hasFill:", 1, x, y, width, height);

  return v10;
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDShapeRep;
  -[TSDStyledRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if ((a3 - 516) <= 0xA && ((1 << (a3 - 4)) & 0x4D3) != 0)
  {
    [(TSDStyledRep *)self setNeedsDisplay];
    if ((a3 - 517) <= 9 && ((1 << (a3 - 5)) & 0x261) != 0)
    {
      [(TSDRep *)self invalidateKnobPositions];
      self->mFrameInUnscaledCanvasIsValid = 0;
      if (a3 == 526) {
        [(TSDRep *)self invalidateKnobs];
      }
    }
  }
}

- (BOOL)isDraggable
{
  return 1;
}

- (CGRect)targetRectForEditMenu
{
  double v3 = *MEMORY[0x263F001A0];
  double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment"))
  {
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "headPoint");
    double v8 = v7;
    double v10 = v9;
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "tailPoint");
    double v12 = v11;
    double v14 = v13;
    if (![(TSDShapeRep *)self i_editMenuOverlapsEndKnobs])
    {
      double v15 = TSDMixPoints(v8, v10, v12, v14, 0.5);
      double v3 = TSDRectWithCenterAndSize(v15, v16, 1.0);
      double v4 = v17;
      double v5 = v18;
      double v6 = v19;
    }
  }
  double v20 = v3;
  double v21 = v4;
  double v22 = v5;
  double v23 = v6;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)shouldShowSelectionHighlight
{
  if (!objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment")
    || (BOOL v3 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] usesAlternateDrawableSelectionHighlight]))
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDShapeRep;
    LOBYTE(v3) = [(TSDStyledRep *)&v5 shouldShowSelectionHighlight];
  }
  return v3;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  int v3 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "supportsResize");
  if (v3)
  {
    if ([(TSDShapeRep *)self isInvisible])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)TSDShapeRep;
      LOBYTE(v3) = [(TSDStyledRep *)&v5 shouldHideSelectionHighlightDueToRectangularPath];
    }
  }
  return v3;
}

- (id)pathSourceForSelectionHighlightBehavior
{
  id v2 = [(TSDShapeRep *)self shapeLayout];

  return (id)[v2 pathSource];
}

- (BOOL)canBeUsedForImageMask
{
  objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), "bounds");
  double v4 = v3;
  double v6 = v5;
  int v7 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "widthValid");
  if (v7)
  {
    int v7 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "heightValid");
    if (v7)
    {
      if ([(TSDRep *)self isPlaceholder])
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        unsigned int v8 = (v6 > 0.0) & ~objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), "isLineSegment");
        if (v4 > 0.0) {
          LOBYTE(v7) = v8;
        }
        else {
          LOBYTE(v7) = 0;
        }
      }
    }
  }
  return v7;
}

- (unint64_t)enabledKnobMask
{
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment")) {
    return 3072;
  }
  if (!objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "supportsResize")) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDShapeRep;
  return [(TSDRep *)&v4 enabledKnobMask];
}

- (void)addSelectionKnobsToArray:(id)a3
{
  BOOL v5 = [(TSDShapeRep *)self shouldShowSmartShapeKnobs];
  id v6 = [(TSDShapeRep *)self shapeLayout];
  int v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 numberOfControlKnobs];
    if (v8)
    {
      uint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        double v11 = [TSDKnob alloc];
        [v7 getControlKnobPosition:i + 12];
        double v12 = -[TSDKnob initWithType:position:radius:tag:onRep:](v11, "initWithType:position:radius:tag:onRep:", 0, i + 12, self);
        [a3 addObject:v12];
      }
    }
  }
  else
  {
    objc_opt_class();
    [v7 pathSource];
    if (TSUDynamicCast())
    {
      double v13 = [TSDKnob alloc];
      [v7 getControlKnobPosition:12];
      double v14 = -[TSDKnob initWithType:position:radius:tag:onRep:](v13, "initWithType:position:radius:tag:onRep:", 0, 12, self);
      [a3 addObject:v14];
    }
  }
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment"))
  {
    unint64_t v15 = [(TSDShapeRep *)self enabledKnobMask];
    uint64_t v16 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] defaultKnobTypeForRep:self];
    double v17 = *MEMORY[0x263F00148];
    double v18 = *(double *)(MEMORY[0x263F00148] + 8);
    for (uint64_t j = 10; j != 12; ++j)
    {
      if ((TSDMaskForKnob(j) & v15) != 0)
      {
        double v20 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSDKnob alloc], "initWithType:position:radius:tag:onRep:", v16, j, self, v17, v18, 15.0);
        [a3 addObject:v20];
      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)TSDShapeRep;
  [(TSDRep *)&v28 addSelectionKnobsToArray:a3];
  if ([(TSDShapeRep *)self shouldShowAdvancedGradientKnobs])
  {
    objc_opt_class();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    double v21 = (void *)TSUDynamicCast();
    double v22 = [TSDKnob alloc];
    if ([v21 gradientType] == 1) {
      uint64_t v23 = 25;
    }
    else {
      uint64_t v23 = 24;
    }
    double v24 = *MEMORY[0x263F00148];
    double v25 = *(double *)(MEMORY[0x263F00148] + 8);
    double v26 = -[TSDKnob initWithType:position:radius:tag:onRep:](v22, "initWithType:position:radius:tag:onRep:", 0, v23, self, *MEMORY[0x263F00148], v25, 15.0);
    [a3 addObject:v26];

    double v27 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSDKnob alloc], "initWithType:position:radius:tag:onRep:", 0, 26, self, v24, v25, 15.0);
    [a3 addObject:v27];
  }
}

- (BOOL)shouldShowAdditionalKnobs
{
  [(TSDRep *)self boundsForStandardKnobs];
  double v4 = v3;
  double v6 = v5;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  BOOL v9 = TSDMultiplySizeScalar(v4, v6, v7) < 60.0 || v8 < 60.0;
  if (!v9
    && ![(TSDRep *)self isPlaceholder]
    && (([(TSDShapeRep *)self enabledKnobMask] & 0x200) != 0
     || ([(TSDShapeRep *)self enabledKnobMask] & 0x80) != 0))
  {
    return ![(TSDRep *)self isLocked];
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldShowAdvancedGradientKnobs
{
  return 0;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  BOOL v3 = [(TSDShapeRep *)self shouldShowAdditionalKnobs];
  if (v3) {
    LOBYTE(v3) = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "numberOfControlKnobs") != 0;
  }
  return v3;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  if ((unint64_t)[a3 tag] >= 0xC && (unint64_t)objc_msgSend(a3, "tag") < 0x11) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeRep;
  return [(TSDRep *)&v6 canUseSpecializedHitRegionForKnob:a3];
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  if ([a3 tag] == 22) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeRep;
  return [(TSDRep *)&v6 directlyManagesVisibilityOfKnob:a3];
}

- (void)updatePositionsOfKnobs:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  v72.receiver = self;
  v72.super_class = (Class)TSDShapeRep;
  -[TSDRep updatePositionsOfKnobs:](&v72, sel_updatePositionsOfKnobs_);
  id v5 = [(TSDShapeRep *)self shapeLayout];
  if ([v5 pathIsLineSegment])
  {
    [v5 pathBounds];
    double v7 = v6;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v68 objects:v75 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v69 != v10) {
            objc_enumerationMutation(a3);
          }
          double v12 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          uint64_t v13 = [v12 tag];
          uint64_t v14 = [v12 tag];
          if (v13 == 11 || v14 == 10)
          {
            if (v13 == 11) {
              [v5 headPoint];
            }
            else {
              [v5 tailPoint];
            }
            objc_msgSend(v12, "setPosition:", TSDSubtractPoints(v16, v17, v7));
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v68 objects:v75 count:16];
      }
      while (v9);
    }
  }
  if ([(TSDShapeRep *)self shouldShowSmartShapeKnobs]
    || (objc_opt_class(), [v5 pathSource], TSUDynamicCast()))
  {
    [(TSDRep *)self trackingBoundsForStandardKnobs];
    double v19 = v18;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v20 = [a3 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v65 != v22) {
            objc_enumerationMutation(a3);
          }
          double v24 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if ((unint64_t)[v24 tag] >= 0xC && (unint64_t)objc_msgSend(v24, "tag") <= 0x10)
          {
            objc_msgSend(v5, "getControlKnobPosition:", objc_msgSend(v24, "tag"));
            objc_msgSend(v24, "setPosition:", TSDAddPoints(v25, v26, v19));
          }
        }
        uint64_t v21 = [a3 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v21);
    }
  }
  if ([(TSDShapeRep *)self shouldShowAdvancedGradientKnobs])
  {
    objc_opt_class();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    double v27 = (void *)TSUDynamicCast();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "boundsForStandardKnobs");
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    objc_msgSend(v27, "startPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v28, v30, v32, v34);
    double v37 = v36;
    double v39 = v38;
    objc_msgSend(v27, "endPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v29, v31, v33, v35);
    double v41 = v40;
    double v43 = v42;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v44 = [a3 countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      double v46 = TSDAddPoints(v41, v43, v29);
      double v48 = v47;
      double v49 = TSDAddPoints(v37, v39, v29);
      double v51 = v50;
      uint64_t v52 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v61 != v52) {
            objc_enumerationMutation(a3);
          }
          CGRect v54 = *(void **)(*((void *)&v60 + 1) + 8 * k);
          uint64_t v55 = [v54 tag];
          double v56 = v49;
          double v57 = v51;
          if (v55 != 24)
          {
            uint64_t v58 = objc_msgSend(v54, "tag", v49, v51);
            double v56 = v49;
            double v57 = v51;
            if (v58 != 25)
            {
              uint64_t v59 = objc_msgSend(v54, "tag", v49, v51);
              double v56 = v46;
              double v57 = v48;
              if (v59 != 26) {
                continue;
              }
            }
          }
          objc_msgSend(v54, "setPosition:", v56, v57);
        }
        uint64_t v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v60, v73, 16, v56, v57);
      }
      while (v45);
    }
  }
}

- (id)additionalLayersOverLayer
{
  v3.receiver = self;
  v3.super_class = (Class)TSDShapeRep;
  return (id)objc_msgSend(-[TSDRep additionalLayersOverLayer](&v3, sel_additionalLayersOverLayer), "mutableCopy");
}

- (id)overlayLayers
{
  v36.receiver = self;
  v36.super_class = (Class)TSDShapeRep;
  objc_super v3 = objc_msgSend(-[TSDRep overlayLayers](&v36, sel_overlayLayers), "mutableCopy");
  if ([(TSDRep *)self isSelectedIgnoringLocking]
    && [(TSDShapeRep *)self shouldShowAdvancedGradientKnobs])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F15880]);
    [v4 setFillColor:0];
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithWhite:alpha:", 0.8, 0.66), "CGColor"));
    [v4 setLineWidth:1.0];
    objc_opt_class();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    id v5 = (void *)TSUDynamicCast();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "boundsForStandardKnobs");
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    objc_msgSend(v5, "startPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    objc_msgSend(v5, "endPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v7, v9, v11, v13);
    double v19 = v18;
    double v21 = v20;
    double v22 = TSDAddPoints(v15, v17, v7);
    CGFloat v24 = v23;
    double v25 = TSDAddPoints(v19, v21, v7);
    CGFloat v27 = v26;
    memset(&m, 0, sizeof(m));
    double v28 = [(TSDRep *)self layout];
    if (v28) {
      [(TSDAbstractLayout *)v28 transformInRoot];
    }
    else {
      memset(&m, 0, sizeof(m));
    }
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
    CGAffineTransformMakeScale(&t2, v29, v29);
    CGAffineTransform v32 = m;
    CGAffineTransformConcat(&v34, &v32, &t2);
    CGAffineTransform m = v34;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, &m, v22, v24);
    CGPathAddLineToPoint(Mutable, &m, v25, v27);
    [v4 setPath:Mutable];
    [v3 insertObject:v4 atIndex:0];

    CGPathRelease(Mutable);
  }
  return v3;
}

- (void)setShadowOnChildrenDisabled:(BOOL)a3
{
  if (self->mShadowOnChildrenDisabled != a3)
  {
    self->mShadowOnChildrenDisabled = a3;
    [(TSDStyledRep *)self invalidateShadowLayer];
  }
}

- (void)invalidateEffectLayersForChildren
{
  if (!self->mShadowOnChildrenDisabled
    && (objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"), "isOpaque") & 1) == 0)
  {
    [(TSDStyledRep *)self invalidateShadowLayer];
  }
  objc_super v3 = [(TSDStyledRep *)self reflectionLayer];

  [(CALayer *)v3 setNeedsDisplay];
}

- (BOOL)isInvisible
{
  id v3 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  id v4 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "isInvisible")) {
    return 1;
  }
  [(TSDStyledRep *)self opacity];
  if (v5 == 0.0) {
    return 1;
  }
  if (v3 && ([v3 shouldRender] & 1) != 0) {
    return 0;
  }
  if (!v4) {
    return 1;
  }

  return [v4 isClear];
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (BOOL)isPathEditable
{
  return 0;
}

- (BOOL)canMakePathEditable
{
  return 1;
}

- (id)editablePathSource
{
  id v2 = [(TSDShapeRep *)self shapeLayout];

  return (id)[v2 editablePathSource];
}

- (CGAffineTransform)naturalToEditablePathSpaceTransform
{
  [(TSDRep *)self boundsForStandardKnobs];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  double v9 = objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "pathSource");
  if (v9)
  {
    [v9 pathFlipTransform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  CGAffineTransformMakeTranslation(&t2, v6, v8);
  long long v10 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformConcat(&v15, &v13, &t2);
  long long v12 = *(_OWORD *)&v15.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v15.tx;
  return result;
}

- (BOOL)isEditingPath
{
  return 0;
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "shapeInfo"), "mixingTypeWithObject:", objc_msgSend(a4, "shapeInfo"));
  double result = 0.0;
  if (v6 != 1)
  {
    if (v6 == 5) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    if (TSDMixingTypeWithPossiblyNilObjects(objc_msgSend((id)objc_msgSend(a3, "shapeInfo", 0.0), "pathSource"), objc_msgSend((id)objc_msgSend(a4, "shapeInfo"), "pathSource")) != 1)double v8 = v8 + 3.0; {
    int v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "shapeInfo"), "style"), "isEqual:", objc_msgSend((id)objc_msgSend(a4, "shapeInfo"), "style"));
    }
    double v10 = v8 + 1.0;
    if (!v9) {
      double v10 = v8;
    }
    return v10 / 5.0;
  }
  return result;
}

- (void)p_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 andStroke:(id)a5 inContext:(CGContext *)a6 useFastDrawing:(BOOL)a7
{
  BOOL v7 = a7;
  double x = a4.x;
  BOOL v11 = a3;
  id v12 = [(TSDShapeRep *)self shapeLayout];
  CGAffineTransform v13 = v12;
  if (v11)
  {
    uint64_t v14 = [v12 strokeHeadLineEnd];
    if (!v14) {
      return;
    }
    uint64_t v15 = v14;
    [v13 headLineEndPoint];
    double v17 = v16;
    double v19 = v18;
    [v13 headLineEndAngle];
  }
  else
  {
    uint64_t v21 = [v12 strokeTailLineEnd];
    if (!v21) {
      return;
    }
    uint64_t v15 = v21;
    [v13 tailLineEndPoint];
    double v17 = v22;
    double v19 = v23;
    [v13 tailLineEndAngle];
  }
  double v24 = v20;
  double v25 = TSDAddPoints(v17, v19, x);
  double v27 = v26;
  [v13 lineEndScale];

  objc_msgSend(a5, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v15, a6, v7, v25, v27, v24, v28);
}

- (void)p_beginDynamicallyResizingOrMovingLineEnd
{
  if (objc_msgSend(-[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"), "shouldRender"))
  {
    [(TSDStyledRep *)self setNeedsDisplay];
  }
}

- (void)p_endDynamicallyResizingOrMovingLineEnd
{
  if (objc_msgSend(-[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"), "shouldRender"))
  {
    [(TSDStyledRep *)self setNeedsDisplay];
  }
}

- (BOOL)p_pathIsAxisAlignedRect
{
  id v3 = [(TSDShapeRep *)self shapeInfo];
  id v4 = [(TSDShapeRep *)self shapeLayout];
  if ([v4 pathIsOpen])
  {
    if ([v3 headLineEnd]) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = [v3 tailLineEnd] != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  uint64_t v6 = (void *)[v4 path];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  if (![(TSDRep *)self isInDynamicOperation])
  {
    if (v4)
    {
      [v4 transformInRoot];
      if (!v5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
LABEL_13:
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    if (!v5) {
      goto LABEL_14;
    }
LABEL_12:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (!v4) {
    goto LABEL_13;
  }
  [v4 originalTransformInRoot];
  if (v5) {
    goto LABEL_12;
  }
LABEL_14:
  int v7 = [v6 isRectangular];
  if (v7)
  {
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    LOBYTE(v7) = TSDIsTransformAxisAlignedUnflipped((double *)v9);
  }
  return v7;
}

- (BOOL)p_canApplyStrokeToLayer
{
  BOOL v3 = [(TSDShapeRep *)self p_pathIsAxisAlignedRect];
  if (v3)
  {
    id v4 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
    if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"))
    {
      [(TSDStyledRep *)self opacity];
      BOOL v6 = v5 == 1.0;
      if (!v4) {
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v6 = 1;
      if (!v4) {
        goto LABEL_8;
      }
    }
    if ([v4 shouldRender])
    {
      LOBYTE(v3) = [v4 canApplyDirectlyToRepRenderable] & v6;
      return v3;
    }
LABEL_8:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)p_canApplyFillToLayer
{
  int v3 = [(TSDShapeRep *)self p_pathIsAxisAlignedRect];
  if (v3)
  {
    id v4 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    if (v4 && (double v5 = v4, ([v4 isClear] & 1) == 0))
    {
      LOBYTE(v3) = [v5 canApplyToCALayer];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)p_drawsSelfInOneStep
{
  id v3 = [(TSDShapeRep *)self shapeInfo];
  id v4 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
  double v5 = v4;
  if (v4) {
    int v6 = [v4 isClear] ^ 1;
  }
  else {
    int v6 = 0;
  }
  int v7 = (void *)[v3 stroke];
  if (![v7 shouldRender]) {
    int v7 = 0;
  }
  if (v7) {
    int v8 = v6 ^ 1;
  }
  else {
    int v8 = 1;
  }
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsOpen"))
  {
    if ([v3 headLineEnd]) {
      return 0;
    }
    BOOL v9 = [v3 tailLineEnd] == 0;
  }
  else
  {
    BOOL v9 = 1;
  }
  if ((v8 & v9) != 1) {
    return 0;
  }
  if (v6)
  {
    long long v10 = v5;
  }
  else
  {
    if (!v7) {
      return 1;
    }
    long long v10 = v7;
  }

  return [v10 drawsInOneStep];
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(TSDShapeRep *)self p_drawsSelfInOneStep];
  if (v4 && v3)
  {
    double v5 = (void *)TSUProtocolCast();
    if (v5) {
      LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v5, "childReps"), "count") == 0;
    }
    else {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (BOOL)shouldShowShadow
{
  v5.receiver = self;
  v5.super_class = (Class)TSDShapeRep;
  BOOL v3 = [(TSDStyledRep *)&v5 shouldShowShadow];
  if (v3)
  {
    if ([(TSDCanvas *)[(TSDRep *)self canvas] shouldSuppressBackgrounds]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(TSDShapeRep *)self shadowOnChildrenDisabled];
    }
  }
  return v3;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  int v3 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment");
  if (v3)
  {
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "headPoint");
    double v5 = v4;
    double v7 = v6;
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "tailPoint");
    double v10 = TSDMixPoints(v5, v7, v8, v9, 0.5);
    double v12 = v11;
    CGAffineTransform v13 = [(TSDRep *)self canvas];
    uint64_t v14 = [(TSDRep *)self canvas];
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v10, v12);
    -[TSDCanvas convertUnscaledToBoundsPoint:](v14, "convertUnscaledToBoundsPoint:");
    -[TSDCanvas i_approximateScaledFrameOfEditingMenuAtPoint:](v13, "i_approximateScaledFrameOfEditingMenuAtPoint:");
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v23 = [(TSDRep *)self canvas];
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "headPoint");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    -[TSDCanvas convertUnscaledToBoundsPoint:](v23, "convertUnscaledToBoundsPoint:");
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    double v28 = [(TSDRep *)self canvas];
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "tailPoint");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    -[TSDCanvas convertUnscaledToBoundsPoint:](v28, "convertUnscaledToBoundsPoint:");
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    v42.origin.double x = v16;
    v42.origin.double y = v18;
    v42.size.double width = v20;
    v42.size.double height = v22;
    v41.double x = v25;
    v41.double y = v27;
    if (CGRectContainsPoint(v42, v41))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      CGFloat v33 = v16;
      CGFloat v34 = v18;
      CGFloat v35 = v20;
      CGFloat v36 = v22;
      uint64_t v37 = v30;
      uint64_t v38 = v32;
      LOBYTE(v3) = CGRectContainsPoint(*(CGRect *)&v33, *(CGPoint *)&v37);
    }
  }
  return v3;
}

- (BOOL)shadowOnChildrenDisabled
{
  return self->mShadowOnChildrenDisabled;
}

@end