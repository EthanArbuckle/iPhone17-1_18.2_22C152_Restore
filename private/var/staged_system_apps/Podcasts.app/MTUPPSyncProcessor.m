@interface MTUPPSyncProcessor
- (BOOL)shouldSync:(id)a3;
- (id)controller;
- (id)entityName;
- (id)predicate;
- (void)playerPaused;
- (void)processResults;
- (void)updatePredicate;
@end

@implementation MTUPPSyncProcessor

- (id)predicate
{
  uint64_t v2 = kEpisodeMetadataTimestamp;
  +[MTUniversalPlaybackPositionDataSource uppLastSyncTime];
  v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = +[NSPredicate predicateForDateKey:v2 isGreaterThanDate:v3];

  return v4;
}

- (id)entityName
{
  return kMTEpisodeEntityName;
}

- (void)updatePredicate
{
  v5.receiver = self;
  v5.super_class = (Class)MTUPPSyncProcessor;
  [(MTBaseProcessor *)&v5 updatePredicate];
  v3 = [(MTBaseProcessor *)self queryObserver];
  unsigned int v4 = [v3 isObserving];

  if (v4) {
    [(MTUPPSyncProcessor *)self processResults];
  }
}

- (void)processResults
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10005714C;
  v11 = sub_100057370;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100147C9C;
  v6[3] = &unk_100550B38;
  v6[4] = &v7;
  [(MTBaseProcessor *)v2 results:v6];
  if ([(MTUPPSyncProcessor *)v2 shouldSync:v8[5]])
  {
    v3 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(id)v8[5] count];
      *(_DWORD *)buf = 134217984;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MTUPPSyncProcessor - Episodes to sync: %ld", buf, 0xCu);
    }

    objc_super v5 = +[SyncControllerFactory resolvedSyncController];
    [v5 performUniversalPlaybackPositionSync];
  }
  else
  {
    objc_super v5 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - skipping sync", buf, 2u);
    }
  }

  _Block_object_dispose(&v7, 8);
  objc_sync_exit(v2);
}

- (BOOL)shouldSync:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    v6 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - skipping sync because no items to sync.", buf, 2u);
    }
    BOOL v5 = 0;
    goto LABEL_23;
  }
  if ((unint64_t)[v4 count] <= 1)
  {
    v6 = [v4 firstObject];
    if (os_feature_enabled_bluemoon())
    {
      uint64_t v7 = [(MTUPPSyncProcessor *)self controller];
      [v7 reloadIfNeeded];

      v8 = [(MTUPPSyncProcessor *)self controller];
      uint64_t v9 = [v8 response];

      if ([v9 state] != (id)2) {
        goto LABEL_18;
      }
      v10 = [v9 tracklist];
      v11 = [v10 playingItem];
      id v12 = [v11 metadataObject];
      v13 = [v12 identifiers];
      id v14 = [v13 library];
      v15 = [v14 databaseID];
      unsigned int v16 = [v15 isEqualToString:v6];

      if (!v16)
      {
LABEL_18:
        BOOL v5 = 1;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v17 = _MTLogCategoryUPPSync();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - Trying to sync the currently playing item. Skipping UPP sync.", v21, 2u);
      }
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v9 = +[MTPlayerController defaultInstance];
      v17 = [v9 currentItem];
      v18 = [v17 episodeUuid];
      if ([v6 isEqualToString:v18]
        && [v9 isPlayingLocally])
      {
        v19 = _MTLogCategoryUPPSync();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "MTUPPSyncProcessor - skipping sync on currently playing item.", v22, 2u);
        }

        BOOL v5 = 0;
      }
      else
      {
        BOOL v5 = 1;
      }
    }
    goto LABEL_22;
  }
  BOOL v5 = 1;
LABEL_24:

  return v5;
}

- (void)playerPaused
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100147FEC;
  v2[3] = &unk_10054D570;
  v2[4] = self;
  [(MTBaseProcessor *)self enqueueWorkBlock:v2];
}

- (id)controller
{
  controller = self->_controller;
  if (!controller)
  {
    id v4 = objc_alloc_init((Class)MPCPlayerRequest);
    [v4 setLabel:@"com.apple.podcasts.MTUPPSyncProcessor"];
    BOOL v5 = +[MPAVRoutingController systemRoute];
    v6 = +[MPCPlayerPath pathWithRoute:v5 bundleID:kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier playerID:kPodcastsPlayerID];
    [v4 setPlayerPath:v6];

    uint64_t v13 = MPModelRelationshipGenericPodcastEpisode;
    uint64_t v7 = +[MPPropertySet emptyPropertySet];
    id v14 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v9 = +[MPPropertySet propertySetWithRelationships:v8];
    [v4 setPlayingItemProperties:v9];

    v10 = (MPRequestResponseController *)objc_alloc_init((Class)MPRequestResponseController);
    v11 = self->_controller;
    self->_controller = v10;

    [(MPRequestResponseController *)self->_controller setRequest:v4];
    [(MPRequestResponseController *)self->_controller beginAutomaticResponseLoading];

    controller = self->_controller;
  }

  return controller;
}

- (void).cxx_destruct
{
}

@end