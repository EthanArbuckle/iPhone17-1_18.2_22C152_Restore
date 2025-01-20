@interface EPSagaTransactionSetActiveIDSDevice
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancelWithError:(id)a3;
- (void)checkIfIDSSwitched;
- (void)idsTimerTimedOut;
- (void)rollback;
- (void)setDelegate:(id)a3;
- (void)switchTo:(id)a3 completion:(id)a4;
- (void)transactionDidComplete;
@end

@implementation EPSagaTransactionSetActiveIDSDevice

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 objectForKeyedSubscript:@"idsDeviceIdentifier"];
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  self->_idsDeviceIdentifier = v9;

  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  v11 = [v7 objectForKeyedSubscript:@"shouldWaitForConnectivity"];
  v12 = v11;
  if (self->_idsDeviceIdentifier) {
    unsigned __int8 v13 = [v11 BOOLValue];
  }
  else {
    unsigned __int8 v13 = 0;
  }
  self->_waitForConnectivity = v13;
  v14 = [v8 serviceFromClass:objc_opt_class()];
  v15 = [v14 defaultPairedDevice];
  v16 = [v15 nsuuid];

  if (v16)
  {
    v17 = [EPSagaOperandUUID alloc];
    v18 = [v14 defaultPairedDevice];
    v19 = [v18 nsuuid];
    v20 = [(EPSagaOperandUUID *)v17 initWithUUID:v19];

    v21 = [v7 operands];
    [v21 setObject:v20 forKeyedSubscript:@"coreBluetoothSwitchBackID"];
  }
  if (self->_waitForConnectivity)
  {
    v22 = [v7 queue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100052E20;
    v27[3] = &unk_1001655F8;
    v27[4] = self;
    v23 = +[TimerFactory timerWithIdentifier:@"com.apple.nanoregistry.ep.idsswitchtimeout" delay:1 gracePeriod:v22 waking:v27 handlerQueue:15.0 handlerBlock:0.0];
    idsTimer = self->_idsTimer;
    self->_idsTimer = v23;

    [v14 addConnectivityObserver:self];
  }
  if (self->_idsDeviceIdentifier) {
    [(EPSagaTransactionSetActiveIDSDevice *)self checkIfIDSSwitched];
  }
  if (!self->_success)
  {
    v25 = self->_idsDeviceIdentifier;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100052E28;
    v26[3] = &unk_100165980;
    v26[4] = self;
    [(EPSagaTransactionSetActiveIDSDevice *)self switchTo:v25 completion:v26];
  }
}

- (void)switchTo:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = dispatch_get_global_queue(25, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100052F78;
  v8[3] = &unk_100166210;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)idsTimerTimedOut
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(EPRoutingSlipEntry *)self->_routingSlipEntry shortDescription];
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ idsTimerTimedOut", buf, 0xCu);
    }
  }
  idsTimer = self->_idsTimer;
  self->_idsTimer = 0;

  id v8 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
  NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
  CFStringRef v12 = @"IDS IDSLocalPairingSetActiveIDSDevice pairing timed out";
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v10 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionSetActiveIDSDevice" code:1 userInfo:v9];
  [v8 addObject:v10];

  [(EPSagaTransactionSetActiveIDSDevice *)self transactionDidComplete];
}

- (void)cancelWithError:(id)a3
{
  if (a3)
  {
    routingSlipEntry = self->_routingSlipEntry;
    id v5 = a3;
    v6 = [(EPRoutingSlipEntry *)routingSlipEntry errors];
    [v6 addObject:v5];
  }

  [(EPSagaTransactionSetActiveIDSDevice *)self transactionDidComplete];
}

- (void)checkIfIDSSwitched
{
  v3 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v7 = v3;
  id v5 = [v3 defaultPairedDevice];
  v6 = [v5 nsuuid];
  LODWORD(idsDeviceIdentifier) = [(NSUUID *)idsDeviceIdentifier isEqual:v6];

  if (idsDeviceIdentifier)
  {
    self->_success = 1;
    [(EPSagaTransactionSetActiveIDSDevice *)self transactionDidComplete];
  }
}

- (void)transactionDidComplete
{
  if (self->_waitForConnectivity)
  {
    [(AbstractTimer *)self->_idsTimer invalidate];
    idsTimer = self->_idsTimer;
    self->_idsTimer = 0;

    BOOL v4 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v4 removeConnectivityObserver:self];
  }
  if (!self->_transactionComplete)
  {
    self->_transactionComplete = 1;
    id v5 = [(EPSagaTransactionSetActiveIDSDevice *)self delegate];
    [v5 transactionDidComplete:self];
  }
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  id v8 = [v12 objectForKeyedSubscript:@"shouldRollBack"];
  if ([v8 BOOLValue])
  {
    id v9 = [v12 objectForKeyedSubscript:@"coreBluetoothSwitchBackID"];
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    self->_idsDeviceIdentifier = v9;

    objc_storeStrong((id *)&self->_routingSlipEntry, a3);
    objc_storeStrong((id *)&self->_serviceRegistry, a4);
    self->_success = 0;
    self->_transactionComplete = 0;
    [(EPSagaTransactionSetActiveIDSDevice *)self rollback];
  }
  else
  {
    NSErrorUserInfoKey v11 = [(EPSagaTransactionSetActiveIDSDevice *)self delegate];
    [v11 transactionDidComplete:self];
  }
}

- (void)rollback
{
  if (self->_idsDeviceIdentifier && self->_waitForConnectivity)
  {
    [(AbstractTimer *)self->_idsTimer invalidate];
    v3 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100053CA4;
    v8[3] = &unk_1001655F8;
    v8[4] = self;
    BOOL v4 = +[TimerFactory timerWithIdentifier:@"com.apple.nanoregistry.ep.idsswitchtimeout" delay:1 gracePeriod:v3 waking:v8 handlerQueue:15.0 handlerBlock:0.0];
    idsTimer = self->_idsTimer;
    self->_idsTimer = v4;
  }
  [(EPSagaTransactionSetActiveIDSDevice *)self checkIfIDSSwitched];
  if (self->_success)
  {
    [(EPSagaTransactionSetActiveIDSDevice *)self transactionDidComplete];
  }
  else
  {
    v6 = [(EPRoutingSlipEntry *)self->_routingSlipEntry objectForKeyedSubscript:@"coreBluetoothSwitchBackID"];
    if (v6)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100053CAC;
      v7[3] = &unk_100165980;
      v7[4] = self;
      [(EPSagaTransactionSetActiveIDSDevice *)self switchTo:v6 completion:v7];
    }
    else
    {
      [(EPSagaTransactionSetActiveIDSDevice *)self transactionDidComplete];
    }
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);

  objc_storeStrong((id *)&self->_idsTimer, 0);
}

@end