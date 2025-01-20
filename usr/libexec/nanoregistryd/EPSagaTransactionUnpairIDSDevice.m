@interface EPSagaTransactionUnpairIDSDevice
+ (id)countdown:(int64_t)a3 toCompletion:(id)a4;
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionUnpairIDSDevice

+ (id)countdown:(int64_t)a3 toCompletion:(id)a4
{
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2810000000;
  v31[3] = &unk_100159365;
  int v32 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10007C3B4;
  v28 = sub_10007C3E0;
  id v29 = 0;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10007C3E8;
  v18 = &unk_100166810;
  v20 = v31;
  v21 = v30;
  v22 = &v24;
  int64_t v23 = a3;
  id v5 = a4;
  id v19 = v5;
  v6 = objc_retainBlock(&v15);
  v7 = (void *)v25[5];
  v25[5] = (uint64_t)v6;

  v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock((id)v25[5]);
      v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, v15, v16, v17, v18);
      *(_DWORD *)buf = 134218242;
      id v34 = v11;
      __int16 v35 = 2112;
      v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%p] countdown:%@ toCompletion: --started--", buf, 0x16u);
    }
  }
  id v13 = objc_retainBlock((id)v25[5]);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);

  return v13;
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  v7 = [a3 objectForKeyedSubscript:@"idsDeviceIdentifier"];
  v8 = dispatch_get_global_queue(25, 0);
  if (v7)
  {
    BOOL v9 = objc_opt_class();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10007C994;
    v20[3] = &unk_100165668;
    v20[4] = self;
    id v21 = v7;
    v10 = v8;
    v22 = v10;
    id v11 = v6;
    id v23 = v11;
    v12 = [v9 countdown:2 toCompletion:v20];
    id v13 = +[NSMutableSet set];
    pairedDevices = self->_pairedDevices;
    self->_pairedDevices = v13;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007CFA0;
    block[3] = &unk_100167ED0;
    block[4] = self;
    id v19 = v12;
    id v18 = v11;
    id v15 = v12;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v16 = [(EPSagaTransactionUnpairIDSDevice *)self delegate];
    [v16 transactionDidComplete:self];
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

  objc_storeStrong((id *)&self->_pairedDevices, 0);
}

@end