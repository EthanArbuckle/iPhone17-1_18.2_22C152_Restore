@interface PALSession
- (BOOL)stopTrackingIntervalForAccess:(id)a3;
- (BOOL)stopTrackingIntervalForAccessIdentifier:(id)a3;
- (BOOL)trackIntervalForAccess:(id)a3;
- (BOOL)updateAssetIdentifiersForAccess:(id)a3;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PALSession)initWithServer:(id)a3 targetQueue:(id)a4 connection:(id)a5;
- (void)changeTestingSettings:(PASessionTestingSettings)a3 reply:(id)a4;
- (void)exportToFileHandle:(id)a3 reply:(id)a4;
- (void)finalizeAllAccessIntervalsAndRemoveSession:(BOOL)a3;
- (void)log:(id)a3 reason:(int64_t)a4 reply:(id)a5;
- (void)loggingEnabledWithReply:(id)a3;
- (void)notifyRecentlyStoppedState:(id)a3;
- (void)pruneEventsFromStartTime:(double)a3 toEndTime:(double)a4 reply:(id)a5;
- (void)requestSandboxExtensionForStoreBasePathWithReply:(id)a3;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)stopTrackingAccessIntervalsWithIdentifiers:(id)a3;
- (void)stopTrackingAllAccessIntervals;
@end

@implementation PALSession

- (PALSession)initWithServer:(id)a3 targetQueue:(id)a4 connection:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.privacyaccounting.session", v11, v9);

  [v10 _setQueue:v12];
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100007568;
  v20[3] = &unk_1000188D0;
  objc_copyWeak(&v21, &location);
  [v10 setInterruptionHandler:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000075AC;
  v18[3] = &unk_1000188D0;
  objc_copyWeak(&v19, &location);
  [v10 setInvalidationHandler:v18];
  objc_storeWeak((id *)&self->_server, v8);
  objc_storeWeak((id *)&self->_connection, v10);
  objc_storeStrong((id *)&self->_queue, v12);
  v13 = +[NSMutableDictionary dictionary];
  pendingAccesses = self->_pendingAccesses;
  self->_pendingAccesses = v13;

  v15 = (OS_os_log *)os_log_create("com.apple.PrivacyAccounting", "PALSession");
  log = self->_log;
  self->_log = v15;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return self;
}

- (void)log:(id)a3 reason:(int64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_100007BD4;
  v50[4] = sub_100007BE4;
  id v51 = (id)os_transaction_create();
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100007BEC;
  v47[3] = &unk_1000188F8;
  id v38 = v8;
  v47[4] = self;
  id v48 = v38;
  v49 = v50;
  id v10 = objc_retainBlock(v47);
  id v11 = objc_loadWeakRetained((id *)&self->_connection);
  id v46 = 0;
  unsigned __int8 v12 = [WeakRetained canWriteEvent:v7 forConnection:v11 withError:&v46];
  id v13 = v46;

  if (v12) {
    goto LABEL_14;
  }
  id v14 = v7;
  if (!objc_msgSend(v14, "isMemberOfClass:", objc_opt_class(), v38))
  {
    id v7 = 0;
    goto LABEL_13;
  }
  if (qword_10001F298 != -1) {
    dispatch_once(&qword_10001F298, &stru_100018A58);
  }
  id v15 = v14;
  v16 = (void *)qword_10001F2A0;
  v17 = [v15 tccService];
  LODWORD(v16) = [v16 containsObject:v17];

  if (!v16) {
    goto LABEL_11;
  }
  v18 = [v15 accessor];
  id v19 = [v18 identifierType];

  if ((unint64_t)v19 >= 4)
  {
    if (v19 == (id)4)
    {
      id v7 = v15;
      goto LABEL_12;
    }
LABEL_11:
    id v7 = 0;
    goto LABEL_12;
  }
  v20 = +[PAApplication applicationForCurrentProcess];
  id v7 = [v15 copyWithNewAccessor:v20];

LABEL_12:
LABEL_13:

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A440();
    }
    ((void (*)(void *, void, id))v10[2])(v10, 0, v13);
    v27 = 0;
    goto LABEL_35;
  }
LABEL_14:
  id v21 = objc_msgSend(WeakRetained, "settings", v38);
  unsigned __int8 v22 = [v21 loggingEnabled];

  if (v22)
  {
    v23 = [WeakRetained accessorResolver];
    id v24 = objc_loadWeakRetained((id *)&self->_connection);
    v25 = v24;
    if (v24) {
      [v24 auditToken];
    }
    else {
      memset(v45, 0, sizeof(v45));
    }
    id v44 = v13;
    v27 = [v23 resolveAccessorForAccess:v7 senderAuditToken:v45 withError:&v44];
    id v28 = v44;

    if (v27)
    {
      id v29 = [v27 kind];
      if (v29 == (id)2)
      {
        if (![(PALSession *)self trackIntervalForAccess:v27])
        {
          id v35 = v28;
          id v36 = objc_loadWeakRetained((id *)&self->_server);
          v37 = [v36 log];

          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_10000A3CC();
          }

          v33 = +[NSError errorWithDomain:@"PAErrorDomain" code:3 userInfo:0];
          id v28 = v35;
          ((void (*)(void *, void *, void *))v10[2])(v10, v27, v33);
          goto LABEL_34;
        }
      }
      else if (v29 == (id)3)
      {
        if (![(PALSession *)self stopTrackingIntervalForAccess:v27])
        {
          id v30 = v28;
          id v31 = objc_loadWeakRetained((id *)&self->_server);
          v32 = [v31 log];

          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10000A358();
          }

          v33 = +[NSError errorWithDomain:@"PAErrorDomain" code:4 userInfo:0];
          id v28 = v30;
          ((void (*)(void *, void *, void *))v10[2])(v10, v27, v33);
          goto LABEL_34;
        }
      }
      else if (v29 == (id)4)
      {
        [(PALSession *)self updateAssetIdentifiersForAccess:v27];
      }
      v34 = [WeakRetained queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007CF8;
      block[3] = &unk_100018920;
      id v40 = WeakRetained;
      id v41 = v27;
      v42 = self;
      v43 = v10;
      dispatch_async(v34, block);

      v33 = v40;
LABEL_34:

      id v13 = v28;
      goto LABEL_35;
    }
    ((void (*)(void *, void, id))v10[2])(v10, 0, v28);
    id v13 = v28;
  }
  else
  {
    uint64_t v26 = +[NSError errorWithDomain:@"PAErrorDomain" code:2 userInfo:0];

    ((void (*)(void *, id, uint64_t))v10[2])(v10, v7, v26);
    id v13 = (id)v26;
    v27 = v7;
  }
LABEL_35:

  _Block_object_dispose(v50, 8);
}

- (void)setLoggingEnabled:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v6 = objc_loadWeakRetained((id *)&self->_connection);
  unsigned __int8 v7 = [WeakRetained canToggleLoggingEnabledForConnection:v6];

  if (v7)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = sub_100007BD4;
    v14[4] = sub_100007BE4;
    id v15 = (id)os_transaction_create();
    id v8 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000802C;
    block[3] = &unk_100018948;
    BOOL v13 = a3;
    id v11 = WeakRetained;
    unsigned __int8 v12 = v14;
    dispatch_async(v8, block);

    _Block_object_dispose(v14, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A474();
    }
    id v9 = objc_loadWeakRetained((id *)&self->_connection);
    [v9 invalidate];
  }
}

- (void)loggingEnabledWithReply:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v6 = objc_loadWeakRetained((id *)&self->_connection);
  unsigned __int8 v7 = [WeakRetained canToggleLoggingEnabledForConnection:v6];

  if (v7)
  {
    id v8 = [WeakRetained queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000081B8;
    v9[3] = &unk_100018970;
    id v11 = v4;
    id v10 = WeakRetained;
    dispatch_async(v8, v9);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A4A8();
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)requestSandboxExtensionForStoreBasePathWithReply:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v6 = objc_loadWeakRetained((id *)&self->_connection);
  unsigned __int8 v7 = [WeakRetained canReadEventsForConnection:v6];

  if (v7)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_100007BD4;
    v22[4] = sub_100007BE4;
    id v23 = (id)os_transaction_create();
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = objc_loadWeakRetained((id *)&self->_connection);
    id v9 = v8;
    if (v8)
    {
      [v8 auditToken];
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
    }

    id v11 = [WeakRetained queue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000840C;
    v13[3] = &unk_100018998;
    id v14 = WeakRetained;
    id v12 = v4;
    long long v18 = v20;
    long long v19 = v21;
    id v15 = self;
    id v16 = v12;
    v17 = v22;
    dispatch_async(v11, v13);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A4DC();
    }
    id v10 = objc_loadWeakRetained((id *)&self->_connection);
    [v10 invalidate];
  }
}

- (void)changeTestingSettings:(PASessionTestingSettings)a3 reply:(id)a4
{
  unint64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v9 = objc_loadWeakRetained((id *)&self->_connection);
  unsigned __int8 v10 = [WeakRetained canChangeTestingSettingsForConnection:v9];

  if (v10)
  {
    id v11 = [WeakRetained queue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000088A0;
    v13[3] = &unk_1000189C0;
    int64_t v16 = var0;
    unint64_t v17 = var1;
    id v14 = WeakRetained;
    id v15 = v7;
    dispatch_async(v11, v13);

    id v12 = v14;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT)) {
      sub_10000A5D8();
    }
    id v12 = objc_loadWeakRetained((id *)&self->_connection);
    [v12 invalidate];
  }
}

- (void)exportToFileHandle:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v9 = objc_loadWeakRetained((id *)&self->_connection);
  unsigned __int8 v10 = [WeakRetained canReadEventsForConnection:v9];

  if (v10)
  {
    id v11 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008ACC;
    block[3] = &unk_1000189E8;
    id v14 = WeakRetained;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v11, block);

    id v12 = v14;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A618();
    }
    id v12 = objc_loadWeakRetained((id *)&self->_connection);
    [v12 invalidate];
  }
}

- (BOOL)trackIntervalForAccess:(id)a3
{
  id v4 = a3;
  pendingAccesses = self->_pendingAccesses;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)pendingAccesses objectForKeyedSubscript:v6];

  if (!v7)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_10000A708(log, v4);
    }
    unsigned __int8 v10 = [v4 accessor];
    id v11 = (char *)[v10 identifierType];

    if ((unint64_t)(v11 - 2) < 3)
    {
      id v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_10000A64C(v12, v4);
      }
      goto LABEL_11;
    }
    if (v11 == (char *)1)
    {
      BOOL v13 = [v4 accessor];
      uint64_t v14 = [v13 path];
    }
    else
    {
      if (v11)
      {
LABEL_11:
        id v15 = 0;
        goto LABEL_12;
      }
      BOOL v13 = [v4 accessor];
      uint64_t v14 = [v13 bundleID];
    }
    id v15 = (void *)v14;

    if (v15)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      v32 = [WeakRetained settings];
      v33 = [v32 saltForMetricsReduction];
      id v34 = objc_loadWeakRetained((id *)&self->_server);
      id v35 = [v34 settings];
      BOOL v36 = PALMetricDataReductionTestString(v33, v15, (unint64_t)[v35 intervalMetricDifficulty]);

      if (v36)
      {
        BOOL v21 = 1;
LABEL_19:
        unsigned __int8 v22 = [PALOngoingAccessIntervalState alloc];
        queue = self->_queue;
        id v24 = objc_loadWeakRetained((id *)&self->_server);
        v25 = [v24 accessorResolver];
        uint64_t v26 = [v25 applicationMetadataResolver];
        v27 = [(PALOngoingAccessIntervalState *)v22 initWithAccess:v4 queue:queue applicationMetadataResolver:v26 eligibleForMetricCollection:v21];

        id v28 = self->_pendingAccesses;
        id v29 = [v4 identifier];
        [(NSMutableDictionary *)v28 setObject:v27 forKeyedSubscript:v29];

        BOOL v8 = [(PALSession *)self updateAssetIdentifiersForAccess:v4];
        goto LABEL_20;
      }
    }
LABEL_12:
    if (os_variant_has_internal_content())
    {
      id v16 = objc_loadWeakRetained((id *)&self->_server);
      unint64_t v17 = [v16 accessorResolver];
      long long v18 = [v17 applicationMetadataResolver];
      long long v19 = [v4 accessor];
      long long v20 = [v18 bundleRecordForApplication:v19];

      BOOL v21 = !PABundleRecordIsVisibleApplication() || [v20 developerType] != 3;
    }
    else
    {
      BOOL v21 = 0;
    }
    goto LABEL_19;
  }
  BOOL v8 = 0;
LABEL_20:

  return v8;
}

- (BOOL)updateAssetIdentifiersForAccess:(id)a3
{
  id v4 = a3;
  pendingAccesses = self->_pendingAccesses;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)pendingAccesses objectForKeyedSubscript:v6];

  if (v7)
  {
    BOOL v8 = [v7 assetIdentifierPool];

    if (v8)
    {
      id v9 = [v7 assetIdentifierPool];
      unsigned __int8 v10 = [v4 assetIdentifiers];
      objc_msgSend(v9, "addAssetIdentifiers:accessEventCount:", v10, objc_msgSend(v4, "eventCount"));
    }
    else
    {
      id v9 = [v4 assetIdentifiers];
      objc_msgSend(v7, "recordAccessToAssetIdentifiers:withVisibilityState:accessEventCount:", v9, objc_msgSend(v4, "visibilityState"), objc_msgSend(v4, "eventCount"));
    }
  }
  return 1;
}

- (BOOL)stopTrackingIntervalForAccess:(id)a3
{
  id v4 = [a3 identifier];
  LOBYTE(self) = [(PALSession *)self stopTrackingIntervalForAccessIdentifier:v4];

  return (char)self;
}

- (BOOL)stopTrackingIntervalForAccessIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_pendingAccesses objectForKeyedSubscript:v4];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_10000A7AC();
    }
    [(NSMutableDictionary *)self->_pendingAccesses setObject:0 forKeyedSubscript:v4];
    id v6 = [v5 assetIdentifierPool];
    [v6 drainPool];

    if ([v5 eligibleForMetricCollection])
    {
      id v7 = [v5 access];
      [v5 intervalSinceStart];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      id v9 = [v5 assetIdentifierHashesByVisibilityState];
      id v10 = [v9 count];

      if (v10)
      {
        id v11 = [v5 assetIdentifierHashesByVisibilityState];
        id v12 = [v11 objectForKeyedSubscript:&off_100019918];
        id v24 = [v12 count];

        BOOL v13 = [v5 assetIdentifierHashesByVisibilityState];
        uint64_t v14 = [v13 objectForKeyedSubscript:&off_100019930];
        [v14 count];

        id v15 = [v5 assetIdentifierHashesByVisibilityState];
        id v16 = [v15 objectForKeyedSubscript:&off_100019948];
        [v16 count];
      }
      else
      {
        unint64_t v17 = [v5 eventCountByVisibilityState];
        long long v18 = [v17 objectForKeyedSubscript:&off_100019918];
        id v24 = [v18 integerValue];

        long long v19 = [v5 eventCountByVisibilityState];
        long long v20 = [v19 objectForKeyedSubscript:&off_100019930];
        [v20 integerValue];

        id v15 = [v5 eventCountByVisibilityState];
        id v16 = [v15 objectForKeyedSubscript:&off_100019948];
        [v16 integerValue];
      }

      v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      v27 = sub_10000921C;
      id v28 = &unk_100018A10;
      id v29 = WeakRetained;
      id v30 = v7;
      id v21 = v7;
      id v22 = WeakRetained;
      AnalyticsSendEventLazy();
    }
    -[PALSession notifyRecentlyStoppedState:](self, "notifyRecentlyStoppedState:", v5, v24, v25, v26, v27, v28);
    [v5 invalidate];
  }

  return v5 != 0;
}

- (void)finalizeAllAccessIntervalsAndRemoveSession:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained settings];
    id v8 = [v7 loggingOptions];

    id v9 = [(NSMutableDictionary *)self->_pendingAccesses allValues];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_100007BD4;
    v22[4] = sub_100007BE4;
    id v23 = (id)os_transaction_create();
    id v10 = [v6 queue];
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_100009694;
    id v15 = &unk_100018A38;
    id v16 = v9;
    id v20 = v8;
    BOOL v21 = a3;
    id v17 = v6;
    long long v18 = self;
    long long v19 = v22;
    id v11 = v9;
    dispatch_async(v10, &v12);

    _Block_object_dispose(v22, 8);
  }
  [(PALSession *)self stopTrackingAllAccessIntervals];
}

- (void)stopTrackingAllAccessIntervals
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMutableDictionary *)self->_pendingAccesses allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(PALSession *)self stopTrackingIntervalForAccessIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)stopTrackingAccessIntervalsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v25 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = self->_pendingAccesses;
  id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v32;
    *(void *)&long long v6 = 138412546;
    long long v24 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        long long v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAccesses, "objectForKeyedSubscript:", v10, v24);
        id v12 = [v11 access];
        uint64_t v13 = [v12 identifier];
        unsigned int v14 = [v4 containsObject:v13];

        if (v14)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            id v16 = log;
            id v17 = [v11 access];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
            *(_DWORD *)buf = v24;
            v37 = v17;
            __int16 v38 = 2112;
            id v39 = WeakRetained;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Stopping tracking interval for access=%@ on connection=%@", buf, 0x16u);
          }
          [v25 addObject:v10];
        }
      }
      id v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v25;
  id v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        [(PALSession *)self stopTrackingIntervalForAccessIdentifier:*(void *)(*((void *)&v27 + 1) + 8 * (void)j)];
      }
      id v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }
}

- (void)pruneEventsFromStartTime:(double)a3 toEndTime:(double)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, id))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v10 = objc_loadWeakRetained((id *)&self->_connection);
  id v20 = 0;
  unsigned __int8 v11 = [WeakRetained canPruneEventsForConnection:v10 withError:&v20];
  id v12 = v20;

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A820();
    }
    v8[2](v8, v12);
    id v14 = objc_loadWeakRetained((id *)&self->_connection);
    [v14 invalidate];
    goto LABEL_7;
  }
  if (WeakRetained)
  {
    uint64_t v13 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009D6C;
    block[3] = &unk_1000189C0;
    id v16 = WeakRetained;
    double v18 = a3;
    double v19 = a4;
    id v17 = v8;
    dispatch_async(v13, block);

    id v14 = v16;
LABEL_7:
  }
}

- (void)notifyRecentlyStoppedState:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_29;
  }
  id v5 = [v4 access];
  long long v6 = [v5 accessor];
  id v7 = [v6 identifierType];

  if (v7 == (id)4)
  {
    uint64_t v8 = [v4 access];
    long long v9 = [v8 accessor];
    unsigned __int8 v11 = [v9 assumedIdentity];
    id v12 = [v11 description];
  }
  else
  {
    if (v7 == (id)1)
    {
      uint64_t v8 = [v4 access];
      long long v9 = [v8 accessor];
      uint64_t v10 = [v9 path];
    }
    else
    {
      if (v7)
      {
        id v12 = 0;
        goto LABEL_11;
      }
      uint64_t v8 = [v4 access];
      long long v9 = [v8 accessor];
      uint64_t v10 = [v9 bundleID];
    }
    id v12 = (void *)v10;
  }

LABEL_11:
  uint64_t v13 = [v4 access];
  id v14 = [v13 category];

  if (v12)
  {
    v50 = v14;
    id v15 = +[NSMutableSet set];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v16 = [v4 assetIdentifierHashesByVisibilityState];
    id v17 = [v16 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v52;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v52 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v22 = [v4 assetIdentifierHashesByVisibilityState];
          id v23 = [v22 objectForKeyedSubscript:v21];
          [v15 unionSet:v23];
        }
        id v18 = [v16 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v18);
    }

    id v24 = [v15 count];
    v25 = [v4 assetIdentifierHashesByVisibilityState];
    uint64_t v26 = [v25 objectForKeyedSubscript:&off_100019948];
    id v27 = [v26 count];

    long long v28 = [v4 assetIdentifierHashesByVisibilityState];
    long long v29 = [v28 objectForKeyedSubscript:&off_100019930];
    id v30 = [v29 count];

    long long v31 = [v4 assetIdentifierHashesByVisibilityState];
    long long v32 = [v31 objectForKeyedSubscript:&off_100019918];
    id v33 = [v32 count];

    if (v24)
    {
      if (v24 == (id)1) {
        CFStringRef v34 = &stru_100019400;
      }
      else {
        CFStringRef v34 = @"s";
      }
      [v4 intervalSinceStart];
      CFStringRef v45 = v34;
      id v14 = v50;
      +[NSString stringWithFormat:@"%@ accessed %@ %lu time%@ (%lufg/%lubg/%lu?) over %.2f seconds", v12, v50, v24, v45, v27, v30, v33, v35];
    }
    else
    {
      [v4 intervalSinceStart];
      id v14 = v50;
      +[NSString stringWithFormat:@"%@ accessed %@ for %.2f seconds", v12, v50, v36, v44, v46, v47, v48, v49];
    v37 = };
    if (!self->_userNotificationCenter)
    {
      __int16 v38 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.privacyaccounting.notification"];
      userNotificationCenter = self->_userNotificationCenter;
      self->_userNotificationCenter = v38;
    }
    id v40 = objc_alloc_init((Class)UNMutableNotificationContent);
    [v40 setBody:v37];
    [v40 setTitle:@"Privacy Accounting"];
    [v40 setInterruptionLevel:2];
    id v41 = +[NSUUID UUID];
    v42 = [v41 UUIDString];
    v43 = +[UNNotificationRequest requestWithIdentifier:v42 content:v40 trigger:0];

    [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v43 withCompletionHandler:0];
  }

LABEL_29:
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_pendingAccesses, 0);

  objc_destroyWeak((id *)&self->_server);
}

@end