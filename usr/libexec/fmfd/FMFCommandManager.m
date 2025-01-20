@interface FMFCommandManager
+ (id)sharedInstance;
- (BOOL)hasModelInitialized;
- (BOOL)isIn5XXGracePeriod;
- (BOOL)isPendingRefresh;
- (BOOL)isRefreshInProgress;
- (BOOL)sendInitWithLazyCheckForSession:(id)a3 withReason:(int64_t)a4 completion:(id)a5;
- (FMFServerInteractionController)serverInteractionController;
- (NSArray)enumToStringMap;
- (NSCountedSet)skippedRefreshReasons;
- (NSDate)lastRefreshDate;
- (NSDate)latest5XXTS;
- (NSDictionary)_serverContext;
- (NSDictionary)cachedRedirects;
- (NSDictionary)commandDataContext;
- (NSDictionary)commandServerContext;
- (NSMutableSet)handlesToBeLocated;
- (NSTimer)registrationCheckTimer;
- (OS_dispatch_queue)redirectsUpdaterQueue;
- (OS_dispatch_queue)serverContextQueue;
- (double)graceInterval5XXInSec;
- (double)lastSuccessfulResponseTimestamp;
- (id)_filterLocatableHandles:(id)a3;
- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4;
- (id)cachedRedirectsFromDefaults;
- (id)stringForReasonCode:(int64_t)a3;
- (int64_t)preferredColeasedRefreshPriority;
- (int64_t)registrationRetries;
- (void)_performDeviceRegistrationCheck:(id)a3;
- (void)_refreshForSession:(id)a3 withReason:(int64_t)a4 withCompletion:(id)a5;
- (void)_scheduleRegistrationSanityCheck;
- (void)_sendInitForSession:(id)a3 withCompletion:(id)a4;
- (void)accountWasRemoved;
- (void)approveFriendshipRequest:(id)a3 forSession:(id)a4 completion:(id)a5;
- (void)canOfferToHandles:(id)a3 forSession:(id)a4 completion:(id)a5;
- (void)checkHeartbeat;
- (void)checkStatusForHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 forSession:(id)a6 completion:(id)a7;
- (void)clearDataAndServerContext;
- (void)clearRedirectsCache;
- (void)cloudKitRecordsChanged:(id)a3;
- (void)dealloc;
- (void)declineFriendshipRequest:(id)a3 forSession:(id)a4 completion:(id)a5;
- (void)enter5XXGracePeriod;
- (void)exit5XXGracePeriod;
- (void)extendFriendshipOfferRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)fetchLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7;
- (void)getLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7;
- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 forSession:(id)a5 completion:(id)a6;
- (void)hostRedirected:(id)a3;
- (void)importMappingPacket:(id)a3 forSession:(id)a4 completion:(id)a5;
- (void)invalidateMappingPackets:(id)a3 completion:(id)a4;
- (void)refreshDueToTapWithMessage:(id)a3;
- (void)removeDevice:(id)a3 forSession:(id)a4 completion:(id)a5;
- (void)resetModelToUninitialized;
- (void)saveFavorites:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (void)saveNotificationToken;
- (void)sendCommand:(id)a3 completionBlock:(id)a4;
- (void)sendFriendshipInviteRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)sendFriendshipOfferRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)sendNotNowRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)setActiveDevice:(id)a3 forSession:(id)a4 completion:(id)a5;
- (void)setAllowFriendRequestsEnabled:(BOOL)a3 forSession:(id)a4 completion:(id)a5;
- (void)setCachedRedirects:(id)a3;
- (void)setCommandDataContext:(id)a3;
- (void)setCommandServerContext:(id)a3;
- (void)setEnumToStringMap:(id)a3;
- (void)setHandlesToBeLocated:(id)a3;
- (void)setHasModelInitialized:(BOOL)a3;
- (void)setHideMyLocationEnabled:(BOOL)a3 forSession:(id)a4 completion:(id)a5;
- (void)setIsPendingRefresh:(BOOL)a3;
- (void)setIsRefreshInProgress:(BOOL)a3;
- (void)setLastRefreshDate:(id)a3;
- (void)setLatest5XXTS:(id)a3;
- (void)setPreferredColeasedRefreshPriority:(int64_t)a3;
- (void)setRedirectsUpdaterQueue:(id)a3;
- (void)setRegistrationCheckTimer:(id)a3;
- (void)setRegistrationRetries:(int64_t)a3;
- (void)setServerContextQueue:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)setSkippedRefreshReasons:(id)a3;
- (void)set_serverContext:(id)a3;
- (void)showAlertFromServerResponse:(id)a3;
- (void)stopSharingMyLocationWithHandles:(id)a3 forSession:(id)a4 groupId:(id)a5 callerId:(id)a6 completion:(id)a7;
- (void)storeRedirectsToDefaults;
- (void)updateFence:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (void)updateRedirectsCache:(id)a3;
@end

@implementation FMFCommandManager

+ (id)sharedInstance
{
  if (qword_1000BB858 != -1) {
    dispatch_once(&qword_1000BB858, &stru_1000A2C00);
  }
  v2 = (void *)qword_1000BB850;

  return v2;
}

- (BOOL)hasModelInitialized
{
  return self->_hasModelInitialized;
}

- (BOOL)sendInitWithLazyCheckForSession:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void))a5;
  v10 = sub_100005560();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sendInitWithLazyCheck:", buf, 2u);
  }

  v11 = +[FMFLazyInitController sharedInstance];
  unsigned int v12 = [v11 allowInitForSessionCreation];

  if (v12)
  {
    [(FMFCommandManager *)self initializeModelForSession:v8 withReason:a4 completion:v9];
  }
  else
  {
    v13 = sub_100005560();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Skipping init and refresh due to no user data", v15, 2u);
    }

    if (v9) {
      v9[2](v9, 0);
    }
  }

  return v12;
}

- (void)_refreshForSession:(id)a3 withReason:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v11 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v12 = [v11 hasCredentials];

  if (v12)
  {
    unsigned __int8 v13 = [(FMFCommandManager *)v10 hasModelInitialized];
    if (a4 == 13) {
      unsigned __int8 v14 = 0;
    }
    else {
      unsigned __int8 v14 = v13;
    }
    if (v14)
    {
      v15 = +[FMFCommandCoalescer sharedInstance];
      [v15 refreshLocationForHandles:0 forSession:v8 callerId:0 priority:a4 == 4 reason:a4 completionBlock:v9];
    }
    else
    {
      v15 = objc_opt_new();
      v16 = [(FMFCommandManager *)v10 lastRefreshDate];
      if (!v16) {
        goto LABEL_14;
      }
      [v15 timeIntervalSince1970];
      double v18 = v17;
      v19 = [(FMFCommandManager *)v10 lastRefreshDate];
      [v19 timeIntervalSince1970];
      double v21 = v18 - v20;

      if (v21 > 0.5 || a4 == 13)
      {
LABEL_14:
        [(FMFCommandManager *)v10 setLastRefreshDate:v15];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000407F4;
        v23[3] = &unk_1000A21A0;
        v23[4] = v10;
        id v25 = v9;
        id v24 = v8;
        [(FMFCommandManager *)v10 _sendInitForSession:v24 withCompletion:v23];
      }
      else if (v9)
      {
        v22 = +[NSError errorWithDomain:FMFErrorDomain code:1015 userInfo:0];
        (*((void (**)(id, void *))v9 + 2))(v9, v22);
      }
    }
    goto LABEL_15;
  }
  if (v9)
  {
    v15 = +[NSError errorWithDomain:FMFErrorDomain code:1000 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
LABEL_15:
  }
  objc_sync_exit(v10);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(FMFCommandManager *)self setRegistrationRetries:0];
  v4.receiver = self;
  v4.super_class = (Class)FMFCommandManager;
  [(FMFCommandManager *)&v4 dealloc];
}

- (double)lastSuccessfulResponseTimestamp
{
  v2 = [(FMFCommandManager *)self serverInteractionController];
  [v2 lastSuccessfulResponseTimestamp];
  double v4 = v3;

  return v4;
}

- (void)accountWasRemoved
{
  [(FMFCommandManager *)self setHasModelInitialized:0];
  [(FMFCommandManager *)self setRegistrationRetries:0];

  [(FMFCommandManager *)self setCachedRedirects:0];
}

- (void)cloudKitRecordsChanged:(id)a3
{
}

- (void)_scheduleRegistrationSanityCheck
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FF8C;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performDeviceRegistrationCheck:(id)a3
{
  double v4 = +[FMFDataManager sharedInstance];
  unsigned __int8 v5 = [v4 isThisDeviceRegistered];

  v6 = sub_100005560();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This device has already registered, no need for any more sanity check", v9, 2u);
    }

    [(FMFCommandManager *)self setRegistrationRetries:0];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This device has not registered, posting darwin notification", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"FMFCurrentDeviceNotRegistered", 0, 0, 0);
    [(FMFCommandManager *)self setRegistrationRetries:(char *)[(FMFCommandManager *)self registrationRetries] + 1];
    [(FMFCommandManager *)self _scheduleRegistrationSanityCheck];
  }
}

- (id)stringForReasonCode:(int64_t)a3
{
  double v4 = [(FMFCommandManager *)self enumToStringMap];
  unsigned __int8 v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)_sendInitForSession:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "\n    ************************************************************************\n            Sending Init...\n    ************************************************************************", buf, 2u);
  }

  id v9 = [(FMFBaseCmd *)[FMFInitCommand alloc] initWithClientSession:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100040454;
  v11[3] = &unk_1000A2C28;
  id v12 = v6;
  id v10 = v6;
  [(FMFCommandManager *)self sendCommand:v9 completionBlock:v11];
}

- (id)_filterLocatableHandles:(id)a3
{
  id v3 = a3;
  double v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v5 = +[FMFDataManager sharedInstance];
    id v6 = [v5 followingHandles];
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Currently following friends: %@, trying to locate: %@", buf, 0x16u);
  }
  id v7 = +[NSMutableSet set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned __int8 v14 = +[FMFDataManager sharedInstance];
        v15 = [v13 identifier];
        v16 = [v14 followingHandleForIdentifier:v15];

        if (v16) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)clearDataAndServerContext
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing data context and server context", v4, 2u);
  }

  [(FMFCommandManager *)self setCommandDataContext:0];
  [(FMFCommandManager *)self setCommandServerContext:0];
}

- (void)resetModelToUninitialized
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting model state to uninitialized", v4, 2u);
  }

  [(FMFCommandManager *)self setHasModelInitialized:0];
}

- (void)sendCommand:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isUserAction])
  {
    id v8 = +[FMFAccountManager sharedInstance];
    if ([v8 isAccountAuthorized])
    {
LABEL_7:

      goto LABEL_8;
    }
    unsigned __int8 v9 = [(FMFCommandManager *)self hasModelInitialized];

    if ((v9 & 1) == 0)
    {
      id v10 = sub_100005560();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User action initiated in model not initialized state and 401 unauthorized state. Resetting 401 state to allow init and user action attempt.", buf, 2u);
      }

      id v8 = +[FMFAccountManager sharedInstance];
      [v8 setAccountStateAuthorizedDueTo401];
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || [(FMFCommandManager *)self hasModelInitialized])
  {
    uint64_t v11 = [(FMFCommandManager *)self serverInteractionController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100040E28;
    v16[3] = &unk_1000A2C50;
    id v17 = v6;
    id v18 = v7;
    id v12 = v7;
    [v11 sendCommand:v6 completionBlock:v16];

    unsigned __int8 v13 = v18;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100040CE8;
    v19[3] = &unk_1000A2C78;
    v19[4] = self;
    id v20 = v6;
    id v21 = v7;
    id v14 = v7;
    id v15 = v6;
    [(FMFCommandManager *)self refreshForSession:0 withReason:1 withCompletion:v19];

    unsigned __int8 v13 = v20;
  }
}

- (void)checkHeartbeat
{
}

- (void)refreshDueToTapWithMessage:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[FMFDataManager sharedInstance];
  id v7 = v4;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];

  [v5 updateTapMessagesCache:v6];
  [(FMFCommandManager *)self _refreshForSession:0 withReason:0 withCompletion:0];
}

- (void)fetchLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [(FMFCommandManager *)self _filterLocatableHandles:v12];
  if ([v16 count])
  {
    uint64_t v17 = 9;
    if (a6 != 2) {
      uint64_t v17 = 1;
    }
    if (a6 == 1) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = v17;
    }
    long long v19 = +[FMFCommandCoalescer sharedInstance];
    [v19 refreshLocationForHandles:v16 forSession:v13 callerId:v14 priority:a6 reason:v18 completionBlock:v15];
  }
  else
  {
    id v20 = sub_100005560();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not following any of the handles in %@, nothing to locate", buf, 0xCu);
    }

    uint64_t v21 = FMFErrorDomain;
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"Not following any of the passed handles";
    long long v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22 = +[NSError errorWithDomain:v21 code:101 userInfo:v19];
    (*((void (**)(id, void *))v15 + 2))(v15, v22);
  }
}

- (void)getLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  v53 = self;
  id v10 = a3;
  id v11 = a4;
  id v58 = a5;
  id v55 = a7;
  v56 = v11;
  v57 = [(FMFBaseCmd *)[FMFRefreshCommand alloc] initWithClientSession:v11];
  id v12 = +[NSMutableSet set];
  id v13 = sub_100005560();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = +[FMFDataManager sharedInstance];
    id v15 = [v14 followingHandles];
    *(_DWORD *)buf = 138412546;
    v72 = v15;
    __int16 v73 = 2112;
    id v74 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Currently following friends: %@, trying to locate: %@", buf, 0x16u);
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v16 = (FMFRefreshCommand *)v10;
  id v17 = [(FMFRefreshCommand *)v16 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v67;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v67 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v22 = +[FMFDataManager sharedInstance];
        NSErrorUserInfoKey v23 = [v21 identifier];
        CFStringRef v24 = [v22 followingHandleForIdentifier:v23];

        if (v24) {
          [(FMFRefreshCommand *)v12 addObject:v21];
        }
      }
      id v18 = [(FMFRefreshCommand *)v16 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v18);
  }

  __int16 v25 = sub_100005560();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v72 = v12;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Filtered friends list to locate: %@", buf, 0xCu);
  }

  id v26 = [(FMFRefreshCommand *)v12 count];
  v27 = sub_100005560();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  v29 = v57;
  if (v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412290;
      v72 = v12;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending locate for friends: %@", buf, 0xCu);
    }

    v30 = [(FMFRefreshCommand *)v12 allObjects];
    [(FMFRefreshCommand *)v57 setSelectedHandles:v30];

    [(FMFRefreshCommand *)v57 setIsShallowLocate:a6 == 0];
    v31 = [v58 identifier];
    [(FMFBaseCmd *)v57 setCallerIdentifier:v31];

    v32 = sub_100005560();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = 2;
      if (a6 == 2) {
        uint64_t v33 = 9;
      }
      if (a6 == 1) {
        uint64_t v34 = 4;
      }
      else {
        uint64_t v34 = v33;
      }
      v35 = [(FMFRefreshCommand *)v57 coalescedAppContexts];
      *(_DWORD *)buf = 138412802;
      v72 = v57;
      __int16 v73 = 2112;
      id v74 = v35;
      __int16 v75 = 2048;
      uint64_t v76 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Updating refresh command(%@, contextApp:%@, reason:%lu), building contextApp info from interested sessions", buf, 0x20u);
    }
    v36 = +[FMFXPCSessionManager sharedInstance];
    v37 = [v36 clientSessions];
    id v38 = [v37 copy];

    v39 = +[NSMutableSet set];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v27 = v38;
    id v40 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v63;
      do
      {
        for (j = 0; j != v41; j = (char *)j + 1)
        {
          if (*(void *)v63 != v42) {
            objc_enumerationMutation(v27);
          }
          v44 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
          v45 = [v44 handles:v53];
          unsigned int v46 = [(FMFRefreshCommand *)v12 intersectsSet:v45];

          if (v46)
          {
            v47 = [v44 clientPid];

            if (v47)
            {
              v48 = [v44 clientPid];
              [v39 addObject:v48];
            }
          }
        }
        id v41 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v41);
    }

    v49 = v55;
    v29 = v57;
    if ([v39 count])
    {
      v50 = [v39 allObjects];
      [(FMFRefreshCommand *)v57 setCoalescedAppContexts:v50];

      v51 = sub_100005560();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = [(FMFRefreshCommand *)v57 coalescedAppContexts];
        *(_DWORD *)buf = 138412546;
        v72 = v57;
        __int16 v73 = 2112;
        id v74 = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Updated contextApp for command(%@): %@", buf, 0x16u);
      }
    }
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100041780;
    v59[3] = &unk_1000A2CA0;
    id v61 = v55;
    v60 = v16;
    [(FMFCommandManager *)v53 sendCommand:v57 completionBlock:v59];
  }
  else
  {
    v49 = v55;
    if (v28)
    {
      *(_DWORD *)buf = 138412290;
      v72 = v16;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Returning, no friend to locate in list: %@", buf, 0xCu);
    }
  }
}

- (void)setHideMyLocationEnabled:(BOOL)a3 forSession:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [[FMFHideLocationCommand alloc] initWithHideLocation:v6 forSession:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100041944;
  v12[3] = &unk_1000A2C28;
  id v13 = v8;
  id v11 = v8;
  [(FMFCommandManager *)self sendCommand:v10 completionBlock:v12];
}

- (void)setAllowFriendRequestsEnabled:(BOOL)a3 forSession:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [[FMFAllowFriendRequestsCommand alloc] initWithAllowFriendRequests:v6 forSession:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100041A88;
  v12[3] = &unk_1000A2C28;
  id v13 = v8;
  id v11 = v8;
  [(FMFCommandManager *)self sendCommand:v10 completionBlock:v12];
}

- (void)setActiveDevice:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[FMFSavePrefsCommand alloc] initWithClientSession:v9 device:v10];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100041BD8;
  v13[3] = &unk_1000A2C28;
  id v14 = v8;
  id v12 = v8;
  [(FMFCommandManager *)self sendCommand:v11 completionBlock:v13];
}

- (void)removeDevice:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[FMFRemoveDeviceCommand alloc] initWithClientSession:v9 device:v10];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100041D28;
  v13[3] = &unk_1000A2C28;
  id v14 = v8;
  id v12 = v8;
  [(FMFCommandManager *)self sendCommand:v11 completionBlock:v13];
}

- (void)canOfferToHandles:(id)a3 forSession:(id)a4 completion:(id)a5
{
  v22 = self;
  id v7 = a3;
  id v23 = a4;
  id v8 = a5;
  id v9 = +[NSMutableDictionary dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v14);
        v16 = +[FMFIDSMessageController sharedInstance];
        [v16 updateIDSStatusForHandle:v15];

        id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 idsStatus]);
        id v18 = [v15 qualifiedIdentifier];
        [v9 setObject:v17 forKeyedSubscript:v18];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  uint64_t v19 = [[FMFCheckReachabilityStatus alloc] initWithClientSession:v23 idsClientStatusMap:v9];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100041FCC;
  v24[3] = &unk_1000A2CA0;
  id v25 = v10;
  id v26 = v8;
  id v20 = v10;
  id v21 = v8;
  [(FMFCommandManager *)v22 sendCommand:v19 completionBlock:v24];
}

- (void)sendFriendshipOfferRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  id v14 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v15 = [v14 hasCredentials];

  if ((v15 & 1) == 0)
  {
    CFStringRef v24 = sub_100005560();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not sending offer due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert];
    uint64_t v25 = FMFErrorDomain;
    uint64_t v26 = 1000;
    goto LABEL_9;
  }
  if ([(FMFCommandManager *)self hasModelInitialized])
  {
    v16 = +[FMFDataManager sharedInstance];
    unsigned __int8 v17 = [v16 canAddFollower];

    if ((v17 & 1) == 0)
    {
      +[FMFDUserNotification showMaxFollowersLimitReachedAlert];
      uint64_t v25 = FMFErrorDomain;
      uint64_t v26 = 104;
LABEL_9:
      long long v27 = +[NSError errorWithDomain:v25 code:v26 userInfo:0];
      v13[2](v13, 0, v27);

      goto LABEL_10;
    }
  }
  id v18 = [FMFOfferLocationCommand alloc];
  uint64_t v19 = [v10 toHandles];
  id v20 = [v10 groupId];
  id v21 = [v10 endDate];
  v22 = [(FMFOfferLocationCommand *)v18 initWithClientSession:v11 handles:v19 groupId:v20 expiresDate:v21];

  id v23 = [v12 identifier];
  [(FMFBaseCmd *)v22 setCallerIdentifier:v23];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100042464;
  v28[3] = &unk_1000A2CC8;
  id v29 = v10;
  long long v30 = v13;
  [(FMFCommandManager *)self sendCommand:v22 completionBlock:v28];

LABEL_10:
}

- (void)extendFriendshipOfferRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [FMFExtendOfferCommand alloc];
  unsigned __int8 v15 = [v13 toHandles];
  v16 = [v13 groupId];
  unsigned __int8 v17 = [v13 endDate];

  id v18 = [(FMFExtendOfferCommand *)v14 initWithClientSession:v12 handles:v15 groupId:v16 expiresDate:v17];
  uint64_t v19 = [v11 identifier];

  [(FMFBaseCmd *)v18 setCallerIdentifier:v19];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000427FC;
  v21[3] = &unk_1000A2C28;
  id v22 = v10;
  id v20 = v10;
  [(FMFCommandManager *)self sendCommand:v18 completionBlock:v21];
}

- (void)sendFriendshipInviteRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v15 = [v14 hasCredentials];

  if ((v15 & 1) == 0)
  {
    CFStringRef v24 = sub_100005560();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not sending friendship invite request due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert];
    uint64_t v25 = FMFErrorDomain;
    uint64_t v26 = 1000;
    goto LABEL_9;
  }
  if ([(FMFCommandManager *)self hasModelInitialized])
  {
    v16 = +[FMFDataManager sharedInstance];
    unsigned __int8 v17 = [v16 canAddFriend];

    if ((v17 & 1) == 0)
    {
      uint64_t v25 = FMFErrorDomain;
      uint64_t v26 = 103;
LABEL_9:
      long long v27 = +[NSError errorWithDomain:v25 code:v26 userInfo:0];
      v13[2](v13, 0, v27);

      goto LABEL_10;
    }
  }
  id v18 = [FMFInviteCommand alloc];
  uint64_t v19 = [v10 toHandles];
  id v20 = [v10 groupId];
  id v21 = [v10 endDate];
  id v22 = [(FMFInviteCommand *)v18 initWithClientSession:v11 handles:v19 groupId:v20 expiresDate:v21];

  id v23 = [v12 identifier];
  [(FMFBaseCmd *)v22 setCallerIdentifier:v23];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100042B04;
  v28[3] = &unk_1000A2C28;
  id v29 = v13;
  [(FMFCommandManager *)self sendCommand:v22 completionBlock:v28];

LABEL_10:
}

- (void)sendNotNowRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v15 = [v14 hasCredentials];

  if (v15)
  {
    v16 = [FMFNotNowCommand alloc];
    unsigned __int8 v17 = [v10 toHandles];
    id v18 = [(FMFNotNowCommand *)v16 initWithClientSession:v11 handles:v17];

    uint64_t v19 = [v12 identifier];
    [(FMFBaseCmd *)v18 setCallerIdentifier:v19];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100042D84;
    v21[3] = &unk_1000A2C28;
    id v22 = v13;
    [(FMFCommandManager *)self sendCommand:v18 completionBlock:v21];
  }
  else
  {
    id v20 = sub_100005560();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not sending notNow request due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert];
    id v18 = +[NSError errorWithDomain:FMFErrorDomain code:1000 userInfo:0];
    (*((void (**)(id, void, FMFNotNowCommand *))v13 + 2))(v13, 0, v18);
  }
}

- (void)approveFriendshipRequest:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v12 = [v11 hasCredentials];

  if ((v12 & 1) == 0)
  {
    id v18 = sub_100005560();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not approving friendship request due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert];
    uint64_t v19 = FMFErrorDomain;
    uint64_t v20 = 1000;
    goto LABEL_9;
  }
  if ([(FMFCommandManager *)self hasModelInitialized])
  {
    id v13 = +[FMFDataManager sharedInstance];
    unsigned __int8 v14 = [v13 canAddFollower];

    if ((v14 & 1) == 0)
    {
      +[FMFDUserNotification showMaxFollowersLimitReachedAlert];
      uint64_t v19 = FMFErrorDomain;
      uint64_t v20 = 104;
LABEL_9:
      id v21 = +[NSError errorWithDomain:v19 code:v20 userInfo:0];
      v10[2](v10, v21);

      goto LABEL_10;
    }
  }
  unsigned __int8 v15 = [FMFRespondToInviteCommand alloc];
  v16 = [v8 requestId];
  unsigned __int8 v17 = [(FMFRespondToInviteCommand *)v15 initWithClientSession:v9 friendRequestId:v16 accepted:1];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100043038;
  v22[3] = &unk_1000A2CC8;
  id v23 = v8;
  CFStringRef v24 = v10;
  [(FMFCommandManager *)self sendCommand:v17 completionBlock:v22];

LABEL_10:
}

- (void)declineFriendshipRequest:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [FMFRespondToInviteCommand alloc];
  unsigned __int8 v12 = [v8 requestId];
  id v13 = [(FMFRespondToInviteCommand *)v11 initWithClientSession:v10 friendRequestId:v12 accepted:0];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000431F4;
  v16[3] = &unk_1000A2CC8;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  [(FMFCommandManager *)self sendCommand:v13 completionBlock:v16];
}

- (void)stopSharingMyLocationWithHandles:(id)a3 forSession:(id)a4 groupId:(id)a5 callerId:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[FMFRemoveFollowerCommand alloc] initWithClientSession:v15 handles:v16 groupId:v14];

  id v18 = [v13 identifier];

  [(FMFBaseCmd *)v17 setCallerIdentifier:v18];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000433CC;
  v20[3] = &unk_1000A2C28;
  id v21 = v12;
  id v19 = v12;
  [(FMFCommandManager *)self sendCommand:v17 completionBlock:v20];
}

- (void)checkStatusForHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 forSession:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[FMFStatusCommand alloc] initWithClientSession:v13 handles:v16 groupId:v15];

  id v18 = [v14 identifier];

  [(FMFBaseCmd *)v17 setCallerIdentifier:v18];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100043594;
  v20[3] = &unk_1000A2C28;
  id v21 = v12;
  id v19 = v12;
  [(FMFCommandManager *)self sendCommand:v17 completionBlock:v20];
}

- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 forSession:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [FMFStatusCommand alloc];
  id v15 = +[NSSet setWithObject:v13];

  id v16 = [(FMFStatusCommand *)v14 initWithClientSession:v11 handles:v15 groupId:v12];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000437EC;
  v18[3] = &unk_1000A2C28;
  id v19 = v10;
  id v17 = v10;
  [(FMFCommandManager *)self sendCommand:v16 completionBlock:v18];
}

- (void)importMappingPacket:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v12 = [v11 hasCredentials];

  if (v12)
  {
    if ([(FMFCommandManager *)self hasModelInitialized]
      && (+[FMFDataManager sharedInstance],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v13 canAddFriend],
          v13,
          (v14 & 1) == 0))
    {
      uint64_t v18 = FMFErrorDomain;
      uint64_t v19 = 103;
    }
    else
    {
      id v15 = +[FMFSystemInfo sharedInstance];
      unsigned int v16 = [v15 isAudioAccessory];

      if (!v16)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100043B60;
        v23[3] = &unk_1000A2CA0;
        CFStringRef v24 = [[FMFImportCommand alloc] initWithClientSession:v9 mappingPacketToken:v8];
        id v25 = v10;
        id v22 = v24;
        [(FMFCommandManager *)self sendCommand:v22 completionBlock:v23];

        goto LABEL_12;
      }
      id v17 = sub_100005560();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not importing mapping packet on audio accessories", buf, 2u);
      }

      uint64_t v18 = FMFErrorDomain;
      uint64_t v19 = 205;
    }
  }
  else
  {
    uint64_t v20 = sub_100005560();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not importing mapping packet due to missing credentials", buf, 2u);
    }

    uint64_t v18 = FMFErrorDomain;
    uint64_t v19 = 1000;
  }
  id v21 = +[NSError errorWithDomain:v18 code:v19 userInfo:0];
  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v21);

LABEL_12:
}

- (void)invalidateMappingPackets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[FMFRemoveFollowerCommand alloc] initWithClientSession:0 handles:0 groupId:0];
  id v9 = [v6 allObjects];
  [(FMFRemoveFollowerCommand *)v8 setPacketsToInvalidate:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100043CFC;
  v12[3] = &unk_1000A2CC8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(FMFCommandManager *)self sendCommand:v8 completionBlock:v12];
}

- (NSDictionary)cachedRedirects
{
  cachedRedirects = self->_cachedRedirects;
  if (!cachedRedirects)
  {
    id v4 = [(FMFCommandManager *)self cachedRedirectsFromDefaults];
    [(FMFCommandManager *)self setCachedRedirects:v4];

    cachedRedirects = self->_cachedRedirects;
  }

  return cachedRedirects;
}

- (void)setCachedRedirects:(id)a3
{
}

- (void)hostRedirected:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(FMFCommandManager *)self redirectsUpdaterQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043EBC;
  v7[3] = &unk_1000A1468;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)cachedRedirectsFromDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 valueForKey:@"kFMFHostRedirects"];

  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSDictionary dictionary];
  }
  unsigned __int8 v5 = v4;

  return v5;
}

- (void)updateRedirectsCache:(id)a3
{
  [(FMFCommandManager *)self setCachedRedirects:a3];

  [(FMFCommandManager *)self storeRedirectsToDefaults];
}

- (void)storeRedirectsToDefaults
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setObject:self->_cachedRedirects forKey:@"kFMFHostRedirects"];

  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    cachedRedirects = self->_cachedRedirects;
    int v7 = 138412290;
    id v8 = cachedRedirects;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Storing updated redirects map: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 synchronize];
}

- (void)clearRedirectsCache
{
  id v3 = [(FMFCommandManager *)self redirectsUpdaterQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000442D8;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)showAlertFromServerResponse:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned __int8 v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v89 = *(double *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing alert : %@", buf, 0xCu);
  }

  id v6 = [v4 objectForKeyedSubscript:@"title"];
  int v7 = +[NSNull null];
  if (v6 == v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"title"];
  }

  id v9 = [v4 objectForKeyedSubscript:@"alertType"];
  id v10 = +[NSNull null];
  if (v9 == v10)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = [v4 objectForKeyedSubscript:@"alertType"];
  }

  if (v8)
  {
    unsigned __int8 v12 = [v4 objectForKeyedSubscript:@"text"];
    id v13 = +[NSNull null];
    if (v12 == v13)
    {
      id v14 = 0;
    }
    else
    {
      id v14 = [v4 objectForKeyedSubscript:@"text"];
    }

    id v17 = [v4 objectForKeyedSubscript:@"okButtonTitle"];
    uint64_t v18 = +[NSNull null];
    if (v17 == v18)
    {
      uint64_t v76 = 0;
    }
    else
    {
      uint64_t v76 = [v4 objectForKeyedSubscript:@"okButtonTitle"];
    }

    uint64_t v19 = [v4 objectForKeyedSubscript:@"okButtonURL"];
    uint64_t v20 = +[NSNull null];
    v71 = v11;
    if (v19 == v20)
    {
      id v21 = 0;
    }
    else
    {
      id v21 = [v4 objectForKeyedSubscript:@"okButtonURL"];
    }

    id v22 = [v4 objectForKeyedSubscript:@"okButtonAction"];
    id v23 = +[NSNull null];
    if (v22 == v23)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = [v4 objectForKeyedSubscript:@"okButtonAction"];
    }

    id v25 = [v4 objectForKeyedSubscript:@"cancelButtonTitle"];
    uint64_t v26 = +[NSNull null];
    if (v25 == v26)
    {
      id v74 = 0;
    }
    else
    {
      id v74 = [v4 objectForKeyedSubscript:@"cancelButtonTitle"];
    }

    long long v27 = [v4 objectForKeyedSubscript:@"cancelButtonURL"];
    long long v28 = +[NSNull null];
    if (v27 == v28)
    {
      id v29 = 0;
    }
    else
    {
      id v29 = [v4 objectForKeyedSubscript:@"cancelButtonURL"];
    }

    long long v30 = [v4 objectForKeyedSubscript:@"cancelButtonAction"];
    v31 = +[NSNull null];
    if (v30 == v31)
    {
      uint64_t v32 = 0;
    }
    else
    {
      uint64_t v32 = [v4 objectForKeyedSubscript:@"cancelButtonAction"];
    }

    uint64_t v33 = [v4 objectForKeyedSubscript:@"delay"];
    [v33 doubleValue];
    double v35 = v34;

    v36 = objc_alloc_init(FMFServerUserNotification);
    [(FMFServerUserNotification *)v36 setCategory:4];
    [(FMFServerUserNotification *)v36 setShowMessage:1];
    v72 = v8;
    [(FMFServerUserNotification *)v36 setMsgTitle:v8];
    id v37 = v14;
    [(FMFServerUserNotification *)v36 setMsgText:v14];
    [(FMFServerUserNotification *)v36 setShowMsgInLockScreen:0];
    [(FMFServerUserNotification *)v36 setDismissMsgOnUnlock:0];
    [(FMFServerUserNotification *)v36 setDismissMsgOnLock:0];
    [(FMFServerUserNotification *)v36 setDefaultButtonTitle:v76];
    if (v21) {
      BOOL v38 = v24 == 0;
    }
    else {
      BOOL v38 = 0;
    }
    if (v38) {
      v39 = @"open-url";
    }
    else {
      v39 = (__CFString *)v24;
    }
    if (v29) {
      BOOL v40 = v32 == 0;
    }
    else {
      BOOL v40 = 0;
    }
    if (v40) {
      id v41 = @"open-url";
    }
    else {
      id v41 = (__CFString *)v32;
    }
    if (v39)
    {
      uint64_t v42 = [(FMFCommandManager *)self alertActionInfoForAction:v39 andURL:v21];
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_100044FE0;
      v85[3] = &unk_1000A1468;
      v86 = v39;
      id v87 = v42;
      id v43 = v42;
      [(FMFServerUserNotification *)v36 setDefaultButtonAction:v85];
    }
    [(FMFServerUserNotification *)v36 setAlternateButtonTitle:v74];
    if (v41)
    {
      v44 = [(FMFCommandManager *)self alertActionInfoForAction:v41 andURL:v29];
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_100045098;
      v82[3] = &unk_1000A1468;
      v83 = v41;
      id v84 = v44;
      id v45 = v44;
      [(FMFServerUserNotification *)v36 setAlternateButtonAction:v82];
    }
    unsigned int v46 = [(FMFServerUserNotification *)v36 defaultButtonTitle];
    if (!v46)
    {
      v47 = [(FMFServerUserNotification *)v36 alternateButtonTitle];

      if (v47) {
        goto LABEL_53;
      }
      unsigned int v46 = +[NSBundle bundleForClass:objc_opt_class()];
      v51 = [v46 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1000A3938 table:0];
      [(FMFServerUserNotification *)v36 setDefaultButtonTitle:v51];
    }
    id v14 = v37;
LABEL_53:
    if (v35 <= 0.0)
    {
      [(FMFServerUserNotification *)v36 activate];
    }
    else
    {
      v48 = sub_100005560();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v89 = v35;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Showing alert after %.2f seconds...", buf, 0xCu);
      }

      dispatch_time_t v49 = dispatch_time(0, (uint64_t)(v35 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100045150;
      block[3] = &unk_1000A14E8;
      v81 = v36;
      dispatch_after(v49, (dispatch_queue_t)&_dispatch_main_q, block);

      id v14 = v37;
    }

    goto LABEL_59;
  }
  if ([v11 isEqualToString:@"SAVEME"])
  {
    id v15 = [v4 objectForKeyedSubscript:@"alertId"];
    unsigned int v16 = +[NSNull null];
    if (v15 == v16)
    {
      id v14 = 0;
    }
    else
    {
      id v14 = [v4 objectForKeyedSubscript:@"alertId"];
    }

    v52 = +[NSUserDefaults standardUserDefaults];
    v50 = [v52 stringForKey:@"lastShownAlertId"];

    if (v14 && v50 && ([v50 isEqualToString:v14] & 1) != 0) {
      goto LABEL_61;
    }
    unsigned __int8 v53 = +[FMFUtils locationServicesEnabled];
    id v21 = sub_100005560();
    BOOL v54 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if ((v53 & 1) == 0)
    {
      if (v54)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Location services is disabled. Not acking the alert", buf, 2u);
      }
      goto LABEL_60;
    }
    __int16 v73 = self;
    __int16 v75 = v14;
    v71 = v11;
    v72 = 0;
    if (v54)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Location services is enabled. Displaying the alert & acking it", buf, 2u);
    }
    uint64_t v76 = (uint64_t)v50;

    id v55 = +[FMFDataManager sharedInstance];
    v56 = [v55 deviceSharingLocation];

    v57 = [v56 deviceName];
    uint64_t v58 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ME_ALERT_EXISTING_TITLE"];
    v59 = +[NSBundle bundleForClass:objc_opt_class()];
    v70 = (void *)v58;
    v60 = [v59 localizedStringForKey:v58 value:&stru_1000A3938 table:0];

    id v61 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v57)
    {
      long long v62 = [v61 localizedStringForKey:@"ME_ALERT_EXISTING_MESSAGE_HAS_ME" value:&stru_1000A3938 table:0];
      long long v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v62, v57);
    }
    else
    {
      long long v63 = [v61 localizedStringForKey:@"ME_ALERT_EXISTING_MESSAGE_NO_ME" value:&stru_1000A3938 table:0];
    }

    long long v64 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v65 = [v64 localizedStringForKey:@"ME_ALERT_NOT_NOW_BUTTON_TITLE" value:&stru_1000A3938 table:0];

    long long v66 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v67 = [v66 localizedStringForKey:@"ME_ALERT_USE_BUTTON_TITLE" value:&stru_1000A3938 table:0];

    long long v68 = objc_alloc_init(FMFServerUserNotification);
    [(FMFServerUserNotification *)v68 setCategory:4];
    [(FMFServerUserNotification *)v68 setShowMessage:1];
    [(FMFServerUserNotification *)v68 setMsgTitle:v60];
    [(FMFServerUserNotification *)v68 setMsgText:v63];
    [(FMFServerUserNotification *)v68 setShowMsgInLockScreen:0];
    [(FMFServerUserNotification *)v68 setDismissMsgOnUnlock:0];
    [(FMFServerUserNotification *)v68 setDismissMsgOnLock:0];
    [(FMFServerUserNotification *)v68 setAlternateButtonTitle:v65];
    [(FMFServerUserNotification *)v68 setDefaultButtonTitle:v67];
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_100045158;
    v79[3] = &unk_1000A14E8;
    v79[4] = v73;
    [(FMFServerUserNotification *)v68 setDefaultButtonAction:v79];
    [(FMFServerUserNotification *)v68 activate];

    id v14 = v75;
    if (!v75)
    {
      id v11 = v71;
      id v8 = 0;
      v50 = (void *)v76;
      goto LABEL_61;
    }
    long long v69 = +[NSUserDefaults standardUserDefaults];
    [v69 setObject:v75 forKey:@"lastShownAlertId"];

    id v21 = [[FMFAlertAckCommand alloc] initWithAlertId:v75];
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1000452F4;
    v77[3] = &unk_1000A2D30;
    id v14 = v75;
    id v78 = v14;
    [(FMFCommandManager *)v73 sendCommand:v21 completionBlock:v77];

LABEL_59:
    id v11 = v71;
    id v8 = v72;
    v50 = (void *)v76;
LABEL_60:

LABEL_61:
  }
}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  if ([v5 isEqualToString:@"settings"])
  {

    id v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE";
    int v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
    v19[0] = @"url";
    v19[1] = @"sensitive";
    v20[0] = v7;
    v20[1] = &__kCFBooleanTrue;
    id v8 = v20;
    id v9 = v19;
LABEL_10:
    id v11 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:2];

    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"fmf-settings"])
  {

    id v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING";
    int v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING"];
    v17[0] = @"url";
    v17[1] = @"sensitive";
    v18[0] = v7;
    v18[1] = &__kCFBooleanTrue;
    id v8 = v18;
    id v9 = v17;
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"fmip-settings"])
  {

    id v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR";
    int v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR"];
    v15[0] = @"url";
    v15[1] = @"sensitive";
    v16[0] = v7;
    v16[1] = &__kCFBooleanTrue;
    id v8 = v16;
    id v9 = v15;
    goto LABEL_10;
  }
  unsigned int v10 = [v5 isEqualToString:@"open-url"];
  id v11 = 0;
  if (v6 && v10)
  {
    int v7 = +[NSURL URLWithString:v6];
    v13[0] = @"url";
    v13[1] = @"sensitive";
    v14[0] = v7;
    v14[1] = &__kCFBooleanFalse;
    id v8 = v14;
    id v9 = v13;
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (void)enter5XXGracePeriod
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "enter5XXGracePeriod: Entering 5XX grace period", v5, 2u);
  }

  id v4 = +[NSDate date];
  [(FMFCommandManager *)self setLatest5XXTS:v4];
}

- (void)exit5XXGracePeriod
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "exit5XXGracePeriod: Exiting 5XX grace period", v4, 2u);
  }

  [(FMFCommandManager *)self setLatest5XXTS:0];
}

- (BOOL)isIn5XXGracePeriod
{
  id v3 = [(FMFCommandManager *)self latest5XXTS];

  if (!v3)
  {
    id v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "isIn5XXGracePeriod: NO not in grace period due to self.latest5XXTS == nil", (uint8_t *)&v15, 2u);
    }

    return 0;
  }
  id v4 = [(FMFCommandManager *)self latest5XXTS];

  if (!v4) {
    return 0;
  }
  id v5 = +[NSDate date];
  id v6 = [(FMFCommandManager *)self latest5XXTS];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  [(FMFCommandManager *)self graceInterval5XXInSec];
  double v10 = v9;
  id v11 = sub_100005560();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8 >= v10)
  {
    if (v12)
    {
      int v15 = 134218240;
      double v16 = v8;
      __int16 v17 = 2048;
      double v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "isIn5XXGracePeriod: NOLONGER in grace period intervalSinceLast5XX(%f) graceInterval5XXInSec(%f)", (uint8_t *)&v15, 0x16u);
    }

    [(FMFCommandManager *)self setLatest5XXTS:0];
    return 0;
  }
  if (v12)
  {
    int v15 = 134218240;
    double v16 = v8;
    __int16 v17 = 2048;
    double v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "isIn5XXGracePeriod: YES in grace period intervalSinceLast5XX(%f) graceInterval5XXInSec(%f)", (uint8_t *)&v15, 0x16u);
  }

  return 1;
}

- (double)graceInterval5XXInSec
{
  v2 = +[FMFDataManager sharedInstance];
  [v2 graceInterval5XXInSec];
  double v4 = v3;

  if (v4 <= 0.0) {
    double v4 = 60.0;
  }
  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "graceInterval5XXInSec: %f", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)setCommandServerContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFCommandManager *)self serverContextQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045AE4;
  v7[3] = &unk_1000A1468;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSDictionary)commandServerContext
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = sub_100007648;
  id v13 = sub_1000075E8;
  id v14 = 0;
  objc_initWeak(&location, self);
  double v3 = [(FMFCommandManager *)self serverContextQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045C88;
  block[3] = &unk_1000A2D58;
  void block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v3, block);

  id v4 = [(id)v10[5] copy];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v4;
}

- (void)saveNotificationToken
{
  double v3 = [(FMFCommandManager *)self _serverContext];
  id v4 = [v3 objectForKey:off_1000BB018];
  id v5 = +[NSNull null];
  if (v4 == v5)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(FMFCommandManager *)self _serverContext];
    id v7 = [v6 objectForKey:off_1000BB018];
  }
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving notification token", buf, 2u);
  }

  if (v7)
  {
    uint64_t v9 = +[NSUserDefaults standardUserDefaults];
    double v10 = [v9 objectForKey:off_1000BB018];
    id v11 = [v10 mutableCopy];

    if (!v11) {
      id v11 = (id)objc_opt_new();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        double v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v16), "isEqualToString:", v7, (void)v21))
          {
            uint64_t v20 = sub_100005560();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Token already saved", buf, 2u);
            }

            uint64_t v19 = v12;
            goto LABEL_25;
          }
          double v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    [v12 addObject:v7];
    if ((unint64_t)[v12 count] >= 3) {
      [v12 removeObjectAtIndex:0];
    }
    __int16 v17 = sub_100005560();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Storing updated notification token", buf, 2u);
    }

    double v18 = +[NSUserDefaults standardUserDefaults];
    [v18 setObject:v12 forKey:off_1000BB018];

    uint64_t v19 = +[NSUserDefaults standardUserDefaults];
    [v19 synchronize];
LABEL_25:
  }
}

- (void)updateFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: updateFence: %@", buf, 0xCu);
  }

  id v12 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v13 = [v12 hasCredentials];

  if (v13)
  {
    id v14 = [[FMFUpdateGeoFenceCommand alloc] initWithClientSession:v9 andFence:v8];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_1000461E4;
    v16[3] = &unk_1000A2C28;
    id v17 = v10;
    [(FMFCommandManager *)self sendCommand:v14 completionBlock:v16];
  }
  else
  {
    uint64_t v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10006C524(v15);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert];
    id v14 = +[NSError errorWithDomain:FMFErrorDomain code:1000 userInfo:0];
    (*((void (**)(id, FMFUpdateGeoFenceCommand *))v10 + 2))(v10, v14);
  }
}

- (void)saveFavorites:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: saveFavorites: %@", buf, 0xCu);
  }

  id v12 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v13 = [v12 hasCredentials];

  if (v13)
  {
    id v14 = [[FMFSaveFavoritesCommand alloc] initWithClientSession:v9 andFavorites:v8];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_100046540;
    v16[3] = &unk_1000A2C28;
    id v17 = v10;
    [(FMFCommandManager *)self sendCommand:v14 completionBlock:v16];
  }
  else
  {
    uint64_t v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10006C568(v15);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert];
    id v14 = +[NSError errorWithDomain:FMFErrorDomain code:1000 userInfo:0];
    (*((void (**)(id, FMFSaveFavoritesCommand *))v10 + 2))(v10, v14);
  }
}

- (NSDictionary)commandDataContext
{
  return self->_commandDataContext;
}

- (void)setCommandDataContext:(id)a3
{
}

- (void)setHasModelInitialized:(BOOL)a3
{
  self->_hasModelInitialized = a3;
}

- (FMFServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
}

- (BOOL)isPendingRefresh
{
  return self->_isPendingRefresh;
}

- (void)setIsPendingRefresh:(BOOL)a3
{
  self->_isPendingRefresh = a3;
}

- (BOOL)isRefreshInProgress
{
  return self->_isRefreshInProgress;
}

- (void)setIsRefreshInProgress:(BOOL)a3
{
  self->_isRefreshInProgress = a3;
}

- (NSMutableSet)handlesToBeLocated
{
  return self->_handlesToBeLocated;
}

- (void)setHandlesToBeLocated:(id)a3
{
}

- (NSArray)enumToStringMap
{
  return self->_enumToStringMap;
}

- (void)setEnumToStringMap:(id)a3
{
}

- (int64_t)preferredColeasedRefreshPriority
{
  return self->_preferredColeasedRefreshPriority;
}

- (void)setPreferredColeasedRefreshPriority:(int64_t)a3
{
  self->_preferredColeasedRefreshPriority = a3;
}

- (NSCountedSet)skippedRefreshReasons
{
  return self->_skippedRefreshReasons;
}

- (void)setSkippedRefreshReasons:(id)a3
{
}

- (NSTimer)registrationCheckTimer
{
  return self->_registrationCheckTimer;
}

- (void)setRegistrationCheckTimer:(id)a3
{
}

- (int64_t)registrationRetries
{
  return self->_registrationRetries;
}

- (void)setRegistrationRetries:(int64_t)a3
{
  self->_registrationRetries = a3;
}

- (OS_dispatch_queue)redirectsUpdaterQueue
{
  return self->_redirectsUpdaterQueue;
}

- (void)setRedirectsUpdaterQueue:(id)a3
{
}

- (OS_dispatch_queue)serverContextQueue
{
  return self->_serverContextQueue;
}

- (void)setServerContextQueue:(id)a3
{
}

- (NSDate)latest5XXTS
{
  return self->_latest5XXTS;
}

- (void)setLatest5XXTS:(id)a3
{
}

- (NSDictionary)_serverContext
{
  return self->__serverContext;
}

- (void)set_serverContext:(id)a3
{
}

- (NSDate)lastRefreshDate
{
  return self->_lastRefreshDate;
}

- (void)setLastRefreshDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
  objc_storeStrong((id *)&self->__serverContext, 0);
  objc_storeStrong((id *)&self->_latest5XXTS, 0);
  objc_storeStrong((id *)&self->_serverContextQueue, 0);
  objc_storeStrong((id *)&self->_redirectsUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_registrationCheckTimer, 0);
  objc_storeStrong((id *)&self->_skippedRefreshReasons, 0);
  objc_storeStrong((id *)&self->_enumToStringMap, 0);
  objc_storeStrong((id *)&self->_handlesToBeLocated, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_commandDataContext, 0);

  objc_storeStrong((id *)&self->_cachedRedirects, 0);
}

@end