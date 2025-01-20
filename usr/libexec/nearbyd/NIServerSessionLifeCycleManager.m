@interface NIServerSessionLifeCycleManager
+ (NIServerSessionLifeCycleManager)new;
- (BOOL)doesClientWantSessionToRun;
- (BOOL)isDiscoveryActive;
- (BOOL)isPositioningSensorActive;
- (BOOL)isSessionInvalidated;
- (BOOL)isTracking;
- (BOOL)isTrackingPeer:(id)a3;
- (BOOL)timeoutOnPeerInactivity;
- (NIServerSessionLifeCycleManager)init;
- (NIServerSessionLifeCycleManager)initWithSessionIdentifier:(id)a3 cycleRate:(duration<long)long updatesQueue:()std:(1000>>)a4 :(id)a5 ratio<1 analyticsManager:(id)a6;
- (NIServerSessionLifeCycleObserver)observer;
- (NSArray)peers;
- (NSUUID)sessionIdentifier;
- (double)maxInactivityAfterTrackingBeganSeconds;
- (double)maxInactivityBeforeTrackingBeganSeconds;
- (id).cxx_construct;
- (void)_printStats;
- (void)_removeAllPeers;
- (void)_removePeer:(id)a3;
- (void)_startMonitoringPeersActivity:(id)a3;
- (void)_watchdogLoop;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)failedToAddPeer;
- (void)failedToRemovePeer;
- (void)invalidateCalled;
- (void)measurementReceivedForToken:(id)a3 contTimestamp:(double)a4;
- (void)pauseCalled;
- (void)peerHangupReceived:(id)a3;
- (void)peerLostCallbackReceived:(id)a3;
- (void)positioningSensorSessionStarted;
- (void)positioningSensorSessionStopped;
- (void)removeObserver:(id)a3;
- (void)runWithConfigurationCalled;
- (void)setClientWantsSessionToRun:(BOOL)a3;
- (void)setDiscoveryActive:(BOOL)a3;
- (void)setMaxInactivityAfterTrackingBeganSeconds:(double)a3;
- (void)setMaxInactivityBeforeTrackingBeganSeconds:(double)a3;
- (void)setPositioningSensorActive:(BOOL)a3;
- (void)setSessionInvalidated:(BOOL)a3;
- (void)setTimeoutOnPeerInactivity:(BOOL)a3;
- (void)setTracking:(BOOL)a3;
- (void)startedDiscoveringPeersWithTokens:(id)a3;
- (void)stoppedDiscoveringAllPeers;
- (void)stoppedDiscoveringPeersWithTokens:(id)a3;
@end

@implementation NIServerSessionLifeCycleManager

- (void)_watchdogLoop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  if (!self->_clientWantsSessionToRun || self->_sessionInvalidated) {
    return;
  }
  v41 = (NSUUID *)objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obj = self->_nearbyObjectsCache;
  id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v67 objects:v78 count:16];
  v4 = &unk_10049F000;
  if (!v3) {
    goto LABEL_51;
  }
  int v42 = 0;
  uint64_t v45 = *(void *)v68;
  v40 = v55;
  do
  {
    v46 = 0;
    id v43 = v3;
    do
    {
      if (*(void *)v68 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = *(void *)(*((void *)&v67 + 1) + 8 * (void)v46);
      v47 = -[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyObjectsCache, "objectForKeyedSubscript:", v5, v40);
      [v47 latestActivityTimestamp];
      double v7 = sub_100006C38() - v6;
      if ([v47 latestActivityType])
      {
        if ([v47 latestActivityType] != 1) {
          goto LABEL_41;
        }
        if ([(NIServerSessionLifeCycleManager *)self timeoutOnPeerInactivity])
        {
          [(NIServerSessionLifeCycleManager *)self maxInactivityAfterTrackingBeganSeconds];
          if (v7 > v8)
          {
            [(NSUUID *)v41 addObject:v5];
            v9 = qword_1008ABDE0;
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
            {
              sessionIdentifier = self->_sessionIdentifier;
              *(_DWORD *)buf = 138412546;
              v75 = sessionIdentifier;
              __int16 v76 = 2112;
              uint64_t v77 = v5;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#lifecycle,(ses id: %@) TRACKING timed out for %@", buf, 0x16u);
            }
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            v11 = self->_observers;
            id v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v57 objects:v72 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v58;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v58 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v57 + 1) + 8 * i);
                  updatesQueue = self->_updatesQueue;
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = sub_10023D0EC;
                  block[3] = &unk_100846588;
                  block[4] = v15;
                  block[5] = v5;
                  dispatch_async((dispatch_queue_t)updatesQueue, block);
                }
                id v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v57 objects:v72 count:16];
              }
              while (v12);
            }

            v4 = (void *)&unk_10049F000;
            id v3 = v43;
            v17 = self->_updatesQueue;
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v55[0] = sub_10023D0F8;
            v55[1] = &unk_100846588;
            v55[2] = self;
            v55[3] = v5;
            v18 = v54;
LABEL_34:
            dispatch_async((dispatch_queue_t)v17, v18);
            goto LABEL_41;
          }
        }
        v30 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
        {
          v31 = self->_sessionIdentifier;
          *(_DWORD *)buf = 138412546;
          v75 = v31;
          __int16 v76 = 2112;
          uint64_t v77 = v5;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "#lifecycle,(ses id: %@) TRACKING active for %@", buf, 0x16u);
        }
        ++v42;
      }
      else
      {
        if ([(NIServerSessionLifeCycleManager *)self timeoutOnPeerInactivity])
        {
          [(NIServerSessionLifeCycleManager *)self maxInactivityBeforeTrackingBeganSeconds];
          if (v7 > v19)
          {
            [(NSUUID *)v41 addObject:v5];
            v20 = qword_1008ABDE0;
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
            {
              v21 = self->_sessionIdentifier;
              *(_DWORD *)buf = 138412546;
              v75 = v21;
              __int16 v76 = 2112;
              uint64_t v77 = v5;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#lifecycle,(ses id: %@) DISCOVERY timed out for %@", buf, 0x16u);
            }
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            v22 = self->_observers;
            id v23 = [(NSHashTable *)v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v64;
              do
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v64 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v63 + 1) + 8 * (void)j);
                  v27 = self->_updatesQueue;
                  v62[0] = _NSConcreteStackBlock;
                  v62[1] = 3221225472;
                  v62[2] = sub_10023D078;
                  v62[3] = &unk_100846588;
                  v62[4] = v26;
                  v62[5] = v5;
                  dispatch_async((dispatch_queue_t)v27, v62);
                }
                id v23 = [(NSHashTable *)v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
              }
              while (v23);
            }

            v4 = (void *)&unk_10049F000;
            id v3 = v43;
            v17 = self->_updatesQueue;
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = sub_10023D084;
            v61[3] = &unk_100846588;
            v61[4] = self;
            v61[5] = v5;
            v18 = v61;
            goto LABEL_34;
          }
        }
        v28 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
        {
          v29 = self->_sessionIdentifier;
          *(_DWORD *)buf = 138412546;
          v75 = v29;
          __int16 v76 = 2112;
          uint64_t v77 = v5;
          _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "#lifecycle,(ses id: %@) DISCOVERY active for %@", buf, 0x16u);
        }
      }
      id v3 = v43;
LABEL_41:

      v46 = (char *)v46 + 1;
    }
    while (v46 != v3);
    id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v67 objects:v78 count:16];
  }
  while (v3);

  if (v42 >= 1)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obj = self->_observers;
    id v32 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v50 objects:v71 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v51;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v51 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v50 + 1) + 8 * (void)k);
          v36 = self->_updatesQueue;
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_10023D160;
          v49[3] = &unk_1008473B0;
          v49[4] = v35;
          dispatch_async((dispatch_queue_t)v36, v49);
        }
        id v32 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v50 objects:v71 count:16];
      }
      while (v32);
    }
LABEL_51:
  }
  if ([(NSUUID *)v41 count])
  {
    v37 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v41;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#lifecycle,Removing tokens from cache: %@", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_nearbyObjectsCache removeObjectsForKeys:v41];
  }
  dispatch_time_t v38 = dispatch_time(0, 1000000 * self->_cycleRate.__rep_);
  watchdogQueue = self->_watchdogQueue;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = v4[446];
  v48[2] = sub_100007598;
  v48[3] = &unk_1008473B0;
  v48[4] = self;
  dispatch_after(v38, (dispatch_queue_t)watchdogQueue, v48);
}

- (NIServerSessionLifeCycleManager)initWithSessionIdentifier:(id)a3 cycleRate:(duration<long)long updatesQueue:()std:(1000>>)a4 :(id)a5 ratio<1 analyticsManager:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_16:
    v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2, self, @"NIServerSessionLifeCycleManager.mm", 65, @"Invalid parameter not satisfying: %@", @"updatesQueue" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  v30 = +[NSAssertionHandler currentHandler];
  [v30 handleFailureInMethod:a2, self, @"NIServerSessionLifeCycleManager.mm", 64, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];

  if (!v13) {
    goto LABEL_16;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_17:
  id v32 = +[NSAssertionHandler currentHandler];
  [v32 handleFailureInMethod:a2, self, @"NIServerSessionLifeCycleManager.mm", 66, @"Invalid parameter not satisfying: %@", @"analyticsManager" object file lineNumber description];

LABEL_4:
  v33.receiver = self;
  v33.super_class = (Class)NIServerSessionLifeCycleManager;
  uint64_t v15 = [(NIServerSessionLifeCycleManager *)&v33 init];
  if (v15)
  {
    uint64_t v16 = +[NSHashTable weakObjectsHashTable];
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v16;

    objc_storeStrong((id *)&v15->_sessionIdentifier, a3);
    v15->_cycleRate = a4;
    objc_storeStrong((id *)&v15->_updatesQueue, a5);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.nearbyd.sessionLifeCycleWatchdog", 0);
    watchdogQueue = v15->_watchdogQueue;
    v15->_watchdogQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = objc_opt_new();
    nearbyObjectsCache = v15->_nearbyObjectsCache;
    v15->_nearbyObjectsCache = (NSMutableDictionary *)v20;

    objc_storeWeak((id *)&v15->_analyticsManager, v14);
    [(NIServerSessionLifeCycleManager *)v15 setTimeoutOnPeerInactivity:1];
    [(NIServerSessionLifeCycleManager *)v15 setMaxInactivityAfterTrackingBeganSeconds:60.0];
    [(NIServerSessionLifeCycleManager *)v15 setMaxInactivityBeforeTrackingBeganSeconds:120.0];
    v22 = +[NSUserDefaults standardUserDefaults];
    [v22 doubleForKey:@"MaxInactivityAfterTrackingBeganSeconds"];
    double v24 = v23;
    [v22 doubleForKey:@"MaxInactivityBeforeTrackingBeganSeconds"];
    double v26 = v25;
    if (v24 > 0.0)
    {
      v27 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#lifecycle,* MaxInactivityAfterTrackingBeganSeconds from default write: %f", buf, 0xCu);
      }
      [(NIServerSessionLifeCycleManager *)v15 setMaxInactivityAfterTrackingBeganSeconds:v24];
    }
    if (v26 > 0.0)
    {
      v28 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#lifecycle,* MaxInactivityBeforeTrackingBeganSeconds from default write: %f", buf, 0xCu);
      }
      [(NIServerSessionLifeCycleManager *)v15 setMaxInactivityBeforeTrackingBeganSeconds:v26];
    }
  }
  return v15;
}

- (void)dealloc
{
  [(NIServerSessionLifeCycleManager *)self _printStats];
  v3.receiver = self;
  v3.super_class = (Class)NIServerSessionLifeCycleManager;
  [(NIServerSessionLifeCycleManager *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  sub_100004950(__p, "addObserver");
  double v8 = __p;
  uint64_t v5 = sub_10023D9A0((uint64_t)&self->_callCounter, (unsigned __int8 *)__p, (uint64_t)&unk_1004BC2F8, (long long **)&v8);
  ++v5[5];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  [(NSHashTable *)self->_observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  sub_100004950(__p, "removeObserver");
  double v8 = __p;
  uint64_t v5 = sub_10023D9A0((uint64_t)&self->_callCounter, (unsigned __int8 *)__p, (uint64_t)&unk_1004BC2F8, (long long **)&v8);
  ++v5[5];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (NSArray)peers
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10023B460;
  v10 = sub_10023B470;
  id v11 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023B478;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)runWithConfigurationCalled
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023B590;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
  id v4 = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023B6DC;
  v5[3] = &unk_1008473B0;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)v4, v5);
}

- (void)pauseCalled
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023B758;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)invalidateCalled
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023B91C;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)failedToAddPeer
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023BAE4;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)failedToRemovePeer
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023BC98;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)startedDiscoveringPeersWithTokens:(id)a3
{
  id v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023BE70;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v7);
}

- (void)stoppedDiscoveringPeersWithTokens:(id)a3
{
  id v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023C05C;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v7);
}

- (void)stoppedDiscoveringAllPeers
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C2A4;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)peerLostCallbackReceived:(id)a3
{
  id v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023C48C;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v7);
}

- (void)positioningSensorSessionStarted
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C684;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)positioningSensorSessionStopped
{
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C844;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)measurementReceivedForToken:(id)a3 contTimestamp:(double)a4
{
  id v6 = a3;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023CA34;
  block[3] = &unk_10085B6E0;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)peerHangupReceived:(id)a3
{
  id v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023CBB0;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v7);
}

- (BOOL)isTrackingPeer:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023CD2C;
  block[3] = &unk_10085B708;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
  LOBYTE(watchdogQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)watchdogQueue;
}

- (void)_startMonitoringPeersActivity:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = v11;
  id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      char v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
        id v9 = +[PRPeerActivityEntry entryWithActivityType:](PRPeerActivityEntry, "entryWithActivityType:", 0, v11);
        id v10 = [[NINearbyObject alloc] initWithToken:v8];
        [v4 addObject:v10];
        [(NSMutableDictionary *)self->_nearbyObjectsCache setObject:v9 forKey:v8];

        char v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_removePeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  [(NSMutableDictionary *)self->_nearbyObjectsCache removeObjectForKey:v4];
}

- (void)_removeAllPeers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  nearbyObjectsCache = self->_nearbyObjectsCache;

  [(NSMutableDictionary *)nearbyObjectsCache removeAllObjects];
}

- (NIServerSessionLifeCycleManager)init
{
}

+ (NIServerSessionLifeCycleManager)new
{
}

- (void)setDiscoveryActive:(BOOL)a3
{
  self->_discoveryActive = a3;
}

- (BOOL)isDiscoveryActive
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023D2B8;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientWantsSessionToRun:(BOOL)a3
{
  self->_clientWantsSessionToRun = a3;
}

- (BOOL)doesClientWantSessionToRun
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023D3A8;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPositioningSensorActive:(BOOL)a3
{
  self->_positioningSensorActive = a3;
}

- (BOOL)isPositioningSensorActive
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023D498;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (BOOL)isTracking
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023D588;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSessionInvalidated:(BOOL)a3
{
  self->_sessionInvalidated = a3;
}

- (BOOL)isSessionInvalidated
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023D678;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_printStats
{
  char v3 = objc_opt_new();
  for (i = &self->_callCounter.__table_.__p1_;
        ;
        objc_msgSend(v3, "appendFormat:", @"%s : %llu times\n", next, i[5].__value_.__next_))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
    next = i + 2;
    if (SHIBYTE(i[4].__value_.__next_) < 0) {
      next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *)next->__value_.__next_;
    }
  }
  uint64_t v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412546;
    char v9 = sessionIdentifier;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#lifecycle,\n============================\nStats for session ID %@\n%@\n============================", buf, 0x16u);
  }
}

- (BOOL)timeoutOnPeerInactivity
{
  return self->timeoutOnPeerInactivity;
}

- (void)setTimeoutOnPeerInactivity:(BOOL)a3
{
  self->timeoutOnPeerInactivity = a3;
}

- (double)maxInactivityAfterTrackingBeganSeconds
{
  return self->maxInactivityAfterTrackingBeganSeconds;
}

- (void)setMaxInactivityAfterTrackingBeganSeconds:(double)a3
{
  self->maxInactivityAfterTrackingBeganSeconds = a3;
}

- (double)maxInactivityBeforeTrackingBeganSeconds
{
  return self->maxInactivityBeforeTrackingBeganSeconds;
}

- (void)setMaxInactivityBeforeTrackingBeganSeconds:(double)a3
{
  self->maxInactivityBeforeTrackingBeganSeconds = a3;
}

- (NIServerSessionLifeCycleObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (NIServerSessionLifeCycleObserver *)WeakRetained;
}

- (NSUUID)sessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_analyticsManager);
  sub_10003AD90((uint64_t)&self->_callCounter);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_updatesQueue, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);

  objc_storeStrong((id *)&self->_nearbyObjectsCache, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end