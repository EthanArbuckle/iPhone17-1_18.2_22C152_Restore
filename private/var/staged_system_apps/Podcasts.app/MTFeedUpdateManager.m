@interface MTFeedUpdateManager
- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4;
- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5;
- (MTFeedManager)feedManager;
- (MTFeedUpdateManager)init;
- (OS_dispatch_queue)workQueue;
- (void)_fetchMediaAPIShowsExpectedToUpdate:(id)a3;
- (void)_unsafe_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7;
- (void)_updateAllMediaAPIPodcastsUserInitiated:(BOOL)a3 source:(int64_t)a4 completion:(id)a5;
- (void)_updateAllNonMediaAPIPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6;
- (void)_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7;
- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 source:(int64_t)a8 completion:(id)a9;
- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 completion:(id)a10;
- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 tryRedirectURL:(BOOL)a10 startedUpdateCallback:(id)a11 completion:(id)a12;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdateCallback:(id)a8;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 tryRedirectURL:(BOOL)a8 startedUpdateCallback:(id)a9;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 tryRedirectURL:(BOOL)a7;
- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdatesCallback:(id)a8;
- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7;
- (void)setWorkQueue:(id)a3;
- (void)updateAllMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4;
- (void)updateAllNonMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4;
- (void)updateAllPodcastsInBackgroundWithSource:(int64_t)a3 started:(id)a4;
- (void)updateAllPodcastsNeedingRetry:(id)a3;
- (void)updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6;
- (void)updateMediaAPIPodcastsExpectedToUpdate:(id)a3;
- (void)updateMediaAPIPodcastsExpectedToUpdateWithLimit:(int64_t)a3 started:(id)a4;
- (void)updatePodcastWithStoreId:(int64_t)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 source:(int64_t)a7 completion:(id)a8;
- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 forceBootstrap:(BOOL)a6 source:(int64_t)a7 completion:(id)a8;
- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 completion:(id)a6;
- (void)updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 started:(id)a6;
@end

@implementation MTFeedUpdateManager

- (void)updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v10 = a6;
  v11 = [(MTFeedUpdateManager *)self workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100058BF8;
  v13[3] = &unk_100551C80;
  BOOL v16 = a3;
  BOOL v17 = a4;
  id v14 = v10;
  int64_t v15 = a5;
  v13[4] = self;
  id v12 = v10;
  dispatch_async(v11, v13);
}

- (MTFeedUpdateManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTFeedUpdateManager;
  v2 = [(MTFeedUpdateManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[MTFeedManager sharedInstance];
    feedManager = v2->_feedManager;
    v2->_feedManager = (MTFeedManager *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("MTFeedUpdateManagerQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)updateAllPodcastsNeedingRetry:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MTFeedUpdateManager *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018018;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_unsafe_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
  BOOL v10 = a3;
  id v12 = a7;
  if (v10) {
    +[MTPodcast predicateForNotHiddenPodcasts];
  }
  else {
  v13 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  }
  id v14 = +[MTDB sharedInstance];
  int64_t v15 = [v14 importContext];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_10005709C;
  v29[4] = sub_100057318;
  id v30 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001CC70;
  v19[3] = &unk_100551E60;
  id v16 = v15;
  id v20 = v16;
  id v17 = v13;
  id v21 = v17;
  v22 = self;
  BOOL v26 = v10;
  BOOL v27 = a4;
  BOOL v28 = a5;
  v24 = v29;
  int64_t v25 = a6;
  id v18 = v12;
  id v23 = v18;
  [v16 performBlock:v19];

  _Block_object_dispose(v29, 8);
}

- (void)_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001143D0;
  v29[3] = &unk_10054ECB8;
  id v12 = a7;
  id v30 = v12;
  v13 = objc_retainBlock(v29);
  if (sub_100054C20())
  {
    id v14 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int64_t v15 = "Skipping feed update: disabled";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v16 = [(MTFeedUpdateManager *)self feedManager];
  unsigned int v17 = [v16 abortUpdatesIfNetworkUnreachable:v10];

  if (v17)
  {
    id v14 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int64_t v15 = "Skipping feed update due to network not being reachable";
      goto LABEL_7;
    }
LABEL_8:

    ((void (*)(void *, void))v13[2])(v13, 0);
    goto LABEL_9;
  }
  if (os_feature_enabled_batch_feed_fetch())
  {
    id v18 = +[IMURLBag sharedInstance];
    v19 = [v18 batchFeedFetchIsEnabled];
    id v20 = [(MTFeedUpdateManager *)self workQueue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100011A44;
    v22[3] = &unk_100551F00;
    BOOL v25 = v10;
    BOOL v26 = v9;
    BOOL v27 = v8;
    v22[4] = self;
    int64_t v24 = a6;
    id v23 = v12;
    [v19 asyncValueOnQueue:v20 withCompletion:v22];
  }
  else
  {
    id v21 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Batch fetch ff is off. Updating all podcasts through legacy path.", buf, 2u);
    }

    [(MTFeedUpdateManager *)self _unsafe_updateAllPodcastsUserInitiated:v10 forced:v9 useBackgroundFetch:v8 source:a6 startedUpdatesCallback:v12];
  }
LABEL_9:
}

- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdatesCallback:(id)a8
{
  id v14 = a3;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001BE9C;
  v27[3] = &unk_10054ECB8;
  id v28 = a8;
  id v15 = v28;
  id v16 = objc_retainBlock(v27);
  unsigned int v17 = [(MTFeedUpdateManager *)self workQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000364B0;
  v20[3] = &unk_100551F78;
  BOOL v24 = a4;
  v20[4] = self;
  id v21 = v14;
  BOOL v25 = a5;
  BOOL v26 = a6;
  id v22 = v16;
  int64_t v23 = a7;
  id v18 = v14;
  v19 = v16;
  dispatch_async(v17, v20);
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdateCallback:(id)a8
{
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 tryRedirectURL:(BOOL)a8 startedUpdateCallback:(id)a9
{
  LOBYTE(v9) = a8;
  [(MTFeedUpdateManager *)self _updatePodcastWithUUID:a3 triggerBy:0 userInitiated:a4 forced:a5 forceBootstrap:0 useBackgroundFetch:a6 source:a7 tryRedirectURL:v9 startedUpdateCallback:a9 completion:0];
}

- (MTFeedManager)feedManager
{
  return self->_feedManager;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  BOOL v8 = v7;
  if (v7 && (![v7 isImplicitlyFollowed] || v6))
  {
    unsigned __int8 v9 = 1;
    if (!v6 && !a5)
    {
      if +[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", [v8 storeCollectionId])&& ((objc_msgSend(v8, "importing") & 1) != 0|| (objc_msgSend(v8, "feedUpdateNeedsRetry")))
      {
        unsigned __int8 v9 = 1;
      }
      else
      {
        v11 = +[MTPodcast predicateForPeriodicallyUpdatablePodcasts];
        unsigned __int8 v9 = [v11 evaluateWithObject:v8];
      }
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 tryRedirectURL:(BOOL)a10 startedUpdateCallback:(id)a11 completion:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a11;
  id v19 = a12;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100044974;
  v59[3] = &unk_10054DA50;
  id v20 = v18;
  id v60 = v20;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000448AC;
  v56[3] = &unk_100551FA0;
  id v21 = objc_retainBlock(v59);
  id v57 = v21;
  id v22 = v19;
  id v58 = v22;
  int64_t v23 = objc_retainBlock(v56);
  if (sub_100054C20())
  {
    BOOL v24 = +[FeedUpdaterObjcError feedUpdatesDisabled];
    ((void (*)(void *, void *))v23[2])(v23, v24);
  }
  else
  {
    BOOL v28 = a7;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x2020000000;
    char v55 = 1;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = sub_10005709C;
    v52[4] = sub_100057318;
    id v53 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_10005709C;
    v50[4] = sub_100057318;
    id v51 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v49[3] = 0;
    BOOL v25 = +[MTDB sharedInstance];
    BOOL v26 = [v25 importContext];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004428C;
    v31[3] = &unk_100551FF0;
    id v27 = v26;
    id v32 = v27;
    id v33 = v16;
    v34 = self;
    BOOL v44 = a5;
    BOOL v45 = a6;
    v39 = v54;
    v40 = v52;
    BOOL v46 = a10;
    v41 = v49;
    v42 = v50;
    BOOL v47 = a8;
    int64_t v43 = a9;
    v36 = v23;
    v37 = v21;
    id v35 = v17;
    BOOL v48 = v28;
    id v38 = v22;
    [v27 performBlock:v31];

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v50, 8);

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(v54, 8);
  }
}

- (void)updateAllPodcastsInBackgroundWithSource:(int64_t)a3 started:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Updating all podcasts with non background source. %ld.", buf, 0xCu);
    }
  }
  BOOL v8 = [(MTFeedUpdateManager *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112234;
  block[3] = &unk_10054DC88;
  id v11 = v6;
  int64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (void)_fetchMediaAPIShowsExpectedToUpdate:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  dispatch_queue_t v5 = [v4 importContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100112320;
  v8[3] = &unk_10054D738;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (void)updateMediaAPIPodcastsExpectedToUpdateWithLimit:(int64_t)a3 started:(id)a4
{
  id v6 = a4;
  id v7 = [(MTFeedUpdateManager *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112B24;
  block[3] = &unk_10054DC88;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)updateMediaAPIPodcastsExpectedToUpdate:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MTFeedUpdateManager *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100113110;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateAllMediaAPIPodcastsUserInitiated:(BOOL)a3 source:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001134B8;
  v8[3] = &unk_100551D70;
  void v8[4] = self;
  id v9 = a5;
  BOOL v11 = v6;
  int64_t v10 = a4;
  id v7 = v9;
  +[BatchFeedRequestController fetchOutOfDateShowUUIDsWithIncludeImplicit:v6 completionHandler:v8];
}

- (void)updateAllMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001137A8;
  v7[3] = &unk_100551D98;
  id v8 = a4;
  id v6 = v8;
  [(MTFeedUpdateManager *)self _updateAllMediaAPIPodcastsUserInitiated:0 source:a3 completion:v7];
}

- (void)_updateAllNonMediaAPIPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v9 = a6;
  int64_t v10 = +[MTDB sharedInstance];
  BOOL v11 = [v10 importContext];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001138AC;
  v14[3] = &unk_100551DC0;
  BOOL v18 = a3;
  id v15 = v11;
  id v16 = self;
  BOOL v19 = a4;
  id v17 = v9;
  id v12 = v9;
  id v13 = v11;
  [v13 performBlock:v14];
}

- (void)updateAllNonMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4
{
}

- (void)updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(MTFeedUpdateManager *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113D28;
  block[3] = &unk_100551D48;
  block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 completion:(id)a6
{
}

- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 forceBootstrap:(BOOL)a6 source:(int64_t)a7 completion:(id)a8
{
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 source:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  int64_t v18 = [(MTFeedUpdateManager *)self workQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100113EE4;
  v22[3] = &unk_100551DE8;
  BOOL v27 = a5;
  BOOL v28 = a6;
  v22[4] = self;
  id v23 = v15;
  id v24 = v16;
  id v25 = v17;
  BOOL v29 = a7;
  int64_t v26 = a8;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  dispatch_async(v18, v22);
}

- (void)updatePodcastWithStoreId:(int64_t)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 source:(int64_t)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a8;
  id v15 = +[MTDB sharedInstance];
  id v16 = [v15 importContext];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001141C0;
  v20[3] = &unk_100551E10;
  id v23 = v14;
  int64_t v24 = a3;
  id v21 = v16;
  id v22 = v13;
  BOOL v26 = a5;
  BOOL v27 = a6;
  int64_t v25 = a7;
  id v17 = v13;
  id v18 = v14;
  id v19 = v16;
  [v19 performBlock:v20];
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6
{
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 tryRedirectURL:(BOOL)a7
{
}

- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4
{
  return [(MTFeedUpdateManager *)self isPodcastUpdatable:a3 userInitiated:a4 forced:0];
}

- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 completion:(id)a10
{
  LOBYTE(v10) = 1;
  [(MTFeedUpdateManager *)self _updatePodcastWithUUID:a3 triggerBy:a4 userInitiated:a5 forced:a6 forceBootstrap:a7 useBackgroundFetch:a8 source:a9 tryRedirectURL:v10 startedUpdateCallback:0 completion:a10];
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedManager, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end