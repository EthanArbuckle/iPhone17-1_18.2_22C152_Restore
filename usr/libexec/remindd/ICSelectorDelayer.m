@interface ICSelectorDelayer
- (BOOL)callOnMainThread;
- (BOOL)isScheduledToFire;
- (BOOL)waitToFireUntilRequestsStop;
- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7;
- (OS_dispatch_queue)requestQueue;
- (SEL)selector;
- (double)delay;
- (id)fireBlock;
- (id)target;
- (void)_cancelFireRequests;
- (void)callTargetSelector;
- (void)cancelPreviousFireRequests;
- (void)dealloc;
- (void)fireImmediately;
- (void)requestFire;
- (void)setCallOnMainThread:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setFireBlock:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setWaitToFireUntilRequestsStop:(BOOL)a3;
@end

@implementation ICSelectorDelayer

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICSelectorDelayer;
  v13 = [(ICSelectorDelayer *)&v18 init];
  v14 = v13;
  if (v13)
  {
    [(ICSelectorDelayer *)v13 setTarget:v12];
    [(ICSelectorDelayer *)v14 setSelector:a4];
    [(ICSelectorDelayer *)v14 setDelay:a5];
    [(ICSelectorDelayer *)v14 setWaitToFireUntilRequestsStop:v8];
    [(ICSelectorDelayer *)v14 setCallOnMainThread:v7];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.reminders.coalescer.requests", v15);
    [(ICSelectorDelayer *)v14 setRequestQueue:v16];
  }
  return v14;
}

- (void)dealloc
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A74;
  block[3] = &unk_1008ADA80;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)ICSelectorDelayer;
  [(ICSelectorDelayer *)&v4 dealloc];
}

- (void)requestFire
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B04;
  block[3] = &unk_1008ADA80;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)fireImmediately
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E70;
  block[3] = &unk_1008ADA80;
  block[4] = self;
  dispatch_sync(v3, block);

  if ([(ICSelectorDelayer *)self callOnMainThread]
    && !+[NSThread isMainThread])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100004E78;
    v4[3] = &unk_1008ADA80;
    v4[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  }
  else
  {
    [(ICSelectorDelayer *)self callTargetSelector];
  }
}

- (void)callTargetSelector
{
  v3 = [(ICSelectorDelayer *)self target];
  objc_super v4 = (void (*)(id, SEL))[v3 methodForSelector: -[ICSelectorDelayer selector](self, "selector")];

  if (v4)
  {
    id v6 = [(ICSelectorDelayer *)self target];
    v4(v6, [(ICSelectorDelayer *)self selector]);
  }
  else
  {
    v5 = +[REMLog cloudkit];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1007490AC(self, v5);
    }
  }
}

- (BOOL)isScheduledToFire
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ICSelectorDelayer *)self requestQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005034;
  v5[3] = &unk_1008ADB18;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)cancelPreviousFireRequests
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000510C;
  block[3] = &unk_1008ADA80;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_cancelFireRequests
{
  v3 = [(ICSelectorDelayer *)self fireBlock];

  if (v3)
  {
    objc_super v4 = [(ICSelectorDelayer *)self fireBlock];
    dispatch_block_cancel(v4);

    [(ICSelectorDelayer *)self setFireBlock:0];
  }
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)waitToFireUntilRequestsStop
{
  return self->_waitToFireUntilRequestsStop;
}

- (void)setWaitToFireUntilRequestsStop:(BOOL)a3
{
  self->_waitToFireUntilRequestsStop = a3;
}

- (BOOL)callOnMainThread
{
  return self->_callOnMainThread;
}

- (void)setCallOnMainThread:(BOOL)a3
{
  self->_callOnMainThread = a3;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);

  objc_destroyWeak(&self->_target);
}

@end