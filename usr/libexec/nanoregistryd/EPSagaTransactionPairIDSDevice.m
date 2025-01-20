@interface EPSagaTransactionPairIDSDevice
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)checkIfIDSIsPaired;
- (void)idsTimerTimedOut;
- (void)remoteObjectIDSServiceAvailable:(id)a3 withIDSDevice:(id)a4;
- (void)setDelegate:(id)a3;
- (void)transactionDidComplete;
@end

@implementation EPSagaTransactionPairIDSDevice

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 objectForKeyedSubscript:@"coreBluetoothID"];
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  self->_idsDeviceIdentifier = v9;

  v11 = [(NSUUID *)self->_idsDeviceIdentifier UUIDString];
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  v12 = [v8 serviceFromClass:objc_opt_class()];
  oobKeyStash = self->_oobKeyStash;
  self->_oobKeyStash = v12;

  v14 = [v7 objectForKeyedSubscript:@"supportsDirectIPSecPairing"];
  v15 = [v7 objectForKeyedSubscript:@"destinationIsAltAccount"];
  v16 = [v7 queue];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10001AEA8;
  v39[3] = &unk_1001655F8;
  v39[4] = self;
  v17 = +[TimerFactory timerWithIdentifier:@"com.apple.nanoregistry.ep.idsmigrationtimeout" delay:1 gracePeriod:v16 waking:v39 handlerQueue:200.0 handlerBlock:0.0];
  idsTimer = self->_idsTimer;
  self->_idsTimer = v17;

  v19 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  [v19 addConnectivityObserver:self];
  v20 = [(EPSagaServiceOOBStash *)self->_oobKeyStash oobKey];
  v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (id)objc_opt_new();
  }
  v23 = v22;
  id v24 = [objc_alloc((Class)IDSLocalPairingAddPairedDeviceInfo) initWithCBUUID:self->_idsDeviceIdentifier pairingProtocolVersion:0 BTOutOfBandKey:v22];
  [v24 setPairingType:[v15 BOOLValue]];
  [v24 setShouldPairDirectlyOverIPsec:[v14 BOOLValue]];
  [(EPSagaServiceOOBStash *)self->_oobKeyStash clearOOBKey];
  dispatch_get_global_queue(25, 0);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001AEB0;
  v31[3] = &unk_100165F00;
  id v32 = v11;
  v33 = self;
  id v34 = v21;
  id v35 = v24;
  id v36 = v7;
  id v37 = v8;
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v38;
  id v26 = v8;
  id v27 = v7;
  id v28 = v24;
  id v29 = v21;
  id v30 = v11;
  dispatch_async(v25, v31);
}

- (void)idsTimerTimedOut
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(EPRoutingSlipEntry *)self->_routingSlipEntry shortDescription];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ idsTimerTimedOut", (uint8_t *)&v8, 0xCu);
    }
  }
  idsTimer = self->_idsTimer;
  self->_idsTimer = 0;

  [(EPSagaTransactionPairIDSDevice *)self transactionDidComplete];
}

- (void)checkIfIDSIsPaired
{
  v3 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v9 = v3;
  v5 = [v3 defaultPairedDevice];
  v6 = [v5 nsuuid];
  if ([(NSUUID *)idsDeviceIdentifier isEqual:v6])
  {
    id v7 = [v9 defaultPairedDevice];
    unsigned int v8 = [v7 isConnected];

    if (v8)
    {
      self->_success = 1;
      [(EPSagaTransactionPairIDSDevice *)self transactionDidComplete];
    }
  }
  else
  {
  }
}

- (void)remoteObjectIDSServiceAvailable:(id)a3 withIDSDevice:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self->_finished && !self->_transactionComplete) {
    [(EPSagaTransactionPairIDSDevice *)self checkIfIDSIsPaired];
  }
}

- (void)transactionDidComplete
{
  [(AbstractTimer *)self->_idsTimer invalidate];
  idsTimer = self->_idsTimer;
  self->_idsTimer = 0;

  if (!self->_transactionComplete)
  {
    self->_transactionComplete = 1;
    BOOL v4 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v4 removeConnectivityObserver:self];
    if (self->_success)
    {
      v5 = [(EPSagaTransactionPairIDSDevice *)self delegate];
      [v5 transactionDidComplete:self];
    }
    else
    {
      id v6 = nr_daemon_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        unsigned int v8 = nr_daemon_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000F6F64((uint64_t)self, v8);
        }
      }
      id v9 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      CFStringRef v13 = @"IDS migration pairing timed out";
      v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v11 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionPairIDSDevice" code:2 userInfo:v10];
      [v9 addObject:v11];

      [(EPSagaTransactionPairIDSDevice *)self beginRollbackWithRoutingSlipEntry:self->_routingSlipEntry serviceRegistry:self->_serviceRegistry];
    }
  }
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"coreBluetoothID"];
  objc_initWeak(&location, self);
  BOOL v7 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BC8C;
  block[3] = &unk_100165FA0;
  id v12 = v6;
  id v8 = v6;
  objc_copyWeak(&v15, &location);
  id v13 = v5;
  id v14 = v7;
  id v9 = v7;
  id v10 = v5;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
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
  objc_storeStrong((id *)&self->_oobKeyStash, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);

  objc_storeStrong((id *)&self->_idsTimer, 0);
}

@end