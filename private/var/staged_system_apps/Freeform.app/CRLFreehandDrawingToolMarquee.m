@interface CRLFreehandDrawingToolMarquee
+ (BOOL)wasLastMarqueeClockwise;
+ (id)dottedMarqueeRenderableAnimationWithOffsetDashes:(BOOL)a3 clockwise:(BOOL)a4;
+ (id)dottedMarqueeRenderableOfColor:(id)a3 offsetDashes:(BOOL)a4;
- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3;
- (BOOL)handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:(id)a3;
- (BOOL)p_unlockedAncestorOfRepIsAlreadySelected:(id)a3;
- (BOOL)wantsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4;
- (CRLFreehandDrawingToolMarquee)initWithInteractiveCanvasController:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (id)p_allSelectableItemsToInteractWithFromLayouts:(id)a3;
- (id)p_allSelectionIneligibleItemsWithinMarqueeSelectionAreaInParentContainerAtPoint:(CGPoint)a3;
- (id)p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:(id)a3;
- (id)p_infosToSelectFromHitRep:(id)a3 repForSelectingFromHitRep:(id)a4 selectedInfosBeforeTapping:(id)a5;
- (unint64_t)type;
- (void)cancelCommitSelectionForHandlingMarqueeTapForSmartSelection;
- (void)doWorkBeforeCanvasLayout;
- (void)handleMarqueeTapWithInput:(id)a3;
- (void)p_deselectSmartSelectedDrawingShapeItemsFromInfosToSelect:(id)a3;
- (void)p_handleMarqueeCircleSelectionWithMarqueePath:(id)a3;
- (void)p_hideEditMenuForLassoSelection;
- (void)p_prepareForHitTestingInBackgroundWithMarqueeSelectionEligibleInfos:(id)a3 marqueeSelectionIneligibleInfos:(id)a4 viewScale:(double)a5 visibleUnscaledRect:(CGRect)a6;
- (void)p_presentEditMenuForLassoSelection;
- (void)p_updateDottedMarqueeDecoratorRenderable:(id)a3;
- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5;
- (void)updatePencilKitToolIfAppropriateFor:(id)a3;
@end

@implementation CRLFreehandDrawingToolMarquee

- (CRLFreehandDrawingToolMarquee)initWithInteractiveCanvasController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingToolMarquee;
  v3 = [(CRLFreehandDrawingTool *)&v8 initWithInteractiveCanvasController:a3];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.freeform.freehand-drawing.marquee-select-hit-testing", v4);
    hitTestingQueue = v3->_hitTestingQueue;
    v3->_hitTestingQueue = (OS_dispatch_queue *)v5;

    v3->_initialUnscaledPoint = (CGPoint)xmmword_101175160;
    v3->_shouldEnableHandwritingIntelligence = +[CRLFeatureFlagsHelper isOSFeatureEnabled:1];
  }
  return v3;
}

+ (BOOL)wasLastMarqueeClockwise
{
  return byte_1016A9D90;
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CRLFreehandDrawingToolMarquee;
  [(CRLFreehandDrawingTool *)&v54 performActionWithInputPoint:v8 isInitialPoint:v6 isFinalPoint:v5];
  v9 = [(CRLFreehandDrawingTool *)self icc];
  [v8 unscaledPoint];
  double v12 = v10;
  double v13 = v11;
  v14 = &OBJC_IVAR___CRLCanvasLayoutGeometry__size;
  if (v6)
  {
    self->_initialUnscaledPoint.x = v10;
    self->_initialUnscaledPoint.y = v11;
    [v8 time];
    self->_initialTouchTime = v15;
    v16 = [(CRLFreehandDrawingTool *)self icc];
    [v8 unscaledPoint];
    v17 = [v16 parentForFreehandDrawingLayoutsAtPoint:];

    v18 = [v17 children];
    v19 = [(CRLFreehandDrawingToolMarquee *)self p_allSelectableItemsToInteractWithFromLayouts:v18];

    v20 = [(CRLFreehandDrawingTool *)self icc];
    v21 = [v20 freehandDrawingToolkit];
    unsigned __int8 v22 = [v21 isLassoAbleToSelectMixedType];

    if (v22)
    {
      [v8 unscaledPoint];
      -[CRLFreehandDrawingToolMarquee p_allSelectionIneligibleItemsWithinMarqueeSelectionAreaInParentContainerAtPoint:](self, "p_allSelectionIneligibleItemsWithinMarqueeSelectionAreaInParentContainerAtPoint:");
    }
    else
    {
      +[NSArray array];
    v25 = };
    v14 = &OBJC_IVAR___CRLCanvasLayoutGeometry__size;
    if ([v19 count])
    {
      [v9 viewScale];
      uint64_t v27 = v26;
      [v9 visibleUnscaledRect];
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      uint64_t v33 = v32;
      uint64_t v35 = v34;
      atomic_store(0, (unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
      hitTestingQueue = self->_hitTestingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1004A587C;
      block[3] = &unk_1014FE5C0;
      block[4] = self;
      block[5] = v19;
      id v48 = v25;
      uint64_t v49 = v27;
      uint64_t v50 = v29;
      uint64_t v51 = v31;
      uint64_t v52 = v33;
      uint64_t v53 = v35;
      dispatch_async(hitTestingQueue, block);
    }
    v37 = objc_alloc_init(CRLFreehandDrawingPathCreator);
    pathCreator = self->_pathCreator;
    self->_pathCreator = v37;

    v39 = self->_pathCreator;
    [v9 viewScale];
    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](v39, "beginDrawingWithViewScale:inputType:", [v8 inputType], v40);
    [v9 addDecorator:self];
    self->_didProvideDecoratorRenderable = 0;
    v41 = objc_alloc_init(CRLFreehandDrawingWindingCalculator);
    windingCalculator = self->_windingCalculator;
    self->_windingCalculator = v41;

    -[CRLFreehandDrawingWindingCalculator addPoint:](self->_windingCalculator, "addPoint:", v12, v13);
  }
  else if (([v8 isPredicted] & 1) == 0)
  {
    if (!self->_movedFarEnoughNotToBeTap)
    {
      double v23 = sub_1000653B4(self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y, v12, v13);
      [v9 viewScale];
      if (v23 * v24 > 45.0) {
        self->_movedFarEnoughNotToBeTap = 1;
      }
    }
    -[CRLFreehandDrawingWindingCalculator addPoint:](self->_windingCalculator, "addPoint:", v12, v13);
  }
  if (([v8 isPredicted] & 1) == 0)
  {
    [v8 time];
    self->_mostRecentTouchTime = v43;
  }
  if (v6 || ([v8 wasAddedByTouchesEnded] & 1) == 0)
  {
    v44 = self->_pathCreator;
    [v8 time];
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v44, "drawToPoint:atTime:predicted:", [v8 isPredicted], v12, v13, v45);
  }
  [v9 invalidateLayersForDecorator:self];
  if (*((unsigned char *)&self->super.super.isa + v14[17])
    && (objc_msgSend(v9, "i_currentlySuppressingLayerUpdates") & 1) == 0)
  {
    v46 = +[NSSet set];
    [v9 i_beginSuppressingLayerUpdatesExceptForReps:v46];
  }
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CRLFreehandDrawingToolMarquee;
  BOOL v4 = [(CRLFreehandDrawingTool *)&v21 finalizeAndResetWithSuccess:a3];
  BOOL v5 = [(CRLFreehandDrawingTool *)self icc];
  if (objc_msgSend(v5, "i_currentlySuppressingLayerUpdates")) {
    [v5 i_endSuppressingLayerUpdates];
  }
  if (v4) {
    byte_1016A9D90 = [(CRLFreehandDrawingWindingCalculator *)self->_windingCalculator isWindingClockwise];
  }
  windingCalculator = self->_windingCalculator;
  self->_windingCalculator = 0;

  [(CRLFreehandDrawingPathCreator *)self->_pathCreator endDrawing];
  if (v4)
  {
    if (self->_movedFarEnoughNotToBeTap || self->_mostRecentTouchTime - self->_initialTouchTime > 0.75)
    {
      v7 = [(CRLFreehandDrawingPathCreator *)self->_pathCreator copyOfEntirePath];
      [(CRLFreehandDrawingToolMarquee *)self p_handleMarqueeCircleSelectionWithMarqueePath:v7];
    }
    else
    {
      atomic_store(1u, (unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
      id v12 = [(CRLFreehandDrawingPathCreator *)self->_pathCreator copyOfEntirePath];
      [v12 bounds];
      double v17 = sub_100065738(v13, v14, v15, v16);
      double v19 = v18;

      v7 = -[CRLFreehandDrawingToolMarqueeInput initWithUnscaledTapPoint:inputType:]([CRLFreehandDrawingToolMarqueeInput alloc], "initWithUnscaledTapPoint:inputType:", [(CRLFreehandDrawingTool *)self currentInputType], v17, v19);
      if (self->_shouldEnableHandwritingIntelligence)
      {
        if (self->_isHandlingDoubleTapGesture) {
          self->_isHandlingDoubleTapGesture = 0;
        }
        else {
          [(CRLFreehandDrawingToolMarquee *)self performSelector:"handleMarqueeTapWithInput:" withObject:v7 afterDelay:0.3];
        }
      }
      else
      {
        [(CRLFreehandDrawingToolMarquee *)self handleMarqueeTapWithInput:v7];
      }
    }
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
  }
  id v8 = [(CRLFreehandDrawingTool *)self icc];
  [v8 removeDecorator:self];

  self->_didProvideDecoratorRenderable = 0;
  self->_mostRecentTouchTime = 0.0;
  self->_initialTouchTime = 0.0;
  self->_movedFarEnoughNotToBeTap = 0;
  self->_initialUnscaledPoint = (CGPoint)xmmword_101175160;
  pathCreator = self->_pathCreator;
  self->_pathCreator = 0;

  hitTestingQueue = self->_hitTestingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004A5B4C;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(hitTestingQueue, block);

  return v4;
}

- (unint64_t)type
{
  return 9;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)PKLassoTool);
  [v3 setTool:v4];
}

+ (id)dottedMarqueeRenderableOfColor:(id)a3 offsetDashes:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = +[CRLCanvasShapeRenderable renderable];
  [v6 setLineWidth:4.0];
  [v6 setLineDashPattern:&off_10155CF50];
  [v6 setLineJoin:kCALineJoinRound];
  [v6 setLineCap:kCALineCapRound];
  [v6 setFillColor:0];
  v7 = [v5 colorWithAlphaComponent:0.5];

  [v6 setStrokeColor:[v7 CGColor]];
  double v8 = 0.0;
  if (v4) {
    double v8 = 5.5;
  }
  [v6 setLineDashPhase:v8];

  return v6;
}

+ (id)dottedMarqueeRenderableAnimationWithOffsetDashes:(BOOL)a3 clockwise:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v6 = +[CABasicAnimation animationWithKeyPath:@"lineDashPhase"];
  double v7 = 5.5;
  if (!v5) {
    double v7 = 0.0;
  }
  if (v4) {
    double v8 = v7 + 11.0;
  }
  else {
    double v8 = v7;
  }
  if (v4) {
    double v9 = v7;
  }
  else {
    double v9 = v7 + 11.0;
  }
  CGFloat v10 = +[NSNumber numberWithDouble:v8];
  [v6 setFromValue:v10];

  CGFloat v11 = +[NSNumber numberWithDouble:v9];
  [v6 setToValue:v11];

  [v6 setDuration:1.0];
  LODWORD(v12) = 2139095040;
  [v6 setRepeatCount:v12];

  return v6;
}

- (NSArray)decoratorOverlayRenderables
{
  if (!self->_blackMarqueeRenderable || !self->_whiteMarqueeRenderable)
  {
    id v3 = objc_opt_class();
    BOOL v4 = +[CRLColor blackColor];
    BOOL v5 = [v3 dottedMarqueeRenderableOfColor:v4 offsetDashes:0];
    blackMarqueeRenderable = self->_blackMarqueeRenderable;
    self->_blackMarqueeRenderable = v5;

    double v7 = objc_opt_class();
    double v8 = +[CRLColor whiteColor];
    double v9 = [v7 dottedMarqueeRenderableOfColor:v8 offsetDashes:1];
    whiteMarqueeRenderable = self->_whiteMarqueeRenderable;
    self->_whiteMarqueeRenderable = v9;
  }
  if (self->_pathCreator && self->_blackMarqueeRenderable && self->_whiteMarqueeRenderable)
  {
    -[CRLFreehandDrawingToolMarquee p_updateDottedMarqueeDecoratorRenderable:](self, "p_updateDottedMarqueeDecoratorRenderable:");
    [(CRLFreehandDrawingToolMarquee *)self p_updateDottedMarqueeDecoratorRenderable:self->_whiteMarqueeRenderable];
    CGFloat v11 = self->_whiteMarqueeRenderable;
    v14[0] = self->_blackMarqueeRenderable;
    v14[1] = v11;
    double v12 = +[NSArray arrayWithObjects:v14 count:2];
  }
  else
  {
    double v12 = &__NSArray0__struct;
  }
  self->_didProvideDecoratorRenderable = 1;

  return (NSArray *)v12;
}

- (void)doWorkBeforeCanvasLayout
{
  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingToolMarquee;
  [(CRLFreehandDrawingTool *)&v5 doWorkBeforeCanvasLayout];
  id v3 = [(CRLFreehandDrawingTool *)self icc];
  if (objc_msgSend(v3, "i_currentlySuppressingLayerUpdates")
    && self->_pathCreator
    && self->_blackMarqueeRenderable)
  {
    whiteMarqueeRenderable = self->_whiteMarqueeRenderable;

    if (whiteMarqueeRenderable)
    {
      [(CRLFreehandDrawingToolMarquee *)self p_updateDottedMarqueeDecoratorRenderable:self->_blackMarqueeRenderable];
      [(CRLFreehandDrawingToolMarquee *)self p_updateDottedMarqueeDecoratorRenderable:self->_whiteMarqueeRenderable];
    }
  }
  else
  {
  }
}

- (void)p_updateDottedMarqueeDecoratorRenderable:(id)a3
{
  id v4 = a3;
  if (!self->_pathCreator)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE5E0);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA140(v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE600);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v7, v5);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolMarquee p_updateDottedMarqueeDecoratorRenderable:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolMarquee.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 368, 0, "invalid nil value for '%{public}s'", "_pathCreator");
  }
  CGFloat v10 = [(CRLFreehandDrawingTool *)self icc];
  [v10 viewScale];
  CGFloat v12 = v11;

  id v13 = [(CRLFreehandDrawingPathCreator *)self->_pathCreator copyOfEntirePath];
  CGAffineTransformMakeScale(&v15, v12, v12);
  [v13 transformUsingAffineTransform:&v15];
  id v14 = v13;
  [v4 setPath:[v14 CGPath]];
}

- (void)p_prepareForHitTestingInBackgroundWithMarqueeSelectionEligibleInfos:(id)a3 marqueeSelectionIneligibleInfos:(id)a4 viewScale:(double)a5 visibleUnscaledRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a3;
  id v14 = a4;
  v73 = [(CRLFreehandDrawingTool *)self icc];
  double v15 = ceil(10.0 / fmin(a5, 1.0));
  CGFloat v16 = [[CRLBezierHitTester alloc] initWithBucketSize:v15];
  hitTester = self->_hitTester;
  self->_hitTester = v16;

  [(CRLBezierHitTester *)self->_hitTester setAllowsLargeCrawlingDistances:1];
  double v18 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
  selectionEligiblePathToInfoDictionarCGFloat y = self->_selectionEligiblePathToInfoDictionary;
  self->_selectionEligiblePathToInfoDictionarCGFloat y = v18;

  v20 = +[NSHashTable hashTableWithOptions:0];
  selectionIneligiblePaths = self->_selectionIneligiblePaths;
  self->_selectionIneligiblePaths = v20;

  unsigned __int8 v22 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
  if ((v22 & 1) == 0)
  {
    id v66 = v14;
    v67 = v13;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v23 = v14;
    id v24 = [v23 countByEnumeratingWithState:&v85 objects:v99 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v86;
LABEL_4:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v86 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v85 + 1) + 8 * v27);
        unsigned __int8 v29 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
        if (v29) {
          break;
        }
        uint64_t v30 = [(CRLFreehandDrawingTool *)self icc];
        uint64_t v31 = [v30 layoutForInfo:v28];

        if (v31)
        {
          uint64_t v32 = [v31 i_wrapPath];
          id v33 = [v32 copy];

          [v31 transformInRoot];
          [v33 transformUsingAffineTransform:v84];
          -[CRLBezierHitTester addPath:filled:](self->_hitTester, "addPath:filled:", v33, [v33 containsClosePathElement]);
          [(NSHashTable *)self->_selectionIneligiblePaths addObject:v33];
        }
        if (v25 == (id)++v27)
        {
          id v25 = [v23 countByEnumeratingWithState:&v85 objects:v99 count:16];
          if (v25) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v67;
    id v34 = [obj countByEnumeratingWithState:&v80 objects:v98 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v72 = *(void *)v81;
LABEL_14:
      uint64_t v36 = 0;
      id v68 = v35;
      while (1)
      {
        if (*(void *)v81 != v72) {
          objc_enumerationMutation(obj);
        }
        v37 = *(void **)(*((void *)&v80 + 1) + 8 * v36);
        unsigned __int8 v38 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
        if (v38) {
          goto LABEL_49;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        v63 = [v73 layoutForInfo:v37];
        v62 = v63;
        if (v63)
        {
          [v63 i_wrapPath];
          v65 = v64 = v62;
          id v41 = [v65 copy];

          v62 = v64;
          [v64 transformInRoot];
          [v41 transformUsingAffineTransform:v74];
          if (([v41 isEmpty] & 1) == 0)
          {
            [v41 bounds];
            v103.origin.CGFloat x = x;
            v103.origin.CGFloat y = y;
            v103.size.CGFloat width = width;
            v103.size.CGFloat height = height;
            if (CGRectIntersectsRect(v101, v103))
            {
              [(CRLBezierHitTester *)self->_hitTester addPath:v41 filled:1 crawlingDistance:v15];
              [(NSMapTable *)self->_selectionEligiblePathToInfoDictionary setObject:v37 forKey:v41];
            }
          }
LABEL_46:
        }
        if ((id)++v36 == v35)
        {
          id v35 = [obj countByEnumeratingWithState:&v80 objects:v98 count:16];
          if (v35) {
            goto LABEL_14;
          }
          goto LABEL_49;
        }
      }
      uint64_t v71 = v36;
      uint64_t v39 = objc_opt_class();
      v70 = sub_1002469D0(v39, v37);
      double v40 = [v70 childInfos];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v41 = v40;
      id v42 = [v41 countByEnumeratingWithState:&v76 objects:v97 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v77;
LABEL_21:
        uint64_t v45 = 0;
        while (1)
        {
          if (*(void *)v77 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v76 + 1) + 8 * v45);
          unsigned __int8 v47 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
          if (v47) {
            break;
          }
          uint64_t v48 = objc_opt_class();
          uint64_t v49 = sub_1002469D0(v48, v46);
          if (v49)
          {
            uint64_t v50 = objc_opt_class();
            uint64_t v51 = [v73 layoutForInfo:v49];
            uint64_t v52 = sub_1002469D0(v50, v51);

            if (v52)
            {
              uint64_t v53 = [v49 pathSource];
              objc_super v54 = [v53 bezierPath];
              id v55 = [v54 copy];

              [v52 transformInRoot];
              [v55 transformUsingAffineTransform:v75];
              [v55 bounds];
              v102.origin.CGFloat x = x;
              v102.origin.CGFloat y = y;
              v102.size.CGFloat width = width;
              v102.size.CGFloat height = height;
              if (CGRectIntersectsRect(v100, v102))
              {
                -[CRLBezierHitTester addPath:filled:crawlingDistance:](self->_hitTester, "addPath:filled:crawlingDistance:", v55, [v55 containsClosePathElement], v15);
                [(NSMapTable *)self->_selectionEligiblePathToInfoDictionary setObject:v49 forKey:v55];
              }
            }
            else
            {
              unsigned int v56 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FE620);
              }
              v57 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                unsigned int v90 = v56;
                __int16 v91 = 2082;
                v92 = "-[CRLFreehandDrawingToolMarquee p_prepareForHitTestingInBackgroundWithMarqueeSelectionEligibleInfo"
                      "s:marqueeSelectionIneligibleInfos:viewScale:visibleUnscaledRect:]";
                __int16 v93 = 2082;
                v94 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolMarquee.m";
                __int16 v95 = 1024;
                int v96 = 439;
                _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d There should be a currentShapeLayout here.", buf, 0x22u);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FE640);
              }
              v58 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                v60 = v58;
                v61 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                unsigned int v90 = v56;
                __int16 v91 = 2114;
                v92 = v61;
                _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolMarquee p_prepareForHitTestingInBackgroundWithMarqueeSelectionEligibleInfos:marqueeSelectionIneligibleInfos:viewScale:visibleUnscaledRect:]", v66);
              id v55 = (id)objc_claimAutoreleasedReturnValue();
              v59 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolMarquee.m"];
              +[CRLAssertionHandler handleFailureInFunction:v55 file:v59 lineNumber:439 isFatal:0 description:"There should be a currentShapeLayout here."];
            }
          }

          if (v43 == (id)++v45)
          {
            id v43 = [v41 countByEnumeratingWithState:&v76 objects:v97 count:16];
            if (v43) {
              goto LABEL_21;
            }
            break;
          }
        }
      }

      id v35 = v68;
      v62 = v70;
      uint64_t v36 = v71;
      goto LABEL_46;
    }
LABEL_49:

    id v14 = v66;
    id v13 = v67;
  }
}

- (void)cancelCommitSelectionForHandlingMarqueeTapForSmartSelection
{
  self->_isHandlingDoubleTapGesture = 1;
}

- (void)p_handleMarqueeCircleSelectionWithMarqueePath:(id)a3
{
  id v4 = a3;
  int v5 = [(CRLFreehandDrawingTool *)self icc];
  BOOL v6 = +[NSMutableSet set];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_1004A6EFC;
  id v34 = sub_1004A6F0C;
  id v35 = 0;
  hitTestingQueue = self->_hitTestingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004A6F14;
  block[3] = &unk_1014F8700;
  unsigned __int8 v29 = &v30;
  block[4] = self;
  id v21 = v4;
  id v27 = v21;
  id v8 = v6;
  id v28 = v8;
  dispatch_sync(hitTestingQueue, block);
  if (![v8 count]
    && [(id)v31[5] count]
    && [(id)v31[5] isEqualToHashTable:self->_selectionIneligiblePaths])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = [(NSMapTable *)self->_selectionEligiblePathToInfoDictionary crl_allObjects];
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v18 = objc_opt_class();
          double v19 = sub_1002469D0(v18, v17);
          v20 = sub_10006B444(v19);
          if (v20) {
            [v8 addObject:v20];
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v22 objects:v36 count:16];
      }
      while (v14);
    }
  }
  if (self->_shouldEnableHandwritingIntelligence && [v8 count]) {
    [(CRLFreehandDrawingToolMarquee *)self p_deselectSmartSelectedDrawingShapeItemsFromInfosToSelect:v8];
  }
  double v9 = [v5 canvasEditor];
  CGFloat v10 = [v9 selectionPathWithInfos:v8];

  double v11 = [v5 editorController];
  [v11 setSelectionPath:v10];

  int64_t v12 = [(CRLFreehandDrawingTool *)self currentInputType];
  if ([v8 count] && v12) {
    [(CRLFreehandDrawingToolMarquee *)self p_presentEditMenuForLassoSelection];
  }

  _Block_object_dispose(&v30, 8);
}

- (void)handleMarqueeTapWithInput:(id)a3
{
  id v71 = a3;
  id v4 = [(CRLFreehandDrawingTool *)self icc];
  [v71 unscaledTapPoint];
  double v6 = v5;
  double v8 = v7;
  unint64_t v9 = (unint64_t)[v71 inputType];
  CGFloat v10 = [v4 freehandDrawingToolkit];
  unsigned int v64 = [v10 isLassoAbleToSelectMixedType];

  double v11 = [v4 layerHost];
  int64_t v12 = [v11 asiOSCVC];

  uint64_t v13 = objc_opt_class();
  id v14 = [v12 delegate];
  uint64_t v15 = [v14 currentDocumentMode];
  CGFloat v16 = sub_1002469D0(v13, v15);

  v69 = v16;
  unsigned int v66 = [v16 currentlyDisplayingLassoSelectionMenu];
  double v17 = [v4 hitRep:(v9 & 0xFFFFFFFFFFFFFFFDLL) == 0 withPrecision:v6 v8];
  if (!v17 && (v9 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    double v17 = [v4 hitRep:0 withPrecision:v6, v8];
  }
  if (v17)
  {
    unsigned int v18 = [(CRLFreehandDrawingToolMarquee *)self p_unlockedAncestorOfRepIsAlreadySelected:v17];
    double v19 = [v4 infosForCurrentSelectionPath];
    if (v18)
    {
      v20 = [v17 repForSelecting];
      id v21 = [v4 canvasEditor];
      long long v22 = [v21 selectionPathWithInfos:0];

      long long v23 = [v4 editorController];
      [v23 setSelectionPath:v22];

      [(CRLFreehandDrawingToolMarquee *)self p_hideEditMenuForLassoSelection];
      int v70 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    double v19 = [v4 infosForCurrentSelectionPath];
  }
  int v70 = 0;
  v20 = 0;
LABEL_9:
  long long v24 = [v17 repForSelecting];

  [v12 setLastTapPoint:v6, v8];
  v67 = v12;
  if (v24)
  {
    if (objc_msgSend(v24, "handledLassoTapAtPoint:withInputType:", v9, v6, v8))
    {
      unsigned __int8 v25 = 1;
    }
    else
    {
      uint64_t v26 = objc_opt_class();
      id v27 = sub_1002469D0(v26, v24);
      id v28 = v27;
      if (v27
        && ([v27 parentRep], unsigned __int8 v29 = objc_claimAutoreleasedReturnValue(), v29, v29))
      {
        uint64_t v30 = objc_opt_class();
        uint64_t v31 = [v28 parentRep];
        uint64_t v32 = sub_1002469D0(v30, v31);

        if (v32) {
          unsigned __int8 v25 = [v32 handledLassoTapAtPoint:v9 withInputType:v6];
        }
        else {
          unsigned __int8 v25 = 0;
        }
      }
      else
      {
        unsigned __int8 v25 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v25 = 0;
    if (+[CRLFeatureFlagGroup isMathPaperEnabled]&& v69)
    {
      unsigned __int8 v25 = [(CRLFreehandDrawingToolMarquee *)self handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:v71];
    }
  }
  id v68 = self;
  id v33 = +[NSSet set];
  if (v24)
  {
    [v4 canvasEditor];
    v35 = id v34 = v20;
    [v24 layout];
    v37 = unint64_t v36 = v9;
    unsigned int v38 = [v35 isLayoutSelectable:v37];

    unint64_t v9 = v36;
    v20 = v34;
    if ((v25 & 1) == 0)
    {
      if (v38)
      {
        v63 = v19;
        uint64_t v39 = objc_opt_class();
        double v40 = [v24 info];
        id v41 = sub_1002469D0(v39, v40);

        id v42 = [v41 containingGroup];
        if (!v42)
        {
          uint64_t v43 = objc_opt_class();
          id v42 = sub_1002469D0(v43, v41);
        }
        if ((v64 & 1) == 0)
        {
          objc_super v54 = [v24 layout];
          if (![v54 isInGroup]) {
            goto LABEL_51;
          }
          unsigned int v59 = [v42 isFreehandDrawing];

          if (!v59)
          {
            double v19 = v63;
LABEL_53:

            unint64_t v9 = v36;
            v58 = v67;
            v20 = v34;
LABEL_54:
            id v34 = v20;
            v60 = [v4 canvasEditor];
            id v41 = [v60 selectionPathWithInfos:v33];

            if ((v70 | v66 ^ 1) == 1)
            {
              v61 = [v4 editorController];
              [v61 setSelectionPath:v41];
            }
            [(CRLFreehandDrawingToolMarquee *)v68 p_hideEditMenuForLassoSelection];
            goto LABEL_57;
          }
        }
        unsigned __int8 v44 = sub_10006B53C(v42);
        if ([v24 isSelected] & 1) != 0 || (v44)
        {

          unint64_t v9 = v36;
          v58 = v67;
          double v19 = v63;
LABEL_57:

          if (v9) {
            char v62 = v25;
          }
          else {
            char v62 = 1;
          }
          if (v62)
          {
            v20 = v34;
          }
          else
          {
            v20 = v34;
            if (v66) {
              [(CRLFreehandDrawingToolMarquee *)v68 p_hideEditMenuForLassoSelection];
            }
            else {
              [(CRLFreehandDrawingToolMarquee *)v68 p_presentEditMenuForLassoSelection];
            }
          }
          goto LABEL_65;
        }
        if (v64)
        {
          uint64_t v45 = [v24 layout];
          if ([v45 isInGroup] && v42)
          {
            unsigned __int8 v46 = [v42 isFreehandDrawing];

            if ((v46 & 1) == 0)
            {
              v65 = [v41 parentInfo];
              uint64_t v47 = objc_opt_class();
              uint64_t v53 = sub_100246DEC(v65, v47, 1, v48, v49, v50, v51, v52, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
              objc_super v54 = sub_10006B444(v53);

              uint64_t v55 = +[NSSet setWithObject:v54];

              id v33 = (void *)v55;
              goto LABEL_51;
            }
          }
          else
          {
          }
        }
        if (v70)
        {
          double v19 = v63;
          [(CRLFreehandDrawingToolMarquee *)v68 p_infosToSelectFromHitRep:v24 repForSelectingFromHitRep:v34 selectedInfosBeforeTapping:v63];
          id v33 = v54 = v33;
LABEL_52:

          goto LABEL_53;
        }
        +[NSSet setWithObject:v41];
        id v33 = v54 = v33;
LABEL_51:
        double v19 = v63;
        goto LABEL_52;
      }
    }
  }
  if (v20) {
    int v56 = v70;
  }
  else {
    int v56 = 0;
  }
  if (v56 == 1)
  {
    uint64_t v57 = [(CRLFreehandDrawingToolMarquee *)v68 p_infosToSelectFromHitRep:v24 repForSelectingFromHitRep:v20 selectedInfosBeforeTapping:v19];

    id v33 = (void *)v57;
  }
  v58 = v67;
  if ((v25 & 1) == 0) {
    goto LABEL_54;
  }
LABEL_65:
}

- (BOOL)p_unlockedAncestorOfRepIsAlreadySelected:(id)a3
{
  uint64_t v4 = [a3 parentRep];
  if (!v4) {
    return 0;
  }
  double v5 = (void *)v4;
  while (![v5 isSelected] || objc_msgSend(v5, "isLocked"))
  {
    double v6 = [v5 info];
    if (v6)
    {
      double v7 = [(CRLFreehandDrawingTool *)self icc];
      double v8 = [v7 infosForCurrentSelectionPath];
      unsigned int v9 = [v8 containsObject:v6];

      if (v9)
      {

        break;
      }
    }
    uint64_t v10 = [v5 parentRep];

    double v5 = (void *)v10;
    if (!v10)
    {
      BOOL v11 = 0;
      goto LABEL_12;
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (id)p_infosToSelectFromHitRep:(id)a3 repForSelectingFromHitRep:(id)a4 selectedInfosBeforeTapping:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)[v9 count] < 2)
  {
    BOOL v11 = [v8 info];
    int64_t v12 = sub_10006B444(v11);

    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v10 = +[NSSet setWithObject:v12];
    }
    else
    {
      uint64_t v13 = objc_opt_class();
      id v14 = [v7 info];
      uint64_t v15 = sub_1002469D0(v13, v14);

      if (v15) {
        +[NSSet setWithObject:v15];
      }
      else {
      id v10 = +[NSSet set];
      }
    }
  }
  else
  {
    id v10 = v9;
  }

  return v10;
}

- (void)p_deselectSmartSelectedDrawingShapeItemsFromInfosToSelect:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLFreehandDrawingTool *)self icc];
  double v6 = [v5 layerHost];
  id v7 = [v6 asiOSCVC];

  id v8 = [v7 smartSelectionManager];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v13);
        uint64_t v15 = objc_opt_class();
        CGFloat v16 = sub_1002469D0(v15, v14);
        if (!v16
          || !objc_msgSend(v8, "doesCurrentSmartSelectedDrawingShapeItemsContainDrawingShapeItem:", v16, (void)v19))
        {
          unsigned int v18 = v9;
          goto LABEL_12;
        }
        [v8 removeSelectedShapeItemFromSmartSelectionBookkeeping:v16];

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  double v17 = [v5 canvasEditor];
  unsigned int v18 = [v17 selectionPathWithInfos:0];

  CGFloat v16 = [v5 editorController];
  [v16 setSelectionPath:v18];
LABEL_12:
}

- (BOOL)handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLFreehandDrawingTool *)self icc];
  [v4 unscaledTapPoint];
  double v7 = v6;
  double v9 = v8;
  unint64_t v33 = (unint64_t)[v4 inputType];
  id v10 = [v5 topLevelRepsForHitTesting];
  id v11 = +[NSMutableSet set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        CGFloat v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v17 = objc_opt_class();
        unsigned int v18 = [v16 info];
        long long v19 = [v18 parentInfo];
        long long v20 = sub_1002469D0(v17, v19);

        uint64_t v21 = objc_opt_class();
        long long v22 = [v5 repForInfo:v20];
        long long v23 = sub_1002469D0(v21, v22);

        [v11 crl_addNonNilObject:v23];
      }
      id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }

  if ([v11 count])
  {
    long long v24 = [v5 canvas];
    if ((v33 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      double v25 = 20.0;
    }
    else {
      double v25 = 2.0;
    }
    uint64_t v26 = [v11 allObjects];
    id v27 = [v24 hitRep:(v33 & 0xFFFFFFFFFFFFFFFDLL) == 0 withPrecision:v26 inTopLevelReps:0 smallRepOutset:0 unscaledPointTransformForRep:v7 passingTest:v9];

    uint64_t v28 = objc_opt_class();
    unsigned __int8 v29 = sub_1002469D0(v28, v27);
    uint64_t v30 = v29;
    if (v29) {
      unsigned __int8 v31 = [v29 handledLassoTapAtPoint:v33 withInputType:v7, v9];
    }
    else {
      unsigned __int8 v31 = 0;
    }
  }
  else
  {
    unsigned __int8 v31 = 0;
  }

  return v31;
}

- (BOOL)wantsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v7 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  double v8 = [(CRLFreehandDrawingTool *)self icc];
  double v9 = [v8 hitRep:v7 withPrecision:x, y];

  id v10 = [v9 repForDragging];
  id v11 = [(CRLFreehandDrawingTool *)self icc];
  id v12 = [v11 freehandDrawingToolkit];
  unsigned __int8 v13 = [v12 isLassoAbleToSelectMixedType];

  if (!v10 || (v13 & 1) != 0)
  {
    if (!v10)
    {
LABEL_9:
      char v20 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v9 repForDragging];
    CGFloat v16 = sub_1002469D0(v14, v15);

    uint64_t v17 = [v16 shapeInfo];
    unsigned int v18 = [v17 containingGroup];
    unsigned __int8 v19 = [v18 isFreehandDrawing];

    if ((v19 & 1) == 0) {
      goto LABEL_9;
    }
  }
  if (([v10 isLocked] & 1) != 0 || !objc_msgSend(v10, "isSelected")) {
    goto LABEL_9;
  }
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass() ^ 1;
LABEL_10:

  return v20 & 1;
}

- (id)p_allSelectableItemsToInteractWithFromLayouts:(id)a3
{
  id v4 = a3;
  long long v38 = self;
  double v5 = [(CRLFreehandDrawingTool *)self icc];
  double v6 = [v5 freehandDrawingToolkit];
  unsigned int v7 = [v6 isLassoAbleToSelectMixedType];

  unsigned int v37 = v7;
  objc_opt_class();
  id v40 = +[NSMutableArray array];
  if ([v4 count])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v36 = v4;
    id obj = v4;
    id v43 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (!v43) {
      goto LABEL_42;
    }
    uint64_t v8 = *(void *)v49;
    uint64_t v39 = *(void *)v49;
    while (1)
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        id v12 = sub_1002469D0(v11, v10);
        unsigned __int8 v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = [v12 info];
        uint64_t v15 = sub_10024715C(v13, v14);

        if (!v12 || ([v15 locked] & 1) == 0)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v10 isMemberOfClass:objc_opt_class()] & 1) != 0)
          {
            if (!v12) {
              goto LABEL_40;
            }
            id v16 = objc_alloc_init((Class)NSMutableArray);
            id v17 = objc_alloc_init((Class)NSMutableArray);
            id v42 = v15;
            unsigned int v18 = [v15 allNestedNonGroupChildItemsTreatingFreehandDrawingAsLeafNode];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v19 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v45;
              do
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(void *)v45 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    long long v24 = v16;
                  }
                  else {
                    long long v24 = v17;
                  }
                  [v24 addObject:v23];
                }
                id v20 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v20);
            }
            id v25 = [v16 count];
            id v26 = [v17 count];
            if (!v25 || v26)
            {
              if (!v25 && v26)
              {
                uint64_t v8 = v39;
                uint64_t v15 = v42;
                if (v37) {
                  [v40 addObject:v42];
                }
LABEL_38:

LABEL_39:
                goto LABEL_40;
              }
              unint64_t v33 = [v12 connectedLayouts];
              if ([v33 count]) {
                unsigned int v34 = v37;
              }
              else {
                unsigned int v34 = 0;
              }

              if (v34 == 1)
              {
                uint64_t v15 = v42;
                [v40 addObject:v42];
                uint64_t v8 = v39;
                goto LABEL_38;
              }
            }
            [v40 addObjectsFromArray:v16];
            uint64_t v8 = v39;
            uint64_t v15 = v42;
            goto LABEL_38;
          }
          [(CRLFreehandDrawingTool *)v38 icc];
          v28 = id v27 = v15;
          unsigned __int8 v29 = [v28 canvasEditor];
          unsigned int v30 = [v29 isLayoutSelectable:v10];

          uint64_t v15 = v27;
          if (!v30) {
            goto LABEL_40;
          }
          uint64_t v31 = objc_opt_class();
          uint64_t v32 = [v10 info];
          sub_1002469D0(v31, v32);
          id v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16) {
            [v40 addObject:v16];
          }
          uint64_t v15 = v27;
          goto LABEL_39;
        }
LABEL_40:
      }
      id v43 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v43)
      {
LABEL_42:

        id v4 = v36;
        break;
      }
    }
  }

  return v40;
}

- (id)p_allSelectionIneligibleItemsWithinMarqueeSelectionAreaInParentContainerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLFreehandDrawingTool *)self icc];
  unsigned int v7 = [v6 parentForFreehandDrawingLayoutsAtPoint:x, y];

  uint64_t v8 = [v7 children];
  double v9 = [(CRLFreehandDrawingToolMarquee *)self p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:v8];

  id v10 = [v9 crl_arrayByTransformingWithBlock:&stru_1014FE680];

  return v10;
}

- (id)p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:(id)a3
{
  id v4 = a3;
  double v5 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  id v26 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v26)
  {
    uint64_t v7 = *(void *)v28;
    uint64_t v25 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v6);
        }
        double v9 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = sub_1002469D0(v10, v9);
        id v12 = (objc_class *)objc_opt_class();
        unsigned __int8 v13 = [v11 info];
        uint64_t v14 = sub_10024715C(v12, v13);

        if (!v11 || ([v14 locked] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v9 isMemberOfClass:objc_opt_class()] & 1) != 0
            || ([v9 isMemberOfClass:objc_opt_class()] & 1) != 0)
          {
            if (v11 && ([v14 isFreehandDrawing] & 1) == 0)
            {
              uint64_t v15 = [v11 children];
              id v16 = [(CRLFreehandDrawingToolMarquee *)self p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:v15];
              [v5 addObjectsFromArray:v16];
            }
          }
          else
          {
            id v17 = [(CRLFreehandDrawingTool *)self icc];
            [v17 canvasEditor];
            id v18 = v6;
            id v19 = self;
            uint64_t v21 = v20 = v5;
            unsigned int v22 = [v21 isLayoutSelectable:v9];

            double v5 = v20;
            self = v19;
            id v6 = v18;
            uint64_t v7 = v25;

            if (v22) {
              [v5 addObject:v9];
            }
          }
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v26 != v8);
      id v23 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v26 = v23;
    }
    while (v23);
  }

  return v5;
}

- (void)p_presentEditMenuForLassoSelection
{
  id v9 = [(CRLFreehandDrawingTool *)self icc];
  v2 = [v9 layerHost];
  id v3 = [v2 asiOSCVC];

  id v4 = [v3 delegate];
  double v5 = [v4 currentDocumentMode];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = sub_1002469D0(v6, v5);
  uint64_t v8 = v7;
  if (v7) {
    [v7 presentEditMenuForLassoSelection];
  }
}

- (void)p_hideEditMenuForLassoSelection
{
  id v9 = [(CRLFreehandDrawingTool *)self icc];
  v2 = [v9 layerHost];
  id v3 = [v2 asiOSCVC];

  id v4 = [v3 delegate];
  double v5 = [v4 currentDocumentMode];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = sub_1002469D0(v6, v5);
  uint64_t v8 = v7;
  if (v7) {
    [v7 hideEditMenuForLassoSelection];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteMarqueeRenderable, 0);
  objc_storeStrong((id *)&self->_blackMarqueeRenderable, 0);
  objc_storeStrong((id *)&self->_windingCalculator, 0);
  objc_storeStrong((id *)&self->_selectionIneligiblePaths, 0);
  objc_storeStrong((id *)&self->_selectionEligiblePathToInfoDictionary, 0);
  objc_storeStrong((id *)&self->_hitTester, 0);
  objc_storeStrong((id *)&self->_hitTestingQueue, 0);

  objc_storeStrong((id *)&self->_pathCreator, 0);
}

@end