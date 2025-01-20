@interface MTEpisodeSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)requiresNextGetTransaction;
- (MTEpisodeSyncProcessor)initWithStorageProvider:(id)a3;
- (MTEpisodeSyncProcessorStorageProviding)storageProvider;
- (double)_sanitisedTimeIntervalForObject:(id)a3;
- (id)_propertiesToFetch;
- (id)_searchDictionaryFromArray:(id)a3 withKey:(id)a4;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)predicateForFilteringEpisodesWithEmptyPlayState;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)completeTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)mergeData:(id)a3 forKey:(id)a4;
- (void)recalculateUpNextForShowWithFeedUrl:(id)a3;
- (void)rescheduleTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
- (void)unsafeUpdateEpisode:(id)a3 forRemoteEpisodeDictionary:(id)a4;
@end

@implementation MTEpisodeSyncProcessor

- (MTEpisodeSyncProcessor)initWithStorageProvider:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTEpisodeSyncProcessor;
  v5 = [(MTEpisodeSyncProcessor *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(MTEpisodeSyncProcessor *)v5 setStorageProvider:v4];
    v7 = _MTLogCategoryCloudSync();
    v6->_os_signpost_id_t signpostID = os_signpost_id_generate(v7);

    v8 = _MTLogCategoryCloudSync();
    v9 = v8;
    os_signpost_id_t signpostID = v6->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, signpostID, "MTEpisodeSyncProcessor.created", "", v12, 2u);
    }
  }
  return v6;
}

- (int64_t)operationTypeForSET
{
  return 7;
}

- (BOOL)hasLocalChanges
{
  return 0;
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
    int v13 = 138412290;
    id v14 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTEpisodeSyncProcessor.GET", "key: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = [(MTEpisodeSyncProcessor *)self storageProvider];
  v10 = [v9 versionForKey:v5];

  v11 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v5;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Episode Sync] key: %{public}@, version: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = _MTLogCategoryCloudSync();
  v11 = v10;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTEpisodeSyncProcessor.SET", "key: %@", (uint8_t *)&buf, 0xCu);
  }

  int v13 = [(MTEpisodeSyncProcessor *)self storageProvider];
  id v14 = [v13 importContext];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  v35 = sub_1000571A8;
  v36 = sub_100057390;
  id v37 = +[NSMutableArray array];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100164E90;
  v26 = &unk_10054E080;
  v27 = self;
  id v15 = v9;
  id v28 = v15;
  id v16 = v14;
  id v29 = v16;
  p_long long buf = &buf;
  [v16 performBlockAndWait:&v23];
  v17 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v31 = 138543362;
    uint64_t v32 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Syncing Episodes: %{public}@", v31, 0xCu);
  }

  if (objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count", v23, v24, v25, v26, v27))
  {
    v19 = [(MTEpisodeSyncProcessor *)self storageProvider];
    *a5 = [v19 versionForKey:v15];

    v20 = objc_alloc_init(MZKeyValueStoreNode);
    [(MZKeyValueStoreNode *)v20 setArrayValue:*(void *)(*((void *)&buf + 1) + 40)];
    v21 = [(MZKeyValueStoreNode *)v20 value];
  }
  else
  {
    v21 = 0;
  }

  _Block_object_dispose(&buf, 8);

  return v21;
}

- (id)predicateForFilteringEpisodesWithEmptyPlayState
{
  v2 = +[MTEpisode predicateForPlayStateManuallySet:1];
  v3 = +[MTEpisode predicateForBacklog:0];
  id v4 = [v2 AND:v3];
  id v5 = +[MTEpisode predicateForNilLastDatePlayed];
  v6 = [v4 AND:v5];
  v7 = +[MTEpisode predicateForNilLastUserMarkedAsPlayedDate];
  id v8 = [v6 AND:v7];

  id v9 = +[MTEpisode predicateForNonNilLastDatePlayed];
  v10 = +[MTEpisode predicateForNonNilLastUserMarkedAsPlayedDate];
  v11 = [v9 OR:v10];
  v12 = [v11 OR:v8];

  return v12;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = [(MTEpisodeSyncProcessor *)self storageProvider];
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  id v15 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = v12;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Successful GET transaction [%{public}@] key: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  [(MTEpisodeSyncProcessor *)self mergeData:v14 forKey:v11];
  [(MTEpisodeSyncProcessor *)self completeTransactionWithNewVersion:v12 key:v11 finishedBlock:v13];
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Successful SET transaction [%{public}@] key: %{public}@ mismatch:NO", (uint8_t *)&v14, 0x16u);
  }

  [(MTEpisodeSyncProcessor *)self completeTransactionWithNewVersion:v11 key:v10 finishedBlock:v12];
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  id v15 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = v12;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Conflict for SET transaction [%{public}@] key: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  [(MTEpisodeSyncProcessor *)self mergeData:v14 forKey:v11];
  [(MTEpisodeSyncProcessor *)self rescheduleTransactionWithNewVersion:v12 key:v11 finishedBlock:v13];
}

- (void)completeTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = _MTLogCategoryCloudSync();
  id v12 = v11;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.completed", "", (uint8_t *)&v19, 2u);
  }

  id v14 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Completing transaction [%{public}@] key: %{public}@", (uint8_t *)&v19, 0x16u);
  }

  id v15 = [(MTEpisodeSyncProcessor *)self storageProvider];
  [v15 setVersion:v8 forKey:v9];

  v10[2](v10, 0);
  int v16 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Completing transaction [%{public}@] key: %{public}@, now reculating Up Next", (uint8_t *)&v19, 0x16u);
  }

  id v17 = [(MTEpisodeSyncProcessor *)self storageProvider];
  __int16 v18 = [v17 feedUrlFromModernKey:v9];

  [(MTEpisodeSyncProcessor *)self recalculateUpNextForShowWithFeedUrl:v18];
}

- (void)rescheduleTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = _MTLogCategoryCloudSync();
  id v12 = v11;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.mismatch", "", (uint8_t *)&v16, 2u);
  }

  id v14 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Rescheduling SET transaction after solving conflict [%{public}@] key: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  id v15 = [(MTEpisodeSyncProcessor *)self storageProvider];
  [v15 setVersion:v8 forKey:v9];

  v10[2](v10, 1);
}

- (void)mergeData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MZKeyValueStoreNode);
  [(MZKeyValueStoreNode *)v8 setKey:v7];
  [(MZKeyValueStoreNode *)v8 setValue:v6];
  if ([(MZKeyValueStoreNode *)v8 hasData])
  {
    id v9 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Merging data for key %{public}@", buf, 0xCu);
    }

    id v11 = [(MZKeyValueStoreNode *)v8 arrayValue];
    id v12 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Getting Episodes: %{public}@", buf, 0xCu);
    }

    id v13 = [(MTEpisodeSyncProcessor *)self _searchDictionaryFromArray:v11 withKey:kEpisodeGuid];
    id v14 = [(MTEpisodeSyncProcessor *)self _searchDictionaryFromArray:v11 withKey:kEpisodeMetadataIdentifier];

    id v15 = [(MTEpisodeSyncProcessor *)self storageProvider];
    int v16 = [v15 importContext];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100165E70;
    v20[3] = &unk_10054FE58;
    v20[4] = self;
    id v21 = v7;
    id v22 = v16;
    id v23 = v13;
    id v24 = v14;
    id v17 = v14;
    id v18 = v13;
    id v19 = v16;
    [v19 performBlockAndWait:v20];
  }
}

- (void)unsafeUpdateEpisode:(id)a3 forRemoteEpisodeDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 metadataTimestamp];
  double v9 = v8;
  uint64_t v10 = kEpisodePlayStateManuallySet;
  id v11 = [v7 objectForKey:kEpisodePlayStateManuallySet];

  if (v11)
  {
    id v12 = [v7 objectForKey:v10];
    id v13 = [v12 BOOLValue];

    id v14 = [v6 backCatalog];
    [v6 setPlayState:[v6 playState] manually:v13 source:4];
    [v6 setBackCatalog:v14];
  }
  uint64_t v15 = kEpisodeIsNew;
  int v16 = [v7 objectForKey:kEpisodeIsNew];

  if (v16)
  {
    id v17 = [v7 objectForKey:v15];
    unsigned __int8 v18 = [v17 BOOLValue];

    if ((v18 & 1) == 0) {
      [v6 setIsNew:0];
    }
  }
  uint64_t v19 = kEpisodeLastDatePlayed;
  id v20 = [v7 objectForKey:kEpisodeLastDatePlayed];

  if (v20)
  {
    id v21 = [v7 objectForKey:v19];
    [(MTEpisodeSyncProcessor *)self _sanitisedTimeIntervalForObject:v21];
    double v23 = v22;

    [v6 lastDatePlayed];
    if (v23 > v24)
    {
      v25 = +[FutureDateChecker sharedInstance];
      id v26 = [v25 isFutureWithTimestamp:v23];

      v27 = _MTLogCategoryUPPSync();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [v6 title];
        id v29 = [v6 uuid];
        id v30 = [v6 storeTrackId];
        v31 = [v6 metadataIdentifier];
        [v6 lastDatePlayed];
        uint64_t v33 = v32;
        uint64_t v34 = +[NSNumber numberWithBool:v26];
        int v41 = 138544899;
        v42 = v28;
        __int16 v43 = 2114;
        v44 = v29;
        __int16 v45 = 2049;
        id v46 = v30;
        __int16 v47 = 2114;
        v48 = v31;
        __int16 v49 = 2050;
        uint64_t v50 = v33;
        __int16 v51 = 2050;
        double v52 = v23;
        __int16 v53 = 2114;
        v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Changing last date played for %{public}@, %{public}@, %{private}lld, %{public}@, from %{public}lf to %{public}lf. Is future: %{public}@", (uint8_t *)&v41, 0x48u);
      }
      [v6 setLastDatePlayed:v23];
    }
  }
  uint64_t v35 = kEpisodeLastUserMarkedAsPlayedDate;
  v36 = [v7 objectForKey:kEpisodeLastUserMarkedAsPlayedDate];

  if (v36)
  {
    id v37 = [v7 objectForKey:v35];
    [v37 doubleValue];
    double v39 = v38;

    [v6 lastUserMarkedAsPlayedDate];
    if (v39 > v40) {
      [v6 setLastUserMarkedAsPlayedDate:v39];
    }
  }
  [v6 setMetadataTimestamp:v9];
}

- (void)recalculateUpNextForShowWithFeedUrl:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 privateQueueContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100166650;
  v8[3] = &unk_10054D9B0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (double)_sanitisedTimeIntervalForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
LABEL_5:
    double v5 = v4;
    goto LABEL_6;
  }
  objc_opt_class();
  double v5 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 timeIntervalSinceReferenceDate];
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

- (id)_searchDictionaryFromArray:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v13 objectForKey:v6];
        if (v14) {
          [v7 setObject:v13 forKey:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_propertiesToFetch
{
  v4[0] = kEpisodeGuid;
  v4[1] = kEpisodeMetadataIdentifier;
  v4[2] = kEpisodeMetadataTimestamp;
  v4[3] = kEpisodeBackCatalog;
  v4[4] = kEpisodePlayState;
  v4[5] = kEpisodeDownloadBehavior;
  v4[6] = kEpisodeIsNew;
  v4[7] = kEpisodePlayhead;
  v4[8] = kEpisodePlayStateManuallySet;
  v4[9] = kEpisodeLastUserMarkedAsPlayedDate;
  v4[10] = kEpisodePodcast;
  v4[11] = kEpisodeLastDatePlayed;
  v2 = +[NSArray arrayWithObjects:v4 count:12];

  return v2;
}

- (MTEpisodeSyncProcessorStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end