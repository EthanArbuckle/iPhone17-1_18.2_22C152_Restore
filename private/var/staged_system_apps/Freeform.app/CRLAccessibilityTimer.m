@interface CRLAccessibilityTimer
- (BOOL)_isCancelled;
- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock;
- (CRLAccessibilityTimer)init;
- (CRLAccessibilityTimer)initWithTargetSerialQueue:(id)a3;
- (OS_dispatch_queue)_dispatchQueue;
- (OS_dispatch_source)_dispatchTimer;
- (void)_reallyCancel;
- (void)_setCancelled:(BOOL)a3;
- (void)_setDispatchQueue:(id)a3;
- (void)_setDispatchTimer:(id)a3;
- (void)afterDelay:(double)a3 processBlock:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3;
@end

@implementation CRLAccessibilityTimer

- (CRLAccessibilityTimer)init
{
  return [(CRLAccessibilityTimer *)self initWithTargetSerialQueue:0];
}

- (CRLAccessibilityTimer)initWithTargetSerialQueue:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLAccessibilityTimer;
  v5 = [(CRLAccessibilityTimer *)&v16 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      [(CRLAccessibilityTimer *)v5 _setDispatchQueue:v4];
    }
    else
    {
      id v7 = objc_alloc((Class)NSString);
      v8 = +[NSBundle mainBundle];
      v9 = [v8 bundleIdentifier];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      id v12 = [v7 initWithFormat:@"%@.%@.TimerQueue", v9, v11];

      id v13 = v12;
      dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
      [(CRLAccessibilityTimer *)v6 _setDispatchQueue:v14];
    }
  }

  return v6;
}

- (void)dealloc
{
  [(CRLAccessibilityTimer *)self _reallyCancel];
  [(CRLAccessibilityTimer *)self _setDispatchQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLAccessibilityTimer;
  [(CRLAccessibilityTimer *)&v3 dealloc];
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  id v6 = a4;
  [(CRLAccessibilityTimer *)self _setCancelled:0];
  id v7 = [(CRLAccessibilityTimer *)self _dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003F72A4;
  block[3] = &unk_1014CFF70;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_reallyCancel
{
  objc_super v3 = [(CRLAccessibilityTimer *)self _dispatchTimer];
  if (v3)
  {
    id v4 = v3;
    dispatch_source_cancel(v3);
    [(CRLAccessibilityTimer *)self _setDispatchTimer:0];
    objc_super v3 = v4;
  }
}

- (void)cancel
{
  [(CRLAccessibilityTimer *)self _setCancelled:1];
  objc_super v3 = [(CRLAccessibilityTimer *)self _dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003F7544;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (OS_dispatch_queue)_dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_setDispatchQueue:(id)a3
{
}

- (OS_dispatch_source)_dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)_setDispatchTimer:(id)a3
{
}

- (BOOL)_isCancelled
{
  return self->_cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTimer, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end