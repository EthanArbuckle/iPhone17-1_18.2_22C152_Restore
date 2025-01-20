@interface CRLFreehandDrawingToolAbstractPathInsertion
- (id)initialFreehandDrawingItem;
- (id)p_clusterableFreehandDrawingLayoutsInParentContainerAtPoint:(CGPoint)a3;
- (id)p_drawingInfoForNewShapeInfos:(id)a3 board:(id)a4;
- (id)p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:(CGRect)a3;
- (id)p_zOrderIndexPathForLayout:(id)a3 descendingFromLayout:(id)a4 withStartingIndexPath:(id)a5;
- (id)p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:(id)a3 intersectingRectInParentSpaceOfLayouts:(CGRect)a4 withStartingIndexPath:(id)a5;
- (id)shapeItem;
- (void)finalizeAndResetAbstractPathInsertionToolWithSuccess:(BOOL)a3;
- (void)openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:(id)a3 stroke:(id)a4 fill:(id)a5;
- (void)p_updateOrCreateParentDrawingToBestMatch;
- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5;
@end

@implementation CRLFreehandDrawingToolAbstractPathInsertion

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingToolAbstractPathInsertion;
  [(CRLFreehandDrawingTool *)&v12 performActionWithInputPoint:v8 isInitialPoint:v6 isFinalPoint:v5];
  if (v6)
  {
    p_initialUnscaledPoint = &self->_initialUnscaledPoint;
    [v8 unscaledPoint];
    p_initialUnscaledPoint->x = v10;
    p_initialUnscaledPoint->y = v11;
  }
}

- (id)initialFreehandDrawingItem
{
  return self->_initialFreehandDrawingItem;
}

- (id)shapeItem
{
  return self->_shapeItem;
}

- (void)openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:(id)a3 stroke:(id)a4 fill:(id)a5
{
  id v73 = a3;
  id v72 = a4;
  id v71 = a5;
  id v8 = [(CRLFreehandDrawingTool *)self icc];
  v9 = [v8 editingCoordinator];
  CGFloat v10 = [v9 commandController];

  [v10 openGroup];
  if ([(CRLFreehandDrawingTool *)self shouldCommandsEnqueueInRealTime]) {
    [v10 enableRealTimeSyncProgressiveEnqueuingInCurrentGroup];
  }
  else {
    [v10 enableProgressiveEnqueuingInCurrentGroup];
  }
  unint64_t v11 = [(CRLFreehandDrawingTool *)self type];
  objc_super v12 = +[NSBundle mainBundle];
  v13 = v12;
  if (v11 == 7) {
    CFStringRef v14 = @"Add Fill";
  }
  else {
    CFStringRef v14 = @"Add Stroke";
  }
  v15 = [v12 localizedStringForKey:v14 value:0 table:@"UndoStrings"];
  v70 = v10;
  [v10 setCurrentGroupActionString:v15];

  v16 = -[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y);
  v74 = v8;
  [v8 layoutIfNeeded];
  v17 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:[v16 count]];
  originalBoundsForStandardKnobsInRootForDrawings = self->_originalBoundsForStandardKnobsInRootForDrawings;
  self->_originalBoundsForStandardKnobsInRootForDrawings = v17;

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v19 = v16;
  id v20 = [v19 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v81;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v81 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        [v24 boundsForStandardKnobs];
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        if (v24) {
          [v24 transformInRoot];
        }
        else {
          memset(&v79, 0, sizeof(v79));
        }
        v88.origin.x = v26;
        v88.origin.y = v28;
        v88.size.width = v30;
        v88.size.height = v32;
        CGRect v89 = CGRectApplyAffineTransform(v88, &v79);
        v33 = self->_originalBoundsForStandardKnobsInRootForDrawings;
        v34 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
        [(NSMapTable *)v33 setObject:v34 forKey:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v21);
  }

  [v73 bounds];
  double v36 = v35;
  double v38 = v37;
  uint64_t v39 = +[CRLBezierPathSource pathSourceWithBezierPath:v73];
  v40 = v74;
  v41 = [v74 editingCoordinator];
  v42 = [v41 boardItemFactory];

  v43 = (objc_class *)objc_opt_class();
  v68 = v42;
  v69 = (void *)v39;
  v44 = [v42 makeShapeItemForFreehandDrawingWithPathSource:v39 position:v72 stroke:v71 fill:0 pencilKitStrokePathCompactData:0 maskPath:v36];
  sub_10024715C(v43, v44);
  v45 = (_TtC8Freeform27CRLFreehandDrawingShapeItem *)objc_claimAutoreleasedReturnValue();
  shapeItem = self->_shapeItem;
  self->_shapeItem = v45;

  [(CRLBoardItemBase *)self->_shapeItem setAspectRatioLocked:1];
  v47 = +[CRLFreehandDrawingLocalShapeRegistry sharedInstance];
  [v47 registerLocallyDrawnShapeItem:self->_shapeItem];

  v86 = self->_shapeItem;
  v48 = +[NSArray arrayWithObjects:&v86 count:1];
  v49 = [v74 editingCoordinator];
  v50 = [v49 mainBoard];
  v51 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self p_drawingInfoForNewShapeInfos:v48 board:v50];
  initialFreehandDrawingItem = self->_initialFreehandDrawingItem;
  self->_initialFreehandDrawingItem = v51;

  [(CRLFreehandDrawingItem *)self->_initialFreehandDrawingItem setProhibitsClustering:1];
  [(CRLBoardItemBase *)self->_initialFreehandDrawingItem setAspectRatioLocked:1];
  [v70 openGroup];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v53 = [v74 editorController];
  v54 = [v53 currentEditors];

  id v55 = [v54 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v76;
    while (2)
    {
      for (j = 0; j != v56; j = (char *)j + 1)
      {
        if (*(void *)v76 != v57) {
          objc_enumerationMutation(v54);
        }
        if ([*(id *)(*((void *)&v75 + 1) + 8 * (void)j) isMemberOfClass:objc_opt_class()])
        {
          v40 = v74;
          v59 = [v74 canvasEditor];
          v60 = [v59 selectionPathWithInfo:0];
          v61 = [v74 editorController];
          [v61 setSelectionPath:v60];

          goto LABEL_27;
        }
      }
      id v56 = [v54 countByEnumeratingWithState:&v75 objects:v85 count:16];
      v40 = v74;
      if (v56) {
        continue;
      }
      break;
    }
  }
LABEL_27:

  v62 = [v40 canvasEditor];
  v84 = self->_initialFreehandDrawingItem;
  v63 = +[NSArray arrayWithObjects:&v84 count:1];
  v64 = +[CRLInsertionContext nonInteractiveFloatingInsertionContext];
  [v62 insertBoardItems:v63 withInsertionContext:v64 postProcessBlock:0];

  [v70 closeGroup];
  [v40 layoutIfNeeded];
  uint64_t v65 = objc_opt_class();
  v66 = [v40 repForInfo:self->_shapeItem];
  v67 = sub_1002469D0(v65, v66);

  [v67 dynamicOperationDidBeginWithRealTimeCommands:0];
  [v67 i_setIsCurrentlyBeingFreehandDrawn:1];
}

- (id)p_drawingInfoForNewShapeInfos:(id)a3 board:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[CRLGroupItem groupGeometryFromChildrenInfos:v6];
  v9 = [(CRLFreehandDrawingTool *)self icc];
  CGFloat v10 = [v9 editingCoordinator];
  unint64_t v11 = [v10 boardItemFactory];
  v34 = (void *)v8;
  objc_super v12 = [v11 makeFreehandDrawingItemWithGeometry:v8];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  id v13 = [obj countByEnumeratingWithState:&v37 objects:v52 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v38;
    double y = CGPointZero.y;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v17);
        v51 = v18;
        id v19 = +[NSArray arrayWithObjects:&v51 count:1];
        id v36 = 0;
        [v12 beforeInsertionAddNewItems:v19 board:v7 error:&v36];
        id v20 = v36;

        if (v20)
        {
          unsigned int v21 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF910);
          }
          uint64_t v22 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v42 = v21;
            __int16 v43 = 2082;
            v44 = "-[CRLFreehandDrawingToolAbstractPathInsertion p_drawingInfoForNewShapeInfos:board:]";
            __int16 v45 = 2082;
            v46 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m";
            __int16 v47 = 1024;
            int v48 = 170;
            __int16 v49 = 2082;
            v50 = "insertionError";
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF930);
          }
          v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            double v31 = v23;
            CGFloat v32 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v42 = v21;
            __int16 v43 = 2114;
            v44 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_drawingInfoForNewShapeInfos:board:]");
          double v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 170, 0, "expected nil value for '%{public}s'", "insertionError");
        }
        CGFloat v26 = [CRLCanvasInfoGeometry alloc];
        double v27 = [v18 geometry];
        [v27 size];
        CGFloat v30 = -[CRLCanvasInfoGeometry initWithPosition:size:](v26, "initWithPosition:size:", CGPointZero.x, y, v28, v29);
        [v18 setGeometry:v30];

        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      id v14 = [obj countByEnumeratingWithState:&v37 objects:v52 count:16];
    }
    while (v14);
  }

  return v12;
}

- (id)p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(CRLFreehandDrawingTool *)self icc];
  v9 = [v8 parentForFreehandDrawingLayoutsAtPoint:self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y];

  memset(&v60, 0, sizeof(v60));
  v51 = v9;
  CGFloat v10 = [v9 geometryInRoot];
  unint64_t v11 = v10;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(&v59, 0, sizeof(v59));
  }
  CGAffineTransformInvert(&v60, &v59);

  CGAffineTransform v58 = v60;
  v63.origin.double x = x;
  v63.origin.double y = y;
  v63.size.double width = width;
  v63.size.double height = height;
  CGRect v64 = CGRectApplyAffineTransform(v63, &v58);
  double v12 = v64.origin.x;
  double v13 = v64.origin.y;
  double v14 = v64.size.width;
  double v15 = v64.size.height;
  v16 = [v9 children];
  v53 = -[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:](self, "p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:", v16, 0, v12, v13, v14, v15);

  v17 = -[CRLFreehandDrawingToolAbstractPathInsertion p_clusterableFreehandDrawingLayoutsInParentContainerAtPoint:](self, "p_clusterableFreehandDrawingLayoutsInParentContainerAtPoint:", self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y);
  v18 = [(CRLFreehandDrawingTool *)self icc];
  [v18 viewScale];
  double v20 = v19;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v50 = v17;
  unsigned int v21 = [v17 reverseObjectEnumerator];
  id v22 = [v21 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v22)
  {
    id v23 = v22;
    v24 = 0;
    double v25 = 1.0 / v20 * 100.0;
    uint64_t v26 = *(void *)v55;
    double v27 = 1.79769313e308;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v55 != v26) {
          objc_enumerationMutation(v21);
        }
        double v29 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        CGFloat v30 = [(NSMapTable *)self->_originalBoundsForStandardKnobsInRootForDrawings objectForKeyedSubscript:v29];
        double v31 = v30;
        if (v30)
        {
          [v30 CGRectValue];
          double v36 = sub_1000655FC(v32, v33, v34, v35, x, y, width, height);
          double v37 = v36;
          if (v36 < v27 && v36 <= v25)
          {
            if (v53)
            {
              v52 = v24;
              long long v39 = v21;
              uint64_t v40 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self p_zOrderIndexPathForLayout:v29 descendingFromLayout:v51 withStartingIndexPath:0];
              if (!v40)
              {
                int v44 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014CF950);
                }
                __int16 v45 = off_10166B4A0;
                v24 = v52;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_10106DA34(v44, v45);
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014CF970);
                }
                v46 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_1010668E0(v46);
                }
                __int16 v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:]");
                int v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"];
                +[CRLAssertionHandler handleFailureInFunction:v47 file:v48 lineNumber:212 isFatal:0 description:"Should be able to get z-order index path for freehand drawing. Bailing early to avoid accidental overlaps."];

LABEL_32:
                goto LABEL_33;
              }
              v41 = (void *)v40;
              id v42 = [v53 compare:v40];

              unsigned int v21 = v39;
              v24 = v52;
              if (v42 == (id)1) {
                goto LABEL_32;
              }
            }
            id v43 = v29;

            double v27 = v37;
            v24 = v43;
          }
          if (v37 <= 0.0) {
            goto LABEL_32;
          }
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
  else
  {
    v24 = 0;
  }
LABEL_33:

  return v24;
}

- (id)p_clusterableFreehandDrawingLayoutsInParentContainerAtPoint:(CGPoint)a3
{
  v3 = -[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", a3.x, a3.y);
  v4 = [v3 crl_arrayOfObjectsPassingTest:&stru_1014CF9B0];

  return v4;
}

- (id)p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:(id)a3 intersectingRectInParentSpaceOfLayouts:(CGRect)a4 withStartingIndexPath:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = [v11 count];
  if ((uint64_t)v13 - 1 < 0)
  {
LABEL_15:
    double v29 = 0;
  }
  else
  {
    uint64_t v14 = (uint64_t)v13;
    while (1)
    {
      double v15 = [v11 objectAtIndexedSubscript:--v14];
      uint64_t v16 = objc_opt_class();
      v17 = sub_1002469D0(v16, v15);
      v18 = v17;
      if (!v17 || ([v17 isInteractable] & 1) == 0)
      {
        [v15 frameForCulling];
        if (sub_10006525C(v19, v20, v21, v22, x, y, width, height))
        {
          memset(&v35, 0, sizeof(v35));
          id v23 = [v15 geometry];
          v24 = v23;
          if (v23) {
            [v23 transform];
          }
          else {
            memset(&v34, 0, sizeof(v34));
          }
          CGAffineTransformInvert(&v35, &v34);

          CGAffineTransform v33 = v35;
          v37.origin.double x = x;
          v37.origin.double y = y;
          v37.size.double width = width;
          v37.size.double height = height;
          CGRect v38 = CGRectApplyAffineTransform(v37, &v33);
          double v25 = v38.origin.x;
          double v26 = v38.origin.y;
          double v27 = v38.size.width;
          double v28 = v38.size.height;
          if (v12) {
            [v12 indexPathByAddingIndex:v14];
          }
          else {
          double v29 = +[NSIndexPath indexPathWithIndex:v14];
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_17;
          }
          CGFloat v30 = [v15 children];
          uint64_t v31 = -[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:](self, "p_zOrderIndexPathForTopmostNonInteractableDrawingLeafLayoutFromLayouts:intersectingRectInParentSpaceOfLayouts:withStartingIndexPath:", v30, v29, v25, v26, v27, v28);

          if (v31) {
            break;
          }
        }
      }

      if (v14 <= 0) {
        goto LABEL_15;
      }
    }
    double v29 = (void *)v31;
LABEL_17:
  }

  return v29;
}

- (id)p_zOrderIndexPathForLayout:(id)a3 descendingFromLayout:(id)a4 withStartingIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 == v9)
  {
    id v16 = v10;
  }
  else
  {
    id v12 = [v8 parent];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = sub_1002469D0(v13, v8);
    double v15 = (void *)v14;
    id v16 = 0;
    if (v12 && v14)
    {
      v17 = [v12 children];
      id v18 = [v17 indexOfObject:v15];

      if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        unsigned int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CF9D0);
        }
        double v20 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110402;
          unsigned int v27 = v19;
          __int16 v28 = 2082;
          double v29 = "-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:]";
          __int16 v30 = 2082;
          uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m";
          __int16 v32 = 1024;
          int v33 = 312;
          __int16 v34 = 2112;
          id v35 = v8;
          __int16 v36 = 2112;
          CGRect v37 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to find index of descendant layout (%@) in parent layout's (%@) children.", buf, 0x36u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CF9F0);
        }
        double v21 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v21);
        }
        double v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_zOrderIndexPathForLayout:descendingFromLayout:withStartingIndexPath:]");
        id v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"];
        +[CRLAssertionHandler handleFailureInFunction:v22, v23, 312, 0, "Unable to find index of descendant layout (%@) in parent layout's (%@) children.", v8, v12 file lineNumber isFatal description];

        id v16 = 0;
      }
      else
      {
        if (v11) {
          [v11 crl_indexPathByPrependingIndex:v18];
        }
        else {
        v24 = +[NSIndexPath indexPathWithIndex:v18];
        }
        id v16 = [(CRLFreehandDrawingToolAbstractPathInsertion *)self p_zOrderIndexPathForLayout:v12 descendingFromLayout:v9 withStartingIndexPath:v24];
      }
    }
  }

  return v16;
}

- (void)finalizeAndResetAbstractPathInsertionToolWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v25 = [(CRLFreehandDrawingTool *)self icc];
  BOOL v5 = [v25 commandController];
  uint64_t v6 = objc_opt_class();
  id v7 = [v25 repForInfo:self->_shapeItem];
  id v8 = sub_1002469D0(v6, v7);

  [v8 i_setIsCurrentlyBeingFreehandDrawn:0];
  [v8 dynamicOperationDidEnd];
  if (v3) {
    [(CRLFreehandDrawingToolAbstractPathInsertion *)self p_updateOrCreateParentDrawingToBestMatch];
  }
  id v9 = [v25 editingCoordinator];
  id v10 = [v9 mainBoard];

  id v11 = [(CRLBoardItemBase *)self->_initialFreehandDrawingItem id];
  unsigned __int8 v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
    if (v3)
    {
      v17 = 0;
      goto LABEL_10;
    }
    id v18 = [v25 canvasEditor];
    unsigned int v19 = [v18 selectionPathWithInfo:0];

    v17 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v19 reverseSelectionPath:v19];
    goto LABEL_9;
  }
  uint64_t v13 = [v25 canvasEditor];
  uint64_t v14 = [v13 selectionPathWithInfo:self->_initialFreehandDrawingItem];

  double v15 = [v25 canvasEditor];
  id v16 = [v15 selectionPathWithInfo:0];

  v17 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v14 reverseSelectionPath:v16];
  if (!v3) {
LABEL_9:
  }
    [v5 destroyOutermostCommandGroupOnClose];
LABEL_10:
  double v20 = [(CRLFreehandDrawingTool *)self icc];
  double v21 = [v20 pkDrawingProvider];
  [v21 activeDrawingWillEndAfterInsertingFinalizedDrawingItem];

  [v5 closeGroupWithSelectionBehavior:v17];
  initialFreehandDrawingItem = self->_initialFreehandDrawingItem;
  self->_initialFreehandDrawingItem = 0;

  shapeItem = self->_shapeItem;
  self->_shapeItem = 0;

  originalBoundsForStandardKnobsInRootForDrawings = self->_originalBoundsForStandardKnobsInRootForDrawings;
  self->_originalBoundsForStandardKnobsInRootForDrawings = 0;

  self->_initialUnscaledPoint = (CGPoint)xmmword_101175160;
}

- (void)p_updateOrCreateParentDrawingToBestMatch
{
  v2 = self;
  BOOL v3 = [(CRLFreehandDrawingTool *)self icc];
  CGAffineTransform v60 = [v3 commandController];
  [v3 layoutIfNeeded];
  v4 = v2->_initialFreehandDrawingItem;
  BOOL v5 = [v3 editingCoordinator];
  uint64_t v6 = [v5 mainBoard];
  id v7 = [(CRLBoardItemBase *)v4 id];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = [v3 layoutForInfo:v4];
    id v11 = sub_10024715C(v9, v10);

    unsigned __int8 v12 = [v11 pureGeometryInRoot];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    uint64_t v21 = -[CRLFreehandDrawingToolAbstractPathInsertion p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:](v2, "p_preexistingFreehandDrawingLayoutForInsertingShapeWithFrameInRoot:", v14, v16, v18, v20);
    double v22 = (void *)v21;
    if (v21)
    {
      if ((void *)v21 != v11)
      {
        long long v54 = v11;
        id v23 = (objc_class *)objc_opt_class();
        long long v57 = v22;
        v24 = [v22 info];
        sub_10024715C(v23, v24);
        id v25 = (_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering *)objc_claimAutoreleasedReturnValue();

        long long v56 = v3;
        double v26 = [v3 canvasEditor];
        uint64_t v27 = [v26 selectionPathWithInfo:v25];

        v53 = (void *)v27;
        v52 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v27 reverseSelectionPath:v27];
        [v60 openGroupWithSelectionBehavior:];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v55 = v4;
        id obj = [(CRLContainerItem *)v4 childItems];
        id v28 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v61 = *(void *)v65;
          CGAffineTransform v59 = v2;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v65 != v61) {
                objc_enumerationMutation(obj);
              }
              uint64_t v31 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              __int16 v32 = (objc_class *)objc_opt_class();
              int v33 = sub_10024715C(v32, v31);
              if (v33)
              {
                __int16 v34 = [CRLCanvasInfoGeometry alloc];
                [v33 fullTransformInRoot];
                id v35 = [(CRLCanvasInfoGeometry *)v34 initWithFullTransform:v63 widthValid:1 heightValid:1];
                __int16 v36 = [CRLCanvasInfoGeometry alloc];
                if (v25) {
                  [(CRLCommandFreehandDrawingProhibitClustering *)v25 fullTransformInRoot];
                }
                else {
                  memset(v62, 0, sizeof(v62));
                }
                CGRect v37 = [(CRLCanvasInfoGeometry *)v36 initWithFullTransform:v62 widthValid:1 heightValid:1];
                CGRect v38 = [(CRLCanvasInfoGeometry *)v35 geometryRelativeToGeometry:v37];
                long long v39 = [(CRLCommandFreehandDrawingProhibitClustering *)v25 childInfos];
                id v40 = [v39 count];

                if ((id)[(CRLFreehandDrawingTool *)v2 type] == (id)7) {
                  id v40 = [v57 maxFilledShapeIndex];
                }
                v41 = [[_TtC8Freeform28CRLCommandReparentBoardItems alloc] initWithDestinationContainer:v25 boardItem:v33 index:v40];
                [v60 enqueueCommand:v41];
                id v42 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v33 geometry:v38];
                [v60 enqueueCommand:v42];

                v2 = v59;
              }
            }
            id v29 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
          }
          while (v29);
        }

        BOOL v3 = v56;
        id v43 = [v56 canvasEditor];
        int v44 = [v43 canvasEditorHelper];
        v4 = v55;
        __int16 v45 = +[NSSet setWithObject:v55];
        v46 = [v44 commandForDeletingInfosPossiblyFromMultipleContainers:v45 shouldRemoveEmptyContainers:1 canDeleteNewlyCreatedInfos:1];

        [v60 enqueueCommand:v46];
        [v60 closeGroup];

        id v11 = v54;
        double v22 = v57;
        goto LABEL_29;
      }
      int v47 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CFA10);
      }
      int v48 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106DAE0(v47, v48);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CFA30);
      }
      __int16 v49 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v49);
      }
      v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolAbstractPathInsertion p_updateOrCreateParentDrawingToBestMatch]");
      v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolAbstractPathInsertion.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 425, 0, "expected inequality between %{public}s and %{public}s", "closestDrawingLayout", "initialDrawingLayout");
    }
    id v25 = [[_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering alloc] initWithFreehandDrawingItem:v4 prohibitsClustering:0];
    [v60 enqueueCommand:v25];
LABEL_29:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalBoundsForStandardKnobsInRootForDrawings, 0);
  objc_storeStrong((id *)&self->_shapeItem, 0);

  objc_storeStrong((id *)&self->_initialFreehandDrawingItem, 0);
}

@end