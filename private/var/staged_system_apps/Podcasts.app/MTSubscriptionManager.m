@interface MTSubscriptionManager
- (BOOL)_addEpisode:(id)a3 toMyEpisodesInPodcast:(id)a4 persist:(BOOL)a5;
- (BOOL)_addLatestSeasonForSerialPodcast:(id)a3;
- (BOOL)_addLatestSeasonToPodcast:(id)a3;
- (BOOL)_addNewestEpisodeToPodcast:(id)a3;
- (BOOL)isSubscribingToPodcastWithStoreCollectionID:(int64_t)a3;
- (MTFeedManager)feedManager;
- (MTSubscriptionManager)init;
- (NSMutableDictionary)feedUrlsToParams;
- (NSMutableSet)currentlySubscribingStoreCollectionIds;
- (_TtC18PodcastsFoundation15FeedURLComposer)feedURLComposer;
- (_TtC18PodcastsFoundation28AddingPodcastStateDataSource)podcastStateDataSource;
- (id)preProcessFeedHookWithParams:(id)a3 feed:(id)a4 requestUrl:(id)a5 needsUpdate:(BOOL)a6 ctx:(id)a7;
- (id)subscribeParamsForFeedUrl:(id)a3;
- (void)_feedUpdateAndSubscribeToPodcast:(id)a3 feedUrl:(id)a4 adamId:(int64_t)a5;
- (void)addSubscribeParams:(id)a3 forFeedUrl:(id)a4;
- (void)feedDownloadedWithParams:(id)a3 error:(id)a4 task:(id)a5;
- (void)postProcessFeedHookWithParams:(id)a3 podcastUuid:(id)a4 ctx:(id)a5;
- (void)removeSubscribeParamsForFeedUrl:(id)a3;
- (void)showSubscriptionFailureDialog:(id)a3 error:(id)a4;
- (void)subscribeToPodcastWithParams:(id)a3;
@end

@implementation MTSubscriptionManager

- (MTSubscriptionManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTSubscriptionManager;
  v2 = [(MTSubscriptionManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[MTFeedManager sharedInstance];
    feedManager = v2->_feedManager;
    v2->_feedManager = (MTFeedManager *)v3;

    v5 = (_TtC18PodcastsFoundation15FeedURLComposer *)objc_alloc_init((Class)_TtC18PodcastsFoundation15FeedURLComposer);
    feedURLComposer = v2->_feedURLComposer;
    v2->_feedURLComposer = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    feedUrlsToParams = v2->_feedUrlsToParams;
    v2->_feedUrlsToParams = v7;

    uint64_t v9 = objc_opt_new();
    currentlySubscribingStoreCollectionIds = v2->_currentlySubscribingStoreCollectionIds;
    v2->_currentlySubscribingStoreCollectionIds = (NSMutableSet *)v9;

    uint64_t v11 = objc_opt_new();
    podcastStateDataSource = v2->_podcastStateDataSource;
    v2->_podcastStateDataSource = (_TtC18PodcastsFoundation28AddingPodcastStateDataSource *)v11;
  }
  return v2;
}

- (_TtC18PodcastsFoundation28AddingPodcastStateDataSource)podcastStateDataSource
{
  return self->_podcastStateDataSource;
}

- (id)preProcessFeedHookWithParams:(id)a3 feed:(id)a4 requestUrl:(id)a5 needsUpdate:(BOOL)a6 ctx:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v13 hasEpisodes]) {
    goto LABEL_5;
  }
  v16 = [v13 title];
  if (v16)
  {

    goto LABEL_5;
  }
  v17 = [v13 author];

  if (v17)
  {
LABEL_5:
    if ([v13 isNotSubscribable])
    {
      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      CFStringRef v53 = @"The feed is not subscribable.";
      v18 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      v19 = +[NSError errorWithDomain:@"com.apple.podcasts.MTSubscriptionManager" code:103 userInfo:v18];

      [(MTSubscriptionManager *)self showSubscriptionFailureDialog:v12 error:v19];
      v20 = [v12 completion];

      if (v20)
      {
        v21 = [v12 completion];
        v21[2](v21, 0);
      }
      id v22 = +[MTFeedUpdatePreProcessResult shouldNotContinueResult];
    }
    else
    {
      v23 = [v13 resolvedFeedURL];
      v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = [v14 absoluteString];
      }
      v26 = v25;

      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = sub_1000571C8;
      v50 = sub_1000573A0;
      id v51 = 0;
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472;
      v39 = sub_100169C70;
      v40 = &unk_100553528;
      id v41 = v15;
      id v27 = v26;
      id v42 = v27;
      id v43 = v13;
      id v28 = v12;
      id v44 = v28;
      v45 = &v46;
      [v41 performBlockAndWaitWithSave:&v37];
      v29 = [v28 completion:v37, v38, v39, v40];

      if (v29)
      {
        v30 = [v28 completion];
        v30[2](v30, 1);
      }
      id v31 = objc_alloc((Class)MTFeedUpdatePreProcessResult);
      id v22 = [v31 initWithShouldContinue:1 createdPodcastUUID:v47[5]];

      _Block_object_dispose(&v46, 8);
    }
    goto LABEL_15;
  }
  if (v8)
  {
    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    CFStringRef v55 = @"The feed is empty. There are no items in the feed, and the feed has no title and no author.";
    v33 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    v34 = +[NSError errorWithDomain:@"com.apple.podcasts.MTSubscriptionManager" code:102 userInfo:v33];

    [(MTSubscriptionManager *)self showSubscriptionFailureDialog:v12 error:v34];
  }
  v35 = [v12 completion];

  if (v35)
  {
    v36 = [v12 completion];
    ((void (**)(void, BOOL))v36)[2](v36, !v8);
  }
  id v22 = +[MTFeedUpdatePreProcessResult shouldNotContinueResult];
LABEL_15:

  return v22;
}

- (void)postProcessFeedHookWithParams:(id)a3 podcastUuid:(id)a4 ctx:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100169FBC;
  v18 = &unk_10054DFE8;
  id v19 = a5;
  id v10 = v9;
  id v20 = v10;
  v21 = self;
  id v11 = v8;
  id v22 = v11;
  id v12 = v19;
  [v12 performBlockAndWait:&v15];
  id v13 = [v11 processingCompletion:v15, v16, v17, v18];

  if (v13)
  {
    id v14 = [v11 processingCompletion];
    ((void (**)(void, id))v14)[2](v14, v10);
  }
}

- (void)feedDownloadedWithParams:(id)a3 error:(id)a4 task:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if (!v9 || ([v9 userCanceledAuth] & 1) == 0) {
      [(MTSubscriptionManager *)self showSubscriptionFailureDialog:v13 error:v8];
    }
    id v11 = [v13 completion];

    if (v11)
    {
      id v12 = [v13 completion];
      v12[2](v12, 0);
    }
  }
}

- (BOOL)_addLatestSeasonToPodcast:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    v6 = [v4 managedObjectContext];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10016A2F8;
    v10[3] = &unk_10054E030;
    v10[4] = self;
    id v11 = v5;
    id v13 = &v14;
    id v7 = v6;
    id v12 = v7;
    [v7 performBlockAndWait:v10];
    BOOL v8 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_addLatestSeasonForSerialPodcast:(id)a3
{
  id v4 = a3;
  v5 = [v4 episodesInLatestSeasonWithLimit:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= [(MTSubscriptionManager *)self _addEpisode:*(void *)(*((void *)&v14 + 1) + 8 * i) toMyEpisodesInPodcast:v4 persist:0];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  for (unint64_t j = kMaxSubscribeDownloadForSerialWithSeasons; j < (unint64_t)[v5 count]; ++j)
  {
    id v12 = [v5 objectAtIndexedSubscript:j];
    [v12 suppressAutomaticDownloadsIfNeeded];
  }
  return v8 & 1;
}

- (BOOL)_addNewestEpisodeToPodcast:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v6 = [v4 managedObjectContext];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10016A5B4;
    v9[3] = &unk_10054E4F0;
    id v11 = self;
    id v12 = &v13;
    id v10 = v5;
    [v6 performBlockAndWait:v9];
    BOOL v7 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_addEpisode:(id)a3 toMyEpisodesInPodcast:(id)a4 persist:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  BOOL v10 = 0;
  if (v7 && v8)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    id v11 = [v8 managedObjectContext];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10016A77C;
    v14[3] = &unk_100553550;
    id v15 = v7;
    long long v17 = &v19;
    BOOL v18 = a5;
    id v12 = v11;
    id v16 = v12;
    [v12 performBlockAndWait:v14];
    BOOL v10 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

- (void)subscribeToPodcastWithParams:(id)a3
{
  id v4 = a3;
  v5 = [(MTSubscriptionManager *)self feedManager];
  unsigned int v6 = [v5 abortUpdatesIfNetworkUnreachable:[v4 userInitiated]];

  if (!v6)
  {
    id v8 = [v4 url];
    id v9 = [v8 length];

    if (v9)
    {
      BOOL v10 = [v4 url];
      id v11 = +[NSURL URLWithString:v10];
    }
    else
    {
      id v11 = 0;
    }
    id v12 = [(MTSubscriptionManager *)self feedURLComposer];
    id v36 = 0;
    uint64_t v13 = [v12 feedURLForOptionalURL:v11 adamID:[v4 storeCollectionId] error:&v36];
    id v14 = v36;

    if (v14)
    {
      id v15 = [v14 code];
      if (v15 == +[FeedURLComposer errorURLDoesNotExist])
      {
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        CFStringRef v42 = @"The feed url does not exist.";
        id v16 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        long long v17 = +[NSError errorWithDomain:@"com.apple.podcasts.MTSubscriptionManager" code:101 userInfo:v16];

        [(MTSubscriptionManager *)self showSubscriptionFailureDialog:v4 error:v17];
LABEL_11:

        goto LABEL_22;
      }
      id v18 = [v14 code];
      if (v18 == +[FeedURLComposer errorURLInvalid])
      {
        long long v17 = +[NSString stringWithFormat:@"The feed url is invalid: %@", v13];
        NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
        v40 = v17;
        uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v20 = +[NSError errorWithDomain:@"com.apple.podcasts.MTSubscriptionManager" code:100 userInfo:v19];

        [(MTSubscriptionManager *)self showSubscriptionFailureDialog:v4 error:v20];
        goto LABEL_11;
      }
      id v21 = [v14 code];
      if (v21 == +[FeedURLComposer errorCannotGenerateInternalURL])
      {
        char v22 = _MTLogCategoryFeedUpdate();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v4 storeCollectionId];
          *(_DWORD *)buf = 134217984;
          id v38 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "For some weird reason we cannot generate url of type internal://%lld", buf, 0xCu);
        }
      }
    }
    id v24 = [v4 storeCollectionId];
    if (!v24)
    {
      id v25 = [v13 absoluteString];
      unsigned int v26 = +[MTPodcast isRedirectURL:v25];

      if (!v26
        || ([v13 absoluteString],
            id v27 = objc_claimAutoreleasedReturnValue(),
            id v24 = +[MTPodcast storeCollectionIdForRedirectURL:v27], v27, !v24))
      {
        id v28 = [v13 absoluteString];
        v29 = +[MTSubscriptionController sharedInstance];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10016ACBC;
        v31[3] = &unk_100553578;
        id v32 = v28;
        id v33 = v4;
        v34 = self;
        id v35 = v13;
        id v30 = v28;
        [v29 podcastExistsInStoreWithFeedUrl:v30 completion:v31];

        goto LABEL_22;
      }
      [v4 setStoreCollectionId:v24];
    }
    [(MTSubscriptionManager *)self _feedUpdateAndSubscribeToPodcast:v4 feedUrl:v13 adamId:v24];
LABEL_22:

    goto LABEL_23;
  }
  id v7 = +[IMLogger sharedLogger];
  [v7 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Feed/MTSubscriptionManager.m" lineNumber:281 format:@"Skipping subscibe to podcasts due to network not being reachable"];

LABEL_23:
}

- (void)_feedUpdateAndSubscribeToPodcast:(id)a3 feedUrl:(id)a4 adamId:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 absoluteString];
  id v38 = self;
  [(MTSubscriptionManager *)self addSubscribeParams:v8 forFeedUrl:v10];

  id v11 = _MTLogCategoryFeedUpdate();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = _MTLogCategoryFollowing();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 141558786;
    uint64_t v55 = 1752392040;
    __int16 v56 = 2048;
    int64_t v57 = a5;
    __int16 v58 = 2160;
    uint64_t v59 = 1752392040;
    __int16 v60 = 2112;
    id v61 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MTSubscriptionManager subscribe", "adamID hash: %{mask.hash}lli, url hash: %{mask.hash}@", buf, 0x2Au);
  }
  id v36 = v9;
  os_signpost_id_t v37 = v12;

  id v15 = +[PodcastsApplicationStateMonitor shared];
  id v16 = [v15 isActive];

  long long v17 = +[MTFeedUpdateMetricsDataKey userInitiated];
  v52[0] = v17;
  id v35 = v8;
  id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 userInitiated]);
  v53[0] = v18;
  uint64_t v19 = +[MTFeedUpdateMetricsDataKey foreground];
  v52[1] = v19;
  id v20 = +[NSNumber numberWithBool:v16];
  v53[1] = v20;
  id v21 = +[MTFeedUpdateMetricsDataKey backgroundFetch];
  v52[2] = v21;
  v53[2] = &__kCFBooleanFalse;
  char v22 = +[MTFeedUpdateMetricsDataKey podcastStoreId];
  v52[3] = v22;
  int64_t v39 = a5;
  id v23 = +[NSNumber numberWithLongLong:a5];
  v53[3] = v23;
  id v24 = +[MTFeedUpdateMetricsDataKey source];
  v52[4] = v24;
  v53[4] = &off_10057A070;
  uint64_t v25 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:5];

  unsigned int v26 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Updating podcast %@", buf, 0xCu);
  }

  id v27 = +[MTFeedUpdateMetricsAction podcastDataSource];
  +[IMMetrics recordEvent:v27 dataSource:0 data:v25];

  id v28 = (void *)v25;
  v29 = [(MTSubscriptionManager *)v38 feedManager];
  id v30 = [v35 userInitiated];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10016B2E4;
  v50[3] = &unk_1005535A0;
  v50[4] = v38;
  id v51 = v35;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10016B2F8;
  v46[3] = &unk_1005535C8;
  v46[4] = v38;
  id v47 = v51;
  id v48 = v36;
  os_signpost_id_t v49 = v37;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10016B3BC;
  v43[3] = &unk_1005535F0;
  v43[4] = v38;
  id v44 = v47;
  os_signpost_id_t v45 = v37;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10016B458;
  v40[3] = &unk_100553618;
  v40[4] = v38;
  id v41 = v48;
  os_signpost_id_t v42 = v37;
  id v31 = v48;
  id v32 = v47;
  LOBYTE(v34) = 1;
  LOBYTE(v33) = 0;
  [v29 updateFeedForFeedUrl:v31 cloudSyncFeedUrl:v31 podcastStoreId:v39 triggerBy:0 userInitiated:v30 forceBootstrap:0 useBackgroundFetch:v33 source:16 isSubscribing:v34 feedDownloadedHook:v50 preProcessFeedHook:v46 postProcessFeedHook:v43 completion:v40];
}

- (BOOL)isSubscribingToPodcastWithStoreCollectionID:(int64_t)a3
{
  v5 = [(MTSubscriptionManager *)self feedUrlsToParams];
  objc_sync_enter(v5);
  unsigned int v6 = [(MTSubscriptionManager *)self currentlySubscribingStoreCollectionIds];
  id v7 = +[NSNumber numberWithLongLong:a3];
  LOBYTE(a3) = [v6 containsObject:v7];

  objc_sync_exit(v5);
  return a3;
}

- (id)subscribeParamsForFeedUrl:(id)a3
{
  id v4 = a3;
  v5 = [(MTSubscriptionManager *)self feedUrlsToParams];
  objc_sync_enter(v5);
  unsigned int v6 = [(MTSubscriptionManager *)self feedUrlsToParams];
  id v7 = [v6 objectForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)addSubscribeParams:(id)a3 forFeedUrl:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(MTSubscriptionManager *)self feedUrlsToParams];
  objc_sync_enter(v7);
  id v8 = [(MTSubscriptionManager *)self feedUrlsToParams];
  [v8 setObject:v13 forKey:v6];

  id v9 = [(MTSubscriptionManager *)self currentlySubscribingStoreCollectionIds];
  BOOL v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 storeCollectionId]);
  [v9 addObject:v10];

  id v11 = [(MTSubscriptionManager *)self podcastStateDataSource];
  os_signpost_id_t v12 = [(MTSubscriptionManager *)self currentlySubscribingStoreCollectionIds];
  [v11 updateAddingShowsWithStoreCollectionIds:v12];

  objc_sync_exit(v7);
}

- (void)removeSubscribeParamsForFeedUrl:(id)a3
{
  id v4 = a3;
  v5 = [(MTSubscriptionManager *)self feedUrlsToParams];
  objc_sync_enter(v5);
  id v6 = [(MTSubscriptionManager *)self feedUrlsToParams];
  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [(MTSubscriptionManager *)self feedUrlsToParams];
  [v8 removeObjectForKey:v4];

  id v9 = [v7 storeCollectionId];
  BOOL v10 = [(MTSubscriptionManager *)self currentlySubscribingStoreCollectionIds];
  id v11 = +[NSNumber numberWithLongLong:v9];
  [v10 removeObject:v11];

  os_signpost_id_t v12 = [(MTSubscriptionManager *)self podcastStateDataSource];
  id v13 = [(MTSubscriptionManager *)self currentlySubscribingStoreCollectionIds];
  [v12 updateAddingShowsWithStoreCollectionIds:v13];

  objc_sync_exit(v5);
  id v14 = +[NSNotificationCenter defaultCenter];
  CFStringRef v17 = @"com.apple.podcasts.MTSubscriptionManager.StoreCollectionID";
  id v15 = +[NSNumber numberWithLongLong:v9];
  id v18 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v14 postNotificationName:@"com.apple.podcasts.MTSubscriptionManager.DidFinishSubscribingNotification" object:self userInfo:v16];
}

- (void)showSubscriptionFailureDialog:(id)a3 error:(id)a4
{
  id v5 = a4;
  if ([a3 userInitiated])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016BA6C;
    block[3] = &unk_10054D570;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (MTFeedManager)feedManager
{
  return self->_feedManager;
}

- (_TtC18PodcastsFoundation15FeedURLComposer)feedURLComposer
{
  return self->_feedURLComposer;
}

- (NSMutableDictionary)feedUrlsToParams
{
  return self->_feedUrlsToParams;
}

- (NSMutableSet)currentlySubscribingStoreCollectionIds
{
  return self->_currentlySubscribingStoreCollectionIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySubscribingStoreCollectionIds, 0);
  objc_storeStrong((id *)&self->_feedUrlsToParams, 0);
  objc_storeStrong((id *)&self->_feedURLComposer, 0);
  objc_storeStrong((id *)&self->_feedManager, 0);

  objc_storeStrong((id *)&self->_podcastStateDataSource, 0);
}

@end