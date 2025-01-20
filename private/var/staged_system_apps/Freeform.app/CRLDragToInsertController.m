@interface CRLDragToInsertController
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)readyToEndOperation;
- (CGPoint)autoscrollPoint;
- (CRLCanvasAutoscroll)autoscroll;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLDragToInsertController)initWithBoardItems:(id)a3 canvasEditor:(id)a4 atPoint:(CGPoint)a5 withPostInsertionBlock:(id)a6;
- (CRLInteractiveCanvasController)icc;
- (void)cancelDragToInsert;
- (void)commitDragToInsert;
- (void)dealloc;
- (void)dragToPoint:(CGPoint)a3;
- (void)operationDidEnd;
- (void)p_finishDragging;
- (void)p_updateTrackerPointsAtPoint:(CGPoint)a3;
- (void)setAutoscroll:(id)a3;
- (void)updateAfterAutoscroll:(id)a3;
@end

@implementation CRLDragToInsertController

- (CRLDragToInsertController)initWithBoardItems:(id)a3 canvasEditor:(id)a4 atPoint:(CGPoint)a5 withPostInsertionBlock:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(void))a6;
  if (v12)
  {
    if (v11) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F8B88);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B1654();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F8BA8);
  }
  v14 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v14);
  }
  v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:]");
  v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 47, 0, "Invalid parameter not satisfying: %{public}s", "canvasEditor != nil");

  if (!v11)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8BC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B15B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8BE8);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 48, 0, "Invalid parameter not satisfying: %{public}s", "boardItemsToInsert != nil");
  }
LABEL_22:
  v66.receiver = self;
  v66.super_class = (Class)CRLDragToInsertController;
  v20 = [(CRLDragToInsertController *)&v66 init];
  v21 = v20;
  if (v20)
  {
    v56 = v13;
    v57 = v11;
    objc_storeStrong((id *)&v20->_canvasEditor, a4);
    v22 = [v12 interactiveCanvasController];
    [v22 setIsDraggingToInsertBoardItems:1];
    [v12 editorController];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v55 = long long v65 = 0u;
    v23 = [v55 currentEditors];
    id v24 = [v23 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v63;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v63 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v28 canRemainDuringDragInsert] & 1) == 0)
          {
            [v55 setSelectionPathToPopEditor:v28];
            goto LABEL_34;
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v62 objects:v68 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_34:

    [v22 setTemporaryAdditionalBoardItemsToDisplay:v57];
    uint64_t v29 = +[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:", 1, 0, 1, 1, 0x7FFFFFFFFFFFFFFFLL, x, y);
    v21->_lastPoint.double x = x;
    v21->_lastPoint.double y = y;
    v53 = (void *)v29;
    [v12 prepareGeometryForInsertingBoardItems:v57];
    if (v13)
    {
      id v30 = [v13 copy];
      id mPostInsertionBlock = v21->mPostInsertionBlock;
      v21->id mPostInsertionBlock = v30;

      v13[2](v13);
    }
    [v22 layoutIfNeededIncludingLayerTreeIfYouKnowWhatYouAreDoing];
    v32 = (NSArray *)[v57 copy];
    boardItemsToInsert = v21->_boardItemsToInsert;
    v21->_boardItemsToInsert = v32;

    v52 = [v57 lastObject];
    uint64_t v34 = [v22 repForInfo:];
    if (!v34)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F8C08);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B151C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F8C28);
      }
      v35 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v35);
      }
      v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:]");
      v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 93, 0, "invalid nil value for '%{public}s'", "repToDrag");
    }
    id v54 = v12;
    v51 = (void *)v34;
    v38 = [[CRLCanvasRepDragTracker alloc] initWithRep:v34];
    repDragTracker = v21->_repDragTracker;
    v21->_repDragTracker = v38;

    [(CRLCanvasRepDragTracker *)v21->_repDragTracker preventOpeningCommandGroupWhenCommittingChangesForReps];
    [(CRLCanvasRepDragTracker *)v21->_repDragTracker setIsDragInsertDrivenTracking:1];
    -[CRLDragToInsertController p_updateTrackerPointsAtPoint:](v21, "p_updateTrackerPointsAtPoint:", x, y);
    v21->_isFinishedDragging = 0;
    v40 = [v22 tmCoordinator];
    [v40 registerTrackerManipulator:v21];
    [v40 takeControlWithTrackerManipulator:v21];
    v41 = [v22 dynamicOperationController];
    [v41 beginOperation];
    id v42 = objc_alloc_init((Class)NSMutableSet);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v43 = v57;
    id v44 = [v43 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v59;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v59 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = [v22 repForInfo:*(void *)(*((void *)&v58 + 1) + 8 * (void)j)];
          v49 = v48;
          if (v48)
          {
            [v48 beginDragInsertFromPalette:v21];
            [v42 addObject:v49];
          }
        }
        id v45 = [v43 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v45);
    }

    [v41 startTransformingReps:v42];
    -[CRLCanvasRepDragTracker beginShowingDragUIForInitialDragPoint:](v21->_repDragTracker, "beginShowingDragUIForInitialDragPoint:", x, y);
    [v41 handleTrackerManipulator:v21];

    v13 = v56;
    id v11 = v57;
    id v12 = v54;
  }

  return v21;
}

- (void)dealloc
{
  if (!self->_autoscroll)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8C48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B16F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8C68);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:131 isFatal:0 description:"must finish dragging before deallocating drag to insert controller"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLDragToInsertController;
  [(CRLDragToInsertController *)&v6 dealloc];
}

- (void)dragToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasRepDragTracker *)self->_repDragTracker addUnscaledDragDelta:1 roundDeltaToViewScale:sub_100064680(a3.x, a3.y, self->_lastPoint.x)];
  -[CRLDragToInsertController p_updateTrackerPointsAtPoint:](self, "p_updateTrackerPointsAtPoint:", x, y);
  objc_super v6 = [(CRLDragToInsertController *)self icc];
  v7 = [v6 dynamicOperationController];
  [v7 handleTrackerManipulator:self];

  self->_lastPoint.double x = x;
  self->_lastPoint.double y = y;
}

- (void)p_updateTrackerPointsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v10 = [(CRLDragToInsertController *)self icc];
  [v10 convertUnscaledToBoundsPoint:x, y];
  double v7 = v6;
  double v9 = v8;
  -[CRLCanvasRepDragTracker setLogicalDragPoint:](self->_repDragTracker, "setLogicalDragPoint:");
  -[CRLCanvasRepDragTracker setActualDragPoint:](self->_repDragTracker, "setActualDragPoint:", v7, v9);
  [(CRLCanvasRepDragTracker *)self->_repDragTracker setShouldSnapToGuides:1];
}

- (void)cancelDragToInsert
{
  [(CRLDragToInsertController *)self p_finishDragging];
  v3 = [(CRLDragToInsertController *)self icc];
  [v3 setTemporaryAdditionalBoardItemsToDisplay:0];

  id v4 = [(CRLCanvasEditor *)self->_canvasEditor interactiveCanvasController];
  [v4 setIsDraggingToInsertBoardItems:0];
}

- (void)commitDragToInsert
{
  v3 = [(CRLDragToInsertController *)self icc];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v40 = self;
  obj = self->_boardItemsToInsert;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v61 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v47;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v8);
        id v10 = [v3 layoutForInfo:v9];
        id v11 = v10;
        if (v10)
        {
          if ([v10 isInGroup]) {
            [v11 pureGeometry];
          }
          else {
          v17 = [v11 pureGeometryInRoot];
          }
          v15 = [v11 computeInfoGeometryFromPureLayoutGeometry:v17];

          id v16 = [v15 mutableCopy];
          v18 = [v9 geometry];
          objc_msgSend(v16, "setWidthValid:", objc_msgSend(v18, "widthValid"));

          v19 = [v9 geometry];
          objc_msgSend(v16, "setHeightValid:", objc_msgSend(v19, "heightValid"));

          [v9 autosizePositionOffsetForGeometry:v16 dynamicallyDraggedLayout:v11];
          double v21 = v20;
          [v16 position];
          [v16 setPosition:sub_100064698(v22, v23, v21)];
          id v24 = +[CRLPair pairWithFirst:v9 second:v16];
          [v4 addObject:v24];
        }
        else
        {
          unsigned int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F8C88);
          }
          v13 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v52 = v12;
            __int16 v53 = 2082;
            id v54 = "-[CRLDragToInsertController commitDragToInsert]";
            __int16 v55 = 2082;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m";
            __int16 v57 = 1024;
            int v58 = 175;
            __int16 v59 = 2082;
            long long v60 = "layout";
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F8CA8);
          }
          v14 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            id v25 = v14;
            uint64_t v26 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v52 = v12;
            __int16 v53 = 2114;
            id v54 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController commitDragToInsert]");
          id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 175, 0, "invalid nil value for '%{public}s'", "layout");
        }

        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v61 count:16];
    }
    while (v6);
  }

  [(CRLDragToInsertController *)v40 cancelDragToInsert];
  v27 = [v3 commandController];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v28 = v4;
  id v29 = [v28 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v43;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v34 = [v33 second];
        v35 = [v33 first];
        [v35 setGeometry:v34];
      }
      id v30 = [v28 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v30);
  }

  v36 = +[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 1, 0, 0x7FFFFFFFFFFFFFFFLL, CGPointZero.x, CGPointZero.y);
  if ([v36 shouldEndEditing]) {
    [v3 endEditing];
  }
  [v27 openGroup];
  [(CRLCanvasEditor *)v40->_canvasEditor insertBoardItems:v40->_boardItemsToInsert withInsertionContext:v36 postProcessBlock:0];
  v37 = [(CRLCanvasEditor *)v40->_canvasEditor interactiveCanvasController];
  [v37 setIsDraggingToInsertBoardItems:1];

  id mPostInsertionBlock = (void (**)(void))v40->mPostInsertionBlock;
  if (mPostInsertionBlock) {
    mPostInsertionBlock[2]();
  }
  v39 = [(CRLCanvasEditor *)v40->_canvasEditor interactiveCanvasController];
  [v39 setIsDraggingToInsertBoardItems:0];

  [v27 closeGroup];
}

- (void)p_finishDragging
{
  self->_isFinishedDragging = 1;
  v3 = [(CRLDragToInsertController *)self icc];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_boardItemsToInsert;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [v3 repForInfo:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8) v12];
        id v10 = v9;
        if (v9) {
          [v9 endDragInsertFromPalette:self];
        }

        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v11 = [v3 dynamicOperationController];
  [v11 handleTrackerManipulator:self];
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_repDragTracker;
}

- (BOOL)readyToEndOperation
{
  return self->_isFinishedDragging;
}

- (void)operationDidEnd
{
  [(CRLCanvasRepDragTracker *)self->_repDragTracker endPossibleRepDragGesture];
  autoscroll = self->_autoscroll;
  if (autoscroll)
  {
    [(CRLCanvasAutoscroll *)autoscroll invalidate];
  }
}

- (CRLInteractiveCanvasController)icc
{
  return [(CRLCanvasEditor *)self->_canvasEditor interactiveCanvasController];
}

- (CGPoint)autoscrollPoint
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)updateAfterAutoscroll:(id)a3
{
  [a3 lastAutoscrollDelta];
  double v5 = v4;
  -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->_repDragTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
  self->_lastPoint.double x = sub_100064698(self->_lastPoint.x, self->_lastPoint.y, v5);
  self->_lastPoint.double y = v6;
  -[CRLDragToInsertController p_updateTrackerPointsAtPoint:](self, "p_updateTrackerPointsAtPoint:");
  id v8 = [(CRLDragToInsertController *)self icc];
  uint64_t v7 = [v8 dynamicOperationController];
  [v7 handleTrackerManipulator:self];
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong(&self->mPostInsertionBlock, 0);
  objc_storeStrong((id *)&self->_boardItemsToInsert, 0);
  objc_storeStrong((id *)&self->_canvasEditor, 0);

  objc_storeStrong((id *)&self->_repDragTracker, 0);
}

@end