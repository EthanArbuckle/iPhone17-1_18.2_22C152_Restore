@interface EPSagaTransactionHealthSync
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionHealthSync

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 serviceFromClass:objc_opt_class()];
  if ([v8 isIDSConnected])
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v9 = (void *)qword_1001A1090;
    uint64_t v36 = qword_1001A1090;
    if (!qword_1001A1090)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      v30 = sub_10001A940;
      v31 = &unk_1001657F0;
      v32 = &v33;
      sub_10001A940((uint64_t)buf);
      v9 = (void *)v34[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v33, 8);
    v11 = objc_opt_new();
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v12 = (void *)qword_1001A10A0;
    uint64_t v36 = qword_1001A10A0;
    if (!qword_1001A10A0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      v30 = sub_10001AB08;
      v31 = &unk_1001657F0;
      v32 = &v33;
      sub_10001AB08((uint64_t)buf);
      v12 = (void *)v34[3];
    }
    v13 = v12;
    _Block_object_dispose(&v33, 8);
    id v14 = [[v13 alloc] initWithHealthStore:v11];
    v15 = [v6 objectForKeyedSubscript:@"completeHealthSyncForUnpairing"];
    if ([v15 BOOLValue])
    {
      v16 = nr_daemon_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        v18 = nr_daemon_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling HKHealthStore forceNanoSyncWithPullRequest", buf, 2u);
        }
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10001A708;
      v27[3] = &unk_100165B28;
      v27[4] = self;
      [v14 forceNanoSyncWithPullRequest:1 completion:v27];
    }
    else
    {
      v22 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
      v23 = nr_daemon_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
      {
        v25 = nr_daemon_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Calling HKHealthStore waitForLastChanceSyncWithDevicePairingID", buf, 2u);
        }
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10001A804;
      v26[3] = &unk_100165B28;
      v26[4] = self;
      [v14 waitForLastChanceSyncWithDevicePairingID:v22 timeout:v26 completion:10.0];
    }
  }
  else
  {
    v19 = nr_daemon_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      v21 = nr_daemon_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Skipping health sync because no connectivity to the watch.", buf, 2u);
      }
    }
    v11 = [(EPSagaTransactionHealthSync *)self delegate];
    [v11 transactionDidComplete:self];
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
}

@end