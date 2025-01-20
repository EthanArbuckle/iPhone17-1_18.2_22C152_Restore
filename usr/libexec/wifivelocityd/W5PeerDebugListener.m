@interface W5PeerDebugListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5DebugManager)debugManager;
- (W5PeerDebugListener)initWithDebugManager:(id)a3;
- (int64_t)currentVersion;
- (void)setDebugManager:(id)a3;
@end

@implementation W5PeerDebugListener

- (W5PeerDebugListener)initWithDebugManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerDebugListener;
  v6 = [(W5PeerDebugListener *)&v10 init];
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_debugManager, a3), !v7->_debugManager))
  {

    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[W5PeerDebugListener initWithDebugManager:]";
      __int16 v13 = 2080;
      v14 = "W5PeerDebugListener.m";
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
  id v6 = [v5 requestType];
  v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 configuration];
    int v35 = 136316674;
    v36 = "-[W5PeerDebugListener handleClientRequest:]";
    __int16 v37 = 2080;
    v38 = "W5PeerDebugListener.m";
    __int16 v39 = 1024;
    int v40 = 46;
    __int16 v41 = 2114;
    id v42 = v4;
    __int16 v43 = 2114;
    v44 = v5;
    __int16 v45 = 2114;
    v46 = v8;
    __int16 v47 = 2050;
    id v48 = [v5 requestType];
    LODWORD(v27) = 68;
    v26 = &v35;
    _os_log_send_and_compose_impl();
  }
  v9 = objc_alloc_init(W5PeerDebugResponsePayload);
  objc_super v10 = +[NSNumber numberWithInteger:[(W5PeerDebugListener *)self currentVersion]];
  [(W5PeerDebugResponsePayload *)v9 setVersion:v10];

  int v11 = [v5 version];
  id v12 = [v11 integerValue];
  int64_t v13 = [(W5PeerDebugListener *)self currentVersion];

  if (v12 != (id)v13)
  {
    [(W5PeerDebugResponsePayload *)v9 setStatus:3];
    NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v30 = @"W5NotSupportedErr";
    id v16 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v17 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:4 userInfo:v16];
LABEL_21:

    goto LABEL_22;
  }
  if (v6 == (id)2)
  {
    id v16 = [v5 configuration];
    if (v16)
    {
      v19 = [(W5PeerDebugListener *)self debugManager];
      [v19 setDebugConfiguration:v16 reply:0];
      v17 = 0;
      uint64_t v20 = 1;
    }
    else
    {
      v23 = sub_10009756C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 136315650;
        v36 = "-[W5PeerDebugListener handleClientRequest:]";
        __int16 v37 = 2080;
        v38 = "W5PeerDebugListener.m";
        __int16 v39 = 1024;
        int v40 = 69;
        LODWORD(v27) = 28;
        v26 = &v35;
        _os_log_send_and_compose_impl();
      }

      NSErrorUserInfoKey v31 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v32 = @"W5ParamErr";
      v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v17 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v19];
      uint64_t v20 = 2;
    }

    [(W5PeerDebugResponsePayload *)v9 setStatus:v20];
    goto LABEL_21;
  }
  if (v6 == (id)1)
  {
    v14 = [(W5PeerDebugListener *)self debugManager];
    id v28 = 0;
    __int16 v15 = [v14 queryDebugConfigurationAndReturnError:&v28];
    id v16 = v28;

    if (v16 || !v15)
    {
      v21 = sub_10009756C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 136315906;
        v36 = "-[W5PeerDebugListener handleClientRequest:]";
        __int16 v37 = 2080;
        v38 = "W5PeerDebugListener.m";
        __int16 v39 = 1024;
        int v40 = 60;
        __int16 v41 = 2114;
        id v42 = v16;
        LODWORD(v27) = 38;
        v26 = &v35;
        _os_log_send_and_compose_impl();
      }

      NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v34 = @"W5ParamErr";
      v22 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v17 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v22];

      uint64_t v18 = 2;
    }
    else
    {
      [(W5PeerDebugResponsePayload *)v9 setConfiguration:v15];
      v17 = 0;
      uint64_t v18 = 1;
    }
    -[W5PeerDebugResponsePayload setStatus:](v9, "setStatus:", v18, v26, v27);

    goto LABEL_21;
  }
  v17 = 0;
LABEL_22:
  [v4 handler:v26, v27];
  v24 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, W5PeerDebugResponsePayload *, void *))v24)[2](v24, v9, v17);

  return 1;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.debugConfiguration";
}

- (int64_t)currentVersion
{
  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class();
}

- (W5DebugManager)debugManager
{
  return self->_debugManager;
}

- (void)setDebugManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end