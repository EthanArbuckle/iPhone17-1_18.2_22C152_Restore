@interface MTAutoDownloadProcessor
+ (unint64_t)_freeSpace;
- (BOOL)_isLPMEnabled;
- (BOOL)hasCheckQueued;
- (BOOL)isDeviceStorageSpaceAvailableForPersistence;
- (BOOL)start;
- (double)lastCheckTime;
- (id)defaultPropertiesThatAffectPredicate;
- (id)episodePredicateForPodcast:(id)a3;
- (id)podcastPredicate;
- (int64_t)deviceCapacityObserver;
- (void)_lpmDidChange;
- (void)_reCheck;
- (void)_reportRetentionPolicy;
- (void)autodownloadEpisodesChanged:(id)a3;
- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6;
- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4;
- (void)setDeviceCapacityObserver:(int64_t)a3;
- (void)setHasCheckQueued:(BOOL)a3;
- (void)setIsDeviceStorageSpaceAvailableForPersistence:(BOOL)a3;
- (void)setLastCheckTime:(double)a3;
- (void)stop;
@end

@implementation MTAutoDownloadProcessor

+ (unint64_t)_freeSpace
{
  id v9 = 0;
  v2 = +[MTConstants sharedDocumentsDirectory];
  v3 = [v2 path];

  v4 = +[NSFileManager defaultManager];
  v5 = [v4 attributesOfFileSystemForPath:v3 error:&v9];

  if (v9) {
    [v9 logAndThrow:1];
  }
  if (v5)
  {
    v6 = [v5 objectForKey:NSFileSystemFreeSize];
    id v7 = [v6 unsignedLongLongValue];
  }
  else
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (BOOL)start
{
  [(MTAutoDownloadProcessor *)self _reportRetentionPolicy];
  v15.receiver = self;
  v15.super_class = (Class)MTAutoDownloadProcessor;
  BOOL v3 = [(MTBaseProcessor *)&v15 start];
  if (v3)
  {
    objc_initWeak(&location, self);
    [(MTAutoDownloadProcessor *)self setLastCheckTime:0.0];
    [(MTAutoDownloadProcessor *)self setIsDeviceStorageSpaceAvailableForPersistence:1];
    v4 = +[MTReachability sharedInstance];
    [v4 addObserver:self];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_lpmDidChange" name:NSProcessInfoPowerStateDidChangeNotification object:0];
    v6 = +[MTDeviceCapacityMonitor shared];
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_10006AA48;
    v12 = &unk_10054DF98;
    objc_copyWeak(&v13, &location);
    id v7 = [v6 addCapacityChangeObserverWithOptions:3 callback:&v9];
    -[MTAutoDownloadProcessor setDeviceCapacityObserver:](self, "setDeviceCapacityObserver:", v7, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)MTAutoDownloadProcessor;
  [(MTPodcastAndEpisodeProcessor *)&v5 stop];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[MTDeviceCapacityMonitor shared];
  [v4 removeCapacityChangeObserverWith:[self deviceCapacityObserver]];
}

- (id)defaultPropertiesThatAffectPredicate
{
  v2 = +[MTEpisode userDefaultPropertiesAffectingPredicates];
  BOOL v3 = +[MTPodcast userDefaultPropertiesAffectingPredicates];
  v4 = [v2 setByAddingObjectsFromSet:v3];

  return v4;
}

- (id)podcastPredicate
{
  return +[MTPodcast predicateForPodcastsToAutodownload];
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v4 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  objc_super v5 = +[MTDB sharedInstance];
  v6 = [v5 mainOrPrivateContext];

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10006AEA0;
  v19 = &unk_10054DFC0;
  id v7 = v6;
  id v20 = v7;
  id v8 = v4;
  id v21 = v8;
  v22 = &v38;
  v23 = &v34;
  v24 = &v30;
  v25 = &v26;
  [v7 performBlockAndWait:&v16];
  if (*((unsigned char *)v39 + 24)
    && [(MTAutoDownloadProcessor *)self isDeviceStorageSpaceAvailableForPersistence])
  {
    int v9 = *((unsigned __int8 *)v31 + 24);
    uint64_t v10 = v35[3];
    int v11 = *((unsigned __int8 *)v27 + 24);
    v12 = +[MTAccountController sharedInstance];
    id v13 = [v12 activeDsid];
    v14 = +[MTEpisode predicateForAutomaticDownloadsOnShow:v8 deletePlayedEpisodes:v9 != 0 episodeLimit:v10 serialNextEpisodesSort:v11 != 0 includePlayableWithoutAccount:v13 == 0];
  }
  else
  {
    v14 = +[NSPredicate falsePredicate];
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v14;
}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  if (objc_msgSend(a6, "count", a3, a4, a5))
  {
    [(MTAutoDownloadProcessor *)self _reCheck];
  }
}

- (void)autodownloadEpisodesChanged:(id)a3
{
  id v4 = a3;
  [(MTAutoDownloadProcessor *)self _reportRetentionPolicy];
  if ([v4 count])
  {
    objc_super v5 = +[MTReachability sharedInstance];
    unsigned __int8 v6 = [v5 isReachable];

    if (v6)
    {
      id v7 = +[MTReachability sharedInstance];
      unsigned int v8 = [v7 isReachableViaCellular];

      int v9 = +[MTReachability sharedInstance];
      unsigned __int8 v10 = [v9 isPodcastsCellularDownloadsEnabled];

      if ((v10 & 1) != 0 || !v8)
      {
        if ([(MTAutoDownloadProcessor *)self _isLPMEnabled])
        {
          int v11 = _MTLogCategoryDownload();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
            goto LABEL_10;
          }
          *(_WORD *)buf = 0;
          v12 = "Skipping autodownloaded since Low Power Mode is enabled.";
          goto LABEL_9;
        }
        unsigned __int8 v13 = [(MTAutoDownloadProcessor *)self isDeviceStorageSpaceAvailableForPersistence];
        v14 = _MTLogCategoryDownload();
        int v11 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            id v30 = [v4 count];
            __int16 v31 = 2112;
            id v32 = v4;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking Autodownloads for %lu episodes: %@", buf, 0x16u);
          }

          objc_super v15 = +[MTDB sharedInstance];
          v16 = [v15 importContext];

          id v17 = objc_alloc_init((Class)NSMutableSet);
          id v21 = _NSConcreteStackBlock;
          uint64_t v22 = 3221225472;
          v23 = sub_10006B2B0;
          v24 = &unk_10054DFE8;
          id v25 = v4;
          id v26 = v16;
          v27 = self;
          id v28 = v17;
          id v18 = v17;
          int v11 = v16;
          [v11 performBlockAndWait:&v21];
          v19 = +[MTLegacyDownloadManagerProvider sharedInstance];
          id v20 = [v19 downloadManager];
          [v20 addEpisodeAutoDownloads:v18 completion:0];

          goto LABEL_10;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v12 = "Skipping autodownloaded since disk capacity is low.";
          goto LABEL_9;
        }
      }
      else
      {
        int v11 = _MTLogCategoryDownload();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v12 = "Skipping autodownloaded since cellular internet usage is not allowed.";
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
        }
      }
    }
    else
    {
      int v11 = _MTLogCategoryDownload();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v12 = "Skipping autodownloaded since there is no active internet connection";
        goto LABEL_9;
      }
    }
LABEL_10:
  }
}

- (BOOL)_isLPMEnabled
{
  v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void)_reCheck
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(MTAutoDownloadProcessor *)self lastCheckTime];
  double v6 = v4 - v5;
  if (v4 - v5 >= 2.0)
  {
    [(MTAutoDownloadProcessor *)self setLastCheckTime:v4];
    [(MTAutoDownloadProcessor *)self setHasCheckQueued:0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006B630;
    v9[3] = &unk_10054D570;
    v9[4] = self;
    [(MTBaseProcessor *)self enqueueWorkBlock:v9];
  }
  else
  {
    id v7 = self;
    objc_sync_enter(v7);
    if (![(MTAutoDownloadProcessor *)v7 hasCheckQueued])
    {
      unsigned int v8 = _MTLogCategoryDownload();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v11 = v6 + 1.0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Postponing recheck for %.0lf sec.", buf, 0xCu);
      }

      [(MTAutoDownloadProcessor *)v7 setHasCheckQueued:1];
      [(MTAutoDownloadProcessor *)v7 performSelector:"_reCheck" withObject:0 afterDelay:v6 + 1.0];
    }
    objc_sync_exit(v7);
  }
}

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a4) {
    [(MTAutoDownloadProcessor *)self _reCheck];
  }
}

- (void)_lpmDidChange
{
  if (![(MTAutoDownloadProcessor *)self _isLPMEnabled])
  {
    [(MTAutoDownloadProcessor *)self _reCheck];
  }
}

- (void)_reportRetentionPolicy
{
  if (qword_10060A630 != -1) {
    dispatch_once(&qword_10060A630, &stru_10054E008);
  }
  v2 = (void *)qword_10060A628;
  id v3 = +[PFAnalyticsEvent globalRetentionPolicy];
  [v2 sendEvent:v3];
}

- (double)lastCheckTime
{
  return self->_lastCheckTime;
}

- (void)setLastCheckTime:(double)a3
{
  self->_lastCheckTime = a3;
}

- (BOOL)hasCheckQueued
{
  return self->_hasCheckQueued;
}

- (void)setHasCheckQueued:(BOOL)a3
{
  self->_hasCheckQueued = a3;
}

- (BOOL)isDeviceStorageSpaceAvailableForPersistence
{
  return self->_isDeviceStorageSpaceAvailableForPersistence;
}

- (void)setIsDeviceStorageSpaceAvailableForPersistence:(BOOL)a3
{
  self->_isDeviceStorageSpaceAvailableForPersistence = a3;
}

- (int64_t)deviceCapacityObserver
{
  return self->_deviceCapacityObserver;
}

- (void)setDeviceCapacityObserver:(int64_t)a3
{
  self->_deviceCapacityObserver = a3;
}

@end