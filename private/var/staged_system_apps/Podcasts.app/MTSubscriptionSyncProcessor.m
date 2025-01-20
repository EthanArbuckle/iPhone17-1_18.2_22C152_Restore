@interface MTSubscriptionSyncProcessor
+ (id)subscriptionSyncProcessorSyncKeys;
- (BOOL)hasLocalChanges;
- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6;
- (BOOL)mergeLocalAndRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6;
- (BOOL)overrideLocalWithRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6;
- (BOOL)requiresNextGetTransaction;
- (BOOL)updatePodcastsToAdd:(id)a3 addingPodcastIfNeeded:(id)a4 hasLocalPodcast:(BOOL)a5;
- (BOOL)updatePodcastsToUnsubscribe:(id)a3 remotePodcast:(id)a4 localPodcast:(id)a5;
- (BOOL)updateSettingsIfNeededForLocalPodcast:(id)a3 remotePodcast:(id)a4;
- (MTSubscriptionSyncProcessor)initWithStorage:(id)a3 config:(id)a4 cloudSyncBugReporter:(id)a5;
- (MTSubscriptionSyncProcessorConfig)config;
- (MTSubscriptionSyncStorageProviding)storageProvider;
- (NSMutableSet)addedSubscriptions;
- (OS_dispatch_queue)workQueue;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)_addedSubscriptions;
- (id)_podcastSubscriptions;
- (id)context;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)logPrefix;
- (id)podcastCacheInContext:(id)a3;
- (id)syncDictionaryToMetricsDictionary:(id)a3;
- (id)unvisitedPodcastsToUnsubscribeIn:(id)a3 mismatch:(BOOL *)a4 version:(id)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (unint64_t)_subscribedPodcastsCount;
- (unint64_t)initialSubscribedPodcastsCount;
- (void)checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:(unint64_t)a3 podcastsToUnsubscribeCount:(unint64_t)a4 newVersion:(id)a5;
- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)importRemotePodcastDicts:(id)a3 inContext:(id)a4 visitingPodcastsInCache:(id)a5 updatingPodcastsToAdd:(id)a6 updatingPodcastsToUnsubscribe:(id)a7 mismatch:(BOOL)a8 version:(id)a9;
- (void)markAddedSubscriptionsAsSynced;
- (void)markAllShowsAsSynced;
- (void)markShowsAsSyncedForPredicate:(id)a3;
- (void)reorderLocalPodcastsToMatchRemote:(id)a3;
- (void)reportImportingRemotePodcast:(id)a3 withLocalPodcast:(id)a4 shouldAddPodcast:(BOOL)a5 shouldUnsubscribeLocalPodcast:(BOOL)a6 shouldUpdateSettings:(BOOL)a7 mismatch:(BOOL)a8 version:(id)a9;
- (void)setAddedSubscriptions:(id)a3;
- (void)setCloudSyncBugReporter:(id)a3;
- (void)setConfig:(id)a3;
- (void)setInitialSubscribedPodcastsCount:(unint64_t)a3;
- (void)setStorageProvider:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)subscribeFromCloudToPodcasts:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
- (void)updateSettingsForLocalPodcast:(id)a3 remotePodcast:(id)a4 ctx:(id)a5;
@end

@implementation MTSubscriptionSyncProcessor

- (MTSubscriptionSyncProcessor)initWithStorage:(id)a3 config:(id)a4 cloudSyncBugReporter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MTSubscriptionSyncProcessor;
  v11 = [(MTSubscriptionSyncProcessor *)&v20 init];
  v12 = v11;
  if (v11)
  {
    [(MTSubscriptionSyncProcessor *)v11 setConfig:v9];
    [(MTSubscriptionSyncProcessor *)v12 setStorageProvider:v8];
    [(MTSubscriptionSyncProcessor *)v12 setCloudSyncBugReporter:v10];
    dispatch_queue_t v13 = dispatch_queue_create("MTSubscriptionSyncProcessor.workQueue", 0);
    [(MTSubscriptionSyncProcessor *)v12 setWorkQueue:v13];

    v14 = _MTLogCategoryCloudSync();
    v12->_os_signpost_id_t signpostID = os_signpost_id_generate(v14);

    v15 = _MTLogCategoryCloudSync();
    v16 = v15;
    os_signpost_id_t signpostID = v12->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, signpostID, "MTSubscriptionSyncProcessor.created", "", v19, 2u);
    }
  }
  return v12;
}

+ (id)subscriptionSyncProcessorSyncKeys
{
  if (qword_10060A978 != -1) {
    dispatch_once(&qword_10060A978, &stru_100553260);
  }
  v2 = (void *)qword_10060A970;

  return v2;
}

- (id)context
{
  v2 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  v3 = [v2 importContext];

  return v3;
}

- (int64_t)operationTypeForSET
{
  v2 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  id v3 = [v2 syncType];

  if (v3 == (id)1) {
    return 13;
  }
  else {
    return 1;
  }
}

- (BOOL)hasLocalChanges
{
  v2 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  unsigned __int8 v3 = [v2 syncDirtyFlag];

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v5 = a4;
  v6 = _MTLogCategoryCloudSync();
  v7 = v6;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTSubscriptionSyncProcessor.GET", "key: %@", (uint8_t *)&v17, 0xCu);
  }

  id v9 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  id v10 = [v9 syncVersion];

  v11 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v17 = 138543874;
    id v18 = v12;
    __int16 v19 = 2114;
    objc_super v20 = v10;
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Version for GET transaction [%{public}@] key: %{public}@", (uint8_t *)&v17, 0x20u);
  }
  dispatch_queue_t v13 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v17 = 138543874;
    id v18 = v14;
    __int16 v19 = 2114;
    objc_super v20 = v10;
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering addedSubscriptions for GET transaction [%{public}@] key: %{public}@", (uint8_t *)&v17, 0x20u);
  }
  v15 = [(MTSubscriptionSyncProcessor *)self _addedSubscriptions];
  [(MTSubscriptionSyncProcessor *)self setAddedSubscriptions:v15];

  [(MTSubscriptionSyncProcessor *)self setInitialSubscribedPodcastsCount:[(MTSubscriptionSyncProcessor *)self _subscribedPodcastsCount]];

  return v10;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7 = a4;
  if (+[SyncKeysRepository shouldSyncInReadOnlyMode])
  {
    id v8 = [(MTSubscriptionSyncProcessor *)self cloudSyncBugReporter];
    id v9 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    id v10 = [v9 syncType];
    v11 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    v12 = [v11 syncVersion];
    [v8 reportSubscriptionsSyncIssue:4 subscriptionSyncType:v10 version:v12 userInfo:0];
  }
  dispatch_queue_t v13 = _MTLogCategoryCloudSync();
  v14 = v13;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v49 = 138412290;
    id v50 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTSubscriptionSyncProcessor.SET", "key: %@", (uint8_t *)&v49, 0xCu);
  }

  v16 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  if ([v16 syncDirtyFlag])
  {
  }
  else
  {
    int v17 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    id v18 = [v17 syncVersion];

    if (v18)
    {
      __int16 v19 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v20 = [(MTSubscriptionSyncProcessor *)self logPrefix];
        __int16 v21 = [(MTSubscriptionSyncProcessor *)self storageProvider];
        id v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v21 syncDirtyFlag]);
        v23 = [(MTSubscriptionSyncProcessor *)self storageProvider];
        v24 = [v23 syncVersion];
        int v49 = 138544130;
        id v50 = v20;
        __int16 v51 = 2114;
        id v52 = v22;
        __int16 v53 = 2114;
        id v54 = v24;
        __int16 v55 = 2114;
        id v56 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ No data for SET transaction. syncDirtyFlag: %{public}@, podcastSyncVersion: %{public}@, key: %{public}@", (uint8_t *)&v49, 0x2Au);
      }
      goto LABEL_21;
    }
  }
  v25 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  *a5 = [v25 syncVersion];

  v26 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    id v28 = *a5;
    int v49 = 138543874;
    id v50 = v27;
    __int16 v51 = 2114;
    id v52 = v28;
    __int16 v53 = 2114;
    id v54 = v7;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering data for SET transaction [%{public}@] key: %{public}@", (uint8_t *)&v49, 0x20u);
  }
  __int16 v19 = [(MTSubscriptionSyncProcessor *)self _podcastSubscriptions];
  v29 = [(MTSubscriptionSyncProcessor *)self _addedSubscriptions];
  [(MTSubscriptionSyncProcessor *)self setAddedSubscriptions:v29];

  [(MTSubscriptionSyncProcessor *)self setInitialSubscribedPodcastsCount:[(MTSubscriptionSyncProcessor *)self _subscribedPodcastsCount]];
  if (!v19)
  {
LABEL_21:
    v44 = 0;
    goto LABEL_22;
  }
  v30 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    id v32 = *a5;
    v33 = +[NSNumber numberWithUnsignedInteger:[v19 count]];
    v34 = [v19 description];
    int v49 = 138544387;
    id v50 = v31;
    __int16 v51 = 2114;
    id v52 = v32;
    __int16 v53 = 2114;
    id v54 = v7;
    __int16 v55 = 2114;
    id v56 = v33;
    __int16 v57 = 2113;
    v58 = v34;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing data for SET transaction [%{public}@] key: %{public}@ : count %{public}@, data: %{private}@", (uint8_t *)&v49, 0x34u);
  }
  v35 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  v36 = [v35 syncVersion];
  uint64_t v37 = (uint64_t)[v36 integerValue];

  if (![v19 count] && *a5 && v37 >= 11)
  {
    v38 = [(MTSubscriptionSyncProcessor *)self cloudSyncBugReporter];
    v39 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    id v40 = [v39 syncType];
    v41 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    v42 = [v41 syncVersion];
    [v38 reportSubscriptionsSyncIssue:0 subscriptionSyncType:v40 version:v42 userInfo:0];
  }
  v43 = objc_alloc_init(MZKeyValueStoreNode);
  [(MZKeyValueStoreNode *)v43 setArrayValue:v19];
  v44 = [(MZKeyValueStoreNode *)v43 value];

LABEL_22:
  v45 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v49 = 138543362;
    id v50 = v46;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting subscriptions sync dirty = NO", (uint8_t *)&v49, 0xCu);
  }
  v47 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  [v47 setSyncDirtyFlag:0];

  return v44;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  v15 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v18 = 138543874;
    __int16 v19 = v16;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Successful GET transaction for key: %{public}@, new version: [%{public}@]", (uint8_t *)&v18, 0x20u);
  }
  BOOL v17 = [(MTSubscriptionSyncProcessor *)self mergeData:v14 forKey:v11 version:v12 mismatch:0];

  [(MTSubscriptionSyncProcessor *)self completeTransactionWithNewVersion:v12 mismatch:v17 finishedBlock:v13];
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v15 = 138543874;
    v16 = v14;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Successful SET transaction for key: %{public}@, new version: [%{public}@]", (uint8_t *)&v15, 0x20u);
  }
  [(MTSubscriptionSyncProcessor *)self markAddedSubscriptionsAsSynced];
  [(MTSubscriptionSyncProcessor *)self completeTransactionWithNewVersion:v11 mismatch:0 finishedBlock:v12];
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  int v15 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v18 = 138543874;
    __int16 v19 = v16;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Conflict on SET transaction for key: %{public}@, new version: [%{public}@]", (uint8_t *)&v18, 0x20u);
  }
  BOOL v17 = [(MTSubscriptionSyncProcessor *)self mergeData:v14 forKey:v11 version:v12 mismatch:1];

  [(MTSubscriptionSyncProcessor *)self completeTransactionWithNewVersion:v12 mismatch:v17 finishedBlock:v13];
}

- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if (+[SyncKeysRepository shouldSyncInReadOnlyMode])unsigned __int8 v13 = [(MTSubscriptionSyncProcessor *)self overrideLocalWithRemoteData:v12 forKey:v11 version:v10 mismatch:v6]; {
  else
  }
    unsigned __int8 v13 = [(MTSubscriptionSyncProcessor *)self mergeLocalAndRemoteData:v12 forKey:v11 version:v10 mismatch:v6];
  BOOL v14 = v13;

  return v14;
}

- (BOOL)overrideLocalWithRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v13 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v15 = [(MTSubscriptionSyncProcessor *)self addedSubscriptions];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Read-only sync mode -> Overriding all local data. Local shows that will be overriden: %@; Also, deletin"
      "g all Hidden podcasts synchronously.",
      buf,
      0x16u);
  }
  id v32 = [(MTSubscriptionSyncProcessor *)self context];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v44 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10015D740;
  v33[3] = &unk_100553288;
  v33[4] = self;
  uint64_t v37 = buf;
  id v16 = v10;
  id v34 = v16;
  id v17 = v11;
  id v35 = v17;
  id v31 = v12;
  id v36 = v31;
  BOOL v38 = v6;
  [v32 performBlockAndWaitWithSave:v33];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    int v18 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      *(_DWORD *)v41 = 138543362;
      v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@ Found a merge conflict on read-only sync mode!", v41, 0xCu);
    }
    BOOL v20 = v6;
    id v21 = objc_alloc_init(MZKeyValueStoreNode);
    [(MZKeyValueStoreNode *)v21 setKey:v17];
    [(MZKeyValueStoreNode *)v21 setValue:v16];
    __int16 v22 = [(MZKeyValueStoreNode *)v21 arrayValue];
    id v23 = [(MTSubscriptionSyncProcessor *)self cloudSyncBugReporter];
    v24 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    id v25 = [v24 syncType];
    v26 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    v27 = [v26 syncVersion];
    v39[0] = @"remoteData";
    v39[1] = @"remoteMismatch";
    CFStringRef v28 = @"false";
    if (v20) {
      CFStringRef v28 = @"true";
    }
    v40[0] = v22;
    v40[1] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    [v23 reportSubscriptionsSyncIssue:3 subscriptionSyncType:v25 version:v27 userInfo:v29];
  }
  _Block_object_dispose(buf, 8);

  return 0;
}

- (BOOL)mergeLocalAndRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  BOOL v47 = a6;
  id v44 = a3;
  id v46 = a4;
  id v45 = a5;
  id v8 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v46;
    *(_WORD *)&buf[22] = 2114;
    id v69 = v45;
    __int16 v70 = 1026;
    BOOL v71 = v47;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Merging data for key: %{public}@; newVersion: [%{public}@]; mismatch: %{public}d",
      buf,
      0x26u);
  }
  v48 = objc_alloc_init(MZKeyValueStoreNode);
  [(MZKeyValueStoreNode *)v48 setKey:v46];
  [(MZKeyValueStoreNode *)v48 setValue:v44];
  if ([(MZKeyValueStoreNode *)v48 hasData])
  {
    id v10 = [(MZKeyValueStoreNode *)v48 arrayValue];
    id v11 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      id v13 = [v10 count];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Merging %lu remote dictionaries:", buf, 0x16u);
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = v10;
    id v14 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v60;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v60 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v59 + 1) + 8 * i);
          int v18 = _MTLogCategoryCloudSync();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v19 = [(MTSubscriptionSyncProcessor *)self logPrefix];
            *(_DWORD *)buf = 138543619;
            *(void *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2113;
            *(void *)&buf[14] = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %{private}@", buf, 0x16u);
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v14);
    }

    if (![obj count])
    {
      BOOL v20 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = [(MTSubscriptionSyncProcessor *)self logPrefix];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ Nothing to merge: Store node has data, but there are no podcast items.", buf, 0xCu);
      }
      __int16 v22 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = [(MTSubscriptionSyncProcessor *)self logPrefix];
        v24 = [(MZKeyValueStoreNode *)v48 debugDescription];
        *(_DWORD *)buf = 138543619;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@ Node data: %{private}@", buf, 0x16u);
      }
    }
    id v25 = objc_opt_new();
    v26 = objc_opt_new();
    v27 = [(MTSubscriptionSyncProcessor *)self context];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v69) = v47;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10015DFA0;
    v51[3] = &unk_1005532B0;
    v51[4] = self;
    id v28 = v27;
    id v52 = v28;
    v29 = obj;
    __int16 v53 = v29;
    id v30 = v25;
    id v54 = v30;
    id v31 = v26;
    id v55 = v31;
    BOOL v58 = v47;
    id v32 = v45;
    id v56 = v32;
    __int16 v57 = buf;
    [v28 performBlockAndWaitWithSave:v51];
    LOBYTE(v47) = (*(unsigned __int8 *)(*(void *)&buf[8] + 24) | v47) != 0;
    if ([v30 count])
    {
      v33 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [(MTSubscriptionSyncProcessor *)self logPrefix];
        id v35 = [v30 count];
        *(_DWORD *)v63 = 138543618;
        id v64 = v34;
        __int16 v65 = 2050;
        id v66 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribing to %{public}lu podcasts from cloud sync", v63, 0x16u);
      }
      [(MTSubscriptionSyncProcessor *)self subscribeFromCloudToPodcasts:v30];
    }
    if ([v31 count])
    {
      id v36 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = [(MTSubscriptionSyncProcessor *)self logPrefix];
        id v38 = [v31 count];
        *(_DWORD *)v63 = 138543618;
        id v64 = v37;
        __int16 v65 = 2050;
        id v66 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@ Unsubscribing %{public}lu podcasts from cloud sync (will be also deleted if they need to)", v63, 0x16u);
      }
      v39 = [(MTSubscriptionSyncProcessor *)self storageProvider];
      id v40 = [v31 allObjects];
      v41 = [(MTSubscriptionSyncProcessor *)self context];
      [v39 disableSubscriptionsWithUuids:v40 ctx:v41];

      -[MTSubscriptionSyncProcessor checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:](self, "checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:", -[MTSubscriptionSyncProcessor initialSubscribedPodcastsCount](self, "initialSubscribedPodcastsCount"), [v31 count], v32);
    }
    [(MTSubscriptionSyncProcessor *)self reorderLocalPodcastsToMatchRemote:v29];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(MTSubscriptionSyncProcessor *)self markAddedSubscriptionsAsSynced];
    v29 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2114;
      id v69 = v46;
      __int16 v70 = 1024;
      BOOL v71 = v47;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Nothing to merge: No data in the cloud node version: [%{public}@] key: %{public}@ mismatch:%d", buf, 0x26u);
    }
  }

  return v47;
}

- (id)podcastCacheInContext:(id)a3
{
  id v4 = a3;
  id v5 = [MTEntityUpdaterCache alloc];
  BOOL v6 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  id v7 = +[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", [v6 syncType]);
  uint64_t v8 = kMTPodcastEntityName;
  v12[0] = kPodcastStoreCollectionId;
  v12[1] = kPodcastFeedUrl;
  v12[2] = kPodcastUuid;
  id v9 = +[NSArray arrayWithObjects:v12 count:3];
  id v10 = [(MTEntityUpdaterCache *)v5 initWithPredicate:v7 entityName:v8 ctx:v4 properties:v9 fetchProperties:0];

  [(MTEntityUpdaterCache *)v10 setAllowKeyForValue:&stru_1005532F0];

  return v10;
}

- (void)importRemotePodcastDicts:(id)a3 inContext:(id)a4 visitingPodcastsInCache:(id)a5 updatingPodcastsToAdd:(id)a6 updatingPodcastsToUnsubscribe:(id)a7 mismatch:(BOOL)a8 version:(id)a9
{
  BOOL v41 = a8;
  id v14 = a3;
  id v45 = a4;
  id v48 = a5;
  id v44 = a6;
  id v43 = a7;
  id v42 = a9;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v14;
  id v49 = [v14 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v49)
  {
    uint64_t v15 = *(void *)v52;
    uint64_t v50 = kPodcastFeedUrl;
    uint64_t v39 = kPodcastTitle;
    uint64_t v38 = kPodcastStoreCollectionId;
    uint64_t v47 = kPodcastUuid;
    id v37 = self;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        int v18 = [v17 objectForKey:v50];
        __int16 v19 = [v48 propertyDictionaryForSearchItem:v17];
        BOOL v20 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [(MTSubscriptionSyncProcessor *)self logPrefix];
          uint64_t v22 = v15;
          if (v19) {
            CFStringRef v23 = @"Found";
          }
          else {
            CFStringRef v23 = @"Didn't find";
          }
          [v17 objectForKey:v39];
          v24 = id v46 = v18;
          id v25 = [v17 objectForKey:v50];
          v26 = [v17 objectForKey:v38];
          id v27 = [v26 unsignedLongLongValue];
          *(_DWORD *)buf = 138544387;
          id v56 = v21;
          __int16 v57 = 2114;
          CFStringRef v58 = v23;
          uint64_t v15 = v22;
          __int16 v59 = 2113;
          long long v60 = v24;
          __int16 v61 = 2113;
          long long v62 = v25;
          __int16 v63 = 2049;
          id v64 = v27;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ local match for podcast \"%{private}@\", %{private}@, %{private}lld", buf, 0x34u);

          self = v37;
          int v18 = v46;
        }
        id v28 = [v19 objectForKeyedSubscript:v47];
        if (v19)
        {
          v29 = [v45 podcastForUuid:v28];
          if (v18) {
            goto LABEL_13;
          }
        }
        else
        {
          v29 = 0;
          if (v18)
          {
LABEL_13:
            BOOL v30 = [(MTSubscriptionSyncProcessor *)self updatePodcastsToUnsubscribe:v43 remotePodcast:v17 localPodcast:v29];
            id v31 = v18;
            BOOL v32 = [(MTSubscriptionSyncProcessor *)self updateSettingsIfNeededForLocalPodcast:v29 remotePodcast:v17];
            BOOL v33 = [(MTSubscriptionSyncProcessor *)self updatePodcastsToAdd:v44 addingPodcastIfNeeded:v17 hasLocalPodcast:v29 != 0];
            BOOL v34 = v32;
            int v18 = v31;
            [(MTSubscriptionSyncProcessor *)self reportImportingRemotePodcast:v17 withLocalPodcast:v29 shouldAddPodcast:v33 shouldUnsubscribeLocalPodcast:v30 shouldUpdateSettings:v34 mismatch:v41 version:v42];
            goto LABEL_18;
          }
        }
        id v35 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = [(MTSubscriptionSyncProcessor *)self logPrefix];
          *(_DWORD *)buf = 138543362;
          id v56 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@ Found podcast in BK with nil feedURL. Can't follow it. Continuing to next one.", buf, 0xCu);
        }
LABEL_18:
      }
      id v49 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v49);
  }
}

- (BOOL)updatePodcastsToUnsubscribe:(id)a3 remotePodcast:(id)a4 localPodcast:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 objectForKey:kPodcastSubscribed];
  unsigned int v12 = [v11 BOOLValue];

  if (v10 && (([v10 subscribed] ^ 1 | v12) & 1) == 0)
  {
    id v14 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      id v16 = [v10 title];
      uint64_t v17 = [v10 feedURL];
      id v18 = [v10 storeCollectionId];
      __int16 v19 = [v10 uuid];
      BOOL v20 = [v9 description];
      int v23 = 138544643;
      v24 = v15;
      __int16 v25 = 2113;
      v26 = v16;
      __int16 v27 = 2113;
      id v28 = v17;
      __int16 v29 = 2049;
      id v30 = v18;
      __int16 v31 = 2114;
      BOOL v32 = v19;
      __int16 v33 = 2113;
      BOOL v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking local podcast for unsubscribe: \"%{private}@\", %{private}@, %{private}lld, %{public}@. Remote dict: %{private}@", (uint8_t *)&v23, 0x3Eu);
    }
    id v21 = [v10 uuid];
    [v8 addObject:v21];

    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)updateSettingsIfNeededForLocalPodcast:(id)a3 remotePodcast:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTSubscriptionSyncProcessor *)self context];
  if (v6) {
    [(MTSubscriptionSyncProcessor *)self updateSettingsForLocalPodcast:v6 remotePodcast:v7 ctx:v8];
  }

  return v6 != 0;
}

- (BOOL)updatePodcastsToAdd:(id)a3 addingPodcastIfNeeded:(id)a4 hasLocalPodcast:(BOOL)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 objectForKey:kPodcastSubscribed];
  unsigned int v11 = [v10 BOOLValue];

  int v12 = v11 & ~v5;
  if (v12 == 1)
  {
    BOOL v13 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      uint64_t v15 = [v9 description];
      int v17 = 138543619;
      id v18 = v14;
      __int16 v19 = 2113;
      BOOL v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking remote podcast for insertion in local DB [reason: not in local DB and subscribed]: %{private}@", (uint8_t *)&v17, 0x16u);
    }
    [v8 addObject:v9];
  }

  return v12;
}

- (void)reportImportingRemotePodcast:(id)a3 withLocalPodcast:(id)a4 shouldAddPodcast:(BOOL)a5 shouldUnsubscribeLocalPodcast:(BOOL)a6 shouldUpdateSettings:(BOOL)a7 mismatch:(BOOL)a8 version:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  id v18 = [(MTSubscriptionSyncProcessor *)self config];
  unsigned int v19 = [v18 supportsMetrics];

  if (v19)
  {
    id v20 = [v15 mutableCopy];
    [v20 setValue:v17 forKey:@"version"];
    id v21 = +[NSNumber numberWithBool:v9];
    [v20 setValue:v21 forKey:@"mismatch"];

    uint64_t v22 = [(MTSubscriptionSyncProcessor *)self syncDictionaryToMetricsDictionary:v15];
    [v20 setValue:v22 forKey:@"sync_data"];

    if (v10)
    {
      v24 = [(MTSubscriptionSyncProcessor *)self storageProvider];
      [v24 recordUserAction:@"cloud_sync_update_podcast" dataSource:v16 withData:v20];

      if (!v11)
      {
LABEL_4:
        if (!v12)
        {
LABEL_6:

          goto LABEL_7;
        }
LABEL_5:
        int v23 = [(MTSubscriptionSyncProcessor *)self storageProvider];
        [v23 recordUserAction:@"cloud_sync_add_podcast" dataSource:0 withData:v20];

        goto LABEL_6;
      }
    }
    else if (!v11)
    {
      goto LABEL_4;
    }
    __int16 v25 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    v28[0] = @"version";
    v28[1] = @"mismatch";
    v29[0] = v17;
    v26 = +[NSNumber numberWithBool:v9];
    v29[1] = v26;
    __int16 v27 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    [v25 recordUserAction:@"cloud_sync_delete_podcast" dataSource:v16 withData:v27];

    if (!v12) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_7:
}

- (id)unvisitedPodcastsToUnsubscribeIn:(id)a3 mismatch:(BOOL *)a4 version:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(MTSubscriptionSyncProcessor *)self context];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10015EDE4;
  v16[3] = &unk_100553318;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = self;
  id v19 = v8;
  id v21 = a4;
  id v10 = (id)objc_opt_new();
  id v20 = v10;
  id v11 = v8;
  id v12 = v17;
  [v9 enumerateUnvisitedItemUuids:v16];

  BOOL v13 = v20;
  id v14 = v10;

  return v14;
}

- (void)checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:(unint64_t)a3 podcastsToUnsubscribeCount:(unint64_t)a4 newVersion:(id)a5
{
  double v8 = (double)a4 / (double)a3;
  id v9 = _MTLogCategoryCloudSync();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a3 >= 0xA && v8 >= 0.8)
  {
    if (v10)
    {
      id v11 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 2048;
      unint64_t v25 = *(void *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Big library unsubscription detected: podcastsToUnsubscribeCount: %lu, unsubscribedRatio: %f", (uint8_t *)&v20, 0x20u);
    }
    id v9 = [(MTSubscriptionSyncProcessor *)self cloudSyncBugReporter];
    id v12 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    id v13 = [v12 syncType];
    id v14 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    id v15 = [v14 syncVersion];
    v28[0] = @"previouslyFollowedShowsCount";
    id v16 = +[NSNumber numberWithUnsignedInteger:a3];
    v29[0] = v16;
    v28[1] = @"showsToUnfollowCount";
    id v17 = +[NSNumber numberWithUnsignedInteger:a4];
    v29[1] = v17;
    void v28[2] = @"unfollowRatio";
    id v18 = +[NSNumber numberWithDouble:v8];
    void v29[2] = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
    [v9 reportSubscriptionsSyncIssue:1 subscriptionSyncType:v13 version:v15 userInfo:v19];

    goto LABEL_8;
  }
  if (v10)
  {
    id v12 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v20 = 138544130;
    id v21 = v12;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    double v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %ld unsubscriptions detected out of %ld total subscribed shows, unsubscriptionRatio: %f", (uint8_t *)&v20, 0x2Au);
LABEL_8:
  }
}

- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5
{
  BOOL v6 = a4;
  double v8 = (__CFString *)a3;
  id v9 = (void (**)(id, BOOL))a5;
  BOOL v10 = _MTLogCategoryCloudSync();
  id v11 = v10;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    CFStringRef v13 = @"NO";
    if (v6) {
      CFStringRef v13 = @"YES";
    }
    int v28 = 138412290;
    uint64_t v29 = (uint64_t)v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.completed", "mismatch %@", (uint8_t *)&v28, 0xCu);
  }

  id v14 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    id v16 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    id v17 = [v16 syncVersion];
    int v28 = 138544130;
    uint64_t v29 = (uint64_t)v15;
    __int16 v30 = 2114;
    CFStringRef v31 = v8;
    __int16 v32 = 2114;
    __int16 v33 = v17;
    __int16 v34 = 1024;
    BOOL v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Transaction complete: Updating sync version to %{public}@ (from %{public}@), mismatch %d", (uint8_t *)&v28, 0x26u);
  }
  id v18 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  [v18 setSyncVersion:v8];

  id v19 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v28 = 138543362;
    uint64_t v29 = (uint64_t)v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Cleaning up old hidden podcasts after successful transaction", (uint8_t *)&v28, 0xCu);
  }
  id v21 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  [v21 cleanUpOldHiddenPodcasts];

  __int16 v22 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    __int16 v24 = (void *)v23;
    CFStringRef v25 = @"NO";
    if (v6) {
      CFStringRef v25 = @"YES";
    }
    int v28 = 138543618;
    uint64_t v29 = v23;
    __int16 v30 = 2114;
    CFStringRef v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting subscriptions sync dirty = %{public}@", (uint8_t *)&v28, 0x16u);
  }
  __int16 v26 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  [v26 setSyncDirtyFlag:v6];

  if (!v6)
  {
    double v27 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    [v27 updateSubscriptionsLastSyncTimestamp];
  }
  v9[2](v9, v6);
}

- (void)reorderLocalPodcastsToMatchRemote:(id)a3
{
  id v4 = a3;
  int v5 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Reordering local podcasts to match remote dictionaries:", buf, 0xCu);
  }
  [(MTSubscriptionSyncProcessor *)self context];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015F9E8;
  v9[3] = &unk_10054E708;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = v10;
  [v8 performBlockAndWaitWithSave:v9];
}

- (id)syncDictionaryToMetricsDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() subscriptionSyncProcessorSyncKeys];
  int v5 = [v3 dictionaryWithValuesForKeys:v4];

  return v5;
}

- (id)_addedSubscriptions
{
  id v3 = [(MTSubscriptionSyncProcessor *)self context];
  id v4 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  int v5 = +[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", [v4 syncType]);
  BOOL v6 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPodcastFeedUrl];
  id v7 = [v5 AND:v6];
  id v8 = +[MTPodcast predicateForHasBeenSynced:0];
  id v9 = [v7 AND:v8];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100160084;
  v16[3] = &unk_10054DFE8;
  id v17 = v3;
  id v18 = v9;
  id v19 = self;
  id v10 = (id)objc_opt_new();
  id v20 = v10;
  id v11 = v9;
  id v12 = v3;
  [v12 performBlockAndWait:v16];
  CFStringRef v13 = v20;
  id v14 = v10;

  return v14;
}

- (unint64_t)_subscribedPodcastsCount
{
  id v3 = [(MTSubscriptionSyncProcessor *)self context];
  id v4 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  int v5 = +[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", [v4 syncType]);
  BOOL v6 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPodcastFeedUrl];
  id v7 = [v5 AND:v6];
  id v8 = +[MTPodcast predicateForSubscribedPodcasts];
  id v9 = [v7 AND:v8];

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100160470;
  v14[3] = &unk_10054E280;
  id v17 = &v18;
  id v10 = v3;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  [v10 performBlockAndWait:v14];
  unint64_t v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void)markAddedSubscriptionsAsSynced
{
  id v3 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v5 = [(MTSubscriptionSyncProcessor *)self addedSubscriptions];
    int v8 = 138543619;
    id v9 = v4;
    __int16 v10 = 2113;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking new subscriptions as synced: %{private}@", (uint8_t *)&v8, 0x16u);
  }
  BOOL v6 = [(MTSubscriptionSyncProcessor *)self addedSubscriptions];
  id v7 = +[MTPodcast predicateForPodcastUuids:v6];

  [(MTSubscriptionSyncProcessor *)self markShowsAsSyncedForPredicate:v7];
}

- (void)markAllShowsAsSynced
{
  id v3 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    int v7 = 138543362;
    int v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking all shows as synced", (uint8_t *)&v7, 0xCu);
  }
  int v5 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  BOOL v6 = +[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", [v5 syncType]);

  [(MTSubscriptionSyncProcessor *)self markShowsAsSyncedForPredicate:v6];
}

- (void)markShowsAsSyncedForPredicate:(id)a3
{
  id v4 = a3;
  [(MTSubscriptionSyncProcessor *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100160790;
  v7[3] = &unk_10054D9B0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlockAndWaitWithSave:v7];
}

- (id)_podcastSubscriptions
{
  [(MTSubscriptionSyncProcessor *)self context];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100160A08;
  v10[3] = &unk_10054E708;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = self;
  id v3 = (id)objc_opt_new();
  id v13 = v3;
  id v4 = v11;
  [v4 performBlockAndWait:v10];
  if (![v3 count])
  {
    id v5 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ WARNING: Syncing up an empty podcast library", buf, 0xCu);
    }
  }
  int v7 = v13;
  id v8 = v3;

  return v8;
}

- (void)subscribeFromCloudToPodcasts:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSubscriptionSyncProcessor *)self context];
  id v6 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  [v6 subscriptionsLastSyncTimestamp];
  uint64_t v8 = v7;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100160F90;
  v11[3] = &unk_100550210;
  id v12 = v4;
  id v13 = self;
  id v14 = v5;
  uint64_t v15 = v8;
  id v9 = v5;
  id v10 = v4;
  [v9 performBlockAndWaitWithSave:v11];
}

- (void)updateSettingsForLocalPodcast:(id)a3 remotePodcast:(id)a4 ctx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v89 = a5;
  id v9 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(MTSubscriptionSyncProcessor *)self logPrefix];
    id v11 = [v7 title];
    id v12 = [v7 feedURL];
    id v13 = [v7 storeCollectionId];
    id v14 = [v7 uuid];
    uint64_t v15 = [v8 description];
    *(_DWORD *)buf = 138544643;
    v94 = v10;
    __int16 v95 = 2113;
    id v96 = v11;
    __int16 v97 = 2113;
    v98 = v12;
    __int16 v99 = 2049;
    id v100 = v13;
    __int16 v101 = 2114;
    id v102 = v14;
    __int16 v103 = 2113;
    id v104 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating settings for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@. Remote dictionary: %{private}@", buf, 0x3Eu);
  }
  [v7 setHasBeenSynced:1];
  id v16 = [v8 objectForKey:kPodcastSubscribed];
  unsigned int v17 = [v16 BOOLValue];

  unsigned int v18 = [v7 subscribed];
  if ((v18 & 1) != 0 || !v17)
  {
    if ((v18 ^ 1 | v17)) {
      goto LABEL_12;
    }
    CFStringRef v25 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      int v28 = [v7 title];
      uint64_t v29 = [v7 feedURL];
      id v30 = [v7 storeCollectionId];
      CFStringRef v31 = [v7 uuid];
      *(_DWORD *)buf = 138544387;
      v94 = v27;
      __int16 v95 = 2113;
      id v96 = v28;
      __int16 v97 = 2113;
      v98 = v29;
      __int16 v99 = 2049;
      id v100 = v30;
      __int16 v101 = 2114;
      id v102 = v31;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping unsubscription of remotely unsubscribed podcast [reason: all unsubscriptions should be handled in batch later in the process]: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x34u);
    }
  }
  else
  {
    id v19 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      uint64_t v21 = [v7 title];
      __int16 v22 = [v7 feedURL];
      id v23 = [v7 storeCollectionId];
      __int16 v24 = [v7 uuid];
      *(_DWORD *)buf = 138544387;
      v94 = v20;
      __int16 v95 = 2113;
      id v96 = v21;
      __int16 v97 = 2113;
      v98 = v22;
      __int16 v99 = 2049;
      id v100 = v23;
      __int16 v101 = 2114;
      id v102 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Enabling subscription for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x34u);
    }
    CFStringRef v25 = [(MTSubscriptionSyncProcessor *)self storageProvider];
    __int16 v26 = [v7 uuid];
    [v25 enableSubscriptionOnPodcastUuid:v26 ctx:v89];
  }
LABEL_12:
  __int16 v32 = [v8 objectForKeyedSubscript:kPodcastShowTypeSetting];
  __int16 v33 = v32;
  if (v32)
  {
    __int16 v34 = v32;
    id v35 = [v32 longLongValue];
    id v36 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      uint64_t v38 = [v7 title];
      uint64_t v39 = [v7 feedURL];
      id v40 = [v7 storeCollectionId];
      BOOL v41 = [v7 uuid];
      *(_DWORD *)buf = 138544643;
      v94 = v37;
      __int16 v95 = 2050;
      id v96 = v35;
      __int16 v97 = 2113;
      v98 = v38;
      __int16 v99 = 2113;
      id v100 = v39;
      __int16 v101 = 2049;
      id v102 = v40;
      __int16 v103 = 2114;
      id v104 = v41;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscriptions Sync wants to set show type setting to %{public}lld, for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x3Eu);
    }
    [v7 setShowTypeSetting:v35];
    __int16 v33 = v34;
  }
  v92 = [v8 objectForKey:kPodcastLastTouchDate];
  id v42 = [v8 objectForKey:kPodcastDarkCount];
  if (v42)
  {
    if (v92)
    {
      [v7 lastTouchDate];
      id v43 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v44 = [v43 compare:v92];

      if (v44 == (id)-1)
      {
        unint64_t v45 = (unint64_t)[v7 isDark];
        id v46 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = [(MTSubscriptionSyncProcessor *)self logPrefix];
          id v84 = [v42 longLongValue];
          [v7 title];
          id v48 = v87 = v45;
          id v49 = [v7 feedURL];
          id v50 = [v7 storeCollectionId];
          long long v51 = [v7 uuid];
          *(_DWORD *)buf = 138544643;
          v94 = v47;
          __int16 v95 = 2050;
          id v96 = v84;
          __int16 v97 = 2113;
          v98 = v48;
          __int16 v99 = 2113;
          id v100 = v49;
          __int16 v101 = 2049;
          id v102 = v50;
          __int16 v103 = 2114;
          id v104 = v51;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting darkCount = %{public}lld for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x3Eu);

          unint64_t v45 = v87;
        }

        [v7 setDarkCount:[v42 longLongValue]];
        if (v45 != [v7 isDark])
        {
          id v52 = (id)v45;
          id v53 = [v7 isDark];
          long long v54 = [v7 latestExitFromDarkDownloads];
          if (v54)
          {
            id v55 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v52 isDark:v53 reason:6 previousExit:v54];
          }
          else
          {
            id v56 = +[NSDate now];
            id v55 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v52 isDark:v53 reason:6 previousExit:v56];
          }
          __int16 v57 = objc_opt_new();
          [v57 sendEvent:v55];
        }
      }
    }
  }
  CFStringRef v58 = [v7 feedURL];
  uint64_t v59 = kPodcastFeedUrl;
  long long v60 = [v8 objectForKeyedSubscript:kPodcastFeedUrl];
  unsigned __int8 v61 = [v58 isEqualToString:v60];

  if ((v61 & 1) == 0)
  {
    long long v62 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v63 = [(MTSubscriptionSyncProcessor *)self logPrefix];
      id v64 = [v8 objectForKeyedSubscript:v59];
      __int16 v65 = [v7 title];
      id v66 = [v7 feedURL];
      id v85 = v8;
      v67 = v42;
      id v68 = [v7 storeCollectionId];
      [v7 uuid];
      id v69 = v88 = v33;
      *(_DWORD *)buf = 138544643;
      v94 = v63;
      __int16 v95 = 2113;
      id v96 = v64;
      __int16 v97 = 2113;
      v98 = v65;
      __int16 v99 = 2113;
      id v100 = v66;
      __int16 v101 = 2049;
      id v102 = v68;
      id v42 = v67;
      id v8 = v85;
      __int16 v103 = 2114;
      id v104 = v69;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting feedURL = %{private}@ for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x3Eu);

      __int16 v33 = v88;
    }

    __int16 v70 = [v8 objectForKeyedSubscript:v59];
    [v7 setFeedURL:v70];
  }
  BOOL v71 = [v8 objectForKeyedSubscript:kPodcastAddedDate];
  v72 = v71;
  if (v71)
  {
    [v71 timeIntervalSinceReferenceDate];
    double v74 = v73;
    [v7 addedDate];
    if (v74 < v75)
    {
      v76 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v77 = [(MTSubscriptionSyncProcessor *)self logPrefix];
        [v72 timeIntervalSinceReferenceDate];
        v79 = v78;
        v91 = [v72 description];
        v80 = [v7 title];
        v81 = [v7 feedURL];
        id v82 = [v7 storeCollectionId];
        [v7 uuid];
        v83 = v86 = v42;
        *(_DWORD *)buf = 138544899;
        v94 = v77;
        __int16 v95 = 2050;
        id v96 = v79;
        __int16 v97 = 2114;
        v98 = v91;
        __int16 v99 = 2113;
        id v100 = v80;
        __int16 v101 = 2113;
        id v102 = v81;
        __int16 v103 = 2049;
        id v104 = v82;
        __int16 v105 = 2114;
        v106 = v83;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting addedDate = %{public}f(%{public}@) for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x48u);

        id v42 = v86;
      }

      [v72 timeIntervalSinceReferenceDate];
      [v7 setAddedDate:];
    }
  }
}

- (id)logPrefix
{
  v2 = [(MTSubscriptionSyncProcessor *)self storageProvider];
  id v3 = [v2 syncType];

  if (v3 == (id)1) {
    return @"[Subscription V3 Sync]";
  }
  else {
    return @"[Subscription Sync]";
  }
}

- (NSMutableSet)addedSubscriptions
{
  return self->_addedSubscriptions;
}

- (void)setAddedSubscriptions:(id)a3
{
}

- (MTSubscriptionSyncProcessorConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (MTSubscriptionSyncStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
}

- (unint64_t)initialSubscribedPodcastsCount
{
  return self->_initialSubscribedPodcastsCount;
}

- (void)setInitialSubscribedPodcastsCount:(unint64_t)a3
{
  self->_initialSubscribedPodcastsCount = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_addedSubscriptions, 0);
}

@end