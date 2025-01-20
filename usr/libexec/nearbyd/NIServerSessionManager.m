@interface NIServerSessionManager
- (BOOL)_registerObserverSessionWithConnection:(id)a3;
- (BOOL)_registerSessionWithConnection:(id)a3;
- (BOOL)isSessionAllowedToActivate:(id)a3;
- (BOOL)registerSessionWithConnection:(id)a3 observerSession:(BOOL)a4;
- (NIServerSessionManager)initWithQueue:(id)a3;
- (id)allSessionsPrintableState;
- (id)updatesQueue;
- (void)_handleObserverSessionXPCDisconnection:(id)a3;
- (void)_handleXPCDisconnection:(id)a3;
- (void)_startObserving:(id)a3;
- (void)_stopObserving:(id)a3;
- (void)enableInternalObserverSession;
- (void)monitoredApp:(int)a3 didChangeState:(int)a4;
- (void)registerObserversForSession:(id)a3;
@end

@implementation NIServerSessionManager

- (NIServerSessionManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NIServerSessionManager;
  v6 = [(NIServerSessionManager *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_sessionsLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_opt_new();
    sessions = v7->_sessions;
    v7->_sessions = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    observerSessions = v7->_observerSessions;
    v7->_observerSessions = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    processMonitors = v7->_processMonitors;
    v7->_processMonitors = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    authManager = v7->_authManager;
    v7->_authManager = (NIPrivacyAuthorizationManager *)v14;

    if (+[NIPlatformInfo isInternalBuild]
      || (+[NSUserDefaults standardUserDefaults],
          v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v16 BOOLForKey:@"EnableStateDump"],
          v16,
          v17))
    {
      v19 = v7;
      os_state_add_handler();
    }
  }

  return v7;
}

- (void)enableInternalObserverSession
{
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nisessmgr,Enabling internal observer session.", v7, 2u);
  }
  if (!self->_recentlyObservedObjectsCache)
  {
    id v5 = objc_alloc_init(NIRecentlyObservedObjectsCache);
    recentlyObservedObjectsCache = self->_recentlyObservedObjectsCache;
    self->_recentlyObservedObjectsCache = v5;
  }
  os_unfair_lock_unlock(p_sessionsLock);
}

- (BOOL)registerSessionWithConnection:(id)a3 observerSession:(BOOL)a4
{
  id v6 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (a4) {
    unsigned __int8 v8 = [(NIServerSessionManager *)self _registerObserverSessionWithConnection:v6];
  }
  else {
    unsigned __int8 v8 = [(NIServerSessionManager *)self _registerSessionWithConnection:v6];
  }
  BOOL v9 = v8;
  os_unfair_lock_unlock(p_sessionsLock);

  return v9;
}

- (BOOL)_registerSessionWithConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  id v5 = [v4 processIdentifier];
  id v6 = sub_100303F7C();
  [v4 setRemoteObjectInterface:v6];

  v7 = sub_100303158();
  [v4 setExportedInterface:v7];

  long long v51 = 0u;
  long long v52 = 0u;
  if (v4) {
    [v4 auditToken];
  }
  unsigned __int8 v8 = (void *)xpc_copy_code_signing_identity_for_token();
  if (v8)
  {
    v28 = +[NSString stringWithCString:v8 encoding:4];
    free(v8);
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = sub_1001B2224;
    v49 = sub_1001B2234;
    id v50 = 0;
    BOOL v9 = [v4 _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3321888768;
    block[2] = sub_1001B223C;
    block[3] = &unk_100856F70;
    v42 = &v45;
    id v10 = v4;
    id v40 = v10;
    int v44 = (int)v5;
    id v26 = v28;
    id v43 = v26;
    v41 = self;
    dispatch_sync(v9, block);

    v11 = +[NSNumber numberWithInt:v5];
    uint64_t v12 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v11];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      uint64_t v14 = objc_opt_new();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessions, "setObject:forKeyedSubscript:", v14, v11, v26);
    }
    v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v11, v26);
    [v15 addObject:v46[5]];

    v16 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v11];
      id v18 = [v17 count];
      *(_DWORD *)buf = 138478595;
      CFStringRef v54 = @"Adding session to ";
      __int16 v55 = 1025;
      int v56 = (int)v5;
      __int16 v57 = 2113;
      CFStringRef v58 = @"pid dict. Current count:";
      __int16 v59 = 2048;
      id v60 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#nisessmgr,%{private}@ %{private}d %{private}@ %lu", buf, 0x26u);
    }
    v19 = [(NSMutableDictionary *)self->_processMonitors objectForKey:v11];
    if (!v19)
    {
      v19 = [[PRAppStateMonitor alloc] initWithPID:v5];
      processMonitors = self->_processMonitors;
      v21 = +[NSNumber numberWithInt:v5];
      [(NSMutableDictionary *)processMonitors setObject:v19 forKey:v21];

      [(PRAppStateMonitor *)v19 addObserver:self];
    }
    objc_initWeak((id *)buf, self);
    v22 = [v10 _queue];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001B2320;
    v35[3] = &unk_100856FA8;
    v38 = &v45;
    v23 = v19;
    v36 = v23;
    v37 = self;
    dispatch_sync(v22, v35);

    [v10 setExportedObject:v46[5]];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001B23A4;
    v32[3] = &unk_100856FD0;
    int v34 = (int)v5;
    objc_copyWeak(&v33, (id *)buf);
    v32[4] = &v45;
    [v10 setInterruptionHandler:v32];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001B2484;
    v29[3] = &unk_100856FD0;
    int v31 = (int)v5;
    objc_copyWeak(&v30, (id *)buf);
    v29[4] = &v45;
    [v10 setInvalidationHandler:v29];
    [v10 resume];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);

    objc_destroyWeak((id *)buf);
    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100417F0C((int)v5, v24);
    }
  }

  return v8 != 0;
}

- (BOOL)_registerObserverSessionWithConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  id v5 = [v4 processIdentifier];
  id v6 = sub_100303F7C();
  [v4 setRemoteObjectInterface:v6];

  v7 = sub_100303158();
  [v4 setExportedInterface:v7];

  long long v39 = 0u;
  long long v40 = 0u;
  if (v4) {
    [v4 auditToken];
  }
  unsigned __int8 v8 = (void *)xpc_copy_code_signing_identity_for_token();
  if (v8)
  {
    id v37 = +[NSString stringWithCString:v8 encoding:4];
    int v38 = (int)v5;
    free(v8);
    BOOL v9 = [[NIServerObservationSession alloc] initWithClientInfo:&v37 connection:v4];
    [v4 setExportedObject:v9];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      [(NIServerSessionManager *)self _startObserving:v9];
      v11 = +[NSNumber numberWithInt:v5];
      uint64_t v12 = [(NSMutableDictionary *)self->_observerSessions objectForKeyedSubscript:v11];
      BOOL v13 = v12 == 0;

      if (v13)
      {
        uint64_t v14 = objc_opt_new();
        [(NSMutableDictionary *)self->_observerSessions setObject:v14 forKeyedSubscript:v11];
      }
      v15 = [(NSMutableDictionary *)self->_observerSessions objectForKeyedSubscript:v11];
      [v15 addObject:v9];

      v16 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v17 = [(NSMutableDictionary *)self->_observerSessions objectForKeyedSubscript:v11];
        id v18 = [v17 count];
        *(_DWORD *)buf = 138478595;
        CFStringRef v42 = @"Adding observer session to ";
        __int16 v43 = 1025;
        int v44 = (int)v5;
        __int16 v45 = 2113;
        CFStringRef v46 = @"pid dict. Current count:";
        __int16 v47 = 2048;
        id v48 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#nisessmgr,%{private}@ %{private}d %{private}@ %lu", buf, 0x26u);
      }
      v19 = [(NSMutableDictionary *)self->_processMonitors objectForKey:v11];
      if (!v19)
      {
        v19 = [[PRAppStateMonitor alloc] initWithPID:v5];
        processMonitors = self->_processMonitors;
        v21 = +[NSNumber numberWithInt:v5];
        [(NSMutableDictionary *)processMonitors setObject:v19 forKey:v21];

        [(PRAppStateMonitor *)v19 addObserver:self];
      }
      objc_initWeak((id *)buf, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1001B2AD0;
      v33[3] = &unk_100846958;
      int v36 = (int)v5;
      objc_copyWeak(&v35, (id *)buf);
      v22 = v9;
      int v34 = v22;
      [v4 setInterruptionHandler:v33];
      id v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472;
      v28 = sub_1001B2BA8;
      v29 = &unk_100846958;
      int v32 = (int)v5;
      objc_copyWeak(&v31, (id *)buf);
      id v30 = v22;
      [v4 setInvalidationHandler:&v26];
      [v4 resume:v26, v27, v28, v29];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v24 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100417F84(v24);
      }
    }
  }
  else
  {
    v23 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100417F0C((int)v5, v23);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_handleXPCDisconnection:(id)a3
{
  id v5 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (!v5)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"NIServerSessionManager.mm", 221, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }
  v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nisessmgr,disconnection for session %{private}@.", buf, 0xCu);
  }
  id v8 = [v5 pid];
  [v5 invalidate];
  sessions = self->_sessions;
  BOOL v10 = +[NSNumber numberWithInt:v8];
  v11 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v10];
  [v11 removeObject:v5];

  uint64_t v12 = self->_sessions;
  BOOL v13 = +[NSNumber numberWithInt:v8];
  uint64_t v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
  BOOL v15 = [v14 count] == 0;

  if (v15)
  {
    v16 = self->_sessions;
    unsigned int v17 = +[NSNumber numberWithInt:v8];
    [(NSMutableDictionary *)v16 removeObjectForKey:v17];
  }
  id v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#nisessmgr,removed session object from retained sessions.", buf, 2u);
  }
  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)_handleObserverSessionXPCDisconnection:(id)a3
{
  id v5 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (!v5)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"NIServerSessionManager.mm", 238, @"Invalid parameter not satisfying: %@", @"observationSession" object file lineNumber description];
  }
  v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nisessmgr,disconnection for observer session %{private}@.", buf, 0xCu);
  }
  [(NIServerSessionManager *)self _stopObserving:v5];
  id v8 = [v5 pid];
  [v5 invalidate];
  observerSessions = self->_observerSessions;
  BOOL v10 = +[NSNumber numberWithInt:v8];
  v11 = [(NSMutableDictionary *)observerSessions objectForKeyedSubscript:v10];
  [v11 removeObject:v5];

  uint64_t v12 = self->_observerSessions;
  BOOL v13 = +[NSNumber numberWithInt:v8];
  uint64_t v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
  BOOL v15 = [v14 count] == 0;

  if (v15)
  {
    v16 = self->_observerSessions;
    unsigned int v17 = +[NSNumber numberWithInt:v8];
    [(NSMutableDictionary *)v16 removeObjectForKey:v17];
  }
  id v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#nisessmgr,removed observer session object from retained sessions.", buf, 2u);
  }
  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_sessionsLock);
  v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_1001DD31C(a4);
    int v15 = 67109378;
    int v16 = v5;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nisessmgr,SessionManager got update for pid: %d state: %@", (uint8_t *)&v15, 0x12u);
  }
  if (a4 == 1)
  {
    processMonitors = self->_processMonitors;
    BOOL v10 = +[NSNumber numberWithInt:v5];
    v11 = [(NSMutableDictionary *)processMonitors objectForKey:v10];

    [v11 invalidate];
    uint64_t v12 = self->_processMonitors;
    BOOL v13 = +[NSNumber numberWithInt:v5];
    [(NSMutableDictionary *)v12 removeObjectForKey:v13];

    uint64_t v14 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#nisessmgr,pid %d is gone. Clearing auth manager state.", (uint8_t *)&v15, 8u);
    }
    [(NIPrivacyAuthorizationManager *)self->_authManager clearStateForPid:v5];
  }
  os_unfair_lock_unlock(&self->_sessionsLock);
}

- (id)updatesQueue
{
  return self->_queue;
}

- (BOOL)isSessionAllowedToActivate:(id)a3
{
  id v4 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (v4)
  {
    id v6 = [v4 pid];
    v7 = +[NSNumber numberWithInt:v6];
    id v8 = [(NSMutableDictionary *)self->_sessions objectForKey:v7];
    id v9 = [v8 count];

    BOOL v10 = qword_1008ABDE0;
    BOOL v11 = (unint64_t)v9 < 0x15;
    if ((unint64_t)v9 >= 0x15)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041804C((int)v6, v10);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138478595;
      CFStringRef v15 = @"Session for pid is allowed to activate";
      __int16 v16 = 1025;
      int v17 = (int)v6;
      __int16 v18 = 2113;
      CFStringRef v19 = @"current count: ";
      __int16 v20 = 2048;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#nisessmgr,%{private}@ %{private}d %{private}@ %lu", (uint8_t *)&v14, 0x26u);
    }
  }
  else
  {
    uint64_t v12 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100417FC8(v12);
    }
    BOOL v11 = 0;
  }
  os_unfair_lock_unlock(p_sessionsLock);

  return v11;
}

- (id)allSessionsPrintableState
{
  v25 = objc_opt_new();
  v24 = objc_opt_new();
  v23 = objc_opt_new();
  id v4 = objc_opt_new();
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  processMonitors = self->_processMonitors;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1001B3B64;
  v37[3] = &unk_100856FF8;
  id v7 = v23;
  id v38 = v7;
  id v8 = v4;
  id v39 = v8;
  [(NSMutableDictionary *)processMonitors enumerateKeysAndObjectsUsingBlock:v37];
  id v9 = [objc_alloc((Class)NSDictionary) initWithDictionary:self->_sessions copyItems:1];
  id v10 = [objc_alloc((Class)NSDictionary) initWithDictionary:self->_observerSessions copyItems:1];

  os_unfair_lock_unlock(p_sessionsLock);
  BOOL v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d clients with sessions", [v9 count]);
  [v25 addObject:v11];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1001B3C78;
  v34[3] = &unk_100857020;
  id v12 = v25;
  id v35 = v12;
  id v13 = v7;
  id v36 = v13;
  [v9 enumerateKeysAndObjectsUsingBlock:v34];
  int v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d clients with observers", [v10 count]);
  [v12 addObject:v14];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001B3DA4;
  v31[3] = &unk_100857020;
  id v15 = v12;
  id v32 = v15;
  id v16 = v13;
  id v33 = v16;
  [v10 enumerateKeysAndObjectsUsingBlock:v31];
  int v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d processes being tracked", [v8 count]);
  [v15 addObject:v17];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001B3ED0;
  v29[3] = &unk_100857070;
  id v18 = v15;
  id v30 = v18;
  [v8 enumerateKeysAndObjectsUsingBlock:v29];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001B3FEC;
  v26[3] = &unk_100857020;
  id v19 = v24;
  id v27 = v19;
  id v20 = v16;
  id v28 = v20;
  [v9 enumerateKeysAndObjectsUsingBlock:v26];

  v40[0] = @"NI Server Summary";
  v40[1] = @"NI Server Details";
  v41[0] = v18;
  v41[1] = v19;
  id v21 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

  return v21;
}

- (void)registerObserversForSession:(id)a3
{
  id v4 = a3;
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  if (self->_recentlyObservedObjectsCache)
  {
    recentlyObservedObjectsCache = self->_recentlyObservedObjectsCache;
    id v6 = +[NSArray arrayWithObjects:&recentlyObservedObjectsCache count:1];
    [v4 addObservers:v6];
  }
  observerSessions = self->_observerSessions;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B45B8;
  v9[3] = &unk_1008570C0;
  id v8 = v4;
  id v10 = v8;
  [(NSMutableDictionary *)observerSessions enumerateKeysAndObjectsUsingBlock:v9];

  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)_startObserving:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  sessions = self->_sessions;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B4684;
  v7[3] = &unk_1008570C0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sessions enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)_stopObserving:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_sessionsLock);
  sessions = self->_sessions;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B48B8;
  v7[3] = &unk_1008570C0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sessions enumerateKeysAndObjectsUsingBlock:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyObservedObjectsCache, 0);
  objc_storeStrong((id *)&self->_observerSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_processMonitors, 0);
  objc_storeStrong((id *)&self->_authManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end