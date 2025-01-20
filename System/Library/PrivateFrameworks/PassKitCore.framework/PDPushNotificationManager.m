@interface PDPushNotificationManager
- (NSArray)currentConsumers;
- (NSArray)topics;
- (NSString)pushToken;
- (PDPushNotificationManager)init;
- (void)_handleToken:(id)a3 forTokenInfo:(id)a4 fromTimeout:(BOOL)a5;
- (void)connect;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5;
- (void)dealloc;
- (void)disableCriticalReliability;
- (void)enableCriticalReliability;
- (void)generateSingleUsePushTokenForTopic:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)recalculatePushTopics;
- (void)registerConsumer:(id)a3;
- (void)setPushToken:(id)a3;
- (void)simulatePushForTopic:(id)a3;
- (void)unregisterAllConsumers;
- (void)unregisterConsumer:(id)a3;
@end

@implementation PDPushNotificationManager

- (PDPushNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PDPushNotificationManager;
  v2 = [(PDPushNotificationManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    registeredTopics = v2->_registeredTopics;
    v2->_registeredTopics = v3;

    uint64_t v5 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    consumers = v2->_consumers;
    v2->_consumers = (NSHashTable *)v5;

    *(void *)&v2->_consumersLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passkitcore.pushmanager.replyQueue", 0);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v7;

    v2->_outstandingTokenRequestsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(PDPushNotificationManager *)self disableCriticalReliability];
  [(APSConnection *)self->_apsConnection setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PDPushNotificationManager;
  [(PDPushNotificationManager *)&v3 dealloc];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    uint64_t v5 = objc_msgSend(a4, "hexEncoding", a3);
    os_unfair_lock_lock(&self->_consumersLock);
    [(PDPushNotificationManager *)self setPushToken:v5];
    v6 = [(NSHashTable *)self->_consumers allObjects];
    os_unfair_lock_unlock(&self->_consumersLock);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
          replyQueue = self->_replyQueue;
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100235BA0;
          v14[3] = &unk_10072E198;
          v14[4] = v12;
          id v15 = v5;
          dispatch_async(replyQueue, v14);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_lock(&self->_consumersLock);
  id v9 = [(NSHashTable *)self->_consumers allObjects];
  uint64_t v10 = self->_pushToken;
  os_unfair_lock_unlock(&self->_consumersLock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v14);
        replyQueue = self->_replyQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100235D90;
        block[3] = &unk_100730198;
        block[4] = v15;
        long long v19 = v10;
        id v20 = v7;
        id v21 = v8;
        dispatch_async(replyQueue, block);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
}

- (void)registerConsumer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_consumersLock);
    uint64_t v5 = [(NSHashTable *)self->_consumers allObjects];
    v6 = self->_pushToken;
    os_unfair_lock_unlock(&self->_consumersLock);
    if (([v5 containsObject:v4] & 1) == 0)
    {
      id v7 = [v4 pushNotificationTopics];
      replyQueue = self->_replyQueue;
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      uint64_t v13 = sub_100235F7C;
      v14 = &unk_10072E198;
      id v9 = v4;
      id v15 = v9;
      long long v16 = v6;
      dispatch_async(replyQueue, &v11);
      os_unfair_lock_lock(&self->_consumersLock);
      -[NSHashTable addObject:](self->_consumers, "addObject:", v9, v11, v12, v13, v14);
      [(NSMutableSet *)self->_registeredTopics unionSet:v7];
      uint64_t v10 = [(NSMutableSet *)self->_registeredTopics allObjects];
      os_unfair_lock_unlock(&self->_consumersLock);
      [(APSConnection *)self->_apsConnection _setEnabledTopics:v10];
    }
  }
}

- (void)unregisterConsumer:(id)a3
{
  p_consumersLock = &self->_consumersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_consumersLock);
  [(NSHashTable *)self->_consumers removeObject:v5];
  os_unfair_lock_unlock(p_consumersLock);
  [(PDPushNotificationManager *)self recalculatePushTopics];
}

- (void)unregisterAllConsumers
{
  p_consumersLock = &self->_consumersLock;
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = [(NSHashTable *)self->_consumers allObjects];
  [(NSHashTable *)self->_consumers removeAllObjects];
  os_unfair_lock_unlock(p_consumersLock);
  [(PDPushNotificationManager *)self recalculatePushTopics];
}

- (void)recalculatePushTopics
{
  objc_super v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = [(NSHashTable *)self->_consumers allObjects];
  os_unfair_lock_unlock(&self->_consumersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "pushNotificationTopics", (void)v13);
        [(NSMutableSet *)v3 unionSet:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [(NSMutableSet *)v3 allObjects];
  [(APSConnection *)self->_apsConnection _setEnabledTopics:v11];
  os_unfair_lock_lock(&self->_consumersLock);
  registeredTopics = self->_registeredTopics;
  self->_registeredTopics = v3;

  os_unfair_lock_unlock(&self->_consumersLock);
}

- (NSArray)topics
{
  p_consumersLock = &self->_consumersLock;
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = [(NSMutableSet *)self->_registeredTopics allObjects];
  os_unfair_lock_unlock(p_consumersLock);
  return (NSArray *)v4;
}

- (NSArray)currentConsumers
{
  p_consumersLock = &self->_consumersLock;
  os_unfair_lock_lock(&self->_consumersLock);
  id v4 = [(NSHashTable *)self->_consumers allObjects];
  os_unfair_lock_unlock(p_consumersLock);
  return (NSArray *)v4;
}

- (void)enableCriticalReliability
{
  p_criticalReliabilityLock = &self->_criticalReliabilityLock;
  os_unfair_lock_lock(&self->_criticalReliabilityLock);
  int64_t enableCriticalReliabilityCount = self->_enableCriticalReliabilityCount;
  if (enableCriticalReliabilityCount <= 0)
  {
    [(APSConnection *)self->_apsConnection setEnableCriticalReliability:1];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Critical push reliability enabled", v6, 2u);
    }

    int64_t enableCriticalReliabilityCount = self->_enableCriticalReliabilityCount;
  }
  self->_int64_t enableCriticalReliabilityCount = enableCriticalReliabilityCount + 1;
  os_unfair_lock_unlock(p_criticalReliabilityLock);
}

- (void)disableCriticalReliability
{
  p_criticalReliabilityLock = &self->_criticalReliabilityLock;
  os_unfair_lock_lock(&self->_criticalReliabilityLock);
  int64_t enableCriticalReliabilityCount = self->_enableCriticalReliabilityCount;
  BOOL v5 = enableCriticalReliabilityCount == 1;
  BOOL v6 = enableCriticalReliabilityCount < 1;
  int64_t v7 = enableCriticalReliabilityCount - 1;
  if (!v6)
  {
    self->_int64_t enableCriticalReliabilityCount = v7;
    if (v5)
    {
      [(APSConnection *)self->_apsConnection setEnableCriticalReliability:0];
      uint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Critical push reliability disabled", v9, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_criticalReliabilityLock);
}

- (void)generateSingleUsePushTokenForTopic:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)APSAppTokenInfo) initWithTopic:v8 identifier:v9];
  uint64_t v12 = +[NSDate dateWithTimeIntervalSinceNow:1209600.0];
  [v11 setExpirationDate:v12];

  if (v11)
  {
    id v24 = v9;
    id v25 = v8;
    os_unfair_lock_lock(&self->_outstandingTokenRequestsLock);
    if (!self->_outstandingTokenRequests)
    {
      long long v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      outstandingTokenRequests = self->_outstandingTokenRequests;
      self->_outstandingTokenRequests = v13;
    }
    id v15 = objc_retainBlock(v10);
    long long v16 = self->_outstandingTokenRequests;
    id v17 = v11;
    id v18 = objc_alloc((Class)NSString);
    long long v19 = [v17 topic];
    id v20 = [v17 identifier];

    id v21 = [v18 initWithFormat:@"%@-%@", v19, v20];
    [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v21];

    os_unfair_lock_unlock(&self->_outstandingTokenRequestsLock);
    [(APSConnection *)self->_apsConnection requestTokenForInfo:v17];
    objc_initWeak(&location, self);
    dispatch_time_t v22 = dispatch_time(0, 5000000000);
    long long v23 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023666C;
    block[3] = &unk_10072E288;
    objc_copyWeak(&v28, &location);
    id v27 = v17;
    dispatch_after(v22, v23, block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    id v9 = v24;
    id v8 = v25;
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)connect
{
  if (!self->_apsConnection)
  {
    int v3 = PKIsAPNSDevelopmentEnvironmentEnabled();
    id v4 = (id *)&APSEnvironmentDevelopment;
    if (!v3) {
      id v4 = (id *)&APSEnvironmentProduction;
    }
    id v5 = *v4;
    id v6 = objc_alloc((Class)APSConnection);
    int64_t v7 = PDDefaultQueue();
    id v8 = (APSConnection *)[v6 initWithEnvironmentName:v5 namedDelegatePort:@"com.apple.passd.aps" queue:v7];

    apsConnection = self->_apsConnection;
    self->_apsConnection = v8;

    id v10 = [(APSConnection *)self->_apsConnection publicToken];
    id v11 = [v10 hexEncoding];

    [(APSConnection *)self->_apsConnection setDelegate:self];
    [(PDPushNotificationManager *)self setPushToken:v11];
  }
}

- (void)simulatePushForTopic:(id)a3
{
}

- (void)_handleToken:(id)a3 forTokenInfo:(id)a4 fromTimeout:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_outstandingTokenRequestsLock);
  id v10 = v9;
  id v11 = objc_alloc((Class)NSString);
  uint64_t v12 = [v10 topic];
  long long v13 = [v10 identifier];

  id v14 = [v11 initWithFormat:@"%@-%@", v12, v13];
  id v15 = [(NSMutableDictionary *)self->_outstandingTokenRequests objectForKeyedSubscript:v14];
  [(NSMutableDictionary *)self->_outstandingTokenRequests setObject:0 forKeyedSubscript:v14];
  if (![(NSMutableDictionary *)self->_outstandingTokenRequests count])
  {
    outstandingTokenRequests = self->_outstandingTokenRequests;
    self->_outstandingTokenRequests = 0;
  }
  os_unfair_lock_unlock(&self->_outstandingTokenRequestsLock);
  if (v15)
  {
    if (v8 || !v5)
    {
      ((void (**)(void, id, void))v15)[2](v15, v8, 0);
    }
    else
    {
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error: Timed out generating push token for tokenInfo: (%@)", buf, 0xCu);
      }

      id v18 = PDBasicError();
      ((void (**)(void, void, void *))v15)[2](v15, 0, v18);
    }
  }
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingTokenRequests, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_registeredTopics, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

@end