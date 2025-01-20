@interface CRLFreehandDrawingSelectionDecorator
- (CRLFreehandDrawingSelectionDecorator)initWithInteractiveCanvasController:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (void)dealloc;
- (void)setDecoratorLayer:(id)a3;
- (void)tearDown;
@end

@implementation CRLFreehandDrawingSelectionDecorator

- (CRLFreehandDrawingSelectionDecorator)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingSelectionDecorator;
  v5 = [(CRLFreehandDrawingSelectionDecorator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_icc, v4);
    [v4 addDecorator:v6];
  }
  return v6;
}

- (void)tearDown
{
  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F73B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AE8BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F73D0);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSelectionDecorator tearDown]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSelectionDecorator.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:32 isFatal:0 description:"Should not call -tearDown twice."];
  }
  self->_isTornDown = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained removeDecorator:self];

  objc_storeWeak((id *)&self->_icc, 0);
}

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F73F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AE950();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7410);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSelectionDecorator dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSelectionDecorator.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:40 isFatal:0 description:"You must call -tearDown before deallocation."];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingSelectionDecorator;
  [(CRLFreehandDrawingSelectionDecorator *)&v6 dealloc];
}

- (void)setDecoratorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained invalidateLayersForDecorator:self];
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->_layer)
  {
    v2 = [[CRLCanvasRenderable alloc] initWithCALayer:self->_layer];
    v5 = v2;
    v3 = +[NSArray arrayWithObjects:&v5 count:1];
  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end