@interface CKKSAccountStateTracker
+ (id)getCircleStatus;
+ (id)stringFromAccountStatus:(int64_t)a3;
+ (void)fetchCirclePeerID:(id)a3;
- (BOOL)firstCKAccountFetch;
- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3;
- (CKAccountInfo)currentCKAccountInfo;
- (CKContainer)container;
- (CKKSCondition)accountCirclePeerIDInitialized;
- (CKKSCondition)cdpCapableiCloudAccountInitialized;
- (CKKSCondition)ckAccountInfoInitialized;
- (CKKSCondition)ckdeviceIDInitialized;
- (CKKSCondition)finishedInitialDispatches;
- (CKKSCondition)octagonInformationInitialized;
- (CKKSNearFutureScheduler)fetchCKAccountStatusScheduler;
- (Class)nsnotificationCenterClass;
- (NSError)accountCirclePeerIDError;
- (NSError)ckdeviceIDError;
- (NSMapTable)ckChangeListeners;
- (NSString)accountCirclePeerID;
- (NSString)ckdeviceID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)octagonPeerID;
- (OS_dispatch_queue)queue;
- (OTCliqueStatusWrapper)octagonStatus;
- (SOSAccountStatus)currentCircleStatus;
- (id)checkForAllDeliveries;
- (id)descriptionInternal:(id)a3;
- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4;
- (id)notifyCKAccountStatusChange:(id)a3;
- (id)notifyCircleChange:(id)a3;
- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3;
- (int64_t)cdpCapableiCloudAccountStatus;
- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4;
- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6;
- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4;
- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4;
- (void)_onqueueUpdateCKDeviceID:(id)a3;
- (void)_onqueueUpdateCirclePeerID:(id)a3;
- (void)dealloc;
- (void)notifyCKAccountStatusChangeAndWaitForSignal;
- (void)notifyCircleStatusChangeAndWaitForSignal;
- (void)performInitialDispatches;
- (void)recheckCKAccountStatus;
- (void)setAccountCirclePeerID:(id)a3;
- (void)setAccountCirclePeerIDError:(id)a3;
- (void)setAccountCirclePeerIDInitialized:(id)a3;
- (void)setCDPCapableiCloudAccountStatus:(int64_t)a3;
- (void)setCdpCapableiCloudAccountInitialized:(id)a3;
- (void)setCdpCapableiCloudAccountStatus:(int64_t)a3;
- (void)setCkAccountInfoInitialized:(id)a3;
- (void)setCkChangeListeners:(id)a3;
- (void)setCkdeviceID:(id)a3;
- (void)setCkdeviceIDError:(id)a3;
- (void)setCkdeviceIDInitialized:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentCKAccountInfo:(id)a3;
- (void)setCurrentCircleStatus:(id)a3;
- (void)setFinishedInitialDispatches:(id)a3;
- (void)setFirstCKAccountFetch:(BOOL)a3;
- (void)setOctagonInformationInitialized:(id)a3;
- (void)setOctagonPeerID:(id)a3;
- (void)setOctagonStatus:(id)a3;
- (void)setQueue:(id)a3;
- (void)triggerOctagonStatusFetch;
@end

@implementation CKKSAccountStateTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckChangeListeners, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nsnotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_cdpCapableiCloudAccountInitialized, 0);
  objc_storeStrong((id *)&self->_octagonInformationInitialized, 0);
  objc_storeStrong((id *)&self->_octagonStatus, 0);
  objc_storeStrong((id *)&self->_accountCirclePeerIDInitialized, 0);
  objc_storeStrong((id *)&self->_accountCirclePeerIDError, 0);
  objc_storeStrong((id *)&self->_accountCirclePeerID, 0);
  objc_storeStrong((id *)&self->_currentCircleStatus, 0);
  objc_storeStrong((id *)&self->_ckdeviceIDInitialized, 0);
  objc_storeStrong((id *)&self->_ckdeviceIDError, 0);
  objc_storeStrong((id *)&self->_ckdeviceID, 0);
  objc_storeStrong((id *)&self->_ckAccountInfoInitialized, 0);
  objc_storeStrong((id *)&self->_currentCKAccountInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_fetchCKAccountStatusScheduler, 0);
  objc_storeStrong((id *)&self->_finishedInitialDispatches, 0);

  objc_storeStrong((id *)&self->_octagonPeerID, 0);
}

- (void)setFirstCKAccountFetch:(BOOL)a3
{
  self->_firstCKAccountFetch = a3;
}

- (BOOL)firstCKAccountFetch
{
  return self->_firstCKAccountFetch;
}

- (void)setCkChangeListeners:(id)a3
{
}

- (NSMapTable)ckChangeListeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 168, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 152, 1);
}

- (void)setCdpCapableiCloudAccountInitialized:(id)a3
{
}

- (CKKSCondition)cdpCapableiCloudAccountInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCdpCapableiCloudAccountStatus:(int64_t)a3
{
  self->_cdpCapableiCloudAccountStatus = a3;
}

- (int64_t)cdpCapableiCloudAccountStatus
{
  return self->_cdpCapableiCloudAccountStatus;
}

- (void)setOctagonInformationInitialized:(id)a3
{
}

- (CKKSCondition)octagonInformationInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setOctagonStatus:(id)a3
{
}

- (OTCliqueStatusWrapper)octagonStatus
{
  return (OTCliqueStatusWrapper *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAccountCirclePeerIDInitialized:(id)a3
{
}

- (CKKSCondition)accountCirclePeerIDInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAccountCirclePeerIDError:(id)a3
{
}

- (NSError)accountCirclePeerIDError
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAccountCirclePeerID:(id)a3
{
}

- (NSString)accountCirclePeerID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentCircleStatus:(id)a3
{
}

- (SOSAccountStatus)currentCircleStatus
{
  return (SOSAccountStatus *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCkdeviceIDInitialized:(id)a3
{
}

- (CKKSCondition)ckdeviceIDInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCkdeviceIDError:(id)a3
{
}

- (NSError)ckdeviceIDError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCkdeviceID:(id)a3
{
}

- (NSString)ckdeviceID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCkAccountInfoInitialized:(id)a3
{
}

- (CKKSCondition)ckAccountInfoInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentCKAccountInfo:(id)a3
{
}

- (CKAccountInfo)currentCKAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContainer:(id)a3
{
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 40, 1);
}

- (CKKSNearFutureScheduler)fetchCKAccountStatusScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFinishedInitialDispatches:(id)a3
{
}

- (CKKSCondition)finishedInitialDispatches
{
  return (CKKSCondition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOctagonPeerID:(id)a3
{
}

- (NSString)octagonPeerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCDPCapableiCloudAccountStatus:(int64_t)a3
{
  -[CKKSAccountStateTracker setCdpCapableiCloudAccountStatus:](self, "setCdpCapableiCloudAccountStatus:");
  if (a3)
  {
    id v7 = [(CKKSAccountStateTracker *)self cdpCapableiCloudAccountInitialized];
    [v7 fulfill];
  }
  else
  {
    v5 = [CKKSCondition alloc];
    id v7 = [(CKKSAccountStateTracker *)self cdpCapableiCloudAccountInitialized];
    id v6 = -[CKKSCondition initToChain:](v5, "initToChain:");
    [(CKKSAccountStateTracker *)self setCdpCapableiCloudAccountInitialized:v6];
  }
}

- (void)triggerOctagonStatusFetch
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_10004917C;
  v10[4] = sub_10004918C;
  id v11 = 0;
  v3 = [(CKKSAccountStateTracker *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049194;
  block[3] = &unk_100307348;
  block[4] = self;
  block[5] = v10;
  dispatch_sync(v3, block);

  id v4 = objc_alloc_init((Class)OTOperationConfiguration);
  [v4 setTimeoutWaitForCKAccount:100000000];
  v5 = +[OTManager manager];
  id v6 = objc_alloc_init((Class)OTControlArguments);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004922C;
  v7[3] = &unk_1002F82A0;
  objc_copyWeak(&v8, &location);
  v7[4] = v10;
  [v5 fetchTrustStatus:v6 configuration:v4 reply:v7];

  objc_destroyWeak(&v8);
  _Block_object_dispose(v10, 8);

  objc_destroyWeak(&location);
}

- (id)checkForAllDeliveries
{
  dispatch_group_t v3 = dispatch_group_create();
  if (v3)
  {
    id v4 = [(CKKSAccountStateTracker *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100049708;
    v9[3] = &unk_100305930;
    v9[4] = self;
    v5 = v3;
    v10 = v5;
    dispatch_sync(v4, v9);

    id v6 = v5;
  }
  else
  {
    id v7 = sub_1000CD884(@"ckksaccount", 0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to get dispatch group.", buf, 2u);
    }
  }

  return v3;
}

- (void)notifyCircleStatusChangeAndWaitForSignal
{
  v2 = [(CKKSAccountStateTracker *)self notifyCircleChange:0];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)notifyCKAccountStatusChangeAndWaitForSignal
{
}

- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3
{
  id v4 = [(CKKSAccountStateTracker *)self notifyCKAccountStatusChange:0];
  dispatch_time_t v5 = dispatch_time(0, a3);
  LOBYTE(a3) = dispatch_semaphore_wait(v4, v5) == 0;

  return a3;
}

- (void)recheckCKAccountStatus
{
  id v2 = [(CKKSAccountStateTracker *)self fetchCKAccountStatusScheduler];
  [v2 trigger];
}

- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6
{
  v10 = a4;
  id v11 = a5;
  v12 = a6;
  id v13 = a3;
  v14 = [(CKKSAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v14);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v13);

  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100049BC8;
    v15[3] = &unk_1003077C8;
    objc_copyWeak(&v18, &location);
    id v16 = v11;
    v17 = self;
    dispatch_group_async(v12, v10, v15);

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);
}

- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(CKKSAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CKKSAccountStateTracker *)self ckChangeListeners];
  v9 = [v8 keyEnumerator];

  uint64_t v10 = [v9 nextObject];
  if (v10)
  {
    id v11 = (void *)v10;
    do
    {
      v12 = [(CKKSAccountStateTracker *)self ckChangeListeners];
      id v13 = [v12 objectForKey:v11];

      [(CKKSAccountStateTracker *)self _onqueueDeliverCurrentCloudKitState:v13 listenerQueue:v11 oldStatus:v15 group:v6];
      uint64_t v14 = [v9 nextObject];

      id v11 = (void *)v14;
    }
    while (v14);
  }
}

- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKKSAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(CKKSAccountStateTracker *)self currentCKAccountInfo];
  unsigned int v10 = [v9 isEqual:v6];

  if (v10)
  {
    id v11 = sub_1000CD884(@"ckksaccount", 0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(CKKSAccountStateTracker *)self container];
      id v13 = [v12 options];
      uint64_t v14 = [v13 accountOverrideInfo];
      id v15 = [v14 altDSID];
      int v27 = 138412546;
      v28 = v15;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "received another notification of CK Account State(altDSID: %@) %@", (uint8_t *)&v27, 0x16u);
    }
    goto LABEL_12;
  }
  uint64_t v16 = [(CKKSAccountStateTracker *)self currentCKAccountInfo];
  id v11 = v16;
  if (v6 && !v16) {
    goto LABEL_8;
  }
  uint64_t v17 = [(CKKSAccountStateTracker *)self currentCKAccountInfo];
  if ((id)v17 == v6)
  {

LABEL_12:
    goto LABEL_13;
  }
  id v18 = (void *)v17;
  v19 = [(CKKSAccountStateTracker *)self currentCKAccountInfo];
  unsigned __int8 v20 = [v19 isEqual:v6];

  if ((v20 & 1) == 0)
  {
LABEL_8:
    v21 = sub_1000CD884(@"ckksaccount", 0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(CKKSAccountStateTracker *)self container];
      v23 = [v22 options];
      v24 = [v23 accountOverrideInfo];
      v25 = [v24 altDSID];
      int v27 = 138412546;
      v28 = v25;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "moving to CK Account info(altDSID: %@): %@", (uint8_t *)&v27, 0x16u);
    }
    id v11 = [(CKKSAccountStateTracker *)self currentCKAccountInfo];
    [(CKKSAccountStateTracker *)self setCurrentCKAccountInfo:v6];
    v26 = [(CKKSAccountStateTracker *)self ckAccountInfoInitialized];
    [v26 fulfill];

    [(CKKSAccountStateTracker *)self _onqueueUpdateCKDeviceID:v6];
    [(CKKSAccountStateTracker *)self _onqueueDeliverCloudKitStateChanges:v11 dispatchGroup:v7];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKKSAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = dispatch_group_create();
  if (v9)
  {
    [(CKKSAccountStateTracker *)self _onqueueUpdateAccountState:v6 dispatchGroup:v9];
    unsigned int v10 = [(CKKSAccountStateTracker *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A170;
    block[3] = &unk_100308558;
    id v13 = v7;
    dispatch_group_notify(v9, v10, block);
  }
  else
  {
    id v11 = sub_1000CD884(@"ckksaccount", 0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to get dispatch group.", buf, 2u);
    }

    dispatch_semaphore_signal(v7);
  }
}

- (void)_onqueueUpdateCirclePeerID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(CKKSAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v5);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([v4 status])
  {
    id v6 = sub_1000CD884(@"ckks-sos", 0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "out of circle(%@): resetting peer ID", buf, 0xCu);
    }

    [(CKKSAccountStateTracker *)self setAccountCirclePeerID:0];
    [(CKKSAccountStateTracker *)self setAccountCirclePeerIDError:0];
    id v7 = objc_alloc_init(CKKSCondition);
    [(CKKSAccountStateTracker *)self setAccountCirclePeerIDInitialized:v7];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004A354;
    v8[3] = &unk_1002F9B98;
    objc_copyWeak(&v9, &location);
    +[CKKSAccountStateTracker fetchCirclePeerID:v8];
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

- (id)notifyCircleChange:(id)a3
{
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_time_t v5 = +[CKKSAccountStateTracker getCircleStatus];
  id v6 = [(CKKSAccountStateTracker *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A754;
  block[3] = &unk_100305720;
  void block[4] = self;
  id v13 = v5;
  id v7 = v4;
  uint64_t v14 = v7;
  id v8 = v5;
  dispatch_sync(v6, block);

  id v9 = v14;
  unsigned int v10 = v7;

  return v10;
}

- (void)_onqueueUpdateCKDeviceID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(CKKSAccountStateTracker *)self queue];
  dispatch_assert_queue_V2(v5);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([v4 accountStatus] == (id)1)
  {
    id v6 = [(CKKSAccountStateTracker *)self container];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004AA10;
    v8[3] = &unk_1002F9B98;
    objc_copyWeak(&v9, &location);
    [v6 fetchCurrentDeviceIDWithCompletionHandler:v8];

    objc_destroyWeak(&v9);
  }
  else
  {
    [(CKKSAccountStateTracker *)self setCkdeviceID:0];
    [(CKKSAccountStateTracker *)self setCkdeviceIDError:0];
    id v7 = objc_alloc_init(CKKSCondition);
    [(CKKSAccountStateTracker *)self setCkdeviceIDInitialized:v7];
  }
  objc_destroyWeak(&location);
}

- (id)notifyCKAccountStatusChange:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004AE88;
  v11[3] = &unk_1002F8228;
  objc_copyWeak(&v13, &location);
  id v6 = v5;
  id v12 = v6;
  id v7 = objc_retainBlock(v11);
  id v8 = [(CKKSAccountStateTracker *)self container];
  [v8 accountInfoWithCompletionHandler:v7];

  id v9 = v6;
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(CKKSAccountStateTracker *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B29C;
  block[3] = &unk_100305720;
  void block[4] = self;
  id v13 = v4;
  id v7 = v5;
  uint64_t v14 = v7;
  id v8 = v4;
  dispatch_async(v6, block);

  id v9 = v14;
  unsigned int v10 = v7;

  return v10;
}

- (NSString)debugDescription
{
  v6.receiver = self;
  v6.super_class = (Class)CKKSAccountStateTracker;
  dispatch_group_t v3 = [(CKKSAccountStateTracker *)&v6 description];
  id v4 = [(CKKSAccountStateTracker *)self descriptionInternal:v3];

  return (NSString *)v4;
}

- (NSString)description
{
  dispatch_group_t v3 = [(id)objc_opt_class() description];
  id v4 = [(CKKSAccountStateTracker *)self descriptionInternal:v3];

  return (NSString *)v4;
}

- (id)descriptionInternal:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(CKKSAccountStateTracker *)self currentCKAccountInfo];
  int64_t v6 = [(CKKSAccountStateTracker *)self cdpCapableiCloudAccountStatus];
  CFStringRef v7 = @"available";
  if (v6 == 3) {
    CFStringRef v7 = @"no account";
  }
  if (!v6) {
    CFStringRef v7 = @"unknown";
  }
  id v8 = +[NSString stringWithFormat:@"<%@: %@, cdp capable: %@>", v4, v5, v7];

  return v8;
}

- (void)dealloc
{
  dispatch_group_t v3 = [(objc_class *)[(CKKSAccountStateTracker *)self nsnotificationCenterClass] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKKSAccountStateTracker;
  [(CKKSAccountStateTracker *)&v4 dealloc];
}

- (void)performInitialDispatches
{
  id v4 = [(CKKSAccountStateTracker *)self notifyCKAccountStatusChange:0];
  id v5 = [(CKKSAccountStateTracker *)self notifyCircleChange:0];
  int64_t v6 = [(CKKSAccountStateTracker *)self finishedInitialDispatches];
  [v6 fulfill];
}

- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4
{
  id v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CKKSAccountStateTracker;
  id v8 = [(CKKSAccountStateTracker *)&v43 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nsnotificationCenterClass, a4);
    uint64_t v10 = +[NSMapTable strongToWeakObjectsMapTable];
    ckChangeListeners = v9->_ckChangeListeners;
    v9->_ckChangeListeners = (NSMapTable *)v10;

    currentCKAccountInfo = v9->_currentCKAccountInfo;
    v9->_currentCKAccountInfo = 0;

    id v13 = objc_alloc_init(CKKSCondition);
    ckAccountInfoInitialized = v9->_ckAccountInfoInitialized;
    v9->_ckAccountInfoInitialized = v13;

    id v15 = [[SOSAccountStatus alloc] init:0xFFFFFFFFLL error:0];
    currentCircleStatus = v9->_currentCircleStatus;
    v9->_currentCircleStatus = v15;

    objc_storeStrong((id *)&v9->_container, a3);
    uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("ck-account-state", v17);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;

    v9->_firstCKAccountFetch = 0;
    unsigned __int8 v20 = objc_alloc_init(CKKSCondition);
    finishedInitialDispatches = v9->_finishedInitialDispatches;
    v9->_finishedInitialDispatches = v20;

    v22 = objc_alloc_init(CKKSCondition);
    ckdeviceIDInitialized = v9->_ckdeviceIDInitialized;
    v9->_ckdeviceIDInitialized = v22;

    v24 = objc_alloc_init(CKKSCondition);
    octagonInformationInitialized = v9->_octagonInformationInitialized;
    v9->_octagonInformationInitialized = v24;

    v9->_cdpCapableiCloudAccountStatus = 0;
    v26 = objc_alloc_init(CKKSCondition);
    cdpCapableiCloudAccountInitialized = v9->_cdpCapableiCloudAccountInitialized;
    v9->_cdpCapableiCloudAccountInitialized = v26;

    v28 = [(objc_class *)[(CKKSAccountStateTracker *)v9 nsnotificationCenterClass] defaultCenter];
    __int16 v29 = sub_1000CD884(@"ckksaccount", 0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Registering with notification center %@", location, 0xCu);
    }

    [v28 addObserver:v9 selector:"notifyCKAccountStatusChange:" name:CKAccountChangedNotification object:0];
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, v9);
    if (-[OTSOSActualAdapter sosEnabled]_0())
    {
      int out_token = 0;
      id v30 = (const char *)kSOSCCCircleChangedNotification;
      v31 = dispatch_get_global_queue(17, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10004BCCC;
      handler[3] = &unk_100306F38;
      objc_copyWeak(&v41, (id *)location);
      notify_register_dispatch(v30, &out_token, v31, handler);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004BD18;
      block[3] = &unk_1003077A0;
      objc_copyWeak(&v39, (id *)location);
      dispatch_async(v31, block);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&v41);
    }
    v32 = [CKKSNearFutureScheduler alloc];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10004BD78;
    v36[3] = &unk_1003077A0;
    objc_copyWeak(&v37, (id *)location);
    v33 = [(CKKSNearFutureScheduler *)v32 initWithName:@"ckstatus-refetch" initialDelay:5000000000 exponentialBackoff:600000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v36 block:1.1];
    fetchCKAccountStatusScheduler = v9->_fetchCKAccountStatusScheduler;
    v9->_fetchCKAccountStatusScheduler = v33;

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)location);
  }
  return v9;
}

+ (id)stringFromAccountStatus:(int64_t)a3
{
  CFStringRef v3 = @"account state unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"logged in";
  }
  if (a3 == 3) {
    return @"no account";
  }
  else {
    return (id)v3;
  }
}

+ (id)getCircleStatus
{
  id v2 = [[SOSAccountStatus alloc] init:SOSCCThisDeviceIsInCircle() error:0];

  return v2;
}

+ (void)fetchCirclePeerID:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C250;
  block[3] = &unk_1002F8250;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

@end