@interface MSDHomeManager
+ (id)sharedManager;
- (BOOL)isHomeKitInitialized;
- (BOOL)isHomeKitReady;
- (BOOL)isHomeManagerReady:(id)a3;
- (BOOL)isWaitingForHomesToLoad;
- (BOOL)isWaitingToStart;
- (HMAccessory)currentAccessory;
- (HMHome)currentHome;
- (HMHomeManager)homeManager;
- (MSDHomeManager)init;
- (NSArray)allHomes;
- (NSMutableArray)queuedAwaitingCurrentHome;
- (NSMutableSet)delegates;
- (NSUUID)homeOwnerUniqueIdentifier;
- (id)getHomeForUserIdentifier:(id)a3;
- (id)homeWithIdentifier:(id)a3;
- (void)_addHomeDelegates:(id)a3;
- (void)_handleHomeKitFinishedInitialization;
- (void)_handleHomeKitSyncComplete;
- (void)_homeWasRemoved;
- (void)_noteHomesStillLoading;
- (void)_withReadinessLock:(id)a3;
- (void)_withRequestLock:(id)a3;
- (void)addDelegate:(id)a3;
- (void)awaitCurrentHomeWithCompletion:(id)a3;
- (void)homeDidEnableMultiUser:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHomePermanently:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)registerToAcceptCloudSharesForContainers:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setIsHomeKitInitialized:(BOOL)a3;
- (void)setIsWaitingToStart:(BOOL)a3;
- (void)setQueuedAwaitingCurrentHome:(id)a3;
- (void)setWaitingForHomesToLoad:(BOOL)a3;
- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5;
@end

@implementation MSDHomeManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E250;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_100056758 != -1) {
    dispatch_once(&qword_100056758, block);
  }
  v2 = (void *)qword_100056760;

  return v2;
}

- (MSDHomeManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)MSDHomeManager;
  v2 = [(MSDHomeManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_isWaitingToStart = 1;
    *(_WORD *)&v2->_waitingForHomesToLoad = 0;
    v2->_readinessLock._os_unfair_lock_opaque = 0;
    id v4 = [objc_alloc((Class)HMMutableHomeManagerConfiguration) initWithOptions:104 cachePolicy:2];
    [v4 setDiscretionary:1];
    v5 = objc_opt_new();
    [v4 setDelegateQueue:v5];
    v6 = (HMHomeManager *)[objc_alloc((Class)HMHomeManager) initWithHomeMangerConfiguration:v4];
    homeManager = v3->_homeManager;
    v3->_homeManager = v6;

    [(HMHomeManager *)v3->_homeManager setDelegate:v3];
    uint64_t v8 = objc_opt_new();
    delegates = v3->_delegates;
    v3->_delegates = (NSMutableSet *)v8;

    uint64_t v10 = objc_opt_new();
    queuedAwaitingCurrentHome = v3->_queuedAwaitingCurrentHome;
    v3->_queuedAwaitingCurrentHome = (NSMutableArray *)v10;
  }
  return v3;
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSMutableSet *)self->_delegates addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSMutableSet *)self->_delegates removeObject:v5];
  objc_sync_exit(v4);
}

- (id)homeWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MSDHomeManager *)self allHomes];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 uniqueIdentifier];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HMHome)currentHome
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E6CC;
  v5[3] = &unk_10004D1A8;
  v5[4] = self;
  v5[5] = &v6;
  [(MSDHomeManager *)self _withReadinessLock:v5];
  if (*((unsigned char *)v7 + 24))
  {
    v3 = [(HMHomeManager *)self->_homeManager currentHome];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return (HMHome *)v3;
}

- (HMAccessory)currentAccessory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E81C;
  v5[3] = &unk_10004D1A8;
  v5[4] = self;
  v5[5] = &v6;
  [(MSDHomeManager *)self _withReadinessLock:v5];
  if (*((unsigned char *)v7 + 24))
  {
    v3 = [(HMHomeManager *)self->_homeManager currentAccessory];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return (HMAccessory *)v3;
}

- (NSArray)allHomes
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E96C;
  v5[3] = &unk_10004D1A8;
  v5[4] = self;
  v5[5] = &v6;
  [(MSDHomeManager *)self _withReadinessLock:v5];
  if (*((unsigned char *)v7 + 24))
  {
    v3 = [(HMHomeManager *)self->_homeManager homes];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)awaitCurrentHomeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0;
    unsigned __int8 v11 = &v10;
    uint64_t v12 = 0x3032000000;
    long long v13 = sub_10000EB00;
    long long v14 = sub_10000EB10;
    id v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000EB18;
    v7[3] = &unk_10004D1D0;
    char v9 = &v10;
    v7[4] = self;
    uint64_t v6 = (void (**)(void))v4;
    id v8 = v6;
    [(MSDHomeManager *)self _withRequestLock:v7];
    if (v11[5]) {
      v6[2](v6);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)registerToAcceptCloudSharesForContainers:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHomeManager *)self->_homeManager userCloudShareManager];
  [v5 setDelegate:self];

  uint64_t v6 = [(HMHomeManager *)self->_homeManager userCloudShareManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EC94;
  v8[3] = &unk_10004CBD8;
  id v9 = v4;
  id v7 = v4;
  [v6 registerForContainerIDs:v7 completion:v8];
}

- (id)getHomeForUserIdentifier:(id)a3
{
  return 0;
}

- (NSUUID)homeOwnerUniqueIdentifier
{
  return 0;
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  id v9 = sub_100031A80();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (isWaitingToStart)
  {
    if (v10)
    {
      int v14 = 136315138;
      id v15 = "-[MSDHomeManager homeManager:didAddHome:]";
      unsigned __int8 v11 = "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.";
      uint64_t v12 = v9;
      uint32_t v13 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
  }
  else
  {
    if (v10)
    {
      int v14 = 138478083;
      id v15 = v6;
      __int16 v16 = 2113;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HMHomeManager %{private}@ Added Home %{private}@", (uint8_t *)&v14, 0x16u);
    }

    if (![v7 isCurrentUserRestrictedGuest])
    {
      [v7 setDelegate:self];
      id v9 = +[MSDDataController sharedInstance];
      [v9 refreshDataForReason:0 completion:&stru_10004D210];
      goto LABEL_11;
    }
    id v9 = sub_100031A80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      unsigned __int8 v11 = "Determined that the user was a restricted guest. Skipping CloudKit refresh";
      uint64_t v12 = v9;
      uint32_t v13 = 2;
      goto LABEL_9;
    }
  }
LABEL_11:
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  if (isWaitingToStart)
  {
    id v9 = sub_100031A80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[MSDHomeManager homeManager:didRemoveHome:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    BOOL v10 = [v7 uuid];
    unsigned int v11 = [v6 isHomeRemovedPermanently:v10];

    uint64_t v12 = sub_100031A80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      int v14 = 138478339;
      id v15 = (const char *)v6;
      __int16 v16 = 2113;
      if (v11) {
        CFStringRef v13 = @"YES";
      }
      id v17 = v7;
      __int16 v18 = 2113;
      CFStringRef v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "HMHomeManager %{private}@ Removed Home %{private}@ isRemovedPermanently: %{private}@", (uint8_t *)&v14, 0x20u);
    }

    if (v11) {
      [(MSDHomeManager *)self _homeWasRemoved];
    }
  }
}

- (void)homeManager:(id)a3 didRemoveHomePermanently:(id)a4
{
  id v6 = (char *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  id v9 = sub_100031A80();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (isWaitingToStart)
  {
    if (v10)
    {
      int v11 = 136315138;
      uint64_t v12 = "-[MSDHomeManager homeManager:didRemoveHomePermanently:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 138478083;
      uint64_t v12 = v6;
      __int16 v13 = 2113;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HMHomeManager %{private}@ Permanently Removed Home %{private}@", (uint8_t *)&v11, 0x16u);
    }

    [(MSDHomeManager *)self _homeWasRemoved];
  }
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MSDHomeManager *)self isHomeManagerReady:v4];
  id v6 = sub_100031A80();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v4 status];
    id v7 = HMHomeManagerStatusToString();
    int v12 = 136315650;
    __int16 v13 = "-[MSDHomeManager homeManagerDidUpdateHomes:]";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 1024;
    unsigned int v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s manager status: %@, managerIsReady: %i", (uint8_t *)&v12, 0x1Cu);
  }
  os_unfair_lock_lock(&self->_readinessLock);
  BOOL isWaitingToStart = self->_isWaitingToStart;
  if (!self->_isHomeKitInitialized) {
    self->_isHomeKitInitialized = 1;
  }
  os_unfair_lock_unlock(&self->_readinessLock);
  char v9 = v5 ^ 1;
  if (isWaitingToStart) {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    BOOL v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v4 homes];
      int v12 = 138477827;
      __int16 v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received update on homes: %{private}@", (uint8_t *)&v12, 0xCu);
    }
    [(MSDHomeManager *)self _addHomeDelegates:v4];
  }
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5 = a3;
  unsigned int v6 = [(MSDHomeManager *)self isHomeManagerReady:v5];
  id v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v5 status];
    id v8 = HMHomeManagerStatusToString();
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[MSDHomeManager homeManager:didUpdateStatus:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 1024;
    unsigned int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s manager status: %@, managerIsReady: %i", buf, 0x1Cu);
  }
  if (v6)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v15) = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000F6C8;
    v11[3] = &unk_10004D238;
    __int16 v13 = buf;
    v11[4] = self;
    id v12 = v5;
    [(MSDHomeManager *)self _withReadinessLock:v11];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      [(MSDHomeManager *)self _handleHomeKitFinishedInitialization];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000F890;
      v10[3] = &unk_10004CAC0;
      v10[4] = self;
      [(MSDHomeManager *)self _withReadinessLock:v10];
      char v9 = +[MSDDataController sharedInstance];
      [v9 refreshDataForReason:9 completion:&stru_10004D258];
    }
    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)isHomeManagerReady:(id)a3
{
  return ((unint64_t)[a3 status] & 0x31) == 0;
}

- (void)homeDidEnableMultiUser:(id)a3
{
  id v3 = a3;
  id v4 = sub_100031A80();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [v3 isMultiUserEnabled];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Home MUEnablement status changed : %d", (uint8_t *)v6, 8u);
  }

  if ([v3 isMultiUserEnabled])
  {
    id v5 = [[MSDDataRefresh alloc] initWithReason:2];
    [(MSDDataRefresh *)v5 performRefreshWithCompletion:&stru_10004D278];
  }
}

- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    unsigned int v15 = "-[MSDHomeManager shareManager:didReceiveShareInvitation:completionHandler:]";
    __int16 v16 = 2113;
    id v17 = v7;
    __int16 v18 = 2113;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s, Manager:%{private}@ invitation: %{private}@", buf, 0x20u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000FC44;
  v12[3] = &unk_10004D2A0;
  id v13 = v9;
  id v11 = v9;
  +[MSDHomeCloudShareCreate acceptInvitation:v8 completion:v12];
}

- (void)_addHomeDelegates:(id)a3
{
  id v4 = [a3 homes];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000FDB4;
  v5[3] = &unk_10004D2C8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (BOOL)isHomeKitReady
{
  os_unfair_lock_assert_owner(&self->_readinessLock);
  if (!self->_isHomeKitInitialized) {
    return 0;
  }
  homeManager = self->_homeManager;

  return [(MSDHomeManager *)self isHomeManagerReady:homeManager];
}

- (void)_homeWasRemoved
{
  id v2 = +[MSDDataController sharedInstance];
  [v2 refreshDataForReason:1 completion:&stru_10004D2E8];
}

- (void)_noteHomesStillLoading
{
  os_unfair_lock_assert_owner(&self->_readinessLock);
  if (![(MSDHomeManager *)self isWaitingForHomesToLoad])
  {
    self->_waitingForHomesToLoad = 1;
    self->os_signpost_id_t signpostID = MSDGenerateSignpostID();
    id v3 = MSDSignpostFacility();
    id v4 = v3;
    os_signpost_id_t signpostID = self->signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "LookupHomes", (const char *)&unk_10003DE0E, v6, 2u);
    }
  }
}

- (void)_withReadinessLock:(id)a3
{
  p_readinessLock = &self->_readinessLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_readinessLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_readinessLock);
}

- (void)_withRequestLock:(id)a3
{
  p_requestQueueLock = &self->_requestQueueLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_requestQueueLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_requestQueueLock);
}

- (void)_handleHomeKitFinishedInitialization
{
}

- (void)_handleHomeKitSyncComplete
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_delegates;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector())
        {
          id v9 = dispatch_get_global_queue(2, 0);
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = sub_1000101F8;
          v10[3] = &unk_10004D310;
          v10[4] = v8;
          void v10[5] = self;
          dispatch_async(v9, v10);
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (NSMutableSet)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (BOOL)isWaitingForHomesToLoad
{
  return self->_waitingForHomesToLoad;
}

- (void)setWaitingForHomesToLoad:(BOOL)a3
{
  self->_waitingForHomesToLoad = a3;
}

- (BOOL)isHomeKitInitialized
{
  return self->_isHomeKitInitialized;
}

- (void)setIsHomeKitInitialized:(BOOL)a3
{
  self->_isHomeKitInitialized = a3;
}

- (BOOL)isWaitingToStart
{
  return self->_isWaitingToStart;
}

- (void)setIsWaitingToStart:(BOOL)a3
{
  self->_BOOL isWaitingToStart = a3;
}

- (NSMutableArray)queuedAwaitingCurrentHome
{
  return self->_queuedAwaitingCurrentHome;
}

- (void)setQueuedAwaitingCurrentHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedAwaitingCurrentHome, 0);
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end