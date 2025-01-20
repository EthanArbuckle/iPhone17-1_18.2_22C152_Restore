@interface NDTSignalCoalescer
- (BOOL)holdTransaction;
- (BOOL)pending;
- (NDTSignalCoalescer)init;
- (NDTSignalCoalescer)initWithLeadingEdgeDelay:(double)a3 nextDelay:(id)a4 action:(id)a5;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)source;
- (OS_os_transaction)transaction;
- (double)currentDelay;
- (double)leadingEdgeDelay;
- (double)leeway;
- (id)action;
- (id)nextDelayCalculator;
- (void)_cancel;
- (void)_setupTimerDelay:(double)a3 pending:(BOOL)a4;
- (void)cancel;
- (void)fireAction;
- (void)forceDelay:(double)a3;
- (void)setAccessQueue:(id)a3;
- (void)setAction:(id)a3;
- (void)setCurrentDelay:(double)a3;
- (void)setHoldTransaction:(BOOL)a3;
- (void)setLeadingEdgeDelay:(double)a3;
- (void)setLeeway:(double)a3;
- (void)setNextDelayCalculator:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSource:(id)a3;
- (void)setTransaction:(id)a3;
- (void)signal;
@end

@implementation NDTSignalCoalescer

- (NDTSignalCoalescer)init
{
  return [(NDTSignalCoalescer *)self initWithLeadingEdgeDelay:&stru_100054D88 nextDelay:&stru_100054DA8 action:0.0];
}

- (NDTSignalCoalescer)initWithLeadingEdgeDelay:(double)a3 nextDelay:(id)a4 action:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NDTSignalCoalescer;
  v10 = [(NDTSignalCoalescer *)&v17 init];
  v11 = v10;
  if (v10)
  {
    [(NDTSignalCoalescer *)v10 setLeeway:0.5];
    v12 = sub_100028B80();
    [(NDTSignalCoalescer *)v11 setQueue:v12];

    [(NDTSignalCoalescer *)v11 setNextDelayCalculator:v8];
    [(NDTSignalCoalescer *)v11 setAction:v9];
    [(NDTSignalCoalescer *)v11 setLeadingEdgeDelay:a3];
    [(NDTSignalCoalescer *)v11 setPending:0];
    v16 = 0;
    asprintf(&v16, "NDTSignalCoalescer<%p>", v11);
    if (v16) {
      v13 = v16;
    }
    else {
      v13 = "NDTSignalCoalescer";
    }
    v14 = sub_100028AC4(v13);
    [(NDTSignalCoalescer *)v11 setAccessQueue:v14];

    if (v16) {
      free(v16);
    }
  }

  return v11;
}

- (void)signal
{
  v3 = [(NDTSignalCoalescer *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007EFC;
  block[3] = &unk_100054DD0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)forceDelay:(double)a3
{
  objc_initWeak(&location, self);
  v5 = [(NDTSignalCoalescer *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000080D0;
  block[3] = &unk_100054DF8;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  dispatch_sync(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  v3 = [(NDTSignalCoalescer *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000081CC;
  block[3] = &unk_100054DD0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)fireAction
{
  queue = [(NDTSignalCoalescer *)self queue];
  v3 = [(NDTSignalCoalescer *)self action];
  dispatch_async(queue, v3);
}

- (void)setAction:(id)a3
{
  self->_action = [a3 copy];

  _objc_release_x1();
}

- (void)_setupTimerDelay:(double)a3 pending:(BOOL)a4
{
  BOOL v4 = a4;
  objc_initWeak(&location, self);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  objc_super v17 = sub_100008474;
  v18 = &unk_100054E20;
  objc_copyWeak(&v19, &location);
  v7 = objc_retainBlock(&v15);
  -[NDTSignalCoalescer setPending:](self, "setPending:", v4, v15, v16, v17, v18);
  id v8 = [(NDTSignalCoalescer *)self accessQueue];
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  [(NDTSignalCoalescer *)self setSource:v9];

  v10 = [(NDTSignalCoalescer *)self source];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  [(NDTSignalCoalescer *)self leeway];
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v12 * 1000000000.0));

  v13 = [(NDTSignalCoalescer *)self source];
  dispatch_source_set_event_handler(v13, v7);

  v14 = [(NDTSignalCoalescer *)self source];
  dispatch_resume(v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_cancel
{
  v3 = [(NDTSignalCoalescer *)self source];

  if (v3)
  {
    BOOL v4 = [(NDTSignalCoalescer *)self source];
    dispatch_source_cancel(v4);

    [(NDTSignalCoalescer *)self setSource:0];
  }
}

- (BOOL)holdTransaction
{
  return self->_holdTransaction;
}

- (void)setHoldTransaction:(BOOL)a3
{
  self->_holdTransaction = a3;
}

- (id)action
{
  return self->_action;
}

- (id)nextDelayCalculator
{
  return self->_nextDelayCalculator;
}

- (void)setNextDelayCalculator:(id)a3
{
}

- (double)leadingEdgeDelay
{
  return self->_leadingEdgeDelay;
}

- (void)setLeadingEdgeDelay:(double)a3
{
  self->_leadingEdgeDelay = a3;
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setLeeway:(double)a3
{
  self->_leeway = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)pending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (double)currentDelay
{
  return self->_currentDelay;
}

- (void)setCurrentDelay:(double)a3
{
  self->_currentDelay = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_nextDelayCalculator, 0);

  objc_storeStrong(&self->_action, 0);
}

@end