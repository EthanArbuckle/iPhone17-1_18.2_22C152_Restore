@interface EPSagaTransactionWaitForDeviceCollectionChanges
- (BOOL)transactionComplete;
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPServiceRegistry)serviceRegistry;
- (EPTransactionDelegate)delegate;
- (NRDeviceCollectionDiff)diff;
- (NSTimer)timer;
- (double)rollbackTimeout;
- (double)waitingTimeout;
- (id)diffObserverToken;
- (void)addDiffObserver;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancelWithError:(id)a3;
- (void)check;
- (void)invalidate;
- (void)processDiff:(id)a3;
- (void)removeDiffObserver;
- (void)setDelegate:(id)a3;
- (void)setDiff:(id)a3;
- (void)setDiffObserverToken:(id)a3;
- (void)setRollbackTimeout:(double)a3;
- (void)setRoutingSlipEntry:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTransactionComplete:(BOOL)a3;
- (void)setWaitingTimeout:(double)a3;
- (void)startTimer;
- (void)stopTimer;
- (void)timeout:(id)a3;
- (void)transactionDidComplete;
@end

@implementation EPSagaTransactionWaitForDeviceCollectionChanges

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  p_serviceRegistry = &self->_serviceRegistry;
  id v7 = a4;
  id v8 = a3;
  objc_storeWeak((id *)p_serviceRegistry, v7);
  objc_storeWeak((id *)&self->_routingSlipEntry, v8);
  v9 = [v8 objectForKeyedSubscript:@"deviceCollectionWaitingTransactionDiff"];

  objc_storeWeak((id *)&self->_diff, v9);
  [v7 addService:self];

  [(EPSagaTransactionWaitForDeviceCollectionChanges *)self addDiffObserver];
  [(EPSagaTransactionWaitForDeviceCollectionChanges *)self startTimer];

  [(EPSagaTransactionWaitForDeviceCollectionChanges *)self check];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  v5 = [a3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015A10;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)transactionDidComplete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  [WeakRetained removeService:self];

  [(EPSagaTransactionWaitForDeviceCollectionChanges *)self stopTimer];
  [(EPSagaTransactionWaitForDeviceCollectionChanges *)self removeDiffObserver];
  if (!self->_transactionComplete)
  {
    self->_transactionComplete = 1;
    id v4 = [(EPSagaTransactionWaitForDeviceCollectionChanges *)self delegate];
    [v4 transactionDidComplete:self];
  }
}

- (void)addDiffObserver
{
  if (!self->_diffObserverToken)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
    id v4 = [WeakRetained serviceFromClass:objc_opt_class()];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015BD4;
    v7[3] = &unk_100165890;
    v7[4] = self;
    v5 = [v4 addDiffObserverWithWriteBlock:v7];
    id diffObserverToken = self->_diffObserverToken;
    self->_id diffObserverToken = v5;
  }
}

- (void)removeDiffObserver
{
  if (self->_diffObserverToken)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
    id v5 = [WeakRetained serviceFromClass:objc_opt_class()];

    [v5 removeDiffObserver:self->_diffObserverToken];
    id diffObserverToken = self->_diffObserverToken;
    self->_id diffObserverToken = 0;
  }
}

- (void)invalidate
{
  if (self->_diffObserverToken)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
    id v4 = [WeakRetained serviceFromClass:objc_opt_class()];

    [v4 removeDiffObserver:self->_diffObserverToken];
    id diffObserverToken = self->_diffObserverToken;
    self->_id diffObserverToken = 0;
  }

  [(EPSagaTransactionWaitForDeviceCollectionChanges *)self stopTimer];
}

- (void)processDiff:(id)a3
{
}

- (void)check
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v4 = [WeakRetained serviceFromClass:objc_opt_class()];

  id v5 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  v6 = [v5 objectForKeyedSubscript:@"deviceCollectionWaitingTransactionDiff"];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015ECC;
  v8[3] = &unk_100165730;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [v4 grabRegistryWithReadBlockAsync:v8];
}

- (void)startTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  id v6 = [WeakRetained objectForKeyedSubscript:@"deviceCollectionWaitingTransactionTimeout"];

  id v4 = v6;
  if (v6)
  {
    [v6 doubleValue];
    id v5 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timeout:", 0, 0);
    [(EPSagaTransactionWaitForDeviceCollectionChanges *)self setTimer:v5];

    id v4 = v6;
  }
}

- (void)timeout:(id)a3
{
  id v4 = [(EPSagaTransactionWaitForDeviceCollectionChanges *)self routingSlipEntry];
  id v5 = [v4 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000160F0;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)stopTimer
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"Cancelled";
    id v5 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v4 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionWaitForDeviceCollectionChanges" code:1 userInfo:v5];
  }
  id v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v13 = 138412546;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: cancelWithError: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  v11 = [(EPSagaTransactionWaitForDeviceCollectionChanges *)self routingSlipEntry];
  v12 = [v11 errors];
  [v12 addObject:v4];

  [(EPSagaTransactionWaitForDeviceCollectionChanges *)self transactionDidComplete];
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NRDeviceCollectionDiff)diff
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diff);

  return (NRDeviceCollectionDiff *)WeakRetained;
}

- (void)setDiff:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);

  return (EPServiceRegistry *)WeakRetained;
}

- (void)setServiceRegistry:(id)a3
{
}

- (EPRoutingSlipEntry)routingSlipEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);

  return (EPRoutingSlipEntry *)WeakRetained;
}

- (void)setRoutingSlipEntry:(id)a3
{
}

- (double)waitingTimeout
{
  return self->_waitingTimeout;
}

- (void)setWaitingTimeout:(double)a3
{
  self->_waitingTimeout = a3;
}

- (double)rollbackTimeout
{
  return self->_rollbackTimeout;
}

- (void)setRollbackTimeout:(double)a3
{
  self->_rollbackTimeout = a3;
}

- (id)diffObserverToken
{
  return self->_diffObserverToken;
}

- (void)setDiffObserverToken:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)transactionComplete
{
  return self->_transactionComplete;
}

- (void)setTransactionComplete:(BOOL)a3
{
  self->_transactionComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_diffObserverToken, 0);
  objc_destroyWeak((id *)&self->_routingSlipEntry);
  objc_destroyWeak((id *)&self->_serviceRegistry);
  objc_destroyWeak((id *)&self->_diff);

  objc_destroyWeak((id *)&self->_delegate);
}

@end