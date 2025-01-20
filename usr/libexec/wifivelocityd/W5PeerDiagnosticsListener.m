@interface W5PeerDiagnosticsListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5DiagnosticsManager)diagnosticsManager;
- (W5PeerDiagnosticsListener)initWithDiagnosticsManager:(id)a3;
- (id)_runDiagnostics:(id)a3 uuid:(id)a4 configuration:(id)a5;
- (int64_t)currentVersion;
- (void)setDiagnosticsManager:(id)a3;
@end

@implementation W5PeerDiagnosticsListener

- (W5PeerDiagnosticsListener)initWithDiagnosticsManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerDiagnosticsListener;
  v6 = [(W5PeerDiagnosticsListener *)&v10 init];
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_diagnosticsManager, a3), !v7->_diagnosticsManager))
  {

    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[W5PeerDiagnosticsListener initWithDiagnosticsManager:]";
      __int16 v13 = 2080;
      v14 = "W5PeerDiagnosticsListener.m";
      __int16 v15 = 1024;
      int v16 = 36;
      _os_log_send_and_compose_impl();
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 version];
    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136316418;
      v22 = "-[W5PeerDiagnosticsListener handleClientRequest:]";
      __int16 v23 = 2080;
      v24 = "W5PeerDiagnosticsListener.m";
      __int16 v25 = 1024;
      int v26 = 45;
      __int16 v27 = 2114;
      id v28 = v4;
      __int16 v29 = 2114;
      v30 = v6;
      __int16 v31 = 2114;
      v32 = v7;
      LODWORD(v20) = 58;
      v19 = &v21;
      _os_log_send_and_compose_impl();
    }

    v9 = objc_alloc_init(W5PeerDiagnosticsResponsePayload);
    objc_super v10 = +[NSNumber numberWithInteger:[(W5PeerDiagnosticsListener *)self currentVersion]];
    [(W5PeerDiagnosticsResponsePayload *)v9 setVersion:v10];

    [(W5PeerDiagnosticsResponsePayload *)v9 setStatus:1];
    int v11 = [v6 tests];
    v12 = [v6 configuration];
    __int16 v13 = [v6 uuid];
    v14 = [(W5PeerDiagnosticsListener *)self _runDiagnostics:v11 uuid:v13 configuration:v12];
    __int16 v15 = [v14 objectForKey:@"testResults"];
    if (v15)
    {
      [(W5PeerDiagnosticsResponsePayload *)v9 setResults:v15];
    }
    else
    {
      int v16 = [v14 objectForKey:@"testError"];
      [(W5PeerDiagnosticsResponsePayload *)v9 setError:v16];
    }
    [v4 handler:v19, v20];
    v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, W5PeerDiagnosticsResponsePayload *, void))v17)[2](v17, v9, 0);
  }
  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class();
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.peerDiagnostics";
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)_runDiagnostics:(id)a3 uuid:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_10001E714;
  v52 = sub_10001E724;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_10001E714;
  v46 = sub_10001E724;
  id v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  id v11 = objc_alloc_init((Class)NSLock);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  __int16 v13 = objc_alloc_init(W5DiagnosticsTestRequestInternal);
  [(W5DiagnosticsTestRequestInternal *)v13 setUuid:v9];
  [(W5DiagnosticsTestRequestInternal *)v13 setTestRequests:v8];
  [(W5DiagnosticsTestRequestInternal *)v13 setConfiguration:v10];
  v14 = [v10 objectForKeyedSubscript:@"IncludeEvents"];
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v13, "setIncludeEvents:", [v14 BOOLValue]);

  id v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  v30 = sub_10001E72C;
  __int16 v31 = &unk_1000DDBB8;
  id v15 = v11;
  id v32 = v15;
  v34 = v40;
  v35 = v38;
  v36 = &v42;
  v37 = &v48;
  int v16 = v12;
  v33 = v16;
  [(W5DiagnosticsTestRequestInternal *)v13 setReply:&v28];
  [(W5DiagnosticsManager *)self->_diagnosticsManager addRequest:v13];
  dispatch_time_t v17 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v16, v17) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v59 = 0x404E000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  if (v43[5])
  {
    v18 = sub_10009756C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v43[5];
      *(_DWORD *)buf = 136315906;
      uint64_t v59 = (uint64_t)"-[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:]";
      __int16 v60 = 2080;
      v61 = "W5PeerDiagnosticsListener.m";
      __int16 v62 = 1024;
      int v63 = 116;
      __int16 v64 = 2114;
      uint64_t v65 = v19;
      LODWORD(v27) = 38;
      int v26 = buf;
      _os_log_send_and_compose_impl();
    }

    uint64_t v20 = v43[5];
    CFStringRef v56 = @"testError";
    uint64_t v57 = v20;
    int v21 = &v56;
    v22 = &v57;
  }
  else
  {
    uint64_t v23 = v49[5];
    CFStringRef v54 = @"testResults";
    uint64_t v55 = v23;
    int v21 = &v54;
    v22 = &v55;
  }
  v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 1, v26, v27, v28, v29, v30, v31);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);

  return v24;
}

- (W5DiagnosticsManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end