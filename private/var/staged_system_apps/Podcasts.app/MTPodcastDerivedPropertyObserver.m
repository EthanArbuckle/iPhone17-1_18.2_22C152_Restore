@interface MTPodcastDerivedPropertyObserver
+ (id)sharedInstance;
- (BOOL)_changeContainsRelevantChannelChanges:(id)a3;
- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3;
- (BOOL)_changeContainsRelevantPodcastChanges:(id)a3;
- (BOOL)_shouldSkipSettingPropertiesForWatchPPT;
- (BOOL)_shouldUpdatePodcastsStatsForChange:(id)a3;
- (BOOL)isObserving;
- (BOOL)setDerivedPropertyValue:(id)a3 forKey:(id)a4 forPodcast:(id)a5;
- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator;
- (MTPodcastDerivedPropertyObserver)init;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)handlers;
- (NSMutableDictionary)podcastCache;
- (NSPersistentHistoryToken)latestPersistentHistoryToken;
- (NSSet)channelPropertiesToFetch;
- (NSSet)episodePropertiesToFetch;
- (NSSet)podcastPropertiesToFetch;
- (NSSet)podcastStatsProperties;
- (id)_historyTransactionsSinceLatestPersistentHistoryToken;
- (id)_predicateForEpisodesToUpdateWithPodcastUuid:(id)a3 predicateForUnplayedInUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5;
- (id)addDerivedPropertyChangeHandler:(id)a3;
- (id)dependentPropertyForKey:(id)a3 forPodcastUuid:(id)a4;
- (id)derivedPropertiesForPodcast:(id)a3;
- (id)derivedPropertyValueForKey:(id)a3 forPodcast:(id)a4;
- (id)didFinishProcessingContextSaveHandlerForTests;
- (unint64_t)countOfNewEpisodesForPodcast:(id)a3;
- (unint64_t)countOfUnplayedEpisodesForPodcast:(id)a3;
- (void)_fetchLatestProcessedPersistentHistoryToken;
- (void)_processLatestPersistentHistoryTransactions;
- (void)_setLastProcessedPersistentHistoryToken:(id)a3;
- (void)_updateDerivedPropertiesForPodcastUUIDs:(id)a3;
- (void)_updateEpisodeCountsForPodcastUuid:(id)a3;
- (void)episodeResultsChangedForPodcastUuid:(id)a3;
- (void)notifyObserversForPodcast:(id)a3;
- (void)pauseProcessing;
- (void)processLatestPersistentHistoryTransactions;
- (void)removeDerivedPropertyChangeHandler:(id)a3;
- (void)reportStatsForPodcasts;
- (void)resumeProcessing;
- (void)setCache:(id)a3;
- (void)setChannelPropertiesToFetch:(id)a3;
- (void)setDependentPropertyValue:(id)a3 forKey:(id)a4 forPodcastUuid:(id)a5;
- (void)setDidFinishProcessingContextSaveHandlerForTests:(id)a3;
- (void)setEpisodePropertiesToFetch:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setLatestPersistentHistoryToken:(id)a3;
- (void)setPodcastCache:(id)a3;
- (void)setPodcastPropertiesToFetch:(id)a3;
- (void)setPodcastStatsProperties:(id)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)updateFlagsForPodcastUuid:(id)a3 predicateForUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5;
@end

@implementation MTPodcastDerivedPropertyObserver

- (void)startObserving
{
  obj = self;
  objc_sync_enter(obj);
  if ([(MTPodcastDerivedPropertyObserver *)obj isObserving])
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(MTPodcastDerivedPropertyObserver *)obj setIsObserving:1];
    objc_sync_exit(obj);

    [(MTPodcastDerivedPropertyObserver *)obj _fetchLatestProcessedPersistentHistoryToken];
    v2 = +[MTDB sharedInstance];
    [v2 addChangeNotifier:obj];

    [(MTPodcastDerivedPropertyObserver *)obj processLatestPersistentHistoryTransactions];
  }
}

- (id)_historyTransactionsSinceLatestPersistentHistoryToken
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (self->_latestPersistentHistoryToken)
  {
    v3 = +[MTDB sharedInstance];
    v4 = [v3 privateQueueContext];

    v5 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:self->_latestPersistentHistoryToken];
    [v5 setResultType:5];
    [v5 setFetchBatchSize:200];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_10005706C;
    v33 = sub_100057300;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = sub_10005706C;
    v27 = sub_100057300;
    id v28 = 0;
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100009C30;
    v18 = &unk_100550AA0;
    v21 = &v23;
    id v6 = v4;
    id v19 = v6;
    id v7 = v5;
    id v20 = v7;
    v22 = &v29;
    [v6 performBlockAndWait:&v15];
    if (v30[5])
    {
      v8 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = v30[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Derived Property Observer encountered error trying to fetch store result %@", buf, 0xCu);
      }

      v10 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Derived Property Observer clearing out persistent history token and performing a full persistent history run", buf, 2u);
      }

      v11 = +[NSUserDefaults standardUserDefaults];
      [v11 removeObjectForKey:@"DerivedPropertyObserverPersistentHistoryToken"];

      latestPersistentHistoryToken = self->_latestPersistentHistoryToken;
      self->_latestPersistentHistoryToken = 0;

      v13 = 0;
    }
    else
    {
      v13 = [v24[5] result:v15, v16, v17, v18, v19];
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MTPodcastDerivedPropertyObserver)init
{
  v31.receiver = self;
  v31.super_class = (Class)MTPodcastDerivedPropertyObserver;
  id v2 = [(MTPodcastDerivedPropertyObserver *)&v31 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v3;

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v5;

    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v7;

    +[NSSet setWithObjects:](NSSet, "setWithObjects:", kEpisodeUuid, kEpisodeExternalType, kEpisodeTitle, kEpisodeLevel, kEpisodeShowTypeSpecificLevel, kEpisodePubDate, kEpisodeEpisodeNumber, kEpisodePlayState, kEpisodePlayStateManuallySet, kEpisodePodcastUuid, kEpisodeIsFromiTunesSync, kEpisodeListenNowEpisode, kEpisodeUnplayedTab, kEpisodeUserEpisode, kEpisodeIsNew, kEpisodePlayStateLastModifiedDate, kEpisodeMetadataTimestamp,
      kEpisodeLastDatePlayed,
      kEpisodePriceType,
      kEpisodeIsBookmarked,
      kEpisodeAssetURL,
    uint64_t v9 = 0);
    v10 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v9;

    uint64_t v11 = kPodcastSubscribed;
    uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kPodcastSubscribed, kPodcastDeletePlayedEpisodes, kPodcastEpisodeLimit, kPodcastHidden, kPodcastChannelStoreId, kPodcastLastRemovedFromUpNextDate, 0);
    v13 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v12;

    uint64_t v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kChannelSubscriptionActive, 0);
    v15 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v14;

    uint64_t v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, kPodcastFlags, kPodcastDarkCountLocal, kPodcastLastTouchDate, kPodcastNotifications, 0);
    v17 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.podcasts.MTPodcastDerivedPropertyObserver.handlerQueue", 0);
    id v19 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.podcasts.MTPodcastDerivedPropertyObserver.notificationQueue", 0);
    v21 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v20;

    id v22 = objc_alloc_init((Class)MTEpisodeLevelCalculator);
    uint64_t v23 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v22;

    objc_initWeak(&location, v2);
    dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, *((dispatch_queue_t *)v2 + 2));
    uint64_t v25 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v24;

    v26 = *((void *)v2 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000592EC;
    handler[3] = &unk_10054E8E0;
    objc_copyWeak(&v29, &location);
    dispatch_source_set_event_handler(v26, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return (MTPodcastDerivedPropertyObserver *)v2;
}

- (void)_processLatestPersistentHistoryTransactions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (self->_processingIsPaused)
  {
    uint64_t v3 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MTPodcastDerivedPropertyObserver processing is paused. Skipping processLatestPersistentHistoryTransactions.", buf, 2u);
    }
  }
  else
  {
    kdebug_trace();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100058BE8;
    block[3] = &unk_10054D570;
    v4 = objc_alloc_init(MTBackgroundTaskManager);
    v53 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    kdebug_trace();
    id v5 = [(MTPodcastDerivedPropertyObserver *)self _historyTransactionsSinceLatestPersistentHistoryToken];
    kdebug_trace();
    *(void *)buf = 0;
    v47 = buf;
    uint64_t v48 = 0x3032000000;
    v49 = sub_10005706C;
    v50 = sub_100057300;
    id v51 = 0;
    id v6 = +[NSMutableSet set];
    id v7 = +[NSMutableSet set];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    kdebug_trace();
    v8 = +[MTDB sharedInstance];
    uint64_t v9 = [v8 privateQueueContext];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100007EE8;
    v34[3] = &unk_1005517F8;
    id v10 = v5;
    v40 = &v42;
    id v35 = v10;
    uint64_t v36 = self;
    id v11 = v7;
    id v37 = v11;
    id v12 = v6;
    id v38 = v12;
    id v13 = v9;
    id v39 = v13;
    v41 = buf;
    [v13 performBlockAndWait:v34];
    kdebug_trace();
    if (!v10)
    {
      kdebug_trace();
      uint64_t v14 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Derived Property Observer has never processed persistent history data. Will recalculate everything.", v54, 2u);
      }

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1001061FC;
      v29[3] = &unk_10054E080;
      id v30 = v13;
      id v31 = v12;
      id v32 = v11;
      v33 = buf;
      [v30 performBlockAndWait:v29];
      *((unsigned char *)v43 + 24) = 1;
      kdebug_trace();
    }
    objc_initWeak(&location, self);
    if ([v12 count])
    {
      v15 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v54 = 138543362;
        id v55 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Derived Property Observer did find changes for %{public}@", v54, 0xCu);
      }

      [(MTPodcastDerivedPropertyObserver *)self _updateDerivedPropertiesForPodcastUUIDs:v12];
    }
    if ([v11 count])
    {
      handlerQueue = self->_handlerQueue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10010655C;
      v25[3] = &unk_10054F1F0;
      objc_copyWeak(&v27, &location);
      id v26 = v11;
      dispatch_async(handlerQueue, v25);

      objc_destroyWeak(&v27);
    }
    if (*((unsigned char *)v43 + 24))
    {
      v17 = self->_handlerQueue;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1001066B4;
      v23[3] = &unk_10054E8E0;
      objc_copyWeak(&v24, &location);
      dispatch_async(v17, v23);
      objc_destroyWeak(&v24);
    }
    if (*((void *)v47 + 5))
    {
      dispatch_queue_t v18 = self->_handlerQueue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100106734;
      v21[3] = &unk_10054FC00;
      objc_copyWeak(&v22, &location);
      v21[4] = buf;
      dispatch_async(v18, v21);
      [(MTPodcastDerivedPropertyObserver *)self setLatestPersistentHistoryToken:*((void *)v47 + 5)];
      objc_destroyWeak(&v22);
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100058BE0;
    v19[3] = &unk_10054D570;
    uint64_t v3 = v4;
    dispatch_queue_t v20 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

    kdebug_trace();
    objc_destroyWeak(&location);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (void)processLatestPersistentHistoryTransactions
{
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)_fetchLatestProcessedPersistentHistoryToken
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000169F0;
  block[3] = &unk_10054D570;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
}

+ (id)sharedInstance
{
  if (qword_10060A880 != -1) {
    dispatch_once(&qword_10060A880, &stru_1005517D0);
  }
  id v2 = (void *)qword_10060A878;

  return v2;
}

- (void)stopObserving
{
  obj = self;
  objc_sync_enter(obj);
  if ([(MTPodcastDerivedPropertyObserver *)obj isObserving])
  {
    [(MTPodcastDerivedPropertyObserver *)obj setIsObserving:0];
    objc_sync_exit(obj);

    id v2 = +[MTDB sharedInstance];
    [(MTPodcastDerivedPropertyObserver *)v2 removeChangeNotifier:obj];
    uint64_t v3 = v2;
  }
  else
  {
    objc_sync_exit(obj);
    uint64_t v3 = obj;
  }
}

- (void)pauseProcessing
{
  kdebug_trace();
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001052A4;
  block[3] = &unk_10054D570;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)resumeProcessing
{
  kdebug_trace();
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001053C0;
  block[3] = &unk_10054D570;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)_setLastProcessedPersistentHistoryToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_handlerQueue);
  if (v4)
  {
    id v21 = 0;
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v21];
    id v6 = v21;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v11 = +[NSUserDefaults standardUserDefaults];
      [v11 setObject:v5 forKey:@"DerivedPropertyObserverPersistentHistoryToken"];

      id v12 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Derived Property Observer set last processed persistent history token %@.", buf, 0xCu);
      }

      id v13 = +[NSDate dateWithTimeIntervalSinceNow:-1209600.0];
      uint64_t v14 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:v13];

      v15 = +[MTDB sharedInstance];
      uint64_t v16 = [v15 privateQueueContext];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100105710;
      v18[3] = &unk_10054D9B0;
      id v19 = v16;
      id v20 = v14;
      id v17 = v14;
      uint64_t v9 = v16;
      [v9 performBlock:v18];
    }
    else
    {
      uint64_t v9 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Derived Property Observer encountered error archiving last persistent history token %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v10 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Derived Property Observer set last processed persistent history token to nil. Removing default.", buf, 2u);
    }

    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 removeObjectForKey:@"DerivedPropertyObserverPersistentHistoryToken"];
  }
}

- (void)_updateDerivedPropertiesForPodcastUUIDs:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105954;
  block[3] = &unk_10054D570;
  id v5 = objc_alloc_init(MTBackgroundTaskManager);
  uint64_t v14 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  handlerQueue = self->_handlerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100105964;
  v9[3] = &unk_10054E708;
  id v10 = v4;
  id v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(handlerQueue, v9);
}

- (BOOL)_shouldUpdatePodcastsStatsForChange:(id)a3
{
  id v3 = a3;
  id v4 = [v3 changedObjectID];
  id v5 = [v4 entity];
  id v6 = [v5 name];

  unsigned int v7 = [v6 isEqualToString:kMTEpisodeEntityName];
  unsigned int v8 = [v6 isEqualToString:kMTPodcastEntityName];
  unsigned int v9 = v8;
  if ((v7 & 1) != 0 || v8)
  {
    if (((unint64_t)[v3 changeType] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = [v3 updatedProperties];
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        id v13 = v12;
        id v23 = v6;
        id v24 = v3;
        uint64_t v14 = *(void *)v27;
        uint64_t v15 = kEpisodeIsFromiTunesSync;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (v7)
            {
              dispatch_queue_t v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) name];
              unsigned __int8 v19 = [v18 isEqualToString:v15];

              if (v19) {
                goto LABEL_17;
              }
            }
            if (v9)
            {
              podcastStatsProperties = self->_podcastStatsProperties;
              id v21 = [v17 name];
              LOBYTE(podcastStatsProperties) = [(NSSet *)podcastStatsProperties containsObject:v21];

              if (podcastStatsProperties)
              {
LABEL_17:
                BOOL v10 = 1;
                goto LABEL_18;
              }
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v13) {
            continue;
          }
          break;
        }
        BOOL v10 = 0;
LABEL_18:
        id v6 = v23;
        id v3 = v24;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3
{
  id v4 = a3;
  id v5 = [v4 changedObjectID];
  id v6 = [v5 entity];
  unsigned int v7 = [v6 name];

  if ([v7 isEqualToString:kMTEpisodeEntityName])
  {
    id v8 = [v4 changeType];
    if (!v8)
    {
LABEL_15:
      BOOL v16 = 1;
      goto LABEL_16;
    }
    if (v8 == (id)1)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      unsigned int v9 = [v4 updatedProperties];
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            episodePropertiesToFetch = self->_episodePropertiesToFetch;
            uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) name];
            LOBYTE(episodePropertiesToFetch) = [(NSSet *)episodePropertiesToFetch containsObject:v15];

            if (episodePropertiesToFetch)
            {

              goto LABEL_15;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)_changeContainsRelevantPodcastChanges:(id)a3
{
  id v4 = a3;
  id v5 = [v4 changedObjectID];
  id v6 = [v5 entity];
  unsigned int v7 = [v6 name];

  if ([v7 isEqualToString:kMTPodcastEntityName])
  {
    id v8 = [v4 changeType];
    if (!v8)
    {
LABEL_15:
      BOOL v16 = 1;
      goto LABEL_16;
    }
    if (v8 == (id)1)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      unsigned int v9 = [v4 updatedProperties];
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            podcastPropertiesToFetch = self->_podcastPropertiesToFetch;
            uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) name];
            LOBYTE(podcastPropertiesToFetch) = [(NSSet *)podcastPropertiesToFetch containsObject:v15];

            if (podcastPropertiesToFetch)
            {

              goto LABEL_15;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)_changeContainsRelevantChannelChanges:(id)a3
{
  id v4 = a3;
  id v5 = [v4 changedObjectID];
  id v6 = [v5 entity];
  unsigned int v7 = [v6 name];

  if (![v7 isEqualToString:kMTChannelEntityName]) {
    goto LABEL_13;
  }
  unint64_t v8 = (unint64_t)[v4 changeType];
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    BOOL v16 = 1;
    goto LABEL_17;
  }
  if (v8 == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unsigned int v9 = [v4 updatedProperties];
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          channelPropertiesToFetch = self->_channelPropertiesToFetch;
          uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) name];
          LOBYTE(channelPropertiesToFetch) = [(NSSet *)channelPropertiesToFetch containsObject:v15];

          if (channelPropertiesToFetch)
          {
            BOOL v16 = 1;
            goto LABEL_16;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 0;
LABEL_16:
  }
  else
  {
LABEL_13:
    BOOL v16 = 0;
  }
LABEL_17:

  return v16;
}

- (void)reportStatsForPodcasts
{
  kdebug_trace();
  uint64_t v44 = 0;
  char v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 privateQueueContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100106BC8;
  v15[3] = &unk_100551820;
  long long v18 = &v44;
  id v5 = v4;
  id v16 = v5;
  id v17 = self;
  long long v19 = &v40;
  long long v20 = &v36;
  long long v21 = &v32;
  id v22 = &v28;
  id v23 = &v24;
  [v5 performBlockAndWait:v15];
  v48[0] = @"total";
  id v6 = +[NSNumber numberWithUnsignedInteger:v41[3]];
  v49[0] = v6;
  v48[1] = @"subscribed";
  unsigned int v7 = +[NSNumber numberWithUnsignedInteger:v37[3]];
  v49[1] = v7;
  v48[2] = @"not_subscribed";
  unint64_t v8 = +[NSNumber numberWithUnsignedInteger:v41[3] - v37[3]];
  v49[2] = v8;
  v48[3] = @"authenticated_dark";
  unsigned int v9 = +[NSNumber numberWithUnsignedInteger:v33[3]];
  v49[3] = v9;
  v49[4] = &off_100579878;
  v48[4] = @"feed_dark";
  v48[5] = @"download_dark";
  id v10 = +[NSNumber numberWithUnsignedInteger:v29[3]];
  v49[5] = v10;
  v48[6] = @"notifications_enabled";
  id v11 = +[NSNumber numberWithUnsignedInteger:v25[3]];
  v49[6] = v11;
  v48[7] = @"notifications_disabled";
  uint64_t v12 = +[NSNumber numberWithUnsignedInteger:v41[3] - v25[3]];
  v49[7] = v12;
  v48[8] = @"episodes_from_itunes";
  id v13 = +[NSNumber numberWithUnsignedInteger:v45[3]];
  v49[8] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:9];
  +[IMMetrics recordUserAction:@"podcast_stats" dataSource:0 withData:v14];

  kdebug_trace();
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

- (void)_updateEpisodeCountsForPodcastUuid:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10005706C;
  uint64_t v25 = sub_100057300;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_10005706C;
  long long v19 = sub_100057300;
  id v20 = 0;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 privateQueueContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107020;
  v9[3] = &unk_100551848;
  id v7 = v4;
  id v10 = v7;
  id v8 = v6;
  id v13 = &v21;
  uint64_t v14 = &v15;
  id v11 = v8;
  uint64_t v12 = self;
  [v8 performBlockAndWait:v9];
  LODWORD(v5) = [(MTPodcastDerivedPropertyObserver *)self setDerivedPropertyValue:v22[5] forKey:@"kCountOfNewEpisodesKey" forPodcast:v7];
  if (([(MTPodcastDerivedPropertyObserver *)self setDerivedPropertyValue:v16[5] forKey:@"kCountOfUnplayedEpisodesKey" forPodcast:v7] | v5) == 1)[(MTPodcastDerivedPropertyObserver *)self notifyObserversForPodcast:v7]; {
  kdebug_trace();
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)episodeResultsChangedForPodcastUuid:(id)a3
{
  id v7 = a3;
  -[MTPodcastDerivedPropertyObserver _updateEpisodeCountsForPodcastUuid:](self, "_updateEpisodeCountsForPodcastUuid:");
  id v4 = [(MTPodcastDerivedPropertyObserver *)self didFinishProcessingContextSaveHandlerForTests];

  if (v4)
  {
    id v5 = [(MTPodcastDerivedPropertyObserver *)self derivedPropertiesForPodcast:v7];
    id v6 = [(MTPodcastDerivedPropertyObserver *)self didFinishProcessingContextSaveHandlerForTests];
    ((void (**)(void, void *))v6)[2](v6, v5);
  }
}

- (void)updateFlagsForPodcastUuid:(id)a3 predicateForUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  id v10 = +[MTDB sharedInstance];
  id v11 = [v10 privateQueueContext];

  kdebug_trace();
  uint64_t v12 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  id v13 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v8];
  [v12 setPredicate:v13];

  [v12 setFetchLimit:1];
  uint64_t v14 = [v11 executeFetchRequest:v12 error:0];
  id v15 = [v14 count];

  if (v15)
  {
    id v16 = +[MTEpisode predicateForPlayed:0];
    uint64_t v17 = [v30 AND:v16];

    long long v18 = [(MTPodcastDerivedPropertyObserver *)self _predicateForEpisodesToUpdateWithPodcastUuid:v8 predicateForUnplayedInUnplayedTab:v17 predicateForUserEpisodes:v9];
    kdebug_trace();
    objc_initWeak(&location, self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10010782C;
    v39[3] = &unk_100551870;
    long long v29 = &v46;
    objc_copyWeak(&v46, &location);
    id v19 = v11;
    id v40 = v19;
    id v28 = v18;
    id v41 = v28;
    id v27 = v17;
    id v42 = v27;
    uint64_t v43 = self;
    id v44 = v9;
    id v20 = v8;
    id v45 = v20;
    [v19 performBlockAndWait:v39];
    kdebug_trace();
    kdebug_trace();
    uint64_t v21 = +[MTRecencyUtil upNextForPodcastUuid:v20 excludeExplicit:0 ctx:v19];
    kdebug_trace();
    id v22 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v21 episodeUuid:v27, v28, &v46];
      [v21 modifiedDate];
      *(_DWORD *)buf = 138543874;
      id v49 = v20;
      __int16 v50 = 2114;
      id v51 = v23;
      __int16 v52 = 2050;
      uint64_t v53 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "UpNext result from property changed observer for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", buf, 0x20u);
    }
    if (![(MTPodcastDerivedPropertyObserver *)self _shouldSkipSettingPropertiesForWatchPPT])
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100107DD0;
      v34[3] = &unk_10054DFE8;
      id v35 = v20;
      id v36 = v21;
      id v37 = v19;
      uint64_t v38 = self;
      [v37 performBlockAndWait:v34];
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100107E88;
    v31[3] = &unk_10054D9B0;
    id v32 = v19;
    id v33 = v20;
    [v32 performBlockAndWait:v31];
    kdebug_trace();

    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v25 = [v11 podcastForUuid:v8];
    id v26 = [v25 nextEpisodeUuid];

    if (v26)
    {
      [v25 setNextEpisodeUuid:0];
      [v11 saveInCurrentBlock];
    }
    kdebug_trace();
  }
}

- (id)_predicateForEpisodesToUpdateWithPodcastUuid:(id)a3 predicateForUnplayedInUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSMutableArray array];
  id v11 = +[MTEpisode predicateForUnplayedTabFlag:0];
  uint64_t v12 = +[NSPredicate predicateForNilValueForKey:kEpisodeUnplayedTab];
  id v13 = [v11 OR:v12];
  id v30 = [v8 AND:v13];

  uint64_t v14 = +[NSCompoundPredicate notPredicateWithSubpredicate:v8];

  id v15 = +[MTEpisode predicateForUnplayedTabFlag:1];
  id v16 = [v14 AND:v15];

  uint64_t v17 = [v30 OR:v16];
  [v10 addObject:v17];
  long long v18 = +[MTEpisode predicateForUserEpisode:0];
  id v19 = +[NSPredicate predicateForNilValueForKey:kEpisodeUserEpisode];
  id v20 = [v18 OR:v19];
  uint64_t v21 = [v7 AND:v20];

  id v22 = +[NSCompoundPredicate notPredicateWithSubpredicate:v7];

  uint64_t v23 = +[MTEpisode predicateForUserEpisode:1];
  uint64_t v24 = [v22 AND:v23];

  uint64_t v25 = [v21 OR:v24];
  [v10 addObject:v25];
  id v26 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v9];

  id v27 = +[NSCompoundPredicate orPredicateWithSubpredicates:v10];
  id v28 = [v26 AND:v27];

  return v28;
}

- (id)derivedPropertiesForPodcast:(id)a3
{
  id v4 = a3;
  id v5 = self->_cache;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v6 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->_cache setObject:v6 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)derivedPropertyValueForKey:(id)a3 forPodcast:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = [(MTPodcastDerivedPropertyObserver *)self derivedPropertiesForPodcast:v7];
    objc_sync_enter(v8);
    id v9 = [v8 objectForKeyedSubscript:v6];
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)setDerivedPropertyValue:(id)a3 forKey:(id)a4 forPodcast:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length])
  {
    id v11 = [(MTPodcastDerivedPropertyObserver *)self derivedPropertiesForPodcast:v10];
    objc_sync_enter(v11);
    uint64_t v12 = [v11 objectForKeyedSubscript:v9];
    unsigned __int8 v13 = [v12 isEqual:v8];
    if (v8) {
      [v11 setObject:v8 forKeyedSubscript:v9];
    }
    else {
      [v11 removeObjectForKey:v9];
    }
    char v14 = v13 ^ 1;

    objc_sync_exit(v11);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)dependentPropertyForKey:(id)a3 forPodcastUuid:(id)a4
{
  podcastCache = self->_podcastCache;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)podcastCache objectForKeyedSubscript:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)setDependentPropertyValue:(id)a3 forKey:(id)a4 forPodcastUuid:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_podcastCache objectForKeyedSubscript:v9];
  if (!v10)
  {
    podcastCache = self->_podcastCache;
    id v10 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)podcastCache setObject:v10 forKeyedSubscript:v9];
  }
  [v10 setObject:v12 forKeyedSubscript:v8];
}

- (void)notifyObserversForPodcast:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPodcastDerivedPropertyObserver *)self derivedPropertiesForPodcast:v4];
  id v6 = [(MTPodcastDerivedPropertyObserver *)self handlers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001087E4;
  v9[3] = &unk_100550B60;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

- (NSMutableDictionary)handlers
{
  id v3 = self->_handlers;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_handlers copy];
  objc_sync_exit(v3);

  return (NSMutableDictionary *)v4;
}

- (BOOL)_shouldSkipSettingPropertiesForWatchPPT
{
  return 0;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableDictionary)podcastCache
{
  return self->_podcastCache;
}

- (void)setPodcastCache:(id)a3
{
}

- (NSSet)episodePropertiesToFetch
{
  return self->_episodePropertiesToFetch;
}

- (void)setEpisodePropertiesToFetch:(id)a3
{
}

- (NSSet)podcastPropertiesToFetch
{
  return self->_podcastPropertiesToFetch;
}

- (void)setPodcastPropertiesToFetch:(id)a3
{
}

- (NSSet)channelPropertiesToFetch
{
  return self->_channelPropertiesToFetch;
}

- (void)setChannelPropertiesToFetch:(id)a3
{
}

- (NSSet)podcastStatsProperties
{
  return self->_podcastStatsProperties;
}

- (void)setPodcastStatsProperties:(id)a3
{
}

- (NSPersistentHistoryToken)latestPersistentHistoryToken
{
  return self->_latestPersistentHistoryToken;
}

- (void)setLatestPersistentHistoryToken:(id)a3
{
}

- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator
{
  return self->_episodeLevelCalculator;
}

- (id)didFinishProcessingContextSaveHandlerForTests
{
  return self->_didFinishProcessingContextSaveHandlerForTests;
}

- (void)setDidFinishProcessingContextSaveHandlerForTests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishProcessingContextSaveHandlerForTests, 0);
  objc_storeStrong((id *)&self->_episodeLevelCalculator, 0);
  objc_storeStrong((id *)&self->_latestPersistentHistoryToken, 0);
  objc_storeStrong((id *)&self->_podcastStatsProperties, 0);
  objc_storeStrong((id *)&self->_channelPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_podcastPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_episodePropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_podcastCache, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_persistentHistorySource, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

- (id)addDerivedPropertyChangeHandler:(id)a3
{
  id v4 = a3;
  CFUUIDRef v5 = CFUUIDCreate(0);
  id v6 = (__CFString *)CFUUIDCreateString(0, v5);
  CFRelease(v5);
  id v7 = self->_handlers;
  objc_sync_enter(v7);
  handlers = self->_handlers;
  id v9 = [v4 copy];
  [(NSMutableDictionary *)handlers setObject:v9 forKey:v6];

  objc_sync_exit(v7);

  return v6;
}

- (void)removeDerivedPropertyChangeHandler:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = self->_handlers;
    objc_sync_enter(v4);
    [(NSMutableDictionary *)self->_handlers removeObjectForKey:v5];
    objc_sync_exit(v4);
  }
}

- (unint64_t)countOfNewEpisodesForPodcast:(id)a3
{
  id v3 = [(MTPodcastDerivedPropertyObserver *)self derivedPropertyValueForKey:@"kCountOfNewEpisodesKey" forPodcast:a3];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (unint64_t)countOfUnplayedEpisodesForPodcast:(id)a3
{
  id v3 = [(MTPodcastDerivedPropertyObserver *)self derivedPropertyValueForKey:@"kCountOfUnplayedEpisodesKey" forPodcast:a3];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

@end