@interface EPSagaTransactionPairedSync
+ (id)currentActivityLabel:(id)a3;
- (BOOL)supportsEarlyPairedSync;
- (EPTransactionDelegate)delegate;
- (NRPowerAssertionActivity)syncActiveAssertion;
- (id)registry;
- (id)routingSlipEntry;
- (id)routingSlipEntryPairingIDKey;
- (id)serviceRegistry;
- (id)unpairHelper;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancelWithError:(id)a3;
- (void)deallocatePairedSyncNotifyToken;
- (void)doneWaitingForPairedSync;
- (void)evaluateWhetherToStartSync;
- (void)forceSyncComplete:(id)a3;
- (void)forceSyncCompleteAndFinishTransaction;
- (void)forceSyncStart:(id)a3;
- (void)forceSyncStartAndEndWithError;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3;
- (void)invalidate;
- (void)postSyncCompleteNotification;
- (void)querySyncStateForActiveDevice;
- (void)setDelegate:(id)a3;
- (void)setSyncActiveAssertion:(id)a3;
- (void)syncSessionObserver:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4;
- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4;
- (void)updatePairedSyncNotifyToken:(unint64_t)a3 shouldPost:(BOOL)a4;
@end

@implementation EPSagaTransactionPairedSync

- (id)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  v3 = [WeakRetained serviceFromClass:objc_opt_class()];

  return v3;
}

- (void)invalidate
{
  v2 = self;
  [(EPSagaTransactionPairedSync *)self doneWaitingForPairedSync];
  v2 = (EPSagaTransactionPairedSync *)((char *)v2 + 16);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->super.isa);
  id v5 = [WeakRetained optionalServiceFromClass:objc_opt_class()];

  id v4 = objc_loadWeakRetained((id *)&v2->super.isa);
  [v4 removeService:v5];
}

- (BOOL)supportsEarlyPairedSync
{
  if (![(NSString *)self->_syncType isEqualToString:@"initialSync"]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v4 = [WeakRetained serviceFromClass:objc_opt_class()];

  id v5 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  v6 = [v5 objectForKeyedSubscript:@"nrDeviceIdentifier"];

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100062288;
  v10[3] = &unk_1001677B8;
  id v7 = v6;
  id v11 = v7;
  v12 = &v13;
  [v4 deasyncGrabRegistryWithReadBlock:v10];
  BOOL v8 = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairedSync: cancelWithError: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  unsigned int v8 = [(EPSagaTransactionPairedSync *)self supportsEarlyPairedSync];
  v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109120;
      LODWORD(v20) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairedSync: supportsEarlyPairedSync %d", (uint8_t *)&v19, 8u);
    }
  }
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
    uint64_t v13 = [WeakRetained serviceFromClass:objc_opt_class()];

    if (![v13 syncTrapUIPushed]) {
      goto LABEL_20;
    }
    v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      char v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairedSync: syncTrapUIPushed", (uint8_t *)&v19, 2u);
      }
    }
    if (!v4) {
      goto LABEL_20;
    }
    v17 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
    v18 = [v17 errors];
    [v18 addObject:v4];

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  if (v4)
  {
    uint64_t v13 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
    v17 = [v13 errors];
    [v17 addObject:v4];
    goto LABEL_19;
  }
LABEL_21:
  [(EPSagaTransactionPairedSync *)self cancel];
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [[NRPreferences alloc] initWithDomain:@"com.apple.NanoRegistry"];
  v9 = [(NRPreferences *)v8 objectForKeyedSubscript:@"blockSyncTestMode"];
  if (_NRIsInternalInstall()
    && v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v9 BOOLValue])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
    id v11 = [WeakRetained errors];
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"PairedSync is disabled by the blockSyncTestMode internal preferences";
    v12 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v13 = +[NSError errorWithDomain:@"pairedSyncErrorDomain" code:4 userInfo:v12];
    [v11 addObject:v13];

    id v14 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
    [v14 persist];

    [(EPSagaTransactionPairedSync *)self doneWaitingForPairedSync];
  }
  else
  {
    id v15 = objc_storeWeak((id *)&self->_routingSlipEntry, v6);
    [v6 setTransactionBeganWithThisNR:1];

    objc_storeWeak((id *)&self->_serviceRegistry, v7);
    self->_notifyToken = -1;
    char v16 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
    pairingID = self->_pairingID;
    self->_pairingID = v16;

    v18 = [v6 objectForKeyedSubscript:@"pairedSyncTypeKey"];
    syncType = self->_syncType;
    self->_syncType = v18;

    id v20 = [v6 objectForKeyedSubscript:@"extensiblePairingShouldFilePairingReport"];
    id v21 = [v20 BOOLValue];
    v22 = [(EPSagaTransactionPairedSync *)self unpairHelper];
    [v22 setShouldFilePairingReport:v21];

    id v23 = objc_loadWeakRetained((id *)&self->_serviceRegistry);
    [v23 addService:self];

    [(EPSagaTransactionPairedSync *)self evaluateWhetherToStartSync];
  }
}

- (void)evaluateWhetherToStartSync
{
  if (MKBDeviceUnlockedSinceBoot())
  {
    v3 = [(EPSagaTransactionPairedSync *)self registry];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100062914;
    v5[3] = &unk_1001658B8;
    v5[4] = self;
    [v3 grabRegistryWithReadBlockAsync:v5];
  }
  else
  {
    [(EPSagaTransactionPairedSync *)self updatePairedSyncNotifyToken:1 shouldPost:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
    [WeakRetained persist];

    [(EPSagaTransactionPairedSync *)self doneWaitingForPairedSync];
  }
}

- (void)updatePairedSyncNotifyToken:(unint64_t)a3 shouldPost:(BOOL)a4
{
  BOOL v4 = a4;
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken != -1) {
    goto LABEL_5;
  }
  if (notify_register_check((const char *)[NRPairedDeviceRegistryPairedSyncIsOkayToSyncDarwinNotification UTF8String], p_notifyToken))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
    v9 = [WeakRetained errors];
    BOOL v10 = +[NSError errorWithDomain:@"pairedSyncErrorDomain" code:3 userInfo:0];
    [v9 addObject:v10];

    id v11 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
    [v11 persist];

    [(EPSagaTransactionPairedSync *)self doneWaitingForPairedSync];
  }
  if (*p_notifyToken != -1)
  {
LABEL_5:
    v12 = nr_daemon_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      id v14 = nr_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = "YES";
        if (!a3) {
          id v15 = "NO";
        }
        int v16 = 136315138;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairedSync: sync advice @%s", (uint8_t *)&v16, 0xCu);
      }
    }
    notify_set_state(*p_notifyToken, a3);
    if (v4) {
      notify_post((const char *)[NRPairedDeviceRegistryPairedSyncIsOkayToSyncDarwinNotification UTF8String]);
    }
  }
}

- (void)deallocatePairedSyncNotifyToken
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
}

- (void)doneWaitingForPairedSync
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionPairedSync: doneWaitingForPairedSync", v11, 2u);
    }
  }
  [(EPSagaTransactionPairedSync *)self updatePairedSyncNotifyToken:0 shouldPost:1];
  [(PSYInitialSyncStateObserver *)self->_syncStateObserver setDelegate:0];
  syncStateObserver = self->_syncStateObserver;
  self->_syncStateObserver = 0;

  [(PSYSyncSessionObserver *)self->_syncSessionObserver setDelegate:0];
  syncSessionObserver = self->_syncSessionObserver;
  self->_syncSessionObserver = 0;

  syncActiveAssertion = self->_syncActiveAssertion;
  self->_syncActiveAssertion = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  [WeakRetained removeService:self];

  IDSInitialLocalSyncCompletedForServices();
  [(EPSagaTransactionPairedSync *)self deallocatePairedSyncNotifyToken];
  if (!self->_transactionComplete)
  {
    self->_transactionComplete = 1;
    BOOL v10 = [(EPSagaTransactionPairedSync *)self delegate];
    [v10 transactionDidComplete:self];

    [(EPSagaTransactionPairedSync *)self postSyncCompleteNotification];
  }
}

- (void)querySyncStateForActiveDevice
{
  syncStateObserver = self->_syncStateObserver;
  pairingID = self->_pairingID;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100063414;
  v4[3] = &unk_100165B28;
  v4[4] = self;
  [(PSYInitialSyncStateObserver *)syncStateObserver requestSyncStateForPairingIdentifier:pairingID completion:v4];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  p_routingSlipEntry = &self->_routingSlipEntry;
  id v7 = a4;
  objc_storeWeak((id *)p_routingSlipEntry, a3);
  objc_storeWeak((id *)&self->_serviceRegistry, v7);

  [(EPSagaTransactionPairedSync *)self doneWaitingForPairedSync];
}

- (void)forceSyncStartAndEndWithError
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100063704;
  v2[3] = &unk_100165980;
  v2[4] = self;
  [(EPSagaTransactionPairedSync *)self forceSyncStart:v2];
}

- (void)forceSyncStart:(id)a3
{
  p_serviceRegistry = &self->_serviceRegistry;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serviceRegistry);
  id v6 = [WeakRetained serviceFromClass:objc_opt_class()];

  [v6 xpcFakePairedSyncStartWithCompletion:v4];
}

- (void)forceSyncComplete:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[EPSagaTransactionPairedSync forceSyncComplete:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  v9 = [WeakRetained serviceFromClass:objc_opt_class()];

  [v9 xpcFakePairedSyncIsCompleteWithCompletion:v4];
}

- (void)forceSyncCompleteAndFinishTransaction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100063C88;
  v2[3] = &unk_100165980;
  v2[4] = self;
  [(EPSagaTransactionPairedSync *)self forceSyncStart:v2];
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v7 = [WeakRetained queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100063E98;
  v9[3] = &unk_100165530;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v7 = [WeakRetained queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100063FA8;
  v9[3] = &unk_100165530;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v5 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064098;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

+ (id)currentActivityLabel:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "activityState", (void)v10) == (id)1)
        {
          id v8 = [v7 activityInfo];
          id v4 = [v8 label];

          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v7 = [WeakRetained queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100064294;
  v9[3] = &unk_100165530;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v7 = [WeakRetained queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100064424;
  v9[3] = &unk_100165530;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)syncSessionObserver:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v7 = [WeakRetained queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000645D4;
  v9[3] = &unk_100165530;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)postSyncCompleteNotification
{
  p_syncType = &self->_syncType;
  if ([(NSString *)self->_syncType isEqualToString:@"initialSync"])
  {
    id v3 = (id *)&NRInitialPairedSyncDidCompleteDarwinNotification;
  }
  else if ([(NSString *)*p_syncType isEqualToString:@"reunionSync"])
  {
    id v3 = (id *)&NRReunionPairedSyncDidCompleteDarwinNotification;
  }
  else
  {
    if (![(NSString *)*p_syncType isEqualToString:@"migration"]) {
      goto LABEL_13;
    }
    id v3 = (id *)&NRMigrationPairedSyncDidCompleteDarwinNotification;
  }
  id v4 = *v3;
  if (v4)
  {
    id v5 = v4;
    BOOL v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        long long v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    v9 = v5;
    notify_post((const char *)[v9 UTF8String]);
    goto LABEL_16;
  }
LABEL_13:
  id v10 = nr_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

  if (!v11) {
    return;
  }
  v9 = nr_daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000F9650((uint64_t *)p_syncType, v9);
  }
LABEL_16:
}

- (id)unpairHelper
{
  unpairHelper = self->_unpairHelper;
  if (!unpairHelper)
  {
    id v4 = objc_alloc_init(EPSagaUnpairHelper);
    id v5 = self->_unpairHelper;
    self->_unpairHelper = v4;

    [(EPSagaUnpairHelper *)self->_unpairHelper setDelegate:self];
    unpairHelper = self->_unpairHelper;
  }

  return unpairHelper;
}

- (id)routingSlipEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);

  return WeakRetained;
}

- (id)serviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);

  return WeakRetained;
}

- (id)routingSlipEntryPairingIDKey
{
  return @"nrDeviceIdentifier";
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NRPowerAssertionActivity)syncActiveAssertion
{
  return self->_syncActiveAssertion;
}

- (void)setSyncActiveAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncActiveAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unpairHelper, 0);
  objc_storeStrong((id *)&self->_syncType, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_syncSessionObserver, 0);
  objc_storeStrong((id *)&self->_syncStateObserver, 0);
  objc_destroyWeak((id *)&self->_serviceRegistry);

  objc_destroyWeak((id *)&self->_routingSlipEntry);
}

@end