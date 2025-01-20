@interface EPSagaTransactionTearDownTinkerHealthSyncZones
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionTearDownTinkerHealthSyncZones

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = a3;
  v6 = [v5 queue];
  v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
  currentTimer = self->_currentTimer;
  self->_currentTimer = v7;

  v9 = self->_currentTimer;
  dispatch_time_t v10 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
  v11 = self->_currentTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000E10AC;
  handler[3] = &unk_100165530;
  handler[4] = self;
  id v12 = v5;
  id v22 = v12;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_currentTimer);
  v13 = objc_opt_new();
  id v14 = [objc_alloc((Class)HKSecondaryDevicePairingAgent) initWithHealthStore:v13];
  v15 = [v12 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v16 = nr_daemon_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    v18 = nr_daemon_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Tearing down tinker health sharing with Tinker device", buf, 2u);
    }
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000E1248;
  v19[3] = &unk_100165B28;
  v19[4] = self;
  [v14 tearDownHealthSharingWithTinkerDeviceWithNRUUID:v15 completion:v19];
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

  objc_storeStrong((id *)&self->_currentTimer, 0);
}

@end