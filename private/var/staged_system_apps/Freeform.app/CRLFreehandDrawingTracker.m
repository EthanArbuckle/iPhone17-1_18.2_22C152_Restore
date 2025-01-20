@interface CRLFreehandDrawingTracker
+ (BOOL)p_operationShouldBeDynamicUsingToolType:(unint64_t)a3;
- (BOOL)allowPopoverToRemainOpenDuringDynamicOperation;
- (BOOL)disallowCanvasGrowingWhileTracking;
- (BOOL)isEnqueueingCommandsInRealTime;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldAllowScroll;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)supportsAlignmentGuides;
- (CRLFreehandDrawingTracker)initWithInteractiveCanvasController:(id)a3;
- (void)addPoint:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3;
- (void)finishWithSuccess:(BOOL)a3;
- (void)p_changeDynamicLayouts;
- (void)p_sendPendingEstimationUpdatePointsToToolAndClearQueue;
- (void)p_sendPendingInputPointsToToolAndClearQueue;
- (void)p_setTrackingToolIfNeeded;
- (void)willBeginDynamicOperationForReps:(id)a3;
@end

@implementation CRLFreehandDrawingTracker

- (CRLFreehandDrawingTracker)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLFreehandDrawingTracker;
  v5 = [(CRLFreehandDrawingTracker *)&v20 init];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015006D8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BDA9C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015006F8);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker initWithInteractiveCanvasController:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 51, 0, "invalid nil value for '%{public}s'", "icc");
    }
    objc_storeWeak((id *)&v5->_icc, v4);
    uint64_t v9 = +[NSMutableArray array];
    pendingInputPointsToSendToTool = v5->_pendingInputPointsToSendToTool;
    v5->_pendingInputPointsToSendToTool = (NSMutableArray *)v9;

    uint64_t v11 = +[NSMutableArray array];
    pendingEstimationUpdatePointsToSendToTool = v5->_pendingEstimationUpdatePointsToSendToTool;
    v5->_pendingEstimationUpdatePointsToSendToTool = (NSMutableArray *)v11;

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_icc);
    v14 = [WeakRetained freehandDrawingToolkit];
    v15 = [v14 currentTool];

    if (!v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500718);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BDA08();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500738);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker initWithInteractiveCanvasController:]");
      v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 57, 0, "invalid nil value for '%{public}s'", "currentDrawingTool");
    }
    v5->_operationShouldBeDynamic = +[CRLFreehandDrawingTracker p_operationShouldBeDynamicUsingToolType:](CRLFreehandDrawingTracker, "p_operationShouldBeDynamicUsingToolType:", [v15 type]);
  }
  return v5;
}

+ (BOOL)p_operationShouldBeDynamicUsingToolType:(unint64_t)a3
{
  return a3 < 8;
}

- (void)addPoint:(id)a3
{
  if (self->_hasFinishBeenCalled)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500758);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BDB30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500778);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker addPoint:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:88 isFatal:0 description:"Trying to add more points after calling finishWithSuccess."];
  }
  else
  {
    pendingInputPointsToSendToTool = self->_pendingInputPointsToSendToTool;
    [(NSMutableArray *)pendingInputPointsToSendToTool addObject:a3];
  }
}

- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3
{
  if (self->_hasFinishBeenCalled)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500798);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BDBB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015007B8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker estimatedPropertiesUpdatedOnInputPoint:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:96 isFatal:0 description:"Trying to update properties on more points after calling finishWithSuccess."];
  }
  else
  {
    pendingEstimationUpdatePointsToSendToTool = self->_pendingEstimationUpdatePointsToSendToTool;
    [(NSMutableArray *)pendingEstimationUpdatePointsToSendToTool addObject:a3];
  }
}

- (void)finishWithSuccess:(BOOL)a3
{
  self->_hasFinishBeenCalled = 1;
  self->_wasSuccessful = a3;
  if (![(NSMutableArray *)self->_pendingInputPointsToSendToTool count] && self->_lastInputPointSentToTool)
  {
    pendingInputPointsToSendToTool = self->_pendingInputPointsToSendToTool;
    -[NSMutableArray addObject:](pendingInputPointsToSendToTool, "addObject:");
  }
}

- (BOOL)shouldAllowScroll
{
  return 1;
}

- (BOOL)disallowCanvasGrowingWhileTracking
{
  return 1;
}

- (BOOL)allowPopoverToRemainOpenDuringDynamicOperation
{
  return 1;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  [(CRLFreehandDrawingTracker *)self p_setTrackingToolIfNeeded];
  if (!self->_trackingTool)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015007D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BDC40();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015007F8);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker willBeginDynamicOperationForReps:]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 135, 0, "invalid nil value for '%{public}s'", "_trackingTool");
  }
}

- (void)p_changeDynamicLayouts
{
  [(CRLFreehandDrawingTracker *)self p_setTrackingToolIfNeeded];
  if (!self->_trackingTool)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500818);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BDCD4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500838);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_changeDynamicLayouts]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 146, 0, "invalid nil value for '%{public}s'", "_trackingTool");
  }
  if (!self->_hasBegunDrawing)
  {
    self->_hasBegunDrawing = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v7 = [WeakRetained pkDrawingProvider];
    [v7 activeDrawingDidBegin];

    id v8 = objc_loadWeakRetained((id *)&self->_icc);
    uint64_t v9 = [v8 editingCoordinator];
    [v9 suspendCollaborationWithReason:@"CRLFreehandDrawingTracker"];
  }
  [(CRLFreehandDrawingTracker *)self p_sendPendingInputPointsToToolAndClearQueue];
  [(CRLFreehandDrawingTracker *)self p_sendPendingEstimationUpdatePointsToToolAndClearQueue];
}

- (void)p_sendPendingInputPointsToToolAndClearQueue
{
  v3 = (char *)[(NSMutableArray *)self->_pendingInputPointsToSendToTool count];
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = v3 - 1;
    *(void *)&long long v4 = 67109378;
    long long v20 = v4;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_pendingInputPointsToSendToTool, "objectAtIndexedSubscript:", v6, v20);
      id v8 = (CRLFreehandDrawingToolInputPoint *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = v8;
      if (!self->_hasSentInitialPointToTool && [(CRLFreehandDrawingToolInputPoint *)v8 isPredicted])
      {
        unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101500858);
        }
        uint64_t v11 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          unsigned int v22 = v10;
          __int16 v23 = 2082;
          v24 = "-[CRLFreehandDrawingTracker p_sendPendingInputPointsToToolAndClearQueue]";
          __int16 v25 = 2082;
          v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m";
          __int16 v27 = 1024;
          int v28 = 175;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The first point sent should not be predicted.", buf, 0x22u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101500878);
        }
        v12 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v18 = v12;
          v19 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = v20;
          unsigned int v22 = v10;
          __int16 v23 = 2114;
          v24 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_sendPendingInputPointsToToolAndClearQueue]");
        v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
        +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:175 isFatal:0 description:"The first point sent should not be predicted."];
      }
      BOOL v16 = v7 == v6 && self->_hasFinishBeenCalled;
      [(CRLFreehandDrawingTool *)self->_trackingTool performActionWithInputPoint:v9 isInitialPoint:!self->_hasSentInitialPointToTool isFinalPoint:v16];
      self->_hasSentInitialPointToTool = 1;
      lastInputPointSentToTool = self->_lastInputPointSentToTool;
      self->_lastInputPointSentToTool = v9;

      ++v6;
    }
    while (v5 != v6);
  }
  [(NSMutableArray *)self->_pendingInputPointsToSendToTool removeAllObjects];
}

- (void)p_sendPendingEstimationUpdatePointsToToolAndClearQueue
{
  if (!self->_hasFinishBeenCalled)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = self->_pendingEstimationUpdatePointsToSendToTool;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[CRLFreehandDrawingTool estimatedPropertiesUpdatedOnInputPoint:](self->_trackingTool, "estimatedPropertiesUpdatedOnInputPoint:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  [(NSMutableArray *)self->_pendingEstimationUpdatePointsToSendToTool removeAllObjects];
}

- (void)p_setTrackingToolIfNeeded
{
  if (!self->_trackingTool)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500898);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BDE90();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015008B8);
      }
      id v4 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v4);
      }
      id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded]");
      uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 200, 0, "invalid nil value for '%{public}s'", "icc");
    }
    v7 = [WeakRetained freehandDrawingToolkit];
    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015008D8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BDDFC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015008F8);
      }
      long long v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      long long v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded]");
      long long v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 203, 0, "invalid nil value for '%{public}s'", "toolkit");
    }
    long long v11 = [v7 currentTool];
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500918);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BDD68();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500938);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 206, 0, "invalid nil value for '%{public}s'", "drawingTool");
    }
    trackingTool = self->_trackingTool;
    self->_trackingTool = v11;
    BOOL v16 = v11;

    LOBYTE(trackingTool) = [(CRLFreehandDrawingTool *)self->_trackingTool shouldCommandsEnqueueInRealTime];
    self->_isEnqueueingCommandsInRealTime = (char)trackingTool;
  }
}

- (void)commitChangesForReps:(id)a3
{
  id v4 = a3;
  if (self->_hasBegunDrawing)
  {
    if (!self->_hasFinishBeenCalled)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_101500958);
      }
      id v5 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
        sub_1010BE034(v5);
      }
      [(CRLFreehandDrawingTracker *)self finishWithSuccess:0];
      [(CRLFreehandDrawingTracker *)self p_changeDynamicLayouts];
    }
    trackingTool = self->_trackingTool;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    long long v8 = [WeakRetained freehandDrawingToolkit];
    long long v9 = [v8 currentTool];

    if (trackingTool != v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500978);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BDFAC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500998);
      }
      long long v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      long long v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker commitChangesForReps:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:228 isFatal:0 description:"_trackingTool shouldn't have changed while we were in the dynamic operation."];
    }
    unsigned int v13 = [(CRLFreehandDrawingTool *)self->_trackingTool finalizeAndResetWithSuccess:self->_wasSuccessful];
    if (!self->_wasSuccessful && v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015009B8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BDF24();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015009D8);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker commitChangesForReps:]");
      BOOL v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 231, 0, "The tool can add a failure, but not stop a failure from this tracker.");
    }
    [(CRLFreehandDrawingTool *)self->_trackingTool clearIsCurrentlyTracking];
    id v17 = objc_loadWeakRetained((id *)&self->_icc);
    v18 = [v17 editingCoordinator];
    [v18 resumeCollaborationWithReason:@"CRLFreehandDrawingTracker"];
  }
  v19 = self->_trackingTool;
  self->_trackingTool = 0;

  lastInputPointSentToTool = self->_lastInputPointSentToTool;
  self->_lastInputPointSentToTool = 0;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return self->_operationShouldBeDynamic;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->_isEnqueueingCommandsInRealTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInputPointSentToTool, 0);
  objc_storeStrong((id *)&self->_pendingEstimationUpdatePointsToSendToTool, 0);
  objc_storeStrong((id *)&self->_pendingInputPointsToSendToTool, 0);
  objc_storeStrong((id *)&self->_trackingTool, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end