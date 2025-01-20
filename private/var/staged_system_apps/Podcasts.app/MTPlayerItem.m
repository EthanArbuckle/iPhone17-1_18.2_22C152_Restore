@interface MTPlayerItem
+ (id)subtitleStringForArtist:(id)a3 album:(id)a4;
+ (id)subtitleStringForEpisode:(id)a3;
- (BOOL)isPlayable;
- (BOOL)needsNetworkToPlayButNoNetwork;
- (BOOL)notifyUserIsNotPlayable;
- (BOOL)supportsArtworkUrl;
- (BOOL)supportsChapterArtwork;
- (BOOL)supportsEpisodeArtwork;
- (BOOL)upgradeToAlternatePaidVersionIfNeeded;
- (MTEpisodeIdentifier)episodeIdentifier;
- (MTPlayerItem)init;
- (MTPlayerItem)initWithPodcastEpisode:(id)a3 podcast:(id)a4;
- (NSObject)streamCacheObserverToken;
- (NSString)storeReportingParams;
- (PFAnalyticsChannel)analyticsChannel;
- (PFFairPlayKeyLoading)fairPlayKeyLoader;
- (PFFairPlayKeySession)fairPlayKeySession;
- (_TtC10PodcastsUI23UIStoreResponseDelegate)storeResponseDelegate;
- (id)_episodeArtworkIdentifier;
- (id)_podcastArtworkIdentifier;
- (id)artworkIdentifier;
- (id)assetForLocalFile:(id)a3;
- (id)assetForRemoteFile:(id)a3;
- (id)contentItemIdentifier;
- (id)createAssetForUrl:(id)a3;
- (id)defaultAssetOptions;
- (id)episode;
- (id)externalMetadata;
- (id)fetchArtworkItemProviderForSize:(CGSize)a3;
- (id)metricsContentIdentifier;
- (id)podcastShareUrl;
- (id)subtitle;
- (int64_t)mpItemType;
- (void)addServiceIdentifier:(id)a3;
- (void)addUserAgent:(id)a3;
- (void)cleanupItem;
- (void)contentKeyRequestDidFailWithError:(id)a3;
- (void)dealloc;
- (void)invalidateAsset;
- (void)prepareAssetForFairPlayPlayback:(id)a3;
- (void)prepareAssetForFairPlayPlayback_legacy:(id)a3;
- (void)reportIfLocalAssetHasiPodLibraryURL:(id)a3;
- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4;
- (void)setAnalyticsChannel:(id)a3;
- (void)setAreChaptersLoaded:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setFairPlayKeyLoader:(id)a3;
- (void)setFairPlayKeySession:(id)a3;
- (void)setManifestIndex:(unint64_t)a3;
- (void)setStoreReportingParams:(id)a3;
- (void)setStoreResponseDelegate:(id)a3;
- (void)setStreamCacheObserverToken:(id)a3;
- (void)updateActivity:(id)a3;
- (void)upgradeToLocalEpisodeBackedItemWithEpisodeUUID:(id)a3 podcastUUID:(id)a4;
@end

@implementation MTPlayerItem

- (MTPlayerItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTPlayerItem;
  v2 = [(MTPlayerItem *)&v9 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"cleanupItem" name:MTApplicationWillTerminateNotification object:0];

    id v4 = objc_alloc_init((Class)_TtC10PodcastsUI23UIStoreResponseDelegate);
    [(MTPlayerItem *)v2 setStoreResponseDelegate:v4];

    id v5 = objc_alloc_init((Class)PFCoreAnalyticsChannel);
    [(MTPlayerItem *)v2 setAnalyticsChannel:v5];

    v6 = objc_opt_new();
    v7 = +[PFDispatchingFairPlayKeyLoader receiveOn:&_dispatch_main_q loader:v6];
    [(MTPlayerItem *)v2 setFairPlayKeyLoader:v7];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(MTPlayerItem *)self streamCacheObserverToken];

  if (v3)
  {
    id v4 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(MTPlayerItem *)self streamCacheObserverToken];
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing observer for token: %@", buf, 0xCu);
    }
    v6 = +[NSNotificationCenter defaultCenter];
    v7 = [(MTPlayerItem *)self streamCacheObserverToken];
    [v6 removeObserver:v7];

    [(MTPlayerItem *)self setStreamCacheObserverToken:0];
  }
  [(MTPlayerItem *)self cleanupItem];
  v8.receiver = self;
  v8.super_class = (Class)MTPlayerItem;
  [(MTPlayerItem *)&v8 dealloc];
}

- (void)cleanupItem
{
  v3 = +[PFFairPlayRolloutController sharedInstance];
  unsigned int v4 = [v3 isEnabled];

  if (v4)
  {
    id v5 = [(MTPlayerItem *)self fairPlayKeySession];

    if (v5)
    {
      v6 = [(MTPlayerItem *)self fairPlayKeySession];
      [v6 deregister];

      v7 = [(MTPlayerItem *)self fairPlayKeySession];
      objc_super v8 = [v7 asset];
      unsigned __int8 v9 = [v8 isOfflineAsset];

      if ((v9 & 1) == 0)
      {
        v10 = _MTLogCategoryDRM();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MTPlayerItem/cleanupItem]: Stopping existing session.", buf, 2u);
        }

        v11 = [(MTPlayerItem *)self fairPlayKeyLoader];
        v12 = [(MTPlayerItem *)self fairPlayKeySession];
        [v11 stopKeyRequestWithSession:v12 completion:0];
      }
      [(MTPlayerItem *)self setFairPlayKeySession:0];
    }
  }
  else
  {
    id v13 = [(MTPlayerItem *)self secureKeyLoader];
    [v13 sendStopRequestForStreamingLicenseIfNecessary];
  }
}

- (void)addUserAgent:(id)a3
{
  id v3 = a3;
  unsigned int v4 = _CFNetworkCopyDefaultUserAgentString();
  id v5 = v4;
  if (v4 && [v4 length])
  {
    [v3 setObject:v5 forKey:AVURLAssetHTTPUserAgentKey];
  }
  else
  {
    v6 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No or empty user agent received from CFNetwork", v7, 2u);
    }
  }
}

- (void)addServiceIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = [(MTPlayerItem *)self priceType];
    uint64_t v6 = MTEpisodePriceTypeFromPersistentString();

    CFStringRef v7 = @".external";
    if (v6 == 3) {
      CFStringRef v7 = @".hosted";
    }
    if (v6 == 2) {
      CFStringRef v8 = @".hosted.subscription";
    }
    else {
      CFStringRef v8 = v7;
    }
    unsigned __int8 v9 = [@"app.podcasts.episode" stringByAppendingString:v8];
    [v10 setObject:v9 forKey:AVURLAssetAlternativeConfigurationServiceIdentifierKey];
    [v4 setObject:v10 forKey:AVURLAssetAlternativeConfigurationOptionsKey];
  }
}

- (id)defaultAssetOptions
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[MTAVAssetCache sharedInstance];
  id v5 = [v4 assetCache];
  [v3 setObject:v5 forKey:AVURLAssetCacheKey];

  [(MTPlayerItem *)self addServiceIdentifier:v3];
  [(MTPlayerItem *)self addUserAgent:v3];

  return v3;
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MTPlayerItem;
  [(MTPlayerItem *)&v18 setAsset:v4];
  [(MTPlayerItem *)self cleanupItem];
  if (v4)
  {
    id v5 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(MTPlayerItem *)self asset];
      CFStringRef v7 = [v6 URL];
      CFStringRef v8 = [v7 absoluteString];
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set asset URL to: %@", buf, 0xCu);
    }
    if (+[MTStoreIdentifier isNotEmpty:[(MTPlayerItem *)self episodeStoreId]])
    {
      unsigned __int8 v9 = [(MTPlayerItem *)self asset];
      id v10 = [v9 URL];
      if ([v10 isHLSPlaylist])
      {
      }
      else
      {
        v11 = [(MTPlayerItem *)self asset];
        v12 = [v11 URL];
        unsigned int v13 = [v12 isPackagedMedia];

        if (!v13) {
          goto LABEL_15;
        }
      }
      v14 = +[PFFairPlayRolloutController sharedInstance];
      unsigned int v15 = [v14 isEnabled];

      v16 = _MTLogCategoryDRM();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching keys using ICContentKeySession", buf, 2u);
        }

        [(MTPlayerItem *)self prepareAssetForFairPlayPlayback:v4];
      }
      else
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching keys using IMAVSecureKeyLoader", buf, 2u);
        }

        [(MTPlayerItem *)self prepareAssetForFairPlayPlayback_legacy:v4];
      }
    }
  }
LABEL_15:
}

- (void)prepareAssetForFairPlayPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)PFFairPlayAsset) initWithAdamID:[self episodeStoreId] avAsset:v4];
  objc_initWeak(&location, self);
  uint64_t v6 = [(MTPlayerItem *)self fairPlayKeyLoader];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006EA2C;
  v8[3] = &unk_10054E230;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 createSessionWithAsset:v5 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)prepareAssetForFairPlayPlayback_legacy:(id)a3
{
  id v4 = a3;
  id v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MTPlayerItem *)self episodeStoreId];
    id v7 = [(MTPlayerItem *)self asset];
    CFStringRef v8 = [v7 URL];
    id v9 = [v8 absoluteString];
    *(_DWORD *)buf = 134218242;
    id v24 = v6;
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating secure key loader for episode %lld asset URL: %@", buf, 0x16u);
  }
  id v10 = objc_alloc((Class)IMAVSecureKeyLoader);
  v11 = +[MTAccountController sharedInstance];
  v12 = [v11 activeAccount];
  unsigned int v13 = [(MTPlayerItem *)self storeResponseDelegate];
  id v14 = [v10 initWithRecipient:v4 useCase:0 account:v12 urlProtocolDelegate:v13];

  [(MTPlayerItem *)self setSecureKeyLoader:v14];
  unsigned int v15 = [(MTPlayerItem *)self secureKeyLoader];
  [v15 setDelegate:self];

  v16 = +[NSString stringWithFormat:@"%lld", [(MTPlayerItem *)self episodeStoreId]];
  BOOL v17 = _MTLogCategoryDRM();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [(MTPlayerItem *)self episodeStoreId];
    v19 = [(MTPlayerItem *)self asset];
    v20 = [v19 URL];
    v21 = [v20 absoluteString];
    *(_DWORD *)buf = 134218242;
    id v24 = v18;
    __int16 v25 = 2112;
    v26 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Key Loading] Starting from MTPlayerItem for episode adam id %lld, asset URL: %@", buf, 0x16u);
  }
  v22 = [(MTPlayerItem *)self secureKeyLoader];
  [v22 startKeyLoadingProcessWithKeyIdentifier:0 contentAdamId:v16 isRenewal:0 completion:0];
}

- (id)createAssetForUrl:(id)a3
{
  id v4 = a3;
  id v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Creating asset for url: %@", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
  {
    if ([v4 isFileURL]) {
      [(MTPlayerItem *)self assetForLocalFile:v4];
    }
    else {
    id v6 = [(MTPlayerItem *)self assetForRemoteFile:v4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)assetForLocalFile:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AVURLAsset);
  id v6 = [(MTPlayerItem *)self defaultAssetOptions];
  id v7 = [v5 initWithURL:v4 options:v6];

  return v7;
}

- (id)assetForRemoteFile:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPlayerItem *)self defaultAssetOptions];
  id v6 = [v5 mutableCopy];

  id v7 = [objc_alloc((Class)PFMediaStreamedAssetCache) initWithSourceURL:v4];
  int v8 = [v7 cachedAssetURL];
  if (v8)
  {
    id v9 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Found media in stream cache", buf, 2u);
    }

    id v10 = [(MTPlayerItem *)self assetForLocalFile:v8];
    id v11 = 0;
  }
  else
  {
    id v23 = 0;
    uint64_t v12 = [v7 streamCacheURLAndReturnError:&v23];
    id v11 = v23;
    unsigned int v13 = _MTLogCategoryPlayback();
    id v14 = v13;
    v20 = (void *)v12;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Setting stream cache location to %@", buf, 0xCu);
      }

      [v6 setObject:v12 forKey:AVURLAssetDownloadDestinationURLKey];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = (uint64_t)v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error retrieving file url for stream cache: %@", buf, 0xCu);
      }
    }
    id v10 = [objc_alloc((Class)AVURLAsset) initWithURL:v4 options:v6];
    unsigned int v15 = +[NSNotificationCenter defaultCenter];
    uint64_t v16 = AVURLAssetDownloadCompleteSuccessNotification;
    BOOL v17 = +[NSOperationQueue mainQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006F33C;
    v21[3] = &unk_10054E258;
    id v22 = v7;
    id v18 = [v15 addObserverForName:v16 object:v10 queue:v17 usingBlock:v21];
    [(MTPlayerItem *)self setStreamCacheObserverToken:v18];
  }

  return v10;
}

- (id)episode
{
  id v3 = [(MTPlayerItem *)self episodeUuid];
  if ([v3 length])
  {

LABEL_4:
    uint64_t v14 = 0;
    unsigned int v15 = &v14;
    uint64_t v16 = 0x3032000000;
    BOOL v17 = sub_100056E60;
    id v18 = sub_100057208;
    id v19 = 0;
    id v5 = +[MTDB sharedInstance];
    id v6 = [v5 mainOrPrivateContext];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006F5D0;
    v10[3] = &unk_10054E280;
    unsigned int v13 = &v14;
    id v7 = v6;
    id v11 = v7;
    uint64_t v12 = self;
    [v7 performBlockAndWait:v10];
    id v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    goto LABEL_5;
  }
  id v4 = [(MTPlayerItem *)self episodeObjectID];

  if (v4) {
    goto LABEL_4;
  }
  id v8 = 0;
LABEL_5:

  return v8;
}

- (BOOL)isPlayable
{
  id v3 = [(MTPlayerItem *)self episode];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 assetURL];
    [(MTPlayerItem *)self reportIfLocalAssetHasiPodLibraryURL:v5];

    id v6 = [v4 reasonForNotPlayable];
    if (v6)
    {
      id v7 = v6;
      id v8 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v4 title];
        id v10 = [v4 uuid];
        int v15 = 138413058;
        uint64_t v16 = v9;
        __int16 v17 = 2114;
        id v18 = v10;
        __int16 v19 = 2048;
        id v20 = [v4 storeTrackId];
        __int16 v21 = 2050;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MTPlayerItem not playable %@ - %{public}@ - %lld with reason %{public}lu", (uint8_t *)&v15, 0x2Au);
      }
LABEL_9:

      BOOL v13 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v11 = +[MTReachability sharedInstance];
    unsigned __int8 v12 = [v11 isReachable];

    if ((v12 & 1) == 0)
    {
      id v8 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MTPlayerItem not playable. No episode found and network isn't reachable", (uint8_t *)&v15, 2u);
      }
      goto LABEL_9;
    }
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (void)reportIfLocalAssetHasiPodLibraryURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    if ([v4 hasPrefix:@"ipod-library"])
    {
      id v5 = +[PFAnalyticsEvent downloadedFileHasiPodLibraryURLWithDiscoveryPoint:@"PlaybackValidation" path:v7 source:0];
      id v6 = [(MTPlayerItem *)self analyticsChannel];
      [v6 sendEvent:v5];
    }
  }

  _objc_release_x1();
}

- (BOOL)needsNetworkToPlayButNoNetwork
{
  v2 = [(MTPlayerItem *)self episode];
  id v3 = v2;
  if (v2 && [v2 reasonForNotPlayable] != (id)2)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v4 = +[MTReachability sharedInstance];
    unsigned int v5 = [v4 isReachable] ^ 1;
  }
  return v5;
}

- (id)podcastShareUrl
{
  v16.receiver = self;
  v16.super_class = (Class)MTPlayerItem;
  id v3 = [(MTPlayerItem *)&v16 podcastShareUrl];

  if (v3)
  {
    v15.receiver = self;
    v15.super_class = (Class)MTPlayerItem;
    id v4 = [(MTPlayerItem *)&v15 podcastShareUrl];
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    unsigned __int8 v12 = sub_100056E60;
    BOOL v13 = sub_100057208;
    id v14 = 0;
    unsigned int v5 = [(MTPlayerItem *)self episode];
    id v6 = [v5 managedObjectContext];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006FA84;
    v8[3] = &unk_10054E2A8;
    v8[4] = self;
    void v8[5] = &v9;
    [v6 performBlockAndWait:v8];

    id v4 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  return v4;
}

- (BOOL)supportsArtworkUrl
{
  return 0;
}

- (void)setManifestIndex:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTPlayerItem;
  [(MTPlayerItem *)&v3 setManifestIndex:a3];
}

- (BOOL)notifyUserIsNotPlayable
{
  v2 = [(MTPlayerItem *)self episode];
  objc_super v3 = v2;
  if (v2)
  {
    id v4 = [v2 reasonForNotPlayable];
    unsigned int v5 = +[MTEpisodeUnavailableUtil sharedInstance];
    id v6 = [v3 podcast];
    id v7 = [v6 title];
    unsigned __int8 v8 = [v5 showDialogForReason:v4 podcastTitle:v7 completion:0];
  }
  else
  {
    unsigned int v5 = +[MTReachability sharedInstance];
    unsigned __int8 v8 = [v5 showInternetUnreachableDialog];
  }

  return v8;
}

- (id)subtitle
{
  objc_super v3 = objc_opt_class();
  id v4 = [(MTPlayerItem *)self author];
  unsigned int v5 = [(MTPlayerItem *)self album];
  id v6 = [v3 subtitleStringForArtist:v4 album:v5];

  return v6;
}

- (void)setAreChaptersLoaded:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTPlayerItem;
  [(MTPlayerItem *)&v3 setAreChaptersLoaded:a3];
}

- (int64_t)mpItemType
{
  if ([(MTPlayerItem *)self isVideo]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)invalidateAsset
{
  objc_super v3 = [(MTPlayerItem *)self asset];
  id v4 = [v3 debugDescription];

  unsigned int v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "invalidate asset start: %@", (uint8_t *)&buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)MTPlayerItem;
  [(MTPlayerItem *)&v16 invalidateAsset];
  id v6 = [(MTPlayerItem *)self episode];
  unsigned int v7 = [(MTPlayerItem *)self isLocal];
  char v8 = v7;
  if (v7 && [v6 isDownloaded])
  {
    uint64_t v9 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "invalidate asset is local and still downloaded. invalidate asset finished: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = [v6 managedObjectContext];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3032000000;
    __int16 v21 = sub_100056E60;
    id v22 = sub_100057208;
    id v23 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006FFCC;
    v12[3] = &unk_10054E2D0;
    char v15 = v8;
    id v13 = v6;
    p_long long buf = &buf;
    [v9 performBlockAndWait:v12];
    if ([*(id *)(*((void *)&buf + 1) + 40) length])
    {
      id v10 = +[NSURL URLWithString:*(void *)(*((void *)&buf + 1) + 40)];
      [(MTPlayerItem *)self setUrl:v10];
      uint64_t v11 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v17 = 138412290;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "invalidate asset in theory we invalidated asset: %@.", v17, 0xCu);
      }
    }
    _Block_object_dispose(&buf, 8);
  }
}

- (BOOL)upgradeToAlternatePaidVersionIfNeeded
{
  if ([(MTPlayerItem *)self paidSubscriptionActive]) {
    return 0;
  }
  uint64_t v3 = (uint64_t)[(MTPlayerItem *)self channelStoreId];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  unsigned int v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100070430;
  v33[3] = &unk_10054E2F8;
  id v7 = v6;
  id v34 = v7;
  v35 = &v37;
  uint64_t v36 = v4;
  [v7 performBlockAndWait:v33];
  if (*((unsigned char *)v38 + 24))
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_100056E60;
    v31 = sub_100057208;
    id v32 = 0;
    char v8 = [(MTPlayerItem *)self alternatePaidURL];

    if (v8)
    {
      uint64_t v9 = [(MTPlayerItem *)self alternatePaidURL];
      id v10 = (void *)v28[5];
      v28[5] = v9;
    }
    if (!v28[5])
    {
      uint64_t v11 = [(MTPlayerItem *)self episodeUuid];
      id v12 = [v11 length];

      if (v12)
      {
        id v13 = +[MTDB sharedInstance];
        id v14 = [v13 mainOrPrivateContext];

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100070490;
        v23[3] = &unk_10054DA00;
        id v15 = v14;
        id v24 = v15;
        uint64_t v25 = self;
        v26 = &v27;
        [v15 performBlockAndWait:v23];
      }
    }
    objc_super v16 = (void *)v28[5];
    if (v16
      && ([(MTPlayerItem *)self url],
          __int16 v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v16 isEqual:v17],
          v17,
          (v18 & 1) == 0))
    {
      uint64_t v20 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "We have found an alternate paid version and have upgraded the player item", (uint8_t *)v22, 2u);
      }

      [(MTPlayerItem *)self setUrl:v28[5]];
      BOOL v19 = 1;
    }
    else
    {
      BOOL v19 = 0;
    }
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    BOOL v19 = 0;
  }

  _Block_object_dispose(&v37, 8);
  return v19;
}

- (void)upgradeToLocalEpisodeBackedItemWithEpisodeUUID:(id)a3 podcastUUID:(id)a4
{
  id v6 = a3;
  [(MTPlayerItem *)self setPodcastUuid:a4];
  [(MTPlayerItem *)self setEpisodeUuid:v6];

  [(MTPlayerItem *)self updateContentItem];
}

- (id)fetchArtworkItemProviderForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = objc_alloc_init((Class)NSItemProvider);
  id v7 = [UTTypePNG identifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007065C;
  v9[3] = &unk_10054E370;
  v9[4] = self;
  *(CGFloat *)&v9[5] = width;
  *(CGFloat *)&v9[6] = height;
  [v6 registerItemForTypeIdentifier:v7 loadHandler:v9];

  return v6;
}

- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  char v8 = +[PUIObjCArtworkProvider shared];
  uint64_t v9 = [(MTPlayerItem *)self podcastUuid];

  if (v9)
  {
    id v10 = [(MTPlayerItem *)self podcastUuid];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100070A58;
    v24[3] = &unk_10054E3C0;
    id v25 = v7;
    [v8 artworkForShow:v10 size:v24 completionHandler:width, height];

    uint64_t v11 = v25;
  }
  else
  {
    id v12 = [(MTPlayerItem *)self artworkUrl];

    if (v12)
    {
      id v13 = [(MTPlayerItem *)self artworkUrl];
      id v14 = [v13 absoluteString];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100070B18;
      v22[3] = &unk_10054E3C0;
      id v23 = v7;
      [v8 artworkForURL:v14 withSize:v22 completionHandler:width, height];

      uint64_t v11 = v23;
    }
    else
    {
      id v15 = [(MTPlayerItem *)self artworkCatalog];

      if (!v15)
      {
        __int16 v17 = +[UIImage defaultPodcastArtwork];
        (*((void (**)(id, void *))v7 + 2))(v7, v17);

        goto LABEL_8;
      }
      objc_super v16 = [(MTPlayerItem *)self artworkCatalog];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100070BD8;
      v18[3] = &unk_10054E3E8;
      id v19 = v7;
      double v20 = width;
      double v21 = height;
      [v16 requestImageWithCompletionHandler:v18];

      uint64_t v11 = v19;
    }
  }

LABEL_8:
}

- (id)externalMetadata
{
  v38.receiver = self;
  v38.super_class = (Class)MTPlayerItem;
  uint64_t v3 = [(MTPlayerItem *)&v38 externalMetadata];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100056E60;
  uint64_t v36 = sub_100057208;
  id v37 = [(MTPlayerItem *)self itemDescription];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100056E60;
  v30 = sub_100057208;
  id v31 = 0;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100056E60;
  id v24 = sub_100057208;
  id v25 = 0;
  uint64_t v4 = [(MTPlayerItem *)self episodeUuid];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = +[MTDB sharedInstance];
    id v7 = [v6 mainOrPrivateContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100070FC4;
    v14[3] = &unk_10054E410;
    id v8 = v7;
    id v15 = v8;
    objc_super v16 = self;
    __int16 v17 = &v32;
    unsigned __int8 v18 = &v26;
    id v19 = &v20;
    [v8 performBlockAndWait:v14];
  }
  if ([(id)v33[5] length])
  {
    id v9 = objc_alloc_init((Class)AVMutableMetadataItem);
    [v9 setIdentifier:AVMetadataCommonIdentifierDescription];
    [v9 setExtendedLanguageTag:IMAVMetadataItemExtendedLanguageTag];
    [v9 setValue:v33[5]];
    [v3 addObject:v9];
  }
  if (v27[5])
  {
    id v10 = objc_alloc_init((Class)AVMutableMetadataItem);
    [v10 setIdentifier:AVMetadataCommonIdentifierCreationDate];
    [v10 setExtendedLanguageTag:IMAVMetadataItemExtendedLanguageTag];
    uint64_t v11 = [(id)v27[5] verboseDisplayString];
    [v10 setValue:v11];

    [v3 addObject:v10];
  }
  if ([(id)v21[5] length])
  {
    id v12 = objc_alloc_init((Class)AVMutableMetadataItem);
    [v12 setIdentifier:AVMetadataIdentifieriTunesMetadataContentRating];
    [v12 setExtendedLanguageTag:IMAVMetadataItemExtendedLanguageTag];
    [v12 setValue:v21[5]];
    [v3 addObject:v12];
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v3;
}

- (id)contentItemIdentifier
{
  v2 = [(MTPlayerItem *)self instanceIdentifier];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (id)artworkIdentifier
{
  if ([(MTPlayerItem *)self supportsChapterArtwork]
    || [(MTPlayerItem *)self supportsEpisodeArtwork])
  {
    uint64_t v3 = [(MTPlayerItem *)self _episodeArtworkIdentifier];
  }
  else
  {
    uint64_t v3 = [(MTPlayerItem *)self _podcastArtworkIdentifier];
  }

  return v3;
}

- (BOOL)supportsChapterArtwork
{
  if (![(MTPlayerItem *)self areChaptersLoaded]) {
    return 0;
  }
  uint64_t v3 = [(MTPlayerItem *)self metadataChapters];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)supportsEpisodeArtwork
{
  v2 = [(MTPlayerItem *)self episodeArtworkProperties];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_podcastArtworkIdentifier
{
  BOOL v3 = [(MTPlayerItem *)self podcastUuid];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(MTPlayerItem *)self artworkUrl];
    uint64_t v7 = [v6 absoluteString];
    id v8 = (void *)v7;
    id v9 = (void *)kMTLibraryDefaultImageKey;
    if (v7) {
      id v9 = (void *)v7;
    }
    id v5 = v9;
  }

  return v5;
}

- (id)_episodeArtworkIdentifier
{
  BOOL v3 = [(MTPlayerItem *)self _podcastArtworkIdentifier];
  BOOL v4 = [(MTPlayerItem *)self episodeUuid];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(MTPlayerItem *)self episodeGuid];
  }
  uint64_t v7 = v6;

  if ([v7 length])
  {
    id v8 = +[NSString stringWithFormat:@"%@-%@", v3, v7];
  }
  else
  {
    id v8 = v3;
  }
  id v9 = v8;

  return v9;
}

- (void)updateActivity:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTPlayerItem;
  id v4 = a3;
  [(MTPlayerItem *)&v7 updateActivity:v4];
  id v5 = [(MTPlayerItem *)self episodeGuid];
  [v4 setItemIdentifier:v5];

  id v6 = [(MTPlayerItem *)self podcastFeedUrl];
  [v4 setContainerIdentifier:v6];
}

+ (id)subtitleStringForArtist:(id)a3 album:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 length];
  id v8 = [v6 length];
  if (v7 && v8)
  {
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"NOWPLAYING_PODCAST_ARTIST_FORMAT" value:&stru_10056A8A0 table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v5, v6);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (v7)
  {
    id v12 = (__CFString *)v5;
LABEL_8:
    uint64_t v11 = v12;
    goto LABEL_9;
  }
  if (v8)
  {
    id v12 = (__CFString *)v6;
    goto LABEL_8;
  }
  uint64_t v11 = &stru_10056A8A0;
LABEL_9:

  return v11;
}

+ (id)subtitleStringForEpisode:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_100056E60;
  id v23 = sub_100057208;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  objc_super v16 = sub_100056E60;
  __int16 v17 = sub_100057208;
  id v18 = 0;
  id v5 = [v4 managedObjectContext];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000716BC;
  v9[3] = &unk_10054E438;
  uint64_t v11 = &v19;
  id v6 = v4;
  id v10 = v6;
  id v12 = &v13;
  [v5 performBlockAndWait:v9];
  id v7 = [a1 subtitleStringForArtist:v20[5] album:v14[5]];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (void)contentKeyRequestDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [(MTPlayerItem *)self episodeUuid];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Content Key Request failed for episode %@ with error: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(MTPlayerItem *)self secureKeyLoader];
  [v7 invalidateAndCancel];

  [(MTPlayerItem *)self setSecureKeyLoader:0];
  [(MTPlayerItem *)self invalidateAsset];
}

- (id)metricsContentIdentifier
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  if (+[MTStoreIdentifier isNotEmpty:[(MTPlayerItem *)self episodeStoreId]])
  {
    id v4 = +[NSString stringWithFormat:@"%lld", [(MTPlayerItem *)self episodeStoreId]];
    [v3 setObject:v4 forKeyedSubscript:@"adamId"];
  }
  id v5 = [(MTPlayerItem *)self episodeGuid];

  if (v5)
  {
    id v6 = [(MTPlayerItem *)self episodeGuid];
    [v3 setObject:v6 forKeyedSubscript:@"guid"];
  }
  id v7 = [(MTPlayerItem *)self title];

  if (v7)
  {
    int v8 = [(MTPlayerItem *)self title];
    [v3 setObject:v8 forKeyedSubscript:@"title"];
  }
  id v9 = [(MTPlayerItem *)self author];

  if (v9)
  {
    __int16 v10 = [(MTPlayerItem *)self author];
    [v3 setObject:v10 forKeyedSubscript:@"podcast"];
  }

  return v3;
}

- (NSString)storeReportingParams
{
  return self->_storeReportingParams;
}

- (void)setStoreReportingParams:(id)a3
{
}

- (_TtC10PodcastsUI23UIStoreResponseDelegate)storeResponseDelegate
{
  return self->_storeResponseDelegate;
}

- (void)setStoreResponseDelegate:(id)a3
{
}

- (PFAnalyticsChannel)analyticsChannel
{
  return self->_analyticsChannel;
}

- (void)setAnalyticsChannel:(id)a3
{
}

- (PFFairPlayKeyLoading)fairPlayKeyLoader
{
  return self->_fairPlayKeyLoader;
}

- (void)setFairPlayKeyLoader:(id)a3
{
}

- (PFFairPlayKeySession)fairPlayKeySession
{
  return self->_fairPlayKeySession;
}

- (void)setFairPlayKeySession:(id)a3
{
}

- (NSObject)streamCacheObserverToken
{
  return self->_streamCacheObserverToken;
}

- (void)setStreamCacheObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamCacheObserverToken, 0);
  objc_storeStrong((id *)&self->_fairPlayKeySession, 0);
  objc_storeStrong((id *)&self->_fairPlayKeyLoader, 0);
  objc_storeStrong((id *)&self->_analyticsChannel, 0);
  objc_storeStrong((id *)&self->_storeResponseDelegate, 0);

  objc_storeStrong((id *)&self->_storeReportingParams, 0);
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return +[MTEpisodeIdentifier identifierWithPlayerItem:self];
}

- (MTPlayerItem)initWithPodcastEpisode:(id)a3 podcast:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  MTPlayerItem.init(podcastEpisode:podcast:)(v5, a4);
  return result;
}

@end