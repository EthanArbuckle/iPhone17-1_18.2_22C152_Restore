@interface KTAccountStateTracker
- (BOOL)firstCKAccountFetch;
- (BOOL)forceReload;
- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3;
- (CKAccountInfo)currentCKAccountInfo;
- (CKContainer)container;
- (Class)nsnotificationCenterClass;
- (KTCondition)ckAccountInfoInitialized;
- (KTCondition)finishedInitialDispatches;
- (KTNearFutureScheduler)fetchCKAccountStatusScheduler;
- (NSMapTable)ckChangeListeners;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)checkForAllDeliveries;
- (id)descriptionInternal:(id)a3;
- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4;
- (id)notifyCKAccountStatusChange:(id)a3;
- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3;
- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4;
- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6;
- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4;
- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4;
- (void)dealloc;
- (void)notifyCKAccountStatusChangeAndWaitForSignal;
- (void)performInitialDispatches;
- (void)recheckCKAccountStatus;
- (void)setCkAccountInfoInitialized:(id)a3;
- (void)setCkChangeListeners:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentCKAccountInfo:(id)a3;
- (void)setFinishedInitialDispatches:(id)a3;
- (void)setFirstCKAccountFetch:(BOOL)a3;
- (void)setForceReload:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation KTAccountStateTracker

- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4
{
  id v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)KTAccountStateTracker;
  v8 = [(KTAccountStateTracker *)&v28 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nsnotificationCenterClass, a4);
    uint64_t v10 = +[NSMapTable strongToWeakObjectsMapTable];
    ckChangeListeners = v9->_ckChangeListeners;
    v9->_ckChangeListeners = (NSMapTable *)v10;

    currentCKAccountInfo = v9->_currentCKAccountInfo;
    v9->_currentCKAccountInfo = 0;

    v13 = objc_alloc_init(KTCondition);
    ckAccountInfoInitialized = v9->_ckAccountInfoInitialized;
    v9->_ckAccountInfoInitialized = v13;

    objc_storeStrong((id *)&v9->_container, a3);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("ck-account-state", v15);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;

    *(_WORD *)&v9->_firstCKAccountFetch = 0;
    v9->_reloadLock._os_unfair_lock_opaque = 0;
    v18 = objc_alloc_init(KTCondition);
    finishedInitialDispatches = v9->_finishedInitialDispatches;
    v9->_finishedInitialDispatches = v18;

    v20 = [(objc_class *)[(KTAccountStateTracker *)v9 nsnotificationCenterClass] defaultCenter];
    if (qword_10032EF00 != -1) {
      dispatch_once(&qword_10032EF00, &stru_1002C4E68);
    }
    v21 = qword_10032EF08;
    if (os_log_type_enabled((os_log_t)qword_10032EF08, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Registering with notification center %@", buf, 0xCu);
    }
    [v20 addObserver:v9 selector:"notifyCKAccountStatusChange:" name:CKAccountChangedNotification object:0];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v9);
    v22 = [KTNearFutureScheduler alloc];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10019B0BC;
    v26[3] = &unk_1002B72D8;
    objc_copyWeak(&v27, (id *)buf);
    v23 = [(KTNearFutureScheduler *)v22 initWithName:@"ckstatus-refetch" initialDelay:5000000000 exponentialBackoff:600000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v26 block:1.1];
    fetchCKAccountStatusScheduler = v9->_fetchCKAccountStatusScheduler;
    v9->_fetchCKAccountStatusScheduler = v23;

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  return v9;
}

- (void)performInitialDispatches
{
  id v4 = [(KTAccountStateTracker *)self notifyCKAccountStatusChange:0];
  v5 = [(KTAccountStateTracker *)self finishedInitialDispatches];
  [v5 fulfill];
}

- (void)dealloc
{
  v3 = [(objc_class *)[(KTAccountStateTracker *)self nsnotificationCenterClass] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)KTAccountStateTracker;
  [(KTAccountStateTracker *)&v4 dealloc];
}

- (id)descriptionInternal:(id)a3
{
  id v4 = a3;
  v5 = [(KTAccountStateTracker *)self currentCKAccountInfo];
  v6 = +[NSString stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (NSString)description
{
  v3 = [(id)objc_opt_class() description];
  id v4 = [(KTAccountStateTracker *)self descriptionInternal:v3];

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  v6.receiver = self;
  v6.super_class = (Class)KTAccountStateTracker;
  v3 = [(KTAccountStateTracker *)&v6 description];
  id v4 = [(KTAccountStateTracker *)self descriptionInternal:v3];

  return (NSString *)v4;
}

- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  objc_super v6 = [(KTAccountStateTracker *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019B450;
  block[3] = &unk_1002B9DD0;
  block[4] = self;
  id v13 = v4;
  id v7 = v5;
  v14 = v7;
  id v8 = v4;
  dispatch_async(v6, block);

  v9 = v14;
  uint64_t v10 = v7;

  return v10;
}

- (id)notifyCKAccountStatusChange:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id location = 0;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10019BAF0;
  v17[3] = &unk_1002C4F30;
  objc_copyWeak(&v19, &location);
  objc_super v6 = v5;
  v18 = v6;
  id v7 = objc_retainBlock(v17);
  os_unfair_lock_lock(&self->_reloadLock);
  unsigned int v8 = [(KTAccountStateTracker *)self forceReload];
  [(KTAccountStateTracker *)self setForceReload:0];
  os_unfair_lock_unlock(&self->_reloadLock);
  [(KTAccountStateTracker *)self container];
  if (v8) {
    v9 = {;
  }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10019BEF0;
    v13[3] = &unk_1002C4F78;
    objc_copyWeak(&v16, &location);
    v14 = v6;
    v15 = v7;
    [v9 reloadAccountWithCompletionHandler:v13];

    objc_destroyWeak(&v16);
  }
  else {
    uint64_t v10 = {;
  }
    [v10 accountInfoWithCompletionHandler:v7];
  }
  v11 = v6;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(KTAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = dispatch_group_create();
  if (v9)
  {
    [(KTAccountStateTracker *)self _onqueueUpdateAccountState:v6 dispatchGroup:v9];
    uint64_t v10 = [(KTAccountStateTracker *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019C284;
    block[3] = &unk_1002B6CF8;
    id v13 = v7;
    dispatch_group_notify(v9, v10, block);
  }
  else
  {
    if (qword_10032EF00 != -1) {
      dispatch_once(&qword_10032EF00, &stru_1002C4F98);
    }
    v11 = qword_10032EF08;
    if (os_log_type_enabled((os_log_t)qword_10032EF08, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Unable to get dispatch group.", buf, 2u);
    }
    dispatch_semaphore_signal(v7);
  }
}

- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(KTAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(KTAccountStateTracker *)self currentCKAccountInfo];
  unsigned int v10 = [v9 isEqual:v6];

  if (!v10)
  {
    uint64_t v17 = [(KTAccountStateTracker *)self currentCKAccountInfo];
    v18 = (void *)v17;
    if (!v6 || v17)
    {
      uint64_t v19 = [(KTAccountStateTracker *)self currentCKAccountInfo];
      if ((id)v19 == v6)
      {

LABEL_16:
        goto LABEL_17;
      }
      v20 = (void *)v19;
      v21 = [(KTAccountStateTracker *)self currentCKAccountInfo];
      unsigned __int8 v22 = [v21 isEqual:v6];

      if (v22) {
        goto LABEL_17;
      }
    }
    if (qword_10032EF00 != -1) {
      dispatch_once(&qword_10032EF00, &stru_1002C4FD8);
    }
    v23 = (void *)qword_10032EF08;
    if (os_log_type_enabled((os_log_t)qword_10032EF08, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      v25 = [(KTAccountStateTracker *)self container];
      v26 = [v25 options];
      id v27 = [v26 accountOverrideInfo];
      objc_super v28 = [v27 altDSID];
      int v30 = 138412546;
      v31 = v28;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "moving to CK Account info(altDSID: %@): %@", (uint8_t *)&v30, 0x16u);
    }
    v18 = [(KTAccountStateTracker *)self currentCKAccountInfo];
    [(KTAccountStateTracker *)self setCurrentCKAccountInfo:v6];
    v29 = [(KTAccountStateTracker *)self ckAccountInfoInitialized];
    [v29 fulfill];

    [(KTAccountStateTracker *)self _onqueueDeliverCloudKitStateChanges:v18 dispatchGroup:v7];
    goto LABEL_16;
  }
  if (qword_10032EF00 != -1) {
    dispatch_once(&qword_10032EF00, &stru_1002C4FB8);
  }
  v11 = (void *)qword_10032EF08;
  if (os_log_type_enabled((os_log_t)qword_10032EF08, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    id v13 = [(KTAccountStateTracker *)self container];
    v14 = [v13 options];
    v15 = [v14 accountOverrideInfo];
    id v16 = [v15 altDSID];
    int v30 = 138412546;
    v31 = v16;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "received another notification of CK Account State(altDSID: %@) %@", (uint8_t *)&v30, 0x16u);
  }
LABEL_17:
}

- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(KTAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = [(KTAccountStateTracker *)self ckChangeListeners];
  v9 = [v8 keyEnumerator];

  uint64_t v10 = [v9 nextObject];
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      v12 = [(KTAccountStateTracker *)self ckChangeListeners];
      id v13 = [v12 objectForKey:v11];

      [(KTAccountStateTracker *)self _onqueueDeliverCurrentCloudKitState:v13 listenerQueue:v11 oldStatus:v15 group:v6];
      uint64_t v14 = [v9 nextObject];

      v11 = (void *)v14;
    }
    while (v14);
  }
}

- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6
{
  uint64_t v10 = a4;
  id v11 = a5;
  v12 = a6;
  id v13 = a3;
  uint64_t v14 = [(KTAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v14);

  id location = 0;
  objc_initWeak(&location, v13);

  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10019C85C;
    v15[3] = &unk_1002B71D0;
    objc_copyWeak(&v18, &location);
    id v16 = v11;
    uint64_t v17 = self;
    dispatch_group_async(v12, v10, v15);

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);
}

- (void)recheckCKAccountStatus
{
  p_reloadLock = &self->_reloadLock;
  os_unfair_lock_lock(&self->_reloadLock);
  [(KTAccountStateTracker *)self setForceReload:1];
  os_unfair_lock_unlock(p_reloadLock);
  id v4 = [(KTAccountStateTracker *)self fetchCKAccountStatusScheduler];
  [v4 trigger];
}

- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3
{
  id v4 = [(KTAccountStateTracker *)self notifyCKAccountStatusChange:0];
  dispatch_time_t v5 = dispatch_time(0, a3);
  LOBYTE(a3) = dispatch_semaphore_wait(v4, v5) == 0;

  return a3;
}

- (void)notifyCKAccountStatusChangeAndWaitForSignal
{
}

- (id)checkForAllDeliveries
{
  dispatch_group_t v3 = dispatch_group_create();
  if (v3)
  {
    id v4 = [(KTAccountStateTracker *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10019CB1C;
    v9[3] = &unk_1002B7D58;
    v9[4] = self;
    dispatch_time_t v5 = v3;
    uint64_t v10 = v5;
    dispatch_sync(v4, v9);

    id v6 = v5;
  }
  else
  {
    if (qword_10032EF00 != -1) {
      dispatch_once(&qword_10032EF00, &stru_1002C4FF8);
    }
    id v7 = qword_10032EF08;
    if (os_log_type_enabled((os_log_t)qword_10032EF08, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Unable to get dispatch group.", buf, 2u);
    }
  }

  return v3;
}

- (KTCondition)finishedInitialDispatches
{
  return (KTCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFinishedInitialDispatches:(id)a3
{
}

- (CKAccountInfo)currentCKAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentCKAccountInfo:(id)a3
{
}

- (KTCondition)ckAccountInfoInitialized
{
  return (KTCondition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCkAccountInfoInitialized:(id)a3
{
}

- (KTNearFutureScheduler)fetchCKAccountStatusScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 40, 1);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMapTable)ckChangeListeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCkChangeListeners:(id)a3
{
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContainer:(id)a3
{
}

- (BOOL)firstCKAccountFetch
{
  return self->_firstCKAccountFetch;
}

- (void)setFirstCKAccountFetch:(BOOL)a3
{
  self->_firstCKAccountFetch = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_ckChangeListeners, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nsnotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_fetchCKAccountStatusScheduler, 0);
  objc_storeStrong((id *)&self->_ckAccountInfoInitialized, 0);
  objc_storeStrong((id *)&self->_currentCKAccountInfo, 0);

  objc_storeStrong((id *)&self->_finishedInitialDispatches, 0);
}

@end