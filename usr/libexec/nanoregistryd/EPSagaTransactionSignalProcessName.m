@interface EPSagaTransactionSignalProcessName
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionSignalProcessName

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"processName"];
  v7 = [v5 objectForKeyedSubscript:@"signalNumber"];
  +[NRUnixProcessSignaler signalProcessNamed:withSignal:](NRUnixProcessSignaler, "signalProcessNamed:withSignal:", v6, [v7 intValue]);
  v8 = [v5 queue];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051A80;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = [a3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051B60;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end