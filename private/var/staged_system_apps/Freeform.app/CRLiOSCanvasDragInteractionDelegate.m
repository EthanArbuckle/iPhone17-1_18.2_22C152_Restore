@interface CRLiOSCanvasDragInteractionDelegate
- (BOOL)allowRepsToPreventDragOnPhone;
- (BOOL)allowsMoveOperations;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (CRLiOSCanvasDragInteractionDelegate)init;
- (CRLiOSCanvasDragInteractionDelegate)initWithInteractiveCanvasController:(id)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)p_dragItemsAtPoint:(CGPoint)a3;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)setAllowRepsToPreventDragOnPhone:(BOOL)a3;
- (void)setAllowsMoveOperations:(BOOL)a3;
@end

@implementation CRLiOSCanvasDragInteractionDelegate

- (CRLiOSCanvasDragInteractionDelegate)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasDragInteractionDelegate;
  v5 = [(CRLiOSCanvasDragInteractionDelegate *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v7 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
    dragItemsToCanvasDragItems = v6->_dragItemsToCanvasDragItems;
    v6->_dragItemsToCanvasDragItems = v7;

    v6->_allowRepsToPreventDragOnPhone = 1;
  }

  return v6;
}

- (CRLiOSCanvasDragInteractionDelegate)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CE068);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLiOSCanvasDragInteractionDelegate init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m";
    __int16 v17 = 1024;
    int v18 = 39;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CE088);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDragInteractionDelegate init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:39 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLiOSCanvasDragInteractionDelegate init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v10 = [WeakRetained canvasView];
  [v7 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  id v15 = objc_loadWeakRetained((id *)&self->_icc);
  [v15 convertBoundsToUnscaledPoint:v12, v14];
  double v17 = v16;
  double v19 = v18;

  id v20 = objc_loadWeakRetained((id *)&self->_icc);
  v21 = [v20 hitRep:v17, v19];

  [v6 _liftDelay];
  if (v22 == 0.7 || ([v6 _liftDelay], objc_msgSend(v21, "supportsAlternateLiftDelay:")))
  {
    v23 = -[CRLiOSCanvasDragInteractionDelegate p_dragItemsAtPoint:](self, "p_dragItemsAtPoint:", v17, v19);
    dragItemsToCanvasDragItems = self->_dragItemsToCanvasDragItems;
    v25 = [v23 firstObject];
    v26 = [(NSMapTable *)dragItemsToCanvasDragItems objectForKey:v25];

    if ([v23 count])
    {
      v27 = [v26 sourceObject];
      if (v27)
      {
        [v7 setLocalContext:v27];
      }
      else
      {
        v28 = [[CRLiOSCanvasDraggingContext alloc] initWithSourceObject:0];
        id v36 = objc_loadWeakRetained((id *)p_icc);
        v35 = [v36 layerHost];
        v29 = [v35 asiOSCVC];
        v30 = [v29 modelContainerForLocalDragContext];
        [(CRLiOSCanvasDraggingContext *)v28 setModelContainer:v30];

        [v7 setLocalContext:v28];
      }
      id v31 = objc_loadWeakRetained((id *)p_icc);
      v32 = [v31 layerHost];
      v33 = [v32 asiOSCVC];
      [v33 dragSessionWillBegin];
    }
  }
  else
  {
    v23 = &__NSArray0__struct;
  }

  return v23;
}

- (id)p_dragItemsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v8 = [WeakRetained hitRep:x, y];

  v9 = +[NSMutableArray array];
  id v10 = objc_loadWeakRetained((id *)p_icc);
  double v11 = [v10 layerHost];
  double v12 = [v11 asiOSCVC];
  unsigned int v13 = [v12 allowsSystemDragSession];

  if (v13)
  {
    double v14 = [v8 repForDragging];
    [v14 convertNaturalPointFromUnscaledCanvas:x, y];
    v29 = v14;
    if (v14
      && ([v14 shouldOverrideParentForBeginningDragAtPoint:v14] & 1) == 0
      && ([v14 parentRep], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v16 = (void *)v15;
      while (1)
      {
        uint64_t v17 = [v16 dragItemsForBeginningDragOfChildRep:v14];
        if (v17) {
          break;
        }
        uint64_t v18 = [v16 parentRep];

        double v16 = (void *)v18;
        if (!v18) {
          goto LABEL_8;
        }
      }
      double v19 = (void *)v17;
    }
    else
    {
LABEL_8:
      [v8 convertNaturalPointFromUnscaledCanvas:x, y, v29];
      double v19 = [v8 dragItemsForBeginningDragAtPoint:];
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([(CRLiOSCanvasDragInteractionDelegate *)self allowsMoveOperations]) {
            [v25 setAllowsMoveOperation:1];
          }
          v26 = [v25 itemProvider];
          id v27 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v26];
          [v9 addObject:v27];
          [(NSMapTable *)self->_dragItemsToCanvasDragItems setObject:v25 forKey:v27];
        }
        id v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }
  }

  return v9;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  dragItemsToCanvasDragItems = self->_dragItemsToCanvasDragItems;
  id v6 = a4;
  id v7 = [(NSMapTable *)dragItemsToCanvasDragItems objectForKey:v6];
  v8 = [v7 previewGeneratingBlock];
  v9 = ((void (**)(void, id))v8)[2](v8, v6);

  return v9;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  v5 = [a4 items:a3];
  id v6 = [v5 firstObject];

  id v7 = [(NSMapTable *)self->_dragItemsToCanvasDragItems objectForKey:v6];
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE0A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106AE08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE0C8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDragInteractionDelegate dragInteraction:prefersFullSizePreviewsForSession:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 131, 0, "invalid nil value for '%{public}s'", "canvasDragItem");
  }
  unsigned __int8 v11 = [v7 prefersFullSizePreviews];

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  v5 = [a4 items:a3];
  id v6 = [v5 firstObject];

  id v7 = [(NSMapTable *)self->_dragItemsToCanvasDragItems objectForKey:v6];
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE0E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106AEB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE108);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDragInteractionDelegate dragInteraction:sessionAllowsMoveOperation:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 138, 0, "invalid nil value for '%{public}s'", "canvasDragItem");
  }
  unsigned __int8 v11 = [v7 allowsMoveOperation];

  return v11;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [a4 items:a3];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NSMapTable *)self->_dragItemsToCanvasDragItems removeObjectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)allowRepsToPreventDragOnPhone
{
  return self->_allowRepsToPreventDragOnPhone;
}

- (void)setAllowRepsToPreventDragOnPhone:(BOOL)a3
{
  self->_allowRepsToPreventDragOnPhone = a3;
}

- (BOOL)allowsMoveOperations
{
  return self->_allowsMoveOperations;
}

- (void)setAllowsMoveOperations:(BOOL)a3
{
  self->_allowsMoveOperations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemsToCanvasDragItems, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end