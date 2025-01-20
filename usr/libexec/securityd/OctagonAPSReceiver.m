@interface OctagonAPSReceiver
+ (id)apsDeliveryQueue;
+ (id)receiverForNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4;
+ (id)resettableSynchronizedGlobalDelegatePortMap:(BOOL)a3;
+ (id)synchronizedGlobalDelegatePortMap;
+ (void)resetGlobalDelegatePortMap;
- (BOOL)haveStalePushes;
- (CKKSNearFutureScheduler)clearStalePushNotifications;
- (Class)apsConnectionClass;
- (NSMapTable)octagonContainerMap;
- (NSMutableDictionary)environmentMap;
- (NSMutableDictionary)zoneUpdateReceiverDictionary;
- (NSMutableSet)undeliveredCuttlefishUpdates;
- (NSMutableSet)undeliveredUpdates;
- (NSString)namedDelegatePort;
- (OctagonAPSConnection)apsConnection;
- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4;
- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4 stalePushTimeout:(unint64_t)a5;
- (id)cuttlefishPushTopics;
- (id)registerCKKSReceiver:(id)a3 contextID:(id)a4;
- (id)registerCuttlefishReceiver:(id)a3 forContainerName:(id)a4 contextID:(id)a5;
- (id)registeredPushEnvironments;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)registerForEnvironment:(id)a3;
- (void)reportDroppedPushes:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setClearStalePushNotifications:(id)a3;
- (void)setEnvironmentMap:(id)a3;
- (void)setNamedDelegatePort:(id)a3;
- (void)setOctagonContainerMap:(id)a3;
- (void)setUndeliveredCuttlefishUpdates:(id)a3;
- (void)setUndeliveredUpdates:(id)a3;
- (void)setZoneUpdateReceiverDictionary:(id)a3;
@end

@implementation OctagonAPSReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_octagonContainerMap, 0);
  objc_storeStrong((id *)&self->_zoneUpdateReceiverDictionary, 0);
  objc_storeStrong((id *)&self->_undeliveredCuttlefishUpdates, 0);
  objc_storeStrong((id *)&self->_undeliveredUpdates, 0);
  objc_storeStrong((id *)&self->_environmentMap, 0);
  objc_storeStrong((id *)&self->_namedDelegatePort, 0);
  objc_storeStrong((id *)&self->_clearStalePushNotifications, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);

  objc_storeStrong((id *)&self->_apsConnectionClass, 0);
}

- (void)setOctagonContainerMap:(id)a3
{
}

- (NSMapTable)octagonContainerMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setZoneUpdateReceiverDictionary:(id)a3
{
}

- (NSMutableDictionary)zoneUpdateReceiverDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUndeliveredCuttlefishUpdates:(id)a3
{
}

- (NSMutableSet)undeliveredCuttlefishUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUndeliveredUpdates:(id)a3
{
}

- (NSMutableSet)undeliveredUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnvironmentMap:(id)a3
{
}

- (NSMutableDictionary)environmentMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNamedDelegatePort:(id)a3
{
}

- (NSString)namedDelegatePort
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClearStalePushNotifications:(id)a3
{
}

- (CKKSNearFutureScheduler)clearStalePushNotifications
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApsConnection:(id)a3
{
}

- (OctagonAPSConnection)apsConnection
{
  return (OctagonAPSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_1000CD884(@"octagonpush", 0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 topic];
    v10 = [v7 userInfo];
    *(_DWORD *)buf = 138412546;
    v63 = v9;
    __int16 v64 = 2112;
    v65 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "OctagonAPSDelegate received a message(%@): %@ ", buf, 0x16u);
  }
  if ([v7 isTracingEnabled]) {
    [v6 confirmReceiptForMessage:v7];
  }
  v11 = [v7 userInfo];
  v12 = [v11 objectForKeyedSubscript:@"cf"];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    v32 = [v7 userInfo];
    v15 = +[CKNotification notificationFromRemoteNotificationDictionary:v32];

    if ([v15 notificationType] == (id)2)
    {
      v16 = v15;
      -[NSObject setCkksPushTracingEnabled:](v16, "setCkksPushTracingEnabled:", [v7 isTracingEnabled]);
      v33 = [v7 tracingUUID];
      if (v33)
      {
        id v34 = objc_alloc((Class)NSUUID);
        id v35 = [v7 tracingUUID];
        id v36 = [v34 initWithUUIDBytes:[v35 bytes]];
        v37 = [v36 UUIDString];
        [v16 setCkksPushTracingUUID:v37];
      }
      else
      {
        [v16 setCkksPushTracingUUID:0];
      }

      v38 = +[NSDate date];
      [v16 setCkksPushReceivedDate:v38];

      v39 = +[CKKSAnalytics logger];
      v40 = +[NSDate date];
      [v39 setDateProperty:v40 forKey:@"lastCKKSPush"];

      v41 = [(OctagonAPSReceiver *)self zoneUpdateReceiverDictionary];
      objc_sync_enter(v41);
      v42 = [(OctagonAPSReceiver *)self zoneUpdateReceiverDictionary];
      BOOL v43 = [v42 count] == 0;

      if (v43)
      {
        v44 = sub_1000CD884(@"ckkspush", 0);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v16;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "received push for unregistered receiver: %@", buf, 0xCu);
        }

        v45 = [(OctagonAPSReceiver *)self undeliveredUpdates];
        [v45 addObject:v16];

        v46 = [(OctagonAPSReceiver *)self clearStalePushNotifications];
        [v46 trigger];
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v47 = [(OctagonAPSReceiver *)self zoneUpdateReceiverDictionary];
      v48 = [v47 objectEnumerator];

      id v49 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v49)
      {
        uint64_t v50 = *(void *)v53;
        do
        {
          for (i = 0; i != v49; i = (char *)i + 1)
          {
            if (*(void *)v53 != v50) {
              objc_enumerationMutation(v48);
            }
            [*(id *)(*((void *)&v52 + 1) + 8 * i) notifyZoneChange:v16];
          }
          id v49 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v49);
      }

      objc_sync_exit(v41);
      v15 = v16;
    }
    else
    {
      v16 = sub_1000CD884(@"ckkspush", 0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "unexpected notification: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v14 = [v7 userInfo];
    v15 = [v14 objectForKeyedSubscript:@"cf"];

    v16 = [v15 objectForKeyedSubscript:@"c"];
    v17 = sub_1000CD884(@"octagonpush", 0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received a cuttlefish push to container %@", buf, 0xCu);
    }

    v18 = +[CKKSAnalytics logger];
    v19 = +[NSDate date];
    [v18 setDateProperty:v19 forKey:@"lastOctagonPush"];

    if (v16)
    {
      v20 = [(OctagonAPSReceiver *)self octagonContainerMap];
      objc_sync_enter(v20);
      v21 = [(OctagonAPSReceiver *)self octagonContainerMap];
      BOOL v22 = [v21 count] == 0;

      if (v22)
      {
        v23 = sub_1000CD884(@"octagonpush", 0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v16;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "received cuttlefish push for unregistered container: %@", buf, 0xCu);
        }

        v24 = [(OctagonAPSReceiver *)self undeliveredCuttlefishUpdates];
        [v24 addObject:v16];

        v25 = [(OctagonAPSReceiver *)self clearStalePushNotifications];
        [v25 trigger];
      }
      objc_sync_exit(v20);
    }
    v26 = [(OctagonAPSReceiver *)self octagonContainerMap];
    objc_sync_enter(v26);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v27 = [(OctagonAPSReceiver *)self octagonContainerMap];
    v28 = [v27 objectEnumerator];

    id v29 = [v28 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v57;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v57 != v30) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * (void)j) notifyContainerChange:0];
        }
        id v29 = [v28 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v29);
    }

    objc_sync_exit(v26);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = sub_1000CD884(@"octagonpush", 0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection %@", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a3;
  v5 = sub_1000CD884(@"octagonpush", 0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OctagonAPSDelegate initiated: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)registerCuttlefishReceiver:(id)a3 forContainerName:(id)a4 contextID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(CKKSCondition);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v12 = +[OctagonAPSReceiver apsDeliveryQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001B8770;
  v20[3] = &unk_100306AF8;
  objc_copyWeak(&v25, &location);
  id v21 = v8;
  id v22 = v10;
  id v23 = v9;
  BOOL v13 = v11;
  v24 = v13;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v12, v20);

  id v17 = v24;
  __int16 v18 = v13;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v18;
}

- (id)registerCKKSReceiver:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(CKKSCondition);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v9 = +[OctagonAPSReceiver apsDeliveryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B8A88;
  block[3] = &unk_100306EA0;
  objc_copyWeak(&v20, &location);
  id v17 = v6;
  id v18 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);

  BOOL v13 = v19;
  id v14 = v10;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

- (void)reportDroppedPushes:(id)a3
{
  id v3 = a3;
  CFTypeRef cf = 0;
  *(_DWORD *)buf = -1431655766;
  uint64_t v4 = sub_10001AE90(dword_10035D2B0, buf);
  BOOL v5 = sub_100029664(v4, &cf, @"aks_get_lock_state failed: %x", v4);
  uint8_t v6 = buf[0];
  CFTypeRef v7 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v7);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  if ((*(_DWORD *)&v5 & ((v6 & 4) >> 2)) != 0) {
    CFStringRef v8 = @"CKKS APNS Push Dropped";
  }
  else {
    CFStringRef v8 = @"CKKS APNS Push Dropped - never unlocked";
  }
  long long v20 = 0uLL;
  long long v21 = 0uLL;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v14 ckksPushTracingEnabled])
        {
          id v15 = sub_1000CD884(@"apsnotification", 0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Submitting initial CKEventMetric due to notification %@", buf, 0xCu);
          }

          id v16 = [[SecEventMetric alloc] initWithEventName:@"APNSPushMetrics"];
          id v17 = [v14 ckksPushTracingUUID];
          [(SecEventMetric *)v16 setObject:v17 forKeyedSubscript:@"push_token_uuid"];

          id v18 = [v14 ckksPushReceivedDate];
          [(SecEventMetric *)v16 setObject:v18 forKeyedSubscript:@"push_received_date"];

          [(SecEventMetric *)v16 setObject:v8 forKeyedSubscript:@"push_event_name"];
          id v19 = +[SecMetrics managerObject];
          [v19 submitEvent:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v11);
  }
}

- (void)registerForEnvironment:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v5 = +[OctagonAPSReceiver apsDeliveryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B90AC;
  block[3] = &unk_100306AD0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4 stalePushTimeout:(unint64_t)a5
{
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)OctagonAPSReceiver;
  id v10 = [(OctagonAPSReceiver *)&v33 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_apsConnectionClass, a4);
    uint64_t v12 = +[NSMutableSet set];
    undeliveredUpdates = v11->_undeliveredUpdates;
    v11->_undeliveredUpdates = (NSMutableSet *)v12;

    id v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    undeliveredCuttlefishUpdates = v11->_undeliveredCuttlefishUpdates;
    v11->_undeliveredCuttlefishUpdates = v14;

    objc_storeStrong((id *)&v11->_namedDelegatePort, a3);
    uint64_t v16 = +[NSMutableDictionary dictionary];
    environmentMap = v11->_environmentMap;
    v11->_environmentMap = (NSMutableDictionary *)v16;

    uint64_t v18 = +[NSMapTable strongToWeakObjectsMapTable];
    octagonContainerMap = v11->_octagonContainerMap;
    v11->_octagonContainerMap = (NSMapTable *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    zoneUpdateReceiverDictionary = v11->_zoneUpdateReceiverDictionary;
    v11->_zoneUpdateReceiverDictionary = (NSMutableDictionary *)v20;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    id v29 = sub_1001B93F0;
    uint64_t v30 = &unk_1003077A0;
    objc_copyWeak(&v31, &location);
    long long v22 = objc_retainBlock(&v27);
    long long v23 = [CKKSNearFutureScheduler alloc];
    v24 = [(CKKSNearFutureScheduler *)v23 initWithName:@"clearStalePushNotifications", a5, 0, 0, v22, v27, v28, v29, v30 delay keepProcessAlive dependencyDescriptionCode block];
    clearStalePushNotifications = v11->_clearStalePushNotifications;
    v11->_clearStalePushNotifications = v24;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  return [(OctagonAPSReceiver *)self initWithNamedDelegatePort:a3 apsConnectionClass:a4 stalePushTimeout:300000000000];
}

- (id)cuttlefishPushTopics
{
  v2 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.security.cuttlefish"];
  id v3 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.TrustedPeersHelper"];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (BOOL)haveStalePushes
{
  uint64_t v6 = 0;
  CFTypeRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = +[OctagonAPSReceiver apsDeliveryQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B96FC;
  v5[3] = &unk_100307348;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (id)registeredPushEnvironments
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001B98B4;
  id v11 = sub_1001B98C4;
  id v12 = 0;
  id v3 = +[OctagonAPSReceiver apsDeliveryQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1001B98CC;
  v6[3] = &unk_100307348;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)apsDeliveryQueue
{
  if (qword_10035D250 != -1) {
    dispatch_once(&qword_10035D250, &stru_100306AA8);
  }
  v2 = (void *)qword_10035D248;

  return v2;
}

+ (id)resettableSynchronizedGlobalDelegatePortMap:(BOOL)a3
{
  id v3 = (void *)qword_10035D240;
  if (qword_10035D240) {
    BOOL v4 = !a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v6 = (void *)qword_10035D240;
    qword_10035D240 = (uint64_t)v5;

    id v3 = (void *)qword_10035D240;
  }

  return v3;
}

+ (id)synchronizedGlobalDelegatePortMap
{
  return [a1 resettableSynchronizedGlobalDelegatePortMap:0];
}

+ (void)resetGlobalDelegatePortMap
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = [obj resettableSynchronizedGlobalDelegatePortMap:1];
  objc_sync_exit(obj);
}

+ (id)receiverForNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  objc_sync_enter(v7);
  uint64_t v8 = [a1 synchronizedGlobalDelegatePortMap];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];
  if (!v9)
  {
    uint64_t v9 = [[OctagonAPSReceiver alloc] initWithNamedDelegatePort:v6 apsConnectionClass:a4];
    [v8 setObject:v9 forKeyedSubscript:v6];
  }

  objc_sync_exit(v7);

  return v9;
}

@end