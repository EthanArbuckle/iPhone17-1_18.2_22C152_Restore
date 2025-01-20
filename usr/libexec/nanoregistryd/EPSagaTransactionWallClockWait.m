@interface EPSagaTransactionWallClockWait
- (EPTransactionDelegate)delegate;
- (OS_dispatch_source)currentTimer;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancelTimer;
- (void)setCurrentTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimerDuration:(double)a3 withBlock:(id)a4;
@end

@implementation EPSagaTransactionWallClockWait

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"timeoutDuration"];
  if (v8)
  {
    objc_initWeak(&location, self);
    [v8 doubleValue];
    double v10 = v9;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C6E50;
    v12[3] = &unk_100165E68;
    objc_copyWeak(&v13, &location);
    [(EPSagaTransactionWallClockWait *)self setTimerDuration:v12 withBlock:v10];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = [(EPSagaTransactionWallClockWait *)self delegate];
    [v11 transactionDidComplete:self];
  }
}

- (void)setTimerDuration:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    dispatch_source_cancel(currentTimer);
    v8 = self->_currentTimer;
    self->_currentTimer = 0;
  }
  if (v6)
  {
    double v9 = +[EPFactory queue];
    double v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000C6FF4;
    v14[3] = &unk_100166210;
    v14[4] = self;
    id v15 = v6;
    dispatch_source_set_event_handler(v10, v14);
    dispatch_resume(v10);
    v12 = self->_currentTimer;
    self->_currentTimer = (OS_dispatch_source *)v10;
    id v13 = v10;
  }
}

- (void)cancelTimer
{
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    dispatch_source_cancel(currentTimer);
    v4 = self->_currentTimer;
    self->_currentTimer = 0;

    id v5 = [(EPSagaTransactionWallClockWait *)self delegate];
    [v5 transactionDidComplete:self];
  }
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_source)currentTimer
{
  return self->_currentTimer;
}

- (void)setCurrentTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end