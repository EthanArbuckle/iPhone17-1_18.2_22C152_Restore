@interface CRLConnectionLineAbstractLayout
+ (id)localizedDescriptionForConnectionType:(int64_t)a3;
- (BOOL)canBeIntersected;
- (BOOL)canEndpointsCoincide;
- (BOOL)canResetTextAndObjectHandles;
- (BOOL)clipHead;
- (BOOL)clipTail;
- (BOOL)controlKnobPositionChangedFromRouting;
- (BOOL)drawClippedHeadPortion;
- (BOOL)drawClippedTailPortion;
- (BOOL)hasControlKnobsInStraightLine;
- (BOOL)headHasHorizontalFlip;
- (BOOL)headHasVerticalFlip;
- (BOOL)i_shouldTryToScaleCachedRectsDuringResize;
- (BOOL)i_visibleLine;
- (BOOL)isDraggable;
- (BOOL)isInvisible;
- (BOOL)isStraightLine;
- (BOOL)isValidConnectionDestination:(id)a3 forLineEnd:(unint64_t)a4;
- (BOOL)magnetsAdjusted;
- (BOOL)overridenHeadMagnetNormalizedPosition;
- (BOOL)overridenTailMagnetNormalizedPosition;
- (BOOL)p_doesMainBoardContainInfo:(id)a3;
- (BOOL)p_isConnectedToLockedObjects;
- (BOOL)pathIsLineSegment;
- (BOOL)pathIsOpen;
- (BOOL)shouldAdjustForStrokeWidthForCollabCursor;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldValidate;
- (BOOL)supportsFlipping;
- (BOOL)supportsRotation;
- (BOOL)tailHasHorizontalFlip;
- (BOOL)tailHasVerticalFlip;
- (BOOL)useDynamicOutsets;
- (BOOL)userDidSetControlPoint;
- (BOOL)validLine;
- (CGAffineTransform)connectedInfoGeometryTransform;
- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6;
- (CGPoint)g_getNormalizedPosition:(CGPoint)a3 inLayout:(id)a4;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)headMagnetCanvasPosition;
- (CGPoint)headMagnetNormalizedPosition;
- (CGPoint)i_accumulatedDrag;
- (CGPoint)p_getPositionForMagnet:(unint64_t)a3 forLayout:(id)a4 forEnd:(unint64_t)a5;
- (CGPoint)tailMagnetCanvasPosition;
- (CGPoint)tailMagnetNormalizedPosition;
- (CGPoint)unclippedHeadPoint;
- (CGPoint)unclippedTailPoint;
- (CGRect)boundsForStandardKnobs;
- (CGRect)frameForMiniFormatterPositioning;
- (CGSize)minimumSize;
- (CRLCanvasElementInfo)connectedFromInfo;
- (CRLCanvasElementInfo)connectedToInfo;
- (CRLCanvasElementInfo)temporaryConnectedFromInfo;
- (CRLCanvasElementInfo)temporaryConnectedToInfo;
- (CRLCanvasLayout)connectedFrom;
- (CRLCanvasLayout)connectedTo;
- (CRLCanvasLayout)headNearestLayoutForRouting;
- (CRLCanvasLayout)tailNearestLayoutForRouting;
- (CRLConnectionLineAbstractLayout)initWithInfo:(id)a3;
- (CRLConnectionLinePathSource)connectedPathSource;
- (double)distanceBetweenConnectionPoints;
- (double)dynamicOutsetFrom;
- (double)dynamicOutsetTo;
- (double)headClipT;
- (double)outsetFrom;
- (double)outsetTo;
- (double)tailClipT;
- (id)additionalLayoutsForRepCreation;
- (id)clipPath:(id)a3 onLayout:(id)a4 outset:(double)a5 reversed:(BOOL)a6 isValid:(BOOL *)a7;
- (id)commandForSettingConnectionType:(int64_t)a3;
- (id)commandToToggleConnectionType;
- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6;
- (id)getClippedHeadPortion;
- (id)getClippedTailPortion;
- (id)i_originalPathSource;
- (id)layoutInfoGeometry;
- (id)p_infoForConnectingToInfo:(id)a3;
- (id)path;
- (id)pathSource;
- (id)reliedOnLayouts;
- (int64_t)connectionType;
- (unint64_t)dynamicOutsetType;
- (unint64_t)headMagnetType;
- (unint64_t)headNearestMagnetTypeForRouting;
- (unint64_t)tailMagnetType;
- (unint64_t)tailNearestMagnetTypeForRouting;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)beginDynamicOutsetChange;
- (void)checkConnections;
- (void)connectedLayoutDisconnected:(id)a3;
- (void)connectedLayoutInvalidated:(id)a3;
- (void)dealloc;
- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)endDynamicOperation;
- (void)endDynamicOutsetChange;
- (void)i_setVisibleLine:(BOOL)a3;
- (void)i_willValidateLayout;
- (void)invalidateAndCleanupConnectedLayouts;
- (void)invalidateConnections;
- (void)invalidatePath;
- (void)invalidatePosition;
- (void)invalidateSize;
- (void)overrideHeadMagnetNormalizedPosition:(CGPoint)a3;
- (void)overrideTailMagnetNormalizedPosition:(CGPoint)a3;
- (void)p_resizeWithTransform:(CGAffineTransform *)a3 preservingAspectRatio:(BOOL)a4;
- (void)p_updateMagnetsFromInfo;
- (void)parentDidChange;
- (void)pauseDynamicTransformation;
- (void)processChangedProperty:(unint64_t)a3;
- (void)removeConnections;
- (void)setClipHead:(BOOL)a3;
- (void)setClipTail:(BOOL)a3;
- (void)setConnectedFrom:(id)a3;
- (void)setConnectedFromInfo:(id)a3;
- (void)setConnectedTo:(id)a3;
- (void)setConnectedToInfo:(id)a3;
- (void)setControlKnobPositionChangedFromRouting:(BOOL)a3;
- (void)setDrawClippedHeadPortion:(BOOL)a3;
- (void)setDrawClippedTailPortion:(BOOL)a3;
- (void)setDynamicOutsetFrom:(double)a3;
- (void)setDynamicOutsetTo:(double)a3;
- (void)setDynamicOutsetType:(unint64_t)a3;
- (void)setHeadClipT:(double)a3;
- (void)setHeadHasHorizontalFlip:(BOOL)a3;
- (void)setHeadHasVerticalFlip:(BOOL)a3;
- (void)setHeadMagnetPosition:(CGPoint)a3;
- (void)setHeadMagnetType:(unint64_t)a3;
- (void)setHeadNearestLayoutForRouting:(id)a3;
- (void)setHeadNearestMagnetTypeForRouting:(unint64_t)a3;
- (void)setMagnetsAdjusted:(BOOL)a3;
- (void)setTailClipT:(double)a3;
- (void)setTailHasHorizontalFlip:(BOOL)a3;
- (void)setTailHasVerticalFlip:(BOOL)a3;
- (void)setTailMagnetPosition:(CGPoint)a3;
- (void)setTailMagnetType:(unint64_t)a3;
- (void)setTailNearestLayoutForRouting:(id)a3;
- (void)setTailNearestMagnetTypeForRouting:(unint64_t)a3;
- (void)setTemporaryConnectedFromInfo:(id)a3;
- (void)setTemporaryConnectedToInfo:(id)a3;
- (void)setUseDynamicOutsets:(BOOL)a3;
- (void)setUserDidSetControlPoint:(BOOL)a3;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
- (void)updateConnectedPath;
@end

@implementation CRLConnectionLineAbstractLayout

- (CRLConnectionLineAbstractLayout)initWithInfo:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLConnectionLineAbstractLayout;
  v5 = [(CRLShapeLayout *)&v10 initWithInfo:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = sub_1002469D0(v6, v4);
    v8 = [v7 connectionLinePathSource];
    BYTE6(v5->mDynamicOutsetType) = [v8 userDidSetControlPoint];

    HIBYTE(v5->mDynamicOutsetType) = 0;
  }

  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF5F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBEA0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF610);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout dealloc]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 123, 0, "expected nil value for '%{public}s'", "mConnectedFrom");
  }
  id v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF630);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBE04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF650);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout dealloc]");
    objc_super v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 124, 0, "expected nil value for '%{public}s'", "mConnectedTo");
  }
  v11.receiver = self;
  v11.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLShapeLayout *)&v11 dealloc];
}

- (double)outsetFrom
{
  if (BYTE3(self->mResizeControlPoints[2].x)) {
    return *(double *)((char *)&self->mResizeControlPoints[2].y + 3);
  }
  v3 = [(CRLShapeLayout *)self shapeInfo];
  id v4 = [v3 pathSource];

  [v4 outsetFrom];
  double v6 = v5;

  return v6;
}

- (double)outsetTo
{
  if (BYTE3(self->mResizeControlPoints[2].x)) {
    return *(double *)(&self->mUseDynamicOutsets + 3);
  }
  v3 = [(CRLShapeLayout *)self shapeInfo];
  id v4 = [v3 pathSource];

  [v4 outsetTo];
  double v6 = v5;

  return v6;
}

- (void)setConnectedFrom:(id)a3
{
  id v4 = (CRLConnectionLineAbstractLayout *)a3;
  if (v4 == self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF670);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBF3C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF690);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setConnectedFrom:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:144 isFatal:0 description:"trying to connect a c-line to itself"];
  }
  objc_storeWeak((id *)((char *)&self->mConnectedPathSource + 3), v4);
}

- (void)setConnectedTo:(id)a3
{
  id v4 = (CRLConnectionLineAbstractLayout *)a3;
  if (v4 == self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF6B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBFC4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF6D0);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setConnectedTo:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:149 isFatal:0 description:"trying to connect a c-line to itself"];
  }
  objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), v4);
}

- (void)setTemporaryConnectedFromInfo:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mConnectedFromInfo + 3), a3);

  [(CRLConnectionLineAbstractLayout *)self invalidateConnections];
}

- (void)setTemporaryConnectedToInfo:(id)a3
{
  objc_storeWeak((id *)((char *)&self->mConnectedToInfo + 3), a3);

  [(CRLConnectionLineAbstractLayout *)self invalidateConnections];
}

- (CGPoint)g_getNormalizedPosition:(CGPoint)a3 inLayout:(id)a4
{
  long long v15 = *(long long *)&a3.y;
  double x = a3.x;
  id v4 = a4;
  double v5 = v4;
  if (v4) {
    [v4 pureTransformInRoot:v15];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  CGAffineTransformInvert(&v19, &v18);
  float64x2_t v17 = vaddq_f64(*(float64x2_t *)&v19.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v19.c, *(double *)&v15), *(float64x2_t *)&v19.a, x));
  double v6 = [v5 pureGeometry];
  [v6 size];
  double v7 = sub_100064070();
  double v10 = sub_100066AA4(v17.f64[0], v17.f64[1], v7, v8, v9);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.y = v14;
  result.double x = v13;
  return result;
}

- (void)setHeadMagnetPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLConnectionLineAbstractLayout *)self connectedTo];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF6F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC04C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF710);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setHeadMagnetPosition:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:169 isFatal:0 description:"Must have connected-to when setting head magnet position"];
  }
  double v10 = [(CRLConnectionLineAbstractLayout *)self connectedTo];

  if (v10)
  {
    double v11 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
    -[CRLConnectionLineAbstractLayout g_getNormalizedPosition:inLayout:](self, "g_getNormalizedPosition:inLayout:", v11, x, y);
    *(unint64_t *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3) = v12;
    *(unint64_t *)((char *)&self->mTailNearestMagnetTypeForRouting + 3) = v13;

    *(double *)((char *)&self->mTailMagnetNormalizedPosition.x + 3) = x;
    *(double *)((char *)&self->mTailMagnetNormalizedPosition.y + 3) = y;
    BYTE4(self->mDynamicOutsetType) = 0;
  }
}

- (void)setTailMagnetPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF730);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC0D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF750);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout setTailMagnetPosition:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:178 isFatal:0 description:"Must have connected-from when setting tail magnet position"];
  }
  double v10 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];

  if (v10)
  {
    double v11 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    -[CRLConnectionLineAbstractLayout g_getNormalizedPosition:inLayout:](self, "g_getNormalizedPosition:inLayout:", v11, x, y);
    *(void *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3) = v12;
    *(void *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3) = v13;

    *(double *)((char *)&self->mHeadMagnetCanvasPosition.x + 3) = x;
    *(double *)((char *)&self->mHeadMagnetCanvasPosition.y + 3) = y;
    BYTE5(self->mDynamicOutsetType) = 0;
  }
}

- (void)overrideHeadMagnetNormalizedPosition:(CGPoint)a3
{
  *(unint64_t *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3) = *(void *)&a3.x;
  *(unint64_t *)((char *)&self->mTailNearestMagnetTypeForRouting + 3) = *(void *)&a3.y;
  BYTE4(self->mDynamicOutsetType) = 1;
}

- (void)overrideTailMagnetNormalizedPosition:(CGPoint)a3
{
  *(CGFloat *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3) = a3.x;
  *(CGFloat *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3) = a3.y;
  BYTE5(self->mDynamicOutsetType) = 1;
}

- (id)getClippedHeadPortion
{
  v3 = [(CRLCanvasLayout *)self pureGeometry];
  [v3 size];
  if (v4 == 0.0 || fabs(v4) < 0.00999999978)
  {
    double v5 = [(CRLCanvasLayout *)self pureGeometry];
    [v5 size];
    double v7 = v6;

    id v8 = 0;
    if (v7 == 0.0 || fabs(v7) < 0.00999999978) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  double v9 = *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3);
  [(CRLConnectionLineAbstractLayout *)self headClipT];
  id v8 = [v9 copyFromSegment:1 t:1];
  memset(&v20, 0, sizeof(v20));
  double v10 = [(CRLCanvasLayout *)self pureGeometry];
  double v11 = v10;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }

  uint64_t v12 = [(CRLCanvasAbstractLayout *)self parent];

  if (v12)
  {
    uint64_t v13 = [(CRLCanvasAbstractLayout *)self parent];
    double v14 = [v13 geometryInParent];
    long long v15 = v14;
    if (v14) {
      [v14 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform v17 = v20;
    CGAffineTransformConcat(&v19, &t1, &v17);
    CGAffineTransform v20 = v19;
  }
  CGAffineTransform v19 = v20;
  [v8 transformUsingAffineTransform:&v19];
LABEL_15:

  return v8;
}

- (id)getClippedTailPortion
{
  v3 = [(CRLCanvasLayout *)self pureGeometry];
  [v3 size];
  if (v4 == 0.0 || fabs(v4) < 0.00999999978)
  {
    double v5 = [(CRLCanvasLayout *)self pureGeometry];
    [v5 size];
    double v7 = v6;

    id v8 = 0;
    if (v7 == 0.0 || fabs(v7) < 0.00999999978) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  double v9 = *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3);
  [(CRLConnectionLineAbstractLayout *)self tailClipT];
  id v8 = [v9 copyFromSegment:1 t:1 toSegment:0.0 t:v10];
  memset(&v21, 0, sizeof(v21));
  double v11 = [(CRLCanvasLayout *)self pureGeometry];
  uint64_t v12 = v11;
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }

  uint64_t v13 = [(CRLCanvasAbstractLayout *)self parent];

  if (v13)
  {
    double v14 = [(CRLCanvasAbstractLayout *)self parent];
    long long v15 = [v14 geometryInParent];
    v16 = v15;
    if (v15) {
      [v15 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform v18 = v21;
    CGAffineTransformConcat(&v20, &t1, &v18);
    CGAffineTransform v21 = v20;
  }
  CGAffineTransform v20 = v21;
  [v8 transformUsingAffineTransform:&v20];
LABEL_15:

  return v8;
}

- (BOOL)isValidConnectionDestination:(id)a3 forLineEnd:(unint64_t)a4
{
  id v8 = (CRLConnectionLineAbstractLayout *)a3;
  uint64_t v9 = objc_opt_class();
  double v10 = [(CRLCanvasLayout *)self layoutController];
  double v11 = [v10 canvas];
  uint64_t v12 = [v11 canvasController];
  uint64_t v13 = [v12 repForLayout:self];
  double v14 = sub_1002469D0(v9, v13);

  long long v15 = [(CRLCanvasLayout *)self layoutController];
  v16 = [v15 canvas];
  CGAffineTransform v17 = [v16 canvasController];
  CGAffineTransform v18 = [v17 repForLayout:v8];

  if (v8 == self) {
    goto LABEL_31;
  }
  if (a4 == 11)
  {
    uint64_t v19 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    if ((CRLConnectionLineAbstractLayout *)v19 != v8)
    {
      long long v15 = (void *)v19;
      self = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
      uint64_t v20 = [(CRLCanvasAbstractLayout *)self parent];
      if ((CRLConnectionLineAbstractLayout *)v20 != v8)
      {
        double v5 = (void *)v20;
        int v21 = 0;
        goto LABEL_12;
      }

LABEL_31:
      char v29 = 0;
      goto LABEL_32;
    }
LABEL_10:

    goto LABEL_31;
  }
  if (a4 != 10)
  {
    int v21 = 0;
    goto LABEL_12;
  }
  uint64_t v22 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  if ((CRLConnectionLineAbstractLayout *)v22 == v8) {
    goto LABEL_10;
  }
  v40 = (void *)v22;
  double v4 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  uint64_t v23 = [v4 parent];
  if ((CRLConnectionLineAbstractLayout *)v23 == v8)
  {

    goto LABEL_31;
  }
  v39 = (void *)v23;
  int v21 = 1;
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && [v14 canConnectToRep:v18])
  {
    v38 = v4;
    v24 = [(CRLCanvasLayout *)v8 pureGeometry];
    [v24 size];
    if (v25 == 0.0 || fabs(v25) < 0.00999999978)
    {

      BOOL v28 = 1;
    }
    else
    {
      [(CRLCanvasLayout *)v8 pureGeometry];
      v26 = v37 = v5;
      [v26 size];
      BOOL v28 = fabs(v27) < 0.00999999978 || v27 == 0.0;

      double v5 = v37;
    }
    double v4 = v38;
    if ((v21 & 1) == 0) {
      goto LABEL_27;
    }
LABEL_21:

    if (a4 != 11)
    {

      goto LABEL_30;
    }

    goto LABEL_29;
  }
  BOOL v28 = 1;
  if (v21) {
    goto LABEL_21;
  }
LABEL_27:
  if (a4 != 11) {
    goto LABEL_30;
  }

LABEL_29:
LABEL_30:
  if (v28) {
    goto LABEL_31;
  }
  v31 = [v14 interactiveCanvasController];
  v32 = [v31 freehandDrawingToolkit];
  if ([v32 isInDrawingMode]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([(CRLCanvasAbstractLayout *)v8 parent], (uint64_t v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = (void *)v33;
    v35 = [(CRLCanvasAbstractLayout *)v8 parent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v29 = isKindOfClass ^ 1;
  }
  else
  {

    char v29 = 1;
  }
LABEL_32:

  return v29 & 1;
}

- (BOOL)shouldValidate
{
  return BYTE3(self->mOldConnectedFrom);
}

- (void)i_willValidateLayout
{
  v3.receiver = self;
  v3.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLCanvasLayout *)&v3 i_willValidateLayout];
  [(CRLConnectionLineAbstractLayout *)self checkConnections];
}

- (id)reliedOnLayouts
{
  [(CRLConnectionLineAbstractLayout *)self checkConnections];
  objc_super v3 = +[NSMutableSet set];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    [v3 addObject:v5];
  }
  double v6 = (id *)((char *)&self->mConnectedInfoGeometry + 3);
  id v7 = objc_loadWeakRetained(v6);

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v6);
    [v3 addObject:v8];
  }

  return v3;
}

- (id)additionalLayoutsForRepCreation
{
  v2 = [(CRLConnectionLineAbstractLayout *)self reliedOnLayouts];
  objc_super v3 = [v2 allObjects];

  return v3;
}

- (BOOL)isDraggable
{
  v5.receiver = self;
  v5.super_class = (Class)CRLConnectionLineAbstractLayout;
  BOOL v3 = [(CRLStyledLayout *)&v5 isDraggable];
  if (v3) {
    LOBYTE(v3) = ![(CRLConnectionLineAbstractLayout *)self p_isConnectedToLockedObjects];
  }
  return v3;
}

- (BOOL)p_isConnectedToLockedObjects
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  objc_super v5 = [v4 info];
  double v6 = sub_1002469D0(v3, v5);

  uint64_t v7 = objc_opt_class();
  id v8 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  uint64_t v9 = [v8 info];
  double v10 = sub_1002469D0(v7, v9);

  if ([v6 locked]) {
    unsigned __int8 v11 = 1;
  }
  else {
    unsigned __int8 v11 = [v10 locked];
  }

  return v11;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)supportsFlipping
{
  [(CRLConnectionLineAbstractLayout *)self checkConnections];
  uint64_t v3 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_super v5 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (CGAffineTransform)connectedInfoGeometryTransform
{
  CGPoint result = *(CGAffineTransform **)((char *)&self->mOriginalPathSource + 3);
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (double)distanceBetweenConnectionPoints
{
  uint64_t v3 = (id *)((char *)&self->mConnectedPathSource + 3);
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  if (!WeakRetained) {
    return -1.0;
  }
  objc_super v5 = WeakRetained;
  double v6 = (id *)((char *)&self->mConnectedInfoGeometry + 3);
  id v7 = objc_loadWeakRetained(v6);

  if (!v7) {
    return -1.0;
  }
  id v8 = objc_loadWeakRetained(v3);
  uint64_t v9 = [v8 geometry];
  [v9 center];
  double v11 = v10;
  double v13 = v12;

  id v14 = objc_loadWeakRetained(v6);
  long long v15 = [v14 geometry];
  [v15 center];
  double v17 = v16;
  double v19 = v18;

  return sub_1000653B4(v11, v13, v17, v19);
}

- (void)parentDidChange
{
  uint64_t v3 = [(CRLCanvasAbstractLayout *)self parent];

  if (!v3) {
    [(CRLConnectionLineAbstractLayout *)self removeConnections];
  }
  [(CRLConnectionLineAbstractLayout *)self invalidatePath];
  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLBoardItemLayout *)&v4 parentDidChange];
}

- (void)processChangedProperty:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x20)
  {
    [(CRLConnectionLineAbstractLayout *)self invalidateAndCleanupConnectedLayouts];
  }
  else if (a3 == 19)
  {
    uint64_t v5 = objc_opt_class();
    double v6 = [(CRLCanvasLayout *)self info];
    id v7 = [v6 layoutClass];

    if ((id)v5 != v7)
    {
      id v8 = [(CRLCanvasLayout *)self layoutController];
      [v8 invalidateLayoutForRecreation:self];
    }
    uint64_t v9 = objc_opt_class();
    double v10 = [(CRLConnectionLineAbstractLayout *)self pathSource];
    double v11 = sub_1002469D0(v9, v10);

    BYTE6(self->mDynamicOutsetType) = [v11 userDidSetControlPoint];
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x22)
  {
    [(CRLConnectionLineAbstractLayout *)self invalidatePath];
    [(CRLShapeLayout *)self invalidateFrame];
    [(CRLConnectionLineAbstractLayout *)self p_updateMagnetsFromInfo];
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLShapeLayout *)&v12 processChangedProperty:a3];
}

- (void)p_updateMagnetsFromInfo
{
  uint64_t v3 = [(CRLConnectionLineAbstractLayout *)self connectionLineInfo];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF770);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC15C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF790);
    }
    objc_super v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout p_updateMagnetsFromInfo]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 334, 0, "invalid nil value for '%{public}s'", "self.connectionLineInfo");
  }
  id v7 = [(CRLConnectionLineAbstractLayout *)self connectionLineInfo];
  id v8 = [v7 connectionLinePathSource];

  uint64_t v9 = [v8 headMagnet];
  if (v9
    && (double v10 = (void *)v9,
        [(CRLConnectionLineAbstractLayout *)self connectedTo],
        double v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_super v12 = [v8 headMagnet];
    *(void *)&self->mDrawClippedTailPortion = [v12 magnetType];

    double v13 = [v8 headMagnet];
    [v13 magnetNormalizedPosition];
    *(unint64_t *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3) = v14;
    *(unint64_t *)((char *)&self->mTailNearestMagnetTypeForRouting + 3) = v15;
  }
  else
  {
    *(void *)&self->mDrawClippedTailPortion = 0;
  }
  uint64_t v16 = [v8 tailMagnet];
  if (v16
    && (double v17 = (void *)v16,
        [(CRLConnectionLineAbstractLayout *)self connectedFrom],
        double v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        v18))
  {
    double v19 = [v8 tailMagnet];
    *(void *)&self->mUserDidSetControlPoint = [v19 magnetType];

    uint64_t v20 = [v8 tailMagnet];
    [v20 magnetNormalizedPosition];
    *(void *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3) = v21;
    *(void *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3) = v22;
  }
  else
  {
    *(void *)&self->mUserDidSetControlPoint = 0;
  }
  uint64_t v23 = *(void *)&self->mDrawClippedTailPortion;
  if (v23)
  {
    if (v23 != 1) {
      LOBYTE(v23) = 0;
    }
    BYTE3(self->mDynamicOutsetTo) = v23;
  }
  else
  {
    v24 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
    BYTE3(self->mDynamicOutsetTo) = v24 != 0;
  }
  uint64_t v25 = *(void *)&self->mUserDidSetControlPoint;
  if (v25)
  {
    if (v25 != 1) {
      LOBYTE(v25) = 0;
    }
    BYTE4(self->mDynamicOutsetTo) = v25;
  }
  else
  {
    v26 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    BYTE4(self->mDynamicOutsetTo) = v26 != 0;
  }
}

- (void)connectedLayoutInvalidated:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasLayout *)self layoutState] != 2
    || ![(CRLCanvasLayout *)self isBeingTransformed])
  {
    if (v4)
    {
      uint64_t v5 = [v4 layoutController];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      double v6 = [(CRLCanvasLayout *)self info];
      id v7 = [v5 layoutsForInfo:v6];

      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          double v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_super v12 = *(CRLConnectionLineAbstractLayout **)(*((void *)&v13 + 1) + 8 * (void)v11);
            if (v12 != self
              && [(CRLConnectionLineAbstractLayout *)v12 isMemberOfClass:objc_opt_class()])
            {
              [(CRLConnectionLineAbstractLayout *)v12 invalidateConnections];
            }
            double v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
    [(CRLConnectionLineAbstractLayout *)self invalidatePath];
    [(CRLShapeLayout *)self invalidateFrame];
    *(_DWORD *)((char *)&self->super.mCachedAlignmentFrame.originalCachedRect.size.width + 3) = 0;
    [(CRLBoardItemLayout *)self invalidate];
    [(CRLBoardItemLayout *)self invalidateWrap];
  }
}

- (void)connectedLayoutDisconnected:(id)a3
{
  id v8 = a3;
  id v4 = (id *)((char *)&self->mConnectedPathSource + 3);
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained == v8
    || (id v4 = (id *)((char *)&self->mConnectedInfoGeometry + 3),
        id v6 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3)),
        v6,
        id v7 = v8,
        v6 == v8))
  {
    objc_storeWeak(v4, 0);
    [(CRLConnectionLineAbstractLayout *)self invalidateConnections];
    id v7 = v8;
  }
}

- (void)invalidateAndCleanupConnectedLayouts
{
  [(CRLConnectionLineAbstractLayout *)self invalidateConnections];
  id v13 = [(CRLConnectionLineAbstractLayout *)self connectionLineInfo];
  uint64_t v3 = [(CRLCanvasLayout *)self layoutController];
  id v4 = [v3 boardItemOwner];

  if (v4)
  {
    uint64_t v5 = [v13 getConnectedFromWithBoardItemOwner:v4];
    id v6 = [v13 getConnectedToWithBoardItemOwner:v4];
  }
  else
  {
    id v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = [(CRLConnectionLineAbstractLayout *)self p_infoForConnectingToInfo:v5];
  id v8 = [(CRLConnectionLineAbstractLayout *)self p_infoForConnectingToInfo:v6];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained && !v7)
  {
    id v10 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    [v10 removeConnectedLayout:self];

    objc_storeWeak((id *)((char *)&self->mConnectedPathSource + 3), 0);
  }
  id v11 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (v11 && !v8)
  {
    id v12 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    [v12 removeConnectedLayout:self];

    objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), 0);
  }
}

- (void)removeConnections
{
  BYTE3(self->mOldConnectedFrom) = 0;
  uint64_t v3 = (id *)((char *)&self->mConnectedPathSource + 3);
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 removeConnectedLayout:self];
  }
  id v6 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    [v7 removeConnectedLayout:self];
  }
  objc_storeWeak(v3, 0);

  objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), 0);
}

- (void)invalidateConnections
{
  BYTE3(self->mOldConnectedFrom) = 0;
  [(CRLConnectionLineAbstractLayout *)self invalidatePath];
  [(CRLShapeLayout *)self invalidateFrame];

  [(CRLBoardItemLayout *)self invalidate];
}

- (void)invalidatePosition
{
  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLCanvasLayout *)&v4 invalidatePosition];
  [(CRLConnectionLineAbstractLayout *)self invalidatePath];
  uint64_t v3 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
  *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3) = 0;
}

- (void)invalidateSize
{
  v3.receiver = self;
  v3.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLCanvasLayout *)&v3 invalidateSize];
  [(CRLConnectionLineAbstractLayout *)self invalidatePath];
}

- (BOOL)p_doesMainBoardContainInfo:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = sub_10024715C(v5, v4);

  if (v6)
  {
    id v7 = [(CRLCanvasLayout *)self layoutController];
    id v8 = [v7 canvas];
    id v9 = [v8 canvasController];
    id v10 = [v9 editingCoordinator];
    id v11 = [v10 mainBoard];

    id v12 = [v6 id];
    unsigned __int8 v13 = [v11 containsObject:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)checkConnections
{
  id v42 = [(CRLCanvasLayout *)self layoutController];
  objc_super v3 = [(CRLConnectionLineAbstractLayout *)self connectionLineInfo];
  id v4 = [(CRLCanvasLayout *)self layoutController];
  id v5 = [v4 boardItemOwner];

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedFromInfo + 3));
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedFromInfo + 3));
    id v8 = 0;
LABEL_3:
    int v9 = 0;
    goto LABEL_9;
  }
  if (v5)
  {
    id v8 = [v3 getConnectedFromWithBoardItemOwner:v5];
  }
  else
  {
    id v8 = 0;
  }
  id v7 = [(CRLConnectionLineAbstractLayout *)self p_infoForConnectingToInfo:v8];
  id v10 = objc_loadWeakRetained((id *)((char *)&self->mConnectedFrom + 3));

  if (v10 == v7) {
    goto LABEL_3;
  }
  objc_storeWeak((id *)((char *)&self->mConnectedFrom + 3), v7);
  int v9 = 1;
LABEL_9:
  id v11 = objc_loadWeakRetained((id *)((char *)&self->mConnectedToInfo + 3));

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)((char *)&self->mConnectedToInfo + 3));
    unsigned __int8 v13 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_33;
    }
LABEL_18:
    id v40 = v13;
    id v41 = v8;
    v39 = v5;
    [(CRLConnectionLineAbstractLayout *)self invalidateConnections];
    v38 = (char *)&self->mOldConnectedFrom + 3;
    goto LABEL_19;
  }
  if (v5)
  {
    uint64_t v14 = [v3 getConnectedToWithBoardItemOwner:v5];
  }
  else
  {
    uint64_t v14 = 0;
  }
  long long v15 = (void *)v14;
  -[CRLConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = objc_loadWeakRetained((id *)((char *)&self->mConnectedTo + 3));

  if (v16 != v12)
  {
    objc_storeWeak((id *)((char *)&self->mConnectedTo + 3), v12);
    unsigned __int8 v13 = v15;
    goto LABEL_18;
  }
  unsigned __int8 v13 = v15;
  if (v9) {
    goto LABEL_18;
  }
LABEL_33:
  if (BYTE3(self->mOldConnectedFrom)) {
    goto LABEL_47;
  }
  v38 = (char *)&self->mOldConnectedFrom + 3;
  v39 = v5;
  id v40 = v13;
  id v41 = v8;
LABEL_19:
  double v17 = [(CRLCanvasAbstractLayout *)self parent];
  id v18 = [v42 layoutForInfo:v7 childOfLayout:v17];
  id v19 = [v42 layoutForInfo:v12 childOfLayout:v17];
  id v20 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (v18 != v20)
  {
    id v21 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
      [v22 removeConnectedLayout:self];
    }
    id v23 = objc_storeWeak((id *)((char *)&self->mConnectedPathSource + 3), v18);

    if (v18)
    {
      id v24 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
      [v24 addConnectedLayout:self];
    }
  }
  id v25 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (v19 != v25)
  {
    id v26 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

    if (v26)
    {
      id v27 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
      [v27 removeConnectedLayout:self];
    }
    id v28 = objc_storeWeak((id *)((char *)&self->mConnectedInfoGeometry + 3), v19);

    if (v19)
    {
      id v29 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
      [v29 addConnectedLayout:self];
    }
  }
  v30 = v3;
  int v31 = (v12 != 0) ^ (v19 == 0);
  int v32 = (v7 != 0) ^ (v18 == 0);
  unsigned __int8 v13 = v40;
  if (v12 != v40 || v7 != v41)
  {
LABEL_43:
    if (v32) {
      goto LABEL_44;
    }
    goto LABEL_46;
  }
  unsigned int v33 = [(CRLConnectionLineAbstractLayout *)self p_doesMainBoardContainInfo:v12];
  unsigned int v34 = [(CRLConnectionLineAbstractLayout *)self p_doesMainBoardContainInfo:v7];
  if ((v12 != 0) != (v19 == 0))
  {
    int v31 = 1;
  }
  else
  {
    if (v19) {
      BOOL v35 = 1;
    }
    else {
      BOOL v35 = v12 == 0;
    }
    if (v35) {
      int v31 = 0;
    }
    else {
      int v31 = v33 ^ 1;
    }
  }
  unsigned __int8 v13 = v40;
  if ((v7 != 0) != (v18 == 0))
  {
    int v32 = 1;
    goto LABEL_43;
  }
  if (v18) {
    BOOL v36 = 1;
  }
  else {
    BOOL v36 = v7 == 0;
  }
  if (v36) {
    int v37 = 0;
  }
  else {
    int v37 = v34 ^ 1;
  }
  if (v37)
  {
LABEL_44:
    if (v31)
    {
      unsigned char *v38 = 1;
      [(CRLShapeLayout *)self invalidateExteriorWrap];
    }
  }
LABEL_46:
  [(CRLConnectionLineAbstractLayout *)self p_updateMagnetsFromInfo];

  objc_super v3 = v30;
  id v5 = v39;
  id v8 = v41;
LABEL_47:
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6
{
  return 0;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)clipPath:(id)a3 onLayout:(id)a4 outset:(double)a5 reversed:(BOOL)a6 isValid:(BOOL *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  [v12 length];
  double v15 = v14;
  id v16 = [v13 pathForClippingConnectionLines];
  id v17 = v16;
  if (!v16 || ([v16 isEmpty] & 1) != 0)
  {
    id v18 = 0;
    goto LABEL_60;
  }
  v63 = a7;
  if (a5 > 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mTemporaryConnectedFromInfo + 3));
    if (WeakRetained == v17)
    {
      double v28 = *(double *)((char *)&self->mCachedFromWrapPath + 3);

      if (v28 == a5)
      {
        uint64_t v29 = 1363;
LABEL_16:
        id v27 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v29);
        goto LABEL_17;
      }
    }
    else
    {
    }
    id v20 = objc_loadWeakRetained((id *)((char *)&self->mTemporaryConnectedToInfo + 3));
    if (v20 != v17)
    {

LABEL_9:
      [v17 setLineWidth:a5 + a5];
      [v17 setLineJoinStyle:1];
      [v17 setLineCapStyle:1];
      id v21 = [v17 strokedCopy];
      v69[0] = v17;
      v69[1] = v21;
      +[NSArray arrayWithObjects:v69 count:2];
      v23 = id v22 = v17;
      id v24 = +[CRLBezierPath uniteBezierPaths:v23];

      id v25 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
      if (v25 == v13)
      {
        objc_storeStrong((id *)((char *)&self->mCachedFromOutset + 3), v24);
        objc_storeWeak((id *)((char *)&self->mTemporaryConnectedFromInfo + 3), v22);
        uint64_t v26 = 1347;
      }
      else
      {
        objc_storeStrong((id *)((char *)&self->mCachedToOutset + 3), v24);
        objc_storeWeak((id *)((char *)&self->mTemporaryConnectedToInfo + 3), v22);
        uint64_t v26 = 1355;
      }
      *(double *)((char *)&self->super.super.super.super.super.super.isa + v26) = a5;
      id v17 = v22;
      goto LABEL_20;
    }
    double v30 = *(double *)((char *)&self->mCachedToWrapPath + 3);

    if (v30 != a5) {
      goto LABEL_9;
    }
    uint64_t v29 = 1371;
    goto LABEL_16;
  }
  id v27 = v17;
LABEL_17:
  id v24 = v27;
LABEL_20:
  id v67 = [v24 copy];

  int v31 = [v13 geometry];
  int v32 = v31;
  v65 = v17;
  id v66 = v13;
  if (v31) {
    [v31 transform];
  }
  else {
    memset(v68, 0, sizeof(v68));
  }
  [v67 transformUsingAffineTransform:v68];

  unsigned int v33 = +[NSMutableArray array];
  [v12 addIntersectionsWithPath:v67 to:v33 allIntersections:1 reversed:0];
  if (![v33 count]) {
    goto LABEL_51;
  }
  [v33 sortUsingSelector:"compareSegmentAndT:"];
  uint64_t v34 = (uint64_t)[v33 count];
  if (v34 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF7B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC1F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF7D0);
    }
    v60 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v60);
    }
    v61 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:]");
    v62 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v61 file:v62 lineNumber:674 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v35 = v8 ? v34 - 1 : 0;
  uint64_t v36 = v8 ? -1 : 1;
  if (v35 >= v34 || v35 < 0)
  {
LABEL_51:
    v52 = v64;
    id v17 = v65;
    unsigned char *v64 = 1;
    id v13 = v66;
  }
  else
  {
    double v37 = 1.0 / v15;
    double v38 = 1.0 - 1.0 / v15;
    while (1)
    {
      id v18 = [v33 objectAtIndex:v35];
      v35 += v36;
      BOOL v40 = v35 < v34 && v35 >= 0;
      if (v40)
      {
        id v41 = [v33 objectAtIndex:v35];
        id v42 = (char *)[v41 segment];
        [v41 t];
        double v44 = v43;
      }
      else if (v8)
      {
        id v42 = 0;
        double v44 = 0.0;
      }
      else
      {
        id v42 = (char *)[v12 elementCount] - 1;
        double v44 = 1.0;
      }
      double v45 = (double)(uint64_t)&v42[[(CRLPathIntersection *)v18 segment]] * 0.5;
      double v46 = ceil(v45);
      double v47 = floor(v45);
      if (v8) {
        double v47 = v46;
      }
      uint64_t v48 = (uint64_t)v47;
      [(CRLPathIntersection *)v18 t];
      [v12 pointAt:v48 fromElement:(v44 + v49) * 0.5];
      if ((objc_msgSend(v67, "containsPoint:") & 1) == 0)
      {
        [(CRLPathIntersection *)v18 t];
        if (v50 > v37)
        {
          [(CRLPathIntersection *)v18 t];
          if (v51 < v38) {
            break;
          }
        }
      }

      if (!v40) {
        goto LABEL_51;
      }
    }
    v52 = v64;
    id v17 = v65;
    unsigned char *v64 = 1;
    id v13 = v66;
    if (v18) {
      goto LABEL_59;
    }
  }
  if (!v8)
  {
    [v12 pointAt:1 fromElement:0.01];
    if (objc_msgSend(v67, "containsPoint:"))
    {
      v58 = [CRLPathIntersection alloc];
      v57 = (char *)[v12 elementCount] - 1;
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      double v56 = 1.0;
      v53 = v58;
      goto LABEL_57;
    }
LABEL_58:
    id v18 = 0;
    goto LABEL_59;
  }
  [v12 pointAt:[v12 elementCount] - 1 fromElement:0.99];
  if (!objc_msgSend(v67, "containsPoint:")) {
    goto LABEL_58;
  }
  v53 = [CRLPathIntersection alloc];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  double v56 = 0.0;
  v57 = 0;
LABEL_57:
  id v18 = -[CRLPathIntersection initWithSegment:atT:atPoint:](v53, "initWithSegment:atT:atPoint:", v57, v56, x, y);
  unsigned char *v52 = 0;
LABEL_59:

LABEL_60:

  return v18;
}

- (void)updateConnectedPath
{
  [(CRLConnectionLineAbstractLayout *)self checkConnections];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    id v5 = [v4 parent];
    id v6 = [(CRLCanvasAbstractLayout *)self parent];
    if (v5 == v6) {
      id v7 = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  id v8 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    id v10 = [v9 parent];
    id v11 = [(CRLCanvasAbstractLayout *)self parent];
    if (v10 == v11) {
      id v12 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  p_cache = &OBJC_METACLASS_____CRLTextEditorAccessibility_super.cache;
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = v14;
  id v16 = *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3);
  if (v16)
  {
    id v17 = sub_1002469D0(v14, v16);
  }
  else
  {
    id v18 = [(CRLShapeLayout *)self shapeInfo];
    id v19 = [v18 pathSource];
    id v17 = sub_1002469D0(v15, v19);
  }
  id v20 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
  if (v20)
  {
    id v21 = v20;
  }
  else
  {
    id v22 = [(CRLCanvasLayout *)self info];
    id v21 = [v22 geometry];
  }
  long long v92 = xmmword_101175160;
  long long v93 = xmmword_101175160;
  id v23 = [v17 bezierPath];
  [v23 getStartPoint:&v93 andEndPoint:&v92];

  if ([(CRLConnectionLineAbstractLayout *)self canEndpointsCoincide]
    || !sub_100064084(*(double *)&v92, *((double *)&v92 + 1), *(double *)&v93, *((double *)&v93 + 1)))
  {
    id v24 = v17;
    id v27 = v21;
  }
  else
  {
    id v24 = +[CRLConnectionLinePathSource pathSourceOfLength:100.0];

    id v25 = [v24 bezierPath];
    [v25 getStartPoint:&v93 andEndPoint:&v92];

    uint64_t v26 = [CRLCanvasInfoGeometry alloc];
    [(CRLCanvasInfoGeometry *)v21 position];
    id v27 = -[CRLCanvasInfoGeometry initWithPosition:size:](v26, "initWithPosition:size:");

    if (sub_100064084(*(double *)&v92, *((double *)&v92 + 1), *(double *)&v93, *((double *)&v93 + 1)))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF7F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BC280();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF810);
      }
      double v28 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v28);
      }
      uint64_t v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineAbstractLayout updateConnectedPath]");
      double v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineAbstractLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:v29 file:v30 lineNumber:758 isFatal:0 description:"Head and tail should no longer be equal."];

      p_cache = (void **)(&OBJC_METACLASS_____CRLTextEditorAccessibility_super + 16);
    }
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v89 = 0u;
  if (v27)
  {
    [(CRLCanvasInfoGeometry *)v27 transform];
    double v31 = *((double *)&v89 + 1);
    double v32 = *(double *)&v89;
    double v33 = *((double *)&v90 + 1);
    double v34 = *(double *)&v90;
    double v36 = *((double *)&v91 + 1);
    double v35 = *(double *)&v91;
  }
  else
  {
    double v36 = 0.0;
    double v35 = 0.0;
    double v33 = 0.0;
    double v34 = 0.0;
    double v31 = 0.0;
    double v32 = 0.0;
  }
  double v37 = *((double *)&v93 + 1) * v34 + v32 * *(double *)&v93;
  double v38 = v35 + v37;
  double v39 = v36 + *((double *)&v93 + 1) * v33 + v31 * *(double *)&v93;
  double v40 = v34 * *((double *)&v92 + 1) + v32 * *(double *)&v92;
  double v41 = v33 * *((double *)&v92 + 1) + v31 * *(double *)&v92;
  if (BYTE3(self->mAcumulatedDrag.x))
  {
    double v42 = *(double *)((char *)&self->mAcumulatedDrag.y + 3);
    double v43 = *(double *)&self->mUseResizePoints[3];
  }
  else
  {
    double v42 = v35 + v37;
    double v43 = v36 + *((double *)&v93 + 1) * v33 + v31 * *(double *)&v93;
    if (v7)
    {
      [(CRLConnectionLineAbstractLayout *)self p_getPositionForMagnet:[(CRLConnectionLineAbstractLayout *)self tailMagnetType] forLayout:v7 forEnd:10];
      double v42 = v44;
      double v43 = v45;
      *(double *)((char *)&self->mHeadMagnetCanvasPosition.x + 3) = v44;
      *(double *)((char *)&self->mHeadMagnetCanvasPosition.y + 3) = v45;
    }
  }
  double v46 = v35 + v40;
  double v47 = v36 + v41;
  if (BYTE5(self->mAcumulatedDrag.x))
  {
    double v48 = *(double *)((char *)&self->mResizeControlPoints[1].x + 3);
    double v49 = *(double *)((char *)&self->mResizeControlPoints[1].y + 3);
  }
  else
  {
    double v48 = v46;
    double v49 = v47;
    if (v12)
    {
      [(CRLConnectionLineAbstractLayout *)self p_getPositionForMagnet:[(CRLConnectionLineAbstractLayout *)self headMagnetType] forLayout:v12 forEnd:11];
      double v48 = v50;
      double v49 = v51;
      *(double *)((char *)&self->mTailMagnetNormalizedPosition.x + 3) = v50;
      *(double *)((char *)&self->mTailMagnetNormalizedPosition.y + 3) = v51;
    }
  }
  if (![(CRLConnectionLineAbstractLayout *)self canEndpointsCoincide]
    && sub_100064084(v42, v43, v48, v49)
    || (sub_100067C90() & 1) != 0
    || sub_100067C90())
  {
    BYTE5(self->mOldConnectedFrom) = 0;
    BYTE4(self->mOldConnectedFrom) = 0;
    objc_storeStrong((id *)((char *)&self->mOriginalPathSource + 3), v27);
    v52 = (CRLBezierPath *)[v24 copy];
    v53 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
    *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = v52;

    uint64_t v54 = +[CRLBezierPath bezierPath];
    v55 = *(void **)(&self->super.mOkayToSetGeometry + 3);
    *(void *)(&self->super.mOkayToSetGeometry + 3) = v54;

    double y = CGPointZero.y;
    [*(id *)(&self->super.mOkayToSetGeometry + 3) moveToPoint:CGPointZero.x, y];
    [*(id *)(&self->super.mOkayToSetGeometry + 3) lineToPoint:CGPointZero.x, y];
  }
  else
  {
    BYTE5(self->mOldConnectedFrom) = 1;
    double v94 = v42;
    double v95 = v43;
    if (BYTE4(self->mAcumulatedDrag.x))
    {
      long long v96 = *(long long *)((char *)self->mResizeControlPoints + 3);
    }
    else
    {
      -[CRLConnectionLineAbstractLayout controlPointForPointA:pointB:andOriginalA:originalB:](self, "controlPointForPointA:pointB:andOriginalA:originalB:", v42, v43, v48, v49, v38, v39, v46, v47);
      *(void *)&long long v96 = v57;
      *((void *)&v96 + 1) = v58;
    }
    double v97 = v48;
    double v98 = v49;
    v59 = [(CRLConnectionLineAbstractLayout *)self createConnectedPathFrom:v7 to:v12 withControlPoints:&v94 clipPath:1];
    id v82 = v7;
    uint64_t v81 = [(CRLConnectionLineAbstractLayout *)self createConnectedPathFrom:v7 to:v12 withControlPoints:&v94 clipPath:0];
    [v59 bounds];
    v64 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v60, v61, v62, v63);
    v65 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3) = (CRLConnectionLinePathSource *)v64;

    id v66 = +[CRLBezierPath bezierPath];
    [v66 moveToPoint:v94, v95];
    [v66 lineToPoint:v96];
    [v66 lineToPoint:v97, v98];
    id v67 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    if (v67) {
      [v67 transform];
    }
    else {
      memset(&v87, 0, sizeof(v87));
    }
    CGAffineTransformInvert(&v88, &v87);
    [v66 transformUsingAffineTransform:&v88];
    v68 = (CRLBezierPath *)[objc_alloc((Class)(p_cache + 198)) initWithBezierPath:v66];
    v69 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
    *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = v68;

    [*(id *)((char *)&self->mUnclippedBezierPath + 3) setType:[v24 type]];
    [v24 outsetFrom];
    [*(id *)((char *)&self->mUnclippedBezierPath + 3) setOutsetFrom:];
    [v24 outsetTo];
    [*(id *)((char *)&self->mUnclippedBezierPath + 3) setOutsetTo:];
    v70 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", *(void *)&self->mDrawClippedTailPortion, *(double *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3), *(double *)((char *)&self->mTailNearestMagnetTypeForRouting + 3));
    [*(id *)((char *)&self->mUnclippedBezierPath + 3) setHeadMagnet:v70];

    v71 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", *(void *)&self->mUserDidSetControlPoint, *(double *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3), *(double *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3));
    [*(id *)((char *)&self->mUnclippedBezierPath + 3) setTailMagnet:v71];

    [*(id *)((char *)&self->mUnclippedBezierPath + 3) setUserDidSetControlPoint:BYTE6(self->mDynamicOutsetType)];
    uint64_t v72 = *(void *)&self->mDrawClippedTailPortion;
    if (v72)
    {
      v73 = v59;
      if (v72 != 1) {
        LOBYTE(v72) = 0;
      }
      BYTE3(self->mDynamicOutsetTo) = v72;
    }
    else
    {
      v74 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
      BYTE3(self->mDynamicOutsetTo) = v74 != 0;

      v73 = v59;
    }
    uint64_t v75 = *(void *)&self->mUserDidSetControlPoint;
    if (v75)
    {
      v76 = (NSArray *)v81;
      if (v75 != 1) {
        LOBYTE(v75) = 0;
      }
      BYTE4(self->mDynamicOutsetTo) = v75;
    }
    else
    {
      v77 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
      BYTE4(self->mDynamicOutsetTo) = v77 != 0;

      v76 = (NSArray *)v81;
    }
    v78 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    if (v78) {
      [v78 transform];
    }
    else {
      memset(&v85, 0, sizeof(v85));
    }
    CGAffineTransformInvert(&v86, &v85);
    [v73 transformUsingAffineTransform:&v86];
    objc_storeStrong((id *)(&self->super.mOkayToSetGeometry + 3), v73);
    v79 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
    if (v79) {
      [v79 transform];
    }
    else {
      memset(&v83, 0, sizeof(v83));
    }
    id v7 = v82;
    CGAffineTransformInvert(&v84, &v83);
    [(NSArray *)v76 transformUsingAffineTransform:&v84];
    v80 = *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3);
    *(NSArray **)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3) = v76;
  }
}

- (BOOL)isInvisible
{
  return !BYTE3(self->mOldConnectedFrom) || BYTE4(self->mOldConnectedFrom) == 0;
}

- (BOOL)i_visibleLine
{
  return BYTE4(self->mOldConnectedFrom);
}

- (void)i_setVisibleLine:(BOOL)a3
{
  BYTE4(self->mOldConnectedFrom) = a3;
}

- (BOOL)canEndpointsCoincide
{
  return 0;
}

- (BOOL)canBeIntersected
{
  return 0;
}

- (BOOL)canResetTextAndObjectHandles
{
  return 0;
}

- (CRLConnectionLinePathSource)connectedPathSource
{
  objc_super v3 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
  if (!v3 || !BYTE3(self->mOldConnectedFrom))
  {
    [(CRLConnectionLineAbstractLayout *)self updateConnectedPath];
    objc_super v3 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
  }

  return (CRLConnectionLinePathSource *)v3;
}

- (id)pathSource
{
  [(CRLConnectionLineAbstractLayout *)self checkConnections];

  return [(CRLConnectionLineAbstractLayout *)self connectedPathSource];
}

- (id)layoutInfoGeometry
{
  objc_super v3 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
  if (!v3 || !BYTE3(self->mOldConnectedFrom))
  {
    [(CRLConnectionLineAbstractLayout *)self updateConnectedPath];
    objc_super v3 = *(CRLConnectionLinePathSource **)((char *)&self->mOriginalPathSource + 3);
  }

  return v3;
}

- (CGRect)boundsForStandardKnobs
{
  objc_super v3 = [(CRLConnectionLineAbstractLayout *)self path];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  [(CRLShapeLayout *)self pathBounds];
  double v13 = -v12;
  double v15 = -v14;
  uint64_t v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v9;
  uint64_t v19 = v11;

  return CGRectOffset(*(CGRect *)&v16, v13, v15);
}

- (void)invalidatePath
{
  v5.receiver = self;
  v5.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLShapeLayout *)&v5 invalidatePath];
  [(CRLBoardItemLayout *)self invalidate];
  if (![(CRLCanvasLayout *)self isPositionInvalid]) {
    [(CRLConnectionLineAbstractLayout *)self invalidatePosition];
  }
  objc_super v3 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
  *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = 0;

  uint64_t v4 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  *(void *)(&self->super.mOkayToSetGeometry + 3) = 0;
}

- (BOOL)pathIsLineSegment
{
  return 1;
}

- (BOOL)pathIsOpen
{
  return 1;
}

- (CGRect)frameForMiniFormatterPositioning
{
  if (*(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3)) {
    BOOL v3 = *(_DWORD *)((char *)&self->super.mCachedPathBoundsStruct.originalCachedRect.size.width + 3) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  v17.receiver = self;
  v17.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLCanvasLayout *)&v17 frameForMiniFormatterPositioning];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (v3)
  {
    double v12 = *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3);
    *(CRLBezierPath **)((char *)&self->mUnclippedBezierPath + 3) = 0;

    *(_DWORD *)((char *)&self->super.mCachedPathBoundsStruct.originalCachedRect.size.width + 3) = 0;
  }
  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (id)path
{
  BOOL v3 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  if (!v3 || !BYTE3(self->mOldConnectedFrom))
  {
    [(CRLConnectionLineAbstractLayout *)self updateConnectedPath];
    BOOL v3 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  }

  return v3;
}

- (CGPoint)unclippedHeadPoint
{
  [(CRLConnectionLineAbstractLayout *)self checkConnections];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  if (WeakRetained)
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v4 = [(CRLConnectionLineAbstractLayout *)self connectedPathSource];
    double v5 = [v4 bezierPath];
    [v5 getStartPoint:&v8 andEndPoint:&v10];

    double v6 = v10;
    double v7 = v11;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLConnectionLineAbstractLayout;
    [(CRLShapeLayout *)&v9 unclippedHeadPoint];
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)unclippedTailPoint
{
  [(CRLConnectionLineAbstractLayout *)self checkConnections];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  if (WeakRetained)
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v4 = [(CRLConnectionLineAbstractLayout *)self connectedPathSource];
    double v5 = [v4 bezierPath];
    [v5 getStartPoint:&v10 andEndPoint:&v8];

    double v6 = v10;
    double v7 = v11;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLConnectionLineAbstractLayout;
    [(CRLShapeLayout *)&v9 unclippedTailPoint];
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)shouldDisplayGuides
{
  [(CRLConnectionLineAbstractLayout *)self checkConnections];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  if (WeakRetained)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (id)i_originalPathSource
{
  return *(id *)((char *)&self->mClippedBezierPath + 3);
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLShapeLayout *)&v28 beginDynamicOperationWithRealTimeCommands:a3];
  BOOL v4 = [(CRLConnectionLineAbstractLayout *)self pathSource];
  id v5 = (CRLBezierPath *)[v4 copy];
  double v6 = *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3);
  *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3) = v5;

  double v7 = [(CRLConnectionLineAbstractLayout *)self pathSource];
  uint64_t v8 = (CRLEditableBezierPathSource *)[v7 copy];
  objc_super v9 = *(CRLEditableBezierPathSource **)((char *)&self->super.mCachedEditableBezierPathSource + 3);
  *(CRLEditableBezierPathSource **)((char *)&self->super.mCachedEditableBezierPathSource + 3) = v8;

  double v10 = [(CRLConnectionLineAbstractLayout *)self layoutInfoGeometry];
  double v11 = *(CRLPKStrokePathCompactData **)((char *)&self->super.mDynamicPencilKitStrokePathCompactData + 3);
  *(CRLPKStrokePathCompactData **)((char *)&self->super.mDynamicPencilKitStrokePathCompactData + 3) = v10;

  id WeakRetained = (CRLBezierPath *)objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));
  double v13 = *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3) = WeakRetained;

  double v14 = (CRLBezierPath *)objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
  double v15 = *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3) = v14;

  *(CGPoint *)((char *)&self->mLooseEndPosition + 3) = CGPointZero;
  double v16 = (double *)((char *)&self->mOldConnectedTo + 3);
  id v17 = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
  if (v17) {
    [(CRLConnectionLineAbstractLayout *)self unclippedTailPoint];
  }
  else {
    [(CRLConnectionLineAbstractLayout *)self unclippedHeadPoint];
  }
  *(void *)double v16 = v18;
  *(void *)(&self->mValidLine + 1) = v19;

  id v20 = [(CRLCanvasLayout *)self pureGeometry];
  id v21 = v20;
  if (v20)
  {
    [v20 transform];
    float64x2_t v22 = v25;
    float64x2_t v23 = v26;
    float64x2_t v24 = v27;
  }
  else
  {
    float64x2_t v24 = 0uLL;
    float64x2_t v22 = 0uLL;
    float64x2_t v23 = 0uLL;
  }
  *(float64x2_t *)double v16 = vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, *(double *)(&self->mValidLine + 1)), v22, *v16));

  *(_WORD *)((char *)&self->mAcumulatedDrag.x + 3) = 0;
  BYTE5(self->mAcumulatedDrag.x) = 0;
}

- (void)endDynamicOperation
{
  v6.receiver = self;
  v6.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLShapeLayout *)&v6 endDynamicOperation];
  BOOL v3 = *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3);
  *(CRLBezierPath **)((char *)&self->mClippedBezierPath + 3) = 0;

  BOOL v4 = *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedFromOutsetWrapPath + 3) = 0;

  id v5 = *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3);
  *(CRLBezierPath **)((char *)&self->mCachedToOutsetWrapPath + 3) = 0;

  *(_WORD *)((char *)&self->mAcumulatedDrag.x + 3) = 0;
  BYTE5(self->mAcumulatedDrag.x) = 0;
}

- (CGPoint)i_accumulatedDrag
{
  double v2 = *(double *)((char *)&self->mLooseEndPosition.x + 3);
  double v3 = *(double *)((char *)&self->mLooseEndPosition.y + 3);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)pauseDynamicTransformation
{
  v24.receiver = self;
  v24.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLCanvasLayout *)&v24 pauseDynamicTransformation];
  if ([(CRLCanvasLayout *)self layoutState] == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));
    if (WeakRetained) {
      [(CRLConnectionLineAbstractLayout *)self unclippedTailPoint];
    }
    else {
      [(CRLConnectionLineAbstractLayout *)self unclippedHeadPoint];
    }
    long long v16 = v5;
    long long v17 = v4;

    objc_super v6 = [(CRLCanvasLayout *)self pureGeometry];
    double v7 = v6;
    if (v6)
    {
      [v6 transform:v16, v17];
      float64x2_t v8 = v21;
      float64x2_t v9 = v22;
      float64x2_t v10 = v23;
    }
    else
    {
      float64x2_t v10 = 0uLL;
      float64x2_t v22 = 0u;
      float64x2_t v23 = 0u;
      float64x2_t v21 = 0u;
      float64x2_t v8 = 0uLL;
      float64x2_t v9 = 0uLL;
    }
    float64x2_t v18 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, *(double *)&v16), v8, *(double *)&v17));

    double v11 = sub_100064680(v18.f64[0], v18.f64[1], *(double *)((char *)&self->mOldConnectedTo + 3));
    *(double *)((char *)&self->mLooseEndPosition.x + 3) = v11;
    *(CGFloat *)((char *)&self->mLooseEndPosition.y + 3) = v12;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeTranslation(&v20, v11, v12);
    double v13 = *(CRLPKStrokePathCompactData **)((char *)&self->super.mDynamicPencilKitStrokePathCompactData + 3);
    CGAffineTransform v19 = v20;
    double v14 = [v13 geometryByAppendingTransform:&v19];
    double v15 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3) = v14;
  }
}

- (CGSize)minimumSize
{
  uint64_t v3 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  if (v3
    && (long long v4 = (void *)v3,
        [(CRLConnectionLineAbstractLayout *)self connectedFrom],
        long long v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLConnectionLineAbstractLayout;
    [(CRLShapeLayout *)&v17 minimumSize];
    double width = v8;
    double height = v9;
  }
  float64x2_t v10 = [(CRLCanvasLayout *)self pureGeometry];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  double v15 = fmin(width, v12);
  double v16 = fmin(height, v14);
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (BOOL)hasControlKnobsInStraightLine
{
  uint64_t v3 = objc_opt_class();
  long long v4 = [(CRLConnectionLineAbstractLayout *)self pathSource];
  long long v5 = sub_1002469D0(v3, v4);

  [v5 getControlKnobPosition:10];
  double v7 = v6;
  double v9 = v8;
  [v5 getControlKnobPosition:12];
  double v11 = v10;
  double v13 = v12;
  [v5 getControlKnobPosition:11];
  double v15 = v14;
  double v17 = v16;
  if (sub_100064374(v7, v9, v11, v13, v14, v16))
  {
    double v18 = sub_1000646A4(v7, v9, 0.25);
    double v19 = sub_100064680(v11, v13, v18);
    double v21 = v20;
    double v22 = sub_1000646A4(v15, v17, 0.25);
    double v23 = sub_100064680(v19, v21, v22);
    double v25 = sub_1000646A4(v23, v24, 2.0);
    double v27 = v26;
    double v28 = sub_100064680(v7, v9, v25);
    double v30 = v29;
    double v31 = sub_100064680(v25, v27, v15);
    BOOL v33 = sub_10006468C(v28, v30, v31, v32) > 0.0;
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

- (BOOL)isStraightLine
{
  if (![(CRLConnectionLineAbstractLayout *)self hasControlKnobsInStraightLine]) {
    return 0;
  }
  uint64_t v3 = objc_opt_class();
  long long v4 = [(CRLConnectionLineAbstractLayout *)self pathSource];
  long long v5 = sub_1002469D0(v3, v4);

  if ([v5 type] == (id)1)
  {
    [v5 getControlKnobPosition:10];
    double v7 = v6;
    double v9 = v8;
    [v5 getControlKnobPosition:11];
    BOOL v12 = 1;
    if (v7 != v10 && vabdd_f64(v7, v10) >= 0.00999999978) {
      BOOL v12 = vabdd_f64(v9, v11) < 0.00999999978 || v9 == v11;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (int64_t)connectionType
{
  uint64_t v3 = objc_opt_class();
  long long v4 = [(CRLConnectionLineAbstractLayout *)self pathSource];
  long long v5 = sub_1002469D0(v3, v4);

  id v6 = [v5 type];
  if (v6 == (id)1)
  {
    int64_t v7 = 2;
  }
  else if (v6)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(CRLConnectionLineAbstractLayout *)self hasControlKnobsInStraightLine] ^ 1;
  }

  return v7;
}

+ (id)localizedDescriptionForConnectionType:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    long long v4 = v3;
    CFStringRef v5 = @"Corner";
  }
  else if (a3 == 1)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    long long v4 = v3;
    CFStringRef v5 = @"Curve";
  }
  else
  {
    uint64_t v3 = +[NSBundle mainBundle];
    long long v4 = v3;
    CFStringRef v5 = @"Straight";
  }
  id v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (id)commandForSettingConnectionType:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = [(CRLConnectionLineAbstractLayout *)self pathSource];
  int64_t v7 = sub_1002469D0(v5, v6);

  if (!v7)
  {
    double v17 = 0;
    goto LABEL_12;
  }
  id v8 = [v7 copy];
  double v9 = v8;
  switch(a3)
  {
    case 2:
      [v8 setType:1];
      [(CRLConnectionLineAbstractLayout *)self getControlKnobPosition:12];
      goto LABEL_8;
    case 1:
      [v8 setType:0];
      if ([(CRLConnectionLineAbstractLayout *)self hasControlKnobsInStraightLine]) {
        [v9 bend];
      }
      break;
    case 0:
      [v8 setType:0];
      [v7 getControlKnobPosition:10];
      double v11 = v10;
      double v13 = v12;
      [v7 getControlKnobPosition:11];
      double v16 = sub_100065E00(v11, v13, v14, v15, 0.5);
LABEL_8:
      [v9 setControlKnobPosition:12 toPoint:v16];
      break;
  }
  double v17 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  double v18 = +[NSBundle mainBundle];
  double v19 = [v18 localizedStringForKey:@"Set Connection Line Type" value:0 table:@"UndoStrings"];
  [(CRLCommandGroup *)v17 setActionString:v19];

  double v20 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
  double v21 = [(CRLShapeLayout *)self shapeInfo];
  double v22 = [(CRLCommandSetPathSource *)v20 initWithShapeItem:v21 pathSource:v9];

  double v23 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
  double v24 = [(CRLBoardItemLayout *)self boardItem];
  double v25 = [(CRLConnectionLineAbstractLayout *)self layoutInfoGeometry];
  double v26 = [(CRLCommandSetInfoGeometry *)v23 initWithBoardItem:v24 geometry:v25];

  v29[0] = v22;
  v29[1] = v26;
  double v27 = +[NSArray arrayWithObjects:v29 count:2];
  [(CRLCommandGroup *)v17 addCommands:v27];

LABEL_12:

  return v17;
}

- (id)commandToToggleConnectionType
{
  uint64_t v3 = [(CRLConnectionLineAbstractLayout *)self connectionLineInfo];
  long long v4 = [v3 pathSource];
  id v5 = [v4 type];
  if (v5 == (id)1)
  {
    uint64_t v6 = [(CRLConnectionLineAbstractLayout *)self hasControlKnobsInStraightLine] ^ 1;
  }
  else if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 2;
  }
  int64_t v7 = [(CRLConnectionLineAbstractLayout *)self commandForSettingConnectionType:v6];

  return v7;
}

- (void)beginDynamicOutsetChange
{
  [(CRLConnectionLineAbstractLayout *)self beginDynamicOperationWithRealTimeCommands:0];
  uint64_t v3 = objc_opt_class();
  long long v4 = [(CRLShapeLayout *)self shapeInfo];
  id v5 = [v4 pathSource];
  sub_1002469D0(v3, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(CRLConnectionLineAbstractLayout *)self setUseDynamicOutsets:1];
  [v6 outsetFrom];
  -[CRLConnectionLineAbstractLayout setDynamicOutsetFrom:](self, "setDynamicOutsetFrom:");
  [v6 outsetTo];
  -[CRLConnectionLineAbstractLayout setDynamicOutsetTo:](self, "setDynamicOutsetTo:");
}

- (void)endDynamicOutsetChange
{
  [(CRLConnectionLineAbstractLayout *)self endDynamicOperation];
  [(CRLConnectionLineAbstractLayout *)self setUseDynamicOutsets:0];
  uint64_t v3 = [(CRLCanvasLayout *)self layoutController];
  long long v4 = [v3 canvas];
  id v17 = [v4 canvasController];

  uint64_t v5 = objc_opt_class();
  id v6 = [(CRLShapeLayout *)self shapeInfo];
  int64_t v7 = [v6 pathSource];
  id v8 = sub_1002469D0(v5, v7);

  id v9 = [v8 copy];
  [(CRLConnectionLineAbstractLayout *)self dynamicOutsetFrom];
  [v9 setOutsetFrom:];
  [(CRLConnectionLineAbstractLayout *)self dynamicOutsetTo];
  [v9 setOutsetTo:];
  double v10 = [v17 commandController];
  double v11 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  double v12 = +[NSBundle mainBundle];
  double v13 = [v12 localizedStringForKey:@"Offset Setting" value:0 table:@"UndoStrings"];
  [(CRLCommandGroup *)v11 setActionString:v13];

  double v14 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
  double v15 = [(CRLShapeLayout *)self shapeInfo];
  double v16 = [(CRLCommandSetPathSource *)v14 initWithShapeItem:v15 pathSource:v9];

  [(CRLCommandGroup *)v11 addCommand:v16];
  [v10 enqueueCommand:v11];
}

- (BOOL)i_shouldTryToScaleCachedRectsDuringResize
{
  return 0;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLShapeLayout *)&v8 takeSizeFromTracker:v4];
  if (v4)
  {
    [v4 transformForLayout:self];
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
  }
  -[CRLConnectionLineAbstractLayout p_resizeWithTransform:preservingAspectRatio:](self, "p_resizeWithTransform:preservingAspectRatio:", &v5, [v4 currentlyPreservingAspectRatio:v5, v6, v7]);
}

- (void)p_resizeWithTransform:(CGAffineTransform *)a3 preservingAspectRatio:(BOOL)a4
{
  double v62 = 0.0;
  double v63 = 0.0;
  double v60 = 0.0;
  double v61 = 0.0;
  long long v7 = [*(id *)((char *)&self->mClippedBezierPath + 3) bezierPath];
  [v7 getStartPoint:&v60 andEndPoint:&v62];

  [*(id *)((char *)&self->mClippedBezierPath + 3) getControlKnobPosition:12];
  double b = a3->b;
  double c = a3->c;
  double d = a3->d;
  tdouble x = a3->tx;
  tdouble y = a3->ty;
  double v45 = ty + v63 * d + b * v62;
  double v46 = tx + v63 * c + a3->a * v62;
  double v43 = ty + d * v61 + b * v60;
  double v44 = tx + c * v61 + a3->a * v60;
  double v47 = ty + v13 * d + b * v14;
  double v48 = tx + v13 * c + a3->a * v14;
  double v15 = +[CRLBezierPath bezierPath];
  [v15 moveToPoint:v44, v43];
  [v15 lineToPoint:v48, v47];
  [v15 lineToPoint:v46, v45];
  if (!a4)
  {
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    if (!sub_100064084(v16, v18, CGPointZero.x, CGPointZero.y))
    {
      CGFloat v20 = -v17;
      CGFloat v21 = -v19;
      CGAffineTransformMakeTranslation(&v59, v20, v21);
      [v15 transformUsingAffineTransform:&v59];
      double v22 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
      CGAffineTransformMakeTranslation(&v58, v20, v21);
      double v23 = [v22 geometryByAppendingTransform:&v58];
      double v24 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
      *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3) = v23;
    }
  }
  double v25 = [[CRLConnectionLinePathSource alloc] initWithBezierPath:v15];
  -[CRLConnectionLinePathSource setType:](v25, "setType:", [*(id *)((char *)&self->mClippedBezierPath + 3) type]);
  objc_storeStrong((id *)((char *)&self->super.mCachedEditableBezierPathSource + 3), v25);
  double v26 = [(CRLConnectionLineAbstractLayout *)self connectedFromInfo];

  if (!v26)
  {
    BYTE3(self->mAcumulatedDrag.x) = 1;
    double v27 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    if (v27)
    {
      [v27 transform];
      float64x2_t v28 = v55;
      float64x2_t v29 = v56;
      float64x2_t v30 = v57;
    }
    else
    {
      float64x2_t v30 = 0uLL;
      float64x2_t v28 = 0uLL;
      float64x2_t v29 = 0uLL;
    }
    *(float64x2_t *)((char *)&self->mAcumulatedDrag.y + 3) = vaddq_f64(v30, vmlaq_n_f64(vmulq_n_f64(v29, v43), v28, v44));
  }
  uint64_t v31 = [(CRLConnectionLineAbstractLayout *)self connectedFromInfo];
  if (!v31
    || (double v32 = (void *)v31,
        [(CRLConnectionLineAbstractLayout *)self connectedToInfo],
        BOOL v33 = objc_claimAutoreleasedReturnValue(),
        v33,
        v32,
        !v33))
  {
    BYTE4(self->mAcumulatedDrag.x) = 1;
    double v34 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    if (v34)
    {
      [v34 transform];
      float64x2_t v35 = v52;
      float64x2_t v36 = v53;
      float64x2_t v37 = v54;
    }
    else
    {
      float64x2_t v37 = 0uLL;
      float64x2_t v35 = 0uLL;
      float64x2_t v36 = 0uLL;
    }
    *(float64x2_t *)((char *)self->mResizeControlPoints + 3) = vaddq_f64(v37, vmlaq_n_f64(vmulq_n_f64(v36, v47), v35, v48));
  }
  double v38 = [(CRLConnectionLineAbstractLayout *)self connectedToInfo];

  if (!v38)
  {
    BYTE5(self->mAcumulatedDrag.x) = 1;
    double v39 = *(CRLPathSource **)((char *)&self->super.mCachedPathSource + 3);
    if (v39)
    {
      [v39 transform];
      float64x2_t v40 = v49;
      float64x2_t v41 = v50;
      float64x2_t v42 = v51;
    }
    else
    {
      float64x2_t v42 = 0uLL;
      float64x2_t v40 = 0uLL;
      float64x2_t v41 = 0uLL;
    }
    *(float64x2_t *)((char *)&self->mResizeControlPoints[1] + 3) = vaddq_f64(v42, vmlaq_n_f64(vmulq_n_f64(v41, v45), v40, v46));
  }
  [(CRLConnectionLineAbstractLayout *)self invalidatePath];
  [(CRLShapeLayout *)self invalidateFrame];
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRLConnectionLineAbstractLayout;
  [(CRLShapeLayout *)&v3 takeFreeTransformFromTracker:a3];
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  id v4 = [(CRLConnectionLineAbstractLayout *)self connectedPathSource];
  [v4 getControlKnobPosition:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v23.receiver = self;
  v23.super_class = (Class)CRLConnectionLineAbstractLayout;
  id v7 = a4;
  -[CRLShapeLayout dynamicallyMovedSmartShapeKnobTo:withTracker:](&v23, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v7, x, y);
  double v8 = [(CRLCanvasLayout *)self originalGeometry];
  double v9 = v8;
  if (v8)
  {
    [v8 transform];
    double v11 = *((double *)&v20 + 1);
    double v10 = *(double *)&v20;
    double v13 = *((double *)&v21 + 1);
    double v12 = *(double *)&v21;
    double v15 = *((double *)&v22 + 1);
    double v14 = *(double *)&v22;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    double v15 = 0.0;
    double v13 = 0.0;
    double v11 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
  }
  double v16 = v14 + y * v12 + v10 * x;

  double v17 = [v7 knob];

  id v18 = [v17 tag];
  if (v18 == (id)10)
  {
    BYTE3(self->mAcumulatedDrag.x) = 1;
    *(double *)((char *)&self->mAcumulatedDrag.y + 3) = v16;
    double v19 = (double *)&self->mUseResizePoints[3];
    goto LABEL_10;
  }
  if (v18 == (id)12)
  {
    BYTE4(self->mAcumulatedDrag.x) = 1;
    *(double *)((char *)&self->mResizeControlPoints[0].x + 3) = v16;
    double v19 = (double *)((char *)&self->mResizeControlPoints[0].y + 3);
    goto LABEL_10;
  }
  if (v18 == (id)11)
  {
    BYTE5(self->mAcumulatedDrag.x) = 1;
    *(double *)((char *)&self->mResizeControlPoints[1].x + 3) = v16;
    double v19 = (double *)((char *)&self->mResizeControlPoints[1].y + 3);
LABEL_10:
    *double v19 = v15 + y * v13 + v11 * x;
  }
  [(CRLConnectionLineAbstractLayout *)self updateConnectedPath];
  [(CRLConnectionLineAbstractLayout *)self invalidatePosition];
}

- (BOOL)shouldAdjustForStrokeWidthForCollabCursor
{
  return 0;
}

- (id)p_infoForConnectingToInfo:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLCanvasLayout *)self layoutController];
  double v6 = [v5 canvas];

  id v7 = [v6 delegate];
  double v14 = sub_100246AC8(v7, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLConnectedInfoReplacing);

  double v15 = v4;
  if (v14)
  {
    double v15 = [v14 infoToConnectToForConnectionLineConnectedToInfo:v4];
  }

  return v15;
}

- (CGPoint)p_getPositionForMagnet:(unint64_t)a3 forLayout:(id)a4 forEnd:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = v8;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      [v8 centerForConnecting];
      goto LABEL_12;
    case 2uLL:
      [v8 cardinalNorthPosition];
      goto LABEL_12;
    case 3uLL:
      [v8 cardinalEastPosition];
      goto LABEL_12;
    case 4uLL:
      [v8 cardinalSouthPosition];
      goto LABEL_12;
    case 5uLL:
      [v8 cardinalWestPosition];
LABEL_12:
      double v18 = v10;
      double v17 = v11;
      goto LABEL_22;
    case 6uLL:
    case 7uLL:
      uint64_t v12 = &OBJC_IVAR___CRLConnectionLineAbstractLayout_mHeadMagnetNormalizedPosition;
      if (a5 == 10) {
        uint64_t v12 = &OBJC_IVAR___CRLConnectionLineAbstractLayout_mTailMagnetNormalizedPosition;
      }
      uint64_t v13 = (double *)((char *)self + *v12);
      double v14 = *v13;
      double v15 = v13[1];
      if (a5 == 10)
      {
        uint64_t v16 = 1533;
      }
      else
      {
        if (a5 != 11) {
          goto LABEL_18;
        }
        uint64_t v16 = 1532;
      }
      if (*((unsigned char *)&self->super.super.super.super.super.super.isa + v16))
      {
        double v19 = [v8 geometry];
        long long v20 = v19;
        if (v19)
        {
          [v19 fullTransform];
          double v21 = v37;
          double v22 = v36;
          double v23 = v39;
          double v24 = v38;
          double v25 = v41;
          double v26 = v40;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
LABEL_18:
      double v27 = [v8 pureGeometry];
      long long v20 = v27;
      if (v27)
      {
        [v27 fullTransform];
        double v21 = v31;
        double v22 = v30;
        double v23 = v33;
        double v24 = v32;
        double v25 = v35;
        double v26 = v34;
        goto LABEL_21;
      }
LABEL_20:
      double v25 = 0.0;
      double v23 = 0.0;
      double v21 = 0.0;
      double v26 = 0.0;
      double v24 = 0.0;
      double v22 = 0.0;
LABEL_21:
      double v18 = v26 + v15 * v24 + v22 * v14;
      double v17 = v25 + v15 * v23 + v21 * v14;

LABEL_22:
      double v28 = v18;
      double v29 = v17;
      result.double y = v29;
      result.double x = v28;
      return result;
    default:
      double v17 = 0.0;
      double v18 = 0.0;
      goto LABEL_22;
  }
}

- (CRLCanvasLayout)connectedFrom
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedPathSource + 3));

  return (CRLCanvasLayout *)WeakRetained;
}

- (CRLCanvasLayout)connectedTo
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedInfoGeometry + 3));

  return (CRLCanvasLayout *)WeakRetained;
}

- (CRLCanvasElementInfo)connectedFromInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedFrom + 3));

  return (CRLCanvasElementInfo *)WeakRetained;
}

- (void)setConnectedFromInfo:(id)a3
{
}

- (CRLCanvasElementInfo)connectedToInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedTo + 3));

  return (CRLCanvasElementInfo *)WeakRetained;
}

- (void)setConnectedToInfo:(id)a3
{
}

- (CRLCanvasElementInfo)temporaryConnectedFromInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedFromInfo + 3));

  return (CRLCanvasElementInfo *)WeakRetained;
}

- (CRLCanvasElementInfo)temporaryConnectedToInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mConnectedToInfo + 3));

  return (CRLCanvasElementInfo *)WeakRetained;
}

- (BOOL)validLine
{
  return BYTE5(self->mOldConnectedFrom);
}

- (BOOL)useDynamicOutsets
{
  return BYTE3(self->mResizeControlPoints[2].x);
}

- (void)setUseDynamicOutsets:(BOOL)a3
{
  BYTE3(self->mResizeControlPoints[2].x) = a3;
}

- (double)dynamicOutsetFrom
{
  return *(double *)((char *)&self->mResizeControlPoints[2].y + 3);
}

- (void)setDynamicOutsetFrom:(double)a3
{
  *(double *)((char *)&self->mResizeControlPoints[2].y + 3) = a3;
}

- (double)dynamicOutsetTo
{
  return *(double *)(&self->mUseDynamicOutsets + 3);
}

- (void)setDynamicOutsetTo:(double)a3
{
  *(double *)(&self->mUseDynamicOutsets + 3) = a3;
}

- (unint64_t)dynamicOutsetType
{
  return *(void *)((char *)&self->mDynamicOutsetFrom + 3);
}

- (void)setDynamicOutsetType:(unint64_t)a3
{
  *(void *)((char *)&self->mDynamicOutsetFrom + 3) = a3;
}

- (unint64_t)headMagnetType
{
  return *(void *)&self->mDrawClippedTailPortion;
}

- (void)setHeadMagnetType:(unint64_t)a3
{
  *(void *)&self->mDrawClippedTailPortion = a3;
}

- (unint64_t)tailMagnetType
{
  return *(void *)&self->mUserDidSetControlPoint;
}

- (void)setTailMagnetType:(unint64_t)a3
{
  *(void *)&self->mUserDidSetControlPoint = a3;
}

- (CGPoint)headMagnetNormalizedPosition
{
  double v2 = *(double *)((char *)&self->mHeadNearestMagnetTypeForRouting + 3);
  double v3 = *(double *)((char *)&self->mTailNearestMagnetTypeForRouting + 3);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)tailMagnetNormalizedPosition
{
  double v2 = *(double *)((char *)&self->mHeadMagnetNormalizedPosition.x + 3);
  double v3 = *(double *)((char *)&self->mHeadMagnetNormalizedPosition.y + 3);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)headMagnetCanvasPosition
{
  double v2 = *(double *)((char *)&self->mTailMagnetNormalizedPosition.x + 3);
  double v3 = *(double *)((char *)&self->mTailMagnetNormalizedPosition.y + 3);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)tailMagnetCanvasPosition
{
  double v2 = *(double *)((char *)&self->mHeadMagnetCanvasPosition.x + 3);
  double v3 = *(double *)((char *)&self->mHeadMagnetCanvasPosition.y + 3);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)clipHead
{
  return BYTE3(self->mDynamicOutsetTo);
}

- (void)setClipHead:(BOOL)a3
{
  BYTE3(self->mDynamicOutsetTo) = a3;
}

- (BOOL)clipTail
{
  return BYTE4(self->mDynamicOutsetTo);
}

- (void)setClipTail:(BOOL)a3
{
  BYTE4(self->mDynamicOutsetTo) = a3;
}

- (double)headClipT
{
  return *(double *)((char *)&self->mHeadMagnetType + 3);
}

- (void)setHeadClipT:(double)a3
{
  *(double *)((char *)&self->mHeadMagnetType + 3) = a3;
}

- (double)tailClipT
{
  return *(double *)((char *)&self->mTailMagnetType + 3);
}

- (void)setTailClipT:(double)a3
{
  *(double *)((char *)&self->mTailMagnetType + 3) = a3;
}

- (BOOL)drawClippedHeadPortion
{
  return BYTE5(self->mDynamicOutsetTo);
}

- (void)setDrawClippedHeadPortion:(BOOL)a3
{
  BYTE5(self->mDynamicOutsetTo) = a3;
}

- (BOOL)drawClippedTailPortion
{
  return BYTE6(self->mDynamicOutsetTo);
}

- (void)setDrawClippedTailPortion:(BOOL)a3
{
  BYTE6(self->mDynamicOutsetTo) = a3;
}

- (BOOL)magnetsAdjusted
{
  return HIBYTE(self->mDynamicOutsetTo);
}

- (void)setMagnetsAdjusted:(BOOL)a3
{
  HIBYTE(self->mDynamicOutsetTo) = a3;
}

- (BOOL)headHasHorizontalFlip
{
  return self->mDynamicOutsetType;
}

- (void)setHeadHasHorizontalFlip:(BOOL)a3
{
  LOBYTE(self->mDynamicOutsetType) = a3;
}

- (BOOL)headHasVerticalFlip
{
  return BYTE1(self->mDynamicOutsetType);
}

- (void)setHeadHasVerticalFlip:(BOOL)a3
{
  BYTE1(self->mDynamicOutsetType) = a3;
}

- (BOOL)tailHasHorizontalFlip
{
  return BYTE2(self->mDynamicOutsetType);
}

- (void)setTailHasHorizontalFlip:(BOOL)a3
{
  BYTE2(self->mDynamicOutsetType) = a3;
}

- (BOOL)tailHasVerticalFlip
{
  return BYTE3(self->mDynamicOutsetType);
}

- (void)setTailHasVerticalFlip:(BOOL)a3
{
  BYTE3(self->mDynamicOutsetType) = a3;
}

- (BOOL)overridenHeadMagnetNormalizedPosition
{
  return BYTE4(self->mDynamicOutsetType);
}

- (BOOL)overridenTailMagnetNormalizedPosition
{
  return BYTE5(self->mDynamicOutsetType);
}

- (BOOL)userDidSetControlPoint
{
  return BYTE6(self->mDynamicOutsetType);
}

- (void)setUserDidSetControlPoint:(BOOL)a3
{
  BYTE6(self->mDynamicOutsetType) = a3;
}

- (CRLCanvasLayout)headNearestLayoutForRouting
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mHeadClipT + 3));

  return (CRLCanvasLayout *)WeakRetained;
}

- (void)setHeadNearestLayoutForRouting:(id)a3
{
}

- (CRLCanvasLayout)tailNearestLayoutForRouting
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->mTailClipT + 3));

  return (CRLCanvasLayout *)WeakRetained;
}

- (void)setTailNearestLayoutForRouting:(id)a3
{
}

- (unint64_t)headNearestMagnetTypeForRouting
{
  return *(unint64_t *)((char *)&self->mHeadNearestLayoutForRouting + 3);
}

- (void)setHeadNearestMagnetTypeForRouting:(unint64_t)a3
{
  *(CRLCanvasLayout **)((char *)&self->mHeadNearestLayoutForRouting + 3) = (CRLCanvasLayout *)a3;
}

- (unint64_t)tailNearestMagnetTypeForRouting
{
  return *(unint64_t *)((char *)&self->mTailNearestLayoutForRouting + 3);
}

- (void)setTailNearestMagnetTypeForRouting:(unint64_t)a3
{
  *(CRLCanvasLayout **)((char *)&self->mTailNearestLayoutForRouting + 3) = (CRLCanvasLayout *)a3;
}

- (BOOL)controlKnobPositionChangedFromRouting
{
  return HIBYTE(self->mDynamicOutsetType);
}

- (void)setControlKnobPositionChangedFromRouting:(BOOL)a3
{
  HIBYTE(self->mDynamicOutsetType) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)((char *)&self->mTailClipT + 3));
  objc_destroyWeak((id *)((char *)&self->mHeadClipT + 3));
  objc_storeStrong((id *)((char *)&self->mCachedToOutsetWrapPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedFromOutsetWrapPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedToOutset + 3), 0);
  objc_storeStrong((id *)((char *)&self->mCachedFromOutset + 3), 0);
  objc_destroyWeak((id *)((char *)&self->mTemporaryConnectedToInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mTemporaryConnectedFromInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedToInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedFromInfo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedTo + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedFrom + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedInfoGeometry + 3));
  objc_destroyWeak((id *)((char *)&self->mConnectedPathSource + 3));
  objc_storeStrong((id *)((char *)&self->mOriginalPathSource + 3), 0);
  objc_storeStrong((id *)((char *)&self->mUnclippedBezierPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->mClippedBezierPath + 3), 0);
  objc_storeStrong((id *)((char *)&self->super.mDynamicPatternOffsetsBySubpath + 3), 0);

  objc_storeStrong((id *)(&self->super.mOkayToSetGeometry + 3), 0);
}

@end