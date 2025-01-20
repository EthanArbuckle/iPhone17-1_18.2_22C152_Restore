@interface CRLImageMaskResizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)readyToEndOperation;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLImageMaskResizer)initWithInteractiveCanvasController:(id)a3;
- (void)beginResizingRep:(id)a3;
- (void)endResizingRepAtScale:(double)a3;
- (void)operationDidEnd;
- (void)updateResizeToScale:(double)a3;
@end

@implementation CRLImageMaskResizer

- (CRLImageMaskResizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2460);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5D9C(v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2480);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v7, v5);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageMaskResizer initWithInteractiveCanvasController:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageMaskResizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 28, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");
  }
  v13.receiver = self;
  v13.super_class = (Class)CRLImageMaskResizer;
  v10 = [(CRLImageMaskResizer *)&v13 init];
  v11 = v10;
  if (v10) {
    objc_storeWeak((id *)&v10->_interactiveCanvasController, v4);
  }

  return v11;
}

- (void)beginResizingRep:(id)a3
{
  id v20 = a3;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = sub_10024715C(v4, v20);
  v6 = (void *)v5;
  if (self->_maskResizeTracker) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7)
  {
    self->_readyToEnd = 0;
    v8 = [[CRLMaskResizeTracker alloc] initWithImageRep:v5];
    maskResizeTracker = self->_maskResizeTracker;
    self->_maskResizeTracker = v8;

    p_interactiveCanvasController = &self->_interactiveCanvasController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v12 = [WeakRetained tmCoordinator];
    [v12 registerTrackerManipulator:self];

    id v13 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v14 = [v13 tmCoordinator];
    [v14 takeControlWithTrackerManipulator:self];

    id v15 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v16 = [v15 dynamicOperationController];
    [v16 beginOperation];

    id v17 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v18 = [v17 dynamicOperationController];
    v19 = +[NSSet setWithObject:v20];
    [v18 startTransformingReps:v19];
  }
}

- (void)updateResizeToScale:(double)a3
{
  maskResizeTracker = self->_maskResizeTracker;
  if (maskResizeTracker)
  {
    [(CRLMaskResizeTracker *)maskResizeTracker setSliderValue:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    uint64_t v5 = [WeakRetained dynamicOperationController];
    [v5 handleTrackerManipulator:self];
  }
}

- (void)endResizingRepAtScale:(double)a3
{
  maskResizeTracker = self->_maskResizeTracker;
  if (maskResizeTracker)
  {
    self->_readyToEnd = 1;
    [(CRLMaskResizeTracker *)maskResizeTracker setSliderValue:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    uint64_t v5 = [WeakRetained dynamicOperationController];
    [v5 handleTrackerManipulator:self];
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_maskResizeTracker;
}

- (BOOL)readyToEndOperation
{
  return self->_readyToEnd;
}

- (void)operationDidEnd
{
  maskResizeTracker = self->_maskResizeTracker;
  self->_maskResizeTracker = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskResizeTracker, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end