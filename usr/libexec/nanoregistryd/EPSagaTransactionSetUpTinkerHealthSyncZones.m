@interface EPSagaTransactionSetUpTinkerHealthSyncZones
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionSetUpTinkerHealthSyncZones

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v7 = [v5 objectForKeyedSubscript:@"idsDeviceIdentifier"];
  v8 = [v5 queue];
  v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  currentTimer = self->_currentTimer;
  self->_currentTimer = v9;

  v11 = self->_currentTimer;
  dispatch_time_t v12 = dispatch_time(0, 600000000000);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
  v13 = self->_currentTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000125A4;
  handler[3] = &unk_100165530;
  handler[4] = self;
  id v23 = v5;
  id v14 = v5;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_resume((dispatch_object_t)self->_currentTimer);
  id v15 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
  [v15 setPromptUserToResolveAuthenticatonFailure:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100012744;
  v18[3] = &unk_100165B50;
  id v19 = v7;
  id v20 = v6;
  v21 = self;
  id v16 = v6;
  id v17 = v7;
  [v15 startRequestWithCompletionHandler:v18];
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