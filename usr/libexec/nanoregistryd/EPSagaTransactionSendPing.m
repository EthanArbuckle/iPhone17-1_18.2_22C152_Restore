@interface EPSagaTransactionSendPing
- (BOOL)transactionCompleted;
- (BOOL)waitForPingResponse;
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPTransactionDelegate)delegate;
- (void)_addTimeout;
- (void)_invalidateTimer;
- (void)_recordIDSError;
- (void)_recoredTimeoutError;
- (void)_transactionDidComplete;
- (void)_transactionDidCompleteWithSuccess:(BOOL)a3;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancel;
- (void)setDelegate:(id)a3;
- (void)setRoutingSlipEntry:(id)a3;
- (void)setTransactionCompleted:(BOOL)a3;
- (void)setWaitForPingResponse:(BOOL)a3;
@end

@implementation EPSagaTransactionSendPing

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  v9 = [v7 objectForKeyedSubscript:@"pingType"];
  v26 = v9;
  if (v9) {
    id v31 = [v9 integerValue];
  }
  else {
    id v31 = 0;
  }
  v10 = [v7 objectForKeyedSubscript:@"idsMessagePriority" v26];
  v11 = v10;
  if (v10) {
    uint64_t v30 = (uint64_t)[v10 integerValue];
  }
  else {
    uint64_t v30 = 200;
  }
  v12 = [v7 objectForKeyedSubscript:@"pingMessageSize"];
  v13 = v12;
  if (v12) {
    id v29 = [v12 integerValue];
  }
  else {
    id v29 = 0;
  }
  v14 = [v7 objectForKeyedSubscript:@"timeoutDuration"];
  v15 = v14;
  if (v14)
  {
    [v14 doubleValue];
    double v17 = v16;
  }
  else
  {
    double v17 = IDSMaxMessageTimeout;
  }
  v18 = [v7 objectForKeyedSubscript:@"idsDeviceIdentifier"];
  self->_waitForPingResponse = 0;
  v19 = [v7 objectForKeyedSubscript:@"waitForPingResponse"];
  v20 = v19;
  if (v19) {
    self->_waitForPingResponse = [v19 BOOLValue];
  }
  v28 = v8;
  v21 = [v8 serviceFromClass:objc_opt_class()];
  v22 = nr_daemon_log();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    v24 = nr_daemon_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionSendPing: Sending ping to device.", (uint8_t *)buf, 2u);
    }
  }
  objc_initWeak(buf, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000BB74C;
  v33[3] = &unk_1001692D0;
  objc_copyWeak(&v34, buf);
  [v21 sendPingRequestType:v31 withMessagePriority:v30 withMessageSize:v29 withTimeout:v18 toIDSBTUUID:v33 withResponseBlock:v17];
  v25 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB944;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v25, block);

  objc_destroyWeak(&v34);
  objc_destroyWeak(buf);
}

- (void)cancel
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionSendPing: Cancel", v6, 2u);
    }
  }
  [(EPSagaTransactionSendPing *)self _transactionDidComplete];
}

- (void)_addTimeout
{
  if (self->_transactionCompleted)
  {
    v2 = nr_daemon_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      BOOL v4 = nr_daemon_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionSendPing: Trying to add a transaction after completed. Not allowed.", (uint8_t *)buf, 2u);
      }
    }
  }
  else
  {
    currentTimer = self->_currentTimer;
    if (currentTimer)
    {
      dispatch_source_cancel(currentTimer);
      id v7 = self->_currentTimer;
      self->_currentTimer = 0;
    }
    id v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionSendPing: Adding 5min timeout.", (uint8_t *)buf, 2u);
      }
    }
    objc_initWeak(buf, self);
    v11 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
    v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
    v13 = self->_currentTimer;
    self->_currentTimer = v12;

    v14 = self->_currentTimer;
    dispatch_time_t v15 = dispatch_time(0, 45000000000);
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
    double v16 = self->_currentTimer;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000BBC18;
    v17[3] = &unk_100168468;
    v17[4] = self;
    objc_copyWeak(&v18, buf);
    dispatch_source_set_event_handler(v16, v17);
    dispatch_resume((dispatch_object_t)self->_currentTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

- (void)_transactionDidCompleteWithSuccess:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_waitForPingResponse) {
          CFStringRef v7 = @"YES";
        }
        else {
          CFStringRef v7 = @"NO";
        }
        int v8 = 138412290;
        CFStringRef v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionSendPing: ping sent successfully, waited for response: %@, posting NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification", (uint8_t *)&v8, 0xCu);
      }
    }
    notify_post((const char *)[NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification UTF8String]);
  }
  [(EPSagaTransactionSendPing *)self _transactionDidComplete];
}

- (void)_transactionDidComplete
{
  if (!self->_transactionCompleted)
  {
    self->_transactionCompleted = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained transactionDidComplete:self];

    BOOL v4 = nr_daemon_log();
    LODWORD(WeakRetained) = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (WeakRetained)
    {
      BOOL v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000FB240(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
}

- (void)_invalidateTimer
{
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    dispatch_source_cancel(currentTimer);
    BOOL v4 = self->_currentTimer;
    self->_currentTimer = 0;
  }
}

- (void)_recordIDSError
{
  BOOL v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FB278(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
  NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  CFStringRef v17 = @"Unable to send ping to device.";
  v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  dispatch_time_t v15 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionSendPringError" code:1 userInfo:v14];
  [v13 addObject:v15];

  [(EPRoutingSlipEntry *)self->_routingSlipEntry persist];
}

- (void)_recoredTimeoutError
{
  BOOL v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FB2B0(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
  NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  CFStringRef v17 = @"Time out sending message to device";
  v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  dispatch_time_t v15 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionSendPringError" code:0 userInfo:v14];
  [v13 addObject:v15];

  [(EPRoutingSlipEntry *)self->_routingSlipEntry persist];
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EPRoutingSlipEntry)routingSlipEntry
{
  return (EPRoutingSlipEntry *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRoutingSlipEntry:(id)a3
{
}

- (BOOL)transactionCompleted
{
  return self->_transactionCompleted;
}

- (void)setTransactionCompleted:(BOOL)a3
{
  self->_transactionCompleted = a3;
}

- (BOOL)waitForPingResponse
{
  return self->_waitForPingResponse;
}

- (void)setWaitForPingResponse:(BOOL)a3
{
  self->_waitForPingResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_currentTimer, 0);
}

@end