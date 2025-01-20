@interface EPSagaTransactionRoutingSlip
- (EPRoutingSlip)childRoutingSlip;
- (EPRoutingSlipEntry)parentRoutingSlipEntry;
- (EPServiceRegistry)serviceRegistry;
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancelWithError:(id)a3;
- (void)invalidate;
- (void)routingSlipDidComplete:(id)a3 serviceRegistry:(id)a4;
- (void)routingSlipRequestsArchiving:(id)a3;
- (void)setChildRoutingSlip:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setParentRoutingSlipEntry:(id)a3;
- (void)setServiceRegistry:(id)a3;
@end

@implementation EPSagaTransactionRoutingSlip

- (EPRoutingSlip)childRoutingSlip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
  v3 = [WeakRetained objectForKeyedSubscript:@"routingSlip"];

  return (EPRoutingSlip *)v3;
}

- (void)setChildRoutingSlip:(id)a3
{
  id v4 = a3;
  v7 = [[EPSagaOperandRoutingSlip alloc] initWithChildRoutingSlip:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
  v6 = [WeakRetained operands];
  [v6 setObject:v7 forKeyedSubscript:@"routingSlip"];
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_parentRoutingSlipEntry, v6);
  objc_storeWeak((id *)&self->_serviceRegistry, v7);
  v8 = [v6 objectForKeyedSubscript:@"routingSlip"];
  v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    if (v10)
    {
      v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
        v13 = [WeakRetained shortDescription];
        v14 = [(EPSagaTransactionRoutingSlip *)self childRoutingSlip];
        v15 = [v14 identifier];
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        __int16 v23 = 2114;
        v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionRoutingSlip: Resuming slip entry %{public}@ -> EPRoutingSlip[%{public}@]", buf, 0x16u);
      }
    }
    [v8 setRoutingSlipDelegate:self];
    [(EPSagaTransactionRoutingSlip *)self setChildRoutingSlip:v8];
    [v8 resumeWithServiceRegistry:v7 rollback:0];
  }
  else
  {
    if (v10)
    {
      v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
        v18 = [v17 shortDescription];
        *(_DWORD *)buf = 138543362;
        v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionRoutingSlip: Building routing slip entry for %{public}@", buf, 0xCu);
      }
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000CC600;
    v19[3] = &unk_100169628;
    v19[4] = self;
    id v20 = v7;
    [(EPSagaTransactionRoutingSlip *)self buildRoutingSlipEntries:v6 serviceRegistry:v20 completion:v19];
  }
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_storeWeak((id *)&self->_parentRoutingSlipEntry, v7);
  objc_storeWeak((id *)&self->_serviceRegistry, v6);
  v8 = [v7 objectForKeyedSubscript:@"routingSlip"];

  if (v8)
  {
    v9 = nr_daemon_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
        v13 = [WeakRetained identifier];
        int v15 = 138543362;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionRoutingSlip: Rolling back routing slip entry %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
    [v8 printDescription];
    [v8 setRoutingSlipDelegate:self];
    [(EPSagaTransactionRoutingSlip *)self setChildRoutingSlip:v8];
    [v8 resumeWithServiceRegistry:v6 rollback:1];
  }
  else
  {
    v14 = [(EPSagaTransactionRoutingSlip *)self delegate];
    [v14 transactionDidComplete:self];
  }
}

- (void)invalidate
{
  id v2 = [(EPSagaTransactionRoutingSlip *)self childRoutingSlip];
  [v2 invalidate];
}

- (void)routingSlipDidComplete:(id)a3 serviceRegistry:(id)a4
{
  id v8 = [a3 getLastFirstError];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
    id v6 = [WeakRetained errors];
    [v6 addObject:v8];
  }
  id v7 = [(EPSagaTransactionRoutingSlip *)self delegate];
  [v7 transactionDidComplete:self];
}

- (void)routingSlipRequestsArchiving:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
  [WeakRetained persist];

  id v5 = [(EPSagaTransactionRoutingSlip *)self childRoutingSlip];
  if (v5 == v8)
  {
    id v6 = [v8 state];

    if (v6 == (id)2)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_serviceRegistry);
      [(EPSagaTransactionRoutingSlip *)self routingSlipDidComplete:v8 serviceRegistry:v7];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);
  [v7 persist];
LABEL_6:
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaTransactionRoutingSlip *)self childRoutingSlip];
  id v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(EPSagaTransactionRoutingSlip *)self delegate];
      v11[0] = 67109376;
      v11[1] = v5 != 0;
      __int16 v12 = 1024;
      BOOL v13 = v9 != 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionRoutingSlip: cancelWithError; childRoutingSlip: %{BOOL}d, delegate: %{BOOL}d",
        (uint8_t *)v11,
        0xEu);
    }
  }
  if (v5)
  {
    [v5 cancelWithError:v4];
  }
  else
  {
    BOOL v10 = [(EPSagaTransactionRoutingSlip *)self delegate];
    [v10 transactionDidComplete:self];
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

- (EPRoutingSlipEntry)parentRoutingSlipEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoutingSlipEntry);

  return (EPRoutingSlipEntry *)WeakRetained;
}

- (void)setParentRoutingSlipEntry:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);

  return (EPServiceRegistry *)WeakRetained;
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceRegistry);
  objc_destroyWeak((id *)&self->_parentRoutingSlipEntry);

  objc_destroyWeak((id *)&self->_delegate);
}

@end