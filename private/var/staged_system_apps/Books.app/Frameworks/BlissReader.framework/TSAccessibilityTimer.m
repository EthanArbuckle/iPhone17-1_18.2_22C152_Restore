@interface TSAccessibilityTimer
- (BOOL)_isCancelled;
- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock;
- (OS_dispatch_queue)_dispatchQueue;
- (OS_dispatch_source)_dispatchTimer;
- (TSAccessibilityTimer)init;
- (TSAccessibilityTimer)initWithTargetSerialQueue:(id)a3;
- (void)_reallyCancel;
- (void)_setCancelled:(BOOL)a3;
- (void)_setDispatchQueue:(id)a3;
- (void)_setDispatchTimer:(id)a3;
- (void)afterDelay:(double)a3 processBlock:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3;
@end

@implementation TSAccessibilityTimer

- (TSAccessibilityTimer)init
{
  return [(TSAccessibilityTimer *)self initWithTargetSerialQueue:0];
}

- (TSAccessibilityTimer)initWithTargetSerialQueue:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSAccessibilityTimer;
  v4 = [(TSAccessibilityTimer *)&v12 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      [(TSAccessibilityTimer *)v4 _setDispatchQueue:a3];
    }
    else
    {
      id v6 = objc_alloc((Class)NSString);
      v7 = [+[NSBundle mainBundle] bundleIdentifier];
      v8 = (objc_class *)objc_opt_class();
      id v9 = [v6 initWithFormat:@"%@.%@.TimerQueue", v7, NSStringFromClass(v8)];
      v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);

      [(TSAccessibilityTimer *)v5 _setDispatchQueue:v10];
      if (v10) {
        dispatch_release(v10);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  [(TSAccessibilityTimer *)self _reallyCancel];
  [(TSAccessibilityTimer *)self _setDispatchQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityTimer;
  [(TSAccessibilityTimer *)&v3 dealloc];
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  [(TSAccessibilityTimer *)self _setCancelled:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_253C38;
  block[3] = &unk_4570F0;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)[(TSAccessibilityTimer *)self _dispatchQueue], block);
}

- (void)_reallyCancel
{
  objc_super v3 = [(TSAccessibilityTimer *)self _dispatchTimer];
  if (v3)
  {
    dispatch_source_cancel((dispatch_source_t)v3);
    [(TSAccessibilityTimer *)self _setDispatchTimer:0];
  }
}

- (void)cancel
{
  [(TSAccessibilityTimer *)self _setCancelled:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_253E94;
  block[3] = &unk_456DE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(TSAccessibilityTimer *)self _dispatchQueue], block);
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

@end