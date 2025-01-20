@interface MTBaseFeedManager
+ (BOOL)_fetchSmallestPicturePossible;
+ (BOOL)isUpdatingFeedUrl:(id)a3;
+ (BOOL)isUpdatingPodcastUuid:(id)a3;
+ (id)_metadataUrl;
+ (unint64_t)_maxArtworkSize;
+ (unint64_t)updatingCount;
+ (void)didFinishUpdatingAllFeeds:(BOOL)a3;
+ (void)didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4;
+ (void)didStartUpdatingFeedUrl:(id)a3 cloudSyncUrl:(id)a4;
+ (void)initialize;
+ (void)postNotificationName:(id)a3 userInfo:(id)a4;
+ (void)purgeSubscriptionMetadata;
+ (void)removeMetadataForPodcastUuid:(id)a3;
+ (void)saveSubscriptionMetadata;
+ (void)standardDeviationForEpisodes:(id)a3 standardDeviation:(double *)a4 average:(double *)a5;
- (BOOL)_localEpisode:(id)a3 isEqualToServerEpisode:(id)a4;
- (BOOL)_shouldDownloadPodcastWithIdentifierFromStore:(int64_t)a3;
- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3;
- (BOOL)allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:(id)a3;
- (BOOL)isSubscribingWithFeedUrl:(id)a3;
- (BOOL)processFeed:(id)a3 podcastUUID:(id)a4 requestUrl:(id)a5 useBackgroundFetch:(BOOL)a6 needsUpdate:(BOOL)a7 source:(int64_t)a8;
- (BOOL)updatePodcastWithUuid:(id)a3 withFeed:(id)a4 originalFeedUrl:(id)a5 source:(int64_t)a6;
- (MTBaseFeedManager)init;
- (MTExternalFeedDownloader)externalFeedDownloader;
- (MTLegacyDownloadManagerProtocol)downloadManager;
- (NSMutableArray)pendingFeedProcessingBlocks;
- (OS_dispatch_queue)feedProcessingQueue;
- (OS_dispatch_queue)workQueue;
- (_TtC18PodcastsFoundation21PodcastFeedDownloader)storePodcastDownloader;
- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration;
- (id)_insertNewEpisodeForServerEpisode:(id)a3 podcast:(id)a4 ctx:(id)a5;
- (id)_sortDescriptorsForLocalEpisodes;
- (id)importContext;
- (id)preProcessFeedHook:(id)a3 requestUrl:(id)a4 needsUpdate:(BOOL)a5;
- (id)sessionCompletionHandler;
- (int64_t)_compareServerEpisode:(id)a3 toLocalEpisode:(id)a4;
- (int64_t)_compareServerEpisode:(id)a3 toServerEpisode:(id)a4;
- (void)_addPendingFeedProcessingBlock:(id)a3;
- (void)_didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4;
- (void)_processNextPendingFeedIfPossible;
- (void)_queue_processNextPendingFeedIfPossible;
- (void)_startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9;
- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7;
- (void)didRestoreFeedUrlTask:(id)a3;
- (void)markEpisodeAsFirstSeen:(id)a3;
- (void)preprocessFeedWithDataHashingBlock:(id)a3 feedCreationBlock:(id)a4 url:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7;
- (void)setConfiguration:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setExternalFeedDownloader:(id)a3;
- (void)setFeedProcessingQueue:(id)a3;
- (void)setPendingFeedProcessingBlocks:(id)a3;
- (void)setSessionCompletionHandler:(id)a3;
- (void)setStorePodcastDownloader:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9;
- (void)startDownloadForPodcastStoreId:(int64_t)a3 triggerBy:(id)a4 feedUrl:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7;
@end

@implementation MTBaseFeedManager

+ (id)_metadataUrl
{
  v2 = +[MTConstants cachesDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"MTSubscriptionMeta.plist"];

  return v3;
}

+ (void)initialize
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MTBaseFeedManager;
  [super initialize];
  if (qword_10060A888 != -1) {
    dispatch_once(&qword_10060A888, &stru_100551AF8);
  }
  v3 = [a1 _metadataUrl];
  v4 = +[NSDictionary dictionaryWithContentsOfURL:v3];

  if (v4) {
    [(id)qword_10060A898 addEntriesFromDictionary:v4];
  }
}

- (MTBaseFeedManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)MTBaseFeedManager;
  v2 = [(MTBaseFeedManager *)&v21 init];
  if (v2)
  {
    v3 = +[FeedManagerLocalConfiguration platformSpecificConfiguration];
    [(MTBaseFeedManager *)v2 setConfiguration:v3];

    v4 = [[MTExternalFeedDownloader alloc] initWithDelegate:v2];
    [(MTBaseFeedManager *)v2 setExternalFeedDownloader:v4];

    id v5 = objc_alloc_init((Class)_TtC18PodcastsFoundation21PodcastFeedDownloader);
    [(MTBaseFeedManager *)v2 setStorePodcastDownloader:v5];

    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = +[NSString stringWithFormat:@"%@-feedProcessingQueue", v7];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    [(MTBaseFeedManager *)v2 setFeedProcessingQueue:v9];

    v10 = [(MTBaseFeedManager *)v2 configuration];
    unsigned int v11 = [v10 workQueueConcurrent];
    v12 = &_dispatch_queue_attr_concurrent;
    if (!v11) {
      v12 = 0;
    }
    v13 = v12;

    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    id v16 = +[NSString stringWithFormat:@"%@-worker", v15];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], v13);

    [(MTBaseFeedManager *)v2 setWorkQueue:v17];
    uint64_t v18 = +[NSMutableArray array];
    pendingFeedProcessingBlocks = v2->_pendingFeedProcessingBlocks;
    v2->_pendingFeedProcessingBlocks = (NSMutableArray *)v18;
  }
  return v2;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setStorePodcastDownloader:(id)a3
{
}

- (void)setFeedProcessingQueue:(id)a3
{
}

- (void)setExternalFeedDownloader:(id)a3
{
}

- (void)setDownloadManager:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (id)sessionCompletionHandler
{
  v2 = [(MTBaseFeedManager *)self externalFeedDownloader];
  v3 = [v2 sessionCompletionHandler];

  return v3;
}

- (void)setSessionCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MTBaseFeedManager *)self externalFeedDownloader];
  [v5 setSessionCompletionHandler:v4];

  [(MTBaseFeedManager *)self _processNextPendingFeedIfPossible];
}

- (id)importContext
{
  v2 = [(MTBaseFeedManager *)self configuration];
  unsigned int v3 = [v2 supportsBatchInsertion];

  id v4 = +[MTDB sharedInstance];
  id v5 = v4;
  if (v3) {
    [v4 resetableImportContext];
  }
  else {
  v6 = [v4 importContext];
  }

  return v6;
}

- (id)preProcessFeedHook:(id)a3 requestUrl:(id)a4 needsUpdate:(BOOL)a5
{
  id v5 = [objc_alloc((Class)MTFeedUpdatePreProcessResult) initWithShouldContinue:1 createdPodcastUUID:0];

  return v5;
}

- (BOOL)processFeed:(id)a3 podcastUUID:(id)a4 requestUrl:(id)a5 useBackgroundFetch:(BOOL)a6 needsUpdate:(BOOL)a7 source:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  dispatch_queue_t v17 = +[MTProcessorManager sharedInstance];
  [v17 startProcessorsForFeedUpdates];

  uint64_t v18 = [(MTBaseFeedManager *)self importContext];
  if (v15)
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    int64_t v19 = a8;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_10005708C;
    v35[4] = sub_100057310;
    id v36 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10010BA1C;
    v24[3] = &unk_100551B20;
    id v23 = v18;
    id v25 = v18;
    id v20 = v15;
    BOOL v33 = v9;
    v30 = v35;
    v31 = &v37;
    id v26 = v20;
    v27 = self;
    id v28 = v14;
    id v29 = v16;
    int64_t v32 = v19;
    BOOL v34 = v10;
    [v25 performBlockAndWaitWithSave:v24];
    if (v9 && *((unsigned char *)v38 + 24))
    {
      objc_super v21 = +[MTFeedUpdateManager sharedInstance];
      [v21 _updatePodcastWithUUID:v20 userInitiated:0 useBackgroundFetch:v10 source:14];
    }
    _Block_object_dispose(v35, 8);

    _Block_object_dispose(&v37, 8);
    uint64_t v18 = v23;
  }

  return 1;
}

- (BOOL)updatePodcastWithUuid:(id)a3 withFeed:(id)a4 originalFeedUrl:(id)a5 source:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v313 = a5;
  if (!v10)
  {
    objc_super v21 = v9;
    v22 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v352 = v9;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to update because feed was nil", buf, 0xCu);
    }
    goto LABEL_184;
  }
  uint64_t v11 = os_transaction_create();
  v327 = self;
  v12 = [(MTBaseFeedManager *)self importContext];
  id v312 = v9;
  v13 = [v12 podcastForUuid:v9];
  id v14 = [v10 podcastStoreId];
  id v15 = [v14 longLongValue];

  if (+[MTStoreIdentifier isNotEmpty:v15]) {
    [v13 setStoreCollectionId:v15];
  }
  uint64_t v16 = [v10 updatedFeedURL];
  v309 = (void *)v16;
  v310 = v11;
  id v302 = v15;
  if (!+[MTDBUtil isSupportedUrlString:v16]) {
    goto LABEL_6;
  }
  [v13 currentFeedURL];
  v18 = dispatch_queue_t v17 = (void *)v16;
  int64_t v19 = [v18 absoluteString];
  LOBYTE(v17) = [v17 isEqualToString:v19];

  if ((v17 & 1) == 0)
  {
    id v23 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v13 currentFeedURL];
      id v25 = [v24 absoluteString];
      *(_DWORD *)buf = 138543874;
      id v352 = v312;
      __int16 v353 = 2112;
      v354 = v309;
      __int16 v355 = 2112;
      double v356 = *(double *)&v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Found different updatedFeedURL %@ from %@", buf, 0x20u);
    }
    [v13 setUpdatedFeedURL:v309];
    char v20 = 1;
  }
  else
  {
LABEL_6:
    char v20 = 0;
  }
  char v303 = v20;
  id v26 = [v10 resolvedFeedURL];
  if ([v26 length])
  {
    v27 = [v13 currentFeedURL];
    id v28 = [v27 absoluteString];
    unsigned __int8 v29 = [v26 isEqualToString:v28];

    if ((v29 & 1) == 0)
    {
      v30 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [v13 currentFeedURL];
        int64_t v32 = [v31 absoluteString];
        *(_DWORD *)buf = 138543874;
        id v352 = v312;
        __int16 v353 = 2112;
        v354 = v26;
        __int16 v355 = 2112;
        double v356 = *(double *)&v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Found different feedURL %@ from %@", buf, 0x20u);
      }
      [v13 setUpdatedFeedURL:v26];
      char v303 = 1;
    }
  }
  BOOL v33 = [v10 title];
  BOOL v34 = [v33 stringByStrippingHTML];
  v35 = [v34 stringByRemovingNewlineCharacters];
  [v13 setTitle:v35];

  id v36 = [v10 author];
  uint64_t v37 = [v36 stringByStrippingHTML];
  [v13 setAuthor:v37];

  v38 = [v10 provider];
  uint64_t v39 = [v38 stringByStrippingHTML];
  [v13 setProvider:v39];

  [v13 setIsExplicit:[v10 isExplicit]];
  char v40 = [v10 feedDescription];
  [v13 setItemDescription:v40];

  v41 = [v10 showType];
  [v13 setShowTypeInFeed:v41];

  v42 = [v10 category];
  [v13 setCategory:v42];

  v43 = [v10 webpageURL];
  [v13 setWebpageURL:v43];

  v44 = [v10 shareURL];
  [v13 setStoreCleanURL:v44];

  v45 = [v10 artworkPrimaryColor];
  [v13 setArtworkPrimaryColor:v45];

  v46 = [v10 showSpecificUpsellCopy];
  [v13 setShowSpecificUpsellCopy:v46];

  [v13 setOfferTypes:[v10 offerTypesAsFlagBits]];
  uint64_t v47 = [v10 displayType];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [v10 displayType];
    unsigned int v50 = [v49 isNotEmpty];

    if (v50)
    {
      v51 = [v10 displayType];
      [v13 setDisplayType:v51];
    }
  }
  v52 = [v10 channelItem];

  if (v52)
  {
    v53 = [v10 channelItem];
    v54 = +[MTChannel createOrFindChannelFromFeedChannelItem:v53 personalizedRequest:0 context:v12];

    [v13 setChannel:v54];
    unsigned int v315 = [v54 subscriptionActive];
  }
  else
  {
    unsigned int v315 = 0;
  }
  uint64_t v311 = kMTEpisodeEntityName;
  v55 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:");
  v56 = [v13 uuid];
  v57 = +[MTEpisode predicateForAllEpisodesIncludingHiddenOnPodcastUuid:v56];
  [v55 setPredicate:v57];

  v58 = [(MTBaseFeedManager *)v327 _sortDescriptorsForLocalEpisodes];
  [v55 setSortDescriptors:v58];

  [v55 setReturnsObjectsAsFaults:0];
  [v55 setFetchBatchSize:200];
  id v346 = 0;
  v307 = v55;
  v59 = [v12 executeFetchRequest:v55 error:&v346];
  id v60 = v346;
  id v304 = v10;
  id v306 = v60;
  if (v60)
  {
    id v61 = v60;
    v62 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = [v13 uuid];
      v64 = [v13 title];
      *(_DWORD *)buf = 138543874;
      id v352 = v63;
      __int16 v353 = 2112;
      v354 = v64;
      __int16 v355 = 2112;
      double v356 = *(double *)&v306;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%{public}@ - %@ failed to fetch db episodes - %@", buf, 0x20u);

      id v61 = v306;
    }

    id v301 = 0;
    id v322 = 0;
    uint64_t v318 = 0;
    v65 = v61;
    objc_super v21 = v312;
    v22 = v310;
    goto LABEL_183;
  }
  v66 = [v10 items];
  v345[0] = _NSConcreteStackBlock;
  v345[1] = 3221225472;
  v345[2] = sub_10010E598;
  v345[3] = &unk_100551B48;
  v345[4] = v327;
  v67 = [v66 sortedArrayWithOptions:16 usingComparator:v345];

  id v301 = [v67 count];
  double v343 = 0.0;
  double v344 = 0.0;
  v317 = v67;
  [(id)objc_opt_class() standardDeviationForEpisodes:v67 standardDeviation:&v344 average:&v343];
  v68 = _MTLogCategoryFeedUpdate();
  v69 = v327;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v70 = [v13 uuid];
    v71 = [v13 title];
    *(_DWORD *)buf = 138544130;
    id v352 = v70;
    __int16 v353 = 2112;
    v354 = v71;
    __int16 v355 = 2048;
    double v356 = v344;
    __int16 v357 = 2048;
    double v358 = v343;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Standard Deviation: %f, average: %f", buf, 0x2Au);
  }
  [v13 setUpdateStdDev:v344];
  [v13 setUpdateAvg:v343];
  v72 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    v73 = [v13 uuid];
    v74 = [v13 title];
    id v75 = [v317 count];
    *(_DWORD *)buf = 138543874;
    id v352 = v73;
    __int16 v353 = 2112;
    v354 = v74;
    __int16 v355 = 2048;
    double v356 = *(double *)&v75;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ number of items: %lu", buf, 0x20u);
  }
  v325 = +[NSMutableSet set];
  v326 = +[NSMutableSet set];
  v300 = +[NSMutableSet set];
  v76 = v317;
  v332 = v12;
  v333 = v13;
  v299 = v26;
  v328 = v59;
  if ([v317 count])
  {
    uint64_t v318 = 0;
    v314 = 0;
    uint64_t v336 = 0;
    unint64_t v77 = 0;
    uint64_t v78 = 0;
    double v79 = 0.0;
    while (1)
    {
      uint64_t v323 = v78;
      v334 = [v76 objectAtIndex:v78];
      v80 = [v334 enclosureURL];

      if (!v80)
      {
        v108 = _MTLogCategoryFeedUpdate();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          v109 = [v13 uuid];
          v110 = [v13 title];
          [v334 title];
          v112 = unint64_t v111 = v77;
          *(_DWORD *)buf = 138543874;
          id v352 = v109;
          __int16 v353 = 2112;
          v354 = v110;
          __int16 v355 = 2112;
          double v356 = *(double *)&v112;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%{public}@ - %@ feed item without an enclosure: %@", buf, 0x20u);

          v76 = v317;
          unint64_t v77 = v111;
        }

        goto LABEL_125;
      }
      v81 = 0;
      if (v77 >= (unint64_t)[v59 count])
      {
        int v107 = 0;
        v82 = &NSFileSize_ptr;
      }
      else
      {
        ++v77;
        v82 = &NSFileSize_ptr;
        while (1)
        {
          v83 = v81;
          unint64_t v84 = v77 - 1;
          v81 = [v59 objectAtIndex:v77 - 1];

          if ([(MTBaseFeedManager *)v69 _localEpisode:v81 isEqualToServerEpisode:v334])
          {
            int v107 = 0;
            goto LABEL_59;
          }
          v85 = _MTLogCategoryFeedUpdate();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            v86 = [v13 uuid];
            v87 = [v13 title];
            [v334 guid];
            v88 = unint64_t obja = v77 - 1;
            v89 = [v81 guid];
            id v90 = [v334 resolvedEnclosureUrl];
            v91 = [v81 enclosureURL];
            v92 = [v334 title];
            [v81 title];
            v93 = unint64_t v329 = v77;
            *(_DWORD *)buf = 138545154;
            id v352 = v86;
            __int16 v353 = 2112;
            v354 = v87;
            __int16 v355 = 2112;
            double v356 = *(double *)&v88;
            __int16 v357 = 2112;
            double v358 = *(double *)&v89;
            __int16 v359 = 2112;
            id v360 = v90;
            __int16 v361 = 2112;
            v362 = v91;
            __int16 v363 = 2112;
            v364 = v92;
            __int16 v365 = 2112;
            v366 = v93;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%{public}@ - %@ did not find match for episode %@ - %@ | %@ - %@ | %@ - %@", buf, 0x52u);

            unint64_t v77 = v329;
            v82 = &NSFileSize_ptr;

            v13 = v333;
            unint64_t v84 = obja;

            v69 = v327;
            v12 = v332;
          }

          if ([(MTBaseFeedManager *)v69 _compareServerEpisode:v334 toLocalEpisode:v81] == -1)break; {
          v94 = [v81 uuid];
          }

          if (v94)
          {
            v95 = [v81 uuid];
            [v325 addObject:v95];

            v96 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v81 storeTrackId]);
            [v326 addObject:v96];
          }
          else
          {
            v96 = _MTLogCategoryFeedUpdate();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            {
              v97 = [v81 title];
              *(_DWORD *)buf = 138412290;
              id v352 = v97;
              _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "NULL UUID for localEpisode no longer in server feed, title %@", buf, 0xCu);
            }
          }

          v98 = _MTLogCategoryFeedUpdate();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            v99 = [v13 uuid];
            v100 = [v13 title];
            [v81 uuid];
            v102 = unint64_t v101 = v77;
            v103 = [v81 title];
            *(_DWORD *)buf = 138544130;
            id v352 = v99;
            __int16 v353 = 2112;
            v354 = v100;
            __int16 v355 = 2114;
            double v356 = *(double *)&v102;
            __int16 v357 = 2112;
            double v358 = *(double *)&v103;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking episode for deletion %{public}@ - %@", buf, 0x2Au);

            unint64_t v77 = v101;
            v82 = &NSFileSize_ptr;
          }
          v59 = v328;
          if (200 * (v77 / 0xC8) == v77) {
            [v12 saveInCurrentBlock];
          }
          id v104 = [v328 count];
          unint64_t v105 = v77 + 1;
          if (v77++ >= (unint64_t)v104)
          {
            int v107 = 0;
            unint64_t v77 = v105 - 1;
            goto LABEL_59;
          }
        }
        v113 = _MTLogCategoryFeedUpdate();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          v114 = [v13 uuid];
          v115 = [v13 title];
          v116 = [v334 episodeStoreId];
          v117 = [v334 title];
          *(_DWORD *)buf = 138544130;
          id v352 = v114;
          __int16 v353 = 2112;
          v354 = v115;
          __int16 v355 = 2114;
          double v356 = *(double *)&v116;
          __int16 v357 = 2112;
          double v358 = *(double *)&v117;
          _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ should add new episode from server %{public}@ - %@", buf, 0x2Au);

          v82 = &NSFileSize_ptr;
        }

        int v107 = 1;
        unint64_t v77 = v84;
      }
LABEL_59:
      v118 = [v334 episodeStoreId];
      uint64_t v119 = (uint64_t)[v118 longLongValue];

      v120 = _MTLogCategoryFeedUpdate();
      unint64_t v121 = v77;
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        v122 = [v13 uuid];
        v123 = [v13 title];
        v124 = +[NSNumber numberWithLongLong:v119];
        *(_DWORD *)buf = 138543874;
        id v352 = v122;
        __int16 v353 = 2112;
        v354 = v123;
        __int16 v355 = 2112;
        double v356 = *(double *)&v124;
        _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ serverEpisode %@", buf, 0x20u);

        unint64_t v77 = v121;
        v82 = &NSFileSize_ptr;
      }
      if (!v81) {
        break;
      }
      if (v119 > 0) {
        char v125 = v107;
      }
      else {
        char v125 = 0;
      }
      if (v125) {
        goto LABEL_68;
      }
LABEL_73:
      v129 = v81;
      if (v81) {
        goto LABEL_74;
      }
LABEL_77:
      v69 = v327;
LABEL_78:
      v138 = v129;
      v129 = [(MTBaseFeedManager *)v69 _insertNewEpisodeForServerEpisode:v334 podcast:v13 ctx:v12];

      v139 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        v140 = [v13 uuid];
        v141 = [v13 title];
        v142 = [v129 uuid];
        v143 = [v129 title];
        *(_DWORD *)buf = 138544130;
        id v352 = v140;
        __int16 v353 = 2112;
        v354 = v141;
        __int16 v355 = 2114;
        double v356 = *(double *)&v142;
        __int16 v357 = 2112;
        double v358 = *(double *)&v143;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ adding new episode %{public}@ - %@", buf, 0x2Au);

        v69 = v327;
        unint64_t v77 = v121;
      }
      ++v318;
      if (!v129) {
        goto LABEL_119;
      }
      int v137 = 1;
LABEL_82:
      v144 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        v145 = [v333 uuid];
        v146 = [v333 title];
        v147 = [v129 uuid];
        v148 = [v129 title];
        *(_DWORD *)buf = 138544130;
        id v352 = v145;
        __int16 v353 = 2112;
        v354 = v146;
        __int16 v355 = 2114;
        double v356 = *(double *)&v147;
        __int16 v357 = 2112;
        double v358 = *(double *)&v148;
        _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updating episode %{public}@ - %@", buf, 0x2Au);

        v69 = v327;
      }

      [v129 setFeedDeleted:0];
      v149 = [v334 guid];
      [v129 setGuid:v149];

      if (+[MTStoreIdentifier isNotEmpty:v119]) {
        [v129 setStoreTrackId:v119];
      }
      v150 = [v334 title];
      v151 = [v150 stringByStrippingHTML];

      [v129 setTitle:v151];
      v152 = [v334 itunesTitle];
      [v129 setItunesTitle:v152];

      v153 = [(MTBaseFeedManager *)v69 configuration];
      unsigned int v154 = [v153 usesCleanEpisodeTitles];

      if (v154)
      {
        v155 = [v333 title];
        v156 = [v151 cleanedTitleStringWithPrefix:v155];
        [v129 setCleanedTitle:v156];
      }
      v157 = [v334 itemDescription];
      [v129 setItemDescription:v157];

      v158 = [v334 itemSummary];
      [v129 setItunesSubtitle:v158];

      v159 = [v334 author];
      [v129 setAuthor:v159];

      objc_msgSend(v129, "setByteSize:", objc_msgSend(v334, "byteSize"));
      v160 = [v334 uti];
      [v129 setUti:v160];

      uint64_t v161 = [v334 pubDate];
      if (v161)
      {
        v162 = (void *)v161;
        [v129 pubDate];
        double v164 = v163;
        v165 = [v334 pubDate];
        [v165 timeIntervalSinceReferenceDate];
        double v167 = v166;

        if (v164 != v167)
        {
          v168 = [v334 pubDate];
          [v168 timeIntervalSinceReferenceDate];
          [v129 setPubDate:];
        }
      }
      uint64_t v169 = [v334 firstTimeAvailableAsFree];
      if (v169)
      {
        v170 = (void *)v169;
        [v129 firstTimeAvailableAsFree];
        double v172 = v171;
        v173 = [v334 firstTimeAvailableAsFree];
        [v173 timeIntervalSinceReferenceDate];
        double v175 = v174;

        if (v172 != v175)
        {
          v176 = [v334 firstTimeAvailableAsFree];
          [v176 timeIntervalSinceReferenceDate];
          [v129 setFirstTimeAvailableAsFree:];
        }
      }
      uint64_t v177 = [v334 firstTimeAvailableAsPaid];
      if (v177)
      {
        v178 = (void *)v177;
        [v129 firstTimeAvailableAsPaid];
        double v180 = v179;
        v181 = [v334 firstTimeAvailableAsPaid];
        [v181 timeIntervalSinceReferenceDate];
        double v183 = v182;

        if (v180 != v183)
        {
          v184 = [v334 firstTimeAvailableAsPaid];
          [v184 timeIntervalSinceReferenceDate];
          [v129 setFirstTimeAvailableAsPaid:];
        }
      }
      if ([v334 trackNum]) {
        [v129 setTrackNum:[v334 trackNum]];
      }
      [v129 setExplicit:[v334 isExplicit]];
      [v129 setEpisodeLevel:v336];
      v185 = [v334 episodeType];
      [v129 setEpisodeType:v185];

      id v186 = [v129 episodeNumber];
      if (v186 != [v334 episodeNumber]) {
        [v129 setEpisodeNumber:[v334 episodeNumber]];
      }
      id v187 = [v129 seasonNumber];
      if (v187 != [v334 seasonNumber]) {
        [v129 setSeasonNumber:[v334 seasonNumber]];
      }
      v188 = [v334 webpageURL];
      [v129 setWebpageURL:v188];

      [v129 setIsHidden:0];
      [v334 entitledDuration];
      if (v189 > 0.0)
      {
        [v334 entitledDuration];
        [v129 setEntitledDuration:];
      }
      [v334 duration];
      if (v190 > 0.0)
      {
        [v334 duration];
        [v129 setFreeDuration:];
      }
      v191 = [v334 entitledEnclosureURL];
      [v129 setEntitledEnclosureURL:v191];

      v192 = [v334 resolvedEnclosureUrl];
      [v129 setFreeEnclosureURL:v192];

      v193 = [v334 priceType];
      [v129 setFreePriceType:v193];

      v194 = [v334 entitledPriceType];
      [v129 setEntitledPriceType:v194];

      v195 = [v334 entitledTranscriptIdentifier];
      [v129 setEntitledTranscriptIdentifier:v195];

      v196 = [v334 freeTranscriptIdentifier];
      [v129 setFreeTranscriptIdentifier:v196];

      v197 = [v129 transcriptIdentifier];
      v198 = [v334 entitledTranscriptSnippet];
      [v129 setEntitledTranscriptSnippet:v198];

      v199 = [v334 freeTranscriptSnippet];
      [v129 setFreeTranscriptSnippet:v199];

      v200 = [v334 entitledTranscriptProvider];
      [v129 setEntitledTranscriptProvider:v200];

      v201 = [v334 freeTranscriptProvider];
      [v129 setFreeTranscriptProvider:v201];

      if (v315)
      {
        [v334 entitledDuration];
        if (v202 > 0.0)
        {
          [v334 entitledDuration];
          [v129 setDuration:];
        }
        v203 = [v334 entitledEnclosureURL];

        if (v203)
        {
          v204 = [v334 entitledEnclosureURL];
          [v129 setEnclosureURL:v204];
        }
        v205 = [v334 entitledPriceType];
        [v129 setPriceType:v205];

        uint64_t v206 = [v334 entitledTranscriptIdentifier];
      }
      else
      {
        [v129 freeDuration];
        [v129 setDuration:];
        v207 = [v129 freeEnclosureURL];
        [v129 setEnclosureURL:v207];

        v208 = [v129 freePriceType];
        [v129 setPriceType:v208];

        uint64_t v206 = [v129 freeTranscriptIdentifier];
      }
      v209 = (void *)v206;
      [v129 setTranscriptIdentifier:v206];

      v210 = +[PFTranscriptProviderBridge shared];
      v211 = [v129 transcriptIdentifier];
      v212 = [v129 assetURL];
      [v210 updateTTMLIDFrom:v197 toNewID:v211 hasDownloadedContent:v212 != 0 forEpisodeAdamID:[v129 storeTrackId]];

      v69 = v327;
      unint64_t v77 = v121;
      if (v137)
      {
        [v129 updateEntitlementState];
        v213 = _MTLogCategoryFeedUpdate();
        if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
        {
          v214 = [v129 uuid];
          v215 = [v129 title];
          id v216 = [v129 entitlementState];
          *(_DWORD *)buf = 138543874;
          id v352 = v214;
          __int16 v353 = 2112;
          v354 = v215;
          __int16 v355 = 2048;
          double v356 = *(double *)&v216;
          _os_log_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ set entitlement state for inserted episode to %lld from updatePodcastWithUuid", buf, 0x20u);

          unint64_t v77 = v121;
        }
      }
      ++v336;

      v13 = v333;
LABEL_119:
      v76 = v317;
      [v129 resolveAvailabilityDate];
      [v129 firstTimeAvailable];
      v59 = v328;
      if (v217 > v79 && [v129 isMedia])
      {
        [v129 firstTimeAvailable];
        double v79 = v218;
        uint64_t v219 = [v129 uuid];

        v314 = (void *)v219;
        v76 = v317;
      }
      if (__ROR8__(0x8F5C28F5C28F5C29 * v77, 3) <= 0x147AE147AE147AEuLL) {
        [v12 saveInCurrentBlock];
      }

LABEL_125:
      uint64_t v78 = v323 + 1;

      if (v323 + 1 >= (unint64_t)[v76 count]) {
        goto LABEL_131;
      }
    }
    if (v119 < 1)
    {
      v129 = 0;
      goto LABEL_77;
    }
LABEL_68:
    v126 = +[NSNumber numberWithLongLong:v119];
    unsigned int v127 = [v326 containsObject:v126];

    if (v127)
    {
      v128 = [(NSFileAttributeKey *)(id)v82[167] predicateForEpisodeStoreTrackId:v119];
      v129 = [v12 objectInEntity:v311 predicate:v128];

      if (!v129)
      {
        v220 = _MTLogCategoryFeedUpdate();
        v69 = v327;
        if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR))
        {
          v221 = [v13 uuid];
          v222 = [v13 title];
          v223 = [0 uuid];
          v224 = [0 title];
          *(_DWORD *)buf = 138544130;
          id v352 = v221;
          __int16 v353 = 2112;
          v354 = v222;
          __int16 v355 = 2114;
          double v356 = *(double *)&v223;
          __int16 v357 = 2112;
          double v358 = *(double *)&v224;
          _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_ERROR, "%{public}@ - %@ failed to update feed-deleted episode %{public}@ - %@", buf, 0x2Au);

          unint64_t v77 = v121;
        }

        v129 = 0;
        goto LABEL_78;
      }
      v130 = [v129 uuid];
      [v325 removeObject:v130];

      v131 = +[NSNumber numberWithLongLong:v119];
      [v326 removeObject:v131];

      v132 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        v133 = [v13 uuid];
        v134 = [v13 title];
        v135 = [v129 uuid];
        v136 = [v129 title];
        *(_DWORD *)buf = 138544130;
        id v352 = v133;
        __int16 v353 = 2112;
        v354 = v134;
        __int16 v355 = 2114;
        double v356 = *(double *)&v135;
        __int16 v357 = 2112;
        double v358 = *(double *)&v136;
        _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updating feed-deleted episode %{public}@ - %@", buf, 0x2Au);

        unint64_t v77 = v121;
      }
      ++v318;

      int v107 = 0;
LABEL_74:
      if (!v107)
      {
        int v137 = 0;
        v69 = v327;
        goto LABEL_82;
      }
      goto LABEL_77;
    }
    goto LABEL_73;
  }
  unint64_t v77 = 0;
  uint64_t v336 = 0;
  v314 = 0;
  uint64_t v318 = 0;
  double v79 = 0.0;
LABEL_131:
  [v12 saveInCurrentBlock];
  v225 = &NSFileSize_ptr;
  if (v77 < (unint64_t)[v59 count])
  {
    do
    {
      v226 = [v59 objectAtIndex:v77];
      v227 = [v226 uuid];

      if (v227)
      {
        v228 = [v226 uuid];
        [v325 addObject:v228];

        v229 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v226 storeTrackId]);
        [v326 addObject:v229];
      }
      else
      {
        v229 = _MTLogCategoryFeedUpdate();
        if (os_log_type_enabled(v229, OS_LOG_TYPE_ERROR))
        {
          [v226 title];
          v231 = unint64_t v230 = v77;
          *(_DWORD *)buf = 138412290;
          id v352 = v231;
          _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_ERROR, "NULL UUID for feedDeletedEpisode removed from the feed, title %@", buf, 0xCu);

          unint64_t v77 = v230;
        }
      }

      v232 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
      {
        [v13 uuid];
        v234 = unint64_t v233 = v77;
        v235 = [v13 title];
        v236 = [v226 uuid];
        v237 = [v226 title];
        *(_DWORD *)buf = 138544130;
        id v352 = v234;
        __int16 v353 = 2112;
        v354 = v235;
        __int16 v355 = 2114;
        double v356 = *(double *)&v236;
        __int16 v357 = 2112;
        double v358 = *(double *)&v237;
        _os_log_impl((void *)&_mh_execute_header, v232, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking episode for deletion from tail end %{public}@ - %@", buf, 0x2Au);

        v13 = v333;
        v225 = &NSFileSize_ptr;

        unint64_t v77 = v233;
      }

      ++v77;
      v59 = v328;
    }
    while (v77 < (unint64_t)[v328 count]);
  }
  v238 = [(NSFileAttributeKey *)(id)v225[259] fetchRequestWithEntityName:v311];
  v239 = +[MTEpisode predicateForEpisodeUuids:v325];
  [v238 setPredicate:v239];

  v240 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:0];
  v350 = v240;
  v241 = +[NSArray arrayWithObjects:&v350 count:1];
  [v238 setSortDescriptors:v241];

  [v238 setReturnsObjectsAsFaults:0];
  [v238 setFetchBatchSize:200];
  id v342 = 0;
  v12 = v332;
  contexta = v238;
  v242 = [v332 executeFetchRequest:v238 error:&v342];
  id v243 = v342;
  if (v243)
  {
    v244 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v244, OS_LOG_TYPE_ERROR))
    {
      v245 = [v13 uuid];
      v246 = [v13 title];
      *(_DWORD *)buf = 138543874;
      id v352 = v245;
      __int16 v353 = 2112;
      v354 = v246;
      __int16 v355 = 2112;
      double v356 = *(double *)&v243;
      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_ERROR, "%{public}@ - %@ failed to fetch episodes to delete - %@", buf, 0x20u);
    }
  }
  id v316 = v243;
  id v322 = [v242 count];
  long long v338 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  long long v341 = 0u;
  id obj = v242;
  v321 = (char *)[obj countByEnumeratingWithState:&v338 objects:v349 count:16];
  if (v321)
  {
    unint64_t v247 = 0;
    uint64_t v248 = *(void *)v339;
    v249 = v321;
    do
    {
      v250 = 0;
      unint64_t v335 = ~v247;
      unint64_t v324 = v247;
      v251 = (char *)(v247 + 1);
      do
      {
        if (*(void *)v339 != v248) {
          objc_enumerationMutation(obj);
        }
        v252 = *(void **)(*((void *)&v338 + 1) + 8 * (void)v250);
        v253 = _MTLogCategoryFeedUpdate();
        if (os_log_type_enabled(v253, OS_LOG_TYPE_DEFAULT))
        {
          [v333 uuid];
          v255 = uint64_t v254 = v248;
          v256 = [v333 title];
          v257 = [v252 uuid];
          v258 = [v252 title];
          *(_DWORD *)buf = 138544130;
          id v352 = v255;
          __int16 v353 = 2112;
          v354 = v256;
          __int16 v355 = 2114;
          double v356 = *(double *)&v257;
          __int16 v357 = 2112;
          double v358 = *(double *)&v258;
          _os_log_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ deleting episode removed from feed %{public}@ - %@", buf, 0x2Au);

          v12 = v332;
          uint64_t v248 = v254;
        }

        [v252 setFeedDeleted:1];
        [v252 setEpisodeLevel:&v250[v336]];
        if ((char *)(v335 + 200 * ((unint64_t)v251 / 0xC8)) == v250) {
          [v12 saveInCurrentBlock];
        }
        ++v250;
        ++v251;
      }
      while (v249 != v250);
      unint64_t v247 = (unint64_t)&v249[v324];
      v249 = (char *)[obj countByEnumeratingWithState:&v338 objects:v349 count:16];
      v336 += (uint64_t)v250;
    }
    while (v249);
  }

  [v12 saveInCurrentBlock];
  id v10 = v304;
  v13 = v333;
  if (v314 && ![(MTBaseFeedManager *)v327 isSubscribingWithFeedUrl:v313])
  {
    v259 = [v12 episodeForUuid:v314];
    [v259 metadataTimestamp];
    if (fabs(v260) <= 2.22044605e-16 && [v333 subscribed])
    {
      [(MTBaseFeedManager *)v327 markEpisodeAsFirstSeen:v259];
      [v259 setPlayState:2 manually:0 source:6];
      [v259 setMetadataTimestamp:0.0];
      [v259 setMetadataFirstSyncEligible:1];
    }
  }
  if ([v300 count])
  {
    v261 = [v333 uuid];
    v262 = [v333 managedObjectContext];
    v263 = +[MTRecencyUtil upNextForPodcastUuid:v261 ctx:v262];
    v264 = [v263 episodeUuid];

    v265 = v314;
    if (v264) {
      v265 = v264;
    }
    id v266 = v265;
    if ([v300 containsObject:v266])
    {
      v267 = [v12 episodeForUuid:v264];
      v268 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
      {
        v269 = [v333 uuid];
        v270 = [v333 title];
        v271 = [v267 uuid];
        v272 = [v267 title];
        *(_DWORD *)buf = 138544130;
        id v352 = v269;
        __int16 v353 = 2112;
        v354 = v270;
        __int16 v355 = 2114;
        double v356 = *(double *)&v271;
        __int16 v357 = 2112;
        double v358 = *(double *)&v272;
        _os_log_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found new smart play episode from episod entitlement changed %{public}@ - %@", buf, 0x2Au);

        v13 = v333;
        id v10 = v304;
      }

      [(MTBaseFeedManager *)v327 markEpisodeAsFirstSeen:v267];
      [v267 setSentNotification:0];
    }
  }
  v273 = [v10 imageURL];
  if ([v273 length]) {
    [v10 imageURL];
  }
  else {
    [v10 globalImageURL];
  }
  v59 = v328;
  id v274 = (id)objc_claimAutoreleasedReturnValue();

  if ([(id)objc_opt_class() _fetchSmallestPicturePossible])
  {
    v275 = +[MTResizedArtworkURLProvider sharedInstance];
    uint64_t v276 = [v275 resizedArtworkURLString:v274 withDimension:[objc_opt_class() _maxArtworkSize]];

    id v274 = (id)v276;
  }
  if (v274)
  {
    v277 = [v13 imageURL];
    unsigned __int8 v278 = [v277 isEqualToString:v274];

    if ((v278 & 1) == 0)
    {
      v279 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
      {
        v280 = [v13 uuid];
        v281 = [v13 title];
        *(_DWORD *)buf = 138543874;
        id v352 = v280;
        __int16 v353 = 2112;
        v354 = v281;
        __int16 v355 = 2112;
        double v356 = *(double *)&v274;
        _os_log_impl((void *)&_mh_execute_header, v279, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ artwork url did change %@", buf, 0x20u);
      }
      [v13 setNeedsArtworkUpdate:1];
    }
  }
  [v13 setImageURL:v274];
  v282 = [v10 uberBackgroundImageURL];
  [v13 setUberBackgroundImageURL:v282];
  v283 = [v10 uberBackgroundJoeColor];
  [v13 setUberBackgroundJoeColor:v283];

  [v13 feedChangedDate];
  if (v79 > v284) {
    [v13 setFeedChangedDate:v79];
  }
  objc_super v21 = v312;
  v22 = v310;
  if (v321) {
    [v13 markPlaylistsForUpdate];
  }
  [v12 saveInCurrentBlock];

  id v26 = v299;
  id v61 = 0;
  v65 = v316;
LABEL_183:

  if (v61)
  {
LABEL_184:
    BOOL v285 = 0;
    goto LABEL_188;
  }
  id v337 = +[MTFeedUpdateMetricsDataKey newEpisodeCount];
  v347[0] = v337;
  v286 = +[NSNumber numberWithLongLong:v318];
  v348[0] = v286;
  v287 = +[MTFeedUpdateMetricsDataKey deletedEpisodeCount];
  v347[1] = v287;
  v288 = +[NSNumber numberWithLongLong:v322];
  v348[1] = v288;
  v289 = +[MTFeedUpdateMetricsDataKey totalEpisodeCount];
  v347[2] = v289;
  v290 = +[NSNumber numberWithLongLong:v301];
  v348[2] = v290;
  v291 = +[MTFeedUpdateMetricsDataKey podcastStoreId];
  v347[3] = v291;
  v292 = +[NSNumber numberWithLongLong:v302];
  v348[3] = v292;
  v293 = +[MTFeedUpdateMetricsDataKey source];
  v347[4] = v293;
  v294 = +[NSNumber numberWithInteger:a6];
  v348[4] = v294;
  v295 = +[NSDictionary dictionaryWithObjects:v348 forKeys:v347 count:5];

  v296 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v296, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v352 = v312;
    __int16 v353 = 2112;
    v354 = v295;
    _os_log_impl((void *)&_mh_execute_header, v296, OS_LOG_TYPE_DEFAULT, "%{public}@ - processed feed and found new episodes: %@", buf, 0x16u);
  }

  v297 = +[MTFeedUpdateMetricsAction parser];
  +[IMMetrics recordUserAction:v297 dataSource:0 withData:v295];

  objc_super v21 = v312;
  id v10 = v304;
  v22 = v310;
  BOOL v285 = v303;
LABEL_188:

  return v285;
}

- (void)markEpisodeAsFirstSeen:(id)a3
{
  id v3 = a3;
  [v3 unsuppressAutomaticDownloadsIfNeeded];
  [v3 setIsNew:1];
}

- (id)_insertNewEpisodeForServerEpisode:(id)a3 podcast:(id)a4 ctx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && ([v8 isDeleted] & 1) == 0)
  {
    uint64_t v11 = +[SyncControllerFactory resolvedSyncController];
    [v11 setUppSyncDirtyFlag:1];

    id v10 = +[MTEpisode insertNewEpisodeInManagedObjectContext:canSendNotifications:](MTEpisode, "insertNewEpisodeInManagedObjectContext:canSendNotifications:", v9, +[PFNotificationSettings canSendNotification]);
    [v10 setPodcast:v8];
    v12 = [v7 guid];
    [v10 setGuid:v12];

    [v10 setImportSource:2];
    v13 = [v7 pubDate];
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;
    [v8 addedDate];
    double v17 = v16;

    unsigned __int8 v18 = [v8 importing];
    if (v15 < v17) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    if (v19 & 1) == 0 && ([v8 subscribed]) {
      goto LABEL_26;
    }
    [v10 metadataTimestamp];
    if (v20 == 0.0)
    {
      [v10 setPlayState:0 manually:1 source:6];
      [v10 setBackCatalog:1];
      [v10 setMetadataTimestamp:0.0];
      [v10 setMetadataFirstSyncEligible:0];
    }
    else
    {
      [v10 setIsNew:0];
    }
    [v10 suppressAutomaticDownloadsIfNeeded];
    if ((v19 & 1) == 0)
    {
LABEL_26:
      id v21 = [v8 isDark];
      v22 = (char *)[v8 darkCount] + 1;
      [v8 setDarkCount:v22];
      [v8 setDarkCountLocal:v22];
      [v8 markPlaylistsForUpdate];
      if (v21 != [v8 isDark])
      {
        id v23 = [v8 isDark];
        v24 = [v8 latestExitFromDarkDownloads];
        if (v24)
        {
          id v25 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v21 isDark:v23 reason:2 previousExit:v24];
        }
        else
        {
          id v26 = +[NSDate now];
          id v25 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v21 isDark:v23 reason:2 previousExit:v26];
        }
        v27 = objc_opt_new();
        [v27 sendEvent:v25];
      }
    }
    id v28 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v29 = [v8 uuid];
      v30 = [v8 title];
      v31 = [v10 uuid];
      int64_t v32 = [v10 title];
      int v34 = 138544130;
      v35 = v29;
      __int16 v36 = 2112;
      uint64_t v37 = v30;
      __int16 v38 = 2114;
      uint64_t v39 = v31;
      __int16 v40 = 2112;
      v41 = v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ new episode %{public}@ - %@", (uint8_t *)&v34, 0x2Au);
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_localEpisode:(id)a3 isEqualToServerEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 guid];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [v5 guid];
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = [v6 guid];
      v12 = [v5 guid];
      unsigned __int8 v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        unsigned __int8 v14 = 1;
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  double v15 = [v6 resolvedEnclosureUrl];
  if (!v15) {
    goto LABEL_10;
  }
  uint64_t v16 = [v5 enclosureURL];
  if (!v16) {
    goto LABEL_10;
  }
  double v17 = (void *)v16;
  unsigned __int8 v18 = [v5 enclosureURL];
  unsigned __int8 v19 = [v15 isEqualToString:v18];

  if (v19)
  {
    unsigned __int8 v14 = 1;
  }
  else
  {
LABEL_10:
    double v20 = [v6 title];
    id v21 = [v20 stringByStrippingHTML];

    if (v21)
    {
      v22 = [v5 title];
      if (v22)
      {
        id v23 = [v5 title];
        if ([v21 isEqualToString:v23])
        {
          v24 = [v6 pubDate];
          [v5 pubDate];
          id v25 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          unsigned __int8 v14 = [v24 isEqualToDate:v25];
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
LABEL_21:

  return v14;
}

- (int64_t)_compareServerEpisode:(id)a3 toServerEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 pubDate];
  id v8 = [v6 pubDate];
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    int64_t v10 = (int64_t)[v8 compare:v7];
  }
  else
  {
    uint64_t v11 = [v5 guid];
    uint64_t v12 = [v6 guid];
    unsigned __int8 v13 = (void *)v12;
    if (v11 | v12) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = 0;
    }
    if (v12) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = v14;
    }
    if (v11 && v12) {
      int64_t v10 = (int64_t)[(id)v12 compare:v11];
    }
  }
  return v10;
}

- (id)_sortDescriptorsForLocalEpisodes
{
  v2 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:0];
  v6[0] = v2;
  id v3 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeGuid ascending:0];
  v6[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (int64_t)_compareServerEpisode:(id)a3 toLocalEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 pubDate];
  [v6 pubDate];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    int64_t v10 = (int64_t)[v8 compare:v7];
  }
  else
  {
    uint64_t v11 = [v5 guid];
    uint64_t v12 = [v6 guid];
    unsigned __int8 v13 = (void *)v12;
    if (v11 | v12) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = 0;
    }
    if (v12) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = v14;
    }
    if (v11 && v12) {
      int64_t v10 = (int64_t)[(id)v12 compare:v11];
    }
  }
  return v10;
}

+ (BOOL)isUpdatingPodcastUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v5 = +[MTDB sharedInstance];
    id v6 = [v5 mainOrPrivateContext];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10010EF90;
    v10[3] = &unk_100551B70;
    id v7 = v6;
    id v11 = v7;
    id v12 = v4;
    unsigned __int8 v13 = &v15;
    id v14 = a1;
    [v7 performBlockAndWait:v10];
    BOOL v8 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isUpdatingFeedUrl:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (id)qword_10060A890;
    objc_sync_enter(v4);
    unsigned __int8 v5 = [(id)qword_10060A890 containsObject:v3];
    objc_sync_exit(v4);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (unint64_t)updatingCount
{
  id v2 = (id)qword_10060A890;
  objc_sync_enter(v2);
  id v3 = [(id)qword_10060A890 count];
  objc_sync_exit(v2);

  return (unint64_t)v3;
}

- (void)preprocessFeedWithDataHashingBlock:(id)a3 feedCreationBlock:(id)a4 url:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010F2F8;
  v19[3] = &unk_100551B98;
  objc_copyWeak(v23, &location);
  id v15 = v12;
  id v21 = v15;
  id v16 = v14;
  id v20 = v16;
  id v17 = v13;
  BOOL v24 = a6;
  id v22 = v17;
  v23[1] = (id)a7;
  char v18 = objc_retainBlock(v19);
  [(MTBaseFeedManager *)self _addPendingFeedProcessingBlock:v18];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    id v15 = a6;
    id v16 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v12 localizedDescription];
      char v18 = [v12 userInfo];
      unsigned __int8 v19 = [v18 objectForKey:NSUnderlyingErrorKey];
      *(_DWORD *)buf = 138412546;
      v27 = v17;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: Underlying error %@", buf, 0x16u);
    }
    [(MTBaseFeedManager *)self feedDownloadedWithError:v12 task:v14 requestedUrl:v15];
    id v20 = [v15 absoluteString];

    [(MTBaseFeedManager *)self _didFinishUpdatingFeedUrl:v20 withError:v12];
  }
  else
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10010FAA0;
    v24[3] = &unk_100551BC0;
    id v25 = v13;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10010FAA8;
    v22[3] = &unk_100551BE8;
    id v23 = v25;
    id v21 = a6;
    [(MTBaseFeedManager *)self preprocessFeedWithDataHashingBlock:v24 feedCreationBlock:v22 url:v21 useBackgroundFetch:v7 source:17];

    id v20 = v25;
  }
}

- (void)didRestoreFeedUrlTask:(id)a3
{
  id v8 = a3;
  id v3 = (id)qword_10060A890;
  objc_sync_enter(v3);
  id v4 = [v8 absoluteString];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = (void *)qword_10060A890;
    BOOL v7 = [v8 absoluteString];
    [v6 addObject:v7];
  }
  objc_sync_exit(v3);
}

- (BOOL)allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:(id)a3
{
  return 0;
}

- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[MTReachability sharedInstance];
  unsigned __int8 v5 = [v4 isReachable];

  if ((v5 & 1) == 0)
  {
    if (v3) {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100551C08);
    }
    [(id)objc_opt_class() didFinishUpdatingAllFeeds:0];
  }
  return v5 ^ 1;
}

- (BOOL)_shouldDownloadPodcastWithIdentifierFromStore:(int64_t)a3
{
  return +[MTStoreIdentifier isNotEmpty:a3];
}

- (void)_startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a6;
  id v16 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    int64_t v25 = (int64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Running on downloads queue %@", (uint8_t *)&v24, 0xCu);
  }

  id v17 = [(MTBaseFeedManager *)self configuration];
  char v18 = (void *)([v17 useBackgroundFetchForFeedDownloads] | v9);

  unsigned int v19 = [(MTBaseFeedManager *)self _shouldDownloadPodcastWithIdentifierFromStore:a5];
  id v20 = _MTLogCategoryFeedUpdate();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      int v24 = 134218498;
      int64_t v25 = a5;
      __int16 v26 = 2112;
      id v27 = v14;
      __int16 v28 = 2048;
      unsigned __int8 v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Downloading from Media API with storeID %lld for feedURL %@ localBackgroundFetch %ld", (uint8_t *)&v24, 0x20u);
    }

    [(MTBaseFeedManager *)self startDownloadForPodcastStoreId:a5 triggerBy:v15 feedUrl:v14 useBackgroundFetch:v18 source:a9];
  }
  else
  {
    if (v21)
    {
      int v24 = 138412546;
      int64_t v25 = (int64_t)v14;
      __int16 v26 = 2048;
      id v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Downloading directly from feedURL %@ localBackgroundFetch %ld", (uint8_t *)&v24, 0x16u);
    }

    id v22 = [objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions) initWithUrl:v14 nonAppInitiated:1];
    id v23 = [(MTBaseFeedManager *)self externalFeedDownloader];
    [v23 startDownloadTaskForFeedURL:v22 userInitiated:v10 useBackgroundFetch:v18];
  }
}

- (void)startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if (v15)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100110180;
    v22[3] = &unk_100551C30;
    void v22[4] = self;
    id v23 = v15;
    int64_t v26 = a5;
    id v24 = v16;
    BOOL v28 = a7;
    BOOL v29 = a8;
    id v25 = v17;
    int64_t v27 = a9;
    char v18 = objc_retainBlock(v22);
    unsigned int v19 = [(MTBaseFeedManager *)self configuration];
    if ([v19 useBackgroundFetchForFeedDownloads])
    {
      unsigned __int8 v20 = [(MTBaseFeedManager *)self _shouldDownloadPodcastWithIdentifierFromStore:a5];

      if ((v20 & 1) == 0)
      {
        BOOL v21 = [(MTBaseFeedManager *)self externalFeedDownloader];
        [v21 restoreBackgroundDownloadTasksWithCompletion:v18];

LABEL_7:
        goto LABEL_8;
      }
    }
    else
    {
    }
    ((void (*)(void *))v18[2])(v18);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)startDownloadForPodcastStoreId:(int64_t)a3 triggerBy:(id)a4 feedUrl:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(MTBaseFeedManager *)self storePodcastDownloader];
  id v15 = +[NSNumber numberWithLongLong:a3];
  id v16 = [v12 absoluteString];
  BOOL v17 = [(MTBaseFeedManager *)self allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:v16];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001105A0;
  v19[3] = &unk_100551C58;
  void v19[4] = self;
  id v20 = v12;
  BOOL v22 = v8;
  int64_t v21 = a7;
  id v18 = v12;
  [v14 downloadPodcast:v15 triggerBy:v13 allowEpisodesTo404:v17 isImplicitActionRequest:v8 completion:v19];
}

+ (void)purgeSubscriptionMetadata
{
  id v3 = (id)qword_10060A898;
  objc_sync_enter(v3);
  id v4 = (void *)qword_10060A898;
  qword_10060A898 = 0;

  objc_sync_exit(v3);

  [a1 saveSubscriptionMetadata];
}

+ (void)removeMetadataForPodcastUuid:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    id v4 = (id)qword_10060A898;
    objc_sync_enter(v4);
    [(id)qword_10060A898 removeObjectForKey:v5];
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

+ (void)saveSubscriptionMetadata
{
  id v3 = (id)qword_10060A898;
  objc_sync_enter(v3);
  id v4 = (void *)qword_10060A898;
  id v5 = [a1 _metadataUrl];
  id v8 = 0;
  [v4 writeToURL:v5 error:&v8];
  id v6 = v8;

  if (v6)
  {
    BOOL v7 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = a1;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ failed to save hash cache due to %@", buf, 0x16u);
    }
  }
  objc_sync_exit(v3);
}

- (BOOL)isSubscribingWithFeedUrl:(id)a3
{
  return 0;
}

- (void)_addPendingFeedProcessingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MTBaseFeedManager *)self feedProcessingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100110AC4;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_processNextPendingFeedIfPossible
{
  id v3 = [(MTBaseFeedManager *)self feedProcessingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110BB0;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_queue_processNextPendingFeedIfPossible
{
  id v3 = [(MTBaseFeedManager *)self feedProcessingQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MTBaseFeedManager *)self externalFeedDownloader];
  id v5 = [v4 sessionCompletionHandler];

  if (v5)
  {
    uint64_t v6 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      BOOL v7 = "Postponing feed update because we're waiting to call the session completion handler";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    id v8 = [(MTBaseFeedManager *)self pendingFeedProcessingBlocks];
    id v9 = [v8 count];

    if (!v9)
    {
      uint64_t v6 = _MTLogCategoryFeedUpdate();
      if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      LOWORD(v14) = 0;
      BOOL v7 = "There are no pending feed updates. Doing nothing.";
      goto LABEL_4;
    }
    id v10 = [(MTBaseFeedManager *)self pendingFeedProcessingBlocks];
    uint64_t v6 = [v10 firstObject];

    __int16 v11 = [(MTBaseFeedManager *)self pendingFeedProcessingBlocks];
    [v11 removeObjectAtIndex:0];

    (*(void (**)(uint64_t))(v6 + 16))(v6);
    id v12 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(MTBaseFeedManager *)self pendingFeedProcessingBlocks];
      int v14 = 134217984;
      id v15 = [v13 count];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Done processing feed. %lu remaining.", (uint8_t *)&v14, 0xCu);
    }
    [(MTBaseFeedManager *)self _queue_processNextPendingFeedIfPossible];
  }
LABEL_11:
}

+ (BOOL)_fetchSmallestPicturePossible
{
  return 0;
}

+ (unint64_t)_maxArtworkSize
{
  return 3000;
}

+ (void)didStartUpdatingFeedUrl:(id)a3 cloudSyncUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_10060A890;
  objc_sync_enter(v8);
  [(id)qword_10060A890 addObject:v6];
  objc_sync_exit(v8);

  CFStringRef v13 = @"MTBaseFeedManagerFeedUrlKey";
  id v14 = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [a1 postNotificationName:@"MTBaseFeedManagerDidStartUpdatingFeed" userInfo:v9];

  id v10 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didStartUpdatingFeedUrl: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() didFinishUpdatingFeedUrl:v6 withError:v5];
}

+ (void)didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = (id)qword_10060A890;
  objc_sync_enter(v8);
  if (v6)
  {
    if ([(id)qword_10060A890 containsObject:v6])
    {
      [(id)qword_10060A890 removeObject:v6];
      BOOL v9 = [(id)qword_10060A890 count] == 0;
      if (!v7) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    int v11 = +[IMLogger sharedLogger];
    [v11 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Feed/MTBaseFeedManager.m", 1368, @"Feed update finished without a feedURL, likely failed." lineNumber format];

    id v12 = +[MTFeedUpdateMetricsAction finishedWithoutURL];
    +[IMMetrics recordUserAction:v12];
  }
  BOOL v9 = 0;
  if (!v7)
  {
LABEL_4:
    id v10 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unsigned int v19 = v6;
      __int16 v20 = 1024;
      LODWORD(v21) = [(id)qword_10060A890 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didFinishUpdatingFeedUrl: %@, remaining count = %d", buf, 0x12u);
    }
    goto LABEL_10;
  }
LABEL_8:
  id v10 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v13 = [v7 localizedDescription];
    *(_DWORD *)buf = 138412802;
    unsigned int v19 = v6;
    __int16 v20 = 2112;
    int64_t v21 = v13;
    __int16 v22 = 1024;
    unsigned int v23 = [(id)qword_10060A890 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "didFinishUpdatingFeedUrl: %@, with error: %@, remaining count = %d", buf, 0x1Cu);
  }
LABEL_10:

  objc_sync_exit(v8);
  if (v6) {
    CFStringRef v14 = v6;
  }
  else {
    CFStringRef v14 = &stru_10056A8A0;
  }
  CFStringRef v16 = @"MTBaseFeedManagerFeedUrlKey";
  CFStringRef v17 = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [a1 postNotificationName:@"MTBaseFeedManagerDidEndUpdatingFeed" userInfo:v15];

  if (v9) {
    [a1 didFinishUpdatingAllFeeds:1];
  }
}

+ (void)didFinishUpdatingAllFeeds:(BOOL)a3
{
  BOOL v3 = a3;
  if (![a1 updatingCount])
  {
    [a1 postNotificationName:@"MTBaseFeedManagerDidEndUpdatingAllFeeds" userInfo:0];
    if (v3)
    {
      id v5 = +[MTNotificationManager sharedInstance];
      [v5 processNotificationsWithReason:@"Feed Update"];
    }
    id v6 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didFinishUpdatingAllFeeds", v7, 2u);
    }
  }
}

+ (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001113AC;
  v7[3] = &unk_10054D9B0;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

+ (void)standardDeviationForEpisodes:(id)a3 standardDeviation:(double *)a4 average:(double *)a5
{
  id v33 = a3;
  *a4 = 0.0;
  *a5 = 0.0;
  id v7 = objc_opt_new();
  id v8 = [v33 count];
  if ((uint64_t)v8 - 1 >= 1)
  {
    id v9 = v8;
    uint64_t v10 = 1;
    do
    {
      int v11 = [v33 objectAtIndex:v10 - 1];
      id v12 = [v11 pubDate];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;

      id v15 = [v33 objectAtIndex:v10];
      CFStringRef v16 = [v15 pubDate];
      [v16 timeIntervalSinceReferenceDate];
      double v18 = v17;

      unsigned int v19 = +[NSNumber numberWithDouble:vabdd_f64(v14, v18)];
      [v7 addObject:v19];

      ++v10;
    }
    while (v9 != (id)v10);
    uint64_t v20 = (uint64_t)[v7 count];
    uint64_t v21 = v20;
    if (v20 < 1)
    {
      if (v20) {
        *a5 = 0.0 / (double)v20;
      }
    }
    else
    {
      uint64_t v22 = 0;
      double v23 = 0.0;
      do
      {
        id v24 = [v7 objectAtIndex:v22];
        [v24 doubleValue];
        double v23 = v23 + v25;

        ++v22;
      }
      while (v21 != v22);
      *a5 = v23 / (double)v21;
      if (v21 >= 1)
      {
        uint64_t v26 = 0;
        double v27 = 0.0;
        do
        {
          BOOL v28 = [v7 objectAtIndex:v26];
          [v28 doubleValue];
          double v30 = v29 - *a5;
          v31 = [v7 objectAtIndex:v26];
          [v31 doubleValue];
          double v27 = v27 + v30 * (v32 - *a5);

          ++v26;
        }
        while (v21 != v26);
        if (v21 > 1) {
          *a4 = sqrt(v27 / (double)(v21 - 1));
        }
      }
    }
  }
}

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

- (MTExternalFeedDownloader)externalFeedDownloader
{
  return self->_externalFeedDownloader;
}

- (_TtC18PodcastsFoundation21PodcastFeedDownloader)storePodcastDownloader
{
  return self->_storePodcastDownloader;
}

- (NSMutableArray)pendingFeedProcessingBlocks
{
  return self->_pendingFeedProcessingBlocks;
}

- (void)setPendingFeedProcessingBlocks:(id)a3
{
}

- (OS_dispatch_queue)feedProcessingQueue
{
  return self->_feedProcessingQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_feedProcessingQueue, 0);
  objc_storeStrong((id *)&self->_pendingFeedProcessingBlocks, 0);
  objc_storeStrong((id *)&self->_storePodcastDownloader, 0);
  objc_storeStrong((id *)&self->_externalFeedDownloader, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_downloadManager, 0);
}

@end