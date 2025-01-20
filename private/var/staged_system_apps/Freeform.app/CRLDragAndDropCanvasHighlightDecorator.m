@interface CRLDragAndDropCanvasHighlightDecorator
- (CRLCanvasShapeRenderable)dragAndDropHighlightRenderable;
- (CRLDragAndDropCanvasHighlightDecorator)init;
- (CRLDragAndDropCanvasHighlightDecorator)initWithInteractiveCanvasController:(id)a3;
- (CRLDragAndDropCanvasHighlightDecorator)initWithInteractiveCanvasController:(id)a3 highlightPath:(CGPath *)a4;
- (NSArray)decoratorOverlayRenderables;
- (void)beginHighlightingWithPath:(CGPath *)a3;
- (void)endHighlighting;
- (void)setHighlightPath:(CGPath *)a3;
@end

@implementation CRLDragAndDropCanvasHighlightDecorator

- (CRLDragAndDropCanvasHighlightDecorator)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLDragAndDropCanvasHighlightDecorator;
  v5 = [(CRLDragAndDropCanvasHighlightDecorator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mICC, v4);
  }

  return v6;
}

- (CRLDragAndDropCanvasHighlightDecorator)initWithInteractiveCanvasController:(id)a3 highlightPath:(CGPath *)a4
{
  v5 = [(CRLDragAndDropCanvasHighlightDecorator *)self initWithInteractiveCanvasController:a3];
  v6 = v5;
  if (v5) {
    [(CRLDragAndDropCanvasHighlightDecorator *)v5 setHighlightPath:a4];
  }
  return v6;
}

- (CRLDragAndDropCanvasHighlightDecorator)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CB380);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLDragAndDropCanvasHighlightDecorator init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m";
    __int16 v17 = 1024;
    int v18 = 42;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CB3A0);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropCanvasHighlightDecorator init]");
  objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:42 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLDragAndDropCanvasHighlightDecorator init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLCanvasShapeRenderable)dragAndDropHighlightRenderable
{
  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  if (!mDragAndDropHighlightRenderable)
  {
    id v4 = +[CRLCanvasShapeRenderable renderable];
    [(CRLCanvasShapeRenderable *)v4 setFillColor:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    [(CRLCanvasRenderable *)v4 setDelegate:WeakRetained];

    v6 = +[CRLColor colorWithRed:0.00392156886 green:0.647058845 blue:0.98828125 alpha:1.0];
    -[CRLCanvasShapeRenderable setStrokeColor:](v4, "setStrokeColor:", [v6 CGColor]);

    [(CRLCanvasShapeRenderable *)v4 setLineWidth:2.0];
    v7 = self->mDragAndDropHighlightRenderable;
    self->mDragAndDropHighlightRenderable = v4;

    id v8 = objc_loadWeakRetained((id *)&self->mICC);
    [v8 invalidateLayersForDecorator:self];

    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  }

  return mDragAndDropHighlightRenderable;
}

- (void)beginHighlightingWithPath:(CGPath *)a3
{
  if (self->mDragAndDropHighlightRenderable)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB3C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066984();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB3E0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropCanvasHighlightDecorator beginHighlightingWithPath:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 78, 0, "expected nil value for '%{public}s'", "mDragAndDropHighlightRenderable");
  }
  [(CRLDragAndDropCanvasHighlightDecorator *)self setHighlightPath:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  [WeakRetained addDecorator:self];
}

- (void)setHighlightPath:(CGPath *)a3
{
  id v4 = [(CRLDragAndDropCanvasHighlightDecorator *)self dragAndDropHighlightRenderable];
  [v4 setPath:a3];
}

- (void)endHighlighting
{
  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  if (!mDragAndDropHighlightRenderable)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB400);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066A34();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB420);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropCanvasHighlightDecorator endHighlighting]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 95, 0, "invalid nil value for '%{public}s'", "mDragAndDropHighlightRenderable");

    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  }
  [(CRLCanvasRenderable *)mDragAndDropHighlightRenderable setDelegate:0];
  v7 = self->mDragAndDropHighlightRenderable;
  self->mDragAndDropHighlightRenderable = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  [WeakRetained removeDecorator:self];
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->mDragAndDropHighlightRenderable)
  {
    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
    unsigned int v2 = +[NSArray arrayWithObjects:&mDragAndDropHighlightRenderable count:1];
  }
  else
  {
    unsigned int v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDragAndDropHighlightRenderable, 0);

  objc_destroyWeak((id *)&self->mICC);
}

@end