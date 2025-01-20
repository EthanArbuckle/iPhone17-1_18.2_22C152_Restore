@interface W5FaultEventManager
- (W5DiagnosticsModeManager)diagnosticsModeManager;
- (W5FaultEventManager)initWithPeerManager:(id)a3 diagnosticsModeManager:(id)a4;
- (W5Peer)localPeer;
- (W5PeerGenericRequestListener)listener;
- (W5PeerManager)peerManager;
- (id)faultEventCache;
- (id)faultEventHandler;
- (void)__addFaultEvent:(id)a3;
- (void)__archiveEventCache;
- (void)__archiveNotifyPeers;
- (void)__purgeObsoleteFaultEvents;
- (void)__unarchiveEventCache;
- (void)__unarchiveNotifyPeers;
- (void)invalidate;
- (void)notifyPeersWithFaultEvent:(id)a3 info:(id)a4;
- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4;
- (void)setDiagnosticsModeManager:(id)a3;
- (void)setFaultEventHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocalPeer:(id)a3;
- (void)setPeerManager:(id)a3;
- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)submitFaultEvent:(id)a3;
@end

@implementation W5FaultEventManager

- (W5FaultEventManager)initWithPeerManager:(id)a3 diagnosticsModeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)W5FaultEventManager;
  v9 = [(W5FaultEventManager *)&v20 init];
  v10 = v9;
  if (v9
    && (objc_storeStrong((id *)&v9->_peerManager, a3), v10->_peerManager)
    && (objc_storeStrong((id *)&v10->_diagnosticsModeManager, a4), v10->_diagnosticsModeManager)
    && (v11 = objc_alloc_init(W5PeerGenericRequestListener),
        listener = v10->_listener,
        v10->_listener = v11,
        listener,
        (v13 = v10->_listener) != 0))
  {
    [(W5PeerGenericRequestListener *)v13 setIdentifier:@"com.apple.wifi.peer.faults"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100088518;
    v17[3] = &unk_1000DF2E0;
    v18 = v10;
    v14 = v18;
    v19 = v14;
    [(W5PeerGenericRequestListener *)v10->_listener setRequestHandler:v17];

    v15 = v18;
  }
  else
  {

    v15 = sub_10009756C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[W5FaultEventManager initWithPeerManager:diagnosticsModeManager:]";
      __int16 v23 = 2080;
      v24 = "W5FaultEventManager.m";
      __int16 v25 = 1024;
      int v26 = 164;
      _os_log_send_and_compose_impl();
    }
    v14 = 0;
  }

  return v14;
}

- (void)invalidate
{
}

- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  v9 = objc_alloc_init(W5PeerGenericRequest);
  [(W5PeerGenericRequest *)v9 setIdentifier:@"com.apple.wifi.peer.faults"];
  [(W5PeerGenericRequest *)v9 setPeer:v6];
  [(W5PeerGenericRequest *)v9 setDiscoveryFlags:1];
  -[W5PeerGenericRequest setControlFlags:](v9, "setControlFlags:", [v6 controlFlags]);
  v10 = +[NSMutableDictionary dictionary];
  [v10 setObject:&off_1000EB9B0 forKeyedSubscript:@"Type"];
  v11 = [(W5FaultEventManager *)v8 localPeer];
  [v10 setObject:v11 forKeyedSubscript:@"RequestPeer"];

  [v10 setObject:v6 forKeyedSubscript:@"ResponsePeer"];
  [(W5PeerGenericRequest *)v9 setRequestInfo:v10];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100088DEC;
  v15[3] = &unk_1000DF308;
  v15[4] = v8;
  id v12 = v6;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  [(W5PeerGenericRequest *)v9 setResponseHandler:v15];
  id v14 = [(W5PeerManager *)v8->_peerManager sendRequest:v9];

  objc_sync_exit(v8);
}

- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  [(NSCountedSet *)v8->_monitoringPeers removeObject:v6];
  if (![(NSCountedSet *)v8->_monitoringPeers countForObject:v6])
  {
    v9 = objc_alloc_init(W5PeerGenericRequest);
    [(W5PeerGenericRequest *)v9 setIdentifier:@"com.apple.wifi.peer.faults"];
    [(W5PeerGenericRequest *)v9 setPeer:v6];
    [(W5PeerGenericRequest *)v9 setDiscoveryFlags:1];
    -[W5PeerGenericRequest setControlFlags:](v9, "setControlFlags:", [v6 controlFlags]);
    v10 = +[NSMutableDictionary dictionary];
    [v10 setObject:&off_1000EB9C8 forKeyedSubscript:@"Type"];
    v11 = [(W5FaultEventManager *)v8 localPeer];
    [v10 setObject:v11 forKeyedSubscript:@"RequestPeer"];

    [v10 setObject:v6 forKeyedSubscript:@"ResponsePeer"];
    [(W5PeerGenericRequest *)v9 setRequestInfo:v10];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000890B8;
    v13[3] = &unk_1000DF330;
    id v14 = v7;
    [(W5PeerGenericRequest *)v9 setResponseHandler:v13];
    id v12 = [(W5PeerManager *)v8->_peerManager sendRequest:v9];
  }
  objc_sync_exit(v8);
}

- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(W5PeerGenericRequest);
  [(W5PeerGenericRequest *)v8 setIdentifier:@"com.apple.wifi.peer.faults"];
  [(W5PeerGenericRequest *)v8 setPeer:v7];
  [(W5PeerGenericRequest *)v8 setDiscoveryFlags:1];
  -[W5PeerGenericRequest setControlFlags:](v8, "setControlFlags:", [v7 controlFlags]);
  v9 = +[NSMutableDictionary dictionary];
  [v9 setObject:&off_1000EB9E0 forKeyedSubscript:@"Type"];
  v10 = [(W5FaultEventManager *)self localPeer];
  [v9 setObject:v10 forKeyedSubscript:@"RequestPeer"];

  [v9 setObject:v7 forKeyedSubscript:@"ResponsePeer"];
  [(W5PeerGenericRequest *)v8 setRequestInfo:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100089264;
  v13[3] = &unk_1000DF330;
  id v14 = v6;
  id v11 = v6;
  [(W5PeerGenericRequest *)v8 setResponseHandler:v13];
  id v12 = [(W5PeerManager *)self->_peerManager sendRequest:v8];
}

- (void)__archiveNotifyPeers
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"];
  v5 = [v4 URLByAppendingPathComponent:@"FaultEventNotifyPeers"];

  id v6 = [(NSMutableSet *)self->_notifyPeers copy];
  id v12 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v12];
  id v8 = v12;

  if (!v7)
  {
    v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v8;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }

  id v11 = 0;
  unsigned __int8 v9 = [v7 writeToURL:v5 options:1 error:&v11];
  id v8 = v11;
  if ((v9 & 1) == 0)
  {
    v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v8;
LABEL_7:
      _os_log_send_and_compose_impl();
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)__unarchiveNotifyPeers
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"];
  v5 = [v4 URLByAppendingPathComponent:@"FaultEventNotifyPeers"];

  id v6 = [objc_alloc((Class)NSData) initWithContentsOfURL:v5];
  if ([v6 length])
  {
    uint64_t v7 = objc_opt_class();
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    id v12 = 0;
    unsigned __int8 v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v6 error:&v12];
    id v10 = v12;

    if (v9)
    {
      [(NSMutableSet *)self->_notifyPeers unionSet:v9];
    }
    else
    {
      id v11 = sub_10009756C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v10;
        _os_log_send_and_compose_impl();
      }
    }
  }
}

- (void)__archiveEventCache
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"];
  v5 = [v4 URLByAppendingPathComponent:@"FaultEventCache"];

  id v6 = [(NSMutableOrderedSet *)self->_faultEventCache copy];
  id v12 = 0;
  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v12];
  id v8 = v12;

  if (!v7)
  {
    id v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v8;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }

  id v11 = 0;
  unsigned __int8 v9 = [v7 writeToURL:v5 options:1 error:&v11];
  id v8 = v11;
  if ((v9 & 1) == 0)
  {
    id v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v8;
LABEL_7:
      _os_log_send_and_compose_impl();
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)__unarchiveEventCache
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"];
  v5 = [v4 URLByAppendingPathComponent:@"FaultEventCache"];

  id v6 = [objc_alloc((Class)NSData) initWithContentsOfURL:v5];
  if ([v6 length])
  {
    uint64_t v7 = objc_opt_class();
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    id v13 = 0;
    unsigned __int8 v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v6 error:&v13];
    id v10 = v13;

    if (v9)
    {
      faultEventCache = self->_faultEventCache;
      id v12 = [v9 set];
      [(NSMutableOrderedSet *)faultEventCache unionSet:v12];
    }
    else
    {
      id v12 = sub_10009756C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v10;
        _os_log_send_and_compose_impl();
      }
    }
  }
}

- (void)__purgeObsoleteFaultEvents
{
  v2 = [(NSMutableOrderedSet *)self->_faultEventCache array];
  id v3 = [v2 mutableCopy];

  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  int v21 = +[NSSortDescriptor sortDescriptorWithKey:0 ascending:0 comparator:&stru_1000DF370];
  v24 = v21;
  id v6 = +[NSArray arrayWithObjects:&v24 count:1];
  [v3 sortUsingDescriptors:v6];

  uint64_t v7 = +[NSMutableIndexSet indexSet];
  id v8 = +[NSCountedSet set];
  if ([v3 count])
  {
    unint64_t v9 = 0;
    __int16 v23 = v7;
    do
    {
      id v10 = [v3 objectAtIndexedSubscript:v9];
      [v10 timestamp];
      if (v5 - v11 <= 86400.0)
      {
        id v12 = [v10 peer];
        id v13 = [v12 peerID];
        int v14 = [v10 info];
        [v14 objectForKeyedSubscript:@"FaultType"];
        id v16 = v15 = v8;
        id v17 = +[NSString stringWithFormat:@"%@/%@", v13, v16];

        id v8 = v15;
        id v18 = [v15 countForObject:v17];
        if (v18 && ((unint64_t v19 = (unint64_t)v18, [v10 timestamp], v5 - v20 > 3600.0) || v19 >= 0xA))
        {
          uint64_t v7 = v23;
          [v23 addIndex:v9];
        }
        else
        {
          [v15 addObject:v17];
          uint64_t v7 = v23;
        }
      }
      else
      {
        [v7 addIndex:v9];
      }

      ++v9;
    }
    while (v9 < (unint64_t)[v3 count]);
  }
  if ([v7 count]) {
    [v3 removeObjectsAtIndexes:v7];
  }
  if ((unint64_t)[v3 count] >= 0x65) {
    [v3 removeObjectsInRange:100, (char *)[v3 count] - 100];
  }
  [(NSMutableOrderedSet *)self->_faultEventCache removeAllObjects];
  [(NSMutableOrderedSet *)self->_faultEventCache addObjectsFromArray:v3];
}

- (void)__addFaultEvent:(id)a3
{
  id v4 = a3;
  faultEventCache = self->_faultEventCache;
  id v8 = v4;
  if (!faultEventCache)
  {
    id v6 = +[NSMutableOrderedSet orderedSet];
    uint64_t v7 = self->_faultEventCache;
    self->_faultEventCache = v6;

    [(W5FaultEventManager *)self __unarchiveEventCache];
    id v4 = v8;
    faultEventCache = self->_faultEventCache;
  }
  [(NSMutableOrderedSet *)faultEventCache addObject:v4];
  [(W5FaultEventManager *)self __purgeObsoleteFaultEvents];
  [(W5FaultEventManager *)self __archiveEventCache];
}

- (void)notifyPeersWithFaultEvent:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v43 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (!v7->_notifyPeers)
  {
    uint64_t v8 = +[NSMutableSet set];
    notifyPeers = v7->_notifyPeers;
    v7->_notifyPeers = (NSMutableSet *)v8;

    [(W5FaultEventManager *)v7 __unarchiveNotifyPeers];
  }
  id v10 = [v6 info];
  double v11 = [v10 objectForKeyedSubscript:@"FaultType"];
  id v12 = [v11 integerValue];

  id v13 = [(W5FaultEventManager *)v7 diagnosticsModeManager];
  int v14 = [v13 registeredPeersForFaultType:v12];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v54;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        unint64_t v19 = [v18 peer:v39, v40];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          v22 = sub_10009756C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v57 = 136315906;
            v58 = "-[W5FaultEventManager notifyPeersWithFaultEvent:info:]";
            __int16 v59 = 2080;
            v60 = "W5FaultEventManager.m";
            __int16 v61 = 1024;
            int v62 = 388;
            __int16 v63 = 2114;
            v64 = v18;
            LODWORD(v40) = 38;
            v39 = &v57;
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          int v21 = v7->_notifyPeers;
          v22 = [v18 peer];
          [(NSMutableSet *)v21 addObject:v22];
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
    }
    while (v15);
  }

  long long v52 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  id v23 = [(NSMutableSet *)v7->_notifyPeers copy];
  id v24 = [v23 countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (v24)
  {
    uint64_t v44 = *(void *)v50;
    id v41 = v23;
    do
    {
      id v45 = v24;
      for (j = 0; j != v45; j = (char *)j + 1)
      {
        if (*(void *)v50 != v44) {
          objc_enumerationMutation(v41);
        }
        int v26 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        v27 = objc_alloc_init(W5PeerGenericRequest);
        [(W5PeerGenericRequest *)v27 setIdentifier:@"com.apple.wifi.peer.faults"];
        [(W5PeerGenericRequest *)v27 setPeer:v26];
        [(W5PeerGenericRequest *)v27 setDiscoveryFlags:1];
        [(W5PeerGenericRequest *)v27 setControlFlags:0];
        v28 = +[NSMutableDictionary dictionary];
        [v28 setObject:&off_1000EB9F8 forKeyedSubscript:@"Type"];
        v29 = [(W5FaultEventManager *)v7 localPeer];
        [v28 setObject:v29 forKeyedSubscript:@"RequestPeer"];

        [v28 setObject:v26 forKeyedSubscript:@"ResponsePeer"];
        id v30 = [v6 copy];
        v31 = [v6 info];
        if (v31)
        {
          v32 = [v6 info];
          id v33 = [v32 mutableCopy];
        }
        else
        {
          id v33 = +[NSMutableDictionary dictionary];
        }

        v34 = [(W5FaultEventManager *)v7 diagnosticsModeManager];
        BOOL v35 = [v34 registeredRoleForPeer:v26] == (id)16;

        if (v35)
        {
          v36 = [v26 peerID];
          [v33 setObject:v36 forKeyedSubscript:@"RemoteListener"];

          if (v43)
          {
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_10008A520;
            v47[3] = &unk_1000DF398;
            id v48 = v33;
            [v43 enumerateKeysAndObjectsUsingBlock:v47];
          }
        }
        [v30 setInfo:v33, v39, v40];
        [v28 setObject:v30 forKeyedSubscript:@"Event"];
        [(W5PeerGenericRequest *)v27 setRequestInfo:v28];
        v37 = sub_10009756C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int v57 = 136316162;
          v58 = "-[W5FaultEventManager notifyPeersWithFaultEvent:info:]";
          __int16 v59 = 2080;
          v60 = "W5FaultEventManager.m";
          __int16 v61 = 1024;
          int v62 = 424;
          __int16 v63 = 2112;
          v64 = v26;
          __int16 v65 = 2112;
          id v66 = v30;
          LODWORD(v40) = 48;
          v39 = &v57;
          _os_log_send_and_compose_impl();
        }

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10008A52C;
        v46[3] = &unk_1000DF3C0;
        v46[4] = v7;
        v46[5] = v26;
        [(W5PeerGenericRequest *)v27 setResponseHandler:v46];
        id v38 = [(W5PeerManager *)v7->_peerManager sendRequest:v27];
      }
      id v23 = v41;
      id v24 = [v41 countByEnumeratingWithState:&v49 objects:v67 count:16];
    }
    while (v24);
  }

  objc_sync_exit(v7);
}

- (void)submitFaultEvent:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  double v5 = [(W5FaultEventManager *)v4 localPeer];
  [v7 setPeer:v5];

  [(W5FaultEventManager *)v4 __addFaultEvent:v7];
  id v6 = [(W5FaultEventManager *)v4 faultEventHandler];
  ((void (**)(void, id))v6)[2](v6, v7);

  objc_sync_exit(v4);
}

- (id)faultEventCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_faultEventCache)
  {
    uint64_t v3 = +[NSMutableOrderedSet orderedSet];
    faultEventCache = v2->_faultEventCache;
    v2->_faultEventCache = (NSMutableOrderedSet *)v3;

    [(W5FaultEventManager *)v2 __unarchiveEventCache];
  }
  [(W5FaultEventManager *)v2 __purgeObsoleteFaultEvents];
  if (v2->_faultEventCache)
  {
    id v5 = objc_alloc((Class)NSArray);
    id v6 = [(NSMutableOrderedSet *)v2->_faultEventCache array];
    id v7 = [v5 initWithArray:v6 copyItems:1];
  }
  else
  {
    id v7 = 0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (id)faultEventHandler
{
  return self->_faultEventHandler;
}

- (void)setFaultEventHandler:(id)a3
{
}

- (W5Peer)localPeer
{
  return self->_localPeer;
}

- (void)setLocalPeer:(id)a3
{
}

- (W5PeerGenericRequestListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (W5PeerManager)peerManager
{
  return self->_peerManager;
}

- (void)setPeerManager:(id)a3
{
}

- (W5DiagnosticsModeManager)diagnosticsModeManager
{
  return self->_diagnosticsModeManager;
}

- (void)setDiagnosticsModeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsModeManager, 0);
  objc_storeStrong((id *)&self->_peerManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_localPeer, 0);
  objc_storeStrong(&self->_faultEventHandler, 0);
  objc_storeStrong((id *)&self->_monitoringPeers, 0);
  objc_storeStrong((id *)&self->_notifyPeers, 0);

  objc_storeStrong((id *)&self->_faultEventCache, 0);
}

@end