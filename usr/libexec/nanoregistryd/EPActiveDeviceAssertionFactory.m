@interface EPActiveDeviceAssertionFactory
+ (id)newService:(id)a3;
- (EPActiveDeviceAssertionFactory)init;
- (EPActiveDeviceAssertionFactory)initWithServiceRegistry:(id)a3;
- (EPServiceRegistry)serviceRegistry;
- (NSDictionary)assertions;
- (NSMapTable)managers;
- (NSUUID)pairingID;
- (id)assertionWithPairingID:(id)a3 isAltAccount:(BOOL)a4 delegate:(id)a5;
- (void)_holdAlternateAccountOSTransaction;
- (void)_releaseAlternateAccountOSTransaction;
- (void)addObserver:(id)a3;
- (void)managerIsIdle:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setPairingID:(id)a3;
- (void)update;
@end

@implementation EPActiveDeviceAssertionFactory

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithServiceRegistry:v4];

  return v5;
}

- (EPActiveDeviceAssertionFactory)init
{
  v9.receiver = self;
  v9.super_class = (Class)EPActiveDeviceAssertionFactory;
  v2 = [(EPActiveDeviceAssertionFactory *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    managers = v2->_managers;
    v2->_managers = (NSMapTable *)v3;

    uint64_t v5 = +[NSMutableOrderedSet orderedSet];
    observers = v2->_observers;
    v2->_observers = (NSMutableOrderedSet *)v5;

    altAccountTransaction = v2->_altAccountTransaction;
    v2->_altAccountTransaction = 0;
  }
  return v2;
}

- (EPActiveDeviceAssertionFactory)initWithServiceRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_serviceRegistry, a3);

  return [(EPActiveDeviceAssertionFactory *)self init];
}

- (void)setPairingID:(id)a3
{
  id v4 = (NSUUID *)a3;
  uint64_t v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    if (v6)
    {
      v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [(NSUUID *)v4 UUIDString];
        int v11 = 138412290;
        v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPActiveDeviceAssertion: taking out switch assertion for %@", (uint8_t *)&v11, 0xCu);
LABEL_8:

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(EPActiveDeviceAssertionFactory *)self pairingID];
      objc_super v9 = [v8 UUIDString];
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPActiveDeviceAssertion: releasing switch assertion for %@", (uint8_t *)&v11, 0xCu);

      goto LABEL_8;
    }
LABEL_9:
  }
  pairingID = self->_pairingID;
  self->_pairingID = v4;
}

- (void)_holdAlternateAccountOSTransaction
{
  if (!self->_altAccountTransaction)
  {
    uint64_t v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Holding os_transaction_t for alternate account", v8, 2u);
      }
    }
    BOOL v6 = (OS_os_transaction *)os_transaction_create();
    altAccountTransaction = self->_altAccountTransaction;
    self->_altAccountTransaction = v6;
  }
}

- (void)_releaseAlternateAccountOSTransaction
{
  if (self->_altAccountTransaction)
  {
    uint64_t v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing os_transaction_t for alternate account", v7, 2u);
      }
    }
    altAccountTransaction = self->_altAccountTransaction;
    self->_altAccountTransaction = 0;
  }
}

- (id)assertionWithPairingID:(id)a3 isAltAccount:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(NSMapTable *)self->_managers objectForKey:v8];
  if (v10)
  {
    int v11 = (EPActiveDeviceAssertionManager *)v10;
    v12 = sub_1000A3BC0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = sub_1000A3BC0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v8 UUIDString];
        int v31 = 134218242;
        v32 = v11;
        __int16 v33 = 2112;
        v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "EPActiveDeviceAssertionFactory: Reusing existing EPActiveDeviceAssertionManager %p to monitor switch to device %@", (uint8_t *)&v31, 0x16u);
      }
    }
  }
  else
  {
    int v11 = [[EPActiveDeviceAssertionManager alloc] initWithFactory:self pairingID:v8];
    [(NSMapTable *)self->_managers setObject:v11 forKey:v8];
    v16 = sub_1000A3BC0();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = sub_1000A3BC0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v8 UUIDString];
        int v31 = 134218242;
        v32 = v11;
        __int16 v33 = 2112;
        v34 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPActiveDeviceAssertionFactory: Created new EPActiveDeviceAssertionManager %p to monitor switch to device %@", (uint8_t *)&v31, 0x16u);
      }
    }
    uint64_t v20 = [(EPActiveDeviceAssertionFactory *)self pairingID];
    if (!v20
      || (v21 = (void *)v20,
          [(EPActiveDeviceAssertionFactory *)self pairingID],
          v22 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v23 = [v22 isEqual:v8],
          v22,
          v21,
          (v23 & 1) == 0))
    {
      [(EPActiveDeviceAssertionFactory *)self setPairingID:v8];
      v24 = sub_1000A3BC0();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        v26 = sub_1000A3BC0();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [(EPActiveDeviceAssertionFactory *)self pairingID];
          int v31 = 138412290;
          v32 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "EPActiveDeviceAssertionFactory: Assertion taken for %@", (uint8_t *)&v31, 0xCu);
        }
      }
      [(EPActiveDeviceAssertionFactory *)self update];
    }
    v28 = [(EPActiveDeviceAssertionFactory *)self pairingID];

    if (v28 && v6) {
      [(EPActiveDeviceAssertionFactory *)self _holdAlternateAccountOSTransaction];
    }
    else {
      [(EPActiveDeviceAssertionFactory *)self _releaseAlternateAccountOSTransaction];
    }
  }
  id v29 = [(EPResourceManager *)v11 newResourceWithDelegate:v9];

  return v29;
}

- (void)managerIsIdle:(id)a3
{
  id v4 = a3;
  managers = self->_managers;
  BOOL v6 = [v4 pairingID];
  [(NSMapTable *)managers removeObjectForKey:v6];

  v7 = [(EPActiveDeviceAssertionFactory *)self pairingID];
  id v8 = [v4 pairingID];
  unsigned int v9 = [v7 isEqual:v8];

  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v10 = [(NSMapTable *)self->_managers keyEnumerator];
  int v11 = [v10 nextObject];
  [(EPActiveDeviceAssertionFactory *)self setPairingID:v11];

  v12 = [(EPActiveDeviceAssertionFactory *)self pairingID];

  BOOL v13 = v12 == 0;
  v14 = sub_1000A3BC0();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    if (v15)
    {
      v16 = sub_1000A3BC0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPActiveDeviceAssertionFactory: Assertion released", (uint8_t *)&buf, 2u);
      }
      goto LABEL_9;
    }
  }
  else if (v15)
  {
    v16 = sub_1000A3BC0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = [(EPActiveDeviceAssertionFactory *)self pairingID];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPActiveDeviceAssertionFactory: Assertion taken for %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_9:
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v18 = [(EPActiveDeviceAssertionFactory *)self pairingID];
  BOOL v19 = v18 == 0;

  if (!v19)
  {
    uint64_t v20 = [v4 registry];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100090C20;
    v23[3] = &unk_1001677B8;
    v23[4] = self;
    v23[5] = &buf;
    [v20 deasyncGrabRegistryWithReadBlock:v23];
  }
  v21 = [(EPActiveDeviceAssertionFactory *)self pairingID];
  if (!v21 || (BOOL v22 = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0, v21, v22)) {
    [(EPActiveDeviceAssertionFactory *)self _releaseAlternateAccountOSTransaction];
  }
  else {
    [(EPActiveDeviceAssertionFactory *)self _holdAlternateAccountOSTransaction];
  }
  _Block_object_dispose(&buf, 8);

LABEL_17:
  [(EPActiveDeviceAssertionFactory *)self update];
}

- (void)update
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = self->_managers;
  id v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(NSMapTable *)self->_managers objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * (void)v7)];
        unsigned int v9 = [(EPActiveDeviceAssertionFactory *)self pairingID];
        [v8 updateWithPairingID:v9];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  if (![(NSMapTable *)self->_managers count])
  {
    id v10 = [(NSMutableOrderedSet *)self->_observers copy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        BOOL v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) assertionFactoryDidBecomeIdle:self (void)v16];
          BOOL v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (NSDictionary)assertions
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_managers;
  id v4 = [(NSMapTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v9 = [(NSMapTable *)self->_managers objectForKey:v8];
        id v10 = +[NSMutableSet set];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100091050;
        v14[3] = &unk_1001683F8;
        id v15 = v10;
        id v11 = v10;
        [v9 enumerateResourcesWithBlock:v14];
        [v3 setObject:v11 forKeyedSubscript:v8];
      }
      id v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446210;
      long long v16 = "-[EPActiveDeviceAssertionFactory addObserver:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  uint64_t v8 = objc_opt_new();
  [v8 setObserver:v4];

  unsigned int v9 = [(EPActiveDeviceAssertionFactory *)self assertions];
  id v10 = [v9 count];

  [(NSMutableOrderedSet *)self->_observers addObject:v8];
  if (!v10)
  {
    id v11 = +[NRQueue registryDaemonQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000911FC;
    v12[3] = &unk_100165530;
    id v13 = v8;
    uint64_t v14 = self;
    [v11 dispatchAsync:v12];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446210;
      long long v23 = "-[EPActiveDeviceAssertionFactory removeObserver:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(NSMutableOrderedSet *)self->_observers copy];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [v13 observer];
        if (v14)
        {
          id v15 = (void *)v14;
          id v16 = [v13 observer];

          if (v16 != v4) {
            continue;
          }
        }
        [(NSMutableOrderedSet *)self->_observers removeObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (NSMapTable)managers
{
  return self->_managers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_altAccountTransaction, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end