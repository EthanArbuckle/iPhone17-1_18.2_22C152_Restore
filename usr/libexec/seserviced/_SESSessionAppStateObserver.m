@interface _SESSessionAppStateObserver
+ (id)observerWithDelegate:(id)a3;
- (BOOL)isAppBackgroundedOrSuspended:(id)a3;
- (NSMutableArray)predicates;
- (NSMutableSet)connections;
- (RBSProcessMonitor)monitor;
- (SESSessionAppStateObserverDelegate)delegate;
- (_SESSessionAppStateObserver)initWithDelegate:(id)a3;
- (id)dumpState;
- (void)applicationStateChanged:(id)a3 stateUpdate:(id)a4;
- (void)dealloc;
- (void)registerForAppStateChanges:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setPredicates:(id)a3;
- (void)unregisterForAppStateChanges:(id)a3;
@end

@implementation _SESSessionAppStateObserver

+ (id)observerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[_SESSessionAppStateObserver alloc] initWithDelegate:v3];

  return v4;
}

- (_SESSessionAppStateObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SESSessionAppStateObserver;
  v5 = [(_SESSessionAppStateObserver *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_opt_new();
    connections = v6->_connections;
    v6->_connections = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    predicates = v6->_predicates;
    v6->_predicates = (NSMutableArray *)v9;

    monitor = v6->_monitor;
    v6->_monitor = 0;
  }
  return v6;
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_monitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SESSessionAppStateObserver;
  [(_SESSessionAppStateObserver *)&v3 dealloc];
}

- (void)registerForAppStateChanges:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:&off_10042DE88];

  id v7 = [v4 processIdentifier];
  v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v29 = v7;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = v6;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Register for application state changes PID %d (%@) %@", buf, 0x1Cu);
  }

  uint64_t v9 = self->_connections;
  objc_sync_enter(v9);
  if ([(NSMutableSet *)self->_connections containsObject:v4])
  {
    v10 = SESDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Connection already registered", buf, 2u);
    }
  }
  else
  {
    if (![(NSMutableSet *)self->_connections count])
    {
      v11 = +[RBSProcessMonitor monitor];
      monitor = self->_monitor;
      self->_monitor = v11;

      objc_super v13 = +[RBSProcessStateDescriptor descriptor];
      [v13 setValues:1];
      uint64_t v27 = FBSSceneVisibilityEndowmentNamespace;
      v14 = +[NSArray arrayWithObjects:&v27 count:1];
      [v13 setEndowmentNamespaces:v14];

      v15 = self->_monitor;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100065BDC;
      v24[3] = &unk_10040E028;
      id v16 = v13;
      id v25 = v16;
      v26 = self;
      [(RBSProcessMonitor *)v15 updateConfiguration:v24];
    }
    predicates = self->_predicates;
    v18 = +[RBSProcessIdentifier identifierWithPid:v7];
    v19 = +[RBSProcessPredicate predicateMatchingIdentifier:v18];
    [(NSMutableArray *)predicates addObject:v19];

    v20 = self->_monitor;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100065C84;
    v23[3] = &unk_10040E050;
    v23[4] = self;
    [(RBSProcessMonitor *)v20 updateConfiguration:v23];
    v21 = SESDefaultLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = self->_predicates;
      *(_DWORD *)buf = 138412290;
      *(void *)v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Current predicates %@", buf, 0xCu);
    }

    [(NSMutableSet *)self->_connections addObject:v4];
  }
  objc_sync_exit(v9);
}

- (void)unregisterForAppStateChanges:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:&off_10042DE88];

  id v7 = [v4 processIdentifier];
  v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v20 = v7;
    *(_WORD *)&v20[4] = 2112;
    *(void *)&v20[6] = v6;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unregister for application state changes PID %d (%@) %@", buf, 0x1Cu);
  }

  uint64_t v9 = self->_connections;
  objc_sync_enter(v9);
  if ([(NSMutableSet *)self->_connections containsObject:v4])
  {
    predicates = self->_predicates;
    v11 = +[RBSProcessIdentifier identifierWithPid:v7];
    v12 = +[RBSProcessPredicate predicateMatchingIdentifier:v11];
    [(NSMutableArray *)predicates removeObject:v12];

    monitor = self->_monitor;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100065F5C;
    v18[3] = &unk_10040E050;
    v18[4] = self;
    [(RBSProcessMonitor *)monitor updateConfiguration:v18];
    v14 = SESDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = self->_predicates;
      *(_DWORD *)buf = 138412290;
      *(void *)v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Current predicates %@", buf, 0xCu);
    }

    [(NSMutableSet *)self->_connections removeObject:v4];
    if (![(NSMutableSet *)self->_connections count])
    {
      [(RBSProcessMonitor *)self->_monitor invalidate];
      id v16 = self->_monitor;
      self->_monitor = 0;
    }
  }
  else
  {
    v17 = SESDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Connection not registered", buf, 2u);
    }
  }
  objc_sync_exit(v9);
}

- (void)applicationStateChanged:(id)a3 stateUpdate:(id)a4
{
  id v25 = a3;
  id v26 = a4;
  LODWORD(a4) = [v25 pid];
  v6 = self->_connections;
  objc_sync_enter(v6);
  v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  v35 = sub_100066354;
  v36 = &unk_10040E070;
  unsigned int v27 = a4;
  int v37 = (int)a4;
  id v7 = Filter();
  objc_sync_exit(v6);

  v28 = [v26 state];
  unsigned int v8 = [v28 taskState];
  uint64_t v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v40 = v8;
    __int16 v41 = 2112;
    v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "applicationStateChanged currentTaskState %d state \n%@ ", buf, 0x12u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    uint64_t v13 = FBSSceneVisibilityEndowmentNamespace;
    p_delegate = &self->_delegate;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (v8 != 4)
        {
          if (v8 != 3) {
            continue;
          }
          v17 = SESDefaultLogObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v40 = v27;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "The application with PID %d has been suspended", buf, 8u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          [WeakRetained didAppGetSuspended:v16];
          goto LABEL_21;
        }
        v19 = [v28 endowmentNamespaces];
        unsigned int v20 = [v19 containsObject:v13];

        __int16 v21 = SESDefaultLogObject();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (!v20)
        {
          if (v22)
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v40 = v27;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "The application with PID %d has entered the background", buf, 8u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          [WeakRetained didAppEnterBackground:v16];
          goto LABEL_21;
        }
        if (v22)
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v40 = v27;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "The application with PID %d has entered the foreground", buf, 8u);
        }

        id v23 = objc_loadWeakRetained((id *)p_delegate);
        char v24 = objc_opt_respondsToSelector();

        if (v24)
        {
          id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          [WeakRetained didAppEnterForeground:v16];
LABEL_21:

          continue;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v11);
  }
}

- (BOOL)isAppBackgroundedOrSuspended:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:&off_10042DE88];

  v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking if client is backgrounded or suspended (%@) %@", buf, 0x16u);
  }

  if (v3)
  {
    id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 processIdentifier]);
    id v17 = 0;
    unsigned int v8 = +[RBSProcessHandle handleForIdentifier:v7 error:&v17];
    uint64_t v9 = v17;

    if (v9 || !v8)
    {
      id v10 = SESDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get process handle %@", buf, 0xCu);
      }
    }
    else
    {
      id v10 = [v8 currentState];
      if ([v10 taskState] == 4)
      {
        id v11 = [v10 endowmentNamespaces];
        unsigned __int8 v12 = [v11 containsObject:FBSSceneVisibilityEndowmentNamespace];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = SESDefaultLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v14 = "Client is backgrounded";
LABEL_18:
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else if ([v10 taskState] == 3)
      {
        uint64_t v13 = SESDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v14 = "Client is suspended";
          goto LABEL_18;
        }
LABEL_19:

        BOOL v15 = 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    BOOL v15 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Connection is nil", buf, 2u);
  }
  BOOL v15 = 0;
LABEL_22:

  return v15;
}

- (id)dumpState
{
  id v3 = objc_opt_new();
  uint64_t v13 = self->_connections;
  objc_sync_enter(v13);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_connections;
  id v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v8 = [v7 userInfo];
        uint64_t v9 = [v8 objectForKeyedSubscript:&off_10042DE88];
        id v10 = +[NSString stringWithFormat:@"Connection %p client %@", v7, v9];
        [v3 addObject:v10];
      }
      id v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v13);
  CFStringRef v19 = @"observedConnections";
  __int16 v20 = v3;
  id v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  return v11;
}

- (SESSessionAppStateObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SESSessionAppStateObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RBSProcessMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (NSMutableArray)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end