@interface CRLShapeRep
- (BOOL)allowsColorDrop;
- (BOOL)canBeUsedForImageMask;
- (BOOL)canBeginEditing;
- (BOOL)canDrawInParallel;
- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3;
- (BOOL)canDrawWithOtherShapeRep:(id)a3;
- (BOOL)canMakePathEditable;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)directlyManagesLayerContent;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)i_beginApplyOpacity:(CGContext *)a3 forDrawingInOneStep:(BOOL)a4;
- (BOOL)i_editMenuOverlapsEndKnobs;
- (BOOL)i_isCurrentlyBeingFreehandDrawn;
- (BOOL)i_targetsDropsToStroke;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isEditingChildRep;
- (BOOL)isEditingPath;
- (BOOL)isInvisible;
- (BOOL)isMoreOptimalToDrawWithOtherShapeRepsIfPossible;
- (BOOL)isPartiallyAnimated;
- (BOOL)isPathEditable;
- (BOOL)p_canApplyFillToRenderable;
- (BOOL)p_canApplyStrokeToRenderable;
- (BOOL)p_currentlyDrawingSomeOtherShape;
- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4 withPrecision:(BOOL)a5;
- (BOOL)p_isInsidePlayingFreehandDrawing;
- (BOOL)p_parentFreehandDrawingIsSelected;
- (BOOL)p_pathIsAxisAlignedRect;
- (BOOL)p_shouldDrawStrokeWide:(id)a3;
- (BOOL)p_shouldSkipRenderableRecalculations;
- (BOOL)p_shouldUpgradeStrokeForPlayback:(id)a3;
- (BOOL)selectionIsAppropriateToShowInvisiblePathHighlight;
- (BOOL)shadowOnChildrenDisabled;
- (BOOL)shouldExpandHitRegionWhenSmall;
- (BOOL)shouldHideSelectionHighlightDueToRectangularPath;
- (BOOL)shouldHitTestWithFill;
- (BOOL)shouldIgnoreICCSuppressSelectionKnobs;
- (BOOL)shouldSetPathSourceWhenChangingInfoGeometry;
- (BOOL)shouldShowAdditionalKnobs;
- (BOOL)shouldShowAdvancedGradientKnobs;
- (BOOL)shouldShowInvisiblePathHighlight;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowShadow;
- (BOOL)shouldShowSmartShapeKnobs;
- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection;
- (BOOL)skipsRerenderForTranslation;
- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3;
- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable;
- (CGAffineTransform)naturalToEditablePathSpaceTransform;
- (CGPath)newHighlightPathInScaledSpace;
- (CGRect)aliasedAlignmentFrameInLayerFrame;
- (CGRect)boundsForCollaboratorCursorRenderable;
- (CGRect)clipRect;
- (CGRect)frameInUnscaledCanvas;
- (CGRect)layerFrameInScaledCanvas;
- (CGRect)layerFrameInScaledCanvasRelativeToParent;
- (CGRect)p_layerFrameInScaledCanvasForDirectlyManagedLayer:(BOOL)a3;
- (CGRect)p_scaledCanvasScrollViewBounds;
- (CGRect)strokeBoundsWithOptions:(unint64_t)a3 fallbackBounds:(CGRect)a4;
- (CGRect)targetRectForEditMenu;
- (CGSize)p_sizeForDirectlyManagedImageFromRenderableSize:(CGSize)a3;
- (CRLEditableBezierPathSource)editablePathSource;
- (CRLShapeLayout)shapeLayout;
- (CRLShapeRep)initWithLayout:(id)a3 canvas:(id)a4;
- (CRLShapeRepFreehandDrawingDynamicFillErasingDelegate)freehandDrawingDynamicFillErasingDelegate;
- (Class)layerClass;
- (_NSRange)i_commitAvailableFreehandDrawingPointsIfPossible;
- (_NSRange)i_uncommittedFreehandDrawingPointRange;
- (_TtC8Freeform12CRLShapeItem)shapeInfo;
- (double)opacity;
- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4;
- (double)strokeEnd;
- (id)additionalRenderablesOverRenderable;
- (id)colorBehindLayer:(id)a3;
- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5;
- (id)dataForUpdateUploadIndicator;
- (id)dynamicMoveLineSegmentDidBegin;
- (id)dynamicMoveSmartShapeKnobDidBegin;
- (id)dynamicResizeDidBegin;
- (id)i_brushStrokeFromStroke:(id)a3;
- (id)i_strokeForRenderingIncludingPlaybackFromStroke:(id)a3;
- (id)imageOfStroke:(CGRect *)a3;
- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4;
- (id)newTrackerForKnob:(id)a3;
- (id)overlayRenderables;
- (id)p_pathEditor;
- (id)pathSourceForSelectionHighlightBehavior;
- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (unint64_t)enabledKnobMask;
- (unint64_t)p_bitmapContextOptionsForDrawingStroke:(id)a3;
- (unint64_t)p_renderingDestination;
- (void)addSelectionKnobsToArray:(id)a3;
- (void)beginEditing;
- (void)beginEditingWithString:(id)a3;
- (void)didUpdateRenderable:(id)a3;
- (void)documentModeDidChange;
- (void)drawInContext:(CGContext *)a3 usingPathOverride:(id)a4 patternOffsetsBySubpathOverride:(id)a5 transparencyLayersBySubpath:(id)a6;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)dynamicDragDidBegin;
- (void)dynamicDragDidEnd;
- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3;
- (void)dynamicFreeTransformDidEndWithTracker:(id)a3;
- (void)dynamicMoveLineSegmentDidEndWithTracker:(id)a3;
- (void)dynamicMovePathKnobDidBegin;
- (void)dynamicMovePathKnobDidEndWithTracker:(id)a3;
- (void)dynamicMoveSmartShapeKnobDidEndWithTracker:(id)a3;
- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3;
- (void)dynamicOperationDidEnd;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)dynamicallyFreeTransformingWithTracker:(id)a3;
- (void)dynamicallyMovedPathKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)dynamicallyMovingLineSegmentWithTracker:(id)a3;
- (void)dynamicallyResizingWithTracker:(id)a3;
- (void)dynamicallyRotatingWithTracker:(id)a3;
- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4 withCommittedPointRange:(_NSRange)a5;
- (void)enqueuePathSourceChanges;
- (void)i_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 andStroke:(id)a5 inContext:(CGContext *)a6 useFastDrawing:(BOOL)a7;
- (void)i_endApplyOpacity:(CGContext *)a3 appliedTransparencyLayer:(BOOL)a4;
- (void)i_forceInvalidateLayerFrame;
- (void)i_setIsCurrentlyBeingFreehandDrawn:(BOOL)a3;
- (void)invalidateEffectLayersForChildren;
- (void)invalidateExteriorWrap;
- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5;
- (void)p_beginDynamicallyResizingOrMovingLineEnd;
- (void)p_drawChildrenWithoutOpacityInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4;
- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6;
- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9;
- (void)p_endDynamicallyResizingOrMovingLineEnd;
- (void)p_forDragAndDropSetColor:(id)a3;
- (void)p_forceSetNeedsDisplay;
- (void)p_forceSetNeedsDisplayInRect:(CGRect)a3;
- (void)p_handleAssetPreparationCompletion;
- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4 withPrecision:(BOOL)a5;
- (void)p_invalidateHitTestCache;
- (void)p_listenForAssetChangesIfAppropriate;
- (void)processChangedProperty:(unint64_t)a3;
- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4;
- (void)setFreehandDrawingDynamicFillErasingDelegate:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setParentRep:(id)a3;
- (void)setShadowOnChildrenDisabled:(BOOL)a3;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)updateRenderableGeometryFromLayout:(id)a3;
- (void)viewScaleDidChange;
- (void)willBeRemoved;
- (void)willUpdateRenderable:(id)a3;
@end

@implementation CRLShapeRep

- (CRLShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRLShapeRep;
  v7 = [(CRLCanvasRep *)&v20 initWithLayout:a3 canvas:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(CRLShapeRep *)v7 shapeInfo];
    if (v9
      && ([(CRLShapeRep *)v8 shapeLayout],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      v11 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      mDownloadObserverIdentifier = v8->mDownloadObserverIdentifier;
      v8->mDownloadObserverIdentifier = v11;

      if ([v6 isCanvasInteractive]) {
        [(CRLShapeRep *)v8 p_listenForAssetChangesIfAppropriate];
      }
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      mHitTestCache = v8->mHitTestCache;
      v8->mHitTestCache = v13;

      CGSize size = CGRectZero.size;
      v8->mLastDynamicInvalidRect.origin = CGRectZero.origin;
      v8->mLastDynamicInvalidRect.CGSize size = size;
      v8->mShouldForceRenderableGeometryUpdate = 1;
      v8->mAllowsSimultaneousDrawing = 0;
      if ([v9 isFreehandDrawingShape]) {
        v16 = CRLShapeRepHelperFreehandDrawing;
      }
      else {
        v16 = CRLShapeRepHelperDefault;
      }
      v18 = (CRLShapeRepHelperProtocol *)[[v16 alloc] initWithShapeRep:v8];
      mHelper = v8->mHelper;
      v8->mHelper = v18;
    }
    else
    {
      mHelper = v8;
      v8 = 0;
    }
  }
  return v8;
}

- (_TtC8Freeform12CRLShapeItem)shapeInfo
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLShapeItem *)v5;
}

- (CRLShapeLayout)shapeLayout
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self layout];
  v5 = sub_1002469D0(v3, v4);

  return (CRLShapeLayout *)v5;
}

- (void)setParentRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasRep *)self parentRep];
  v20.receiver = self;
  v20.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v20 setParentRep:v4];
  if (v5 != v4)
  {
    id v6 = [(CRLCanvasRep *)self canvas];
    if (![v6 isCanvasInteractive])
    {
LABEL_14:

      goto LABEL_15;
    }
    v7 = [(CRLShapeRep *)self shapeInfo];
    unsigned int v8 = [v7 isFreehandDrawingShape];

    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      v10 = [(CRLCanvasRep *)self layout];
      v11 = [v10 stroke];
      id v6 = sub_1002469D0(v9, v11);

      if (v6)
      {
        v12 = [v6 inkType];
        unsigned int v13 = !+[PKInk crl_isSixChannelBlendingUsedByInkType:v12];
      }
      else
      {
        unsigned int v13 = 1;
      }
      v14 = [(CRLShapeRep *)self shapeInfo];
      unsigned int v15 = [v14 isTreatedAsFillForFreehandDrawing];

      if (!v13 || v15)
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = sub_10024715C(v16, v5);
        v18 = (objc_class *)objc_opt_class();
        v19 = sub_10024715C(v18, v4);
        if ((v13 & 1) == 0)
        {
          [v17 didRemoveSixChannelEnabledChildRep:self];
          [v19 didAddSixChannelEnabledChildRep:self];
        }
        if (v15)
        {
          [v17 didRemoveSixChannelSuppressingChildRep:self];
          [v19 didAddSixChannelSuppressingChildRep:self];
        }
      }
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (CGRect)frameInUnscaledCanvas
{
  v10.receiver = self;
  v10.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v10 frameInUnscaledCanvas];
  double v4 = v3;
  double v6 = v5;
  if (!self->mFrameInUnscaledCanvasIsValid)
  {
    v7 = [(CRLShapeRep *)self shapeLayout];
    unsigned int v8 = v7;
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

- (CGRect)clipRect
{
  double v3 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v4 = [v3 isFreehandDrawingShape];

  if (v4)
  {
    [(CRLStyledRep *)self clipRectWithoutEffects];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLShapeRep;
    [(CRLStyledRep *)&v9 clipRect];
  }
  return CGRectInset(*(CGRect *)&v5, -1.0, -1.0);
}

- (BOOL)i_beginApplyOpacity:(CGContext *)a3 forDrawingInOneStep:(BOOL)a4
{
  [(CRLShapeRep *)self opacity];
  if (v7 >= 1.0) {
    return 0;
  }
  CGContextSetAlpha(a3, v7);
  if (a4) {
    return 0;
  }
  [(CRLCanvasRep *)self i_clipRectRecursive];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (CGRectIsNull(v16)
    || (v17.origin.CGFloat x = x, v17.origin.y = y, v17.size.width = width, v17.size.height = height, CGRectIsInfinite(v17)))
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    if (CGRectIsNull(v18))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4390);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010760A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D43B0);
      }
      unsigned int v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep i_beginApplyOpacity:forDrawingInOneStep:]");
      unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:273 isFatal:0 description:"Clip rects should never be null."];
    }
    CGContextBeginTransparencyLayer(a3, 0);
  }
  else
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGContextBeginTransparencyLayerWithRect(a3, v19, 0);
  }
  return 1;
}

- (void)i_endApplyOpacity:(CGContext *)a3 appliedTransparencyLayer:(BOOL)a4
{
  if (a4) {
    CGContextEndTransparencyLayer(a3);
  }
}

- (id)colorBehindLayer:(id)a3
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CRLShapeRep *)self shapeLayout];
  double v6 = [v5 fill];
  double v7 = sub_1002469D0(v4, v6);

  if (v7 && [v7 isOpaque])
  {
    unsigned int v8 = [v7 color];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6 = a4;
  double v7 = [(CRLCanvasRep *)self childReps];
  id v8 = [v7 count];

  if (v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000D9FC4;
    v18[3] = &unk_1014D43D8;
    id v9 = v6;
    id v19 = v9;
    objc_super v10 = objc_retainBlock(v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000D9FE0;
    v16[3] = &unk_1014D43D8;
    id v17 = v9;
    CGRect v11 = objc_retainBlock(v16);
    CGContextSaveGState(a3);
    BOOL v12 = [(CRLShapeRep *)self i_beginApplyOpacity:a3 forDrawingInOneStep:0];
    v15.receiver = self;
    v15.super_class = (Class)CRLShapeRep;
    [(CRLCanvasRep *)&v15 recursivelyDrawChildrenInContext:a3 keepingChildrenPassingTest:v10];
    [(CRLShapeRep *)self i_endApplyOpacity:a3 appliedTransparencyLayer:v12];
    CGContextRestoreGState(a3);
    v14.receiver = self;
    v14.super_class = (Class)CRLShapeRep;
    [(CRLCanvasRep *)&v14 recursivelyDrawChildrenInContext:a3 keepingChildrenPassingTest:v11];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLShapeRep;
    [(CRLCanvasRep *)&v13 recursivelyDrawChildrenInContext:a3 keepingChildrenPassingTest:v6];
  }
}

- (void)p_drawChildrenWithoutOpacityInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v4 recursivelyDrawChildrenInContext:a3 keepingChildrenPassingTest:a4];
}

- (void)drawInLayerContext:(CGContext *)a3
{
  if (![(CRLShapeRep *)self p_renderingDestination])
  {
    [(CRLShapeRep *)self p_drawInContext:a3 withContent:1 strokeDrawOptions:7 withOpacity:0];
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  BOOL v13 = a4;
  id v17 = a9;
  if (![(CRLShapeRep *)self isInvisible] || !v11 && ([(CRLShapeRep *)self opacity], v16 == 0.0)) {
    [(CRLShapeRep *)self p_drawInContext:a3 withContent:v13 strokeDrawOptions:a5 withOpacity:v11];
  }
  if (v9 && (!self->mShadowOnChildrenDisabled || !a7))
  {
    if (v11) {
      [(CRLShapeRep *)self recursivelyDrawChildrenInContext:a3 keepingChildrenPassingTest:v17];
    }
    else {
      [(CRLShapeRep *)self p_drawChildrenWithoutOpacityInContext:a3 keepingChildrenPassingTest:v17];
    }
  }
}

- (void)drawInContext:(CGContext *)a3 usingPathOverride:(id)a4 patternOffsetsBySubpathOverride:(id)a5 transparencyLayersBySubpath:(id)a6
{
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6
{
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9
{
  self->mNeedsDisplaCGFloat y = 0;
  -[CRLShapeRepHelperProtocol drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:](self->mHelper, "drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:", a3, a4, a5, a6, a7, a8);
}

- (CGRect)strokeBoundsWithOptions:(unint64_t)a3 fallbackBounds:(CGRect)a4
{
  uint64_t v5 = [(CRLShapeRep *)self shapeLayout];
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v19[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v19[1] = v6;
  v19[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v5 shapeFrameWithTransform:v19 strokeDrawOptions:a3];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)imageOfStroke:(CGRect *)a3
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  double v9 = [(CRLCanvasRep *)self layout];
  double v10 = [v9 stroke];

  if (v10 && [v10 shouldRender])
  {
    double v11 = [(CRLShapeRep *)self shapeLayout];
    [v11 frame];
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v12;
    CGFloat height = v13;
    double v16 = 0;
    if (v12 > 0.0 && v13 > 0.0)
    {
      double v17 = sub_100455AA8([(CRLShapeRep *)self p_bitmapContextOptionsForDrawingStroke:v10] | 8u, v12, v13);
      [(CRLShapeRep *)self p_drawInContext:v17 withContent:0 strokeDrawOptions:7 withOpacity:0];
      Image = CGBitmapContextCreateImage(v17);
      double v16 = +[CRLImage imageWithCGImage:Image];
      CGContextRelease(v17);
      CGImageRelease(Image);
    }
  }
  else
  {
    double v16 = 0;
  }
  a3->origin.CGFloat x = x;
  a3->origin.CGFloat y = y;
  a3->size.CGFloat width = width;
  a3->size.CGFloat height = height;

  return v16;
}

- (BOOL)isInvisible
{
  if (!self->mIsInvisibleCacheValid)
  {
    double v3 = [(CRLCanvasRep *)self layout];
    objc_super v4 = [v3 stroke];

    uint64_t v5 = [(CRLShapeRep *)self shapeLayout];
    long long v6 = [v5 fill];

    [(CRLShapeRep *)self opacity];
    unsigned __int8 v7 = 1;
    if (v8 != 0.0)
    {
      if (v4 && ([v4 shouldRender] & 1) != 0)
      {
        unsigned __int8 v7 = 0;
      }
      else if (v6)
      {
        unsigned __int8 v7 = [v6 isClear];
      }
      else
      {
        unsigned __int8 v7 = 1;
      }
    }
    self->mIsInvisibleCache = v7;
    self->mIsInvisibleCacheValid = 1;
  }
  if (self->mIsInvisibleCache) {
    return 1;
  }
  double v10 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v11 = [v10 isInvisible];

  return v11;
}

- (BOOL)isMoreOptimalToDrawWithOtherShapeRepsIfPossible
{
  v2 = [(CRLCanvasRep *)self layout];
  double v3 = [v2 stroke];

  if (v3) {
    unsigned __int8 v4 = [(id)objc_opt_class() isMoreOptimalToDrawWithOtherStrokesIfPossible];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)canDrawWithOtherShapeRep:(id)a3
{
  id v4 = a3;
  if (![(CRLShapeRep *)self isPartiallyAnimated]
    && ([v4 isPartiallyAnimated] & 1) == 0)
  {
    unsigned __int8 v7 = [(CRLCanvasRep *)self childReps];
    if ([v7 count])
    {
      unsigned __int8 v5 = 0;
    }
    else
    {
      double v8 = [v4 childReps];
      id v9 = [v8 count];

      if (v9) {
        goto LABEL_3;
      }
      [(CRLShapeRep *)self opacity];
      double v11 = v10;
      [v4 opacity];
      if (v11 != v12 && vabdd_f64(v11, v12) >= fabs(v12 * 0.000000999999997)) {
        goto LABEL_3;
      }
      [(CRLShapeRep *)self strokeEnd];
      if (v13 < 1.0) {
        goto LABEL_3;
      }
      [v4 strokeEnd];
      if (v14 < 1.0) {
        goto LABEL_3;
      }
      unsigned __int8 v7 = [(CRLShapeRep *)self shapeLayout];
      double v15 = [v4 shapeLayout];
      double v16 = [v7 fill];
      if (v16)
      {
        double v17 = [v7 fill];
        objc_opt_class();
        int v18 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        int v18 = 0;
      }

      id v19 = [v15 fill];
      if (v19)
      {
        objc_super v20 = [v15 fill];
        objc_opt_class();
        int v21 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        int v21 = 0;
      }

      if ((v18 | v21))
      {
        unsigned __int8 v5 = 0;
      }
      else
      {
        v22 = [v7 stroke];
        v23 = [v15 stroke];
        unsigned __int8 v5 = [v22 canDrawWithOtherStroke:v23];
      }
    }

    goto LABEL_4;
  }
LABEL_3:
  unsigned __int8 v5 = 0;
LABEL_4:

  return v5;
}

- (double)strokeEnd
{
  double result = 1.0;
  if ((*((unsigned char *)self + 328) & 3) == 1) {
    return self->mOverriddenValue;
  }
  return result;
}

- (double)opacity
{
  v17.receiver = self;
  v17.super_class = (Class)CRLShapeRep;
  [(CRLStyledRep *)&v17 opacity];
  if ((*((unsigned char *)self + 328) & 3) == 2) {
    return self->mOverriddenValue;
  }
  double v4 = v3;
  if ([(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn])
  {
    unsigned __int8 v5 = [(CRLShapeRep *)self shapeInfo];
    unsigned int v6 = [v5 isTreatedAsFillForFreehandDrawing];

    if (v6)
    {
      unsigned __int8 v7 = (objc_class *)objc_opt_class();
      double v8 = [(CRLCanvasRep *)self interactiveCanvasController];
      id v9 = [v8 freehandDrawingToolkit];
      double v10 = [v9 currentTool];
      double v11 = sub_10024715C(v7, v10);

      if (v11)
      {
        [v11 actualOpacityValueForOutlineFills];
        double v4 = v12;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D43F8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101076130();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D4418);
        }
        double v13 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v13);
        }
        double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep opacity]");
        double v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 512, 0, "invalid nil value for '%{public}s'", "pathTool");
      }
    }
  }
  return v4;
}

- (BOOL)isPartiallyAnimated
{
  return (*((unsigned char *)self + 328) & 3u) - 1 <= 1 && self->mOverriddenValue < 1.0;
}

- (void)i_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 andStroke:(id)a5 inContext:(CGContext *)a6 useFastDrawing:(BOOL)a7
{
  BOOL v7 = a7;
  double x = a4.x;
  BOOL v10 = a3;
  id v31 = a5;
  double v12 = [(CRLShapeRep *)self shapeLayout];
  double v13 = v12;
  if (v10)
  {
    uint64_t v14 = [v12 strokeHeadLineEnd];
    if (!v14) {
      goto LABEL_7;
    }
    double v15 = (void *)v14;
    [v13 headLineEndPoint];
    double v17 = v16;
    double v19 = v18;
    [v13 headLineEndAngle];
  }
  else
  {
    uint64_t v21 = [v12 strokeTailLineEnd];
    if (!v21) {
      goto LABEL_7;
    }
    double v15 = (void *)v21;
    [v13 tailLineEndPoint];
    double v17 = v22;
    double v19 = v23;
    [v13 tailLineEndAngle];
  }
  double v24 = v20;
  double v25 = sub_100064698(v17, v19, x);
  double v27 = v26;
  v28 = [v13 stroke];
  [v28 width];
  [v15 scaleForStrokeWidth];
  double v30 = v29;

  [v31 paintLineEnd:v15 atPoint:a6 atAngle:v7 withScale:v25 inContext:v27 useFastDrawing:v24 v30];
LABEL_7:
}

- (BOOL)p_shouldDrawStrokeWide:(id)a3
{
  double v4 = [a3 color];
  if ([v4 colorRGBSpace] == (id)1)
  {
    unsigned __int8 v5 = [(CRLCanvasRep *)self canvas];
    unsigned __int8 v6 = [v5 canvasIsWideGamut];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)p_bitmapContextOptionsForDrawingStroke:(id)a3
{
  if ([(CRLShapeRep *)self p_shouldDrawStrokeWide:a3]) {
    return 35;
  }
  else {
    return 3;
  }
}

- (_NSRange)i_commitAvailableFreehandDrawingPointsIfPossible
{
  v6.NSUInteger location = (NSUInteger)[(CRLShapeRep *)self i_uncommittedFreehandDrawingPointRange];
  NSRange v3 = NSIntersectionRange(v6, self->mAvailableToCommitPointRange);
  self->mCommittedPointRange = NSUnionRange(self->mCommittedPointRange, v3);
  NSUInteger location = v3.location;
  NSUInteger length = v3.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)i_brushStrokeFromStroke:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  sub_1002469D0(v4, v3);
  unsigned __int8 v5 = (CRLBrushStroke *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v6 = [v3 cap];
    BOOL v7 = &off_1014E2978;
    if (v6 != (id)1) {
      BOOL v7 = &off_1014E2970;
    }
    double v8 = *v7;
    id v9 = [CRLBrushStroke alloc];
    BOOL v10 = [v3 color];
    [v3 width];
    double v12 = v11;
    id v13 = [v3 cap];
    id v14 = [v3 join];
    double v15 = [v3 pattern];
    [v3 miterLimit];
    unsigned __int8 v5 = [(CRLBrushStroke *)v9 initWithName:v8 color:v10 width:v13 cap:v14 join:v15 pattern:v12 miterLimit:v16];
  }

  return v5;
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CRLShapeRepHelperProtocol *)self->mHelper drawsInOneStep]) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  id v6 = [(CRLShapeRep *)self shapeLayout];
  BOOL v7 = [v6 fill];
  double v8 = sub_1002469D0(v5, v7);

  BOOL v9 = v8 == 0;
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v3;
  }
  if (!v10)
  {
    double v11 = [(CRLCanvasRep *)self childReps];
    BOOL v9 = [v11 count] == 0;
  }
  return v9;
}

- (BOOL)shouldShowShadow
{
  v7.receiver = self;
  v7.super_class = (Class)CRLShapeRep;
  BOOL v3 = [(CRLStyledRep *)&v7 shouldShowShadow];
  if (v3)
  {
    uint64_t v4 = [(CRLCanvasRep *)self canvas];
    unsigned __int8 v5 = [v4 shouldSuppressBackgrounds];

    if (v5) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(CRLShapeRep *)self shadowOnChildrenDisabled];
    }
  }
  return v3;
}

- (BOOL)p_shouldUpgradeStrokeForPlayback:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)self + 328) & 3) == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [v4 width];
    double v7 = v6;
    double v8 = [(CRLCanvasRep *)self canvas];
    [v8 viewScale];
    BOOL v5 = v7 * v9 < 5.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)i_strokeForRenderingIncludingPlaybackFromStroke:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if ([(CRLShapeRep *)self p_shouldUpgradeStrokeForPlayback:v4])
  {
    BOOL v5 = [(CRLShapeRep *)self i_brushStrokeFromStroke:v4];
  }

  return v5;
}

- (BOOL)p_isInsidePlayingFreehandDrawing
{
  return (*((unsigned char *)self + 328) & 3) != 0;
}

- (void)setNeedsDisplay
{
  BOOL v3 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v4 = [v3 i_isInsideResizingFreehandDrawing];

  if (![(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn] && (v4 & 1) == 0)
  {
    [(CRLShapeRep *)self p_forceSetNeedsDisplay];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn])
  {
    -[CRLShapeRep p_forceSetNeedsDisplayInRect:](self, "p_forceSetNeedsDisplayInRect:", x, y, width, height);
  }
}

- (void)p_forceSetNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRep;
  [(CRLStyledRep *)&v3 setNeedsDisplay];
  self->mNeedsDispladouble y = 1;
}

- (void)p_forceSetNeedsDisplayInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep setNeedsDisplayInRect:](&v8, "setNeedsDisplayInRect:");
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  if (!CGRectIsEmpty(v9)) {
    self->mNeedsDisplaCGFloat y = 1;
  }
}

- (CGRect)p_layerFrameInScaledCanvasForDirectlyManagedLayer:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CRLCanvasRep *)self isBeingRotated] || !v3)
  {
    v44.receiver = self;
    v44.super_class = (Class)CRLShapeRep;
    [(CRLCanvasRep *)&v44 layerFrameInScaledCanvas];
    double v16 = v23;
    CGFloat v18 = v24;
    CGFloat v20 = v25;
    CGFloat v22 = v26;
  }
  else
  {
    BOOL v5 = [(CRLCanvasRep *)self canvas];
    [(CRLShapeRep *)self frameInUnscaledCanvas];
    [v5 convertUnscaledToBoundsRect:];
    double v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    id v14 = [(CRLCanvasRep *)self canvas];
    [v14 contentsScale];
    double v16 = sub_100067860(v7, v9, v11, v13, v15);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
  }
  if ([(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn])
  {
    [(CRLShapeRep *)self p_scaledCanvasScrollViewBounds];
    v48.origin.double x = v27;
    v48.origin.CGFloat y = v28;
    v48.size.CGFloat width = v29;
    v48.size.CGFloat height = v30;
    v45.origin.double x = v16;
    v45.origin.CGFloat y = v18;
    v45.size.CGFloat width = v20;
    v45.size.CGFloat height = v22;
    CGRect v46 = CGRectUnion(v45, v48);
    double x = v46.origin.x;
    CGFloat y = v46.origin.y;
    CGFloat width = v46.size.width;
    CGFloat height = v46.size.height;
    v35 = [(CRLCanvasRep *)self canvas];
    [v35 contentsScale];
    double v16 = sub_100067860(x, y, width, height, v36);
    CGFloat v18 = v37;
    CGFloat v20 = v38;
    CGFloat v22 = v39;
  }
  double v40 = v16;
  double v41 = v18;
  double v42 = v20;
  double v43 = v22;
  result.size.CGFloat height = v43;
  result.size.CGFloat width = v42;
  result.origin.CGFloat y = v41;
  result.origin.double x = v40;
  return result;
}

- (CGRect)layerFrameInScaledCanvas
{
  BOOL v3 = [(CRLShapeRep *)self directlyManagesLayerContent];

  [(CRLShapeRep *)self p_layerFrameInScaledCanvasForDirectlyManagedLayer:v3];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)layerFrameInScaledCanvasRelativeToParent
{
  v15.receiver = self;
  v15.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v15 layerFrameInScaledCanvasRelativeToParent];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(CRLShapeRep *)self isInvisible] && sub_100067C6C())
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)skipsRerenderForTranslation
{
  double v3 = [(CRLCanvasRep *)self canvas];
  double v4 = [v3 canvasController];
  unsigned int v5 = [v4 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime];

  if (v5)
  {
    double v6 = [(CRLCanvasRep *)self parentRep];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep layoutInRootChangedFrom:to:translatedOnly:](&v8, "layoutInRootChangedFrom:to:translatedOnly:", a3, a4);
  if (!a5) {
    self->mFrameInUnscaledCanvasIsValid = 0;
  }
  mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  self->mCachedWrapPathInRoot = 0;
}

- (unint64_t)p_renderingDestination
{
  if (([(CRLShapeRepHelperProtocol *)self->mHelper hasLegacyFreehandDrawingBrushStroke] & 1) == 0)
  {
    double v3 = [(CRLCanvasRep *)self layout];
    double v4 = [v3 stroke];
    unsigned int v5 = [(CRLShapeRep *)self p_shouldUpgradeStrokeForPlayback:v4];

    if (!v5) {
      return 0;
    }
  }
  [(CRLShapeRep *)self p_layerFrameInScaledCanvasForDirectlyManagedLayer:1];
  -[CRLShapeRep p_sizeForDirectlyManagedImageFromRenderableSize:](self, "p_sizeForDirectlyManagedImageFromRenderableSize:", v6, v7);
  double v9 = v8;
  double v11 = v10;
  unsigned int v12 = +[CRLBrushStroke brushStrokeUsesMetal];
  double v13 = +[CRLCapabilities currentCapabilities];
  double v14 = v13;
  if (v12)
  {
    objc_super v15 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v16 = [v15 canvasView];
    double v17 = [v16 metalDeviceForScreenWithCanvas];
    [v14 maximumMetalTextureSizeForDevice:v17];
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    [v13 maximumHardcodedTextureSize];
    double v19 = v22;
    double v21 = v23;
  }

  if (v9 > v19 || v11 > v21) {
    return 0;
  }
  if ([(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn]) {
    return 2;
  }
  if ([(CRLShapeRep *)self p_isInsidePlayingFreehandDrawing])
  {
    [(CRLShapeRep *)self strokeEnd];
    if (v26 > 0.0)
    {
      [(CRLShapeRep *)self strokeEnd];
      if (v27 < 1.0) {
        return 2;
      }
    }
  }
  return 1;
}

- (BOOL)directlyManagesLayerContent
{
  if (!self->mDirectlyManagesLayerContentCacheValid)
  {
    BOOL mDirectlyManagesLayerContent = self->mDirectlyManagesLayerContent;
    if ((char *)[(CRLShapeRep *)self p_renderingDestination] - 1 < (char *)2) {
      goto LABEL_9;
    }
    if ((*((unsigned char *)self + 328) & 3) == 2)
    {
      self->BOOL mDirectlyManagesLayerContent = 0;
      if (!mDirectlyManagesLayerContent) {
        return self->mDirectlyManagesLayerContent;
      }
      goto LABEL_15;
    }
    if ([(CRLShapeRep *)self isInvisible]
      || [(CRLShapeRep *)self p_canApplyStrokeToRenderable]
      && [(CRLShapeRep *)self p_canApplyFillToRenderable])
    {
LABEL_9:
      BOOL v4 = 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)CRLShapeRep;
      BOOL v4 = [(CRLCanvasRep *)&v9 directlyManagesLayerContent];
    }
    self->BOOL mDirectlyManagesLayerContent = v4;
    if (mDirectlyManagesLayerContent && !v4)
    {
LABEL_15:
      double v6 = [(CRLCanvasRep *)self interactiveCanvasController];
      double v7 = [v6 renderableForRep:self];

      [v7 setContents:0];
      [v7 setBackgroundColor:0];
      [v7 setBorderColor:0];
      [v7 setBorderWidth:0.0];
      [v7 setContentsRect:0.0, 0.0, 1.0, 1.0];
    }
  }
  return self->mDirectlyManagesLayerContent;
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  v2 = [(CRLCanvasRep *)self info];
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [v2 parentInfo];
  unsigned int v5 = sub_1002469D0(v3, v4);

  if (v5) {
    unsigned int v6 = [v5 isNonGroupedChild:v2] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEditingChildRep
{
  return 0;
}

- (Class)layerClass
{
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  uint64_t v3 = [(CRLCanvasRep *)&v6 layerClass];
  unint64_t v4 = [(CRLShapeRep *)self p_renderingDestination];
  if (v4 == 1 || v4 == 2) {
    uint64_t v3 = (objc_class *)objc_opt_class();
  }

  return v3;
}

- (void)i_forceInvalidateLayerFrame
{
  self->mShouldForceRenderableGeometryUpdate = 1;
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 invalidateContentLayersForRep:self];
}

- (BOOL)p_shouldSkipRenderableRecalculations
{
  BOOL v3 = [(CRLShapeRep *)self p_currentlyDrawingSomeOtherShape];
  if (v3) {
    LOBYTE(v3) = !self->mShouldForceRenderableGeometryUpdate && !self->mAllowsSimultaneousDrawing;
  }
  return v3;
}

- (BOOL)p_currentlyDrawingSomeOtherShape
{
  BOOL v3 = [(CRLCanvasRep *)self parentRep];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    objc_super v6 = [v5 freehandDrawingToolkit];
    if ([v6 isInDrawingMode]
      && ![(CRLCanvasRep *)self isInDynamicOperation]
      && [v5 isInDynamicOperation]
      && ([v6 currentTool],
          double v7 = objc_claimAutoreleasedReturnValue(),
          double v8 = (char *)[v7 type],
          v7,
          (unint64_t)(v8 - 10) <= 0xFFFFFFFFFFFFFFFDLL))
    {
      objc_super v9 = [v5 tmCoordinator];
      double v10 = [v9 controllingTM];
      double v11 = [v10 tracker];

      if (v11)
      {
        objc_opt_class();
        char v12 = objc_opt_isKindOfClass();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

- (CGSize)p_sizeForDirectlyManagedImageFromRenderableSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v5 = [(CRLCanvasRep *)self canvas];
  [v5 contentsScale];
  double v7 = sub_1000646A4(width, height, v6);
  double v8 = sub_1000674B8(v7);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)viewScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v3 viewScaleDidChange];
  self->mShouldForceRenderableGeometryUpdate = 1;
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4 = a3;
  if (![(CRLShapeRep *)self p_shouldSkipRenderableRecalculations])
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLShapeRep;
    [(CRLCanvasRep *)&v7 updateRenderableGeometryFromLayout:v4];
    unsigned int v5 = [(CRLCanvasRep *)self canvas];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DBDA0;
    v6[3] = &unk_1014CBBB0;
    v6[4] = self;
    [v5 performBlockAfterLayoutIfNecessary:v6];
  }
  [(CRLShapeRep *)self p_invalidateHitTestCache];
}

- (void)willUpdateRenderable:(id)a3
{
  id v4 = a3;
  if (self->mDirectlyManagesLayerContentCacheValid)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4438);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010761C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4458);
    }
    unsigned int v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep willUpdateRenderable:]");
    objc_super v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:921 isFatal:0 description:"didn't clean up"];
  }
  [(CRLShapeRep *)self directlyManagesLayerContent];
  self->mDirectlyManagesLayerContentCacheValid = 1;
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v8 willUpdateRenderable:v4];
}

- (void)didUpdateRenderable:(id)a3
{
  id v4 = a3;
  v158.receiver = self;
  v158.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v158 didUpdateRenderable:v4];
  if (![(CRLShapeRep *)self p_shouldSkipRenderableRecalculations])
  {
    [(CRLShapeRep *)self opacity];
    double v6 = v5;
    [v4 opacity];
    double v8 = v7;
    if (v6 != v8)
    {
      *(float *)&double v8 = v6;
      [v4 setOpacity:v8];
    }
    if ((*((unsigned char *)self + 328) & 3) != 0)
    {
      double v9 = [v4 contents];
      BOOL v10 = v9 != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
    if (![(CRLShapeRep *)self isInvisible] || v10)
    {
      if (![(CRLShapeRep *)self directlyManagesLayerContent]
        && (objc_msgSend(v4, "crl_tilingSafeHasContents") & 1) == 0)
      {
        double v11 = [(CRLCanvasRep *)self interactiveCanvasController];
        double v12 = [v4 layer];
        [v11 setNeedsDisplayOnLayer:v12];
      }
    }
    else
    {
      [v4 setContents:0];
    }
    double v13 = [(CRLShapeRep *)self shapeInfo];
    if ([v13 isFreehandDrawingShape])
    {
      double v14 = [(CRLCanvasRep *)self canvas];
      objc_super v15 = [v14 allReps];
      id v16 = [v15 count];

      if ((unint64_t)v16 < 0x5DD) {
        goto LABEL_20;
      }
      uint64_t v17 = objc_opt_class();
      double v18 = sub_1002469D0(v17, v4);
      double v13 = v18;
      if (v18 && ([v18 forceTiled] & 1) == 0) {
        [v13 setForceTiled:1];
      }
    }

LABEL_20:
    v141 = v4;
    if (self->mFillChanged)
    {
      unsigned int v19 = ![(CRLShapeRep *)self directlyManagesLayerContent];
      if (self->mFillChanged)
      {
        unsigned int v20 = [(CRLShapeRep *)self directlyManagesLayerContent];
        goto LABEL_25;
      }
    }
    else
    {
      unsigned int v19 = 0;
    }
    unsigned int v20 = 0;
LABEL_25:
    unsigned int v140 = v19;
    mNeedsDisplaCGFloat y = self->mNeedsDisplay;
    if ([(CRLShapeRep *)self directlyManagesLayerContent] && !v10)
    {
      self->mNeedsDisplaCGFloat y = 0;
      unint64_t v22 = [(CRLShapeRep *)self p_renderingDestination];
      if (v22 - 1 <= 1)
      {
        unint64_t v23 = v22;
        double v24 = [(CRLCanvasRep *)self layout];
        double v25 = [v24 stroke];
        double v26 = [(CRLShapeRep *)self i_strokeForRenderingIncludingPlaybackFromStroke:v25];

        uint64_t v27 = objc_opt_class();
        CGFloat v28 = sub_1002469D0(v27, v26);
        if (v28)
        {
          if (mNeedsDisplay)
          {
            long long v137 = *(_OWORD *)&CGAffineTransformIdentity.c;
            *(_OWORD *)&v157.a = *(_OWORD *)&CGAffineTransformIdentity.a;
            *(_OWORD *)&v157.c = v137;
            *(_OWORD *)&v157.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
            CGFloat v29 = [(CRLCanvasRep *)self canvas];
            [v29 contentsScale];
            CGFloat v31 = v30;
            v32 = [(CRLCanvasRep *)self canvas];
            [v32 contentsScale];
            *(_OWORD *)&v156.a = *(_OWORD *)&v157.a;
            *(_OWORD *)&v156.c = v137;
            *(_OWORD *)&v156.tCGFloat x = *(_OWORD *)&v157.tx;
            CGAffineTransformScale(&v157, &v156, v31, v33);

            [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
            CGAffineTransform t2 = v157;
            CGAffineTransformConcat(&v156, &t1, &t2);
            CGAffineTransform v157 = v156;
            v34 = [(CRLShapeRep *)self shapeLayout];
            [v34 pathBounds];
            double v36 = v35;
            double v38 = v37;

            CGAffineTransform t2 = v157;
            CGAffineTransformTranslate(&v156, &t2, -v36, -v38);
            CGAffineTransform v157 = v156;
            double v39 = v141;
            [v141 frame];
            -[CRLShapeRep p_sizeForDirectlyManagedImageFromRenderableSize:](self, "p_sizeForDirectlyManagedImageFromRenderableSize:", v40, v41);
            if (v42 <= 0.0
              || (double v44 = v43, v43 <= 0.0)
              || (double v45 = v42, [(CRLShapeRep *)self strokeEnd], v46 <= 0.0)
              || [(CRLShapeRep *)self isInvisible] && (*((unsigned char *)self + 328) & 3) == 0)
            {
              if (v23 == 1)
              {
                [v141 setContents:0];
              }
              else
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D44E0);
                }
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_1010762D4();
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D4500);
                }
                v73 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_10106590C(v73);
                }
                v74 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep didUpdateRenderable:]");
                v75 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
                +[CRLAssertionHandler handleFailureInFunction:v74 file:v75 lineNumber:1093 isFatal:0 description:"Should only need to clear out images."];
              }
            }
            else
            {
              id v136 = [v28 copy];
              v47 = [(CRLShapeRep *)self shapeLayout];
              CGRect v48 = [v47 pathSource];
              v49 = [v48 bezierPath];
              id v135 = [v49 copy];

              v50 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
              if ([(CRLShapeRepHelperProtocol *)self->mHelper hasLegacyFreehandDrawingBrushStroke])
              {
                v51 = [(CRLShapeRep *)self shapeLayout];
                v52 = [v51 dynamicPatternOffsetsBySubpath];

                if (v52)
                {
                  v53 = [(CRLShapeRep *)self shapeLayout];
                  v54 = [v53 dynamicPatternOffsetsBySubpath];
                  id v55 = [v54 copy];
                }
                else
                {
                  v53 = [(CRLShapeRep *)self shapeInfo];
                  [v53 strokePatternOffsetDistance];
                  v54 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  v159 = v54;
                  id v55 = +[NSArray arrayWithObjects:&v159 count:1];
                }
                v76 = v55;
                [(CRLBrushStrokeLayoutOptions *)v50 setPatternOffsetsBySubpath:v55];

                double v39 = v141;
              }
              [(CRLShapeRep *)self strokeEnd];
              -[CRLBrushStrokeLayoutOptions setStrokeEnd:](v50, "setStrokeEnd:");
              v138 = v50;
              if (v23 == 1)
              {
                v77 = (objc_class *)objc_opt_class();
                v78 = [(CRLCanvasRep *)self parentRep];
                v79 = sub_10024715C(v77, v78);

                v133 = v79;
                if ([(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn])
                {
                  v80 = 0;
                }
                else
                {
                  v80 = [v79 queueForConcurrentlyDrawingChildrenIntoLayersIfSafe];
                }
                v81 = v136;
                v99 = v135;
                v146[0] = _NSConcreteStackBlock;
                v146[1] = 3221225472;
                v146[2] = sub_1000DD074;
                v146[3] = &unk_1014D44C0;
                double v151 = v45;
                double v152 = v44;
                v146[4] = self;
                id v147 = v136;
                CGAffineTransform v153 = v157;
                id v148 = v135;
                v149 = v50;
                id v100 = v141;
                id v150 = v100;
                v101 = objc_retainBlock(v146);
                v102 = v101;
                if (v80)
                {
                  v144[0] = _NSConcreteStackBlock;
                  v144[1] = 3221225472;
                  v144[2] = sub_1000DD18C;
                  v144[3] = &unk_1014CC280;
                  v145 = v101;
                  [v80 performAsync:v144];
                  v103 = [(CRLCanvasRep *)self interactiveCanvasController];
                  v104 = [v100 layer];
                  [v103 setNeedsDisplayOnLayer:v104];

                  v50 = v138;
                }
                else
                {
                  ((void (*)(void *, void))v101[2])(v101, 0);
                }

                v98 = v133;
              }
              else
              {
                v81 = v136;
                unsigned int v82 = [(CRLShapeRep *)self p_shouldDrawStrokeWide:v136];
                uint64_t v134 = sub_1000B0C90();
                if (v82) {
                  uint64_t v83 = 115;
                }
                else {
                  uint64_t v83 = 70;
                }
                v84 = (objc_class *)objc_opt_class();
                v85 = [v39 layer];
                v80 = sub_10024715C(v84, v85);

                [v80 setOpaque:0];
                [v80 setPresentsWithTransaction:0];
                [v80 setAllowsNextDrawableTimeout:0];
                [v80 setMaximumDrawableCount:3];
                [v80 setDevice:v134];
                [v80 setPixelFormat:v83];
                [v80 setColorspace:0];
                v132 = [v80 nextDrawable];
                v86 = [CRLBrushStrokeDirectMetalRenderingContext alloc];
                [v141 frame];
                double v88 = v87;
                double v90 = v89;
                double v92 = v91;
                double v94 = v93;
                v95 = [(CRLCanvasRep *)self canvas];
                [v95 contentsScale];
                CGAffineTransform v156 = v157;
                v97 = -[CRLBrushStrokeDirectMetalRenderingContext initWithMetalDrawable:frame:transform:contentsScale:destinationColorSpaceOverride:metalDeviceOverride:](v86, "initWithMetalDrawable:frame:transform:contentsScale:destinationColorSpaceOverride:metalDeviceOverride:", v132, &v156, 0, v134, v88, v90, v92, v94, v96);

                v50 = v138;
                [v136 paintPath:[v135 CGPath] directlyUsingContext:v97 withLayoutOptions:v138];

                v98 = (void *)v134;
                v99 = v135;
              }
            }
            self->mCommittedPointRange = self->mAvailableToCommitPointRange;
          }
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D4478);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10107624C();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D4498);
          }
          v63 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v63);
          }
          v64 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep didUpdateRenderable:]");
          v65 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
          +[CRLAssertionHandler handleFailureInFunction:v64 file:v65 lineNumber:985 isFatal:0 description:"We expect the stroke to be a CRLBrushStroke if drawing into a Metal layer or image."];
        }
        goto LABEL_83;
      }
      v56 = [(CRLCanvasRep *)self canvas];
      [v56 viewScale];
      double v58 = v57;

      if ([(CRLShapeRep *)self p_canApplyFillToRenderable])
      {
        v59 = [(CRLShapeRep *)self shapeLayout];
        v60 = [v59 fill];

        if (v60)
        {
          v61 = [(CRLShapeRep *)self shapeLayout];
          v62 = [v61 fill];
          [v62 applyToRenderable:v141 withScale:v58];
        }
        else
        {
          [v141 setContents:0];
          [v141 setBackgroundColor:0];
        }
      }
      if ([(CRLShapeRep *)self p_canApplyStrokeToRenderable])
      {
        v66 = [(CRLCanvasRep *)self layout];
        double v26 = [v66 stroke];

        if (v26)
        {
          v67 = [(CRLCanvasRep *)self canvas];
          [v67 contentsScale];
          double v69 = v58 * v68;

          v157.a = 0.0;
          v157.b = 0.0;
          v156.a = 0.0;
          v156.b = 0.0;
          v70 = [(CRLShapeRep *)self shapeLayout];
          id v142 = 0;
          id v143 = 0;
          [v70 aliasPathForScale:&v143 adjustedStroke:&v142 adjustedPath:&v157 startDelta:&v156 endDelta:v69];
          id v71 = v143;
          id v72 = v142;

          [v71 applyToRepRenderable:v141 withScale:v58];
        }
        else
        {
          [v141 setBorderColor:0];
          [v141 setBorderWidth:0.0];
        }
LABEL_83:
      }
    }
    v105 = [(CRLCanvasRep *)self interactiveCanvasController];
    v106 = [v105 freehandDrawingToolkit];

    v107 = [(CRLShapeRep *)self shapeInfo];
    v108 = [v107 id];
    unsigned int v109 = [v106 wantsToAnimateForObjectUUID:v108 animation:@"CRLFreehandDrawingToolkitAnimationNameOutlineFill"];

    v110 = [(CRLShapeRep *)self shapeInfo];
    v111 = [v110 id];
    unsigned int v112 = [v106 wantsToAnimateForObjectUUID:v111 animation:@"CRLFreehandDrawingToolkitAnimationNameFloodFill"];

    id v4 = v141;
    if ((v109 & 1) == 0 && !v112)
    {
LABEL_103:
      self->mFillChanged = 0;
      self->mDirectlyManagesLayerContentCacheValid = 0;

      goto LABEL_104;
    }
    LODWORD(v114) = 1036831949;
    LODWORD(v113) = 0.25;
    LODWORD(v115) = 0.25;
    LODWORD(v116) = 1.0;
    v139 = +[CAMediaTimingFunction functionWithControlPoints:v113 :v114 :v115 :v116];
    if ((v140 | v20))
    {
      if (!v20)
      {
        if (!v140)
        {
          v118 = 0;
          int v127 = 0;
          CFStringRef v117 = 0;
          goto LABEL_94;
        }
        v118 = +[CATransition animation];
        [v118 setDuration:0.2];
        [v118 setTimingFunction:v139];
        [v118 setType:kCATransitionFade];
        CFStringRef v117 = @"contents";
LABEL_93:
        int v127 = 1;
LABEL_94:
        v128 = [(CRLShapeRep *)self shapeInfo];
        v129 = [v128 id];
        if (v109) {
          CFStringRef v130 = @"CRLFreehandDrawingToolkitAnimationNameOutlineFill";
        }
        else {
          CFStringRef v130 = @"CRLFreehandDrawingToolkitAnimationNameFloodFill";
        }
        v131 = [v106 animationCompletionHandlerForObjectUUID:v129 animation:v130];

        if (v118 && v127)
        {
          +[CATransaction begin];
          id v4 = v141;
          [v141 addAnimation:v118 forKey:v117];
          +[CATransaction setCompletionBlock:v131];
          +[CATransaction commit];
        }
        else
        {
          id v4 = v141;
          if (v131) {
            v131[2](v131);
          }
        }

        goto LABEL_103;
      }
      CFStringRef v117 = @"backgroundColor";
      v118 = +[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
      [v118 setDuration:0.2];
      [v118 setTimingFunction:v139];
      v119 = [v141 presentationRenderable];
      id v120 = [v119 backgroundColor];
      v121 = v118;
    }
    else
    {
      double v122 = 0.0;
      if (v109)
      {
        v123 = (objc_class *)objc_opt_class();
        v124 = [v106 currentTool];
        v125 = sub_10024715C(v123, v124);

        [v125 actualOpacityValueForOutlineFills];
        double v122 = v126;
      }
      CFStringRef v117 = @"opacity";
      v118 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
      [v118 setDuration:0.2];
      [v118 setTimingFunction:v139];
      v119 = +[NSNumber numberWithDouble:v122];
      v121 = v118;
      id v120 = v119;
    }
    [v121 setFromValue:v120];

    goto LABEL_93;
  }
  self->mDirectlyManagesLayerContentCacheValid = 0;
LABEL_104:
}

- (BOOL)shouldHitTestWithFill
{
  objc_super v3 = [(CRLShapeRep *)self shapeInfo];
  if (![v3 isFreehandDrawingShape])
  {
    BOOL v11 = 1;
LABEL_14:

    return v11;
  }
  id v4 = [(CRLCanvasRep *)self canvas];
  double v5 = [v4 canvasController];
  double v6 = [v5 freehandDrawingToolkit];
  unsigned int v7 = [v6 isInDrawingMode];

  if (v7)
  {
    objc_super v3 = [(CRLShapeRep *)self shapeLayout];
    double v8 = [v3 fill];
    double v9 = v8;
    if (v8) {
      char v10 = [v8 isClear] ^ 1;
    }
    else {
      char v10 = 0;
    }
    [(CRLShapeRep *)self opacity];
    BOOL v11 = 1;
    if (v12 != 0.0 && (v10 & 1) == 0)
    {
      double v13 = [v3 stroke];
      if ([v13 shouldRender])
      {
        double v14 = [v13 color];
        [v14 alphaComponent];
        BOOL v11 = v15 <= 0.0;
      }
    }

    goto LABEL_14;
  }
  return 1;
}

- (void)p_invalidateHitTestCache
{
}

- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4 withPrecision:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a4.x, a4.y);
  double v9 = +[NSNumber numberWithBool:v5];
  char v10 = +[CRLPair pairWithFirst:v8 second:v9];

  BOOL v11 = [(NSMutableDictionary *)self->mHitTestCache objectForKey:v10];
  double v12 = v11;
  if (v11) {
    *a3 = [v11 BOOLValue];
  }

  return v12 != 0;
}

- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4 withPrecision:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  double v8 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a4.x, a4.y);
  double v9 = +[NSNumber numberWithBool:v5];
  id v12 = +[CRLPair pairWithFirst:v8 second:v9];

  mHitTestCache = self->mHitTestCache;
  BOOL v11 = +[NSNumber numberWithBool:v6];
  [(NSMutableDictionary *)mHitTestCache setObject:v11 forKey:v12];
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  char v42 = 0;
  if (!-[CRLShapeRep p_hitCacheGetCachedValue:forPoint:withPrecision:](self, "p_hitCacheGetCachedValue:forPoint:withPrecision:", &v42, a4))
  {
    double v9 = [(CRLShapeRep *)self shapeLayout];
    char v10 = [(CRLCanvasRep *)self canvas];
    BOOL v11 = v10;
    id v12 = (double *)&unk_101178C10;
    if (!v4) {
      id v12 = (double *)&qword_101178C08;
    }
    double v13 = *v12;
    [v10 viewScale];
    double v15 = v13 / v14;
    [(CRLCanvasRep *)self naturalBounds];
    CGRect v45 = CGRectInset(v44, -v15, -v15);
    v43.double x = x;
    v43.double y = y;
    if (!CGRectContainsPoint(v45, v43))
    {
      BOOL v8 = 0;
LABEL_38:
      -[CRLShapeRep p_hitCacheSetCachedValue:forPoint:withPrecision:](self, "p_hitCacheSetCachedValue:forPoint:withPrecision:", v8, v4, x, y);

      return v8;
    }
    id v16 = [(CRLShapeRep *)self shapeInfo];
    id v17 = [v9 path];
    id v18 = [v17 CGPath];

    if (!v18)
    {
LABEL_37:

      BOOL v8 = v18 != 0;
      goto LABEL_38;
    }
    unsigned int v19 = sub_100455AA8(19, 1.0, 1.0);
    Data = CGBitmapContextGetData(v19);
    [v9 pathBounds];
    CGContextTranslateCTM(v19, -v21, -v22);
    CGContextTranslateCTM(v19, -x, -y);
    if (([v9 pathIsLineSegment] & 1) == 0
      && ([(CRLShapeRep *)self shouldHitTestWithFill]
       || objc_msgSend(v11, "i_shouldIgnoreClickThrough")))
    {
      unint64_t v23 = +[CRLColor blackColor];
      [v23 paintPath:v18 inContext:v19];

      if (*Data)
      {
        LODWORD(v18) = 1;
LABEL_36:
        CGContextRelease(v19);
        goto LABEL_37;
      }
      id v41 = v18;
      char v24 = 0;
    }
    else
    {
      id v41 = v18;
      char v24 = 1;
    }
    double v25 = [(CRLCanvasRep *)self layout];
    double v26 = [v25 stroke];

    if ((v24 & 1) == 0 && ![(CRLStroke *)v26 shouldRender])
    {
      [(CRLCanvasRep *)self naturalBounds];
      if (v27 >= 1.0)
      {
        [(CRLCanvasRep *)self naturalBounds];
        if (v28 >= 1.0) {
          goto LABEL_31;
        }
      }
    }
    if (!v26) {
      double v26 = objc_alloc_init(CRLStroke);
    }
    [(CRLStroke *)v26 width];
    if (v15 < v29) {
      double v15 = v29;
    }
    if ([(CRLStroke *)v26 drawsOutsideStrokeBounds])
    {
      [(CRLStroke *)v26 width];
      if (v30 >= v15)
      {
LABEL_27:
        LODWORD(v18) = 1;
        [(CRLStroke *)v26 paintPath:v41 wantsInteriorStroke:0 inContext:v19 useFastDrawing:1 parameterized:0 shouldReverseDrawOrder:0];
        if (*Data) {
          goto LABEL_35;
        }
        if ([v9 pathIsOpen])
        {
          double v37 = [v16 headLineEnd];
          if (v37)
          {

LABEL_34:
            id v18 = +[CRLColor blackColor];
            CGContextSetStrokeColorWithColor(v19, (CGColorRef)[v18 CGColor]);

            double v38 = CGPointZero.y;
            -[CRLShapeRep i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 1, v26, v19, 1, CGPointZero.x, v38);
            -[CRLShapeRep i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 0, v26, v19, 1, CGPointZero.x, v38);
            LODWORD(v18) = *Data != 0;
            goto LABEL_35;
          }
          id v18 = [v16 tailLineEnd];

          if (v18) {
            goto LABEL_34;
          }
LABEL_35:

          goto LABEL_36;
        }
LABEL_31:
        LODWORD(v18) = 0;
        goto LABEL_35;
      }
      double v40 = Data;
      CGFloat v31 = (CRLStroke *)[(CRLStroke *)v26 mutableCopy];
      [(CRLStroke *)v31 setWidth:v15];
      v32 = +[CRLColor blackColor];
      [(CRLStroke *)v31 setColor:v32];
    }
    else
    {
      double v40 = Data;
      uint64_t v33 = +[CRLColor blackColor];
      v34 = v16;
      unint64_t v35 = [(CRLStroke *)v26 join];
      v32 = +[CRLStrokePattern solidPattern];
      unint64_t v36 = v35;
      id v16 = v34;
      CGFloat v31 = +[CRLStroke strokeWithColor:v33 width:1 cap:v36 join:v32 pattern:v15];

      double v26 = (CRLStroke *)v33;
    }

    double v26 = v31;
    Data = v40;
    goto LABEL_27;
  }
  LOBYTE(v8) = v42 != 0;
  return v8;
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  v2 = [(CRLCanvasRep *)self layout];
  objc_super v3 = [v2 stroke];

  if (v3) {
    unsigned int v4 = [v3 shouldRender] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v8 = [(CRLShapeRep *)self shapeLayout];
  double v9 = [v8 stroke];

  if (v9)
  {
    [v9 width];
    double v11 = v10 * 0.5;
  }
  else
  {
    double v11 = 1.0;
  }
  id v12 = [(CRLCanvasRep *)self canvas];
  [v12 viewScale];
  double v14 = 6.0 / v13;

  if (v14 >= v11) {
    double v11 = v14;
  }
  double v15 = [(CRLCanvasRep *)self layout];
  id v16 = [v15 geometry];
  [v16 size];
  v33.origin.double x = sub_100064070();
  CGRect v34 = CGRectInset(v33, -v11, -v11);
  CGFloat v17 = v34.origin.x;
  CGFloat v18 = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;

  v35.origin.double x = v17;
  v35.origin.double y = v18;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  v32.double x = x;
  v32.double y = y;
  if (CGRectContainsPoint(v35, v32))
  {
    double v21 = [(CRLShapeRep *)self shapeLayout];
    [v21 pathBounds];
    double v23 = v22;

    double v24 = sub_100064698(x, y, v23);
    double v26 = v25;
    double v27 = [(CRLShapeRep *)self shapeLayout];
    double v28 = [v27 path];
    [v28 distanceToPoint:0 elementIndex:0 tValue:0 threshold:v24 findClosestMatch:v26];
    double v30 = v29;

    if (a4 && v30 <= v11) {
      *a4 = 1;
    }
  }
  else
  {
    double v30 = 3.40282347e38;
  }

  return v30;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(CRLShapeRep *)self shapeLayout];
  [v8 frameInRoot];
  v27.origin.double x = v9;
  v27.origin.double y = v10;
  v27.size.double width = v11;
  v27.size.double height = v12;
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  BOOL v13 = CGRectIntersectsRect(v26, v27);

  if (!v13) {
    return 0;
  }
  mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  if (!mCachedWrapPathInRoot)
  {
    double v15 = [(CRLShapeRep *)self shapeLayout];
    id v16 = [v15 i_wrapPath];
    CGFloat v17 = (CRLBezierPath *)[v16 copy];
    CGFloat v18 = self->mCachedWrapPathInRoot;
    self->mCachedWrapPathInRoot = v17;

    unsigned int v19 = self->mCachedWrapPathInRoot;
    unsigned int v20 = [(CRLCanvasRep *)self layout];
    double v21 = v20;
    if (v20)
    {
      [v20 transformInRoot];
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
    }
    [(CRLBezierPath *)v19 transformUsingAffineTransform:&v23];

    mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  }
  return -[CRLBezierPath intersectsRect:hasFill:](mCachedWrapPathInRoot, "intersectsRect:hasFill:", [(CRLShapeRep *)self shouldHitTestWithFill], x, y, width, height);
}

- (void)processChangedProperty:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLShapeRep;
  -[CRLStyledRep processChangedProperty:](&v7, "processChangedProperty:");
  if (a3 <= 0x16 && ((1 << a3) & 0x798000) != 0)
  {
    [(CRLShapeRep *)self setNeedsDisplay];
    BOOL v5 = [(CRLCanvasRep *)self canvas];
    [v5 canvasInvalidatedForRep:self];

    switch(a3)
    {
      case 0xFuLL:
        self->mIsInvisibleCacheValid = 0;
        [(CRLCanvasRep *)self invalidateKnobPositions];
        uint64_t v6 = 248;
        goto LABEL_8;
      case 0x13uLL:
      case 0x15uLL:
      case 0x16uLL:
        [(CRLCanvasRep *)self invalidateKnobPositions];
        self->mFrameInUnscaledCanvasIsValid = 0;
        if (a3 == 19) {
          [(CRLCanvasRep *)self invalidateKnobs];
        }
        break;
      case 0x14uLL:
        [(CRLShapeRep *)self p_listenForAssetChangesIfAppropriate];
        self->mFillChanged = 1;
        uint64_t v6 = 379;
LABEL_8:
        *((unsigned char *)&self->super.super.super.isa + v6) = 0;
        break;
      default:
        break;
    }
  }
  [(CRLShapeRep *)self p_invalidateHitTestCache];
}

- (CGRect)aliasedAlignmentFrameInLayerFrame
{
  objc_super v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v4 = [(CRLStyledRep *)self styledLayout];
  BOOL v5 = [(CRLCanvasRep *)self canvas];
  [v5 contentsScale];
  double v7 = v6;
  BOOL v8 = [(CRLCanvasRep *)self canvas];
  [v8 viewScale];
  [v4 aliasedAlignmentFrameForScale:v7 * v9];
  [v3 convertUnscaledToBoundsRect:];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  [(CRLCanvasRep *)self i_layerFrameInScaledCanvasIgnoringDragging];
  double v19 = sub_100064680(v11, v13, v18);
  double v21 = v15;
  double v22 = v17;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLShapeRep;
  -[CRLCanvasRep dynamicOperationDidBeginWithRealTimeCommands:](&v11, "dynamicOperationDidBeginWithRealTimeCommands:");
  BOOL v5 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v6 = [v5 isFreehandDrawingShape];

  if (v6)
  {
    double v7 = [(CRLCanvasRep *)self interactiveCanvasController];
    BOOL v8 = [v7 layerHost];
    double v9 = [v8 asiOSCVC];

    double v10 = [v9 smartSelectionManager];
    [v10 dynamicOperationDidBeginWithRealTimeCommands:v3];
  }
}

- (void)dynamicOperationDidEnd
{
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v9 dynamicOperationDidEnd];
  [(CRLShapeRepHelperProtocol *)self->mHelper dynamicOperationDidEnd];
  self->mShouldForceRenderableGeometryUpdate = 1;
  BOOL v3 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v4 = [v3 isFreehandDrawingShape];

  if (v4)
  {
    BOOL v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned int v6 = [v5 layerHost];
    double v7 = [v6 asiOSCVC];

    BOOL v8 = [v7 smartSelectionManager];
    [v8 dynamicOperationDidEnd];
  }
}

- (void)dynamicDragDidBegin
{
  if (![(CRLShapeRep *)self directlyManagesLayerContent])
  {
    [(CRLShapeRep *)self aliasedAlignmentFrameInLayerFrame];
    self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.double x = v3;
    self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.double y = v4;
    self->mOriginalAliasedAlignmentFrameInLayerFrame.size.double width = v5;
    self->mOriginalAliasedAlignmentFrameInLayerFrame.size.double height = v6;
  }
  uint64_t v7 = objc_opt_class();
  BOOL v8 = [(CRLCanvasRep *)self parentRep];
  objc_super v9 = sub_1002469D0(v7, v8);

  [v9 beginTrifurcatedRenderForChildRep:self];
  double v10 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v11 = [v10 isFreehandDrawingShape];

  if (v11)
  {
    double v12 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v13 = [v12 layerHost];
    double v14 = [v13 asiOSCVC];

    double v15 = [v14 smartSelectionManager];
    [v15 dynamicDragDidBegin];
  }
  v16.receiver = self;
  v16.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v16 dynamicDragDidBegin];
}

- (void)dynamicDragDidEnd
{
  v14.receiver = self;
  v14.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v14 dynamicDragDidEnd];
  uint64_t v3 = objc_opt_class();
  CGFloat v4 = [(CRLCanvasRep *)self parentRep];
  CGFloat v5 = sub_1002469D0(v3, v4);

  [v5 endTrifurcatedRenderForChildRep:self];
  if (![(CRLShapeRep *)self directlyManagesLayerContent])
  {
    [(CRLShapeRep *)self aliasedAlignmentFrameInLayerFrame];
    if (!sub_100064208(self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.x, self->mOriginalAliasedAlignmentFrameInLayerFrame.origin.y, self->mOriginalAliasedAlignmentFrameInLayerFrame.size.width, self->mOriginalAliasedAlignmentFrameInLayerFrame.size.height, v6, v7, v8, v9))
    {
      double v10 = [(CRLCanvasRep *)self interactiveCanvasController];
      unsigned int v11 = [v10 renderableForRep:self];

      double v12 = [(CRLCanvasRep *)self interactiveCanvasController];
      double v13 = [v11 layer];
      [v12 setNeedsDisplayOnLayer:v13];
    }
  }
}

- (CGRect)targetRectForEditMenu
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  double v7 = [(CRLShapeRep *)self shapeLayout];
  unsigned int v8 = [v7 pathIsLineSegment];

  if (v8)
  {
    double v9 = [(CRLShapeRep *)self shapeLayout];
    [v9 headPoint];
    double v11 = v10;
    double v13 = v12;
    objc_super v14 = [(CRLShapeRep *)self shapeLayout];
    [v14 tailPoint];
    double v16 = v15;
    double v18 = v17;

    if (![(CRLShapeRep *)self i_editMenuOverlapsEndKnobs])
    {
      double v19 = sub_100065E00(v11, v13, v16, v18, 0.5);
      CGFloat x = sub_10006402C(v19, v20, 1.0);
      CGFloat y = v21;
      CGFloat width = v22;
      CGFloat height = v23;
    }
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (BOOL)shouldShowSelectionHighlight
{
  uint64_t v3 = [(CRLShapeRep *)self shapeInfo];
  unsigned __int8 v4 = [v3 isFreehandDrawingShape];

  if (v4) {
    return 0;
  }
  CGFloat v5 = [(CRLShapeRep *)self shapeLayout];
  if ([v5 pathIsLineSegment])
  {
    double v6 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned int v7 = [v6 usesAlternateDrawableSelectionHighlight];

    if (!v7) {
      return 0;
    }
  }
  else
  {
  }
  unsigned int v8 = [(CRLShapeRep *)self p_pathEditor];

  if (v8) {
    return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLShapeRep;
  return [(CRLStyledRep *)&v10 shouldShowSelectionHighlight];
}

- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection
{
  uint64_t v3 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v4 = [v3 pathIsLineSegment];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  return [(CRLCanvasRep *)&v6 shouldSuppressSelectionHighlightDuringMultiselection];
}

- (BOOL)shouldIgnoreICCSuppressSelectionKnobs
{
  v7.receiver = self;
  v7.super_class = (Class)CRLShapeRep;
  unsigned __int8 v3 = [(CRLCanvasRep *)&v7 shouldIgnoreICCSuppressSelectionKnobs];
  unsigned __int8 v4 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v5 = [v4 pathIsLineSegment];

  return v5 | v3;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  unsigned __int8 v3 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v4 = [v3 supportsResize];

  if (!v4 || [(CRLShapeRep *)self isInvisible]) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  return [(CRLStyledRep *)&v6 shouldHideSelectionHighlightDueToRectangularPath];
}

- (id)pathSourceForSelectionHighlightBehavior
{
  v2 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v3 = [v2 pathSource];

  return v3;
}

- (CGPath)newHighlightPathInScaledSpace
{
  uint64_t v3 = [(CRLShapeRep *)self i_targetsDropsToStroke] ^ 1;
  unsigned int v4 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v5 = [v4 computeWrapPathClosed:v3];

  if (!v5 || (uint64_t)[v5 elementCount] <= 1)
  {
    objc_super v6 = [(CRLCanvasRep *)self layout];
    [v6 boundsForStandardKnobs];
    uint64_t v7 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");

    unsigned __int8 v5 = (void *)v7;
  }
  memset(&transform, 0, sizeof(transform));
  unsigned int v8 = [(CRLCanvasRep *)self layout];
  double v9 = v8;
  if (v8) {
    [v8 transformInRoot];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }

  objc_super v10 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v10 viewScale];
  CGFloat v12 = v11;

  CGAffineTransformMakeScale(&t2, v12, v12);
  CGAffineTransform v16 = transform;
  CGAffineTransformConcat(&v18, &v16, &t2);
  CGAffineTransform transform = v18;
  id v13 = v5;
  objc_super v14 = CGPathCreateCopyByTransformingPath((CGPathRef)[v13 CGPath], &transform);

  return v14;
}

- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  double v9 = [(CRLCanvasRep *)self parentRep];
  objc_super v10 = sub_1002469D0(v8, v9);

  if (objc_msgSend(v10, "wantsToHandleDropForChildWithDragInfo:atUnscaledPoint:", v7, x, y))
  {
    id v11 = v10;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLShapeRep;
    -[CRLCanvasRep repToHighlightForDragInfo:atUnscaledPoint:](&v14, "repToHighlightForDragInfo:atUnscaledPoint:", v7, x, y);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGFloat v12 = v11;

  return v12;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLShapeRep;
  unint64_t v8 = -[CRLCanvasRep dragOperationForDragInfo:atUnscaledPoint:](&v13, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);
  if (![(CRLCanvasRep *)self isLocked])
  {
    if ([v7 canCreateItemsOfClass:objc_opt_class()]
      && [v7 numberOfDraggingItems] == (id)1)
    {
      if (![(CRLShapeRep *)self allowsColorDrop]) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    uint64_t v9 = objc_opt_class();
    objc_super v10 = [(CRLCanvasRep *)self parentRep];
    id v11 = sub_1002469D0(v9, v10);

    LODWORD(v10) = [v11 wantsToHandleDropForChildWithDragInfo:v7 atUnscaledPoint:x, y];
    if (v10) {
LABEL_7:
    }
      unint64_t v8 = (unint64_t)[v7 dragOperationMask] & 1;
  }
LABEL_8:

  return v8;
}

- (BOOL)i_targetsDropsToStroke
{
  v2 = [(CRLShapeRep *)self shapeLayout];
  if ([v2 pathIsOpen])
  {
    uint64_t v3 = [v2 fill];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  id v11 = [(CRLCanvasRep *)self parentRep];
  CGFloat v12 = sub_1002469D0(v10, v11);

  if (objc_msgSend(v12, "wantsToHandleDropForChildWithDragInfo:atUnscaledPoint:", v9, x, y))
  {
    unsigned __int8 v13 = [v12 handleDragOperation:a3 withDragInfo:v9 atUnscaledPoint:x, y];
  }
  else
  {
    objc_super v14 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v15 = [v14 editingCoordinator];
    [v15 suspendCollaborationWithReason:@"CRLShapeDragAndDrop"];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000DEBC8;
    v18[3] = &unk_1014D4528;
    void v18[4] = self;
    id v16 = [v9 createItemsOfClass:objc_opt_class() completion:v18];
    unsigned __int8 v13 = 1;
  }

  return v13;
}

- (void)p_forDragAndDropSetColor:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4548);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010763E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4568);
    }
    unsigned __int8 v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    objc_super v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep p_forDragAndDropSetColor:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1674 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (v4)
  {
    if ([(CRLShapeRep *)self i_targetsDropsToStroke])
    {
      unint64_t v8 = [(CRLShapeRep *)self shapeLayout];
      id v9 = [v8 stroke];
      id v10 = [v9 mutableCopy];

      [v10 setColor:v4];
      id v11 = [_TtC8Freeform19CRLCommandSetStroke alloc];
      CGFloat v12 = [(CRLShapeRep *)self shapeInfo];
      unsigned __int8 v13 = [(CRLCommandSetStroke *)v11 initWithStyledItem:v12 stroke:v10];
    }
    else
    {
      double v17 = [_TtC8Freeform17CRLCommandSetFill alloc];
      id v10 = [(CRLShapeRep *)self shapeInfo];
      CGFloat v12 = +[CRLColorFill colorWithColor:v4];
      unsigned __int8 v13 = [(CRLCommandSetFill *)v17 initWithShapeItem:v10 fill:v12];
    }
    double v15 = v13;

    id v16 = [(CRLCanvasRep *)self interactiveCanvasController];
    CGAffineTransform v18 = [v16 commandController];
    [v18 enqueueCommand:v15];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4588);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107635C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D45A8);
    }
    objc_super v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep p_forDragAndDropSetColor:]");
    id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:1689 isFatal:0 description:"Unable to drop nil color"];
  }
}

- (BOOL)canBeUsedForImageMask
{
  uint64_t v3 = [(CRLShapeRep *)self shapeLayout];
  id v4 = [v3 path];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  id v9 = [(CRLShapeRep *)self shapeInfo];
  id v10 = [v9 containingGroup];
  unsigned __int8 v11 = [v10 isFreehandDrawing];

  if (v11) {
    return 0;
  }
  unsigned __int8 v13 = [(CRLCanvasRep *)self info];
  objc_super v14 = [v13 geometry];
  if ([v14 widthValid])
  {
    double v15 = [(CRLCanvasRep *)self info];
    id v16 = [v15 geometry];
    if ([v16 heightValid] && !-[CRLCanvasRep isPlaceholder](self, "isPlaceholder"))
    {
      double v17 = [(CRLShapeRep *)self shapeLayout];
      CGAffineTransform v18 = [v17 path];
      unsigned int v19 = (v8 > 0.0) & ~[v18 isLineSegment];
      if (v6 > 0.0) {
        BOOL v12 = v19;
      }
      else {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)shouldShowKnobs
{
  v10.receiver = self;
  v10.super_class = (Class)CRLShapeRep;
  unsigned int v3 = [(CRLCanvasRep *)&v10 shouldShowKnobs];
  id v4 = [(CRLShapeRep *)self shapeInfo];
  double v5 = [v4 containingGroup];
  unsigned int v6 = [v5 isFreehandDrawing];

  if (v6)
  {
    double v7 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v8 = [v7 freehandDrawingToolkit];

    if ([v8 isInDrawingMode]) {
      LOBYTE(v3) = 0;
    }
    else {
      v3 &= ~[(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn];
    }
  }
  return v3;
}

- (unint64_t)enabledKnobMask
{
  unsigned int v3 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v4 = [v3 pathIsLineSegment];

  if (v4) {
    return 3072;
  }
  unsigned int v6 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v7 = [v6 supportsResize];

  if (!v7) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeRep;
  return [(CRLCanvasRep *)&v8 enabledKnobMask];
}

- (BOOL)p_parentFreehandDrawingIsSelected
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v5 = [v4 editorController];
  unsigned int v6 = [v5 mostSpecificCurrentEditorOfClass:objc_opt_class()];
  unsigned int v7 = sub_1002469D0(v3, v6);

  uint64_t v8 = objc_opt_class();
  id v9 = [(CRLCanvasRep *)self parentRep];
  objc_super v10 = [v9 info];
  unsigned __int8 v11 = sub_1002469D0(v8, v10);

  if (v11)
  {
    BOOL v12 = [v7 boardItems];
    unsigned __int8 v13 = [v12 containsObject:v11];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)addSelectionKnobsToArray:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLShapeRep *)self p_pathEditor];
  unsigned int v6 = v5;
  if (v5 && [v5 canAddKnobsForRep:self])
  {
    [v6 addKnobsForRep:self toArray:v4];
  }
  else
  {
    unsigned int v7 = [(CRLShapeRep *)self shouldShowSmartShapeKnobs];
    uint64_t v8 = [(CRLShapeRep *)self shapeLayout];
    id v9 = v8;
    if (v7)
    {
      objc_super v10 = (char *)[v8 numberOfControlKnobs];
      if (v10)
      {
        unsigned __int8 v11 = v10;
        for (i = 0; i != v11; ++i)
        {
          unsigned __int8 v13 = [CRLCanvasKnob alloc];
          [v9 getControlKnobPosition:i + 12];
          objc_super v14 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v13, "initWithType:position:radius:tag:onRep:", 0, i + 12, self);
          [v4 addObject:v14];
        }
      }
    }
    else
    {
      uint64_t v15 = objc_opt_class();
      id v16 = [v9 pathSource];
      double v17 = sub_1002469D0(v15, v16);

      if (v17)
      {
        CGAffineTransform v18 = [CRLCanvasKnob alloc];
        [v9 getControlKnobPosition:12];
        unsigned int v19 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v18, "initWithType:position:radius:tag:onRep:", 0, 12, self);
        [v4 addObject:v19];
      }
    }

    double v20 = [(CRLShapeRep *)self shapeLayout];
    unsigned int v21 = [v20 pathIsLineSegment];

    if (v21)
    {
      unint64_t v22 = [(CRLShapeRep *)self enabledKnobMask];
      double y = CGPointZero.y;
      for (uint64_t j = 10; j != 12; ++j)
      {
        if ((sub_1002893CC(j) & v22) != 0)
        {
          double v25 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 0, j, self, CGPointZero.x, y, 15.0);
          [v4 addObject:v25];
        }
      }
    }
    v35.receiver = self;
    v35.super_class = (Class)CRLShapeRep;
    [(CRLCanvasRep *)&v35 addSelectionKnobsToArray:v4];
    if ([(CRLShapeRep *)self shouldShowAdvancedGradientKnobs])
    {
      uint64_t v26 = objc_opt_class();
      double v27 = [(CRLShapeRep *)self shapeLayout];
      double v28 = [v27 fill];
      double v29 = sub_1002469D0(v26, v28);

      double v30 = [CRLCanvasKnob alloc];
      if ([v29 gradientType] == (id)1) {
        uint64_t v31 = 26;
      }
      else {
        uint64_t v31 = 25;
      }
      double v32 = CGPointZero.y;
      CGRect v33 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v30, "initWithType:position:radius:tag:onRep:", 0, v31, self, CGPointZero.x, v32, 15.0);
      [v4 addObject:v33];
      CGRect v34 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 0, 27, self, CGPointZero.x, v32, 15.0);
      [v4 addObject:v34];
    }
  }
}

- (BOOL)shouldShowAdditionalKnobs
{
  [(CRLCanvasRep *)self boundsForStandardKnobs];
  double v4 = v3;
  double v6 = v5;
  unsigned int v7 = [(CRLCanvasRep *)self canvas];
  [v7 viewScale];
  double v9 = sub_1000646A4(v4, v6, v8);
  double v11 = v10;

  BOOL v12 = v9 < 60.0 || v11 < 60.0;
  if (v12 || [(CRLCanvasRep *)self isPlaceholder]) {
    return 0;
  }
  else {
    return ![(CRLCanvasRep *)self isLocked];
  }
}

- (BOOL)shouldShowAdvancedGradientKnobs
{
  double v3 = [(CRLShapeRep *)self shapeInfo];
  unsigned __int8 v4 = [v3 isFreehandDrawingShape];

  if (v4) {
    return 0;
  }
  if ([(CRLCanvasRep *)self isInDynamicOperation])
  {
    double v6 = [(CRLCanvasRep *)self currentKnobTracker];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return 0;
    }
  }
  uint64_t v8 = objc_opt_class();
  double v9 = [(CRLShapeRep *)self shapeLayout];
  double v10 = [v9 fill];
  double v11 = sub_1002469D0(v8, v10);

  if (v11 && [v11 isAdvancedGradient] && !-[CRLCanvasRep isLocked](self, "isLocked"))
  {
    unsigned __int8 v13 = [(CRLCanvasRep *)self interactiveCanvasController];
    objc_super v14 = [v13 editorController];
    uint64_t v15 = [v14 mostSpecificCurrentEditorOfClass:objc_opt_class()];

    if (![v15 fillInspectorDisclosed]
      || [(CRLShapeRep *)self isEditingChildRep]
      || ([v13 documentIsSharedReadOnly] & 1) != 0)
    {
      BOOL v5 = 0;
    }
    else
    {
      [(CRLCanvasRep *)self boundsForStandardKnobs];
      double v17 = v16;
      double v19 = v18;
      double v20 = [(CRLCanvasRep *)self canvas];
      [v20 viewScale];
      double v22 = sub_1000646A4(v17, v19, v21);
      double v24 = v23;

      BOOL v5 = v24 >= 40.0 && v22 >= 40.0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  double v3 = [(CRLShapeRep *)self shapeLayout];
  if ([v3 numberOfControlKnobs])
  {
    unsigned __int8 v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    if ([v4 documentIsSharedReadOnly]) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = [(CRLShapeRep *)self shouldShowAdditionalKnobs];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 tag] < 0xC || (unint64_t)objc_msgSend(v4, "tag") >= 0x11)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLShapeRep;
    BOOL v5 = [(CRLCanvasRep *)&v7 canUseSpecializedHitRegionForKnob:v4];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLCanvasRep *)self currentKnobTracker];
  if ([v5 isMemberOfClass:objc_opt_class()]
    && (unint64_t)[v4 tag] >= 0x19)
  {
    id v6 = [v4 tag];

    if ((unint64_t)v6 < 0x1C) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  if ([v4 tag] != (id)22)
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLShapeRep;
    BOOL v7 = [(CRLCanvasRep *)&v9 directlyManagesVisibilityOfKnob:v4];
    goto LABEL_9;
  }
LABEL_7:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v88 updatePositionsOfKnobs:v4];
  BOOL v5 = [(CRLShapeRep *)self p_pathEditor];
  id v6 = v5;
  if (v5) {
    [v5 updatePositionsOfKnobs:v4 forRep:self];
  }
  BOOL v7 = [(CRLShapeRep *)self shapeLayout];
  if ([v7 pathIsLineSegment])
  {
    [v7 pathBounds];
    double v9 = v8;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v85;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v85 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          id v16 = [v15 tag];
          id v17 = [v15 tag];
          if (v16 == (id)11 || v17 == (id)10)
          {
            if (v16 == (id)11) {
              [v7 headPoint];
            }
            else {
              [v7 tailPoint];
            }
            [v15 setPosition:sub_100064680(v19, v20, v9)];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v12);
    }
  }
  if ([(CRLShapeRep *)self shouldShowSmartShapeKnobs]
    || (uint64_t v21 = objc_opt_class(),
        [v7 pathSource],
        double v22 = objc_claimAutoreleasedReturnValue(),
        sub_1002469D0(v21, v22),
        double v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v22,
        v23))
  {
    [(CRLCanvasRep *)self trackingBoundsForStandardKnobs];
    double v25 = v24;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v26 = v4;
    id v27 = [v26 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v28; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v81 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v80 + 1) + 8 * (void)j);
          if ((unint64_t)[v31 tag] >= 0xC && (unint64_t)objc_msgSend(v31, "tag") <= 0x10)
          {
            [v7 getControlKnobPosition:[v31 tag]];
            [v31 setPosition:sub_100064698(v32, v33, v25)];
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v28);
    }
  }
  if ([(CRLShapeRep *)self shouldShowAdvancedGradientKnobs])
  {
    uint64_t v34 = objc_opt_class();
    objc_super v35 = [(CRLShapeRep *)self shapeLayout];
    unint64_t v36 = [v35 fill];
    double v37 = sub_1002469D0(v34, v36);

    double v38 = [(CRLShapeRep *)self shapeLayout];
    [v38 boundsForStandardKnobs];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;

    v47 = [(CRLShapeRep *)self shapeLayout];
    CGRect v48 = [v47 path];
    [v37 startPointForPath:v48 andBounds:v40, v42, v44, v46];
    double v50 = v49;
    double v52 = v51;

    v53 = [(CRLShapeRep *)self shapeLayout];
    v54 = [v53 path];
    [v37 endPointForPath:v54 andBounds:v40, v42, v44, v46];
    double v56 = v55;
    double v58 = v57;

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v59 = v4;
    id v60 = [v59 countByEnumeratingWithState:&v76 objects:v89 count:16];
    if (v60)
    {
      id v61 = v60;
      double v62 = sub_100064698(v56, v58, v40);
      double v64 = v63;
      double v65 = sub_100064698(v50, v52, v40);
      double v67 = v66;
      uint64_t v68 = *(void *)v77;
      do
      {
        for (k = 0; k != v61; k = (char *)k + 1)
        {
          if (*(void *)v77 != v68) {
            objc_enumerationMutation(v59);
          }
          v70 = *(void **)(*((void *)&v76 + 1) + 8 * (void)k);
          id v71 = [v70 tag:v76];
          double v72 = v65;
          double v73 = v67;
          if (v71 != (id)25)
          {
            id v74 = [v70 tag:v65, v67];
            double v72 = v65;
            double v73 = v67;
            if (v74 != (id)26)
            {
              [v70 tag:v65, v67];
              double v72 = v62;
              double v73 = v64;
              if (v75 != (id)27) {
                continue;
              }
            }
          }
          [v70 setPosition:v72, v73];
        }
        id v61 = [v59 countByEnumeratingWithState:&v76 objects:v89 count:16 v72, v73];
      }
      while (v61);
    }
  }
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    if ((unint64_t)[v9 tag] >= 0x19 && (unint64_t)objc_msgSend(v9, "tag") <= 0x1B)
    {
      [v9 cursorActiveScaledRect];
      uint64_t v11 = +[CRLCursor moveCursorWithActiveScaledRect:](CRLCursor, "moveCursorWithActiveScaledRect:");
      goto LABEL_8;
    }
    if ([v9 tag] == (id)10 || objc_msgSend(v9, "tag") == (id)11)
    {
      uint64_t v11 = [v9 resizeCursor];
LABEL_8:
      id v12 = (void *)v11;
      if (v11) {
        goto LABEL_10;
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CRLShapeRep;
  id v12 = -[CRLStyledRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v14, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
LABEL_10:

  return v12;
}

- (id)newTrackerForKnob:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D45C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107646C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D45E8);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep newTrackerForKnob:]");
    BOOL v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1968, 0, "invalid nil value for '%{public}s'", "knob");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [(CRLShapeRep *)self p_pathEditor];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = sub_1002469D0(v10, v4);
    id v12 = (void *)v11;
    if (v9 && v11)
    {
      uint64_t v13 = (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)[v9 newTrackerForKnob:v11 forRep:self];
    }
    else
    {
      unint64_t v14 = (unint64_t)[v4 tag];
      if (v14 - 12 > 4)
      {
        if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
        {
          uint64_t v15 = CRLShapeLineSegmentKnobTracker;
        }
        else
        {
          if (v14 - 25 > 2)
          {
            v17.receiver = self;
            v17.super_class = (Class)CRLShapeRep;
            uint64_t v13 = [(CRLCanvasRep *)&v17 newTrackerForKnob:v4];
            goto LABEL_23;
          }
          uint64_t v15 = CRLGradientFillKnobTracker;
        }
      }
      else
      {
        uint64_t v15 = CRLShapeControlKnobTracker;
      }
      uint64_t v13 = (_TtC8Freeform33CRLShapeConnectionLineKnobTracker *)[[v15 alloc] initWithRep:self knob:v4];
    }
LABEL_23:
    double v8 = v13;

    goto LABEL_24;
  }
  double v8 = [[_TtC8Freeform33CRLShapeConnectionLineKnobTracker alloc] initWithRep:self knob:v4];
LABEL_24:

  return v8;
}

- (BOOL)shouldShowInvisiblePathHighlight
{
  double v3 = [(CRLCanvasRep *)self layout];
  id v4 = [v3 stroke];
  if (v4)
  {
    BOOL v5 = [(CRLCanvasRep *)self layout];
    id v6 = [v5 stroke];
    unsigned int v7 = [v6 shouldRender];
  }
  else
  {
    unsigned int v7 = 0;
  }

  double v8 = [(CRLShapeRep *)self shapeLayout];
  id v9 = [v8 fill];
  if (v9)
  {
    uint64_t v10 = [(CRLShapeRep *)self shapeLayout];
    uint64_t v11 = [v10 fill];
    unsigned int v12 = [v11 isClear] ^ 1;
  }
  else
  {
    unsigned int v12 = 0;
  }

  uint64_t v13 = [(CRLShapeRep *)self shapeLayout];
  unint64_t v14 = [v13 path];
  unsigned int v15 = [v14 isRectangular];

  if ((v7 | v12)) {
    return 0;
  }
  objc_super v17 = [(CRLCanvasRep *)self interactiveCanvasController];
  if (![v17 shouldEverShowPathHighlightOnInvisibleShapes]
    || v15 && [(CRLShapeRep *)self shouldShowSelectionHighlight])
  {
    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = [(CRLShapeRep *)self selectionIsAppropriateToShowInvisiblePathHighlight];
  }

  return v16;
}

- (BOOL)selectionIsAppropriateToShowInvisiblePathHighlight
{
  if ([(CRLCanvasRep *)self isSelected])
  {
    LOBYTE(v3) = 1;
  }
  else if ([(CRLCanvasRep *)self isBeingDragged])
  {
    id v4 = [(CRLCanvasRep *)self layout];
    unsigned int v3 = [v4 isInGroup] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)additionalRenderablesOverRenderable
{
  unsigned int v3 = [(CRLShapeRep *)self shapeInfo];
  unsigned __int8 v4 = [v3 isFreehandDrawingShape];

  if (v4)
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)CRLShapeRep;
    id v6 = [(CRLCanvasRep *)&v36 additionalRenderablesOverRenderable];
    id v5 = [v6 mutableCopy];

    if ([(CRLShapeRep *)self shouldShowInvisiblePathHighlight])
    {
      unsigned int v7 = +[CRLCanvasShapeRenderable renderable];
      [v7 setFillColor:0];
      double v8 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v7 setDelegate:v8];

      id v9 = +[CRLColor colorWithRed:0.596078431 green:0.596078431 blue:0.596078431 alpha:0.45];
      objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

      uint64_t v10 = [(CRLCanvasRep *)self canvas];
      [v10 viewScale];
      double v12 = v11;

      uint64_t v13 = [(CRLCanvasRep *)self canvas];
      [v13 contentsScale];
      double v15 = v12 * v14;

      CGPoint v34 = CGPointZero;
      CGPoint v35 = v34;
      BOOL v16 = +[CRLColor blackColor];
      objc_super v17 = +[CRLStroke strokeWithColor:v16 width:1.0];

      double v18 = [(CRLShapeRep *)self shapeLayout];
      id v32 = 0;
      id v33 = 0;
      [v18 aliasPathForScale:v17 originalStroke:&v33 adjustedStroke:&v32 adjustedPath:&v35 startDelta:&v34 endDelta:v15];
      id v19 = v33;
      id v20 = v32;

      [v19 width];
      [v7 setLineWidth:];
      [v20 boundsIncludingCRLStroke:v17];
      double v23 = sub_100067528(v21, v22, v12);
      memset(&v31, 0, sizeof(v31));
      CGAffineTransformMakeTranslation(&v31, -v23, -v24);
      CGAffineTransformMakeScale(&t2, v12, v12);
      CGAffineTransform t1 = v31;
      CGAffineTransformConcat(&v30, &t1, &t2);
      CGAffineTransform v31 = v30;
      [v20 transformUsingAffineTransform:&v30];
      id v25 = v20;
      [v7 setPath:[v25 CGPath]];
      memset(&t1, 0, 32);
      memset(&v30, 0, sizeof(v30));
      [(CRLCanvasRep *)self computeDirectLayerFrame:&t1 andTransform:&v30];

      [v7 setFrame:t1.a, t1.b, t1.c, t1.d];
      CGAffineTransform v27 = v30;
      [v7 setAffineTransform:&v27];
      [v5 addObject:v7];
    }
  }

  return v5;
}

- (id)overlayRenderables
{
  if ([(CRLShapeRep *)self p_shouldSkipRenderableRecalculations])
  {
    unsigned int v3 = +[CRLCanvasRenderable renderablesFromLayers:&__NSArray0__struct];
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)CRLShapeRep;
    unsigned int v3 = [(CRLCanvasRep *)&v49 overlayRenderables];
    if ([(CRLShapeRep *)self shouldShowAdvancedGradientKnobs]
      && [(CRLCanvasRep *)self isSelectedIgnoringLocking])
    {
      unsigned __int8 v4 = +[CRLCanvasShapeRenderable renderable];
      [v4 setFillColor:0];
      id v5 = +[CRLColor colorWithWhite:0.8 alpha:0.66];
      [v4 setStrokeColor:[v5 CGColor]];

      [v4 setLineWidth:1.0];
      uint64_t v6 = objc_opt_class();
      unsigned int v7 = [(CRLShapeRep *)self shapeLayout];
      double v8 = [v7 fill];
      id v9 = sub_1002469D0(v6, v8);

      uint64_t v10 = [(CRLShapeRep *)self shapeLayout];
      [v10 boundsForStandardKnobs];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      id v19 = [(CRLShapeRep *)self shapeLayout];
      id v20 = [v19 path];
      [v9 startPointForPath:v20 andBounds:v12, v14, v16, v18];
      double v22 = v21;
      double v24 = v23;

      id v25 = [(CRLShapeRep *)self shapeLayout];
      id v26 = [v25 path];
      [v9 endPointForPath:v26 andBounds:v12, v14, v16, v18];
      double v28 = v27;
      double v30 = v29;

      double v31 = sub_100064698(v22, v24, v12);
      CGFloat v33 = v32;
      double v34 = sub_100064698(v28, v30, v12);
      CGFloat v36 = v35;
      memset(&m, 0, sizeof(m));
      double v37 = [(CRLCanvasRep *)self layout];
      double v38 = v37;
      if (v37) {
        [v37 transformInRoot];
      }
      else {
        memset(&m, 0, sizeof(m));
      }

      double v39 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v39 viewScale];
      CGFloat v41 = v40;

      CGAffineTransformMakeScale(&t2, v41, v41);
      CGAffineTransform v45 = m;
      CGAffineTransformConcat(&v47, &v45, &t2);
      CGAffineTransform m = v47;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, &m, v31, v33);
      CGPathAddLineToPoint(Mutable, &m, v34, v36);
      [v4 setPath:Mutable];
      id v43 = [v3 mutableCopy];
      [v43 insertObject:v4 atIndex:0];

      CGPathRelease(Mutable);
      unsigned int v3 = v43;
    }
  }

  return v3;
}

- (id)dynamicResizeDidBegin
{
  v5.receiver = self;
  v5.super_class = (Class)CRLShapeRep;
  unsigned int v3 = [(CRLCanvasRep *)&v5 dynamicResizeDidBegin];
  [(CRLShapeRep *)self p_beginDynamicallyResizingOrMovingLineEnd];

  return v3;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v4 dynamicFreeTransformDidBeginWithTracker:a3];
  [(CRLShapeRep *)self p_beginDynamicallyResizingOrMovingLineEnd];
}

- (BOOL)shouldSetPathSourceWhenChangingInfoGeometry
{
  return 1;
}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  id v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)CRLShapeRep;
  id v7 = a4;
  id v8 = [(CRLCanvasRep *)&v63 newCommandToApplyGeometry:v6 toInfo:v7];
  id v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = sub_10024715C(v9, v7);

  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4608);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076588();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4628);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep newCommandToApplyGeometry:toInfo:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:2145 isFatal:0 description:"Can't create CRLCommandSetInfoGeometry without a persistable object."];
  }
  double v14 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  [(CRLCommandGroup *)v14 addCommand:v8];
  if ([(CRLShapeRep *)self shouldSetPathSourceWhenChangingInfoGeometry])
  {
    double v15 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
    double v16 = [(CRLShapeRep *)self shapeLayout];
    double v17 = [v16 pathSource];
    double v18 = [(CRLCommandSetPathSource *)v15 initWithShapeItem:v10 pathSource:v17];

    [(CRLCommandGroup *)v14 addCommand:v18];
  }
  id v19 = [(CRLShapeRep *)self shapeLayout];
  unsigned int v20 = [v19 i_isInsideResizingFreehandDrawing];

  if (v20)
  {
    double v21 = [(CRLCanvasRep *)self layout];
    double v22 = [v21 stroke];
    id v23 = [v22 mutableCopy];
    uint64_t v24 = objc_opt_class();
    double v30 = sub_100246DEC(v23, v24, 1, v25, v26, v27, v28, v29, (uint64_t)&OBJC_PROTOCOL___CRLMutableStroke);

    double v31 = [_TtC8Freeform19CRLCommandSetStroke alloc];
    double v32 = [(CRLShapeRep *)self shapeInfo];
    CGFloat v33 = [(CRLCommandSetStroke *)v31 initWithStyledItem:v32 stroke:v30];

    [(CRLCommandGroup *)v14 addCommand:v33];
  }
  uint64_t v34 = objc_opt_class();
  double v35 = [(CRLShapeRep *)self shapeInfo];
  CGFloat v36 = sub_1002469D0(v34, v35);

  if (v36)
  {
    double v37 = [v36 pencilKitStrokePathCompactData];
    if (v20 && ([v36 isTreatedAsFillForFreehandDrawing] & 1) == 0)
    {
      double v38 = [v36 geometry];
      [v38 size];
      double v40 = v39;
      double v42 = v41;

      if (v40 <= 0.0 || v42 <= 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D4648);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101076500();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D4668);
        }
        id v43 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v43);
        }
        double v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep newCommandToApplyGeometry:toInfo:]");
        CGAffineTransform v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:v44 file:v45 lineNumber:2173 isFatal:0 description:"CRLFreehandDrawingShapeItem has invalid geometry size."];
      }
      [v6 size];
      if (v40 != v46 || v42 != v47)
      {
        if (v40 <= 0.0) {
          double v48 = 1.0;
        }
        else {
          double v48 = v40;
        }
        double v49 = v46 / v48;
        if (v42 <= 0.0) {
          double v50 = 1.0;
        }
        else {
          double v50 = v42;
        }
        double v51 = v47 / v50;
        if (v51 <= 0.0) {
          double v52 = 1.0;
        }
        else {
          double v52 = v51;
        }
        if (v49 <= 0.0) {
          double v53 = v52;
        }
        else {
          double v53 = v49;
        }
        if (v49 <= 0.0) {
          double v49 = 1.0;
        }
        if (v51 <= 0.0) {
          double v54 = v49;
        }
        else {
          double v54 = v51;
        }
        [v37 renderScaleX:v49];
        double v56 = v53 * v55;
        *(float *)&double v56 = v56;
        [v37 setRenderScaleX:v56];
        [v37 renderScaleY];
        double v58 = v54 * v57;
        *(float *)&double v58 = v58;
        [v37 setRenderScaleY:v58];
      }
    }
    id v59 = [(CRLShapeRep *)self shapeLayout];
    id v60 = [v59 maskPath];

    id v61 = [[_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData alloc] initWithFreehandDrawingShapeItem:v36 strokePathCompactData:v37 maskPath:v60];
    [(CRLCommandGroup *)v14 addCommand:v61];
  }
  return v14;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v4 dynamicResizeDidEndWithTracker:a3];
  [(CRLShapeRep *)self p_endDynamicallyResizingOrMovingLineEnd];
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v4 dynamicFreeTransformDidEndWithTracker:a3];
  [(CRLShapeRep *)self p_endDynamicallyResizingOrMovingLineEnd];
}

- (void)setShadowOnChildrenDisabled:(BOOL)a3
{
  if (self->mShadowOnChildrenDisabled != a3)
  {
    self->mShadowOnChildrenDisabled = a3;
    [(CRLCanvasRep *)self invalidateShadowRenderable];
  }
}

- (BOOL)allowsColorDrop
{
  return 1;
}

- (void)invalidateEffectLayersForChildren
{
  if (!self->mShadowOnChildrenDisabled)
  {
    unsigned int v3 = [(CRLShapeRep *)self shapeLayout];
    objc_super v4 = [v3 fill];
    unsigned __int8 v5 = [v4 isOpaque];

    if ((v5 & 1) == 0)
    {
      [(CRLCanvasRep *)self invalidateShadowRenderable];
    }
  }
}

- (void)invalidateExteriorWrap
{
  mCachedWrapPathInRoot = self->mCachedWrapPathInRoot;
  self->mCachedWrapPathInRoot = 0;
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v6 dynamicallyRotatingWithTracker:a3];
  objc_super v4 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v5 = [v4 isFreehandDrawingShape];

  if (v5) {
    [(CRLShapeRep *)self setNeedsDisplay];
  }
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v4 dynamicallyResizingWithTracker:a3];
  [(CRLShapeRep *)self setNeedsDisplay];
}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v6 dynamicallyFreeTransformingWithTracker:a3];
  objc_super v4 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v5 = [v4 isFreehandDrawingShape];

  if (v5) {
    [(CRLShapeRep *)self setNeedsDisplay];
  }
}

- (id)dataForUpdateUploadIndicator
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(CRLShapeRep *)self shapeInfo];
  unsigned int v5 = [v4 fill];
  objc_super v6 = sub_1002469D0(v3, v5);
  id v7 = [v6 imageData];

  if (v7)
  {
    uint64_t v10 = v7;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)beginEditingWithString:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D4688);
  }
  unsigned int v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    objc_super v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    id v23 = "-[CRLShapeRep beginEditingWithString:]";
    __int16 v24 = 2082;
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m";
    __int16 v26 = 1024;
    int v27 = 2272;
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D46A8);
  }
  id v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = v9;
    double v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep beginEditingWithString:]");
  double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
  double v14 = (objc_class *)objc_opt_class();
  double v15 = NSStringFromClass(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 2272, 0, "Abstract method not overridden by %{public}@", v15);

  double v16 = (objc_class *)objc_opt_class();
  double v17 = NSStringFromClass(v16);
  double v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[CRLShapeRep beginEditingWithString:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (void)beginEditing
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D46C8);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLShapeRep beginEditing]";
    __int16 v22 = 2082;
    id v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m";
    __int16 v24 = 1024;
    int v25 = 2276;
    __int16 v26 = 2114;
    int v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D46E8);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep beginEditing]");
  double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
  double v12 = (objc_class *)objc_opt_class();
  double v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 2276, 0, "Abstract method not overridden by %{public}@", v13);

  double v14 = (objc_class *)objc_opt_class();
  double v15 = NSStringFromClass(v14);
  double v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLShapeRep beginEditing]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)canBeginEditing
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(CRLCanvasRep *)self info];
  unsigned int v5 = [v4 parentInfo];
  objc_super v6 = sub_1002469D0(v3, v5);

  if (v6)
  {
    id v7 = [(CRLCanvasRep *)self info];
    unsigned int v8 = [v6 isNonGroupedChild:v7];
  }
  else
  {
    unsigned int v8 = 0;
  }
  id v9 = [(CRLShapeRep *)self shapeInfo];
  uint64_t v10 = [v9 containingGroup];
  if (![v10 isFreehandDrawing] || v8)
  {
    double v12 = [(CRLShapeRep *)self shapeLayout];
    unsigned int v11 = [v12 pathIsLineSegment] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)isPathEditable
{
  unsigned int v2 = [(CRLShapeRep *)self shapeLayout];
  uint64_t v3 = [v2 pathSource];
  unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (BOOL)canMakePathEditable
{
  return 1;
}

- (CRLEditableBezierPathSource)editablePathSource
{
  unsigned int v2 = [(CRLShapeRep *)self shapeLayout];
  uint64_t v3 = [v2 editablePathSource];

  return (CRLEditableBezierPathSource *)v3;
}

- (CGAffineTransform)naturalToEditablePathSpaceTransform
{
  [(CRLCanvasRep *)self boundsForStandardKnobs];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  id v9 = [(CRLShapeRep *)self shapeInfo];
  uint64_t v10 = [v9 pathSource];
  unsigned int v11 = v10;
  if (v10)
  {
    [v10 pathFlipTransform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  CGAffineTransformMakeTranslation(&t2, v6, v8);
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tdouble x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformConcat(&v17, &v15, &t2);
  long long v14 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v17.tx;
  return result;
}

- (id)p_pathEditor
{
  if ([(CRLShapeRep *)self canMakePathEditable])
  {
    uint64_t v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned __int8 v4 = [v3 editorController];
    double v5 = [v4 mostSpecificCurrentEditorOfClass:objc_opt_class()];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)isEditingPath
{
  unsigned int v2 = [(CRLShapeRep *)self p_pathEditor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dynamicMovePathKnobDidBegin
{
  id v3 = [(CRLShapeRep *)self dynamicResizeDidBegin];
  id v4 = [(CRLShapeRep *)self shapeLayout];
  [v4 dynamicMovePathKnobDidBegin];
}

- (void)dynamicallyMovedPathKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v9 = [(CRLShapeRep *)self shapeLayout];
  [v9 dynamicallyMovedPathKnobTo:v7 withTracker:x, y];

  self->mFrameInUnscaledCanvasIsValid = 0;
  CGFloat v8 = [v9 layoutController];
  [v8 validateLayoutWithDependencies:v9];

  [(CRLCanvasRep *)self invalidateKnobPositions];
  [(CRLShapeRep *)self setNeedsDisplay];
}

- (void)dynamicMovePathKnobDidEndWithTracker:(id)a3
{
  id v5 = a3;
  id v4 = [(CRLShapeRep *)self shapeLayout];
  [v4 dynamicMovePathKnobDidEnd];

  if (!v5
    || ([v5 didDrag] & 1) != 0
    || ([v5 isCreatingNode] & 1) != 0
    || [v5 toggleNodeType])
  {
    [(CRLShapeRep *)self enqueuePathSourceChanges];
  }
  [(CRLShapeRep *)self dynamicResizeDidEndWithTracker:0];
  [(CRLShapeRep *)self p_endDynamicallyResizingOrMovingLineEnd];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (id)dynamicMoveLineSegmentDidBegin
{
  id v3 = [(CRLShapeRep *)self dynamicResizeDidBegin];

  return [(CRLShapeRep *)self shapeLayout];
}

- (void)dynamicallyMovingLineSegmentWithTracker:(id)a3
{
  id v4 = a3;
  id v6 = [(CRLShapeRep *)self shapeLayout];
  [v6 dynamicallyMovingLineSegmentWithTracker:v4];

  id v5 = [v6 layoutController];
  [v5 validateLayoutWithDependencies:v6];

  [(CRLShapeRep *)self setNeedsDisplay];
}

- (void)dynamicMoveLineSegmentDidEndWithTracker:(id)a3
{
  id v11 = a3;
  [(CRLShapeRep *)self dynamicResizeDidEndWithTracker:0];
  if (v11 && [v11 didDrag])
  {
    id v4 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
    id v5 = [(CRLShapeRep *)self shapeInfo];
    id v6 = [(CRLShapeRep *)self shapeLayout];
    id v7 = [v6 pathSource];
    CGFloat v8 = [(CRLCommandSetPathSource *)v4 initWithShapeItem:v5 pathSource:v7];

    id v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    uint64_t v10 = [v9 commandController];
    [v10 enqueueCommand:v8];
  }
  [(CRLShapeRep *)self p_endDynamicallyResizingOrMovingLineEnd];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (id)dynamicMoveSmartShapeKnobDidBegin
{
  id v3 = [(CRLShapeRep *)self dynamicResizeDidBegin];
  id v4 = [(CRLShapeRep *)self shapeLayout];
  [v4 dynamicMoveSmartShapeKnobDidBegin];

  return [(CRLShapeRep *)self shapeLayout];
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v7 = [(CRLShapeRep *)self shapeLayout];
  [v7 dynamicallyMovedSmartShapeKnobTo:v9 withTracker:x, y];
  self->mFrameInUnscaledCanvasIsValid = 0;
  CGFloat v8 = [v7 layoutController];
  [v8 validateLayoutWithDependencies:v7];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 isEnqueueingCommandsInRealTime]) {
    [(CRLShapeRep *)self enqueuePathSourceChanges];
  }
  [(CRLCanvasRep *)self invalidateKnobPositions];
  [(CRLShapeRep *)self setNeedsDisplay];
}

- (void)enqueuePathSourceChanges
{
  id v3 = [(CRLShapeRep *)self shapeLayout];
  id v4 = [(CRLShapeRep *)self shapeInfo];
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v6 = [v5 commandController];
  [v6 openGroup];
  id v7 = +[NSBundle mainBundle];
  CGFloat v8 = [v7 localizedStringForKey:@"Move" value:0 table:@"UndoStrings"];
  [v6 setCurrentGroupActionString:v8];

  id v9 = [v3 layoutInfoGeometry];
  uint64_t v10 = [v3 layoutInfoGeometry];
  id v11 = [v4 geometry];
  unsigned __int8 v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    id v13 = [(CRLShapeRep *)self newCommandToApplyGeometry:v9 toInfo:v4];
    if (!v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4708);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076610();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4728);
      }
      long long v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      CGAffineTransform v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep enqueuePathSourceChanges]");
      double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 2432, 0, "invalid nil value for '%{public}s'", "cmd");
    }
    [v6 enqueueCommand:v13];
  }
  CGAffineTransform v17 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
  double v18 = [v3 pathSource];
  unsigned int v19 = [(CRLCommandSetPathSource *)v17 initWithShapeItem:v4 pathSource:v18];

  [v6 enqueueCommand:v19];
  [v6 closeGroup];
}

- (void)dynamicMoveSmartShapeKnobDidEndWithTracker:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 didDrag]) {
    [(CRLShapeRep *)self enqueuePathSourceChanges];
  }
  [(CRLShapeRep *)self dynamicResizeDidEndWithTracker:0];
  [(CRLShapeRep *)self p_endDynamicallyResizingOrMovingLineEnd];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4 withCommittedPointRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id v11 = [(CRLShapeRep *)self shapeLayout];
  [v11 dynamicallySetBezierPathSource:v10 atUnscaledOrigin:x, y];

  self->mAvailableToCommitPointRange.NSUInteger location = location;
  self->mAvailableToCommitPointRange.NSUInteger length = length;
  unsigned __int8 v12 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v12 invalidateContentLayersForRep:self];

  id v13 = [v10 bezierPath];

  id v14 = [(CRLShapeRep *)self i_uncommittedFreehandDrawingPointRange];
  id v16 = [v13 copyWithPointsInRange:v14, v15];

  if ([v16 isEmpty])
  {
    CGFloat v17 = CGRectNull.origin.x;
    CGFloat v18 = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  else
  {
    unsigned int v21 = [(CRLCanvasRep *)self layout];
    __int16 v22 = [v21 stroke];
    [v16 boundsIncludingCRLStroke:v22];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    double v31 = [(CRLCanvasRep *)self layout];
    double v32 = [v31 stroke];
    [v32 renderedWidth];
    CGFloat v34 = v33 * -2.0;
    double v35 = [(CRLCanvasRep *)self layout];
    CGFloat v36 = [v35 stroke];
    [v36 renderedWidth];
    CGFloat v38 = v37 * -2.0;
    v49.origin.double x = v24;
    v49.origin.double y = v26;
    v49.size.CGFloat width = v28;
    v49.size.CGFloat height = v30;
    CGRect v50 = CGRectInset(v49, v34, v38);
    CGFloat v39 = v50.origin.x;
    CGFloat v40 = v50.origin.y;
    CGFloat v41 = v50.size.width;
    CGFloat v42 = v50.size.height;

    CGAffineTransformMakeTranslation(&v48, x, y);
    v51.origin.double x = v39;
    v51.origin.double y = v40;
    v51.size.CGFloat width = v41;
    v51.size.CGFloat height = v42;
    CGRect v52 = CGRectApplyAffineTransform(v51, &v48);
    -[CRLCanvasRep convertNaturalRectFromUnscaledCanvas:](self, "convertNaturalRectFromUnscaledCanvas:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
    CGFloat v17 = v43;
    CGFloat v18 = v44;
    CGFloat width = v45;
    CGFloat height = v46;
  }
  p_mLastDynamicInvalidRect = &self->mLastDynamicInvalidRect;
  v55.origin.double x = CGRectZero.origin.x;
  v55.origin.double y = CGRectZero.origin.y;
  v55.size.CGFloat width = CGRectZero.size.width;
  v55.size.CGFloat height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mLastDynamicInvalidRect, v55))
  {
    [(CRLShapeRep *)self p_forceSetNeedsDisplay];
  }
  else
  {
    v56.origin.double x = p_mLastDynamicInvalidRect->origin.x;
    v56.origin.double y = self->mLastDynamicInvalidRect.origin.y;
    v56.size.CGFloat width = self->mLastDynamicInvalidRect.size.width;
    v56.size.CGFloat height = self->mLastDynamicInvalidRect.size.height;
    v53.origin.double x = v17;
    v53.origin.double y = v18;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    CGRect v54 = CGRectUnion(v53, v56);
    -[CRLShapeRep p_forceSetNeedsDisplayInRect:](self, "p_forceSetNeedsDisplayInRect:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  }
  p_mLastDynamicInvalidRect->origin.double x = v17;
  self->mLastDynamicInvalidRect.origin.double y = v18;
  self->mLastDynamicInvalidRect.size.CGFloat width = width;
  self->mLastDynamicInvalidRect.size.CGFloat height = height;
}

- (void)i_setIsCurrentlyBeingFreehandDrawn:(BOOL)a3
{
  if (self->_isCurrentlyBeingFreehandDrawn != a3)
  {
    if (a3)
    {
      id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v5 i_setNeedsDisplayIfNeededForAncestorRepOf:self];

      self->_isCurrentlyBeingFreehandDrawn = a3;
      [(CRLShapeRep *)self p_forceSetNeedsDisplay];
    }
    else
    {
      self->_isCurrentlyBeingFreehandDrawn = 0;
      [(CRLShapeRep *)self p_forceSetNeedsDisplay];
      id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v6 i_setNeedsDisplayIfNeededForAncestorRepOf:self];
    }
  }
}

- (_NSRange)i_uncommittedFreehandDrawingPointRange
{
  if (![(CRLShapeRep *)self i_isCurrentlyBeingFreehandDrawn])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4748);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010766A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4768);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep i_uncommittedFreehandDrawingPointRange]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:2558 isFatal:0 description:"Only should be checking the uncommitted point range if we are freehand drawing; it is the freehand drawing cache mechanism."];
  }
  id v6 = [(CRLShapeRep *)self shapeLayout];
  id v7 = [v6 pathSource];
  CGFloat v8 = [v7 bezierPath];
  id v9 = [v8 elementCount];

  NSUInteger length = self->mCommittedPointRange.length;
  NSUInteger v11 = length + self->mCommittedPointRange.location;
  NSUInteger v12 = (NSUInteger)v9 - length;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (CGRect)p_scaledCanvasScrollViewBounds
{
  unsigned int v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v3 = [v2 canvasView];

  id v4 = [v3 enclosingScrollView];
  id v5 = [v3 canvasLayer];
  id v6 = [v4 layer];
  [v4 bounds];
  [v6 convertRect:v5 toLayer:];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)willBeRemoved
{
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v9 willBeRemoved];
  if (!self->mDownloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4788);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107672C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D47A8);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep willBeRemoved]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2589, 0, "invalid nil value for '%{public}s'", "mDownloadObserverIdentifier");
  }
  id v6 = [(CRLShapeRep *)self shapeInfo];
  double v7 = [v6 store];
  double v8 = [v7 assetManager];
  [v8 removeAllDownloadObserversWithIdentifier:self->mDownloadObserverIdentifier];
}

- (void)p_listenForAssetChangesIfAppropriate
{
  mDownloadObserverIdentifier = self->mDownloadObserverIdentifier;
  if (!mDownloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D47C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010767C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D47E8);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRep p_listenForAssetChangesIfAppropriate]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 2594, 0, "invalid nil value for '%{public}s'", "mDownloadObserverIdentifier");

    mDownloadObserverIdentifier = self->mDownloadObserverIdentifier;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E37D4;
  v14[3] = &unk_1014D3C48;
  v14[4] = self;
  v14[5] = mDownloadObserverIdentifier;
  double v7 = mDownloadObserverIdentifier;
  double v8 = objc_retainBlock(v14);
  uint64_t v9 = objc_opt_class();
  double v10 = [(CRLShapeRep *)self shapeInfo];
  double v11 = [v10 fill];
  double v12 = sub_1002469D0(v9, v11);
  double v13 = [v12 imageData];
  ((void (*)(void *, void *))v8[2])(v8, v13);
}

- (void)p_handleAssetPreparationCompletion
{
  if (![(CRLCanvasRep *)self hasBeenRemoved])
  {
    [(CRLShapeRep *)self setNeedsDisplay];
    id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v3 invalidateContentLayersForRep:self];
  }
}

- (void)p_beginDynamicallyResizingOrMovingLineEnd
{
  id v3 = [(CRLCanvasRep *)self layout];
  id v4 = [v3 stroke];

  if ([v4 shouldRender]) {
    [(CRLShapeRep *)self setNeedsDisplay];
  }
}

- (void)p_endDynamicallyResizingOrMovingLineEnd
{
  id v3 = [(CRLCanvasRep *)self layout];
  id v4 = [v3 stroke];

  if ([v4 shouldRender]) {
    [(CRLShapeRep *)self setNeedsDisplay];
  }
}

- (BOOL)p_pathIsAxisAlignedRect
{
  id v3 = [(CRLShapeRep *)self shapeInfo];
  unsigned __int8 v4 = [v3 isFreehandDrawingShape];

  if ((v4 & 1) == 0)
  {
    id v6 = [(CRLShapeRep *)self shapeInfo];
    double v7 = [(CRLShapeRep *)self shapeLayout];
    if ([v7 pathIsOpen])
    {
      double v8 = [v6 headLineEnd];
      if (v8)
      {

LABEL_7:
        BOOL v5 = 0;
LABEL_18:

        return v5;
      }
      uint64_t v9 = [v6 tailLineEnd];

      if (v9) {
        goto LABEL_7;
      }
    }
    double v10 = [v7 path];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    if ([(CRLCanvasRep *)self isInDynamicOperation])
    {
      if (v7)
      {
        [v7 originalTransformInRoot];
LABEL_14:
        if ([v10 isRectangular])
        {
          v12[0] = v13;
          v12[1] = v14;
          v12[2] = v15;
          BOOL v5 = sub_10007F9C0((double *)v12);
        }
        else
        {
          BOOL v5 = 0;
        }

        goto LABEL_18;
      }
    }
    else if (v7)
    {
      [v7 transformInRoot];
      goto LABEL_14;
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)p_canApplyStrokeToRenderable
{
  if ([(CRLShapeRep *)self p_pathIsAxisAlignedRect])
  {
    id v3 = [(CRLCanvasRep *)self layout];
    unsigned __int8 v4 = [v3 stroke];

    BOOL v5 = [(CRLShapeRep *)self shapeLayout];
    id v6 = [v5 fill];

    if (v6)
    {
      [(CRLShapeRep *)self opacity];
      BOOL v8 = v7 == 1.0;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v8 = 1;
      if (!v4) {
        goto LABEL_9;
      }
    }
    if ([v4 shouldRender])
    {
      unsigned int v9 = [v4 canApplyDirectlyToRepRenderable] & v8;
LABEL_10:

      return v9;
    }
LABEL_9:
    LOBYTE(v9) = 1;
    goto LABEL_10;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)p_canApplyFillToRenderable
{
  if (![(CRLShapeRep *)self p_pathIsAxisAlignedRect]) {
    return 0;
  }
  id v3 = [(CRLShapeRep *)self shapeLayout];
  unsigned __int8 v4 = [v3 fill];

  if (v4 && ([v4 isClear] & 1) == 0) {
    unsigned __int8 v5 = [v4 canApplyToRenderable];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (CGRect)boundsForCollaboratorCursorRenderable
{
  v35.receiver = self;
  v35.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v35 boundsForCollaboratorCursorRenderable];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CRLShapeRep *)self shapeLayout];
  unsigned int v12 = [v11 shouldAdjustForStrokeWidthForCollabCursor];

  if (v12)
  {
    long long v13 = [(CRLCanvasRep *)self info];
    long long v14 = [v13 geometry];
    [v14 size];
    double v16 = v15;

    if (v16 == 0.0)
    {
      double v17 = [(CRLShapeRep *)self shapeLayout];
      double v18 = [v17 stroke];
      [v18 width];
      double v10 = v19;

      __int16 v20 = [(CRLShapeRep *)self shapeLayout];
      unsigned int v21 = [v20 stroke];
      [v21 width];
      double v6 = v6 + v22 * -0.5;
LABEL_6:

      goto LABEL_7;
    }
    double v23 = [(CRLCanvasRep *)self info];
    CGFloat v24 = [v23 geometry];
    [v24 size];
    double v26 = v25;

    if (v26 == 0.0)
    {
      double v27 = [(CRLShapeRep *)self shapeLayout];
      CGFloat v28 = [v27 stroke];
      [v28 width];
      double v8 = v29;

      __int16 v20 = [(CRLShapeRep *)self shapeLayout];
      unsigned int v21 = [v20 stroke];
      [v21 width];
      double v4 = v4 + v30 * -0.5;
      goto LABEL_6;
    }
  }
LABEL_7:
  double v31 = v4;
  double v32 = v6;
  double v33 = v8;
  double v34 = v10;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  double v3 = [(CRLShapeRep *)self shapeLayout];
  unsigned int v4 = [v3 pathIsLineSegment];

  if (!v4) {
    return 0;
  }
  double v5 = [(CRLShapeRep *)self shapeLayout];
  [v5 headPoint];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(CRLShapeRep *)self shapeLayout];
  [v10 tailPoint];
  double v13 = sub_100065E00(v7, v9, v11, v12, 0.5);
  double v15 = v14;

  double v16 = [(CRLCanvasRep *)self canvas];
  double v17 = [(CRLCanvasRep *)self canvas];
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v13, v15);
  [v17 convertUnscaledToBoundsPoint:];
  [v16 i_approximateScaledFrameOfEditingMenuAtPoint:];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  double v26 = [(CRLCanvasRep *)self canvas];
  double v27 = [(CRLShapeRep *)self shapeLayout];
  [v27 headPoint];
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  [v26 convertUnscaledToBoundsPoint:];
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  double v32 = [(CRLCanvasRep *)self canvas];
  double v33 = [(CRLShapeRep *)self shapeLayout];
  [v33 tailPoint];
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  [v32 convertUnscaledToBoundsPoint:];
  uint64_t v35 = v34;
  uint64_t v37 = v36;

  v47.origin.double x = v19;
  v47.origin.double y = v21;
  v47.size.CGFloat width = v23;
  v47.size.CGFloat height = v25;
  v46.double x = v29;
  v46.double y = v31;
  if (CGRectContainsPoint(v47, v46)) {
    return 1;
  }
  CGFloat v39 = v19;
  CGFloat v40 = v21;
  CGFloat v41 = v23;
  CGFloat v42 = v25;
  uint64_t v43 = v35;
  uint64_t v44 = v37;

  return CGRectContainsPoint(*(CGRect *)&v39, *(CGPoint *)&v43);
}

- (void)documentModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRep;
  [(CRLCanvasRep *)&v3 documentModeDidChange];
  [(CRLShapeRep *)self p_invalidateHitTestCache];
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return 1;
}

- (CRLShapeRepFreehandDrawingDynamicFillErasingDelegate)freehandDrawingDynamicFillErasingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_freehandDrawingDynamicFillErasingDelegate);

  return (CRLShapeRepFreehandDrawingDynamicFillErasingDelegate *)WeakRetained;
}

- (void)setFreehandDrawingDynamicFillErasingDelegate:(id)a3
{
}

- (BOOL)shadowOnChildrenDisabled
{
  return self->mShadowOnChildrenDisabled;
}

- (BOOL)i_isCurrentlyBeingFreehandDrawn
{
  return self->_isCurrentlyBeingFreehandDrawn;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_freehandDrawingDynamicFillErasingDelegate);
  objc_storeStrong((id *)&self->mCachedWrapPathInRoot, 0);
  objc_storeStrong((id *)&self->mDownloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->mHitTestCache, 0);

  objc_storeStrong((id *)&self->mHelper, 0);
}

@end