@interface W5DiagnosticsModeStore
- (BOOL)_updateCachedDiagnosticsMode:(id)a3 error:(id)a4;
- (NSMutableSet)diagnostics;
- (W5DiagnosticsModeStore)init;
- (id)_diagnosticsModeFilteredWithPredicate:(id)a3;
- (id)_getCachedDiagnosticsMode:(id)a3;
- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4;
- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4 role:(int64_t)a5;
- (id)diagnosticsModeMatchingUUID:(id)a3;
- (id)diagnosticsModeWithState:(int64_t)a3;
- (void)setDiagnostics:(id)a3;
- (void)updateStoreWithDiagnosticsMode:(id)a3;
@end

@implementation W5DiagnosticsModeStore

- (W5DiagnosticsModeStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)W5DiagnosticsModeStore;
  v2 = [(W5DiagnosticsModeStore *)&v9 init];
  v3 = [(W5DiagnosticsModeStore *)v2 _getCachedDiagnosticsMode:0];
  v4 = v3;
  if (v3)
  {
    v5 = (NSMutableSet *)[v3 mutableCopy];
  }
  else
  {
    v5 = +[NSMutableSet set];
  }
  diagnostics = v2->_diagnostics;
  v2->_diagnostics = v5;

  activeTransaction = v2->_activeTransaction;
  v2->_activeTransaction = 0;

  return v2;
}

- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4 role:(int64_t)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D8C8;
  v12[3] = &unk_1000DD2A8;
  id v13 = a3;
  int64_t v14 = a4;
  int64_t v15 = a5;
  id v8 = v13;
  objc_super v9 = +[NSPredicate predicateWithBlock:v12];
  v10 = [(W5DiagnosticsModeStore *)self _diagnosticsModeFilteredWithPredicate:v9];

  return v10;
}

- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4
{
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10000DB30;
  id v13 = &unk_1000DD2D0;
  id v14 = a3;
  int64_t v15 = a4;
  id v6 = v14;
  v7 = +[NSPredicate predicateWithBlock:&v10];
  id v8 = -[W5DiagnosticsModeStore _diagnosticsModeFilteredWithPredicate:](self, "_diagnosticsModeFilteredWithPredicate:", v7, v10, v11, v12, v13);

  return v8;
}

- (id)diagnosticsModeWithState:(int64_t)a3
{
  return [(W5DiagnosticsModeStore *)self diagnosticsModeMatchingPeerID:0 state:a3];
}

- (id)diagnosticsModeMatchingUUID:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DDA0;
  v9[3] = &unk_1000DD2F8;
  id v10 = a3;
  id v4 = v10;
  v5 = +[NSPredicate predicateWithBlock:v9];
  id v6 = [(W5DiagnosticsModeStore *)self _diagnosticsModeFilteredWithPredicate:v5];

  if (v6)
  {
    v7 = [v6 firstObject];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_diagnosticsModeFilteredWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = [(W5DiagnosticsModeStore *)self diagnostics];

  if (v5)
  {
    id v6 = [(W5DiagnosticsModeStore *)self diagnostics];
    v7 = [v6 allObjects];
    id v8 = [v7 filteredArrayUsingPredicate:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)updateStoreWithDiagnosticsMode:(id)a3
{
  id v4 = (char *)a3;
  if (!v4)
  {
    activeTransaction = sub_10009756C();
    if (os_log_type_enabled(activeTransaction, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315906;
      v30 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      __int16 v31 = 2080;
      v32 = "W5DiagnosticsModeManager.m";
      __int16 v33 = 1024;
      int v34 = 1530;
      __int16 v35 = 2080;
      v36 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_26;
  }
  v5 = [(W5DiagnosticsModeStore *)self diagnostics];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [(W5DiagnosticsModeStore *)self diagnostics];
    [v7 removeObject:v4];
  }
  id v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315906;
    v30 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
    __int16 v31 = 2080;
    v32 = "W5DiagnosticsModeManager.m";
    __int16 v33 = 1024;
    int v34 = 1538;
    __int16 v35 = 2112;
    v36 = v4;
    LODWORD(v26) = 38;
    v25 = &v29;
    _os_log_send_and_compose_impl();
  }

  objc_super v9 = [(W5DiagnosticsModeStore *)self diagnostics];
  [v9 addObject:v4];

  id v10 = [(W5DiagnosticsModeStore *)self diagnostics];
  unsigned __int8 v11 = [(W5DiagnosticsModeStore *)self _updateCachedDiagnosticsMode:v10 error:0];

  if ((v11 & 1) == 0)
  {
    v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136316162;
      v30 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      __int16 v31 = 2080;
      v32 = "W5DiagnosticsModeManager.m";
      __int16 v33 = 1024;
      int v34 = 1543;
      __int16 v35 = 2080;
      v36 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      __int16 v37 = 2114;
      uint64_t v38 = 0;
      LODWORD(v26) = 48;
      v25 = &v29;
      _os_log_send_and_compose_impl();
    }
  }
  if (sub_10000E3CC())
  {
    id v13 = [sub_10000E3CC() sharedAnalyticsProcessor];

    if (v13)
    {
      BOOL v14 = [v4 state] == (id)3;
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      v27[0] = @"date";
      v16 = +[NSDate now];
      v28[0] = v16;
      v27[1] = @"desc";
      v17 = [v4 description];
      v28[1] = v17;
      v27[2] = @"enabled";
      v18 = +[NSNumber numberWithBool:v14];
      v28[2] = v18;
      v27[3] = @"uuid";
      v19 = [v4 uuid];
      v27[4] = @"name";
      v28[3] = v19;
      v28[4] = @"W5DiagnosticsMode";
      v20 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
      [v15 addEntriesFromDictionary:v20];

      v21 = [sub_10000E3CC() sharedAnalyticsProcessor];
      [v21 processWAMessageMetric:@"com.apple.wifi.DiagnosticState" data:v15];
    }
  }
  if (!self->_activeTransaction)
  {
    if ([v4 state] == (id)2
      || [v4 state] == (id)3
      || [v4 state] == (id)4
      || [v4 state] == (id)5
      || [v4 state] == (id)10)
    {
      v23 = (OS_os_transaction *)os_transaction_create();
      v22 = +[W5ActivityManager sharedActivityManager];
      [v22 osTransactionCreate:"diagnosticsModeStateActive" transaction:v23];
      goto LABEL_25;
    }
    if (!self->_activeTransaction) {
      goto LABEL_27;
    }
  }
  if (objc_msgSend(v4, "state", v25, v26) == (id)1 || objc_msgSend(v4, "state") == (id)11)
  {
    v22 = +[W5ActivityManager sharedActivityManager];
    [v22 osTransactionComplete:self->_activeTransaction];
    v23 = 0;
LABEL_25:

    activeTransaction = self->_activeTransaction;
    self->_activeTransaction = v23;
LABEL_26:
  }
LABEL_27:
}

- (id)_getCachedDiagnosticsMode:(id)a3
{
  id v18 = a3;
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"];

  v5 = [v4 objectForKey:@"CachedDiagnosticsMode"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v19 = v18;
  id v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:v5 error:&v19];
  id v14 = v19;

  if (!v13)
  {
    v16 = v4;
    v17 = sub_10009756C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136316418;
      v21 = "-[W5DiagnosticsModeStore _getCachedDiagnosticsMode:]";
      __int16 v22 = 2080;
      v23 = "W5DiagnosticsModeManager.m";
      __int16 v24 = 1024;
      int v25 = 1582;
      __int16 v26 = 2114;
      uint64_t v27 = 0;
      __int16 v28 = 2114;
      int v29 = v5;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_send_and_compose_impl();
    }

    id v4 = v16;
  }

  return v13;
}

- (BOOL)_updateCachedDiagnosticsMode:(id)a3 error:(id)a4
{
  id v4 = (char *)a3;
  v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = [v5 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"];
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

  uint64_t v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136316162;
    id v18 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    __int16 v19 = 2080;
    int v20 = "W5DiagnosticsModeManager.m";
    __int16 v21 = 1024;
    int v22 = 1590;
    __int16 v23 = 2080;
    __int16 v24 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    __int16 v25 = 2114;
    __int16 v26 = v4;
    LODWORD(v15) = 48;
    id v14 = &v17;
    _os_log_send_and_compose_impl();
  }

  if (!v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  id v16 = 0;
  uint64_t v9 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v16];
  uint64_t v10 = (char *)v16;
  if (v9)
  {
    [v7 setObject:v9 forKeyedSubscript:@"CachedDiagnosticsMode"];
LABEL_7:
    uint64_t v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setPersistentDomain:v7 forName:@"com.apple.wifi.diagnosticsMode"];

    v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316162;
      id v18 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
      __int16 v19 = 2080;
      int v20 = "W5DiagnosticsModeManager.m";
      __int16 v21 = 1024;
      int v22 = 1605;
      __int16 v23 = 2080;
      __int16 v24 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
      __int16 v25 = 2114;
      __int16 v26 = v10;
      _os_log_send_and_compose_impl();
    }

    goto LABEL_10;
  }
  uint64_t v9 = sub_10009756C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315906;
    id v18 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    __int16 v19 = 2080;
    int v20 = "W5DiagnosticsModeManager.m";
    __int16 v21 = 1024;
    int v22 = 1599;
    __int16 v23 = 2114;
    __int16 v24 = v10;
    _os_log_send_and_compose_impl();
  }
LABEL_10:

  return v10 == 0;
}

- (NSMutableSet)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);

  objc_storeStrong((id *)&self->_activeTransaction, 0);
}

@end