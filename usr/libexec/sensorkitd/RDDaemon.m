@interface RDDaemon
+ (void)initialize;
- (BOOL)isAuthorizedForSensor:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)validateBundleRecord:(id)a3 withFilters:(id)a4;
- (NSDictionary)currentRecordingStatesForAnalytics:(NSDictionary *)result;
- (id)authorizedAndInterestedClientsForSensor:(id)a3;
- (id)bundleIdForConnection:(id)a3;
- (id)valueForEntitlement:(id)a3 connection:(id)a4;
- (int64_t)cacheDelete:(id)a3 purgeWithUrgency:(int64_t)a4 dryRun:(BOOL)a5;
- (int64_t)prerequisitesStatusForAnalytics:(id)a3;
- (void)authorizationBroadcaster:(id)a3 didSetDataCollectionEnabled:(BOOL)a4;
- (void)authorizationStore:(id)a3 didDetermineInitialAuthorizationValues:(id)a4;
- (void)authorizationStore:(id)a3 didUpdateAuthorizationsForBundleId:(id)a4 sensors:(id)a5;
- (void)dealloc;
- (void)dumpClientsWithReply:(id)a3;
- (void)dumpConfigurationsWithReply:(id)a3;
- (void)dumpDefaultsWithReply:(id)a3;
- (void)dumpStateCacheWithReply:(id)a3;
- (void)fetchAllDevices:(id)a3 reply:(id)a4;
- (void)fetchDeviceInformationForDeviceIdentifiers:(id)a3 reply:(id)a4;
- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 reply:(id)a4;
- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 sensor:(id)a4 reply:(id)a5;
- (void)fetchReaderMetadata:(id)a3 reply:(id)a4;
- (void)gizmoSync:(id)a3 didSyncRTCOffset:(double)a4 timeBeforeUpdate:(double)a5;
- (void)gizmoSync:(id)a3 didSyncState:(id)a4 deviceID:(id)a5;
- (void)gizmoSyncConnectedDevicesAdded:(id)a3;
- (void)launchEventCheckInActivity:(id)a3;
- (void)launchEventRunActivity:(id)a3;
- (void)launchEventXPCEventReceived:(id)a3;
- (void)listDatastoreWithReply:(id)a3;
- (void)removeAllSamplesForAllSensorsWithReply:(id)a3;
- (void)removeAllSamplesForCurrentSensorWithReply:(id)a3;
- (void)requestFileHandleForPruningAfterSegment:(id)a3 reply:(id)a4;
- (void)requestFileHandleForPruningSample:(double)a3 reply:(id)a4;
- (void)requestFileHandleForReading:(id)a3 afterSegment:(id)a4 reply:(id)a5;
- (void)requestFileHandleForReading:(id)a3 reply:(id)a4;
- (void)requestFileHandleForWritingWithReply:(id)a3;
- (void)setWriterService:(id)a3 enabled:(BOOL)a4;
- (void)startPruningForSensor:(id)a3 deviceId:(id)a4;
- (void)startRecording:(id)a3 reply:(id)a4;
- (void)startWritingForSensor:(id)a3;
- (void)stopRecording:(id)a3 reply:(id)a4;
@end

@implementation RDDaemon

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EC58 = (uint64_t)os_log_create("com.apple.SensorKit", "Daemon");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 72);
    objc_setProperty_nonatomic(self, v3, 0, 80);
    objc_setProperty_nonatomic(self, v4, 0, 88);
    objc_setProperty_nonatomic(self, v5, 0, 16);
  }
  writerListener = self->_writerListener;
  if (!writerListener)
  {

    readerListener = self->_readerListener;
    if (readerListener) {
      goto LABEL_12;
    }
LABEL_39:

    prunerListener = self->_prunerListener;
    if (prunerListener) {
      goto LABEL_20;
    }
LABEL_40:

    debuggingListener = self->_debuggingListener;
    if (debuggingListener) {
      goto LABEL_28;
    }
LABEL_41:

    authorizationBroadcaster = self->_authorizationBroadcaster;
    if (!authorizationBroadcaster) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  connections = writerListener->_connections;
  id v8 = [(NSMapTable *)connections countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(connections);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * i) invalidate];
      }
      id v9 = [(NSMapTable *)connections countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v9);
  }
  [(NSMapTable *)writerListener->_connections removeAllObjects];
  [(NSXPCListener *)writerListener->_listener invalidate];

  readerListener = self->_readerListener;
  if (!readerListener) {
    goto LABEL_39;
  }
LABEL_12:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v13 = readerListener->_connections;
  id v14 = [(NSMapTable *)v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v43;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * (void)j) invalidate];
      }
      id v15 = [(NSMapTable *)v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v15);
  }
  [(NSMapTable *)readerListener->_connections removeAllObjects];
  [(NSXPCListener *)readerListener->_listener invalidate];

  prunerListener = self->_prunerListener;
  if (!prunerListener) {
    goto LABEL_40;
  }
LABEL_20:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v19 = prunerListener->_connections;
  id v20 = [(NSMapTable *)v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * (void)k) invalidate];
      }
      id v21 = [(NSMapTable *)v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v21);
  }
  [(NSMapTable *)prunerListener->_connections removeAllObjects];
  [(NSXPCListener *)prunerListener->_listener invalidate];

  debuggingListener = self->_debuggingListener;
  if (!debuggingListener) {
    goto LABEL_41;
  }
LABEL_28:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v25 = debuggingListener->_connections;
  id v26 = [(NSMapTable *)v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (m = 0; m != v27; m = (char *)m + 1)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * (void)m) invalidate];
      }
      id v27 = [(NSMapTable *)v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v27);
  }
  [(NSMapTable *)debuggingListener->_connections removeAllObjects];
  [(NSXPCListener *)debuggingListener->_listener invalidate];

  authorizationBroadcaster = self->_authorizationBroadcaster;
  if (authorizationBroadcaster)
  {
LABEL_36:
    [(NSXPCListener *)authorizationBroadcaster->_listener invalidate];
    [(NSXPCListener *)authorizationBroadcaster->_listener setDelegate:0];
  }
LABEL_37:
  objc_setProperty_nonatomic(self, v30, 0, 24);
  objc_setProperty_nonatomic(self, v32, 0, 112);
  objc_setProperty_nonatomic(self, v33, 0, 64);
  objc_setProperty_nonatomic(self, v34, 0, 32);
  objc_setProperty_nonatomic(self, v35, 0, 96);
  objc_setProperty_nonatomic(self, v36, 0, 40);
  objc_setProperty_nonatomic(self, v37, 0, 120);
  objc_setProperty_nonatomic(self, v38, 0, 56);
  objc_setProperty_nonatomic(self, v39, 0, 104);
  objc_setProperty_nonatomic(self, v40, 0, 48);
  v41.receiver = self;
  v41.super_class = (Class)RDDaemon;
  [(RDDaemon *)&v41 dealloc];
}

- (id)authorizedAndInterestedClientsForSensor:(id)a3
{
  id v5 = +[NSMutableSet set];
  id v7 = +[SRSensorDescription sensorDescriptionForSensor:a3];
  if (objc_msgSend(objc_msgSend(v7, "legacyName"), "isEqualToString:", a3))
  {
    id v8 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = a3;
      __int16 v29 = 2114;
      id v30 = [v7 name];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Converting authorization query for legacy name %{public}@ to new name %{public}@", buf, 0x16u);
    }
    a3 = [v7 name];
  }
  if (self)
  {
    clientInterest = self->_clientInterest;
    if (clientInterest)
    {
      id v10 = [(NSCache *)clientInterest->_clientInterestCache rd_objectsForSensor:a3 fallbackURL:sub_10001BCE4((NSURL *)clientInterest->_fileURLs, a3)];
      v11 = qword_10006EC58;
      v12 = "zmoSyncing>\"16@\"NSString\"24@\"NSString\"32";
      if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  id v10 = 0;
  v11 = qword_10006EC58;
  v12 = "v40@0:8@\"<RDGizmoSyncing>\"16@\"NSString\"24@\"NSString\"32" + 14;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    *(_DWORD *)buf = *((void *)v12 + 74);
    id v28 = a3;
    __int16 v29 = 2113;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found interested clients for %{public}@: %{private}@", buf, 0x16u);
  }
LABEL_9:
  if (self) {
    authStore = self->_authStore;
  }
  else {
    authStore = 0;
  }
  id v14 = [(SRAuthorizationStore *)authStore readerAuthorizationValues];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if ([v14 objectForKeyedSubscript:v19][v19 objectForKeyedSubscript:a3][@"BOOLValue"])[v5 addObject:v19]; {
      }
        }
      id v16 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
  id v20 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v12 + 74);
    id v28 = a3;
    __int16 v29 = 2113;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Found authorized clients for %{public}@: %{private}@", buf, 0x16u);
  }
  return v5;
}

- (void)setWriterService:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Disabling";
    if (v4) {
      CFStringRef v7 = @"Enabling";
    }
    int v11 = 138412546;
    CFStringRef v12 = v7;
    __int16 v13 = 2114;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ on-demand writer service %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [a3 UTF8String];
  if (launch_set_system_service_enabled())
  {
    id v8 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
    {
      if (v4) {
        CFStringRef v9 = @"enable";
      }
      else {
        CFStringRef v9 = @"disable";
      }
      uint64_t v10 = xpc_strerror();
      int v11 = 138412802;
      CFStringRef v12 = v9;
      __int16 v13 = 2114;
      id v14 = a3;
      __int16 v15 = 2082;
      uint64_t v16 = v10;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Failed to %@ service %{public}@ because %{public}s", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)requestFileHandleForReading:(id)a3 reply:(id)a4
{
}

- (void)requestFileHandleForReading:(id)a3 afterSegment:(id)a4 reply:(id)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  uint64_t v67 = 0;
  if ((sub_10002C058((uint64_t)+[NSXPCConnection currentConnection], a3, (id *)&self->_defaults->super.isa, self, &v67) & 1) == 0)
  {
    int v11 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v67;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connection not valid because %{public}@", buf, 0xCu);
    }
    CFStringRef v76 = @"error";
    uint64_t v77 = v67;
    CFStringRef v12 = (SRError **)&v77;
    __int16 v13 = &v76;
    goto LABEL_9;
  }
  id v9 = [a3 deviceIdentifier];
  if (!v9)
  {
    self;
    id v9 = (id)qword_10006ECB0;
    if (!qword_10006ECB0)
    {
      CFStringRef v74 = @"error";
      v75 = +[SRError errorWithCode:8198];
      CFStringRef v12 = &v75;
      __int16 v13 = &v74;
LABEL_9:
      (*((void (**)(id, NSDictionary *))a5 + 2))(a5, +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:1]);
      return;
    }
  }
  id v65 = [a3 sensor];
  if ([a4 length]) {
    [a4 doubleValue];
  }
  else {
    [a3 from];
  }
  double v14 = v10;
  __int16 v15 = +[NSXPCConnection currentConnection];
  id v16 = [a3 sensor];
  if (!v15
    || (id v17 = v16,
        v18 = [@"com.apple.private.sensorkit.export.allow-all" isEqualToString:@"com.apple.sensorkit.reader.allow"], !-[NSXPCConnection _sr_hasEntitlement:sensor:valueProvider:](v15, "_sr_hasEntitlement:sensor:valueProvider:", @"com.apple.private.sensorkit.export.allow-all", v17, self))&& (!v18 ? (CFStringRef v19 = 0) : (CFStringRef v19 = @"com.apple.developer.sensorkit.reader.allow"), !-[NSXPCConnection _sr_hasEntitlement:sensor:valueProvider:](v15, "_sr_hasEntitlement:sensor:valueProvider:", v19, v17, self)))
  {
    id v27 = [a3 bundleIdentifier];
    id v28 = [[-[NSDictionary objectForKeyedSubscript:](-[SRAuthorizationStore readerLastModifiedAuthorizationTimes](self->_authStore, "readerLastModifiedAuthorizationTimes"), "objectForKeyedSubscript:", v27), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(a3, "sensor"), "sr_sensorByDeletingDeletionRecord")]
    if (v28)
    {
      [v28 doubleValue];
      double v30 = v29;
      unint64_t v68 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      mach_get_times();
      uint64_t v31 = *(void *)buf;
      uint64_t v32 = *(void *)&buf[8];
      unint64_t v33 = v68;
      context = v26;
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v34 = qword_10006EC90;
      double v35 = *(double *)&qword_10006EC98;
      double v36 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      if (v34 >= v33) {
        double v37 = -v37;
      }
      double v21 = fmax(v30 - (double)v31 + kCFAbsoluteTimeIntervalSince1970 + (double)v32 * -0.000000001 + v35 + v36 + v37, v14);
      if (v21 == v14) {
        goto LABEL_35;
      }
    }
    else
    {
      SEL v38 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
      {
        id v63 = [a3 sensor];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v63;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "No last authorized time found for bundle %{public}@, sensor %{public}@", buf, 0x16u);
      }
      double v21 = INFINITY;
      if (v14 == INFINITY) {
        goto LABEL_35;
      }
    }
LABEL_20:
    long long v23 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [a3 bundleIdentifier];
      *(_DWORD *)buf = 134349826;
      *(double *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      __int16 v70 = 2114;
      id v71 = v65;
      __int16 v72 = 2050;
      double v73 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Requested start time %{public}f before the last authorized time for bundle %{public}@, sensor %{public}@. Adjusting start time to %{public}f", buf, 0x2Au);
    }
    a4 = [(NSURL *)sub_10001BFB4(v21) lastPathComponent];
    [a3 to];
    if (v21 > v25) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  id v20 = qword_10006EC58;
  double v21 = v14;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
  {
    id v22 = [a3 sensor];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Connection %{public}@ has entitlement to bypass authorization time data access restriction for %{public}@", buf, 0x16u);
    double v21 = v14;
  }
  if (v21 != v14) {
    goto LABEL_20;
  }
LABEL_35:
  double v21 = v14;
  [a3 to];
  if (v14 > v39) {
    goto LABEL_37;
  }
LABEL_36:
  if (!__isinfd())
  {
    objc_super v41 = sub_10003A04C(v65, v9, self->_fileURLs, self->_defaults, [a3 bundleIdentifier]);
    id v42 = sub_10000BD98([RDReadableDatastore alloc], v41);
    unint64_t v68 = 0;
    if ([a4 length])
    {
      long long v43 = sub_10000C6CC((uint64_t)v42, a4, &v68);

      long long v44 = +[NSXPCConnection currentConnection];
      if (!v44)
      {
LABEL_47:
        v46 = sub_10003A04C([a3 sensor], [a3 deviceIdentifier], self->_fileURLs, self->_defaults, [a3 bundleIdentifier]);
        v47 = sub_10001DAB4([RDReader alloc], v46);
        double v48 = sub_10001E058((uint64_t)v47, v43);

        double v49 = (double)(uint64_t)sub_10002B0DC(&self->_defaults->super.isa, [a3 sensor]);
        uint64_t v50 = mach_continuous_time();
        if (qword_10006EC88 != -1) {
          dispatch_once(&qword_10006EC88, &stru_10005CDC0);
        }
        unint64_t v51 = qword_10006EC90;
        double v52 = *(double *)&qword_10006EC98;
        double v53 = *(double *)&qword_10006ECA0;
        TMConvertTicksToSeconds();
        if (v51 >= v50) {
          double v54 = -v54;
        }
        if (v48 > v52 - v49 + v53 + v54)
        {
          v55 = qword_10006EC58;
          if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349056;
            *(double *)&uint8_t buf[4] = v21;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Refusing to provide data for sample time %{public}f because the segment covering that time contains samples after the holding period", buf, 0xCu);
          }
          goto LABEL_39;
        }
LABEL_54:
        v56 = +[NSMutableDictionary dictionaryWithDictionary:v43];
        v57 = +[NSMutableDictionary dictionaryWithDictionary:sub_10002B204((NSDictionary *)self->_defaults, v65)];
        stateCache = self->_stateCache;
        if (stateCache) {
          double remoteRTCOffset = stateCache->_remoteRTCOffset;
        }
        else {
          double remoteRTCOffset = 0.0;
        }
        [(NSMutableDictionary *)v57 setObject:+[NSNumber numberWithDouble:remoteRTCOffset] forKeyedSubscript:@"RTCOffset"];
        [(NSMutableDictionary *)v56 setObject:+[NSDictionary dictionaryWithDictionary:v57] forKeyedSubscript:@"defaults"];
        if (v41) {
          id Property = objc_getProperty(v41, v60, 32, 1);
        }
        else {
          id Property = 0;
        }
        [(NSMutableDictionary *)v56 setObject:sub_100028AD0((uint64_t)RDDeviceInfo, Property) forKeyedSubscript:@"deviceDetails"];
        if (v68) {
          [(NSMutableDictionary *)v56 setObject:v68 forKeyedSubscript:@"error"];
        }
        (*((void (**)(id, NSMutableDictionary *))a5 + 2))(a5, v56);
        goto LABEL_40;
      }
    }
    else
    {
      long long v43 = sub_10000C19C((uint64_t)v42, &v68, v21);

      long long v44 = +[NSXPCConnection currentConnection];
      if (!v44) {
        goto LABEL_47;
      }
    }
    long long v45 = v44;
    if ([a3 bypassHoldingPeriod]
      && [(NSXPCConnection *)v45 sr_hasHoldingPeriodBypassEntitlement:self])
    {
      goto LABEL_54;
    }
    goto LABEL_47;
  }
LABEL_37:
  SEL v40 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
  {
    [a3 to];
    *(_DWORD *)buf = 134349312;
    *(double *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v62;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Fetch request start time %{public}f is after the request end time %{public}f", buf, 0x16u);
  }
LABEL_39:
  (*((void (**)(id, void *))a5 + 2))(a5, &__NSDictionary0__struct);
LABEL_40:
}

- (void)startRecording:(id)a3 reply:(id)a4
{
  if ([a3 configurationDecodeError])
  {
    CFStringRef v7 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = [a3 configurationDecodeError];
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid requested configuration: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    (*((void (**)(id, SRError *))a4 + 2))(a4, +[SRError errorWithCode:0x4000]);
  }
  else
  {
    id v8 = [a3 sensorConfiguration];
    sub_100033710((uint64_t)self, 1, a3, (uint64_t)v8, (uint64_t)a4);
  }
}

- (void)stopRecording:(id)a3 reply:(id)a4
{
}

- (void)fetchReaderMetadata:(id)a3 reply:(id)a4
{
  uint64_t v21 = 0;
  if (sub_10002C058((uint64_t)+[NSXPCConnection currentConnection], a3, (id *)&self->_defaults->super.isa, self, &v21))
  {
    id v7 = [a3 sensor];
    double v8 = (double)(uint64_t)sub_10002B0DC(&self->_defaults->super.isa, v7);
    uint64_t v9 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v10 = qword_10006EC90;
    double v11 = *(double *)&qword_10006EC98;
    double v12 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v10 >= v9) {
      double v13 = -v13;
    }
    double v14 = v11 - v8 + v12 + v13;
    id v15 = +[SRSensorDescription sensorDescriptionForSensor:v7];
    stateCache = self->_stateCache;
    if (stateCache) {
      serviceStartTimes = stateCache->_serviceStartTimes;
    }
    else {
      serviceStartTimes = 0;
    }
    unsigned int v18 = -[NSDictionary objectForKeyedSubscript:](serviceStartTimes, "objectForKeyedSubscript:", [v15 authorizationService]);
    if (v18) {
      CFStringRef v19 = v18;
    }
    else {
      CFStringRef v19 = &off_1000614D8;
    }
    v22[0] = @"ServiceStartTime";
    v22[1] = @"EarliestEligibleTimestamp";
    v23[0] = v19;
    v23[1] = +[NSNumber numberWithDouble:v14];
    (*((void (**)(id, NSDictionary *))a4 + 2))(a4, +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2]);
  }
  else
  {
    id v20 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Connection not valid because %{public}@", buf, 0xCu);
    }
    (*((void (**)(id, void *))a4 + 2))(a4, &__NSDictionary0__struct);
  }
}

- (void)fetchAllDevices:(id)a3 reply:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  uint64_t v12 = 0;
  if (sub_10002C058((uint64_t)+[NSXPCConnection currentConnection], a3, (id *)&self->_defaults->super.isa, self, &v12))
  {
    id v7 = sub_100039FA8([a3 sensor], 0, self->_fileURLs, self->_defaults);
    double v8 = (NSSet *)sub_10000E0F0([RDInformingDatastore alloc], v7);
    uint64_t v9 = sub_10000E348(v8);

    unint64_t v10 = sub_100033E10((NSArray *)self, [(NSSet *)v9 allObjects]);
    (*((void (**)(id, NSArray *, void))a4 + 2))(a4, v10, 0);
  }
  else
  {
    double v11 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connection not valid because %{public}@", buf, 0xCu);
    }
    (*((void (**)(id, void *, uint64_t))a4 + 2))(a4, &__NSArray0__struct, v12);
  }
}

- (void)startWritingForSensor:(id)a3
{
  id v5 = +[NSXPCConnection currentConnection];
  self;
  v6 = (void *)qword_10006ECB0;
  if (!qword_10006ECB0)
  {
    uint64_t v14 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v15 = "Failed to find the current device ID";
    goto LABEL_16;
  }
  if (!self) {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  if (!a3)
  {
    uint64_t v14 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v15 = "No sensor identifier specified. Ignoring request";
LABEL_16:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    return;
  }
  id v16 = 0;
  if (v5)
  {
    if (sub_10002C300((BOOL)v5, @"com.apple.sensorkit.writer.allow", a3, 0, 0, (id *)&self->_defaults->super.isa, self, &v16))
    {
      goto LABEL_9;
    }
    id v7 = v16;
    double v8 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = 0;
    double v8 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
      id v7 = v16;
    }
  }
  if (![v7 code])
  {
    [(NSXPCConnection *)v5 invalidate];
    return;
  }
LABEL_9:
  uint64_t v9 = sub_100039FA8(a3, v6, self->_fileURLs, self->_defaults);
  sub_100009268((uint64_t)self->_writerListener, v5, v9);
  BOOL v10 = sub_100031D24((unint64_t *)self, (uint64_t)a3);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_1000341F8;
  unsigned int v18 = &unk_10005D220;
  id v19 = a3;
  id v11 = [(NSXPCConnection *)v5 remoteObjectProxyWithErrorHandler:buf];
  clientInterest = self->_clientInterest;
  if (clientInterest) {
    id v13 = [(NSCache *)clientInterest->_sensorConfigurationCache rd_objectsForSensor:a3 fallbackURL:sub_10001BD2C((NSURL *)clientInterest->_fileURLs, a3)];
  }
  else {
    id v13 = 0;
  }
  [v11 setMonitoring:v10 withRequestedConfigurations:[v13 allObjects]];
}

- (void)requestFileHandleForWritingWithReply:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v5 = +[NSXPCConnection currentConnection];
  writerListener = self->_writerListener;
  if (!writerListener
    || (id v7 = [(NSMapTable *)writerListener->_connections objectForKey:v5]) == 0
    || (uint64_t v9 = v7, (Property = objc_getProperty(v7, v8, 24, 1)) == 0))
  {
    id v42 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@ is not connected as a writer", buf, 0xCu);
    }
    CFStringRef v72 = @"error";
    id v73 = +[SRError connectionNotFoundError];
    long long v43 = &v73;
    long long v44 = &v72;
    goto LABEL_58;
  }
  double v60 = 0.0;
  if (!v5)
  {
    double v45 = 0.0;
    v46 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  id v11 = Property;
  if (!sub_10002C300((BOOL)v5, @"com.apple.sensorkit.writer.allow", Property, 0, 0, (id *)&self->_defaults->super.isa, self, &v60))
  {
    double v45 = v60;
    v46 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
LABEL_36:
      CFStringRef v70 = @"error";
      double v71 = v45;
      long long v43 = (id *)&v71;
      long long v44 = &v70;
LABEL_58:
      (*((void (**)(id, NSDictionary *))a3 + 2))(a3, +[NSDictionary dictionaryWithObjects:v43 forKeys:v44 count:1]);
      return;
    }
LABEL_35:
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    __int16 v62 = 2114;
    double v63 = v45;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    double v45 = v60;
    goto LABEL_36;
  }
  id v12 = +[SRSensorDescription sensorDescriptionForSensor:v11];
  double v13 = COERCE_DOUBLE([v12 writerAuthorizationService]);
  if (v13 != 0.0)
  {
    double v14 = v13;
    authStore = self->_authStore;
    [(NSXPCConnection *)v5 auditToken];
    if (![(SRAuthorizationStore *)authStore checkAccessForService:*(void *)&v14 auditToken:v59])
    {
      v47 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v62 = 2114;
        double v63 = v14;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@] Writer is does not have explicit writer authorization to %{public}@", buf, 0x16u);
      }
      CFStringRef v68 = @"error";
      id v69 = +[SRError authorizationErrorWithStatus:12289];
      long long v43 = &v69;
      long long v44 = &v68;
      goto LABEL_58;
    }
  }
  uint64_t v16 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v17 = qword_10006EC90;
  double v18 = *(double *)&qword_10006EC98;
  double v19 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v17 >= v16) {
    double v20 = -v20;
  }
  stateCache = self->_stateCache;
  if (stateCache)
  {
    double timeSyncTimestamp = stateCache->_timeSyncTimestamp;
    double v23 = v19 + v18;
    gizmoSyncService = self->_gizmoSyncService;
    if (gizmoSyncService) {
      goto LABEL_14;
    }
  }
  else
  {
    double timeSyncTimestamp = 0.0;
    double v23 = v19 + v18;
    gizmoSyncService = self->_gizmoSyncService;
    if (gizmoSyncService)
    {
LABEL_14:
      BOOL v25 = gizmoSyncService->_side == 0;
      double v26 = v23 + v20;
      if (timeSyncTimestamp != 0.0) {
        BOOL v25 = 0;
      }
      if (v25) {
        goto LABEL_55;
      }
      goto LABEL_17;
    }
  }
  double v26 = v23 + v20;
  if (timeSyncTimestamp == 0.0) {
    goto LABEL_55;
  }
LABEL_17:
  if (v26 < timeSyncTimestamp)
  {
LABEL_55:
    v58 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&uint8_t buf[4] = timeSyncTimestamp;
      __int16 v62 = 2050;
      double v63 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Refusing to provide a segment because the last time synced (%{public}f) with the companion is invalid compared to the current time (%{public}f)", buf, 0x16u);
    }
    CFStringRef v66 = @"error";
    uint64_t v67 = +[SRError errorWithCode:8199];
    long long v43 = (id *)&v67;
    long long v44 = &v66;
    goto LABEL_58;
  }
  id v27 = sub_10000B3B0([RDWriteableDatastore alloc], v9);
  id v28 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Sending file handles for writing sensor %{public}@", buf, 0xCu);
    uint64_t v29 = mach_continuous_time();
    if (qword_10006EC88 == -1) {
      goto LABEL_20;
    }
LABEL_50:
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    goto LABEL_20;
  }
  uint64_t v29 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    goto LABEL_50;
  }
LABEL_20:
  unint64_t v30 = qword_10006EC90;
  double v31 = *(double *)&qword_10006EC98;
  double v32 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v30 >= v29) {
    double v33 = -v33;
  }
  double v34 = v32 + v31 + v33;
  [v12 roundingInterval];
  if (v35 == 0.0)
  {
    double v41 = v34;
  }
  else
  {
    double v36 = v35;
    double v37 = sub_10000B550((uint64_t)v27);
    if (v37 > v34)
    {
      SEL v38 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v62 = 2048;
        double v63 = v37;
        __int16 v64 = 2048;
        double v65 = v34;
        _os_log_fault_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "[%{public}@] Datastore contains samples from the future (%f > %f)", buf, 0x20u);
      }
      double v37 = nan("");
    }
    int v39 = __isnand();
    double v40 = v34 - v37;
    if (v39) {
      double v40 = v36;
    }
    if (v40 >= v36) {
      double v41 = SRAbsoluteTimeRoundedDownToNearestInterval(v34, v36);
    }
    else {
      double v41 = v37 + 0.000000999999997;
    }
    double v48 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v62 = 2050;
      double v63 = v41;
      __int16 v64 = 2050;
      double v65 = v34;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "[%{public}@] Rounded segment time to %{public}f from %{public}f", buf, 0x20u);
    }
  }
  double v49 = [(NSURL *)sub_10001BFB4(v41) lastPathComponent];
  uint64_t v50 = [(NSURL *)sub_10001BFB4(v41 + 0.000000999999997) lastPathComponent];
  unint64_t v51 = [(NSURL *)sub_10001BFB4(v41 + 0.000000999999997) lastPathComponent];
  *(void *)buf = 0;
  double v53 = sub_10000BB04((uint64_t)v27, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (const __CFString **)buf);

  double v54 = +[NSMutableDictionary dictionaryWithDictionary:v53];
  v55 = +[NSMutableDictionary dictionaryWithDictionary:sub_10002B204((NSDictionary *)self->_defaults, v11)];
  v56 = self->_stateCache;
  if (v56) {
    double remoteRTCOffset = v56->_remoteRTCOffset;
  }
  else {
    double remoteRTCOffset = 0.0;
  }
  [(NSMutableDictionary *)v55 setObject:+[NSNumber numberWithDouble:remoteRTCOffset] forKeyedSubscript:@"RTCOffset"];
  [(NSMutableDictionary *)v54 setObject:+[NSDictionary dictionaryWithDictionary:v55] forKeyedSubscript:@"defaults"];
  if (*(void *)buf) {
    [(NSMutableDictionary *)v54 setObject:*(void *)buf forKeyedSubscript:@"error"];
  }
  (*((void (**)(id, NSMutableDictionary *))a3 + 2))(a3, v54);
}

- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 reply:(id)a4
{
  id v7 = +[NSXPCConnection currentConnection];
  writerListener = self->_writerListener;
  if (writerListener)
  {
    id v9 = [(NSMapTable *)writerListener->_connections objectForKey:v7];
    if (v9)
    {
      id Property = objc_getProperty(v9, v10, 24, 1);
      if (Property)
      {
        uint64_t v16 = 0;
        if (v7)
        {
          id v12 = Property;
          if (sub_10002C300((BOOL)v7, @"com.apple.sensorkit.writer.allow", Property, 0, 0, (id *)&self->_defaults->super.isa, self, &v16))
          {
            sub_100034F9C((uint64_t)self, a3, v12, (uint64_t)a4);
            return;
          }
          uint64_t v14 = v16;
          id v15 = qword_10006EC58;
          if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v14 = 0;
          id v15 = qword_10006EC58;
          if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
        }
        *(_DWORD *)buf = 138543618;
        double v18 = v7;
        __int16 v19 = 2114;
        uint64_t v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
        uint64_t v14 = v16;
LABEL_12:
        (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v14);
        return;
      }
    }
  }
  double v13 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    double v18 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@ is not connected as a writer", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[SRError connectionNotFoundError]);
}

- (BOOL)validateBundleRecord:(id)a3 withFilters:(id)a4
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [a4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(a4);
      }
      id v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
      if ([v9 isEqualToString:@"TelephonyApp"])
      {
        unsigned int v10 = [a3 sr_supportsVOIP];
        id v11 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
        {
          id v12 = [a3 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          CFStringRef v13 = @"does not support";
          if (v10) {
            CFStringRef v13 = @"supports";
          }
          id v27 = v12;
          __int16 v28 = 2114;
          CFStringRef v29 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ VoIP", buf, 0x16u);
        }
      }
      else
      {
        unsigned int v10 = 1;
      }
      if (![v9 isEqualToString:@"MessagingApp"]) {
        goto LABEL_22;
      }
      if (objc_msgSend(a3, "sr_supportsMessagingIntents"))
      {
        unsigned int v10 = [a3 sr_isSocialNetworking];
        uint64_t v14 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
      }
      else
      {
        unsigned int v10 = 0;
        uint64_t v14 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
        {
LABEL_19:
          id v15 = [a3 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          CFStringRef v16 = @"does not support";
          if (v10) {
            CFStringRef v16 = @"supports";
          }
          id v27 = v15;
          __int16 v28 = 2114;
          CFStringRef v29 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ messaging intents", buf, 0x16u);
        }
      }
LABEL_22:
      if ([v9 isEqualToString:@"DeveloperOptOut"]
        && (unsigned int v10 = objc_msgSend(a3, "sr_supportsDataGeneration"),
            unint64_t v17 = qword_10006EC58,
            os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO)))
      {
        id v18 = [a3 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        CFStringRef v19 = @"does not support";
        if (v10) {
          CFStringRef v19 = @"supports";
        }
        id v27 = v18;
        __int16 v28 = 2114;
        CFStringRef v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ data generation", buf, 0x16u);
        if ((v10 & 1) == 0) {
          return 0;
        }
      }
      else if (!v10)
      {
        return 0;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [a4 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return 1;
      }
    }
  }
  return 1;
}

- (void)startPruningForSensor:(id)a3 deviceId:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  if (!a3)
  {
    id v12 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    CFStringRef v13 = "No sensor identifier specified. Ignoring request";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    return;
  }
  uint64_t v7 = +[NSXPCConnection currentConnection];
  uint64_t v8 = v7;
  uint64_t v14 = 0;
  if (v7)
  {
    if (sub_10002C300((BOOL)v7, @"com.apple.sensorkit.pruner.allow", a3, 0, 0, (id *)&self->_defaults->super.isa, self, &v14))
    {
      goto LABEL_7;
    }
    id v9 = v14;
    unsigned int v10 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
  }
  else
  {
    id v9 = 0;
    unsigned int v10 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      *(_DWORD *)buf = 138543618;
      CFStringRef v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
      id v9 = v14;
    }
  }
  if (![v9 code])
  {
    [(NSXPCConnection *)v8 invalidate];
    return;
  }
LABEL_7:
  if (a4 || (self, (a4 = (id)qword_10006ECB0) != 0))
  {
    id v11 = sub_100039FA8(a3, a4, self->_fileURLs, self->_defaults);
    sub_100009268((uint64_t)self->_prunerListener, v8, v11);
    return;
  }
  id v12 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    CFStringRef v13 = "Failed to find the current device id";
    goto LABEL_12;
  }
}

- (void)requestFileHandleForPruningSample:(double)a3 reply:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  uint64_t v7 = +[NSXPCConnection currentConnection];
  prunerListener = self->_prunerListener;
  if (!prunerListener
    || (id v9 = [(NSMapTable *)prunerListener->_connections objectForKey:v7]) == 0
    || (id v11 = v9, (Property = objc_getProperty(v9, v10, 24, 1)) == 0))
  {
    uint64_t v21 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@ is not connected as a pruner", buf, 0xCu);
    }
    CFStringRef v32 = @"error";
    id v33 = +[SRError connectionNotFoundError];
    long long v22 = &v33;
    long long v23 = &v32;
    goto LABEL_19;
  }
  uint64_t v26 = 0;
  if (!v7)
  {
    uint64_t v24 = 0;
    long long v25 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  CFStringRef v13 = Property;
  if (!sub_10002C300((BOOL)v7, @"com.apple.sensorkit.pruner.allow", Property, 0, 0, (id *)&self->_defaults->super.isa, self, &v26))
  {
    uint64_t v24 = v26;
    long long v25 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:
      CFStringRef v27 = @"error";
      uint64_t v28 = v24;
      long long v22 = (id *)&v28;
      long long v23 = &v27;
LABEL_19:
      (*((void (**)(id, NSDictionary *))a4 + 2))(a4, +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1]);
      return;
    }
LABEL_17:
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v30 = 2114;
    uint64_t v31 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    uint64_t v24 = v26;
    goto LABEL_18;
  }
  id v15 = sub_10000CC60([RDPruneableDatastore alloc], v11);
  *(void *)buf = 0;
  CFStringRef v16 = sub_10000DF78((uint64_t)v15, buf, a3);

  if ([(NSDictionary *)v16 objectForKeyedSubscript:@"samples"]) {
    *((double *)v11 + 6) = a3;
  }
  __int16 v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];
  id v18 = +[NSMutableDictionary dictionaryWithDictionary:sub_10002B204((NSDictionary *)self->_defaults, v13)];
  stateCache = self->_stateCache;
  if (stateCache) {
    double remoteRTCOffset = stateCache->_remoteRTCOffset;
  }
  else {
    double remoteRTCOffset = 0.0;
  }
  [(NSMutableDictionary *)v18 setObject:+[NSNumber numberWithDouble:remoteRTCOffset] forKeyedSubscript:@"RTCOffset"];
  [(NSMutableDictionary *)v17 setObject:+[NSDictionary dictionaryWithDictionary:v18] forKeyedSubscript:@"defaults"];
  if (*(void *)buf) {
    [(NSMutableDictionary *)v17 setObject:*(void *)buf forKeyedSubscript:@"error"];
  }
  (*((void (**)(id, NSMutableDictionary *))a4 + 2))(a4, v17);
}

- (void)requestFileHandleForPruningAfterSegment:(id)a3 reply:(id)a4
{
  uint64_t v7 = +[NSXPCConnection currentConnection];
  prunerListener = self->_prunerListener;
  if (!prunerListener
    || (id v9 = [(NSMapTable *)prunerListener->_connections objectForKey:v7]) == 0
    || (id v11 = v9, (Property = objc_getProperty(v9, v10, 24, 1)) == 0))
  {
    double v41 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@ is not connected as a pruner", buf, 0xCu);
    }
    CFStringRef v53 = @"error";
    id v54 = +[SRError connectionNotFoundError];
    id v42 = &v54;
    long long v43 = &v53;
    goto LABEL_29;
  }
  v46 = 0;
  if (!v7)
  {
    long long v44 = 0;
    id v15 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  CFStringRef v13 = Property;
  BOOL v14 = sub_10002C300((BOOL)v7, @"com.apple.sensorkit.pruner.allow", Property, 0, 0, (id *)&self->_defaults->super.isa, self, &v46);
  id v15 = qword_10006EC58;
  if (!v14)
  {
    long long v44 = v46;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
LABEL_28:
      CFStringRef v47 = @"error";
      double v48 = v44;
      id v42 = &v48;
      long long v43 = &v47;
LABEL_29:
      (*((void (**)(id, NSDictionary *))a4 + 2))(a4, +[NSDictionary dictionaryWithObjects:v42 forKeys:v43 count:1]);
      return;
    }
LABEL_27:
    *(_DWORD *)buf = 138543618;
    uint64_t v50 = v7;
    __int16 v51 = 2114;
    id v52 = v44;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    long long v44 = v46;
    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v50 = v13;
    __int16 v51 = 2114;
    id v52 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Sending pruning file handles for sensor %{public}@ segment %{public}@", buf, 0x16u);
  }
  id v17 = sub_10000CC60([RDPruneableDatastore alloc], v11);
  CFStringRef v45 = 0;
  id v18 = sub_10000E038((uint64_t)v17, a3, &v45);

  if (![(NSDictionary *)v18 objectForKeyedSubscript:@"samples"])
  {
    [a3 doubleValue];
    id v20 = +[SRDeletionRecord tombstoneWithStartTime:0 endTime:*((double *)v11 + 6) reason:v19];
    id v21 = [v13 sr_sensorForDeletionRecordsFromSensor];
    id v23 = objc_getProperty(v11, v22, 32, 1);
    id v25 = objc_getProperty(v11, v24, 8, 1);
    id v27 = objc_getProperty(v11, v26, 16, 1);
    uint64_t v28 = sub_100039FA8(v21, v23, v25, v27);
    CFStringRef v29 = sub_100001E88([RDWriter alloc], v28);
    if (v29)
    {
      uint64_t v30 = mach_continuous_time();
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v31 = qword_10006EC90;
      double v32 = *(double *)&qword_10006EC98;
      double v33 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      if (v31 >= v30) {
        double v34 = -v34;
      }
      sub_100001F54((uint64_t)v29, v20, &v45, v33 + v32 + v34);
    }

    CFStringRef v35 = v45;
    if (v45)
    {
      double v36 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v50 = (void *)v35;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to write deletion records because %{public}@", buf, 0xCu);
      }
    }
  }
  double v37 = +[NSMutableDictionary dictionaryWithDictionary:v18];
  SEL v38 = +[NSMutableDictionary dictionaryWithDictionary:sub_10002B204((NSDictionary *)self->_defaults, v13)];
  stateCache = self->_stateCache;
  if (stateCache) {
    double remoteRTCOffset = stateCache->_remoteRTCOffset;
  }
  else {
    double remoteRTCOffset = 0.0;
  }
  [(NSMutableDictionary *)v38 setObject:+[NSNumber numberWithDouble:remoteRTCOffset] forKeyedSubscript:@"RTCOffset"];
  [(NSMutableDictionary *)v37 setObject:+[NSDictionary dictionaryWithDictionary:v38] forKeyedSubscript:@"defaults"];
  if (v45) {
    [(NSMutableDictionary *)v37 setObject:v45 forKeyedSubscript:@"error"];
  }
  (*((void (**)(id, NSMutableDictionary *))a4 + 2))(a4, v37);
}

- (void)removeAllSamplesForCurrentSensorWithReply:(id)a3
{
  if (!self) {
    goto LABEL_20;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v5 = +[NSXPCConnection currentConnection];
  prunerListener = self->_prunerListener;
  if (prunerListener
    && (id v7 = [(NSMapTable *)prunerListener->_connections objectForKey:v5]) != 0
    && (id v9 = objc_getProperty(v7, v8, 24, 1)) != 0)
  {
    uint64_t v22 = 0;
    if (v5)
    {
      unsigned int v10 = v9;
      BOOL v11 = sub_10002C300((BOOL)v5, @"com.apple.sensorkit.pruner.allow", v9, 0, 0, (id *)&self->_defaults->super.isa, self, &v22);
      id v12 = qword_10006EC58;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Removing all files for sensor %{public}@", buf, 0xCu);
        }
        sub_100031788((uint64_t)self, v10, 0, 0);
        id v13 = [[sub_100009728((uint64_t)self->_writerListener, (uint64_t)v10) firstObject];
        if (v13)
        {
          writerListener = self->_writerListener;
          if (writerListener)
          {
            id v15 = v13;
            id v16 = [(NSMapTable *)writerListener->_connections objectForKey:v13];
            if (v16)
            {
              id Property = objc_getProperty(v16, v17, 24, 1);
              double v19 = qword_10006EC58;
              if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = Property;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Resetting datastore for %{public}@", buf, 0xCu);
              }
              *(void *)buf = _NSConcreteStackBlock;
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = sub_100034CB4;
              SEL v24 = &unk_10005D220;
              id v25 = Property;
              [objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", buf) resetDatastoreFiles:&__NSDictionary0__struct];
            }
          }
        }
        goto LABEL_20;
      }
    }
    else
    {
      id v12 = qword_10006EC58;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v20 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ is not connected as a pruner", buf, 0xCu);
    }
  }
LABEL_20:
  id v21 = (void (*)(id, void))*((void *)a3 + 2);

  v21(a3, 0);
}

- (void)removeAllSamplesForAllSensorsWithReply:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = v5;
  uint64_t v9 = 0;
  if (!v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (!sub_10002C300((BOOL)v5, @"com.apple.sensorkit.pruner.allow", 0, 0, 0, (id *)&self->_defaults->super.isa, self, &v9))
  {
    uint64_t v7 = v9;
    uint64_t v8 = qword_10006EC58;
    if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
LABEL_5:
    *(_DWORD *)buf = 138543618;
    BOOL v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    uint64_t v7 = v9;
    goto LABEL_6;
  }
  sub_100036484((uint64_t)self, 0, 0);
  uint64_t v7 = 0;
LABEL_6:
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v7);
}

- (id)valueForEntitlement:(id)a3 connection:(id)a4
{
  return [a4 valueForEntitlement:a3];
}

- (BOOL)isAuthorizedForSensor:(id)a3 bundleIdentifier:(id)a4
{
  if (self) {
    self = (RDDaemon *)self->_authStore;
  }
  return [(RDDaemon *)self sensorHasReaderAuthorization:a3 forBundleId:a4];
}

- (id)bundleIdForConnection:(id)a3
{
  return sub_10001C7D0((NSURL *)a3);
}

- (void)authorizationStore:(id)a3 didDetermineInitialAuthorizationValues:(id)a4
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036A08;
  block[3] = &unk_10005CEB8;
  block[4] = self;
  dispatch_async(q, block);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = [(NSDictionary *)[(SRAuthorizationStore *)self->_authStore readerAuthorizationValues] allKeys];
  id v16 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v6;
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * v6);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v8 = [(NSDictionary *)[(SRAuthorizationStore *)self->_authStore readerAuthorizationValues] objectForKeyedSubscript:v7];
        id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            __int16 v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v12);
              block[5] = _NSConcreteStackBlock;
              block[6] = 3221225472;
              block[7] = sub_100036668;
              block[8] = &unk_10005D750;
              block[9] = v7;
              block[10] = v13;
              block[11] = self;
              AnalyticsSendEventLazy();
              __int16 v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }
        uint64_t v6 = v17 + 1;
      }
      while ((id)(v17 + 1) != v16);
      id v16 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)authorizationStore:(id)a3 didUpdateAuthorizationsForBundleId:(id)a4 sensors:(id)a5
{
  if (self)
  {
    q = self->_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100036C94;
    v6[3] = &unk_10005D340;
    v6[4] = self;
    v6[5] = a5;
    dispatch_async(q, v6);
  }
}

- (void)authorizationBroadcaster:(id)a3 didSetDataCollectionEnabled:(BOOL)a4
{
  long long v20 = self;
  if (self) {
    self = (RDDaemon *)self->_authStore;
  }
  id v4 = [(RDDaemon *)self readerAuthorizationValues];
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = [v4 objectForKeyedSubscript:v9];
        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
              if ([v4[v9][v15] BOOLValue])[v5 addObject:v15]; {
            }
              }
            id v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }
  sub_100031EC0((uint64_t)v20, v5);

  id v16 = qword_10006EC58;
  BOOL v17 = os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Data collection enabled, telling any authorized writers to start writing again", buf, 2u);
    }
    sub_100034A78((uint64_t)v20, v18);
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Data collection disabled, removing all samples", buf, 2u);
    }
    if (v20) {
      sub_100036484((uint64_t)v20, 0, 0);
    }
  }
}

- (void)launchEventRunActivity:(id)a3
{
  id v4 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  stateCache = v4->_stateCache;
  if (stateCache)
  {
    uint64_t v6 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v7 = qword_10006EC90;
    double v8 = *(double *)&qword_10006EC98;
    double v9 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v7 >= v6) {
      double v10 = -v10;
    }
    if (v9 + v8 + v10 < stateCache->_localDaemonLaunchTime + 3.0 + stateCache->_remoteRTCOffset) {
      AnalyticsSendEventLazy();
    }
  }
  [(RDGizmoSyncing *)v4->_gizmoSync validatePreferWifiAssertion];
  id v11 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v87 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Running %{public}@ activity", buf, 0xCu);
  }
  id v69 = a3;
  if (a3)
  {
    if ([*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.updateCompanionWithSamples"])goto LABEL_12; {
    if ([*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.prepareArchives"])
    }
    {
LABEL_19:
      gizmoSyncService = v4->_gizmoSyncService;
      if (gizmoSyncService)
      {
        int64_t side = gizmoSyncService->_side;
        if (side)
        {
          if (side == 1)
          {
            uint64_t v13 = qword_10006EC58;
            if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
            {
              if (a3) {
                BOOL v17 = (void *)*((void *)a3 + 1);
              }
              else {
                BOOL v17 = 0;
              }
              *(_DWORD *)buf = 138543362;
              id v87 = v17;
              goto LABEL_26;
            }
LABEL_80:
            id v60 = a3;
LABEL_103:
            [v60 markCompleted];
            return;
          }
LABEL_56:
          gizmoSync = v4->_gizmoSync;
          CFStringRef v45 = sub_100039F34(v4->_fileURLs, v4->_defaults);
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          uint64_t v67 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v45);
          v46 = sub_10000ED28(v67, 1);
          id v47 = [v46 countByEnumeratingWithState:&v75 objects:v84 count:16];
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v76;
            while (2)
            {
              for (i = 0; i != v48; i = (char *)i + 1)
              {
                if (*(void *)v76 != v49) {
                  objc_enumerationMutation(v46);
                }
                __int16 v51 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                if ([a3 deferIfNeeded])
                {

                  return;
                }
                if (+[SRSensorDescription sensorDescriptionForSensor:v51])
                {
                  self;
                  [(RDGizmoSyncing *)gizmoSync prepareArchivesForSensor:v51 deviceId:qword_10006ECB0];
                }
                else
                {
                  CFStringRef v53 = qword_10006EC58;
                  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v87 = v51;
                    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Not preparing archive for unknown sensor, %{public}@", buf, 0xCu);
                  }
                }
                a3 = v69;
              }
              id v48 = [v46 countByEnumeratingWithState:&v75 objects:v84 count:16];
              if (v48) {
                continue;
              }
              break;
            }
          }

          goto LABEL_80;
        }
      }
      double v41 = v4->_stateCache;
      if (v41 && v41->_timeSyncTimestamp != 0.0) {
        goto LABEL_56;
      }
      id v42 = qword_10006EC58;
      if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)buf = 0;
      long long v43 = "Unable to create new archives because time hasn't synced with companion";
LABEL_79:
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 2u);
      goto LABEL_80;
    }
    if ([*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.removeOldData"])
    {
LABEL_30:
      if (sub_10001B4B8((uint64_t)v4->_fileURLs))
      {
        sub_100030E0C((uint64_t)v4, a3, (const char *)2, 0);
        sub_100034A78((uint64_t)v4, v24);
        return;
      }
      id v42 = qword_10006EC58;
      if (!os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)buf = 0;
      long long v43 = "No top level directory found, no need to continue";
      goto LABEL_79;
    }
    if ([*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.postMetric"])
    {
LABEL_43:
      long long v29 = sub_100039F34(v4->_fileURLs, v4->_defaults);
      long long v30 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v29);
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      CFStringRef v68 = v30;
      if (v30)
      {
        unint64_t v31 = sub_10000ED28(v30, 0);
        id v32 = [v31 countByEnumeratingWithState:&v71 objects:v83 count:16];
        if (v32) {
          goto LABEL_45;
        }
      }
      else
      {
        unint64_t v31 = 0;
        id v32 = [0 countByEnumeratingWithState:&v71 objects:v83 count:16];
        if (v32)
        {
LABEL_45:
          id v33 = v32;
          uint64_t v34 = *(void *)v72;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v72 != v34) {
                objc_enumerationMutation(v31);
              }
              double v36 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
              self;
              SEL v38 = v4;
              int v39 = sub_100039FA8(v36, (void *)qword_10006ECB0, v4->_fileURLs, v4->_defaults);
              CFStringRef v70 = sub_10000E0F0([RDInformingDatastore alloc], v39);
              AnalyticsSendEventLazy();

              id v4 = v38;
            }
            id v33 = [v31 countByEnumeratingWithState:&v71 objects:v83 count:16];
          }
          while (v33);
        }
      }
      double v40 = v68;
      goto LABEL_102;
    }
    if (([*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.syncCompanionStateToGizmo"] & 1) != 0|| objc_msgSend(*((id *)a3 + 1), "isEqualToString:", @"com.apple.sensorkit.syncCompanionStateToGizmoLocked"))
    {
LABEL_72:
      sub_100032800((uint64_t)v4);
      uint64_t notifier = (uint64_t)v4->_notifier;
      uint64_t v55 = mach_continuous_time();
      if (qword_10006EC88 != -1) {
        dispatch_once(&qword_10006EC88, &stru_10005CDC0);
      }
      unint64_t v56 = qword_10006EC90;
      double v57 = *(double *)&qword_10006EC98;
      double v58 = *(double *)&qword_10006ECA0;
      TMConvertTicksToSeconds();
      if (v56 >= v55) {
        double v59 = -v59;
      }
      sub_10001F6EC(notifier, v58 + v57 + v59);
      goto LABEL_80;
    }
    if ([*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.decryptArchives"])
    {
LABEL_82:
      v61 = v4->_gizmoSyncService;
      if (v61 && v61->_side)
      {
        [(RDGizmoSyncing *)v4->_gizmoSync decryptArchivesWithActivity:a3];
        return;
      }
      double v63 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
      {
        if (a3) {
          __int16 v64 = (void *)*((void *)a3 + 1);
        }
        else {
          __int16 v64 = 0;
        }
        *(_DWORD *)buf = 138543362;
        id v87 = v64;
        _os_log_fault_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_FAULT, "Shouldn't be running %{public}@ on the watch", buf, 0xCu);
      }
      goto LABEL_80;
    }
    __int16 v62 = (void *)*((void *)a3 + 1);
  }
  else
  {
    if ([0 isEqualToString:@"com.apple.sensorkit.updateCompanionWithSamples"])
    {
LABEL_12:
      id v12 = v4->_gizmoSyncService;
      if (v12 && v12->_side == 1)
      {
        uint64_t v13 = qword_10006EC58;
        if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            BOOL v14 = (void *)*((void *)a3 + 1);
          }
          else {
            BOOL v14 = 0;
          }
          *(_DWORD *)buf = 138543362;
          id v87 = v14;
LABEL_26:
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "This activity should not be called on the companion side. %{public}@", buf, 0xCu);
          goto LABEL_80;
        }
        goto LABEL_80;
      }
      id v18 = v4->_gizmoSync;
      long long v19 = sub_100039F34(v4->_fileURLs, v4->_defaults);
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      CFStringRef v66 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v19);
      long long v20 = sub_10000ED28(v66, 1);
      id v21 = [v20 countByEnumeratingWithState:&v79 objects:v85 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v80;
LABEL_33:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v80 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v26 = *(void **)(*((void *)&v79 + 1) + 8 * v25);
          if (+[SRSensorDescription sensorDescriptionForSensor:v26])
          {
            self;
            [(RDGizmoSyncing *)v18 sendSnapshotForSensor:v26 deviceId:qword_10006ECB0];
            if ([v69 deferIfNeeded])
            {

              return;
            }
          }
          else
          {
            long long v28 = qword_10006EC58;
            if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              id v87 = v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Not sending archive for unknown sensor, %{public}@", buf, 0xCu);
            }
          }
          if (v22 == (id)++v25)
          {
            id v22 = [v20 countByEnumeratingWithState:&v79 objects:v85 count:16];
            if (!v22) {
              break;
            }
            goto LABEL_33;
          }
        }
      }
      double v40 = v66;
LABEL_102:

      id v60 = v69;
      goto LABEL_103;
    }
    if ([0 isEqualToString:@"com.apple.sensorkit.prepareArchives"]) {
      goto LABEL_19;
    }
    if ([0 isEqualToString:@"com.apple.sensorkit.removeOldData"]) {
      goto LABEL_30;
    }
    if ([0 isEqualToString:@"com.apple.sensorkit.postMetric"]) {
      goto LABEL_43;
    }
    if (([0 isEqualToString:@"com.apple.sensorkit.syncCompanionStateToGizmo"] & 1) != 0
      || ([0 isEqualToString:@"com.apple.sensorkit.syncCompanionStateToGizmoLocked"] & 1) != 0)
    {
      goto LABEL_72;
    }
    unsigned __int8 v65 = [0 isEqualToString:@"com.apple.sensorkit.decryptArchives"];
    __int16 v62 = 0;
    if (v65) {
      goto LABEL_82;
    }
  }
  if ([v62 isEqualToString:@"com.apple.sensorkit.gcKeys"]) {
    sub_1000304CC((uint64_t)v4, a3);
  }
}

- (void)launchEventXPCEventReceived:(id)a3
{
  id v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a3, _xpc_event_key_name)];
  id v5 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    double v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received XPC Event %{public}@", (uint8_t *)&v7, 0xCu);
  }
  unsigned int v6 = [(NSString *)v4 isEqualToString:@"com.apple.Preferences.ResetPrivacyWarningsNotification"];
  if (self)
  {
    if (v6) {
      sub_100036484((uint64_t)self, 0, 0);
    }
  }
}

- (void)launchEventCheckInActivity:(id)a3
{
  if (a3)
  {
    if (![*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.updateCompanionWithSamples"])return; {
  }
    }
  else if (![0 isEqualToString:@"com.apple.sensorkit.updateCompanionWithSamples"])
  {
    return;
  }
  gizmoSyncService = self->_gizmoSyncService;
  if (gizmoSyncService && gizmoSyncService->_side == 1)
  {
    sub_100024818((uint64_t)a3);
  }
}

- (int64_t)cacheDelete:(id)a3 purgeWithUrgency:(int64_t)a4 dryRun:(BOOL)a5
{
  BOOL v60 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  int v7 = sub_100039F34(self->_fileURLs, self->_defaults);
  double v8 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v7);
  uint64_t v9 = mach_continuous_time();
  p_cb = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  id v11 = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
  unint64_t v12 = qword_10006EC90;
  uint64_t v13 = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
  double v14 = *(double *)&qword_10006EC98;
  double v15 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v12 >= v9) {
    double v17 = -v16;
  }
  else {
    double v17 = v16;
  }
  id v18 = sub_10002BCD4((id *)&self->_defaults->super.isa);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  if (v8) {
    long long v19 = sub_10000ED28(v8, 0);
  }
  else {
    long long v19 = 0;
  }
  id v55 = [v19 countByEnumeratingWithState:&v66 objects:v71 count:16];
  int64_t v20 = 0;
  if (v55)
  {
    double v21 = v15 + v14 + v17 + (double)(uint64_t)v18;
    uint64_t v22 = *(void *)v67;
    CFStringRef v53 = v19;
    int64_t v54 = a4;
    double v57 = v8;
    uint64_t v52 = *(void *)v67;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v67 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v56 = v23;
        long long v24 = *(void **)(*((void *)&v66 + 1) + 8 * v23);
        uint64_t v25 = sub_100039FA8(v24, 0, self->_fileURLs, self->_defaults);
        double v59 = (NSSet *)sub_10000E0F0([RDInformingDatastore alloc], v25);
        double v26 = sub_10002A96C((uint64_t)self->_defaults, a4, v24);
        uint64_t v27 = mach_continuous_time();
        if (*((void *)p_cb + 401) != -1) {
          dispatch_once(&qword_10006EC88, &stru_10005CDC0);
        }
        uint64_t v28 = *((void *)v11 + 402);
        double v29 = *((double *)v13 + 403);
        double v30 = *(double *)&qword_10006ECA0;
        TMConvertTicksToSeconds();
        long long v62 = 0u;
        long long v63 = 0u;
        if (v28 >= v27) {
          double v32 = -v31;
        }
        else {
          double v32 = v31;
        }
        long long v64 = 0uLL;
        long long v65 = 0uLL;
        id v33 = sub_10000E348(v59);
        id v34 = [(NSSet *)v33 countByEnumeratingWithState:&v62 objects:v70 count:16];
        if (v34)
        {
          id v35 = v34;
          double v36 = fmax(v29 - v26 + v30 + v32, 0.0);
          uint64_t v37 = *(void *)v63;
          while (2)
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v63 != v37) {
                objc_enumerationMutation(v33);
              }
              int v39 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              double v41 = sub_100039FA8(v24, v39, self->_fileURLs, self->_defaults);
              id v42 = sub_10000CC60([RDPruneableDatastore alloc], (void **)&v41->super.isa);
              uint64_t v43 = sub_10000CE04((uint64_t)v42, (const char *)1, 0, v60, v36, v21);

              BOOL v44 = __OFADD__(v20, v43);
              v20 += v43;
              if (v44)
              {
                uint64_t v50 = qword_10006EC58;
                if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_FAULT, "Counting any more file sizes will overflow", buf, 2u);
                }

                goto LABEL_35;
              }
            }
            id v35 = [(NSSet *)v33 countByEnumeratingWithState:&v62 objects:v70 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }

        uint64_t v23 = v56 + 1;
        double v8 = v57;
        long long v19 = v53;
        a4 = v54;
        p_cb = (_DWORD *)(&OBJC_PROTOCOL___CBPeripheralDelegate + 64);
        id v11 = (_DWORD *)(&OBJC_PROTOCOL___CBPeripheralDelegate + 64);
        uint64_t v13 = (_DWORD *)(&OBJC_PROTOCOL___CBPeripheralDelegate + 64);
        uint64_t v22 = v52;
      }
      while ((id)(v56 + 1) != v55);
      id v55 = [v53 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v55);
  }

  CFStringRef v45 = +[NSFileManager defaultManager];
  v46 = sub_10001BF14();
  uint64_t v47 = sub_1000198A4((uint64_t)v45, v46, v60);
  BOOL v44 = __OFADD__(v20, v47);
  v20 += v47;
  if (v44)
  {
    uint64_t v49 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, "Counting any more file sizes will overflow", buf, 2u);
    }
  }
LABEL_35:
  if (!v60 && v20 >= 1) {
    sub_100034A78((uint64_t)self, v48);
  }
  return v20;
}

- (NSDictionary)currentRecordingStatesForAnalytics:(NSDictionary *)result
{
  if (result)
  {
    v1 = (unint64_t *)result;
    id v2 = +[NSMutableDictionary dictionary];
    if (sub_10002A018(v1[7])) {
      char v3 = sub_10002A140(v1[7]);
    }
    else {
      char v3 = 0;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = (void *)sub_10001A21C();
    obj = sub_10001A5B4(v4);
    id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v21;
      if (v3)
      {
        do
        {
          double v8 = 0;
          do
          {
            if (*(void *)v21 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v8);
            id v11 = [v9 name:context];
            id v12 = [[objc_msgSend(v1, "authorizedAndInterestedClientsForSensor:", v11) count];
            [v2 setObject:[NSNumber numberWithBool:v12 != 0] forKeyedSubscript:v11];
            id v13 = [v9 legacyName];
            if (v13) {
              [v2 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12 != 0)] forKeyedSubscript:v13];
            }
            double v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v6);
      }
      else
      {
        do
        {
          double v14 = 0;
          do
          {
            if (*(void *)v21 != v7) {
              objc_enumerationMutation(obj);
            }
            double v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v14);
            [v2 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0)] forKeyedSubscript:objc_msgSend(v15, "name", context)];
            id v17 = [v15 legacyName];
            if (v17) {
              [v2 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0)] forKeyedSubscript:v17];
            }
            double v14 = (char *)v14 + 1;
          }
          while (v6 != v14);
          id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v6);
      }
    }
    return +[NSDictionary dictionaryWithDictionary:v2];
  }
  return result;
}

- (void)gizmoSyncConnectedDevicesAdded:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  gizmoSyncService = self->_gizmoSyncService;
  if (gizmoSyncService && gizmoSyncService->_side)
  {
    id v5 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connected device added", v6, 2u);
    }
    sub_100032800((uint64_t)self);
  }
}

- (void)gizmoSync:(id)a3 didSyncState:(id)a4 deviceID:(id)a5
{
  gizmoSyncService = self->_gizmoSyncService;
  if (gizmoSyncService) {
    BOOL v8 = gizmoSyncService->_side == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"Gizmo";
    if (v8) {
      CFStringRef v10 = @"Companion";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v83 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ state received", buf, 0xCu);
  }
  id v11 = sub_10001D250((NSDictionary *)a4);
  id v12 = sub_100039F34(self->_fileURLs, self->_defaults);
  id v13 = sub_100014C40([RDGizmoStateDatastore alloc], v12);
  sub_100014D04((uint64_t)v13, (uint64_t)v11, (uint64_t)a5);

  if (!v8) {
    return;
  }
  double v14 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Companion state received", buf, 2u);
  }
  double v15 = a4;
  if (a4)
  {
    double v16 = (NSDictionary *)*((void *)a4 + 3);
    stateCache = self->_stateCache;
    if (stateCache)
    {
LABEL_12:
      serviceStartTimes = stateCache->_serviceStartTimes;
      if (serviceStartTimes != v16)
      {
        stateCache->_serviceStartTimes = v16;
      }
      sub_1000283D8((uint64_t)stateCache);
      double v15 = a4;
    }
  }
  else
  {
    double v16 = 0;
    stateCache = self->_stateCache;
    if (stateCache) {
      goto LABEL_12;
    }
  }
  if (v15)
  {
    long long v19 = v15;
    sub_10002B94C((id *)&self->_defaults->super.isa, v15[4]);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v20 = (void *)v19[2];
    id v21 = [v20 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v21)
    {
LABEL_17:
      id v22 = v21;
      uint64_t v63 = *(void *)v78;
      id obj = v20;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v78 != v63) {
            objc_enumerationMutation(obj);
          }
          long long v24 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          if (a4) {
            uint64_t v25 = (void *)*((void *)a4 + 2);
          }
          else {
            uint64_t v25 = 0;
          }
          unsigned int v26 = [v25[v77[i]] boolValue];
          uint64_t v27 = qword_10006EC58;
          if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            CFStringRef v28 = @"stop";
            if (v26) {
              CFStringRef v28 = @"start";
            }
            *(void *)v83 = v28;
            *(_WORD *)&v83[8] = 2114;
            *(void *)&v83[10] = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Got request from companion to %{public}@ recording for %{public}@", buf, 0x16u);
          }
          uint64_t v76 = 0;
          clientInterest = self->_clientInterest;
          if (!clientInterest) {
            goto LABEL_36;
          }
          id v30 = [(NSCache *)clientInterest->_clientInterestCache rd_objectsForSensor:v24 fallbackURL:sub_10001BCE4((NSURL *)clientInterest->_fileURLs, v24)];
          id v31 = [v30 mutableCopy];
          double v32 = v31;
          if (v26)
          {
            [v31 addObject:@"com.apple.sensorkit.dummy-bundle-id"];
            if ([v30 isEqualToSet:v32]) {
              goto LABEL_20;
            }
          }
          else
          {
            [v31 removeObject:@"com.apple.sensorkit.dummy-bundle-id"];
            if ([v30 isEqualToSet:v32])
            {
LABEL_20:

              continue;
            }
          }
          [(NSCache *)clientInterest->_clientInterestCache setObject:v32 forKey:v24];
          unsigned __int8 v33 = [(NSCache *)clientInterest->_clientInterestCache rd_writeObject:v32 forKey:v24 toURL:sub_10001BCE4((NSURL *)clientInterest->_fileURLs, v24) error:&v76];

          if ((v33 & 1) == 0)
          {
LABEL_36:
            id v34 = qword_10006EC58;
            if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67240706;
              *(_DWORD *)v83 = v26;
              *(_WORD *)&v83[4] = 2114;
              *(void *)&v83[6] = v24;
              *(_WORD *)&v83[14] = 2114;
              *(void *)&v83[16] = v76;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to set interest to %{public, BOOL}d for %{public}@ because %{public}@", buf, 0x1Cu);
            }
          }
        }
        id v22 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v22);
    }
  }
  else
  {
    sub_10002B94C((id *)&self->_defaults->super.isa, 0);
    long long v20 = 0;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v21 = [0 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v21) {
      goto LABEL_17;
    }
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  if (a4) {
    id v35 = (void *)*((void *)a4 + 5);
  }
  else {
    id v35 = 0;
  }
  double v58 = (char *)[v35 countByEnumeratingWithState:&v72 objects:v85 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v73;
    do
    {
      double v36 = 0;
      do
      {
        if (*(void *)v73 != v57) {
          objc_enumerationMutation(v56);
        }
        uint64_t v37 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v36);
        int v39 = self->_clientInterest;
        obja = v36;
        context = v38;
        if (v39) {
          id v40 = [(NSCache *)v39->_sensorConfigurationCache rd_objectsForSensor:v37 fallbackURL:sub_10001BD2C((NSURL *)v39->_fileURLs, v37)];
        }
        else {
          id v40 = 0;
        }
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v41 = [v40 countByEnumeratingWithState:&v68 objects:v84 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v43 = *(void *)v69;
          do
          {
            for (j = 0; j != v42; j = (char *)j + 1)
            {
              if (*(void *)v69 != v43) {
                objc_enumerationMutation(v40);
              }
              CFStringRef v45 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
              uint64_t v76 = 0;
              if ((sub_10000298C((uint64_t)self->_clientInterest, (uint64_t)[v45 objectForKeyedSubscript:@"_requestingBundleIdentifier"], v37, (uint64_t)&v76) & 1) == 0)
              {
                v46 = qword_10006EC58;
                if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  *(void *)v83 = v37;
                  *(_WORD *)&v83[8] = 2114;
                  *(void *)&v83[10] = v76;
                  *(_WORD *)&v83[18] = 2114;
                  *(void *)&v83[20] = v45;
                  _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to remove configuration for %{public}@ because %{public}@. Config: %{public}@", buf, 0x20u);
                }
              }
            }
            id v42 = [v40 countByEnumeratingWithState:&v68 objects:v84 count:16];
          }
          while (v42);
        }
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        if (a4) {
          uint64_t v47 = (void *)*((void *)a4 + 5);
        }
        else {
          uint64_t v47 = 0;
        }
        id v48 = [v47 objectForKeyedSubscript:v37];
        id v49 = [v48 countByEnumeratingWithState:&v64 objects:v81 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v65;
          do
          {
            for (k = 0; k != v50; k = (char *)k + 1)
            {
              if (*(void *)v65 != v51) {
                objc_enumerationMutation(v48);
              }
              CFStringRef v53 = *(void **)(*((void *)&v64 + 1) + 8 * (void)k);
              uint64_t v76 = 0;
              if ((sub_10000276C((uint64_t)self->_clientInterest, v53, v37, (uint64_t)&v76) & 1) == 0)
              {
                int64_t v54 = qword_10006EC58;
                if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  *(void *)v83 = v37;
                  *(_WORD *)&v83[8] = 2114;
                  *(void *)&v83[10] = v76;
                  *(_WORD *)&v83[18] = 2114;
                  *(void *)&v83[20] = v53;
                  _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Failed to set configuration for %{public}@ because %{public}@. Config: %{public}@", buf, 0x20u);
                }
              }
            }
            id v50 = [v48 countByEnumeratingWithState:&v64 objects:v81 count:16];
          }
          while (v50);
        }
        double v36 = obja + 1;
      }
      while (obja + 1 != v58);
      double v58 = (char *)[v56 countByEnumeratingWithState:&v72 objects:v85 count:16];
    }
    while (v58);
  }
  if (a4) {
    id v55 = (void *)*((void *)a4 + 2);
  }
  else {
    id v55 = 0;
  }
  sub_100031EC0((uint64_t)self, +[NSSet setWithArray:](NSSet, "setWithArray:", [v55 allKeys]));
  [(RDGizmoSyncing *)self->_gizmoSync sendStateToPeer:sub_100032480((uint64_t)self)];
}

- (void)gizmoSync:(id)a3 didSyncRTCOffset:(double)a4 timeBeforeUpdate:(double)a5
{
  gizmoSyncService = self->_gizmoSyncService;
  if (gizmoSyncService && gizmoSyncService->_side == 1)
  {
    uint64_t v9 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v35) = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Should not be receiving RTC offset sync message on the phone", (uint8_t *)&v35, 2u);
    }
    return;
  }
  stateCache = self->_stateCache;
  double v11 = 0.0;
  if (stateCache)
  {
    double timeSyncTimestamp = stateCache->_timeSyncTimestamp;
    stateCache->_double remoteRTCOffset = a4;
    uint64_t v13 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v14 = qword_10006EC90;
    double v15 = *(double *)&qword_10006EC98;
    double v16 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v14 >= v13) {
      double v17 = -v17;
    }
    stateCache->_double timeSyncTimestamp = v16 + v15 + v17;
    sub_1000283D8((uint64_t)stateCache);
    id v18 = self->_stateCache;
    if (v18) {
      double v11 = v18->_timeSyncTimestamp;
    }
    uint64_t v19 = mach_continuous_time();
    if (qword_10006EC88 == -1) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
  double timeSyncTimestamp = 0.0;
  uint64_t v19 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
LABEL_39:
  }
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
LABEL_13:
  unint64_t v20 = qword_10006EC90;
  double v21 = *(double *)&qword_10006EC98;
  double v22 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  double v24 = v22 + v21;
  if (v20 >= v19) {
    double v23 = -v23;
  }
  double v25 = v24 + v23;
  double v26 = v24 + v23 - a5;
  double v27 = v11 - timeSyncTimestamp;
  CFStringRef v28 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 134350336;
    double v36 = a5;
    __int16 v37 = 2050;
    double v38 = v25;
    __int16 v39 = 2050;
    double v40 = v26;
    __int16 v41 = 2050;
    double v42 = timeSyncTimestamp;
    __int16 v43 = 2050;
    double v44 = v11;
    __int16 v45 = 2050;
    double v46 = v11 - timeSyncTimestamp;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "RTC time synced with companion. before: %{public}f after: %{public}f diff: %{public}f, syncTSBefore: %{public}f syncTSAfter: %{public}f diff: %{public}f", (uint8_t *)&v35, 0x3Eu);
    CFStringRef v28 = qword_10006EC58;
  }
  BOOL v29 = v26 >= -1.0 && v26 <= 1.0;
  if (!v29 || (v27 >= 0.0 ? (BOOL v30 = 2 * XPC_ACTIVITY_INTERVAL_1_DAY < (uint64_t)v27) : (BOOL v30 = 1), v30))
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Syncing time with writers", (uint8_t *)&v35, 2u);
    }
    id v31 = sub_100039F34(self->_fileURLs, self->_defaults);
    double v32 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v31);
    sub_100034A78((uint64_t)self, v33);

    if (self->_active) {
      sub_10001EDA0();
    }
  }
  else if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    int v35 = 134217984;
    double v36 = v26;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Difference in time update (%f) was not deemed significant. Updating locally but not notifying writers", (uint8_t *)&v35, 0xCu);
  }
  [(RDAnalyticsEventListener *)self->_analyticsEventListener gizmoSyncDidSyncTime:a3];
  if (v26 < 0.0 && fabs(v26) > (double)(uint64_t)sub_10002BCD4((id *)&self->_defaults->super.isa))
  {
    id v34 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "RTC time has moved backward significantly. Companion RTC has likely reset! Garbage collecting any data from the future", (uint8_t *)&v35, 2u);
    }
    sub_100030E0C((uint64_t)self, 0, (const char *)4, 4096);
  }
}

- (int64_t)prerequisitesStatusForAnalytics:(id)a3
{
  if (self) {
    self = (RDDaemon *)self->_defaults;
  }
  return sub_10002B82C((uint64_t)self);
}

- (void)dumpClientsWithReply:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = qword_10006EC58;
  if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = sub_10001C7D0((NSURL *)v5);
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Got a request to dumpClients from: %{public}@", buf, 0xCu);
  }
  CFStringRef v28 = 0;
  if (sub_10002C300((BOOL)v5, @"com.apple.private.sensorkit.diagnostics.allow", 0, 0, @"com.apple.private.sensorkit.debugging.allow", (id *)&self->_defaults->super.isa, self, &v28))
  {
    double v23 = (void (**)(id, id, void))a3;
    id v7 = +[NSMutableDictionary dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    BOOL v8 = (void *)sub_10001A21C();
    uint64_t v9 = sub_10001A5B4(v8);
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          double v16 = (NSURL *)[v14 name:context];
          clientInterest = self->_clientInterest;
          if (clientInterest) {
            id v18 = [(NSCache *)clientInterest->_clientInterestCache rd_objectsForSensor:v16 fallbackURL:sub_10001BCE4((NSURL *)clientInterest->_fileURLs, v16)];
          }
          else {
            id v18 = 0;
          }
          [v7 setObject:[v18 allObjects] forKeyedSubscript:v16];
          uint64_t v19 = qword_10006EC58;
          if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v7 objectForKeyedSubscript:v16];
            *(_DWORD *)buf = 138543618;
            id v31 = v16;
            __int16 v32 = 2114;
            id v33 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "clients for %{public}@: %{public}@", buf, 0x16u);
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }
    v23[2](v23, v7, 0);
  }
  else
  {
    double v21 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = (NSURL *)v5;
      __int16 v32 = 2114;
      id v33 = v28;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void *, void *))a3 + 2))(a3, &__NSDictionary0__struct, v28);
  }
}

- (void)dumpStateCacheWithReply:(id)a3
{
  id v5 = +[NSXPCConnection currentConnection];
  uint64_t v8 = 0;
  if (sub_10002C300((BOOL)v5, @"com.apple.private.sensorkit.diagnostics.allow", 0, 0, @"com.apple.private.sensorkit.debugging.allow", (id *)&self->_defaults->super.isa, self, &v8))
  {
    id v6 = sub_100028838((NSDictionary *)self->_stateCache);
    (*((void (**)(id, NSDictionary *, void))a3 + 2))(a3, v6, 0);
  }
  else
  {
    id v7 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void *, uint64_t))a3 + 2))(a3, &__NSDictionary0__struct, v8);
  }
}

- (void)listDatastoreWithReply:(id)a3
{
  id v5 = +[NSXPCConnection currentConnection];
  uint64_t v11 = 0;
  if (sub_10002C300((BOOL)v5, @"com.apple.private.sensorkit.diagnostics.allow", 0, 0, @"com.apple.private.sensorkit.debugging.allow", (id *)&self->_defaults->super.isa, self, &v11))
  {
    id v6 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"datastore-listing.txt.gz", 0, +[NSURL fileURLWithPath:NSTemporaryDirectory()]);
    id v7 = sub_10001AA08([SRCompressedOutputStream alloc], (uint64_t)v6, 517);
    [v7 open];
    uint64_t v8 = sub_100039F34(self->_fileURLs, self->_defaults);
    uint64_t v9 = sub_10000EC64([RDTopLevelInformingDatastore alloc], v8);
    sub_10000EE58(v9, v7);

    [v7 close];
    (*((void (**)(id, NSString *, void))a3 + 2))(a3, [(NSURL *)v6 path], 0);
  }
  else
  {
    id v10 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v11);
  }
}

- (void)dumpConfigurationsWithReply:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v5 = +[NSXPCConnection currentConnection];
  uint64_t v24 = 0;
  if (sub_10002C300((BOOL)v5, @"com.apple.private.sensorkit.diagnostics.allow", 0, 0, @"com.apple.private.sensorkit.debugging.allow", (id *)&self->_defaults->super.isa, self, &v24))
  {
    id v6 = +[NSMutableDictionary dictionary];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (void *)sub_10001A21C();
    uint64_t v8 = sub_10001A5B4(v7);
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v12);
          id v15 = [v13 name];
          clientInterest = self->_clientInterest;
          if (clientInterest) {
            id v17 = [(NSCache *)clientInterest->_sensorConfigurationCache rd_objectsForSensor:v15 fallbackURL:sub_10001BD2C((NSURL *)clientInterest->_fileURLs, v15)];
          }
          else {
            id v17 = 0;
          }
          [v6 setObject:objc_msgSend(v17, "allObjects") forKeyedSubscript:v15];
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }
    (*((void (**)(id, id, void))a3 + 2))(a3, v6, 0);
  }
  else
  {
    id v18 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      long long v27 = v5;
      __int16 v28 = 2114;
      uint64_t v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void *, uint64_t))a3 + 2))(a3, &__NSDictionary0__struct, v24);
  }
}

- (void)dumpDefaultsWithReply:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v5 = +[NSXPCConnection currentConnection];
  uint64_t v11 = 0;
  if (sub_10002C300((BOOL)v5, @"com.apple.private.sensorkit.diagnostics.allow", 0, 0, @"com.apple.private.sensorkit.debugging.allow", (id *)&self->_defaults->super.isa, self, &v11))
  {
    defaults = self->_defaults;
    if (defaults)
    {
      id v7 = +[NSDictionary dictionaryWithDictionary:[(NSUserDefaults *)defaults->_defaults dictionaryRepresentation]];
      uint64_t v8 = (void (*)(id, NSDictionary *, void))*((void *)a3 + 2);
    }
    else
    {
      id v10 = qword_10006EC58;
      if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No defaults to display", buf, 2u);
      }
      uint64_t v8 = (void (*)(id, NSDictionary *, void))*((void *)a3 + 2);
      id v7 = (NSDictionary *)&__NSDictionary0__struct;
    }
    v8(a3, v7, 0);
  }
  else
  {
    id v9 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void *, uint64_t))a3 + 2))(a3, &__NSDictionary0__struct, v11);
  }
}

- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 sensor:(id)a4 reply:(id)a5
{
  id v9 = +[NSXPCConnection currentConnection];
  uint64_t v11 = 0;
  if (sub_10002C300((BOOL)v9, @"com.apple.private.sensorkit.diagnostics.allow", 0, 0, @"com.apple.private.sensorkit.debugging.allow", (id *)&self->_defaults->super.isa, self, &v11))
  {
    sub_100034F9C((uint64_t)self, a3, a4, (uint64_t)a5);
  }
  else
  {
    id v10 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, v11);
  }
}

- (void)fetchDeviceInformationForDeviceIdentifiers:(id)a3 reply:(id)a4
{
  id v7 = +[NSXPCConnection currentConnection];
  uint64_t v10 = 0;
  if (sub_10002C300((BOOL)v7, @"com.apple.private.sensorkit.diagnostics.allow", 0, 0, @"com.apple.private.sensorkit.debugging.allow", (id *)&self->_defaults->super.isa, self, &v10))
  {
    if (!a3)
    {
      self;
      uint64_t v11 = qword_10006ECB0;
      a3 = +[NSArray arrayWithObjects:&v11 count:1];
    }
    uint64_t v8 = sub_100033E10((NSArray *)self, a3);
    (*((void (**)(id, NSArray *, void))a4 + 2))(a4, v8, 0);
  }
  else
  {
    id v9 = qword_10006EC58;
    if (os_log_type_enabled((os_log_t)qword_10006EC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ not valid because %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void *, uint64_t))a4 + 2))(a4, &__NSArray0__struct, v10);
  }
}

@end