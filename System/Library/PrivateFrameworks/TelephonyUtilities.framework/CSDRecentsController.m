@interface CSDRecentsController
- (BOOL)_canAddCallToCallHistory:(id)a3;
- (CHManager)recentsManager;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDIncomingCallFilter)incomingCallFilter;
- (CSDRecentsController)init;
- (CSDRecentsController)initWithCallCenterObserver:(id)a3 transactionManager:(id)a4 queue:(id)a5 chManager:(id)a6;
- (CSDRecentsController)initWithQueue:(id)a3 chManager:(id)a4;
- (CSDTransactionManager)transactionManager;
- (CSDUserNotificationDelegate)delegate;
- (NSMutableArray)transactionObjectsAwaitingCallHistory;
- (NSMutableDictionary)cachedCallUUIDsToConversationAVMode;
- (NSMutableDictionary)cachedCalls;
- (OS_dispatch_queue)queue;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (id)_callHistoryTransactionObjectWithIdentifier:(id)a3;
- (id)_conversationProviderForCall:(id)a3;
- (void)_addCallToCallHistory:(id)a3;
- (void)_addPendingCallToCallHistory:(id)a3;
- (void)_callConnected:(id)a3;
- (void)_callHistoryChanged:(id)a3;
- (void)_endTransactionForObjectAfterCallHistoryDatabaseChanges:(id)a3;
- (void)_handleCallHistoryChanged;
- (void)_markReadRecentCallsMatchingHandle:(id)a3;
- (void)callCenterObserver:(id)a3 callChanged:(id)a4;
- (void)clearNotificationsIfNecessary;
- (void)dealloc;
- (void)providersChangedForProviderManager:(id)a3;
- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5;
- (void)updateBytesOfDataUsed:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5;
@end

@implementation CSDRecentsController

- (CSDRecentsController)init
{
  return 0;
}

- (CSDRecentsController)initWithQueue:(id)a3 chManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(CSDCallCenterObserver);
  v9 = +[CSDTransactionManager sharedInstanceWithQueue:v7];
  v10 = [(CSDRecentsController *)self initWithCallCenterObserver:v8 transactionManager:v9 queue:v7 chManager:v6];

  return v10;
}

- (CSDRecentsController)initWithCallCenterObserver:(id)a3 transactionManager:(id)a4 queue:(id)a5 chManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = a5;
  id v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)CSDRecentsController;
  v15 = [(CSDRecentsController *)&v35 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a5);
    objc_storeStrong((id *)&v16->_callCenterObserver, a3);
    [(CSDCallCenterObserver *)v16->_callCenterObserver setTriggers:1];
    [(CSDCallCenterObserver *)v16->_callCenterObserver setDelegate:v16];
    objc_storeStrong((id *)&v16->_transactionManager, a4);
    objc_storeStrong((id *)&v16->_recentsManager, a6);
    uint64_t v17 = +[NSMutableArray array];
    transactionObjectsAwaitingCallHistory = v16->_transactionObjectsAwaitingCallHistory;
    v16->_transactionObjectsAwaitingCallHistory = (NSMutableArray *)v17;

    uint64_t v19 = +[NSMutableDictionary dictionary];
    cachedCalls = v16->_cachedCalls;
    v16->_cachedCalls = (NSMutableDictionary *)v19;

    uint64_t v21 = +[NSMutableDictionary dictionary];
    cachedCallUUIDsToConversationAVMode = v16->_cachedCallUUIDsToConversationAVMode;
    v16->_cachedCallUUIDsToConversationAVMode = (NSMutableDictionary *)v21;

    v23 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v16->_featureFlags;
    v16->_featureFlags = v23;

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v16 selector:"_callHistoryChanged:" name:kCallHistoryDatabaseChangedNotification object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v16 selector:"_addPendingCallToCallHistory:" name:@"CSDIDSPendingMessageDidReceiveCancelNotification" object:0];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v16 selector:"_callConnected:" name:TUCallCenterCallConnectedNotification object:0];

    v28 = objc_alloc_init(CSDIncomingCallFilter);
    incomingCallFilter = v16->_incomingCallFilter;
    v16->_incomingCallFilter = v28;

    v30 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    callProviderManager = v16->_callProviderManager;
    v16->_callProviderManager = v30;

    [(TUCallProviderManager *)v16->_callProviderManager addDelegate:v16 queue:v13];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100144628;
    block[3] = &unk_100504EC0;
    v34 = v16;
    dispatch_async(v13, block);
  }
  return v16;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDRecentsController;
  [(CSDRecentsController *)&v4 dealloc];
}

- (void)_callHistoryChanged:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRecentsController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014474C;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_callConnected:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 object];

  unsigned int v7 = [v6 isScreening];
  id v8 = sub_100008DCC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Call connected. Marking all calls as read.", v13, 2u);
    }

    v10 = [v6 handle];
    if ([v10 type] == (id)2)
    {
      id v11 = [v10 value];
      id v12 = [v6 isoCountryCode];
      id v8 = +[CHHandle normalizedPhoneNumberHandleForValue:v11 isoCountryCode:v12];

      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      id v8 = +[CHHandle handleWithTUHandle:v10];
      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    [(CSDRecentsController *)self _markReadRecentCallsMatchingHandle:v8];
    goto LABEL_11;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Call is being screened, ignoring to mark all calls as read", buf, 2u);
  }
LABEL_12:
}

- (void)clearNotificationsIfNecessary
{
  v3 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v8 = [(CSDRecentsController *)self delegate];
  if (v8)
  {
    id v4 = [(CSDRecentsController *)self recentsManager];
    v5 = +[CHRecentCall predicateForCallsWithStatusRead:0];
    id v6 = [v4 callsWithPredicate:v5 limit:0 offset:0 batchSize:0];

    unsigned int v7 = [v6 valueForKey:@"callerId"];
    [v8 clearReadNotificationsIgnoringHandleIds:v7];
  }
}

- (void)updateBytesOfDataUsed:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218498;
    int64_t v20 = a3;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "bytesOfDataUsed: %ld uniqueProxyIdentifier: %@ callHistoryIdentifier: %@", (uint8_t *)&v19, 0x20u);
  }

  id v12 = [(CSDRecentsController *)self cachedCalls];
  v13 = [v12 objectForKeyedSubscript:v8];

  id v14 = sub_100008DCC();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      int v19 = 138412290;
      int64_t v20 = (int64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Call still exists so updating its bytes of data used: %@", (uint8_t *)&v19, 0xCu);
    }

    [v13 setBytesOfDataUsed:a3];
  }
  else
  {
    if (v15)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No call still exists so updating bytes of data used via CHManager", (uint8_t *)&v19, 2u);
    }

    v16 = [(CSDRecentsController *)self recentsManager];
    uint64_t v17 = +[NSNumber numberWithInteger:a3];
    [v16 updateBytesOfDataUsedFor:v9 with:v17];

    v18 = [(CSDRecentsController *)self _callHistoryTransactionObjectWithIdentifier:v9];
    [(CSDRecentsController *)self _endTransactionForObjectAfterCallHistoryDatabaseChanges:v18];
  }
}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(CSDRecentsController *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100144D74;
  v13[3] = &unk_100506BD0;
  id v14 = v8;
  id v15 = v9;
  v16 = self;
  unint64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_addCallToCallHistory:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [objc_alloc((Class)CHRecentCall) initWithCall:v4];
  if ([v6 mediaType] == (id)2)
  {
    unsigned int v7 = [(CSDRecentsController *)self cachedCallUUIDsToConversationAVMode];
    id v8 = [v4 uniqueProxyIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];
    unsigned int v10 = [v9 intValue];

    if (v10 == 1) {
      [v6 setMediaType:1];
    }
  }
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Writing recent call to history: %@", (uint8_t *)&v13, 0xCu);
  }

  id v12 = [(CSDRecentsController *)self recentsManager];
  [v12 addToCallHistory:v6];
}

- (void)_addPendingCallToCallHistory:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"CSDIDSPendingCallKey"];
  id v6 = [objc_alloc((Class)CHRecentCall) initWithCall:v5];
  unsigned int v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Writing recent pending call to history: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(CSDRecentsController *)self recentsManager];
  [v8 addToCallHistory:v6];
}

- (void)_handleCallHistoryChanged
{
  v3 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v3);

  [(CSDRecentsController *)self clearNotificationsIfNecessary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(CSDRecentsController *)self transactionObjectsAwaitingCallHistory];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        id v10 = [(CSDRecentsController *)self transactionManager];
        [v10 endTransactionIfNecessaryForObject:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v11 = [(CSDRecentsController *)self transactionObjectsAwaitingCallHistory];
  [v11 removeAllObjects];
}

- (id)_conversationProviderForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isConversation])
  {
    id v6 = +[TUCallCenter sharedInstance];
    uint64_t v7 = [v6 activeConversationForCall:v4];

    if (v7)
    {
      id v8 = [v7 provider];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_canAddCallToCallHistory:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDRecentsController *)self _conversationProviderForCall:v4];
  if ([v4 supportsRecents])
  {
    uint64_t v7 = [v4 provider];
    if (![v7 supportsRecents]
      || ([v4 isVoicemail] & 1) != 0
      || [v4 disconnectedReason] == 17)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      id v10 = [(CSDRecentsController *)self featureFlags];
      if ([v10 groupFacetimeAsAServiceEnabled]
        && v6
        && ![v6 isDefaultProvider])
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        int v8 = TUSimulatedModeEnabled() ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_callHistoryTransactionObjectWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:@"%@:%@", objc_opt_class(), v3];

  return v4;
}

- (void)_endTransactionForObjectAfterCallHistoryDatabaseChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding transaction object to transactionObjectsAwaitingCallHistory: %@", buf, 0xCu);
  }

  uint64_t v7 = [(CSDRecentsController *)self transactionObjectsAwaitingCallHistory];
  [v7 addObject:v4];

  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  uint64_t v9 = [(CSDRecentsController *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001455F4;
  v11[3] = &unk_100504F10;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v8, v9, v11);
}

- (void)_markReadRecentCallsMatchingHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CHRecentCall predicateForCallsWithStatusRead:0];
  v15[0] = v6;
  uint64_t v7 = +[CHRecentCall predicateForCallsWithRemoteParticipantCount:1];
  v15[1] = v7;
  dispatch_time_t v8 = +[CHRecentCall predicateForCallsWithRemoteParticipantHandle:v4];

  v15[2] = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:v15 count:3];
  id v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  id v11 = [(CSDRecentsController *)self recentsManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001458A0;
  v13[3] = &unk_1005074F0;
  id v14 = v10;
  id v12 = v10;
  [v11 setRead:1 forCallsWithPredicate:v12 completion:v13];
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v24 = self;
  id v3 = a3;
  id v4 = [v3 providers];
  id v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    v25 = (void *)kCHServiceProviderTelephony;
    uint64_t v9 = (void *)kCHServiceProviderFaceTime;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "identifier", v24);
        id v12 = [v3 faceTimeProvider];
        long long v13 = [v12 identifier];
        unsigned __int8 v14 = [v11 isEqualToString:v13];

        long long v15 = v9;
        if ((v14 & 1) == 0)
        {
          v16 = objc_msgSend(v3, "telephonyProvider", v9);
          unint64_t v17 = [v16 identifier];
          unsigned int v18 = [v11 isEqualToString:v17];

          if (v18) {
            long long v15 = v25;
          }
          else {
            long long v15 = v11;
          }
        }
        [v5 addObject:v15];
      }
      id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    int v19 = [v5 allObjects];
    int64_t v20 = +[CHRecentCall predicateForCallsWithAnyServiceProviders:v19];
    __int16 v21 = +[NSCompoundPredicate notPredicateWithSubpredicate:v20];

    id v22 = [(CSDRecentsController *)v24 recentsManager];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100145C3C;
    v27[3] = &unk_1005074F0;
    id v28 = v21;
    id v23 = v21;
    [v22 deleteCallsWithPredicate:v23 completion:v27];
  }
}

- (void)callCenterObserver:(id)a3 callChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDRecentsController *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "call: %@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v8 = [v5 uniqueProxyIdentifier];
  uint64_t v9 = [(CSDRecentsController *)self _callHistoryTransactionObjectWithIdentifier:v8];

  unsigned int v10 = [v5 status];
  id v11 = [(CSDRecentsController *)self cachedCalls];
  id v12 = [v5 uniqueProxyIdentifier];
  if (v10 != 6)
  {
    [v11 setObject:v5 forKeyedSubscript:v12];

    if ([v5 isConversation])
    {
      long long v13 = [v5 remoteParticipantHandles];
      if ((unint64_t)[v13 count] < 2)
      {
LABEL_11:

        goto LABEL_12;
      }
      unsigned __int8 v14 = [(CSDRecentsController *)self cachedCallUUIDsToConversationAVMode];
      long long v15 = [v5 uniqueProxyIdentifier];
      v16 = [v14 objectForKeyedSubscript:v15];

      if (!v16)
      {
        unint64_t v17 = +[TUCallCenter sharedInstance];
        long long v13 = [v17 activeConversationForCall:v5];

        if (v13)
        {
          unsigned int v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 resolvedAudioVideoMode]);
          int v19 = [(CSDRecentsController *)self cachedCallUUIDsToConversationAVMode];
          int64_t v20 = [v5 uniqueProxyIdentifier];
          [v19 setObject:v18 forKeyedSubscript:v20];
        }
        goto LABEL_11;
      }
    }
LABEL_12:
    __int16 v21 = [(CSDRecentsController *)self transactionManager];
    id v22 = [v5 uniqueProxyIdentifier];
    [v21 beginTransactionIfNecessaryForObject:v9 withReason:v22];
    goto LABEL_15;
  }
  [v11 setObject:0 forKeyedSubscript:v12];

  if ([(CSDRecentsController *)self _canAddCallToCallHistory:v5])
  {
    [(CSDRecentsController *)self _addCallToCallHistory:v5];
    [(CSDRecentsController *)self _endTransactionForObjectAfterCallHistoryDatabaseChanges:v9];
  }
  else
  {
    id v23 = [(CSDRecentsController *)self transactionManager];
    [v23 endTransactionIfNecessaryForObject:v9];
  }
  __int16 v21 = [(CSDRecentsController *)self cachedCallUUIDsToConversationAVMode];
  id v22 = [v5 uniqueProxyIdentifier];
  [v21 setObject:0 forKeyedSubscript:v22];
LABEL_15:
}

- (CSDIncomingCallFilter)incomingCallFilter
{
  return self->_incomingCallFilter;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (CSDTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (CHManager)recentsManager
{
  return self->_recentsManager;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDUserNotificationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDUserNotificationDelegate *)WeakRetained;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSMutableArray)transactionObjectsAwaitingCallHistory
{
  return self->_transactionObjectsAwaitingCallHistory;
}

- (NSMutableDictionary)cachedCalls
{
  return self->_cachedCalls;
}

- (NSMutableDictionary)cachedCallUUIDsToConversationAVMode
{
  return self->_cachedCallUUIDsToConversationAVMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCallUUIDsToConversationAVMode, 0);
  objc_storeStrong((id *)&self->_cachedCalls, 0);
  objc_storeStrong((id *)&self->_transactionObjectsAwaitingCallHistory, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_callCenterObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_incomingCallFilter, 0);
}

@end