@interface W5DiagnosticsModeLocalStore
- (BOOL)_updateCachedLocalStore:(id)a3 error:(id)a4;
- (NSMutableDictionary)localDiagnosticsStore;
- (W5DiagnosticsModeLocalStore)init;
- (id)_getCachedLocalStore:(id)a3;
- (id)infoMatchingDiagnosticMode:(id)a3;
- (void)addToStore:(id)a3 newInfo:(id)a4;
- (void)setLocalDiagnosticsStore:(id)a3;
- (void)updateStoreWithInfo:(id)a3 info:(id)a4;
@end

@implementation W5DiagnosticsModeLocalStore

- (W5DiagnosticsModeLocalStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)W5DiagnosticsModeLocalStore;
  v2 = [(W5DiagnosticsModeLocalStore *)&v8 init];
  v3 = [(W5DiagnosticsModeLocalStore *)v2 _getCachedLocalStore:0];
  v4 = v3;
  if (v3) {
    v5 = (NSMutableDictionary *)[v3 mutableCopy];
  }
  else {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  localDiagnosticsStore = v2->_localDiagnosticsStore;
  v2->_localDiagnosticsStore = v5;

  return v2;
}

- (id)_getCachedLocalStore:(id)a3
{
  id v20 = a3;
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"];

  uint64_t v5 = [v4 objectForKey:@"CachedDiagnosticsModeLocalStore"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v12 = (void *)v5;
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, v10, v11, v19, objc_opt_class(), 0);
  id v21 = v20;
  v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v5 error:&v21];
  id v15 = v21;

  if (!v14)
  {
    v17 = v4;
    v18 = sub_10009756C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136316418;
      v23 = "-[W5DiagnosticsModeLocalStore _getCachedLocalStore:]";
      __int16 v24 = 2080;
      v25 = "W5DiagnosticsModeManager.m";
      __int16 v26 = 1024;
      int v27 = 1638;
      __int16 v28 = 2114;
      uint64_t v29 = 0;
      __int16 v30 = 2114;
      v31 = v12;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_send_and_compose_impl();
    }

    v4 = v17;
  }

  return v14;
}

- (id)infoMatchingDiagnosticMode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(W5DiagnosticsModeLocalStore *)self localDiagnosticsStore];
    uint64_t v6 = [v4 uuid];
    uint64_t v7 = [v5 objectForKey:v6];
  }
  else
  {
    uint64_t v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (void)updateStoreWithInfo:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v19 = sub_10009756C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    uint64_t v19 = sub_10009756C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
LABEL_13:
    }
      _os_log_send_and_compose_impl();
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v9 = [(W5DiagnosticsModeLocalStore *)self localDiagnosticsStore];
  uint64_t v10 = [v6 uuid];
  uint64_t v11 = [v9 objectForKey:v10];

  if (v11)
  {
    v12 = [(W5DiagnosticsModeLocalStore *)self localDiagnosticsStore];
    v13 = [v6 uuid];
    [v12 removeObjectForKey:v13];
  }
  v14 = [(W5DiagnosticsModeLocalStore *)self localDiagnosticsStore];
  id v15 = [v6 uuid];
  [v14 setObject:v8 forKey:v15];

  v16 = sub_10009756C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v6 uuid];
    _os_log_send_and_compose_impl();
  }
  v17 = [(W5DiagnosticsModeLocalStore *)self localDiagnosticsStore];
  unsigned __int8 v18 = [(W5DiagnosticsModeLocalStore *)self _updateCachedLocalStore:v17 error:0];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = sub_10009756C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)addToStore:(id)a3 newInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(W5DiagnosticsModeLocalStore *)self localDiagnosticsStore];
  uint64_t v9 = [v6 uuid];
  uint64_t v10 = [v8 objectForKey:v9];

  if (!v10)
  {
    uint64_t v10 = +[NSMutableDictionary dictionary];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F408;
  v12[3] = &unk_1000DD320;
  id v13 = v10;
  id v11 = v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
  [(W5DiagnosticsModeLocalStore *)self updateStoreWithInfo:v6 info:v11];
}

- (BOOL)_updateCachedLocalStore:(id)a3 error:(id)a4
{
  id v4 = (char *)a3;
  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"];
  id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

  uint64_t v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136316162;
    unsigned __int8 v18 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    __int16 v19 = 2080;
    id v20 = "W5DiagnosticsModeManager.m";
    __int16 v21 = 1024;
    int v22 = 1693;
    __int16 v23 = 2080;
    __int16 v24 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    __int16 v25 = 2114;
    __int16 v26 = v4;
    LODWORD(v15) = 48;
    v14 = &v17;
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
    [v7 setObject:v9 forKeyedSubscript:@"CachedDiagnosticsModeLocalStore"];
LABEL_7:
    id v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setPersistentDomain:v7 forName:@"com.apple.wifi.diagnosticsMode"];

    v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316162;
      unsigned __int8 v18 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
      __int16 v19 = 2080;
      id v20 = "W5DiagnosticsModeManager.m";
      __int16 v21 = 1024;
      int v22 = 1708;
      __int16 v23 = 2080;
      __int16 v24 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
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
    unsigned __int8 v18 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    __int16 v19 = 2080;
    id v20 = "W5DiagnosticsModeManager.m";
    __int16 v21 = 1024;
    int v22 = 1702;
    __int16 v23 = 2114;
    __int16 v24 = v10;
    _os_log_send_and_compose_impl();
  }
LABEL_10:

  return v10 == 0;
}

- (NSMutableDictionary)localDiagnosticsStore
{
  return self->_localDiagnosticsStore;
}

- (void)setLocalDiagnosticsStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end