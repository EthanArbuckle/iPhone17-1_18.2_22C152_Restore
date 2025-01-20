@interface InitialSyncCompletionMonitor
- (BOOL)hasCachedInitialSyncCompletionStateForDevice:(id)a3 state:(BOOL *)a4;
- (InitialSyncCompletionMonitor)init;
- (NSMapTable)observers;
- (NSMutableDictionary)cachedInitialSyncStateByPairingID;
- (NSMutableSet)pendingRequests;
- (PSYInitialSyncStateObserver)initialSyncCompletionObserver;
- (void)dealloc;
- (void)forgetPairingID:(id)a3;
- (void)handleInitialSyncStateForPairingID:(id)a3 hasCompleted:(BOOL)a4 error:(id)a5;
- (void)handleNanoRegistryNotificationDeviceDidUnpair:(id)a3;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3;
- (void)notifyObserversInitialSyncDidCompleteForPairingID:(id)a3;
- (void)registerObserver:(id)a3 device:(id)a4;
- (void)requestInitialSyncStateForPairingID:(id)a3;
- (void)retryPendingRequests;
- (void)setCachedInitialSyncStateByPairingID:(id)a3;
- (void)setInitialSyncCompletionObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)unregisterObserver:(id)a3 device:(id)a4;
@end

@implementation InitialSyncCompletionMonitor

- (InitialSyncCompletionMonitor)init
{
  v25.receiver = self;
  v25.super_class = (Class)InitialSyncCompletionMonitor;
  v20 = [(InitialSyncCompletionMonitor *)&v25 init];
  if (v20)
  {
    v2 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Initializing (%p)", buf, 0xCu);
    }
    uint64_t v3 = objc_opt_new();
    pendingRequests = v20->_pendingRequests;
    v20->_pendingRequests = (NSMutableSet *)v3;

    uint64_t v5 = +[NSMapTable weakToStrongObjectsMapTable];
    observers = v20->_observers;
    v20->_observers = (NSMapTable *)v5;

    uint64_t v7 = objc_opt_new();
    cachedInitialSyncStateByPairingID = v20->_cachedInitialSyncStateByPairingID;
    v20->_cachedInitialSyncStateByPairingID = (NSMutableDictionary *)v7;

    v9 = (PSYInitialSyncStateObserver *)[objc_alloc((Class)PSYInitialSyncStateObserver) initWithDelegate:v20];
    initialSyncCompletionObserver = v20->_initialSyncCompletionObserver;
    v20->_initialSyncCompletionObserver = v9;

    v27[0] = NRPairedDeviceRegistryDeviceDidUnpairNotification;
    v27[1] = NRPairedDeviceRegistryDeviceDidFailToPairNotification;
    +[NSArray arrayWithObjects:v27 count:2];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v15);
          v17 = +[NSNotificationCenter defaultCenter];
          v18 = +[NRPairedDeviceRegistry sharedInstance];
          [v17 addObserver:v20 selector:"handleNanoRegistryNotificationDeviceDidUnpair:" name:v16 object:v18];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }
  }
  return v20;
}

- (void)dealloc
{
  uint64_t v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Deallocating (%p)", buf, 0xCu);
  }
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)InitialSyncCompletionMonitor;
  [(InitialSyncCompletionMonitor *)&v5 dealloc];
}

- (void)registerObserver:(id)a3 device:(id)a4
{
  id v8 = a3;
  v6 = [a4 valueForProperty:NRDevicePropertyPairingID];
  if (v6)
  {
    id v7 = [(NSMapTable *)self->_observers objectForKey:v8];
    if (!v7)
    {
      id v7 = [objc_alloc((Class)NSMutableSet) initWithCapacity:1];
      [(NSMapTable *)self->_observers setObject:v7 forKey:v8];
    }
    [v7 addObject:v6];
    [(InitialSyncCompletionMonitor *)self requestInitialSyncStateForPairingID:v6];
  }
}

- (void)unregisterObserver:(id)a3 device:(id)a4
{
  id v9 = a3;
  v6 = [a4 valueForProperty:NRDevicePropertyPairingID];
  if (v6)
  {
    id v7 = [(NSMapTable *)self->_observers objectForKey:v9];
    id v8 = v7;
    if (v7)
    {
      [v7 removeObject:v6];
      if (![v8 count]) {
        [(NSMapTable *)self->_observers removeObjectForKey:v9];
      }
    }
  }
}

- (void)unregisterObserver:(id)a3
{
}

- (BOOL)hasCachedInitialSyncCompletionStateForDevice:(id)a3 state:(BOOL *)a4
{
  v6 = [a3 valueForProperty:NRDevicePropertyPairingID];
  if (v6
    && ([(NSMutableDictionary *)self->_cachedInitialSyncStateByPairingID objectForKey:v6],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    if (a4) {
      *a4 = [v7 BOOLValue];
    }

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)requestInitialSyncStateForPairingID:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_pendingRequests containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_pendingRequests addObject:v4];
    objc_super v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Requesting initial sync state for pairingID: (%@)", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    initialSyncCompletionObserver = self->_initialSyncCompletionObserver;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000081D8;
    v7[3] = &unk_1000185D8;
    objc_copyWeak(&v9, (id *)buf);
    id v8 = v4;
    [(PSYInitialSyncStateObserver *)initialSyncCompletionObserver requestInitialNonMigrationSyncStateForPairingIdentifier:v8 completion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)handleInitialSyncStateForPairingID:(id)a3 hasCompleted:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109634;
    v13[1] = v6;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Received initial sync state (%d) for pairingID: (%@); error: (%@)",
      (uint8_t *)v13,
      0x1Cu);
  }
  if (!v9)
  {
    [(NSMutableSet *)self->_pendingRequests removeObject:v8];
    cachedInitialSyncStateByPairingID = self->_cachedInitialSyncStateByPairingID;
    id v12 = +[NSNumber numberWithBool:v6];
    [(NSMutableDictionary *)cachedInitialSyncStateByPairingID setObject:v12 forKey:v8];

    if (v6) {
      [(InitialSyncCompletionMonitor *)self notifyObserversInitialSyncDidCompleteForPairingID:v8];
    }
  }
}

- (void)retryPendingRequests
{
  if ([(NSMutableSet *)self->_pendingRequests count])
  {
    uint64_t v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Retrying pending Initial Sync completion requests", buf, 2u);
    }
    id v4 = [(NSMutableSet *)self->_pendingRequests copy];
    [(NSMutableSet *)self->_pendingRequests removeAllObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[InitialSyncCompletionMonitor requestInitialSyncStateForPairingID:](self, "requestInitialSyncStateForPairingID:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)notifyObserversInitialSyncDidCompleteForPairingID:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [(NSMapTable *)self->_observers copy];
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v11 = [(NSMapTable *)self->_observers objectForKey:v10];
        if ([v11 containsObject:v4])
        {
          [v11 removeObject:v4];
          long long v12 = +[NRPairedDeviceRegistry sharedInstance];
          long long v13 = [v12 deviceForPairingID:v4];

          if (v13) {
            [v10 initialSyncDidCompleteForDevice:v13];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  __int16 v14 = +[NSMapTable weakToStrongObjectsMapTable];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = self->_observers;
  id v16 = [(NSMapTable *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
        long long v21 = -[NSMapTable objectForKey:](self->_observers, "objectForKey:", v20, (void)v23);
        if ([v21 count]) {
          [(NSMapTable *)v14 setObject:v21 forKey:v20];
        }
      }
      id v17 = [(NSMapTable *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  observers = self->_observers;
  self->_observers = v14;
}

- (void)forgetPairingID:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_pendingRequests removeObject:v4];
  [(NSMutableDictionary *)self->_cachedInitialSyncStateByPairingID removeObjectForKey:v4];
  id v5 = +[NSMapTable weakToStrongObjectsMapTable];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = -[NSMapTable objectForKey:](self->_observers, "objectForKey:", v11, (void)v14);
        if ([v12 containsObject:v4])
        {
          [v12 removeObject:v4];
          if ([v12 count]) {
            [(NSMapTable *)v5 setObject:v12 forKey:v11];
          }
        }
      }
      id v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  observers = self->_observers;
  self->_observers = v5;
}

- (void)handleNanoRegistryNotificationDeviceDidUnpair:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 name];
    *(_DWORD *)buf = 138412290;
    long long v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Received notification: %@", buf, 0xCu);
  }
  id v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
  long long v10 = [v9 valueForProperty:NRDevicePropertyPairingID];
  if (v10)
  {
    uint64_t v11 = +[MagicSwitchEnabler sharedInstance];
    long long v12 = [v11 workQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    _DWORD v13[2] = sub_100008B18;
    v13[3] = &unk_100018600;
    v13[4] = self;
    id v14 = v10;
    dispatch_async(v12, v13);
  }
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = +[MagicSwitchEnabler sharedInstance];
  uint64_t v9 = [v8 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C44;
  block[3] = &unk_100018628;
  objc_copyWeak(&v13, &location);
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[MagicSwitchEnabler sharedInstance];
  id v6 = [v5 workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008E2C;
  v7[3] = &unk_1000184D0;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (NSMutableDictionary)cachedInitialSyncStateByPairingID
{
  return self->_cachedInitialSyncStateByPairingID;
}

- (void)setCachedInitialSyncStateByPairingID:(id)a3
{
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (PSYInitialSyncStateObserver)initialSyncCompletionObserver
{
  return self->_initialSyncCompletionObserver;
}

- (void)setInitialSyncCompletionObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncCompletionObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedInitialSyncStateByPairingID, 0);

  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end