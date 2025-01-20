@interface CRLCanvasLayout
- (BOOL)allowIntersectionOfChildLayout:(id)a3;
- (BOOL)allowsConnections;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canInspectGeometry;
- (BOOL)canvasShouldScrollForSelectionPath:(id)a3;
- (BOOL)childLayoutIsCurrentlyHiddenWhileManipulating:(id)a3;
- (BOOL)descendentWrappablesContainsWrappable:(id)a3;
- (BOOL)i_anyAncestorCurrentlyBeingFreeTransformedWantsNormalLayoutDuringDynamicFreeTransform;
- (BOOL)i_anyAncestorCurrentlyBeingRotatedWantsNormalLayoutDuringDynamicRotation;
- (BOOL)inspectorGeometryIsAffectedByChangeRecord:(id)a3;
- (BOOL)invalidGeometry;
- (BOOL)isBeingManipulated;
- (BOOL)isBeingTransformed;
- (BOOL)isDraggable;
- (BOOL)isDynamicallyChangingAvailableSpaceForContainedChild;
- (BOOL)isInGroup;
- (BOOL)isInRealTimeDynamicOperation;
- (BOOL)isInTopLevelContainerForEditing;
- (BOOL)isPositionInvalid;
- (BOOL)isSelectable;
- (BOOL)isStrokeBeingManipulated;
- (BOOL)layoutHasValidFrameForCulling;
- (BOOL)orderedBefore:(id)a3;
- (BOOL)parentAutosizes;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)selectionMustBeEntirelyOnscreenToCountAsVisibleInSelectionPath:(id)a3;
- (BOOL)shouldBringCardinalMagnetsInward;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldFlipMagnetsDuringResize;
- (BOOL)shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:(id)a3;
- (BOOL)shouldProvideGuidesDuringExclusiveAlignmentOperation;
- (BOOL)shouldProvideSizingGuides;
- (BOOL)shouldValidate;
- (BOOL)wantsNormalLayoutDuringDynamicFreeTransform;
- (BOOL)wantsParentResizeTransform;
- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3;
- (CGAffineTransform)originalPureTransformInRoot;
- (CGAffineTransform)originalTransformInRoot;
- (CGAffineTransform)pureTransformInRoot;
- (CGPoint)alignmentFrameOriginForFixingInterimPosition;
- (CGPoint)cardinalEastPosition;
- (CGPoint)cardinalNorthPosition;
- (CGPoint)cardinalSouthPosition;
- (CGPoint)cardinalWestPosition;
- (CGPoint)centerForConnecting;
- (CGPoint)centerForRotation;
- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)findNewEdgeMagnetCanvasPositionForConnectionLine:(id)a3 forLineEnd:(unint64_t)a4 withCanvasPosition:(CGPoint)a5;
- (CGPoint)getCardinalPositionFromType:(unint64_t)a3;
- (CGPoint)getCardinalPositionWithParentTransformFromType:(unint64_t)a3;
- (CGPoint)nearestEdgePointOnWrapPathFromPoint:(CGPoint)a3;
- (CGPoint)p_convertNormalizedPositionFromLayoutToPureGeomtry:(CGPoint)a3 forLayout:(id)a4;
- (CGPoint)p_findFirstEdgePointIntersectionOnWrapPathWithLine:(id)a3 forLineEnd:(unint64_t)a4 withDistanceToPoint:(double *)a5 withOverridenHeadPosition:(CGPoint)a6 withOverridenTailPosition:(CGPoint)a7;
- (CGPoint)p_findNearestEdgePointOnWrapPathFromPoint:(CGPoint)a3 withSearchThreshold:(double)a4 withDistanceToPoint:(double *)a5;
- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3;
- (CGRect)boundsForStandardKnobs;
- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3;
- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3;
- (CGRect)frameForCaptionPositioning;
- (CGRect)frameForCulling;
- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (CGRect)frameForMiniFormatterPositioning;
- (CGRect)i_takeDirtyRect;
- (CGRect)initialBoundsForStandardKnobs;
- (CGRect)p_frameForCullingWithAdditionalTransform:(CGAffineTransform *)a3;
- (CGRect)rectInRootForSelectionPath:(id)a3;
- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3;
- (CGRect)shadowedNaturalBoundsWithoutOffset;
- (CGSize)maximumFrameSizeForChild:(id)a3;
- (CGSize)maximumInlineFrameSize;
- (CGSize)minimumSize;
- (CGSize)p_newMaxInlineFrameSize;
- (CRLBezierPath)i_wrapPath;
- (CRLCanvasElementInfo)info;
- (CRLCanvasInfoGeometry)finalInfoGeometryForFreeTransform;
- (CRLCanvasInfoGeometry)finalInfoGeometryForResize;
- (CRLCanvasInfoGeometry)infoGeometryBeforeDynamicOperation;
- (CRLCanvasLayout)initWithInfo:(id)a3;
- (CRLCanvasLayoutGeometry)dynamicGeometry;
- (CRLCanvasLayoutGeometry)inspectorGeometry;
- (CRLCanvasLayoutGeometry)originalGeometry;
- (CRLCanvasLayoutGeometry)originalPureGeometry;
- (CRLCanvasLayoutGeometry)pureGeometry;
- (CRLCanvasLayoutGeometry)pureGeometryInParent;
- (CRLCanvasLayoutGeometry)pureGeometryInRoot;
- (CRLSearchReference)searchTargetSearchReference;
- (CRLStroke)stroke;
- (Class)repClassOverride;
- (NSArray)additionalLayoutsForRepCreation;
- (NSArray)bidirectionalSizeDependentLayouts;
- (NSArray)childSearchTargets;
- (NSArray)dependentLayouts;
- (NSArray)dependentLayoutsForDrag;
- (NSSet)additionalGuides;
- (NSSet)connectedLayouts;
- (NSSet)reliedOnLayouts;
- (double)descentForInlineLayout;
- (double)inlineCenteredAlignmentHorizontalOffset;
- (double)inspectorGeometryAngleInDegrees;
- (double)percentOfUnscaledRectContainedInParentRep:(CGRect)a3;
- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withTransform:(CGAffineTransform *)a4;
- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childInfosForChildLayouts;
- (id)commandForSettingAspectRatioLocked:(BOOL)a3;
- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3;
- (id)commandToFlipWithOrientation:(int)a3;
- (id)commandsForAdjustingMagnetsFromClineLayouts;
- (id)computeInfoGeometryDuringResize;
- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3;
- (id)computeLayoutGeometry;
- (id)convexHullPath;
- (id)descendentWrappables;
- (id)layoutController;
- (id)layoutGeometryFromInfo;
- (id)newCommandToMoveByOffset:(CGPoint)a3 whenDistributingLayoutsByOffsets:(id)a4;
- (id)rootLayout;
- (id)unscaledPositionsForCollaboratorHUDForSelectionPath:(id)a3;
- (int)layoutState;
- (unint64_t)freeTransformState;
- (unint64_t)p_directionForCollaboratorCursorKnobTag:(unint64_t)a3;
- (void)addConnectedLayout:(id)a3;
- (void)adjustCustomMagnetPositions;
- (void)beginDrag;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)beginFreeTransformWithTracker:(id)a3;
- (void)beginResize;
- (void)beginRotate;
- (void)calculateAndSetPointsToSearchReference:(id)a3;
- (void)dragBy:(CGPoint)a3;
- (void)dragByUnscaled:(CGPoint)a3;
- (void)endDynamicOperation;
- (void)enqueueCommandsForAdjustingPathSourcesAfterRoutingChanges;
- (void)i_clearInvalidationCache;
- (void)i_recursivelyClearInvalidationCache;
- (void)invalidate;
- (void)invalidateCacheForMagnets;
- (void)invalidateChildren;
- (void)invalidateExteriorWrap;
- (void)invalidateFrame;
- (void)invalidateFrameForCulling;
- (void)invalidatePosition;
- (void)invalidatePositionWithoutSideEffects;
- (void)invalidateSize;
- (void)invalidateSizeWithoutSideEffects;
- (void)layoutSearchForHyperlinkWithHitBlock:(id)a3;
- (void)layoutSearchForNearbyElementsWithHitBlock:(id)a3;
- (void)p_adjustCardinalMagnetTValuesIfNeededWithPadding:(double)a3 forLowestT:(double *)a4 forHighestT:(double *)a5;
- (void)p_adjustEdgeMagnetPosition:(id)a3 forLineEnd:(unint64_t)a4;
- (void)p_adjustFloatingMagnetPosition:(id)a3 forLineEnd:(unint64_t)a4;
- (void)p_calculateClampModelValuesWithAdditionalTransform:(CGAffineTransform *)a3 andPerformBlock:(id)a4;
- (void)p_calculateMagnetPositionsIfNeeded;
- (void)p_getIntersectionsForTestPath:(id)a3 withLowestT:(double *)a4 withHighestT:(double *)a5;
- (void)p_invalidateConnectedLayouts;
- (void)p_invalidateDescendentWrapPaths;
- (void)p_invalidateDescendentWrapPathsInRoot;
- (void)p_recursiveInvalidate;
- (void)p_registerWithLayoutController:(id)a3;
- (void)p_unregisterWithLayoutController:(id)a3;
- (void)p_updateDescendentWrapPathsWithTransform:(CGAffineTransform *)a3;
- (void)processChangedProperty:(unint64_t)a3;
- (void)processChanges:(id)a3;
- (void)recursivelyAddLayoutAndDependentLayoutsToValidateSet:(id)a3;
- (void)removeConnectedLayout:(id)a3;
- (void)setDynamicGeometry:(id)a3;
- (void)setInitialBoundsForStandardKnobs:(CGRect)a3;
- (void)setMaximumInlineFrameSize:(CGSize)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setOriginalGeometry:(id)a3;
- (void)setParent:(id)a3;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeRotationFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5;
- (void)unregisterFromLayoutController;
- (void)updateChildrenFromInfo;
- (void)validate;
@end

@implementation CRLCanvasLayout

- (CRLCanvasLayout)initWithInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasLayout;
  v6 = [(CRLCanvasAbstractLayout *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 74), a3);
    v7[154] |= 7u;
    *(int64x2_t *)(v7 + 210) = vdupq_n_s64(0x7FF8000000000000uLL);
    CGSize size = CGRectNull.size;
    *(CGPoint *)(v7 + 226) = CGRectNull.origin;
    *(CGSize *)(v7 + 242) = size;
  }

  return (CRLCanvasLayout *)v7;
}

- (CRLCanvasLayoutGeometry)dynamicGeometry
{
  if (*(void *)((char *)&self->mInvalidFlags + 2))
  {
    v2 = [(CRLCanvasAbstractLayout *)self geometry];
  }
  else
  {
    v2 = 0;
  }

  return (CRLCanvasLayoutGeometry *)v2;
}

- (void)setDynamicGeometry:(id)a3
{
  id v4 = a3;
  if (!*(void *)((char *)&self->mInvalidFlags + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9A20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097B70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9A40);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout setDynamicGeometry:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 141, 0, "invalid nil value for '%{public}s'", "mBaseGeometry");
  }
  [(CRLCanvasAbstractLayout *)self setGeometry:v4];
  [(CRLCanvasLayout *)self invalidate];
}

- (CGRect)frameForCulling
{
  v3 = (double *)((char *)&self->mMaximumInlineFrameSize.height + 2);
  v10.origin.x = *(CGFloat *)((char *)&self->mMaximumInlineFrameSize.height + 2);
  v10.origin.y = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.x + 2);
  v10.size.width = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.y + 2);
  v10.size.height = *(CGFloat *)((char *)&self->mCachedFrameForCulling.size.width + 2);
  if (CGRectIsNull(v10))
  {
    long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9[1] = v4;
    v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(CRLCanvasLayout *)self p_frameForCullingWithAdditionalTransform:v9];
    double *v3 = v5;
    v3[1] = v6;
    v3[2] = v7;
    v3[3] = v8;
  }
  else
  {
    double v5 = *v3;
    double v6 = v3[1];
    double v7 = v3[2];
    double v8 = v3[3];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  [(CRLCanvasAbstractLayout *)self frame];
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v5.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = *(_OWORD *)&a3->tx;
  return CGRectApplyAffineTransform(v6, &v5);
}

- (CGRect)p_frameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  long long v11 = *(_OWORD *)&a3->a;
  long long v12 = v5;
  long long v13 = *(_OWORD *)&a3->tx;
  [(CRLCanvasLayout *)self baseFrameForFrameForCullingWithAdditionalTransform:&v11];
  long long v6 = *(_OWORD *)&a3->c;
  long long v11 = *(_OWORD *)&a3->a;
  long long v12 = v6;
  long long v13 = *(_OWORD *)&a3->tx;
  -[CRLCanvasLayout frameForCullingWithBaseFrame:additionalTransform:](self, "frameForCullingWithBaseFrame:additionalTransform:", &v11);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v30, 0, sizeof(v30));
  double v10 = [(CRLCanvasAbstractLayout *)self geometry];
  long long v11 = v10;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(&v30, 0, sizeof(v30));
  }

  CGAffineTransform t1 = v30;
  memset(&v29, 0, sizeof(v29));
  long long v12 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v12;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v29, &t1, &t2);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v13 = [(CRLCanvasAbstractLayout *)self children];
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v18 shouldBeIncludedInParentFrameForCulling])
        {
          CGAffineTransform t1 = v29;
          [v18 p_frameForCullingWithAdditionalTransform:&t1];
          v35.origin.CGFloat x = x;
          v35.origin.CGFloat y = y;
          v35.size.CGFloat width = width;
          v35.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (BOOL)shouldValidate
{
  return 1;
}

- (void)invalidate
{
  if ((BYTE6(self->mDirtyRect.size.height) & 1) == 0)
  {
    v3 = [(CRLCanvasLayout *)self layoutController];
    [v3 invalidateLayout:self];

    BYTE6(self->mDirtyRect.size.height) = BYTE6(self->mDirtyRect.size.height) & 0xFE | ([(CRLCanvasLayout *)self layoutState] != 0);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v4 = [(CRLCanvasLayout *)self dependentLayouts];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) invalidate];
          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(CRLCanvasLayout *)self p_invalidateConnectedLayouts];
    [(CRLCanvasLayout *)self invalidateFrameForCulling];
  }
}

- (void)i_recursivelyClearInvalidationCache
{
  [(CRLCanvasLayout *)self i_clearInvalidationCache];
  id v4 = [(CRLCanvasAbstractLayout *)self children];
  [v4 makeObjectsPerformSelector:a2];
}

- (void)i_clearInvalidationCache
{
  BYTE6(self->mDirtyRect.size.height) &= 0xFCu;
}

- (void)invalidatePosition
{
  *(&self->mInvalidatingSize + 2) |= 1u;
  [(CRLCanvasLayout *)self invalidateCacheForMagnets];

  [(CRLCanvasLayout *)self invalidate];
}

- (BOOL)shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:(id)a3
{
  return 0;
}

- (void)invalidateSize
{
  if ((BYTE6(self->mDirtyRect.size.height) & 2) == 0 && !BYTE2(self->mDirtyRect.size.height))
  {
    BYTE2(self->mDirtyRect.size.height) = 1;
    *(&self->mInvalidatingSize + 2) |= 2u;
    BYTE6(self->mDirtyRect.size.height) = BYTE6(self->mDirtyRect.size.height) & 0xFD | (2
                                                                                      * ([(CRLCanvasLayout *)self layoutState] != 0));
    v3 = [(CRLCanvasLayout *)self dependentLayouts];
    id v4 = [(CRLCanvasLayout *)self bidirectionalSizeDependentLayouts];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v10 shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:self]) {
            [v10 invalidateSize];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v4;
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) invalidateSize:(void)v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }

    [(CRLCanvasLayout *)self invalidateCacheForMagnets];
    [(CRLCanvasLayout *)self invalidate];
    BYTE2(self->mDirtyRect.size.height) = 0;
  }
}

- (void)invalidateFrame
{
  [(CRLCanvasLayout *)self invalidateSize];

  [(CRLCanvasLayout *)self invalidatePosition];
}

- (void)invalidateCacheForMagnets
{
  *(&self->mInvalidatingSize + 2) |= 4u;
  v2 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
  *(CGFloat *)((char *)&self->mCardinalWestPosition.y + 2) = 0.0;
}

- (void)invalidateFrameForCulling
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self parent];
  uint64_t v8 = sub_1002469D0(v3, v4);

  id v5 = v8;
  if (v8)
  {
    unsigned int v6 = [v8 layoutHasValidFrameForCulling];
    id v5 = v8;
    if (v6)
    {
      [v8 invalidateFrameForCulling];
      id v5 = v8;
    }
  }
  CGSize size = CGRectNull.size;
  *(CGPoint *)((char *)&self->mMaximumInlineFrameSize.height + 2) = CGRectNull.origin;
  *(CGSize *)((char *)&self->mCachedFrameForCulling.origin.y + 2) = size;
}

- (BOOL)layoutHasValidFrameForCulling
{
  v3.origin.CGFloat x = *(CGFloat *)((char *)&self->mMaximumInlineFrameSize.height + 2);
  v3.origin.CGFloat y = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.x + 2);
  v3.size.CGFloat width = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.y + 2);
  v3.size.CGFloat height = *(CGFloat *)((char *)&self->mCachedFrameForCulling.size.width + 2);
  return !CGRectIsNull(v3);
}

- (void)invalidatePositionWithoutSideEffects
{
  *(&self->mInvalidatingSize + 2) |= 1u;
}

- (void)invalidateSizeWithoutSideEffects
{
  *(&self->mInvalidatingSize + 2) |= 2u;
}

- (BOOL)childLayoutIsCurrentlyHiddenWhileManipulating:(id)a3
{
  return 0;
}

- (void)invalidateExteriorWrap
{
}

- (void)invalidateChildren
{
  id v3 = [(CRLCanvasLayout *)self layoutController];
  [v3 invalidateChildrenOfLayout:self];
}

- (id)childInfosForChildLayouts
{
  return &__NSArray0__struct;
}

- (void)updateChildrenFromInfo
{
  id v3 = [(CRLCanvasLayout *)self childInfosForChildLayouts];
  id v4 = [(CRLCanvasAbstractLayout *)self children];
  id v5 = [v3 count];
  long long v25 = v4;
  if (v5 == [v4 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v13 = [v25 objectAtIndexedSubscript:(char *)i + v9];
          uint64_t v14 = [v13 info];

          if (v14 != v12)
          {

            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
        v9 += (uint64_t)i;
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
LABEL_12:
    id v6 = +[NSMutableArray array];
    id v15 = [(CRLCanvasLayout *)self layoutController];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v24 = v3;
    id v16 = v3;
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
          [v15 layoutForInfo:v21 childOfLayout:self v24];
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            id v22 = [objc_alloc([CRLCanvasLayoutController effectiveLayoutClassForInfo:](CRLCanvasLayoutController, "effectiveLayoutClassForInfo:", v21)) initWithInfo:v21];
            if (!v22) {
              continue;
            }
          }
          [v6 addObject:v22];
        }
        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }

    [(CRLCanvasAbstractLayout *)self setChildren:v6];
    [(CRLCanvasLayout *)self invalidate];
    [(CRLCanvasLayout *)self i_clearInvalidationCache];

    id v3 = v24;
  }

  long long v23 = [(CRLCanvasAbstractLayout *)self children];
  [v23 makeObjectsPerformSelector:"updateChildrenFromInfo"];
}

- (void)unregisterFromLayoutController
{
  id v3 = [(CRLCanvasLayout *)self layoutController];

  if (v3)
  {
    id v4 = [(CRLCanvasLayout *)self layoutController];
    [(CRLCanvasLayout *)self p_unregisterWithLayoutController:v4];
  }
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasAbstractLayout *)self parent];

  if (v5 != v4)
  {
    [(CRLCanvasLayout *)self parentWillChangeTo:v4];
    id v6 = [(CRLCanvasAbstractLayout *)self root];
    id v7 = [v4 root];
    if (v6 != v7)
    {
      id v8 = [(CRLCanvasLayout *)self layoutController];
      if (v8) {
        [(CRLCanvasLayout *)self p_unregisterWithLayoutController:v8];
      }
    }
    v12.receiver = self;
    v12.super_class = (Class)CRLCanvasLayout;
    [(CRLCanvasAbstractLayout *)&v12 setParent:v4];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = sub_1002469D0(v9, v4);
    [v10 i_clearInvalidationCache];

    if (v6 != v7)
    {
      id v11 = [(CRLCanvasLayout *)self layoutController];
      if (v11)
      {
        [(CRLCanvasLayout *)self p_registerWithLayoutController:v11];
        [(CRLCanvasLayout *)self p_recursiveInvalidate];
        [(CRLCanvasLayout *)self i_recursivelyClearInvalidationCache];
      }
    }
    [(CRLCanvasLayout *)self parentDidChange];
    if (v7) {
      [(CRLCanvasLayout *)self p_invalidateConnectedLayouts];
    }
  }
}

- (BOOL)parentAutosizes
{
  return 0;
}

- (id)rootLayout
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self root];
  id v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (id)layoutController
{
  v2 = [(CRLCanvasLayout *)self rootLayout];
  uint64_t v3 = [v2 layoutController];

  return v3;
}

- (BOOL)invalidGeometry
{
  return (*(&self->mInvalidatingSize + 2) & 3) != 0;
}

- (BOOL)isPositionInvalid
{
  return *(&self->mInvalidatingSize + 2);
}

- (void)validate
{
  if ([(CRLCanvasLayout *)self invalidGeometry])
  {
    uint64_t v3 = [(CRLCanvasLayout *)self computeLayoutGeometry];
    [(CRLCanvasAbstractLayout *)self setGeometry:v3];

    *(&self->mInvalidatingSize + 2) &= 0xFCu;
  }
  [(CRLCanvasLayout *)self invalidateFrameForCulling];

  [(CRLCanvasLayout *)self i_clearInvalidationCache];
}

- (id)layoutGeometryFromInfo
{
  if (!*(void *)(&self->super._lastInterimPositionYSet + 1))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9A60);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097C04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9A80);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout layoutGeometryFromInfo]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 468, 0, "Layouts must either override computeLayoutGeometry, or have a non-nil info to query for geometry");
  }
  id v6 = [CRLCanvasLayoutGeometry alloc];
  id v7 = [(CRLCanvasLayout *)self info];
  id v8 = [v7 geometry];
  uint64_t v9 = [(CRLCanvasLayoutGeometry *)v6 initWithInfoGeometry:v8];

  return v9;
}

- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3
{
  if (a3) {
    [a3 fullTransform];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  uint64_t v3 = +[CRLCanvasInfoGeometry geometryFromFullTransform:v5];

  return v3;
}

- (Class)repClassOverride
{
  return (Class)[*(id *)(&self->super._lastInterimPositionYSet + 1) repClass];
}

- (BOOL)isInGroup
{
  uint64_t v2 = [(CRLCanvasAbstractLayout *)self parent];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    do
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        break;
      }
      uint64_t v5 = [v3 parent];

      uint64_t v3 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)isInTopLevelContainerForEditing
{
  uint64_t v3 = [(CRLCanvasAbstractLayout *)self parent];
  id v4 = [(CRLCanvasLayout *)self layoutController];
  uint64_t v5 = [v4 canvas];
  id v6 = [v5 canvasController];

  id v7 = [v6 editorController];
  id v8 = [v7 selectionPath];
  uint64_t v9 = [v8 mostSpecificSelectionOfClass:objc_opt_class()];

  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = [v9 boardItems];
    objc_super v12 = [v11 anyObject];
    id v13 = [v6 layoutForInfo:v12];
    uint64_t v14 = sub_1002469D0(v10, v13);

    if (v3) {
      goto LABEL_3;
    }
    goto LABEL_6;
  }
  uint64_t v14 = 0;
  if (!v3)
  {
LABEL_6:
    BOOL v20 = 1;
    goto LABEL_12;
  }
  while (1)
  {
LABEL_3:
    uint64_t v15 = objc_opt_class();
    id v16 = sub_1002469D0(v15, v3);
    id v17 = v16;
    if (v16)
    {
      uint64_t v21 = [v16 info];
      id v22 = [v14 info];
      BOOL v20 = v21 == v22;

      goto LABEL_11;
    }
    id v18 = [v3 root];

    if (v18 == v3) {
      break;
    }
    uint64_t v19 = [v3 parent];

    uint64_t v3 = (void *)v19;
    if (!v19) {
      goto LABEL_6;
    }
  }
  BOOL v20 = v14 == 0;
LABEL_11:

LABEL_12:
  return v20;
}

- (CRLStroke)stroke
{
  return 0;
}

- (BOOL)isStrokeBeingManipulated
{
  return 0;
}

- (CGPoint)alignmentFrameOriginForFixingInterimPosition
{
  if (*(_DWORD *)((char *)&self->mInfo + 2) == 2)
  {
    double v2 = *(double *)((char *)&self->mFreeTransformState + 2);
    double v3 = *(double *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.x + 2);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLCanvasLayout;
    [(CRLCanvasAbstractLayout *)&v4 alignmentFrameOriginForFixingInterimPosition];
  }
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  if (*(_DWORD *)((char *)&self->mInfo + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9AA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097DB4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9AC0);
    }
    objc_super v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:572 isFatal:0 description:"Should not begin a dynamic operation while already in one."];
  }
  [(CRLCanvasLayout *)self boundsForStandardKnobs];
  *(CRLCanvasLayoutGeometry **)((char *)&self->mBaseGeometry + 2) = v7;
  *(void *)((char *)&self->mInitialBoundsForStandardKnobs.origin.x + 2) = v8;
  *(void *)((char *)&self->mInitialBoundsForStandardKnobs.origin.y + 2) = v9;
  *(void *)((char *)&self->mInitialBoundsForStandardKnobs.size.width + 2) = v10;
  if (*(void *)((char *)&self->mInvalidFlags + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9AE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097D20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9B00);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    objc_super v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 576, 0, "expected nil value for '%{public}s'", "mBaseGeometry");
  }
  uint64_t v14 = [(CRLCanvasAbstractLayout *)self geometry];
  id v15 = [v14 copy];
  id v16 = *(void **)((char *)&self->mInvalidFlags + 2);
  *(void *)((char *)&self->mInvalidFlags + 2) = v15;

  if (*(void *)(&self->mIsInRealTimeDynamicOperation + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9B20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097C8C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9B40);
    }
    id v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:]");
    uint64_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 579, 0, "expected nil value for '%{public}s'", "mInfoGeometryBeforeDynamicOperation");
  }
  BOOL v20 = [(CRLCanvasLayout *)self info];
  uint64_t v21 = [v20 geometry];
  id v22 = [v21 copy];
  long long v23 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
  *(void *)(&self->mIsInRealTimeDynamicOperation + 2) = v22;

  *(_DWORD *)((char *)&self->mInfo + 2) = 1;
  BYTE2(self->mConvexHullPath) = a3;
}

- (void)endDynamicOperation
{
  double v3 = *(void **)((char *)&self->mInvalidFlags + 2);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9B60);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097ED0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9B80);
    }
    objc_super v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout endDynamicOperation]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 587, 0, "invalid nil value for '%{public}s'", "mBaseGeometry");

    double v3 = *(void **)((char *)&self->mInvalidFlags + 2);
  }
  *(void *)((char *)&self->mInvalidFlags + 2) = 0;

  id v7 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9BA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097E3C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9BC0);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout endDynamicOperation]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 590, 0, "invalid nil value for '%{public}s'", "mInfoGeometryBeforeDynamicOperation");

    id v7 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
  }
  *(void *)(&self->mIsInRealTimeDynamicOperation + 2) = 0;

  *(_DWORD *)((char *)&self->mInfo + 2) = 0;
  BYTE2(self->mConvexHullPath) = 0;
  [(CRLCanvasLayout *)self i_clearInvalidationCache];
}

- (BOOL)isBeingTransformed
{
  double v3 = [(CRLCanvasLayout *)self layoutController];
  objc_super v4 = [v3 canvas];
  uint64_t v5 = [v4 canvasController];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 dynamicOperationController];
  id v7 = [v6 currentlyTransformingReps];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) layout];

        if (v12 == self)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)beginDrag
{
  double v3 = (unint64_t *)((char *)&self->mFreeTransformState + 2);
  [(CRLCanvasLayout *)self alignmentFrameOriginForFixingInterimPosition];
  void *v3 = v4;
  v3[1] = v5;
  *(_DWORD *)((char *)&self->mInfo + 2) = 2;
}

- (void)dragByUnscaled:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLCanvasAbstractLayout *)self parent];

  if (v6)
  {
    id v7 = [(CRLCanvasAbstractLayout *)self parent];
    id v8 = v7;
    if (v7) {
      [v7 transformInRoot];
    }
    else {
      memset(&v10, 0, sizeof(v10));
    }
    CGAffineTransformInvert(&v11, &v10);
    double x = sub_1000664E0((float64x2_t *)&v11, x, y);
    double y = v9;
  }
  -[CRLCanvasLayout dragBy:](self, "dragBy:", x, y, *(_OWORD *)&v10.a, *(_OWORD *)&v10.c, *(_OWORD *)&v10.tx);
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
    {
      id v7 = [(CRLCanvasLayout *)self layoutController];
      id v8 = [v7 canvas];

      double v9 = [v8 canvasController];
      CGAffineTransform v10 = [v9 commandController];

      CGAffineTransform v11 = [v8 repForLayout:self];
      objc_super v12 = [(CRLCanvasLayout *)self info];
      BOOL v13 = [v12 geometry];
      CGAffineTransformMakeTranslation(&v32, x, y);
      uint64_t v14 = [v13 geometryByAppendingTransform:&v32];
      id v15 = [v11 newCommandToApplyGeometry:v14 toInfo:v12];
      [v10 enqueueCommand:v15];
    }
    if (!*(void *)((char *)&self->mInvalidFlags + 2))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9BE0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101097F64();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9C00);
      }
      long long v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      long long v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout dragBy:]");
      long long v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 648, 0, "invalid nil value for '%{public}s'", "mBaseGeometry");
    }
    uint64_t v19 = [(CRLCanvasAbstractLayout *)self geometry];
    BOOL v20 = [v19 geometryByTranslatingBy:x, y];

    [(CRLCanvasLayout *)self setDynamicGeometry:v20];
    [(CRLCanvasLayout *)self p_invalidateConnectedLayouts];
    uint64_t v21 = [(CRLCanvasLayout *)self layoutController];
    id v22 = [v21 canvas];
    [v22 canvasInvalidatedForLayout:self];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v23 = [(CRLCanvasLayout *)self dependentLayoutsForDrag];
    id v24 = [v23 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v29;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) invalidateFrame];
        }
        id v25 = [v23 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v25);
    }
  }
}

- (CGAffineTransform)originalTransformInRoot
{
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGPoint result = self;
  if (result)
  {
    id v6 = result;
    do
    {
      uint64_t v7 = objc_opt_class();
      id v8 = sub_1002469D0(v7, v6);
      double v9 = [v8 originalGeometry];

      if (v9) {
        [v8 originalGeometry];
      }
      else {
      CGAffineTransform v10 = [(CGAffineTransform *)v6 geometry];
      }
      CGAffineTransform v11 = v10;
      if (v10)
      {
        long long v12 = *(_OWORD *)&retstr->c;
        v15[0] = *(_OWORD *)&retstr->a;
        v15[1] = v12;
        v15[2] = *(_OWORD *)&retstr->tx;
        [v10 transformByConcatenatingTransformTo:v15];
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v16 = 0u;
      }
      long long v13 = v17;
      *(_OWORD *)&retstr->a = v16;
      *(_OWORD *)&retstr->c = v13;
      *(_OWORD *)&retstr->tCGFloat x = v18;

      uint64_t v14 = [(CGAffineTransform *)v6 parent];

      id v6 = (CGAffineTransform *)v14;
    }
    while (v14);
  }
  return result;
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  id v7 = *(id *)(&self->mIsInRealTimeDynamicOperation + 2);
  if (![v7 heightValid]
    || ![v7 widthValid]
    || ([v7 size], v8 == 0.0)
    || fabs(v8) < 0.00000001
    || ([v7 size], v9 == 0.0)
    || fabs(v9) < 0.00000001)
  {
    long long v12 = *(_OWORD *)&a4->c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&a4->tx;
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    CGAffineTransform v10 = [(CRLCanvasLayout *)self originalPureGeometry];
    CGAffineTransform v11 = v10;
    if (v10) {
      [v10 fullTransform];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    CGAffineTransformInvert(&v21, &v20);

    memset(&v19, 0, sizeof(v19));
    if (v7) {
      [v7 fullTransform];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransform t1 = v21;
    CGAffineTransformConcat(&v19, &t1, &t2);
    CGAffineTransform t1 = v19;
    CGAffineTransformInvert(&v15, &t1);
    long long v14 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v16, &v15, &t1);
    CGAffineTransform t1 = v19;
    CGAffineTransformConcat(retstr, &v16, &t1);
  }

  return result;
}

- (BOOL)shouldProvideGuidesDuringExclusiveAlignmentOperation
{
  return 0;
}

- (void)beginRotate
{
  *(_DWORD *)((char *)&self->mInfo + 2) = 3;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
  {
    uint64_t v5 = [(CRLCanvasLayout *)self layoutController];
    id v6 = [v5 canvas];

    id v7 = [v6 canvasController];
    double v8 = [v7 commandController];

    double v9 = [v6 repForLayout:self];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    if (v4) {
      [v4 rotateTransform];
    }
    CGAffineTransform v10 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    CGAffineTransform v11 = [v10 geometryByAppendingTransform:v14];
    long long v12 = [(CRLCanvasLayout *)self info];
    id v13 = [v9 newCommandToApplyGeometry:v11 toInfo:v12];

    [v8 enqueueCommand:v13];
  }
}

- (BOOL)i_anyAncestorCurrentlyBeingRotatedWantsNormalLayoutDuringDynamicRotation
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self parent];
  uint64_t v5 = sub_1002469D0(v3, v4);

  if (v5)
  {
    while (1)
    {
      if ([v5 layoutState] != 3)
      {
        LOBYTE(v8) = 0;
        goto LABEL_9;
      }
      if ([v5 wantsNormalLayoutDuringDynamicRotation]) {
        break;
      }
      uint64_t v6 = objc_opt_class();
      id v7 = [v5 parent];
      uint64_t v8 = sub_1002469D0(v6, v7);

      uint64_t v5 = (void *)v8;
      if (!v8) {
        goto LABEL_9;
      }
    }
    LOBYTE(v8) = 1;
LABEL_9:
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)resizeMayChangeAspectRatio
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasLayout *)self info];
  uint64_t v5 = sub_1002469D0(v3, v4);

  if (v5) {
    unsigned int v6 = [v5 aspectRatioLocked] ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasLayout *)self info];
  uint64_t v5 = sub_1002469D0(v3, v4);

  LOBYTE(v4) = [v5 canAspectRatioLockBeChangedByUser];
  return (char)v4;
}

- (id)commandForSettingAspectRatioLocked:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  unsigned int v6 = [(CRLCanvasLayout *)self info];
  id v7 = sub_1002469D0(v5, v6);

  uint64_t v8 = [[_TtC8Freeform30CRLCommandSetAspectRatioLocked alloc] initWithBoardItem:v7 aspectRatioLocked:v3];

  return v8;
}

- (void)beginResize
{
  *(_DWORD *)((char *)&self->mInfo + 2) = 4;
}

- (CGSize)minimumSize
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
  {
    uint64_t v5 = [(CRLCanvasLayout *)self layoutController];
    unsigned int v6 = [v5 canvas];

    id v7 = [v6 canvasController];
    uint64_t v8 = [v7 commandController];

    double v9 = [v6 repForLayout:self];
    CGAffineTransform v10 = [v4 currentGeometryForLayout:self];
    id v11 = [v10 copy];

    long long v12 = [(CRLCanvasLayout *)self info];
    id v13 = [v9 newCommandToApplyGeometry:v11 toInfo:v12];

    [v8 enqueueCommand:v13];
  }
  if (v4) {
    [v4 transformForLayout:self];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v14];
  [(CRLCanvasLayout *)self resizeWithTransform:v15];
}

- (BOOL)wantsParentResizeTransform
{
  return 0;
}

- (BOOL)isDynamicallyChangingAvailableSpaceForContainedChild
{
  return [(CRLCanvasLayout *)self layoutState] == 4
      || [(CRLCanvasLayout *)self layoutState] == 5;
}

- (CRLCanvasInfoGeometry)finalInfoGeometryForResize
{
  return 0;
}

- (void)beginFreeTransformWithTracker:(id)a3
{
  *(_DWORD *)((char *)&self->mInfo + 2) = 5;
  id v4 = a3;
  uint64_t v5 = [v4 isDragging];
  unsigned int v6 = [v4 isRotating];
  uint64_t v7 = 2;
  if (!v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | v5;
  if ([v4 isResizing]) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 0;
  }
  unsigned int v10 = [v4 inRotateResizeMode];

  uint64_t v11 = 8;
  if (!v10) {
    uint64_t v11 = 0;
  }
  *(void *)((char *)&self->mLayoutState + 2) = v8 | v9 | v11;
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isDragging];
  unsigned int v6 = [v4 isRotating];
  uint64_t v7 = 2;
  if (!v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | v5;
  if ([v4 isResizing]) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 0;
  }
  unsigned int v10 = [v4 inRotateResizeMode];
  uint64_t v11 = 8;
  if (!v10) {
    uint64_t v11 = 0;
  }
  *(void *)((char *)&self->mLayoutState + 2) = v8 | v9 | v11;
  if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
  {
    long long v12 = [(CRLCanvasLayout *)self layoutController];
    id v13 = [v12 canvas];

    long long v14 = [v13 canvasController];
    long long v15 = [v14 commandController];

    long long v16 = [v13 repForLayout:self];
    long long v17 = [v4 currentGeometryForLayout:self];
    id v18 = [v17 copy];

    CGAffineTransform v19 = [(CRLCanvasLayout *)self info];
    id v20 = [v16 newCommandToApplyGeometry:v18 toInfo:v19];

    [v15 enqueueCommand:v20];
  }
  if (v4) {
    [v4 freeTransformForLayout:self];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v21];
  [(CRLCanvasLayout *)self resizeWithTransform:v22];
}

- (CRLCanvasInfoGeometry)finalInfoGeometryForFreeTransform
{
  return 0;
}

- (BOOL)wantsNormalLayoutDuringDynamicFreeTransform
{
  return [(CRLCanvasLayout *)self i_anyAncestorCurrentlyBeingFreeTransformedWantsNormalLayoutDuringDynamicFreeTransform];
}

- (BOOL)i_anyAncestorCurrentlyBeingFreeTransformedWantsNormalLayoutDuringDynamicFreeTransform
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self parent];
  uint64_t v5 = sub_1002469D0(v3, v4);

  if (v5)
  {
    while (1)
    {
      if ([v5 layoutState] != 5)
      {
        LOBYTE(v8) = 0;
        goto LABEL_9;
      }
      if ([v5 wantsNormalLayoutDuringDynamicFreeTransform]) {
        break;
      }
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = [v5 parent];
      uint64_t v8 = sub_1002469D0(v6, v7);

      uint64_t v5 = (void *)v8;
      if (!v8) {
        goto LABEL_9;
      }
    }
    LOBYTE(v8) = 1;
LABEL_9:
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)isBeingManipulated
{
  return *(_DWORD *)((char *)&self->mInfo + 2) != 0;
}

- (CRLCanvasLayoutGeometry)originalPureGeometry
{
  [(CRLCanvasLayout *)self initialBoundsForStandardKnobs];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  memset(&v19, 0, sizeof(v19));
  uint64_t v11 = [(CRLCanvasLayout *)self originalGeometry];
  long long v12 = v11;
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }

  CGAffineTransformMakeTranslation(&t1, v4, v6);
  CGAffineTransform v16 = v19;
  CGAffineTransformConcat(&v18, &t1, &v16);
  CGAffineTransform v19 = v18;
  id v13 = [CRLCanvasLayoutGeometry alloc];
  CGAffineTransform v18 = v19;
  long long v14 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v18, v8, v10);

  return v14;
}

- (CRLCanvasLayoutGeometry)pureGeometry
{
  [(CRLCanvasLayout *)self boundsForStandardKnobs];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  memset(&v19, 0, sizeof(v19));
  uint64_t v11 = [(CRLCanvasAbstractLayout *)self geometry];
  long long v12 = v11;
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }

  CGAffineTransformMakeTranslation(&t1, v4, v6);
  CGAffineTransform v16 = v19;
  CGAffineTransformConcat(&v18, &t1, &v16);
  CGAffineTransform v19 = v18;
  id v13 = [CRLCanvasLayoutGeometry alloc];
  CGAffineTransform v18 = v19;
  long long v14 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v18, v8, v10);

  return v14;
}

- (CRLCanvasLayoutGeometry)pureGeometryInRoot
{
  double v3 = [(CRLCanvasLayout *)self pureGeometry];
  CGFloat v4 = [(CRLCanvasAbstractLayout *)self geometryInRoot:v3];

  return (CRLCanvasLayoutGeometry *)v4;
}

- (CRLCanvasLayoutGeometry)pureGeometryInParent
{
  double v3 = [(CRLCanvasLayout *)self pureGeometry];
  id v4 = [v3 mutableCopy];

  double v5 = [(CRLCanvasAbstractLayout *)self parent];
  CGFloat v6 = [v5 geometry];
  double v7 = v6;
  if (v6) {
    [v6 transform];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  [v4 transformBy:v9];

  return (CRLCanvasLayoutGeometry *)v4;
}

- (CRLCanvasLayoutGeometry)inspectorGeometry
{
  double v3 = [(CRLCanvasLayout *)self pureGeometry];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v25 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v26 = v4;
  long long v27 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  uint64_t v5 = [(CRLCanvasAbstractLayout *)self parent];
  if (v5)
  {
    CGFloat v6 = (void *)v5;
    do
    {
      if ([v6 isRootLayoutForInspectorGeometry]) {
        break;
      }
      double v7 = [v6 geometry];
      double v8 = v7;
      if (v7)
      {
        v21[0] = v25;
        v21[1] = v26;
        v21[2] = v27;
        [v7 transformByConcatenatingTransformTo:v21];
      }
      else
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v22 = 0u;
      }
      long long v25 = v22;
      long long v26 = v23;
      long long v27 = v24;

      uint64_t v9 = [v6 parent];

      CGFloat v6 = (void *)v9;
    }
    while (v9);
  }
  long long v22 = v25;
  long long v23 = v26;
  long long v24 = v27;
  double v10 = [v3 geometryByTransformingBy:&v22];

  uint64_t v11 = [(CRLCanvasLayout *)self layoutController];
  long long v12 = [v11 canvas];
  unsigned __int8 v13 = [v12 isAnchoredAtRight];

  if (v13)
  {
    [v10 frame];
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
    double MinX = CGRectGetMinX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    uint64_t v19 = [v10 geometryByTranslatingBy:-(MinX + CGRectGetMaxX(v30))];

    double v10 = (void *)v19;
  }

  return (CRLCanvasLayoutGeometry *)v10;
}

- (BOOL)inspectorGeometryIsAffectedByChangeRecord:(id)a3
{
  return 0;
}

- (double)inspectorGeometryAngleInDegrees
{
  double v2 = [(CRLCanvasLayout *)self inspectorGeometry];
  double v3 = v2;
  if (v2) {
    [v2 transform];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  double v4 = sub_10007F788(v9);
  sub_100065C2C(-v4);
  double v6 = v5;

  BOOL v7 = fabs(v6 + -360.0) < 0.00999999978 || v6 == 360.0;
  double result = 0.0;
  if (!v7) {
    return v6;
  }
  return result;
}

- (BOOL)canInspectGeometry
{
  return 1;
}

- (CGAffineTransform)pureTransformInRoot
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  double v5 = [(CRLCanvasLayout *)self pureGeometry];
  double v6 = v5;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tCGFloat x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  double result = [(CRLCanvasAbstractLayout *)self parent];
  if (result)
  {
    double v8 = result;
    do
    {
      uint64_t v9 = [(CGAffineTransform *)v8 geometry];
      double v10 = v9;
      if (v9)
      {
        long long v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        [v9 transformByConcatenatingTransformTo:v14];
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v15 = 0u;
      }
      long long v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tCGFloat x = v17;

      uint64_t v13 = [(CGAffineTransform *)v8 parent];

      double v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (CGAffineTransform)originalPureTransformInRoot
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  double v5 = [(CRLCanvasLayout *)self originalPureGeometry];
  double v6 = v5;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tCGFloat x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  double result = [(CRLCanvasAbstractLayout *)self parent];
  if (result)
  {
    double v8 = result;
    do
    {
      uint64_t v9 = [(CGAffineTransform *)v8 geometry];
      double v10 = v9;
      if (v9)
      {
        long long v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        [v9 transformByConcatenatingTransformTo:v14];
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v15 = 0u;
      }
      long long v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tCGFloat x = v17;

      uint64_t v13 = [(CGAffineTransform *)v8 parent];

      double v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (id)commandToFlipWithOrientation:(int)a3
{
  double v5 = (objc_class *)objc_opt_class();
  double v6 = [(CRLCanvasLayout *)self info];
  BOOL v7 = sub_10024715C(v5, v6);

  double v8 = [v7 geometry];
  id v9 = [v8 mutableCopy];

  if (a3) {
    [v9 setVerticalFlip:[v9 verticalFlip] ^ 1];
  }
  else {
    [v9 setHorizontalFlip:[v9 horizontalFlip] ^ 1];
  }
  double v10 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v7 geometry:v9];

  return v10;
}

- (unint64_t)p_directionForCollaboratorCursorKnobTag:(unint64_t)a3
{
  double v5 = [(CRLCanvasAbstractLayout *)self geometryInRoot];
  double v6 = v5;
  if (v5) {
    [v5 transform];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  double v7 = sub_10007F788(v16);

  double v8 = sub_100407DFC(v7 * 1000.0);
  uint64_t v9 = sub_1002898F4(a3, v8 / 1000.0);
  double v10 = [(CRLCanvasAbstractLayout *)self geometry];
  long long v11 = v10;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  BOOL v12 = sub_10007F7EC((double *)v15);

  if (v12) {
    LOBYTE(v9) = sub_100289B08(v9);
  }
  uint64_t v13 = sub_1002893CC(v9);
  if ((v13 & 0xFFFFFFFFFFFFFFF1) == 0) {
    return 2;
  }
  if ((v13 & 0xFFFFFFFFFFFFFC7FLL) == 0) {
    return 1;
  }
  if ((v13 & 0xFFFFFFFFFFFFFF6DLL) != 0) {
    return 3;
  }
  return 4;
}

- (id)unscaledPositionsForCollaboratorHUDForSelectionPath:(id)a3
{
  [(CRLCanvasLayout *)self boundsForCollaboratorHUDForSelectionPath:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = +[NSMutableArray array];
  double v13 = sub_100289A18(2, v5, v7, v9, v11);
  double v28 = v14;
  double v32 = v13;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  long long v15 = [[CRLCollaboratorCursorHUDPosition alloc] initWithPosition:[(CRLCanvasLayout *)self p_directionForCollaboratorCursorKnobTag:2] direction:vaddq_f64(v48, vmlaq_n_f64(vmulq_n_f64(v47, v28), v46, v32))];
  [v12 addObject:v15];

  double v16 = sub_100289A18(4, v5, v7, v9, v11);
  double v29 = v17;
  double v33 = v16;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  CGAffineTransform v18 = [[CRLCollaboratorCursorHUDPosition alloc] initWithPosition:[(CRLCanvasLayout *)self p_directionForCollaboratorCursorKnobTag:4] direction:vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v29), v43, v33))];
  [v12 addObject:v18];

  double v19 = sub_100289A18(6, v5, v7, v9, v11);
  double v30 = v20;
  double v34 = v19;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  CGAffineTransform v21 = [[CRLCollaboratorCursorHUDPosition alloc] initWithPosition:[(CRLCanvasLayout *)self p_directionForCollaboratorCursorKnobTag:6] direction:vaddq_f64(v42, vmlaq_n_f64(vmulq_n_f64(v41, v30), v40, v34))];
  [v12 addObject:v21];

  double v22 = sub_100289A18(8, v5, v7, v9, v11);
  double v31 = v23;
  double v35 = v22;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  long long v24 = [[CRLCollaboratorCursorHUDPosition alloc] initWithPosition:[(CRLCanvasLayout *)self p_directionForCollaboratorCursorKnobTag:8] direction:vaddq_f64(v39, vmlaq_n_f64(vmulq_n_f64(v38, v31), v37, v35))];
  [v12 addObject:v24];

  [(CRLCanvasAbstractLayout *)self transformInRoot];
  if (sub_10007F964(v36)) {
    long long v25 = &stru_1014E9C40;
  }
  else {
    long long v25 = &stru_1014E9C60;
  }
  [v12 sortUsingComparator:v25];
  id v26 = [v12 copy];

  return v26;
}

- (id)newCommandToMoveByOffset:(CGPoint)a3 whenDistributingLayoutsByOffsets:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v7 = objc_opt_class();
  double v8 = [(CRLCanvasLayout *)self info];
  double v9 = sub_1002469D0(v7, v8);

  double v10 = [(CRLCanvasLayout *)self info];
  double v11 = [v10 geometry];
  CGAffineTransformMakeTranslation(&v15, x, y);
  BOOL v12 = [v11 geometryByAppendingTransform:&v15];

  double v13 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v9 geometry:v12];
  return v13;
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5)
  {
    double v9 = [(CRLCanvasLayout *)self layoutController];
    double v10 = [v9 canvas];
    double v11 = [v10 canvasController];
    BOOL v12 = [v11 editingCoordinator];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = sub_1002469D0(v13, v8);
    CGAffineTransform v15 = (void *)v14;
    if (v12)
    {
      if (v14)
      {
        double v16 = [v12 mainBoard];
        double v17 = [v15 id];
        unsigned int v18 = [v16 containsObject:v17];

        if (v18)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E9C80);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101097FF8();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E9CA0);
          }
          double v19 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v19);
          }
          double v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:]");
          CGAffineTransform v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"];
          +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:1121 isFatal:0 description:"Should not transfer layout geometry to info that's in the document!"];
        }
      }
    }
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1002B878C;
  v25[3] = &unk_1014E9CC8;
  id v26 = v8;
  long long v22 = *(_OWORD *)&a4->c;
  v24[0] = *(_OWORD *)&a4->a;
  v24[1] = v22;
  v24[2] = *(_OWORD *)&a4->tx;
  id v23 = v8;
  [(CRLCanvasLayout *)self p_calculateClampModelValuesWithAdditionalTransform:v24 andPerformBlock:v25];
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = sub_1002B8914;
  BOOL v12 = sub_1002B8924;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B892C;
  v7[3] = &unk_1014E9D30;
  v7[4] = self;
  v7[5] = &v8;
  long long v3 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&a3->tx;
  [(CRLCanvasLayout *)self p_calculateClampModelValuesWithAdditionalTransform:v6 andPerformBlock:v7];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)p_calculateClampModelValuesWithAdditionalTransform:(CGAffineTransform *)a3 andPerformBlock:(id)a4
{
  double v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(CRLCanvasLayout *)self pureGeometry];
  long long v8 = *(_OWORD *)&a3->c;
  v21[0] = *(_OWORD *)&a3->a;
  v21[1] = v8;
  v21[2] = *(_OWORD *)&a3->tx;
  double v9 = [v7 geometryByTransformingBy:v21];

  uint64_t v10 = [(CRLCanvasLayout *)self computeInfoGeometryFromPureLayoutGeometry:v9];
  double v11 = [v10 normalizedGeometry];

  BOOL v12 = [(CRLCanvasLayout *)self info];
  id v13 = [v12 geometry];

  if [v13 widthValid] && (objc_msgSend(v13, "heightValid"))
  {
    id v14 = v11;
  }
  else
  {
    id v14 = [v11 mutableCopy];
    [v14 setWidthValid:[v13 widthValid]];
    [v14 setHeightValid:[v13 heightValid]];
    [v14 size];
    double v16 = v15;
    double v18 = v17;
    if (([v13 widthValid] & 1) == 0)
    {
      [v13 size];
      if (v19 == 0.0) {
        double v16 = 0.0;
      }
    }
    if (([v13 heightValid] & 1) == 0)
    {
      [v13 size];
      if (v20 == 0.0) {
        double v18 = 0.0;
      }
    }
    [v14 setSize:v16, v18];
  }
  v6[2](v6, v14);
}

- (BOOL)isSelectable
{
  double v2 = [(CRLCanvasLayout *)self info];
  if ([v2 isSelectable])
  {
    long long v3 = [v2 parentInfo];
    objc_opt_class();
    id v4 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    do
    {
      BOOL v5 = v4;
      id v4 = v3;

      long long v3 = [v4 parentInfo];

      objc_opt_class();
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
    if (v4
      && (([v4 locked] & 1) != 0 || objc_msgSend(v4, "isEffectivelyEmpty")))
    {
      BOOL v6 = 0;
    }
    else
    {
LABEL_9:
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isDraggable
{
  return 0;
}

- (CGRect)boundsForStandardKnobs
{
  double v2 = [(CRLCanvasAbstractLayout *)self geometry];
  [v2 size];
  double v3 = sub_100064070();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)frameForCaptionPositioning
{
  double v2 = [(CRLCanvasAbstractLayout *)self geometry];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)frameForMiniFormatterPositioning
{
  [(CRLCanvasLayout *)self boundsForStandardKnobs];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CRLCanvasAbstractLayout *)self transform];
  v12.origin.CGFloat x = v4;
  v12.origin.CGFloat y = v6;
  v12.size.CGFloat width = v8;
  v12.size.CGFloat height = v10;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (CGPoint)centerForRotation
{
  [(CRLCanvasLayout *)self boundsForStandardKnobs];

  double v6 = sub_100065738(v2, v3, v4, v5);
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (CGPoint)centerForConnecting
{
  [(CRLCanvasLayout *)self centerForRotation];
  double v12 = v4;
  double v13 = v3;
  CGFloat v5 = [(CRLCanvasAbstractLayout *)self geometry];
  double v6 = v5;
  if (v5)
  {
    [v5 transform];
    float64x2_t v7 = v15;
    float64x2_t v8 = v16;
    float64x2_t v9 = v17;
  }
  else
  {
    float64x2_t v9 = 0uLL;
    float64x2_t v7 = 0uLL;
    float64x2_t v8 = 0uLL;
  }
  float64x2_t v14 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, v12), v7, v13));

  double v11 = v14.f64[1];
  double v10 = v14.f64[0];
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGPoint)cardinalNorthPosition
{
  [(CRLCanvasLayout *)self p_calculateMagnetPositionsIfNeeded];
  double v3 = [(CRLCanvasAbstractLayout *)self geometry];
  double v4 = v3;
  if (v3)
  {
    [v3 transform];
    float64x2_t v5 = v11;
    float64x2_t v6 = v12;
    float64x2_t v7 = v13;
  }
  else
  {
    float64x2_t v7 = 0uLL;
    float64x2_t v5 = 0uLL;
    float64x2_t v6 = 0uLL;
  }
  float64x2_t v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalNorthPosition.x + 2)), v5, *(double *)((char *)&self->mCachedFrameForCulling.size.height + 2)));

  double v9 = v10.f64[1];
  double v8 = v10.f64[0];
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)cardinalEastPosition
{
  [(CRLCanvasLayout *)self p_calculateMagnetPositionsIfNeeded];
  double v3 = [(CRLCanvasAbstractLayout *)self geometry];
  double v4 = v3;
  if (v3)
  {
    [v3 transform];
    float64x2_t v5 = v11;
    float64x2_t v6 = v12;
    float64x2_t v7 = v13;
  }
  else
  {
    float64x2_t v7 = 0uLL;
    float64x2_t v5 = 0uLL;
    float64x2_t v6 = 0uLL;
  }
  float64x2_t v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalEastPosition.x + 2)), v5, *(double *)((char *)&self->mCardinalNorthPosition.y + 2)));

  double v9 = v10.f64[1];
  double v8 = v10.f64[0];
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)cardinalSouthPosition
{
  [(CRLCanvasLayout *)self p_calculateMagnetPositionsIfNeeded];
  double v3 = [(CRLCanvasAbstractLayout *)self geometry];
  double v4 = v3;
  if (v3)
  {
    [v3 transform];
    float64x2_t v5 = v11;
    float64x2_t v6 = v12;
    float64x2_t v7 = v13;
  }
  else
  {
    float64x2_t v7 = 0uLL;
    float64x2_t v5 = 0uLL;
    float64x2_t v6 = 0uLL;
  }
  float64x2_t v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalSouthPosition.x + 2)), v5, *(double *)((char *)&self->mCardinalEastPosition.y + 2)));

  double v9 = v10.f64[1];
  double v8 = v10.f64[0];
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)cardinalWestPosition
{
  [(CRLCanvasLayout *)self p_calculateMagnetPositionsIfNeeded];
  double v3 = [(CRLCanvasAbstractLayout *)self geometry];
  double v4 = v3;
  if (v3)
  {
    [v3 transform];
    float64x2_t v5 = v11;
    float64x2_t v6 = v12;
    float64x2_t v7 = v13;
  }
  else
  {
    float64x2_t v7 = 0uLL;
    float64x2_t v5 = 0uLL;
    float64x2_t v6 = 0uLL;
  }
  float64x2_t v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalWestPosition.x + 2)), v5, *(double *)((char *)&self->mCardinalSouthPosition.y + 2)));

  double v9 = v10.f64[1];
  double v8 = v10.f64[0];
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)getCardinalPositionFromType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      [(CRLCanvasLayout *)self cardinalNorthPosition];
      break;
    case 3uLL:
      [(CRLCanvasLayout *)self cardinalEastPosition];
      break;
    case 4uLL:
      [(CRLCanvasLayout *)self cardinalSouthPosition];
      break;
    case 5uLL:
      [(CRLCanvasLayout *)self cardinalWestPosition];
      break;
    default:
      [(CRLCanvasLayout *)self centerForConnecting];
      break;
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)getCardinalPositionWithParentTransformFromType:(unint64_t)a3
{
  [(CRLCanvasLayout *)self getCardinalPositionFromType:a3];
  double v12 = v5;
  double v13 = v4;
  float64x2_t v15 = 0u;
  float64x2_t v16 = 0u;
  float64x2_t v14 = 0u;
  float64x2_t v6 = [(CRLCanvasAbstractLayout *)self parent];
  if (v6)
  {
    float64x2_t v7 = [(CRLCanvasAbstractLayout *)self parent];
    double v8 = [v7 geometryInRoot];
    double v9 = v8;
    if (v8)
    {
      [v8 transform];
    }
    else
    {
      float64x2_t v15 = 0u;
      float64x2_t v16 = 0u;
      float64x2_t v14 = 0u;
    }
  }
  else
  {
    float64x2_t v14 = *(float64x2_t *)&CGAffineTransformIdentity.a;
    float64x2_t v15 = *(float64x2_t *)&CGAffineTransformIdentity.c;
    float64x2_t v16 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
  }

  float64x2_t v10 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, v12), v14, v13));
  double v11 = v10.f64[1];
  result.CGFloat x = v10.f64[0];
  result.CGFloat y = v11;
  return result;
}

- (BOOL)shouldFlipMagnetsDuringResize
{
  return 0;
}

- (id)computeInfoGeometryDuringResize
{
  return 0;
}

- (id)computeLayoutGeometry
{
  double v3 = [(CRLCanvasLayout *)self layoutGeometryFromInfo];
  uint64_t v4 = objc_opt_class();
  double v5 = [(CRLCanvasAbstractLayout *)self parent];
  float64x2_t v6 = sub_1002469D0(v4, v5);

  if (v6
    && [(CRLCanvasLayout *)self layoutState] != 4
    && [(CRLCanvasLayout *)self layoutState] != 5)
  {
    if ([(CRLCanvasLayout *)self layoutState] == 3
      && ![(CRLCanvasLayout *)self wantsNormalLayoutDuringDynamicRotation])
    {
      double v20 = [CRLCanvasLayoutGeometry alloc];
      CGAffineTransform v21 = [(CRLCanvasLayout *)self originalPureGeometry];
      [v21 size];
      double v23 = v22;
      double v25 = v24;
      if (v3) {
        [v3 transform];
      }
      else {
        memset(v29, 0, sizeof(v29));
      }
      double v19 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v20, "initWithSize:transform:", v29, v23, v25);

      double v3 = v21;
    }
    else
    {
      [v3 size];
      double v8 = v7;
      double v10 = v9;
      if (v3) {
        [v3 transform];
      }
      else {
        memset(v28, 0, sizeof(v28));
      }
      -[CRLCanvasLayout scaleForInlineClampingUnrotatedSize:withTransform:](self, "scaleForInlineClampingUnrotatedSize:withTransform:", v28, v8, v10);
      double v12 = v11;
      [v3 size];
      double v15 = sub_1000646A4(v13, v14, v12);
      double v17 = v16;
      double v18 = [CRLCanvasLayoutGeometry alloc];
      if (v3) {
        [v3 transform];
      }
      else {
        memset(v27, 0, sizeof(v27));
      }
      double v19 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v18, "initWithSize:transform:", v27, v15, v17);
    }

    double v3 = v19;
  }

  return v3;
}

- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withTransform:(CGAffineTransform *)a4
{
  uint64_t v6 = objc_opt_class();
  double v7 = [(CRLCanvasAbstractLayout *)self parent];
  double v8 = sub_1002469D0(v6, v7);

  double v9 = 1.0;
  if (v8)
  {
    [v8 maximumFrameSizeForChild:self];
    double v12 = v11;
    if (v11 < 1.79769313e308 || v10 < 1.79769313e308)
    {
      double v14 = v10;
      BOOL v15 = v10 < 1.79769313e308;
      double v16 = sub_100064070();
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      long long v23 = *(_OWORD *)&a4->c;
      v33[0] = *(_OWORD *)&a4->a;
      v33[1] = v23;
      v33[2] = *(_OWORD *)&a4->tx;
      double v24 = sub_10007F7C8((double *)v33);
      CGAffineTransformMakeRotation(&v34, v24);
      v35.origin.CGFloat x = v16;
      v35.origin.CGFloat y = v18;
      v35.size.CGFloat width = v20;
      v35.size.CGFloat height = v22;
      CGRect v36 = CGRectApplyAffineTransform(v35, &v34);
      BOOL v25 = v36.size.height > v14 && v15;
      BOOL v26 = v36.size.width > v12 && v12 < 1.79769313e308;
      if (v26 || v25)
      {
        double v28 = v12 / v36.size.width;
        double v29 = 1.0;
        if (v36.size.width <= v12) {
          double v28 = 1.0;
        }
        if (v36.size.height > v14) {
          double v29 = v14 / v36.size.height;
        }
        double v30 = fmin(v28, v29);
        if (v14 < 1.79769313e308) {
          double v28 = v30;
        }
        if (v12 >= 1.79769313e308) {
          double v9 = v29;
        }
        else {
          double v9 = v28;
        }
        if (v36.size.width * v9 > v12 || v36.size.height * v9 > v14) {
          double v9 = nextafter(v9, 0.0);
        }
      }
    }
  }

  return v9;
}

- (void)processChanges:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) details];
        double v12 = v11;
        if (v11)
        {
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1002B99E0;
          v22[3] = &unk_1014E5A58;
          v22[4] = v5;
          [v11 enumeratePropertiesUsingBlock:v22];
        }

        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      double v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [self processChangedProperty:[*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) unsignedIntegerValue]];
        double v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v15);
  }
}

- (void)processChangedProperty:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      [(CRLCanvasLayout *)self invalidateChildren];
      break;
    case 6uLL:
      [(CRLCanvasLayout *)self invalidatePosition];
      break;
    case 7uLL:
      [(CRLCanvasLayout *)self invalidateFrame];
      break;
  }

  [(CRLCanvasLayout *)self invalidateFrameForCulling];
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (void)calculateAndSetPointsToSearchReference:(id)a3
{
  id v4 = a3;
  [(CRLCanvasLayout *)self calculatePointFromSearchReference:v4];
  [v4 setSearchReferencePoint:];
}

- (NSArray)dependentLayouts
{
  double v3 = [(CRLCanvasAbstractLayout *)self parent];
  id v4 = [v3 additionalDependenciesForChildLayout:self];
  id v5 = [&__NSArray0__struct arrayByAddingObjectsFromArray:v4];

  id v6 = [(CRLCanvasLayout *)self layoutController];
  id v7 = [v6 canvas];
  id v8 = [v7 canvasController];

  uint64_t v9 = objc_opt_class();
  double v10 = [(CRLCanvasLayout *)self info];
  double v11 = sub_1002469D0(v9, v10);

  if (v8 && v11)
  {
    double v12 = [v8 additionalDependentLayoutsForBoardItem:v11];
    id v13 = v12;
    if (v12 && [v12 count])
    {
      id v14 = [v13 allObjects];
      uint64_t v15 = [v5 arrayByAddingObjectsFromArray:v14];

      id v5 = (void *)v15;
    }
  }

  return (NSArray *)v5;
}

- (NSArray)bidirectionalSizeDependentLayouts
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)dependentLayoutsForDrag
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSSet)reliedOnLayouts
{
  return 0;
}

- (NSArray)additionalLayoutsForRepCreation
{
  return +[NSArray array];
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  double v3 = 1.79769313e308;
  double v4 = 1.79769313e308;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (BOOL)orderedBefore:(id)a3
{
  return 0;
}

- (BOOL)allowIntersectionOfChildLayout:(id)a3
{
  return 1;
}

- (BOOL)shouldDisplayGuides
{
  return 1;
}

- (BOOL)shouldProvideSizingGuides
{
  [(CRLCanvasAbstractLayout *)self transform];
  return sub_10007F910(&v3, 0.002);
}

- (NSSet)additionalGuides
{
  return +[NSSet set];
}

- (double)descentForInlineLayout
{
  return 0.0;
}

- (double)inlineCenteredAlignmentHorizontalOffset
{
  return 0.0;
}

- (id)descendentWrappables
{
  return &__NSArray0__struct;
}

- (BOOL)descendentWrappablesContainsWrappable:(id)a3
{
  double v4 = [a3 parent];
  LOBYTE(self) = v4 == self;

  return (char)self;
}

- (void)p_updateDescendentWrapPathsWithTransform:(CGAffineTransform *)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = [(CRLCanvasLayout *)self descendentWrappables];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        double v11 = sub_1002469D0(v10, v9);
        double v12 = v11;
        if (v11)
        {
          long long v13 = *(_OWORD *)&a3->c;
          v14[0] = *(_OWORD *)&a3->a;
          v14[1] = v13;
          v14[2] = *(_OWORD *)&a3->tx;
          [v11 inRootGeometryChangedBy:v14];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)p_invalidateDescendentWrapPathsInRoot
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CGFloat v2 = [(CRLCanvasLayout *)self descendentWrappables];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v6);
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = sub_1002469D0(v8, v7);
        uint64_t v10 = v9;
        if (v9) {
          [v9 invalidateInRootGeometry];
        }

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)setNeedsDisplay
{
  CGSize size = CGRectInfinite.size;
  *(CGPoint *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2) = CGRectInfinite.origin;
  *(CGSize *)((char *)&self->mDirtyRect.origin.y + 2) = size;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  id v3 = (CGFloat *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2);
  v4.origin.CGFloat x = *(CGFloat *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2);
  v4.origin.CGFloat y = *(CGFloat *)((char *)&self->mDirtyRect.origin.x + 2);
  v4.size.CGFloat width = *(CGFloat *)((char *)&self->mDirtyRect.origin.y + 2);
  v4.size.CGFloat height = *(CGFloat *)((char *)&self->mDirtyRect.size.width + 2);
  CGRect v5 = CGRectUnion(v4, a3);
  CGFloat *v3 = v5.origin.x;
  v3[1] = v5.origin.y;
  v3[2] = v5.size.width;
  v3[3] = v5.size.height;
}

- (void)recursivelyAddLayoutAndDependentLayoutsToValidateSet:(id)a3
{
  id v5 = a3;
  [v5 addObject:self];
  id v6 = [(CRLCanvasAbstractLayout *)self children];
  [v6 makeObjectsPerformSelector:a2 withObject:v5];
}

- (CGRect)i_takeDirtyRect
{
  double v2 = *(double *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2);
  double v3 = *(double *)((char *)&self->mDirtyRect.origin.x + 2);
  double v4 = *(double *)((char *)&self->mDirtyRect.origin.y + 2);
  double v5 = *(double *)((char *)&self->mDirtyRect.size.width + 2);
  CGSize size = CGRectNull.size;
  *(CGPoint *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2) = CGRectNull.origin;
  *(CGSize *)((char *)&self->mDirtyRect.origin.y + 2) = size;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CRLBezierPath)i_wrapPath
{
  double v2 = [(CRLCanvasAbstractLayout *)self geometry];
  [v2 size];
  double v3 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];

  return (CRLBezierPath *)v3;
}

- (void)p_registerWithLayoutController:(id)a3
{
  id v5 = a3;
  [v5 i_registerLayout:self];
  [(CRLCanvasLayout *)self i_clearInvalidationCache];
  id v6 = [(CRLCanvasAbstractLayout *)self children];
  [v6 makeObjectsPerformSelector:a2 withObject:v5];
}

- (void)p_unregisterWithLayoutController:(id)a3
{
  id v5 = a3;
  [v5 i_unregisterLayout:self];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) connectedLayoutDisconnected:self (void)v12];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(CRLCanvasLayout *)self i_clearInvalidationCache];
  long long v11 = [(CRLCanvasAbstractLayout *)self children];
  [v11 makeObjectsPerformSelector:a2 withObject:v5];
}

- (void)p_recursiveInvalidate
{
  [(CRLCanvasLayout *)self invalidate];
  id v4 = [(CRLCanvasAbstractLayout *)self children];
  [v4 makeObjectsPerformSelector:a2];
}

- (CGSize)p_newMaxInlineFrameSize
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self parent];
  id v5 = sub_1002469D0(v3, v4);

  if (v5)
  {
    [v5 maximumFrameSizeForChild:self];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v9 = 0x7FEFFFFFFFFFFFFFLL;
  }

  double v10 = *(double *)&v7;
  double v11 = *(double *)&v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CRLSearchReference)searchTargetSearchReference
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasLayout *)self info];
  id v5 = sub_1002469D0(v3, v4);

  uint64_t v6 = [(CRLCanvasLayout *)self layoutController];
  uint64_t v7 = [v6 canvas];
  uint64_t v8 = [v7 delegate];
  long long v15 = sub_100246AC8(v8, 1, v9, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLSearchCanvasDelegate);

  long long v16 = +[CRLCanvasSearchReference searchReferenceWithBoardItem:v5 searchCanvasDelegate:v15];
  [(CRLCanvasLayout *)self calculatePointFromSearchReference:v16];
  [v16 setSearchReferencePoint:];
  [(CRLCanvasAbstractLayout *)self alignmentFrameInRoot];
  [v16 setSearchReferenceLayoutFrame:];

  return (CRLSearchReference *)v16;
}

- (NSArray)childSearchTargets
{
  uint64_t v3 = +[NSMutableArray array];
  id v4 = [(CRLCanvasAbstractLayout *)self children];
  [v3 addObjectsFromArray:v4];

  id v5 = [v3 copy];

  return (NSArray *)v5;
}

- (void)layoutSearchForNearbyElementsWithHitBlock:(id)a3
{
  uint64_t v7 = (void (**)(id, void *))a3;
  id v4 = [(CRLCanvasLayout *)self info];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [(CRLCanvasLayout *)self searchTargetSearchReference];
    v7[2](v7, v6);
  }
}

- (void)layoutSearchForHyperlinkWithHitBlock:(id)a3
{
  uint64_t v11 = (void (**)(id, void *))a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLCanvasLayout *)self info];
  uint64_t v6 = sub_1002469D0(v4, v5);

  uint64_t v7 = [v6 hyperlinkURL];
  uint64_t v8 = [v7 absoluteString];
  id v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = [(CRLCanvasLayout *)self searchTargetSearchReference];
    v11[2](v11, v10);
  }
}

- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  uint64_t v3 = [(CRLCanvasAbstractLayout *)self geometryInRoot];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (double)percentOfUnscaledRectContainedInParentRep:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(CRLCanvasLayout *)self pureGeometryInRoot];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  CGRect v19 = CGRectInset(v18, -10.0, -10.0);

  sub_100065798(x, y, width, height, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  return result;
}

- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4
{
  return 0.0;
}

- (BOOL)canvasShouldScrollForSelectionPath:(id)a3
{
  return 1;
}

- (BOOL)selectionMustBeEntirelyOnscreenToCountAsVisibleInSelectionPath:(id)a3
{
  return 0;
}

- (CGRect)shadowedNaturalBoundsWithoutOffset
{
  uint64_t v3 = [(CRLCanvasAbstractLayout *)self geometry];
  [v3 size];
  double x = sub_100064070();
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;

  CGFloat v11 = (objc_class *)objc_opt_class();
  double v12 = [(CRLCanvasLayout *)self info];
  CGFloat v13 = sub_10024715C(v11, v12);

  double v14 = [v13 shadow];
  CGFloat v15 = v14;
  if (v14 && [v14 isEnabled])
  {
    [v15 radius];
    CGFloat v17 = -v16;
    v22.origin.double x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRect v23 = CGRectInset(v22, v17, v17);
    double x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.double x = v18;
  return result;
}

- (BOOL)allowsConnections
{
  return 0;
}

- (void)addConnectedLayout:(id)a3
{
  id v4 = a3;
  double v5 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  id v8 = v4;
  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableSet);
    double v7 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
    *(void *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2) = v6;

    id v4 = v8;
    double v5 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  }
  [v5 addObject:v4];
}

- (void)removeConnectedLayout:(id)a3
{
}

- (void)p_invalidateConnectedLayouts
{
  uint64_t v3 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  if (v3 && [v3 count])
  {
    id v4 = [*(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2) copy];
    [v4 makeObjectsPerformSelector:"connectedLayoutInvalidated:" withObject:self];
  }
}

- (void)p_invalidateDescendentWrapPaths
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = [(CRLCanvasLayout *)self descendentWrappables];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) invalidateExteriorWrap];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  CGAffineTransformInvert(&v8, &v7);
  float64x2_t v3 = vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, y), *(float64x2_t *)&v8.a, x));
  double v4 = v3.f64[1];
  result.double x = v3.f64[0];
  result.double y = v4;
  return result;
}

- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  float64x2_t v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  double v4 = v3.f64[1];
  result.double x = v3.f64[0];
  result.double y = v4;
  return result;
}

- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  CGAffineTransformInvert(&v8, &v7);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (void)p_calculateMagnetPositionsIfNeeded
{
  if ((*(&self->mInvalidatingSize + 2) & 4) != 0)
  {
    float64x2_t v3 = [(CRLCanvasLayout *)self pathForClippingConnectionLines];
    if ([(CRLCanvasLayout *)self shouldBringCardinalMagnetsInward]
      && v3
      && ([v3 isEmpty] & 1) == 0)
    {
      [v3 bounds];
      double v15 = v14;
      double v17 = v16;
      [(CRLCanvasLayout *)self centerForRotation];
      double v19 = v18;
      double v21 = v20;
      double v26 = 1.0;
      double v27 = 0.0;
      CGRect v22 = +[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", v18, 0.0, v18, v17);
      [(CRLCanvasLayout *)self p_getIntersectionsForTestPath:v22 withLowestT:&v27 withHighestT:&v26];
      [(CRLCanvasLayout *)self p_adjustCardinalMagnetTValuesIfNeededWithPadding:&v27 forLowestT:&v26 forHighestT:10.0 / v17];
      double v23 = v17 * v27;
      *(double *)((char *)&self->mCachedFrameForCulling.size.height + 2) = v19;
      *(double *)((char *)&self->mCardinalNorthPosition.x + 2) = v23;
      double v24 = v17 * v26;
      *(double *)((char *)&self->mCardinalEastPosition.y + 2) = v19;
      *(double *)((char *)&self->mCardinalSouthPosition.x + 2) = v24;
      long long v25 = +[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", 0.0, v21, v15, v21);
      [(CRLCanvasLayout *)self p_getIntersectionsForTestPath:v25 withLowestT:&v27 withHighestT:&v26];
      [(CRLCanvasLayout *)self p_adjustCardinalMagnetTValuesIfNeededWithPadding:&v27 forLowestT:&v26 forHighestT:10.0 / v15];
      *(double *)((char *)&self->mCardinalNorthPosition.y + 2) = v15 * v26;
      *(double *)((char *)&self->mCardinalEastPosition.x + 2) = v21;
      *(double *)((char *)&self->mCardinalSouthPosition.y + 2) = v15 * v27;
      *(double *)((char *)&self->mCardinalWestPosition.x + 2) = v21;
    }
    else
    {
      [(CRLCanvasLayout *)self boundsForStandardKnobs];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [(CRLCanvasLayout *)self centerForRotation];
      *(void *)((char *)&self->mCachedFrameForCulling.size.height + 2) = v12;
      *(double *)((char *)&self->mCardinalNorthPosition.x + 2) = v7;
      *(void *)((char *)&self->mCardinalEastPosition.y + 2) = v12;
      *(double *)((char *)&self->mCardinalSouthPosition.x + 2) = v7 + v11;
      *(double *)((char *)&self->mCardinalNorthPosition.y + 2) = v5 + v9;
      *(void *)((char *)&self->mCardinalEastPosition.x + 2) = v13;
      *(double *)((char *)&self->mCardinalSouthPosition.y + 2) = v5;
      *(void *)((char *)&self->mCardinalWestPosition.x + 2) = v13;
    }
    *(&self->mInvalidatingSize + 2) &= ~4u;
  }
}

- (void)p_adjustCardinalMagnetTValuesIfNeededWithPadding:(double)a3 forLowestT:(double *)a4 forHighestT:(double *)a5
{
  if (*a4 > 0.5 - a3) {
    *a4 = 0.0;
  }
  if (*a5 < a3 + 0.5) {
    *a5 = 1.0;
  }
}

- (void)p_getIntersectionsForTestPath:(id)a3 withLowestT:(double *)a4 withHighestT:(double *)a5
{
  id v8 = a3;
  double v9 = [(CRLCanvasLayout *)self pathForClippingConnectionLines];
  id v10 = [v9 copy];

  double v11 = +[NSMutableArray array];
  [v8 addIntersectionsWithPath:v10 to:v11 allIntersections:1 reversed:0];
  if ((unint64_t)[v11 count] < 2)
  {
    double v17 = 1.0;
    double v16 = 0.0;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      double v16 = 1.79769313e308;
      double v17 = 2.22507386e-308;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          double v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v19 t:v24];
          if (v20 < v16)
          {
            [v19 t];
            double v16 = v21;
          }
          [v19 t];
          if (v22 > v17)
          {
            [v19 t];
            double v17 = v23;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 1.79769313e308;
      double v17 = 2.22507386e-308;
    }
  }
  *a4 = v16;
  *a5 = v17;
}

- (id)convexHullPath
{
  float64x2_t v3 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
  if (!v3)
  {
    double v4 = [(CRLCanvasLayout *)self pathForClippingConnectionLines];
    if ([v4 isEmpty])
    {
      [(CRLCanvasLayout *)self boundsForStandardKnobs];
      +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
    }
    else
    {
      +[CRLBezierPath bezierPathWithConvexHullFromWrapPath:v4];
    uint64_t v5 = };
    double v6 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
    *(void *)((char *)&self->mCardinalWestPosition.y + 2) = v5;

    float64x2_t v3 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
  }

  return v3;
}

- (BOOL)shouldBringCardinalMagnetsInward
{
  return 0;
}

- (void)adjustCustomMagnetPositions
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v8 connectedTo:v17];
        double v9 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue();

        if (v9 == self)
        {
          if ([v8 headMagnetType] == (id)6)
          {
            double v11 = self;
            id v12 = v8;
            uint64_t v13 = 11;
            goto LABEL_12;
          }
          if ([v8 headMagnetType] == (id)7)
          {
            id v14 = self;
            uint64_t v15 = v8;
            uint64_t v16 = 11;
LABEL_17:
            [(CRLCanvasLayout *)v14 p_adjustFloatingMagnetPosition:v15 forLineEnd:v16];
            continue;
          }
        }
        else
        {
          id v10 = [v8 connectedFrom];

          if (v10 != self) {
            continue;
          }
          if ([v8 tailMagnetType] == (id)6)
          {
            double v11 = self;
            id v12 = v8;
            uint64_t v13 = 10;
LABEL_12:
            [(CRLCanvasLayout *)v11 p_adjustEdgeMagnetPosition:v12 forLineEnd:v13];
            continue;
          }
          if ([v8 tailMagnetType] == (id)7)
          {
            id v14 = self;
            uint64_t v15 = v8;
            uint64_t v16 = 10;
            goto LABEL_17;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)p_adjustEdgeMagnetPosition:(id)a3 forLineEnd:(unint64_t)a4
{
  id v6 = a3;
  [(CRLCanvasLayout *)self boundsForStandardKnobs];
  double v8 = v7;
  [(CRLCanvasLayout *)self boundsForStandardKnobs];
  double v10 = fmax(v8, v9);
  double v11 = 0.0;
  if ([v6 connectionType])
  {
    if (a4 == 11) {
      [v6 headMagnetCanvasPosition];
    }
    else {
      [v6 tailMagnetCanvasPosition];
    }
    -[CRLCanvasLayout p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:](self, "p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:", &v11);
  }
  else
  {
    -[CRLCanvasLayout p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:](self, "p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:", v6, a4, &v11, INFINITY, INFINITY, INFINITY, INFINITY);
  }
  if (v11 < v10)
  {
    if (a4 == 11) {
      [v6 setHeadMagnetPosition:];
    }
    else {
      [v6 setTailMagnetPosition:];
    }
    [v6 updateConnectedPath];
    [v6 setMagnetsAdjusted:1];
  }
}

- (void)p_adjustFloatingMagnetPosition:(id)a3 forLineEnd:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  double v8 = [v6 info];
  double v9 = sub_1002469D0(v7, v8);

  double v10 = [v9 connectionLinePathSource];
  double v11 = v10;
  if (a4 == 11)
  {
    id v12 = [v10 headMagnet];
    [v12 magnetNormalizedPosition];
    double v26 = v14;
    double v28 = v13;
    uint64_t v15 = [(CRLCanvasLayout *)self pureGeometry];
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 fullTransform];
      float64x2_t v17 = v33;
      float64x2_t v18 = v34;
      float64x2_t v19 = v35;
    }
    else
    {
      float64x2_t v19 = 0uLL;
      float64x2_t v17 = 0uLL;
      float64x2_t v18 = 0uLL;
    }
    [v6 setHeadMagnetPosition:vaddq_f64(v19, vmlaq_n_f64(vmulq_n_f64(v18, v26), v17, v28))];
  }
  else
  {
    id v12 = [v10 tailMagnet];
    [v12 magnetNormalizedPosition];
    double v27 = v21;
    double v29 = v20;
    double v22 = [(CRLCanvasLayout *)self pureGeometry];
    uint64_t v16 = v22;
    if (v22)
    {
      [v22 fullTransform];
      float64x2_t v23 = v30;
      float64x2_t v24 = v31;
      float64x2_t v25 = v32;
    }
    else
    {
      float64x2_t v25 = 0uLL;
      float64x2_t v23 = 0uLL;
      float64x2_t v24 = 0uLL;
    }
    [v6 setTailMagnetPosition:vaddq_f64(v25, vmlaq_n_f64(vmulq_n_f64(v24, v27), v23, v29))];
  }

  [v6 updateConnectedPath];
  [v6 setMagnetsAdjusted:1];
}

- (CGPoint)p_findFirstEdgePointIntersectionOnWrapPathWithLine:(id)a3 forLineEnd:(unint64_t)a4 withDistanceToPoint:(double *)a5 withOverridenHeadPosition:(CGPoint)a6 withOverridenTailPosition:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v8 = a6.y;
  double v9 = a6.x;
  id v13 = a3;
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [v13 info];
  uint64_t v16 = sub_1002469D0(v14, v15);

  v123 = v16;
  float64x2_t v17 = [v16 connectionLinePathSource];
  float64x2_t v18 = [v13 connectedTo];
  if (v18)
  {
    float64x2_t v19 = [v17 headMagnet];
    [v19 magnetNormalizedPosition];
    double v21 = v20;
    double v23 = v22;
    float64x2_t v24 = [v13 connectedTo];
    float64x2_t v25 = [v24 pureGeometry];
    double v26 = v25;
    if (v25)
    {
      [v25 fullTransform];
      double v27 = *((double *)&v149 + 1);
      double v28 = *(double *)&v149;
      double v29 = *((double *)&v150 + 1);
      double v30 = *(double *)&v150;
      double v31 = *((double *)&v151 + 1);
      double v32 = *(double *)&v151;
    }
    else
    {
      long long v150 = 0u;
      long long v151 = 0u;
      long long v149 = 0u;
      double v31 = 0.0;
      double v29 = 0.0;
      double v27 = 0.0;
      double v32 = 0.0;
      double v30 = 0.0;
      double v28 = 0.0;
    }
    double v43 = v32 + v23 * v30 + v28 * v21;
    double v44 = v31 + v23 * v29 + v27 * v21;
  }
  else
  {
    [v13 headPoint];
    double v34 = v33;
    double v36 = v35;
    if (v13)
    {
      [v13 transform];
      double v37 = *((double *)&v146 + 1);
      double v38 = *(double *)&v146;
      double v39 = *((double *)&v147 + 1);
      double v40 = *(double *)&v147;
      double v41 = *((double *)&v148 + 1);
      double v42 = *(double *)&v148;
    }
    else
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v146 = 0u;
      double v41 = 0.0;
      double v39 = 0.0;
      double v37 = 0.0;
      double v42 = 0.0;
      double v40 = 0.0;
      double v38 = 0.0;
    }
    double v43 = v42 + v36 * v40 + v38 * v34;
    double v44 = v41 + v36 * v39 + v37 * v34;
  }

  float64x2_t v45 = [v13 connectedFrom];
  if (v45)
  {
    float64x2_t v46 = [v17 tailMagnet];
    [v46 magnetNormalizedPosition];
    double v48 = v47;
    double v50 = v49;
    v51 = [v13 connectedFrom];
    v52 = [v51 pureGeometry];
    v53 = v52;
    if (v52)
    {
      [v52 fullTransform];
      double v54 = *((double *)&v143 + 1);
      double v55 = *(double *)&v143;
      double v56 = *((double *)&v144 + 1);
      double v57 = *(double *)&v144;
      double v58 = *((double *)&v145 + 1);
      double v59 = *(double *)&v145;
    }
    else
    {
      long long v144 = 0u;
      long long v145 = 0u;
      long long v143 = 0u;
      double v58 = 0.0;
      double v56 = 0.0;
      double v54 = 0.0;
      double v59 = 0.0;
      double v57 = 0.0;
      double v55 = 0.0;
    }
    double v70 = v59 + v50 * v57 + v55 * v48;
    double v71 = v58 + v50 * v56 + v54 * v48;
  }
  else
  {
    [v13 tailPoint];
    double v61 = v60;
    double v63 = v62;
    if (v13)
    {
      [v13 transform];
      double v64 = *((double *)&v140 + 1);
      double v65 = *(double *)&v140;
      double v66 = *((double *)&v141 + 1);
      double v67 = *(double *)&v141;
      double v68 = *((double *)&v142 + 1);
      double v69 = *(double *)&v142;
    }
    else
    {
      long long v141 = 0u;
      long long v142 = 0u;
      long long v140 = 0u;
      double v68 = 0.0;
      double v66 = 0.0;
      double v64 = 0.0;
      double v69 = 0.0;
      double v67 = 0.0;
      double v65 = 0.0;
    }
    double v70 = v69 + v63 * v67 + v65 * v61;
    double v71 = v68 + v63 * v66 + v64 * v61;
  }

  if (sub_100065BF8(v9, v8))
  {
    double v8 = v44;
    double v9 = v43;
  }
  BOOL v72 = sub_100065BF8(x, y);
  if (v72) {
    double v73 = v71;
  }
  else {
    double v73 = y;
  }
  if (v72) {
    double v74 = v70;
  }
  else {
    double v74 = x;
  }
  if (a4 == 10) {
    double v75 = v8;
  }
  else {
    double v75 = v73;
  }
  double v124 = v75;
  if (a4 == 10) {
    double v76 = v9;
  }
  else {
    double v76 = v74;
  }
  double v127 = v76;
  if (a4 == 10) {
    double v77 = v73;
  }
  else {
    double v77 = v8;
  }
  if (a4 == 10) {
    double v78 = v74;
  }
  else {
    double v78 = v9;
  }
  v79 = [(CRLCanvasAbstractLayout *)self geometry];
  [v79 frame];
  double v81 = v80;
  if (v78 > v127)
  {
    v82 = [(CRLCanvasAbstractLayout *)self geometry];
    [v82 size];
    double v81 = v81 + v83;
  }
  sub_100064680(v78, v77, v127);
  double v84 = sub_100064698(v78, v77, v81 - v78);
  double v119 = v85;
  double v120 = v84;
  v86 = [(CRLCanvasAbstractLayout *)self geometry];
  v87 = v86;
  if (v86) {
    [v86 transform];
  }
  else {
    memset(&v138, 0, sizeof(v138));
  }
  CGAffineTransformInvert(&v139, &v138);
  float64x2_t v121 = vaddq_f64(*(float64x2_t *)&v139.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v139.c, v119), *(float64x2_t *)&v139.a, v120));
  v88 = [(CRLCanvasAbstractLayout *)self geometry];
  v89 = v88;
  if (v88) {
    [v88 transform];
  }
  else {
    memset(&v136, 0, sizeof(v136));
  }
  CGAffineTransformInvert(&v137, &v136);
  v90 = +[CRLBezierPath bezierPathWithStart:*(_OWORD *)&v121 end:vaddq_f64(*(float64x2_t *)&v137.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v137.c, v124), *(float64x2_t *)&v137.a, v127))];

  v91 = [(CRLCanvasLayout *)self pathForClippingConnectionLines];
  id v92 = [v91 copy];

  v93 = +[NSMutableArray array];
  [v90 addIntersectionsWithPath:v92 to:v93 allIntersections:1 reversed:0];
  if ([v93 count])
  {
    v122 = v17;
    v125 = a5;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v94 = v93;
    id v95 = [v94 countByEnumeratingWithState:&v132 objects:v152 count:16];
    if (v95)
    {
      id v96 = v95;
      uint64_t v97 = *(void *)v133;
      double v98 = 0.0;
      double v99 = 2.22507386e-308;
      double v100 = 1.79769313e308;
      double v101 = 0.0;
      do
      {
        for (i = 0; i != v96; i = (char *)i + 1)
        {
          if (*(void *)v133 != v97) {
            objc_enumerationMutation(v94);
          }
          v103 = *(void **)(*((void *)&v132 + 1) + 8 * i);
          [v103 point];
          if (v104 < v100)
          {
            [v103 point];
            double v100 = v105;
            double v98 = v106;
          }
          [v103 point];
          if (v107 > v99)
          {
            [v103 point];
            double v99 = v108;
            double v101 = v109;
          }
        }
        id v96 = [v94 countByEnumeratingWithState:&v132 objects:v152 count:16];
      }
      while (v96);
    }
    else
    {
      double v98 = 0.0;
      double v99 = 2.22507386e-308;
      double v100 = 1.79769313e308;
      double v101 = 0.0;
    }

    a5 = v125;
    float64x2_t v17 = v122;
  }
  else
  {
    double v98 = 0.0;
    double v99 = 2.22507386e-308;
    double v100 = 1.79769313e308;
    double v101 = 0.0;
  }
  v110 = [(CRLCanvasAbstractLayout *)self geometry];
  v111 = v110;
  if (v110)
  {
    [v110 transform];
    float64x2_t v112 = v129;
    float64x2_t v113 = v130;
    float64x2_t v114 = v131;
  }
  else
  {
    float64x2_t v114 = 0uLL;
    float64x2_t v112 = 0uLL;
    float64x2_t v113 = 0uLL;
  }
  if (v78 > v127) {
    double v115 = v100;
  }
  else {
    double v115 = v99;
  }
  if (v78 > v127) {
    double v116 = v98;
  }
  else {
    double v116 = v101;
  }
  float64x2_t v128 = vaddq_f64(v114, vmlaq_n_f64(vmulq_n_f64(v113, v116), v112, v115));

  *a5 = sub_1000653B4(v128.f64[0], v128.f64[1], v78, v77);
  double v118 = v128.f64[1];
  double v117 = v128.f64[0];
  result.double y = v118;
  result.double x = v117;
  return result;
}

- (id)commandsForAdjustingMagnetsFromClineLayouts
{
  id v56 = objc_alloc_init((Class)NSMutableArray);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  double v59 = self;
  id obj = *(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  id v3 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v71;
    uint64_t v55 = *(void *)v71;
    do
    {
      id v6 = 0;
      id v57 = v4;
      do
      {
        if (*(void *)v71 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v6);
        if ([v7 magnetsAdjusted])
        {
          double v8 = [v7 connectionLineInfo];
          double v9 = [v8 connectionLinePathSource];
          id v10 = [v9 copy];

          double v11 = [v10 headMagnet];

          if (v11)
          {
            [v7 headMagnetNormalizedPosition];
            double v60 = v13;
            double v62 = v12;
            if ([v7 overridenHeadMagnetNormalizedPosition])
            {
              [v7 headMagnetNormalizedPosition];
              double v15 = v14;
              double v17 = v16;
              float64x2_t v18 = [v7 connectedTo];
              -[CRLCanvasLayout p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:](v59, "p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:", v18, v15, v17);
              double v60 = v20;
              double v62 = v19;

              double v21 = [v7 connectedTo];
              double v22 = [v21 pureGeometry];
              double v23 = v22;
              if (v22)
              {
                [v22 fullTransform];
                float64x2_t v24 = v67;
                float64x2_t v25 = v68;
                float64x2_t v26 = v69;
              }
              else
              {
                float64x2_t v68 = 0u;
                float64x2_t v69 = 0u;
                float64x2_t v26 = 0uLL;
                float64x2_t v24 = 0uLL;
                float64x2_t v25 = 0uLL;
                float64x2_t v67 = 0u;
              }
              [v7 setHeadMagnetPosition:vaddq_f64(v26, vmlaq_n_f64(vmulq_n_f64(v25, v60), v24, v62))];
            }
            double v27 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", [v7 headMagnetType], v62, v60);
            [v10 setHeadMagnet:v27];
          }
          double v28 = [v10 tailMagnet];

          if (v28)
          {
            [v7 tailMagnetNormalizedPosition];
            double v61 = v30;
            double v63 = v29;
            if ([v7 overridenTailMagnetNormalizedPosition])
            {
              [v7 tailMagnetNormalizedPosition];
              double v32 = v31;
              double v34 = v33;
              double v35 = [v7 connectedFrom];
              -[CRLCanvasLayout p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:](v59, "p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:", v35, v32, v34);
              double v61 = v37;
              double v63 = v36;

              double v38 = [v7 connectedFrom];
              double v39 = [v38 pureGeometry];
              double v40 = v39;
              if (v39)
              {
                [v39 fullTransform];
                float64x2_t v41 = v64;
                float64x2_t v42 = v65;
                float64x2_t v43 = v66;
              }
              else
              {
                float64x2_t v65 = 0u;
                float64x2_t v66 = 0u;
                float64x2_t v43 = 0uLL;
                float64x2_t v41 = 0uLL;
                float64x2_t v42 = 0uLL;
                float64x2_t v64 = 0u;
              }
              [v7 setTailMagnetPosition:vaddq_f64(v43, vmlaq_n_f64(vmulq_n_f64(v42, v61), v41, v63))];
            }
            double v44 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", [v7 tailMagnetType], v63, v61);
            [v10 setTailMagnet:v44];
          }
          float64x2_t v45 = [(CRLCanvasLayout *)v59 layoutController];
          float64x2_t v46 = [v45 boardItemOwner];
          double v47 = [v8 getConnectedToWithBoardItemOwner:v46];

          double v48 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v8 connectedItem:v47 chirality:1 pathSource:v10];
          [v56 addObject:v48];
          double v49 = [(CRLCanvasLayout *)v59 layoutController];
          [v49 boardItemOwner];
          v51 = double v50 = v8;
          v52 = [v50 getConnectedFromWithBoardItemOwner:v51];

          v53 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v50 connectedItem:v52 chirality:0 pathSource:v10];
          [v56 addObject:v53];
          [v7 setMagnetsAdjusted:0];

          uint64_t v5 = v55;
          id v4 = v57;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v4);
  }

  return v56;
}

- (CGPoint)p_convertNormalizedPositionFromLayoutToPureGeomtry:(CGPoint)a3 forLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  uint64_t v7 = [v6 geometry];
  double v8 = v7;
  if (v7)
  {
    [v7 fullTransform];
    double v10 = *((double *)&v27 + 1);
    double v9 = *(double *)&v27;
    double v12 = *((double *)&v28 + 1);
    double v11 = *(double *)&v28;
    double v13 = *((double *)&v29 + 1);
    double v14 = *(double *)&v29;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    double v13 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
    double v14 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
  }

  if (v6) {
    [v6 pureTransformInRoot];
  }
  else {
    memset(&v25, 0, sizeof(v25));
  }
  CGAffineTransformInvert(&v26, &v25);
  float64x2_t v24 = vaddq_f64(*(float64x2_t *)&v26.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v26.c, v13 + y * v12 + v10 * x), *(float64x2_t *)&v26.a, v14 + y * v11 + v9 * x));
  double v15 = [v6 pureGeometry];
  [v15 size];
  double v16 = sub_100064070();
  double v19 = sub_100066AA4(v24.f64[0], v24.f64[1], v16, v17, v18);
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (void)enqueueCommandsForAdjustingPathSourcesAfterRoutingChanges
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(CRLCanvasLayout *)self connectedLayouts];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v8 controlKnobPositionChangedFromRouting])
        {
          double v9 = [(CRLCanvasLayout *)self layoutController];
          double v10 = [v9 canvas];
          double v11 = [v10 canvasController];
          double v12 = [v11 repForLayout:v8];

          uint64_t v13 = objc_opt_class();
          double v14 = sub_1002469D0(v13, v12);
          double v15 = v14;
          if (v14)
          {
            [v14 enqueuePathSourceChanges];
            [v8 setControlKnobPositionChangedFromRouting:0];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

- (CGPoint)nearestEdgePointOnWrapPathFromPoint:(CGPoint)a3
{
  uint64_t v5 = 0;
  -[CRLCanvasLayout p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:](self, "p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:", &v5, a3.x, a3.y, 10.0);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)p_findNearestEdgePointOnWrapPathFromPoint:(CGPoint)a3 withSearchThreshold:(double)a4 withDistanceToPoint:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(CRLCanvasLayout *)self pathForClippingConnectionLines];
  double v25 = 0.0;
  uint64_t v26 = 0;
  [(CRLCanvasAbstractLayout *)self transform];
  CGAffineTransformInvert(&v24, &v23);
  [v8 distanceToPoint:&v26 elementIndex:&v25 tValue:1 threshold:vmulq_n_f64(*(float64x2_t *)&v24.c, y) vmlaq_n_f64(*(float64x2_t *)&v24.a, x) findClosestMatch:a4];
  *a5 = v9;
  if (v9 >= a4)
  {
    float64x2_t v12 = (float64x2_t)xmmword_101175160;
  }
  else
  {
    [v8 pointAt:v26 fromElement:v25];
    double v16 = v11;
    double v18 = v10;
    [(CRLCanvasAbstractLayout *)self transform];
    float64x2_t v12 = vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v16), v20, v18));
  }
  float64x2_t v19 = v12;

  double v14 = v19.f64[1];
  double v13 = v19.f64[0];
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)findNewEdgeMagnetCanvasPositionForConnectionLine:(id)a3 forLineEnd:(unint64_t)a4 withCanvasPosition:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  [(CRLCanvasLayout *)self boundsForStandardKnobs];
  double v11 = v10;
  [(CRLCanvasLayout *)self boundsForStandardKnobs];
  double v13 = fmax(v11, v12);
  double v22 = 0.0;
  if ([v9 connectionType])
  {
    -[CRLCanvasLayout p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:](self, "p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:", &v22, x, y, v13);
  }
  else
  {
    double v16 = INFINITY;
    double v17 = INFINITY;
    if (a4 == 11) {
      double v18 = x;
    }
    else {
      double v18 = INFINITY;
    }
    if (a4 == 11) {
      double v19 = y;
    }
    else {
      double v19 = INFINITY;
    }
    if (a4 == 10)
    {
      double v16 = x;
      double v17 = y;
    }
    -[CRLCanvasLayout p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:](self, "p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:", v9, a4, &v22, v18, v19, v16, v17);
  }
  if (v22 < v13)
  {
    double y = v15;
    double x = v14;
  }

  double v20 = x;
  double v21 = y;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CRLCanvasElementInfo)info
{
  return *(CRLCanvasElementInfo **)(&self->super._lastInterimPositionYSet + 1);
}

- (CRLCanvasLayoutGeometry)originalGeometry
{
  return *(CRLCanvasLayoutGeometry **)((char *)&self->mInvalidFlags + 2);
}

- (void)setOriginalGeometry:(id)a3
{
}

- (int)layoutState
{
  return *(_DWORD *)((char *)&self->mInfo + 2);
}

- (unint64_t)freeTransformState
{
  return *(void *)((char *)&self->mLayoutState + 2);
}

- (NSSet)connectedLayouts
{
  return *(NSSet **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
}

- (CGSize)maximumInlineFrameSize
{
  double v2 = *(double *)((char *)&self->mConnectedLayouts + 2);
  double v3 = *(double *)((char *)&self->mMaximumInlineFrameSize.width + 2);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setMaximumInlineFrameSize:(CGSize)a3
{
  *(NSMutableSet **)((char *)&self->mConnectedLayouts + 2) = *(NSMutableSet **)&a3.width;
  *(CGFloat *)((char *)&self->mMaximumInlineFrameSize.width + 2) = a3.height;
}

- (BOOL)isInRealTimeDynamicOperation
{
  return BYTE2(self->mConvexHullPath);
}

- (CRLCanvasInfoGeometry)infoGeometryBeforeDynamicOperation
{
  return *(CRLCanvasInfoGeometry **)(&self->mIsInRealTimeDynamicOperation + 2);
}

- (CGRect)initialBoundsForStandardKnobs
{
  double v2 = *(double *)((char *)&self->mBaseGeometry + 2);
  double v3 = *(double *)((char *)&self->mInitialBoundsForStandardKnobs.origin.x + 2);
  double v4 = *(double *)((char *)&self->mInitialBoundsForStandardKnobs.origin.y + 2);
  double v5 = *(double *)((char *)&self->mInitialBoundsForStandardKnobs.size.width + 2);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setInitialBoundsForStandardKnobs:(CGRect)a3
{
  *(CRLCanvasLayoutGeometry **)((char *)&self->mBaseGeometry + 2) = *(CRLCanvasLayoutGeometry **)&a3.origin.x;
  *(CGFloat *)((char *)&self->mInitialBoundsForStandardKnobs.origin.x + 2) = a3.origin.y;
  *(CGFloat *)((char *)&self->mInitialBoundsForStandardKnobs.origin.y + 2) = a3.size.width;
  *(CGFloat *)((char *)&self->mInitialBoundsForStandardKnobs.size.width + 2) = a3.size.height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->mIsInRealTimeDynamicOperation + 2), 0);
  objc_storeStrong((id *)((char *)&self->mCardinalWestPosition.y + 2), 0);
  objc_storeStrong((id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2), 0);
  objc_storeStrong((id *)((char *)&self->mInvalidFlags + 2), 0);

  objc_storeStrong((id *)(&self->super._lastInterimPositionYSet + 1), 0);
}

@end