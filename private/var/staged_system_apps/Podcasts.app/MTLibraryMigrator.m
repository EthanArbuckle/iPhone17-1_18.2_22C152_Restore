@interface MTLibraryMigrator
+ (BOOL)_hasMTImageStoreContent;
+ (BOOL)_needsImageStoreMigration;
+ (BOOL)globalDownloadPolicyRequiresMigration;
+ (BOOL)hasBeenInactiveForTimeInterval:(double)a3;
+ (BOOL)isDefaultSettingsForPlaylist:(id)a3 title:(id)a4 episodesToShow:(int64_t)a5 showPlayedEpisodes:(BOOL)a6 includeAllPodcasts:(BOOL)a7;
+ (BOOL)moveSQLiteFilesFromDocumentsToSharedContainer;
+ (BOOL)needToMigrateDataToSharedContainer;
+ (BOOL)needsMigration;
+ (BOOL)needsToComputeLastLaunch;
+ (BOOL)podcastMigrationForVersion8to9:(id)a3;
+ (BOOL)runCoreDataMigration;
+ (BOOL)runDataMigration;
+ (BOOL)runImageFormatMigration;
+ (BOOL)runImageStoreMigration;
+ (BOOL)runImageStorePathMigration;
+ (BOOL)runMigrationForPodcast:(id)a3 version:(int64_t)a4;
+ (double)inactiveIntervalForDownloadPolicyUpgrade;
+ (id)_fetchRequestForMostRecentlyPlayedEpisode;
+ (id)_mostRecentPlayTimeFromDatabase;
+ (id)legacyLibraryPath;
+ (int)episodesToKeepDefaultValue;
+ (int64_t)episodesToKeepToEpisodeLimit:(int)a3;
+ (void)_migrateToImageProvider;
+ (void)_removeImageStoreContent;
+ (void)_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:(id)a3;
+ (void)allEpisodesMigrationForVersion40to41In:(id)a3;
+ (void)allEpisodesMigrationForVersion43to44In:(id)a3;
+ (void)allEpisodesMigrationForVersion45to46In:(id)a3;
+ (void)allEpisodesMigrationForVersion46to47In:(id)a3;
+ (void)allEpisodesMigrationForVersion47to48In:(id)a3;
+ (void)allEpisodesMigrationForVersion51to52In:(id)a3;
+ (void)allEpisodesMigrationForVersion53to54In:(id)a3;
+ (void)allEpisodesMigrationForVersion54to55In:(id)a3;
+ (void)allEpisodesMigrationForVersion59to60In:(id)a3;
+ (void)allEpisodesMigrationForVersion65to66In:(id)a3;
+ (void)allEpisodesMigrationForVersion68to69In:(id)a3;
+ (void)deleteDuplicateVideoEpisodesForRdar59691904;
+ (void)deleteOrUpdatePlaylist:(id)a3 ifIsDefault:(BOOL)a4;
+ (void)episodeMigrationForVersion0to1:(id)a3;
+ (void)episodeMigrationForVersion13to14:(id)a3;
+ (void)episodeMigrationForVersion16to17:(id)a3;
+ (void)episodeMigrationForVersion17to18:(id)a3;
+ (void)episodeMigrationForVersion21to22:(id)a3;
+ (void)episodeMigrationForVersion23to24:(id)a3;
+ (void)episodeMigrationForVersion29to30:(id)a3;
+ (void)episodeMigrationForVersion6to7:(id)a3;
+ (void)fixupDataMigrationVersion;
+ (void)migrateDatabaseToSharedContainerIfNeeded;
+ (void)migrateDefaultPlaylistsForVersion18to19;
+ (void)migratePlaylistDefaultsForVersion66to67;
+ (void)migratePlaylistDefaultsForVersion7to8;
+ (void)migratePlaylistsForVersion:(int64_t)a3;
+ (void)migrateSerpentId;
+ (void)migrateSettingDefaultsForVersion10to11;
+ (void)migrateSettingDefaultsForVersion42to43;
+ (void)migrateSettingDefaultsForVersion44to45;
+ (void)migrateSettingDefaultsForVersion48to49;
+ (void)migrateSettingDefaultsForVersion58to59;
+ (void)migrateSettingDefaultsForVersion60to61;
+ (void)migrateSettingDefaultsForVersion6to7;
+ (void)migrateSettingDefaultsForVersion9to10;
+ (void)migrateSettingsForVersion:(unint64_t)a3;
+ (void)moveEpisodeAssetsToSharedContainer;
+ (void)podcastMigrationForVersion11to12:(id)a3;
+ (void)podcastMigrationForVersion14to15:(id)a3;
+ (void)podcastMigrationForVersion19to20:(id)a3;
+ (void)podcastMigrationForVersion20to21:(id)a3;
+ (void)podcastMigrationForVersion27to28:(id)a3;
+ (void)podcastMigrationForVersion28to29:(id)a3;
+ (void)podcastMigrationForVersion32to33:(id)a3;
+ (void)podcastMigrationForVersion34to35:(id)a3;
+ (void)podcastMigrationForVersion36to37:(id)a3;
+ (void)podcastMigrationForVersion38to39:(id)a3;
+ (void)podcastMigrationForVersion41to42:(id)a3;
+ (void)podcastMigrationForVersion42to43:(id)a3;
+ (void)podcastMigrationForVersion44to45:(id)a3;
+ (void)podcastMigrationForVersion49to50:(id)a3;
+ (void)podcastMigrationForVersion50to51:(id)a3;
+ (void)podcastMigrationForVersion55to56:(id)a3;
+ (void)podcastMigrationForVersion56to57:(id)a3;
+ (void)podcastMigrationForVersion57to58:(id)a3;
+ (void)podcastMigrationForVersion58to59:(id)a3;
+ (void)podcastMigrationForVersion59to60:(id)a3;
+ (void)podcastMigrationForVersion62to63:(id)a3;
+ (void)podcastMigrationForVersion66to67:(id)a3;
+ (void)podcastMigrationForVersion6to7:(id)a3;
+ (void)podcastMigrationForVersion9to10:(id)a3;
+ (void)prunePersistentHistory;
+ (void)recalculateAllPlaylists;
+ (void)removeAllEpisodesFromMediaLibrary;
+ (void)rollbackMigrationV40IfNeededInContext:(id)a3;
+ (void)runMigrationOnAllEpisodesForVersion:(int64_t)a3;
+ (void)runMigrationOnEpisodesByPodcastForVersion:(int64_t)a3;
+ (void)setLastLaunchFromDatabase;
+ (void)touchAllMigrationVersions;
+ (void)touchCoreDataMigrationVersion;
+ (void)touchLibraryMigrationVersion;
+ (void)updateGlobalDownloadPolicyIfNecessary;
@end

@implementation MTLibraryMigrator

+ (BOOL)_needsImageStoreMigration
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  char v3 = [v2 BOOLForKey:kMTImageProviderMigrationHasOccurred] ^ 1;

  return v3;
}

+ (BOOL)_hasMTImageStoreContent
{
  v2 = +[MTImageStoreConstants defaultImageStoreURL];
  char v3 = +[NSFileManager defaultManager];
  char v8 = 0;
  v4 = [v2 path];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4 isDirectory:&v8];
  if (v8) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)hasBeenInactiveForTimeInterval:(double)a3
{
  v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned __int8 v5 = [v4 lastAppUseDate];
  if (v5)
  {
    BOOL v6 = +[NSDate now];
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    BOOL v9 = v8 > a3;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)needsToComputeLastLaunch
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  char v3 = [v2 lastAppUseDate];

  v4 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    double v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Last application use: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3 == 0;
}

+ (BOOL)needsMigration
{
  if (+[MTLibraryMigrationUtil isNewInstall])
  {
    +[IMMetrics recordUserAction:@"is_new_install"];
    [a1 touchAllMigrationVersions];
    return 0;
  }
  [a1 fixupDataMigrationVersion];
  if (+[MTLibraryMigrationUtil needsCoreDataMigration](MTLibraryMigrationUtil, "needsCoreDataMigration") & 1) != 0|| (+[MTLibraryMigrationUtil needsDataMigration](MTLibraryMigrationUtil, "needsDataMigration") & 1) != 0|| (+[MTLibraryMigrationUtil needsImageStoreMigration](MTLibraryMigrationUtil, "needsImageStoreMigration") & 1) != 0|| (+[MTDB isCorrupt](MTDB, "isCorrupt") & 1) != 0|| (+[MTDB needsSerpentIdEpisodeMigration](MTDB, "needsSerpentIdEpisodeMigration") & 1) != 0|| (+[MTDB needsCacheBustForFreeAndPaidUrlStorage](MTDB, "needsCacheBustForFreeAndPaidUrlStorage") & 1) != 0|| (+[MTDB needsMigrationToDeltaFeedUpdates](MTDB, "needsMigrationToDeltaFeedUpdates") & 1) != 0|| ([a1 globalDownloadPolicyRequiresMigration] & 1) != 0|| +[MTDataMigrator requiresMigration](MTDataMigrator, "requiresMigration")|| (objc_msgSend(a1, "_needsImageStoreMigration"))
  {
    return 1;
  }
  if (+[PFClientUtil supportsImageStore]) {
    return 0;
  }

  return [a1 _hasMTImageStoreContent];
}

+ (void)migrateDatabaseToSharedContainerIfNeeded
{
  if ((+[MTDB quickCheckForNeedsContainerMigration] & 1) == 0)
  {
    if ([a1 needToMigrateDataToSharedContainer]) {
      [a1 moveSQLiteFilesFromDocumentsToSharedContainer];
    }
    if (([a1 needToMigrateDataToSharedContainer] & 1) == 0)
    {
      +[MTDB setQuickCheckForNeedsContainerMigration:1];
    }
  }
}

+ (double)inactiveIntervalForDownloadPolicyUpgrade
{
  return 63072000.0;
}

+ (BOOL)globalDownloadPolicyRequiresMigration
{
  if ([a1 needsToComputeLastLaunch]) {
    return 1;
  }
  [a1 inactiveIntervalForDownloadPolicyUpgrade];

  return [a1 hasBeenInactiveForTimeInterval:];
}

+ (void)fixupDataMigrationVersion
{
  if (!+[MTDB libraryDataVersion])
  {
    v2 = +[MTConstants managedObjectModelDefinitionURL];
    char v3 = [v2 URLByAppendingPathComponent:@"/MTLibrary 19.mom"];

    id v4 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v3];
    if (+[MTLibraryMigrationUtil isMomCompatible:v4])
    {
      unsigned __int8 v5 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] Setting library to data version 6 which matches database version 19", v6, 2u);
      }

      +[MTDB setLibraryDataVersion:6];
    }
  }
}

+ (BOOL)runDataMigration
{
  os_unfair_lock_lock(&stru_10060A968);
  char v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Acquired lock.", v25, 2u);
  }

  unsigned int v4 = +[MTLibraryMigrationUtil needsDataMigration];
  if (v4)
  {
    uint64_t v5 = (uint64_t)+[MTDB libraryDataVersion];
    int v6 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 134217984;
      *(void *)&v25[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Needs migration with dataVersion %ld.", v25, 0xCu);
    }

    double v7 = +[MTLibrary sharedInstance];
    [v7 deleteOrphanedEpisodes];

    double v8 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Deleted orphaned episodes.", v25, 2u);
    }

    [a1 migrateSettingsForVersion:v5];
    BOOL v9 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for settings.", v25, 2u);
    }

    [a1 migratePlaylistsForVersion:v5];
    v10 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for playlists.", v25, 2u);
    }

    [a1 runMigrationOnEpisodesByPodcastForVersion:v5];
    v11 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for episodes by podcast.", v25, 2u);
    }

    [a1 runMigrationOnAllEpisodesForVersion:v5];
    v12 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished migration for ALL episodes.", v25, 2u);
    }

    switch(v5)
    {
      case 32:
        if (!+[PFClientUtil isRunningOnInternalOS]) {
          goto LABEL_28;
        }
        [a1 deleteDuplicateVideoEpisodesForRdar59691904];
        v13 = _MTLogCategoryDatabase();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        *(_WORD *)v25 = 0;
        v14 = "[Migration] (Data) Deleted duplicate video episodes.";
        goto LABEL_26;
      case 15:
        v15 = +[NSUserDefaults standardUserDefaults];
        [v15 setObject:0 forKey:@"MTPodcastManifestUuid"];

        v13 = _MTLogCategoryDatabase();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          v14 = "[Migration] (Data) Set kMTPodcastManifestUuid to nil in defaults.";
          goto LABEL_26;
        }
        break;
      case 3:
        [a1 recalculateAllPlaylists];
        v13 = _MTLogCategoryDatabase();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          v14 = "[Migration] (Data) Finished recalculation for ALL playlists.";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, v25, 2u);
        }
        break;
      default:
        if (v5 >= 34)
        {
          if ((unint64_t)v5 > 0x3D)
          {
            if ((unint64_t)v5 > 0x45) {
              goto LABEL_36;
            }
            goto LABEL_35;
          }
LABEL_34:
          [a1 prunePersistentHistory];
LABEL_35:
          +[MTFeedManager resetCache];
LABEL_36:
          [a1 touchLibraryMigrationVersion];
          v20 = _MTLogCategoryDatabase();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = +[MTDB libraryDataVersion];
            *(_DWORD *)v25 = 134218240;
            *(void *)&v25[4] = v5;
            __int16 v26 = 2048;
            id v27 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Set migration version from %ld to %ld", v25, 0x16u);
          }

          goto LABEL_39;
        }
LABEL_28:
        if (+[PFClientUtil isRunningOnHomepod])
        {
          v16 = +[MTLibrary sharedInstance];
          v17 = +[NSPredicate truePredicate];
          [v16 deleteEpisodes:v17];

          v18 = _MTLogCategoryDatabase();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) (HomePod) Deleted episodes.", v25, 2u);
          }

          +[MTBaseFeedManager purgeSubscriptionMetadata];
          v19 = _MTLogCategoryDatabase();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) (HomePod) Purged subscription metadata.", v25, 2u);
          }
        }
        goto LABEL_34;
    }

    goto LABEL_28;
  }
LABEL_39:
  if (+[MTDB needsSerpentIdEpisodeMigration])
  {
    [a1 migrateSerpentId];
    unsigned int v4 = 1;
  }
  if (+[MTDB needsCacheBustForFreeAndPaidUrlStorage])
  {
    +[MTFeedManager resetCache];
    unsigned int v4 = 1;
  }
  +[MTDB setStoreBothFreeAndPaidUrlsPreviousBootup];
  if (+[MTDB needsMigrationToDeltaFeedUpdates])
  {
    +[MTFeedManager migrateToDeltaFeedSystem];
    +[MTDB setMigrationToDeltaFeedUpdatesComplete];
  }
  if ([a1 needsToComputeLastLaunch]) {
    [a1 setLastLaunchFromDatabase];
  }
  [a1 updateGlobalDownloadPolicyIfNecessary];
  if ([a1 _needsImageStoreMigration])
  {
    [a1 _migrateToImageProvider];
  }
  else if ([a1 _hasMTImageStoreContent])
  {
    v22 = _MTLogCategoryArtworkDownload();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "ImageProvider migration is complete, but images remain in MTImageStore. Attempting deletion...", v25, 2u);
    }

    [a1 _removeImageStoreContent];
  }
  +[MTDataMigrator migrate];
  os_unfair_lock_unlock(&stru_10060A968);
  v23 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v25 = 67109120;
    *(_DWORD *)&v25[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Finished. Did perform migration: %x", v25, 8u);
  }

  return v4;
}

+ (void)_migrateToImageProvider
{
  char v3 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Beginning artwork migration from MTImageStore to ImageProvider", buf, 2u);
  }

  unsigned int v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  uint64_t v5 = +[PUIObjCArtworkProvider shared];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001521F0;
  v7[3] = &unk_100553150;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 migrateLibraryArtworkFromImageStoreWithCompletionHandler:v7];
}

+ (void)_removeImageStoreContent
{
  if (!+[PFClientUtil supportsImageStore])
  {
    v2 = +[MTImageStoreConstants defaultImageStoreURL];
    char v3 = +[NSFileManager defaultManager];
    id v12 = 0;
    unsigned int v4 = [v3 removeItemAtURL:v2 error:&v12];
    id v5 = v12;

    id v6 = _MTLogCategoryArtworkDownload();
    double v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v8 = "Successfully removed image store directory";
        id v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_INFO;
        uint32_t v11 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      id v8 = "Failed to remove image store directory: %@";
      id v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 12;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  v2 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Skipping image store removal, client supports image store", buf, 2u);
  }
LABEL_11:
}

+ (void)migratePlaylistsForVersion:(int64_t)a3
{
  if ((unint64_t)(a3 - 19) >= 0x31)
  {
    if ((unint64_t)(a3 - 7) >= 0xC)
    {
      if ((unint64_t)a3 > 6) {
        return;
      }
      [a1 migratePlaylistDefaultsForVersion7to8];
    }
    [a1 migrateDefaultPlaylistsForVersion18to19];
  }

  _[a1 migratePlaylistDefaultsForVersion66to67];
}

+ (void)migratePlaylistDefaultsForVersion66to67
{
  v2 = +[MTDB sharedInstance];
  char v3 = [v2 mainOrPrivateContext];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001525B0;
  v5[3] = &unk_10054D570;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWaitWithSave:v5];
}

+ (void)migratePlaylistDefaultsForVersion7to8
{
  v2 = +[MTDB sharedInstance];
  char v3 = [v2 mainOrPrivateContext];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001527A8;
  v5[3] = &unk_10054D570;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWaitWithSave:v5];
}

+ (void)migrateDefaultPlaylistsForVersion18to19
{
  char v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating playlists from version 18 to 19.", buf, 2u);
  }

  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001529EC;
  v7[3] = &unk_10054EB68;
  id v8 = v5;
  id v9 = a1;
  id v6 = v5;
  [v6 performBlockAndWaitWithSave:v7];
}

+ (void)deleteOrUpdatePlaylist:(id)a3 ifIsDefault:(BOOL)a4
{
  if (a4)
  {
    id v4 = a3;
    id v5 = +[MTLibrary sharedInstance];
    [v5 deletePlaylist:v4];
  }
  else
  {
    id v5 = a3;
    [v5 setIsBuiltIn:0];
  }
}

+ (BOOL)isDefaultSettingsForPlaylist:(id)a3 title:(id)a4 episodesToShow:(int64_t)a5 showPlayedEpisodes:(BOOL)a6 includeAllPodcasts:(BOOL)a7
{
  int v7 = a7;
  int v8 = a6;
  id v11 = a3;
  id v12 = a4;
  v13 = [v11 title];
  unsigned int v14 = [v13 isEqualToString:v12];

  if (v14)
  {
    v15 = [v11 defaultSettings];
    BOOL v16 = [v15 episodesToShow] == (id)a5
       && [v15 showPlayedEpisodes] == v8
       && [v11 includesAllPodcasts] == v7
       && [v15 mediaType] == 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (void)migrateSettingsForVersion:(unint64_t)a3
{
  uint64_t v8 = v4;
  uint64_t v9 = v3;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      [a1 migrateSettingDefaultsForVersion6to7];
      goto LABEL_3;
    case 7uLL:
    case 8uLL:
    case 9uLL:
LABEL_3:
      [a1 migrateSettingDefaultsForVersion9to10:v4, v9, v5];
      goto LABEL_4;
    case 0xAuLL:
LABEL_4:
      [a1 migrateSettingDefaultsForVersion10to11:v8, v9];
      goto LABEL_5;
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
LABEL_5:
      [a1 migrateSettingDefaultsForVersion30to31:v8, v9];
      goto LABEL_6;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
LABEL_6:
      [a1 migrateSettingDefaultsForVersion42to43:v8, v9];
      goto LABEL_7;
    case 0x2BuLL:
    case 0x2CuLL:
LABEL_7:
      [a1 migrateSettingDefaultsForVersion44to45:v8, v9];
      goto LABEL_8;
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
LABEL_8:
      [a1 migrateSettingDefaultsForVersion48to49:v8, v9];
      goto LABEL_9;
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
LABEL_9:
      [a1 migrateSettingDefaultsForVersion58to59:v8, v9];
      goto LABEL_10;
    case 0x3BuLL:
    case 0x3CuLL:
LABEL_10:
      _[a1 migrateSettingDefaultsForVersion60to61];
      break;
    default:
      return;
  }
}

+ (void)migrateSettingDefaultsForVersion6to7
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  [v3 floatForKey:@"MTAutoDownload"];
  int v5 = (int)v4;

  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setBool:(v5 - 1) < 2 forKey:@"MTAutoDownloadDefaultKey"];

  id v7 = [a1 episodesToKeepToEpisodeLimit:[a1 episodesToKeepDefaultValue]];
  id v8 = +[NSUserDefaults standardUserDefaults];
  [v8 setInteger:v7 forKey:kMTPodcastEpisodeLimitDefaultKey];
}

+ (void)migrateSettingDefaultsForVersion9to10
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"MTCellularDownload"];

  if (v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:0 forKey:kMTWiFiDownloadOnly];
  }
}

+ (void)migrateSettingDefaultsForVersion10to11
{
  v2 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v9 = @"MTAutoDownloadDefaultKey";
  os_log_type_t v10 = &__kCFBooleanTrue;
  unsigned int v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v2 registerDefaults:v3];

  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"MTAutoDownloadDefaultKey"];

  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = v6;
  double v8 = 0.0;
  if (v5) {
    *(float *)&double v8 = 3.0;
  }
  [v6 setFloat:kMTPodcastAutoDownloadStateDefaultKey forKey:v8];
}

+ (void)migrateSettingDefaultsForVersion42to43
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  uint64_t v3 = kMTPodcastAutoDownloadStateDefaultKey;
  unsigned int v4 = [v2 integerForKey:kMTPodcastAutoDownloadStateDefaultKey];

  if (v4 == 1)
  {
    id v6 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
    LODWORD(v5) = 3.0;
    [v6 setFloat:v3 forKey:v5];
  }
}

+ (void)migrateSettingDefaultsForVersion44to45
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  uint64_t v3 = kMTPodcastAutoDownloadStateDefaultKey;
  unsigned int v4 = [v2 integerForKey:kMTPodcastAutoDownloadStateDefaultKey];

  if (v4 == 0x7FFFFFFF)
  {
    id v6 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
    LODWORD(v5) = 3.0;
    [v6 setFloat:v3 forKey:v5];
  }
}

+ (void)migrateSettingDefaultsForVersion48to49
{
  v2 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating setting defaults from version 48 to 49.", buf, 2u);
  }

  uint64_t v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned int v4 = +[NSUserDefaults showListShowsAllShowsKey];
  double v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    *(void *)buf = 0;
    v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v6 = +[MTDB sharedInstance];
    id v7 = [v6 mainOrPrivateContext];

    os_log_type_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_100153540;
    v13 = &unk_10054DF08;
    id v8 = v7;
    id v14 = v8;
    v15 = buf;
    [v8 performBlockAndWait:&v10];
    CFStringRef v9 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
    [v9 setShowListShowsAllShows:v17[24]];

    _Block_object_dispose(buf, 8);
  }
}

+ (void)migrateSettingDefaultsForVersion58to59
{
  id v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  if ([v3 BOOLForKey:kMTPodcastAutoDownloadStateDefaultKey]) {
    v2 = &off_100579FF8;
  }
  else {
    v2 = &off_10057A010;
  }
  [v3 setObject:v2 forKey:kMTPodcastEpisodeLimitDefaultKey];
}

+ (void)migrateSettingDefaultsForVersion60to61
{
  v2 = +[UITraitCollection currentTraitCollection];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 removeObjectForKey:@"didPresentNowPlayingScrollingTip"];
  }
}

+ (void)runMigrationOnEpisodesByPodcastForVersion:(int64_t)a3
{
  double v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001538B0;
  v8[3] = &unk_100553178;
  id v9 = v6;
  int64_t v10 = a3;
  id v11 = a1;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v8];
}

+ (void)episodeMigrationForVersion29to30:(id)a3
{
  id v8 = a3;
  if ([v8 isBackCatalogItem] && objc_msgSend(v8, "saved"))
  {
    [v8 playhead];
    int v4 = v3;
    if ([v8 isPartiallyPlayedBackCatalogItem]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    id v6 = +[MTLibrary sharedInstance];
    [v6 setPlayState:v5 manually:1 forUserActionOnEpisode:v8 saveChanges:0];

    LODWORD(v7) = v4;
    [v8 setPlayhead:v7];
  }
}

+ (void)migrateSerpentId
{
  v2 = +[MTDB sharedInstance];
  int v3 = [v2 mainOrPrivateContext];

  int v4 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchBatchSize:200];
  double v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100154238;
  int64_t v10 = &unk_10054D9B0;
  id v11 = v3;
  id v12 = v4;
  id v5 = v4;
  id v6 = v3;
  [v6 performBlockAndWaitWithSave:&v7];
  +[MTDB setSerpentIdMigrationComplete:](MTDB, "setSerpentIdMigrationComplete:", 1, v7, v8, v9, v10);
}

+ (void)episodeMigrationForVersion0to1:(id)a3
{
  id v5 = a3;
  unint64_t v3 = (unint64_t)[v5 flags];
  if (v3)
  {
    unint64_t v4 = v3;
    [v5 setVideo:(v3 >> 3) & 1];
    [v5 setAudio:(v4 >> 4) & 1];
    [v5 setExternalType:(v4 >> 5) & 1];
    [v5 setFlags:0];
  }
}

+ (void)episodeMigrationForVersion6to7:(id)a3
{
  id v17 = a3;
  if (![v17 playState])
  {
    int64_t v3 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:](MTLibraryLegacyUtil, "playStateFromHasBeenPlayed:andPlayCount:", [v17 hasBeenPlayed], [v17 playCount]);
    if (![v17 visible]) {
      int64_t v3 = 0;
    }
    if (v3) {
      id v4 = [v17 manuallyAdded];
    }
    else {
      id v4 = (id)([v17 visible] ^ 1);
    }
    [v17 setPlayState:v3 manually:v4 source:8];
  }
  if ([v17 persistentID])
  {
    id v5 = +[MPMediaLibrary defaultMediaLibrary];
    id v6 = [v5 itemWithPersistentID:[v17 persistentID]];

    double v7 = +[MTMLMediaItem itemWithMPMediaItem:v6];
    uint64_t v8 = v7;
    if (v7) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      [v17 setIsFromITunesSync:[v7 isFromITunesSync]];
      if ([v8 isMissingAsset]) {
        [v17 setAssetURL:0];
      }
      id v10 = [v17 persistentID];
      [v17 playhead];
      [MTMediaLibraryUtil updateMediaLibraryItem:v10 playhead:[v17 playState] playCount:[v17 playCount] playCount:v11];
    }
  }
  id v12 = [v17 podcast];
  if ([v12 deletePlayedEpisodesResolvedValue])
  {
    if ([v17 manuallyAdded])
    {
      if ([v17 visible])
      {
        if (([v17 userDeleted] & 1) == 0)
        {
          uint64_t v13 = [v17 assetURL];
          if (v13)
          {
            id v14 = (void *)v13;
            unsigned __int8 v15 = [v17 isFromITunesSync];

            BOOL v16 = v17;
            if (v15) {
              goto LABEL_25;
            }
            [v17 setSaved:1];
            id v12 = [v17 podcast];
            [v12 setShowPlacardForSavedEpisodes:1];
          }
        }
      }
    }
  }

  BOOL v16 = v17;
LABEL_25:
  [v16 setSuppressAutoDownload:1];
  [v17 pubDate];
  [v17 setImportDate:];
}

+ (void)episodeMigrationForVersion13to14:(id)a3
{
  id v3 = a3;
  id v7 = [v3 podcast];
  [v3 pubDate];
  double v5 = v4;
  [v7 lastTouchDate];
  [v3 setIsNew:v5 > v6];
}

+ (void)episodeMigrationForVersion16to17:(id)a3
{
  id v3 = a3;
  if (![v3 playState]
    && [v3 playStateManuallySet]
    && [v3 playStateSource] == (id)6)
  {
    [v3 setBackCatalog:1];
  }
}

+ (void)episodeMigrationForVersion17to18:(id)a3
{
  id v3 = a3;
  id v4 = [v3 itemDescription];
  [v3 setItemDescriptionHasHTML:[v4 hasHTML]];
}

+ (void)episodeMigrationForVersion21to22:(id)a3
{
  id v5 = a3;
  if ([v5 itemDescriptionHasHTML])
  {
    id v3 = [v5 itemDescription];
    id v4 = [v3 stringBySmartlyStrippingHTML];
    [v5 setItemDescriptionWithoutHTML:v4];
  }
}

+ (void)episodeMigrationForVersion23to24:(id)a3
{
  id v12 = a3;
  +[MTUniversalPlaybackPositionDataSource uppLastSyncTime];
  double v4 = v3;
  id v5 = [v12 managedObjectContext];
  double v6 = [v12 metadataIdentifier];
  id v7 = [v5 uppMetadataForMetadataIdentifier:v6];

  if (v7)
  {
    [v12 metadataTimestamp];
    double v9 = v8;
    [v7 timestamp];
    if (v9 != v10)
    {
      [v12 metadataTimestamp];
      if (v11 < v4) {
        [v12 updateUPPTimestamp];
      }
    }
  }
}

+ (BOOL)runMigrationForPodcast:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  id v7 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v6 uuid];
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Running migration on podcast with uuid %{public}@ for version %ld", (uint8_t *)&v13, 0x16u);
  }
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
      if (([v6 flags] & 0x40) != 0)
      {
        uint64_t v9 = 0x7FFFFFFFLL;
      }
      else
      {
        if (![v6 autoDownload]) {
          goto LABEL_9;
        }
        uint64_t v9 = 1;
      }
      [v6 setAutoDownloadType:v9];
      goto LABEL_9;
    case 3:
    case 4:
    case 5:
LABEL_9:
      [v6 setUpdateInterval:0];
      id v10 = [v6 darkCount];
      if ((uint64_t)v10 < kMTGoDarkCountLimit) {
        [v6 updateLastTouchDate];
      }
      goto LABEL_11;
    case 6:
LABEL_11:
      [a1 podcastMigrationForVersion6to7:v6];
      goto LABEL_12;
    case 7:
    case 8:
LABEL_12:
      if (([a1 podcastMigrationForVersion8to9:v6] & 1) == 0) {
        goto LABEL_14;
      }
      BOOL v11 = 1;
      goto LABEL_42;
    case 9:
LABEL_14:
      [a1 podcastMigrationForVersion9to10:v6];
      goto LABEL_15;
    case 10:
    case 11:
LABEL_15:
      [a1 podcastMigrationForVersion11to12:v6];
      goto LABEL_16;
    case 12:
    case 13:
    case 14:
LABEL_16:
      [a1 podcastMigrationForVersion14to15:v6];
      goto LABEL_17;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
LABEL_17:
      [a1 podcastMigrationForVersion19to20:v6];
      goto LABEL_18;
    case 20:
LABEL_18:
      [a1 podcastMigrationForVersion20to21:v6];
      goto LABEL_19;
    case 21:
    case 22:
    case 23:
    case 24:
LABEL_19:
      [a1 podcastMigrationForVersion24to25:v6];
      goto LABEL_20;
    case 25:
LABEL_20:
      [a1 podcastMigrationForVersion25to26:v6];
      goto LABEL_21;
    case 26:
LABEL_21:
      [a1 podcastMigrationForVersion26to27:v6];
      goto LABEL_22;
    case 27:
LABEL_22:
      [a1 podcastMigrationForVersion27to28:v6];
      goto LABEL_23;
    case 28:
LABEL_23:
      [a1 podcastMigrationForVersion28to29:v6];
      goto LABEL_24;
    case 29:
    case 30:
    case 31:
LABEL_24:
      [a1 podcastMigrationForVersion32to33:v6];
      goto LABEL_25;
    case 32:
    case 33:
    case 34:
LABEL_25:
      [a1 podcastMigrationForVersion34to35:v6];
      goto LABEL_26;
    case 35:
LABEL_26:
      [a1 podcastMigrationForVersion35to36:v6];
      goto LABEL_27;
    case 36:
LABEL_27:
      [a1 podcastMigrationForVersion36to37:v6];
      goto LABEL_28;
    case 37:
    case 38:
LABEL_28:
      [a1 podcastMigrationForVersion38to39:v6];
      goto LABEL_29;
    case 39:
    case 40:
    case 41:
LABEL_29:
      [a1 podcastMigrationForVersion41to42:v6];
      goto LABEL_30;
    case 42:
LABEL_30:
      [a1 podcastMigrationForVersion42to43:v6];
      goto LABEL_31;
    case 43:
    case 44:
LABEL_31:
      [a1 podcastMigrationForVersion44to45:v6];
      goto LABEL_32;
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
LABEL_32:
      [a1 podcastMigrationForVersion49to50:v6];
      goto LABEL_33;
    case 50:
LABEL_33:
      [a1 podcastMigrationForVersion50to51:v6];
      goto LABEL_34;
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
LABEL_34:
      [a1 podcastMigrationForVersion55to56:v6];
      goto LABEL_35;
    case 56:
LABEL_35:
      [a1 podcastMigrationForVersion56to57:v6];
      goto LABEL_36;
    case 57:
LABEL_36:
      [a1 podcastMigrationForVersion57to58:v6];
      goto LABEL_37;
    case 58:
LABEL_37:
      [a1 podcastMigrationForVersion58to59:v6];
      goto LABEL_38;
    case 59:
LABEL_38:
      [a1 podcastMigrationForVersion59to60:v6];
      goto LABEL_39;
    case 60:
    case 61:
    case 62:
LABEL_39:
      [a1 podcastMigrationForVersion62to63:v6];
      goto LABEL_40;
    case 63:
    case 64:
    case 65:
    case 66:
LABEL_40:
      [a1 podcastMigrationForVersion66to67:v6];
      break;
    default:
      break;
  }
  BOOL v11 = 0;
LABEL_42:

  return v11;
}

+ (void)podcastMigrationForVersion66to67:(id)a3
{
  id v3 = a3;
  double v4 = [v3 managedObjectContext];
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setFetchBatchSize:200];
  id v6 = [v3 uuid];
  id v7 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v6];
  [v5 setPredicate:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100154E58;
  v11[3] = &unk_10054E708;
  id v12 = v4;
  id v13 = v5;
  id v14 = v3;
  id v8 = v3;
  id v9 = v5;
  id v10 = v4;
  [v10 performBlockAndWaitWithSave:v11];
}

+ (void)podcastMigrationForVersion62to63:(id)a3
{
  id v3 = a3;
  [v3 managedObjectContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10015505C;
  v6[3] = &unk_10054D9B0;
  id v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  id v5 = v3;
  [v4 performBlockAndWait:v6];
}

+ (void)podcastMigrationForVersion59to60:(id)a3
{
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  [v3 calculateNewEpisodeCountIn:v4 serialShowsUseExperimentalRules:0];
}

+ (void)podcastMigrationForVersion58to59:(id)a3
{
  id v7 = a3;
  id v3 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  id v4 = (const mach_header_64 *)[v3 episodeLimitForKey:kMTPodcastEpisodeLimitDefaultKey];

  if ([v7 autoDownloadEnabled])
  {
    if ([v7 episodeLimit] != v4) {
      goto LABEL_8;
    }
    id v5 = v7;
    id v6 = &_mh_execute_header + 1;
  }
  else
  {
    id v5 = v7;
    if (v4 == &_mh_execute_header) {
      id v6 = (const mach_header_64 *)((char *)&_mh_execute_header.magic + 1);
    }
    else {
      id v6 = &_mh_execute_header;
    }
  }
  [v5 setEpisodeLimit:v6];
LABEL_8:
}

+ (void)podcastMigrationForVersion57to58:(id)a3
{
  id v3 = a3;
  id v13 = [v3 managedObjectContext];
  id v4 = [v3 uuid];
  id v5 = +[MTEpisode predicateForDownloadedEpisodesOnPodcastUuid:v4];
  id v6 = +[MTEpisode predicateForVisuallyPlayed:0];
  id v7 = [v5 AND:v6];

  uint64_t v8 = kMTEpisodeEntityName;
  [v3 setDownloadedUnplayedEpisodesCount:[v13 countOfObjectsInEntity:kMTEpisodeEntityName predicate:v7]];
  id v9 = [v3 uuid];
  id v10 = +[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:v9];
  BOOL v11 = +[MTEpisode predicateForVisuallyPlayed:0];
  id v12 = [v10 AND:v11];

  [v3 setSavedUnplayedEpisodesCount:[v13 countOfObjectsInEntity:v8 predicate:v12]];
}

+ (void)podcastMigrationForVersion56to57:(id)a3
{
  id v4 = a3;
  if ([v4 hidden]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = (uint64_t)[v4 isImplicitlyFollowed];
  }
  [v4 setIsHiddenOrImplicitlyFollowed:v3];
}

+ (void)podcastMigrationForVersion55to56:(id)a3
{
  id v3 = a3;
  if ([v3 isSerialShowTypeInFeed] && objc_msgSend(v3, "showTypeUserSetting") == (id)1) {
    [v3 setShowTypeSetting:2];
  }
}

+ (void)podcastMigrationForVersion50to51:(id)a3
{
  id v5 = a3;
  id v3 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  id v4 = [v3 BOOLForKey:kMTPodcastAutoDownloadStateDefaultKey];

  [v5 setAutoDownloadEnabled:v4];
}

+ (void)podcastMigrationForVersion49to50:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating podcasts from version 49 to 50.", v20, 2u);
  }

  id v5 = [v3 managedObjectContext];
  uint64_t v6 = kMTEpisodeEntityName;
  id v7 = [v3 uuid];
  uint64_t v8 = +[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:v7];
  id v9 = [v5 countOfObjectsInEntity:v6 predicate:v8];

  [v3 setSavedEpisodesCount:v9];
  id v10 = [v3 uuid];
  BOOL v11 = +[MTEpisode predicateForDownloadedEpisodesOnPodcastUuid:v10];
  id v12 = [v5 countOfObjectsInEntity:v6 predicate:v11];

  [v3 setDownloadedEpisodesCount:v12];
  id v13 = [v3 uuid];
  id v14 = +[MTEpisode predicateForLibraryEpisodesOnPodcastUuid:v13];
  id v15 = [v5 countOfObjectsInEntity:v6 predicate:v14];

  [v3 setLibraryEpisodesCount:v15];
  int64_t v16 = [v3 uuid];
  id v17 = +[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:v16];
  uint64_t v18 = +[MTEpisode predicateForVisuallyPlayed:0];
  char v19 = [v17 AND:v18];

  [v3 setSavedUnplayedEpisodesCount:[v5 countOfObjectsInEntity:v6 predicate:v19]];
}

+ (void)podcastMigrationForVersion44to45:(id)a3
{
  id v5 = a3;
  id v3 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
  id v4 = [v3 integerForKey:kMTPodcastAutoDownloadStateDefaultKey];

  if ([v5 autoDownloadType] == 0x7FFFFFFF) {
    [v5 setAutoDownloadType:v4];
  }
}

+ (void)podcastMigrationForVersion42to43:(id)a3
{
  id v3 = a3;
  if ([v3 autoDownloadType] == 1) {
    [v3 setAutoDownloadType:3];
  }
}

+ (void)podcastMigrationForVersion41to42:(id)a3
{
  id v5 = a3;
  id v3 = [v5 displayType];

  if (!v3)
  {
    id v4 = NSPersistentStringForMTDisplayType();
    [v5 setDisplayType:v4];
  }
}

+ (void)podcastMigrationForVersion38to39:(id)a3
{
  id v8 = a3;
  id v3 = [v8 showTypeSetting];
  if (v3 == (id)3)
  {
    uint64_t v5 = (uint64_t)+[MTPodcast defaultShowType];
  }
  else
  {
    if (v3 == (id)2)
    {
      BOOL v6 = [v8 isSerialShowTypeInFeed] == 0;
      id v7 = v8;
      if (v6) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = 2;
      }
      goto LABEL_15;
    }
    id v4 = v8;
    if (v3) {
      goto LABEL_16;
    }
    if ([v8 sortAscending]
      && ([v8 isSerialShowTypeInFeed] & 1) != 0)
    {
      uint64_t v5 = 2;
    }
    else if ([v8 sortAscending])
    {
      uint64_t v5 = 4;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  id v7 = v8;
LABEL_15:
  id v3 = [v7 setShowTypeSetting:v5];
  id v4 = v8;
LABEL_16:

  _objc_release_x1(v3, v4);
}

+ (void)podcastMigrationForVersion36to37:(id)a3
{
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = kMTEpisodeEntityName;
  BOOL v6 = [v3 uuid];
  id v7 = +[MTEpisode predicateForListenNowForPodcastUuid:v6];
  id v8 = +[MTEpisode sortDescriptorsForListenNow];
  id v9 = [v4 objectsInEntity:v5 predicate:v7 sortDescriptors:v8 returnsObjectsAsFaults:0 limit:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int64_t v16 = [v15 uuid];
        id v17 = [v3 nextEpisodeUuid];
        unsigned __int8 v18 = [v16 isEqualToString:v17];

        if ((v18 & 1) == 0) {
          [v15 setListenNowEpisode:0];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

+ (void)podcastMigrationForVersion34to35:(id)a3
{
  id v16 = a3;
  id v3 = [v16 managedObjectContext];
  id v4 = [v16 uuid];
  uint64_t v5 = +[MTRecencyUtil upNextForPodcastUuid:v4 excludeExplicit:0 ctx:v3];

  [v5 modifiedDate];
  [v16 setModifiedDate:];
  BOOL v6 = [v16 nextEpisodeUuid];
  id v7 = [v5 episodeUuid];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = [v16 nextEpisodeUuid];

    if (v9)
    {
      id v10 = [v16 nextEpisodeUuid];
      id v11 = [v3 episodeForUuid:v10];

      [v11 setListenNowEpisode:0];
    }
    id v12 = [v5 episodeUuid];

    if (v12)
    {
      uint64_t v13 = [v5 episodeUuid];
      id v14 = [v3 episodeForUuid:v13];

      [v14 setListenNowEpisode:1];
    }
    id v15 = [v5 episodeUuid];
    [v16 setNextEpisodeUuid:v15];
  }
}

+ (void)podcastMigrationForVersion32to33:(id)a3
{
}

+ (void)podcastMigrationForVersion28to29:(id)a3
{
  id v9 = a3;
  [v9 addedDate];
  double v4 = v3;
  uint64_t v5 = [v9 newestEpisode];
  [v5 pubDate];
  if (v6 <= 0.0)
  {
    [v5 importDate];
    if (v8 <= 0.0) {
      goto LABEL_6;
    }
    [v5 importDate];
  }
  else
  {
    [v5 pubDate];
  }
  double v4 = v7;
LABEL_6:
  [v9 setFeedChangedDate:v4];
}

+ (void)podcastMigrationForVersion27to28:(id)a3
{
  id v3 = a3;
  if ([v3 episodeLimit] == (id)0xFFFFFFFFLL) {
    [v3 setEpisodeLimit:[MTPodcast episodeLimitDefaultValue]];
  }
}

+ (void)podcastMigrationForVersion20to21:(id)a3
{
}

+ (void)podcastMigrationForVersion19to20:(id)a3
{
  id v3 = a3;
  double v4 = [v3 managedObjectContext];
  uint64_t v5 = kMTEpisodeEntityName;
  double v6 = [v3 uuid];
  double v7 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v6];
  uint64_t v8 = kEpisodeLastDatePlayed;
  id v9 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLastDatePlayed ascending:0];
  id v17 = v9;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  uint64_t v16 = v8;
  id v11 = +[NSArray arrayWithObjects:&v16 count:1];
  LOBYTE(v15) = 0;
  id v12 = [v4 objectDictionariesInEntity:v5 predicate:v7 sortDescriptors:v10 propertiesToFetch:v11 includeObjectId:0 limit:1 distinct:v15 groupBy:0];

  uint64_t v13 = [v12 firstObject];
  id v14 = [v13 objectForKeyedSubscript:v8];

  if (v14)
  {
    [v14 timeIntervalSinceReferenceDate];
    [v3 setLastDatePlayed:];
  }
}

+ (void)podcastMigrationForVersion14to15:(id)a3
{
  id v9 = a3;
  [v9 setNeedsArtworkUpdate:1];
  id v3 = [v9 imageURL];

  if (v3)
  {
    id v4 = objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions);
    uint64_t v5 = [v9 imageURL];
    id v6 = [v4 init:v5 nonAppInitiated:[v9 requestsAreNonAppInitiated]];

    double v7 = +[MTImageDownloader sharedInstance];
    uint64_t v8 = [v9 uuid];
    [v7 downloadImageForPodcastUuid:v8 urlOptions:v6 userInitiated:0 useBackgroundFetch:0 callback:0];
  }
}

+ (void)podcastMigrationForVersion11to12:(id)a3
{
  id v3 = a3;
  if ([v3 autoDownloadType] == -1) {
    [v3 setAutoDownloadType:0x7FFFFFFFLL];
  }
}

+ (void)podcastMigrationForVersion9to10:(id)a3
{
  id v3 = a3;
  [v3 setDarkCountLocal:[v3 darkCount]];
}

+ (void)podcastMigrationForVersion6to7:(id)a3
{
  id v9 = a3;
  id v4 = [v9 uuid];

  if (!v4)
  {
    uint64_t v5 = +[NSString UUID];
    [v9 setUuid:v5];
  }
  id v6 = [v9 keepEpisodes];
  unsigned int v7 = v6;
  if (v6 == -1) {
    unsigned int v7 = [a1 episodesToKeepDefaultValue];
  }
  if (v7 == 1) {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v8 = 0;
  }
  [v9 setDeletePlayedEpisodes:v8];
  if (v7 != 1) {
    [v9 setShowPlacardForRemovePlayedEpisodes:1];
  }
  [v9 setEpisodeLimit:[a1 episodesToKeepToEpisodeLimit:v6]];
  if ([v9 autoDownloadType] == 2) {
    [v9 setAutoDownloadType:1];
  }
}

+ (BOOL)podcastMigrationForVersion8to9:(id)a3
{
  id v3 = a3;
  id v4 = [v3 feedURL];
  if (![v4 length])
  {
    uint64_t v5 = [v3 episodes];
    id v6 = [v5 count];

    if (v6 != (id)1) {
      goto LABEL_6;
    }
    unsigned int v7 = [v3 episodes];
    uint64_t v8 = [v7 anyObject];

    id v9 = [v8 assetURL];
    if ([v9 length])
    {
    }
    else
    {
      id v12 = [v8 enclosureURL];
      id v13 = [v12 length];

      if (!v13)
      {
        id v14 = _MTLogCategoryDatabase();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v3 uuid];
          int v18 = 138543362;
          long long v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Will delete podcast %{public}@ during migration", (uint8_t *)&v18, 0xCu);
        }
        uint64_t v16 = +[MTLibrary sharedInstance];
        id v17 = [v3 uuid];
        [v16 deletePodcastWithUuid:v17];

        BOOL v10 = 1;
        goto LABEL_10;
      }
    }
    BOOL v10 = 0;
LABEL_10:

    goto LABEL_7;
  }

LABEL_6:
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

+ (void)runMigrationOnAllEpisodesForVersion:(int64_t)a3
{
  uint64_t v5 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Running migration on all episodes for version %ld", buf, 0xCu);
  }

  id v6 = +[MTDB sharedInstance];
  unsigned int v7 = [v6 mainOrPrivateContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100156490;
  v9[3] = &unk_100553178;
  int64_t v11 = a3;
  id v12 = a1;
  id v10 = v7;
  id v8 = v7;
  [v8 performBlockAndWaitWithSave:v9];
}

+ (void)allEpisodesMigrationForVersion68to69In:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Deleting itemDescriptionWithHTML for upgrade from version 68 to 69.", buf, 2u);
  }

  id v5 = objc_alloc((Class)NSBatchUpdateRequest);
  id v6 = +[MTEpisode entity];
  id v7 = [v5 initWithEntity:v6];

  id v8 = +[NSPredicate predicateWithFormat:@"%@ != nil", @"itemDescriptionWithHTML"];
  [v7 setPredicate:v8];

  CFStringRef v25 = @"itemDescriptionWithHTML";
  id v9 = +[NSNull null];
  __int16 v26 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  [v7 setPropertiesToUpdate:v10];

  id v20 = 0;
  id v11 = [v3 executeRequest:v7 error:&v20];
  id v12 = v20;
  id v13 = _MTLogCategoryDatabase();
  int64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v15 = +[MTDB libraryDataVersion];
      *(_DWORD *)buf = 134218242;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v12;
      uint64_t v16 = "[Migration] (Data) (Initial Version: %li) itemDescriptionWithHTML migration failed with error %@";
      id v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_FAULT;
      uint32_t v19 = 22;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v16 = "[Migration] (Data) Finished deleting itemDescriptionWithHTML for upgrade from version 68 to 69.";
    id v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    uint32_t v19 = 2;
    goto LABEL_8;
  }
}

+ (void)allEpisodesMigrationForVersion65to66In:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 65 to 66 (migrate all Up Next episodes to have calculated modifiedDateScore values", buf, 2u);
  }

  id v5 = +[MTEpisode predicateForListenNow];
  [v3 objectsInEntity:kMTEpisodeEntityName predicate:v5 sortDescriptors:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001569E0;
  v7[3] = &unk_10054D570;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v8;
  [v3 performBlockAndWaitWithSave:v7];
}

+ (void)allEpisodesMigrationForVersion59to60In:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all trailers from version 54 to 55 (migrate all episode 0's to nulls", buf, 2u);
  }

  uint64_t v5 = kEpisodeEpisodeNumber;
  id v6 = +[NSPredicate predicateWithFormat:@"(%K = 0)", kEpisodeEpisodeNumber];
  id v7 = +[MTEpisode predicateForEpisodeType:1];
  id v8 = [v6 AND:v7];

  id v9 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:kMTEpisodeEntityName];
  [v9 setPredicate:v8];
  uint64_t v20 = v5;
  id v10 = +[NSNull null];
  long long v21 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v9 setPropertiesToUpdate:v11];

  [v9 setResultType:2];
  id v17 = 0;
  id v12 = [v3 executeRequest:v9 error:&v17];

  id v13 = v17;
  int64_t v14 = _MTLogCategoryDatabase();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v12 result];
    *(_DWORD *)buf = 138412290;
    id v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null", buf, 0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion54to55In:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all trailers from version 54 to 55 (migrate all episode 0's to nulls", buf, 2u);
  }

  uint64_t v5 = kEpisodeEpisodeNumber;
  id v6 = +[NSPredicate predicateWithFormat:@"(%K = NULL)", kEpisodeEpisodeNumber];
  id v7 = +[MTEpisode predicateForEpisodeType:1];
  id v8 = [v6 AND:v7];

  id v9 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:kMTEpisodeEntityName];
  [v9 setPredicate:v8];
  uint64_t v19 = v5;
  uint64_t v20 = &off_10057A028;
  id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v9 setPropertiesToUpdate:v10];

  [v9 setResultType:2];
  id v16 = 0;
  id v11 = [v3 executeRequest:v9 error:&v16];

  id v12 = v16;
  id v13 = _MTLogCategoryDatabase();
  int64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 result];
    *(_DWORD *)buf = 138412290;
    id v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null", buf, 0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion53to54In:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 53 to 54 (migrate all episode 0's to nulls", buf, 2u);
  }

  uint64_t v5 = kEpisodeEpisodeNumber;
  id v6 = +[NSPredicate predicateWithFormat:@"(%K = 0)", kEpisodeEpisodeNumber];
  id v7 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:kMTEpisodeEntityName];
  [v7 setPredicate:v6];
  uint64_t v18 = v5;
  id v8 = +[NSNull null];
  uint64_t v19 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v7 setPropertiesToUpdate:v9];

  [v7 setResultType:2];
  id v15 = 0;
  id v10 = [v3 executeRequest:v7 error:&v15];

  id v11 = v15;
  id v12 = _MTLogCategoryDatabase();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v14 = [v10 result];
    *(_DWORD *)buf = 138412290;
    id v17 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null", buf, 0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion51to52In:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 51 to 52 (migrate all season 0's to nulls", buf, 2u);
  }

  uint64_t v5 = kEpisodeSeasonNumber;
  id v6 = +[NSPredicate predicateWithFormat:@"(%K = 0)", kEpisodeSeasonNumber];
  id v7 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:kMTEpisodeEntityName];
  [v7 setPredicate:v6];
  uint64_t v18 = v5;
  id v8 = +[NSNull null];
  uint64_t v19 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v7 setPropertiesToUpdate:v9];

  [v7 setResultType:2];
  id v15 = 0;
  id v10 = [v3 executeRequest:v7 error:&v15];

  id v11 = v15;
  id v12 = _MTLogCategoryDatabase();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate all season 0's to nulls failed with error: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v14 = [v10 result];
    *(_DWORD *)buf = 138412290;
    id v17 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ episodes successfully migrated from season 0 to null", buf, 0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion47to48In:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Migrating all episodes from version 47 to 48.", buf, 2u);
  }

  uint64_t v5 = +[MTEpisode predicateForDownloaded:0 excludeHidden:0];
  id v6 = +[MTEpisode predicateForDownloadBehavior:3];
  id v7 = +[NSCompoundPredicate notPredicateWithSubpredicate:v6];
  id v8 = [v5 AND:v7];

  id v9 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:kMTEpisodeEntityName];
  [v9 setPredicate:v8];
  uint64_t v19 = kEpisodeDownloadBehavior;
  uint64_t v20 = &off_10057A040;
  id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v9 setPropertiesToUpdate:v10];

  [v9 setResultType:2];
  id v16 = 0;
  id v11 = [v3 executeRequest:v9 error:&v16];

  id v12 = v16;
  id v13 = _MTLogCategoryDatabase();
  int64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate undownloaded episodes to MTEpisodeDownloadBehaviorAutomaticSuppressed %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 result];
    *(_DWORD *)buf = 138412290;
    id v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ My Episodes successfully migrated undownloaded episodes to MTEpisodeDownloadBehaviorAutomaticSuppressed", buf, 0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion46to47In:(id)a3
{
  id v3 = a3;
  id v4 = +[MTEpisode predicateForEpisodesWhichNeedEntitlementStateUpdate];
  uint64_t v5 = [v3 objectsInEntity:kMTEpisodeEntityName predicate:v4 sortDescriptors:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateEntitlementState];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (void)allEpisodesMigrationForVersion45to46In:(id)a3
{
  id v3 = a3;
  id v4 = +[MTEpisode predicateForSaved:1];
  uint64_t v5 = +[MTEpisode predicateForDownloaded:1 excludeHidden:0];
  id v6 = [v4 AND:v5];

  [v3 objectsInEntity:kMTEpisodeEntityName predicate:v6 sortDescriptors:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015792C;
  v8[3] = &unk_10054D570;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [v3 performBlockAndWaitWithSave:v8];
}

+ (void)allEpisodesMigrationForVersion43to44In:(id)a3
{
  id v4 = a3;
  [a1 rollbackMigrationV40IfNeededInContext:v4];
  uint64_t v5 = kMTEpisodeEntityName;
  id v6 = +[MTEpisode predicateForSaved:1];
  id v7 = +[MTEpisode sortDescriptorsForPubDateAscending:0];
  uint64_t v8 = [v4 objectsInEntity:v5 predicate:v6 sortDescriptors:v7];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v12 > 0x12B)
        {
          [*(id *)(*((void *)&v27 + 1) + 8 * i) setIsBookmarksMigrationRecoveredEpisode:1];
        }
        else
        {
          [*(id *)(*((void *)&v27 + 1) + 8 * i) setIsBookmarked:1];
          [v15 pubDate];
          [v15 setLastBookmarkedDate:];
          ++v12;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v11);
  }
  else
  {
    unint64_t v12 = 0;
  }

  id v16 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Bookmarks migration run for %lu previously saved episodes.", buf, 0xCu);
  }

  if ((unint64_t)[v9 count] >= 0x12D)
  {
    id v17 = +[NSUserDefaults standardUserDefaults];
    [v17 setBool:1 forKey:kHasSavedEpisodesOffLimitsMigratedOnDataVersion44];
  }
  id v18 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:v5];
  uint64_t v19 = +[NSPredicate predicateWithFormat:@"%K = %@", kEpisodeUserEpisode, &__kCFBooleanTrue];
  [v18 setPredicate:v19];

  uint64_t v31 = kEpisodeIsBookmarksMigrationRecoveredEpisode;
  v32 = &__kCFBooleanTrue;
  uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  [v18 setPropertiesToUpdate:v20];

  [v18 setResultType:2];
  id v26 = 0;
  long long v21 = [v4 executeRequest:v18 error:&v26];
  id v22 = v26;
  __int16 v23 = _MTLogCategoryDatabase();
  id v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v34 = (unint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to migrate My Episodes to recoveredEpisodes failed %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v25 = [v21 result];
    *(_DWORD *)buf = 138412290;
    unint64_t v34 = (unint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) %@ My Episodes successfully migrated to Recovered Episodes.", buf, 0xCu);
  }
}

+ (void)rollbackMigrationV40IfNeededInContext:(id)a3
{
  id v3 = a3;
  id v4 = +[BookmarksMigrationRegistry migrationRegisteredAtVersion:40];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v31 = v3;
    id v6 = [v4 uuids];
    id v7 = +[NSSet setWithArray:v6];
    uint64_t v8 = +[MTEpisode predicateForEpisodeUuids:v7];

    id v9 = +[MTEpisode predicateForAllBookmarkedEpisodes];
    id v10 = +[MTEpisode predicateForSaved:0];
    id v11 = [v5 date];
    uint64_t v12 = [v11 dateByAddingTimeInterval:120.0];

    uint64_t v13 = [v5 date];
    int64_t v14 = [v13 dateByAddingTimeInterval:-120.0];

    uint64_t v15 = kEpisodeLastBookmarkedDate;
    long long v28 = (void *)v12;
    id v16 = +[NSPredicate predicateForDateKey:kEpisodeLastBookmarkedDate isLessThanOrEqualToDate:v12];
    id v17 = +[NSPredicate predicateForDateKey:v15 isGreaterThanOrEqualToDate:v14];
    id v18 = [v17 AND:v16];
    uint64_t v19 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:kMTEpisodeEntityName];
    long long v29 = v10;
    uint64_t v20 = [v10 AND:v18];
    long long v30 = v9;
    long long v21 = [v9 AND:v20];
    id v22 = [v8 AND:v21];
    [v19 setPredicate:v22];

    id v3 = v31;
    uint64_t v35 = kEpisodeIsBookmarked;
    v36 = &__kCFBooleanFalse;
    __int16 v23 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v19 setPropertiesToUpdate:v23];

    id v32 = 0;
    id v24 = [v31 executeRequest:v19 error:&v32];
    id v25 = v32;
    id v26 = _MTLogCategoryDatabase();
    long long v27 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v25;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[Migration] (Data) Batch request to roll back version 40 migration failed %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Version 40 migration correctly rolled back.", buf, 2u);
      }

      +[BookmarksMigrationRegistry deleteMigrationRegistryAtVersion:40];
    }
  }
  else
  {
    uint64_t v8 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) No v40 migration detected, nothing to roll back", buf, 2u);
    }
  }
}

+ (void)allEpisodesMigrationForVersion40to41In:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  uint64_t v5 = +[MTEpisode predicateForSuppressAutoDownload:1];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchBatchSize:200];
  [v3 executeFetchRequest:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v11);
        [v12 setDownloadBehavior:1 v14];
        if (!(((unint64_t)v11 + v9 + 1) % (unint64_t)[v4 fetchBatchSize])) {
          [v3 saveInCurrentBlock];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v9 += (uint64_t)v8;
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v3 saveInCurrentBlock];
}

+ (void)deleteDuplicateVideoEpisodesForRdar59691904
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100057198;
  uint64_t v10 = sub_100057388;
  id v11 = 0;
  v2 = +[MTDB sharedInstance];
  id v3 = [v2 mainOrPrivateContext];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001584A4;
  v5[3] = &unk_10054D8A0;
  void v5[4] = &v6;
  [v3 performBlockAndWait:v5];
  id v4 = +[MTLibrary sharedInstance];
  [v4 deleteEpisodeUuids:v7[5] forced:1];

  _Block_object_dispose(&v6, 8);
}

+ (void)moveEpisodeAssetsToSharedContainer
{
  v2 = +[MTDB sharedInstance];
  id v3 = [v2 mainOrPrivateContext];

  id v4 = +[NSFileManager defaultManager];
  uint64_t v5 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  uint64_t v6 = +[MTEpisode predicateForDownloaded:1 excludeHidden:0];
  [v5 setPredicate:v6];

  v15[0] = kEpisodeUuid;
  v15[1] = kEpisodeAssetURL;
  id v7 = +[NSArray arrayWithObjects:v15 count:2];
  [v5 setPropertiesToFetch:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100158898;
  v11[3] = &unk_10054E708;
  id v12 = v3;
  id v13 = v5;
  id v14 = v4;
  id v8 = v4;
  id v9 = v5;
  id v10 = v3;
  [v10 performBlockAndWaitWithSave:v11];
}

+ (void)removeAllEpisodesFromMediaLibrary
{
  +[MPMediaQuery setFilteringDisabled:1];
  +[MPMediaLibrary defaultMediaLibrary];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100158F18;
  v12[3] = &unk_1005531A0;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = v13;
  [v2 performTransactionWithBlock:v12];
  +[MPMediaQuery setFilteringDisabled:0];
  id v3 = +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:kMTEpisodeEntityName];
  uint64_t v14 = kEpisodePersistentID;
  long long v15 = &off_10057A028;
  id v4 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v3 setPropertiesToUpdate:v4];

  uint64_t v5 = +[MTDB sharedInstance];
  uint64_t v6 = [v5 mainOrPrivateContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100158F60;
  v9[3] = &unk_10054D9B0;
  id v10 = v6;
  id v11 = v3;
  id v7 = v3;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

+ (void)prunePersistentHistory
{
  id v2 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = 14;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Will prune persistent history older than %d days old", buf, 8u);
  }

  id v3 = +[NSDate dateWithTimeIntervalSinceNow:-1209600.0];
  id v4 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:v3];

  uint64_t v5 = +[MTDB sharedInstance];
  uint64_t v6 = [v5 mainOrPrivateContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001591F0;
  v9[3] = &unk_10054EA58;
  id v10 = v6;
  id v11 = v4;
  int v12 = 14;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

+ (int)episodesToKeepDefaultValue
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  int v3 = [v2 integerForKey:@"MTPodcastKeepEpisodesDefault"];

  return v3;
}

+ (int64_t)episodesToKeepToEpisodeLimit:(int)a3
{
  if ((a3 + 1) > 7) {
    return 0;
  }
  else {
    return qword_10046B338[a3 + 1];
  }
}

+ (void)recalculateAllPlaylists
{
  id v2 = +[MTDB sharedInstance];
  int v3 = [v2 mainOrPrivateContext];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100159438;
  v5[3] = &unk_10054D570;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWaitWithSave:v5];
}

+ (void)touchAllMigrationVersions
{
  [a1 touchLibraryMigrationVersion];

  [a1 touchCoreDataMigrationVersion];
}

+ (void)touchLibraryMigrationVersion
{
}

+ (void)touchCoreDataMigrationVersion
{
}

+ (BOOL)needToMigrateDataToSharedContainer
{
  id v2 = [(id)objc_opt_class() legacyLibraryPath];
  int v3 = [v2 path];

  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  id v6 = +[MTDB libraryPath];
  id v7 = [v6 path];

  id v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 fileExistsAtPath:v7];

  id v10 = +[IMLogger sharedLogger];
  id v11 = v10;
  CFStringRef v12 = @"not required";
  int v13 = v5 & (v9 ^ 1);
  if (v13) {
    CFStringRef v12 = @"required";
  }
  [v10 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2561, @"Migrate data to shared container is %@", v12 lineNumber format];

  return v13;
}

+ (BOOL)runCoreDataMigration
{
  os_unfair_lock_lock(&stru_10060A96C);
  int v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Acquired lock.", (uint8_t *)&v11, 2u);
  }

  if (+[MTDB isCorrupt])
  {
    os_unfair_lock_unlock(&stru_10060A96C);
    id v4 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[Migration] (CoreData) DB is corrupt, returning immediately.", (uint8_t *)&v11, 2u);
    }

    LOBYTE(v5) = 0;
  }
  else if (+[MTLibraryMigrationUtil needsCoreDataMigration])
  {
    id v6 = +[MTDB fetchManagedObjectModelFromDisk];
    unsigned int v5 = +[MTLibraryMigrationUtil createPersistentStoreForModel:v6 attemptMigration:1];

    if (v5)
    {
      id v7 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = +[MTDB coreDataVersion];
        int v11 = 134218240;
        id v12 = v8;
        __int16 v13 = 2048;
        uint64_t v14 = 142;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Successfully migrated. Set migration version from %ld to %ld", (uint8_t *)&v11, 0x16u);
      }

      [a1 touchCoreDataMigrationVersion];
    }
    os_unfair_lock_unlock(&stru_10060A96C);
  }
  else
  {
    os_unfair_lock_unlock(&stru_10060A96C);
    unsigned int v9 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) DB does not need migration, returning immediately.", (uint8_t *)&v11, 2u);
    }

    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (id)legacyLibraryPath
{
  id v2 = +[NSFileManager defaultManager];
  int v3 = [v2 URLsForDirectory:9 inDomains:1];

  id v4 = [v3 lastObject];
  id v5 = objc_alloc((Class)NSString);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 initWithFormat:@"%@.sqlite", v7];

  unsigned int v9 = [v4 URLByAppendingPathComponent:v8];

  return v9;
}

+ (BOOL)moveSQLiteFilesFromDocumentsToSharedContainer
{
  id v2 = [(id)objc_opt_class() legacyLibraryPath];
  int v3 = +[MTDB libraryPath];
  id v4 = +[NSFileManager defaultManager];
  id v35 = 0;
  unsigned int v5 = [v4 moveItemAtURL:v2 toURL:v3 error:&v35];
  id v6 = v35;

  if (v6)
  {
    id v7 = +[IMLogger sharedLogger];
    [v7 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2729, @"Error moving database to %@ from %@", v3, v2 lineNumber format];

    [v6 logAndThrow:0 printStackTrace:0];
  }
  id v8 = [v2 absoluteString];
  unsigned int v9 = [v8 stringByAppendingString:@"-shm"];
  id v10 = +[NSURL URLWithString:v9];

  if (v5)
  {
    int v11 = +[NSFileManager defaultManager];
    id v12 = [v10 path];
    unsigned int v13 = [v11 fileExistsAtPath:v12];

    if (v13)
    {
      uint64_t v14 = [v3 absoluteString];
      long long v15 = [v14 stringByAppendingString:@"-shm"];
      long long v16 = +[NSURL URLWithString:v15];

      long long v17 = +[NSFileManager defaultManager];
      id v34 = 0;
      [v17 moveItemAtURL:v10 toURL:v16 error:&v34];
      id v18 = v34;

      if (v18)
      {
        uint64_t v19 = +[IMLogger sharedLogger];
        [v19 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2742, @"Error moving database shm to %@ from %@", v16, v10 lineNumber format];

        [v18 logAndThrow:0 printStackTrace:0];
      }
    }
  }
  uint64_t v20 = [v2 absoluteString];
  long long v21 = [v20 stringByAppendingString:@"-wal"];
  id v22 = +[NSURL URLWithString:v21];

  if (v5)
  {
    __int16 v23 = +[NSFileManager defaultManager];
    id v24 = [v22 path];
    unsigned int v25 = [v23 fileExistsAtPath:v24];

    if (v25)
    {
      id v26 = [v3 absoluteString];
      long long v27 = [v26 stringByAppendingString:@"-wal"];
      long long v28 = +[NSURL URLWithString:v27];

      long long v29 = +[NSFileManager defaultManager];
      id v33 = 0;
      [v29 moveItemAtURL:v22 toURL:v28 error:&v33];
      id v30 = v33;

      if (v30)
      {
        uint64_t v31 = +[IMLogger sharedLogger];
        [v31 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2756, @"Error moving database wal to %@ from %@", v30, v22 lineNumber format];

        [v30 logAndThrow:0 printStackTrace:0];
      }
    }
  }

  return v5;
}

+ (BOOL)runImageStoreMigration
{
  int v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Migration] (ImageStore) Start image store migration.", buf, 2u);
  }

  unsigned __int8 v4 = [a1 runImageStorePathMigration];
  unsigned __int8 v5 = [a1 runImageFormatMigration];
  id v6 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Migration] (ImageStore) Image store migration has been completed.", v8, 2u);
  }

  return v4 | v5;
}

+ (BOOL)runImageStorePathMigration
{
  if (+[MTLibraryMigrationUtil needsImageStoreMigration])
  {
    id v2 = +[MTImageStoreConstants deprecatedImageStoreURL];
    uint64_t v3 = [v2 path];

    unsigned __int8 v4 = +[MTImageStoreConstants defaultImageStoreURL];
    uint64_t v5 = [v4 path];

    id v6 = &NSFileSize_ptr;
    id v7 = +[NSFileManager defaultManager];
    v44 = (void *)v3;
    uint64_t v8 = v3;
    unsigned int v9 = (void *)v5;
    unsigned int v10 = [v7 fileExistsAtPath:v8];

    if (v10)
    {
      int v11 = +[NSFileManager defaultManager];
      unsigned __int8 v12 = [v11 fileExistsAtPath:v5];

      if ((v12 & 1) == 0)
      {
        unsigned int v13 = +[NSFileManager defaultManager];
        id v52 = 0;
        unsigned __int8 v14 = [v13 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v52];
        id v15 = v52;

        if ((v14 & 1) == 0)
        {
          long long v16 = +[IMLogger sharedLogger];
          long long v17 = [v15 localizedDescription];
          [v16 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2792, @"Failed to create new image store at %@: %@", v9, v17 lineNumber format];
        }
      }
      id v18 = +[NSFileManager defaultManager];
      id v51 = 0;
      uint64_t v19 = [v18 contentsOfDirectoryAtPath:v44 error:&v51];
      id v20 = v51;

      if (v20)
      {
        long long v21 = +[IMLogger sharedLogger];
        id v22 = [v20 localizedDescription];
        [v21 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2801, @"Error enumerating image cache directory for migration: %@", v22 lineNumber format];
      }
      v41 = v20;
      char v42 = v10;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v19;
      id v23 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            long long v28 = [v44 stringByAppendingPathComponent:v27];
            long long v29 = [v9 stringByAppendingPathComponent:v27];
            id v30 = [(NSFileAttributeKey *)(id)v6[261] defaultManager];
            id v46 = 0;
            [v30 moveItemAtPath:v28 toPath:v29 error:&v46];
            id v31 = v46;

            if (v31)
            {
              id v32 = +[IMLogger sharedLogger];
              [v31 localizedDescription];
              id v33 = v9;
              v35 = id v34 = v6;
              [v32 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2813, @"Error moving image to new cache location: %@", v35 lineNumber format];

              id v6 = v34;
              unsigned int v9 = v33;
            }
          }
          id v24 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v24);
      }

      v36 = [(NSFileAttributeKey *)(id)v6[261] defaultManager];
      id v45 = 0;
      [v36 removeItemAtPath:v44 error:&v45];
      id v37 = v45;

      if (v37)
      {
        v38 = +[IMLogger sharedLogger];
        v39 = [v37 localizedDescription];
        [v38 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2822, @"Error deleting old image cache: %@", v39 lineNumber format];
      }
      LOBYTE(v10) = v42;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

+ (BOOL)runImageFormatMigration
{
  id v2 = +[MTImageStoreConstants fileType];
  uint64_t v3 = +[MTImageStoreConstants defaultImageStoreURL];
  unsigned __int8 v4 = +[IMImageStore defaultStore];
  uint64_t v5 = [v4 diskCache];

  id v6 = +[NSFileManager defaultManager];
  NSURLResourceKey v20 = NSURLContentTypeKey;
  id v7 = +[NSArray arrayWithObjects:&v20 count:1];
  id v19 = 0;
  uint64_t v8 = [v6 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v7 options:0 error:&v19];
  id v9 = v19;

  if (v9)
  {
    unsigned int v10 = +[IMLogger sharedLogger];
    int v11 = [v9 localizedDescription];
    [v10 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2841, @"Error enumerating image cache directory for migration: %@", v11 lineNumber format];
  }
  unsigned __int8 v12 = dispatch_get_global_queue(2, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10015A600;
  v16[3] = &unk_1005531F0;
  id v17 = v2;
  id v18 = v5;
  id v13 = v5;
  id v14 = v2;
  [v8 concurrentMapWithStrideSize:5 on:v12 withBlock:v16];

  +[MTLibraryMigrationUtil setLibraryImageStoreType:v14];
  return 1;
}

+ (void)setLastLaunchFromDatabase
{
  uint64_t v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned __int8 v4 = _MTLogCategoryLifecycle();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  id v6 = v4;
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SourceLastLaunchFromDB", "", (uint8_t *)&v13, 2u);
  }

  uint64_t v8 = [a1 _mostRecentPlayTimeFromDatabase];
  id v9 = v7;
  unsigned int v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v5, "SourceLastLaunchFromDB", "", (uint8_t *)&v13, 2u);
  }

  int v11 = _MTLogCategoryLifecycle();
  unsigned __int8 v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Setting new value for last use from database: %@", (uint8_t *)&v13, 0xCu);
    }

    [v3 setLastAppUseDate:v8];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to update last launch from the database.", (uint8_t *)&v13, 2u);
    }
  }
}

+ (id)_mostRecentPlayTimeFromDatabase
{
  uint64_t v3 = +[MTDB sharedInstance];
  unsigned __int8 v4 = [v3 privateQueueContext];

  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100057198;
  long long v16 = sub_100057388;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015AB1C;
  v8[3] = &unk_10054E2F8;
  id v11 = a1;
  id v5 = v4;
  id v9 = v5;
  unsigned int v10 = &v12;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

+ (id)_fetchRequestForMostRecentlyPlayedEpisode
{
  id v2 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  [v2 setResultType:2];
  id v3 = objc_alloc((Class)NSSortDescriptor);
  uint64_t v4 = kEpisodeLastDatePlayed;
  id v5 = [v3 initWithKey:kEpisodeLastDatePlayed ascending:0];
  id v11 = v5;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];
  [v2 setSortDescriptors:v6];

  v10[0] = kObjectID;
  v10[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  [v2 setPropertiesToFetch:v7];

  uint64_t v8 = +[NSPredicate predicateWithFormat:@"%K != NULL", v4];
  [v2 setPredicate:v8];

  [v2 setFetchLimit:1];

  return v2;
}

+ (void)updateGlobalDownloadPolicyIfNecessary
{
  id v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  [a1 inactiveIntervalForDownloadPolicyUpgrade];
  if (objc_msgSend(a1, "hasBeenInactiveForTimeInterval:")) {
    [a1 _updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:v3];
  }
}

+ (void)_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = kMTPodcastEpisodeLimitDefaultKey;
  id v8 = v3;
  id v5 = [v3 episodeLimitForKey:kMTPodcastEpisodeLimitDefaultKey];
  +[MTPreferences defaultEpisodeLimit];
  uint64_t v6 = PFMostRestrictiveLimit();
  if ((id)v6 != v5)
  {
    id v7 = +[NSNumber numberWithLongLong:v6];
    [v8 setObject:v7 forKey:v4];
  }
}

@end