@interface CRLiOSCanvasDropInteractionDelegate
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (CRLiOSCanvasDropInteractionDelegate)init;
- (CRLiOSCanvasDropInteractionDelegate)initWithICC:(id)a3;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)p_dragInfoForSession:(id)a3;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)p_canvasDidScroll:(id)a3;
@end

@implementation CRLiOSCanvasDropInteractionDelegate

- (CRLiOSCanvasDropInteractionDelegate)initWithICC:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasDropInteractionDelegate;
  v5 = [(CRLiOSCanvasDropInteractionDelegate *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v7 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_icc);
    [v7 addObserver:v6 selector:"p_canvasDidScroll:" name:@"CRLCanvasUpdateScrollNotification" object:WeakRetained];
  }
  return v6;
}

- (CRLiOSCanvasDropInteractionDelegate)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE1A8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLiOSCanvasDropInteractionDelegate init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m";
    __int16 v17 = 1024;
    int v18 = 40;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE1C8);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:40 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLiOSCanvasDropInteractionDelegate init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)p_canvasDidScroll:(id)a3
{
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  if (self->_dndController
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_icc),
        unsigned __int8 v7 = [WeakRetained editingDisabled],
        WeakRetained,
        (v7 & 1) != 0))
  {
    unsigned __int8 v8 = 0;
  }
  else if ([v5 canLoadObjectsOfClass:objc_opt_class()])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    id v10 = [(CRLiOSCanvasDropInteractionDelegate *)self p_dragInfoForSession:v5];
    v11 = [v10 itemSource];
    if (([v11 hasImportableText] & 1) != 0
      || ([v11 hasImportableRichText] & 1) != 0)
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      unsigned __int8 v8 = 1;
      if (([v11 hasImportableBoardItemsDetectingImportableURLsInText:1] & 1) == 0) {
        unsigned __int8 v8 = [v11 hasNativeTypes];
      }
    }
  }
  return v8;
}

- (id)p_dragInfoForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLDragAndDropInfo *)self->_cachedDragInfo platformDraggingInfo];

  if (v5 != v4)
  {
    v6 = [[CRLDragAndDropInfo alloc] initWithPlatformDraggingInfo:v4];
    cachedDragInfo = self->_cachedDragInfo;
    self->_cachedDragInfo = v6;
  }
  unsigned __int8 v8 = self->_cachedDragInfo;

  return v8;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_dndController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE1E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010849E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE208);
    }
    unsigned __int8 v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate dropInteraction:sessionDidEnter:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 81, 0, "expected nil value for '%{public}s'", "_dndController");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  unsigned int v12 = [WeakRetained layerHost];
  __int16 v13 = [v12 asiOSCVC];
  v14 = [v13 delegate];

  if (objc_opt_respondsToSelector()) {
    [v14 dragDidEnter];
  }
  __int16 v15 = [(CRLiOSCanvasDropInteractionDelegate *)self p_dragInfoForSession:v7];
  if (!self->_dndController)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_icc);
    __int16 v17 = [v16 layerHost];
    int v18 = [v17 asiOSCVC];
    v19 = (CRLDragAndDropController *)[v18 newDragAndDropController];
    dndController = self->_dndController;
    self->_dndController = v19;
  }
  id v21 = objc_loadWeakRetained((id *)&self->_icc);
  v22 = [v21 canvasView];
  [v7 locationInView:v22];
  double v24 = v23;
  double v26 = v25;

  -[CRLDragAndDropController draggingEntered:atScaledPoint:](self->_dndController, "draggingEntered:atScaledPoint:", v15, v24, v26);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  if (!self->_dndController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE228);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084A7C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE248);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate dropInteraction:sessionDidUpdate:]");
    unsigned __int8 v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 97, 0, "invalid nil value for '%{public}s'", "_dndController");
  }
  v9 = [(CRLiOSCanvasDropInteractionDelegate *)self p_dragInfoForSession:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v11 = [WeakRetained canvasView];
  [v5 locationInView:v11];
  double v13 = v12;
  double v15 = v14;

  id v16 = [objc_alloc((Class)UIDropProposal) initWithDropOperation:sub_100030420([self->_dndController draggingUpdated:atScaledPoint:](v9, v13, v15))];

  return v16;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5 = a4;
  if (!self->_dndController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE268);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084B18();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE288);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate dropInteraction:sessionDidExit:]");
    unsigned __int8 v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 105, 0, "invalid nil value for '%{public}s'", "_dndController");
  }
  v9 = [(CRLiOSCanvasDropInteractionDelegate *)self p_dragInfoForSession:v5];
  [(CRLDragAndDropController *)self->_dndController draggingExited:v9];
  dndController = self->_dndController;
  self->_dndController = 0;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  cachedDragInfo = self->_cachedDragInfo;
  self->_cachedDragInfo = 0;
  id v6 = a4;

  id v14 = [(CRLiOSCanvasDropInteractionDelegate *)self p_dragInfoForSession:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  unsigned __int8 v8 = [WeakRetained canvasView];
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  self->_lastScaledPoint.x = v10;
  self->_lastScaledPoint.y = v12;
  if (!-[CRLDragAndDropController performDragOperation:atScaledPoint:](self->_dndController, "performDragOperation:atScaledPoint:", v14, v10, v12))
  {
    dndController = self->_dndController;
    self->_dndController = 0;
  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  if (self->_dndController)
  {
    id v6 = [(CRLiOSCanvasDropInteractionDelegate *)self p_dragInfoForSession:a4];
    [(CRLDragAndDropController *)self->_dndController concludeDragOperation:v6];
    dndController = self->_dndController;
    self->_dndController = 0;
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  if (self->_dndController)
  {
    id v6 = [(CRLiOSCanvasDropInteractionDelegate *)self p_dragInfoForSession:a4];
    [(CRLDragAndDropController *)self->_dndController draggingExited:v6];
    dndController = self->_dndController;
    self->_dndController = 0;
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = self->_cachedDragInfo;
  if ((id)[(CRLDragAndDropInfo *)v9 numberOfDraggingItems] == (id)1)
  {
    double v10 = [(CRLDragAndDropInfo *)v9 platformDraggingInfo];
    double v11 = [v10 items];
    id v12 = [v11 firstObject];

    if (v12 == v7)
    {
      double v13 = [v8 target];
      id v14 = [v13 container];
      double v15 = [v8 target];
      [v15 center];
      double v17 = v16;
      double v19 = v18;
      p_icc = &self->_icc;
      id WeakRetained = objc_loadWeakRetained((id *)p_icc);
      v22 = [WeakRetained canvasView];
      [v14 convertPoint:v22 toView:v17];
      double v24 = v23;
      double v26 = v25;

      id v27 = objc_loadWeakRetained((id *)p_icc);
      [v27 convertBoundsToUnscaledPoint:v24, v26];
      -[CRLDragAndDropInfo setTargetPreviewCenter:](v9, "setTargetPreviewCenter:");
    }
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDragInfo, 0);
  objc_storeStrong((id *)&self->_dndController, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end