@interface EPSagaTransactionUnpairBluetoothDevice
- (EPMassUnpairer)unpairer;
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRoutingSlipEntry:(id)a3;
- (void)setUnpairer:(id)a3;
- (void)unpairer:(id)a3 didFinishUnpairingDevices:(id)a4;
- (void)unpairerBluetoothMayHaveFailed:(id)a3;
@end

@implementation EPSagaTransactionUnpairBluetoothDevice

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  v7 = [v6 objectForKeyedSubscript:@"coreBluetoothID"];
  if (v7)
  {
    objc_storeStrong((id *)&self->_routingSlipEntry, a3);
    v8 = [EPMassUnpairer alloc];
    v9 = +[NSSet setWithObject:v7];
    v10 = [(EPMassUnpairer *)v8 initWithDelegate:self UUIDs:v9];
    unpairer = self->_unpairer;
    self->_unpairer = v10;
  }
  else
  {
    v12 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E19D4;
    block[3] = &unk_1001655F8;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

- (void)unpairer:(id)a3 didFinishUnpairingDevices:(id)a4
{
  v5 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1AB4;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)unpairerBluetoothMayHaveFailed:(id)a3
{
  v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping bluetooth unpair because the mass unpairer timed out/failed", buf, 2u);
    }
  }
  v7 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1C00;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v7, block);
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EPMassUnpairer)unpairer
{
  return self->_unpairer;
}

- (void)setUnpairer:(id)a3
{
}

- (EPRoutingSlipEntry)routingSlipEntry
{
  return self->_routingSlipEntry;
}

- (void)setRoutingSlipEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);
  objc_storeStrong((id *)&self->_unpairer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end