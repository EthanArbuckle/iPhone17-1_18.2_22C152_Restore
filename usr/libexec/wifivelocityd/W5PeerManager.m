@interface W5PeerManager
- (BOOL)_discoveryRequestsContainsRapportRequest;
- (BOOL)_setupRapportClient;
- (BOOL)registerPeerListeners:(id)a3;
- (NSMutableSet)activePeers;
- (NSMutableSet)discoveryRequests;
- (NSString)localIDSIdentifier;
- (W5PeerManager)init;
- (W5RapportClient)rapportClient;
- (W5RapportServer)rapportServer;
- (id)_activePeersWithDiscoveryFlags:(int64_t)a3;
- (id)_sendRapportRequest:(id)a3;
- (id)_stopPeerDiscoveryWithRequest:(id)a3;
- (id)queryDatabaseForPeerWithRequest:(id)a3;
- (id)queryStatusForPeerWithRequest:(id)a3;
- (id)requestFileFromPeerWithRequest:(id)a3;
- (id)runDiagnosticsOnPeerWithRequest:(id)a3;
- (id)runSnifferAtPeerWithRequest:(id)a3;
- (id)sendDebugConfigurationForPeerWithRequest:(id)a3;
- (id)sendRequest:(id)a3;
- (id)startPeerDiscoveryWithRequest:(id)a3;
- (id)stopPeerDiscoveryWithRequestUUID:(id)a3;
- (void)_handleRapportDeviceFound:(id)a3;
- (void)_handleRapportDeviceLost:(id)a3;
- (void)_newPeersDiscovered:(id)a3;
- (void)_peersLost:(id)a3;
- (void)setActivePeers:(id)a3;
- (void)setDiscoveryRequests:(id)a3;
- (void)setLocalIDSIdentifier:(id)a3;
- (void)setRapportClient:(id)a3;
- (void)setRapportServer:(id)a3;
@end

@implementation W5PeerManager

- (W5PeerManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)W5PeerManager;
  v2 = [(W5PeerManager *)&v12 init];
  if (!v2) {
    goto LABEL_11;
  }
  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  discoveryRequests = v2->_discoveryRequests;
  v2->_discoveryRequests = v3;

  if (!v2->_discoveryRequests
    || (v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet),
        activePeers = v2->_activePeers,
        v2->_activePeers = v5,
        activePeers,
        !v2->_activePeers))
  {
LABEL_11:

    v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "-[W5PeerManager init]";
      __int16 v15 = 2080;
      v16 = "W5PeerManager.m";
      __int16 v17 = 1024;
      int v18 = 61;
      _os_log_send_and_compose_impl();
    }
    v2 = 0;
    goto LABEL_9;
  }
  localIDSIdentifier = v2->_localIDSIdentifier;
  v2->_localIDSIdentifier = 0;

  if (objc_opt_class())
  {
    uint64_t v8 = IDSCopyLocalDeviceUniqueID();
    v9 = v2->_localIDSIdentifier;
    v2->_localIDSIdentifier = (NSString *)v8;
  }
  if (!v2->_localIDSIdentifier)
  {
    v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "-[W5PeerManager init]";
      __int16 v15 = 2080;
      v16 = "W5PeerManager.m";
      __int16 v17 = 1024;
      int v18 = 53;
      _os_log_send_and_compose_impl();
    }
LABEL_9:
  }
  return v2;
}

- (BOOL)registerPeerListeners:(id)a3
{
  id v4 = a3;
  v5 = [[W5RapportServer alloc] initWithRequestListeners:v4];

  rapportServer = self->_rapportServer;
  self->_rapportServer = v5;

  BOOL v7 = [(W5PeerManager *)self _setupRapportClient];
  if (!v7)
  {
    v9 = sub_10009756C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
  }
  return v7;
}

- (id)startPeerDiscoveryWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(W5PeerManager *)self discoveryRequests];
  unsigned int v6 = [v5 containsObject:v4];

  BOOL v7 = sub_10009756C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v20 = 136315906;
      v21 = "-[W5PeerManager startPeerDiscoveryWithRequest:]";
      __int16 v22 = 2080;
      v23 = "W5PeerManager.m";
      __int16 v24 = 1024;
      int v25 = 81;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_send_and_compose_impl();
    }

    NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v19 = @"W5NotPermittedErr";
    v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v10 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:5 userInfo:v9];
LABEL_13:

    goto LABEL_14;
  }
  if (v8)
  {
    int v20 = 136315906;
    v21 = "-[W5PeerManager startPeerDiscoveryWithRequest:]";
    __int16 v22 = 2080;
    v23 = "W5PeerManager.m";
    __int16 v24 = 1024;
    int v25 = 85;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_send_and_compose_impl();
  }

  v11 = [(W5PeerManager *)self discoveryRequests];
  [v11 addObject:v4];

  objc_super v12 = [v4 configuration];
  unsigned __int8 v13 = [v12 discoveryFlags];

  if ((v13 & 1) == 0)
  {
    v10 = 0;
    goto LABEL_14;
  }
  v14 = [(W5PeerManager *)self rapportClient];
  [v14 startDiscoveringDevices];

  v10 = [(W5PeerManager *)self activePeers];

  if (v10)
  {
    v9 = [(W5PeerManager *)self _activePeersWithDiscoveryFlags:1];
    if ([v9 count])
    {
      __int16 v15 = [v4 handler];
      v16 = [v9 allObjects];
      ((void (**)(void, void *, void))v15)[2](v15, v16, 0);
    }
    v10 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (id)stopPeerDiscoveryWithRequestUUID:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(W5PeerManager *)self discoveryRequests];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      v11 = [v10 uuid];
      unsigned __int8 v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v18 objects:v32 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_12;
    }
    uint64_t v14 = [(W5PeerManager *)self _stopPeerDiscoveryWithRequest:v13];
  }
  else
  {
LABEL_9:

LABEL_12:
    __int16 v15 = sub_10009756C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315906;
      int v25 = "-[W5PeerManager stopPeerDiscoveryWithRequestUUID:]";
      __int16 v26 = 2080;
      id v27 = "W5PeerManager.m";
      __int16 v28 = 1024;
      int v29 = 117;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_send_and_compose_impl();
    }

    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v23 = @"W5ParamErr";
    id v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v14 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v13];
  }
  v16 = (void *)v14;

  return v16;
}

- (id)_stopPeerDiscoveryWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(W5PeerManager *)self discoveryRequests];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(W5PeerManager *)self discoveryRequests];
    [v7 removeObject:v4];

    unsigned __int8 v8 = [(W5PeerManager *)self _discoveryRequestsContainsRapportRequest];
    uint64_t v9 = sub_10009756C();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        [(W5PeerManager *)self discoveryRequests];
        int v20 = 136315906;
        long long v21 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
        __int16 v22 = 2080;
        CFStringRef v23 = "W5PeerManager.m";
        __int16 v24 = 1024;
        int v25 = 138;
        __int16 v26 = 2114;
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      if (v10)
      {
        int v20 = 136315650;
        long long v21 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
        __int16 v22 = 2080;
        CFStringRef v23 = "W5PeerManager.m";
        __int16 v24 = 1024;
        int v25 = 135;
        _os_log_send_and_compose_impl();
      }

      uint64_t v9 = [(W5PeerManager *)self rapportClient];
      [v9 stopDiscoveryingDevices];
    }

    uint64_t v14 = [(W5PeerManager *)self discoveryRequests];
    id v15 = [v14 count];

    if (v15)
    {
      id v13 = 0;
      goto LABEL_17;
    }
    v16 = sub_10009756C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      long long v21 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      __int16 v22 = 2080;
      CFStringRef v23 = "W5PeerManager.m";
      __int16 v24 = 1024;
      int v25 = 143;
      _os_log_send_and_compose_impl();
    }

    unsigned __int8 v12 = [(W5PeerManager *)self activePeers];
    [v12 removeAllObjects];
    id v13 = 0;
  }
  else
  {
    v11 = sub_10009756C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      long long v21 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      __int16 v22 = 2080;
      CFStringRef v23 = "W5PeerManager.m";
      __int16 v24 = 1024;
      int v25 = 127;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_send_and_compose_impl();
    }

    NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v19 = @"W5NotPermittedErr";
    unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:5 userInfo:v12];
  }

LABEL_17:

  return v13;
}

- (void)_newPeersDiscovered:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  unsigned __int8 v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(W5PeerManager *)self activePeers];
    int v39 = 136315906;
    v40 = "-[W5PeerManager _newPeersDiscovered:]";
    __int16 v41 = 2080;
    v42 = "W5PeerManager.m";
    __int16 v43 = 1024;
    int v44 = 156;
    __int16 v45 = 2114;
    v46 = v7;
    LODWORD(v29) = 38;
    __int16 v28 = &v39;
    _os_log_send_and_compose_impl();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v35 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = [(W5PeerManager *)self activePeers];
        unsigned int v15 = [v14 containsObject:v13];

        if (v15)
        {
          v16 = sub_10009756C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v39 = 136315906;
            v40 = "-[W5PeerManager _newPeersDiscovered:]";
            __int16 v41 = 2080;
            v42 = "W5PeerManager.m";
            __int16 v43 = 1024;
            int v44 = 159;
            __int16 v45 = 2114;
            v46 = v13;
            LODWORD(v29) = 38;
            __int16 v28 = &v39;
            _os_log_send_and_compose_impl();
          }

          [v5 removeObject:v13];
        }
        else
        {
          __int16 v17 = [(W5PeerManager *)self activePeers];
          [v17 addObject:v13];

          v10 |= (unint64_t)[v13 discoveryFlags];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v35 objects:v50 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  if ([v5 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    NSErrorUserInfoKey v18 = [(W5PeerManager *)self discoveryRequests];
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v49 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          CFStringRef v23 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          __int16 v24 = sub_10009756C();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v39 = 136316162;
            v40 = "-[W5PeerManager _newPeersDiscovered:]";
            __int16 v41 = 2080;
            v42 = "W5PeerManager.m";
            __int16 v43 = 1024;
            int v44 = 174;
            __int16 v45 = 2114;
            v46 = v23;
            __int16 v47 = 2114;
            id v48 = v5;
            _os_log_send_and_compose_impl();
          }

          int v25 = [v23 configuration];
          unint64_t v26 = (unint64_t)[v25 discoveryFlags] & v10;

          if (v26)
          {
            id v27 = [v23 handler];
            ((void (**)(void, id, void))v27)[2](v27, v5, 0);
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v49 count:16];
      }
      while (v20);
    }
  }
  else
  {
    NSErrorUserInfoKey v18 = sub_10009756C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 136315650;
      v40 = "-[W5PeerManager _newPeersDiscovered:]";
      __int16 v41 = 2080;
      v42 = "W5PeerManager.m";
      __int16 v43 = 1024;
      int v44 = 168;
      _os_log_send_and_compose_impl();
    }
  }
}

- (void)_peersLost:(id)a3
{
  id v4 = a3;
  id v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = [(W5PeerManager *)self activePeers];
    int v38 = 136315906;
    int v39 = "-[W5PeerManager _peersLost:]";
    __int16 v40 = 2080;
    __int16 v41 = "W5PeerManager.m";
    __int16 v42 = 1024;
    int v43 = 185;
    __int16 v44 = 2114;
    __int16 v45 = v6;
    LODWORD(v29) = 38;
    __int16 v28 = &v38;
    _os_log_send_and_compose_impl();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v14 = [(W5PeerManager *)self activePeers];
        unsigned int v15 = [v14 containsObject:v13];

        if (v15)
        {
          v16 = sub_10009756C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v38 = 136315906;
            int v39 = "-[W5PeerManager _peersLost:]";
            __int16 v40 = 2080;
            __int16 v41 = "W5PeerManager.m";
            __int16 v42 = 1024;
            int v43 = 188;
            __int16 v44 = 2114;
            __int16 v45 = v13;
            LODWORD(v29) = 38;
            __int16 v28 = &v38;
            _os_log_send_and_compose_impl();
          }

          __int16 v17 = [(W5PeerManager *)self activePeers];
          [v17 removeObject:v13];

          v10 |= (unint64_t)[v13 discoveryFlags];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  NSErrorUserInfoKey v18 = [(W5PeerManager *)self discoveryRequests];
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        CFStringRef v23 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
        __int16 v24 = sub_10009756C();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = 136316162;
          int v39 = "-[W5PeerManager _peersLost:]";
          __int16 v40 = 2080;
          __int16 v41 = "W5PeerManager.m";
          __int16 v42 = 1024;
          int v43 = 196;
          __int16 v44 = 2114;
          __int16 v45 = v23;
          __int16 v46 = 2114;
          id v47 = v7;
          _os_log_send_and_compose_impl();
        }

        int v25 = [v23 configuration];
        unint64_t v26 = (unint64_t)[v25 discoveryFlags] & v10;

        if (v26)
        {
          id v27 = [v23 handler];
          ((void (**)(void, void, id))v27)[2](v27, 0, v7);
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v48 count:16];
    }
    while (v20);
  }
}

- (id)_activePeersWithDiscoveryFlags:(int64_t)a3
{
  id v5 = +[NSPredicate predicateWithFormat:@"SELF.discoveryFlags == %d", a3];
  unsigned __int8 v6 = +[NSPredicate predicateWithFormat:@"SELF.discoveryFlags == %d", a3 | 2, v5];
  v12[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v12 count:2];
  id v8 = +[NSCompoundPredicate orPredicateWithSubpredicates:v7];

  id v9 = [(W5PeerManager *)self activePeers];
  uint64_t v10 = [v9 filteredSetUsingPredicate:v8];

  return v10;
}

- (id)queryStatusForPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    id v5 = [(W5PeerManager *)self _sendRapportRequest:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)requestFileFromPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    id v5 = [v4 peer];
    unsigned __int8 v6 = [v5 companionLinkDevice];

    if (v6)
    {
      id v7 = [(W5PeerManager *)self rapportClient];
      uint64_t v8 = [v7 sendMessageToDevice:v6 request:v4];
    }
    else
    {
      uint64_t v10 = sub_10009756C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        [v4 peer];
        int v14 = 136315906;
        unsigned int v15 = "-[W5PeerManager requestFileFromPeerWithRequest:]";
        __int16 v16 = 2080;
        __int16 v17 = "W5PeerManager.m";
        __int16 v18 = 1024;
        int v19 = 236;
        __int16 v20 = 2114;
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v13 = @"W5ParamErr";
      id v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      uint64_t v8 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v7];
    }
    id v9 = (void *)v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)runSnifferAtPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    id v5 = [(W5PeerManager *)self _sendRapportRequest:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)sendDebugConfigurationForPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    id v5 = [(W5PeerManager *)self _sendRapportRequest:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)runDiagnosticsOnPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    id v5 = [v4 peer];
    unsigned __int8 v6 = [v5 companionLinkDevice];

    if (v6)
    {
      id v7 = [(W5PeerManager *)self rapportClient];
      uint64_t v8 = [v7 sendMessageToDevice:v6 request:v4];
    }
    else
    {
      uint64_t v10 = sub_10009756C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        [v4 peer];
        int v14 = 136315906;
        unsigned int v15 = "-[W5PeerManager runDiagnosticsOnPeerWithRequest:]";
        __int16 v16 = 2080;
        __int16 v17 = "W5PeerManager.m";
        __int16 v18 = 1024;
        int v19 = 282;
        __int16 v20 = 2114;
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v13 = @"W5ParamErr";
      id v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      uint64_t v8 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v7];
    }
    id v9 = (void *)v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)queryDatabaseForPeerWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryFlags] == (id)1)
  {
    id v5 = [(W5PeerManager *)self _sendRapportRequest:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_sendRapportRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peer];
  unsigned __int8 v6 = [v5 companionLinkDevice];

  if (v6)
  {
    id v7 = [(W5PeerManager *)self rapportClient];
    uint64_t v8 = [v7 sendMessageToDevice:v6 request:v4];
  }
  else
  {
    id v9 = sub_10009756C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v4 peer];
      int v14 = 136315906;
      unsigned int v15 = "-[W5PeerManager _sendRapportRequest:]";
      __int16 v16 = 2080;
      __int16 v17 = "W5PeerManager.m";
      __int16 v18 = 1024;
      int v19 = 312;
      __int16 v20 = 2114;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v13 = @"W5ParamErr";
    id v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v7];
  }
  uint64_t v10 = (void *)v8;

  return v10;
}

- (BOOL)_setupRapportClient
{
  v3 = objc_alloc_init(W5RapportClient);
  [(W5PeerManager *)self setRapportClient:v3];

  id v4 = [(W5PeerManager *)self rapportClient];

  if (v4)
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100093034;
    v10[3] = &unk_1000DE938;
    objc_copyWeak(&v11, &location);
    id v5 = [(W5PeerManager *)self rapportClient];
    [v5 setDeviceFoundHandler:v10];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100093090;
    v8[3] = &unk_1000DE938;
    objc_copyWeak(&v9, &location);
    unsigned __int8 v6 = [(W5PeerManager *)self rapportClient];
    [v6 setDeviceLostHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v4 != 0;
}

- (void)_handleRapportDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)W5Peer) initWithCompanionLinkDevice:v4];

  id v7 = v5;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(W5PeerManager *)self _newPeersDiscovered:v6];
}

- (void)_handleRapportDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)W5Peer) initWithCompanionLinkDevice:v4];

  id v7 = v5;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(W5PeerManager *)self _peersLost:v6];
}

- (BOOL)_discoveryRequestsContainsRapportRequest
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(W5PeerManager *)self discoveryRequests];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        unsigned __int8 v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) configuration];
        unsigned __int8 v7 = [v6 discoveryFlags];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)sendRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peer];
  unsigned __int8 v6 = [v5 companionLinkDevice];

  unsigned __int8 v7 = sub_10009756C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      long long v9 = [v4 peer];
      unsigned int v15 = [v4 requestInfo];
      _os_log_send_and_compose_impl();
    }
    long long v10 = [(W5PeerManager *)self rapportClient];
    uint64_t v11 = [v10 sendMessageToDevice:v6 request:v4];
  }
  else
  {
    if (v8)
    {
      int v14 = [v4 peer];
      _os_log_send_and_compose_impl();
    }
    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v17 = @"W5ParamErr";
    long long v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v10];
  }
  long long v12 = (void *)v11;

  return v12;
}

- (NSString)localIDSIdentifier
{
  return self->_localIDSIdentifier;
}

- (void)setLocalIDSIdentifier:(id)a3
{
}

- (W5RapportClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (W5RapportServer)rapportServer
{
  return self->_rapportServer;
}

- (void)setRapportServer:(id)a3
{
}

- (NSMutableSet)discoveryRequests
{
  return self->_discoveryRequests;
}

- (void)setDiscoveryRequests:(id)a3
{
}

- (NSMutableSet)activePeers
{
  return self->_activePeers;
}

- (void)setActivePeers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePeers, 0);
  objc_storeStrong((id *)&self->_discoveryRequests, 0);
  objc_storeStrong((id *)&self->_rapportServer, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);

  objc_storeStrong((id *)&self->_localIDSIdentifier, 0);
}

@end