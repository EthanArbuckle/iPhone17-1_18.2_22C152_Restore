@interface MTUniversalPlaybackPositionDataSource
+ (double)uppLastSyncTime;
+ (id)mediaItemIdentifierForEpisode:(id)a3;
+ (void)resetUppLastSyncTimeAndDomainVersion;
+ (void)setUppLastSyncTime:(double)a3;
+ (void)updateEpisode:(id)a3 withUPPMetadata:(id)a4;
- (NSMutableArray)episodeObservers;
- (id)_metricsDateFormatter;
- (id)beginTransactionWithItemsToSyncEnumerationBlock:(id)a3;
- (void)addEpisodeObserver:(id)a3;
- (void)commitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5;
- (void)performBlockAndWait:(id)a3;
- (void)removeEpisodeObserver:(id)a3;
- (void)setEpisodeObservers:(id)a3;
@end

@implementation MTUniversalPlaybackPositionDataSource

+ (double)uppLastSyncTime
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 doubleForKey:kMTLibraryUppLastSyncTimeKey];
  double v4 = v3;

  return v4;
}

- (void)addEpisodeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(MTUniversalPlaybackPositionDataSource *)self episodeObservers];

  if (!v5)
  {
    v6 = +[NSMutableArray array];
    [(MTUniversalPlaybackPositionDataSource *)self setEpisodeObservers:v6];
  }
  id v7 = [(MTUniversalPlaybackPositionDataSource *)self episodeObservers];
  [v7 addObject:v4];
}

- (NSMutableArray)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
}

+ (id)mediaItemIdentifierForEpisode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MTUniversalPlaybackPositionMediaItem);
  [(MTUniversalPlaybackPositionMediaItem *)v4 setEpisode:v3];

  v5 = +[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:v4];

  return v5;
}

- (void)performBlockAndWait:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[MTDB sharedInstance];
    id v5 = [v4 importContext];

    [v5 performBlockAndWait:v3];
  }
}

- (id)beginTransactionWithItemsToSyncEnumerationBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MTUniversalPlaybackPositionTransactionContext);
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  -[MTUniversalPlaybackPositionTransactionContext setSyncStartTime:](v4, "setSyncStartTime:");

  if (v3)
  {
    v6 = +[MTDB sharedInstance];
    id v7 = [v6 importContext];

    v8 = +[MTBaseProcessor sharedInstance];
    v9 = [v8 predicate];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D0D04;
    v13[3] = &unk_100550960;
    id v14 = v7;
    id v15 = v9;
    id v17 = v3;
    v16 = v4;
    id v10 = v9;
    id v11 = v7;
    [v11 performBlockAndWaitWithSave:v13];
  }

  return v4;
}

- (id)_metricsDateFormatter
{
  if (qword_10060A7C0 != -1) {
    dispatch_once(&qword_10060A7C0, &stru_100550980);
  }
  v2 = (void *)qword_10060A7B8;

  return v2;
}

- (void)commitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = self;
    id v34 = v9;
    id v11 = +[MTUniversalPlaybackPositionTransactionContext UPPDomainVersion];
    BOOL v32 = [v11 length] != 0;

    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v13 = v12;
    id v14 = v8;
    id v15 = +[MTDB sharedInstance];
    v31 = [v15 importContext];

    id v16 = objc_alloc_init((Class)NSMutableArray);
    id v17 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v18 = v10[2](v10);
    if (v18)
    {
      v19 = (void *)v18;
      do
      {
        [v16 addObject:v19, v31];
        v20 = [v14 mediaItems];
        v21 = [v19 itemIdentifier];
        v22 = [v20 objectForKey:v21];

        if (!v22)
        {
          v23 = [v19 itemIdentifier];
          [v17 addObject:v23];
        }
        uint64_t v24 = v10[2](v10);

        v19 = (void *)v24;
      }
      while (v24);
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000D1654;
    v37[3] = &unk_1005509A8;
    id v25 = v31;
    id v38 = v25;
    id v39 = v17;
    id v40 = v16;
    id v41 = v14;
    v42 = v33;
    BOOL v44 = v32;
    uint64_t v43 = v13;
    id v26 = v14;
    id v27 = v16;
    v28 = v17;
    [v25 performBlockAndWaitWithSave:v37];
    v29 = objc_opt_class();
    [v26 syncStartTime];
    [v29 setUppLastSyncTime:];
    id v9 = v34;
    [(id)objc_opt_class() setUPPDomainVersion:v34];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000D2434;
    v35[3] = &unk_10054D570;
    id v36 = v25;
    id v30 = v25;
    [v30 performBlockAndWait:v35];
  }
  else
  {
    v28 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = v8;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Ran into unexpected transaction {%{public}@} -- BailingOut", buf, 0xCu);
    }
  }
}

- (void)removeEpisodeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MTUniversalPlaybackPositionDataSource *)self episodeObservers];
  [v5 removeObject:v4];
}

+ (void)updateEpisode:(id)a3 withUPPMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _MTLogCategoryUPPSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 title];
    id v9 = [v5 uuid];
    CFStringRef v10 = (const __CFString *)[v5 storeTrackId];
    id v11 = [v5 metadataIdentifier];
    *(_DWORD *)id v25 = 138479107;
    *(void *)&v25[4] = v8;
    __int16 v26 = 2114;
    int64_t v27 = (int64_t)v9;
    __int16 v28 = 2049;
    CFStringRef v29 = v10;
    __int16 v30 = 2114;
    id v31 = v11;
    __int16 v32 = 2050;
    id v33 = [v5 playState];
    __int16 v34 = 2114;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating episode \"%{private}@\", %{public}@, %{private}lld, %{public}@, current playState: %{public}lld\nwith UPP metadata: %{public}@", v25, 0x3Eu);
  }
  id v12 = [v6 playCount];
  int64_t v13 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:](MTLibraryLegacyUtil, "playStateFromHasBeenPlayed:andPlayCount:", [v6 hasBeenPlayed], v12);
  id v14 = [v5 playState];
  unsigned int v15 = [v5 isBackCatalogItem];
  if ((uint64_t)v12 > 0) {
    unsigned int v16 = v15;
  }
  else {
    unsigned int v16 = 0;
  }
  id v17 = _MTLogCategoryUPPSync();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if ((id)v13 != v14 || v16)
  {
    if (v18)
    {
      id v23 = [v5 playState];
      *(_DWORD *)id v25 = 134349312;
      *(void *)&v25[4] = v23;
      __int16 v26 = 2050;
      int64_t v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UPP Updating playState from %{public}lld to %{public}lld", v25, 0x16u);
    }

    [v5 setPlayState:v13 manually:0 source:3];
  }
  else
  {
    if (v18)
    {
      id v19 = [v5 playState];
      if ([v5 playStateManuallySet]) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      unsigned int v21 = [v5 backCatalog];
      *(_DWORD *)id v25 = 134349826;
      if (v21) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      *(void *)&v25[4] = v19;
      __int16 v26 = 2112;
      int64_t v27 = (int64_t)v20;
      __int16 v28 = 2112;
      CFStringRef v29 = v22;
      __int16 v30 = 2048;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UPP NOT Updating playState because it was already %{public}lld, playStateManuallySet: %@, backCatalog: %@. Remote UPP playCount: %lld", v25, 0x2Au);
    }
  }
  [v6 bookmarkTime:v25];
  *(float *)&double v24 = v24;
  [v5 setPlayhead:v24];
  [v5 setPlayCount:v12];
  [v5 pubDate];
  [v5 setImportDate:];
  [v6 timestamp];
  [v5 setMetadataTimestamp:];
  [v5 setMetadataFirstSyncEligible:0];
}

+ (void)resetUppLastSyncTimeAndDomainVersion
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:kMTLibraryUppLastSyncTimeKey];

  +[MTUniversalPlaybackPositionTransactionContext setUPPDomainVersion:0];
  id v3 = +[MTBaseProcessor sharedInstance];
  [v3 updatePredicate];
}

+ (void)setUppLastSyncTime:(double)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setDouble:kMTLibraryUppLastSyncTimeKey forKey:a3];

  id v5 = +[MTBaseProcessor sharedInstance];
  [v5 updatePredicate];
}

- (void).cxx_destruct
{
}

@end