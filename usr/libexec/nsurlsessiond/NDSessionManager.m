@interface NDSessionManager
+ (id)restoreOptionsFromArchivePath:(id)a3;
- (BOOL)connection:(id)a3 canUseSharedContainerIdentifier:(id)a4;
- (BOOL)isSpringBoardApp;
- (NDSessionManager)initWithDelegate:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 forPersona:(id)a6 dataSeparatedPath:(id)a7 db:(id)a8;
- (NDSessionManagerDelegate)delegate;
- (NSString)containerPath;
- (NSString)persona;
- (NSXPCConnection)xpcConn;
- (OS_dispatch_queue)queue;
- (id)copyAndSanitizeClientConfiguration:(id)a3;
- (id)downloadDirectoryDataPath;
- (id)getSessionWithIdentifier:(id)a3;
- (id)obliterationCompletion;
- (id)restoreState:(BOOL *)a3;
- (void)archiveTimerFired;
- (void)boost;
- (void)cleanupWithCompletionHandler:(id)a3;
- (void)clientApplicationWasReinstalled;
- (void)createSessionWithConfiguration:(id)a3 clientProxy:(id)a4 cachesDirectory:(id)a5 options:(id)a6 reply:(id)a7;
- (void)dealloc;
- (void)dropBoost;
- (void)getActiveSessionIdentifiersWithReply:(id)a3;
- (void)obliterate;
- (void)obliterateAllSessionsWithReply:(id)a3;
- (void)okayToSendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4;
- (void)releaseAssertionForSession:(id)a3 reply:(id)a4;
- (void)sendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4;
- (void)sessionCompleted:(id)a3 withCompletionHandler:(id)a4;
- (void)setContainerPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSpringBoardApp:(BOOL)a3;
- (void)setObliterationCompletion:(id)a3;
- (void)setPersona:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWorkState;
- (void)setXpcConn:(id)a3;
@end

@implementation NDSessionManager

- (void)archiveTimerFired
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C688;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)boost
{
  v3 = +[NSProcessInfo processInfo];
  v4 = +[NSString stringWithFormat:@"Holding boost for %@", self->_clientBundleID];
  v5 = [v3 beginActivityWithOptions:0x80000000000 reason:v4];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007688;
  block[3] = &unk_1000B63D0;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (BOOL)isSpringBoardApp
{
  return self->_isSpringBoardApp;
}

- (NDSessionManager)initWithDelegate:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 forPersona:(id)a6 dataSeparatedPath:(id)a7 db:(id)a8
{
  id v14 = a3;
  id v37 = a4;
  id v36 = a6;
  id v15 = a7;
  id v16 = a8;
  v40.receiver = self;
  v40.super_class = (Class)NDSessionManager;
  v17 = [(NDSessionManager *)&v40 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v14);
    objc_storeStrong((id *)&v18->_clientBundleID, a4);
    uint64_t v19 = +[NSMutableDictionary dictionary];
    sessions = v18->_sessions;
    v18->_sessions = (NSMutableDictionary *)v19;

    uint64_t v21 = +[NSMutableDictionary dictionary];
    reconnectingProxies = v18->_reconnectingProxies;
    v18->_reconnectingProxies = (NSMutableDictionary *)v21;

    objc_storeStrong((id *)&v18->_persona, a6);
    objc_storeStrong((id *)&v18->_containerPath, a7);
    v23 = +[NDFileUtilities bundleManagerPath:v18->_clientBundleID];
    uint64_t v24 = +[NSURL fileURLWithPath:v23];
    bundleDirectory = v18->_bundleDirectory;
    v18->_bundleDirectory = (NSURL *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.nsurlsessiond.session-manager", v26);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v27;

    objc_storeStrong((id *)&v18->_sessionTasksDB, a8);
    id boost = v18->_boost;
    v18->_id boost = 0;

    v18->_isSpringBoardApp = a5;
    +[NDFileUtilities createDirectoryAtURL:v18->_bundleDirectory];
    dispatch_source_t v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v18->_queue);
    powerlogPeriodicUpdateTimer = v18->_powerlogPeriodicUpdateTimer;
    v18->_powerlogPeriodicUpdateTimer = (OS_dispatch_source *)v30;

    v32 = v18->_powerlogPeriodicUpdateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100027298;
    handler[3] = &unk_1000B6380;
    v39 = v18;
    dispatch_source_set_event_handler(v32, handler);
    v33 = v18->_powerlogPeriodicUpdateTimer;
    dispatch_time_t v34 = dispatch_time(0, 7200000000000);
    dispatch_source_set_timer(v33, v34, 0x68C61714000uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)v18->_powerlogPeriodicUpdateTimer);
  }
  return v18;
}

- (void)createSessionWithConfiguration:(id)a3 clientProxy:(id)a4 cachesDirectory:(id)a5 options:(id)a6 reply:(id)a7
{
  id v11 = a3;
  id v74 = a4;
  id v75 = a6;
  id v76 = a7;
  id v12 = [(NDSessionManager *)self copyAndSanitizeClientConfiguration:v11];
  if (![v11 _supportsAVAssetDownloads]
    || ([v12 _supportsAVAssetDownloads] & 1) != 0)
  {
    v73 = +[NSXPCConnection currentConnection];
    v13 = [v73 _xpcConnection];
    int is_extension = xpc_connection_is_extension();

    if (is_extension)
    {
      id v15 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:self->_clientBundleID error:0];
      unsigned __int8 v16 = sub_100010184(v15);
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
    id v72 = [v75 mutableCopy];
    sessions = self->_sessions;
    v18 = [v12 identifier];
    uint64_t v19 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v18];
    unsigned int v20 = [v19 hasConnectedClient];

    if (v20)
    {
      uint64_t v21 = (id)qword_1000CB148;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_sessions;
        v23 = [v12 identifier];
        uint64_t v24 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:v23];
        v25 = [v24 uuid];
        clientBundleID = self->_clientBundleID;
        dispatch_queue_t v27 = [v12 identifier];
        *(_DWORD *)buf = 138543874;
        v86 = v25;
        __int16 v87 = 2112;
        v88 = clientBundleID;
        __int16 v89 = 2112;
        v90 = v27;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: already has a connected client, returning nil proxy object to client", buf, 0x20u);
      }
      v28 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-996 URL:0];
      CFStringRef v83 = @"kNSURLSessionImmediateInvalidationErrorKey";
      v84 = v28;
      v29 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      (*((void (**)(id, void, void *, void))v76 + 2))(v76, 0, v29, 0);
LABEL_10:

      dispatch_source_t v30 = 0;
      id v31 = 0;
      v32 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v33 = self->_sessions;
    dispatch_time_t v34 = [v12 identifier];
    v35 = [(NSMutableDictionary *)v33 objectForKeyedSubscript:v34];

    if (v35)
    {
      if (((is_extension ^ 1 | v16) & 1) == 0)
      {
        id v36 = self->_sessions;
        id v37 = [v12 identifier];
        v38 = [(NSMutableDictionary *)v36 objectForKeyedSubscript:v37];
        v39 = [v38 sharedContainerIdentifier];
        unsigned __int8 v40 = [(NDSessionManager *)self connection:v73 canUseSharedContainerIdentifier:v39];

        if ((v40 & 1) == 0)
        {
          v63 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Connected client is an extension is attempting to a connect to a session without a valid shared data container", buf, 2u);
          }
          v28 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-995 URL:0];
          CFStringRef v81 = @"kNSURLSessionImmediateInvalidationErrorKey";
          v82 = v28;
          v29 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
          (*((void (**)(id, void, void *, void))v76 + 2))(v76, 0, v29, 0);
          goto LABEL_10;
        }
      }
      v41 = self->_sessions;
      v42 = [v12 identifier];
      id v31 = [(NSMutableDictionary *)v41 objectForKeyedSubscript:v42];

      v43 = (id)qword_1000CB148;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = [v31 uuid];
        v45 = self->_clientBundleID;
        v46 = [v12 identifier];
        *(_DWORD *)buf = 138543874;
        v86 = v44;
        __int16 v87 = 2112;
        v88 = v45;
        __int16 v89 = 2112;
        v90 = v46;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: reconnecting existing session", buf, 0x20u);
      }
      [v31 updateOptions:v75];
      v47 = [v31 getTasksForReconnection];
      v48 = [v31 uuid];
      v49 = [v31 getTLSSessionCachePrefix];
      v79[0] = @"NDBackgroundSessionManagerRestoredStateKeyTasks";
      v79[1] = @"NDBackgroundSessionManagerKeySessionUUID";
      v80[0] = v47;
      v80[1] = v48;
      v79[2] = @"NDBackgroundSessionManagerRestoredStateKeyTLSSessionCachePrefix";
      v80[2] = v49;
      dispatch_source_t v30 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:3];
      reconnectingProxies = self->_reconnectingProxies;
      v51 = [v12 identifier];
      [(NSMutableDictionary *)reconnectingProxies setObject:v74 forKeyedSubscript:v51];

      v52 = [v12 identifier];
      v32 = +[NDFileUtilities sessionPath:v52 forBundleID:self->_clientBundleID];

      int v53 = 0;
    }
    else
    {
      if (((is_extension ^ 1 | v16) & 1) == 0)
      {
        v54 = [v12 sharedContainerIdentifier];

        if (!v54)
        {
          v69 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Connected client is an extension and did not specify a valid shared container identifier", buf, 2u);
          }
          v28 = +[NSURLError _web_errorWithDomain:NSURLErrorDomain code:-995 URL:0];
          CFStringRef v77 = @"kNSURLSessionImmediateInvalidationErrorKey";
          v78 = v28;
          v29 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          (*((void (**)(id, void, void *, void))v76 + 2))(v76, 0, v29, 0);
          goto LABEL_10;
        }
      }
      v55 = (id)qword_1000CB148;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = [v12 identifier];
        v57 = self->_clientBundleID;
        *(_DWORD *)buf = 138412546;
        v86 = v56;
        __int16 v87 = 2112;
        v88 = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Creating session with identifier: %@ for bundle id: %@", buf, 0x16u);
      }
      [v12 _supportsAVAssetDownloads];
      id v31 = [objc_alloc((Class)objc_opt_class()) initWithConfiguration:v12 bundleID:self->_clientBundleID isSpringBoardApp:self->_isSpringBoardApp downloadDirectory:0 options:v72 clientProxy:v74 delegate:self workQueue:self->_queue db:self->_sessionTasksDB];
      v58 = (id)qword_1000CB148;
      v47 = v58;
      if (v31)
      {
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = [v31 uuid];
          v60 = self->_clientBundleID;
          v61 = [v12 identifier];
          *(_DWORD *)buf = 138543874;
          v86 = v59;
          __int16 v87 = 2112;
          v88 = v60;
          __int16 v89 = 2112;
          v90 = v61;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: created successfully", buf, 0x20u);
        }
        v62 = self->_sessions;
        v47 = [v12 identifier];
        [(NSMutableDictionary *)v62 setObject:v31 forKeyedSubscript:v47];
        dispatch_source_t v30 = 0;
        v32 = 0;
        int v53 = 1;
      }
      else
      {
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v70 = [v12 identifier];
          v71 = self->_clientBundleID;
          *(_DWORD *)buf = 138412546;
          v86 = v70;
          __int16 v87 = 2112;
          v88 = v71;
          _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Coudn't create session with identifier: %@ for bundle id: %@", buf, 0x16u);
        }
        dispatch_source_t v30 = 0;
        id v31 = 0;
        int v53 = 0;
        v32 = 0;
      }
    }

    [v31 setXPCConnection:v73];
    v64 = +[Daemon sharedDaemon];
    (*((void (**)(id, id, void *, id))v76 + 2))(v76, v31, v30, [v64 isPrivileged]);

    if (v32)
    {
      v65 = [v32 stringByAppendingPathComponent:@"configuration.plist"];
      v66 = [v32 stringByAppendingPathComponent:@"options.plist"];
      v67 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
      [v67 writeToFile:v65 atomically:1];

      v68 = +[NSKeyedArchiver archivedDataWithRootObject:v72 requiringSecureCoding:1 error:0];
      [v68 writeToFile:v66 atomically:1];
    }
    if (v53) {
      [(NDSessionManager *)self setWorkState];
    }
    goto LABEL_36;
  }
  (*((void (**)(id, void, _UNKNOWN **, void))v76 + 2))(v76, 0, &off_1000B8AA0, 0);
LABEL_37:
}

- (void)setWorkState
{
  BOOL v2 = [(NSMutableDictionary *)self->_sessions count] != 0;

  +[NDFileUtilities setDaemonWorkState:v2];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (id)copyAndSanitizeClientConfiguration:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCConnection currentConnection];
  id v6 = [v4 copy];
  id v7 = [v6 sharedContainerIdentifier];
  if (v7)
  {
    v8 = [v6 sharedContainerIdentifier];
    unsigned __int8 v9 = [(NDSessionManager *)self connection:v5 canUseSharedContainerIdentifier:v8];

    if ((v9 & 1) == 0)
    {
      [v6 setSharedContainerIdentifier:0];
      v10 = (id)qword_1000CB148;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        clientBundleID = self->_clientBundleID;
        id v12 = [v6 sharedContainerIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = clientBundleID;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client %@ tried to specify a shared container that it cannot access: %@", buf, 0x16u);
      }
    }
  }
  v13 = [v6 _sourceApplicationBundleIdentifier];
  if (v13)
  {
    unsigned __int8 v14 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.impersonate");

    if ((v14 & 1) == 0)
    {
      [v6 set_sourceApplicationBundleIdentifier:];
      id v15 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.impersonate";
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  unsigned __int8 v16 = [v6 _sourceApplicationSecondaryIdentifier];
  if (v16)
  {
    unsigned __int8 v17 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.impersonate");

    if ((v17 & 1) == 0)
    {
      [v6 set_sourceApplicationSecondaryIdentifier:0];
      v18 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.impersonate";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Client tried to set _sourceApplicationSecondaryIdentifier but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  uint64_t v19 = [v6 _sourceApplicationAuditTokenData];
  if (v19)
  {
    unsigned __int8 v20 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.impersonate");

    if ((v20 & 1) == 0)
    {
      [v6 set_sourceApplicationAuditTokenData:0];
      uint64_t v21 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.impersonate";
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Client tried to set _sourceApplicationAuditTokenData but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  [v6 set_attributedBundleIdentifier:0];
  if ([v6 _respectsAllowsCellularAccessForDiscretionaryTasks])
  {
    if ((sub_10000BE38(v5, @"com.apple.private.nsurlsession.allow-discretionary-cellular") & 1) == 0)
    {
      [v6 set_respectsAllowsCellularAccessForDiscretionaryTasks:0];
      v22 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.allow-discretionary-cellular";
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Client tried to set _respectsAllowsCellularAccessForDiscretionaryTasks but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  if ([v6 _allowsPowerNapScheduling])
  {
    if ((sub_10000BE38(v5, @"com.apple.private.dark-wake-network-reachability") & 1) == 0)
    {
      [v6 set_allowsPowerNapScheduling:0];
      v23 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.dark-wake-network-reachability";
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Client tried to set _allowsPowerNapScheduling but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  uint64_t v24 = [v6 _connectionPoolName];
  if (v24)
  {
    unsigned __int8 v25 = sub_10000BE38(v5, @"com.apple.private.nsurlsession-allow-override-connection-pool");

    if ((v25 & 1) == 0)
    {
      [v6 set_connectionPoolName:0];
      v26 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession-allow-override-connection-pool";
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Client tried to set _connectionPoolName but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  dispatch_queue_t v27 = [v6 _directoryForDownloadedFiles];
  if (v27)
  {
    v28 = +[Daemon sharedDaemon];
    if ([v28 isPrivileged])
    {
    }
    else
    {
      v29 = [v6 _directoryForDownloadedFiles];
      id v30 = [v5 processIdentifier];
      if (v5) {
        [v5 auditToken];
      }
      else {
        memset(v42, 0, sizeof(v42));
      }
      unsigned __int8 v31 = [v29 _isSafeDirectoryForDownloads:v30 withToken:v42];

      if ((v31 & 1) == 0)
      {
        v32 = (id)qword_1000CB148;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v39 = [v6 _directoryForDownloadedFiles];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Client tried to set _directoryForDownloadedFiles but does not have access to directory %@", buf, 0xCu);
        }
        [v6 set_directoryForDownloadedFiles:];
      }
    }
  }
  if ([v6 _duetPreauthorized])
  {
    if ((sub_10000BE38(v5, @"com.apple.private.nsurlsession.allow-duet-preauthorization") & 1) == 0)
    {
      [v6 set_duetPreauthorized:0];
      v33 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.private.nsurlsession.allow-duet-preauthorization";
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Client tried to set _duetPreauthorized but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  dispatch_time_t v34 = [v6 _maximumWatchCellularTransferSize];
  if (v34)
  {
    unsigned __int8 v35 = sub_10000BE38(v5, @"com.apple.private.nsurlsession.set-max-watch-cell-transfer-size");

    if ((v35 & 1) == 0)
    {
      [v6 set_maximumWatchCellularTransferSize:0];
      id v36 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Client tried to set _maximumWatchCellularTransferSize but is missing the necessary entitlement", buf, 2u);
      }
    }
  }
  if ((sub_10000BE38(v5, @"get-task-allow") & 1) != 0
    || (sub_10000BE38(v5, @"com.apple.security.get-task-allow") & 1) != 0
    || os_variant_allows_internal_security_policies())
  {
    id v37 = [v5 processIdentifier];
  }
  else
  {
    id v37 = 0;
  }
  [v6 set_pidForHAR:v37];
  long long v40 = 0u;
  long long v41 = 0u;
  if (v5) {
    [v5 auditToken:v40, v41];
  }
  *(void *)buf = 0;
  *(_OWORD *)&buf[16] = 0u;
  uint64_t v44 = 0;
  *(void *)&buf[8] = &v40;
  [v6 set_neTrackerTCCResult:ne_tracker_check_tcc()];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_obliterationCompletion, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_xpcConn);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionTasksDB, 0);
  objc_storeStrong((id *)&self->_powerlogPeriodicUpdateTimer, 0);
  objc_storeStrong(&self->_boost, 0);
  objc_storeStrong((id *)&self->_bundleDirectory, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_reconnectingProxies, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

- (void)setObliterationCompletion:(id)a3
{
}

- (id)obliterationCompletion
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setContainerPath:(id)a3
{
}

- (NSString)containerPath
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPersona:(id)a3
{
}

- (NSString)persona
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIsSpringBoardApp:(BOOL)a3
{
  self->_isSpringBoardApp = a3;
}

- (void)setDelegate:(id)a3
{
}

- (NDSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDSessionManagerDelegate *)WeakRetained;
}

- (void)setXpcConn:(id)a3
{
}

- (NSXPCConnection)xpcConn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConn);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (void)obliterate
{
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138412290;
    v8 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Obliterating session manager for bundle ID: %@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000258BC;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clientApplicationWasReinstalled
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002594C;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)getSessionWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:a3];

  return v3;
}

- (void)sessionCompleted:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  sessions = self->_sessions;
  unsigned __int8 v9 = [v6 identifier];
  id v10 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v9];

  if (v10 != v6)
  {
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v11 = (id)qword_1000CB148;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 uuid];
    v13 = [v6 clientBundleID];
    unsigned __int8 v14 = [v6 identifier];
    int v17 = 138543874;
    v18 = v12;
    __int16 v19 = 2112;
    unsigned __int8 v20 = v13;
    __int16 v21 = 2112;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: removing session", (uint8_t *)&v17, 0x20u);
  }
  id v15 = self->_sessions;
  unsigned __int8 v16 = [v6 identifier];
  [(NSMutableDictionary *)v15 removeObjectForKey:v16];

  if (![(NSMutableDictionary *)self->_sessions count])
  {
    [(NDSessionManager *)self cleanupWithCompletionHandler:v7];
    goto LABEL_11;
  }
  if (v7)
  {
    [(NDSessionManager *)self setWorkState];
LABEL_9:
    v7[2](v7);
  }
LABEL_11:
}

- (void)cleanupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  +[NDFileUtilities removeItemAtURL:self->_bundleDirectory];
  [(NDSessionManager *)self dropBoost];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  clientBundleID = self->_clientBundleID;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025CB0;
  v8[3] = &unk_1000B52F0;
  id v7 = v4;
  v8[4] = self;
  id v9 = v7;
  [WeakRetained managerBecameEmpty:self bundleID:clientBundleID withCompletionHandler:v8];
}

- (void)obliterateAllSessionsWithReply:(id)a3
{
  id v4 = a3;
  v5 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    int v7 = 138412290;
    v8 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "obliterateAllSessions for bundleID %@", (uint8_t *)&v7, 0xCu);
  }
  if ([(NSMutableDictionary *)self->_sessions count])
  {
    [(NDSessionManager *)self setObliterationCompletion:v4];
    [(NSMutableDictionary *)self->_sessions enumerateKeysAndObjectsUsingBlock:&stru_1000B52C8];
  }
  else
  {
    [(NDSessionManager *)self cleanupWithCompletionHandler:v4];
  }
}

- (void)getActiveSessionIdentifiersWithReply:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  id v4 = [(NSMutableDictionary *)self->_sessions allKeys];
  v5[2](v5, v4);

  if (![(NSMutableDictionary *)self->_sessions count]) {
    [(NDSessionManager *)self cleanupWithCompletionHandler:0];
  }
}

- (void)okayToSendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  v8 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v6];
  id v9 = qword_1000CB148;
  if (v8)
  {
    id v10 = (id)qword_1000CB148;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 uuid];
      id v12 = [v8 clientBundleID];
      v13 = [v8 identifier];
      int v14 = 138543874;
      id v15 = v11;
      __int16 v16 = 2112;
      int v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: notified it is OK to send pending callbacks", (uint8_t *)&v14, 0x20u);
    }
    [v8 allowReconnect];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Signalled that it is okay to send pending callbacks for session %@ that we have no record of. This shouldn't happen", (uint8_t *)&v14, 0xCu);
  }
  v7[2](v7);
}

- (void)releaseAssertionForSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  v8 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "releaseAssertionForSession: %@", (uint8_t *)&v10, 0xCu);
  }
  id v9 = +[NDSpringBoard sharedSpringBoard];
  [v9 releaseAssertionForBundleID:self->_clientBundleID sessionID:v6];

  v7[2](v7);
}

- (void)sendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v6];
  id v9 = qword_1000CB148;
  if (v8)
  {
    int v10 = (id)qword_1000CB148;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 uuid];
      id v12 = [v8 clientBundleID];
      v13 = [v8 identifier];
      *(_DWORD *)buf = 138543874;
      id v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: instructed to send pending callbacks", buf, 0x20u);
    }
    int v14 = [(NSMutableDictionary *)self->_reconnectingProxies objectForKeyedSubscript:v6];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000264F4;
    v16[3] = &unk_1000B5EC0;
    id v17 = v7;
    [v8 reconnectClient:v14 withCompletion:v16];

    id v15 = +[NDChronoKitLauncher sharedLauncher];
    [v15 removePendingLaunchForBundleID:self->_clientBundleID sessionID:v6];

    [(NSMutableDictionary *)self->_reconnectingProxies removeObjectForKey:v6];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Asked to send pending callbacks for session %@ that we have no record of. This shouldn't happen", buf, 0xCu);
  }
}

- (BOOL)connection:(id)a3 canUseSharedContainerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [v6 valueForEntitlement:@"com.apple.security.application-groups"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 containsObject:v7])
    {
      BOOL v9 = 1;
    }
    else
    {
      int v10 = qword_1000CB148;
      BOOL v9 = 0;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
      {
        clientBundleID = self->_clientBundleID;
        int v13 = 138412802;
        id v14 = v7;
        __int16 v15 = 2112;
        __int16 v16 = clientBundleID;
        __int16 v17 = 1024;
        int v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client specified shared container identifier %@. %@ can access: %d", (uint8_t *)&v13, 0x1Cu);
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)dropBoost
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000266F0;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)restoreState:(BOOL *)a3
{
  id v4 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138412290;
    double v73 = *(double *)&clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restoreState: %@", buf, 0xCu);
  }
  v64 = +[NSFileManager defaultManager];
  id obj = [(NDTaskStorageDB *)self->_sessionTasksDB _getAllSessionIDsForBundle:self->_clientBundleID];
  if ((unint64_t)[obj count] >= 0x401)
  {
    id v6 = (id)qword_1000CB148;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v52 = self->_clientBundleID;
      int v53 = (NSString *)[obj count];
      *(_DWORD *)buf = 138543618;
      double v73 = *(double *)&v52;
      __int16 v74 = 2048;
      id v75 = v53;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Too many sessions for app <%{public}@> (%zu > 1024)", buf, 0x16u);
    }

    uint64_t v7 = [obj subarrayWithRange:0, 1024];

    id obj = (id)v7;
  }
  id v55 = +[NSMutableArray array];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obja = obj;
  id v8 = [obja countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v8)
  {
    uint64_t v63 = *(void *)v69;
    do
    {
      BOOL v9 = 0;
      id v65 = v8;
      do
      {
        if (*(void *)v69 != v63) {
          objc_enumerationMutation(obja);
        }
        int v10 = *(NSString **)(*((void *)&v68 + 1) + 8 * (void)v9);
        id v12 = +[NDFileUtilities sessionPath:v10 forBundleID:self->_clientBundleID];
        char v67 = 0;
        unsigned int v13 = [v64 fileExistsAtPath:v12 isDirectory:&v67];
        if (v67) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = 0;
        }
        if (v14 != 1)
        {
          v32 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
          {
            v33 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v73 = *(double *)&v33;
            __int16 v74 = 2112;
            id v75 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "No directory for bundleID: %@, sessionID: %@", buf, 0x16u);
          }
          goto LABEL_33;
        }
        v62 = [v12 stringByAppendingPathComponent:@"configuration.plist"];
        __int16 v15 = sub_10000FB54((uint64_t)NSKeyedUnarchiver, v62);
        __int16 v16 = v15;
        if (!v15
          || ([v15 identifier],
              __int16 v17 = objc_claimAutoreleasedReturnValue(),
              unsigned int v18 = [v17 isEqualToString:v10],
              v17,
              !v18))
        {
          dispatch_time_t v34 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
          {
            v42 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v73 = *(double *)&v42;
            __int16 v74 = 2112;
            id v75 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Missing or invalid configuration.plist for bundleID: %@, sessionID: %@. Removing session directory", buf, 0x16u);
          }
          +[NDFileUtilities removeItemAtPath:v12];

          goto LABEL_33;
        }
        [v16 _supportsAVAssetDownloads];
        id v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = [v12 stringByAppendingPathComponent:@"options.plist"];
        v59 = +[NDSessionManager restoreOptionsFromArchivePath:v20];
        v57 = (void *)v20;
        __int16 v21 = [v59 objectForKeyedSubscript:@"NSURLSessionLastDisconnectDateKey"];
        if (!v21) {
          goto LABEL_21;
        }
        v58 = v21;
        [v21 timeIntervalSinceNow];
        if (v22 < -31536000.0)
        {

LABEL_21:
          v58 = 0;
          int v23 = 1;
          goto LABEL_22;
        }
        [v58 timeIntervalSinceNow];
        if (v38 <= -2592000.0)
        {
          long long v40 = (id)qword_1000CB148;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            [v58 timeIntervalSinceNow];
            double v46 = v45;
            v47 = [v16 identifier];
            v48 = self->_clientBundleID;
            *(_DWORD *)buf = 134218498;
            double v73 = -v46;
            __int16 v74 = 2112;
            id v75 = v47;
            __int16 v76 = 2112;
            CFStringRef v77 = v48;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Ignoring stale session (inactive for %fs) with identifier: %@ for bundle id: %@", buf, 0x20u);
          }
LABEL_47:
          long long v41 = (id)qword_1000CB148;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            double v43 = [v16 identifier];
            uint64_t v44 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v73 = v43;
            __int16 v74 = 2112;
            id v75 = v44;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Coudn't restore session with identifier: %@ for bundle id: %@", buf, 0x16u);
          }
          +[NDFileUtilities removeItemAtPath:v12];

LABEL_33:
          if ([(NSString *)self->_clientBundleID isEqualToString:@"com.apple.OTACrashCopier"])
          {
            unsigned __int8 v35 = qword_1000CB148;
            if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
            {
              id v36 = self->_clientBundleID;
              *(_DWORD *)buf = 138412546;
              double v73 = *(double *)&v36;
              __int16 v74 = 2112;
              id v75 = v10;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Launching application %@ since we could not restore session %@", buf, 0x16u);
            }
            id v37 = +[NDApplication applicationWithIdentifier:self->_clientBundleID];
            [v37 wakeForSessionIdentifier:v10 withSessionUUID:0 wakeRequirement:2];
          }
          goto LABEL_37;
        }
        int v23 = 0;
LABEL_22:
        id v24 = [[v19 alloc] initWithConfiguration:v16 bundleID:self->_clientBundleID isSpringBoardApp:self->_isSpringBoardApp downloadDirectory:0 options:v59 clientProxy:0 delegate:self workQueue:self->_queue db:self->_sessionTasksDB];
        if (v23)
        {
          id v25 = [v59 mutableCopy];
          v26 = +[NSDate now];
          [v25 setObject:v26 forKeyedSubscript:@"NSURLSessionLastDisconnectDateKey"];

          dispatch_queue_t v27 = +[NSKeyedArchiver archivedDataWithRootObject:v25 requiringSecureCoding:1 error:0];
          [v27 writeToFile:v57 atomically:1];
        }
        if (!v24) {
          goto LABEL_47;
        }
        unsigned __int8 v66 = 0;
        v56 = [v24 restoreTasks:&v66];
        int v28 = v66;
        if (v66)
        {
          v29 = (id)qword_1000CB148;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            double v30 = [v16 identifier];
            unsigned __int8 v31 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            double v73 = v30;
            __int16 v74 = 2112;
            id v75 = v31;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Not restoring session with identifier: %@ for bundleID: %@ since it does not have any tasks", buf, 0x16u);
          }
        }
        else
        {
          [v55 addObjectsFromArray:v56];
          sessions = self->_sessions;
          v29 = [v24 identifier];
          [(NSMutableDictionary *)sessions setObject:v24 forKeyedSubscript:v29];
        }

        if (v28) {
          goto LABEL_33;
        }
LABEL_37:

        BOOL v9 = (char *)v9 + 1;
      }
      while (v65 != v9);
      id v8 = [obja countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v8);
  }

  id v49 = [(NSMutableDictionary *)self->_sessions count];
  BOOL v50 = v49 == 0;
  if (!v49) {
    +[NDFileUtilities removeItemAtURL:self->_bundleDirectory];
  }
  if (a3) {
    *a3 = v50;
  }
  [(NDSessionManager *)self setWorkState];

  return v55;
}

- (id)downloadDirectoryDataPath
{
  BOOL v2 = [(NSURL *)self->_bundleDirectory URLByAppendingPathComponent:@"downloadDirectoryPath.plist"];
  v3 = [v2 path];

  return v3;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_powerlogPeriodicUpdateTimer);
  v3.receiver = self;
  v3.super_class = (Class)NDSessionManager;
  [(NDSessionManager *)&v3 dealloc];
}

+ (id)restoreOptionsFromArchivePath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = sub_10000FB54((uint64_t)NSKeyedUnarchiver, v3);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_5:
      id v6 = 0;
    }
  }

  return v6;
}

@end