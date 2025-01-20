@interface CRLiOSCanvasDraggingContext
- (BOOL)draggingWantsForcedUpdate;
- (CRLiOSCanvasDraggingContext)init;
- (CRLiOSCanvasDraggingContext)initWithSourceObject:(id)a3;
- (id)modelContainer;
- (id)sourceObject;
- (void)draggingEnteredWithOperation:(unint64_t)a3 targetInteractiveCanvasController:(id)a4;
- (void)draggingExited;
- (void)draggingUpdatedWithOperation:(unint64_t)a3 targetInteractiveCanvasController:(id)a4;
- (void)setModelContainer:(id)a3;
@end

@implementation CRLiOSCanvasDraggingContext

- (CRLiOSCanvasDraggingContext)initWithSourceObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasDraggingContext;
  v5 = [(CRLiOSCanvasDraggingContext *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_sourceObject, v4);
  }

  return v6;
}

- (CRLiOSCanvasDraggingContext)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF508);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLiOSCanvasDraggingContext init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDraggingContext.m";
    __int16 v17 = 1024;
    int v18 = 34;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF528);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDraggingContext init]");
  objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDraggingContext.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:34 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLiOSCanvasDraggingContext init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)draggingEnteredWithOperation:(unint64_t)a3 targetInteractiveCanvasController:(id)a4
{
  p_sourceObject = &self->_sourceObject;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(p_sourceObject);
  __int16 v13 = sub_100246AC8(WeakRetained, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  [v13 draggingEnteredWithOperation:a3 targetInteractiveCanvasController:v6];
}

- (void)draggingUpdatedWithOperation:(unint64_t)a3 targetInteractiveCanvasController:(id)a4
{
  p_sourceObject = &self->_sourceObject;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(p_sourceObject);
  __int16 v13 = sub_100246AC8(WeakRetained, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  [v13 draggingUpdatedWithOperation:a3 targetInteractiveCanvasController:v6];
}

- (void)draggingExited
{
  id WeakRetained = objc_loadWeakRetained(&self->_sourceObject);
  uint64_t v8 = sub_100246AC8(WeakRetained, 1, v2, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  [v8 draggingExited];
}

- (BOOL)draggingWantsForcedUpdate
{
  id WeakRetained = objc_loadWeakRetained(&self->_sourceObject);
  uint64_t v9 = sub_100246AC8(WeakRetained, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  unsigned __int8 v10 = [v9 draggingWantsForcedUpdate];

  return v10;
}

- (id)modelContainer
{
  id WeakRetained = objc_loadWeakRetained(&self->modelContainer);

  return WeakRetained;
}

- (void)setModelContainer:(id)a3
{
}

- (id)sourceObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_sourceObject);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_sourceObject);

  objc_destroyWeak(&self->modelContainer);
}

@end