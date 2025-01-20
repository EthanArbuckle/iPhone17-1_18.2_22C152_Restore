@interface EPSagaTransactionNotification
- (BOOL)_shouldWaitForCurrentNotification:(id)a3;
- (EPTransactionDelegate)delegate;
- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancel;
- (void)notification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)timeout;
- (void)transactionDidComplete;
@end

@implementation EPSagaTransactionNotification

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  v9 = [v7 objectForKeyedSubscript:@"notificationName"];
  notificationName = self->_notificationName;
  self->_notificationName = v9;

  v11 = [v7 objectForKeyedSubscript:@"notificationTimeoutSeconds"];
  v12 = [v7 objectForKeyedSubscript:@"shouldPostNotification"];
  v13 = [v7 objectForKeyedSubscript:@"isDarwinNotification"];
  self->_isDarwinNotification = [v13 BOOLValue];
  self->_notifyToken = -1;
  if ([v12 BOOLValue])
  {
    if (self->_isDarwinNotification)
    {
      notify_post([(NSString *)self->_notificationName UTF8String]);
    }
    else
    {
      v23 = +[NSNotificationCenter defaultCenter];
      [v23 postNotificationName:self->_notificationName object:self];
    }
  }
  else
  {
    [v11 doubleValue];
    if (v14 != 0.0)
    {
      v15 = [@"com.apple.nanoregistry.EPSagaTransactionDarwinNotification." stringByAppendingString:self->_notificationName];
      [v11 doubleValue];
      double v17 = v16;
      v18 = [v7 queue];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000716E0;
      v30[3] = &unk_1001655F8;
      v30[4] = self;
      v19 = +[TimerFactory timerWithIdentifier:v15 delay:1 gracePeriod:v18 waking:v30 handlerQueue:v17 handlerBlock:0.0];
      timer = self->_timer;
      self->_timer = v19;
    }
    if (self->_isDarwinNotification)
    {
      v21 = self->_notificationName;
      v22 = [v8 queue];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000716E8;
      v29[3] = &unk_100165958;
      v29[4] = self;
      self->_notifyToken = [(EPSagaTransactionNotification *)self registerNotifyTokenWithName:v21 withQueue:v22 withBlock:v29];
    }
    else
    {
      v24 = +[NSNotificationCenter defaultCenter];
      [v24 addObserver:self selector:"notification:" name:self->_notificationName object:0];

      if (![(EPSagaTransactionNotification *)self _shouldWaitForCurrentNotification:v8])
      {
        v25 = nr_daemon_log();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

        if (v26)
        {
          v27 = nr_daemon_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = self->_notificationName;
            *(_DWORD *)buf = 138412290;
            v32 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No need to wait for notification %@. Completing transaction", buf, 0xCu);
          }
        }
        [(EPSagaTransactionNotification *)self transactionDidComplete];
      }
    }
  }
}

- (void)timeout
{
  v3 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  v4 = "Darwin";
  if (!self->_isDarwinNotification) {
    v4 = "Foundation";
  }
  v5 = +[NSString stringWithFormat:@"Timed out waiting for %s notification %@", v4, self->_notificationName];
  v13 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v7 = +[NSError errorWithDomain:@"com.apple.NanoRegistry.EPSagaTransactionNotification" code:0 userInfo:v6];
  [v3 addObject:v7];

  if (_NRIsInternalInstall()
    && [(NSString *)self->_notificationName isEqualToString:@"EPSagaTransactionMigrationCompletionRequestNotification"])
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = @"EPSagaTransactionMigrationCompletionRequestNotification";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed migration waiting for %@ notification during watch migration, posting alert to promote filing a radar", buf, 0xCu);
    }

    v9 = +[NRRepeatingAlertEngine sharedInstance];
    [v9 setEnabled:1 withName:@"InternalMigrationFailed"];
  }
  [(EPSagaTransactionNotification *)self transactionDidComplete];
}

- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int out_token = -1;
  id v10 = v7;
  CFStringRef v11 = (const char *)[v10 UTF8String];
  if (v9)
  {
    if (!notify_register_dispatch(v11, &out_token, v8, v9)) {
      goto LABEL_9;
    }
  }
  else if (!notify_register_check(v11, &out_token))
  {
    goto LABEL_9;
  }
  NSErrorUserInfoKey v12 = nr_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    double v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to register block and get notify token for %@", buf, 0xCu);
    }
  }
LABEL_9:
  int v15 = out_token;

  return v15;
}

- (void)cancel
{
  v3 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
  id v4 = [v3 count];

  if (!v4)
  {
    v5 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    v6 = "Darwin";
    if (!self->_isDarwinNotification) {
      v6 = "Foundation";
    }
    id v7 = +[NSString stringWithFormat:@"Canceled waiting for %s notification %@", v6, self->_notificationName];
    CFStringRef v11 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v9 = +[NSError errorWithDomain:@"com.apple.NanoRegistry.EPSagaTransactionNotification" code:1 userInfo:v8];
    [v5 addObject:v9];
  }
  [(EPSagaTransactionNotification *)self transactionDidComplete];
}

- (void)notification:(id)a3
{
  id v4 = a3;
  v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionNotification received: %@", buf, 0xCu);
    }
  }
  id v8 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071C94;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)transactionDidComplete
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  [(AbstractTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_transactionComplete)
  {
    self->_transactionComplete = 1;
    id v6 = [(EPSagaTransactionNotification *)self delegate];
    [v6 transactionDidComplete:self];
  }
}

- (BOOL)_shouldWaitForCurrentNotification:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  if ([(NSString *)self->_notificationName isEqualToString:@"NRNotificationWaitForBridgeComplete"])
  {
    v5 = [v4 serviceFromClass:objc_opt_class()];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100071FF0;
    v20[3] = &unk_1001677B8;
    id v21 = v4;
    v22 = &v23;
    [v5 deasyncGrabRegistryWithReadBlock:v20];
  }
  if ([(NSString *)self->_notificationName isEqualToString:@"EPSagaTransactionMigrationCompletionRequestNotification"])
  {
    id v6 = [v4 serviceFromProtocol:&OBJC_PROTOCOL___EPSagaTransactionWaitForWatchCompletionService];
    id v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      id v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_watchMigrationNotification, race mitigation check", buf, 2u);
      }
    }
    id v18 = 0;
    unsigned int v10 = [v6 getWatchMigrationCompletionStatusWithError:&v18];
    id v11 = v18;
    if (v10)
    {
      NSErrorUserInfoKey v12 = nr_daemon_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        double v14 = nr_daemon_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_watchMigrationNotification, race mitigation completed", buf, 2u);
        }
      }
      if (v11)
      {
        int v15 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
        [v15 addObject:v11];
      }
      *((unsigned char *)v24 + 24) = 0;
    }
  }
  char v16 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v16;
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
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end