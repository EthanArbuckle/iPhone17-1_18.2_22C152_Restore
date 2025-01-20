@interface CRLCanvasView
+ (Class)layerClass;
- (BOOL)_accessibilityShouldUpdateQuickSpeakContent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGAffineTransform)additionalTransformIntoCoordinateSpace:(SEL)a3;
- (CRLCanvasLayer)canvasLayer;
- (CRLCanvasLayerHosting)layerHost;
- (CRLInteractiveCanvasController)controller;
- (CRLScrollView)enclosingScrollView;
- (MTLDevice)metalDeviceForScreenWithCanvas;
- (UICoordinateSpace)unscaledCoordinateSpace;
- (UIViewController)rootViewControllerForColorMagnifierHUD;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)find:(id)a3;
- (void)findAndReplace:(id)a3;
- (void)setCanvasSubviews:(id)a3;
- (void)setController:(id)a3;
- (void)setLayerHost:(id)a3;
- (void)teardown;
@end

@implementation CRLCanvasView

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F65D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD0AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F65F8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:43 isFatal:0 description:"teardown not called for CRLCanvasView."];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasView;
  [(CRLCanvasView *)&v6 dealloc];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained i_visibleBoundsRectForHitTestingCanvasView];
  v13.double x = x;
  v13.double y = y;
  BOOL v9 = CGRectContainsPoint(v14, v13);

  if (v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLCanvasView;
    BOOL v10 = -[CRLCanvasView pointInside:withEvent:](&v12, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)setController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6618);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD134();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6638);
    }
    objc_super v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView setController:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:61 isFatal:0 description:"shouldn't try to set canvasView's controller more than once"];
  }
  id v9 = objc_loadWeakRetained((id *)&self->_controller);

  if (!v9)
  {
    objc_storeWeak((id *)&self->_controller, v4);
    BOOL v10 = [(CRLCanvasView *)self canvasLayer];
    [v10 setController:v4];

    v11 = [v4 layerHost];
    [(CRLCanvasView *)self setLayerHost:v11];
  }
}

- (void)teardown
{
  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6658);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD1BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6678);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView teardown]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:72 isFatal:0 description:"attempting to call teardown on an instance of CRLCanvasView that has already been torn down."];
  }
  self->_isTornDown = 1;
  objc_storeWeak((id *)&self->_controller, 0);
  unscaledCoordinateSpace = self->_unscaledCoordinateSpace;
  self->_unscaledCoordinateSpace = 0;

  id v7 = [(CRLCanvasView *)self canvasLayer];
  [v7 teardown];
}

- (CRLCanvasLayer)canvasLayer
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasView *)self layer];
  v5 = sub_1002469D0(v3, v4);

  return (CRLCanvasLayer *)v5;
}

- (CRLScrollView)enclosingScrollView
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasView *)self superview];
  v5 = sub_1002469D0(v3, v4);

  return (CRLScrollView *)v5;
}

- (void)setCanvasSubviews:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSMutableOrderedSet);
  objc_super v6 = [(CRLCanvasView *)self subviews];
  id v7 = [v5 initWithArray:v6];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        CGPoint v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v7 containsObject:v13])
        {
          CGRect v14 = [(CRLCanvasView *)self subviews];
          v15 = [v14 lastObject];

          if (v13 != v15)
          {
            [v13 removeFromSuperview];
            [(CRLCanvasView *)self addSubview:v13];
          }
          [v7 removeObject:v13];
        }
        else
        {
          [(CRLCanvasView *)self addSubview:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) removeFromSuperview];
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRLCanvasView *)self layer];
  if (v8 != v6)
  {

LABEL_3:
    v13.receiver = self;
    v13.super_class = (Class)CRLCanvasView;
    id v9 = [(CRLCanvasView *)&v13 actionForLayer:v6 forKey:v7];
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  uint64_t v11 = [WeakRetained i_currentAnimation];

  if (!v11) {
    goto LABEL_3;
  }
  id v9 = [v11 actionForLayer:v6 forKey:v7];

LABEL_6:

  return v9;
}

- (UIViewController)rootViewControllerForColorMagnifierHUD
{
  v2 = [(CRLCanvasView *)self window];
  uint64_t v3 = [v2 rootViewController];
  id v4 = [v3 childViewControllers];
  id v5 = [v4 lastObject];

  return (UIViewController *)v5;
}

- (UICoordinateSpace)unscaledCoordinateSpace
{
  unscaledCoordinateSpace = self->_unscaledCoordinateSpace;
  if (!unscaledCoordinateSpace)
  {
    id v4 = [[CRLAdditionalTransformCoordinateSpace alloc] initWithCoordinateSpace:self identifier:@"CRLCanvasViewUnscaledSpaceIdentifier"];
    id v5 = self->_unscaledCoordinateSpace;
    self->_unscaledCoordinateSpace = (UICoordinateSpace *)v4;

    unscaledCoordinateSpace = self->_unscaledCoordinateSpace;
  }

  return unscaledCoordinateSpace;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasView;
  -[CRLCanvasView hitTest:withEvent:](&v16, "hitTest:withEvent:", a4);
  id v7 = (CRLCanvasView *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7) {
    BOOL v9 = v7 == self;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    uint64_t v11 = [WeakRetained layerHost];
    objc_super v12 = [v11 asiOSCVC];
    unsigned __int8 v13 = [v12 canvasSubview:v8 shouldHandleEventAtBoundsPoint:x, y];

    if ((v13 & 1) == 0)
    {
      CGRect v14 = self;

      id v8 = v14;
    }
  }

  return v8;
}

- (void)find:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasView *)self controller];
  [v5 endEditing];

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasView;
  [(CRLCanvasView *)&v6 find:v4];
}

- (void)findAndReplace:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasView *)self controller];
  [v5 endEditing];

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasView;
  [(CRLCanvasView *)&v6 findAndReplace:v4];
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  return 1;
}

- (CGAffineTransform)additionalTransformIntoCoordinateSpace:(SEL)a3
{
  id v6 = a4;
  id v7 = [v6 identifier];
  unsigned __int8 v8 = [v7 isEqualToString:@"CRLCanvasViewUnscaledSpaceIdentifier"];

  if (v8)
  {
    BOOL v9 = [(CRLCanvasView *)self controller];
    id v10 = v9;
    if (v9)
    {
      [v9 viewScale];
      CGAffineTransformMakeScale(retstr, 1.0 / v11, 1.0 / v11);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F66D8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AD244();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F66F8);
      }
      uint64_t v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView additionalTransformIntoCoordinateSpace:]");
      long long v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 178, 0, "invalid nil value for '%{public}s'", "icc");

      long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&retstr->c = v22;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
  }
  else
  {
    int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6698);
    }
    unsigned __int8 v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD2F4(v13, (uint64_t)v6, v12);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F66B8);
    }
    CGRect v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView additionalTransformIntoCoordinateSpace:]");
    objc_super v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"];
    id v17 = [v6 identifier];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 173, 0, "Unhandled coordinate space: %{public}@", v17);

    long long v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v18;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }

  return result;
}

- (CRLCanvasLayerHosting)layerHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerHost);

  return (CRLCanvasLayerHosting *)WeakRetained;
}

- (void)setLayerHost:(id)a3
{
}

- (CRLInteractiveCanvasController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (MTLDevice)metalDeviceForScreenWithCanvas
{
  return self->_metalDeviceForScreenWithCanvas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unscaledCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_metalDeviceForScreenWithCanvas, 0);
  objc_destroyWeak((id *)&self->_controller);

  objc_destroyWeak((id *)&self->_layerHost);
}

@end