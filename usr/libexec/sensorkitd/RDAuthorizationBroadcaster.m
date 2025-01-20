@interface RDAuthorizationBroadcaster
+ (void)initialize;
- (BOOL)hasReaderEntitlementForConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)valueForEntitlement:(id)a3 connection:(id)a4;
- (void)authorizationStore:(id)a3 didDetermineInitialAuthorizationValues:(id)a4;
- (void)authorizationStore:(id)a3 didUpdateAuthorizationsForBundleId:(id)a4 sensors:(id)a5;
- (void)dealloc;
- (void)legacyResearchStudyBundleIDs:(id)a3;
- (void)legacyResearchStudyEntitlement:(id)a3;
- (void)registerForAuthorizationChangeNotificationsWithEffectiveBundleId:(id)a3;
- (void)retrieveCurrentAuthorizedServicesWithReply:(id)a3;
- (void)setDataCollectionEnabled:(BOOL)a3;
- (void)setFirstRunOnboardingCompleted:(BOOL)a3;
@end

@implementation RDAuthorizationBroadcaster

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EC60 = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationBroadcaster");
  }
}

- (void)dealloc
{
  if (self)
  {
    [(NSXPCListener *)self->_listener invalidate];
    [(NSXPCListener *)self->_listener setDelegate:0];
  }

  self->_listener = 0;
  self->_exportedInterface = 0;

  self->_remoteInterface = 0;
  self->_connectionToBundleIds = 0;

  self->_bundleIdToConnections = 0;
  objc_setProperty_nonatomic(self, v3, 0, 72);
  objc_setProperty_nonatomic(self, v4, 0, 80);
  objc_setProperty_nonatomic(self, v5, 0, 88);
  objc_setProperty_nonatomic(self, v6, 0, 96);
  dispatch_release((dispatch_object_t)self->_q);
  v7.receiver = self;
  v7.super_class = (Class)RDAuthorizationBroadcaster;
  [(RDAuthorizationBroadcaster *)&v7 dealloc];
}

- (void)authorizationStore:(id)a3 didDetermineInitialAuthorizationValues:(id)a4
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B7FC;
  block[3] = &unk_10005CEB8;
  block[4] = self;
  dispatch_async(q, block);
}

- (void)authorizationStore:(id)a3 didUpdateAuthorizationsForBundleId:(id)a4 sensors:(id)a5
{
  q = self->_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003BBC0;
  v6[3] = &unk_10005D340;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async(q, v6);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  SEL v6 = _os_activity_create((void *)&_mh_execute_header, "RDAuthorizationBroadcaster new connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);
  objc_super v7 = qword_10006EC60;
  if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = [a4 processIdentifier];
    LODWORD(buf) = 67240192;
    HIDWORD(buf) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "New connection from pid %{public}d", (uint8_t *)&buf, 8u);
  }
  if (self)
  {
    stateCache = self->_stateCache;
    if (stateCache)
    {
      uint64_t v10 = mach_continuous_time();
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v11 = qword_10006EC90;
      double v12 = *(double *)&qword_10006EC98;
      double v13 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      if (v11 >= v10) {
        double v14 = -v14;
      }
      if (v13 + v12 + v14 < stateCache->_localDaemonLaunchTime + 3.0 + stateCache->_remoteRTCOffset) {
        AnalyticsSendEventLazy();
      }
    }
    exportedInterface = self->_exportedInterface;
  }
  else
  {
    exportedInterface = 0;
  }
  [a4 setExportedInterface:exportedInterface];
  [a4 setExportedObject:self];
  if (self) {
    remoteInterface = self->_remoteInterface;
  }
  else {
    remoteInterface = 0;
  }
  [a4 setRemoteObjectInterface:remoteInterface];
  [a4 setInterruptionHandler:&stru_10005D790];
  objc_initWeak(&buf, a4);
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003C20C;
  v18[3] = &unk_10005D7B8;
  objc_copyWeak(&v19, &buf);
  objc_copyWeak(&v20, &location);
  [a4 setInvalidationHandler:v18];
  [a4 _setQueue:self->_q];
  [a4 resume];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&buf);
  os_activity_scope_leave(&state);
  return 1;
}

- (void)registerForAuthorizationChangeNotificationsWithEffectiveBundleId:(id)a3
{
  SEL v4 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  SEL v5 = _os_activity_create((void *)&_mh_execute_header, "RDAuthorizationBroadcaster registration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  SEL v6 = +[NSXPCConnection currentConnection];
  objc_super v7 = v6;
  if (a3)
  {
    unsigned int v8 = a3;
    if (([a3 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"] & 1) == 0)
    {
      unsigned int v8 = a3;
      if (![(RDAuthorizationBroadcaster *)v4 valueForEntitlement:@"com.apple.SensorKit.effective-bundle" connection:v7])
      {
        v9 = qword_10006EC60;
        if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
        {
          unsigned int v10 = [(NSXPCConnection *)v7 processIdentifier];
          *(_DWORD *)id buf = 67240192;
          LODWORD(v81) = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Attempting to set effective bundle identifier without proper entitlement, pid %{public}d", buf, 8u);
        }
LABEL_86:
        [(NSXPCConnection *)v7 invalidate];
        goto LABEL_87;
      }
    }
  }
  else
  {
    unsigned int v8 = sub_10001C7D0((NSURL *)v6);
    if (!v8)
    {
      v52 = qword_10006EC60;
      if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_FAULT))
      {
        unsigned int v53 = [(NSXPCConnection *)v7 processIdentifier];
        *(_DWORD *)id buf = 67240192;
        LODWORD(v81) = v53;
        _os_log_fault_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "Failed to determine bundle id for pid %{public}d", buf, 8u);
      }
      goto LABEL_86;
    }
  }
  unint64_t v11 = qword_10006EC60;
  if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [(NSXPCConnection *)v7 processIdentifier];
    *(_DWORD *)id buf = 138543874;
    v81 = v8;
    __int16 v82 = 1026;
    unsigned int v83 = v12;
    __int16 v84 = 1026;
    BOOL v85 = a3 != 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client bundleId determined, bundle id, %{public}@, pid, %{public}d, effective bundle id used, %{public}d", buf, 0x18u);
  }
  id v13 = [(NSMapTable *)v4->_connectionToBundleIds objectForKey:v7];
  if (!v13) {
    id v13 = +[NSMutableSet set];
  }
  id obj = v13;
  [v13 addObject:v8];
  [(NSMapTable *)v4->_connectionToBundleIds setObject:obj forKey:v7];
  id v14 = [(NSMutableDictionary *)v4->_bundleIdToConnections objectForKeyedSubscript:v8];
  if (!v14) {
    id v14 = +[NSMutableSet set];
  }
  [v14 addObject:v7];
  [(NSMutableDictionary *)v4->_bundleIdToConnections setObject:v14 forKeyedSubscript:v8];
  if (objc_msgSend(-[SRAuthorizationStore readerAuthorizationBundleIdValues](v4->_authStore, "readerAuthorizationBundleIdValues"), "count"))
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v55 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v63;
      v57 = v4;
      v54 = v7;
      do
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v63 != v56) {
            objc_enumerationMutation(obj);
          }
          v60 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if (objc_msgSend(v60, "isEqualToString:", @"com.apple.private.SensorKit._compositeBundle", v54))
          {
            id v15 = +[NSMutableSet set];
            id v16 = [(SRAuthorizationStore *)v4->_authStore readerAuthorizationBundleIdValues];
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v17 = [v16 countByEnumeratingWithState:&v71 objects:buf count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v72;
              do
              {
                for (j = 0; j != v17; j = (char *)j + 1)
                {
                  if (*(void *)v72 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  id v20 = [v16 objectForKeyedSubscript:*(void *)(*((void *)&v71 + 1) + 8 * (void)j)];
                  long long v69 = 0u;
                  long long v70 = 0u;
                  long long v67 = 0u;
                  long long v68 = 0u;
                  id v21 = [v20 countByEnumeratingWithState:&v67 objects:&v76 count:16];
                  if (v21)
                  {
                    uint64_t v22 = *(void *)v68;
                    do
                    {
                      for (k = 0; k != v21; k = (char *)k + 1)
                      {
                        if (*(void *)v68 != v22) {
                          objc_enumerationMutation(v20);
                        }
                        uint64_t v24 = *(void *)(*((void *)&v67 + 1) + 8 * (void)k);
                        if (objc_msgSend(objc_msgSend(v20, "objectForKeyedSubscript:", v24), "BOOLValue")) {
                          [v15 addObject:v24];
                        }
                      }
                      id v21 = [v20 countByEnumeratingWithState:&v67 objects:&v76 count:16];
                    }
                    while (v21);
                  }
                }
                id v17 = [v16 countByEnumeratingWithState:&v71 objects:buf count:16];
              }
              while (v17);
            }
            v25 = v57;
            v26 = +[NSSet setWithSet:v15];
            v27 = v60;
          }
          else
          {
            dispatch_assert_queue_V2((dispatch_queue_t)v4->_q);
            v26 = (NSSet *)+[NSMutableSet set];
            id v28 = [(SRAuthorizationStore *)v4->_authStore readerAuthorizationBundleIdValues];
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v29 = [v28 objectForKeyedSubscript:v60];
            id v30 = [v29 countByEnumeratingWithState:&v76 objects:buf count:16];
            v27 = v60;
            if (v30)
            {
              uint64_t v31 = *(void *)v77;
              do
              {
                for (m = 0; m != v30; m = (char *)m + 1)
                {
                  if (*(void *)v77 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v76 + 1) + 8 * (void)m);
                  if ([v28[v60][v33] BOOLValue])[v26 addObject:v33]; {
                }
                  }
                id v30 = [v29 countByEnumeratingWithState:&v76 objects:buf count:16];
              }
              while (v30);
            }
            v25 = v57;
          }
          if ([v27 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
          {
            id v34 = +[NSMutableSet set];
            id v35 = [(SRAuthorizationStore *)v25->_authStore readerAuthorizationBundleIdValues];
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v36 = [v35 countByEnumeratingWithState:&v71 objects:buf count:16];
            if (v36)
            {
              uint64_t v61 = *(void *)v72;
              do
              {
                for (n = 0; n != v36; n = (char *)n + 1)
                {
                  if (*(void *)v72 != v61) {
                    objc_enumerationMutation(v35);
                  }
                  id v38 = [v35 objectForKeyedSubscript:*(void *)(*((void *)&v71 + 1) + 8 * (void)n)];
                  long long v69 = 0u;
                  long long v70 = 0u;
                  long long v67 = 0u;
                  long long v68 = 0u;
                  id v39 = [v38 countByEnumeratingWithState:&v67 objects:&v76 count:16];
                  if (v39)
                  {
                    uint64_t v40 = *(void *)v68;
                    do
                    {
                      for (ii = 0; ii != v39; ii = (char *)ii + 1)
                      {
                        if (*(void *)v68 != v40) {
                          objc_enumerationMutation(v38);
                        }
                        uint64_t v42 = *(void *)(*((void *)&v67 + 1) + 8 * (void)ii);
                        if ([v38 count] && !-[NSSet containsObject:](v26, "containsObject:", v42)) {
                          [v34 addObject:v42];
                        }
                      }
                      id v39 = [v38 countByEnumeratingWithState:&v67 objects:&v76 count:16];
                    }
                    while (v39);
                  }
                }
                id v36 = [v35 countByEnumeratingWithState:&v71 objects:buf count:16];
              }
              while (v36);
            }
            SEL v4 = v57;
            v43 = +[NSSet setWithSet:v34];
          }
          else
          {
            dispatch_assert_queue_V2((dispatch_queue_t)v25->_q);
            v43 = (NSSet *)+[NSMutableSet set];
            id v44 = [(SRAuthorizationStore *)v25->_authStore readerAuthorizationBundleIdValues];
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v45 = [v44 objectForKeyedSubscript:v60];
            id v46 = [v45 countByEnumeratingWithState:&v76 objects:buf count:16];
            if (v46)
            {
              uint64_t v47 = *(void *)v77;
              do
              {
                for (jj = 0; jj != v46; jj = (char *)jj + 1)
                {
                  if (*(void *)v77 != v47) {
                    objc_enumerationMutation(v45);
                  }
                  uint64_t v49 = *(void *)(*((void *)&v76 + 1) + 8 * (void)jj);
                  if ([[[objc_msgSend(objc_msgSend(objc_msgSend(v44, "objectForKeyedSubscript:", v60), "objectForKeyedSubscript:", v49), "BOOLValue") & 1] == 0] -[NSSet addObject:](v43, "addObject:", v49); {
                }
                  }
                id v46 = [v45 countByEnumeratingWithState:&v76 objects:buf count:16];
              }
              while (v46);
            }
            SEL v4 = v57;
          }
          id v50 = [(NSDictionary *)[(SRAuthorizationStore *)v4->_authStore readerLastModifiedAuthorizationTimes] objectForKeyedSubscript:v60];
          if (v50) {
            v51 = v50;
          }
          else {
            v51 = &__NSDictionary0__struct;
          }
          [(-[NSXPCConnection remoteObjectProxy](v54, "remoteObjectProxy")) authorizedServicesDidChange:v26 deniedServices:v43 prerequisites:sub_10003B1C4((uint64_t)v4) lastModifiedTimes:v51 bundleIdentifier:v60];
        }
        id v55 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
      }
      while (v55);
    }
  }
LABEL_87:
  os_activity_scope_leave(&state);
}

- (void)retrieveCurrentAuthorizedServicesWithReply:(id)a3
{
  SEL v4 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  SEL v5 = +[NSXPCConnection currentConnection];
  if ([(RDAuthorizationBroadcaster *)v4 valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readonly" connection:v5]|| [(RDAuthorizationBroadcaster *)v4 valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readwrite" connection:v5]|| [(RDAuthorizationBroadcaster *)v4 hasReaderEntitlementForConnection:v5])
  {
    id v6 = [(NSMapTable *)v4->_connectionToBundleIds objectForKey:v5];
    if (v6)
    {
      objc_super v7 = v6;
      id v74 = a3;
      id v77 = +[NSMutableDictionary dictionary];
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      __int16 v82 = v7;
      unsigned int v83 = v4;
      id v80 = [v7 countByEnumeratingWithState:&v96 objects:v110 count:16];
      if (v80)
      {
        uint64_t v8 = *(void *)v97;
        uint64_t v78 = *(void *)v97;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v97 != v8) {
              objc_enumerationMutation(v7);
            }
            uint64_t v84 = v9;
            unsigned int v10 = *(void **)(*((void *)&v96 + 1) + 8 * v9);
            v86 = v10;
            if ([v10 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
            {
              id v11 = +[NSMutableSet set];
              id v12 = [(SRAuthorizationStore *)v4->_authStore readerAuthorizationBundleIdValues];
              long long v104 = 0u;
              long long v105 = 0u;
              long long v106 = 0u;
              long long v107 = 0u;
              id v13 = [v12 countByEnumeratingWithState:&v104 objects:buf count:16];
              if (v13)
              {
                id v14 = v13;
                uint64_t v15 = *(void *)v105;
                do
                {
                  for (i = 0; i != v14; i = (char *)i + 1)
                  {
                    if (*(void *)v105 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    id v17 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v104 + 1) + 8 * i)];
                    long long v100 = 0u;
                    long long v101 = 0u;
                    long long v102 = 0u;
                    long long v103 = 0u;
                    id v18 = [v17 countByEnumeratingWithState:&v100 objects:&v111 count:16];
                    if (v18)
                    {
                      id v19 = v18;
                      uint64_t v20 = *(void *)v101;
                      do
                      {
                        for (j = 0; j != v19; j = (char *)j + 1)
                        {
                          if (*(void *)v101 != v20) {
                            objc_enumerationMutation(v17);
                          }
                          uint64_t v22 = *(void *)(*((void *)&v100 + 1) + 8 * (void)j);
                          if ([v17[v22] boolValue])[v11 addObject:v22]; {
                        }
                          }
                        id v19 = [v17 countByEnumeratingWithState:&v100 objects:&v111 count:16];
                      }
                      while (v19);
                    }
                  }
                  id v14 = [v12 countByEnumeratingWithState:&v104 objects:buf count:16];
                }
                while (v14);
              }
              v23 = +[NSSet setWithSet:v11];
              objc_super v7 = v82;
              SEL v4 = v83;
              uint64_t v8 = v78;
            }
            else
            {
              dispatch_assert_queue_V2((dispatch_queue_t)v4->_q);
              v23 = (NSSet *)+[NSMutableSet set];
              id v24 = [(SRAuthorizationStore *)v4->_authStore readerAuthorizationBundleIdValues];
              long long v111 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id v25 = [v24 objectForKeyedSubscript:v10];
              id v26 = [v25 countByEnumeratingWithState:&v111 objects:buf count:16];
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v112;
                do
                {
                  for (k = 0; k != v27; k = (char *)k + 1)
                  {
                    if (*(void *)v112 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v30 = *(void *)(*((void *)&v111 + 1) + 8 * (void)k);
                    if ([v24[v86][v30][v30] boolValue])[v23 addObject:v30]; {
                  }
                    }
                  id v27 = [v25 countByEnumeratingWithState:&v111 objects:buf count:16];
                }
                while (v27);
              }
            }
            if (v23) {
              [v77 setObject:v23 forKeyedSubscript:v86];
            }
            uint64_t v9 = v84 + 1;
          }
          while ((id)(v84 + 1) != v80);
          id v80 = [v7 countByEnumeratingWithState:&v96 objects:v110 count:16];
        }
        while (v80);
      }
      id v76 = +[NSMutableDictionary dictionary];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v81 = [v7 countByEnumeratingWithState:&v92 objects:v109 count:16];
      if (v81)
      {
        uint64_t v31 = *(void *)v93;
        uint64_t v75 = *(void *)v93;
        do
        {
          for (m = 0; m != v81; m = (char *)m + 1)
          {
            if (*(void *)v93 != v31) {
              objc_enumerationMutation(v7);
            }
            v87 = *(void **)(*((void *)&v92 + 1) + 8 * (void)m);
            if ([v87 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
            {
              if (v4)
              {
                long long v79 = m;
                id v33 = +[NSMutableSet set];
                id v34 = [(SRAuthorizationStore *)v4->_authStore readerAuthorizationBundleIdValues];
                long long v104 = 0u;
                long long v105 = 0u;
                long long v106 = 0u;
                long long v107 = 0u;
                id v35 = [v34 countByEnumeratingWithState:&v104 objects:buf count:16];
                if (v35)
                {
                  id v36 = v35;
                  uint64_t v37 = *(void *)v105;
                  do
                  {
                    for (n = 0; n != v36; n = (char *)n + 1)
                    {
                      if (*(void *)v105 != v37) {
                        objc_enumerationMutation(v34);
                      }
                      id v39 = [v34 objectForKeyedSubscript:*(void *)(*((void *)&v104 + 1) + 8 * (void)n)];
                      long long v100 = 0u;
                      long long v101 = 0u;
                      long long v102 = 0u;
                      long long v103 = 0u;
                      id v40 = [v39 countByEnumeratingWithState:&v100 objects:&v111 count:16];
                      if (v40)
                      {
                        id v41 = v40;
                        uint64_t v42 = *(void *)v101;
                        do
                        {
                          for (ii = 0; ii != v41; ii = (char *)ii + 1)
                          {
                            if (*(void *)v101 != v42) {
                              objc_enumerationMutation(v39);
                            }
                            uint64_t v44 = *(void *)(*((void *)&v100 + 1) + 8 * (void)ii);
                            if ([objc_msgSend(objc_msgSend(v39, "objectForKeyedSubscript:", v44), "BOOLValue"])objc_msgSend(v33, "addObject:", v44); {
                          }
                            }
                          id v41 = [v39 countByEnumeratingWithState:&v100 objects:&v111 count:16];
                        }
                        while (v41);
                      }
                    }
                    id v36 = [v34 countByEnumeratingWithState:&v104 objects:buf count:16];
                  }
                  while (v36);
                  v54 = +[NSSet setWithSet:v33];
                  SEL v4 = v83;
                }
                else
                {
                  v54 = +[NSSet setWithSet:v33];
                }
                id v55 = +[NSMutableSet set];
                id v56 = [(SRAuthorizationStore *)v4->_authStore readerAuthorizationBundleIdValues];
                long long v104 = 0u;
                long long v105 = 0u;
                long long v106 = 0u;
                long long v107 = 0u;
                id v57 = [v56 countByEnumeratingWithState:&v104 objects:buf count:16];
                if (v57)
                {
                  id v58 = v57;
                  uint64_t v85 = *(void *)v105;
                  do
                  {
                    for (jj = 0; jj != v58; jj = (char *)jj + 1)
                    {
                      if (*(void *)v105 != v85) {
                        objc_enumerationMutation(v56);
                      }
                      id v60 = [v56 objectForKeyedSubscript:*(void *)(*((void *)&v104 + 1) + 8 * (void)jj)];
                      long long v100 = 0u;
                      long long v101 = 0u;
                      long long v102 = 0u;
                      long long v103 = 0u;
                      id v61 = [v60 countByEnumeratingWithState:&v100 objects:&v111 count:16];
                      if (v61)
                      {
                        id v62 = v61;
                        uint64_t v63 = *(void *)v101;
                        do
                        {
                          for (kk = 0; kk != v62; kk = (char *)kk + 1)
                          {
                            if (*(void *)v101 != v63) {
                              objc_enumerationMutation(v60);
                            }
                            uint64_t v65 = *(void *)(*((void *)&v100 + 1) + 8 * (void)kk);
                            if ([v60 count] && !-[NSSet containsObject:](v54, "containsObject:", v65)) {
                              [v55 addObject:v65];
                            }
                          }
                          id v62 = [v60 countByEnumeratingWithState:&v100 objects:&v111 count:16];
                        }
                        while (v62);
                      }
                    }
                    id v58 = [v56 countByEnumeratingWithState:&v104 objects:buf count:16];
                  }
                  while (v58);
                }
                id v45 = +[NSSet setWithSet:v55];
                objc_super v7 = v82;
                SEL v4 = v83;
                uint64_t v31 = v75;
                m = v79;
                if (v45) {
                  goto LABEL_100;
                }
              }
            }
            else if (v4)
            {
              dispatch_assert_queue_V2((dispatch_queue_t)v4->_q);
              id v45 = (NSSet *)+[NSMutableSet set];
              id v46 = [(SRAuthorizationStore *)v4->_authStore readerAuthorizationBundleIdValues];
              long long v111 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id v47 = [v46 objectForKeyedSubscript:v87];
              id v48 = [v47 countByEnumeratingWithState:&v111 objects:buf count:16];
              if (!v48)
              {
                SEL v4 = v83;
                if (!v45) {
                  continue;
                }
LABEL_100:
                [v76 setObject:v45 forKeyedSubscript:v87];
                continue;
              }
              id v49 = v48;
              id v50 = m;
              uint64_t v51 = *(void *)v112;
              do
              {
                for (mm = 0; mm != v49; mm = (char *)mm + 1)
                {
                  if (*(void *)v112 != v51) {
                    objc_enumerationMutation(v47);
                  }
                  uint64_t v53 = *(void *)(*((void *)&v111 + 1) + 8 * (void)mm);
                  if ([[[objc_msgSend(objc_msgSend(objc_msgSend(v46, "objectForKeyedSubscript:", v87), "objectForKeyedSubscript:", v53), "BOOLValue") & 1] == 0] addObject:v53]; {
                }
                  }
                id v49 = [v47 countByEnumeratingWithState:&v111 objects:buf count:16];
              }
              while (v49);
              m = v50;
              objc_super v7 = v82;
              SEL v4 = v83;
              if (v45) {
                goto LABEL_100;
              }
            }
          }
          id v81 = [v7 countByEnumeratingWithState:&v92 objects:v109 count:16];
        }
        while (v81);
      }
      id v66 = +[NSMutableDictionary dictionary];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v67 = [v7 countByEnumeratingWithState:&v88 objects:v108 count:16];
      if (v67)
      {
        id v68 = v67;
        uint64_t v69 = *(void *)v89;
        do
        {
          for (nn = 0; nn != v68; nn = (char *)nn + 1)
          {
            if (*(void *)v89 != v69) {
              objc_enumerationMutation(v7);
            }
            [v66 setObject: -[NSDictionary objectForKeyedSubscript:](-[SRAuthorizationStore readerLastModifiedAuthorizationTimes](v4->_authStore, "readerLastModifiedAuthorizationTimes"), "objectForKeyedSubscript:", *(void *)(*((void *)&v88 + 1) + 8 * (void)nn)) forKeyedSubscript: *(void *)(*((void *)&v88 + 1) + 8 * (void)nn)];
          }
          id v68 = [v7 countByEnumeratingWithState:&v88 objects:v108 count:16];
        }
        while (v68);
      }
      sub_10003B1C4((uint64_t)v4);
      long long v71 = (void (*)(void))*((void *)v74 + 2);
    }
    else
    {
      long long v72 = qword_10006EC60;
      if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 67240192;
        LODWORD(v116) = [(NSXPCConnection *)v5 processIdentifier];
        _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "Client requested authorized services prior to registration, pid %{public}d", buf, 8u);
      }
      sub_10003B1C4((uint64_t)v4);
      long long v71 = (void (*)(void))*((void *)a3 + 2);
    }
    v71();
  }
  else
  {
    long long v73 = qword_10006EC60;
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      v116 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "Attempting to read prerequisite values without the proper entitlement, %{public}@", buf, 0xCu);
    }
    [(NSXPCConnection *)v5 invalidate];
  }
}

- (void)setDataCollectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  SEL v5 = +[NSXPCConnection currentConnection];
  id v6 = [(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readwrite" connection:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    defaults = self->_defaults;
    if (defaults) {
      sub_100029E94(defaults, 0, v3);
    }
    sub_10001EBE8((uint64_t)RDNotifier, @"com.apple.SensorKit.prerequisitesUpdated");
    followUpController = self->_followUpController;
    *(void *)id v11 = @"com.apple.SensorKit.followup.enableSensorKit";
    [(SRFollowUpPosting *)followUpController clearPendingFollowUpItemsWithUniqueIdentifiers:+[NSArray arrayWithObjects:v11 count:1] completion:&stru_10005D7F8];
    id Weak = objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [Weak authorizationBroadcaster:self didSetDataCollectionEnabled:v3];
    }
    sub_10003BCF4((id *)&self->super.isa);
  }
  else
  {
    unsigned int v10 = qword_10006EC60;
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v11 = 138543362;
      *(void *)&v11[4] = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Attempting to set prerequisite values without the proper entitlement, %{public}@", v11, 0xCu);
    }
    [(NSXPCConnection *)v5 invalidate];
  }
}

- (void)setFirstRunOnboardingCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  SEL v5 = +[NSXPCConnection currentConnection];
  id v6 = [(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readwrite" connection:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    defaults = self->_defaults;
    if (defaults)
    {
      sub_100029E94(&self->_defaults->super.isa, 2, v3);
      sub_100029E94(defaults, 1, v3);
    }
    sub_10001EBE8((uint64_t)RDNotifier, @"com.apple.SensorKit.prerequisitesUpdated");
    sub_10003BCF4((id *)&self->super.isa);
  }
  else
  {
    uint64_t v8 = qword_10006EC60;
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      unsigned int v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Attempting to set prerequisite values without the proper entitlement, %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(NSXPCConnection *)v5 invalidate];
  }
}

- (void)legacyResearchStudyBundleIDs:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  SEL v5 = +[NSXPCConnection currentConnection];
  if ([(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readonly" connection:v5]|| [(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readwrite" connection:v5])
  {
    id v6 = sub_10002BC24((id *)&self->_defaults->super.isa);
    objc_super v7 = (void (*)(id, id *))*((void *)a3 + 2);
    v7(a3, v6);
  }
  else
  {
    uint64_t v8 = qword_10006EC60;
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      unsigned int v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Attempting to read prerequisite values without the proper entitlement, %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(NSXPCConnection *)v5 invalidate];
  }
}

- (void)legacyResearchStudyEntitlement:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  SEL v5 = +[NSXPCConnection currentConnection];
  if ([(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readonly" connection:v5]|| [(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.SensorKit.prerequisite.readwrite" connection:v5])
  {
    id v6 = sub_10002BC3C((id *)&self->_defaults->super.isa);
    objc_super v7 = (void (*)(id, id *))*((void *)a3 + 2);
    v7(a3, v6);
  }
  else
  {
    uint64_t v8 = qword_10006EC60;
    if (os_log_type_enabled((os_log_t)qword_10006EC60, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      unsigned int v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Attempting to read prerequisite values without the proper entitlement, %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(NSXPCConnection *)v5 invalidate];
  }
}

- (id)valueForEntitlement:(id)a3 connection:(id)a4
{
  return [a4 valueForEntitlement:a3];
}

- (BOOL)hasReaderEntitlementForConnection:(id)a3
{
  if ([(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.sensorkit.reader.allow" connection:a3])
  {
    return 1;
  }
  if ([(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.sensorkit.reader.wildcard.allow" connection:a3])
  {
    return 1;
  }
  if ([(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.developer.sensorkit.reader.allow" connection:a3])
  {
    return 1;
  }
  return [(RDAuthorizationBroadcaster *)self valueForEntitlement:@"com.apple.private.sensorkit.reader.allow" connection:a3] != 0;
}

- (void).cxx_destruct
{
}

@end