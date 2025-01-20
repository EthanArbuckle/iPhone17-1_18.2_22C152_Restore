@interface CRLShapeLayout
- (BOOL)canBeDivided;
- (BOOL)canBeIntersected;
- (BOOL)canResetTextAndObjectHandles;
- (BOOL)currentlySupportsAddingFrames;
- (BOOL)i_isInsideResizingFreehandDrawing;
- (BOOL)isBeingManipulated;
- (BOOL)isInvisible;
- (BOOL)isInvisibleAutosizingShape;
- (BOOL)isStrokeBeingManipulated;
- (BOOL)isTailEndOnLeft;
- (BOOL)p_cachedPathHasAtLeastTwoVisuallyDistinctSubregions;
- (BOOL)p_cachedPathIsLineSegment;
- (BOOL)p_cachedPathIsOpen;
- (BOOL)p_canResizeViaTransform;
- (BOOL)p_dynamicallyUpdatingStrokedFramesDuringResize;
- (BOOL)pathIsLineSegment;
- (BOOL)pathIsOpen;
- (BOOL)shouldAdjustForStrokeWidthForCollabCursor;
- (BOOL)shouldBringCardinalMagnetsInward;
- (BOOL)supportsCalloutAttributes;
- (BOOL)supportsRotation;
- (CGAffineTransform)computeLayoutTransform;
- (CGPoint)centerForConnecting;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)headLineEndPoint;
- (CGPoint)headPoint;
- (CGPoint)tailLineEndPoint;
- (CGPoint)tailPoint;
- (CGRect)aliasedAlignmentFrameForScale:(double)a3;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameInRoot;
- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3;
- (CGRect)boundsForStandardKnobs;
- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (CGRect)frameForPartitioning;
- (CGRect)p_cachedClippedPathStroked;
- (CGRect)p_cachedPathBounds;
- (CGRect)p_cachedPathBoundsWithoutStroke;
- (CGRect)p_updatedCachedClipRectIfNeededForRotation:(CGAffineTransform *)a3;
- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3;
- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3 strokeDrawOptions:(unint64_t)a4;
- (CGSize)minimumSize;
- (CRLBezierPath)clippedPathForLineEnds;
- (CRLBezierPath)maskPath;
- (CRLCanvasInfoGeometry)layoutInfoGeometry;
- (CRLFill)dynamicFill;
- (CRLFill)fill;
- (CRLLineEnd)strokeHeadLineEnd;
- (CRLLineEnd)strokeTailLineEnd;
- (CRLPKStrokePathCompactData)pencilKitStrokePathCompactData;
- (CRLPathSource)pathSource;
- (CRLShapeLayout)initWithInfo:(id)a3;
- (CRLSmartPathSource)smartPathSource;
- (NSArray)dynamicPatternOffsetsBySubpath;
- (NSArray)pencilKitStrokes;
- (NSArray)pencilKitStrokesInParentInfoSpace;
- (_TtC8Freeform12CRLShapeItem)shapeInfo;
- (double)adjustedCalloutTailPositionXWithValue:(double)a3;
- (double)headLineEndAngle;
- (double)lineEndScale:(BOOL)a3;
- (double)tailLineEndAngle;
- (id)captureDynamicInfoGeometryToBeginDynamicOperation;
- (id)commandForSettingArrowHead:(double)a3;
- (id)commandForSettingArrowIndent:(double)a3;
- (id)commandForSettingCalloutCornerRadius:(double)a3;
- (id)commandForSettingCalloutTailPositionX:(double)a3;
- (id)commandForSettingCalloutTailPositionY:(double)a3;
- (id)commandForSettingCalloutTailSize:(double)a3;
- (id)commandForSettingCornerRadius:(double)a3;
- (id)commandForSettingNumberOfSides:(double)a3;
- (id)commandForSettingStarPoints:(double)a3;
- (id)commandForSettingStarRadius:(double)a3;
- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3;
- (id)computeLayoutGeometry;
- (id)computeWrapPath;
- (id)computeWrapPathClosed:(BOOL)a3;
- (id)dependentLayoutsForDrag;
- (id)editablePathSource;
- (id)finalInfoGeometryForFreeTransform;
- (id)finalInfoGeometryForResize;
- (id)layoutGeometryFromInfo;
- (id)p_cachedPath;
- (id)p_createClippedPath;
- (id)p_unitePath:(id)a3 withLineEndForHead:(BOOL)a4 stroke:(id)a5;
- (id)stroke;
- (unint64_t)numberOfControlKnobs;
- (void)aliasPathForScale:(double)a3 adjustedStroke:(id *)a4 adjustedPath:(id *)a5 startDelta:(CGPoint *)a6 endDelta:(CGPoint *)a7;
- (void)aliasPathForScale:(double)a3 originalStroke:(id)a4 adjustedStroke:(id *)a5 adjustedPath:(id *)a6 startDelta:(CGPoint *)a7 endDelta:(CGPoint *)a8;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)beginFreeTransformWithTracker:(id)a3;
- (void)beginResize;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)dynamicMovePathKnobDidBegin;
- (void)dynamicMovePathKnobDidEnd;
- (void)dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin;
- (void)dynamicPencilKitStrokePathCompactDataRenderScaleDidEnd;
- (void)dynamicStrokeWidthChangeDidBegin;
- (void)dynamicStrokeWidthChangeDidEnd;
- (void)dynamicStrokeWidthUpdateToValue:(double)a3;
- (void)dynamicallyMakeShapeInvisible;
- (void)dynamicallyMovedPathKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)dynamicallyMovingLineSegmentWithTracker:(id)a3;
- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4;
- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4 withPatternOffsetsBySubpath:(id)a5;
- (void)dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:(double)a3 y:(double)a4;
- (void)endDynamicOperation;
- (void)endFreeTransform;
- (void)endResize;
- (void)invalidateExteriorWrap;
- (void)invalidateFrame;
- (void)invalidatePath;
- (void)invalidatePathBounds;
- (void)offsetGeometryBy:(CGPoint)a3;
- (void)p_applyResizeTransform:(CGAffineTransform *)a3 transformInParentSpace:(CGAffineTransform *)a4 preservingAspectRatio:(BOOL)a5 layoutSize:(CGSize)a6 geometryForLayout:(id)a7 hasHorizontalFlip:(BOOL)a8 hasVerticalFlip:(BOOL)a9;
- (void)p_beginResizeOrFreeTransform;
- (void)p_endResizeOrFreeTransform;
- (void)p_invalidateClippedPath;
- (void)p_invalidateHead;
- (void)p_invalidateTail;
- (void)p_performBlockOkayToSetGeometry:(id)a3;
- (void)p_updateResizeInfoGeometryFromDynamicPathSource;
- (void)p_validateHeadAndTail;
- (void)p_validateHeadLineEnd;
- (void)p_validateTailLineEnd;
- (void)processChangedProperty:(unint64_t)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setDynamicFill:(id)a3;
- (void)setDynamicGeometry:(id)a3;
- (void)setGeometry:(id)a3;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeRotationFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5;
- (void)validate;
@end

@implementation CRLShapeLayout

- (CRLShapeLayout)initWithInfo:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CRLShapeLayout;
  v3 = [(CRLCanvasLayout *)&v12 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CRLShapeLayout *)v3 shapeInfo];
    if (v5)
    {
      v6 = v5;
      BYTE3(v4->super.mDynamicOpacity) = -1;
      *(_OWORD *)((char *)&v4->mClippedPathRotatedTransform.c + 3) = *(_OWORD *)&CGAffineTransformIdentity.tx;
      long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)((char *)&v4->mCachedClippedPathRotatedStroked.originalCachedRect.size.height + 3) = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)((char *)&v4->mClippedPathRotatedTransform.a + 3) = v7;
      if ([(CRLShapeLayout *)v5 isFreehandDrawingShape]) {
        v8 = CRLShapeLayoutHelperFreehandDrawing;
      }
      else {
        v8 = CRLShapeLayoutHelperDefault;
      }
      v9 = (NSArray *)[[v8 alloc] initWithShapeLayout:v4];
      v10 = *(NSArray **)((char *)&v4->mDynamicStrokeOffsetArray + 3);
      *(NSArray **)((char *)&v4->mDynamicStrokeOffsetArray + 3) = v9;
    }
    else
    {
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  if (*(CRLStroke **)((char *)&self->mInitialStroke + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7430);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AE9E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7450);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 90, 0, "expected nil value for '%{public}s'", "mDynamicFill");
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeLayout;
  [(CRLShapeLayout *)&v6 dealloc];
}

- (id)layoutGeometryFromInfo
{
  if (*(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
  {
    v2 = [[CRLCanvasLayoutGeometry alloc] initWithInfoGeometry:*(CRLPathSource **)((char *)&self->mCachedPathSource + 3)];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLShapeLayout;
    v2 = [(CRLBoardItemLayout *)&v4 layoutGeometryFromInfo];
  }

  return v2;
}

- (id)computeLayoutGeometry
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(CRLCanvasAbstractLayout *)self parent];
  v5 = sub_1002469D0(v3, v4);

  if (v5)
  {
    [v5 maximumFrameSizeForChild:self];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = 1.79769313e308;
    double v9 = 1.79769313e308;
  }
  if (v7 == *(double *)(&self->mIsDynamicallyInvisible + 3) && v9 == *(double *)((char *)&self->mHelper + 3))
  {
    objc_super v12 = [(CRLShapeLayout *)self pathSource];
  }
  else
  {
    *(double *)(&self->mIsDynamicallyInvisible + 3) = v7;
    *(double *)((char *)&self->mHelper + 3) = v9;
    v11 = [(CRLShapeLayout *)self shapeInfo];
    objc_super v12 = [v11 pathSource];
  }
  if (v7 >= 1.79769313e308 && v9 >= 1.79769313e308)
  {
    id v13 = 0;
    goto LABEL_22;
  }
  id v14 = [v12 copy];
  v15 = [(CRLShapeLayout *)self layoutInfoGeometry];
  [v15 center];
  double v17 = v16;
  double v19 = v18;
  v20 = [(CRLShapeLayout *)self layoutInfoGeometry];
  [v20 position];
  double v22 = v21;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  v23 = [(CRLShapeLayout *)self layoutInfoGeometry];
  if (v23)
  {
    double v24 = sub_100064680(v17, v19, v22);
    [v23 transformBasedOnPoint:CGPointZero.x, CGPointZero.y, v24, v25];
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
  }

  long long v40 = v43;
  long long v41 = v44;
  long long v42 = v45;
  [(CRLStyledLayout *)self scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:&v40 withStartingPathSource:v14];
  double v27 = v26;
  if (v26 == 1.0)
  {
    if (v12 != *(void **)((char *)&self->mHeadCutT + 3))
    {
      id v13 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    [v14 naturalSize];
    [v14 scaleToNaturalSize:sub_1000646A4(v28, v29, v27)];
  }
  id v13 = v14;
LABEL_21:

LABEL_22:
  v30 = *(void **)((char *)&self->mHeadCutT + 3);
  *(void *)((char *)&self->mHeadCutT + 3) = v13;
  id v31 = v13;

  v32 = [(CRLShapeLayout *)self pathSource];
  if (v32 == v12)
  {

    if ((v31 != 0) != (v30 == 0)) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  [(CRLShapeLayout *)self invalidatePath];
  [(CRLShapeLayout *)self invalidatePathBounds];
LABEL_26:
  [(CRLShapeLayout *)self pathBounds];
  double v34 = v33;
  double v36 = v35;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  [(CRLShapeLayout *)self computeLayoutTransform];
  v37 = [CRLCanvasLayoutGeometry alloc];

  long long v40 = v43;
  long long v41 = v44;
  long long v42 = v45;
  v38 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v37, "initWithSize:transform:", &v40, v34, v36);

  return v38;
}

- (CGAffineTransform)computeLayoutTransform
{
  memset(&v11, 0, sizeof(v11));
  v5 = [(CRLShapeLayout *)self layoutInfoGeometry];
  double v6 = v5;
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }

  [(CRLShapeLayout *)self pathBounds];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  CGAffineTransform v10 = v11;
  return CGAffineTransformTranslate(retstr, &v10, v7, v8);
}

- (BOOL)shouldBringCardinalMagnetsInward
{
  if ([(CRLShapeLayout *)self numberOfControlKnobs]) {
    return 1;
  }
  objc_super v4 = [(CRLShapeLayout *)self pathSource];
  v5 = [v4 bezierPath];
  BOOL v3 = (uint64_t)[v5 elementCount] < 8;

  return v3;
}

- (void)p_performBlockOkayToSetGeometry:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  if (BYTE3(self->mLastParentLimitedSize.width))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7470);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AEA78();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7490);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_performBlockOkayToSetGeometry:]");
    CGFloat v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:178 isFatal:0 description:"Reentrant geometry changing okay logic"];

    char v8 = BYTE3(self->mLastParentLimitedSize.width);
  }
  else
  {
    char v8 = 0;
  }
  BYTE3(self->mLastParentLimitedSize.width) = 1;
  v4[2](v4);
  BYTE3(self->mLastParentLimitedSize.width) = v8;
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  if (!BYTE3(self->mLastParentLimitedSize.width))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F74B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AEB00();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F74D0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout setGeometry:]");
    CGFloat v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 186, 0, "You should not be setting the geometry on a shape except via its own validation logic, or via -offsetGeometryBy: Please talk to drawables if you think you want to do this.");
  }
  if (*(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3))
  {
    char v8 = [(CRLCanvasAbstractLayout *)self geometry];
    double v9 = v8;
    if (v8)
    {
      if ([v8 isEqual:v4])
      {
LABEL_28:

        goto LABEL_29;
      }
      if (([v9 differsInMoreThanTranslationFrom:v4] & 1) == 0)
      {
        if (v4)
        {
          [v4 transform];
          float64x2_t v11 = v35;
          float64x2_t v12 = v36;
          float64x2_t v13 = v37;
        }
        else
        {
          float64x2_t v13 = 0uLL;
          float64x2_t v36 = 0u;
          float64x2_t v37 = 0u;
          float64x2_t v35 = 0u;
          float64x2_t v11 = 0uLL;
          float64x2_t v12 = 0uLL;
        }
        double y = CGPointZero.y;
        CGPoint v23 = CGPointZero;
        float64x2_t v24 = vaddq_f64(v13, vmlaq_n_f64(vmulq_n_f64(v12, y), v11, CGPointZero.x));
        [v9 transform:&y, v10];
        double v15 = sub_100064680(v24.f64[0], v24.f64[1], vaddq_f64(v34, vmlaq_n_f64(vmulq_n_f64(v33, v22), v32, v23.x)).f64[0]);
        *(double *)((char *)&self->mClippedPathRotatedTransform.tx + 3) = sub_100064698(*(double *)((char *)&self->mClippedPathRotatedTransform.tx+ 3), *(double *)((char *)&self->mClippedPathRotatedTransform.ty+ 3), v15);
        *(void *)((char *)&self->mClippedPathRotatedTransform.ty + 3) = v16;
        double v17 = (_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3);
        long long v18 = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3);
        *(_OWORD *)&v31.a = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3);
        *(_OWORD *)&v31.c = v18;
        *(_OWORD *)&v31.tx = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3);
        if (sub_10007F788(&v31) == 0.0)
        {
          *(double *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.height + 3) = sub_100064698(*(double *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.height + 3), *(double *)((char *)&self->mCachedAlignmentFrame.isValid + 3), v15);
          *(void *)((char *)&self->mCachedAlignmentFrame.isValid + 3) = v19;
          memset(&v31, 0, sizeof(v31));
          [v9 transform];
          CGAffineTransformInvert(&t2, &v29);
          long long v20 = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3);
          *(_OWORD *)&t1.a = *v17;
          *(_OWORD *)&t1.c = v20;
          *(_OWORD *)&t1.tx = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3);
          CGAffineTransformConcat(&v31, &t1, &t2);
          if (v4) {
            [v4 transform];
          }
          else {
            memset(&v27, 0, sizeof(v27));
          }
          CGAffineTransform v26 = v31;
          CGAffineTransformConcat(&t1, &v26, &v27);
          long long v21 = *(_OWORD *)&t1.c;
          *double v17 = *(_OWORD *)&t1.a;
          *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3) = v21;
          *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3) = *(_OWORD *)&t1.tx;
        }
        else
        {
          *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
        }
        goto LABEL_28;
      }
    }
    if (![(CRLShapeLayout *)self p_dynamicallyUpdatingStrokedFramesDuringResize]|| [(CRLCanvasLayout *)self layoutState] != 4&& [(CRLCanvasLayout *)self layoutState] != 5)
    {
      *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
      *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
    }
    goto LABEL_28;
  }
LABEL_29:
  v25.receiver = self;
  v25.super_class = (Class)CRLShapeLayout;
  [(CRLBoardItemLayout *)&v25 setGeometry:v4];
}

- (CGRect)alignmentFrame
{
  v2 = (double *)((char *)&self->mClippedPathRotatedTransform.tx + 3);
  if (*(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3))
  {
    double v3 = *v2;
    double v4 = *(double *)((char *)&self->mClippedPathRotatedTransform.ty + 3);
    double v5 = *(double *)((char *)&self->mCachedAlignmentFrame.cachedRect.origin.x + 3);
    double v6 = *(double *)((char *)&self->mCachedAlignmentFrame.cachedRect.origin.y + 3);
  }
  else
  {
    [(CRLCanvasAbstractLayout *)self transform];
    [(CRLShapeLayout *)self shapeFrameWithTransform:&v8];
    double *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLShapeLayout;
    long long v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v7;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    [(CRLStyledLayout *)&v14 baseFrameForFrameForCullingWithAdditionalTransform:&t1];
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    [(CRLCanvasAbstractLayout *)self transform];
    long long v12 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v12;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&t1, &v13, &t2);
    CGAffineTransform t2 = t1;
    [(CRLShapeLayout *)self shapeFrameWithTransform:&t2];
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.double y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  double v3 = [(CRLCanvasAbstractLayout *)self parent];

  if (v3)
  {
    double v4 = (double *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.height + 3);
    if (!*(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3)
      || ([(CRLCanvasAbstractLayout *)self transformInRoot],
          long long v5 = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3),
          *(_OWORD *)&t1.a = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3),
          *(_OWORD *)&t1.c = v5,
          *(_OWORD *)&t1.tx = *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3),
          !CGAffineTransformEqualToTransform(&t1, &t2)))
    {
      [(CRLCanvasAbstractLayout *)self transformInRoot];
      [(CRLShapeLayout *)self shapeFrameWithTransform:&v15];
      *(void *)double v4 = v6;
      *(void *)((char *)&self->mCachedAlignmentFrame.isValid + 3) = v7;
      *(void *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.x + 3) = v8;
      *(void *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.y + 3) = v9;
      [(CRLCanvasAbstractLayout *)self transformInRoot];
      long long v10 = *(_OWORD *)&t1.c;
      *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.height + 3) = *(_OWORD *)&t1.a;
      *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.a + 3) = v10;
      *(_OWORD *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.c + 3) = *(_OWORD *)&t1.tx;
      *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 1;
    }
    double v11 = *v4;
    double v12 = *(double *)((char *)&self->mCachedAlignmentFrame.isValid + 3);
    double v13 = *(double *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.x + 3);
    double v14 = *(double *)((char *)&self->mCachedAlignmentFrameInRoot.cachedRect.origin.y + 3);
  }
  else
  {
    [(CRLShapeLayout *)self alignmentFrame];
  }
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.x = v11;
  return result;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLShapeLayout;
  -[CRLCanvasLayout processChangedProperty:](&v7, "processChangedProperty:");
  switch(a3)
  {
    case 0xFuLL:
      if (![(CRLShapeLayout *)self i_isInsideResizingFreehandDrawing])
      {
        [(CRLShapeLayout *)self invalidatePathBounds];
        [(CRLShapeLayout *)self p_invalidateHead];
        [(CRLShapeLayout *)self p_invalidateTail];
        [(CRLShapeLayout *)self invalidateFrame];
        long long v5 = *(void **)((char *)&self->mHeadCutT + 3);
        if (v5)
        {
          *(double *)((char *)&self->mHeadCutT + 3) = 0.0;

          [(CRLShapeLayout *)self invalidatePath];
        }
      }
      return;
    case 0x13uLL:
      [(CRLShapeLayout *)self invalidatePath];
      uint64_t v6 = *(void **)((char *)&self->mHeadCutT + 3);
      *(double *)((char *)&self->mHeadCutT + 3) = 0.0;

      goto LABEL_8;
    case 0x15uLL:
      [(CRLShapeLayout *)self invalidatePathBounds];
      [(CRLShapeLayout *)self p_invalidateHead];
      goto LABEL_8;
    case 0x16uLL:
      [(CRLShapeLayout *)self invalidatePathBounds];
      [(CRLShapeLayout *)self p_invalidateTail];
LABEL_8:
      [(CRLShapeLayout *)self invalidateFrame];
      break;
    default:
      return;
  }
}

- (CGRect)boundsForStandardKnobs
{
  double v3 = [(CRLShapeLayout *)self pathSource];
  [v3 naturalSize];
  double v4 = sub_100064070();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  [(CRLShapeLayout *)self pathBounds];
  double v12 = -v11;
  double v14 = -v13;
  double v15 = v4;
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v10;

  return CGRectOffset(*(CGRect *)&v15, v12, v14);
}

- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLShapeLayout;
  long long v4 = *(_OWORD *)&a4->c;
  v5[0] = *(_OWORD *)&a4->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a4->tx;
  -[CRLStyledLayout frameForCullingWithBaseFrame:additionalTransform:](&v6, "frameForCullingWithBaseFrame:additionalTransform:", v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v7, -1.0, -1.0);
}

- (CGRect)frameForPartitioning
{
  [(CRLCanvasLayout *)self frameForCulling];

  return CGRectInset(*(CGRect *)&v2, 1.0, 1.0);
}

- (id)dependentLayoutsForDrag
{
  uint64_t v2 = [(CRLCanvasLayout *)self dependentLayouts];
  double v3 = [v2 crl_arrayOfObjectsPassingTest:&stru_1014F7510];

  return v3;
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLShapeLayout;
  -[CRLBoardItemLayout dragBy:](&v13, "dragBy:");
  objc_super v6 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7530);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AEB88();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7550);
    }
    CGRect v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dragBy:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 333, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");

    objc_super v6 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  }
  CGAffineTransformMakeTranslation(&v12, x, y);
  uint64_t v10 = [v6 geometryByAppendingTransform:&v12];
  double v11 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v10;
}

- (BOOL)shouldAdjustForStrokeWidthForCollabCursor
{
  if (![(CRLShapeLayout *)self pathIsLineSegment]) {
    return 0;
  }
  double v3 = [(CRLCanvasLayout *)self info];
  long long v4 = [v3 geometry];
  [v4 size];
  if (v5 == 0.0)
  {
    BOOL v6 = 1;
  }
  else
  {
    CGRect v7 = [(CRLCanvasLayout *)self info];
    uint64_t v8 = [v7 geometry];
    [v8 size];
    BOOL v6 = v9 == 0.0;
  }
  return v6;
}

- (id)stroke
{
  uint64_t v2 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    long long v4 = [(CRLShapeLayout *)self shapeInfo];
    id v3 = [v4 stroke];
  }

  return v3;
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  if (*(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7570);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AEC1C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7590);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    long long v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicStrokeWidthChangeDidBegin]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 355, 0, "expected nil value for '%{public}s'", "mDynamicStroke");
  }
  BOOL v6 = [(CRLShapeLayout *)self shapeInfo];
  CGRect v7 = [v6 stroke];
  uint64_t v8 = (CRLPKStrokePathCompactData *)[v7 mutableCopy];
  double v9 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3) = v8;
}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  double v5 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F75B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AECB0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F75D0);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    CGRect v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicStrokeWidthUpdateToValue:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 360, 0, "invalid nil value for '%{public}s'", "mDynamicStroke");

    double v5 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  }
  [v5 setWidth:a3];
  [(CRLShapeLayout *)self processChangedProperty:15];
  if ([(CRLCanvasLayout *)self layoutState] != 4
    && [(CRLCanvasLayout *)self layoutState] != 5)
  {
    double v9 = [(CRLCanvasLayout *)self layoutController];
    uint64_t v10 = [v9 canvas];
    double v11 = [v10 canvasController];

    CGAffineTransform v12 = [v11 repForLayout:self];
    [v12 processChangedProperty:15];
  }
}

- (void)dynamicStrokeWidthChangeDidEnd
{
  uint64_t v2 = *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3) = 0;
}

- (BOOL)isStrokeBeingManipulated
{
  return *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3) != 0;
}

- (BOOL)currentlySupportsAddingFrames
{
  return ![(CRLShapeLayout *)self pathIsOpen];
}

- (_TtC8Freeform12CRLShapeItem)shapeInfo
{
  uint64_t v3 = objc_opt_class();
  long long v4 = [(CRLCanvasLayout *)self info];
  double v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLShapeItem *)v5;
}

- (CRLPathSource)pathSource
{
  uint64_t v2 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  if (v2 || (uint64_t v2 = *(void **)((char *)&self->mHeadCutT + 3)) != 0)
  {
    id v3 = v2;
  }
  else
  {
    double v5 = [(CRLShapeLayout *)self shapeInfo];
    id v3 = [v5 pathSource];
  }

  return (CRLPathSource *)v3;
}

- (CRLBezierPath)maskPath
{
  uint64_t v2 = *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3);
  if (!v2)
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = [(CRLShapeLayout *)self shapeInfo];
    sub_1002469D0(v5, v6);
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      uint64_t v7 = [v3 maskPath];
LABEL_7:

      id v3 = (id)v7;
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  id v3 = v2;
  if ([v3 isEmpty]) {
    goto LABEL_6;
  }
LABEL_8:

  return (CRLBezierPath *)v3;
}

- (NSArray)pencilKitStrokes
{
  if (*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3)
    || *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3)
    || *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3)
    || *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3))
  {
    id v3 = (objc_class *)objc_opt_class();
    long long v4 = [(CRLShapeLayout *)self stroke];
    uint64_t v5 = sub_10024715C(v3, v4);

    if (v5)
    {
      BOOL v6 = [(CRLShapeLayout *)self path];
      uint64_t v7 = [(CRLShapeLayout *)self pencilKitStrokePathCompactData];
      uint64_t v8 = [(CRLShapeLayout *)self maskPath];
      double v9 = +[CRLPKStrokeConverter pencilKitStrokesFromPath:v6 inkStroke:v5 strokePathCompactData:v7 maskPath:v8];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F75F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AED44();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F7610);
      }
      uint64_t v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout pencilKitStrokes]");
      CGAffineTransform v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 432, 0, "invalid nil value for '%{public}s'", "inkStroke");

      double v9 = 0;
    }
  }
  else
  {
    double v14 = (objc_class *)objc_opt_class();
    double v15 = [(CRLShapeLayout *)self shapeInfo];
    uint64_t v5 = sub_10024715C(v14, v15);

    double v9 = [v5 pencilKitStrokes];
  }

  return (NSArray *)v9;
}

- (NSArray)pencilKitStrokesInParentInfoSpace
{
  if (*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3)
    || *(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3)
    || *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3)
    || *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3)
    || *(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    id v3 = [(CRLShapeLayout *)self layoutInfoGeometry];
    long long v4 = v3;
    if (v3)
    {
      [v3 transform];
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
    }

    uint64_t v5 = [(CRLShapeLayout *)self pencilKitStrokes];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003F9D70;
    v11[3] = &unk_1014D65D0;
    long long v12 = v15;
    long long v13 = v16;
    long long v14 = v17;
    uint64_t v6 = [v5 crl_arrayByTransformingWithBlock:v11];
  }
  else
  {
    double v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = [(CRLShapeLayout *)self shapeInfo];
    uint64_t v5 = sub_10024715C(v9, v10);

    uint64_t v6 = [v5 pencilKitStrokesInParentSpace];
  }
  uint64_t v7 = (void *)v6;

  return (NSArray *)v7;
}

- (CRLPKStrokePathCompactData)pencilKitStrokePathCompactData
{
  uint64_t v2 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = [(CRLShapeLayout *)self shapeInfo];
    uint64_t v7 = sub_10024715C(v5, v6);

    id v3 = [v7 pencilKitStrokePathCompactData];
  }

  return (CRLPKStrokePathCompactData *)v3;
}

- (id)editablePathSource
{
  id v3 = [(CRLShapeLayout *)self pathSource];
  long long v4 = [(CRLShapeLayout *)self shapeInfo];
  uint64_t v5 = [v4 pathSource];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = sub_1002469D0(v6, v3);
  if (v7)
  {
    id v8 = (id)v7;
    double v9 = *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3);
    *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3) = 0;

    uint64_t v10 = *(CRLPathSource **)((char *)&self->mOriginalShrunkenPathSource + 3);
    *(CRLPathSource **)((char *)&self->mOriginalShrunkenPathSource + 3) = 0;
  }
  else
  {
    if (v5 != *(CRLPathSource **)((char *)&self->mOriginalShrunkenPathSource + 3))
    {
      double v11 = +[CRLEditableBezierPathSource editableBezierPathSourceWithPathSource:v3];
      long long v12 = *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3);
      *(CRLPathSource **)((char *)&self->mShrunkenPathSource + 3) = v11;

      objc_storeStrong((id *)((char *)&self->mOriginalShrunkenPathSource + 3), v3);
    }
    id v8 = *(id *)((char *)&self->mShrunkenPathSource + 3);
  }

  return v8;
}

- (CRLSmartPathSource)smartPathSource
{
  uint64_t v2 = [(CRLShapeLayout *)self pathSource];
  double v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

  return (CRLSmartPathSource *)v9;
}

- (BOOL)pathIsOpen
{
  return [(CRLShapeLayout *)self p_cachedPathIsOpen];
}

- (BOOL)pathIsLineSegment
{
  return [(CRLShapeLayout *)self p_cachedPathIsLineSegment];
}

- (CRLCanvasInfoGeometry)layoutInfoGeometry
{
  uint64_t v2 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [(CRLCanvasLayout *)self info];
    id v3 = [v4 geometry];
  }

  return (CRLCanvasInfoGeometry *)v3;
}

- (CGPoint)headPoint
{
  [(CRLShapeLayout *)self p_validateHeadAndTail];
  double v3 = *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3);
  double v4 = *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.ty + 3);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)tailPoint
{
  [(CRLShapeLayout *)self p_validateHeadAndTail];
  double v3 = *(double *)((char *)&self->mHeadPoint.x + 3);
  double v4 = *(double *)((char *)&self->mHeadPoint.y + 3);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)headLineEndPoint
{
  [(CRLShapeLayout *)self p_validateHeadLineEnd];
  double v3 = *(double *)((char *)&self->mTailPoint.x + 3);
  double v4 = *(double *)((char *)&self->mTailPoint.y + 3);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)tailLineEndPoint
{
  [(CRLShapeLayout *)self p_validateTailLineEnd];
  double v3 = *(double *)((char *)&self->mHeadLineEndPoint.x + 3);
  double v4 = *(double *)((char *)&self->mHeadLineEndPoint.y + 3);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (double)headLineEndAngle
{
  return *(double *)((char *)&self->mTailLineEndPoint.x + 3);
}

- (double)tailLineEndAngle
{
  return *(double *)((char *)&self->mTailLineEndPoint.y + 3);
}

- (BOOL)isTailEndOnLeft
{
  [(CRLShapeLayout *)self tailLineEndPoint];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(CRLCanvasAbstractLayout *)self geometryInRoot];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 transform];
    double v10 = v32;
    double v9 = v31;
    double v12 = v34;
    double v11 = v33;
    double v13 = v36;
    double v14 = v35;
  }
  else
  {
    double v13 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
    double v14 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
  }

  [(CRLShapeLayout *)self headLineEndPoint];
  double v25 = v16;
  double v26 = v15;
  long long v17 = [(CRLCanvasAbstractLayout *)self geometryInRoot];
  uint64_t v18 = v17;
  if (v17)
  {
    [v17 transform];
    float64x2_t v19 = v28;
    float64x2_t v20 = v29;
    float64x2_t v21 = v30;
  }
  else
  {
    float64x2_t v21 = 0uLL;
    float64x2_t v19 = 0uLL;
    float64x2_t v20 = 0uLL;
  }
  *(void *)&double v27 = *(_OWORD *)&vaddq_f64(v21, vmlaq_n_f64(vmulq_n_f64(v20, v25), v19, v26));

  double v22 = sub_100064680(v14 + v6 * v11 + v9 * v4, v13 + v6 * v12 + v10 * v4, v27);
  if (fabs(v22) < 1.0) {
    double v22 = v23;
  }
  return v22 < 0.0;
}

- (double)lineEndScale:(BOOL)a3
{
  if (a3) {
    [(CRLShapeLayout *)self strokeHeadLineEnd];
  }
  else {
  double v4 = [(CRLShapeLayout *)self strokeTailLineEnd];
  }
  double v5 = [(CRLShapeLayout *)self stroke];
  [v5 width];
  [v4 scaleForStrokeWidth:];
  double v7 = v6;

  return v7;
}

- (CRLBezierPath)clippedPathForLineEnds
{
  if (SBYTE3(self->super.mDynamicOpacity) < 0)
  {
    id v3 = [(CRLShapeLayout *)self p_createClippedPath];
    double v4 = *(void **)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3);
    *(void *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3) = v3;

    BYTE3(self->super.mDynamicOpacity) &= ~0x80u;
  }
  double v5 = *(void **)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3);

  return (CRLBezierPath *)v5;
}

- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&a3->tx;
  [(CRLShapeLayout *)self shapeFrameWithTransform:v8 strokeDrawOptions:7];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3 strokeDrawOptions:(unint64_t)a4
{
  char v4 = a4;
  [(CRLShapeLayout *)self pathBounds];
  long long v9 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v34.c = v9;
  *(_OWORD *)&v34.tCGFloat x = *(_OWORD *)&a3->tx;
  CGAffineTransformTranslate(&v35, &v34, -v7, -v8);
  long long v10 = *(_OWORD *)&v35.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v35.a;
  *(_OWORD *)&a3->c = v10;
  *(_OWORD *)&a3->tCGFloat x = *(_OWORD *)&v35.tx;
  if (v4)
  {
    long long v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v35.c = v15;
    *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a3->tx;
    if (sub_100080074(&v35.a))
    {
      [(CRLShapeLayout *)self p_cachedClippedPathStroked];
      long long v16 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v16;
      *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a3->tx;
      CGRect v37 = CGRectApplyAffineTransform(v36, &v35);
    }
    else
    {
      long long v17 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v17;
      *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a3->tx;
      [(CRLShapeLayout *)self p_updatedCachedClipRectIfNeededForRotation:&v35];
    }
    CGFloat x = v37.origin.x;
    CGFloat y = v37.origin.y;
    CGFloat width = v37.size.width;
    CGFloat height = v37.size.height;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  if ([(CRLShapeLayout *)self pathIsOpen])
  {
    if ((v4 & 2) != 0)
    {
      uint64_t v18 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
      long long v19 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v19;
      *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a3->tx;
      [v18 boundsOfLineEndForHead:1 transform:&v35];
      v43.origin.CGFloat x = v20;
      v43.origin.CGFloat y = v21;
      v43.size.CGFloat width = v22;
      v43.size.CGFloat height = v23;
      v38.origin.CGFloat x = x;
      v38.origin.CGFloat y = y;
      v38.size.CGFloat width = width;
      v38.size.CGFloat height = height;
      CGRect v39 = CGRectUnion(v38, v43);
      CGFloat x = v39.origin.x;
      CGFloat y = v39.origin.y;
      CGFloat width = v39.size.width;
      CGFloat height = v39.size.height;
    }
    if ((v4 & 4) != 0)
    {
      float64x2_t v24 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
      long long v25 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v35.c = v25;
      *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&a3->tx;
      [v24 boundsOfLineEndForHead:0 transform:&v35];
      v44.origin.CGFloat x = v26;
      v44.origin.CGFloat y = v27;
      v44.size.CGFloat width = v28;
      v44.size.CGFloat height = v29;
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      CGRect v41 = CGRectUnion(v40, v44);
      CGFloat x = v41.origin.x;
      CGFloat y = v41.origin.y;
      CGFloat width = v41.size.width;
      CGFloat height = v41.size.height;
    }
  }
  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (BOOL)isInvisible
{
  return BYTE3(self->mDynamicFill);
}

- (BOOL)isInvisibleAutosizingShape
{
  long long v3 = [(CRLCanvasLayout *)self info];
  char v4 = [v3 geometry];
  unsigned int v5 = [v4 widthValid];

  double v6 = [(CRLCanvasLayout *)self info];
  double v7 = [v6 geometry];
  unsigned __int8 v8 = [v7 heightValid];

  if (v5 && (v8 & 1) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    long long v10 = [(CRLCanvasLayout *)self layoutController];
    double v11 = [v10 canvas];
    unsigned int v9 = [v11 shouldShowInstructionalTextForLayout:self] ^ 1;
  }
  return v9;
}

- (CGPoint)centerForConnecting
{
  v13.receiver = self;
  v13.super_class = (Class)CRLShapeLayout;
  [(CRLCanvasLayout *)&v13 centerForConnecting];
  double v4 = v3;
  double v6 = v5;
  if ([(CRLShapeLayout *)self isInvisibleAutosizingShape])
  {
    double v7 = [(CRLCanvasLayout *)self info];
    unsigned __int8 v8 = [v7 geometry];
    [v8 center];
    double v4 = v9;
    double v6 = v10;
  }
  double v11 = v4;
  double v12 = v6;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  [*(id *)((char *)&self->mDynamicStrokeOffsetArray + 3) aliasedAlignmentFrameForScale:a3];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)aliasPathForScale:(double)a3 adjustedStroke:(id *)a4 adjustedPath:(id *)a5 startDelta:(CGPoint *)a6 endDelta:(CGPoint *)a7
{
  id v13 = [(CRLShapeLayout *)self stroke];
  [(CRLShapeLayout *)self aliasPathForScale:v13 originalStroke:a4 adjustedStroke:a5 adjustedPath:a6 startDelta:a7 endDelta:a3];
}

- (void)aliasPathForScale:(double)a3 originalStroke:(id)a4 adjustedStroke:(id *)a5 adjustedPath:(id *)a6 startDelta:(CGPoint *)a7 endDelta:(CGPoint *)a8
{
  id v14 = a4;
  long long v15 = [(CRLShapeLayout *)self shapeInfo];
  v85 = v15;
  if (![(CRLShapeLayout *)self pathIsOpen])
  {
LABEL_17:
    float64x2_t v24 = a7;
    uint64_t v25 = [(CRLShapeLayout *)self path];
    goto LABEL_22;
  }
  v80 = a6;
  v83 = a5;
  long long v16 = [v15 headLineEnd];
  if (v16)
  {
    unsigned __int8 v8 = [v15 headLineEnd];
    a5 = +[NSNull null];
    if ([v8 isEqual:a5])
    {
      int v17 = 0;
    }
    else
    {
      uint64_t v18 = [v15 headLineEnd];
      if (([v18 isNone] & 1) == 0)
      {

        a5 = v83;
        goto LABEL_21;
      }
      id v77 = v18;
      int v17 = 1;
    }
  }
  else
  {
    int v17 = 0;
  }
  uint64_t v19 = [v15 tailLineEnd];
  if (!v19)
  {
    char v23 = 0;
    if (!v17) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  CGFloat v20 = (void *)v19;
  v79 = a7;
  CGFloat v21 = [v15 tailLineEnd];
  CGFloat v22 = +[NSNull null];
  if ([v21 isEqual:v22])
  {

    char v23 = 0;
    a7 = v79;
    if ((v17 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_13:

    goto LABEL_14;
  }
  [v15 tailLineEnd];
  char v76 = v17;
  CGFloat v26 = a5;
  CGFloat v27 = v8;
  v29 = id v28 = v14;
  char v23 = [v29 isNone] ^ 1;

  id v14 = v28;
  unsigned __int8 v8 = v27;
  a5 = v26;

  a7 = v79;
  if (v76) {
    goto LABEL_13;
  }
LABEL_14:
  a6 = v80;
  if (v16)
  {
  }
  a5 = v83;
  if ((v23 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_21:
  float64x2_t v24 = a7;
  uint64_t v25 = [(CRLShapeLayout *)self clippedPathForLineEnds];
LABEL_22:
  double v30 = (void *)v25;
  memset(&v93, 0, sizeof(v93));
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  double v31 = [(CRLCanvasLayout *)self layoutController];
  double v32 = [v31 canvas];

  double v33 = a8;
  if ([v32 isPrinting]) {
    unsigned int v34 = 1;
  }
  else {
    unsigned int v34 = [v32 isDrawingIntoPDF];
  }
  CGAffineTransform v35 = v24;
  if (a5) {
    *a5 = v14;
  }
  if (a6) {
    *a6 = [v30 copy];
  }
  if (v24) {
    *float64x2_t v24 = CGPointZero;
  }
  if (a8) {
    *a8 = CGPointZero;
  }
  if (v30)
  {
    CGAffineTransform v94 = v93;
    if (((!sub_10007F964(&v94.a) | v34) & 1) == 0)
    {
      [(CRLShapeLayout *)self pathBounds];
      double v37 = v36;
      double v39 = v38;
      if (![v14 shouldRender] || objc_msgSend(v14, "shouldAntialiasDefeat"))
      {
        id v78 = [v14 mutableCopy];
        double v40 = 0.0;
        if ([v78 shouldRender])
        {
          [v14 width];
          double v42 = v41 * a3;
          double v40 = 1.0;
          if (v42 > 1.0)
          {
            double v40 = sub_100407DFC(v42);
            [v78 setWidth:v40 / a3];
          }
          [v14 width];
          [v78 setActualWidth:];
        }
        v84 = a5;
        if (v24)
        {
          if (a8)
          {
LABEL_62:
            id v49 = [v30 copy];
            [v30 elementAtIndex:0 associatedPoints:&v94];
            if (v35) {
              *CGAffineTransform v35 = *(CGPoint *)&v94.a;
            }
            if (v33)
            {
              [v30 currentPoint];
              v33->CGFloat x = v50;
              v33->CGFloat y = v51;
            }
            CGAffineTransform v91 = v93;
            CGAffineTransformTranslate(&v92, &v91, -v37, -v39);
            CGAffineTransform v93 = v92;
            [v49 transformUsingAffineTransform:&v92];
            v52 = [(CRLShapeLayout *)self pathSource];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v52 isCurveContinuous])
            {
              id v87 = [v52 copy];
              [v49 bounds];
              v55 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
              *(float *)&double v56 = a3;
              *(float *)&double v57 = v40;
              [v55 aliasedPathWithViewScale:v56 effectiveStrokeWidth:v57];
              v59 = v58 = a6;
              [v59 bounds];
              double v61 = v60;
              double v63 = v62;
              CGFloat v65 = v64;
              CGFloat v67 = v66;

              a6 = v58;
              CGAffineTransform v35 = v24;
              CGAffineTransform v92 = v93;
              CGAffineTransformInvert(&v90, &v92);
              v95.origin.CGFloat x = v61;
              v95.origin.CGFloat y = v63;
              v95.size.CGFloat width = v65;
              v95.size.CGFloat height = v67;
              CGRect v96 = CGRectApplyAffineTransform(v95, &v90);
              [v87 scaleToNaturalSize:v96.size.width, v96.size.height];
              v68 = [v87 bezierPathWithoutFlips];

              CGAffineTransform v92 = v93;
              [v68 transformUsingAffineTransform:&v92];
              [v68 bounds];
              CGFloat v70 = v61 - v69;
              [v68 bounds];
              CGAffineTransformMakeTranslation(&v89, v70, v63 - v71);
              [v68 transformUsingAffineTransform:&v89];
              id v49 = v87;
            }
            else
            {
              *(float *)&double v53 = a3;
              *(float *)&double v54 = v40;
              v68 = [v49 aliasedPathWithViewScale:v53 effectiveStrokeWidth:v54];
            }

            CGAffineTransform v92 = v93;
            CGAffineTransformInvert(&v88, &v92);
            [v68 transformUsingAffineTransform:&v88];
            *(CGPoint *)&v92.a = CGPointZero;
            [v68 elementAtIndex:0 associatedPoints:&v92];
            if (v35)
            {
              v35->CGFloat x = sub_100064680(v92.a, v92.b, v35->x);
              v35->CGFloat y = v72;
            }
            if (v33)
            {
              [v68 currentPoint];
              v33->CGFloat x = sub_100064680(v73, v74, v33->x);
              v33->CGFloat y = v75;
            }
            if (v84) {
              id *v84 = v78;
            }
            if (a6) {
              *a6 = v68;
            }

            goto LABEL_79;
          }
        }
        else
        {
          v81 = a6;
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F7630);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010AEE6C();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F7650);
          }
          double v33 = a8;
          CGRect v43 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v43);
          }
          CGRect v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:]");
          long long v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 716, 0, "invalid nil value for '%{public}s'", "startDelta");

          CGAffineTransform v35 = 0;
          a6 = v81;
          if (a8) {
            goto LABEL_62;
          }
        }
        v82 = a6;
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F7670);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AEDD8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F7690);
        }
        double v33 = a8;
        v46 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v46);
        }
        v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:]");
        v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 717, 0, "invalid nil value for '%{public}s'", "endDelta");

        CGAffineTransform v35 = v24;
        a6 = v82;
        goto LABEL_62;
      }
    }
  }
LABEL_79:
}

- (CRLFill)fill
{
  uint64_t v2 = *(CRLStroke **)((char *)&self->mInitialStroke + 3);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    double v4 = [(CRLShapeLayout *)self shapeInfo];
    id v3 = [v4 fill];
  }

  return (CRLFill *)v3;
}

- (BOOL)canBeIntersected
{
  if ([(CRLShapeLayout *)self pathIsLineSegment]) {
    return 0;
  }
  double v4 = [(CRLCanvasAbstractLayout *)self parent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(CRLCanvasAbstractLayout *)self parent];
    unsigned __int8 v3 = [v5 allowIntersectionOfChildLayout:self];
  }
  else
  {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (BOOL)canBeDivided
{
  return [(CRLShapeLayout *)self p_cachedPathHasAtLeastTwoVisuallyDistinctSubregions];
}

- (BOOL)canResetTextAndObjectHandles
{
  return ![(CRLShapeLayout *)self pathIsLineSegment];
}

- (BOOL)supportsCalloutAttributes
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLShapeLayout *)self pathSource];
  double v5 = sub_1002469D0(v3, v4);
  LOBYTE(v3) = v5 != 0;

  return v3;
}

- (void)invalidateFrame
{
  v12.receiver = self;
  v12.super_class = (Class)CRLShapeLayout;
  [(CRLCanvasLayout *)&v12 invalidateFrame];
  *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
  if ([(CRLCanvasLayout *)self layoutState] == 2)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [(CRLShapeLayout *)self dependentLayoutsForDrag];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        double v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) invalidateFrame];
          double v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)invalidatePath
{
  BYTE3(self->super.mDynamicOpacity) |= 0xFu;
  uint64_t v3 = *(void **)(&self->super._suppressesShadowsAndReflections + 3);
  *(void *)(&self->super._suppressesShadowsAndReflections + 3) = 0;

  [(CRLShapeLayout *)self invalidatePathBounds];
  [(CRLShapeLayout *)self p_invalidateHead];
  [(CRLShapeLayout *)self p_invalidateTail];

  [(CRLShapeLayout *)self p_invalidateClippedPath];
}

- (void)invalidatePathBounds
{
  *(_DWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedAlignmentFrameInRoot.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3) = 0;
  CGPoint origin = CGRectZero.origin;
  CGSize size = CGRectZero.size;
  *(CGPoint *)((char *)&self->mCachedPath + 3) = CGRectZero.origin;
  *(CGSize *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin + 3) = size;
  *(CGPoint *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.height + 3) = origin;
  *(CGSize *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin + 3) = size;
  [(CRLShapeLayout *)self invalidateExteriorWrap];
}

- (BOOL)i_isInsideResizingFreehandDrawing
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self parent];
  id v5 = sub_1002469D0(v3, v4);

  uint64_t v6 = objc_opt_class();
  double v7 = [v5 info];
  long long v8 = sub_1002469D0(v6, v7);

  if (v5 && ([v5 layoutState] == 4 || objc_msgSend(v5, "layoutState") == 5))
  {
    long long v9 = [(CRLCanvasLayout *)self info];
    unsigned int v10 = [v8 isNonGroupedChild:v9] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)p_dynamicallyUpdatingStrokedFramesDuringResize
{
  if ([(CRLShapeLayout *)self i_isInsideResizingFreehandDrawing])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = [(CRLShapeLayout *)self stroke];
    if (v4)
    {
      id v5 = [(CRLShapeLayout *)self stroke];
      unsigned int v3 = [v5 shouldRender] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)beginResize
{
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLayout;
  [(CRLCanvasLayout *)&v3 beginResize];
  [(CRLShapeLayout *)self p_beginResizeOrFreeTransform];
}

- (void)beginFreeTransformWithTracker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeLayout;
  [(CRLCanvasLayout *)&v4 beginFreeTransformWithTracker:a3];
  [(CRLShapeLayout *)self p_beginResizeOrFreeTransform];
}

- (void)p_beginResizeOrFreeTransform
{
  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3))
  {
    if ([(CRLShapeLayout *)self i_isInsideResizingFreehandDrawing])
    {
      [(CRLShapeLayout *)self dynamicStrokeWidthChangeDidBegin];
      if (*(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3)) {
        [(CRLShapeLayout *)self dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin];
      }
    }
  }
  [(CRLShapeLayout *)self p_cachedPathBounds];
  *(void *)((char *)&self->mCachedPathBoundsStruct.cachedRect.size.width + 3) = v3;
  *(void *)((char *)&self->mCachedPathBoundsStruct.cachedRect.size.height + 3) = v4;
  *(void *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.origin.x + 3) = v5;
  *(void *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.origin.y + 3) = v6;
  [(CRLShapeLayout *)self p_cachedPathBoundsWithoutStroke];
  *(void *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.size.width + 3) = v7;
  *(void *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.size.height + 3) = v8;
  *(void *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.origin.x + 3) = v9;
  *(void *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.origin.y + 3) = v10;
  [(CRLShapeLayout *)self alignmentFrame];
  *(void *)((char *)&self->mCachedAlignmentFrame.cachedRect.size.width + 3) = v11;
  *(void *)((char *)&self->mCachedAlignmentFrame.cachedRect.size.height + 3) = v12;
  *(void *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.origin.x + 3) = v13;
  *(void *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.origin.y + 3) = v14;
  [(CRLShapeLayout *)self p_cachedClippedPathStroked];
  *(void *)((char *)&self->mCachedClippedPathStroked.cachedRect.size.width + 3) = v15;
  *(void *)((char *)&self->mCachedClippedPathStroked.cachedRect.size.height + 3) = v16;
  *(void *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.origin.x + 3) = v17;
  *(void *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.origin.y + 3) = v18;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  long long v26 = 0uLL;
  v23[0] = v24;
  v23[1] = v25;
  v23[2] = 0uLL;
  [(CRLShapeLayout *)self p_updatedCachedClipRectIfNeededForRotation:v23];
  *(void *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.size.width + 3) = v19;
  *(void *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.size.height + 3) = v20;
  *(void *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.origin.x + 3) = v21;
  *(void *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.origin.y + 3) = v22;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  v79.receiver = self;
  v79.super_class = (Class)CRLShapeLayout;
  [(CRLBoardItemLayout *)&v79 beginDynamicOperationWithRealTimeCommands:a3];
  if (*(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F76B0);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_1010AF4C8();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F76D0);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 913, 0, "expected nil value for '%{public}s'", "mInitialPathSource");
  }
  if (*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F76F0);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_1010AF434();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7710);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 914, 0, "expected nil value for '%{public}s'", "mDynamicPathSource");
  }
  if (*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7730);
    }
    uint64_t v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1010AF3A0();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7750);
    }
    uint64_t v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 916, 0, "expected nil value for '%{public}s'", "mInitialInfoGeometry");
  }
  if (*(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7770);
    }
    uint64_t v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_1010AF30C();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7790);
    }
    uint64_t v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    uint64_t v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    uint64_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 917, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");
  }
  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F77B0);
    }
    uint64_t v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
      sub_1010AF278();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F77D0);
    }
    uint64_t v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    uint64_t v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    char v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 919, 0, "expected nil value for '%{public}s'", "mInitialStroke");
  }
  if (*(CRLPKStrokePathCompactData **)((char *)&self->mInitialPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F77F0);
    }
    long long v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
      sub_1010AF1E4();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7810);
    }
    long long v25 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    long long v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    CGFloat v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 920, 0, "expected nil value for '%{public}s'", "mDynamicStroke");
  }
  if (*(CRLPathSource **)((char *)&self->mInitialPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7830);
    }
    id v28 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
      sub_1010AF150();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7850);
    }
    CGFloat v29 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    double v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    double v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 922, 0, "expected nil value for '%{public}s'", "mInitialMaskPath");
  }
  if (*(CRLPathSource **)((char *)&self->mDynamicPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7870);
    }
    double v32 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
      sub_1010AF0BC();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7890);
    }
    double v33 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    unsigned int v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    CGAffineTransform v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 923, 0, "expected nil value for '%{public}s'", "mDynamicMaskPath");
  }
  if (*(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F78B0);
    }
    double v36 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR)) {
      sub_1010AF028();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F78D0);
    }
    double v37 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    double v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    double v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 925, 0, "expected nil value for '%{public}s'", "mDynamicStrokeOffsetArray");
  }
  if (*(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F78F0);
    }
    double v40 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
      sub_1010AEF94();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7910);
    }
    double v41 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    double v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    CGRect v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v43, 927, 0, "expected nil value for '%{public}s'", "mInitialPencilKitStrokePathCompactData");
  }
  if (*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7930);
    }
    CGRect v44 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR)) {
      sub_1010AEF00();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7950);
    }
    long long v45 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    v46 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout beginDynamicOperationWithRealTimeCommands:]");
    v47 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v47, 928, 0, "expected nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");
  }
  v48 = [(CRLShapeLayout *)self shapeInfo];
  id v49 = [(CRLCanvasLayout *)self pureGeometry];
  CGFloat v50 = [v48 pathSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(CRLShapeLayout *)self editablePathSource];
  }
  else {
  v52 = [(CRLShapeLayout *)self pathSource];
  }
  double v53 = (CRLEditableBezierPathSource *)[v52 copy];
  double v54 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3) = v53;

  v55 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  [v49 size];
  [v55 scaleToNaturalSize:];
  double v56 = [(CRLShapeLayout *)self maskPath];
  double v57 = (CRLPathSource *)[v56 copy];
  v58 = *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3);
  *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3) = v57;

  v59 = [(CRLShapeLayout *)self pathSource];
  double v60 = (CRLBezierPath *)[v59 copy];
  double v61 = *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3) = v60;

  double v62 = [(CRLShapeLayout *)self maskPath];
  double v63 = (CRLPathSource *)[v62 copy];
  double v64 = *(CRLPathSource **)((char *)&self->mInitialPathSource + 3);
  *(CRLPathSource **)((char *)&self->mInitialPathSource + 3) = v63;

  if ([(CRLCanvasLayout *)self isInTopLevelContainerForEditing]) {
    goto LABEL_115;
  }
  double v66 = [v48 geometry];
  if (([v66 widthValid] & 1) == 0)
  {

LABEL_120:
    if (v48) {
      [v48 computeFullTransform];
    }
    else {
      memset(v78, 0, sizeof(v78));
    }
    CGFloat v65 = +[CRLCanvasInfoGeometry geometryFromFullTransform:v78];
    goto LABEL_124;
  }
  CGFloat v67 = [v48 geometry];
  unsigned __int8 v68 = [v67 heightValid];

  if ((v68 & 1) == 0) {
    goto LABEL_120;
  }
LABEL_115:
  CGFloat v65 = [v48 geometry];
LABEL_124:
  double v69 = *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3) = v65;

  CGFloat v70 = [(CRLShapeLayout *)self captureDynamicInfoGeometryToBeginDynamicOperation];
  double v71 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v70;

  CGFloat v72 = [(CRLShapeLayout *)self stroke];
  double v73 = (CRLBezierPath *)[v72 copy];
  double v74 = *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3) = v73;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v75 = [(CRLShapeLayout *)self pencilKitStrokePathCompactData];
    char v76 = (CRLCanvasInfoGeometry *)[v75 copy];
    id v77 = *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3);
    *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3) = v76;
  }
}

- (id)captureDynamicInfoGeometryToBeginDynamicOperation
{
  if (!*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7970);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AF55C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7990);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout captureDynamicInfoGeometryToBeginDynamicOperation]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 962, 0, "invalid nil value for '%{public}s'", "mInitialInfoGeometry");
  }
  uint64_t v6 = [(CRLCanvasLayout *)self pureGeometry];
  uint64_t v7 = [CRLCanvasInfoGeometry alloc];
  if (v6) {
    [v6 fullTransform];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  uint64_t v8 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v7, "initWithFullTransform:widthValid:heightValid:", v10, [*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3) widthValid], objc_msgSend(*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3), "heightValid"));

  return v8;
}

- (void)endDynamicOperation
{
  if (!*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F79B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AF7AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F79D0);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 968, 0, "invalid nil value for '%{public}s'", "mDynamicPathSource");
  }
  if (!*(CRLPathSource **)((char *)&self->mCachedPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F79F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AF718();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7A10);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 969, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");
  }
  if (!*(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7A30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AF684();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7A50);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]");
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 970, 0, "invalid nil value for '%{public}s'", "mInitialPathSource");
  }
  if (!*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7A70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AF5F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7A90);
    }
    uint64_t v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    uint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout endDynamicOperation]");
    uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 971, 0, "invalid nil value for '%{public}s'", "mInitialInfoGeometry");
  }
  v24.receiver = self;
  v24.super_class = (Class)CRLShapeLayout;
  [(CRLBoardItemLayout *)&v24 endDynamicOperation];
  uint64_t v15 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
  *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3) = 0;

  uint64_t v16 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = 0;

  uint64_t v17 = *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3);
  *(CRLPathSource **)((char *)&self->mDynamicPathSource + 3) = 0;

  uint64_t v18 = *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3) = 0;

  uint64_t v19 = *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3) = 0;

  uint64_t v20 = *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3);
  *(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3) = 0;

  uint64_t v21 = *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3);
  *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3) = 0;

  uint64_t v22 = *(CRLPathSource **)((char *)&self->mInitialPathSource + 3);
  *(CRLPathSource **)((char *)&self->mInitialPathSource + 3) = 0;

  char v23 = *(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3);
  *(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3) = 0;

  BYTE3(self->mDynamicFill) = 0;
}

- (CGSize)minimumSize
{
  uint64_t v3 = [(CRLShapeLayout *)self shapeInfo];
  uint64_t v4 = [v3 containingGroup];
  unsigned int v5 = [v4 isFreehandDrawing];

  if (v5)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    uint64_t v8 = [(CRLShapeLayout *)self shapeInfo];
    uint64_t v9 = [v8 pathSource];
    uint64_t v10 = [v9 bezierPath];
    unsigned int v11 = [v10 isLineSegment];

    double width = 0.001;
    double height = 0.0;
    if (!v11) {
      double height = 0.001;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)p_canResizeViaTransform
{
  uint64_t v3 = [(CRLShapeLayout *)self shapeInfo];
  uint64_t v4 = [v3 pathSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    uint64_t v6 = [(CRLShapeLayout *)self shapeInfo];
    uint64_t v7 = [v6 pathSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  uint64_t v8 = [(CRLCanvasLayout *)self info];
  uint64_t v9 = [(id)v8 geometry];

  LOBYTE(v8) = [v9 widthValid];
  LOBYTE(v8) = isKindOfClass & [v9 heightValid] & v8;

  return v8;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRLShapeLayout;
  [(CRLBoardItemLayout *)&v22 takeSizeFromTracker:v4];
  if ([(CRLCanvasLayout *)self isInTopLevelContainerForEditing])
  {
    if (v4)
    {
      [v4 flippedIfNecessaryTransformForLayout:self];
      goto LABEL_7;
    }
  }
  else if (v4)
  {
    [v4 transformForLayout:self];
    goto LABEL_7;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
LABEL_7:
  long long v19 = v16;
  long long v20 = v17;
  long long v21 = v18;
  if (v4)
  {
    [v4 resizeTransform];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  id v5 = [v4 currentlyPreservingAspectRatio:v13, v14, v15];
  [v4 currentSizeForLayout:self];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v4 currentGeometryForLayout:self];
  id v11 = [v4 hasHorizontalFlip];
  id v12 = [v4 hasVerticalFlip];
  long long v16 = v19;
  long long v17 = v20;
  long long v18 = v21;
  -[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:](self, "p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:", &v13, &v16, v5, v10, v11, v12, v7, v9);
}

- (void)p_applyResizeTransform:(CGAffineTransform *)a3 transformInParentSpace:(CGAffineTransform *)a4 preservingAspectRatio:(BOOL)a5 layoutSize:(CGSize)a6 geometryForLayout:(id)a7 hasHorizontalFlip:(BOOL)a8 hasVerticalFlip:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  double height = a6.height;
  double width = a6.width;
  BOOL v125 = a5;
  id v127 = a7;
  if ([(CRLCanvasLayout *)self layoutState] == 1 || ![(CRLCanvasLayout *)self layoutState])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7AB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFA58();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7AD0);
    }
    long long v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    long long v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]");
    long long v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1035, 0, "A shape taking a size should not be in a generic dynamic state, or static state");
  }
  long long v18 = (id *)((char *)&self->mDynamicMaskPath + 3);
  if (!*(CRLBezierPath **)((char *)&self->mDynamicMaskPath + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7AF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AF9C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7B10);
    }
    long long v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    long long v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]");
    long long v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 1046, 0, "invalid nil value for '%{public}s'", "mInitialPathSource");
  }
  if (!*(CRLPKStrokePathCompactData **)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7B30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AF930();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7B50);
    }
    objc_super v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v22);
    }
    char v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]");
    objc_super v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 1047, 0, "invalid nil value for '%{public}s'", "mInitialInfoGeometry");
  }
  memset(&v139, 0, sizeof(v139));
  long long v25 = [(CRLCanvasLayout *)self originalPureGeometry];
  long long v26 = v25;
  if (v25) {
    [v25 transform];
  }
  else {
    memset(v138, 0, sizeof(v138));
  }
  long long v27 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v137.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v137.c = v27;
  *(_OWORD *)&v137.tCGFloat x = *(_OWORD *)&a4->tx;
  sub_10007FC38(&v137, v138, &v139);

  CGAffineTransform v137 = v139;
  double v28 = sub_10007F81C(&v137.a);
  memset(&v137, 0, sizeof(v137));
  CGAffineTransformMakeScale(&v137, v28, v29);
  unsigned int v30 = [(CRLShapeLayout *)self p_canResizeViaTransform];
  id v31 = *v18;
  if (v30 && !v125)
  {
    double v32 = [v31 bezierPath];
    id v33 = [v32 copy];

    CGAffineTransform v136 = v139;
    [v33 transformUsingAffineTransform:&v136];
    [v33 bounds];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    [v33 bounds];
    double v43 = v42;
    double v45 = v44;
    if (!sub_100064084(v42, v44, CGPointZero.x, CGPointZero.y))
    {
      CGAffineTransformMakeTranslation(&v135, -v43, -v45);
      [v33 transformUsingAffineTransform:&v135];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = objc_opt_class();
      id v47 = [v33 copy];
      uint64_t v48 = [v46 pathSourceWithBezierPath:v47];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v54 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F7B70);
        }
        v55 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AF840((uint64_t)&self->mDynamicMaskPath + 3, v55, v54);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F7B90);
        }
        double v56 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v56);
        }
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:]");
        id v47 = (id)objc_claimAutoreleasedReturnValue();
        double v57 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
        v58 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v58);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v57, 1073, 0, "Unexpected path source class! (%{public}@) We don't know how to build a path source for it.", v59);

        id v49 = 0;
        goto LABEL_55;
      }
      double v53 = objc_opt_class();
      id v47 = [v33 copy];
      uint64_t v48 = [v53 editableBezierPathSourceWithBezierPath:v47];
    }
    id v49 = (id)v48;
LABEL_55:

    double v60 = [CRLCanvasInfoGeometry alloc];
    double v61 = [(CRLCanvasLayout *)self originalPureGeometry];
    double v62 = v61;
    if (v61) {
      [v61 fullTransform];
    }
    else {
      memset(v134, 0, sizeof(v134));
    }
    double v63 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v60, "initWithFullTransform:widthValid:heightValid:", v134, [*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3) widthValid], [*(id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3) heightValid]);

    -[CRLCanvasInfoGeometry geometryWithNewBounds:](v63, "geometryWithNewBounds:", v35, v37, v39, v41);
    id v50 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_59;
  }
  id v49 = [v31 copy];
  [v49 scaleToNaturalSize:width height];
  id v50 = [v127 copy];
  if ([(CRLCanvasLayout *)self isInTopLevelContainerForEditing])
  {
    unsigned int v51 = [*v18 hasHorizontalFlip];
    unsigned int v52 = [*v18 hasVerticalFlip];
    [v49 setHasHorizontalFlip:v51 ^ v10];
    [v49 setHasVerticalFlip:v52 ^ v9];
  }
LABEL_59:
  if (*(CRLPathSource **)((char *)&self->mInitialPathSource + 3))
  {
    if ([(CRLShapeLayout *)self i_isInsideResizingFreehandDrawing])
    {
      double v64 = (CRLBezierPath *)[*(id *)((char *)&self->mInitialPathSource + 3) copy];
      [*v18 naturalSize];
      double v66 = v65;
      double v68 = v67;
      [v49 naturalSize];
      CGAffineTransformMakeScale(&v133, v69 / v66, v70 / v68);
      [(CRLBezierPath *)v64 transformUsingAffineTransform:&v133];
    }
    else
    {
      double v64 = objc_alloc_init(CRLBezierPath);
    }
  }
  else
  {
    double v64 = 0;
  }
  double v71 = (id *)((char *)&self->mCachedEditableBezierPathSource + 3);
  objc_storeStrong((id *)((char *)&self->mCachedEditableBezierPathSource + 3), v49);
  objc_storeStrong((id *)((char *)&self->mCachedPathSource + 3), v50);
  objc_storeStrong((id *)((char *)&self->mDynamicPathSource + 3), v64);
  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3)
    && [(CRLShapeLayout *)self i_isInsideResizingFreehandDrawing])
  {
    long long v72 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v136.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v136.c = v72;
    *(_OWORD *)&v136.tCGFloat x = *(_OWORD *)&a3->tx;
    double v73 = sub_10007F81C(&v136.a);
    double v75 = v74;
    float v76 = v73;
    float v77 = v74;
    float v78 = fminf(v76, v77);
    BOOL v79 = vabdd_f64(0.0, v78) < 0.00999999978 || v78 == 0.0;
    double v80 = fmaxf(v76, v77);
    double v81 = v79 ? v80 : v78;
    [*(id *)((char *)&self->mInitialMaskPath + 3) width];
    [(CRLShapeLayout *)self dynamicStrokeWidthUpdateToValue:v82 * v81];
    v83 = *(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3);
    if (v83)
    {
      [v83 renderScaleX];
      double v85 = v73 * v84;
      if (v85 == 0.0 || vabdd_f64(0.0, v85) < 0.00999999978)
      {
        [*(id *)((char *)&self->mDynamicInfoGeometry + 3) renderScaleX];
        double v85 = v86;
      }
      [*(id *)((char *)&self->mInitialInfoGeometry + 3) renderScaleY];
      double v88 = v75 * v87;
      if (v88 == 0.0 || vabdd_f64(0.0, v88) < 0.00999999978)
      {
        [*(id *)((char *)&self->mDynamicInfoGeometry + 3) renderScaleY];
        double v88 = v89;
      }
      [(CRLShapeLayout *)self dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:v85 y:v88];
    }
  }
  char v90 = BYTE3(self->super.mDynamicOpacity);
  [(CRLShapeLayout *)self invalidatePath];
  [(CRLShapeLayout *)self invalidateFrame];
  BYTE3(self->super.mDynamicOpacity) = BYTE3(self->super.mDynamicOpacity) & 0xF1 | v90 & 0xE;
  if ([(CRLShapeLayout *)self i_shouldTryToScaleCachedRectsDuringResize])
  {
    if ([(CRLShapeLayout *)self p_canResizeViaTransform])
    {
      [*v71 naturalSize];
      *(double *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.height + 3) = sub_100064070();
      *(void *)((char *)&self->mCachedPathBoundsStruct.isValid + 3) = v91;
      *(void *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.x + 3) = v92;
      *(void *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.y + 3) = v93;
      *(_DWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.width + 3) = 1;
    }
    if ([(CRLShapeLayout *)self p_dynamicallyUpdatingStrokedFramesDuringResize]&& v125)
    {
      uint64_t v94 = [(CRLShapeLayout *)self stroke];
      if (v94
        && (CGRect v95 = (void *)v94,
            [(CRLShapeLayout *)self stroke],
            CGRect v96 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v97 = [v96 shouldRender],
            v96,
            v95,
            (v97 & 1) != 0))
      {
        long long v98 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&v136.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&v136.c = v98;
        *(_OWORD *)&v136.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
        v99 = self;
        v126 = v99;
        do
        {
          if (![(CRLShapeLayout *)v99 isBeingManipulated]) {
            break;
          }
          v100 = [(CRLCanvasLayout *)v99 originalPureGeometry];
          v101 = v100;
          if (v100) {
            [v100 transform];
          }
          else {
            memset(&t2, 0, sizeof(t2));
          }
          CGAffineTransform t1 = v136;
          CGAffineTransformConcat(&v136, &t1, &t2);

          uint64_t v102 = objc_opt_class();
          v103 = [(CRLCanvasAbstractLayout *)v99 parent];
          uint64_t v104 = sub_1002469D0(v102, v103);

          v99 = (CRLShapeLayout *)v104;
        }
        while (v104);
        v105 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", *(double *)((char *)&v126->mCachedPathBoundsStruct.cachedRect.size.width + 3), *(double *)((char *)&v126->mCachedPathBoundsStruct.cachedRect.size.height + 3), *(double *)((char *)&v126->mCachedPathBoundsStruct.originalCachedRect.origin.x + 3), *(double *)((char *)&v126->mCachedPathBoundsStruct.originalCachedRect.origin.y + 3));
        long long v106 = *(_OWORD *)&a3->c;
        *(_OWORD *)&v130.a = *(_OWORD *)&a3->a;
        *(_OWORD *)&v130.c = v106;
        *(_OWORD *)&v130.tCGFloat x = *(_OWORD *)&a3->tx;
        memset(&t1, 0, sizeof(t1));
        CGAffineTransform v129 = v136;
        sub_10007FC38(&v130, &v129, &t1);
        CGAffineTransform v130 = t1;
        [v105 transformUsingAffineTransform:&v130];
        [v105 bounds];
        double v108 = v107;
        double v110 = v109;
        uint64_t v112 = v111;
        uint64_t v114 = v113;
        long long v115 = *(_OWORD *)&a3->c;
        *(_OWORD *)&v130.a = *(_OWORD *)&a3->a;
        *(_OWORD *)&v130.c = v115;
        *(_OWORD *)&v130.tCGFloat x = *(_OWORD *)&a3->tx;
        CGAffineTransform v129 = v136;
        sub_10007FC38(&v130, &v129, &v128);
        double v116 = sub_100064680(v108, v110, vaddq_f64(*(float64x2_t *)&v128.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v128.c, CGPointZero.y), *(float64x2_t *)&v128.a, CGPointZero.x)).f64[0]);
        uint64_t v118 = v117;
      }
      else
      {
        [*v71 naturalSize];
        double v116 = sub_100064070();
        uint64_t v118 = v119;
        uint64_t v112 = v120;
        uint64_t v114 = v121;
      }
      *(double *)((char *)&self->mCachedPath + 3) = v116;
      *(void *)(&self->mCachedPathHasAtLeastTwoVisuallyDistinctSubregions + 1) = v118;
      *(void *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.x + 3) = v112;
      *(void *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.y + 3) = v114;
      *(_DWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.width + 3) = 1;
      CGRect v140 = *(CGRect *)((char *)&self->mCachedAlignmentFrame.cachedRect.size.width + 3);
      long long v122 = *(_OWORD *)&a4->c;
      *(_OWORD *)&v136.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&v136.c = v122;
      *(_OWORD *)&v136.tCGFloat x = *(_OWORD *)&a4->tx;
      *(CGRect *)((char *)&self->mClippedPathRotatedTransform.tx + 3) = CGRectApplyAffineTransform(v140, &v136);
      *(_DWORD *)((char *)&self->mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 1;
      v123 = (char *)&self->mCachedPathBoundsWithoutStrokeStruct.isValid + 3;
      CGRect v141 = *(CGRect *)(v123 + 1);
      CGAffineTransform v136 = v137;
      *(CGRect *)v123 = CGRectApplyAffineTransform(v141, &v136);
      *((_DWORD *)v123 + 16) = 1;
    }
  }
}

- (void)endResize
{
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLayout;
  [(CRLCanvasLayout *)&v3 endResize];
  [(CRLShapeLayout *)self p_endResizeOrFreeTransform];
}

- (void)endFreeTransform
{
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLayout;
  [(CRLCanvasLayout *)&v3 endFreeTransform];
  [(CRLShapeLayout *)self p_endResizeOrFreeTransform];
}

- (void)p_endResizeOrFreeTransform
{
  if (*(CRLBezierPath **)((char *)&self->mInitialMaskPath + 3))
  {
    if ([(CRLShapeLayout *)self i_isInsideResizingFreehandDrawing])
    {
      [(CRLShapeLayout *)self dynamicStrokeWidthChangeDidEnd];
      if (*(CRLCanvasInfoGeometry **)((char *)&self->mInitialInfoGeometry + 3)) {
        [(CRLShapeLayout *)self dynamicPencilKitStrokePathCompactDataRenderScaleDidEnd];
      }
    }
  }
  uint64_t v3 = objc_opt_class();
  sub_1002469D0(v3, *(void **)((char *)&self->mCachedEditableBezierPathSource + 3));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    [v22 scalar];
    double v5 = v4;
    [v22 maxScalar];
    [v22 setScalar:sub_100407E48(v5, 0.0, v6)];
  }
  uint64_t v7 = objc_opt_class();
  double v8 = sub_1002469D0(v7, *(void **)((char *)&self->mCachedEditableBezierPathSource + 3));
  BOOL v9 = v8;
  if (v8)
  {
    [v8 minPointValue];
    double v11 = v10;
    double v13 = v12;
    [v9 maxPointValue];
    double v15 = v14;
    double v17 = v16;
    [v9 point];
    double v19 = v18;
    double v21 = sub_100407E48(v20, v11, v15);
    [v9 setPoint:v21, sub_100407E48(v19, v13, v17)];
  }
  [(CRLShapeLayout *)self invalidatePath];
  [(CRLShapeLayout *)self invalidateFrame];
}

- (id)finalInfoGeometryForResize
{
  return *(id *)((char *)&self->mCachedPathSource + 3);
}

- (void)dynamicallyMovingLineSegmentWithTracker:(id)a3
{
  double v4 = [a3 currentGeometry];
  double v5 = (CRLPathSource *)[v4 copy];

  double v6 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v5;
  uint64_t v7 = v5;

  [*(id *)((char *)&self->mCachedPathSource + 3) size];
  [*(id *)((char *)&self->mCachedEditableBezierPathSource + 3) setNaturalSize:];

  [(CRLShapeLayout *)self invalidatePath];

  [(CRLShapeLayout *)self invalidateFrame];
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(CRLCanvasLayout *)self layoutController];
  uint64_t v7 = [v6 canvas];
  if (![v7 isCanvasInteractive])
  {

LABEL_6:
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003FEED8;
    v15[3] = &unk_1014CD898;
    *(CGFloat *)&v15[5] = x;
    *(CGFloat *)&v15[6] = y;
    v15[4] = self;
    [(CRLShapeLayout *)self p_performBlockOkayToSetGeometry:v15];
    return;
  }
  unsigned int v8 = [(CRLShapeLayout *)self isBeingManipulated];

  if (!v8) {
    goto LABEL_6;
  }
  BOOL v9 = [(CRLCanvasLayout *)self layoutController];
  double v10 = [v9 canvas];
  double v11 = [v10 canvasController];

  uint64_t v12 = [v11 tmCoordinator];
  double v13 = [(id)v12 controllingTM];
  double v14 = [v13 tracker];

  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  if ((v12 & 1) == 0) {
    goto LABEL_6;
  }
}

- (void)setDynamicGeometry:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003FEFAC;
  _OWORD v5[3] = &unk_1014CBE78;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  [(CRLShapeLayout *)self p_performBlockOkayToSetGeometry:v5];
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = *(id *)((char *)&self->mCachedEditableBezierPathSource + 3);
  BOOL v9 = [a4 knob];
  id v10 = [v9 tag];
  [(CRLShapeLayout *)self boundsForStandardKnobs];
  [v8 setControlKnobPosition:v10 toPoint:sub_100064680(x, y, v11)];

  [(CRLShapeLayout *)self invalidatePath];

  [(CRLShapeLayout *)self invalidateFrame];
}

- (void)dynamicMovePathKnobDidBegin
{
  if (([*(id *)((char *)&self->mCachedEditableBezierPathSource + 3) isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    uint64_t v3 = [(CRLShapeLayout *)self editablePathSource];
    id v4 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);
    *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3) = v3;
  }
  [*(id *)((char *)&self->mCachedEditableBezierPathSource + 3) setLockedFlipTransform:1];
  double v5 = [(CRLCanvasLayout *)self pureGeometry];
  id v6 = v5;
  if (v5) {
    [v5 fullTransform];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  uint64_t v7 = +[CRLCanvasInfoGeometry geometryFromFullTransform:v9];
  id v8 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v7;
}

- (void)dynamicallyMovedPathKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  [(CRLShapeLayout *)self p_updateResizeInfoGeometryFromDynamicPathSource];
  [(CRLShapeLayout *)self invalidatePath];

  [(CRLShapeLayout *)self invalidateFrame];
}

- (void)dynamicMovePathKnobDidEnd
{
  [(CRLShapeLayout *)self p_updateResizeInfoGeometryFromDynamicPathSource];
  [*(id *)((char *)&self->mCachedEditableBezierPathSource + 3) setLockedFlipTransform:0];
  uint64_t v3 = *(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3);

  [v3 alignToOrigin];
}

- (void)dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin
{
  if (*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7BB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFB74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7BD0);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1393, 0, "expected nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");
  }
  id v6 = [(CRLShapeLayout *)self pencilKitStrokePathCompactData];
  uint64_t v7 = (CRLCanvasInfoGeometry *)[v6 copy];
  id v8 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = v7;

  if (!*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7BF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFAE0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7C10);
    }
    BOOL v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicPencilKitStrokePathCompactDataRenderScaleDidBegin]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1398, 0, "invalid nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");
  }
}

- (void)dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:(double)a3 y:(double)a4
{
  double v5 = a3;
  uint64_t v7 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7C30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFC08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7C50);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    BOOL v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicallySetPencilKitStrokePathCompactDataRenderScaleX:y:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1402, 0, "invalid nil value for '%{public}s'", "mDynamicPencilKitStrokePathCompactData");

    uint64_t v7 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  }
  *(float *)&a3 = v5;
  [v7 setRenderScaleX:a3];
  *(float *)&double v11 = a4;
  [*(id *)((char *)&self->mDynamicInfoGeometry + 3) setRenderScaleY:v11];
}

- (void)dynamicPencilKitStrokePathCompactDataRenderScaleDidEnd
{
  uint64_t v2 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = 0;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLShapeLayout;
  [(CRLBoardItemLayout *)&v14 takeRotationFromTracker:v4];
  double v5 = [(CRLCanvasLayout *)self info];
  id v6 = [v5 geometry];

  if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
  {
    uint64_t v7 = (CRLPathSource *)[v6 copy];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    if (v4) {
      [v4 rotateTransform];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v10];
    v9[0] = v11;
    v9[1] = v12;
    v9[2] = v13;
    uint64_t v7 = [v6 geometryByAppendingTransform:v9];
  }
  id v8 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v7;

  [(CRLCanvasLayout *)self invalidatePosition];
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLShapeLayout;
  [(CRLBoardItemLayout *)&v21 takeFreeTransformFromTracker:v4];
  if ([v4 hasEverResized])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    if (v4) {
      [v4 resizeTransformForLayout:self];
    }
    [v4 currentSizeForLayout:self];
    double v6 = v5;
    double v8 = v7;
    BOOL v9 = [v4 currentGeometryForLayout:self];
    long long v14 = v18;
    long long v15 = v19;
    long long v16 = v20;
    v13[0] = v18;
    v13[1] = v19;
    v13[2] = v20;
    -[CRLShapeLayout p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:](self, "p_applyResizeTransform:transformInParentSpace:preservingAspectRatio:layoutSize:geometryForLayout:hasHorizontalFlip:hasVerticalFlip:", &v14, v13, 1, v9, 0, 0, v6, v8);
  }
  else
  {
    id v10 = [(CRLCanvasLayout *)self info];
    BOOL v9 = [v10 geometry];

    if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
    {
      long long v11 = (CRLPathSource *)[v9 copy];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      if (v4) {
        [v4 freeTransformForLayout:self];
      }
      else {
        memset(v17, 0, sizeof(v17));
      }
      [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v17];
      long long v14 = v18;
      long long v15 = v19;
      long long v16 = v20;
      long long v11 = [v9 geometryByAppendingTransform:&v14];
    }
    long long v12 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
    *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v11;

    [(CRLCanvasLayout *)self invalidatePosition];
  }
}

- (id)finalInfoGeometryForFreeTransform
{
  return *(id *)((char *)&self->mCachedPathSource + 3);
}

- (BOOL)isBeingManipulated
{
  if ([(CRLShapeLayout *)self isStrokeBeingManipulated]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeLayout;
  return [(CRLCanvasLayout *)&v4 isBeingManipulated];
}

- (CRLLineEnd)strokeHeadLineEnd
{
  uint64_t v3 = [(CRLShapeLayout *)self shapeInfo];
  objc_super v4 = [v3 headLineEnd];
  if (v4)
  {
    double v5 = [(CRLShapeLayout *)self stroke];
    double v6 = [(CRLShapeLayout *)self shapeInfo];
    double v7 = [v6 headLineEnd];
    double v8 = [v5 strokeLineEnd:v7];
  }
  else
  {
    double v8 = 0;
  }

  return (CRLLineEnd *)v8;
}

- (CRLLineEnd)strokeTailLineEnd
{
  uint64_t v3 = [(CRLShapeLayout *)self shapeInfo];
  objc_super v4 = [v3 tailLineEnd];
  if (v4)
  {
    double v5 = [(CRLShapeLayout *)self stroke];
    double v6 = [(CRLShapeLayout *)self shapeInfo];
    double v7 = [v6 tailLineEnd];
    double v8 = [v5 strokeLineEnd:v7];
  }
  else
  {
    double v8 = 0;
  }

  return (CRLLineEnd *)v8;
}

- (unint64_t)numberOfControlKnobs
{
  uint64_t v2 = [(CRLShapeLayout *)self pathSource];
  uint64_t v3 = objc_opt_class();
  BOOL v9 = sub_100246DEC(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

  id v10 = [v9 numberOfControlKnobs];
  return (unint64_t)v10;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [(CRLShapeLayout *)self pathSource];
  uint64_t v8 = objc_opt_class();
  sub_100246DEC(v7, v8, 1, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  [v14 setControlKnobPosition:a3 toPoint:x, y];
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  uint64_t v4 = [(CRLShapeLayout *)self pathSource];
  uint64_t v5 = objc_opt_class();
  uint64_t v11 = sub_100246DEC(v4, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

  [v11 getControlKnobPosition:a3];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (*(CRLMutableStroke **)((char *)&self->mDynamicStroke + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7C70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFC9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7C90);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicallySetBezierPathSource:atUnscaledOrigin:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1501, 0, "expected nil value for '%{public}s'", "mDynamicStrokeOffsetArray");
  }
  -[CRLShapeLayout dynamicallySetBezierPathSource:atUnscaledOrigin:withPatternOffsetsBySubpath:](self, "dynamicallySetBezierPathSource:atUnscaledOrigin:withPatternOffsetsBySubpath:", v7, 0, x, y);
}

- (void)dynamicallySetBezierPathSource:(id)a3 atUnscaledOrigin:(CGPoint)a4 withPatternOffsetsBySubpath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!*(CRLEditableBezierPathSource **)((char *)&self->mCachedEditableBezierPathSource + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7CB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFD30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7CD0);
    }
    uint64_t v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLayout dynamicallySetBezierPathSource:atUnscaledOrigin:withPatternOffsetsBySubpath:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1508, 0, "invalid nil value for '%{public}s'", "mDynamicPathSource");
  }
  objc_storeStrong((id *)((char *)&self->mCachedEditableBezierPathSource + 3), a3);
  objc_storeStrong((id *)((char *)&self->mLastParentLimitedSize.height + 3), a5);
  double v13 = [*(id *)((char *)&self->mCachedEditableBezierPathSource + 3) bezierPath];
  id v14 = [v13 bounds];
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  objc_super v24 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v17, v19, fmax(v21, 1.0), fmax(v23, 1.0));
  long long v25 = [CRLCanvasInfoGeometry alloc];
  long long v26 = [(CRLCanvasAbstractLayout *)self parent];
  long long v27 = [v26 geometryInRoot];
  double v28 = [(CRLCanvasInfoGeometry *)v25 initWithLayoutGeometry:v27];
  CGFloat v29 = [(CRLCanvasInfoGeometry *)v24 geometryRelativeToGeometry:v28];

  if ([v29 isEqual:*(CRLPathSource **)((char *)&self->mCachedPathSource + 3)])
  {
    BYTE3(self->super.mDynamicOpacity) |= 1u;
    unsigned int v30 = *(void **)(&self->super._suppressesShadowsAndReflections + 3);
    *(void *)(&self->super._suppressesShadowsAndReflections + 3) = 0;

    BYTE3(self->super.mDynamicOpacity) |= 0x80u;
    id v31 = *(void **)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3);
    *(CGFloat *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3) = 0.0;

    *(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3) = 0;
    *(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3) = 0;
  }
  else
  {
    objc_storeStrong((id *)((char *)&self->mCachedPathSource + 3), v29);
    [(CRLShapeLayout *)self invalidatePath];
    [(CRLShapeLayout *)self invalidateFrame];
  }
}

- (void)dynamicallyMakeShapeInvisible
{
  BYTE3(self->mDynamicFill) = 1;
  uint64_t v3 = [(CRLCanvasLayout *)self layoutController];
  id v6 = [v3 canvas];

  uint64_t v4 = v6;
  if (v6)
  {
    uint64_t v5 = [v6 repForLayout:self];
    if (v5) {
      [v6 invalidateContentLayersForRep:v5];
    }

    uint64_t v4 = v6;
  }
}

- (void)invalidateExteriorWrap
{
  v8.receiver = self;
  v8.super_class = (Class)CRLShapeLayout;
  [(CRLBoardItemLayout *)&v8 invalidateExteriorWrap];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = [(CRLCanvasLayout *)self layoutController];
  uint64_t v5 = [v4 canvas];
  id v6 = [v5 repForLayout:self];
  id v7 = sub_10024715C(v3, v6);

  [v7 invalidateExteriorWrap];
}

- (id)computeWrapPath
{
  uint64_t v3 = [(CRLShapeLayout *)self fill];
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 isClear] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [(CRLShapeLayout *)self computeWrapPathClosed:v5];

  return v6;
}

- (id)computeWrapPathClosed:(BOOL)a3
{
  uint64_t v5 = [(CRLShapeLayout *)self path];
  id v6 = [(CRLShapeLayout *)self stroke];
  id v7 = v6;
  if (v6 && [v6 shouldRender])
  {
    objc_super v8 = [(CRLShapeLayout *)self path];
    id v9 = [v8 copy];

    [v9 takeAttributesFromStroke:v7];
    uint64_t v5 = [v9 strokedCopy];
    if (a3 || [v9 isEffectivelyClosed])
    {
      id v10 = [v9 uniteWithBezierPath:v5];
    }
    else
    {
      id v10 = v5;
    }
    id v11 = v10;

    if ([(CRLShapeLayout *)self pathIsOpen])
    {
      double v17 = [(CRLShapeLayout *)self p_unitePath:v11 withLineEndForHead:1 stroke:v7];

      id v11 = [(CRLShapeLayout *)self p_unitePath:v17 withLineEndForHead:0 stroke:v7];
    }
  }
  else
  {
    id v11 = [v5 copy];
  }

  [(CRLShapeLayout *)self pathBounds];
  double v13 = v12;
  double v15 = v14;
  if (!sub_100064084(CGPointZero.x, CGPointZero.y, v12, v14))
  {
    CGAffineTransformMakeTranslation(&v18, -v13, -v15);
    [v11 transformUsingAffineTransform:&v18];
  }

  return v11;
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  BOOL v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRLShapeLayout;
  long long v7 = *(_OWORD *)&a4->c;
  long long v10 = *(_OWORD *)&a4->a;
  long long v11 = v7;
  long long v12 = *(_OWORD *)&a4->tx;
  id v8 = a3;
  [(CRLCanvasLayout *)&v13 transferLayoutGeometryToInfo:v8 withAdditionalTransform:&v10 assertIfInDocument:v5];
  id v9 = [(CRLShapeLayout *)self pathSource];
  [v8 setPathSource:v9];
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CRLShapeLayout;
  long long v4 = *(_OWORD *)&a3->c;
  v22[0] = *(_OWORD *)&a3->a;
  v22[1] = v4;
  v22[2] = *(_OWORD *)&a3->tx;
  BOOL v5 = [(CRLCanvasLayout *)&v23 commandToClampModelToLayoutSizeWithAdditionalTransform:v22];
  id v6 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  [(CRLCommandGroup *)v6 addCommandIfNotNil:v5];
  long long v7 = [(CRLShapeLayout *)self shapeInfo];
  id v8 = [(CRLShapeLayout *)self pathSource];
  [v8 naturalSize];
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [v7 pathSource];
  [v13 naturalSize];
  double v15 = v14;
  double v17 = v16;

  if (v10 != v15 || v12 != v17)
  {
    CGAffineTransform v18 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v7 pathSource:v8];
    [(CRLCommandGroup *)v6 addCommand:v18];
  }
  if ([(CRLCommandGroup *)v6 isEmpty]) {
    double v19 = 0;
  }
  else {
    double v19 = v6;
  }
  double v20 = v19;

  return v20;
}

- (void)validate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1004009D0;
  v2[3] = &unk_1014CBBB0;
  v2[4] = self;
  [(CRLShapeLayout *)self p_performBlockOkayToSetGeometry:v2];
}

- (id)p_cachedPath
{
  if (BYTE3(self->super.mDynamicOpacity))
  {
    uint64_t v3 = [(CRLShapeLayout *)self pathSource];
    uint64_t v4 = [v3 bezierPath];
    BOOL v5 = *(void **)(&self->super._suppressesShadowsAndReflections + 3);
    *(void *)(&self->super._suppressesShadowsAndReflections + 3) = v4;

    BYTE3(self->super.mDynamicOpacity) &= ~1u;
  }
  id v6 = *(void **)(&self->super._suppressesShadowsAndReflections + 3);

  return v6;
}

- (CGRect)p_cachedPathBounds
{
  uint64_t v2 = (double *)((char *)&self->mCachedPath + 3);
  if (*(_DWORD *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.width + 3))
  {
    double v3 = *v2;
    double v4 = *(double *)(&self->mCachedPathHasAtLeastTwoVisuallyDistinctSubregions + 1);
    double v5 = *(double *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.x + 3);
    double v6 = *(double *)((char *)&self->mCachedPathBoundsStruct.cachedRect.origin.y + 3);
  }
  else
  {
    [*(id *)((char *)&self->mDynamicStrokeOffsetArray + 3) computePathBounds];
    double *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)p_cachedClippedPathStroked
{
  uint64_t v2 = (double *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.isValid + 3);
  if (*(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3))
  {
    double v3 = *v2;
    double v4 = *(double *)((char *)&self->mCachedClippedPath + 3);
    double v5 = *(double *)((char *)&self->mCachedClippedPathStroked.cachedRect.origin.x + 3);
    double v6 = *(double *)((char *)&self->mCachedClippedPathStroked.cachedRect.origin.y + 3);
  }
  else
  {
    if ([*(id *)((char *)&self->mDynamicStrokeOffsetArray + 3) shouldComputeSeparateClippedPathBounds])
    {
      id v8 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
      long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v10[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v10[1] = v9;
      v10[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v8 computeClippedPathBoundsWithTransform:v10];
    }
    else
    {
      [(CRLShapeLayout *)self p_cachedPathBounds];
    }
    double *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)p_updatedCachedClipRectIfNeededForRotation:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  long long v29 = *(_OWORD *)&a3->a;
  long long v30 = v5;
  double v6 = (char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.height + 3;
  long long v7 = *(_OWORD *)&a3->c;
  long long v25 = *(_OWORD *)&a3->a;
  long long v26 = v7;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  long long v8 = *(_OWORD *)((char *)&self->mClippedPathRotatedTransform.a + 3);
  v24[0] = *(_OWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.height + 3);
  v24[1] = v8;
  v24[2] = *(_OWORD *)((char *)&self->mClippedPathRotatedTransform.c + 3);
  if (sub_100064134(&v25, v24))
  {
    long long v9 = (double *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.height + 3);
    double v10 = (_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3);
    if (*(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3))
    {
      double v11 = *v9;
      double v12 = *(double *)((char *)&self->mCachedClippedPathStroked.isValid + 3);
      double v13 = *(double *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.origin.x + 3);
      double v14 = *(double *)((char *)&self->mCachedClippedPathRotatedStroked.cachedRect.origin.y + 3);
      goto LABEL_11;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = [(CRLCanvasLayout *)self layoutState] != 4
       && [(CRLCanvasLayout *)self layoutState] != 5;
    long long v9 = (double *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.height + 3);
    double v10 = (_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3);
  }
  double v16 = *(NSArray **)((char *)&self->mDynamicStrokeOffsetArray + 3);
  long long v25 = v29;
  long long v26 = v30;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  [v16 computeClippedPathBoundsWithTransform:&v25];
  double v13 = v17;
  double v14 = v18;
  if (v15)
  {
    double *v9 = v11;
    v9[1] = v12;
    v9[2] = v17;
    _OWORD v9[3] = v18;
    long long v19 = v30;
    *(_OWORD *)double v6 = v29;
    *((_OWORD *)v6 + 1) = v19;
    *((void *)v6 + 4) = 0;
    *((void *)v6 + 5) = 0;
    _DWORD *v10 = 1;
  }
LABEL_11:
  double v20 = sub_100064698(v11, v12, a3->tx);
  double v22 = v13;
  double v23 = v14;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)p_cachedPathBoundsWithoutStroke
{
  uint64_t v2 = (double *)((char *)&self->mCachedPathBoundsStruct.originalCachedRect.size.height + 3);
  if (*(_DWORD *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.width + 3))
  {
    double v3 = *v2;
    double v4 = *(double *)((char *)&self->mCachedPathBoundsStruct.isValid + 3);
    double v5 = *(double *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.x + 3);
    double v6 = *(double *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.cachedRect.origin.y + 3);
  }
  else
  {
    long long v7 = [(CRLShapeLayout *)self path];
    [v7 bounds];
    double v3 = v8;
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;

    double *v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    *((_DWORD *)v2 + 16) = 1;
  }
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)p_cachedPathIsOpen
{
  if ((BYTE3(self->super.mDynamicOpacity) & 2) != 0)
  {
    double v3 = [(CRLShapeLayout *)self path];
    *((unsigned char *)&self->mShapeInvalidFlags + 3) = [v3 isOpen];

    BYTE3(self->super.mDynamicOpacity) &= ~2u;
  }
  return *((unsigned char *)&self->mShapeInvalidFlags + 3);
}

- (BOOL)p_cachedPathIsLineSegment
{
  if ((BYTE3(self->super.mDynamicOpacity) & 4) != 0)
  {
    double v3 = [(CRLShapeLayout *)self path];
    *((unsigned char *)&self->mShapeInvalidFlags + 4) = [v3 isLineSegment];

    BYTE3(self->super.mDynamicOpacity) &= ~4u;
  }
  return *((unsigned char *)&self->mShapeInvalidFlags + 4);
}

- (BOOL)p_cachedPathHasAtLeastTwoVisuallyDistinctSubregions
{
  if ((BYTE3(self->super.mDynamicOpacity) & 8) != 0)
  {
    double v3 = [(CRLShapeLayout *)self path];
    *((unsigned char *)&self->mShapeInvalidFlags + 5) = [v3 hasAtLeastTwoVisuallyDistinctSubregions];

    BYTE3(self->super.mDynamicOpacity) &= ~8u;
  }
  return *((unsigned char *)&self->mShapeInvalidFlags + 5);
}

- (void)p_invalidateHead
{
  BYTE3(self->super.mDynamicOpacity) |= 0x30u;
  [(CRLShapeLayout *)self p_invalidateClippedPath];
}

- (void)p_invalidateTail
{
  BYTE3(self->super.mDynamicOpacity) |= 0x50u;
  [(CRLShapeLayout *)self p_invalidateClippedPath];
}

- (void)p_invalidateClippedPath
{
  BYTE3(self->super.mDynamicOpacity) |= 0x80u;
  *(_DWORD *)((char *)&self->mCachedClippedPathStroked.originalCachedRect.size.width + 3) = 0;
  *(_DWORD *)((char *)&self->mCachedClippedPathRotatedStroked.originalCachedRect.size.width + 3) = 0;
  uint64_t v2 = *(void **)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3);
  *(CGFloat *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3) = 0.0;
}

- (void)p_validateHeadAndTail
{
  if ((BYTE3(self->super.mDynamicOpacity) & 0x10) != 0)
  {
    BYTE3(self->super.mDynamicOpacity) &= ~0x10u;
    id v3 = [(CRLShapeLayout *)self path];
    [v3 getStartPoint:(char *)&self->mHeadPoint.x + 3 andEndPoint:(char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3];
  }
}

- (void)p_validateHeadLineEnd
{
  [(CRLShapeLayout *)self p_validateHeadAndTail];
  if ((BYTE3(self->super.mDynamicOpacity) & 0x20) != 0)
  {
    BYTE3(self->super.mDynamicOpacity) &= ~0x20u;
    memset(v9, 0, 24);
    id v3 = [(CRLShapeLayout *)self path];
    double v4 = [(CRLShapeLayout *)self shapeInfo];
    double v5 = [v4 headLineEnd];
    double v6 = [(CRLShapeLayout *)self shapeInfo];
    long long v7 = [v6 tailLineEnd];
    double v8 = [(CRLShapeLayout *)self stroke];
    +[CRLBezierPath lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:](CRLBezierPath, "lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:", v3, 1, v5, v7, v8, *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3), *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.ty + 3), *(double *)((char *)&self->mHeadPoint.x + 3), *(double *)((char *)&self->mHeadPoint.y + 3));

    *(CGFloat *)((char *)&self->mTailLineEndPoint.x + 3) = 0.0;
    *(CGPoint *)((char *)&self->mTailPoint + 3) = *(CGPoint *)((char *)v9 + 8);
    *(double *)((char *)&self->mHeadLineEndAngle + 3) = 0.0;
    *(int64_t *)((char *)&self->mHeadCutSegment + 3) = 0;
  }
}

- (void)p_validateTailLineEnd
{
  [(CRLShapeLayout *)self p_validateHeadAndTail];
  if ((BYTE3(self->super.mDynamicOpacity) & 0x40) != 0)
  {
    BYTE3(self->super.mDynamicOpacity) &= ~0x40u;
    memset(v9, 0, 24);
    id v3 = [(CRLShapeLayout *)self path];
    double v4 = [(CRLShapeLayout *)self shapeInfo];
    double v5 = [v4 headLineEnd];
    double v6 = [(CRLShapeLayout *)self shapeInfo];
    long long v7 = [v6 tailLineEnd];
    double v8 = [(CRLShapeLayout *)self stroke];
    +[CRLBezierPath lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:](CRLBezierPath, "lineEndPositioningOnPath:atHead:headPoint:tailPoint:headLineEnd:tailLineEnd:stroke:", v3, 0, v5, v7, v8, *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.tx + 3), *(double *)((char *)&self->mCachedAlignmentFrameInRootTransformInRoot.ty + 3), *(double *)((char *)&self->mHeadPoint.x + 3), *(double *)((char *)&self->mHeadPoint.y + 3));

    *(CGFloat *)((char *)&self->mTailLineEndPoint.y + 3) = 0.0;
    *(CGPoint *)((char *)&self->mHeadLineEndPoint + 3) = *(CGPoint *)((char *)v9 + 8);
    *(double *)((char *)&self->mTailLineEndAngle + 3) = 0.0;
    *(int64_t *)((char *)&self->mTailCutSegment + 3) = 0;
  }
}

- (id)p_createClippedPath
{
  if (![(CRLShapeLayout *)self pathIsOpen]) {
    goto LABEL_4;
  }
  id v3 = [(CRLShapeLayout *)self stroke];
  unsigned int v4 = [v3 supportsWidth];

  if (!v4) {
    goto LABEL_4;
  }
  [(CRLShapeLayout *)self p_validateHeadLineEnd];
  [(CRLShapeLayout *)self p_validateTailLineEnd];
  uint64_t v5 = *(void *)((char *)&self->mTailLineEndPoint.x + 3);
  uint64_t v6 = *(void *)((char *)&self->mHeadLineEndAngle + 3);
  long long v20 = *(long long *)((char *)&self->mTailPoint + 3);
  uint64_t v7 = *(int64_t *)((char *)&self->mHeadCutSegment + 3);
  long long v16 = *(long long *)((char *)&self->mHeadLineEndPoint + 3);
  uint64_t v8 = *(void *)((char *)&self->mTailLineEndPoint.y + 3);
  uint64_t v9 = *(void *)((char *)&self->mTailLineEndAngle + 3);
  uint64_t v10 = *(int64_t *)((char *)&self->mTailCutSegment + 3);
  double v11 = [(CRLShapeLayout *)self path];
  double v12 = [(CRLShapeLayout *)self stroke];
  uint64_t v18 = v10;
  uint64_t v19 = v5;
  uint64_t v21 = v6;
  uint64_t v22 = v7;
  uint64_t v15 = v8;
  uint64_t v17 = v9;
  double v13 = +[CRLBezierPath createClippedPath:v11 headPositioning:&v19 tailPositioning:&v15 stroke:v12];

  if (!v13)
  {
LABEL_4:
    [(CRLShapeLayout *)self path];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (id)p_unitePath:(id)a3 withLineEndForHead:(BOOL)a4 stroke:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  if (v6) {
    [(CRLShapeLayout *)self strokeHeadLineEnd];
  }
  else {
  double v11 = [(CRLShapeLayout *)self strokeTailLineEnd];
  }
  double v12 = v11;
  double v13 = v10;
  if (v11)
  {
    double v13 = v10;
    if (([v11 isNone] & 1) == 0)
    {
      if (v6)
      {
        [(CRLShapeLayout *)self headLineEndPoint];
        double v15 = v14;
        double v17 = v16;
        [(CRLShapeLayout *)self headLineEndAngle];
      }
      else
      {
        [(CRLShapeLayout *)self tailLineEndPoint];
        double v15 = v19;
        double v17 = v20;
        [(CRLShapeLayout *)self tailLineEndAngle];
      }
      double v21 = v18;
      [(CRLShapeLayout *)self lineEndScale:v6];
      double v23 = [v9 pathForLineEnd:v12 wrapPath:1 atPoint:v15 atAngle:v17 withScale:v21 v22];
      double v13 = [v10 uniteWithBezierPath:v23];
    }
  }

  return v13;
}

- (void)p_updateResizeInfoGeometryFromDynamicPathSource
{
  id v14 = *(id *)((char *)&self->mCachedEditableBezierPathSource + 3);
  id v3 = [v14 bezierPath];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [*(id *)((char *)&self->mCachedPathSource + 3) geometryWithNewBounds:v5, v7, v9, v11];
  double v12 = (CRLPathSource *)objc_claimAutoreleasedReturnValue();
  double v13 = *(CRLPathSource **)((char *)&self->mCachedPathSource + 3);
  *(CRLPathSource **)((char *)&self->mCachedPathSource + 3) = v12;

  [v14 alignToOrigin];
}

- (id)commandForSettingCornerRadius:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingCornerRadius:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (id)commandForSettingNumberOfSides:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingNumberOfSides:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (id)commandForSettingStarPoints:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingStarPoints:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (id)commandForSettingStarRadius:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingStarRadius:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (id)commandForSettingArrowHead:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingArrowHead:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (id)commandForSettingArrowIndent:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingArrowIndent:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (id)commandForSettingCalloutCornerRadius:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingCalloutCornerRadius:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (id)commandForSettingCalloutTailSize:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  double v7 = +[CRLPathSourceCommandHelper commandForSettingCalloutTailSize:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (double)adjustedCalloutTailPositionXWithValue:(double)a3
{
  double v5 = [(CRLCanvasLayout *)self layoutController];
  double v6 = [v5 canvas];
  id v7 = [v6 isAnchoredAtRight];
  double v8 = [(CRLCanvasLayout *)self inspectorGeometry];
  +[CRLPathSourceCommandHelper adjustedCalloutTailPositionXWithValue:v7 isAnchoredAtRight:v8 layoutGeometry:a3];
  double v10 = v9;

  return v10;
}

- (id)commandForSettingCalloutTailPositionX:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  id v7 = [(CRLCanvasLayout *)self layoutController];
  double v8 = [v7 canvas];
  id v9 = [v8 isAnchoredAtRight];
  double v10 = [(CRLCanvasLayout *)self inspectorGeometry];
  double v11 = +[CRLPathSourceCommandHelper commandForSettingCalloutTailPositionX:v5 withPathSource:v6 shapeItem:v9 isAnchoredAtRight:v10 layoutGeometry:a3];

  return v11;
}

- (id)commandForSettingCalloutTailPositionY:(double)a3
{
  double v5 = [(CRLShapeLayout *)self pathSource];
  double v6 = [(CRLShapeLayout *)self shapeInfo];
  id v7 = +[CRLPathSourceCommandHelper commandForSettingCalloutTailPositionY:v5 withPathSource:v6 shapeItem:a3];

  return v7;
}

- (CRLFill)dynamicFill
{
  return *(CRLFill **)((char *)&self->mInitialStroke + 3);
}

- (void)setDynamicFill:(id)a3
{
}

- (NSArray)dynamicPatternOffsetsBySubpath
{
  return *(NSArray **)((char *)&self->mLastParentLimitedSize.height + 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->mLastParentLimitedSize.height + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicStrokeOffsetArray + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicStroke + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialStroke + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialPencilKitStrokePathCompactData + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialMaskPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialInfoGeometry + 3), 0);
  objc_storeStrong((id *)((char *)&self->mInitialPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicPencilKitStrokePathCompactData + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicMaskPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicInfoGeometry + 3), 0);
  objc_storeStrong((id *)((char *)&self->mDynamicPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedEditableBezierPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mOriginalShrunkenPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mShrunkenPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mTailCutT + 3), 0);
  objc_storeStrong((id *)((char *)&self->mHeadCutT + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedPathBoundsWithoutStrokeStruct.originalCachedRect.size.height + 3), 0);

  objc_storeStrong((id *)(&self->super._suppressesShadowsAndReflections + 3), 0);
}

@end