@interface EPSagaTransactionRequestMigration
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionRequestMigration

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"idsDeviceIdentifier"];
  v9 = [v6 objectForKeyedSubscript:@"destinationIsAltAccount"];
  v10 = v9;
  if (v9 && [v9 BOOLValue])
  {
    v11 = [v7 serviceFromClass:objc_opt_class()];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000AF194;
    v55[3] = &unk_100168F10;
    v58 = &v59;
    id v12 = v6;
    id v56 = v12;
    v57 = self;
    v13 = objc_retainBlock(v55);
    v14 = [v12 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AF480;
    block[3] = &unk_100165D10;
    v15 = v13;
    id v54 = v15;
    dispatch_async(v14, block);

    v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionRequestMigration: sending migration request to %@", buf, 0xCu);
      }
    }
    v19 = +[NSSet setWithObject:v8];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000AF494;
    v51[3] = &unk_100165C20;
    v20 = v15;
    id v52 = v20;
    [v11 sendMigrationRequestToDestinations:v19 shouldCancel:0 withSentBlock:v51 withResponseBlock:0];

LABEL_14:
    _Block_object_dispose(&v59, 8);
    goto LABEL_21;
  }
  if (v8)
  {
    v11 = [v7 serviceFromClass:objc_opt_class()];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000AF548;
    v47[3] = &unk_100168F10;
    v50 = &v59;
    id v21 = v6;
    id v48 = v21;
    v49 = self;
    v22 = objc_retainBlock(v47);
    v23 = [v21 queue];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000AF834;
    v45[3] = &unk_100165D10;
    v24 = v22;
    id v46 = v24;
    dispatch_async(v23, v45);

    v25 = nr_daemon_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      v27 = nr_daemon_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionRequestMigration: sending migration request to %@", buf, 0xCu);
      }
    }
    v28 = +[NSSet setWithObject:v8];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000AF848;
    v43[3] = &unk_100165C20;
    v29 = v24;
    id v44 = v29;
    [v11 sendMigrationRequestToDestinations:v28 shouldCancel:0 withSentBlock:v43 withResponseBlock:0];

    goto LABEL_14;
  }
  NSErrorUserInfoKey v63 = NSLocalizedDescriptionKey;
  CFStringRef v64 = @"no destination device identifier for device";
  v30 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v11 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionRequestMigration" code:4 userInfo:v30];

  if (v11)
  {
    v31 = [v6 errors];
    [v31 addObject:v11];

    [v6 persist];
    v32 = nr_daemon_log();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

    if (v33)
    {
      v34 = nr_daemon_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_1000FAD38((uint64_t)v11, v34, v35, v36, v37, v38, v39, v40);
      }
    }
  }
  v41 = [v6 queue];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000AF8FC;
  v42[3] = &unk_1001655F8;
  v42[4] = self;
  dispatch_async(v41, v42);

LABEL_21:
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  v5 = [a3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF9DC;
  block[3] = &unk_1001655F8;
  void block[4] = self;
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