@interface MTPlaybackQueueController
- (BOOL)playItemWithContentID:(id)a3;
- (BOOL)removeItemWithContentID:(id)a3;
- (BOOL)reorderItemWithContentId:(id)a3 afterItemWithContentID:(id)a4;
- (MPNowPlayingInfoCenter)metadataInfoCenter;
- (MTCompositeManifest)compositeManifest;
- (MTNowPlayingArtworkProvider)artworkProvider;
- (MTPlaybackQueueController)initWithPlayerController:(id)a3;
- (MTPlaybackQueueControllerSessionDelegate)sessionDelegate;
- (MTPlayerController)playerController;
- (MTPlayerItem)magicMomentPlayerItem;
- (MTResultsController)upNextResultsController;
- (NSMutableSet)artworkRequests;
- (NSString)sessionIdentifier;
- (id)_contentItemForChapter:(id)a3 playerItem:(id)a4;
- (id)_playerItemForContentItemId:(id)a3;
- (id)_playerItemForContentItemId:(id)a3 infoCenter:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4;
- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5;
- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3;
- (void)artworkDidChange:(id)a3;
- (void)clearUpNextManifest;
- (void)fetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7;
- (void)legacyFetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7;
- (void)manifestDidChange;
- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationWithCompletion:(id)a4;
- (void)setArtworkProvider:(id)a3;
- (void)setArtworkRequests:(id)a3;
- (void)setCompositeManifest:(id)a3;
- (void)setMagicMomentPlayerItem:(id)a3;
- (void)setMetadataInfoCenter:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setUpNextResultsController:(id)a3;
@end

@implementation MTPlaybackQueueController

- (MTPlaybackQueueController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTPlaybackQueueController;
  v5 = [(MTPlaybackQueueController *)&v20 init];
  if (v5)
  {
    v6 = [v4 player];
    [(MTPlaybackQueueController *)v5 setPlayerController:v4];
    v7 = [v6 infoCenter];
    [v7 setPlaybackQueueDataSource:v5];

    v8 = +[IMAVPlayer sharedPlayer];

    if (v6 == v8)
    {
      id v9 = objc_alloc((Class)MPNowPlayingInfoCenter);
      id v10 = [v9 initWithPlayerID:kMTPodcastsMagicMomentsPlayerID];
      [(MTPlaybackQueueController *)v5 setMetadataInfoCenter:v10];

      v11 = [(MTPlaybackQueueController *)v5 metadataInfoCenter];
      [v11 setPlaybackQueueDataSource:v5];

      v12 = [(MTPlaybackQueueController *)v5 metadataInfoCenter];
      [v12 invalidatePlaybackQueue];
    }
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v5 selector:"manifestDidChange" name:IMAVPlayerNotification_MediaItemDidChange object:v6];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v5 selector:"didLoadAdditionalItems" name:IMPlayerManifestDidLoadAdditionalItems object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v5 selector:"artworkDidChange:" name:kMTImageDownloaderArtworkDidLoadNotification object:0];

    v16 = [[MTUpNextResultsController alloc] initWithPlayerController:v4];
    [(MTPlaybackQueueController *)v5 setUpNextResultsController:v16];

    v17 = [(MTPlaybackQueueController *)v5 upNextResultsController];
    [v17 setDelegate:v5];

    v18 = objc_opt_new();
    [(MTPlaybackQueueController *)v5 setArtworkRequests:v18];

    [(MTPlaybackQueueController *)v5 manifestDidChange];
  }

  return v5;
}

- (MTCompositeManifest)compositeManifest
{
  v3 = [(MTPlaybackQueueController *)self playerController];
  id v4 = [v3 player];
  v5 = [v4 manifest];

  if (v5 && (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = 0;
  }
  else
  {
    v6 = [(MTPlaybackQueueController *)self playerController];
    v7 = [v6 player];
    v8 = [v7 manifest];
  }

  return (MTCompositeManifest *)v8;
}

- (void)manifestDidChange
{
  v3 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidating playback queue", v13, 2u);
  }

  id v4 = [(MTPlaybackQueueController *)self playerController];
  v5 = [v4 player];
  v6 = [v5 infoCenter];
  [v6 invalidatePlaybackQueue];

  v7 = [(MTPlaybackQueueController *)self playerController];
  v8 = [v7 player];
  [v8 updateNowPlayingDurationSnapshot];

  id v9 = +[NSUUID UUID];
  uint64_t v10 = [v9 UUIDString];
  [(MTPlaybackQueueController *)self setSessionIdentifier:v10];

  v11 = [(MTPlaybackQueueController *)self sessionDelegate];
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if (v10)
  {
    v12 = [(MTPlaybackQueueController *)self sessionDelegate];
    [v12 sessionIdentifierDidChange];
  }
}

- (void)artworkDidChange:(id)a3
{
  MTImageDownloaderArtworkDidLoadCacheKeys();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(MTPlaybackQueueController *)self compositeManifest];
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(MTPlaybackQueueController *)self compositeManifest];
      v8 = [v7 objectAtIndex:v6];

      id v9 = [v8 artworkIdentifier];
      unsigned int v10 = [v14 containsObject:v9];

      if (v10)
      {
        v11 = [v8 contentItem];
        [v11 invalidateArtwork];
      }
      ++v6;
      v12 = [(MTPlaybackQueueController *)self compositeManifest];
      id v13 = [v12 count];
    }
    while ((unint64_t)v13 > v6);
  }
}

- (BOOL)playItemWithContentID:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPlaybackQueueController *)self _playerItemForContentItemId:v4];
  unint64_t v6 = [v5 manifest];
  if (os_feature_enabled_red_sun())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(MTPlaybackQueueController *)self compositeManifest];
      v8 = [v7 currentItem];
      id v9 = [v8 contentItemIdentifier];

      [(MTPlaybackQueueController *)self reorderItemWithContentId:v4 afterItemWithContentID:v9];
    }
  }
  id v10 = [v5 manifestIndex];
  v11 = [(MTPlaybackQueueController *)self compositeManifest];
  id v12 = [v11 determineCompositeIndexWithIndex:v10 fromManifest:v6];

  id v13 = [(MTPlaybackQueueController *)self compositeManifest];
  [v13 setCurrentIndex:v12];

  id v14 = [(MTPlaybackQueueController *)self playerController];
  [v14 playWithReason:7];

  return 1;
}

- (BOOL)removeItemWithContentID:(id)a3
{
  id v4 = [(MTPlaybackQueueController *)self _playerItemForContentItemId:a3];
  id v5 = [v4 manifest];
  id v6 = [v4 manifestIndex];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v8 = [(MTPlaybackQueueController *)self playerController];
    id v9 = [v8 upNextController];
    [v9 removeEpisodeAtIndex:v6];
  }
  else
  {
    v8 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Can't remove an item that isn't in the up next manifest", v11, 2u);
    }
  }

  return isKindOfClass & 1;
}

- (void)clearUpNextManifest
{
  id v3 = [(MTPlaybackQueueController *)self playerController];
  v2 = [v3 upNextController];
  [v2 clearQueueItems];
}

- (BOOL)reorderItemWithContentId:(id)a3 afterItemWithContentID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MTPlaybackQueueController *)self playerController];
  id v9 = [v8 upNextController];

  id v10 = [(MTPlaybackQueueController *)self _playerItemForContentItemId:v7];

  v11 = [v10 manifest];
  id v12 = [v10 manifestIndex];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [(MTPlaybackQueueController *)self _playerItemForContentItemId:v6];
    id v14 = [v13 manifest];
    v15 = (char *)[v13 manifestIndex];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v16 = [v9 moveEpisodeFrom:v12 to:v15 + 1];
LABEL_14:

      goto LABEL_15;
    }
    v17 = [(MTPlaybackQueueController *)self compositeManifest];
    v18 = [v17 currentManifest];
    if (v18 == v14)
    {
      v19 = [(MTPlaybackQueueController *)self compositeManifest];
      v22 = (char *)[v19 currentIndex];

      if (v22 == v15)
      {
        [v9 moveEpisodeFrom:v12 to:0];
        unsigned __int8 v16 = 1;
        goto LABEL_14;
      }
    }
    else
    {
    }
    objc_super v20 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Can't reorder an item to a destination outside of the up next queue", v23, 2u);
    }

    unsigned __int8 v16 = 0;
    goto LABEL_14;
  }
  id v13 = _MTLogCategoryMediaRemote();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Can't reorder an item that isn't in the up next manifest", buf, 2u);
  }
  unsigned __int8 v16 = 0;
LABEL_15:

  return v16;
}

- (void)setMagicMomentPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_magicMomentPlayerItem, a3);
  id v4 = [(MTPlaybackQueueController *)self metadataInfoCenter];
  [v4 invalidatePlaybackQueue];
}

- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3
{
  id v3 = [(MTPlaybackQueueController *)self playerController];
  id v4 = [v3 player];
  id v5 = [v4 manifest];
  id v6 = [v5 identifier];

  return v6;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace();
  v8 = _MTLogCategoryMediaRemote();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch content item for ID %{public}@", (uint8_t *)&v15, 0xCu);
  }

  id v9 = [(MTPlaybackQueueController *)self _playerItemForContentItemId:v6 infoCenter:v7];

  id v10 = [v9 contentItem];

  v11 = _MTLogCategoryMediaRemote();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 title];
    id v13 = [v10 albumName];
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 2112;
    objc_super v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[InfoCenter] Did fetch content item for ID %{public}@ - %@ - %@", (uint8_t *)&v15, 0x20u);
  }
  kdebug_trace();

  return v10;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4
{
  id v6 = a3;
  kdebug_trace();
  id v7 = _MTLogCategoryMediaRemote();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 134217984;
    int64_t v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch content item ID for offset %ld", (uint8_t *)&v26, 0xCu);
  }

  v8 = [v6 playerID];

  unsigned int v9 = [v8 isEqualToString:kMTPodcastsMagicMomentsPlayerID];
  if (v9)
  {
    if (a4)
    {
      id v10 = 0;
    }
    else
    {
      v22 = [(MTPlaybackQueueController *)self magicMomentPlayerItem];
      v23 = [v22 contentItem];
      id v10 = [v23 identifier];
    }
    v24 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218242;
      int64_t v27 = a4;
      __int16 v28 = 2114;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[InfoCenter] Did fetch content item ID for Magic Moments player for offset %ld - %{public}@", (uint8_t *)&v26, 0x16u);
    }

    kdebug_trace();
  }
  else
  {
    v11 = [(MTPlaybackQueueController *)self compositeManifest];
    id v12 = (char *)[v11 currentIndex];

    id v13 = &v12[a4];
    id v14 = [(MTPlaybackQueueController *)self compositeManifest];
    int v15 = (char *)[v14 count];

    if (v13 >= v15)
    {
      __int16 v19 = _MTLogCategoryMediaRemote();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_super v20 = [(MTPlaybackQueueController *)self compositeManifest];
        id v21 = [v20 count];
        int v26 = 134218240;
        int64_t v27 = a4;
        __int16 v28 = 2048;
        id v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[InfoCenter] Attempting to fetch content item ID for offset %ld outside of manifest range %lu", (uint8_t *)&v26, 0x16u);
      }
      kdebug_trace();
      id v10 = 0;
    }
    else
    {
      id v16 = [(MTPlaybackQueueController *)self compositeManifest];
      __int16 v17 = [v16 objectAtIndex:v13];

      id v10 = [v17 contentItemIdentifier];
      v18 = _MTLogCategoryMediaRemote();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134218242;
        int64_t v27 = a4;
        __int16 v28 = 2114;
        id v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[InfoCenter] Did fetch content item ID for offset %ld - %{public}@", (uint8_t *)&v26, 0x16u);
      }

      kdebug_trace();
    }
  }

  return v10;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  kdebug_trace();
  id v14 = _MTLogCategoryMediaRemote();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = [v11 identifier];
    *(_DWORD *)buf = 138543362;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch artwork for content item ID %{public}@", buf, 0xCu);
  }
  id v16 = [(MTPlaybackQueueController *)self playerController];
  __int16 v17 = [v16 player];

  v18 = [v11 identifier];
  __int16 v19 = [(MTPlaybackQueueController *)self _playerItemForContentItemId:v18 infoCenter:v13];

  if (v19)
  {
    [v17 currentTime];
    double v21 = v20;
    v22 = [v17 currentChapter];

    if (v22)
    {
      v23 = [v17 currentChapter];
      v24 = v23;
      if (v23) {
        [v23 assetTimeRange];
      }
      else {
        memset(&v30, 0, sizeof(v30));
      }
      CMTime time = v30;
      double v21 = CMTimeGetSeconds(&time) + 0.00000011920929;

      [v17 currentTime];
      if (v28 >= v21) {
        double v21 = v28;
      }
    }
    if (os_feature_enabled_red_sun()) {
      -[MTPlaybackQueueController fetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:](self, "fetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:", v19, v11, v12, v21, width, height);
    }
    else {
      -[MTPlaybackQueueController legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:](self, "legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:", v19, v11, v12, v21, width, height);
    }
  }
  else
  {
    v25 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = [v11 identifier];
      int64_t v27 = [v11 title];
      *(_DWORD *)buf = 138543618;
      v33 = v26;
      __int16 v34 = 2112;
      v35 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[InfoCenter] Attempting to fetch artwork for content item %{public}@ - %@ but player item is nil", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    kdebug_trace();
  }

  return 0;
}

- (void)fetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = [(MTPlaybackQueueController *)self artworkProvider];

  if (v16)
  {
    *(void *)buf = 0;
    v32 = buf;
    uint64_t v33 = 0x3032000000;
    __int16 v34 = sub_10005703C;
    v35 = sub_1000572E8;
    id v36 = 0;
    __int16 v17 = [(MTPlaybackQueueController *)self artworkProvider];
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_1000F1E0C;
    int v26 = &unk_100551408;
    id v27 = v14;
    double v28 = self;
    id v29 = v15;
    CMTime v30 = buf;
    uint64_t v18 = [v17 fetchInfoCenterArtworkWith:v13 at:&v23 of:a5 completion:width height];
    __int16 v19 = (void *)*((void *)v32 + 5);
    *((void *)v32 + 5) = v18;

    double v20 = [(MTPlaybackQueueController *)self artworkRequests];
    [v20 addObject:*((void *)v32 + 5)];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v21 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    v22 = +[NSError errorWithDomain:@"MTPlaybackQueueControllerErrorDomain" code:2 userInfo:0];
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v22);

    kdebug_trace();
  }
}

- (void)legacyFetchArtworkForPlayerItem:(id)a3 contentItem:(id)a4 atTime:(double)a5 ofSize:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000F204C;
  v14[3] = &unk_100551430;
  id v15 = a4;
  id v16 = a7;
  id v12 = v16;
  id v13 = v15;
  [a3 retrieveArtwork:v14 withSize:CGSizeMake(width, height) atTime:a5];
}

- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _MTLogCategoryMediaRemote();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v9 identifier];
    *(_DWORD *)buf = 138543362;
    int v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[InfoCenter] Will fetch info for content item ID %{public}@", buf, 0xCu);
  }
  if (v10)
  {
    id v13 = +[MTDB sharedInstance];
    id v14 = [v13 privateQueueContext];

    id v15 = [v9 identifier];
    id v16 = [(MTPlaybackQueueController *)self _playerItemForContentItemId:v15 infoCenter:v8];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000F2358;
    v20[3] = &unk_10054D988;
    id v21 = v14;
    id v22 = v16;
    id v23 = v9;
    id v24 = v10;
    id v17 = v16;
    id v18 = v14;
    [v18 performBlock:v20];
  }
  return 0;
}

- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationWithCompletion:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  id v6 = +[MTAccountController sharedInstance];
  id v7 = [v6 activeDsid];

  id v8 = +[MTPlaybackIdentifierUtil sharedInstance];
  id v9 = [(MTPlaybackQueueController *)self compositeManifest];
  id v10 = [v8 requestIdentifiersForManifest:v9 queueStatus:0];

  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  if ([v10 count])
  {
    id v24 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v18 = +[MTPlaybackIdentifierUtil sharedInstance];
          __int16 v19 = [v18 playbackRequestURLWithDSID:v7 baseRequestURLString:v17];

          [v11 addObject:v19];
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v14);
    }

    id v25 = 0;
    double v20 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:0 error:&v25];
    id v21 = v25;
    id v5 = v24;
    if (v21)
    {
      id v22 = _MTLogCategoryMediaRemote();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not archive playback session: %@", buf, 0xCu);
      }
    }
    if (v24) {
      ((void (**)(id, void *, id))v24)[2](v24, v20, v21);
    }
  }
  else
  {
    id v23 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No playback identifiers found in current manifest", buf, 2u);
    }

    id v21 = +[NSError errorWithDomain:@"MTPlaybackQueueControllerErrorDomain" code:1 userInfo:0];
    v5[2](v5, 0, v21);
  }
}

- (id)_playerItemForContentItemId:(id)a3
{
  return [(MTPlaybackQueueController *)self _playerItemForContentItemId:a3 infoCenter:0];
}

- (id)_playerItemForContentItemId:(id)a3 infoCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 playerID];
  unsigned int v9 = [v8 isEqualToString:kMTPodcastsMagicMomentsPlayerID];

  if (v9)
  {
    id v10 = [(MTPlaybackQueueController *)self magicMomentPlayerItem];
    id v11 = [v10 contentItem];
    id v12 = [v11 identifier];
    if ([v12 isEqualToString:v6])
    {
      id v13 = [(MTPlaybackQueueController *)self magicMomentPlayerItem];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    __int16 v34 = sub_10005703C;
    v35 = sub_1000572E8;
    id v36 = 0;
    id v14 = [(MTPlaybackQueueController *)self compositeManifest];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000F2B3C;
    v28[3] = &unk_10054EDA8;
    id v15 = v6;
    id v29 = v15;
    CMTime v30 = &v31;
    [v14 enumerateObjectsUsingBlock:v28];

    id v16 = (void *)v32[5];
    if (!v16)
    {
      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x3032000000;
      id v25 = sub_10005703C;
      long long v26 = sub_1000572E8;
      long long v27 = &stru_10056A8A0;
      uint64_t v17 = [(MTPlaybackQueueController *)self compositeManifest];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000F2BE4;
      v21[3] = &unk_100551458;
      v21[4] = &v22;
      [v17 enumerateObjectsUsingBlock:v21];

      id v18 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = v23[5];
        *(_DWORD *)buf = 138543618;
        id v38 = v15;
        __int16 v39 = 2114;
        uint64_t v40 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "We couldn't find a player item for content item %{public}@.  All player items in the queue %{public}@", buf, 0x16u);
      }

      _Block_object_dispose(&v22, 8);
      id v16 = (void *)v32[5];
    }
    id v13 = v16;

    _Block_object_dispose(&v31, 8);
  }

  return v13;
}

- (id)_contentItemForChapter:(id)a3 playerItem:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  id v7 = 0;
  if (a3 && v5)
  {
    id v8 = a3;
    unsigned int v9 = [v6 episodeUuid];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 episodeStoreId]);
      id v11 = [v12 stringValue];
    }
    id v13 = [v6 podcastUuid];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 podcastStoreId]);
      id v15 = [v16 stringValue];
    }
    uint64_t v17 = [v8 title];
    id v18 = [v11 stringByAppendingFormat:@"-%@", v17];
    id v7 = [objc_alloc((Class)MPNowPlayingContentItem) initWithIdentifier:v18];
    [v7 setCollectionIdentifier:v15];
    [v7 setContainer:0];
    [v7 setPlayable:1];
    [v7 setTitle:v17];
    [v8 duration];
    double v20 = v19;

    [v7 setDuration:v20];
  }

  return v7;
}

- (MTPlaybackQueueControllerSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);

  return (MTPlaybackQueueControllerSessionDelegate *)WeakRetained;
}

- (void)setSessionDelegate:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (MTPlayerItem)magicMomentPlayerItem
{
  return self->_magicMomentPlayerItem;
}

- (MTNowPlayingArtworkProvider)artworkProvider
{
  return self->_artworkProvider;
}

- (void)setArtworkProvider:(id)a3
{
}

- (MPNowPlayingInfoCenter)metadataInfoCenter
{
  return self->_metadataInfoCenter;
}

- (void)setMetadataInfoCenter:(id)a3
{
}

- (void)setCompositeManifest:(id)a3
{
}

- (MTResultsController)upNextResultsController
{
  return self->_upNextResultsController;
}

- (void)setUpNextResultsController:(id)a3
{
}

- (MTPlayerController)playerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  return (MTPlayerController *)WeakRetained;
}

- (void)setPlayerController:(id)a3
{
}

- (NSMutableSet)artworkRequests
{
  return self->_artworkRequests;
}

- (void)setArtworkRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkRequests, 0);
  objc_destroyWeak((id *)&self->_playerController);
  objc_storeStrong((id *)&self->_upNextResultsController, 0);
  objc_storeStrong((id *)&self->_compositeManifest, 0);
  objc_storeStrong((id *)&self->_metadataInfoCenter, 0);
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_magicMomentPlayerItem, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_destroyWeak((id *)&self->_sessionDelegate);
}

@end