@interface EPSagaTransactionDeleteIDSDevice
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionDeleteIDSDevice

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = a3;
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  v7 = [v5 objectForKeyedSubscript:@"coreBluetoothID"];
  v8 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E30AC;
  block[3] = &unk_100165868;
  id v12 = v7;
  id v13 = v5;
  v14 = self;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(v8, block);
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