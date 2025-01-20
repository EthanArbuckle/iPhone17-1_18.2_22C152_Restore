@interface CRLFreehandDrawingToolEraser
- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3;
- (BOOL)isWholeObjectEraser;
- (CGRect)p_drawPath:(id)a3 inContext:(CGContext *)a4 drawingCommittedImageBehind:(BOOL)a5 additionalAlreadyOutsetUnscaledDirtyRect:(CGRect)a6;
- (CGRect)unscaledRectForMaskImageForErasing;
- (CGSize)p_maskImageSize;
- (CRLFreehandDrawingToolEraser)initWithInteractiveCanvasController:(id)a3 scaledWidthForSlicingEraser:(double)a4 wholeObject:(BOOL)a5;
- (NSArray)decoratorOverlayRenderables;
- (double)currentScaledEraserDiameter;
- (double)p_unscaledEraserDiameter;
- (double)scaledWidthForSlicingEraser;
- (id)maskImageForErasing;
- (id)p_copyOfPathCreatorPathCommittingAllAvailablePoints:(id)a3 optionallyAdditionallyCommittingIntoAdditionalPath:(id)a4;
- (int64_t)p_breakApartFilledShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 previousZOrderOffset:(int64_t)a6;
- (int64_t)p_breakApartOpenShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 strokePatternOffsetArray:(id)a6 previousZOrderOffset:(int64_t)a7;
- (int64_t)p_breakApartShape:(id)a3 withGeometry:(id)a4 subpaths:(id)a5 strokePatternOffsetArray:(id)a6 previousZOrderOffset:(int64_t)a7;
- (unint64_t)type;
- (void)doWorkBeforeCanvasLayout;
- (void)p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser;
- (void)p_updateFillMaskImage;
- (void)p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing;
- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5;
- (void)setScaledWidthForSlicingEraser:(double)a3;
- (void)setWholeObjectEraser:(BOOL)a3;
- (void)updatePencilKitToolIfAppropriateFor:(id)a3;
@end

@implementation CRLFreehandDrawingToolEraser

- (CRLFreehandDrawingToolEraser)initWithInteractiveCanvasController:(id)a3 scaledWidthForSlicingEraser:(double)a4 wholeObject:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingToolEraser;
  result = [(CRLFreehandDrawingTool *)&v9 initWithInteractiveCanvasController:a3];
  if (result)
  {
    result->_currentUnscaledEraserPoint = (CGPoint)xmmword_101175160;
    result->_scaledWidthForSlicingEraser = a4;
    result->_wholeObjectEraser = a5;
    CGSize size = CGRectNull.size;
    result->_lastDirtyRectForUncommittedFillMask.origin = CGRectNull.origin;
    result->_lastDirtyRectForUncommittedFillMask.CGSize size = size;
  }
  return result;
}

- (void)setScaledWidthForSlicingEraser:(double)a3
{
  if (self->_wholeObjectEraser)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8E88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B184C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8EA8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser setScaledWidthForSlicingEraser:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:119 isFatal:0 description:"Shouldn't be trying to set the width of a whole object eraser."];
  }
  self->_scaledWidthForSlicingEraser = a3;
  v8 = [(CRLFreehandDrawingTool *)self icc];
  objc_super v9 = [v8 freehandDrawingToolkit];

  v10 = [v9 toolkitUIState];
  [v10 setCurrentToolWidth:a3];

  [v9 containedToolDidSetWidth:self];
}

- (void)setWholeObjectEraser:(BOOL)a3
{
  BOOL v3 = a3;
  self->_wholeObjectEraser = a3;
  id v6 = [(CRLFreehandDrawingTool *)self icc];
  v4 = [v6 freehandDrawingToolkit];
  v5 = [v4 toolkitUIState];
  [v5 setEraserToolErasesWholeObjects:v3];
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v120.receiver = self;
  v120.super_class = (Class)CRLFreehandDrawingToolEraser;
  [(CRLFreehandDrawingTool *)&v120 performActionWithInputPoint:v8 isInitialPoint:v6 isFinalPoint:v5];
  objc_super v9 = [(CRLFreehandDrawingTool *)self icc];
  [v9 viewScale];
  double v11 = v10;
  [v8 unscaledPoint];
  self->_currentUnscaledEraserPoint.x = v12;
  self->_currentUnscaledEraserPoint.y = v13;
  v104 = v9;
  if (v6)
  {
    BOOL v97 = v6;
    [v9 addDecorator:self];
    v14 = +[NSMutableArray array];
    allHitTesterPathsZOrdered = self->_allHitTesterPathsZOrdered;
    self->_allHitTesterPathsZOrdered = v14;

    v16 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
    shapeLayoutsForHitTesterPaths = self->_shapeLayoutsForHitTesterPaths;
    self->_shapeLayoutsForHitTesterPaths = v16;

    v18 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
    currentPathsForHitTesterPaths = self->_currentPathsForHitTesterPaths;
    self->_currentPathsForHitTesterPaths = v18;

    v20 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
    patternOffsetsBySubpathForHitTesterPaths = self->_patternOffsetsBySubpathForHitTesterPaths;
    self->_patternOffsetsBySubpathForHitTesterPaths = v20;

    v22 = +[NSHashTable hashTableWithOptions:512];
    hitTesterPathsNeedingFinalizationAtEnd = self->_hitTesterPathsNeedingFinalizationAtEnd;
    self->_hitTesterPathsNeedingFinalizationAtEnd = v22;

    double v24 = ceil(10.0 / fmin(v11, 1.0));
    v25 = [[CRLBezierHitTester alloc] initWithBucketSize:v24];
    strokeHitTester = self->_strokeHitTester;
    self->_strokeHitTester = v25;

    v27 = [[CRLBezierHitTester alloc] initWithBucketSize:v24];
    fillHitTester = self->_fillHitTester;
    self->_fillHitTester = v27;

    [v9 visibleUnscaledRect];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = +[CRLBezierPath bezierPath];
    unscaledStrokeEraserPathToCommit = self->_unscaledStrokeEraserPathToCommit;
    self->_unscaledStrokeEraserPathToCommit = v37;

    v39 = +[CRLBezierPath bezierPath];
    unscaledFillEraserPathToCommit = self->_unscaledFillEraserPathToCommit;
    self->_unscaledFillEraserPathToCommit = v39;

    v98 = v8;
    [v8 unscaledPoint];
    [(CRLFreehandDrawingTool *)self possibleFreehandDrawingLayoutsInParentContainerAtPoint:"possibleFreehandDrawingLayoutsInParentContainerAtPoint:"];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v101 = [obj countByEnumeratingWithState:&v116 objects:v128 count:16];
    if (v101)
    {
      uint64_t v100 = *(void *)v117;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v117 != v100) {
            objc_enumerationMutation(obj);
          }
          uint64_t v103 = v41;
          v42 = *(void **)(*((void *)&v116 + 1) + 8 * v41);
          uint64_t v43 = objc_opt_class();
          v44 = [v42 info];
          v45 = sub_1002469D0(v43, v44);

          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          v102 = v45;
          id v107 = [v45 childInfos];
          v46 = &off_1014C1000;
          id v108 = [v107 countByEnumeratingWithState:&v112 objects:v127 count:16];
          if (v108)
          {
            uint64_t v47 = *(void *)v113;
            uint64_t v106 = *(void *)v113;
            do
            {
              v48 = 0;
              do
              {
                if (*(void *)v113 != v47) {
                  objc_enumerationMutation(v107);
                }
                uint64_t v49 = *(void *)(*((void *)&v112 + 1) + 8 * (void)v48);
                uint64_t v50 = objc_opt_class();
                v51 = [v9 layoutForInfo:v49];
                v52 = sub_1002469D0(v50, v51);

                if (v52)
                {
                  v53 = [v52 pathSource];
                  v54 = [v53 bezierPath];

                  [v52 pureTransformInRoot];
                  [v54 transformUsingAffineTransform:v111];
                  v55 = [v52 shapeInfo];
                  unsigned __int8 v56 = [v55 isTreatedAsFillForFreehandDrawing];

                  if (v56)
                  {
                    -[CRLBezierHitTester addPath:filled:clippedToRect:](self->_fillHitTester, "addPath:filled:clippedToRect:", v54, 1, v30, v32, v34, v36);
                  }
                  else
                  {
                    [v54 convertCloseElementsToLineElements];
                    v57 = [v52 stroke];
                    [v57 width];
                    double v59 = v58;

                    v129.origin.x = v30;
                    v129.origin.y = v32;
                    v129.size.width = v34;
                    v129.size.height = v36;
                    CGRect v130 = CGRectInset(v129, -v59, -v59);
                    -[CRLBezierHitTester addPath:filled:clippedToRect:](self->_strokeHitTester, "addPath:filled:clippedToRect:", v54, 0, v130.origin.x, v130.origin.y, v130.size.width, v130.size.height);
                    if (v59 > self->_widthOfThickestStrokePossiblyBeingErased) {
                      self->_widthOfThickestStrokePossiblyBeingErased = v59;
                    }
                  }
                  [(NSMutableArray *)self->_allHitTesterPathsZOrdered addObject:v54];
                  [(NSMapTable *)self->_shapeLayoutsForHitTesterPaths setObject:v52 forKeyedSubscript:v54];
                  [(NSMapTable *)self->_currentPathsForHitTesterPaths setObject:v54 forKeyedSubscript:v54];
                  uint64_t v60 = objc_opt_class();
                  v61 = [v52 stroke];
                  v62 = sub_1002469D0(v60, v61);

                  if (v62)
                  {
                    v63 = [v52 shapeInfo];
                    [v63 strokePatternOffsetDistance];
                    v64 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

                    v65 = [(__objc2_class *)v46[76] array];
                    if ([v54 elementCount])
                    {
                      unint64_t v66 = 0;
                      do
                      {
                        if (![v54 elementAtIndex:v66]) {
                          [v65 addObject:v64];
                        }
                        ++v66;
                      }
                      while (v66 < (unint64_t)[v54 elementCount]);
                    }
                    [v64 floatValue];
                    if (v67 != 0.0 && (unint64_t)[v65 count] >= 2)
                    {
                      unsigned int v105 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                      if (qword_101719A70 != -1) {
                        dispatch_once(&qword_101719A70, &stru_1014F8EC8);
                      }
                      v68 = off_10166B4A0;
                      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109890;
                        *(_DWORD *)&buf[4] = v105;
                        *(_WORD *)&buf[8] = 2082;
                        *(void *)&buf[10] = "-[CRLFreehandDrawingToolEraser performActionWithInputPoint:isInitialPoint:isFinalPoint:]";
                        *(_WORD *)&buf[18] = 2082;
                        *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreeha"
                                              "ndDrawingToolEraser.m";
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = 208;
                        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We don't expect a nonzero patternOffsetDistance and mutliple subpaths.", buf, 0x22u);
                      }
                      if (qword_101719A70 != -1) {
                        dispatch_once(&qword_101719A70, &stru_1014F8EE8);
                      }
                      v69 = off_10166B4A0;
                      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                      {
                        v72 = v69;
                        v73 = +[CRLAssertionHandler packedBacktraceString];
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)&buf[4] = v105;
                        *(_WORD *)&buf[8] = 2114;
                        *(void *)&buf[10] = v73;
                        _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                      }
                      v70 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser performActionWithInputPoint:isInitialPoint:isFinalPoint:]");
                      v71 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
                      +[CRLAssertionHandler handleFailureInFunction:v70 file:v71 lineNumber:208 isFatal:0 description:"We don't expect a nonzero patternOffsetDistance and mutliple subpaths."];

                      objc_super v9 = v104;
                      v46 = &off_1014C1000;
                    }
                    [(NSMapTable *)self->_patternOffsetsBySubpathForHitTesterPaths setObject:v65 forKeyedSubscript:v54];

                    uint64_t v47 = v106;
                  }
                }
                v48 = (char *)v48 + 1;
              }
              while (v48 != v108);
              id v108 = [v107 countByEnumeratingWithState:&v112 objects:v127 count:16];
            }
            while (v108);
          }

          uint64_t v41 = v103 + 1;
        }
        while ((id)(v103 + 1) != v101);
        id v101 = [obj countByEnumeratingWithState:&v116 objects:v128 count:16];
      }
      while (v101);
    }
    v74 = [[CRLFreehandDrawingPathCreator alloc] initWithPencilKitSmoothing:0];
    strokePathCreator = self->_strokePathCreator;
    self->_strokePathCreator = v74;

    id v8 = v98;
    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](self->_strokePathCreator, "beginDrawingWithViewScale:inputType:", [v98 inputType], v11);
    v76 = objc_alloc_init(CRLFreehandDrawingPathCreator);
    fillPathCreator = self->_fillPathCreator;
    self->_fillPathCreator = v76;

    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](self->_fillPathCreator, "beginDrawingWithViewScale:inputType:", [v98 inputType], v11);
    LOBYTE(v6) = v97;
  }
  if ([(CRLFreehandDrawingPathCreator *)self->_strokePathCreator inputPointCount] >= 0x64)
  {
    v78 = [(CRLFreehandDrawingPathCreator *)self->_strokePathCreator handoffToNewPathCreator];
    v79 = self->_strokePathCreator;
    self->_strokePathCreator = v78;
  }
  if (v6 || ([v8 wasAddedByTouchesEnded] & 1) == 0)
  {
    v80 = self->_strokePathCreator;
    [v8 unscaledPoint];
    double v82 = v81;
    double v84 = v83;
    [v8 time];
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v80, "drawToPoint:atTime:predicted:", [v8 isPredicted], v82, v84, v85);
    v86 = self->_fillPathCreator;
    [v8 unscaledPoint];
    double v88 = v87;
    double v90 = v89;
    [v8 time];
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v86, "drawToPoint:atTime:predicted:", [v8 isPredicted], v88, v90, v91);
  }
  [(CRLFreehandDrawingToolEraser *)self p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing];
  if ([v8 inputType] == (id)2)
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v122 = 0u;
    memset(buf, 0, sizeof(buf));
    v92 = [(CRLFreehandDrawingTool *)self icc];
    uint64_t v93 = [v92 freehandDrawingToolkit];
    v94 = (void *)v93;
    if (v8)
    {
      [v8 PKInputPoint];
      if (v94)
      {
LABEL_49:
        [v94 inputPointInPKCanvasViewFromUnscaledSpace:v110];
LABEL_52:

        v95 = [(CRLFreehandDrawingTool *)self icc];
        v96 = [v95 freehandDrawingToolkit];
        v109[4] = v123;
        v109[5] = v124;
        v109[6] = v125;
        v109[7] = v126;
        v109[0] = *(_OWORD *)buf;
        v109[1] = *(_OWORD *)&buf[16];
        v109[2] = *(_OWORD *)&buf[32];
        v109[3] = v122;
        [v96 updatePencilShadowWithInputPoint:v109];

        goto LABEL_53;
      }
    }
    else
    {
      memset(v110, 0, sizeof(v110));
      if (v93) {
        goto LABEL_49;
      }
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v122 = 0u;
    memset(buf, 0, sizeof(buf));
    goto LABEL_52;
  }
LABEL_53:
  [v104 invalidateLayersForDecorator:self];
}

- (void)doWorkBeforeCanvasLayout
{
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingToolEraser;
  [(CRLFreehandDrawingTool *)&v4 doWorkBeforeCanvasLayout];
  if (![(CRLFreehandDrawingToolEraser *)self isWholeObjectEraser]
    && (self->_currentUnscaledEraserPoint.x != INFINITY || self->_currentUnscaledEraserPoint.y != INFINITY))
  {
    if ([(CRLBezierHitTester *)self->_strokeHitTester pathCount]) {
      [(CRLFreehandDrawingToolEraser *)self p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser];
    }
    if ([(CRLBezierHitTester *)self->_fillHitTester pathCount]) {
      [(CRLFreehandDrawingToolEraser *)self p_updateFillMaskImage];
    }
  }
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  BOOL v3 = self;
  v137.receiver = self;
  v137.super_class = (Class)CRLFreehandDrawingToolEraser;
  LODWORD(v4) = [(CRLFreehandDrawingTool *)&v137 finalizeAndResetWithSuccess:a3];
  long long v112 = [(CRLFreehandDrawingTool *)v3 icc];
  [(CRLFreehandDrawingPathCreator *)v3->_strokePathCreator endDrawing];
  [(CRLFreehandDrawingPathCreator *)v3->_fillPathCreator endDrawing];
  BOOL v5 = &OBJC_IVAR___CRLStrokePattern__phase;
  BOOL v6 = &OBJC_IVAR___CRLStrokePattern__phase;
  if (!v4)
  {
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v22 = v3->_hitTesterPathsNeedingFinalizationAtEnd;
    id v23 = [(NSHashTable *)v22 countByEnumeratingWithState:&v124 objects:v138 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v125;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v125 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [(NSMapTable *)v3->_shapeLayoutsForHitTesterPaths objectForKeyedSubscript:*(void *)(*((void *)&v124 + 1) + 8 * i)];
          [v27 endDynamicOperation];
        }
        id v24 = [(NSHashTable *)v22 countByEnumeratingWithState:&v124 objects:v138 count:16];
      }
      while (v24);
    }
    goto LABEL_64;
  }
  [(CRLFreehandDrawingToolEraser *)v3 p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing];
  if (![(CRLFreehandDrawingToolEraser *)v3 isWholeObjectEraser]) {
    [(CRLFreehandDrawingToolEraser *)v3 p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser];
  }
  v7 = [(NSMutableArray *)v3->_allHitTesterPathsZOrdered crl_arrayWithObjectsInHashTable:v3->_hitTesterPathsNeedingFinalizationAtEnd];
  id v8 = +[NSHashTable hashTableWithOptions:512];
  objc_super v9 = [(CRLFreehandDrawingTool *)v3 icc];
  double v10 = [v9 editingCoordinator];
  double v11 = [v10 commandController];

  [v11 openGroup];
  CGFloat v12 = +[NSBundle mainBundle];
  CGFloat v13 = [v12 localizedStringForKey:@"Erase" value:0 table:@"UndoStrings"];
  v111 = v11;
  [v11 setCurrentGroupActionString:v13];

  v121 = v8;
  char v110 = (char)v4;
  if (![(CRLFreehandDrawingToolEraser *)v3 isWholeObjectEraser])
  {
    id obj = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v109 = v7;
    id v113 = v7;
    id v118 = [v113 countByEnumeratingWithState:&v129 objects:v150 count:16];
    uint64_t v21 = 0;
    if (!v118) {
      goto LABEL_58;
    }
    uint64_t v116 = *(void *)v130;
    p_isa = (id *)&v3->super.super.isa;
    while (1)
    {
      v28 = 0;
      do
      {
        if (*(void *)v130 != v116) {
          objc_enumerationMutation(v113);
        }
        uint64_t v29 = *(void *)(*((void *)&v129 + 1) + 8 * (void)v28);
        double v30 = [*(id *)((char *)&v3->super.super.isa + v5[676]) objectForKeyedSubscript:v29];
        double v31 = [v30 shapeInfo];
        unsigned int v32 = [v31 isTreatedAsFillForFreehandDrawing];

        if (!v32)
        {
          if ([v30 isInvisible])
          {
            [v30 endDynamicOperation];
            double v36 = [v30 shapeInfo];
            [v8 addObject:v36];
            goto LABEL_56;
          }
          uint64_t v114 = v29;
          uint64_t v122 = v21;
          goto LABEL_45;
        }
        if (!v21)
        {
          id v33 = [(CRLFreehandDrawingPathCreator *)v3->_fillPathCreator copyOfEntirePath];
          [(CRLFreehandDrawingToolEraser *)v3 p_unscaledEraserDiameter];
          [v33 setLineWidth:];
          [v33 setLineCapStyle:1];
          [v33 setLineJoinStyle:1];
          uint64_t v21 = [v33 strokedCopy];
        }
        uint64_t v34 = objc_opt_class();
        double v35 = [v112 repForLayout:v30];
        double v36 = sub_1002469D0(v34, v35);

        [v36 setFreehandDrawingDynamicFillErasingDelegate:0];
        uint64_t v114 = v29;
        v37 = [(NSMapTable *)v3->_currentPathsForHitTesterPaths objectForKeyedSubscript:v29];
        v149[0] = v37;
        uint64_t v122 = v21;
        v149[1] = v21;
        v38 = +[NSArray arrayWithObjects:v149 count:2];
        v39 = +[CRLBezierPath subtractBezierPaths:v38];

        if (!v39)
        {
          unsigned int v40 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F8F08);
          }
          uint64_t v41 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v140 = v40;
            __int16 v141 = 2082;
            v142 = "-[CRLFreehandDrawingToolEraser finalizeAndResetWithSuccess:]";
            __int16 v143 = 2082;
            v144 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
            __int16 v145 = 1024;
            int v146 = 336;
            __int16 v147 = 2082;
            v148 = "pathWithErasure";
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F8F28);
          }
          v42 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v73 = v42;
            v74 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v140 = v40;
            __int16 v141 = 2114;
            v142 = v74;
            _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          uint64_t v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser finalizeAndResetWithSuccess:]");
          v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 336, 0, "invalid nil value for '%{public}s'", "pathWithErasure");

          BOOL v5 = &OBJC_IVAR___CRLStrokePattern__phase;
        }
        if ([v39 containsElementsOtherThanMoveAndClose])
        {
          id v45 = [v39 copy];
          [v45 bounds];
          double v47 = v46;
          double v49 = v48;
          CGAffineTransformMakeTranslation(&v128, -v46, -v48);
          [v45 transformUsingAffineTransform:&v128];
          uint64_t v50 = +[CRLBezierPathSource pathSourceWithBezierPath:v45];
          [v30 dynamicallySetBezierPathSource:v50 atUnscaledOrigin:v47];

LABEL_45:
          double v36 = [v30 pathSource];
          v52 = [v30 finalInfoGeometryForResize];
          [v30 endDynamicOperation];
          v53 = [v30 shapeInfo];
          v54 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v53 pathSource:v36];
          [v111 enqueueCommand:v54];
          v55 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v53 geometry:v52];
          [v111 enqueueCommand:v55];
          unsigned __int8 v56 = [v53 parentInfo];
          v57 = (objc_class *)objc_opt_class();
          v63 = sub_100246E2C(v56, v57, 1, v58, v59, v60, v61, v62, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);

          if (v63
            && ([obj objectForKeyedSubscript:v63],
                (v64 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v65 = v64;
            objc_super v120 = (char *)[v64 integerValue];
          }
          else
          {
            objc_super v120 = 0;
          }
          unint64_t v66 = [v30 shapeInfo];
          unsigned int v67 = [v66 isTreatedAsFillForFreehandDrawing];

          if (v67)
          {
            v68 = [v36 bezierPath];
            id v69 = [p_isa p_breakApartFilledShapeIfPossible:v53 withDesiredGeometry:v52 bezierPath:v68 previousZOrderOffset:v120];
          }
          else
          {
            v68 = [p_isa[14] objectForKeyedSubscript:v114];
            [v36 bezierPath];
            long long v115 = v36;
            v71 = v70 = v54;
            id v69 = [p_isa p_breakApartOpenShapeIfPossible:v53 withDesiredGeometry:v52 bezierPath:v71 strokePatternOffsetArray:v68 previousZOrderOffset:v120];

            v54 = v70;
            double v36 = v115;
          }

          if (v63)
          {
            v72 = +[NSNumber numberWithInteger:&v120[(void)v69]];
            [obj setObject:v72 forKeyedSubscript:v63];
          }
          BOOL v3 = (CRLFreehandDrawingToolEraser *)p_isa;
          BOOL v5 = &OBJC_IVAR___CRLStrokePattern__phase;
          id v8 = v121;
          goto LABEL_55;
        }
        [v30 endDynamicOperation];
        v51 = [v30 shapeInfo];
        [v8 addObject:v51];

LABEL_55:
        uint64_t v21 = v122;
LABEL_56:

        v28 = (char *)v28 + 1;
      }
      while (v118 != v28);
      id v118 = [v113 countByEnumeratingWithState:&v129 objects:v150 count:16];
      if (!v118)
      {
LABEL_58:

        BOOL v6 = &OBJC_IVAR___CRLStrokePattern__phase;
        v7 = v109;
        goto LABEL_60;
      }
    }
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = v7;
  id v14 = [obj countByEnumeratingWithState:&v133 objects:v151 count:16];
  if (v14)
  {
    id v15 = v14;
    v16 = v7;
    uint64_t v17 = *(void *)v134;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v134 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = [(NSMapTable *)v3->_shapeLayoutsForHitTesterPaths objectForKeyedSubscript:*(void *)(*((void *)&v133 + 1) + 8 * (void)j)];
        [v19 endDynamicOperation];
        v20 = [v19 shapeInfo];
        [v121 addObject:v20];
      }
      id v15 = [obj countByEnumeratingWithState:&v133 objects:v151 count:16];
    }
    while (v15);
    uint64_t v21 = 0;
    v7 = v16;
    id v8 = v121;
  }
  else
  {
    uint64_t v21 = 0;
  }
LABEL_60:
  long long v123 = (NSHashTable *)v21;

  if ([v8 count])
  {
    v75 = [v8 setRepresentation];
    v76 = [(CRLFreehandDrawingTool *)v3 icc];
    [v76 canvasEditor];
    v78 = v77 = v7;
    v79 = [v78 canvasEditorHelper];
    [v79 selectionBehaviorForDeletingBoardItems:v75];
    double v81 = v80 = v8;

    [v81 setSelectionFlags:((unint64_t)[v81 selectionFlags]) & 0xFFFFFFFFFFFFFFFBLL];
    double v82 = [v112 canvasEditor];
    double v83 = [v82 canvasEditorHelper];
    double v84 = [v83 commandForDeletingInfosPossiblyFromMultipleContainers:v75 shouldRemoveEmptyContainers:1];

    v7 = v77;
    objc_super v4 = v111;
    [v111 enqueueCommand:v84 withSelectionBehavior:v81];

    double v85 = 0;
  }
  else
  {
    v86 = [(CRLFreehandDrawingTool *)v3 icc];
    [v86 editorController];
    double v87 = v80 = v8;
    v75 = [v87 selectionPath];

    double v85 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v75 reverseSelectionPath:v75];
    objc_super v4 = v111;
  }

  double v88 = [(CRLFreehandDrawingTool *)v3 icc];
  double v89 = [v88 pkDrawingProvider];
  [v89 activeDrawingWillEndAfterInsertingFinalizedDrawingItem];

  [v4 closeGroupWithSelectionBehavior:v85];
  v22 = v123;
  LOBYTE(v4) = v110;
LABEL_64:

  double v90 = [(CRLFreehandDrawingTool *)v3 icc];
  [v90 removeDecorator:v3];

  v3->_currentUnscaledEraserPoint = (CGPoint)xmmword_101175160;
  strokePathCreator = v3->_strokePathCreator;
  v3->_strokePathCreator = 0;

  fillPathCreator = v3->_fillPathCreator;
  v3->_fillPathCreator = 0;

  strokeHitTester = v3->_strokeHitTester;
  v3->_strokeHitTester = 0;

  fillHitTester = v3->_fillHitTester;
  v3->_fillHitTester = 0;

  uint64_t v95 = v6[675];
  v96 = *(Class *)((char *)&v3->super.super.isa + v95);
  *(Class *)((char *)&v3->super.super.isa + v95) = 0;

  uint64_t v97 = v5[676];
  v98 = *(Class *)((char *)&v3->super.super.isa + v97);
  *(Class *)((char *)&v3->super.super.isa + v97) = 0;

  currentPathsForHitTesterPaths = v3->_currentPathsForHitTesterPaths;
  v3->_currentPathsForHitTesterPaths = 0;

  hitTesterPathsNeedingFinalizationAtEnd = v3->_hitTesterPathsNeedingFinalizationAtEnd;
  v3->_hitTesterPathsNeedingFinalizationAtEnd = 0;

  v3->_widthOfThickestStrokePossiblyBeingErased = 0.0;
  fillMaskImageForErasing = v3->_fillMaskImageForErasing;
  v3->_fillMaskImageForErasing = 0;

  unscaledStrokeEraserPathToCommit = v3->_unscaledStrokeEraserPathToCommit;
  v3->_unscaledStrokeEraserPathToCommit = 0;

  unscaledFillEraserPathToCommit = v3->_unscaledFillEraserPathToCommit;
  v3->_unscaledFillEraserPathToCommit = 0;

  committedFillEraserPathCtx = v3->_committedFillEraserPathCtx;
  if (committedFillEraserPathCtx)
  {
    CGContextRelease(committedFillEraserPathCtx);
    v3->_committedFillEraserPathCtx = 0;
  }
  fillEraserPathCtx = v3->_fillEraserPathCtx;
  if (fillEraserPathCtx)
  {
    CGContextRelease(fillEraserPathCtx);
    v3->_fillEraserPathCtx = 0;
  }
  committedFillMaskImageForErasingPositionedInVisibleCanvasRect = v3->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
  if (committedFillMaskImageForErasingPositionedInVisibleCanvasRect)
  {
    CGImageRelease(committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
    v3->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = 0;
  }
  CGSize size = CGRectNull.size;
  v3->_lastDirtyRectForUncommittedFillMask.origin = CGRectNull.origin;
  v3->_lastDirtyRectForUncommittedFillMask.CGSize size = size;

  return (char)v4;
}

- (unint64_t)type
{
  return 8;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLFreehandDrawingTool *)self icc];
  BOOL v6 = [v5 freehandDrawingToolkit];
  v7 = [v6 toolkitUIState];
  [v7 strokeWidthsForFreehandDrawingToolType:[self type]];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = objc_alloc((Class)PKEraserTool);
  objc_super v9 = [v11 lastObject];
  [v9 crl_CGFloatValue];
  id v10 = [v8 initWithEraserType:2];

  [v4 setTool:v10];
}

- (NSArray)decoratorOverlayRenderables
{
  p_currentUnscaledEraserPoint = &self->_currentUnscaledEraserPoint;
  if (self->_currentUnscaledEraserPoint.x == INFINITY && self->_currentUnscaledEraserPoint.y == INFINITY)
  {
    v28 = &__NSArray0__struct;
  }
  else
  {
    [(CRLFreehandDrawingToolEraser *)self p_unscaledEraserDiameter];
    double v6 = v5;
    v7 = +[CRLCanvasShapeRenderable renderable];
    id v8 = [(CRLFreehandDrawingTool *)self icc];
    [v7 setDelegate:v8];

    [v7 setLineWidth:1.0];
    [v7 setFillColor:0];
    objc_super v9 = [(CRLFreehandDrawingTool *)self icc];
    id v10 = [v9 freehandDrawingToolkit];
    id v11 = [v10 defaultOutlineColor];
    [v7 setStrokeColor:[v11 CGColor]];

    double v12 = sub_10006402C(p_currentUnscaledEraserPoint->x, p_currentUnscaledEraserPoint->y, v6);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    v19 = [(CRLFreehandDrawingTool *)self icc];
    [v19 viewScale];
    CGFloat v21 = v20;
    v22 = [(CRLFreehandDrawingTool *)self icc];
    [v22 viewScale];
    CGAffineTransformMakeScale(&v48, v21, v23);
    v50.origin.double x = v12;
    v50.origin.double y = v14;
    v50.size.double width = v16;
    v50.size.double height = v18;
    CGRect v51 = CGRectApplyAffineTransform(v50, &v48);
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;

    [v7 setFrame:x, y, width, height];
    if ([(CRLFreehandDrawingToolEraser *)self isWholeObjectEraser])
    {
      [v7 setPath:0];
    }
    else
    {
      double v29 = sub_100064070();
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      double v36 = [(CRLFreehandDrawingTool *)self icc];
      [v36 viewScale];
      CGFloat v38 = v37;
      v39 = [(CRLFreehandDrawingTool *)self icc];
      [v39 viewScale];
      CGAffineTransformMakeScale(&v47, v38, v40);
      v52.origin.double x = v29;
      v52.origin.double y = v31;
      v52.size.double width = v33;
      v52.size.double height = v35;
      CGRect v53 = CGRectApplyAffineTransform(v52, &v47);
      double v41 = v53.origin.x;
      double v42 = v53.origin.y;
      double v43 = v53.size.width;
      double v44 = v53.size.height;

      +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v41, v42, v43, v44);
      id v45 = objc_claimAutoreleasedReturnValue();
      [v7 setPath:[v45 CGPath]];
    }
    v28 = [&__NSArray0__struct arrayByAddingObject:v7];
  }

  return (NSArray *)v28;
}

- (CGRect)unscaledRectForMaskImageForErasing
{
  v2 = [(CRLFreehandDrawingTool *)self icc];
  BOOL v3 = [v2 canvasView];
  id v4 = [v3 enclosingScrollView];
  double v5 = [v2 canvasView];
  double v6 = [v5 canvasLayer];

  v7 = [v2 canvasView];
  id v8 = [v7 enclosingScrollView];
  objc_super v9 = [v8 layer];

  [v4 bounds];
  [v9 convertRect:v6 toLayer:];
  [v2 convertBoundsToUnscaledRect:];
  CGRect v19 = CGRectIntegral(v18);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)maskImageForErasing
{
  fillMaskImageForErasing = self->_fillMaskImageForErasing;
  if (!fillMaskImageForErasing)
  {
    [(CRLFreehandDrawingToolEraser *)self p_updateFillMaskImage];
    fillMaskImageForErasing = self->_fillMaskImageForErasing;
  }

  return fillMaskImageForErasing;
}

- (double)currentScaledEraserDiameter
{
  if ([(CRLFreehandDrawingToolEraser *)self isWholeObjectEraser]) {
    return 16.0;
  }

  [(CRLFreehandDrawingToolEraser *)self scaledWidthForSlicingEraser];
  return result;
}

- (double)p_unscaledEraserDiameter
{
  [(CRLFreehandDrawingToolEraser *)self currentScaledEraserDiameter];
  double v4 = v3;
  double v5 = [(CRLFreehandDrawingTool *)self icc];
  [v5 viewScale];
  double v7 = v4 / v6;

  return v7;
}

- (id)p_copyOfPathCreatorPathCommittingAllAvailablePoints:(id)a3 optionallyAdditionallyCommittingIntoAdditionalPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 pointCountAvailableToCommit])
  {
    id v8 = [v6 copyOfUncommittedPath];
    if (v8) {
      goto LABEL_16;
    }
    goto LABEL_7;
  }
  id v8 = [v6 commitAllAvailablePoints];
  if (v7) {
    [v7 appendBezierPath:v8 skippingInitialMoveIfPossible:1];
  }
  id v9 = [v6 copyOfUncommittedPath];
  [v8 appendBezierPath:v9 skippingInitialMoveIfPossible:1];

  if (!v8)
  {
LABEL_7:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8F48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B18D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8F68);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:578 isFatal:0 description:"Path creator should always provide some kind of path."];

    id v8 = +[CRLBezierPath bezierPath];
  }
LABEL_16:
  [(CRLFreehandDrawingToolEraser *)self p_unscaledEraserDiameter];
  [v8 setLineWidth:];
  [v8 setLineCapStyle:1];
  [v8 setLineJoinStyle:1];

  return v8;
}

- (void)p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser
{
  v2 = self;
  if ([(CRLFreehandDrawingToolEraser *)self isWholeObjectEraser])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8F88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B195C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8FA8);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:590 isFatal:0 description:"This method should only be called for slicing erasers."];
  }
  [(CRLFreehandDrawingToolEraser *)v2 p_unscaledEraserDiameter];
  double v7 = v6;
  double widthOfThickestStrokePossiblyBeingErased = v2->_widthOfThickestStrokePossiblyBeingErased;
  if ([(CRLBezierPath *)v2->_unscaledStrokeEraserPathToCommit containsElementsOtherThanMoveAndClose])
  {
    id v9 = [(CRLBezierHitTester *)v2->_strokeHitTester wrappedAllHitsAlongPath:v2->_unscaledStrokeEraserPathToCommit withSearchThreshold:(v7 + widthOfThickestStrokePossiblyBeingErased) * 0.5];
    uint64_t v10 = +[CRLBezierPath bezierPath];
    unscaledStrokeEraserPathToCommit = v2->_unscaledStrokeEraserPathToCommit;
    v2->_unscaledStrokeEraserPathToCommit = (CRLBezierPath *)v10;

    id v76 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:16];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v97 objects:v112 count:16];
    v77 = v2;
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v98;
      uint64_t v72 = *(void *)v98;
      do
      {
        double v15 = 0;
        id v73 = v13;
        do
        {
          if (*(void *)v98 != v14) {
            objc_enumerationMutation(obj);
          }
          double v16 = *(void **)(*((void *)&v97 + 1) + 8 * (void)v15);
          currentPathsForHitTesterPaths = v2->_currentPathsForHitTesterPaths;
          CGRect v18 = [v16 hitPath];
          CGRect v19 = [(NSMapTable *)currentPathsForHitTesterPaths objectForKeyedSubscript:v18];

          if (v19)
          {
            shapeLayoutsForHitTesterPaths = v2->_shapeLayoutsForHitTesterPaths;
            CGFloat v21 = [v16 hitPath];
            v22 = [(NSMapTable *)shapeLayoutsForHitTesterPaths objectForKeyedSubscript:v21];

            CGFloat v23 = [v22 stroke];
            double v24 = 0.0;
            if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) && [v23 cap])
            {
              [v23 width];
              double v24 = v25;
              char v26 = 0;
            }
            else
            {
              char v26 = 1;
            }
            [v23 width];
            double v28 = v27;
            if (v16)
            {
              [v16 hitInfo];
              double v29 = v96;
            }
            else
            {
              double v96 = 0.0;
              long long v94 = 0u;
              long long v95 = 0u;
              double v29 = 0.0;
              long long v93 = 0u;
            }
            if (v29 < (v7 + v28) * 0.5)
            {
              patternOffsetsBySubpathForHitTesterPaths = v2->_patternOffsetsBySubpathForHitTesterPaths;
              CGFloat v31 = [v16 hitPath];
              double v32 = [(NSMapTable *)patternOffsetsBySubpathForHitTesterPaths objectForKeyedSubscript:v31];
              id v33 = [v32 mutableCopy];

              if (v16)
              {
                [v16 hitInfo];
                double v34 = *((double *)&v89 + 1);
                double v35 = *(double *)&v89;
              }
              else
              {
                uint64_t v92 = 0;
                long long v90 = 0u;
                long long v91 = 0u;
                double v34 = 0.0;
                double v35 = 0.0;
                long long v89 = 0u;
              }
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472;
              v83[2] = sub_100427480;
              v83[3] = &unk_1014F8FD0;
              double v86 = v7;
              id v36 = v23;
              char v88 = v26;
              id v84 = v36;
              double v85 = v16;
              double v87 = v7 + v24;
              [v36 width];
              CGFloat v38 = [v19 pathByCreatingHoleInPathAtPoint:v83 withDiameter:v33 andThreshold:v35 updatingPatternOffsetsBySubpath:(v7 + v37) * 0.5];
              if (v38)
              {
                v39 = [v16 hitPath];
                [v76 setObject:v38 forKeyedSubscript:v39];

                CGFloat v40 = v77->_currentPathsForHitTesterPaths;
                double v41 = [v16 hitPath];
                [(NSMapTable *)v40 setObject:v38 forKeyedSubscript:v41];

                double v42 = v77->_patternOffsetsBySubpathForHitTesterPaths;
                double v43 = [v16 hitPath];
                [(NSMapTable *)v42 setObject:v33 forKeyedSubscript:v43];
              }
              v2 = v77;
              id v13 = v73;
              uint64_t v14 = v72;
            }
          }
          double v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [obj countByEnumeratingWithState:&v97 objects:v112 count:16];
      }
      while (v13);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    [v76 crl_allKeys];
    id v74 = (id)objc_claimAutoreleasedReturnValue();
    id v44 = [v74 countByEnumeratingWithState:&v79 objects:v111 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v80;
      do
      {
        CGAffineTransform v47 = 0;
        do
        {
          if (*(void *)v80 != v46) {
            objc_enumerationMutation(v74);
          }
          uint64_t v48 = *(void *)(*((void *)&v79 + 1) + 8 * (void)v47);
          double v49 = [(NSMapTable *)v2->_shapeLayoutsForHitTesterPaths objectForKeyedSubscript:v48];
          if (!v49)
          {
            unsigned int v50 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F8FF0);
            }
            CGRect v51 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v102 = v50;
              __int16 v103 = 2082;
              v104 = "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]";
              __int16 v105 = 2082;
              uint64_t v106 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              __int16 v107 = 1024;
              int v108 = 682;
              __int16 v109 = 2082;
              char v110 = "currentShapeLayout";
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9010);
            }
            CGRect v52 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v68 = v52;
              id v69 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v102 = v50;
              __int16 v103 = 2114;
              v104 = v69;
              _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            CGRect v53 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]");
            v54 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v53, v54, 682, 0, "invalid nil value for '%{public}s'", "currentShapeLayout");

            v2 = v77;
          }
          v55 = [v76 objectForKeyedSubscript:v48];
          if (!v55)
          {
            unsigned int v56 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9030);
            }
            v57 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v102 = v56;
              __int16 v103 = 2082;
              v104 = "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]";
              __int16 v105 = 2082;
              uint64_t v106 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              __int16 v107 = 1024;
              int v108 = 685;
              __int16 v109 = 2082;
              char v110 = "unscaledUpdatedPath";
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9050);
            }
            uint64_t v58 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v70 = v58;
              v71 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v102 = v56;
              __int16 v103 = 2114;
              v104 = v71;
              _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            uint64_t v59 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]");
            uint64_t v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v59, v60, 685, 0, "invalid nil value for '%{public}s'", "unscaledUpdatedPath");

            v2 = v77;
          }
          if (![(NSHashTable *)v2->_hitTesterPathsNeedingFinalizationAtEnd containsObject:v48])
          {
            [(NSHashTable *)v2->_hitTesterPathsNeedingFinalizationAtEnd addObject:v48];
            [v49 beginDynamicOperationWithRealTimeCommands:0];
          }
          if ([v55 containsElementsOtherThanMoveAndClose])
          {
            id v61 = [v55 copy];
            [v61 bounds];
            double v63 = v62;
            double v65 = v64;
            CGAffineTransformMakeTranslation(&v78, -v62, -v64);
            [v61 transformUsingAffineTransform:&v78];
            unint64_t v66 = +[CRLBezierPathSource pathSourceWithBezierPath:v61];
            unsigned int v67 = [(NSMapTable *)v2->_patternOffsetsBySubpathForHitTesterPaths objectForKeyedSubscript:v48];
            [v49 dynamicallySetBezierPathSource:v66 atUnscaledOrigin:v67 withPatternOffsetsBySubpath:v63];
          }
          else
          {
            [v49 dynamicallyMakeShapeInvisible];
            [(CRLBezierHitTester *)v2->_strokeHitTester removePath:v48];
          }

          CGAffineTransform v47 = (char *)v47 + 1;
        }
        while (v45 != v47);
        id v45 = [v74 countByEnumeratingWithState:&v79 objects:v111 count:16];
      }
      while (v45);
    }
  }
}

- (CGRect)p_drawPath:(id)a3 inContext:(CGContext *)a4 drawingCommittedImageBehind:(BOOL)a5 additionalAlreadyOutsetUnscaledDirtyRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a3;
  CGContextSaveGState(a4);
  [(CRLFreehandDrawingToolEraser *)self p_unscaledEraserDiameter];
  double v15 = v14 * 0.5 + 2.5;
  [v13 bounds];
  CGRect v49 = CGRectInset(v48, -v15, -v15);
  CGFloat v43 = v49.origin.y;
  CGFloat v44 = v49.origin.x;
  CGFloat v41 = v49.size.height;
  CGFloat v42 = v49.size.width;
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.CGFloat width = width;
  v58.size.CGFloat height = height;
  CGRect v50 = CGRectUnion(v49, v58);
  CGFloat v16 = v50.origin.x;
  CGFloat v17 = v50.origin.y;
  CGFloat v18 = v50.size.width;
  CGFloat v19 = v50.size.height;
  [(CRLFreehandDrawingToolEraser *)self p_maskImageSize];
  double v20 = sub_100064070();
  double v22 = v21;
  double v24 = v23;
  [(CRLFreehandDrawingToolEraser *)self unscaledRectForMaskImageForErasing];
  double v26 = v25;
  double v28 = v27;
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, v22 / v29, v24 / v30);
  CGAffineTransform v45 = v47;
  CGAffineTransformTranslate(&transform, &v45, -v26, -v28);
  CGAffineTransform v47 = transform;
  if (a5)
  {
    CGContextSaveGState(a4);
    CGAffineTransform transform = v47;
    v51.origin.CGFloat x = v16;
    v51.origin.CGFloat y = v17;
    v51.size.CGFloat width = v18;
    v51.size.CGFloat height = v19;
    CGRect v52 = CGRectApplyAffineTransform(v51, &transform);
    CGRect v53 = CGRectIntegral(v52);
    CGContextClipToRect(a4, v53);
    [(CRLFreehandDrawingToolEraser *)self p_maskImageSize];
    v54.origin.CGFloat x = sub_100064070();
    CGFloat v31 = v54.origin.x;
    CGFloat v32 = v54.origin.y;
    CGFloat v33 = v54.size.width;
    CGFloat v34 = v54.size.height;
    CGContextClearRect(a4, v54);
    v55.origin.CGFloat x = v31;
    v55.origin.CGFloat y = v32;
    v55.size.CGFloat width = v33;
    v55.size.CGFloat height = v34;
    CGContextDrawImage(a4, v55, self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
    CGContextRestoreGState(a4);
  }
  CGAffineTransform transform = v47;
  CGContextConcatCTM(a4, &transform);
  v56.origin.CGFloat x = v16;
  v56.origin.CGFloat y = v17;
  v56.size.CGFloat width = v18;
  v56.size.CGFloat height = v19;
  CGContextClipToRect(a4, v56);
  CGContextSetBlendMode(a4, kCGBlendModeDestinationOut);
  CGContextSetGrayStrokeColor(a4, 0.0, 1.0);
  CGContextSetLineCap(a4, kCGLineCapRound);
  CGContextSetLineJoin(a4, kCGLineJoinRound);
  [(CRLFreehandDrawingToolEraser *)self p_unscaledEraserDiameter];
  CGContextSetLineWidth(a4, v35);
  id v36 = v13;
  CGContextAddPath(a4, (CGPathRef)[v36 CGPath]);
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);

  double v38 = v43;
  double v37 = v44;
  double v40 = v41;
  double v39 = v42;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (CGSize)p_maskImageSize
{
  double v3 = [(CRLFreehandDrawingTool *)self icc];
  double v4 = [v3 canvas];
  [v4 contentsScale];
  double v6 = v5;
  double v7 = [v3 canvas];
  [v7 viewScale];
  double v9 = v6 * v8;

  [(CRLFreehandDrawingToolEraser *)self unscaledRectForMaskImageForErasing];
  double v12 = sub_1000646A4(v10, v11, v9);
  double v13 = sub_1000674B8(v12);
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)p_updateFillMaskImage
{
  if (!self->_committedFillEraserPathCtx)
  {
    [(CRLFreehandDrawingToolEraser *)self p_maskImageSize];
    double v5 = sub_100455AA8(2, v3, v4);
    self->_committedFillEraserPathCtCGFloat x = v5;
    CGContextSaveGState(v5);
    CGContextSetBlendMode(self->_committedFillEraserPathCtx, kCGBlendModeNormal);
    CGContextSetGrayFillColor(self->_committedFillEraserPathCtx, 0.0, 1.0);
    committedFillEraserPathCtCGFloat x = self->_committedFillEraserPathCtx;
    v32.origin.CGFloat x = sub_100064070();
    CGContextFillRect(committedFillEraserPathCtx, v32);
    CGContextRestoreGState(self->_committedFillEraserPathCtx);
  }
  CGFloat x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  if ((unint64_t)[(CRLBezierPath *)self->_unscaledFillEraserPathToCommit elementCount] < 0x65)
  {
    p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = &self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
    if (self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect) {
      goto LABEL_8;
    }
  }
  else
  {
    -[CRLFreehandDrawingToolEraser p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:](self, "p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:", self->_unscaledFillEraserPathToCommit, self->_committedFillEraserPathCtx, 0, CGRectNull.origin.x, y, width, height);
    CGFloat x = v11;
    double y = v12;
    double width = v13;
    double height = v14;
    double v15 = +[CRLBezierPath bezierPath];
    unscaledFillEraserPathToCommit = self->_unscaledFillEraserPathToCommit;
    self->_unscaledFillEraserPathToCommit = v15;

    p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = &self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
    committedFillMaskImageForErasingPositionedInVisibleCanvasRect = self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
    if (committedFillMaskImageForErasingPositionedInVisibleCanvasRect)
    {
      CGImageRelease(committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
      *p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = 0;
    }
  }
  *p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = CGBitmapContextCreateImage(self->_committedFillEraserPathCtx);
LABEL_8:
  if (!self->_fillEraserPathCtx)
  {
    [(CRLFreehandDrawingToolEraser *)self p_maskImageSize];
    double v21 = sub_100455AA8(2, v19, v20);
    self->_fillEraserPathCtCGFloat x = v21;
    v33.origin.CGFloat x = sub_100064070();
    CGContextDrawImage(v21, v33, *p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
  }
  id v30 = [(CRLBezierPath *)self->_unscaledFillEraserPathToCommit copy];
  id v22 = [(CRLFreehandDrawingPathCreator *)self->_fillPathCreator copyOfUncommittedPath];
  [v30 appendBezierPath:v22 skippingInitialMoveIfPossible:1];

  if ([v30 containsElementsOtherThanMoveAndClose])
  {
    v35.origin.CGFloat x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    CGRect v34 = CGRectUnion(self->_lastDirtyRectForUncommittedFillMask, v35);
    -[CRLFreehandDrawingToolEraser p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:](self, "p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:", v30, self->_fillEraserPathCtx, 1, v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
    self->_lastDirtyRectForUncommittedFillMask.origin.CGFloat x = v23;
    self->_lastDirtyRectForUncommittedFillMask.origin.double y = v24;
    self->_lastDirtyRectForUncommittedFillMask.size.double width = v25;
    self->_lastDirtyRectForUncommittedFillMask.size.double height = v26;
  }
  Image = CGBitmapContextCreateImage(self->_fillEraserPathCtx);
  double v28 = +[CRLImage imageWithCGImage:Image];
  fillMaskImageForErasing = self->_fillMaskImageForErasing;
  self->_fillMaskImageForErasing = v28;

  CGImageRelease(Image);
}

- (void)p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing
{
  double v3 = [(CRLFreehandDrawingTool *)self icc];
  [(CRLFreehandDrawingToolEraser *)self p_unscaledEraserDiameter];
  double v5 = v4;
  unsigned int v6 = [(CRLFreehandDrawingToolEraser *)self isWholeObjectEraser];
  strokePathCreator = self->_strokePathCreator;
  if (v6)
  {
    uint64_t v8 = [(CRLFreehandDrawingToolEraser *)self p_copyOfPathCreatorPathCommittingAllAvailablePoints:strokePathCreator optionallyAdditionallyCommittingIntoAdditionalPath:0];
    uint64_t v9 = [(CRLFreehandDrawingToolEraser *)self p_copyOfPathCreatorPathCommittingAllAvailablePoints:self->_fillPathCreator optionallyAdditionallyCommittingIntoAdditionalPath:0];
    double v10 = v5 * 0.5;
    id v118 = (void *)v8;
    double v11 = [(CRLBezierHitTester *)self->_strokeHitTester pathsCrossingPath:v8 withSearchThreshold:v10];
    long long v117 = (void *)v9;
    double v12 = [(CRLBezierHitTester *)self->_fillHitTester pathsCrossingPath:v9 withSearchThreshold:v10];
    double v13 = +[NSHashTable hashTableWithOptions:512];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id obj = v11;
    id v14 = [obj countByEnumeratingWithState:&v142 objects:v160 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v143;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v143 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v142 + 1) + 8 * i);
          [(CRLBezierHitTester *)self->_strokeHitTester removePath:v18];
          [v13 addObject:v18];
        }
        id v15 = [obj countByEnumeratingWithState:&v142 objects:v160 count:16];
      }
      while (v15);
    }

    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v19 = v12;
    id v20 = [v19 countByEnumeratingWithState:&v138 objects:v159 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v139;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v139 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v138 + 1) + 8 * (void)j);
          [(CRLBezierHitTester *)self->_fillHitTester removePath:v24];
          [v13 addObject:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v138 objects:v159 count:16];
      }
      while (v21);
    }
    id v115 = v19;

    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v25 = v13;
    id v26 = [v25 countByEnumeratingWithState:&v134 objects:v158 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v135;
      v121 = v25;
      do
      {
        double v29 = 0;
        do
        {
          if (*(void *)v135 != v28) {
            objc_enumerationMutation(v121);
          }
          uint64_t v30 = *(void *)(*((void *)&v134 + 1) + 8 * (void)v29);
          if ([(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd containsObject:v30])
          {
            unsigned int v31 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9070);
            }
            CGRect v32 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v149 = v31;
              __int16 v150 = 2082;
              v151 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              __int16 v152 = 2082;
              v153 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              __int16 v154 = 1024;
              int v155 = 844;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Should not be trying to delete a whole path that has already been deleted.", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9090);
            }
            CGRect v33 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              CGAffineTransform v45 = v33;
              uint64_t v46 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v149 = v31;
              __int16 v150 = 2114;
              v151 = v46;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            CGRect v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]");
            CGRect v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
            +[CRLAssertionHandler handleFailureInFunction:v34 file:v35 lineNumber:844 isFatal:0 description:"Should not be trying to delete a whole path that has already been deleted."];
          }
          id v36 = [(NSMapTable *)self->_shapeLayoutsForHitTesterPaths objectForKeyedSubscript:v30];
          [(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd addObject:v30];
          [v36 beginDynamicOperationWithRealTimeCommands:0];
          [v36 dynamicallyMakeShapeInvisible];
          double v37 = (objc_class *)objc_opt_class();
          double v38 = [v3 repForLayout:v36];
          double v39 = sub_10024715C(v37, v38);

          if (v39)
          {
            [v39 setNeedsDisplay];
          }
          else
          {
            unsigned int v40 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F90B0);
            }
            CGFloat v41 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v149 = v40;
              __int16 v150 = 2082;
              v151 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              __int16 v152 = 2082;
              v153 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              __int16 v154 = 1024;
              int v155 = 852;
              __int16 v156 = 2082;
              v157 = "currentShapeRep";
              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F90D0);
            }
            CGFloat v42 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              CGAffineTransform v47 = v42;
              CGRect v48 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v149 = v40;
              __int16 v150 = 2114;
              v151 = v48;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            CGFloat v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]");
            CGFloat v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 852, 0, "invalid nil value for '%{public}s'", "currentShapeRep");
          }
          double v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v25 = v121;
        id v27 = [v121 countByEnumeratingWithState:&v134 objects:v158 count:16];
      }
      while (v27);
    }

    CGRect v49 = v115;
  }
  else
  {
    uint64_t v50 = [(CRLFreehandDrawingToolEraser *)self p_copyOfPathCreatorPathCommittingAllAvailablePoints:strokePathCreator optionallyAdditionallyCommittingIntoAdditionalPath:self->_unscaledStrokeEraserPathToCommit];
    uint64_t v51 = [(CRLFreehandDrawingToolEraser *)self p_copyOfPathCreatorPathCommittingAllAvailablePoints:self->_fillPathCreator optionallyAdditionallyCommittingIntoAdditionalPath:self->_unscaledFillEraserPathToCommit];
    double v122 = (v5 + self->_widthOfThickestStrokePossiblyBeingErased) * 0.5;
    [(CRLFreehandDrawingPathCreator *)self->_strokePathCreator takeDirtyRect];
    double obja = v5;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    CGFloat v59 = v58;
    [(CRLFreehandDrawingToolEraser *)self p_unscaledEraserDiameter];
    CGFloat v61 = -(v60 * 0.5 + 7.5);
    v161.origin.CGFloat x = v53;
    v161.origin.CGFloat y = v55;
    v161.size.CGFloat width = v57;
    v161.size.CGFloat height = v59;
    CGRect v162 = CGRectInset(v161, v61, v61);
    CGFloat x = v162.origin.x;
    CGFloat y = v162.origin.y;
    CGFloat width = v162.size.width;
    CGFloat height = v162.size.height;
    [(CRLFreehandDrawingPathCreator *)self->_fillPathCreator takeDirtyRect];
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    CGFloat v73 = v72;
    [(CRLFreehandDrawingToolEraser *)self p_unscaledEraserDiameter];
    CGFloat v75 = -(v74 * 0.5 + 2.5);
    v163.origin.CGFloat x = v67;
    v163.origin.CGFloat y = v69;
    v163.size.CGFloat width = v71;
    v163.size.CGFloat height = v73;
    CGRect v164 = CGRectInset(v163, v75, v75);
    double v119 = v164.origin.x;
    double v116 = v164.origin.y;
    double v76 = v164.size.width;
    double v77 = v164.size.height;
    id v118 = (void *)v50;
    CGAffineTransform v78 = [(CRLBezierHitTester *)self->_strokeHitTester pathsCrossingPath:v50 withSearchThreshold:v122];
    long long v117 = (void *)v51;
    objc_super v120 = [(CRLBezierHitTester *)self->_fillHitTester pathsCrossingPath:v51 withSearchThreshold:obja * 0.5];
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id obj = v78;
    id v79 = [obj countByEnumeratingWithState:&v130 objects:v147 count:16];
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v131;
      do
      {
        long long v82 = 0;
        do
        {
          if (*(void *)v131 != v81) {
            objc_enumerationMutation(obj);
          }
          uint64_t v83 = *(void *)(*((void *)&v130 + 1) + 8 * (void)v82);
          id v84 = [(NSMapTable *)self->_shapeLayoutsForHitTesterPaths objectForKeyedSubscript:v83];
          if (![(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd containsObject:v83])
          {
            [(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd addObject:v83];
            [v84 beginDynamicOperationWithRealTimeCommands:0];
          }
          double v85 = (objc_class *)objc_opt_class();
          double v86 = [v3 repForLayout:v84];
          double v87 = sub_10024715C(v85, v86);

          if (v87)
          {
            char v88 = [v84 stroke];
            [v88 width];
            double v90 = v89;

            v165.origin.CGFloat x = x;
            v165.origin.CGFloat y = y;
            v165.size.CGFloat width = width;
            v165.size.CGFloat height = height;
            CGRect v166 = CGRectInset(v165, v90 * -1.41421354, v90 * -1.41421354);
            [v87 convertNaturalRectFromUnscaledCanvas:v166.origin.x, v166.origin.y, v166.size.width, v166.size.height];
            [v87 setNeedsDisplayInRect:];
            [v3 invalidateContentLayersForRep:v87];
          }
          else
          {
            unsigned int v91 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F90F0);
            }
            uint64_t v92 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v149 = v91;
              __int16 v150 = 2082;
              v151 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              __int16 v152 = 2082;
              v153 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              __int16 v154 = 1024;
              int v155 = 889;
              __int16 v156 = 2082;
              v157 = "currentShapeRep";
              _os_log_error_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9110);
            }
            long long v93 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              double v96 = v93;
              long long v97 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v149 = v91;
              __int16 v150 = 2114;
              v151 = v97;
              _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            long long v94 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]");
            long long v95 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v94, v95, 889, 0, "invalid nil value for '%{public}s'", "currentShapeRep");
          }
          long long v82 = (char *)v82 + 1;
        }
        while (v80 != v82);
        id v80 = [obj countByEnumeratingWithState:&v130 objects:v147 count:16];
      }
      while (v80);
    }

    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v25 = v120;
    id v98 = [v25 countByEnumeratingWithState:&v126 objects:v146 count:16];
    if (v98)
    {
      id v99 = v98;
      long long v123 = v25;
      uint64_t v100 = *(void *)v127;
      do
      {
        id v101 = 0;
        do
        {
          if (*(void *)v127 != v100) {
            objc_enumerationMutation(v123);
          }
          uint64_t v102 = *(void *)(*((void *)&v126 + 1) + 8 * (void)v101);
          __int16 v103 = [(NSMapTable *)self->_shapeLayoutsForHitTesterPaths objectForKeyedSubscript:v102];
          if (![(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd containsObject:v102])
          {
            [(NSHashTable *)self->_hitTesterPathsNeedingFinalizationAtEnd addObject:v102];
            [v103 beginDynamicOperationWithRealTimeCommands:0];
          }
          v104 = (objc_class *)objc_opt_class();
          __int16 v105 = [v3 repForLayout:v103];
          uint64_t v106 = sub_10024715C(v104, v105);

          if (v106)
          {
            __int16 v107 = [v106 freehandDrawingDynamicFillErasingDelegate];

            if (!v107) {
              [v106 setFreehandDrawingDynamicFillErasingDelegate:self];
            }
            [v106 convertNaturalRectFromUnscaledCanvas:v119, v116, v76, v77];
            [v106 setNeedsDisplayInRect:];
            [v3 invalidateContentLayersForRep:v106];
          }
          else
          {
            unsigned int v108 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9130);
            }
            __int16 v109 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v149 = v108;
              __int16 v150 = 2082;
              v151 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              __int16 v152 = 2082;
              v153 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              __int16 v154 = 1024;
              int v155 = 913;
              __int16 v156 = 2082;
              v157 = "currentShapeRep";
              _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F9150);
            }
            char v110 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              id v113 = v110;
              uint64_t v114 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v149 = v108;
              __int16 v150 = 2114;
              v151 = v114;
              _os_log_error_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v111 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]");
            long long v112 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v111, v112, 913, 0, "invalid nil value for '%{public}s'", "currentShapeRep");
          }
          id v101 = (char *)v101 + 1;
        }
        while (v99 != v101);
        id v99 = [v123 countByEnumeratingWithState:&v126 objects:v146 count:16];
      }
      while (v99);
      id v25 = v123;
    }
    CGRect v49 = v25;
  }
}

- (int64_t)p_breakApartShape:(id)a3 withGeometry:(id)a4 subpaths:(id)a5 strokePatternOffsetArray:(id)a6 previousZOrderOffset:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  double v56 = [(CRLFreehandDrawingTool *)self icc];
  uint64_t v16 = [v56 editingCoordinator];
  CGFloat v59 = [v16 boardItemFactory];

  id v57 = v13;
  int64_t v55 = a7;
  if (v15)
  {
    id v17 = [v15 count];
    if (v17 == [v14 count])
    {
      double v58 = v15;
    }
    else
    {
      uint64_t v18 = v15;
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9170);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B19E4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9190);
      }
      id v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:]");
      id v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
      +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:936 isFatal:0 description:"strokePatternOffsetArray must have the same count as the number of provided subpaths (if it's provided)"];

      double v58 = 0;
    }
  }
  else
  {
    double v58 = 0;
  }
  uint64_t v22 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
  if ([v14 count])
  {
    unint64_t v23 = 0;
    do
    {
      uint64_t v24 = [v14 objectAtIndexedSubscript:v23];
      id v25 = (objc_class *)objc_opt_class();
      id v26 = [v59 makeDuplicateOfBoardItem:v12];
      id v27 = sub_10024715C(v25, v26);

      [v24 bounds];
      uint64_t v28 = [v13 geometryWithNewBounds:];
      [v27 setGeometry:v28];

      double v29 = +[CRLBezierPathSource pathSourceWithBezierPath:v24];
      [v27 setPathSource:v29];

      [v27 setAspectRatioLocked:[v12 aspectRatioLocked]];
      uint64_t v30 = objc_opt_class();
      unsigned int v31 = [v12 stroke];
      CGRect v32 = sub_1002469D0(v30, v31);

      if (v32)
      {
        if (v58)
        {
          CGRect v33 = [v58 objectAtIndexedSubscript:v23];
          [v33 crl_CGFloatValue];
          double v35 = v34;

          [v27 setStrokePatternOffsetDistance:v35];
        }
        else
        {
          unsigned int v36 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F91B0);
          }
          double v37 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v61 = v36;
            __int16 v62 = 2082;
            double v63 = "-[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previo"
                  "usZOrderOffset:]";
            __int16 v64 = 2082;
            double v65 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
            __int16 v66 = 1024;
            int v67 = 958;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Must have a strokePatternOffsetArray if we are erasing a brush stroke.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F91D0);
          }
          double v38 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            CGFloat v53 = CRLAssertionHandler;
            log = v38;
            CGFloat v41 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v61 = v36;
            __int16 v62 = 2114;
            double v63 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:]", v53);
          unsigned int v40 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"];
          +[CRLAssertionHandler handleFailureInFunction:v39 file:v40 lineNumber:958 isFatal:0 description:"Must have a strokePatternOffsetArray if we are erasing a brush stroke."];

          id v13 = v57;
        }
      }
      [v22 addObject:v27];

      ++v23;
    }
    while (v23 < (unint64_t)[v14 count]);
  }
  CGFloat v42 = (objc_class *)objc_opt_class();
  CGFloat v43 = [v12 parentInfo];
  CGFloat v44 = sub_10024715C(v42, v43);

  CGAffineTransform v45 = [v44 childInfos];
  uint64_t v46 = (char *)[v45 indexOfObject:v12] + v55;

  CGAffineTransform v47 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v44 boardItems:v22 index:v46];
  CGRect v48 = [v56 commandController];
  [v48 enqueueCommand:v47];

  CGRect v49 = [[_TtC8Freeform26CRLCommandDeleteBoardItems alloc] initWithBoardItemToDelete:v12];
  uint64_t v50 = [v56 commandController];
  [v50 enqueueCommand:v49];

  id v51 = [v22 count];
  return (int64_t)v51 - 1;
}

- (int64_t)p_breakApartOpenShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 strokePatternOffsetArray:(id)a6 previousZOrderOffset:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [a5 arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:1];
  id v16 = [v15 count];
  if (v14 || (unint64_t)v16 >= 2) {
    int64_t v17 = [(CRLFreehandDrawingToolEraser *)self p_breakApartShape:v12 withGeometry:v13 subpaths:v15 strokePatternOffsetArray:v14 previousZOrderOffset:a7];
  }
  else {
    int64_t v17 = 0;
  }

  return v17;
}

- (int64_t)p_breakApartFilledShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 previousZOrderOffset:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [a5 visuallyDistinctSubregions];
  if ((unint64_t)[v12 count] >= 2) {
    int64_t v13 = [(CRLFreehandDrawingToolEraser *)self p_breakApartShape:v10 withGeometry:v11 subpaths:v12 strokePatternOffsetArray:0 previousZOrderOffset:a6];
  }
  else {
    int64_t v13 = 0;
  }

  return v13;
}

- (double)scaledWidthForSlicingEraser
{
  return self->_scaledWidthForSlicingEraser;
}

- (BOOL)isWholeObjectEraser
{
  return self->_wholeObjectEraser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillMaskImageForErasing, 0);
  objc_storeStrong((id *)&self->_unscaledFillEraserPathToCommit, 0);
  objc_storeStrong((id *)&self->_unscaledStrokeEraserPathToCommit, 0);
  objc_storeStrong((id *)&self->_hitTesterPathsNeedingFinalizationAtEnd, 0);
  objc_storeStrong((id *)&self->_patternOffsetsBySubpathForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_currentPathsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_shapeLayoutsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_allHitTesterPathsZOrdered, 0);
  objc_storeStrong((id *)&self->_fillHitTester, 0);
  objc_storeStrong((id *)&self->_strokeHitTester, 0);
  objc_storeStrong((id *)&self->_fillPathCreator, 0);

  objc_storeStrong((id *)&self->_strokePathCreator, 0);
}

@end