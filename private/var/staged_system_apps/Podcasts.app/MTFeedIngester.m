@interface MTFeedIngester
+ (BOOL)_fetchSmallestPicturePossible;
+ (unint64_t)_maxArtworkSize;
+ (unint64_t)_offerTypesAsFlagBits:(id)a3;
+ (void)_markEpisodeAsFirstSeen:(id)a3;
+ (void)_markLatestEpisodeAsUnplayedIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4;
+ (void)_recalculateEpisodeLevel:(id)a3 episodeLevelCalculator:(id)a4 ctx:(id)a5;
+ (void)_sendNotificationForNewlyEntitledEpisodesIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 ctx:(id)a6;
+ (void)_unsafeFinalizeIngestion:(id)a3 episodeLevelCalculator:(id)a4 storeInfoUpdater:(id)a5 updateAverageCalculator:(id)a6 ctx:(id)a7 didUpdateAnyEpisodes:(BOOL)a8 newlyEntitledEpisodeUUIDs:(id)a9;
- (BOOL)_localPodcastExists;
- (BOOL)canSendNotifications;
- (BOOL)didUpdateFeedUrl;
- (BOOL)shouldMarkPlaylistsForUpdate;
- (BOOL)unsafeIngestShow:(id)a3;
- (MTCategoryIngesterProtocol)categoryIngester;
- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator;
- (MTFeedIngester)initWithPodcast:(id)a3 ctx:(id)a4 storeInfoUpdater:(id)a5 imageDownloader:(id)a6 imageStore:(id)a7 syncController:(id)a8 library:(id)a9 downloadManager:(id)a10 episodeLevelCalculator:(id)a11 categoryIngester:(id)a12 feedUpdateSource:(int64_t)a13 updaterJobUUID:(id)a14 canSendNotifications:(BOOL)a15;
- (MTFeedIngesterDownloadManagerProtocol)downloadManager;
- (MTFeedIngesterImageDownloaderProtocol)imageDownloader;
- (MTFeedIngesterLibraryProtocol)library;
- (MTImageStoreProtocol)imageStore;
- (MTPodcast)localPodcast;
- (MTPodcastUpdateAverageCalculator)updateAverageCalculator;
- (MTStoreInfoUpdaterProtocol)storeInfoUpdater;
- (MTSyncControllerProtocol)syncController;
- (NSManagedObjectContext)ctx;
- (NSMutableSet)newlyEntitledEpisodeUUIDs;
- (NSMutableSet)updatedEpisodeUUIDs;
- (NSString)updaterJobUUID;
- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration;
- (double)latestEpisodeDate;
- (id)_unsafeIngestEpisode:(id)a3 localEpisode:(id)a4 isNew:(BOOL)a5;
- (id)unsafeIngestEpisode:(id)a3 localEpisode:(id)a4;
- (id)unsafeIngestNewEpisode:(id)a3;
- (int64_t)feedUpdateSource;
- (int64_t)itemsDeleted;
- (int64_t)itemsIngested;
- (int64_t)itemsInserted;
- (void)_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:(id)a3 isNewEpisodeToCurrentDevice:(BOOL)a4 oldIsEntitled:(BOOL)a5 oldEnclosureURL:(id)a6 oldPriceType:(id)a7;
- (void)_reportMetrics;
- (void)_setAttributesOfLocalEpisode:(id)a3 feedEpisode:(id)a4;
- (void)_setPodcastArtwork:(id)a3;
- (void)_updatePodcastArtworksIfNeeded;
- (void)setCanSendNotifications:(BOOL)a3;
- (void)setDidUpdateFeedUrl:(BOOL)a3;
- (void)setDownloadManager:(id)a3;
- (void)setFeedUpdateSource:(int64_t)a3;
- (void)setItemsDeleted:(int64_t)a3;
- (void)setItemsIngested:(int64_t)a3;
- (void)setItemsInserted:(int64_t)a3;
- (void)setLatestEpisodeDate:(double)a3;
- (void)setShouldMarkPlaylistsForUpdate:(BOOL)a3;
- (void)setUpdaterJobUUID:(id)a3;
- (void)unsafeDeleteFeedDeletedEpisode:(id)a3;
- (void)unsafeFinalizeIngestion;
- (void)unsafeIngestPage;
@end

@implementation MTFeedIngester

- (MTFeedIngester)initWithPodcast:(id)a3 ctx:(id)a4 storeInfoUpdater:(id)a5 imageDownloader:(id)a6 imageStore:(id)a7 syncController:(id)a8 library:(id)a9 downloadManager:(id)a10 episodeLevelCalculator:(id)a11 categoryIngester:(id)a12 feedUpdateSource:(int64_t)a13 updaterJobUUID:(id)a14 canSendNotifications:(BOOL)a15
{
  id v43 = a3;
  id v42 = a4;
  id v33 = a5;
  id v41 = a5;
  id v40 = a6;
  id v34 = a7;
  id v39 = a7;
  id v38 = a8;
  id v37 = a9;
  id v36 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a14;
  v44.receiver = self;
  v44.super_class = (Class)MTFeedIngester;
  v23 = [(MTFeedIngester *)&v44 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_ctx, a4);
    objc_storeStrong((id *)&v24->_localPodcast, a3);
    uint64_t v25 = +[NSMutableSet set];
    newlyEntitledEpisodeUUIDs = v24->_newlyEntitledEpisodeUUIDs;
    v24->_newlyEntitledEpisodeUUIDs = (NSMutableSet *)v25;

    uint64_t v27 = +[NSMutableSet set];
    updatedEpisodeUUIDs = v24->_updatedEpisodeUUIDs;
    v24->_updatedEpisodeUUIDs = (NSMutableSet *)v27;

    v24->_latestEpisodeDate = 0.0;
    v24->_shouldMarkPlaylistsForUpdate = 0;
    objc_storeStrong((id *)&v24->_storeInfoUpdater, v33);
    objc_storeStrong((id *)&v24->_imageDownloader, a6);
    objc_storeStrong((id *)&v24->_imageStore, v34);
    objc_storeStrong((id *)&v24->_syncController, a8);
    objc_storeStrong((id *)&v24->_library, a9);
    objc_storeStrong((id *)&v24->_downloadManager, a10);
    objc_storeStrong((id *)&v24->_episodeLevelCalculator, a11);
    objc_storeStrong((id *)&v24->_categoryIngester, a12);
    v24->_feedUpdateSource = a13;
    objc_storeStrong((id *)&v24->_updaterJobUUID, a14);
    v24->_itemsInserted = 0;
    v24->_itemsIngested = 0;
    v24->_itemsDeleted = 0;
    v24->_canSendNotifications = a15;
    uint64_t v29 = +[FeedManagerLocalConfiguration platformSpecificConfiguration];
    configuration = v24->_configuration;
    v24->_configuration = (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration *)v29;
  }
  return v24;
}

- (id)unsafeIngestNewEpisode:(id)a3
{
  id v4 = a3;
  if ([(MTFeedIngester *)self _localPodcastExists])
  {
    [(MTSyncControllerProtocol *)self->_syncController setUppSyncDirtyFlag:1];
    v5 = +[MTEpisode insertNewEpisodeInManagedObjectContext:self->_ctx canSendNotifications:self->_canSendNotifications];
    [v5 setPodcast:self->_localPodcast];
    [v5 setImportSource:2];
    v6 = [v4 pubDate];
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;
    [(MTPodcast *)self->_localPodcast addedDate];
    double v10 = v9;

    unsigned int v11 = [(MTPodcast *)self->_localPodcast importing];
    if (v8 < v10) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    if ((v12 & 1) != 0 || ([(MTPodcast *)self->_localPodcast subscribed] & 1) == 0)
    {
      [v5 metadataTimestamp];
      double v14 = v13;
      v15 = _MTLogCategoryFeedUpdateIngester();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14 == 0.0)
      {
        if (v16)
        {
          v17 = [(MTPodcast *)self->_localPodcast uuid];
          v18 = [(MTPodcast *)self->_localPodcast title];
          v19 = [v5 uuid];
          unsigned int v20 = [v5 sentNotification];
          unsigned int v21 = [(MTPodcast *)self->_localPodcast importing];
          int v38 = 138544642;
          id v39 = v17;
          __int16 v40 = 2112;
          id v41 = v18;
          __int16 v42 = 2114;
          id v43 = v19;
          __int16 v44 = 1024;
          unsigned int v45 = v20;
          __int16 v46 = 1024;
          int v47 = v12;
          __int16 v48 = 1024;
          unsigned int v49 = v21;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Marking new feed episode as backCatalog. %{public}@, sentNotification: %d, isEpisodePublishedBeforeAddedDate: %d, podcastIsImporting: %d", (uint8_t *)&v38, 0x32u);
        }
        [v5 setPlayState:0 manually:1 source:6];
        [v5 setBackCatalog:1];
        [v5 setMetadataTimestamp:0.0];
        [v5 setMetadataFirstSyncEligible:0];
      }
      else
      {
        if (v16)
        {
          v26 = [(MTPodcast *)self->_localPodcast uuid];
          uint64_t v27 = [(MTPodcast *)self->_localPodcast title];
          v28 = [v5 uuid];
          unsigned int v29 = [v5 sentNotification];
          unsigned int v30 = [(MTPodcast *)self->_localPodcast importing];
          [v5 metadataTimestamp];
          int v38 = 138544898;
          id v39 = v26;
          __int16 v40 = 2112;
          id v41 = v27;
          __int16 v42 = 2114;
          id v43 = v28;
          __int16 v44 = 1024;
          unsigned int v45 = v29;
          __int16 v46 = 1024;
          int v47 = v12;
          __int16 v48 = 1024;
          unsigned int v49 = v30;
          __int16 v50 = 2048;
          uint64_t v51 = v31;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ New feed episode already has a metadataTimestamp. Setting isNew to false. %{public}@, sentNotification: %d, isEpisodePublishedBeforeAddedDate: %d, podcastIsImporting: %d, metadataTimestamp: %f", (uint8_t *)&v38, 0x3Cu);
        }
        [v5 setIsNew:0];
      }
      [v5 suppressAutomaticDownloadsIfNeeded];
    }
    [v5 setEpisodeLevel:+[MTEpisodeLevelCalculator uncalculatedLevel]];
    v32 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [(MTPodcast *)self->_localPodcast uuid];
      id v34 = [(MTPodcast *)self->_localPodcast title];
      v35 = [v5 uuid];
      unsigned int v36 = [v5 sentNotification];
      int v38 = 138544130;
      id v39 = v33;
      __int16 v40 = 2112;
      id v41 = v34;
      __int16 v42 = 2114;
      id v43 = v35;
      __int16 v44 = 1024;
      unsigned int v45 = v36;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ new episode %{public}@, sentNotification: %d", (uint8_t *)&v38, 0x26u);
    }
    ++self->_itemsInserted;
    uint64_t v25 = [(MTFeedIngester *)self _unsafeIngestEpisode:v4 localEpisode:v5 isNew:1];
  }
  else
  {
    id v22 = [v4 episodeStoreId];
    id v23 = [v22 longLongValue];

    v5 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v24 = +[NSNumber numberWithLongLong:v23];
      int v38 = 138412290;
      id v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ - could not ingest new feed episode because ingester local podcast does not exist", (uint8_t *)&v38, 0xCu);
    }
    uint64_t v25 = 0;
  }

  return v25;
}

- (id)unsafeIngestEpisode:(id)a3 localEpisode:(id)a4
{
  return [(MTFeedIngester *)self _unsafeIngestEpisode:a3 localEpisode:a4 isNew:0];
}

- (id)_unsafeIngestEpisode:(id)a3 localEpisode:(id)a4 isNew:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v9 podcast];
    int v12 = [v11 uuid];
    double v13 = [v9 podcast];
    [v13 title];
    id v82 = v8;
    double v14 = self;
    BOOL v16 = v15 = v5;
    v17 = [v9 uuid];
    v18 = [v9 title];
    *(_DWORD *)buf = 138544130;
    v84 = v12;
    __int16 v85 = 2112;
    id v86 = v16;
    __int16 v87 = 2114;
    v88 = v17;
    __int16 v89 = 2112;
    v90 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updating episode %{public}@ - %@", buf, 0x2Au);

    BOOL v5 = v15;
    self = v14;
    id v8 = v82;
  }
  v19 = [v9 podcast];
  unsigned int v20 = [v19 uuid];
  unsigned int v21 = [(MTPodcast *)self->_localPodcast uuid];
  unsigned __int8 v22 = [v20 isEqualToString:v21];

  if (v22)
  {
    [(MTFeedIngester *)self _setAttributesOfLocalEpisode:v9 feedEpisode:v8];
    id v23 = [(MTPodcast *)self->_localPodcast channel];

    if (v23)
    {
      v24 = [(MTPodcast *)self->_localPodcast channel];
      unsigned int v25 = [v24 subscriptionActive];
    }
    else
    {
      unsigned int v25 = 0;
    }
    id v34 = [v9 isEntitled];
    v26 = [v9 priceType];
    v35 = [v9 enclosureURL];
    [v8 entitledDuration];
    if (v36 > 0.0)
    {
      [v8 entitledDuration];
      [v9 setEntitledDuration:];
    }
    [v8 duration];
    if (v37 > 0.0)
    {
      [v8 duration];
      [v9 setFreeDuration:];
    }
    int v38 = [v8 entitledEnclosureURL];
    [v9 setEntitledEnclosureURL:v38];

    id v39 = [v8 resolvedEnclosureUrl];
    [v9 setFreeEnclosureURL:v39];

    __int16 v40 = [v8 priceType];
    [v9 setFreePriceType:v40];

    id v41 = [v8 entitledPriceType];
    [v9 setEntitledPriceType:v41];

    __int16 v42 = [v8 entitledTranscriptIdentifier];
    [v9 setEntitledTranscriptIdentifier:v42];

    id v43 = [v8 freeTranscriptIdentifier];
    [v9 setFreeTranscriptIdentifier:v43];

    __int16 v44 = [v8 entitledTranscriptSnippet];
    [v9 setEntitledTranscriptSnippet:v44];

    unsigned int v45 = [v8 freeTranscriptSnippet];
    [v9 setFreeTranscriptSnippet:v45];

    __int16 v46 = [v8 entitledTranscriptProvider];
    [v9 setEntitledTranscriptProvider:v46];

    int v47 = [v8 freeTranscriptProvider];
    [v9 setFreeTranscriptProvider:v47];

    if (v25)
    {
      [v8 entitledDuration];
      if (v48 > 0.0)
      {
        [v8 entitledDuration];
        [v9 setDuration:];
      }
      unsigned int v49 = [v8 entitledEnclosureURL];

      if (v49)
      {
        __int16 v50 = [v8 entitledEnclosureURL];
        [v9 setEnclosureURL:v50];
      }
      uint64_t v51 = [v8 entitledPriceType];
      [v9 setPriceType:v51];

      uint64_t v52 = [v8 entitledTranscriptIdentifier];
    }
    else
    {
      [v9 freeDuration];
      if (v53 > 0.0 && [v9 allowsDurationUpdateFromSource:6])
      {
        [v9 freeDuration];
        [v9 setDuration:];
      }
      v54 = [v9 freeEnclosureURL];
      [v9 setEnclosureURL:v54];

      v55 = [v9 freePriceType];
      [v9 setPriceType:v55];

      uint64_t v52 = [v9 freeTranscriptIdentifier];
    }
    v56 = (void *)v52;
    [v9 setTranscriptIdentifier:v52];

    [(MTFeedIngester *)self _handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:v9 isNewEpisodeToCurrentDevice:v5 oldIsEntitled:v34 oldEnclosureURL:v35 oldPriceType:v26];
    if (v5)
    {
      [v9 updateEntitlementState];
      v57 = _MTLogCategoryFeedUpdateIngester();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = [v9 uuid];
        id v59 = [v9 entitlementState];
        *(_DWORD *)buf = 138543618;
        v84 = v58;
        __int16 v85 = 2048;
        id v86 = v59;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ - set entitlement state for inserted episode to %lld for new episode from unsafeIngestEpisode", buf, 0x16u);
      }
    }
    v60 = [v8 pubDate];
    [v60 timeIntervalSinceReferenceDate];
    double v62 = v61;
    [(MTPodcast *)self->_localPodcast addedDate];
    double v64 = v63;

    if (v5 && v62 >= v64)
    {
      if ([v9 isEntitled])
      {
        id v65 = [(MTPodcast *)self->_localPodcast isDark];
        v66 = (char *)[(MTPodcast *)self->_localPodcast darkCount] + 1;
        [(MTPodcast *)self->_localPodcast setDarkCount:v66];
        [(MTPodcast *)self->_localPodcast setDarkCountLocal:v66];
        [(MTPodcast *)self->_localPodcast markPlaylistsForUpdate];
        if (v65 != [(MTPodcast *)self->_localPodcast isDark])
        {
          id v67 = [(MTPodcast *)self->_localPodcast isDark];
          v68 = [(MTPodcast *)self->_localPodcast latestExitFromDarkDownloads];
          if (v68)
          {
            v69 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v65 isDark:v67 reason:2 previousExit:v68];
          }
          else
          {
            v70 = +[NSDate now];
            v69 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v65 isDark:v67 reason:2 previousExit:v70];
          }
          v71 = objc_opt_new();
          [v71 sendEvent:v69];
        }
      }
    }
    [v9 resolveAvailabilityDate];
    [v9 firstTimeAvailable];
    double v73 = v72;
    [(MTFeedIngester *)self latestEpisodeDate];
    if (v73 > v74 && [v9 isMedia])
    {
      [v9 firstTimeAvailable];
      self->_latestEpisodeDate = v75;
    }
    updatedEpisodeUUIDs = self->_updatedEpisodeUUIDs;
    v77 = [v9 uuid];
    [(NSMutableSet *)updatedEpisodeUUIDs addObject:v77];

    v78 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v79 = [v9 uuid];
      v80 = [v9 title];
      *(_DWORD *)buf = 138543874;
      v84 = v79;
      __int16 v85 = 2112;
      id v86 = v80;
      __int16 v87 = 1024;
      LODWORD(v88) = v5;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updated episode from feed - isNew %x", buf, 0x1Cu);
    }
    ++self->_itemsIngested;
    id v33 = v9;
  }
  else
  {
    v26 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v9 podcast];
      v28 = [v27 uuid];
      unsigned int v29 = [v9 podcast];
      unsigned int v30 = [v29 title];
      uint64_t v31 = [(MTPodcast *)self->_localPodcast uuid];
      v32 = [(MTPodcast *)self->_localPodcast title];
      *(_DWORD *)buf = 138544130;
      v84 = v28;
      __int16 v85 = 2112;
      id v86 = v30;
      __int16 v87 = 2114;
      v88 = v31;
      __int16 v89 = 2112;
      v90 = v32;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@ - %@ podcast for episode does not match podcast for ingester %{public}@ - %@", buf, 0x2Au);
    }
    id v33 = 0;
  }

  return v33;
}

- (void)unsafeDeleteFeedDeletedEpisode:(id)a3
{
  id v4 = a3;
  BOOL v5 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MTPodcast *)self->_localPodcast uuid];
    double v7 = [(MTPodcast *)self->_localPodcast title];
    id v8 = [v4 uuid];
    id v9 = [v4 title];
    int v10 = 138544130;
    unsigned int v11 = v6;
    __int16 v12 = 2112;
    double v13 = v7;
    __int16 v14 = 2114;
    BOOL v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ deleting episode removed from feed %{public}@ - %@", (uint8_t *)&v10, 0x2Au);
  }
  [v4 setFeedDeleted:1];
  self->_shouldMarkPlaylistsForUpdate = 1;
  ++self->_itemsDeleted;
}

- (BOOL)unsafeIngestShow:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    double v7 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = [(MTPodcast *)self->_localPodcast uuid];
      *(_DWORD *)buf = 138543362;
      id v114 = v40;
      id v41 = "%{public}@ failed to update because feed was nil";
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
    }
LABEL_28:
    BOOL v42 = 0;
    goto LABEL_73;
  }
  if (![(MTFeedIngester *)self _localPodcastExists])
  {
    double v7 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = [v4 podcastStoreId];
      *(_DWORD *)buf = 138412290;
      id v114 = v40;
      id v41 = "%@ - could not ingest feed podcast because ingester local podcast does not exist";
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  BOOL v5 = [v4 podcastStoreId];
  id v6 = [v5 longLongValue];

  if (+[MTStoreIdentifier isNotEmpty:v6]) {
    [(MTPodcast *)self->_localPodcast setStoreCollectionId:v6];
  }
  double v7 = [v4 updatedFeedURL];
  if (+[MTDBUtil isSupportedUrlString:v7])
  {
    id v8 = [(MTPodcast *)self->_localPodcast currentFeedURL];
    id v9 = [v8 absoluteString];
    unsigned __int8 v10 = [v7 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      unsigned int v11 = _MTLogCategoryFeedUpdateIngester();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [(MTPodcast *)self->_localPodcast currentFeedURL];
        double v13 = [v12 absoluteString];
        *(_DWORD *)buf = 134218498;
        id v114 = v6;
        __int16 v115 = 2112;
        v116 = v7;
        __int16 v117 = 2112;
        v118 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%lld Found different updatedFeedURL %@ from %@", buf, 0x20u);
      }
      [(MTPodcast *)self->_localPodcast setUpdatedFeedURL:v7];
      self->_didUpdateFeedUrl = 1;
    }
  }
  __int16 v14 = [v4 resolvedFeedURL];
  if ([v14 length])
  {
    BOOL v15 = [(MTPodcast *)self->_localPodcast currentFeedURL];
    __int16 v16 = [v15 absoluteString];
    unsigned __int8 v17 = [v14 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      v18 = _MTLogCategoryFeedUpdateIngester();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(MTPodcast *)self->_localPodcast currentFeedURL];
        unsigned int v20 = [v19 absoluteString];
        *(_DWORD *)buf = 134218498;
        id v114 = v6;
        __int16 v115 = 2112;
        v116 = v14;
        __int16 v117 = 2112;
        v118 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%lld Found different feedURL %@ from %@", buf, 0x20u);
      }
      [(MTPodcast *)self->_localPodcast setUpdatedFeedURL:v14];
      self->_didUpdateFeedUrl = 1;
    }
  }
  localPodcast = self->_localPodcast;
  unsigned __int8 v22 = [v4 title];
  id v23 = [v22 stringByStrippingHTML];
  v24 = [v23 stringByRemovingNewlineCharacters];
  [(MTPodcast *)localPodcast setTitle:v24];

  unsigned int v25 = self->_localPodcast;
  v26 = [v4 author];
  uint64_t v27 = [v26 stringByStrippingHTML];
  [(MTPodcast *)v25 setAuthor:v27];

  v28 = self->_localPodcast;
  unsigned int v29 = [v4 provider];
  unsigned int v30 = [v29 stringByStrippingHTML];
  [(MTPodcast *)v28 setProvider:v30];

  -[MTPodcast setIsExplicit:](self->_localPodcast, "setIsExplicit:", [v4 isExplicit]);
  uint64_t v31 = self->_localPodcast;
  v32 = [v4 feedDescription];
  [(MTPodcast *)v31 setItemDescription:v32];

  id v33 = [v4 showType];
  id v34 = +[MTPodcast showTypeFromString:v33];
  v35 = [(MTPodcast *)self->_localPodcast showTypeInFeed];
  id v36 = +[MTPodcast showTypeFromString:v35];

  BOOL v38 = v34 == (id)2 && v36 != (id)2;
  BOOL v39 = v34 == (id)1 && [(MTPodcast *)self->_localPodcast showTypeSetting] == (id)2;
  unsigned int v43 = [(MTPodcast *)self->_localPodcast subscribed];
  [(MTPodcast *)self->_localPodcast setShowTypeInFeed:v33];
  if (((v43 ^ 1 | v38) & 1) != 0 || v39) {
    [(MTPodcast *)self->_localPodcast setShowTypeSetting:v34];
  }
  __int16 v44 = self->_localPodcast;
  unsigned int v45 = [v4 category];
  [(MTPodcast *)v44 setCategory:v45];

  __int16 v46 = self->_localPodcast;
  int v47 = [v4 webpageURL];
  [(MTPodcast *)v46 setWebpageURL:v47];

  double v48 = self->_localPodcast;
  unsigned int v49 = [v4 shareURL];
  [(MTPodcast *)v48 setStoreCleanURL:v49];

  __int16 v50 = self->_localPodcast;
  uint64_t v51 = [v4 showSpecificUpsellCopy];
  [(MTPodcast *)v50 setShowSpecificUpsellCopy:v51];

  -[MTPodcast setOfferTypes:](self->_localPodcast, "setOfferTypes:", [(id)objc_opt_class() _offerTypesAsFlagBits:v4]);
  uint64_t v52 = [v4 displayType];
  if (v52)
  {
    double v53 = (void *)v52;
    v54 = [v4 displayType];
    unsigned int v55 = [v54 isNotEmpty];

    if (v55)
    {
      v56 = [v4 displayType];
      [(MTPodcast *)self->_localPodcast setDisplayType:v56];
    }
  }
  v57 = [v4 channelItem];

  if (v57)
  {
    v58 = [v4 channelItem];
    id v59 = +[MTChannel createOrFindChannelFromFeedChannelItem:v58 personalizedRequest:0 context:self->_ctx];

    [(MTPodcast *)self->_localPodcast setChannel:v59];
    v60 = -[NSManagedObjectContext unsafeInterestForAdamID:](self->_ctx, "unsafeInterestForAdamID:", [v59 storeId]);
    if (v60)
    {
      [v59 setInterest:v60];
      [v60 setChannel:v59];
    }
  }
  else
  {
    [(MTPodcast *)self->_localPodcast setChannel:0];
  }
  [(MTFeedIngester *)self _setPodcastArtwork:v4];
  uint64_t v61 = [v4 categories];
  if (v61
    && (double v62 = (void *)v61,
        [v4 categories],
        double v63 = objc_claimAutoreleasedReturnValue(),
        id v64 = [v63 count],
        v63,
        v62,
        v64))
  {
    v100 = v33;
    v101 = v14;
    v102 = v7;
    id v65 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = [(MTPodcast *)self->_localPodcast uuid];
      id v67 = [v4 categories];
      v68 = [v67 count];
      *(_DWORD *)buf = 138543618;
      id v114 = v66;
      __int16 v115 = 2048;
      v116 = v68;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ - Ingesting %lu categories.", buf, 0x16u);
    }
    v69 = objc_opt_new();
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v99 = v4;
    v70 = [v4 categories];
    id v71 = [v70 countByEnumeratingWithState:&v107 objects:v112 count:16];
    if (v71)
    {
      id v72 = v71;
      uint64_t v73 = *(void *)v108;
      do
      {
        for (i = 0; i != v72; i = (char *)i + 1)
        {
          if (*(void *)v108 != v73) {
            objc_enumerationMutation(v70);
          }
          double v75 = [(MTCategoryIngesterProtocol *)self->_categoryIngester unsafeIngestFeedCategory:*(void *)(*((void *)&v107 + 1) + 8 * i) ctx:self->_ctx];
          if (v75)
          {
            [v69 addObject:v75];
            v76 = [v75 podcasts];
            v77 = [v76 setByAddingObject:self->_localPodcast];
            [v75 setPodcasts:v77];

            v78 = _MTLogCategoryFeedUpdateIngester();
            if (!os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_56;
            }
            v79 = [(MTPodcast *)self->_localPodcast uuid];
            v80 = [v75 adamID];
            *(_DWORD *)buf = 138543618;
            id v114 = v79;
            __int16 v115 = 2048;
            v116 = v80;
            v81 = v78;
            id v82 = "%{public}@ - Related category to show. Category ID: %llu";
          }
          else
          {
            v78 = _MTLogCategoryFeedUpdateIngester();
            if (!os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_56;
            }
            v79 = [(MTPodcast *)self->_localPodcast uuid];
            v83 = [0 adamID];
            *(_DWORD *)buf = 138543618;
            id v114 = v79;
            __int16 v115 = 2048;
            v116 = v83;
            v81 = v78;
            id v82 = "%{public}@ - Could not ingest category for show. Category ID: %llu";
          }
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, v82, buf, 0x16u);

LABEL_56:
        }
        id v72 = [v70 countByEnumeratingWithState:&v107 objects:v112 count:16];
      }
      while (v72);
    }

    [(MTPodcast *)self->_localPodcast setCategories:v69];
    v84 = [v69 firstObject];
    [(MTPodcast *)self->_localPodcast setPrimaryCategory:v84];

    id v4 = v99;
  }
  else
  {
    __int16 v85 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      id v86 = [(MTPodcast *)self->_localPodcast uuid];
      *(_DWORD *)buf = 138543362;
      id v114 = v86;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}@ - Show has no categories. Disassociating categories if needed.", buf, 0xCu);
    }
    __int16 v87 = objc_opt_new();
    [(MTPodcast *)self->_localPodcast setCategories:v87];

    [(MTPodcast *)self->_localPodcast setPrimaryCategory:0];
    v69 = [(NSManagedObjectContext *)self->_ctx unsafeCategoriesWithRelationshipToPodcastAdamID:[(MTPodcast *)self->_localPodcast storeCollectionId]];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v88 = [v69 countByEnumeratingWithState:&v103 objects:v111 count:16];
    if (!v88) {
      goto LABEL_70;
    }
    id v89 = v88;
    v100 = v33;
    v101 = v14;
    v102 = v7;
    id v90 = v4;
    uint64_t v91 = *(void *)v104;
    do
    {
      for (j = 0; j != v89; j = (char *)j + 1)
      {
        if (*(void *)v104 != v91) {
          objc_enumerationMutation(v69);
        }
        v93 = *(void **)(*((void *)&v103 + 1) + 8 * (void)j);
        v94 = [v93 podcasts];
        v95 = +[NSMutableSet setWithSet:v94];

        [v95 removeObject:self->_localPodcast];
        [v93 setPodcasts:v95];
      }
      id v89 = [v69 countByEnumeratingWithState:&v103 objects:v111 count:16];
    }
    while (v89);
    id v4 = v90;
  }
  __int16 v14 = v101;
  double v7 = v102;
  id v33 = v100;
LABEL_70:

  v96 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    v97 = [(MTPodcast *)self->_localPodcast uuid];
    *(_DWORD *)buf = 138543362;
    id v114 = v97;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%{public}@ - updated podcast from feed", buf, 0xCu);
  }
  BOOL v42 = 1;
LABEL_73:

  return v42;
}

- (void)unsafeIngestPage
{
  [(MTFeedIngester *)self _reportMetrics];
  localPodcast = self->_localPodcast;
  +[NSDate timeIntervalSinceReferenceDate];
  -[MTPodcast setUpdatedDate:](localPodcast, "setUpdatedDate:");
  [(MTPodcast *)self->_localPodcast setConsecutiveFeedFetchErrors:0];
  double latestEpisodeDate = self->_latestEpisodeDate;
  [(MTPodcast *)self->_localPodcast feedChangedDate];
  if (latestEpisodeDate > v5) {
    [(MTPodcast *)self->_localPodcast setFeedChangedDate:self->_latestEpisodeDate];
  }
  [(MTFeedIngester *)self _updatePodcastArtworksIfNeeded];
  id v6 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [(MTPodcast *)self->_localPodcast uuid];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - finished ingestion of page of podcast from feed", (uint8_t *)&v8, 0xCu);
  }
}

- (void)unsafeFinalizeIngestion
{
  if (self->_shouldMarkPlaylistsForUpdate) {
    [(MTPodcast *)self->_localPodcast markPlaylistsForUpdate];
  }
  +[MTFeedIngester _unsafeFinalizeIngestion:self->_localPodcast episodeLevelCalculator:self->_episodeLevelCalculator storeInfoUpdater:self->_storeInfoUpdater updateAverageCalculator:self->_updateAverageCalculator ctx:self->_ctx didUpdateAnyEpisodes:[(NSMutableSet *)self->_updatedEpisodeUUIDs count] != 0 newlyEntitledEpisodeUUIDs:self->_newlyEntitledEpisodeUUIDs];
}

+ (void)_unsafeFinalizeIngestion:(id)a3 episodeLevelCalculator:(id)a4 storeInfoUpdater:(id)a5 updateAverageCalculator:(id)a6 ctx:(id)a7 didUpdateAnyEpisodes:(BOOL)a8 newlyEntitledEpisodeUUIDs:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (v9)
  {
    +[MTFeedIngester _recalculateEpisodeLevel:v14 episodeLevelCalculator:v15 ctx:v18];
  }
  else
  {
    unsigned int v20 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      unsigned int v21 = [v14 uuid];
      *(_DWORD *)buf = 138543362;
      BOOL v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@ - no episodes processed, skipping episode level recalculation", buf, 0xCu);
    }
  }
  unsigned __int8 v22 = [v14 newestEpisodeByAvailabiltyTime];
  id v23 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [v14 uuid];
    [v14 title];
    id v36 = v15;
    unsigned int v25 = v37 = v16;
    [v22 uuid];
    id v26 = v19;
    id v27 = v18;
    unsigned int v29 = v28 = v17;
    unsigned int v30 = [v22 title];
    id v31 = [v22 storeTrackId];
    *(_DWORD *)buf = 138544386;
    BOOL v39 = v24;
    __int16 v40 = 2112;
    id v41 = v25;
    __int16 v42 = 2114;
    unsigned int v43 = v29;
    __int16 v44 = 2112;
    unsigned int v45 = v30;
    __int16 v46 = 2048;
    id v47 = v31;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking latest episode as unplayed if needed %{public}@ - %@ - %lld", buf, 0x34u);

    id v17 = v28;
    id v18 = v27;
    id v19 = v26;

    id v15 = v36;
    id v16 = v37;
  }
  +[MTFeedIngester _markLatestEpisodeAsUnplayedIfNeeded:v14 latestEpisodeInPodcast:v22];
  +[MTFeedIngester _sendNotificationForNewlyEntitledEpisodesIfNeeded:v14 latestEpisodeInPodcast:v22 newlyEntitledEpisodeUUIDs:v19 ctx:v18];
  [v22 firstTimeAvailable];
  [v14 setLatestEpisodeAvailabilityTime:];
  [v14 setAuthenticatedDark:0];
  [v14 setFeedUpdateNeedsRetry:0];
  if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", [v14 storeCollectionId]))
  {
    v32 = [v14 uuid];
    [v16 updateStoreInfoForPodcast:v32];
  }
  id v33 = [v14 latestExitFromDarkDownloads];
  if (v33) {
    [v14 suppressEpisodesWithBasisDate:v33];
  }
  id v34 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [v14 uuid];
    *(_DWORD *)buf = 138543362;
    BOOL v39 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ - finished ingestion of podcast from feed", buf, 0xCu);
  }
}

- (BOOL)_localPodcastExists
{
  localPodcast = self->_localPodcast;
  if (localPodcast && ![(MTPodcast *)localPodcast isDeleted]) {
    return 1;
  }
  id v4 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    double v5 = [(MTPodcast *)self->_localPodcast uuid];
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@ - local podcast was deleted. Cannot ingest", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)_setAttributesOfLocalEpisode:(id)a3 feedEpisode:(id)a4
{
  id v55 = a3;
  id v6 = a4;
  [v55 setFeedDeleted:0];
  int v7 = [v6 guid];
  [v55 setGuid:v7];

  int v8 = [v6 episodeStoreId];
  id v9 = [v8 longLongValue];

  if (+[MTStoreIdentifier isNotEmpty:v9]) {
    [v55 setStoreTrackId:v9];
  }
  unsigned __int8 v10 = [v6 title];
  unsigned int v11 = [v10 stringByStrippingHTML];

  [v55 setTitle:v11];
  __int16 v12 = [v6 itunesTitle];
  [v55 setItunesTitle:v12];

  double v13 = [(MTFeedIngester *)self configuration];
  LODWORD(v12) = [v13 usesCleanEpisodeTitles];

  if (v12)
  {
    id v14 = [v55 podcast];
    id v15 = [v14 title];
    id v16 = [v11 cleanedTitleStringWithPrefix:v15];
    [v55 setCleanedTitle:v16];
  }
  id v17 = [v6 itemDescription];
  [v55 setItemDescription:v17];

  id v18 = [v6 itemSummary];
  [v55 setItunesSubtitle:v18];

  id v19 = [v6 author];
  [v55 setAuthor:v19];

  objc_msgSend(v55, "setByteSize:", objc_msgSend(v6, "byteSize"));
  unsigned int v20 = [v6 uti];
  [v55 setUti:v20];

  uint64_t v21 = [v6 pubDate];
  if (v21)
  {
    unsigned __int8 v22 = (void *)v21;
    [v55 pubDate];
    double v24 = v23;
    unsigned int v25 = [v6 pubDate];
    [v25 timeIntervalSinceReferenceDate];
    double v27 = v26;

    if (v24 != v27)
    {
      id v28 = [v6 pubDate];
      [v28 timeIntervalSinceReferenceDate];
      [v55 setPubDate:];
    }
  }
  uint64_t v29 = [v6 firstTimeAvailableAsPaid];
  if (v29)
  {
    unsigned int v30 = (void *)v29;
    [v55 firstTimeAvailableAsPaid];
    double v32 = v31;
    id v33 = [v6 firstTimeAvailableAsPaid];
    [v33 timeIntervalSinceReferenceDate];
    double v35 = v34;

    if (v32 != v35)
    {
      id v36 = [v6 firstTimeAvailableAsPaid];
      [v36 timeIntervalSinceReferenceDate];
      [v55 setFirstTimeAvailableAsPaid:];
    }
  }
  uint64_t v37 = [v6 firstTimeAvailableAsFree];
  if (v37)
  {
    BOOL v38 = (void *)v37;
    [v55 firstTimeAvailableAsFree];
    double v40 = v39;
    id v41 = [v6 firstTimeAvailableAsFree];
    [v41 timeIntervalSinceReferenceDate];
    double v43 = v42;

    if (v40 != v43)
    {
      __int16 v44 = [v6 firstTimeAvailableAsFree];
      [v44 timeIntervalSinceReferenceDate];
      [v55 setFirstTimeAvailableAsFree:];
    }
  }
  if ([v6 trackNum]) {
    [v55 setTrackNum:[v6 trackNum]];
  }
  [v55 setExplicit:[v6 isExplicit]];
  unsigned int v45 = [v6 episodeType];
  [v55 setEpisodeType:v45];

  id v46 = [v55 episodeNumber];
  if (v46 != [v6 episodeNumber]) {
    [v55 setEpisodeNumber:[v6 episodeNumber]];
  }
  id v47 = [v55 seasonNumber];
  if (v47 != [v6 seasonNumber]) {
    [v55 setSeasonNumber:[v6 seasonNumber]];
  }
  double v48 = [v6 webpageURL];
  [v55 setWebpageURL:v48];

  [v55 setIsHidden:0];
  unsigned int v49 = [v6 artworkTemplateURL];
  [v55 setArtworkTemplateURL:v49];

  [v6 artworkWidth];
  [v55 setArtworkWidth:];
  [v6 artworkHeight];
  [v55 setArtworkHeight:];
  __int16 v50 = [v6 artworkBackgroundColor];
  [v55 setArtworkBackgroundColor:v50];

  uint64_t v51 = [v6 artworkTextPrimaryColor];
  [v55 setArtworkTextPrimaryColor:v51];

  uint64_t v52 = [v6 artworkTextSecondaryColor];
  [v55 setArtworkTextSecondaryColor:v52];

  double v53 = [v6 artworkTextTertiaryColor];
  [v55 setArtworkTextTertiaryColor:v53];

  v54 = [v6 artworkTextQuaternaryColor];
  [v55 setArtworkTextQuaternaryColor:v54];
}

- (void)_setPodcastArtwork:(id)a3
{
  id v4 = a3;
  double v5 = [v4 imageURL];
  if ([v5 length]) {
    [v4 imageURL];
  }
  else {
  id v6 = [v4 globalImageURL];
  }

  if ([(id)objc_opt_class() _fetchSmallestPicturePossible])
  {
    int v7 = +[MTResizedArtworkURLProvider sharedInstance];
    uint64_t v8 = [v7 resizedArtworkURLString:v6 withDimension:[objc_opt_class() _maxArtworkSize]];

    id v6 = (void *)v8;
  }
  if (v6)
  {
    id v9 = [(MTPodcast *)self->_localPodcast imageURL];
    unsigned __int8 v10 = [v9 isEqualToString:v6];

    if ((v10 & 1) == 0)
    {
      unsigned int v11 = _MTLogCategoryFeedUpdateIngester();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [(MTPodcast *)self->_localPodcast uuid];
        double v13 = [(MTPodcast *)self->_localPodcast title];
        int v27 = 138543874;
        id v28 = v12;
        __int16 v29 = 2112;
        unsigned int v30 = v13;
        __int16 v31 = 2112;
        double v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ artwork url did change %@", (uint8_t *)&v27, 0x20u);
      }
      [(MTPodcast *)self->_localPodcast setNeedsArtworkUpdate:1];
      id v14 = +[PUIFeedManagerArtworkBridge shared];
      [v14 invalidateArtworkForPodcast:self->_localPodcast];
    }
  }
  [(MTPodcast *)self->_localPodcast setImageURL:v6];
  id v15 = [v4 artworkTemplateURL];
  [(MTPodcast *)self->_localPodcast setArtworkTemplateURL:v15];

  id v16 = [v4 artworkPrimaryColor];
  [(MTPodcast *)self->_localPodcast setArtworkPrimaryColor:v16];

  id v17 = [v4 artworkTextPrimaryColor];
  [(MTPodcast *)self->_localPodcast setArtworkTextPrimaryColor:v17];

  id v18 = [v4 artworkTextSecondaryColor];
  [(MTPodcast *)self->_localPodcast setArtworkTextSecondaryColor:v18];

  id v19 = [v4 artworkTextTertiaryColor];
  [(MTPodcast *)self->_localPodcast setArtworkTextTertiaryColor:v19];

  unsigned int v20 = [v4 artworkTextQuaternaryColor];
  [(MTPodcast *)self->_localPodcast setArtworkTextQuaternaryColor:v20];

  uint64_t v21 = [v4 uberBackgroundImageURL];
  [(MTPodcast *)self->_localPodcast setUberBackgroundImageURL:v21];

  unsigned __int8 v22 = [v4 uberBackgroundJoeColor];
  [(MTPodcast *)self->_localPodcast setUberBackgroundJoeColor:v22];

  double v23 = [v4 uberArtworkTextPrimaryColor];
  [(MTPodcast *)self->_localPodcast setUberArtworkTextPrimaryColor:v23];

  double v24 = [v4 uberArtworkTextSecondaryColor];
  [(MTPodcast *)self->_localPodcast setUberArtworkTextSecondaryColor:v24];

  unsigned int v25 = [v4 uberArtworkTextTertiaryColor];
  [(MTPodcast *)self->_localPodcast setUberArtworkTextTertiaryColor:v25];

  double v26 = [v4 uberArtworkTextQuaternaryColor];
  [(MTPodcast *)self->_localPodcast setUberArtworkTextQuaternaryColor:v26];
}

- (void)_reportMetrics
{
  id v21 = +[MTFeedUpdateMetricsDataKey newEpisodeCount];
  v26[0] = v21;
  unsigned int v20 = +[NSNumber numberWithInteger:self->_itemsInserted];
  v27[0] = v20;
  id v19 = +[MTFeedUpdateMetricsDataKey deletedEpisodeCount];
  v26[1] = v19;
  id v18 = +[NSNumber numberWithInteger:self->_itemsDeleted];
  v27[1] = v18;
  id v17 = +[MTFeedUpdateMetricsDataKey updatedEpisodeCount];
  v26[2] = v17;
  id v16 = +[NSNumber numberWithInteger:self->_itemsIngested - self->_itemsInserted];
  v27[2] = v16;
  id v15 = +[MTFeedUpdateMetricsDataKey totalEpisodeCount];
  v26[3] = v15;
  v3 = +[NSNumber numberWithInteger:self->_itemsDeleted + self->_itemsIngested];
  v27[3] = v3;
  id v4 = +[MTFeedUpdateMetricsDataKey podcastStoreId];
  v26[4] = v4;
  double v5 = +[NSNumber numberWithLongLong:[(MTPodcast *)self->_localPodcast storeCollectionId]];
  v27[4] = v5;
  id v6 = +[MTFeedUpdateMetricsDataKey source];
  v26[5] = v6;
  int v7 = +[NSNumber numberWithInteger:self->_feedUpdateSource];
  v27[5] = v7;
  uint64_t v8 = +[MTFeedUpdateMetricsDataKey eventId];
  v26[6] = v8;
  v27[6] = self->_updaterJobUUID;
  id v9 = +[MTFeedUpdateMetricsDataKey updaterType];
  v26[7] = v9;
  unsigned __int8 v10 = +[MTFeedUpdateMetricsDataUpdaterValue sync];
  v27[7] = v10;
  unsigned int v11 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:8];

  __int16 v12 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = [(MTPodcast *)self->_localPodcast uuid];
    *(_DWORD *)buf = 138543618;
    double v23 = v13;
    __int16 v24 = 2112;
    unsigned int v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - processed feed page and found new episodes: %@", buf, 0x16u);
  }
  id v14 = +[MTFeedUpdateMetricsAction pageParser];
  +[IMMetrics recordUserAction:v14 dataSource:0 withData:v11];
}

+ (void)_recalculateEpisodeLevel:(id)a3 episodeLevelCalculator:(id)a4 ctx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = [v7 uuid];
  if (v10)
  {
    unsigned int v11 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@ - recalculating episode levels", (uint8_t *)&v13, 0xCu);
    }

    [v8 unsafeUpdateEpisodeLevelsWithShowUUID:v10 on:v9];
  }
  else
  {
    __int16 v12 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134217984;
      id v14 = [v7 storeCollectionId];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%lld - can't process episode levels, uuid missing", (uint8_t *)&v13, 0xCu);
    }
  }
}

+ (void)_markLatestEpisodeAsUnplayedIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    [v6 metadataTimestamp];
    if (fabs(v8) <= 2.22044605e-16 && [v5 subscribed])
    {
      id v9 = _MTLogCategoryFeedUpdateIngester();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v10 = [v5 uuid];
        unsigned int v11 = [v5 title];
        __int16 v12 = [v7 uuid];
        int v13 = [v7 title];
        int v16 = 138544386;
        id v17 = v10;
        __int16 v18 = 2112;
        id v19 = v11;
        __int16 v20 = 2114;
        id v21 = v12;
        __int16 v22 = 2112;
        double v23 = v13;
        __int16 v24 = 2048;
        id v25 = [v7 storeTrackId];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking latest episode as unplayed %{public}@ - %@ - %lld", (uint8_t *)&v16, 0x34u);
      }
      +[MTFeedIngester _markEpisodeAsFirstSeen:v7];
      [v7 setPlayState:2 manually:0 source:6];
      [v7 setMetadataTimestamp:0.0];
      [v7 setMetadataFirstSyncEligible:1];
    }
  }
  else
  {
    id v14 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v5 uuid];
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@ - Could not get the latest episode. Not marking anything as unplayed.", (uint8_t *)&v16, 0xCu);
    }
  }
}

+ (void)_sendNotificationForNewlyEntitledEpisodesIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 ctx:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 count])
  {
    int v13 = [v9 uuid];
    id v14 = [v9 managedObjectContext];
    id v15 = +[MTRecencyUtil upNextForPodcastUuid:v13 ctx:v14];
    int v16 = [v15 episodeUuid];

    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      id v17 = [v10 uuid];
    }
    __int16 v18 = v17;
    __int16 v20 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v9 uuid];
      __int16 v22 = [v9 title];
      double v23 = [v10 uuid];
      *(_DWORD *)buf = 138544130;
      id v36 = v21;
      __int16 v37 = 2112;
      BOOL v38 = v22;
      __int16 v39 = 2114;
      double v40 = v16;
      __int16 v41 = 2114;
      double v42 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Up Next Episode: %{public}@. Latest Episode: %{public}@", buf, 0x2Au);
    }
    if ([v11 containsObject:v18])
    {
      id v19 = [v12 objectForUuid:v16 entityName:kMTEpisodeEntityName];
      __int16 v24 = _MTLogCategoryFeedUpdateIngester();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        [v9 uuid];
        id v25 = v33 = v10;
        double v26 = [v9 title];
        int v27 = [v19 uuid];
        [v19 title];
        v28 = id v34 = v12;
        unsigned int v29 = [v19 isNew];
        *(_DWORD *)buf = 138544386;
        id v36 = v25;
        __int16 v37 = 2112;
        BOOL v38 = v26;
        __int16 v39 = 2114;
        double v40 = v27;
        __int16 v41 = 2112;
        double v42 = v28;
        __int16 v43 = 1024;
        unsigned int v44 = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found new smart play episode from episode entitlement changed %{public}@ - %@. episode isNew: %d", buf, 0x30u);

        id v12 = v34;
        id v10 = v33;
      }

      +[MTFeedIngester _markEpisodeAsFirstSeen:v19];
      [v19 setSentNotification:0];
    }
    else
    {
      id v19 = _MTLogCategoryFeedUpdateIngester();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [v9 uuid];
        v31 = id v30 = v12;
        double v32 = [v9 title];
        *(_DWORD *)buf = 138543874;
        id v36 = v31;
        __int16 v37 = 2112;
        BOOL v38 = v32;
        __int16 v39 = 2114;
        double v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Smart Play Episode is not newly entitled. Not setting eligible for notifications: %{public}@.", buf, 0x20u);

        id v12 = v30;
      }
    }
    goto LABEL_15;
  }
  int v16 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = [v9 uuid];
    id v19 = [v9 title];
    *(_DWORD *)buf = 138543618;
    id v36 = v18;
    __int16 v37 = 2112;
    BOOL v38 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ No newly entitled episodes. Not marking any episodes eligibile for notifications.", buf, 0x16u);
LABEL_15:
  }
}

- (void)_updatePodcastArtworksIfNeeded
{
  if (self->_imageStore && self->_imageDownloader)
  {
    id v3 = [(MTPodcast *)self->_localPodcast requestsAreNonAppInitiated];
    if ([(MTPodcast *)self->_localPodcast needsArtworkUpdate]) {
      goto LABEL_6;
    }
    uint64_t v4 = [(MTPodcast *)self->_localPodcast uuid];
    if (v4)
    {
      id v5 = (void *)v4;
      imageStore = self->_imageStore;
      id v7 = [(MTPodcast *)self->_localPodcast uuid];
      LOBYTE(imageStore) = [(MTImageStoreProtocol *)imageStore hasItemForKey:v7];

      if ((imageStore & 1) == 0)
      {
LABEL_6:
        id v8 = objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions);
        id v9 = [(MTPodcast *)self->_localPodcast imageURL];
        id v10 = [v8 init:v9 nonAppInitiated:v3];

        imageDownloader = self->_imageDownloader;
        id v12 = [(MTPodcast *)self->_localPodcast uuid];
        [(MTFeedIngesterImageDownloaderProtocol *)imageDownloader downloadImageForPodcastUuid:v12 urlOptions:v10 userInitiated:0 useBackgroundFetch:1];
      }
    }
    uint64_t v13 = [(MTPodcast *)self->_localPodcast uberBackgroundImageURL];
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = self->_imageStore;
      int v16 = [(MTPodcast *)self->_localPodcast uberBackgroundImageURL];
      LOBYTE(v15) = [(MTImageStoreProtocol *)v15 hasItemForKey:v16];

      if ((v15 & 1) == 0)
      {
        id v17 = [(MTPodcast *)self->_localPodcast uberBackgroundImageURL];
        id v22 = +[PFArtworkFormatter formatArtworkUrlWithString:v17, @"sr", @"png", kMTPreferredShowUberArtworkWidth, kMTPreferredShowUberArtworkHeight for cropCode fileExtension];

        id v18 = [objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions) initWithUrl:v22 nonAppInitiated:v3];
        id v19 = self->_imageDownloader;
        __int16 v20 = [(MTPodcast *)self->_localPodcast uberBackgroundImageURL];
        [(MTFeedIngesterImageDownloaderProtocol *)v19 downloadImageUrl:v18 cacheKey:v20 userInitiated:0 backgroundFetch:1];
      }
    }
  }
  else
  {
    id v21 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Image downloader and image store are nil, artwork won't be downloaded", buf, 2u);
    }
  }
}

+ (unint64_t)_maxArtworkSize
{
  return 3000;
}

+ (BOOL)_fetchSmallestPicturePossible
{
  return 0;
}

+ (unint64_t)_offerTypesAsFlagBits:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [a3 offers];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= (unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * i) offerTypeAsFlagBit];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (void)_markEpisodeAsFirstSeen:(id)a3
{
  id v3 = a3;
  [v3 unsuppressAutomaticDownloadsIfNeeded];
  [v3 setIsNew:1];
}

- (void)_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:(id)a3 isNewEpisodeToCurrentDevice:(BOOL)a4 oldIsEntitled:(BOOL)a5 oldEnclosureURL:(id)a6 oldPriceType:(id)a7
{
  int v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [v12 priceType];
  if (!v15
    || (int v16 = (void *)v15,
        [v12 enclosureURL],
        id v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    id v33 = _MTLogCategoryFeedUpdateIngester();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    v54 = [v12 uuid];
    id v55 = [v12 priceType];
    v56 = [v12 enclosureURL];
    *(_DWORD *)buf = 138413314;
    id v69 = v54;
    __int16 v70 = 2112;
    *(void *)id v71 = v55;
    *(_WORD *)&v71[8] = 2112;
    id v72 = v14;
    __int16 v73 = 2112;
    double v74 = v56;
    __int16 v75 = 2112;
    id v76 = v13;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Nil attribute detected for episode %@. Not handling priceType change. priceType: %@, oldPriceType: %@, enclosureUrl: %@, oldEnclosureUrl: %@", buf, 0x34u);

    goto LABEL_27;
  }
  id v63 = v14;
  id v18 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v12 uuid];
    __int16 v20 = [v12 priceType];
    [v12 enclosureURL];
    id v21 = v62 = self;
    id v58 = [v12 entitlementState];
    v60 = [v12 podcast];
    [v60 channel];
    id v59 = v61 = v9;
    BOOL v22 = v10;
    id v23 = [v59 storeId];
    __int16 v24 = [v12 podcast];
    id v25 = [v24 channel];
    *(_DWORD *)buf = 138414082;
    id v69 = v19;
    __int16 v70 = 2112;
    *(void *)id v71 = v20;
    *(_WORD *)&v71[8] = 2112;
    id v72 = v63;
    __int16 v73 = 2112;
    double v74 = v21;
    __int16 v75 = 2112;
    id v76 = v13;
    __int16 v77 = 2048;
    id v78 = v58;
    __int16 v79 = 2048;
    id v80 = v23;
    BOOL v10 = v22;
    __int16 v81 = 1024;
    unsigned int v82 = [v25 subscriptionActive];
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Handling attributes and redownload on priceType change if needed for episode: %@. priceType: %@, oldPriceType: %@, enclosureUrl: %@, oldEnclosureUrl: %@, oldEntitlementState: %lld, channel: %lld, subscriptionActive: %d", buf, 0x4Eu);

    int v9 = v61;
    self = v62;
  }
  [v12 updateEntitlementState];
  double v26 = _MTLogCategoryFeedUpdateIngester();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v12 entitlementState];
    id v28 = [v12 uuid];
    *(_DWORD *)buf = 134218242;
    id v69 = v27;
    __int16 v70 = 2112;
    *(void *)id v71 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Updated entitlementState to: %lld for episode %@", buf, 0x16u);
  }
  BOOL v29 = 0;
  id v14 = v63;
  if (!v63 && v10)
  {
    id v30 = [v12 priceType];
    BOOL v29 = v30 != 0;
  }
  __int16 v31 = [v12 priceType];
  unsigned int v32 = [v31 isEqualToString:v63];

  id v33 = _MTLogCategoryFeedUpdateIngester();
  BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if ((v32 & 1) != 0 || v29)
  {
    if (v34)
    {
      v57 = [v12 uuid];
      *(_DWORD *)buf = 138412802;
      id v69 = v57;
      __int16 v70 = 1024;
      *(_DWORD *)id v71 = v32;
      *(_WORD *)&v71[4] = 1024;
      *(_DWORD *)&v71[6] = v29;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "priceType did not actually change for episode %@. priceTypeValueDidNotChange: %d - isNewEpisodeAndPriceTypeDidNotChange: %d", buf, 0x18u);
    }
    goto LABEL_30;
  }
  if (v34)
  {
    double v35 = [v12 uuid];
    id v36 = [v12 priceType];
    *(_DWORD *)buf = 138412802;
    id v69 = v35;
    __int16 v70 = 2112;
    *(void *)id v71 = v63;
    *(_WORD *)&v71[8] = 2112;
    id v72 = v36;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "PriceType changed for episode uuid %@ from priceType: %@ to %@", buf, 0x20u);
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v12 setPriceTypeChangedDate:];
  if ([v12 isEntitled] && objc_msgSend(v12, "isEntitled") != v9)
  {
    __int16 v37 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v38 = [v12 uuid];
      *(_DWORD *)buf = 138412290;
      id v69 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Episode %@ is newly entitled.", buf, 0xCu);
    }
    __int16 v39 = [(MTFeedIngester *)self newlyEntitledEpisodeUUIDs];
    double v40 = [v12 uuid];
    [v39 addObject:v40];
  }
  id v33 = [v12 enclosureURL];
  if ([v33 isEqualToString:v13])
  {
LABEL_30:

    goto LABEL_31;
  }
  __int16 v41 = [v12 assetURL];
  id v42 = [v41 length];

  if (v42)
  {
    __int16 v43 = _MTLogCategoryFeedUpdateIngester();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v44 = [v12 enclosureURL];
      unsigned int v45 = [v12 uuid];
      *(_DWORD *)buf = 138412546;
      id v69 = v44;
      __int16 v70 = 2112;
      *(void *)id v71 = v45;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Found new enclosureURL %@ for downloaded asset for episode %@", buf, 0x16u);
    }
    if (self->_downloadManager)
    {
      library = self->_library;
      id v47 = [v12 uuid];
      id v67 = v47;
      double v48 = +[NSArray arrayWithObjects:&v67 count:1];
      unsigned int v49 = +[NSSet setWithArray:v48];
      [(MTFeedIngesterLibraryProtocol *)library removeDownloadAssetsForEpisodeUuids:v49];

      downloadManager = self->_downloadManager;
      uint64_t v51 = [v12 uuid];
      v66 = v51;
      uint64_t v52 = +[NSArray arrayWithObjects:&v66 count:1];
      double v53 = +[NSSet setWithArray:v52];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_1000B58D8;
      v64[3] = &unk_100550000;
      id v65 = v12;
      [(MTFeedIngesterDownloadManagerProtocol *)downloadManager restoreDownloadedEpisodes:v53 completion:v64];

      id v33 = v65;
      goto LABEL_30;
    }
    id v33 = _MTLogCategoryFeedUpdateIngester();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    v54 = [v12 uuid];
    *(_DWORD *)buf = 138412290;
    id v69 = v54;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Missing Download Manager. Failed to re-download %@", buf, 0xCu);
LABEL_27:

    goto LABEL_30;
  }
LABEL_31:
}

- (BOOL)didUpdateFeedUrl
{
  return self->_didUpdateFeedUrl;
}

- (void)setDidUpdateFeedUrl:(BOOL)a3
{
  self->_didUpdateFeedUrl = a3;
}

- (double)latestEpisodeDate
{
  return self->_latestEpisodeDate;
}

- (void)setLatestEpisodeDate:(double)a3
{
  self->_double latestEpisodeDate = a3;
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (NSMutableSet)newlyEntitledEpisodeUUIDs
{
  return self->_newlyEntitledEpisodeUUIDs;
}

- (NSMutableSet)updatedEpisodeUUIDs
{
  return self->_updatedEpisodeUUIDs;
}

- (BOOL)shouldMarkPlaylistsForUpdate
{
  return self->_shouldMarkPlaylistsForUpdate;
}

- (void)setShouldMarkPlaylistsForUpdate:(BOOL)a3
{
  self->_shouldMarkPlaylistsForUpdate = a3;
}

- (NSManagedObjectContext)ctx
{
  return self->_ctx;
}

- (MTPodcast)localPodcast
{
  return self->_localPodcast;
}

- (MTStoreInfoUpdaterProtocol)storeInfoUpdater
{
  return self->_storeInfoUpdater;
}

- (MTFeedIngesterImageDownloaderProtocol)imageDownloader
{
  return self->_imageDownloader;
}

- (MTImageStoreProtocol)imageStore
{
  return self->_imageStore;
}

- (MTSyncControllerProtocol)syncController
{
  return self->_syncController;
}

- (MTFeedIngesterLibraryProtocol)library
{
  return self->_library;
}

- (MTFeedIngesterDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator
{
  return self->_episodeLevelCalculator;
}

- (MTPodcastUpdateAverageCalculator)updateAverageCalculator
{
  return self->_updateAverageCalculator;
}

- (MTCategoryIngesterProtocol)categoryIngester
{
  return self->_categoryIngester;
}

- (int64_t)feedUpdateSource
{
  return self->_feedUpdateSource;
}

- (void)setFeedUpdateSource:(int64_t)a3
{
  self->_feedUpdateSource = a3;
}

- (NSString)updaterJobUUID
{
  return self->_updaterJobUUID;
}

- (void)setUpdaterJobUUID:(id)a3
{
}

- (int64_t)itemsInserted
{
  return self->_itemsInserted;
}

- (void)setItemsInserted:(int64_t)a3
{
  self->_itemsInserted = a3;
}

- (int64_t)itemsIngested
{
  return self->_itemsIngested;
}

- (void)setItemsIngested:(int64_t)a3
{
  self->_itemsIngested = a3;
}

- (int64_t)itemsDeleted
{
  return self->_itemsDeleted;
}

- (void)setItemsDeleted:(int64_t)a3
{
  self->_itemsDeleted = a3;
}

- (BOOL)canSendNotifications
{
  return self->_canSendNotifications;
}

- (void)setCanSendNotifications:(BOOL)a3
{
  self->_canSendNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updaterJobUUID, 0);
  objc_storeStrong((id *)&self->_categoryIngester, 0);
  objc_storeStrong((id *)&self->_updateAverageCalculator, 0);
  objc_storeStrong((id *)&self->_episodeLevelCalculator, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_imageDownloader, 0);
  objc_storeStrong((id *)&self->_storeInfoUpdater, 0);
  objc_storeStrong((id *)&self->_localPodcast, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_updatedEpisodeUUIDs, 0);
  objc_storeStrong((id *)&self->_newlyEntitledEpisodeUUIDs, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end