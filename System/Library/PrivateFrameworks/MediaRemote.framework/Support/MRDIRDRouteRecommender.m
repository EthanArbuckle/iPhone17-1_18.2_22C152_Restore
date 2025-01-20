@interface MRDIRDRouteRecommender
- (IRSession)session;
- (MRDIRDRouteRecommender)init;
- (MRRouteRecommenderDelegate)delegate;
- (NSString)bundleIdentifierPendingUpdate;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)queue;
- (id)defaultsContext;
- (id)irCandidateFor:(id)a3;
- (id)sortCandidateResults:(id)a3 contextIdentifier:(id)a4;
- (int)firstUnlockToken;
- (int64_t)allowedContextUpdates;
- (int64_t)mode;
- (void)_onQueue_createRunningSessionWithCompletion:(id)a3;
- (void)_onQueue_createRunningSessionWithServiceToken:(id)a3;
- (void)_onQueue_initializeSessionWithCompletion:(id)a3;
- (void)_onQueue_invalidateSession;
- (void)addEvent:(id)a3 forRouteCandidate:(id)a4;
- (void)fetchServiceTokenWithCompletion:(id)a3;
- (void)getSessionWithLatestConfiguration:(id)a3;
- (void)initializeSessionIfNeededWithCompletion:(id)a3;
- (void)requestCurrentContext;
- (void)requestCurrentContextWithBundleID:(id)a3;
- (void)runSession:(id)a3 withMode:(int64_t)a4 andServiceToken:(id)a5;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4;
- (void)session:(id)a3 didUpdateContext:(id)a4;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
- (void)setAllowedContextUpdates:(int64_t)a3;
- (void)setBundleIdentifierPendingUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstUnlockToken:(int)a3;
- (void)setMode:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)updateRouteCandidate:(id)a3;
- (void)updateRouteCandidates:(id)a3;
@end

@implementation MRDIRDRouteRecommender

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Mode set to %ld", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000082C8;
  v6[3] = &unk_10041B1C8;
  v6[4] = self;
  v6[5] = a3;
  [(MRDIRDRouteRecommender *)self initializeSessionIfNeededWithCompletion:v6];
}

- (id)defaultsContext
{
  v2 = [(MRDIRDRouteRecommender *)self userDefaults];
  v3 = [v2 objectForKey:@"IRContextUpdate"];

  v4 = +[MRIRRouteRecommendationContext fromObject:v3];
  if (v4)
  {
    v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int64_t v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Overriding context with %@", (uint8_t *)&v7, 0xCu);
    }
  }

  return v4;
}

- (id)sortCandidateResults:(id)a3 contextIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [a3 allObjects];
  int v7 = [v6 sortedArrayUsingComparator:&stru_10041B370];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C446C;
  v11[3] = &unk_10041B398;
  id v12 = v5;
  id v8 = v5;
  v9 = objc_msgSend(v7, "msv_map:", v11);

  return v9;
}

- (void)runSession:(id)a3 withMode:(int64_t)a4 andServiceToken:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [objc_alloc((Class)IRConfiguration) initWithServiceToken:v8];

  [v9 setMode:a4];
  v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218498;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Will call (%p)%@ runWithConfiguration: %@", (uint8_t *)&v11, 0x20u);
  }

  [v7 runWithConfiguration:v9];
}

- (void)_onQueue_initializeSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDIRDRouteRecommender *)self queue];
  dispatch_assert_queue_V2(v5);

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100007824;
  __int16 v13 = &unk_10041B450;
  id v14 = self;
  id v15 = v4;
  id v6 = v4;
  id v7 = objc_retainBlock(&v10);
  id v8 = [(MRDIRDRouteRecommender *)self session];

  if (v8)
  {
    id v9 = [(MRDIRDRouteRecommender *)self session];
    ((void (*)(void ***, void *, void))v7[2])(v7, v9, 0);
  }
  else
  {
    [(MRDIRDRouteRecommender *)self _onQueue_createRunningSessionWithCompletion:v7];
  }
  if (notify_is_valid_token(self->_firstUnlockToken)) {
    notify_cancel(self->_firstUnlockToken);
  }
}

- (IRSession)session
{
  return self->_session;
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD session:didUpdateContext: %@", (uint8_t *)&v17, 0xCu);
  }

  id v7 = [(MRDIRDRouteRecommender *)self defaultsContext];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:IRContextMediaRouteKey];
  }
  v10 = v9;

  uint64_t v11 = [v10 contextIdentifier];
  id v12 = [v10 candidateResults];
  __int16 v13 = [(MRDIRDRouteRecommender *)self sortCandidateResults:v12 contextIdentifier:v11];
  if ([(MRDIRDRouteRecommender *)self allowedContextUpdates] >= 1
    && ([(MRDIRDRouteRecommender *)self bundleIdentifierPendingUpdate],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    [(MRDIRDRouteRecommender *)self setAllowedContextUpdates:(char *)[(MRDIRDRouteRecommender *)self allowedContextUpdates] - 1];
    id v15 = [(MRDIRDRouteRecommender *)self delegate];
    id v16 = [(MRDIRDRouteRecommender *)self bundleIdentifierPendingUpdate];
    [v15 didReceiveNewRecommendations:v13 forBundleIdentifier:v16];
  }
  else
  {
    id v15 = [(MRDIRDRouteRecommender *)self delegate];
    [v15 didReceiveNewRecommendations:v13 forBundleIdentifier:0];
  }
}

- (void)initializeSessionIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(MRDIRDRouteRecommender *)self queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000C462C;
  handler[3] = &unk_10041B400;
  objc_copyWeak(&v16, &location);
  id v6 = v4;
  id v15 = v6;
  uint32_t v7 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockToken, v5, handler);

  if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Failed to register for first unlock notification (status = %d)", buf, 8u);
    }
  }
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    id v9 = [(MRDIRDRouteRecommender *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014160;
    block[3] = &unk_10041B428;
    objc_copyWeak(&v13, &location);
    id v12 = v6;
    dispatch_async(v9, block);

    objc_destroyWeak(&v13);
  }
  else
  {
    v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Device not yet unlocked since boot", buf, 2u);
    }
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (int64_t)mode
{
  return self->_mode;
}

- (MRRouteRecommenderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRRouteRecommenderDelegate *)WeakRetained;
}

- (int64_t)allowedContextUpdates
{
  return self->_allowedContextUpdates;
}

- (MRDIRDRouteRecommender)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRDIRDRouteRecommender;
  v2 = [(MRDIRDRouteRecommender *)&v7 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mediaremote"];
    [(MRDIRDRouteRecommender *)v2 setUserDefaults:v3];

    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.MRIRDRouteRecommender", v4);
    [(MRDIRDRouteRecommender *)v2 setQueue:v5];
  }
  return v2;
}

- (void)addEvent:(id)a3 forRouteCandidate:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C366C;
  v8[3] = &unk_10041B240;
  id v9 = a3;
  v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(MRDIRDRouteRecommender *)self getSessionWithLatestConfiguration:v8];
}

- (void)requestCurrentContext
{
}

- (void)requestCurrentContextWithBundleID:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C3BD8;
  v5[3] = &unk_10041B2A8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(MRDIRDRouteRecommender *)self getSessionWithLatestConfiguration:v5];
}

- (void)updateRouteCandidate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C3D6C;
  v5[3] = &unk_10041B2A8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(MRDIRDRouteRecommender *)self getSessionWithLatestConfiguration:v5];
}

- (void)updateRouteCandidates:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000C3F38;
    v5[3] = &unk_10041B2A8;
    id v6 = v4;
    id v7 = self;
    [(MRDIRDRouteRecommender *)self getSessionWithLatestConfiguration:v5];
  }
}

- (id)irCandidateFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)IRCandidate);
  dispatch_queue_t v5 = [v3 routeIdentifier];
  id v6 = [v4 initWithCandidateIdentifier:v5];

  id v7 = [v3 nodes];

  id v8 = objc_msgSend(v7, "msv_map:", &stru_10041B3D8);
  id v9 = +[NSSet setWithArray:v8];
  [v6 updateNodes:v9];

  return v6;
}

- (void)_onQueue_invalidateSession
{
  id v3 = [(MRDIRDRouteRecommender *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Invalidating Session", v7, 2u);
  }

  dispatch_queue_t v5 = [(MRDIRDRouteRecommender *)self session];

  if (v5)
  {
    id v6 = [(MRDIRDRouteRecommender *)self session];
    [v6 invalidate];
  }
  [(MRDIRDRouteRecommender *)self setSession:0];
}

- (void)_onQueue_createRunningSessionWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MRDIRDRouteRecommender *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C482C;
  v7[3] = &unk_10041B478;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MRDIRDRouteRecommender *)self fetchServiceTokenWithCompletion:v7];
}

- (void)_onQueue_createRunningSessionWithServiceToken:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MRDIRDRouteRecommender *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init((Class)IRSession);
  [v6 setDelegate:self];
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD createRunningSession: session created %@", (uint8_t *)&v8, 0xCu);
  }

  [(MRDIRDRouteRecommender *)self setSession:v6];
  [(MRDIRDRouteRecommender *)self runSession:v6 withMode:[(MRDIRDRouteRecommender *)self mode] andServiceToken:v4];
}

- (void)getSessionWithLatestConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD getSessionWithLatestConfiguration:", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C4BA0;
  v7[3] = &unk_10041B4A0;
  id v8 = v4;
  id v6 = v4;
  [(MRDIRDRouteRecommender *)self initializeSessionIfNeededWithCompletion:v7];
}

- (void)fetchServiceTokenWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD fetchServiceTokenWithCompletion: non user aware", v6, 2u);
  }

  dispatch_queue_t v5 = +[IRServiceToken serviceTokenForServiceIdentifier:MRIRServiceTokenIdentifier];
  v3[2](v3, v5);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDIRDRouteRecommender *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C4DC8;
  block[3] = &unk_1004159B8;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  dispatch_queue_t v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD session:suspendedWithReason: %ld", (uint8_t *)&v6, 0xCu);
  }
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  BOOL v5 = a5;
  int64_t v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    int64_t v9 = a4;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD session:suspensionReasonEnded:isNoLongerSuspended: %ld %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)session:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4
{
  id v4 = a4;
  BOOL v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD session:didUpdateBundlesWithSignificantInteractionPattern: %@", buf, 0xCu);
  }

  int v6 = +[NSMutableSet set];
  v20 = +[NSMutableSet set];
  int64_t v7 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v13 identifier];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v16 = v6;
        if ((isKindOfClass & 1) == 0
          || (id v17 = v13,
              id v18 = [v17 bundleType],
              [v7 setObject:v17 forKeyedSubscript:v14],
              v17,
              [v6 addObject:v14],
              id v16 = v20,
              v18 == (id)2))
        {
          [v16 addObject:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint32_t v19 = +[MRDMediaBundleManager shared];
  [v19 setBundles:v7];
}

- (void)setDelegate:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (int)firstUnlockToken
{
  return self->_firstUnlockToken;
}

- (void)setFirstUnlockToken:(int)a3
{
  self->_firstUnlockToken = a3;
}

- (void)setUserDefaults:(id)a3
{
}

- (void)setAllowedContextUpdates:(int64_t)a3
{
  self->_allowedContextUpdates = a3;
}

- (NSString)bundleIdentifierPendingUpdate
{
  return self->_bundleIdentifierPendingUpdate;
}

- (void)setBundleIdentifierPendingUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierPendingUpdate, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end