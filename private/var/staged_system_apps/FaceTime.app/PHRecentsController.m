@interface PHRecentsController
+ (id)indexPathsToInsertIntoCachedRecentCalls:(id)a3 fromBackingRecentCalls:(id)a4;
- (BOOL)canLoadOlderRecentCalls;
- (BOOL)isInitializationBlockQueued;
- (BOOL)isLocalizedSubtitleUnknown:(id)a3;
- (BOOL)startedLoadingOlderCalls;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNContactStore)suggestedContactStore;
- (MPAnalyticsLogger)analyticsLogger;
- (NSArray)recentCalls;
- (NSCache)callProviderCache;
- (NSMapTable)delegateToQueue;
- (NSMutableDictionary)contactCache;
- (NSMutableDictionary)itemCache;
- (NSMutableDictionary)localizedSubtitleCache;
- (NSNumberFormatter)numberFormatter;
- (NSPredicate)preFetchingPredicate;
- (OS_dispatch_queue)completionDispatchQueue;
- (OS_dispatch_queue)serialQueue;
- (PHRecentsController)init;
- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7;
- (TUCallHistoryController)callHistoryController;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (TUMetadataCache)metadataCache;
- (TUSubtitleProvider)subtitleProvider;
- (id)coalesceRecentCall:(id)a3 withRecentCall:(id)a4;
- (id)contactByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)contactForHandle:(id)a3;
- (id)contactForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)contactHandlesForHandle:(id)a3;
- (id)contactHandlesForRecentCalls:(id)a3;
- (id)contactsByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)dialRequestForRecentCall:(id)a3;
- (id)fetchCallProviderForRecentCall:(id)a3;
- (id)fetchContactForContactCardDisplay:(id)a3;
- (id)fetchContactFormatter;
- (id)fetchImageForRecentCall:(id)a3;
- (id)fetchMutableItemForRecentCall:(id)a3;
- (id)fetchMutableItemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4;
- (id)fetchNumberFormatter;
- (id)fetchRecentCalls;
- (id)fetchUnifiedContactForID:(id)a3 withDescriptors:(id)a4;
- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4;
- (id)itemForRecentCall:(id)a3;
- (id)itemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4;
- (id)itemForRecentCall:(id)a3 presentationStyle:(int64_t)a4;
- (id)localizedSubtitleForRecentCall:(id)a3;
- (id)localizedSubtitleForRecentEmergencyCall:(id)a3;
- (id)metadataItemsForRecentCall:(id)a3;
- (id)presentScreenTimeShield;
- (id)recentCallsChangedFromCachedRecentCalls:(id)a3 callHistoryControllerRecentCalls:(id)a4;
- (id)subtitleForRecentEmergencyCall:(id)a3;
- (id)unknownLabel;
- (int)callDirectoryManagerIdentificationEntriesChangedNotificationToken;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)callHistoryControllerCoalescingStrategy;
- (unint64_t)callHistoryControllerOptions;
- (unint64_t)unreadCallCount;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)cancelSearchFetchOperations;
- (void)continuousScrollingReachedIndexPath:(int64_t)a3;
- (void)dealloc;
- (void)deleteAllRecentCalls;
- (void)deleteRecentCalls:(id)a3;
- (void)fetchContactsForHandles:(id)a3;
- (void)fetchContactsForRecentCalls:(id)a3;
- (void)fetchMetadataForRecentCalls:(id)a3;
- (void)handleCNContactStoreDidChangeNotification:(id)a3;
- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3;
- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)handleTUCallHistoryControllerRecentCallsDidChangeNotification:(id)a3;
- (void)handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:(id)a3;
- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3;
- (void)handleUIApplicationDidBecomeActiveNotification:(id)a3;
- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3;
- (void)loadOlderCallsIfNecessaryForRemainingRowCount:(int64_t)a3;
- (void)logRecentsScrollingEvent:(int64_t)a3;
- (void)markRecentAudioCallsAsRead;
- (void)markRecentCallsAsRead;
- (void)notifyDelegatesRecentsController:(id)a3 didChangeCalls:(id)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didCompleteFetchingCalls:(id)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didUpdateCalls:(id)a4;
- (void)notifyDelegatesRecentsControllerDidChangeMessages:(id)a3;
- (void)performDialRequest:(id)a3;
- (void)performDialRequestForRecentCall:(id)a3;
- (void)performJoinRequestForRecentCall:(id)a3;
- (void)performJoinRequestForRecentCall:(id)a3 overrideProvider:(id)a4;
- (void)performSynchronousBlock:(id)a3;
- (void)populateCachesForRecentCalls:(id)a3;
- (void)populateItemCacheForRecentCalls:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)recentCallsWillShow;
- (void)removeDelegate:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setCallDirectoryManagerIdentificationEntriesChangedNotificationToken:(int)a3;
- (void)setContactFormatter:(id)a3;
- (void)setInitializationBlockQueued:(BOOL)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setPreFetchingPredicate:(id)a3;
- (void)setPresentScreenTimeShield:(id)a3;
- (void)setRecentCalls:(id)a3;
- (void)setStartedLoadingOlderCalls:(BOOL)a3;
- (void)setUnreadCallCount:(unint64_t)a3;
- (void)updateRecentCalls;
@end

@implementation PHRecentsController

- (id)fetchContactFormatter
{
  v2 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_alloc_init((Class)CNContactFormatter);
  [v3 setStyle:0];

  return v3;
}

- (id)fetchNumberFormatter
{
  v2 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_alloc_init((Class)NSNumberFormatter);

  return v3;
}

- (CNContactStore)contactStore
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_contactStore;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v10 = a4;
  p_accessorLock = &self->_accessorLock;
  id v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  v8 = [(PHRecentsController *)self delegateToQueue];
  if (v10) {
    v9 = v10;
  }
  else {
    v9 = &_dispatch_main_q;
  }
  [v8 setObject:v9 forKey:v7];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)markRecentCallsAsRead
{
  id v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Mark recent calls as read", buf, 2u);
  }

  v4 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A724;
  block[3] = &unk_1000A1D50;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)fetchContactsForRecentCalls:(id)a3
{
  id v4 = a3;
  v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(PHRecentsController *)self contactHandlesForRecentCalls:v4];
  id v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = [v4 count];
    __int16 v10 = 2048;
    id v11 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu calls using %lu handles", (uint8_t *)&v8, 0x16u);
  }

  [(PHRecentsController *)self fetchContactsForHandles:v6];
}

- (void)handleUIApplicationDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    int v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  id v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A658;
  block[3] = &unk_1000A1D50;
  block[4] = self;
  dispatch_async(v9, block);
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeCalls:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  int v8 = [(PHRecentsController *)self delegateToQueue];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          v14 = [v8 objectForKey:v13];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001A648;
          block[3] = &unk_1000A2440;
          block[4] = v13;
          id v16 = v6;
          id v17 = v7;
          dispatch_async(v14, block);
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)handleTUCallHistoryControllerRecentCallsDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  id v6 = [(PHRecentsController *)self callHistoryController];
  unsigned __int8 v7 = [v5 isEqual:v6];

  int v8 = sub_100012C68();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      v12 = [v4 name];
      *(_DWORD *)buf = 138412802;
      __int16 v15 = v10;
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 2112;
      long long v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
    }
    int v8 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A608;
    block[3] = &unk_1000A1D50;
    block[4] = self;
    dispatch_async(v8, block);
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring calls change notification from different callHistoryController", buf, 2u);
  }
}

- (void)updateRecentCalls
{
  id v3 = [(PHRecentsController *)self fetchRecentCalls];
  [(PHRecentsController *)self setRecentCalls:v3];
}

- (void)setRecentCalls:(id)a3
{
  unsigned __int8 v7 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  recentCalls = self->_recentCalls;
  if (recentCalls != v7 && ![(NSArray *)recentCalls isEqualToArray:v7])
  {
    v5 = (NSArray *)[(NSArray *)v7 copy];
    id v6 = self->_recentCalls;
    self->_recentCalls = v5;

    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeCalls:self->_recentCalls];
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)populateCachesForRecentCalls:(id)a3
{
  id v4 = a3;
  v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100012C68();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    id v12 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting contacts for %lu calls", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self fetchContactsForRecentCalls:v4];
  unsigned __int8 v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 count];
    int v11 = 134217984;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting metadata for %lu recent calls.", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self fetchMetadataForRecentCalls:v4];
  BOOL v9 = sub_100012C68();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v4 count];
    int v11 = 134217984;
    id v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Populating item cache with %lu recent calls", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self populateItemCacheForRecentCalls:v4];
}

- (void)fetchMetadataForRecentCalls:(id)a3
{
  id v4 = a3;
  v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self metadataCache];

  if (v6)
  {
    unsigned __int8 v7 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:v4];
    id v8 = sub_100012C68();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v16 = [v4 count];
      __int16 v17 = 2048;
      id v18 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu recent calls using %lu handles", buf, 0x16u);
    }

    BOOL v9 = [(PHRecentsController *)self featureFlags];
    unsigned int v10 = [v9 phoneRecentsAvatarsEnabled];

    int v11 = [(PHRecentsController *)self metadataCache];
    id v12 = v11;
    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10003536C;
      v13[3] = &unk_1000A1E18;
      v13[4] = self;
      id v14 = v4;
      [v12 updateCacheWithDestinationIDs:v7 completion:v13];
    }
    else
    {
      [v11 updateCacheWithDestinationIDs:v7];
    }
  }
}

- (TUMetadataCache)metadataCache
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = self->_metadataCache;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v43 = a6;
  id v16 = a7;
  v46.receiver = self;
  v46.super_class = (Class)PHRecentsController;
  __int16 v17 = [(PHRecentsController *)&v46 init];
  id v18 = v17;
  if (v17)
  {
    v17->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v19 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v18->_delegateToQueue;
    v18->_delegateToQueue = (NSMapTable *)v19;

    v18->_initializationBlockQueued = 1;
    id v42 = v13;
    +[NSString stringWithFormat:@"com.apple.calls.queue.%@.%p", objc_opt_class(), v18];
    long long v21 = v41 = v15;
    v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v23 = v21;
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], v22);
    serialQueue = v18->_serialQueue;
    v18->_serialQueue = (OS_dispatch_queue *)v24;

    dispatch_queue_set_specific((dispatch_queue_t)v18->_serialQueue, off_1000BA070, v18, 0);
    objc_storeStrong((id *)&v18->_completionDispatchQueue, &_dispatch_main_q);
    objc_storeStrong((id *)&v18->_callHistoryController, a3);
    v26 = (NSCache *)objc_alloc_init((Class)NSCache);
    callProviderCache = v18->_callProviderCache;
    v18->_callProviderCache = v26;

    objc_storeStrong((id *)&v18->_callProviderManager, a4);
    callProviderManager = v18->_callProviderManager;
    v29 = [(PHRecentsController *)v18 serialQueue];
    [(TUCallProviderManager *)callProviderManager addDelegate:v18 queue:v29];

    v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contactCache = v18->_contactCache;
    v18->_contactCache = v30;

    objc_storeStrong((id *)&v18->_contactStore, a5);
    objc_storeStrong((id *)&v18->_suggestedContactStore, a6);
    objc_storeStrong((id *)&v18->_metadataCache, a7);
    v32 = (TUSubtitleProvider *)[objc_alloc((Class)TUSubtitleProvider) initWithMetadataCache:v16 callProviderManager:v14];
    subtitleProvider = v18->_subtitleProvider;
    v18->_subtitleProvider = v32;

    v34 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v18->_featureFlags;
    v18->_featureFlags = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    localizedSubtitleCache = v18->_localizedSubtitleCache;
    v18->_localizedSubtitleCache = v36;

    v18->_startedLoadingOlderCalls = 0;
    v38 = objc_alloc_init(MPAnalyticsLogger);
    [(PHRecentsController *)v18 setAnalyticsLogger:v38];

    v39 = v18->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F7C8;
    block[3] = &unk_1000A1D50;
    v45 = v18;
    dispatch_async(v39, block);

    id v13 = v42;
    id v15 = v41;
  }

  return v18;
}

- (void)logRecentsScrollingEvent:(int64_t)a3
{
  v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if (!(a3 % 100))
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = +[NSNumber numberWithInteger:a3 / 100];
    [v9 setObject:v6 forKey:@"BucketedScrollingIndex"];

    [v9 setObject:&off_1000A5F70 forKey:@"AppName"];
    unsigned __int8 v7 = [(PHRecentsController *)self analyticsLogger];
    id v8 = [v9 copy];
    [v7 logEvent:@"com.apple.MobilePhone.RecentsScrollingIndex" withCoreAnalyticsDictionary:v8];
  }
}

- (id)recentCallsChangedFromCachedRecentCalls:(id)a3 callHistoryControllerRecentCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v15 = [v14 uniqueId];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        v22 = [v21 uniqueId:v25];
        id v23 = [v8 objectForKey:v22];

        if (!v23 || ([v23 isEqual:v21] & 1) == 0) {
          [v7 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  return v7;
}

- (id)fetchRecentCalls
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PHRecentsController *)self recentCalls];
  id v5 = [(PHRecentsController *)self callHistoryController];
  id v6 = [v5 recentCalls];

  if ([v4 isEqualToArray:v6])
  {
    id v7 = sub_100012C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recent calls array has not changed. Ignoring", (uint8_t *)&v20, 2u);
    }

    id v8 = [(PHRecentsController *)self featureFlags];
    unsigned int v9 = [v8 callHistorySearchEnabled];

    if (v9)
    {
      os_unfair_lock_lock(&self->_accessorLock);
      [(PHRecentsController *)self notifyDelegatesRecentsController:self didCompleteFetchingCalls:v4];
      os_unfair_lock_unlock(&self->_accessorLock);
    }
    id v10 = v4;
    goto LABEL_16;
  }
  id v11 = [(PHRecentsController *)self featureFlags];
  unsigned int v12 = [v11 increaseCallHistoryEnabled];

  if (!v12)
  {
    id v18 = [(PHRecentsController *)self itemCache];
    [v18 removeAllObjects];

    [(PHRecentsController *)self populateCachesForRecentCalls:v6];
    id v10 = v6;
LABEL_16:
    id v17 = v10;
    goto LABEL_17;
  }
  id v13 = sub_100012C68();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Recent calls array has changed. Find the changed objects and only update their cache", (uint8_t *)&v20, 2u);
  }

  id v14 = [(PHRecentsController *)self recentCallsChangedFromCachedRecentCalls:v4 callHistoryControllerRecentCalls:v6];
  id v15 = sub_100012C68();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v14 count];
    int v20 = 134217984;
    id v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found %lu changed objects", (uint8_t *)&v20, 0xCu);
  }

  if ([v14 count]) {
    [(PHRecentsController *)self populateCachesForRecentCalls:v14];
  }
  id v17 = v6;

LABEL_17:

  return v17;
}

- (void)continuousScrollingReachedIndexPath:(int64_t)a3
{
  id v5 = [(PHRecentsController *)self featureFlags];
  unsigned int v6 = [v5 increaseCallHistoryEnabled];

  if (v6)
  {
    id v7 = [(PHRecentsController *)self recentCalls];
    id v8 = (char *)[v7 count] - a3;

    unsigned int v9 = sub_100012C68();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      int64_t v13 = a3;
      __int16 v14 = 2048;
      id v15 = v8;
      __int16 v16 = 1024;
      unsigned int v17 = [(PHRecentsController *)self startedLoadingOlderCalls];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_continuousScrollingReachedIndexPath %ld, remaining rows: %ld startedLoadingOlderCalls: %d", buf, 0x1Cu);
    }

    [(PHRecentsController *)self loadOlderCallsIfNecessaryForRemainingRowCount:v8];
    serialQueue = self->_serialQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001A288;
    v11[3] = &unk_1000A1FB8;
    v11[4] = self;
    v11[5] = a3;
    dispatch_async((dispatch_queue_t)serialQueue, v11);
  }
}

- (NSArray)recentCalls
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100012E5C;
  v15[3] = &unk_1000A2328;
  v15[4] = self;
  id v3 = objc_retainBlock(v15);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unsigned int v12 = sub_10003304C;
  int64_t v13 = sub_10003305C;
  ((void (*)(void))v3[2])();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10[5] && [(PHRecentsController *)self isInitializationBlockQueued])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A1A8;
    v6[3] = &unk_1000A2350;
    id v8 = &v9;
    id v7 = v3;
    [(PHRecentsController *)self performSynchronousBlock:v6];
  }
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

- (BOOL)startedLoadingOlderCalls
{
  return self->_startedLoadingOlderCalls;
}

- (void)loadOlderCallsIfNecessaryForRemainingRowCount:(int64_t)a3
{
  id v5 = [(PHRecentsController *)self featureFlags];
  unsigned int v6 = [v5 increaseCallHistoryEnabled];

  if (v6 && ![(PHRecentsController *)self startedLoadingOlderCalls])
  {
    id v13 = [(PHRecentsController *)self recentCalls];
    id v7 = [v13 count];
    id v8 = [(PHRecentsController *)self callHistoryController];
    id v9 = [v8 callHistoryControllerCallHistoryFetchLimit];
    if (a3 > 50 || v7 >= v9)
    {
    }
    else
    {
      unsigned int v10 = [(PHRecentsController *)self canLoadOlderRecentCalls];

      if (v10)
      {
        uint64_t v11 = sub_100012C68();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loading older recent calls", buf, 2u);
        }

        [(PHRecentsController *)self setStartedLoadingOlderCalls:1];
        unsigned int v12 = [(PHRecentsController *)self callHistoryController];
        [v12 loadOlderRecentCalls];
      }
    }
  }
}

- (TUCallHistoryController)callHistoryController
{
  return self->_callHistoryController;
}

- (void)notifyDelegatesRecentsController:(id)a3 didCompleteFetchingCalls:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHRecentsController *)self featureFlags];
  unsigned int v9 = [v8 callHistorySearchEnabled];

  if (v9)
  {
    os_unfair_lock_assert_owner(&self->_accessorLock);
    unsigned int v10 = [(PHRecentsController *)self delegateToQueue];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v14);
          if (objc_opt_respondsToSelector())
          {
            __int16 v16 = [v10 objectForKey:v15];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100034518;
            block[3] = &unk_1000A2440;
            void block[4] = v15;
            id v18 = v6;
            id v19 = v7;
            dispatch_async(v16, block);
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

- (BOOL)isInitializationBlockQueued
{
  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_initializationBlockQueued;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (id)contactHandlesForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned int v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = [v10 validRemoteParticipantHandles];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              __int16 v16 = [(PHRecentsController *)self contactHandlesForHandle:*(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
              [v5 addObjectsFromArray:v16];
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  unsigned int v17 = [v5 array];

  return v17;
}

- (void)fetchContactsForHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v13 = [(PHRecentsController *)self contactCache];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];

        if (!v14) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    uint64_t v15 = [(PHRecentsController *)self contactStore];
    __int16 v16 = sub_100012C68();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v6 count];
      *(_DWORD *)buf = 134218242;
      id v44 = v17;
      __int16 v45 = 2112;
      objc_super v46 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu handles using contact store %@", buf, 0x16u);
    }

    id v18 = [v6 allObjects];
    id v32 = v7;
    if (qword_1000BC200 != -1) {
      dispatch_once(&qword_1000BC200, &stru_1000A24D0);
    }
    long long v31 = v15;
    id v19 = [v15 contactsForHandles:v18 keyDescriptors:qword_1000BC1F8 alwaysUnifyLabeledValues:0];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v33 = v6;
    id obj = v6;
    id v20 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(obj);
          }
          long long v24 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          long long v25 = [v19 objectForKeyedSubscript:v24];
          long long v26 = [v25 firstObject];
          if ((unint64_t)[v25 count] >= 2)
          {
            long long v27 = sub_100012C68();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [v25 count];
              *(_DWORD *)buf = 134218498;
              id v44 = v28;
              __int16 v45 = 2112;
              objc_super v46 = v24;
              __int16 v47 = 2112;
              v48 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Found %lu contacts for contact handle %@; caching the first contact %@",
                buf,
                0x20u);
            }
          }
          id v29 = [objc_alloc((Class)TUOptionalObject) initWithValue:v26];
          long long v30 = [(PHRecentsController *)self contactCache];
          [v30 setObject:v29 forKeyedSubscript:v24];
        }
        id v21 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v21);
    }

    id v7 = v32;
    id v6 = v33;
  }
}

- (void)populateItemCacheForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self itemCache];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = -[PHRecentsController fetchMutableItemForRecentCall:](self, "fetchMutableItemForRecentCall:", v12, (void)v17);
        uint64_t v14 = [(PHRecentsController *)self localizedSubtitleForRecentCall:v12];
        [v13 setLocalizedSubtitle:v14];

        id v15 = [v13 copy];
        __int16 v16 = [v12 uniqueId];
        [v6 setObject:v15 forKeyedSubscript:v16];
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (id)fetchMutableItemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = objc_alloc_init(PHMutableRecentsItem);
  id v9 = [v6 validRemoteParticipantHandles];
  uint64_t v10 = (uint64_t)[v9 count];
  uint64_t v11 = (uint64_t)[v6 countOfExcludedHandles];
  uint64_t v12 = v11;
  if (!v10 && v11 >= 1)
  {
    if (v11 == 1)
    {
      id v13 = TUBundle();
      id v47 = [v13 localizedStringForKey:@"ONE_OTHER" value:&stru_1000A3488 table:@"TelephonyUtilities"];
    }
    else
    {
      long long v39 = TUBundle();
      [v39 localizedStringForKey:@"%@_OTHERS" value:&stru_1000A3488 table:@"TelephonyUtilities"];
      long long v40 = v169 = v6;
      [(PHRecentsController *)self numberFormatter];
      v42 = long long v41 = v8;
      id v43 = +[NSNumber numberWithInteger:v12];
      [v42 stringFromNumber:v43];
      unint64_t v44 = a4;
      objc_super v46 = v45 = v9;
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v46);
      id v47 = (id)objc_claimAutoreleasedReturnValue();

      id v9 = v45;
      a4 = v44;

      id v8 = v41;
      id v6 = v169;
    }
    id v17 = 0;
    goto LABEL_81;
  }
  v165 = v8;
  v166 = v9;
  if (v10 <= 1)
  {
    uint64_t v14 = [v9 anyObject];
    v179[0] = _NSConcreteStackBlock;
    v179[1] = 3221225472;
    v179[2] = sub_100015940;
    v179[3] = &unk_1000A2490;
    v179[4] = self;
    v179[5] = v12;
    id v15 = objc_retainBlock(v179);
    if (v14)
    {
      [(PHRecentsController *)self contactHandlesForHandle:v14];
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [v16 countByEnumeratingWithState:&v175 objects:v181 count:16];
      if (v17)
      {
        v167 = v14;
        unint64_t v163 = a4;
        uint64_t v18 = *(void *)v176;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v176 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v175 + 1) + 8 * i);
            id v21 = [(PHRecentsController *)self contactCache];
            uint64_t v22 = [v21 objectForKeyedSubscript:v20];
            long long v23 = [v22 value];

            if (v23)
            {
              v48 = [(PHRecentsController *)self contactFormatter];
              v49 = [v48 stringFromContact:v23];
              ((void (*)(void *, void *))v15[2])(v15, v49);
              id v47 = (id)objc_claimAutoreleasedReturnValue();

              v50 = [(PHRecentsController *)self contactFormatter];
              id v17 = [v50 stringFromContact:v23];

              goto LABEL_38;
            }
          }
          id v17 = [v16 countByEnumeratingWithState:&v175 objects:v181 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        id v47 = 0;
LABEL_38:
        a4 = v163;
        uint64_t v14 = v167;
      }
      else
      {
        id v47 = 0;
      }
    }
    else
    {
      id v17 = 0;
      id v47 = 0;
    }
    v79 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v6];
    if (![v47 length] && (objc_msgSend(v79, "isTelephonyProvider") & 1) == 0)
    {
      v80 = [v6 name];
      uint64_t v81 = ((void (*)(void *, void *))v15[2])(v15, v80);

      uint64_t v82 = [v6 name];

      id v17 = (id)v82;
      id v47 = (id)v81;
    }
    if (![v47 length])
    {
      v83 = [v6 callerIdForDisplay];
      uint64_t v84 = ((void (*)(void *, void *))v15[2])(v15, v83);

      uint64_t v85 = [v6 callerIdForDisplay];

      id v17 = (id)v85;
      id v47 = (id)v84;
    }
    if (![v47 length])
    {
      unsigned int v86 = [v6 callerIdIsBlocked];
      v87 = +[NSBundle mainBundle];
      v88 = v87;
      v170 = v14;
      unint64_t v89 = a4;
      v90 = v6;
      if (v86) {
        CFStringRef v91 = @"NO_CALLER_ID";
      }
      else {
        CFStringRef v91 = @"UNKNOWN_CALLER";
      }
      v92 = [v87 localizedStringForKey:v91 value:&stru_1000A3488 table:@"PHRecents"];
      uint64_t v93 = ((void (*)(void *, void *))v15[2])(v15, v92);

      LODWORD(v92) = [v90 callerIdIsBlocked];
      v94 = +[NSBundle mainBundle];
      v95 = v94;
      if (v92) {
        CFStringRef v96 = @"NO_CALLER_ID";
      }
      else {
        CFStringRef v96 = @"UNKNOWN_CALLER";
      }
      uint64_t v97 = [v94 localizedStringForKey:v96 value:&stru_1000A3488 table:@"PHRecents"];

      id v17 = (id)v97;
      id v47 = (id)v93;
      id v6 = v90;
      a4 = v89;
      uint64_t v14 = v170;
    }

    id v8 = v165;
    id v9 = v166;
    goto LABEL_81;
  }
  uint64_t v160 = v11;
  unint64_t v164 = a4;
  v168 = v6;
  long long v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id v25 = v9;
  id v26 = [v25 countByEnumeratingWithState:&v171 objects:v180 count:16];
  if (!v26) {
    goto LABEL_30;
  }
  id v27 = v26;
  uint64_t v28 = *(void *)v172;
  do
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v172 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v30 = *(void *)(*((void *)&v171 + 1) + 8 * (void)j);
      long long v31 = [(PHRecentsController *)self contactForHandle:v30];
      if (v31)
      {
        id v32 = [(PHRecentsController *)self contactFormatter];
        v33 = [v32 stringFromContact:v31];

        if (v33)
        {
          [v24 addObject:v33];
          goto LABEL_28;
        }
        v34 = [v168 isoCountryCode];
        long long v35 = [(PHRecentsController *)self formattedNameForHandle:v30 countryCode:v34];
        [v24 addObject:v35];
      }
      else
      {
        v33 = [v168 isoCountryCode];
        v34 = [(PHRecentsController *)self formattedNameForHandle:v30 countryCode:v33];
        [v24 addObject:v34];
      }

LABEL_28:
    }
    id v27 = [v25 countByEnumeratingWithState:&v171 objects:v180 count:16];
  }
  while (v27);
LABEL_30:

  long long v36 = +[NSMutableString string];
  uint64_t v37 = (uint64_t)[v24 count];
  if (v37 == 3)
  {
    v156 = v36;
    if (v160 == 1)
    {
      v108 = TUBundle();
      [v108 localizedStringForKey:@"%@_%@_%@_AND_ONE_OTHER" value:&stru_1000A3488 table:@"TelephonyUtilities"];
      v110 = v109 = v36;
      v111 = [v24 objectAtIndexedSubscript:0];
      v112 = [v24 objectAtIndexedSubscript:1];
      v113 = [v24 objectAtIndexedSubscript:2];
      v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v110, v111, v112, v113);

      v114 = v109;
    }
    else
    {
      if (!v160)
      {
        v51 = TUBundle();
        v52 = [v51 localizedStringForKey:@"%@_%@_AND_%@" value:&stru_1000A3488 table:@"TelephonyUtilities"];
        v53 = [v24 objectAtIndexedSubscript:0];
        v54 = [v24 objectAtIndexedSubscript:1];
        v55 = [v24 objectAtIndexedSubscript:2];
        v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v52, v53, v54, v55);
        [v156 appendString:v56];

LABEL_73:
        a4 = v164;

        v123 = TUBundle();
        v124 = [v123 localizedStringForKey:@"%@_%@_AND_%@" value:&stru_1000A3488 table:@"TelephonyUtilities"];
        v125 = [v24 objectAtIndexedSubscript:0];
        v126 = [v24 objectAtIndexedSubscript:1];
        v127 = [v24 objectAtIndexedSubscript:2];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v124, v125, v126, v127);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        id v8 = v165;
        id v9 = v166;
        long long v36 = v156;
        goto LABEL_77;
      }
      v154 = TUBundle();
      uint64_t v115 = [v154 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHERS" value:&stru_1000A3488 table:@"TelephonyUtilities"];
      v116 = [v24 objectAtIndexedSubscript:0];
      v117 = [v24 objectAtIndexedSubscript:1];
      v118 = [v24 objectAtIndexedSubscript:2];
      v119 = [(PHRecentsController *)self numberFormatter];
      v120 = +[NSNumber numberWithInteger:v160];
      v121 = [v119 stringFromNumber:v120];
      v122 = (void *)v115;
      v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v115, v116, v117, v118, v121);

      v114 = v156;
    }
    [v114 appendString:v51];
    goto LABEL_73;
  }
  id v9 = v166;
  if (v37 == 2)
  {
    if (v160 == 1)
    {
      v57 = TUBundle();
      v58 = [v57 localizedStringForKey:@"%@_%@_AND_ONE_OTHER" value:&stru_1000A3488 table:@"TelephonyUtilities"];
      v59 = [v24 objectAtIndexedSubscript:0];
      v60 = [v24 objectAtIndexedSubscript:1];
      v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60);
      a4 = v164;
    }
    else
    {
      a4 = v164;
      TUBundle();
      if (v160) {
        v155 = {;
      }
        v58 = [v155 localizedStringForKey:@"%@_%@_AND_%@_OTHERS" value:&stru_1000A3488 table:@"TelephonyUtilities"];
        v59 = [v24 objectAtIndexedSubscript:0];
        v60 = [v24 objectAtIndexedSubscript:1];
        v128 = [(PHRecentsController *)self numberFormatter];
        +[NSNumber numberWithInteger:v160];
        v129 = v159 = v36;
        v130 = [v128 stringFromNumber:v129];
        v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60, v130);

        v57 = v155;
        long long v36 = v159;
      }
      else {
        v57 = {;
      }
        v58 = [v57 localizedStringForKey:@"%@_AND_%@" value:&stru_1000A3488 table:@"TelephonyUtilities"];
        v59 = [v24 objectAtIndexedSubscript:0];
        v60 = [v24 objectAtIndexedSubscript:1];
        v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60);
      }
    }

    [v36 appendString:v61];
    TUBundle();
    v132 = v131 = v36;
    v133 = [v132 localizedStringForKey:@"%@_AND_%@" value:&stru_1000A3488 table:@"TelephonyUtilities"];
    v134 = [v24 objectAtIndexedSubscript:0];
    v135 = [v24 objectAtIndexedSubscript:1];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v133, v134, v135);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    long long v36 = v131;
    id v8 = v165;
    id v9 = v166;
  }
  else if (v37 == 1)
  {
    a4 = v164;
    if (v160 == 1)
    {
      long long v38 = TUBundle();
      [v38 localizedStringForKey:@"%@_AND_ONE_OTHER" value:&stru_1000A3488 table:@"TelephonyUtilities"];
      v99 = v98 = v36;
      v100 = [v24 objectAtIndexedSubscript:0];
      v101 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v99, v100);
      [v98 appendString:v101];

      long long v36 = v98;
    }
    else
    {
      if (v160)
      {
        v102 = TUBundle();
        v103 = [v102 localizedStringForKey:@"%@_AND_%@_OTHERS" value:&stru_1000A3488 table:@"TelephonyUtilities"];
        [v24 objectAtIndexedSubscript:0];
        v104 = v158 = v36;
        v105 = [(PHRecentsController *)self numberFormatter];
        v106 = +[NSNumber numberWithInteger:v160];
        v107 = [v105 stringFromNumber:v106];
        long long v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v103, v104, v107);

        id v9 = v166;
        long long v36 = v158;
      }
      else
      {
        long long v38 = [v24 objectAtIndexedSubscript:0];
      }
      [v36 appendString:v38];
    }

    id v17 = [v24 objectAtIndexedSubscript:0];
    id v8 = v165;
  }
  else
  {
    if (v37 < 4)
    {
      id v17 = 0;
    }
    else
    {
      v62 = (char *)[v24 count] + v160 - 3;
      v161 = TUBundle();
      uint64_t v63 = [v161 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHER" value:&stru_1000A3488 table:@"TelephonyUtilities"];
      v64 = [v24 objectAtIndexedSubscript:0];
      v65 = [v24 objectAtIndexedSubscript:1];
      v66 = [v24 objectAtIndexedSubscript:2];
      [(PHRecentsController *)self numberFormatter];
      v67 = v157 = v36;
      v68 = +[NSNumber numberWithUnsignedInteger:v62];
      v69 = [v67 stringFromNumber:v68];
      v70 = (void *)v63;
      v71 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v64, v65, v66, v69);
      [v157 appendString:v71];

      v162 = TUBundle();
      v72 = [v162 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHER" value:&stru_1000A3488 table:@"TelephonyUtilities"];
      v73 = [v24 objectAtIndexedSubscript:0];
      v74 = [v24 objectAtIndexedSubscript:1];
      v75 = [v24 objectAtIndexedSubscript:2];
      v76 = [(PHRecentsController *)self numberFormatter];
      v77 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v24 count] - 3);
      v78 = [v76 stringFromNumber:v77];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v72, v73, v74, v75, v78);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      long long v36 = v157;
      id v9 = v166;
    }
    a4 = v164;
    id v8 = v165;
  }
LABEL_77:
  if ([v36 length]) {
    id v47 = [v36 copy];
  }
  else {
    id v47 = 0;
  }

  id v6 = v168;
LABEL_81:
  v136 = [v6 date];
  [(PHRecentsItem *)v8 setDate:v136];

  v137 = [(PHRecentsItem *)v8 image];

  if (!v137)
  {
    v138 = [(PHRecentsController *)self fetchImageForRecentCall:v6];
    [(PHRecentsItem *)v8 setImage:v138];
  }
  if (a4 <= 1)
  {
    [(PHRecentsItem *)v8 setLocalizedCount:0];
  }
  else
  {
    v139 = [(PHRecentsController *)self numberFormatter];
    v140 = +[NSNumber numberWithUnsignedInteger:a4];
    [v139 stringFromNumber:v140];
    v142 = id v141 = v6;
    v143 = +[NSString stringWithFormat:@"(%@)", v142];
    [(PHRecentsItem *)v8 setLocalizedCount:v143];

    id v6 = v141;
  }
  [(PHRecentsItem *)v8 setLocalizedTitle:v47];
  [(PHRecentsItem *)v8 setLocalizedValidHandlesTitle:v17];
  -[PHRecentsItem setVerified:](v8, "setVerified:", [v6 verificationStatus] == (id)1);
  if (+[PHDevice isGeminiCapable])
  {
    v144 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v6];
    if (objc_msgSend(v6, "ph_supportsLocalParticipantBadge"))
    {
      v145 = [v144 prioritizedSenderIdentities];
      id v146 = [v145 count];

      if ((unint64_t)v146 >= 2)
      {
        v147 = [(PHRecentsController *)self callProviderManager];
        v148 = [v147 telephonyProvider];
        v149 = [v6 localParticipantUUID];
        [v148 senderIdentityForAccountUUID:v149];
        v151 = id v150 = v6;

        v152 = [v151 localizedShortName];
        [(PHRecentsItem *)v8 setLocalizedSenderIdentityTitle:v152];

        id v6 = v150;
      }
    }
  }

  return v8;
}

- (id)fetchCallProviderForRecentCall:(id)a3
{
  id v5 = a3;
  id v6 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v5 serviceProvider];
  id v8 = [(PHRecentsController *)self callProviderManager];
  if (v7)
  {
    id v9 = [(PHRecentsController *)self callProviderCache];
    uint64_t v10 = [v9 objectForKey:v7];

    if (v10) {
      goto LABEL_11;
    }
    uint64_t v11 = [v8 providerForRecentCall:v5];
    if (v11)
    {
      uint64_t v10 = (void *)v11;
      uint64_t v12 = [(PHRecentsController *)self callProviderCache];
      [v12 setObject:v10 forKey:v7];

      goto LABEL_11;
    }
    id v15 = sub_100012C68();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not retrieve a call provider for the specified recent call: %@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = +[NSString stringWithFormat:@"Service provider is nil for the specified recent call: %@", v5];
    NSLog(@"** TUAssertion failure: %@", v13);

    if (_TUAssertShouldCrashApplication())
    {
      uint64_t v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PHRecentsController.m", 991, @"Service provider is nil for the specified recent call: %@", v5 object file lineNumber description];
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (TUCallProviderManager)callProviderManager
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = self->_callProviderManager;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (NSCache)callProviderCache
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  callProviderCache = self->_callProviderCache;

  return callProviderCache;
}

- (id)fetchMutableItemForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = -[PHRecentsController fetchMutableItemForRecentCall:numberOfOccurences:](self, "fetchMutableItemForRecentCall:numberOfOccurences:", v4, [v4 numberOfOccurrences]);

  return v6;
}

- (id)fetchImageForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 ttyType];
  if (v6 == (id)2)
  {
    uint64_t v7 = +[UIImage recentsTTYRelayGlyphImage];
LABEL_5:
    id v8 = (void *)v7;
    if (v7) {
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  if (v6 == (id)1)
  {
    uint64_t v7 = +[UIImage recentsTTYDirectGlyphImage];
    goto LABEL_5;
  }
LABEL_6:
  unsigned int v9 = [v4 callStatus];
  if (v9 != kCHCallStatusConnectedOutgoing)
  {
    unsigned int v10 = [v4 callStatus];
    if (v10 != kCHCallStatusCancelled) {
      goto LABEL_11;
    }
  }
  id v11 = [v4 mediaType];
  if (v11 == (id)2)
  {
    uint64_t v12 = +[UIImage recentsOutgoingVideoCallGlyphImage];
    goto LABEL_13;
  }
  if (v11 != (id)1)
  {
LABEL_11:
    id v8 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = +[UIImage recentsOutgoingAudioCallGlyphImage];
LABEL_13:
  id v8 = (void *)v12;
LABEL_14:

  return v8;
}

- (id)itemForRecentCall:(id)a3 presentationStyle:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = -[PHRecentsController itemForRecentCall:numberOfOccurences:](self, "itemForRecentCall:numberOfOccurences:", v6, [v6 numberOfOccurrences]);
  id v8 = [v6 serviceProvider];
  if ([v8 isEqualToString:kCHServiceProviderTelephony])
  {
    unsigned int v9 = [v6 remoteParticipantHandles];
    id v10 = [v9 count];
    BOOL v11 = v10 != (id)1;

    if (!a4)
    {
      if (v10 == (id)1) {
        goto LABEL_11;
      }
LABEL_10:
      self = v7;
      goto LABEL_19;
    }
  }
  else
  {

    if (!a4) {
      goto LABEL_10;
    }
    BOOL v11 = 1;
  }
  uint64_t v12 = [v6 imageURL];
  if (v12)
  {

    goto LABEL_10;
  }
  if (v11) {
    goto LABEL_10;
  }
LABEL_11:
  id v13 = [v6 remoteParticipantHandles];
  uint64_t v14 = [v13 anyObject];

  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = [v6 name];
  if (!v15) {
    goto LABEL_17;
  }
  id v16 = (void *)v15;
  id v17 = [v6 name];
  id v18 = [v17 length];

  if (!v18) {
    goto LABEL_17;
  }
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10003304C;
  uint64_t v30 = sub_10003305C;
  id v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000330A0;
  v23[3] = &unk_1000A2378;
  id v25 = &v26;
  v23[4] = self;
  id v24 = v14;
  [(PHRecentsController *)self performSynchronousBlock:v23];
  uint64_t v19 = v27[5];
  if (!v19)
  {
    id v20 = [v7 mutableCopy];
    id v21 = [v6 name];
    [v20 setLocalizedSubtitle:v21];

    self = (PHRecentsController *)[v20 copy];
  }

  _Block_object_dispose(&v26, 8);
  if (v19) {
LABEL_17:
  }
    self = v7;

LABEL_19:

  return self;
}

- (id)itemForRecentCall:(id)a3
{
  return [(PHRecentsController *)self itemForRecentCall:a3 presentationStyle:1];
}

- (id)contactByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_10003304C;
  id v24 = sub_10003305C;
  id v25 = 0;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_100013AB8;
  uint64_t v15 = &unk_1000A23C8;
  id v16 = self;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v18 = v9;
  uint64_t v19 = &v20;
  [(PHRecentsController *)self performSynchronousBlock:&v12];
  id v10 = [v21[5] copy:v12, v13, v14, v15, v16];

  _Block_object_dispose(&v20, 8);

  return v10;
}

- (id)localizedSubtitleForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 wasEmergencyCall])
  {
    id v6 = [(PHRecentsController *)self subtitleForRecentEmergencyCall:v4];
    goto LABEL_95;
  }
  id v7 = [v4 blockedByExtension];

  if (v7)
  {
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"%@_BLOCKED_BY" value:&stru_1000A3488 table:@"PHRecents"];
    id v10 = [v4 localizedBlockedByExtensionName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_95;
  }
  BOOL v11 = [v4 uniqueId];
  uint64_t v12 = [(PHRecentsController *)self featureFlags];
  unsigned int v13 = [v12 increaseCallHistoryEnabled];

  if (!v13)
  {
    uint64_t v15 = 0;
LABEL_9:
    id v16 = [(PHRecentsController *)self featureFlags];
    unsigned int v17 = [v16 callHistorySearchEnabled];

    if (v17)
    {
      id v18 = [v4 remoteParticipantHandles];
      uint64_t v19 = [v18 anyObject];

      if (v19)
      {
        [(PHRecentsController *)self contactHandlesForHandle:v19];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = [v20 countByEnumeratingWithState:&v89 objects:v94 count:16];
        if (v21)
        {
          v79 = v19;
          uint64_t v81 = v15;
          v83 = v11;
          uint64_t v22 = *(void *)v90;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v90 != v22) {
                objc_enumerationMutation(v20);
              }
              id v24 = *(void **)(*((void *)&v89 + 1) + 8 * i);
              id v25 = [(PHRecentsController *)self contactCache];
              uint64_t v26 = [v25 objectForKeyedSubscript:v24];
              id v27 = [v26 value];

              if (v27)
              {
                id v21 = v24;
                goto LABEL_25;
              }
            }
            id v21 = [v20 countByEnumeratingWithState:&v89 objects:v94 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          id v27 = 0;
LABEL_25:
          uint64_t v15 = v81;
          BOOL v11 = v83;
          uint64_t v19 = v79;
        }
        else
        {
          id v27 = 0;
        }
      }
      else
      {
        id v21 = 0;
        id v27 = 0;
      }
      __int16 v45 = [(PHRecentsController *)self subtitleProvider];
      objc_super v46 = [v45 localizedSubtitleForRecentCall:v4 handle:v21 contact:v27];

      if (![v46 length])
      {
        uint64_t v47 = [(PHRecentsController *)self unknownLabel];

        objc_super v46 = (void *)v47;
      }
      if (v11)
      {
        v48 = [(PHRecentsController *)self localizedSubtitleCache];
        [v48 setObject:v46 forKey:v11];
      }
      id v6 = v46;

      goto LABEL_94;
    }
    uint64_t v28 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v4];
    id v29 = v28;
    if (!v28) {
      goto LABEL_88;
    }
    if ([v28 isFaceTimeProvider])
    {
      id v30 = [v4 mediaType];
      id v31 = +[NSBundle mainBundle];
      id v32 = v31;
      if (v30 == (id)2) {
        CFStringRef v33 = @"RECENTS_FACETIME_VIDEO";
      }
      else {
        CFStringRef v33 = @"RECENTS_FACETIME_AUDIO";
      }
      uint64_t v49 = [v31 localizedStringForKey:v33 value:&stru_1000A3488 table:@"PHRecents"];

      goto LABEL_57;
    }
    if (![v29 isTelephonyProvider])
    {
      id v50 = [v4 mediaType];
      if (v50 == (id)1)
      {
        CFStringRef v51 = @"RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_AUDIO";
      }
      else
      {
        if (v50 != (id)2)
        {
LABEL_88:
          if (![v15 length])
          {
            uint64_t v73 = [(PHRecentsController *)self unknownLabel];

            uint64_t v15 = (void *)v73;
          }
          v74 = [(PHRecentsController *)self featureFlags];
          unsigned int v75 = [v74 increaseCallHistoryEnabled];

          if (v75 && v11)
          {
            v76 = [(PHRecentsController *)self localizedSubtitleCache];
            [v76 setObject:v15 forKey:v11];
          }
          id v6 = v15;

          goto LABEL_94;
        }
        CFStringRef v51 = @"RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_VIDEO";
      }
      v56 = +[NSBundle mainBundle];
      v57 = [v56 localizedStringForKey:v51 value:&stru_1000A3488 table:@"PHRecents"];
      v58 = [v29 localizedName];
      uint64_t v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v57, v58);

LABEL_57:
      uint64_t v15 = (void *)v49;
      goto LABEL_88;
    }
    v34 = [v4 remoteParticipantHandles];
    long long v35 = [v34 anyObject];

    if (v35)
    {
      v80 = v35;
      [(PHRecentsController *)self contactHandlesForHandle:v35];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      id v37 = [v36 countByEnumeratingWithState:&v85 objects:v93 count:16];
      if (v37)
      {
        id v38 = v37;
        v78 = v29;
        uint64_t v82 = v15;
        uint64_t v84 = v11;
        uint64_t v39 = *(void *)v86;
LABEL_31:
        uint64_t v40 = 0;
        while (1)
        {
          if (*(void *)v86 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v85 + 1) + 8 * v40);
          long long v42 = [(PHRecentsController *)self contactCache];
          id v43 = [v42 objectForKeyedSubscript:v41];
          unint64_t v44 = [v43 value];

          if (v44) {
            break;
          }
          if (v38 == (id)++v40)
          {
            id v38 = [v36 countByEnumeratingWithState:&v85 objects:v93 count:16];
            if (v38) {
              goto LABEL_31;
            }
            uint64_t v15 = v82;
            BOOL v11 = v84;
            id v29 = v78;
            goto LABEL_38;
          }
        }
        long long v35 = v80;
        id v52 = [v80 type];
        if (v52 == (id)3)
        {
          v53 = [v44 labeledValueForEmailAddress:v41];
          v54 = [v53 label];
          uint64_t v55 = +[CNLabeledValue localizedDisplayStringForLabel:v54 propertyName:CNContactEmailAddressesKey];
          uint64_t v15 = v82;
          id v29 = v78;
        }
        else
        {
          uint64_t v15 = v82;
          id v29 = v78;
          if (v52 == (id)2)
          {
            v59 = [v4 isoCountryCode];
            v54 = +[CNPhoneNumber phoneNumberWithDigits:v41 countryCode:v59];

            if (v54)
            {
              v53 = [v44 labeledValueForPhoneNumber:v54];
            }
            else
            {
              v53 = 0;
            }
            uint64_t v60 = [v53 label];
            uint64_t v55 = +[CNLabeledValue localizedDisplayStringForLabel:v60 propertyName:CNContactPhoneNumbersKey];

            uint64_t v15 = (void *)v60;
          }
          else
          {
            if (v52 != (id)1)
            {
LABEL_64:

              BOOL v11 = v84;
              goto LABEL_65;
            }
            v53 = [v44 labeledValueForSocialProfileWithUsername:v41];
            v54 = [v53 label];
            uint64_t v55 = +[CNLabeledValue localizedDisplayStringForLabel:v54 propertyName:CNContactSocialProfilesKey];
          }
        }

        uint64_t v15 = (void *)v55;
        long long v35 = v80;
        goto LABEL_64;
      }
LABEL_38:
      long long v35 = v80;
LABEL_65:
    }
    if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]
      && [v4 isJunk])
    {
      v61 = [v4 junkIdentificationCategory];
      if (v61)
      {
        v62 = [v4 junkIdentificationCategory];
      }
      else
      {
        v62 = @"MAYBE_JUNK";
      }

      uint64_t v63 = +[NSBundle mainBundle];
      uint64_t v64 = [v63 localizedStringForKey:v62 value:&stru_1000A3488 table:@"PHRecents"];

      uint64_t v15 = (void *)v64;
    }
    if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15])
    {
      v65 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:v4];
      v66 = [v65 firstObject];

      if (v66)
      {
        v67 = [(PHRecentsController *)self metadataCache];
        v68 = [v67 metadataForDestinationID:v66];

        if (v68)
        {
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]
            && ([v4 callerIdIsBlocked] & 1) == 0)
          {
            uint64_t v69 = [v68 metadataForProvider:objc_opt_class()];

            uint64_t v15 = (void *)v69;
          }
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]
            && ([v4 callerIdIsBlocked] & 1) == 0)
          {
            uint64_t v70 = [v68 metadataForProvider:objc_opt_class()];

            uint64_t v15 = (void *)v70;
          }
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15])
          {
            uint64_t v71 = [v68 metadataForProvider:objc_opt_class()];

            uint64_t v15 = (void *)v71;
          }
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15])
          {
            uint64_t v72 = [v68 metadataForProvider:objc_opt_class()];

            uint64_t v15 = (void *)v72;
          }
        }
      }
      else
      {
        v68 = 0;
      }
    }
    goto LABEL_88;
  }
  uint64_t v14 = [(PHRecentsController *)self localizedSubtitleCache];
  uint64_t v15 = [v14 objectForKey:v11];

  if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]) {
    goto LABEL_9;
  }
  id v6 = v15;
LABEL_94:

LABEL_95:

  return v6;
}

- (NSMutableDictionary)itemCache
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  itemCache = self->_itemCache;

  return itemCache;
}

- (id)contactsByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v54 = a4;
  id v7 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  id v53 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v48 = objc_alloc_init((Class)NSMutableDictionary);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  unint64_t v44 = v6;
  id obj = [v6 validRemoteParticipantHandles];
  uint64_t v47 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v47)
  {
    uint64_t v55 = 0;
    uint64_t v46 = *(void *)v69;
    id v8 = v53;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v69 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v9;
        uint64_t v51 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v9);
        id v10 = -[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:");
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v65;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v65 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              id v16 = [(PHRecentsController *)self contactCache];
              unsigned int v17 = [v16 objectForKeyedSubscript:v15];

              if (!v17) {
                goto LABEL_21;
              }
              uint64_t v18 = [v17 value];
              if (!v18
                || (uint64_t v19 = (void *)v18,
                    [v17 value],
                    id v20 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v21 = [v20 areKeysAvailable:v54],
                    v20,
                    id v8 = v53,
                    v19,
                    v21))
              {
                uint64_t v22 = [v17 value];
                if (v22)
                {
                  id v23 = v55;
                  if (!v55) {
                    id v23 = objc_alloc_init((Class)NSMutableDictionary);
                  }
                  uint64_t v55 = v23;
                  id v24 = [v23 objectForKeyedSubscript:v51];
                  if (!v24)
                  {
                    id v24 = +[NSMutableArray array];
                    [v55 setObject:v24 forKeyedSubscript:v51];
                  }
                  [v24 addObject:v22];
                }
              }
              else
              {
LABEL_21:
                [v8 addObject:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v12);
        }
        [v48 setObject:v10 forKeyedSubscript:v51];

        id v9 = v49 + 1;
      }
      while (v49 + 1 != v47);
      uint64_t v47 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v47);
  }
  else
  {
    uint64_t v55 = 0;
    id v8 = v53;
  }

  if ([v8 count])
  {
    id v25 = [(PHRecentsController *)self contactStore];
    uint64_t v26 = [v8 array];
    id v27 = [v25 contactsForHandles:v26 keyDescriptors:v54];

    if (v27)
    {
      id v28 = v55;
      if (!v55) {
        id v28 = objc_alloc_init((Class)NSMutableDictionary);
      }
      uint64_t v55 = v28;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v50 = [v48 allKeys];
      id v29 = [v50 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v52 = *(void *)v61;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v61 != v52) {
              objc_enumerationMutation(v50);
            }
            uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
            id v33 = objc_alloc_init((Class)NSMutableOrderedSet);
            v34 = [v48 objectForKeyedSubscript:v32];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v35 = [v34 countByEnumeratingWithState:&v56 objects:v72 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v57;
              do
              {
                for (k = 0; k != v36; k = (char *)k + 1)
                {
                  if (*(void *)v57 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v39 = [v27 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * (void)k)];
                  if ([v39 count]) {
                    [v33 addObjectsFromArray:v39];
                  }
                }
                id v36 = [v34 countByEnumeratingWithState:&v56 objects:v72 count:16];
              }
              while (v36);
            }
            uint64_t v40 = [v55 objectForKeyedSubscript:v32];
            if (!v40)
            {
              uint64_t v40 = +[NSMutableArray array];
              [v55 setObject:v40 forKeyedSubscript:v32];
            }
            uint64_t v41 = [v33 array];
            [v40 addObjectsFromArray:v41];
          }
          id v30 = [v50 countByEnumeratingWithState:&v60 objects:v73 count:16];
        }
        while (v30);
      }
    }
    id v8 = v53;
  }
  id v42 = [v55 copy];

  return v42;
}

- (id)contactHandlesForHandle:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  id v5 = [v3 value];
  if ([v5 length])
  {
    [v4 addObject:v5];
    id v6 = [v3 normalizedValue];
    if ([v6 length])
    {
      id v7 = [v3 value];
      unsigned __int8 v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) == 0) {
        [v4 addObject:v6];
      }
    }
  }
  id v9 = [v4 copy];

  return v9;
}

- (id)itemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10003304C;
  uint64_t v15 = sub_10003305C;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019890;
  v7[3] = &unk_1000A2378;
  id v10 = &v11;
  unsigned __int8 v8 = self;
  id v4 = a3;
  id v9 = v4;
  [(PHRecentsController *)v8 performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(off_1000BA070) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(PHRecentsController *)self serialQueue];
    dispatch_sync(v7, v5);
  }
}

- (NSMutableDictionary)contactCache
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  contactCache = self->_contactCache;

  return contactCache;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSMutableDictionary)localizedSubtitleCache
{
  return self->_localizedSubtitleCache;
}

- (TUSubtitleProvider)subtitleProvider
{
  return self->_subtitleProvider;
}

- (BOOL)isLocalizedSubtitleUnknown:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self featureFlags];
  unsigned int v6 = [v5 increaseCallHistoryEnabled];

  id v7 = [v4 length];
  if (v7) {
    unsigned __int8 v8 = v6;
  }
  else {
    unsigned __int8 v8 = 1;
  }
  if (v6 && v7)
  {
    id v9 = [(PHRecentsController *)self unknownLabel];
    unsigned __int8 v8 = [v4 isEqualToString:v9];
  }
  return v8;
}

- (void)setUnreadCallCount:(unint64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_unreadCallCount != a3)
  {
    self->_unreadCallCount = a3;
    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeUnreadCallCount:a3];
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setStartedLoadingOlderCalls:(BOOL)a3
{
  self->_startedLoadingOlderCalls = a3;
}

- (void)setPresentScreenTimeShield:(id)a3
{
}

- (void)setInitializationBlockQueued:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_initializationBlockQueued != v3) {
    self->_initializationBlockQueued = v3;
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (MPAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

+ (id)indexPathsToInsertIntoCachedRecentCalls:(id)a3 fromBackingRecentCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  unsigned __int8 v8 = 0;
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [v6 objectAtIndexedSubscript:v9];
      if (v8 >= [v5 count])
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = [v5 objectAtIndexedSubscript:v8];
      }
      if ([v11 isEqual:v10])
      {
        ++v8;
      }
      else
      {
        id v12 = +[NSIndexPath indexPathForRow:v9 inSection:0];
        [v7 addObject:v12];
      }
      ++v9;
    }
    while (v9 < (unint64_t)[v6 count]);
  }
  if (v8 == [v5 count]) {
    uint64_t v13 = v7;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (PHRecentsController)init
{
  return 0;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  notify_cancel([(PHRecentsController *)self callDirectoryManagerIdentificationEntriesChangedNotificationToken]);
  v4.receiver = self;
  v4.super_class = (Class)PHRecentsController;
  [(PHRecentsController *)&v4 dealloc];
}

- (CNContactStore)suggestedContactStore
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_suggestedContactStore;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (unint64_t)unreadCallCount
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  unint64_t unreadCallCount = self->_unreadCallCount;
  os_unfair_lock_unlock(p_accessorLock);
  return unreadCallCount;
}

- (id)coalesceRecentCall:(id)a3 withRecentCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10003304C;
  unsigned int v21 = sub_10003305C;
  id v22 = 0;
  unsigned __int8 v8 = [(PHRecentsController *)self serialQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003325C;
  v13[3] = &unk_1000A23A0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)deleteAllRecentCalls
{
  BOOL v3 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000333B4;
  block[3] = &unk_1000A1D50;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)deleteRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000334AC;
  v7[3] = &unk_1000A1E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)markRecentAudioCallsAsRead
{
  BOOL v3 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033588;
  block[3] = &unk_1000A1D50;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)contactForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10003304C;
  id v25 = sub_10003305C;
  id v26 = 0;
  id v8 = [v6 validRemoteParticipantHandles];
  id v9 = [v8 count];

  if (v9 == (id)1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000337A0;
    v17[3] = &unk_1000A23C8;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    id v20 = &v21;
    [(PHRecentsController *)self performSynchronousBlock:v17];
  }
  id v10 = (void *)v22[5];
  if (!v10)
  {
    id v11 = [(PHRecentsController *)self metadataCache];
    id v12 = +[CNMutableContact contactForRecentCall:v6 metadataCache:v11];
    id v13 = [v12 copy];
    id v14 = (void *)v22[5];
    v22[5] = (uint64_t)v13;

    id v10 = (void *)v22[5];
  }
  id v15 = v10;
  _Block_object_dispose(&v21, 8);

  return v15;
}

- (id)dialRequestForRecentCall:(id)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10003304C;
  id v15 = sub_10003305C;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033960;
  v7[3] = &unk_1000A23F0;
  id v4 = a3;
  id v9 = self;
  id v10 = &v11;
  id v8 = v4;
  [(PHRecentsController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)performDialRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHRecentsController *)self presentScreenTimeShield];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  id v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 callFilterController];
  unsigned int v9 = [v8 shouldRestrictDialRequest:v4 performSynchronously:1];

  if (v9)
  {
    id v10 = [(PHRecentsController *)self presentScreenTimeShield];
    ((void (**)(void, id))v10)[2](v10, v4);
  }
  else
  {
LABEL_4:
    uint64_t v11 = +[TUCallCenter sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100033C3C;
    v12[3] = &unk_1000A2418;
    id v13 = v4;
    [v11 launchAppForDialRequest:v13 completion:v12];
  }
}

- (void)performDialRequestForRecentCall:(id)a3
{
  id v4 = [(PHRecentsController *)self dialRequestForRecentCall:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(PHRecentsController *)self performDialRequest:v4];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (void)performJoinRequestForRecentCall:(id)a3
{
}

- (void)performJoinRequestForRecentCall:(id)a3 overrideProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100012C68();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHRecentsController -performJoinRequestForRecentCall", buf, 2u);
  }

  unsigned int v9 = [(PHRecentsController *)self featureFlags];
  unsigned int v10 = [v9 callHistorySearchEnabled];

  if (v10)
  {
    uint64_t v11 = [(PHRecentsController *)self callProviderManager];
    id v12 = [v11 joinConversationRequestForRecentCall:v6];

    if (v12)
    {
      [v12 setOriginatingUIType:8];
      if (v7) {
        [v12 setProvider:v7];
      }
      id v13 = +[TUCallCenter sharedInstance];
      [v13 launchAppForJoinRequest:v12];
      goto LABEL_32;
    }
    id v13 = sub_100012C68();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412290;
    id v44 = v6;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not create join request for recent call: %@", buf, 0xCu);
    goto LABEL_32;
  }
  id v36 = self;
  id v14 = [v6 validRemoteParticipantHandles];
  id v12 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v14 count]);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v37 = v6;
  id v15 = [v6 validRemoteParticipantHandles];
  id v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v38 + 1) + 8 * i) tuHandle];
        if (v20)
        {
          id v21 = objc_alloc((Class)TUConversationMember);
          id v22 = +[NSSet setWithObject:v20];
          id v23 = [v21 initWithHandles:v22];

          [v12 addObject:v23];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v17);
  }

  if (![v12 count])
  {
    id v13 = sub_100012C68();
    id v6 = v37;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412290;
    id v44 = v37;
    goto LABEL_31;
  }
  id v13 = [objc_alloc((Class)TUJoinConversationRequest) initWithRemoteMembers:v12];
  id v6 = v37;
  -[NSObject setVideo:](v13, "setVideo:", [v37 mediaType] == (id)2);
  -[NSObject setVideoEnabled:](v13, "setVideoEnabled:", [v37 mediaType] == (id)2);
  [v13 setOriginatingUIType:8];
  if (v7) {
    -[NSObject setProvider:](v13, "setProvider:");
  }
  id v24 = [(PHRecentsController *)v36 callProviderManager];
  id v25 = [v24 faceTimeProvider];
  id v26 = [v37 outgoingLocalParticipantUUID];
  id v27 = [v25 senderIdentityForAccountUUID:v26];

  if (v27)
  {
    id v28 = [v27 handle];
    [v13 setCallerID:v28];
  }
  id v29 = +[TUCallProviderManager invitationPreferencesForRecentCall];
  [v13 setInvitationPreferences:v29];

  uint64_t v30 = [(PHRecentsController *)v36 presentScreenTimeShield];
  if (!v30) {
    goto LABEL_25;
  }
  id v31 = (void *)v30;
  uint64_t v32 = +[TUCallCenter sharedInstance];
  id v33 = [v32 callFilterController];
  unsigned int v34 = [v33 shouldRestrictJoinConversationRequest:v13 performSynchronously:1];

  id v6 = v37;
  if (v34)
  {
    id v35 = [(PHRecentsController *)v36 presentScreenTimeShield];
    ((void (**)(void, NSObject *))v35)[2](v35, v13);
  }
  else
  {
LABEL_25:
    id v35 = +[TUCallCenter sharedInstance];
    [v35 launchAppForJoinRequest:v13];
  }

LABEL_32:
}

- (void)removeDelegate:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  id v6 = [(PHRecentsController *)self delegateToQueue];
  [v6 removeObjectForKey:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)notifyDelegatesRecentsController:(id)a3 didUpdateCalls:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  id v7 = [(PHRecentsController *)self featureFlags];
  unsigned int v8 = [v7 phoneRecentsAvatarsEnabled];

  if (v8)
  {
    os_unfair_lock_assert_owner(&self->_accessorLock);
    id v17 = self;
    unsigned int v9 = [(PHRecentsController *)self delegateToQueue];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [v9 objectForKey:v14];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000344F4;
          block[3] = &unk_1000A2440;
          void block[4] = v14;
          id v22 = v6;
          id v23 = v18;
          dispatch_async(v15, block);

          id v16 = &v22;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
          id v15 = [v9 objectForKey:v14];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100034504;
          v19[3] = &unk_1000A2440;
          v19[4] = v14;
          v20[0] = v6;
          v20[1] = v17;
          dispatch_async(v15, v19);
          id v16 = (id *)v20;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  id v7 = [(PHRecentsController *)self delegateToQueue];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          id v13 = [v7 objectForKey:v12];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000346E0;
          block[3] = &unk_1000A2468;
          void block[4] = v12;
          id v15 = v6;
          unint64_t v16 = a4;
          dispatch_async(v13, block);
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)notifyDelegatesRecentsControllerDidChangeMessages:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  id v5 = [(PHRecentsController *)self delegateToQueue];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v5 objectForKey:v10];
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1000348A4;
          v12[3] = &unk_1000A1E18;
          void v12[4] = v10;
          id v13 = v4;
          dispatch_async(v11, v12);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (CNContactFormatter)contactFormatter
{
  BOOL v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  contactFormatter = self->_contactFormatter;

  return contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  uint64_t v8 = (CNContactFormatter *)a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  contactFormatter = self->_contactFormatter;
  p_contactFormatter = &self->_contactFormatter;
  if (contactFormatter != v8) {
    objc_storeStrong((id *)p_contactFormatter, a3);
  }
}

- (NSNumberFormatter)numberFormatter
{
  BOOL v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  numberFormatter = self->_numberFormatter;

  return numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  uint64_t v8 = (NSNumberFormatter *)a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  numberFormatter = self->_numberFormatter;
  p_numberFormatter = &self->_numberFormatter;
  if (numberFormatter != v8) {
    objc_storeStrong((id *)p_numberFormatter, a3);
  }
}

- (void)setPreFetchingPredicate:(id)a3
{
  id v7 = (NSPredicate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_preFetchingPredicate != v7)
  {
    objc_storeStrong((id *)&self->_preFetchingPredicate, a3);
    id v6 = [(PHRecentsController *)self callHistoryController];
    [v6 setPreFetchingPredicate:v7];
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (id)contactForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  [(PHRecentsController *)self contactHandlesForHandle:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(PHRecentsController *)self contactCache];
        id v13 = [v12 objectForKeyedSubscript:v11];
        long long v14 = [v13 value];

        if (v14)
        {
          long long v15 = v6;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v15 = sub_100012C68();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle not found in cache: %@", buf, 0xCu);
  }
  long long v14 = 0;
LABEL_13:

  return v14;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 type];
  id v8 = sub_100012C68();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)2)
  {
    if (v9)
    {
      uint64_t v10 = [v5 value];
      int v16 = 138412546;
      long long v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v11 = [v5 value];
    uint64_t v12 = TUFormattedPhoneNumber();

    if (!v12)
    {
LABEL_9:
      long long v14 = +[NSBundle mainBundle];
      uint64_t v12 = [v14 localizedStringForKey:@"UNKNOWN_CALLER" value:&stru_1000A3488 table:@"PHRecents"];
    }
  }
  else
  {
    if (v9)
    {
      id v13 = [v5 value];
      int v16 = 138412290;
      long long v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v12 = [v5 value];
    if (!v12) {
      goto LABEL_9;
    }
  }

  return v12;
}

- (id)fetchContactForContactCardDisplay:(id)a3
{
  id v4 = a3;
  if ([v4 canExceedUnifyingThreshold])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    long long v15 = sub_10003304C;
    int v16 = sub_10003305C;
    id v17 = 0;
    id v5 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034FE8;
    block[3] = &unk_1000A2378;
    id v10 = v4;
    uint64_t v11 = &v12;
    void block[4] = self;
    id v6 = v4;
    dispatch_sync(v5, block);

    id v7 = (void *)v13[5];
    if (!v7) {
      id v7 = v6;
    }
    id v4 = v7;

    _Block_object_dispose(&v12, 8);
  }

  return v4;
}

- (id)fetchUnifiedContactForID:(id)a3 withDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [(PHRecentsController *)self contactStore];
  id v10 = sub_100012C68();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching unified contact for handle %@ using contact store %@", buf, 0x16u);
  }

  id v11 = v7;
  if (!v7)
  {
    if (qword_1000BC200 != -1) {
      dispatch_once(&qword_1000BC200, &stru_1000A24D0);
    }
    id v11 = (id)qword_1000BC1F8;
  }
  id v23 = 0;
  uint64_t v12 = [v9 unifiedContactWithIdentifier:v6 keysToFetch:v11 error:&v23];
  id v13 = v23;
  if (!v7) {

  }
  id v14 = objc_alloc((Class)TUOptionalObject);
  if (v13)
  {
    id v15 = [v14 initWithValue:0];
    int v16 = [(PHRecentsController *)self contactCache];
    [v16 setObject:v15 forKeyedSubscript:v6];

    id v17 = sub_100012C68();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10006AB54((uint64_t)v6, v17);
    }

    id v18 = 0;
  }
  else
  {
    id v19 = [v14 initWithValue:v12];
    long long v20 = [(PHRecentsController *)self contactCache];
    [v20 setObject:v19 forKeyedSubscript:v6];

    id v21 = sub_100012C68();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found unified contact %@ for contact handle %@", buf, 0x16u);
    }

    id v18 = v12;
  }

  return v18;
}

- (BOOL)canLoadOlderRecentCalls
{
  BOOL v3 = [(PHRecentsController *)self featureFlags];
  if ([v3 increaseCallHistoryEnabled])
  {
    id v4 = [(PHRecentsController *)self callHistoryController];
    unsigned __int8 v5 = [v4 canLoadOlderRecentCalls];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)recentCallsWillShow
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  [v2 boostQualityOfService];
}

- (id)metadataItemsForRecentCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableArray array];
  id v6 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [(PHRecentsController *)self metadataCache];
        id v13 = [v12 metadataForDestinationID:v11];

        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  id v14 = [v5 copy];

  return v14;
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035994;
  block[3] = &unk_1000A1D50;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035BE0;
  block[3] = &unk_1000A1D50;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035D50;
  block[3] = &unk_1000A1D50;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  id v6 = [(PHRecentsController *)self callHistoryController];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = sub_100012C68();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = [v4 name];
      int v14 = 138412802;
      __int16 v15 = v9;
      __int16 v16 = 2048;
      long long v17 = self;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = [v4 object];
    __int16 v13 = v12;
    if (v12) {
      -[PHRecentsController setUnreadCallCount:](self, "setUnreadCallCount:", [v12 unreadCallCount]);
    }
  }
}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PHRecentsController *)self featureFlags];
  unsigned __int8 v6 = [v5 phoneRecentsAvatarsEnabled];

  if ((v6 & 1) == 0)
  {
    unsigned int v7 = sub_100012C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v4 name];
      *(_DWORD *)buf = 138412802;
      int v14 = v8;
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
    }
    uint64_t v11 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100036154;
    block[3] = &unk_1000A1D50;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    int v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  id v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000364A0;
  block[3] = &unk_1000A1D50;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100012C68();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling providersChangedForProviderManager %@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [(PHRecentsController *)self recentCalls];
  if ([v8 count])
  {
    id v9 = [(PHRecentsController *)self itemCache];
    [v9 removeAllObjects];

    [(PHRecentsController *)self populateItemCacheForRecentCalls:v8];
    os_unfair_lock_lock(&self->_accessorLock);
    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeCalls:v8];
    os_unfair_lock_unlock(&self->_accessorLock);
  }
}

- (id)subtitleForRecentEmergencyCall:(id)a3
{
  id v4 = [a3 callOccurrences];
  unsigned __int8 v5 = [(PHRecentsController *)self localizedSubtitleForRecentEmergencyCall:v4];

  return v5;
}

- (id)localizedSubtitleForRecentEmergencyCall:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v3)
  {
LABEL_33:
    __int16 v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v19 = @"Emergency call";
    goto LABEL_34;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v25;
  uint64_t v8 = kCHCallOccurrenceEmergencyVideosCountKey;
  uint64_t v9 = kCHCallOccurrenceEmergencyImagesCountKey;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      __int16 v12 = [v11 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 += (unint64_t)[v12 integerValue];
      }
      __int16 v13 = [v11 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5 += (unint64_t)[v13 integerValue];
      }
    }
    id v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v4);
  if (v6 && !v5)
  {
    __int16 v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v16 = @"Shared videos coalesced";
    CFStringRef v17 = @"Shared video coalesced";
    BOOL v18 = v6 == 1;
    goto LABEL_18;
  }
  if (v6 || !v5)
  {
    if (v6 == 1 && v5 == 1)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared video and photo coalesced";
      goto LABEL_34;
    }
    if (v6 == 1 && v5 >= 2)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared video and photos coalesced";
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 == 1)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared videos and photo coalesced";
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 >= 2)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared videos and photos coalesced";
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  __int16 v14 = +[NSBundle mainBundle];
  id v15 = v14;
  CFStringRef v16 = @"Shared photos coalesced";
  CFStringRef v17 = @"Shared photo coalesced";
  BOOL v18 = v5 == 1;
LABEL_18:
  if (v18) {
    CFStringRef v19 = v17;
  }
  else {
    CFStringRef v19 = v16;
  }
LABEL_34:
  long long v20 = [v14 localizedStringForKey:v19 value:&stru_1000A3488 table:0];
  id v21 = +[NSString stringWithFormat:v20];

  return v21;
}

- (id)unknownLabel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036AEC;
  block[3] = &unk_1000A1D50;
  void block[4] = self;
  if (qword_1000BC1E0 != -1) {
    dispatch_once(&qword_1000BC1E0, block);
  }
  return (id)qword_1000BC1D8;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (id)presentScreenTimeShield
{
  return self->_presentScreenTimeShield;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (int)callDirectoryManagerIdentificationEntriesChangedNotificationToken
{
  return self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken;
}

- (void)setCallDirectoryManagerIdentificationEntriesChangedNotificationToken:(int)a3
{
  self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleProvider, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_presentScreenTimeShield, 0);
  objc_storeStrong((id *)&self->_preFetchingPredicate, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleCache, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_callProviderCache, 0);

  objc_storeStrong((id *)&self->_callHistoryController, 0);
}

- (unint64_t)callHistoryControllerOptions
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  id v3 = [v2 options];

  return (unint64_t)v3;
}

- (unint64_t)callHistoryControllerCoalescingStrategy
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  id v3 = [v2 coalescingStrategy];

  return (unint64_t)v3;
}

- (void)cancelSearchFetchOperations
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  [v2 cancelSearchFetchOperations];
}

@end