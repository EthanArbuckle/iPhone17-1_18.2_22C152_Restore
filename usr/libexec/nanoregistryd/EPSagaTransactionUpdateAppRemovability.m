@interface EPSagaTransactionUpdateAppRemovability
- (BOOL)_havePairedOrMigratingDevices:(id)a3 rollback:(BOOL)a4;
- (EPTransactionDelegate)delegate;
- (void)_setAppRemovability:(unint64_t)a3;
- (void)_updateAppRemovability:(id)a3 rollback:(BOOL)a4 entry:(id)a5;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionUpdateAppRemovability

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 serviceFromClass:objc_opt_class()];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100072AF0;
  v10[3] = &unk_100165730;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 grabRegistryWithReadBlock:v10];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 serviceFromClass:objc_opt_class()];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100072BDC;
  v10[3] = &unk_100165730;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 grabRegistryWithReadBlock:v10];
}

- (void)_updateAppRemovability:(id)a3 rollback:(BOOL)a4 entry:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if ([(EPSagaTransactionUpdateAppRemovability *)self _havePairedOrMigratingDevices:a3 rollback:v5])
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }
  v10 = nr_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = nr_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = IXStringForAppRemovability();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting Watch related Apps as %@", buf, 0xCu);
    }
  }
  [(EPSagaTransactionUpdateAppRemovability *)self _setAppRemovability:v9];
  v14 = [v8 queue];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072D7C;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v14, block);
}

- (BOOL)_havePairedOrMigratingDevices:(id)a3 rollback:(BOOL)a4
{
  id v5 = a3;
  id v6 = +[EPNanoRegistryStatusCodeElection sharedInstance];
  if ([v6 statusCode] == (id)1)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[EPNanoRegistryStatusCodeElection sharedInstance];
    BOOL v7 = [v8 statusCode] == (id)4;
  }
  uint64_t v9 = [v5 activeDeviceID];
  if (v7)
  {
    v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NR is pairing or migrating, require Watch-related Apps", buf, 2u);
      }
      LOBYTE(v13) = 1;
LABEL_32:

      goto LABEL_33;
    }
    LOBYTE(v13) = 1;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v5;
    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v20 = [v14 objectForKeyedSubscript:v19];
          unsigned int v21 = [v20 isPaired];
          if (a4)
          {
            if ((v21 & 1) != 0 || [v20 isArchived])
            {
              unsigned __int8 v22 = [v19 isEqual:v9];

              if ((v22 & 1) == 0) {
                goto LABEL_28;
              }
            }
            else
            {
            }
          }
          else
          {
            if (v21)
            {

LABEL_28:
              BOOL v13 = 1;
              goto LABEL_29;
            }
            unsigned __int8 v23 = [v20 isArchived];

            if (v23) {
              goto LABEL_28;
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_29:

    v24 = nr_daemon_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Have paired or waiting for migration devices = %{BOOL}d", buf, 8u);
      }
      goto LABEL_32;
    }
  }
LABEL_33:

  return v13;
}

- (void)_setAppRemovability:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100073108;
  v3[3] = &unk_100167F48;
  v3[4] = a3;
  [&off_100177B98 enumerateObjectsUsingBlock:v3];
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