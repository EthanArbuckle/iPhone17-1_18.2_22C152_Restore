@interface CRLDragAndDropController
+ (unint64_t)p_dragOperationForSupportedDragOperations:(unint64_t)a3;
- (BOOL)canCreateBoardItemsFromDragInfo:(id)a3;
- (BOOL)insertBoardItemsForDragInfo:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5;
- (BOOL)insertDroppedNativeBoardItemsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5 isCrossAppSource:(BOOL)a6 isCrossDocument:(BOOL)a7;
- (BOOL)insertNativePasteboardBoardItems:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5;
- (BOOL)p_performDragOperationWithDragInfo:(id)a3 onDragDestination:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)p_shouldInsertDraggedBoardItems:(id)a3;
- (BOOL)performDragOperation:(id)a3 atScaledPoint:(CGPoint)a4;
- (BOOL)performIndirectDragOperationWithDragInfo:(id)a3 inContainer:(id)a4 targetZOrder:(unint64_t)a5;
- (BOOL)performIndirectDragOperationWithDragInfo:(id)a3 onInfo:(id)a4;
- (BOOL)prepareForDragOperation:(id)a3;
- (BOOL)shouldCleanupAfterSuccessfulDragOperation;
- (CRLDragAndDropController)init;
- (CRLDragAndDropController)initWithDelegate:(id)a3 interactiveCanvasController:(id)a4;
- (CRLDragAndDropControllerDelegate)delegate;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (id)nativeProvidersForDynamicDragInsertionWithDragInfo:(id)a3;
- (id)p_accessibilityDescriptionForDropTarget:(id)a3;
- (id)p_alertPresenter;
- (id)p_dragDestinationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (id)p_errorPresenter;
- (id)p_modalOperationPresenter;
- (unint64_t)draggingEntered:(id)a3 atScaledPoint:(CGPoint)a4;
- (unint64_t)draggingUpdated:(id)a3 atScaledPoint:(CGPoint)a4;
- (unint64_t)p_dragOperationForDragInsideWithDraggingInfo:(id)a3 atScaledPoint:(CGPoint)a4;
- (void)canvasDidUpdateReps:(id)a3;
- (void)cleanupEndOfDragOperation;
- (void)concludeDragOperation:(id)a3;
- (void)dealloc;
- (void)draggingExited:(id)a3;
- (void)insertDroppedImportableBoardItemsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5 completionHandler:(id)a6;
- (void)p_announceAccessibilityDropTarget:(id)a3;
- (void)p_hideDragAndDropHighlightOnCanvasEditor;
- (void)p_hideDragAndDropHighlightOnRep;
- (void)p_showDragAndDropHighlightForCanvasEditorWithDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (void)p_showDragAndDropHighlightForRep:(id)a3 atUnscaledPoint:(CGPoint)a4 draggingInfo:(id)a5;
- (void)p_updateHighlightStateForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4 dragOperation:(unint64_t)a5 dragDestination:(id)a6;
- (void)targetScrollViewDidScroll;
@end

@implementation CRLDragAndDropController

- (CRLDragAndDropController)initWithDelegate:(id)a3 interactiveCanvasController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLDragAndDropController;
  v8 = [(CRLDragAndDropController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_interactiveCanvasController, v7);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.freeform.CRLDragInfosReadyAccess", 0);
    infosToBeInsertedAccessQueue = v9->_infosToBeInsertedAccessQueue;
    v9->_infosToBeInsertedAccessQueue = (OS_dispatch_queue *)v10;

    v9->_targetZOrderForDropOperation = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (CRLDragAndDropController)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F01B0);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLDragAndDropController init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m";
    __int16 v17 = 1024;
    int v18 = 109;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F01D0);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    id v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:109 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLDragAndDropController init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)dealloc
{
  if (self->_dragState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F01F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2370();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0210);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:114 isFatal:0 description:"Did not clean up properly at end of drag operation!"];

    id v6 = [(CRLDragAndDropController *)self interactiveCanvasController];
    id v7 = [v6 editingCoordinator];
    [v7 resumeCollaborationWithReason:@"CRLCanvasDragAndDrop"];
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLDragAndDropController;
  [(CRLDragAndDropController *)&v8 dealloc];
}

- (id)p_alertPresenter
{
  unsigned int v2 = [(CRLDragAndDropController *)self interactiveCanvasController];
  v3 = [v2 layerHost];

  return v3;
}

- (id)p_modalOperationPresenter
{
  unsigned int v2 = [(CRLDragAndDropController *)self interactiveCanvasController];
  v3 = [v2 layerHost];

  return v3;
}

- (id)p_errorPresenter
{
  unsigned int v2 = [(CRLDragAndDropController *)self interactiveCanvasController];
  v3 = [v2 layerHost];

  return v3;
}

- (id)nativeProvidersForDynamicDragInsertionWithDragInfo:(id)a3
{
  return 0;
}

- (BOOL)canCreateBoardItemsFromDragInfo:(id)a3
{
  return 0;
}

- (BOOL)insertBoardItemsForDragInfo:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5
{
  return 0;
}

- (BOOL)shouldCleanupAfterSuccessfulDragOperation
{
  return self->_targetZOrderForDropOperation != 0x7FFFFFFFFFFFFFFFLL
      || self->_infoToTargetForIndirectDropOperation != 0;
}

- (unint64_t)draggingEntered:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0230);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2480();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0250);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingEntered:atScaledPoint:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:160 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  unint64_t dragState = self->_dragState;
  if (dragState == 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0270);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A23F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0290);
    }
    v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingEntered:atScaledPoint:]");
    __int16 v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:170 isFatal:0 description:"Called dragging entered when we were already in state entered!"];
  }
  else
  {
    if (dragState) {
      goto LABEL_24;
    }
    self->_unint64_t dragState = 1;
    unsigned int v12 = [(CRLDragAndDropController *)self interactiveCanvasController];
    __int16 v13 = [v12 canvas];
    [v13 i_registerCanvasLayoutObserver:self];

    v14 = [(CRLDragAndDropController *)self interactiveCanvasController];
    __int16 v15 = [v14 editingCoordinator];
    [v15 suspendCollaborationWithReason:@"CRLCanvasDragAndDrop"];
  }

LABEL_24:
  __int16 v17 = [(CRLDragAndDropController *)self delegate];
  unsigned __int8 v18 = [v17 shouldAllowDragOperationForDragInfo:v7];

  if (v18)
  {
    infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10034E130;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_sync(infosToBeInsertedAccessQueue, block);
    v20 = [(CRLDragAndDropController *)self delegate];
    unsigned int v21 = [v20 shouldAllowDynamicInsertForDragInfo:v7];

    if (v21)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v54 = sub_10034E144;
      v55 = sub_10034E154;
      id v56 = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3032000000;
      v49[3] = sub_10034E144;
      v49[4] = sub_10034E154;
      id v50 = 0;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10034E15C;
      v45[3] = &unk_1014CB068;
      v45[4] = self;
      id v46 = v7;
      v47 = buf;
      v48 = v49;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v45);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(buf, 8);
    }
    self->_unint64_t lastReturnedDragOperation = -[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:](self, "p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:", v7, x, y);
    self->_lastProvidedDragPoint.double x = x;
    self->_lastProvidedDragPoint.double y = y;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v22 = [v7 inProcessDraggingSources];
    id v23 = [v22 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v23)
    {
      id v30 = v23;
      uint64_t v31 = *(void *)v42;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v22);
          }
          v33 = sub_100246AC8(*(void **)(*((void *)&v41 + 1) + 8 * i), 1, v24, v25, v26, v27, v28, v29, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
          if (v33)
          {
            unint64_t lastReturnedDragOperation = self->_lastReturnedDragOperation;
            v35 = [(CRLDragAndDropController *)self interactiveCanvasController];
            [v33 draggingEnteredWithOperation:lastReturnedDragOperation targetInteractiveCanvasController:v35];
          }
        }
        id v30 = [v22 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v30);
    }

    if (qword_101719CF0 != -1) {
      dispatch_once(&qword_101719CF0, &stru_1014F0378);
    }
    v36 = off_10166DB68;
    if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v37 = self->_lastReturnedDragOperation;
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "-draggingEntered. Operation %lu with drag info %@", buf, 0x16u);
    }
    unint64_t v38 = self->_lastReturnedDragOperation;
  }
  else
  {
    if (qword_101719CF0 != -1) {
      dispatch_once(&qword_101719CF0, &stru_1014F02B0);
    }
    v39 = off_10166DB68;
    if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Preventing drag operation with -shouldAllowDragOperationForDragInfo: %@", buf, 0xCu);
    }
    unint64_t v38 = 0;
  }

  return v38;
}

- (unint64_t)draggingUpdated:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  objc_super v8 = [(CRLDragAndDropController *)self delegate];
  unsigned int v9 = [v8 shouldAllowDragOperationForDragInfo:v7];

  if (v9)
  {
    if (!self->_dragState)
    {
      int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0398);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A25C0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F03B8);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A2508(v11, v10);
      }
      unsigned int v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingUpdated:atScaledPoint:]");
      __int16 v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:318 isFatal:0 description:"draggingUpdated called without draggingEntered called first!"];

      -[CRLDragAndDropController draggingEntered:atScaledPoint:](self, "draggingEntered:atScaledPoint:", v7, x, y);
    }
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10034F2B4;
    block[3] = &unk_1014CB090;
    block[4] = self;
    void block[5] = &v57;
    dispatch_sync(infosToBeInsertedAccessQueue, block);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    __int16 v15 = [v7 inProcessDraggingSources];
    id v22 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v53;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(v15);
          }
          uint64_t v25 = sub_100246AC8(*(void **)(*((void *)&v52 + 1) + 8 * i), 1, v16, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
          uint64_t v26 = v25;
          if (v25 && ([v25 draggingWantsForcedUpdate] & 1) != 0)
          {

            int canvasDidLayoutSinceLastUpdate = 1;
            goto LABEL_24;
          }
        }
        id v22 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    int canvasDidLayoutSinceLastUpdate = self->_canvasDidLayoutSinceLastUpdate;
LABEL_24:
    self->_int canvasDidLayoutSinceLastUpdate = 0;
    if (self->_lastProvidedDragPoint.x != x
      || self->_lastProvidedDragPoint.y != y
      || ((*((unsigned char *)v58 + 24) == 0) & ~canvasDidLayoutSinceLastUpdate) == 0)
    {
      unint64_t v29 = -[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:](self, "p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:", v7, x, y);
      if (v29 != self->_lastReturnedDragOperation)
      {
        if (qword_101719CF0 != -1) {
          dispatch_once(&qword_101719CF0, &stru_1014F03D8);
        }
        id v30 = off_10166DB68;
        if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t lastReturnedDragOperation = self->_lastReturnedDragOperation;
          *(_DWORD *)buf = 134218240;
          unint64_t v63 = lastReturnedDragOperation;
          __int16 v64 = 2048;
          unint64_t v65 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "-draggingUpdated. Operation changed from %lu to %lu", buf, 0x16u);
        }
        self->_unint64_t lastReturnedDragOperation = v29;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v32 = [v7 inProcessDraggingSources];
        id v39 = [v32 countByEnumeratingWithState:&v48 objects:v61 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v49;
          do
          {
            for (j = 0; j != v39; j = (char *)j + 1)
            {
              if (*(void *)v49 != v40) {
                objc_enumerationMutation(v32);
              }
              long long v42 = sub_100246AC8(*(void **)(*((void *)&v48 + 1) + 8 * (void)j), 1, v33, v34, v35, v36, v37, v38, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
              if (v42)
              {
                unint64_t v43 = self->_lastReturnedDragOperation;
                long long v44 = [(CRLDragAndDropController *)self interactiveCanvasController];
                [v42 draggingUpdatedWithOperation:v43 targetInteractiveCanvasController:v44];
              }
            }
            id v39 = [v32 countByEnumeratingWithState:&v48 objects:v61 count:16];
          }
          while (v39);
        }
      }
      self->_lastProvidedDragPoint.double x = x;
      self->_lastProvidedDragPoint.double y = y;
      v45 = self->_infosToBeInsertedAccessQueue;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10034F308;
      v47[3] = &unk_1014CBBB0;
      v47[4] = self;
      dispatch_sync(v45, v47);
    }
    unint64_t v28 = self->_lastReturnedDragOperation;
    _Block_object_dispose(&v57, 8);
  }
  else
  {
    unint64_t v28 = 0;
  }

  return v28;
}

- (void)draggingExited:(id)a3
{
  id v4 = a3;
  if (qword_101719CF0 != -1) {
    dispatch_once(&qword_101719CF0, &stru_1014F03F8);
  }
  v5 = off_10166DB68;
  if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-draggingExited.", buf, 2u);
  }
  if (self->_dragState)
  {
    [(CRLDragAndDropController *)self cleanupEndOfDragOperation];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = [v4 inProcessDraggingSources];
    id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      id v14 = v7;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v6);
          }
          uint64_t v17 = sub_100246AC8(*(void **)(*((void *)&v21 + 1) + 8 * i), 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
          uint64_t v18 = v17;
          if (v17) {
            [v17 draggingExited];
          }
        }
        id v14 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0418);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2648();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0438);
    }
    uint64_t v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingExited:]");
    uint64_t v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v20 lineNumber:387 isFatal:0 description:"draggingExited called without draggingEntered called first!"];
  }
}

- (BOOL)prepareForDragOperation:(id)a3
{
  return 1;
}

- (BOOL)performDragOperation:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (qword_101719CF0 != -1) {
    dispatch_once(&qword_101719CF0, &stru_1014F0458);
  }
  uint64_t v8 = off_10166DB68;
  if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "-performDragOperation.", (uint8_t *)&v26, 2u);
  }
  if (!self->_dragState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0478);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2758();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0498);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performDragOperation:atScaledPoint:]");
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:418 isFatal:0 description:"draggingUpdated called without draggingEntered called first!"];

    -[CRLDragAndDropController draggingEntered:atScaledPoint:](self, "draggingEntered:atScaledPoint:", v7, x, y);
  }
  uint64_t v12 = [(CRLDragAndDropController *)self delegate];
  unsigned __int8 v13 = [v12 shouldAllowDragOperationForDragInfo:v7];

  if (v13)
  {
    id v14 = [(CRLDragAndDropController *)self interactiveCanvasController];
    [v14 convertBoundsToUnscaledPoint:x, y];
    double v16 = v15;
    double v18 = v17;
    [v7 setShouldHidePromisedFileTypes:1];
    uint64_t v19 = -[CRLDragAndDropController p_dragDestinationForDragInfo:atUnscaledPoint:](self, "p_dragDestinationForDragInfo:atUnscaledPoint:", v7, v16, v18);
    [v7 setShouldHidePromisedFileTypes:0];
    if (qword_101719CF0 != -1) {
      dispatch_once(&qword_101719CF0, &stru_1014F04F8);
    }
    uint64_t v20 = off_10166DB68;
    if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      uint64_t v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "drag destination: %@", (uint8_t *)&v26, 0xCu);
    }
    BOOL v21 = -[CRLDragAndDropController p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:](self, "p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:", v7, v19, v16, v18);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F04B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A26D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F04D8);
    }
    long long v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v22);
    }
    long long v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performDragOperation:atScaledPoint:]");
    long long v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:428 isFatal:0 description:"OS shouldn't tell us to perform drag operation when -shouldAllowDragOperationForDragInfo returns NO"];

    [(CRLDragAndDropController *)self cleanupEndOfDragOperation];
    BOOL v21 = 0;
  }

  return v21;
}

- (void)concludeDragOperation:(id)a3
{
  id v4 = a3;
  if (qword_101719CF0 != -1) {
    dispatch_once(&qword_101719CF0, &stru_1014F0518);
  }
  v5 = off_10166DB68;
  if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p concludeDragOperation with drag info %@", (uint8_t *)&v6, 0x16u);
  }
  [(CRLDragAndDropController *)self cleanupEndOfDragOperation];
}

- (BOOL)performIndirectDragOperationWithDragInfo:(id)a3 onInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t dragState = self->_dragState;
  if (dragState == 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0538);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2868();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0558);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:onInfo:]");
    unsigned __int8 v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:462 isFatal:0 description:"Called performIndirectDragOperationWithDragInfo when we were already in a drag!"];
  }
  else if (!dragState)
  {
    self->_unint64_t dragState = 1;
    id v9 = [(CRLDragAndDropController *)self interactiveCanvasController];
    uint64_t v10 = [v9 editingCoordinator];
    [v10 suspendCollaborationWithReason:@"CRLCanvasDragAndDrop"];
  }
  objc_storeStrong((id *)&self->_infoToTargetForIndirectDropOperation, a4);
  self->_isIndirectDropOperation = 1;
  id v14 = [(CRLDragAndDropController *)self delegate];
  unsigned __int8 v15 = [v14 canInsertBoardItemsFromDragOperationForDragInfo:v6];

  if ((v15 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0578);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A27E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0598);
    }
    double v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:onInfo:]");
    double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:468 isFatal:0 description:"Indirect drops should never reject the resulting insert"];
  }
  uint64_t v19 = [(CRLDragAndDropController *)self interactiveCanvasController];
  [v19 visibleUnscaledRect];
  v24.f64[0] = sub_100065738(v20, v21, v22, v23);
  float64x2_t v36 = v24;
  double v26 = v25;

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 fullTransformInRoot];
      __asm { FMOV            V3.2D, #0.5 }
      float64x2_t v36 = vaddq_f64((float64x2_t)0, vmlaq_f64(vmulq_f64((float64x2_t)0, _Q3), _Q3, (float64x2_t)0));
      double v26 = v36.f64[1];
    }
    v32 = [(CRLDragAndDropController *)self interactiveCanvasController];
    uint64_t v33 = [v32 repForInfo:v7];
  }
  else
  {
    uint64_t v33 = 0;
  }
  BOOL v34 = -[CRLDragAndDropController p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:](self, "p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:", v6, v33, v36.f64[0], v26, *(_OWORD *)&v36);

  return v34;
}

- (BOOL)performIndirectDragOperationWithDragInfo:(id)a3 inContainer:(id)a4 targetZOrder:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t dragState = self->_dragState;
  if (dragState == 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F05B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2978();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F05D8);
    }
    unsigned __int8 v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:inContainer:targetZOrder:]");
    unsigned __int8 v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:493 isFatal:0 description:"Called performIndirectDragOperationWithDragInfo when we were already in a drag!"];
  }
  else if (!dragState)
  {
    self->_unint64_t dragState = 1;
    uint64_t v11 = [(CRLDragAndDropController *)self interactiveCanvasController];
    uint64_t v12 = [v11 editingCoordinator];
    [v12 suspendCollaborationWithReason:@"CRLCanvasDragAndDrop"];
  }
  double v16 = [(CRLDragAndDropController *)self delegate];
  unsigned __int8 v17 = [v16 canInsertBoardItemsFromDragOperationForDragInfo:v8];

  if ((v17 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F05F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A28F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0618);
    }
    double v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    uint64_t v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:inContainer:targetZOrder:]");
    CGFloat v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:497 isFatal:0 description:"Indirect drops should never reject the resulting insert"];
  }
  self->_isIndirectDropOperation = 1;
  self->_targetZOrderForDropOperation = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [WeakRetained visibleUnscaledRect];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = [WeakRetained selectionModelTranslator];
      uint64_t v31 = [v30 selectionPathForNothingSelectedInsideGroup:v9];
      v32 = [WeakRetained editorController];
      [v32 setSelectionPath:v31];

      [WeakRetained layoutIfNeeded];
    }
  }
  BOOL v33 = [(CRLDragAndDropController *)self p_performDragOperationWithDragInfo:v8 onDragDestination:0 atUnscaledPoint:sub_100065738(v23, v25, v27, v29)];

  return v33;
}

- (BOOL)p_shouldInsertDraggedBoardItems:(id)a3
{
  id v4 = a3;
  v5 = [(CRLDragAndDropController *)self delegate];
  unsigned __int8 v6 = [v5 canInsertBoardItemsFromDragOperationForDragInfo:v4];

  id v7 = [(CRLDragAndDropController *)self delegate];

  if (!v7) {
    return self->_isIndirectDropOperation;
  }
  return v6;
}

- (BOOL)p_performDragOperationWithDragInfo:(id)a3 onDragDestination:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v9 = a3;
  id v10 = a4;
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v11 = [(CRLDragAndDropController *)self interactiveCanvasController];
  uint64_t v12 = [v11 editingCoordinator];
  unsigned __int8 v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  uint64_t v19 = sub_100350964;
  CGFloat v20 = &unk_1014F06C0;
  id v13 = v10;
  id v21 = v13;
  id v14 = v9;
  CGFloat v25 = x;
  CGFloat v26 = y;
  id v22 = v14;
  CGFloat v23 = self;
  double v24 = &v27;
  [v12 canPerformUserActionUsingBlock:&v17];

  if (!*((unsigned char *)v28 + 24)
    || [(CRLDragAndDropController *)self shouldCleanupAfterSuccessfulDragOperation])
  {
    [(CRLDragAndDropController *)self cleanupEndOfDragOperation];
  }
  char v15 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v15;
}

- (void)cleanupEndOfDragOperation
{
  unint64_t dragState = self->_dragState;
  if (dragState == 1)
  {
    id v7 = [(CRLDragAndDropController *)self interactiveCanvasController];
    id v8 = [v7 canvas];
    [v8 i_unregisterCanvasLayoutObserver:self];

    id v9 = [(CRLDragAndDropController *)self interactiveCanvasController];
    id v10 = [v9 editingCoordinator];
    [v10 resumeCollaborationWithReason:@"CRLCanvasDragAndDrop"];
  }
  else if (!dragState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F06E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2A9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0700);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController cleanupEndOfDragOperation]");
    unsigned __int8 v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:672 isFatal:0 description:"Unexpectedly being asked to cleanup DnD when in state Idle"];
  }
  self->_unint64_t dragState = 0;
  [(CRLDragToInsertController *)self->_dragToInsertController cancelDragToInsert];
  dragToInsertController = self->_dragToInsertController;
  self->_dragToInsertController = 0;

  infoToTargetForIndirectDropOperation = self->_infoToTargetForIndirectDropOperation;
  self->_infoToTargetForIndirectDropOperation = 0;

  self->_targetZOrderForDropOperation = 0x7FFFFFFFFFFFFFFFLL;
  infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003512E8;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(infosToBeInsertedAccessQueue, block);
  [(CRLDragAndDropController *)self p_hideDragAndDropHighlightOnRep];
  [(CRLDragAndDropController *)self p_hideDragAndDropHighlightOnCanvasEditor];
}

+ (unint64_t)p_dragOperationForSupportedDragOperations:(unint64_t)a3
{
  if (a3) {
    return 1;
  }
  else {
    return a3 & 2;
  }
}

- (id)p_dragDestinationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CRLDragAndDropController *)self interactiveCanvasController];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100351534;
  v21[3] = &unk_1014D0498;
  v21[4] = self;
  id v9 = [v8 hitRep:v21 passingTest:x, y];
  if (v9)
  {
    id v10 = [(CRLDragAndDropController *)self delegate];
    unsigned int v11 = [v10 canEditRepWithDragOperation:v9];

    if (v11 && objc_msgSend(v9, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y))
    {
      id v12 = v9;
    }
    else
    {
      uint64_t v13 = [v9 repForSelecting];
      id v14 = (void *)v13;
      id v12 = 0;
      if ((void *)v13 != v9 && v13)
      {
        char v15 = [(CRLDragAndDropController *)self delegate];
        unsigned int v16 = [v15 canEditRepWithDragOperation:v14];

        if (v16 && objc_msgSend(v14, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y)) {
          id v12 = v14;
        }
        else {
          id v12 = 0;
        }
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  unsigned __int8 v17 = [v8 canvasEditor];
  uint64_t v18 = v17;
  if (!v12)
  {
    if (objc_msgSend(v17, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y)) {
      id v12 = v18;
    }
    else {
      id v12 = 0;
    }
  }
  id v19 = v12;

  return v19;
}

- (unint64_t)p_dragOperationForDragInsideWithDraggingInfo:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  unint64_t v8 = (unint64_t)[v7 dragOperationMask];
  id v9 = [(CRLDragAndDropController *)self interactiveCanvasController];
  [v9 convertBoundsToUnscaledPoint:x, y];
  double v11 = v10;
  double v13 = v12;
  id v14 = [v9 canvasView];
  char v15 = [v14 enclosingScrollView];
  unsigned int v16 = [v15 superview];
  [v9 unobscuredScrollViewFrame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  CGFloat v25 = [v9 canvasView];
  [v16 convertRect:v25 toView:v18];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v93.origin.double x = v27;
  v93.origin.double y = v29;
  v93.size.width = v31;
  v93.size.height = v33;
  v92.double x = x;
  v92.double y = y;
  BOOL v34 = CGRectContainsPoint(v93, v92);
  if (!v7)
  {
    int v35 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0748);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2DD4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0768);
    }
    float64x2_t v36 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2D1C(v36, v35);
    }
    uint64_t v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]");
    uint64_t v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 779, 0, "invalid nil value for '%{public}s'", "dragInfo");
  }
  if (!v34)
  {
    uint64_t v40 = 0;
LABEL_20:
    -[CRLDragAndDropController p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:](self, "p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:", v7, 64, v40, v11, v13);
LABEL_21:
    unint64_t v42 = 0;
    goto LABEL_22;
  }
  id v39 = -[CRLDragAndDropController p_dragDestinationForDragInfo:atUnscaledPoint:](self, "p_dragDestinationForDragInfo:atUnscaledPoint:", v7, v11, v13);
  uint64_t v40 = v39;
  if (!v39) {
    goto LABEL_32;
  }
  id v41 = [v39 dragOperationForDragInfo:v7 atUnscaledPoint:v11 v13];
  unint64_t v42 = (unint64_t)v41;
  if (!v41)
  {
    int v45 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F07A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2C94();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F07C8);
    }
    id v46 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2BDC(v46, v45);
    }
    v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]");
    long long v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 802, 0, "If we have a drag destination, our drag operation should not be None");

LABEL_32:
    long long v49 = [(CRLDragAndDropController *)self delegate];
    unsigned __int8 v50 = [v49 canInsertBoardItemsFromDragOperationForDragInfo:v7];

    if ((v50 & 1) == 0)
    {
      -[CRLDragAndDropController p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:](self, "p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:", v7, 0, v40, v11, v13);
      goto LABEL_21;
    }
    uint64_t v86 = 0;
    v87 = &v86;
    uint64_t v88 = 0x2020000000;
    char v89 = 0;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&unsigned char buf[24] = sub_10034E144;
    *(void *)&buf[32] = sub_10034E154;
    *(void *)&buf[40] = 0;
    infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100352210;
    block[3] = &unk_1014E5D18;
    block[4] = self;
    void block[5] = &v86;
    void block[6] = buf;
    dispatch_sync(infosToBeInsertedAccessQueue, block);
    if (*((unsigned char *)v87 + 24) && [*(id *)(*(void *)&buf[8] + 40) count])
    {
      unint64_t v42 = [objc_opt_class() p_dragOperationForSupportedDragOperations:v8];
      if (v42)
      {
        dragToInsertController = self->_dragToInsertController;
        if (!dragToInsertController)
        {
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v53 = [v7 inProcessDraggingSources];
          char v60 = (Block_layout *)[v53 countByEnumeratingWithState:&v81 objects:v91 count:16];
          unint64_t v80 = v8;
          if (v60)
          {
            uint64_t v61 = *(void *)v82;
            while (2)
            {
              for (i = 0; i != v60; i = (Block_layout *)((char *)i + 1))
              {
                if (*(void *)v82 != v61) {
                  objc_enumerationMutation(v53);
                }
                unint64_t v63 = sub_100246AC8(*(void **)(*((void *)&v81 + 1) + 8 * i), 1, v54, v55, v56, v57, v58, v59, (uint64_t)&OBJC_PROTOCOL___CRLDynamicDragInsertDragOperationCallback);
                __int16 v64 = v63;
                if (v63)
                {
                  char v60 = [v63 postInsertBlockForDragAndDropWithBoardItemsToInsert:*(void *)(*(void *)&buf[8] + 40) targetInteractiveCanvasController:v9];

                  goto LABEL_59;
                }
              }
              char v60 = (Block_layout *)[v53 countByEnumeratingWithState:&v81 objects:v91 count:16];
              if (v60) {
                continue;
              }
              break;
            }
          }
LABEL_59:

          v69 = [CRLDragToInsertController alloc];
          uint64_t v70 = *(void *)(*(void *)&buf[8] + 40);
          v71 = [v9 canvasEditor];
          if (v60) {
            v72 = v60;
          }
          else {
            v72 = &stru_1014F07E8;
          }
          v73 = -[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:](v69, "initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:", v70, v71, v72, v11, v13);
          v74 = self->_dragToInsertController;
          self->_dragToInsertController = v73;

          unint64_t v8 = v80;
          dragToInsertController = self->_dragToInsertController;
        }
        -[CRLDragToInsertController dragToPoint:](dragToInsertController, "dragToPoint:", v11, v13);
      }
    }
    else if ([(CRLDragAndDropController *)self canCreateBoardItemsFromDragInfo:v7])
    {
      unint64_t v42 = [objc_opt_class() p_dragOperationForSupportedDragOperations:v8];
      unint64_t v65 = [(CRLDragAndDropController *)self delegate];
      unsigned int v66 = [v65 shouldAllowDynamicInsertForDragInfo:v7];
      if (v42 == 1) {
        unsigned int v67 = v66;
      }
      else {
        unsigned int v67 = 0;
      }
      if (v67 == 1)
      {

        if ((v8 & 2) != 0) {
          unint64_t v42 = 2;
        }
        else {
          unint64_t v42 = 1;
        }
      }
      else
      {
      }
      uint64_t v68 = [v9 canvasEditor];

      uint64_t v40 = (void *)v68;
    }
    else
    {
      unint64_t v42 = 0;
    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v86, 8);
    goto LABEL_65;
  }
  if (v41 == (id)64)
  {
    if (qword_101719CF0 != -1) {
      dispatch_once(&qword_101719CF0, &stru_1014F0788);
    }
    unint64_t v43 = off_10166DB68;
    if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "drag destination is disallowing drag: %@", buf, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_65:
  -[CRLDragAndDropController p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:](self, "p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:", v7, v42, v40, v11, v13);
  if (v42 == 64) {
    goto LABEL_21;
  }
  if (v42 && (v42 & v8) == 0)
  {
    int v75 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0808);
    }
    v76 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&uint8_t buf[4] = v75;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 871;
      *(_WORD *)&buf[34] = 2048;
      *(void *)&buf[36] = v42;
      *(_WORD *)&buf[44] = 2048;
      *(void *)&buf[46] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Drag operation %zi not supported by the sender with mask %zi.", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0828);
    }
    v77 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2B24(v77, v75);
    }
    v78 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]");
    v79 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 871, 0, "Drag operation %zi not supported by the sender with mask %zi.", v42, v8);
  }
LABEL_22:

  return v42;
}

- (void)targetScrollViewDidScroll
{
  if (self->_highlightState == 2)
  {
    id v4 = [(CRLDragAndDropController *)self interactiveCanvasController];
    unsigned int v2 = [v4 canvasEditor];
    v3 = [v2 canvasEditorHelper];
    [v3 updateDragAndDropUIForPoint:CGPointZero.x, CGPointZero.y];
  }
}

- (void)p_updateHighlightStateForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4 dragOperation:(unint64_t)a5 dragDestination:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v23 = a3;
  id v11 = a6;
  double v12 = v11;
  if ((a5 & 0xFFFFFFFFFFFFFFBFLL) == 0)
  {
    BOOL v17 = 0;
    BOOL v16 = 0;
    unint64_t v18 = 0;
    double v13 = 0;
    goto LABEL_11;
  }
  if (v11)
  {
    double v13 = [v11 repToHighlightForDragInfo:v23 atUnscaledPoint:x, y];
    if (!v13) {
      goto LABEL_7;
    }
    id v14 = [(CRLDragAndDropController *)self delegate];
    unsigned __int8 v15 = [v14 canEditRepWithDragOperation:v13];

    if (v15) {
      goto LABEL_7;
    }
  }
  double v13 = 0;
LABEL_7:
  BOOL v16 = v13 == 0;
  BOOL v17 = v13 != 0;
  if (v13) {
    unint64_t v18 = 1;
  }
  else {
    unint64_t v18 = 2;
  }
LABEL_11:
  unint64_t highlightState = self->_highlightState;
  if (highlightState == 2)
  {
    id v20 = v23;
    if (!v16)
    {
      [(CRLDragAndDropController *)self p_hideDragAndDropHighlightOnCanvasEditor];
      id v20 = v23;
      if (v13)
      {
        double v21 = [(CRLDragAndDropController *)self p_accessibilityDescriptionForDropTarget:v13];
        [(CRLDragAndDropController *)self p_announceAccessibilityDropTarget:v21];
        goto LABEL_18;
      }
    }
  }
  else
  {
    id v20 = v23;
    if (highlightState == 1 && !v17)
    {
      [(CRLDragAndDropController *)self p_hideDragAndDropHighlightOnRep];
      double v21 = +[NSBundle mainBundle];
      double v22 = [v21 localizedStringForKey:@"Canvas" value:0 table:0];
      [(CRLDragAndDropController *)self p_announceAccessibilityDropTarget:v22];

LABEL_18:
      id v20 = v23;
    }
  }
  self->_unint64_t highlightState = v18;
  if (v18 == 2)
  {
    -[CRLDragAndDropController p_showDragAndDropHighlightForCanvasEditorWithDragInfo:atUnscaledPoint:](self, "p_showDragAndDropHighlightForCanvasEditorWithDragInfo:atUnscaledPoint:", v20, x, y);
  }
  else if (v18 == 1)
  {
    -[CRLDragAndDropController p_showDragAndDropHighlightForRep:atUnscaledPoint:draggingInfo:](self, "p_showDragAndDropHighlightForRep:atUnscaledPoint:draggingInfo:", v13, v23, x, y);
  }
}

- (void)p_showDragAndDropHighlightForRep:(id)a3 atUnscaledPoint:(CGPoint)a4 draggingInfo:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = (CRLCanvasRep *)a3;
  id v13 = a5;
  repShowingDragAndDropHighlight = self->_repShowingDragAndDropHighlight;
  if (repShowingDragAndDropHighlight) {
    BOOL v11 = repShowingDragAndDropHighlight == v9;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    [(CRLCanvasRep *)repShowingDragAndDropHighlight hideDragAndDropUI];
  }
  -[CRLCanvasRep updateDragAndDropUIForPoint:dragInfo:](v9, "updateDragAndDropUIForPoint:dragInfo:", v13, x, y);
  double v12 = self->_repShowingDragAndDropHighlight;
  self->_repShowingDragAndDropHighlight = v9;
}

- (void)p_hideDragAndDropHighlightOnRep
{
  repShowingDragAndDropHighlight = self->_repShowingDragAndDropHighlight;
  if (repShowingDragAndDropHighlight)
  {
    [(CRLCanvasRep *)repShowingDragAndDropHighlight hideDragAndDropUI];
    repShowingDragAndDropHighlight = self->_repShowingDragAndDropHighlight;
  }
  self->_repShowingDragAndDropHighlight = 0;
}

- (void)p_showDragAndDropHighlightForCanvasEditorWithDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (self->_repShowingDragAndDropHighlight)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0848);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2E70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0868);
    }
    unint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_showDragAndDropHighlightForCanvasEditorWithDragInfo:atUnscaledPoint:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:968 isFatal:0 description:"Showing canvas highlight when a rep is highlighted"];
  }
  BOOL v11 = [(CRLDragAndDropController *)self interactiveCanvasController];
  double v12 = [v11 canvasEditor];

  [v12 updateDragAndDropUIForPoint:v7 dragInfo:x, y];
}

- (void)p_hideDragAndDropHighlightOnCanvasEditor
{
  id v4 = [(CRLDragAndDropController *)self interactiveCanvasController];
  unsigned int v2 = [v4 canvasEditor];
  v3 = [v2 canvasEditorHelper];
  [v3 hideDragAndDropUI];
}

- (void)p_announceAccessibilityDropTarget:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    id v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"Drop on %@" value:0 table:0];

    unsigned __int8 v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7);
    CRLAccessibilityPostAnnouncementNotification(self, v6);
  }
}

- (id)p_accessibilityDescriptionForDropTarget:(id)a3
{
  id v3 = a3;
  id v4 = +[CRLAccessibility sharedInstance];
  unsigned int v5 = [v4 needsAccessibilityElements];

  if (v5)
  {
    unsigned __int8 v6 = [v3 accessibilityLabel];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)insertDroppedNativeBoardItemsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5 isCrossAppSource:(BOOL)a6 isCrossDocument:(BOOL)a7
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  double v32 = self;
  id v33 = a5;
  double v12 = [(CRLDragAndDropController *)self interactiveCanvasController];
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      unint64_t v18 = 0;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v18);
        id v20 = [v12 editingCoordinator];
        double v21 = [v20 boardItemFactory];
        id v22 = [v19 newBoardItemWithFactory:v21 bakedSize:0];

        if (v22)
        {
          [v13 addObject:v22];
        }
        else
        {
          unsigned int v23 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F0888);
          }
          double v24 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v39 = v23;
            __int16 v40 = 2082;
            id v41 = "-[CRLDragAndDropController insertDroppedNativeBoardItemsFromProviders:atUnscaledPoint:onRep:isCrossApp"
                  "Source:isCrossDocument:]";
            __int16 v42 = 2082;
            unint64_t v43 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m";
            __int16 v44 = 1024;
            int v45 = 1012;
            __int16 v46 = 2082;
            v47 = "boardItem";
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F08A8);
          }
          CGFloat v25 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            double v28 = v25;
            CGFloat v29 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v39 = v23;
            __int16 v40 = 2114;
            id v41 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController insertDroppedNativeBoardItemsFromProviders:atUnscaledPoint:onRep:isCrossAppSource:isCrossDocument:]");
          CGFloat v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1012, 0, "invalid nil value for '%{public}s'", "boardItem");
        }
        unint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v16);
  }

  unsigned __int8 v30 = -[CRLDragAndDropController insertNativePasteboardBoardItems:atUnscaledPoint:onRep:](v32, "insertNativePasteboardBoardItems:atUnscaledPoint:onRep:", v13, v33, x, y);
  return v30;
}

- (BOOL)insertNativePasteboardBoardItems:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  if ([v9 count])
  {
    id v30 = [v9 count];
    if ((unint64_t)v30 >= 2)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v41 = 0x4010000000;
      __int16 v42 = "";
      CGSize size = CGRectNull.size;
      CGPoint origin = CGRectNull.origin;
      CGSize v44 = size;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100353220;
      v36[3] = &unk_1014D0F70;
      id v12 = v9;
      id v37 = v12;
      p_long long buf = &buf;
      +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:v12 useInBlock:v36];
      double v13 = sub_100065738(*(CGFloat *)(*((void *)&buf + 1) + 32), *(CGFloat *)(*((void *)&buf + 1) + 40), *(CGFloat *)(*((void *)&buf + 1) + 48), *(CGFloat *)(*((void *)&buf + 1) + 56));
      double v14 = sub_100064680(x, y, v13);
      CGFloat v16 = v15;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v17 = v12;
      id v18 = [v17 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v33;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v17);
            }
            double v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            id v22 = [v21 geometry];
            CGAffineTransformMakeTranslation(&v31, v14, v16);
            unsigned int v23 = [v22 geometryByAppendingTransform:&v31];
            [v21 setGeometry:v23];
          }
          id v18 = [v17 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v18);
      }

      _Block_object_dispose(&buf, 8);
    }
    double v24 = [(CRLDragAndDropController *)self interactiveCanvasController];
    CGFloat v25 = [v24 canvasEditor];

    if (qword_101719CF0 != -1) {
      dispatch_once(&qword_101719CF0, &stru_1014F08C8);
    }
    double v26 = off_10166DB68;
    if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Inserting native infos %@", (uint8_t *)&buf, 0xCu);
    }
    CGFloat v27 = +[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 0, 1, self->_targetZOrderForDropOperation, x, y);
    unsigned __int8 v28 = [v25 insertBoardItemsFromDragAndDrop:v9 atPoint:v10 onRep:v27 insertionContext:((unint64_t)v30 > 1) x:x y:y];
  }
  else
  {
    unsigned __int8 v28 = 0;
  }

  return v28;
}

- (void)insertDroppedImportableBoardItemsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5 completionHandler:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  double v14 = [[CRLPasteboardMultipleImportableBoardItemProvider alloc] initWithImportableBoardItemProviders:v13];

  double v15 = [(CRLDragAndDropController *)self p_alertPresenter];
  [(CRLPasteboardMultipleImportableBoardItemProvider *)v14 setAlertPresenter:v15];

  CGFloat v16 = +[NSBundle mainBundle];
  id v17 = [v16 localizedStringForKey:@"Inserting…" value:0 table:0];

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10035377C;
  v42[3] = &unk_1014CBBB0;
  id v18 = v14;
  unint64_t v43 = v18;
  uint64_t v19 = objc_retainBlock(v42);
  id v20 = [(CRLDragAndDropController *)self p_modalOperationPresenter];
  double v21 = [(CRLPasteboardMultipleImportableBoardItemProvider *)v18 progress];
  id v22 = [v20 beginModalOperationWithPresentedLocalizedMessage:v17 progress:v21 cancelHandler:v19];

  if (!v22)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F08E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A2EF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0908);
    }
    unsigned int v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v23);
    }
    double v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController insertDroppedImportableBoardItemsFromProviders:atUnscaledPoint:onRep:completionHandler:]");
    CGFloat v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 1088, 0, "invalid nil value for '%{public}s'", "modalOperationToken");
  }
  double v26 = [(CRLDragAndDropController *)self interactiveCanvasController];
  CGFloat v27 = [v26 editingCoordinator];
  unsigned __int8 v28 = [v27 boardItemFactory];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10035380C;
  v34[3] = &unk_1014F0950;
  v34[4] = self;
  id v35 = v22;
  long long v36 = v18;
  id v37 = v26;
  CGFloat v40 = x;
  CGFloat v41 = y;
  id v38 = v11;
  id v39 = v12;
  id v29 = v12;
  id v30 = v11;
  id v31 = v26;
  long long v32 = v18;
  id v33 = v22;
  [(CRLPasteboardMultipleImportableBoardItemProvider *)v32 provideBoardItemsWithFactory:v28 completionHandler:v34];
}

- (void)canvasDidUpdateReps:(id)a3
{
  self->_int canvasDidLayoutSinceLastUpdate = 1;
}

- (CRLDragAndDropControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLDragAndDropControllerDelegate *)WeakRetained;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_infosToBeInsertedAccessQueue, 0);
  objc_storeStrong((id *)&self->_dragToInsertController, 0);
  objc_storeStrong((id *)&self->_importableInfosToBeInsertedProvider, 0);
  objc_storeStrong((id *)&self->_infosToBeInserted, 0);
  objc_storeStrong((id *)&self->_infoToTargetForIndirectDropOperation, 0);
  objc_storeStrong((id *)&self->_repShowingDragAndDropHighlight, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end