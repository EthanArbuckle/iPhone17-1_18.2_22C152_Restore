@interface PDAssertionManager
- (BOOL)assertionCoordinator:(id)a3 assertionExistsOfType:(unint64_t)a4;
- (BOOL)assertionCoordinator:(id)a3 canAcquireAssertion:(id)a4;
- (BOOL)hasAssertionsOfType:(unint64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PDAssertionManager)init;
- (id)assertionsOfType:(unint64_t)a3;
- (void)acquireAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 reason:(id)a5 handler:(id)a6;
- (void)assertionCoordinator:(id)a3 didAcquireAssertion:(id)a4;
- (void)assertionCoordinator:(id)a3 didInvalidateAssertion:(id)a4;
- (void)dealloc;
- (void)invalidateAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 handler:(id)a5;
- (void)logAssertionsOfTypes:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDAssertionManager

- (id)assertionsOfType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableArray *)self->_coordinators copy];
  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100020D1C;
  v14 = sub_100021180;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003BEBBC;
  v9[3] = &unk_10074E7B0;
  v9[4] = &v10;
  v9[5] = a3;
  [v6 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (PDAssertionManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)PDAssertionManager;
  v2 = [(PDAssertionManager *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.passd.assertionmanager.reply", v4);
    replyQueue = v3->_replyQueue;
    v3->_replyQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    coordinators = v3->_coordinators;
    v3->_coordinators = v9;

    id v11 = objc_alloc((Class)NSXPCListener);
    uint64_t v12 = (NSXPCListener *)[v11 initWithMachServiceName:PKAssertionMachServiceName];
    coordinatorListener = v3->_coordinatorListener;
    v3->_coordinatorListener = v12;

    v14 = (RBSProcessMonitor *)objc_alloc_init((Class)RBSProcessMonitor);
    processStateMonitor = v3->_processStateMonitor;
    v3->_processStateMonitor = v14;

    [(NSXPCListener *)v3->_coordinatorListener setDelegate:v3];
    [(NSXPCListener *)v3->_coordinatorListener resume];
  }
  return v3;
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_processStateMonitor invalidate];
  sub_1003BDC80((uint64_t)self);
  [(NSXPCListener *)self->_coordinatorListener setDelegate:0];
  [(NSXPCListener *)self->_coordinatorListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PDAssertionManager;
  [(PDAssertionManager *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v6 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding connection from pid: %d", (uint8_t *)&buf, 8u);
  }

  id v8 = [objc_alloc((Class)PDAssertionCoordinator) initWithConnection:v6];
  v9 = PDAssertionCoordinatorInterface();
  [v6 setExportedInterface:v9];

  [v6 setExportedObject:v8];
  objc_initWeak(&buf, v6);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003BE050;
  v20[3] = &unk_100732858;
  objc_copyWeak(&v22, &buf);
  v20[4] = self;
  id v10 = v8;
  id v21 = v10;
  [v6 setInvalidationHandler:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1003BE1A4;
  v18[3] = &unk_100735E20;
  objc_copyWeak(&v19, &buf);
  [v6 setInterruptionHandler:v18];
  id v11 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v10 remoteProcessIdentifier]);
  uint64_t v12 = +[RBSProcessHandle handleForIdentifier:v11 error:0];
  v13 = [v12 identity];
  v14 = [v13 embeddedApplicationIdentifier];
  if (v14
    || ([v13 xpcServiceIdentifier], (v14 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v12 bundle],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 identifier],
        v14 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14))
  {
    [v10 setBundleIdentifier:v14];
  }
  [v10 setIsForegroundApplication:sub_1003BE2A0(v12)];
  sub_1003BE31C((uint64_t)self, v10);
  [v6 resume];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&buf);

  return 1;
}

- (BOOL)assertionCoordinator:(id)a3 canAcquireAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003BE4A8;
  v11[3] = &unk_10074E760;
  v11[4] = &v12;
  v11[5] = [v7 type];
  [v9 enumerateObjectsUsingBlock:v11];

  LOBYTE(v9) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v9;
}

- (void)assertionCoordinator:(id)a3 didAcquireAssertion:(id)a4
{
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Assertion Acquired: %@", buf, 0xCu);
  }

  replyQueue = self->_replyQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003BE64C;
  v9[3] = &unk_10072E198;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(replyQueue, v9);
}

- (void)assertionCoordinator:(id)a3 didInvalidateAssertion:(id)a4
{
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Assertion Invalidated: %@", buf, 0xCu);
  }

  replyQueue = self->_replyQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003BEA70;
  v9[3] = &unk_10072E198;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(replyQueue, v9);
}

- (BOOL)assertionCoordinator:(id)a3 assertionExistsOfType:(unint64_t)a4
{
  return [(PDAssertionManager *)self hasAssertionsOfType:a4];
}

- (BOOL)hasAssertionsOfType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableArray *)self->_coordinators copy];
  os_unfair_lock_unlock(p_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hasAssertionsOfType:", a3, (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v4 && ![(NSHashTable *)self->_observers containsObject:v4]) {
    [(NSHashTable *)self->_observers addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)logAssertionsOfTypes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSMutableString);
  v25 = v4;
  id v6 = [v4 componentsJoinedByString:@"|"];
  id v7 = [v5 initWithFormat:@"PDAssertionManager: All Assertion Coordinators & Assertions of types %@", v6];

  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_coordinators;
  id v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v38;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v8;
        id v9 = *(void **)(*((void *)&v37 + 1) + 8 * v8);
        uint64_t v10 = [v9 description];
        [v7 appendFormat:@"\n%@", v10, lock];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v28 = v25;
        id v11 = [v28 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v34;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v28);
              }
              long long v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              long long v16 = objc_msgSend(v9, "assertionsOfType:", objc_msgSend(v15, "unsignedIntegerValue"));
              id v17 = [v16 countByEnumeratingWithState:&v29 objects:v43 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v19 = *(void *)v30;
                do
                {
                  for (j = 0; j != v18; j = (char *)j + 1)
                  {
                    if (*(void *)v30 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    [v7 appendFormat:@"\n   - %@", *(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
                  }
                  id v18 = [v16 countByEnumeratingWithState:&v29 objects:v43 count:16];
                }
                while (v18);
              }
            }
            id v12 = [v28 countByEnumeratingWithState:&v33 objects:v44 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v26);
  }

  os_unfair_lock_unlock(lock);
  id v21 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetectSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_processStateMonitor, 0);
  objc_storeStrong((id *)&self->_monitoredPIDs, 0);
  objc_storeStrong((id *)&self->_coordinators, 0);
  objc_storeStrong((id *)&self->_localCoordinator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_coordinatorListener, 0);
}

- (void)acquireAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 reason:(id)a5 handler:(id)a6
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  os_unfair_lock_lock(p_lock);
  long long v14 = self->_localCoordinator;
  if (!v14)
  {
    long long v14 = (PDAssertionCoordinator *)[objc_alloc((Class)PDAssertionCoordinator) initWithConnection:0];
    objc_storeStrong((id *)&self->_localCoordinator, v14);
    sub_1003BF20C((uint64_t)self, v14);
  }
  os_unfair_lock_unlock(p_lock);
  [(PDAssertionCoordinator *)v14 acquireAssertionOfType:a3 withIdentifier:v13 reason:v12 handler:v11];
}

- (void)invalidateAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 handler:(id)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a5;
  id v11 = a4;
  os_unfair_lock_lock(p_lock);
  uint64_t v10 = self->_localCoordinator;
  os_unfair_lock_unlock(p_lock);
  [(PDAssertionCoordinator *)v10 invalidateAssertionOfType:a3 withIdentifier:v11 handler:v9];
}

@end