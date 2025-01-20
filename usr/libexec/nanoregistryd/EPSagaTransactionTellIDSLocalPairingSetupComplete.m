@interface EPSagaTransactionTellIDSLocalPairingSetupComplete
- (EPServiceRegistry)serviceRegistry;
- (EPTransactionDelegate)delegate;
- (id)registry;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)markCompleted;
- (void)setDelegate:(id)a3;
- (void)setServiceRegistry:(id)a3;
@end

@implementation EPSagaTransactionTellIDSLocalPairingSetupComplete

- (id)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  v6 = (EPRoutingSlipEntry *)a3;
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  id v7 = a4;
  routingSlipEntry = self->_routingSlipEntry;
  self->_routingSlipEntry = v6;
  v9 = v6;

  v10 = [(EPRoutingSlipEntry *)v9 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v11 = [(EPSagaTransactionTellIDSLocalPairingSetupComplete *)self registry];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B2264;
  v13[3] = &unk_100165730;
  id v14 = v10;
  v15 = self;
  id v12 = v10;
  [v11 grabRegistryWithReadBlockAsync:v13];
}

- (void)markCompleted
{
  uint64_t v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Marking completed.", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [(EPSagaTransactionTellIDSLocalPairingSetupComplete *)self delegate];
  [v8 transactionDidComplete:self];
}

- (void)cancel
{
  uint64_t v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Canceled.", (uint8_t *)&v8, 0xCu);
    }
  }
  [(EPSagaTransactionTellIDSLocalPairingSetupComplete *)self markCompleted];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Canceled with error : %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if (v4)
  {
    v10 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
    [v10 addObject:v4];
  }
  [(EPSagaTransactionTellIDSLocalPairingSetupComplete *)self markCompleted];
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_routingSlipEntry, 0);
}

@end