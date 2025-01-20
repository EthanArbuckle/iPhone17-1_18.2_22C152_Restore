@interface CRLAnimatedGIFLayer
+ (id)defaultActionForKey:(id)a3;
- (CRLAnimatedGIFController)controller;
- (void)dealloc;
- (void)display;
- (void)setController:(id)a3;
- (void)teardown;
@end

@implementation CRLAnimatedGIFLayer

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EECE8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109FDE0(v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EED08);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v6, v4);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFLayer dealloc]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFLayer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 23, 0, "expected nil value for '%{public}s'", "mController");
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLAnimatedGIFLayer;
  [(CRLAnimatedGIFLayer *)&v9 dealloc];
}

- (void)setController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->mController);
    [v5 removeLayer:self];

    id v6 = objc_storeWeak((id *)&self->mController, obj);
    [obj addLayer:self];

    [(CRLAnimatedGIFLayer *)self setNeedsDisplay];
  }
}

- (void)teardown
{
}

- (CRLAnimatedGIFController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  return (CRLAnimatedGIFController *)WeakRetained;
}

- (void)display
{
  p_mController = &self->mController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_mController);
    -[CRLAnimatedGIFLayer setContents:](self, "setContents:", [v5 imageForCurrentTime]);
  }
  else
  {
    [(CRLAnimatedGIFLayer *)self setContents:0];
    id v5 = +[CRLColor blackColor];
    -[CRLAnimatedGIFLayer setBackgroundColor:](self, "setBackgroundColor:", [v5 CGColor]);
  }
}

+ (id)defaultActionForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    uint64_t v5 = +[NSNull null];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CRLAnimatedGIFLayer;
    uint64_t v5 = [super defaultActionForKey:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (void).cxx_destruct
{
}

@end