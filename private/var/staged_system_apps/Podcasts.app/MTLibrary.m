@interface MTLibrary
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
+ (void)initialize;
+ (void)setConfigurationForTests:(id)a3;
- (BOOL)iTunesMatchEnabled;
- (BOOL)setEpisodesOrder:(id)a3 forStation:(id)a4;
- (BOOL)setPlayState:(int64_t)a3 fromContextActions:(BOOL)a4 manually:(BOOL)a5 forUserActionOnEpisode:(id)a6 saveChanges:(BOOL)a7;
- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6;
- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5;
- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6;
- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5;
- (BOOL)setPodcastsOrder:(id)a3;
- (BOOL)setStationShowGroupOrder:(id)a3 forStation:(id)a4;
- (BOOL)setStationsOrder:(id)a3;
- (MTLibrary)init;
- (MTLibrary)initWithConfiguration:(id)a3;
- (MTLibraryConfiguration)config;
- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager;
- (PFFairPlayInvalidationManager)fairPlayInvalidationManager;
- (id)_predicateForOpportunisticHiddenPodcastDeletion;
- (id)_updateUpNextDeleting:(id)a3 inContext:(id)a4 forced:(BOOL)a5 podcastUuids:(id)a6;
- (id)copy;
- (void)_cleanUpOldHiddenAndRecentlyUnfollowedPodcasts;
- (void)_cleanUpOldHiddenPodcasts;
- (void)_cleanupHiddenPodcasts;
- (void)_deleteEpisodeUuids:(id)a3 forced:(BOOL)a4;
- (void)_deleteEpisodes:(id)a3 forced:(BOOL)a4 ctx:(id)a5;
- (void)_deleteFromRecentlyUnfollowedForPredicate:(id)a3;
- (void)_deletePodcastForPredicate:(id)a3;
- (void)_deleteSpotlightIdentifierForPlaylist:(id)a3;
- (void)_deleteSpotlightIdentifiersForPodcast:(id)a3;
- (void)_immediatelyDeleteAllHiddenPodcasts;
- (void)_markAsHiddenPodcast:(id)a3 inContext:(id)a4;
- (void)_markAsHiddenPodcastsWithUuids:(id)a3 setSubscriptionsSyncDirty:(BOOL)a4 ctx:(id)a5;
- (void)_markPlaylistsForUpdateForPodcastUuids:(id)a3;
- (void)_removeDownloadAssetsForEpisodes:(id)a3 shouldKeep:(id)a4 forced:(BOOL)a5;
- (void)_unsafeDeletePodcast:(id)a3 ctx:(id)a4;
- (void)_userDefaultsDidChange:(id)a3;
- (void)cleanUpNeutralInterests;
- (void)cleanUpOldHiddenPodcasts;
- (void)deleteAllInterestsBlockingCaller;
- (void)deleteAllTopLevelStationsExcludingFolders;
- (void)deleteEpisodeUuids:(id)a3;
- (void)deleteEpisodes:(id)a3;
- (void)deleteOrphanedEpisodes;
- (void)deletePlaylist:(id)a3;
- (void)deletePodcastWithUuid:(id)a3;
- (void)deleteStationWithUuid:(id)a3;
- (void)immediatelyDeleteAllHiddenPodcasts;
- (void)removeAllHLSDownloadAssets;
- (void)removeDownloadAssetsForEpisodeAdamIds:(id)a3;
- (void)removeDownloadAssetsForEpisodeAdamIds:(id)a3 shouldKeep:(id)a4;
- (void)removeDownloadAssetsForEpisodeUuids:(id)a3;
- (void)removeDownloadAssetsForEpisodeUuids:(id)a3 shouldKeep:(id)a4;
- (void)removeDownloadOf:(id)a3;
- (void)removeEpisodesWith:(id)a3;
- (void)setConfig:(id)a3;
- (void)setFairPlayInvalidationManager:(id)a3;
- (void)setITunesMatchEnabled:(BOOL)a3;
- (void)setSecureDownloadRenewalManager:(id)a3;
- (void)synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions;
- (void)updateiTunesPlaylistForiTunesMatchState;
@end

@implementation MTLibrary

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MTLibrary;
  [super initialize];
  if ((id)objc_opt_class() == a1)
  {
    +[MTPreferences registerDefaults];
    +[MTPreferences copySettingsToSharedContainer];
  }
}

- (MTLibrary)init
{
  objc_super v3 = +[MTLibraryConfiguration defaultConfiguration];
  v4 = [(MTLibrary *)self initWithConfiguration:v3];

  return v4;
}

- (void)removeDownloadAssetsForEpisodeUuids:(id)a3 shouldKeep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MTDB sharedInstance];
  v9 = [v8 mainOrPrivateContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006604;
  v13[3] = &unk_10054D988;
  id v14 = v9;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  [v12 performBlockAndWaitWithSave:v13];
}

- (void)_removeDownloadAssetsForEpisodes:(id)a3 shouldKeep:(id)a4 forced:(BOOL)a5
{
  id v7 = a3;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100062C80;
  v37[3] = &unk_10054D9D8;
  id v29 = a4;
  id v38 = v29;
  BOOL v39 = a5;
  v8 = objc_retainBlock(v37);
  v31 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v14 = _MTLogCategoryDownload();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v13 storeTrackId:v29];
          *(_DWORD *)buf = 134217984;
          id v41 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleting episode %lld", buf, 0xCu);
        }

        if (((unsigned int (*)(void *, void *))v8[2])(v8, v13))
        {
          v16 = _MTLogCategoryDownload();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v13 storeTrackId];
            *(_DWORD *)buf = 134217984;
            id v41 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skip deleting episode %lld because we should keep", buf, 0xCu);
          }
          goto LABEL_16;
        }
        v18 = +[MTLegacyDownloadManagerProvider sharedInstance];
        v19 = [v18 downloadManagerIfSetup];
        v20 = [v13 uuid];
        [v19 cancelDownloadsForEpisodeUuid:v20 userInitiated:0];

        v21 = +[PFTranscriptProviderBridge shared];
        [v21 invalidateTranscriptAssetForAdamID:[v13 storeTrackId]];

        if ([v13 persistentID])
        {
          v22 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 persistentID]);
          [v31 addObject:v22];
        }
        [v13 setAssetURL:0 v29];
        v23 = +[PFFairPlayRolloutController sharedInstance];
        unsigned __int8 v24 = [v23 isEnabled];

        if ((v24 & 1) == 0
          && +[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", [v13 storeTrackId]))
        {
          v16 = [(MTLibrary *)self secureDownloadRenewalManager];
          -[NSObject requestSecureDeletionOf:completionHandler:](v16, "requestSecureDeletionOf:completionHandler:", [v13 storeTrackId], 0);
LABEL_16:

          continue;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v10);
  }

  id v25 = [v31 count];
  v26 = _MTLogCategoryDownload();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      id v28 = [v31 count];
      *(_DWORD *)buf = 134217984;
      id v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Delete %ld assets from Media Library", buf, 0xCu);
    }

    +[MTMediaLibraryUtil deleteMediaItems:v31 completion:0];
    v26 = +[NSNotificationCenter defaultCenter];
    [v26 postNotificationName:PFMediaDownloadWasDeletedNotification object:0];
  }
  else if (v27)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No downloaded assets in Media Library. Nothing to delete.", buf, 2u);
  }
}

- (MTLibrary)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTLibrary;
  v5 = [(MTLibrary *)&v14 init];
  if (v5)
  {
    id v6 = objc_opt_new();
    [(MTLibrary *)v5 setFairPlayInvalidationManager:v6];

    id v7 = [objc_alloc((Class)MTSecureDownloadRenewalManager) initWithDelegate:v5];
    [(MTLibrary *)v5 setSecureDownloadRenewalManager:v7];

    v8 = +[MTMediaContentSourceiOSMusicLibrary sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000583A0;
    v12[3] = &unk_10054D938;
    id v9 = v5;
    v13 = v9;
    [v8 determineiTunesMatchEnabledWithCompletion:v12];

    +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v9 selector:"_userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];

    [(MTLibrary *)v9 setConfig:v4];
  }

  return v5;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000060B8;
  block[3] = &unk_10054D910;
  block[4] = a1;
  if (qword_10060A620 != -1) {
    dispatch_once(&qword_10060A620, block);
  }
  v2 = (void *)qword_10060A618;

  return v2;
}

- (void)_userDefaultsDidChange:(id)a3
{
  objc_super v3 = [a3 object];
  id v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];

  if (v3 != v4)
  {
    +[MTPreferences copySettingsToSharedContainer];
  }
}

- (void)setSecureDownloadRenewalManager:(id)a3
{
}

- (void)setFairPlayInvalidationManager:(id)a3
{
}

- (void)setConfig:(id)a3
{
}

- (void)removeDownloadAssetsForEpisodeUuids:(id)a3
{
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

+ (void)setConfigurationForTests:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 setConfig:v4];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateiTunesPlaylistForiTunesMatchState
{
  objc_super v3 = +[MTDB sharedInstance];
  id v4 = [v3 privateQueueContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000628A0;
  v6[3] = &unk_10054D960;
  id v7 = v4;
  unsigned __int8 v8 = [(MTLibrary *)self iTunesMatchEnabled];
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)removeDownloadAssetsForEpisodeAdamIds:(id)a3
{
}

- (void)removeDownloadAssetsForEpisodeAdamIds:(id)a3 shouldKeep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[MTDB sharedInstance];
  id v9 = [v8 mainOrPrivateContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100062A28;
  v13[3] = &unk_10054D988;
  id v14 = v9;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  [v12 performBlockAndWaitWithSave:v13];
}

- (void)removeAllHLSDownloadAssets
{
  objc_super v3 = _MTLogCategoryDownload();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Delete all HLS offline keys", buf, 2u);
  }

  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 privateQueueContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062BD8;
  v7[3] = &unk_10054D9B0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 performBlock:v7];
}

- (void)removeDownloadOf:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  [(MTLibrary *)self removeDownloadAssetsForEpisodeAdamIds:v4];
}

- (PFFairPlayInvalidationManager)fairPlayInvalidationManager
{
  return self->_fairPlayInvalidationManager;
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  return self->_secureDownloadRenewalManager;
}

- (void)setITunesMatchEnabled:(BOOL)a3
{
  self->_iTunesMatchEnabled = a3;
}

- (MTLibraryConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, 0);
  objc_storeStrong((id *)&self->_fairPlayInvalidationManager, 0);

  objc_storeStrong((id *)&self->_cleanUpOldHiddenPodcastsWorkController, 0);
}

- (void)_markPlaylistsForUpdateForPodcastUuids:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006B8F0;
  v8[3] = &unk_10054D9B0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (BOOL)setStationsOrder:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006BCB0;
  v9[3] = &unk_10054DA00;
  id v6 = v5;
  id v10 = v6;
  id v7 = v3;
  id v11 = v7;
  id v12 = &v13;
  [v6 performBlockAndWait:v9];
  LOBYTE(v4) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

- (BOOL)setPodcastsOrder:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006C010;
  v10[3] = &unk_10054E030;
  id v7 = v6;
  id v11 = v7;
  id v8 = v4;
  uint64_t v13 = self;
  id v14 = &v15;
  id v12 = v8;
  [v7 performBlockAndWait:v10];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (BOOL)setEpisodesOrder:(id)a3 forStation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v7 = +[MTDB sharedInstance];
  id v8 = [v7 mainOrPrivateContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006C444;
  v13[3] = &unk_10054E080;
  id v9 = v8;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = v5;
  id v16 = v11;
  uint64_t v17 = &v18;
  [v9 performBlockAndWait:v13];
  LOBYTE(v7) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v7;
}

- (BOOL)setStationShowGroupOrder:(id)a3 forStation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v7 = +[MTDB sharedInstance];
  id v8 = [v7 mainOrPrivateContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006C7EC;
  v13[3] = &unk_10054E080;
  id v9 = v8;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = v5;
  id v16 = v11;
  uint64_t v17 = &v18;
  [v9 performBlockAndWait:v13];
  LOBYTE(v7) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v7;
}

- (void)cleanUpOldHiddenPodcasts
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cleanUpOldHiddenPodcastsWorkController)
  {
    uint64_t v3 = +[MTCoalescableWorkController controllerWithQosClass:9 identifier:@"MTLibrary.cleanUpOldHiddenPodcasts"];
    cleanUpOldHiddenPodcastsWorkController = v2->_cleanUpOldHiddenPodcastsWorkController;
    v2->_cleanUpOldHiddenPodcastsWorkController = (MTCoalescableWorkController *)v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_cleanUpOldHiddenPodcastsWorkController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100080E98;
  v6[3] = &unk_10054D570;
  void v6[4] = v2;
  [(MTCoalescableWorkController *)v5 schedule:v6];
}

- (void)immediatelyDeleteAllHiddenPodcasts
{
}

- (void)synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions
{
  uint64_t v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting (hiding) all Podcasts", buf, 2u);
  }

  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 importContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100080FA0;
  v7[3] = &unk_10054D9B0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 performBlockAndWaitWithSave:v7];
}

- (void)_immediatelyDeleteAllHiddenPodcasts
{
  uint64_t v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Immediately deleting all hidden podcasts", v5, 2u);
  }

  id v4 = +[MTPodcast predicateForHiddenPodcasts];
  [(MTLibrary *)self _deletePodcastForPredicate:v4];
}

- (void)_cleanUpOldHiddenPodcasts
{
  if (os_feature_enabled_recently_unfollowed())
  {
    [(MTLibrary *)self _cleanUpOldHiddenAndRecentlyUnfollowedPodcasts];
  }
  else
  {
    [(MTLibrary *)self _cleanupHiddenPodcasts];
  }
}

- (void)_cleanupHiddenPodcasts
{
  id v3 = [(MTLibrary *)self _predicateForOpportunisticHiddenPodcastDeletion];
  [(MTLibrary *)self _deletePodcastForPredicate:v3];
}

- (void)_cleanUpOldHiddenAndRecentlyUnfollowedPodcasts
{
  id v3 = [(MTLibrary *)self _predicateForOpportunisticHiddenPodcastDeletion];
  v8[0] = v3;
  id v4 = +[MTPodcast predicateForRecentlyUnfollowedOlderThanCutoffDate];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  [(MTLibrary *)self _deletePodcastForPredicate:v6];
  id v7 = +[MTPodcast predicateForRecentlyUnfollowedOlderThanCutoffDate];
  [(MTLibrary *)self _deleteFromRecentlyUnfollowedForPredicate:v7];
}

- (id)_predicateForOpportunisticHiddenPodcastDeletion
{
  v2 = +[NSDate now];
  id v3 = [v2 dateByAddingTimeInterval:-60.0];
  id v4 = +[MTPodcast predicateForHiddenPodcasts];
  v9[0] = v4;
  id v5 = +[NSPredicate predicateForDateKey:kPodcastAddedDate isGreaterThanDate:v3];
  v9[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:2];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

- (void)_deleteFromRecentlyUnfollowedForPredicate:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 importContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_100081504;
  v8[3] = &unk_10054D9B0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (void)_deletePodcastForPredicate:(id)a3
{
  id v4 = a3;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 importContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_100081760;
  v9[3] = &unk_10054E708;
  id v10 = v6;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
  +[MTBaseFeedManager saveSubscriptionMetadata];
}

- (void)_unsafeDeletePodcast:(id)a3 ctx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 uuid];
    if (!v8)
    {
      id v9 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error deleting podcast without uuid", (uint8_t *)&v16, 2u);
      }
    }
    id v10 = +[MTImageStore defaultStore];
    [v10 removeItemsWithPrefx:v8];

    id v11 = +[PUIFeedManagerArtworkBridge shared];
    [v11 invalidateArtworkForPodcast:v6];

    id v12 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleting episodes for podcast %@ as part of podcast deletion", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v13 = +[MTEpisode predicateForAllEpisodesIncludingHiddenOnPodcastUuid:v8];
    [(MTLibrary *)self _deleteEpisodes:v13 forced:1 ctx:v7];

    id v14 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleting MTPodcast %@ from context", (uint8_t *)&v16, 0xCu);
    }

    [v7 deleteObject:v6];
    [v7 saveInCurrentBlock];
    id v15 = +[MTIntentDonationUtil sharedInstance];
    [v15 removeDonationForPodcastUuid:v8];
  }
}

- (void)_markAsHiddenPodcast:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 uuid];
    *(_DWORD *)buf = 138412290;
    id v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Marking podcast %@ for deletion by hiding it", buf, 0xCu);
  }
  [v6 setHidden:1];
  id v10 = [(MTLibrary *)self config];
  unsigned int v11 = [v10 supportsLocalMedia];

  if (v11)
  {
    id v12 = [v6 episodes];
    [(MTLibrary *)self _removeDownloadAssetsForEpisodes:v12 shouldKeep:0 forced:1];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v6 playlistSettings];
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v19 = [v18 playlist];
        [v19 setNeedsUpdate:1];

        [v7 deleteObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  uint64_t v20 = [v6 uuid];
  +[MTBaseFeedManager removeMetadataForPodcastUuid:v20];

  char v21 = +[UNUserNotificationCenter currentNotificationCenter];
  v22 = [v6 uuid];
  [v21 mt_removeAllNotificationsForPodcastUuid:v22];

  [(MTLibrary *)self _deleteSpotlightIdentifiersForPodcast:v6];
}

- (void)_deleteSpotlightIdentifiersForPodcast:(id)a3
{
  id v3 = a3;
  id v4 = [v3 episodes];
  id v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);

  id v6 = [v3 episodes];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100081E8C;
  v10[3] = &unk_10054EA88;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = +[MTCoreSpotlightUtil uniqueIdentifierForObject:v3];

  if (v8) {
    [v7 addObject:v8];
  }
  id v9 = +[MTCoreSpotlightController sharedInstance];
  [v9 deleteSearchableItemsWithIdentifiers:v7];
}

- (void)deletePodcastWithUuid:(id)a3
{
  id v4 = a3;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 importContext];

  id v8 = v4;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];

  [(MTLibrary *)self _markAsHiddenPodcastsWithUuids:v7 setSubscriptionsSyncDirty:1 ctx:v6];
}

- (void)_markAsHiddenPodcastsWithUuids:(id)a3 setSubscriptionsSyncDirty:(BOOL)a4 ctx:(id)a5
{
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_1000820B0;
  id v14 = &unk_10054EAB0;
  id v15 = a3;
  id v8 = a5;
  id v16 = v8;
  uint64_t v17 = self;
  LOBYTE(v18) = a4;
  id v9 = v15;
  id v10 = objc_retainBlock(&v11);
  if (isRunningUnitTests()) {
    [v8 performBlockAndWait:v10, v11, v12, v13, v14, v15, v16, v17, v18];
  }
  else {
    [v8 performBlock:v10, v11, v12, v13, v14, v15, v16, v17, v18];
  }
}

- (void)deletePlaylist:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 managedObjectContext];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DCEC8;
    v7[3] = &unk_10054D9B0;
    id v8 = v5;
    id v9 = self;
    [v6 performBlockAndWaitWithSave:v7];
  }
}

- (void)deleteStationWithUuid:(id)a3
{
  id v4 = a3;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  id v7 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Deleting station with uuid: %@", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DD0A4;
  v10[3] = &unk_10054E708;
  id v11 = v6;
  id v12 = v4;
  uint64_t v13 = self;
  id v8 = v4;
  id v9 = v6;
  [v9 performBlockAndWait:v10];
}

- (void)deleteAllTopLevelStationsExcludingFolders
{
  id v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Deleting all Stations", buf, 2u);
  }

  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DD1FC;
  v7[3] = &unk_10054D9B0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

- (void)_deleteSpotlightIdentifierForPlaylist:(id)a3
{
  id v3 = +[MTCoreSpotlightUtil uniqueIdentifierForObject:a3];
  if (v3)
  {
    id v4 = +[MTCoreSpotlightController sharedInstance];
    id v7 = v3;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
    id v6 = +[NSSet setWithArray:v5];
    [v4 deleteSearchableItemsWithIdentifiers:v6];
  }
}

- (void)_deleteEpisodes:(id)a3 forced:(BOOL)a4 ctx:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MTLibrary *)self config];
  if ([v10 supportsLocalMedia])
  {
  }
  else
  {
    id v11 = [(MTLibrary *)self config];
    unsigned int v12 = [v11 supportsPlayback];

    if (!v12) {
      goto LABEL_14;
    }
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = sub_10005700C;
  long long v34 = sub_1000572D0;
  id v35 = +[NSMutableSet set];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000EC218;
  v24[3] = &unk_1005511D8;
  id v25 = v8;
  long long v26 = self;
  id v13 = v9;
  BOOL v29 = a4;
  id v27 = v13;
  id v28 = &v30;
  [v13 performBlockAndWait:v24];
  if ([(id)v31[5] count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = (id)v31[5];
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v17);
          v19 = +[UNUserNotificationCenter currentNotificationCenter];
          [v19 mt_removeAllNotificationsForDeletedEpisodesOnPodcastUuid:v18 ctx:v13];

          uint64_t v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v20 objects:v36 count:16];
      }
      while (v15);
    }
  }
  _Block_object_dispose(&v30, 8);

LABEL_14:
}

- (void)_deleteEpisodeUuids:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = +[NSPredicate predicateWithFormat:@"%K IN %@", kEpisodeUuid, a3];
  id v6 = +[MTDB sharedInstance];
  id v7 = [v6 mainOrPrivateContext];
  [(MTLibrary *)self _deleteEpisodes:v8 forced:v4 ctx:v7];
}

- (id)_updateUpNextDeleting:(id)a3 inContext:(id)a4 forced:(BOOL)a5 podcastUuids:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  unsigned int v12 = [(MTLibrary *)self config];
  LODWORD(self) = [v12 supportsPlayback];

  if (self)
  {
    id v13 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v30 = v9;
    id obj = v9;
    id v14 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v34;
      p_info = MTGenericCell.info;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([p_info + 26 hasDefaultInstance])
          {
            long long v20 = [p_info + 26 defaultInstance];
            long long v21 = [v20 upNextController];
            long long v22 = [v19 uuid];
            [v21 removeEpisodesForUuid:v22];

            p_info = (__objc2_class_ro **)(MTGenericCell + 32);
          }
          if ((![v19 feedDeleted] || objc_msgSend(v19, "isDownloaded"))
            && !a5)
          {
            long long v23 = _MTLogCategoryDefault();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              long long v24 = [v19 uuid];
              id v25 = [v19 podcastUuid];
              *(_DWORD *)buf = 138412546;
              id v38 = v24;
              __int16 v39 = 2112;
              v40 = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Do not delete a downloaded item! episode uuid %@ - podcast uuid %@", buf, 0x16u);

              p_info = (__objc2_class_ro **)(MTGenericCell + 32);
            }
          }
          long long v26 = [v19 podcast];
          id v27 = [v26 uuid];
          [v11 addObject:v27];

          id v28 = [v19 uuid];
          [v13 addObject:v28];

          [v10 deleteObject:v19];
        }
        id v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v15);
    }

    id v9 = v30;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)deleteEpisodes:(id)a3
{
  id v4 = a3;
  id v6 = +[MTDB sharedInstance];
  id v5 = [v6 mainOrPrivateContext];
  [(MTLibrary *)self _deleteEpisodes:v4 forced:0 ctx:v5];
}

- (void)deleteEpisodeUuids:(id)a3
{
}

- (void)deleteOrphanedEpisodes
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000ECAB0;
  v6[3] = &unk_10054D9B0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5
{
  id v8 = a5;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v9 = +[MTDB sharedInstance];
  id v10 = [v9 mainOrPrivateContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100120CF8;
  v15[3] = &unk_1005522D0;
  id v11 = v10;
  id v16 = v11;
  id v12 = v8;
  uint64_t v18 = self;
  v19 = &v22;
  id v17 = v12;
  BOOL v20 = a3;
  BOOL v21 = a4;
  [v11 performBlockAndWait:v15];
  char v13 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6
{
  if (a3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 2;
  }
  return [(MTLibrary *)self setPlayState:v6 manually:a4 forUserActionOnEpisode:a5 saveChanges:a6];
}

- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5
{
  id v8 = a5;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v9 = +[MTDB sharedInstance];
  id v10 = [v9 mainOrPrivateContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100120EBC;
  v15[3] = &unk_1005522F8;
  id v11 = v10;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  uint64_t v18 = self;
  v19 = &v22;
  int64_t v20 = a3;
  BOOL v21 = a4;
  [v11 performBlockAndWait:v15];
  char v13 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6
{
  return [(MTLibrary *)self setPlayState:a3 fromContextActions:0 manually:a4 forUserActionOnEpisode:a5 saveChanges:a6];
}

- (BOOL)setPlayState:(int64_t)a3 fromContextActions:(BOOL)a4 manually:(BOOL)a5 forUserActionOnEpisode:(id)a6 saveChanges:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a5;
  BOOL v9 = a4;
  id v11 = a6;
  if (v11)
  {
    id v12 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v11 playState];
      id v14 = [v11 title];
      id v15 = [v11 uuid];
      v21[0] = 67241730;
      v21[1] = v9;
      __int16 v22 = 2050;
      id v23 = v13;
      __int16 v24 = 2050;
      int64_t v25 = a3;
      __int16 v26 = 1026;
      int v27 = v8;
      __int16 v28 = 1026;
      BOOL v29 = v7;
      __int16 v30 = 2114;
      v31 = v14;
      __int16 v32 = 2114;
      long long v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting Playstate from context actions %{public}d: playstate from %{public}lld to %{public}lld , Manual: %{public}d, saveChanges: %{public}u For: %{public}@, UUID: %{public}@", (uint8_t *)v21, 0x3Cu);
    }
    id v16 = [v11 podcast];
    [v16 resetGoDarkWithReason:4];
    if (v9)
    {
      id v17 = [v11 playState];
      if (a3 == 2 && !v17) {
        [v11 setPlayhead:0.0];
      }
      if (a3) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    if (!a3 && (v8 & 1) == 0)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      [v11 setLastDatePlayed:];
    }
    unsigned __int8 v18 = 1;
    [v11 setPlayState:a3 manually:v8 source:1];
    if (v7)
    {
      v19 = [v11 managedObjectContext];
      unsigned __int8 v18 = [v19 saveInCurrentBlock];
    }
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (void)cleanUpNeutralInterests
{
  v2 = self;
  MTLibrary.cleanUpNeutralInterests()();
}

- (void)deleteAllInterestsBlockingCaller
{
  v2 = self;
  MTLibrary.deleteAllInterestsBlockingCaller()();
}

- (void)removeEpisodesWith:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = self;
  MTLibrary.removeEpisodes(with:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

@end