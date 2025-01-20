@interface NMSyncDefaults
+ (id)sharedDefaults;
- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_continueUsingMusicRecommendationKey;
- (BOOL)_deviceHasCapability:(id)a3 forCapabilitiesKey:(id)a4;
- (BOOL)_phoneHasCapability:(id)a3;
- (BOOL)_watchHasCapability:(id)a3;
- (BOOL)debugSyncInfoEnabled;
- (BOOL)pinnedPodcastsAreUserSet;
- (BOOL)readingNowEnabled;
- (BOOL)savedEpisodesEnabled;
- (BOOL)wantToReadEnabled;
- (MPMediaPlaylist)assetSyncPlaylist;
- (NMSyncDefaults)init;
- (NSArray)libraryRecommendationAlbums;
- (NSArray)libraryRecommendationPlaylists;
- (NSArray)pinnedAlbums;
- (NSArray)pinnedAudiobooks;
- (NSArray)pinnedPlaylists;
- (NSArray)pinnedPodcastFeedURLs;
- (NSArray)pinnedPodcastStationUUIDs;
- (NSArray)readingNowAudiobooks;
- (NSArray)wantToReadAudiobooks;
- (NSData)cachedRecommendationsData;
- (NSDate)catalogRecommendationsLastUpdateDate;
- (NSDate)libraryRecommendationExpirationDate;
- (NSDate)modificationDate;
- (NSDictionary)audiobooksSyncInfo;
- (NSDictionary)clientPinningSettingsToken;
- (NSDictionary)musicRecommendationDict;
- (NSDictionary)musicSyncInfo;
- (NSDictionary)podcastsSyncInfo;
- (NSDictionary)syncStateDict;
- (NSNumber)assetSyncLimit;
- (NSNumber)assetSyncPlaylistPersistentID;
- (NSNumber)audiobookDownloadLimit;
- (NSNumber)lastFullySentAssetSyncPlaylistPersistentID;
- (NSNumber)lastFullySentAssetSyncPlaylistVersion;
- (NSNumber)minimumNumberOfRecentMusicModelObjects;
- (NSNumber)workoutPlaylistID;
- (NSString)description;
- (id)_associatedObject;
- (id)_companionSidePerDeviceDefaults;
- (id)_dateValueForKey:(id)a3 bundleID:(id)a4;
- (id)_defaultPlaylistPersistentID;
- (id)_defaultWithPrefix:(id)a3 forBundleIdentifier:(id)a4;
- (id)_lastSyncInfoRequestDateWithPrefix:(id)a3 forBundleIdentifier:(id)a4;
- (id)_objectForKey:(id)a3;
- (id)_playlistPersistentIDForPlaylistName:(id)a3;
- (id)installDateForBundleID:(id)a3;
- (id)lastContentUsedDateForBundleID:(id)a3;
- (id)lastLocalPlaybackDateForBundleID:(id)a3;
- (id)lastSyncInfoRequestDateForBundleIdentifier:(id)a3;
- (id)lastUserLaunchDateForBundleID:(id)a3;
- (id)lastUserPinningChangeDateForBundleID:(id)a3;
- (id)podcastSizeEstimationData;
- (int64_t)dormancyIntervalInHoursForBundleID:(id)a3;
- (unint64_t)_spaceQuotaForNumberOfSongs:(unint64_t)a3;
- (unint64_t)assetSyncLimitType;
- (unint64_t)assetSyncType;
- (void)_addCapability:(id)a3 forCapabilitiesKey:(id)a4;
- (void)_addPhoneCapability:(id)a3;
- (void)_addWatchCapability:(id)a3;
- (void)_clearAssetSyncPlaylistDependentDefaults;
- (void)_migrateDataIfNecessary;
- (void)_notifyChangesForKey:(id)a3;
- (void)_perDeviceSettingsDidResetNotification:(id)a3;
- (void)_preSeed2_setMusicRecommendationDict:(id)a3;
- (void)_reloadPropertiesFromDefaults;
- (void)_reloadPropertiesFromDefaultsOnMainThread;
- (void)_removeObjectForKey:(id)a3;
- (void)_removeOldMusicRecommendationsInfoIfPossible;
- (void)_resetDomainAccessor;
- (void)_setBool:(BOOL)a3 forKey:(id)a4;
- (void)_setLastSyncInfoRequestDate:(id)a3 prefix:(id)a4 forBundleIdentifier:(id)a5;
- (void)_setLegacyObject:(id)a3 forKey:(id)a4 ifRemoteDeviceMissingCapability:(id)a5;
- (void)_setNeedsSynchronize;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)_setObject:(id)a3 forKey:(id)a4 shouldSynchronizeToPairedDevice:(BOOL)a5;
- (void)_setupNotifiers;
- (void)_writeDate:(id)a3 forKey:(id)a4 bundleID:(id)a5;
- (void)_writePropertiesToDefaults;
- (void)beginBatchUpdates;
- (void)clearAppActivityStatusDefaultsForBundleID:(id)a3;
- (void)clearPodcastsDefaults;
- (void)dispatcherDidReceiveNotificationFromOtherProcess:(id)a3;
- (void)dispatcherDidReceiveNotificationFromRemoteDevice:(id)a3;
- (void)endBatchUpdates;
- (void)removeObjectforKey:(id)a3;
- (void)setAssetSyncLimit:(id)a3;
- (void)setAssetSyncLimitType:(unint64_t)a3;
- (void)setAssetSyncPlaylist:(id)a3;
- (void)setAssetSyncPlaylistPersistentID:(id)a3;
- (void)setAssetSyncType:(unint64_t)a3;
- (void)setAudiobookDownloadLimit:(id)a3;
- (void)setAudiobooksSyncInfo:(id)a3;
- (void)setCachedRecommendationsData:(id)a3;
- (void)setCatalogRecommendationsLastUpdateDate:(id)a3;
- (void)setClientPinningSettingsToken:(id)a3;
- (void)setInstallDateForBundleID:(id)a3;
- (void)setLastContentUsedDateForBundleID:(id)a3;
- (void)setLastFullySentAssetSyncPlaylistPersistentID:(id)a3;
- (void)setLastFullySentAssetSyncPlaylistVersion:(id)a3;
- (void)setLastLocalPlaybackDateForBundleID:(id)a3;
- (void)setLastSyncInfoRequestDate:(id)a3 forBundleIdentifier:(id)a4;
- (void)setLastUserLaunchDateForBundleID:(id)a3;
- (void)setLastUserPinningChangeDateForBundleID:(id)a3;
- (void)setLibraryRecommendationAlbums:(id)a3;
- (void)setLibraryRecommendationExpirationDate:(id)a3;
- (void)setLibraryRecommendationPlaylists:(id)a3;
- (void)setMinimumNumberOfRecentMusicModelObjects:(id)a3;
- (void)setMusicRecommendationDict:(id)a3;
- (void)setMusicSyncInfo:(id)a3;
- (void)setPinnedAlbums:(id)a3;
- (void)setPinnedAudiobooks:(id)a3;
- (void)setPinnedPlaylists:(id)a3;
- (void)setPinnedPodcastFeedURLs:(id)a3;
- (void)setPinnedPodcastStationUUIDs:(id)a3;
- (void)setPinnedPodcastsAreUserSet:(BOOL)a3;
- (void)setPodcastSizeEstimationData:(id)a3;
- (void)setPodcastsSyncInfo:(id)a3;
- (void)setReadingNowAudiobooks:(id)a3;
- (void)setReadingNowEnabled:(BOOL)a3;
- (void)setSavedEpisodesEnabled:(BOOL)a3;
- (void)setWantToReadAudiobooks:(id)a3;
- (void)setWantToReadEnabled:(BOOL)a3;
- (void)setWorkoutPlaylistID:(id)a3;
@end

@implementation NMSyncDefaults

+ (id)sharedDefaults
{
  if (sharedDefaults___onceToken != -1) {
    dispatch_once(&sharedDefaults___onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedDefaults___sharedDefaults;

  return v2;
}

uint64_t __32__NMSyncDefaults_sharedDefaults__block_invoke()
{
  sharedDefaults___sharedDefaults = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NMSyncDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSyncDefaults;
  v2 = [(NMSyncDefaults *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__perDeviceSettingsDidResetNotification_ name:@"_NMPerDeviceSettingsDidResetNotification" object:0];

    [(NMSyncDefaults *)v2 _setupNotifiers];
    [(NMSyncDefaults *)v2 _reloadPropertiesFromDefaultsOnMainThread];
    v4 = v2;
  }

  return v2;
}

- (void)_reloadPropertiesFromDefaults
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  [(NMSyncDefaults *)self _migrateDataIfNecessary];
  v3 = [(NMSyncDefaults *)self _companionSidePerDeviceDefaults];
  id v4 = (id)[v3 synchronize];
  v5 = [v3 objectForKey:@"SyncPlaylistID"];
  assetSyncPlaylistPersistentID = self->_assetSyncPlaylistPersistentID;
  self->_assetSyncPlaylistPersistentID = v5;

  self->_assetSyncLimitType = [v3 integerForKey:@"SyncAmountType"];
  v7 = [v3 objectForKey:@"SyncAmount"];
  assetSyncLimit = self->_assetSyncLimit;
  self->_assetSyncLimit = v7;

  self->_assetSyncType = [v3 integerForKey:@"SyncType"];
  v9 = [v3 objectForKey:@"LastFullSyncPlaylistID"];
  lastFullySentAssetSyncPlaylistPersistentID = self->_lastFullySentAssetSyncPlaylistPersistentID;
  self->_lastFullySentAssetSyncPlaylistPersistentID = v9;

  v11 = [v3 objectForKey:@"SyncPlaylistVers"];
  lastFullySentAssetSyncPlaylistVersion = self->_lastFullySentAssetSyncPlaylistVersion;
  self->_lastFullySentAssetSyncPlaylistVersion = v11;

  v13 = [v3 objectForKey:@"PairingID"];
  p_pairingID = (id *)&self->_pairingID;
  pairingID = self->_pairingID;
  self->_pairingID = v13;

  v16 = [v3 objectForKey:@"ModDate"];
  v17 = v16;
  if (v16)
  {
    v18 = (void *)MEMORY[0x263EFF910];
    [v16 doubleValue];
    objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    modificationDate = self->_modificationDate;
    self->_modificationDate = v19;
  }
  else
  {
    modificationDate = self->_modificationDate;
    self->_modificationDate = 0;
  }

  v21 = [MEMORY[0x263F57730] sharedInstance];
  v22 = [v21 getActivePairedDevice];
  v23 = [v22 valueForProperty:*MEMORY[0x263F57620]];
  id v24 = [v23 UUIDString];

  if (*p_pairingID != v24 && ([*p_pairingID isEqual:v24] & 1) == 0)
  {
    v25 = NMLogForCategory(5);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = *p_pairingID;
      int v27 = 138412546;
      id v28 = v26;
      __int16 v29 = 2112;
      id v30 = v24;
      _os_log_impl(&dword_2228FD000, v25, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] The pairing ID changed from %@ to %@; clearing pairing-specific defaults!",
        (uint8_t *)&v27,
        0x16u);
    }

    objc_storeStrong((id *)&self->_pairingID, v24);
    [(NMSyncDefaults *)self _clearAssetSyncPlaylistDependentDefaults];
    [(NMSyncDefaults *)self _writePropertiesToDefaults];
  }
}

- (void)_migrateDataIfNecessary
{
  v121[1] = *MEMORY[0x263EF8340];
  [(NMSyncDefaults *)self beginBatchUpdates];
  v3 = [(NMSyncDefaults *)self _companionSidePerDeviceDefaults];
  id v4 = [v3 objectForKey:@"SyncDataMigrationRevision"];
  uint64_t v5 = [v3 objectForKey:@"ModDate"];
  objc_super v6 = (void *)v5;
  if (v3) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  int v8 = v7;
  v9 = &off_222950000;
  if (v7)
  {
    v108 = (void *)v5;
    v10 = NMLogForCategory(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] [Migration] New install. No migration needed.", buf, 2u);
    }

    id v4 = &unk_26D51CFC8;
    [v3 setObject:&unk_26D51CFC8 forKey:@"SyncDataMigrationRevision"];
    v11 = NSNumber;
    v12 = [MEMORY[0x263EFF910] date];
    [v12 timeIntervalSinceReferenceDate];
    v13 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v13 forKey:@"ModDate"];

    id v14 = (id)[v3 synchronize];
  }
  else
  {
    if (!v3)
    {
      [(NMSyncDefaults *)self _removeOldMusicRecommendationsInfoIfPossible];
      int v8 = 0;
      goto LABEL_80;
    }
    v108 = (void *)v5;
  }
  if (![v4 unsignedIntegerValue])
  {
    v15 = [v3 objectForKey:@"SyncAssetsEnabled"];
    uint64_t v16 = [v3 integerForKey:@"SyncType"];
    if (v15 && ([v15 BOOLValue] & 1) != 0 || v16 == 1)
    {
      v17 = [v3 objectForKey:@"SyncPlaylistID"];
      BOOL v18 = 1;
    }
    else
    {
      v17 = [(NMSyncDefaults *)self _defaultPlaylistPersistentID];
      BOOL v18 = [v17 longLongValue] != 0;
    }
    [v3 setObject:&unk_26D51CFE0 forKey:@"SyncDataMigrationRevision"];
    v19 = [NSNumber numberWithUnsignedInteger:v18];
    [v3 setObject:v19 forKey:@"SyncType"];

    [v3 setObject:v17 forKey:@"SyncPlaylistID"];
    v20 = NSNumber;
    v21 = [MEMORY[0x263EFF910] date];
    [v21 timeIntervalSinceReferenceDate];
    v22 = objc_msgSend(v20, "numberWithDouble:");
    [v3 setObject:v22 forKey:@"ModDate"];

    [v3 removeObjectForKey:@"SyncAssetsEnabled"];
    id v23 = (id)[v3 synchronize];

    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 1)
  {
    if (![v3 integerForKey:@"SyncType"])
    {
      id v24 = [(NMSyncDefaults *)self _defaultPlaylistPersistentID];
      BOOL v25 = [v24 longLongValue] != 0;
      [v3 setObject:v24 forKey:@"SyncPlaylistID"];
      id v26 = [NSNumber numberWithUnsignedInteger:v25];
      [v3 setObject:v26 forKey:@"SyncType"];
    }
    [v3 setObject:&unk_26D51CFF8 forKey:@"SyncDataMigrationRevision"];
    int v27 = NSNumber;
    id v28 = [MEMORY[0x263EFF910] date];
    [v28 timeIntervalSinceReferenceDate];
    __int16 v29 = objc_msgSend(v27, "numberWithDouble:");
    [v3 setObject:v29 forKey:@"ModDate"];

    id v30 = (id)[v3 synchronize];
    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 2)
  {
    uint64_t v31 = [v3 integerForKey:@"SyncType"];
    [v3 setObject:&unk_26D51D010 forKey:@"SyncDataMigrationRevision"];
    v32 = NSNumber;
    v33 = [MEMORY[0x263EFF910] date];
    [v33 timeIntervalSinceReferenceDate];
    v34 = objc_msgSend(v32, "numberWithDouble:");
    [v3 setObject:v34 forKey:@"ModDate"];

    if (v31 == 1)
    {
      v35 = [v3 objectForKey:@"SyncPlaylistID"];
      if (v35
        && (v36 = v35,
            objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v35, "longLongValue")),
            v37 = objc_claimAutoreleasedReturnValue(),
            v36,
            v37))
      {
        v121[0] = v37;
        v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:1];
      }
      else
      {
        v38 = [MEMORY[0x263EFF8C0] array];
      }
      [(NMSyncDefaults *)self _setObject:v38 forKey:@"PinnedPlaylists"];
    }
    buf[0] = 0;
    uint64_t v39 = [v3 integerForKey:@"SyncAmountType" keyExistsAndHasValidFormat:buf];
    if (!buf[0]) {
      uint64_t v39 = [(NMSyncDefaults *)self assetSyncLimitType];
    }
    if (v39 == 1)
    {
      char v117 = 0;
      uint64_t v40 = [v3 integerForKey:@"SyncAmount" keyExistsAndHasValidFormat:&v117];
      if (v117)
      {
        uint64_t v41 = v40;
      }
      else
      {
        v42 = [(NMSyncDefaults *)self assetSyncLimit];
        uint64_t v41 = [v42 unsignedIntegerValue];
      }
      unint64_t v43 = [(NMSyncDefaults *)self _spaceQuotaForNumberOfSongs:v41];
      if (v43 != v41)
      {
        v44 = [NSNumber numberWithUnsignedInteger:v43];
        [v3 setObject:v44 forKey:@"SyncAmount"];
      }
    }
    if (buf[0]) {
      [v3 removeObjectForKey:@"SyncAmountType"];
    }
    id v45 = (id)[v3 synchronize];
    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 3)
  {
    [v3 setObject:&unk_26D51D028 forKey:@"SyncDataMigrationRevision"];
    v46 = NSNumber;
    v47 = [MEMORY[0x263EFF910] date];
    [v47 timeIntervalSinceReferenceDate];
    v48 = objc_msgSend(v46, "numberWithDouble:");
    [v3 setObject:v48 forKey:@"ModDate"];

    v49 = [v3 objectForKey:@"MusicRecommendations"];
    v50 = v49;
    if (v49)
    {
      v51 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v49, "count"));
      v52 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v50, "count"));
      v114[0] = MEMORY[0x263EF8330];
      v114[1] = 3221225472;
      v114[2] = __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke;
      v114[3] = &unk_264634628;
      id v115 = v51;
      id v116 = v52;
      id v53 = v52;
      id v54 = v51;
      [v50 enumerateKeysAndObjectsUsingBlock:v114];
      [v3 setObject:v54 forKey:@"StoreMusicRecommendations"];
      [v3 setObject:v53 forKey:@"StoreMusicRecommendationsToExclude"];
    }
    v55 = [v3 objectForKey:@"PhoneDefaultsCapabilities"];
    if (([v55 containsObject:@"UsesSplitMusicRecommendations"] & 1) == 0)
    {
      if (v55)
      {
        [v55 arrayByAddingObject:@"UsesSplitMusicRecommendations"];
      }
      else
      {
        v120 = @"UsesSplitMusicRecommendations";
        [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
      v56 = };
      [v3 setObject:v56 forKey:@"PhoneDefaultsCapabilities"];
    }
    [v3 removeObjectForKey:@"LastRecommendationUpdateDate"];
    id v57 = (id)[v3 synchronize];
    id v58 = objc_alloc_init(MEMORY[0x263F57528]);
    v59 = [v3 domain];
    v60 = [MEMORY[0x263EFFA08] setWithObject:@"PhoneDefaultsCapabilities"];
    [v58 synchronizeNanoDomain:v59 keys:v60];

    int v8 = 1;
  }
  [(NMSyncDefaults *)self _removeOldMusicRecommendationsInfoIfPossible];
  if ((unint64_t)[v4 unsignedIntegerValue] <= 5)
  {
    [v3 setObject:&unk_26D51D040 forKey:@"SyncDataMigrationRevision"];
    v61 = NSNumber;
    v62 = [MEMORY[0x263EFF910] date];
    [v62 timeIntervalSinceReferenceDate];
    v63 = objc_msgSend(v61, "numberWithDouble:");
    [v3 setObject:v63 forKey:@"ModDate"];

    [v3 objectForKey:@"StoreMusicRecommendations"];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v64 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v65 = [v64 countByEnumeratingWithState:&v110 objects:v119 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v111;
      while (2)
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v111 != v67) {
            objc_enumerationMutation(v64);
          }
          if ([*(id *)(*((void *)&v110 + 1) + 8 * i) isEqualToString:@"HeavyRotation"])
          {
            v69 = v64;
            goto LABEL_66;
          }
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v110 objects:v119 count:16];
        if (v66) {
          continue;
        }
        break;
      }
    }

    v69 = (void *)[v64 mutableCopy];
    if (!v69)
    {
      v69 = [MEMORY[0x263EFF980] array];
    }
    [v69 addObject:NMSRecommendationRecentMusicIdentifier];
    [v3 setObject:v69 forKey:@"StoreMusicRecommendations"];
LABEL_66:

    id v70 = (id)[v3 synchronize];
    id v71 = objc_alloc_init(MEMORY[0x263F57528]);
    v72 = [v3 domain];
    v73 = [MEMORY[0x263EFFA08] setWithObject:@"StoreMusicRecommendations"];
    [v71 synchronizeNanoDomain:v72 keys:v73];

    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 6)
  {
    [v3 setObject:&unk_26D51D058 forKey:@"SyncDataMigrationRevision"];
    v74 = NSNumber;
    v75 = [MEMORY[0x263EFF910] date];
    [v75 timeIntervalSinceReferenceDate];
    v76 = objc_msgSend(v74, "numberWithDouble:");
    [v3 setObject:v76 forKey:@"ModDate"];

    v77 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.Music"];
    v78 = v77;
    if (v77)
    {
      [v77 removeObjectForKey:@"AllowsCellularDataDownloads"];
      id v79 = (id)[v78 synchronize];
    }
    id v80 = (id)[v3 synchronize];

    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 7)
  {
    [v3 setObject:&unk_26D51D070 forKey:@"SyncDataMigrationRevision"];
    v81 = NSNumber;
    v82 = [MEMORY[0x263EFF910] date];
    [v82 timeIntervalSinceReferenceDate];
    v83 = objc_msgSend(v81, "numberWithDouble:");
    [v3 setObject:v83 forKey:@"ModDate"];

    id v84 = (id)[v3 synchronize];
    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 8)
  {
    [v3 setObject:&unk_26D51D088 forKey:@"SyncDataMigrationRevision"];
    v85 = NSNumber;
    v86 = [MEMORY[0x263EFF910] date];
    [v86 timeIntervalSinceReferenceDate];
    v87 = objc_msgSend(v85, "numberWithDouble:");
    [v3 setObject:v87 forKey:@"ModDate"];

    v106 = [(NMSyncDefaults *)self _objectForKey:@"WorkoutPlaylist"];
    v105 = [(NMSyncDefaults *)self _objectForKey:@"PinnedPlaylists"];
    v88 = [(NMSyncDefaults *)self _objectForKey:@"PinnedAlbums"];
    v89 = [(NMSyncDefaults *)self _objectForKey:@"LibraryRecommendationPlaylists"];
    v90 = [(NMSyncDefaults *)self _objectForKey:@"LibraryRecommendationAlbums"];
    [MEMORY[0x263F573E8] midDataFromPlaylistPID:v106];
    v91 = v107 = v4;
    v92 = [MEMORY[0x263F573E8] midDataArrayFromPlaylistPIDs:v105];
    v93 = [MEMORY[0x263F573E8] midDataArrayFromAlbumPIDs:v88];
    v94 = [MEMORY[0x263F573E8] midDataArrayFromPlaylistPIDs:v89];
    v95 = [MEMORY[0x263F573E8] midDataArrayFromAlbumPIDs:v90];
    [(NMSyncDefaults *)self _setObject:v91 forKey:@"WorkoutPlaylistMID"];
    [(NMSyncDefaults *)self _setObject:v92 forKey:@"PinnedPlaylistMIDs"];
    [(NMSyncDefaults *)self _setObject:v93 forKey:@"PinnedAlbumMIDs"];
    [(NMSyncDefaults *)self _setObject:v94 forKey:@"LibraryRecommendationPlaylistMIDs"];
    [(NMSyncDefaults *)self _setObject:v95 forKey:@"LibraryRecommendationAlbumMIDs"];
    [(NMSyncDefaults *)self _addPhoneCapability:@"UsesMultiverseIdentifiers"];

    id v4 = v107;
    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 9)
  {
    [v3 setObject:&unk_26D51D0A0 forKey:@"SyncDataMigrationRevision"];
    v96 = NSNumber;
    v97 = [MEMORY[0x263EFF910] date];
    [v97 timeIntervalSinceReferenceDate];
    v98 = objc_msgSend(v96, "numberWithDouble:");
    [v3 setObject:v98 forKey:@"ModDate"];

    [v3 removeObjectForKey:@"AvailableMediaStorageOnWatch"];
    id v99 = (id)[v3 synchronize];
    int v8 = 1;
  }
  if ((unint64_t)[v4 unsignedIntegerValue] <= 0xA)
  {
    [v3 setObject:&unk_26D51D0B8 forKey:@"SyncDataMigrationRevision"];
    v100 = NSNumber;
    v101 = [MEMORY[0x263EFF910] date];
    [v101 timeIntervalSinceReferenceDate];
    v102 = objc_msgSend(v100, "numberWithDouble:");
    [v3 setObject:v102 forKey:@"ModDate"];

    v103 = [v3 objectForKey:@"RecommendationExpirationDate"];
    [v3 setObject:v103 forKey:@"LibraryRecommendationExpirationDate"];

    [v3 removeObjectForKey:@"RecommendationExpirationDate"];
    id v104 = (id)[v3 synchronize];
    int v8 = 1;
  }
  objc_super v6 = v108;
  v9 = &off_222950000;
LABEL_80:
  block[0] = MEMORY[0x263EF8330];
  block[1] = *((void *)v9 + 154);
  block[2] = __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke_338;
  block[3] = &unk_264633B20;
  block[4] = self;
  if (_migrateDataIfNecessary_onceToken != -1)
  {
    dispatch_once(&_migrateDataIfNecessary_onceToken, block);
    if (!v8) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
  if (v8) {
LABEL_82:
  }
    [(NMSNotificationDispatcher *)self->_settingsNotifier scheduleLocalDarwinNotification];
LABEL_83:
  [(NMSyncDefaults *)self endBatchUpdates];
}

void __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [v6 objectForKey:@"selected"];

    if (v7 && ([v7 BOOLValue] & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v9];
    }
  }
  else
  {
    char v8 = [v6 BOOLValue];

    if ((v8 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v9];
    }
  }
}

- (NSDictionary)musicRecommendationDict
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = [(NMSyncDefaults *)self _objectForKey:@"StoreMusicRecommendations"];
  id v4 = [(NMSyncDefaults *)self _objectForKey:@"StoreMusicRecommendationsToExclude"];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    uint64_t v10 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 setObject:v10 forKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v8);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v25;
    *(void *)&long long v14 = 138412290;
    long long v23 = v14;
    uint64_t v17 = MEMORY[0x263EFFA80];
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        v20 = objc_msgSend(v5, "objectForKeyedSubscript:", v19, v23, (void)v24);

        if (!v20)
        {
          v21 = NMLogForCategory(5);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            uint64_t v33 = v19;
            _os_log_impl(&dword_2228FD000, v21, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] StoreMusicRecommendations does NOT contain excluded recommendation: %@!", buf, 0xCu);
          }
        }
        [v5 setObject:v17 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v15);
  }

  return (NSDictionary *)v5;
}

- (NSArray)pinnedPlaylists
{
  v2 = [(NMSyncDefaults *)self _objectForKey:@"PinnedPlaylistMIDs"];
  v3 = [MEMORY[0x263F573E8] pidsFromMIDDataArray:v2];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF8C0] array];
  }
  id v6 = v5;

  return (NSArray *)v6;
}

- (NSArray)pinnedAlbums
{
  v2 = [(NMSyncDefaults *)self _objectForKey:@"PinnedAlbumMIDs"];
  v3 = [MEMORY[0x263F573E8] pidsFromMIDDataArray:v2];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF8C0] array];
  }
  id v6 = v5;

  return (NSArray *)v6;
}

- (NSData)cachedRecommendationsData
{
  return (NSData *)[(NMSyncDefaults *)self _objectForKey:@"CachedRecommendationsData"];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p>", v5, self];

  uint64_t v7 = (void *)MEMORY[0x263F089D8];
  uint64_t v8 = [(NMSyncDefaults *)self musicRecommendationDict];
  uint64_t v9 = [(NMSyncDefaults *)self workoutPlaylistID];
  uint64_t v10 = [v7 stringWithFormat:@"Music Recommendations: %@, Workout Playlist ID: %@", v8, v9];

  [v6 appendFormat:@" - Music <%@>", v10];
  v11 = [MEMORY[0x263F089D8] string];
  id v12 = [NMSPodcastsDownloadSettings alloc];
  uint64_t v13 = [(NMSyncDefaults *)self objectForKey:@"PodcastsUpNextDownloadSettings"];
  long long v14 = [(NMSPodcastsDownloadSettings *)v12 initWithCollectionType:0 dictionary:v13];

  [v11 appendFormat:@"Up Next: %@", v14];
  uint64_t v15 = [NMSPodcastsDownloadSettings alloc];
  uint64_t v16 = [(NMSyncDefaults *)self objectForKey:@"PodcastsSavedEpisodesDownloadSettings"];
  uint64_t v17 = [(NMSPodcastsDownloadSettings *)v15 initWithCollectionType:1 dictionary:v16];

  [v11 appendFormat:@", Saved: %@", v17];
  BOOL v18 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v19 = [(NMSyncDefaults *)self objectForKey:@"PodcastsStationDownloadSettings"];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __29__NMSyncDefaults_description__block_invoke;
  v32[3] = &unk_264634400;
  id v20 = v18;
  id v33 = v20;
  [v19 enumerateKeysAndObjectsUsingBlock:v32];

  [v11 appendFormat:@", Stations: %@", v20];
  v21 = [MEMORY[0x263EFF9A0] dictionary];
  v22 = [(NMSyncDefaults *)self objectForKey:@"PodcastsShowDownloadSettings"];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __29__NMSyncDefaults_description__block_invoke_2;
  v30[3] = &unk_264634400;
  id v23 = v21;
  id v31 = v23;
  [v22 enumerateKeysAndObjectsUsingBlock:v30];

  [v11 appendFormat:@", Shows: %@", v23];
  [v6 appendFormat:@" - Podcasts <%@>", v11];
  long long v24 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"Want to Read Enabled: %x", -[NMSyncDefaults wantToReadEnabled](self, "wantToReadEnabled"));
  if ([(NMSyncDefaults *)self wantToReadEnabled])
  {
    long long v25 = [(NMSyncDefaults *)self wantToReadAudiobooks];
    [v24 appendFormat:@", Want to Read Books:%@", v25];
  }
  [v24 appendFormat:@", Reading Now Enabled: %x", -[NMSyncDefaults readingNowEnabled](self, "readingNowEnabled")];
  if ([(NMSyncDefaults *)self readingNowEnabled])
  {
    long long v26 = [(NMSyncDefaults *)self readingNowAudiobooks];
    [v24 appendFormat:@", Reading Now Books: %@", v26];
  }
  long long v27 = [(NMSyncDefaults *)self pinnedAudiobooks];
  [v24 appendFormat:@", Pinned Books: %@", v27];

  [v6 appendFormat:@" - Books <%@>", v24];
  long long v28 = (void *)[v6 copy];

  return (NSString *)v28;
}

void __29__NMSyncDefaults_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:2 dictionary:v5];

  if ([(NMSPodcastsDownloadSettings *)v6 isEnabled]) {
    [*(id *)(a1 + 32) setObject:v6 forKey:v7];
  }
}

void __29__NMSyncDefaults_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:3 dictionary:v5];

  if ([(NMSPodcastsDownloadSettings *)v6 isEnabled]) {
    [*(id *)(a1 + 32) setObject:v6 forKey:v7];
  }
}

- (void)removeObjectforKey:(id)a3
{
}

- (void)beginBatchUpdates
{
  v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Begin batch updates.", v4, 2u);
  }

  [(NMSNotificationDispatcher *)self->_settingsNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_musicPinningSelectionsNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_recoSelectionsNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_libraryRecoNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_storeRecoNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_podcastsPinningSelectionsNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_audiobooksPinningSelectionsNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_syncStateNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_syncInfoNotifier beginWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_syncInfoRequestDateNotifier beginWaitingForUpdates];
}

- (void)endBatchUpdates
{
  v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] End batch updates.", v4, 2u);
  }

  [(NMSNotificationDispatcher *)self->_settingsNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_musicPinningSelectionsNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_recoSelectionsNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_libraryRecoNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_storeRecoNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_podcastsPinningSelectionsNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_audiobooksPinningSelectionsNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_syncStateNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_syncInfoNotifier endWaitingForUpdates];
  [(NMSNotificationDispatcher *)self->_syncInfoRequestDateNotifier endWaitingForUpdates];
}

- (void)dispatcherDidReceiveNotificationFromRemoteDevice:(id)a3
{
  if (self->_settingsNotifier == a3)
  {
    [(NMSyncDefaults *)self _reloadPropertiesFromDefaultsOnMainThread];
    [(NMSyncDefaults *)self _removeOldMusicRecommendationsInfoIfPossible];
  }
}

- (void)dispatcherDidReceiveNotificationFromOtherProcess:(id)a3
{
  if (self->_settingsNotifier == a3) {
    [(NMSyncDefaults *)self _reloadPropertiesFromDefaultsOnMainThread];
  }
}

- (void)_setupNotifiers
{
  v100[33] = *MEMORY[0x263EF8340];
  v3 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.settings"];
  settingsNotifier = self->_settingsNotifier;
  self->_settingsNotifier = v3;

  [(NMSNotificationDispatcher *)self->_settingsNotifier setDelegate:self];
  id v5 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.music-pinning-selections"];
  musicPinningSelectionsNotifier = self->_musicPinningSelectionsNotifier;
  self->_musicPinningSelectionsNotifier = v5;

  id v7 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.reco-selections"];
  recoSelectionsNotifier = self->_recoSelectionsNotifier;
  self->_recoSelectionsNotifier = v7;

  uint64_t v9 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.reco-library"];
  libraryRecoNotifier = self->_libraryRecoNotifier;
  self->_libraryRecoNotifier = v9;

  v11 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.reco-store"];
  storeRecoNotifier = self->_storeRecoNotifier;
  self->_storeRecoNotifier = v11;

  uint64_t v13 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.podcasts-pinning-selections"];
  podcastsPinningSelectionsNotifier = self->_podcastsPinningSelectionsNotifier;
  self->_podcastsPinningSelectionsNotifier = v13;

  uint64_t v15 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.audiobooks-pinning-selections"];
  audiobooksPinningSelectionsNotifier = self->_audiobooksPinningSelectionsNotifier;
  self->_audiobooksPinningSelectionsNotifier = v15;

  uint64_t v17 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.audiobooks-recommendations"];
  audiobooksRecommendationsNotifier = self->_audiobooksRecommendationsNotifier;
  self->_audiobooksRecommendationsNotifier = v17;

  uint64_t v19 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.sync-state"];
  syncStateNotifier = self->_syncStateNotifier;
  self->_syncStateNotifier = v19;

  v21 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.sync-info"];
  syncInfoNotifier = self->_syncInfoNotifier;
  self->_syncInfoNotifier = v21;

  id v23 = [[NMSNotificationDispatcher alloc] initWithNotificationName:@"com.apple.nanomusicsync.sync-info-request-date"];
  syncInfoRequestDateNotifier = self->_syncInfoRequestDateNotifier;
  self->_syncInfoRequestDateNotifier = v23;

  [(NMSNotificationDispatcher *)self->_syncInfoRequestDateNotifier setDelegate:self];
  v98 = self->_musicPinningSelectionsNotifier;
  v99[0] = @"PinnedPlaylistMIDs";
  uint64_t v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v98 count:1];
  v100[0] = v65;
  v99[1] = @"WorkoutPlaylistMID";
  v97 = self->_musicPinningSelectionsNotifier;
  id v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v97 count:1];
  v100[1] = v64;
  v99[2] = @"PinnedAlbumMIDs";
  v96 = self->_musicPinningSelectionsNotifier;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v96 count:1];
  v100[2] = v63;
  v99[3] = @"LibraryRecommendationPlaylistMIDs";
  v95 = self->_libraryRecoNotifier;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
  v100[3] = v62;
  v99[4] = @"LibraryRecommendationAlbumMIDs";
  v94 = self->_libraryRecoNotifier;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
  v100[4] = v61;
  v99[5] = @"StoreMusicRecommendations";
  v93 = self->_recoSelectionsNotifier;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];
  v100[5] = v60;
  v99[6] = @"StoreMusicRecommendationsToExclude";
  v92 = self->_recoSelectionsNotifier;
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v92 count:1];
  v100[6] = v59;
  v99[7] = @"CachedRecommendationsData";
  v91 = self->_storeRecoNotifier;
  id v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
  v100[7] = v58;
  v99[8] = @"PodcastsUpNextDownloadSettings";
  v90 = self->_podcastsPinningSelectionsNotifier;
  id v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
  v100[8] = v57;
  v99[9] = @"PodcastsSavedEpisodesDownloadSettings";
  v89 = self->_podcastsPinningSelectionsNotifier;
  v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
  v100[9] = v56;
  v99[10] = @"PodcastsStationDownloadSettings";
  v88 = self->_podcastsPinningSelectionsNotifier;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
  v100[10] = v55;
  v99[11] = @"PodcastsShowDownloadSettings";
  v87 = self->_podcastsPinningSelectionsNotifier;
  id v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
  v100[11] = v54;
  v99[12] = @"PinnedAudiobooks";
  v86 = self->_audiobooksPinningSelectionsNotifier;
  id v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
  v100[12] = v53;
  v99[13] = @"WantToReadEnabled";
  v85 = self->_audiobooksPinningSelectionsNotifier;
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
  v100[13] = v52;
  v99[14] = @"WantToReadAudiobooks";
  id v84 = self->_audiobooksRecommendationsNotifier;
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
  v100[14] = v51;
  v99[15] = @"ReadingNowEnabled";
  v83 = self->_audiobooksPinningSelectionsNotifier;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
  v100[15] = v50;
  v99[16] = @"ReadingNowAudiobooks";
  v82 = self->_audiobooksRecommendationsNotifier;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
  v100[16] = v49;
  v99[17] = @"AudiobookDownloadLimit";
  v81 = self->_audiobooksPinningSelectionsNotifier;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
  v100[17] = v48;
  v99[18] = @"ClientPinningSettingsToken";
  id v80 = self->_syncStateNotifier;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
  v100[18] = v47;
  v99[19] = @"SyncStateDict";
  id v79 = self->_syncStateNotifier;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
  v100[19] = v46;
  v99[20] = @"MusicSyncInfo";
  v78 = self->_syncInfoNotifier;
  id v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
  v100[20] = v45;
  v99[21] = @"PodcastsSyncInfo";
  v77 = self->_syncInfoNotifier;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  v100[21] = v44;
  v99[22] = @"AudiobooksSyncInfo";
  v76 = self->_syncInfoNotifier;
  unint64_t v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
  v100[22] = v43;
  v99[23] = @"DebugSyncInfoEnabled";
  v75 = self->_syncInfoNotifier;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
  v100[23] = v42;
  uint64_t v41 = [(NMSyncDefaults *)self _defaultWithPrefix:@"LastSyncInfoRequestDate" forBundleIdentifier:@"com.apple.NanoMusic"];
  v99[24] = v41;
  v74 = self->_syncInfoRequestDateNotifier;
  uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v74 count:1];
  v100[24] = v40;
  uint64_t v39 = [(NMSyncDefaults *)self _defaultWithPrefix:@"LastSyncInfoRequestDate" forBundleIdentifier:@"com.apple.podcasts"];
  v99[25] = v39;
  v73 = self->_syncInfoRequestDateNotifier;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
  v100[25] = v38;
  v37 = [(NMSyncDefaults *)self _defaultWithPrefix:@"LastSyncInfoRequestDate" forBundleIdentifier:@"com.apple.NanoBooks"];
  v99[26] = v37;
  v72 = self->_syncInfoRequestDateNotifier;
  uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
  v100[26] = v36;
  long long v25 = [(NMSyncDefaults *)self _defaultWithPrefix:@"LastLocalSyncInfoRequestDate" forBundleIdentifier:@"com.apple.NanoMusic"];
  v99[27] = v25;
  id v71 = self->_syncInfoRequestDateNotifier;
  long long v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
  v100[27] = v26;
  long long v27 = [(NMSyncDefaults *)self _defaultWithPrefix:@"LastLocalSyncInfoRequestDate" forBundleIdentifier:@"com.apple.podcasts"];
  v99[28] = v27;
  id v70 = self->_syncInfoRequestDateNotifier;
  long long v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
  v100[28] = v28;
  long long v29 = [(NMSyncDefaults *)self _defaultWithPrefix:@"LastLocalSyncInfoRequestDate" forBundleIdentifier:@"com.apple.NanoBooks"];
  v99[29] = v29;
  v69 = self->_syncInfoRequestDateNotifier;
  long long v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
  v100[29] = v30;
  v99[30] = @"WatchDefaultsCapabilities";
  v68 = self->_settingsNotifier;
  id v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
  v100[30] = v31;
  v99[31] = @"PhoneDefaultsCapabilities";
  uint64_t v67 = self->_settingsNotifier;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
  v100[31] = v32;
  v99[32] = @"UsesSplitMusicRecommendations";
  uint64_t v66 = self->_settingsNotifier;
  id v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
  v100[32] = v33;
  v34 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:33];
  notifiersDict = self->_notifiersDict;
  self->_notifiersDict = v34;
}

- (BOOL)_phoneHasCapability:(id)a3
{
  return [(NMSyncDefaults *)self _deviceHasCapability:a3 forCapabilitiesKey:@"PhoneDefaultsCapabilities"];
}

- (BOOL)_watchHasCapability:(id)a3
{
  return [(NMSyncDefaults *)self _deviceHasCapability:a3 forCapabilitiesKey:@"WatchDefaultsCapabilities"];
}

- (BOOL)_deviceHasCapability:(id)a3 forCapabilitiesKey:(id)a4
{
  id v6 = a3;
  id v7 = [(NMSyncDefaults *)self _objectForKey:a4];
  LOBYTE(self) = [v7 containsObject:v6];

  return (char)self;
}

- (void)_addPhoneCapability:(id)a3
{
}

- (void)_addWatchCapability:(id)a3
{
}

- (void)_addCapability:(id)a3 forCapabilitiesKey:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NMSyncDefaults *)self _objectForKey:v7];
  if (([v8 containsObject:v6] & 1) == 0)
  {
    if (v8)
    {
      uint64_t v9 = [v8 arrayByAddingObject:v6];
    }
    else
    {
      v11[0] = v6;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    }
    uint64_t v10 = (void *)v9;
    [(NMSyncDefaults *)self _setObject:v9 forKey:v7];
  }
}

- (void)_reloadPropertiesFromDefaultsOnMainThread
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__NMSyncDefaults__reloadPropertiesFromDefaultsOnMainThread__block_invoke;
  v3[3] = &unk_264633B20;
  v3[4] = self;
  v2 = (void (**)(void))MEMORY[0x223CA14E0](v3, a2);
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v2);
  }
}

uint64_t __59__NMSyncDefaults__reloadPropertiesFromDefaultsOnMainThread__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadPropertiesFromDefaults];
}

- (void)_perDeviceSettingsDidResetNotification:(id)a3
{
  id v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] The active device changed; reloading Music sync defaults.",
      v5,
      2u);
  }

  [(NMSyncDefaults *)self _reloadPropertiesFromDefaultsOnMainThread];
}

- (void)_resetDomainAccessor
{
  domainAccessorQueue = self->_domainAccessorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__NMSyncDefaults__resetDomainAccessor__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_sync(domainAccessorQueue, block);
}

void __38__NMSyncDefaults__resetDomainAccessor__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;

  v3 = MEMORY[0x263EF83A0];

  dispatch_async(v3, &__block_literal_global_233);
}

void __38__NMSyncDefaults__resetDomainAccessor__block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"_NMPerDeviceSettingsDidResetNotification" object:0];
}

- (id)_companionSidePerDeviceDefaults
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke;
  v13[3] = &unk_264633B20;
  v13[4] = self;
  if (_companionSidePerDeviceDefaults___onceToken != -1) {
    dispatch_once(&_companionSidePerDeviceDefaults___onceToken, v13);
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  domainAccessorQueue = self->_domainAccessorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_239;
  block[3] = &unk_264634248;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(domainAccessorQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.NanoMusicSync.domainAccessorQueue", 0);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_2;
  v10[3] = &unk_264634600;
  v10[4] = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x223CA14E0](v10);
  id v6 = (const char *)[(id)*MEMORY[0x263F576B0] UTF8String];
  uint64_t v7 = MEMORY[0x263EF83A0];
  notify_register_dispatch(v6, &_NMPerDeviceSettingsDidResetNotification_block_invoke___unpairNotifyToken, MEMORY[0x263EF83A0], v5);
  notify_register_dispatch((const char *)[(id)*MEMORY[0x263F576A0] UTF8String], &_NMPerDeviceSettingsDidResetNotification_block_invoke___pairNotifyToken, v7, v5);

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:*(void *)(a1 + 32) selector:sel__resetDomainAccessor name:*MEMORY[0x263F57688] object:0];

  id v9 = (id)[MEMORY[0x263F57730] sharedInstance];
}

uint64_t __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetDomainAccessor];
}

void __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_239(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoMusicSync"];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (void)_writePropertiesToDefaults
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NMSyncDefaults *)self _companionSidePerDeviceDefaults];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setObject:self->_assetSyncPlaylistPersistentID forKey:@"SyncPlaylistID"];
    [v4 setObject:self->_lastFullySentAssetSyncPlaylistPersistentID forKey:@"LastFullSyncPlaylistID"];
    [v4 setObject:self->_lastFullySentAssetSyncPlaylistVersion forKey:@"SyncPlaylistVers"];
    id v5 = [NSNumber numberWithUnsignedInteger:self->_assetSyncLimitType];
    [v4 setObject:v5 forKey:@"SyncAmountType"];

    id v6 = [NSNumber numberWithUnsignedInteger:self->_assetSyncType];
    [v4 setObject:v6 forKey:@"SyncType"];

    [v4 setObject:self->_assetSyncLimit forKey:@"SyncAmount"];
    [v4 setObject:self->_pairingID forKey:@"PairingID"];
    uint64_t v7 = NSNumber;
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    [v8 timeIntervalSinceReferenceDate];
    id v9 = objc_msgSend(v7, "numberWithDouble:");
    [v4 setObject:v9 forKey:@"ModDate"];

    id v10 = (id)[v4 synchronize];
    v11 = NMLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = self;
      _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Non-NPS managed properties were updated: %@", (uint8_t *)&v12, 0xCu);
    }

    [(NMSNotificationDispatcher *)self->_settingsNotifier scheduleLocalDarwinNotification];
  }
}

void __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke_338(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _objectForKey:@"CachedRecommendationsResponse"];
  if (v2)
  {
    [*(id *)(a1 + 32) _removeObjectForKey:@"CachedRecommendationsResponse"];
    [*(id *)(a1 + 32) _removeObjectForKey:@"LastRecommendationUpdateDate"];
  }
  [*(id *)(a1 + 32) _removeObjectForKey:@"SelectedStoreLibraryRecommendationAlbums"];
  [*(id *)(a1 + 32) _removeObjectForKey:@"SelectedStoreLibraryRecommendationPlaylists"];
}

- (void)_removeOldMusicRecommendationsInfoIfPossible
{
  [(NMSyncDefaults *)self beginBatchUpdates];
  uint64_t v3 = [(NMSyncDefaults *)self _companionSidePerDeviceDefaults];
  id v4 = (id)[v3 synchronize];
  id v5 = [v3 objectForKey:@"SyncDataMigrationRevision"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v5 = &unk_26D51D0D0;
  }
  if ((unint64_t)[v5 unsignedIntegerValue] <= 4)
  {
    id v6 = NMLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] The old musicRecommendations information has not been removed yet.", buf, 2u);
    }

    uint64_t v7 = [v3 objectForKey:@"PhoneDefaultsCapabilities"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v7 = 0;
    }
    uint64_t v8 = [v3 objectForKey:@"WatchDefaultsCapabilities"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v8 = 0;
    }
    if ([v7 containsObject:@"UsesSplitMusicRecommendations"]
      && [v8 containsObject:@"UsesSplitMusicRecommendations"])
    {
      [v3 setObject:&unk_26D51D0E8 forKey:@"SyncDataMigrationRevision"];
      id v9 = NSNumber;
      id v10 = [MEMORY[0x263EFF910] date];
      [v10 timeIntervalSinceReferenceDate];
      v11 = objc_msgSend(v9, "numberWithDouble:");
      [v3 setObject:v11 forKey:@"ModDate"];

      [v3 removeObjectForKey:@"MusicRecommendations"];
      id v12 = (id)[v3 synchronize];
      uint64_t v13 = NMLogForCategory(5);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Neither watch nor phone require the old musicRecommendations information anymore. Deleting it.", v17, 2u);
      }
    }
    id v14 = objc_alloc_init(MEMORY[0x263F57528]);
    uint64_t v15 = [v3 domain];
    uint64_t v16 = [MEMORY[0x263EFFA08] setWithObject:@"PhoneDefaultsCapabilities"];
    [v14 synchronizeNanoDomain:v15 keys:v16];
  }
  [(NMSyncDefaults *)self endBatchUpdates];
}

- (unint64_t)_spaceQuotaForNumberOfSongs:(unint64_t)a3
{
  unint64_t v3 = 2000;
  if (a3 < 0xC9) {
    unint64_t v3 = 1000;
  }
  if (a3 >= 0x65) {
    return v3;
  }
  else {
    return 500;
  }
}

- (id)_defaultPlaylistPersistentID
{
  unint64_t v3 = [(NMSyncDefaults *)self _playlistPersistentIDForPlaylistName:@"Recently Added"];
  if (!v3)
  {
    unint64_t v3 = [(NMSyncDefaults *)self _playlistPersistentIDForPlaylistName:@"Recently Played"];
    if (!v3) {
      unint64_t v3 = &unk_26D51D0D0;
    }
  }

  return v3;
}

- (id)_playlistPersistentIDForPlaylistName:(id)a3
{
  id v3 = a3;
  id v4 = MLFrameworkBundle();
  id v5 = [v4 localizedStringForKey:v3 value:&stru_26D512A48 table:@"MLLocalizable"];

  id v6 = [MEMORY[0x263F11E60] predicateWithValue:v5 forProperty:*MEMORY[0x263F11468] comparisonType:0];
  uint64_t v7 = [MEMORY[0x263F11E68] playlistsQuery];
  [v7 addFilterPredicate:v6];
  uint64_t v8 = [v7 collectionPersistentIdentifiers];
  id v9 = [v8 firstObject];

  return v9;
}

- (void)_setNeedsSynchronize
{
  if (!self->_needsSync)
  {
    self->_needsSync = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__NMSyncDefaults__setNeedsSynchronize__block_invoke;
    block[3] = &unk_264633B20;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __38__NMSyncDefaults__setNeedsSynchronize__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return [*(id *)(a1 + 32) _writePropertiesToDefaults];
}

- (void)_clearAssetSyncPlaylistDependentDefaults
{
  lastFullySentAssetSyncPlaylistPersistentID = self->_lastFullySentAssetSyncPlaylistPersistentID;
  self->_lastFullySentAssetSyncPlaylistPersistentID = 0;

  lastFullySentAssetSyncPlaylistVersion = self->_lastFullySentAssetSyncPlaylistVersion;
  self->_lastFullySentAssetSyncPlaylistVersion = 0;

  [(NMSyncDefaults *)self _setNeedsSynchronize];
}

- (NSNumber)assetSyncLimit
{
  assetSyncLimit = self->_assetSyncLimit;
  if (assetSyncLimit)
  {
    id v3 = assetSyncLimit;
  }
  else if (self->_assetSyncLimitType)
  {
    id v3 = (NSNumber *)&unk_26D51D118;
  }
  else
  {
    id v3 = (NSNumber *)&unk_26D51D100;
  }

  return v3;
}

- (void)setAssetSyncLimit:(id)a3
{
  id v4 = a3;
  uint64_t assetSyncLimit = (uint64_t)self->_assetSyncLimit;
  if ((id)assetSyncLimit != v4)
  {
    uint64_t v8 = v4;
    uint64_t assetSyncLimit = [(id)assetSyncLimit isEqual:v4];
    id v4 = v8;
    if ((assetSyncLimit & 1) == 0)
    {
      id v6 = (NSNumber *)[v8 copy];
      uint64_t v7 = self->_assetSyncLimit;
      self->_uint64_t assetSyncLimit = v6;

      uint64_t assetSyncLimit = [(NMSyncDefaults *)self _setNeedsSynchronize];
      id v4 = v8;
    }
  }

  MEMORY[0x270F9A758](assetSyncLimit, v4);
}

- (void)setAssetSyncLimitType:(unint64_t)a3
{
  if (self->_assetSyncLimitType != a3)
  {
    self->_assetSyncLimitType = a3;
    [(NMSyncDefaults *)self _setNeedsSynchronize];
  }
}

- (void)setAssetSyncType:(unint64_t)a3
{
  if (self->_assetSyncType != a3)
  {
    self->_assetSyncType = a3;
    [(NMSyncDefaults *)self _clearAssetSyncPlaylistDependentDefaults];
    [(NMSyncDefaults *)self _setNeedsSynchronize];
  }
}

- (void)setAssetSyncPlaylistPersistentID:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSNumber *)self->_assetSyncPlaylistPersistentID isEqualToNumber:v4])
  {
    if (v4) {
      id v5 = v4;
    }
    else {
      id v5 = &unk_26D51D0D0;
    }
    id v6 = v5;
    if ([v6 isEqualToNumber:&unk_26D51D0D0])
    {
      uint64_t v7 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      v10[0] = v6;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    }
    uint64_t v8 = (NSNumber *)[v6 copy];
    assetSyncPlaylistPersistentID = self->_assetSyncPlaylistPersistentID;
    self->_assetSyncPlaylistPersistentID = v8;

    [(NMSyncDefaults *)self setPinnedPlaylists:v7];
    [(NMSyncDefaults *)self _clearAssetSyncPlaylistDependentDefaults];
    [(NMSyncDefaults *)self _setNeedsSynchronize];
  }
}

- (void)setLastFullySentAssetSyncPlaylistPersistentID:(id)a3
{
  id v4 = a3;
  uint64_t lastFullySentAssetSyncPlaylistPersistentID = (uint64_t)self->_lastFullySentAssetSyncPlaylistPersistentID;
  if ((id)lastFullySentAssetSyncPlaylistPersistentID != v4)
  {
    uint64_t v8 = v4;
    uint64_t lastFullySentAssetSyncPlaylistPersistentID = [(id)lastFullySentAssetSyncPlaylistPersistentID isEqual:v4];
    id v4 = v8;
    if ((lastFullySentAssetSyncPlaylistPersistentID & 1) == 0)
    {
      id v6 = (NSNumber *)[v8 copy];
      uint64_t v7 = self->_lastFullySentAssetSyncPlaylistPersistentID;
      self->_uint64_t lastFullySentAssetSyncPlaylistPersistentID = v6;

      uint64_t lastFullySentAssetSyncPlaylistPersistentID = [(NMSyncDefaults *)self _setNeedsSynchronize];
      id v4 = v8;
    }
  }

  MEMORY[0x270F9A758](lastFullySentAssetSyncPlaylistPersistentID, v4);
}

- (void)setLastFullySentAssetSyncPlaylistVersion:(id)a3
{
  id v5 = a3;
  uint64_t lastFullySentAssetSyncPlaylistVersion = (uint64_t)self->_lastFullySentAssetSyncPlaylistVersion;
  if ((id)lastFullySentAssetSyncPlaylistVersion != v5)
  {
    id v7 = v5;
    uint64_t lastFullySentAssetSyncPlaylistVersion = [(id)lastFullySentAssetSyncPlaylistVersion isEqual:v5];
    id v5 = v7;
    if ((lastFullySentAssetSyncPlaylistVersion & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastFullySentAssetSyncPlaylistVersion, a3);
      uint64_t lastFullySentAssetSyncPlaylistVersion = [(NMSyncDefaults *)self _setNeedsSynchronize];
      id v5 = v7;
    }
  }

  MEMORY[0x270F9A758](lastFullySentAssetSyncPlaylistVersion, v5);
}

- (void)setPinnedPlaylists:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [MEMORY[0x263F573E8] midDataArrayFromPlaylistPIDs:v5];
  }
  else
  {
    id v4 = 0;
  }
  [(NMSyncDefaults *)self _setObject:v4 forKey:@"PinnedPlaylistMIDs"];
  [(NMSyncDefaults *)self _setLegacyObject:v5 forKey:@"PinnedPlaylists" ifRemoteDeviceMissingCapability:@"UsesMultiverseIdentifiers"];
}

- (NSNumber)workoutPlaylistID
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"WorkoutPlaylistMID"];
  id v3 = [MEMORY[0x263F573E8] pidFromMIDData:v2];

  return (NSNumber *)v3;
}

- (void)setWorkoutPlaylistID:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    id v5 = [MEMORY[0x263F573E8] midDataFromPlaylistPID:v4];
  }
  else
  {
    id v5 = 0;
  }
  [(NMSyncDefaults *)self _setObject:v5 forKey:@"WorkoutPlaylistMID"];
  [(NMSyncDefaults *)self _setLegacyObject:v6 forKey:@"WorkoutPlaylist" ifRemoteDeviceMissingCapability:@"UsesMultiverseIdentifiers"];
}

- (void)setPinnedAlbums:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [MEMORY[0x263F573E8] midDataArrayFromAlbumPIDs:v5];
  }
  else
  {
    id v4 = 0;
  }
  [(NMSyncDefaults *)self _setObject:v4 forKey:@"PinnedAlbumMIDs"];
  [(NMSyncDefaults *)self _setLegacyObject:v5 forKey:@"PinnedAlbums" ifRemoteDeviceMissingCapability:@"UsesMultiverseIdentifiers"];
}

- (BOOL)pinnedPodcastsAreUserSet
{
  return [(NMSyncDefaults *)self _BOOLForKey:@"PinnedPodcastsAreUserSet" defaultValue:0];
}

- (void)setPinnedPodcastsAreUserSet:(BOOL)a3
{
}

- (BOOL)savedEpisodesEnabled
{
  return [(NMSyncDefaults *)self _BOOLForKey:@"SavedEpisodesEnabled" defaultValue:0];
}

- (void)setSavedEpisodesEnabled:(BOOL)a3
{
}

- (NSArray)pinnedPodcastFeedURLs
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"PinnedPodcastFeedURLs"];
  id v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (void)setPinnedPodcastFeedURLs:(id)a3
{
}

- (NSArray)pinnedPodcastStationUUIDs
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"PinnedPodcastStationUUIDs"];
  id v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (void)setPinnedPodcastStationUUIDs:(id)a3
{
}

- (void)clearPodcastsDefaults
{
  id v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Clearing Podcasts defaults", v4, 2u);
  }

  [(NMSyncDefaults *)self _removeObjectForKey:@"PodcastDownloadOrders"];
  [(NMSyncDefaults *)self _removeObjectForKey:@"PodcastEpisodeLimits"];
  [(NMSyncDefaults *)self _removeObjectForKey:@"PinnedPodcastsAreUserSet"];
  [(NMSyncDefaults *)self _removeObjectForKey:@"ListenNowPodcastFeedURLs"];
  [(NMSyncDefaults *)self _removeObjectForKey:@"SavedEpisodesEnabled"];
  [(NMSyncDefaults *)self _removeObjectForKey:@"PinnedPodcastFeedURLs"];
  [(NMSyncDefaults *)self _removeObjectForKey:@"PinnedPodcastStationUUIDs"];
  [(NMSyncDefaults *)self _removeObjectForKey:@"PodcastSizeEstimationData"];
}

- (id)podcastSizeEstimationData
{
  return [(NMSyncDefaults *)self _objectForKey:@"PodcastSizeEstimationData"];
}

- (void)setPodcastSizeEstimationData:(id)a3
{
}

- (BOOL)wantToReadEnabled
{
  return [(NMSyncDefaults *)self _BOOLForKey:@"WantToReadEnabled" defaultValue:1];
}

- (void)setWantToReadEnabled:(BOOL)a3
{
}

- (NSArray)wantToReadAudiobooks
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"WantToReadAudiobooks"];
  id v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (void)setWantToReadAudiobooks:(id)a3
{
}

- (BOOL)readingNowEnabled
{
  return [(NMSyncDefaults *)self _BOOLForKey:@"ReadingNowEnabled" defaultValue:1];
}

- (void)setReadingNowEnabled:(BOOL)a3
{
}

- (NSArray)readingNowAudiobooks
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"ReadingNowAudiobooks"];
  id v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (void)setReadingNowAudiobooks:(id)a3
{
}

- (NSArray)pinnedAudiobooks
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"PinnedAudiobooks"];
  id v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (void)setPinnedAudiobooks:(id)a3
{
}

- (NSNumber)audiobookDownloadLimit
{
  return (NSNumber *)[(NMSyncDefaults *)self _objectForKey:@"AudiobookDownloadLimit"];
}

- (void)setAudiobookDownloadLimit:(id)a3
{
}

- (NSArray)libraryRecommendationAlbums
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"LibraryRecommendationAlbumMIDs"];
  id v3 = [MEMORY[0x263F573E8] pidsFromMIDDataArray:v2];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF8C0] array];
  }
  id v6 = v5;

  return (NSArray *)v6;
}

- (void)setLibraryRecommendationAlbums:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [MEMORY[0x263F573E8] midDataArrayFromAlbumPIDs:v5];
  }
  else
  {
    id v4 = 0;
  }
  [(NMSyncDefaults *)self _setObject:v4 forKey:@"LibraryRecommendationAlbumMIDs"];
  [(NMSyncDefaults *)self _setLegacyObject:v5 forKey:@"LibraryRecommendationAlbums" ifRemoteDeviceMissingCapability:@"UsesMultiverseIdentifiers"];
}

- (NSArray)libraryRecommendationPlaylists
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"LibraryRecommendationPlaylistMIDs"];
  id v3 = [MEMORY[0x263F573E8] pidsFromMIDDataArray:v2];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF8C0] array];
  }
  id v6 = v5;

  return (NSArray *)v6;
}

- (void)setLibraryRecommendationPlaylists:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [MEMORY[0x263F573E8] midDataArrayFromPlaylistPIDs:v5];
  }
  else
  {
    id v4 = 0;
  }
  [(NMSyncDefaults *)self _setObject:v4 forKey:@"LibraryRecommendationPlaylistMIDs"];
  [(NMSyncDefaults *)self _setLegacyObject:v5 forKey:@"LibraryRecommendationPlaylists" ifRemoteDeviceMissingCapability:@"UsesMultiverseIdentifiers"];
}

- (void)setMusicRecommendationDict:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __45__NMSyncDefaults_setMusicRecommendationDict___block_invoke;
    uint64_t v13 = &unk_264634628;
    id v14 = v6;
    id v15 = v7;
    id v8 = v7;
    id v9 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:&v10];
    [(NMSyncDefaults *)self _setObject:v8, @"StoreMusicRecommendationsToExclude", v10, v11, v12, v13 forKey];
  }
  else
  {
    [(NMSyncDefaults *)self _removeObjectForKey:@"StoreMusicRecommendationsToExclude"];
  }
  if ([(NMSyncDefaults *)self _continueUsingMusicRecommendationKey]) {
    [(NMSyncDefaults *)self _preSeed2_setMusicRecommendationDict:v5];
  }
}

void __45__NMSyncDefaults_setMusicRecommendationDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:v7];
  LOBYTE(v5) = [v6 BOOLValue];

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (BOOL)_continueUsingMusicRecommendationKey
{
  id v2 = [(NMSyncDefaults *)self _companionSidePerDeviceDefaults];
  id v3 = [v2 objectForKey:@"SyncDataMigrationRevision"];
  BOOL v4 = (unint64_t)[v3 unsignedIntegerValue] < 5;

  return v4;
}

- (void)_preSeed2_setMusicRecommendationDict:(id)a3
{
}

- (NSDate)libraryRecommendationExpirationDate
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"LibraryRecommendationExpirationDate"];
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = (void *)MEMORY[0x263EFF910];
    [v2 doubleValue];
    id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setLibraryRecommendationExpirationDate:(id)a3
{
  if (a3)
  {
    BOOL v4 = NSNumber;
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  [(NMSyncDefaults *)self _setObject:v5 forKey:@"LibraryRecommendationExpirationDate"];
}

- (NSDate)catalogRecommendationsLastUpdateDate
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"CatalogRecommendationsLastUpdateDate"];
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = (void *)MEMORY[0x263EFF910];
    [v2 doubleValue];
    uint64_t v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setCatalogRecommendationsLastUpdateDate:(id)a3
{
  if (a3)
  {
    BOOL v4 = NSNumber;
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  [(NMSyncDefaults *)self _setObject:v5 forKey:@"CatalogRecommendationsLastUpdateDate"];
}

- (void)setCachedRecommendationsData:(id)a3
{
}

- (NSNumber)minimumNumberOfRecentMusicModelObjects
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"MinimumNumberOfRecentMusicModelObjects"];
  id v3 = v2;
  if (!v2) {
    id v2 = &unk_26D51D130;
  }
  BOOL v4 = v2;

  return v4;
}

- (void)setMinimumNumberOfRecentMusicModelObjects:(id)a3
{
}

- (NSDictionary)clientPinningSettingsToken
{
  return (NSDictionary *)[(NMSyncDefaults *)self _objectForKey:@"ClientPinningSettingsToken"];
}

- (NSDictionary)syncStateDict
{
  return (NSDictionary *)[(NMSyncDefaults *)self _objectForKey:@"SyncStateDict"];
}

- (void)setClientPinningSettingsToken:(id)a3
{
}

- (NSDictionary)musicSyncInfo
{
  return (NSDictionary *)[(NMSyncDefaults *)self _objectForKey:@"MusicSyncInfo"];
}

- (NSDictionary)podcastsSyncInfo
{
  return (NSDictionary *)[(NMSyncDefaults *)self _objectForKey:@"PodcastsSyncInfo"];
}

- (NSDictionary)audiobooksSyncInfo
{
  return (NSDictionary *)[(NMSyncDefaults *)self _objectForKey:@"AudiobooksSyncInfo"];
}

- (id)_lastSyncInfoRequestDateWithPrefix:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v5 = [(NMSyncDefaults *)self _defaultWithPrefix:a3 forBundleIdentifier:a4];
  id v6 = [(NMSyncDefaults *)self _objectForKey:v5];
  id v7 = v6;
  id v8 = (void *)MEMORY[0x263EFF910];
  if (v6)
  {
    [v6 doubleValue];
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [MEMORY[0x263EFF910] distantPast];
  id v9 = };

  return v9;
}

- (void)_setLastSyncInfoRequestDate:(id)a3 prefix:(id)a4 forBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v13 = [(NMSyncDefaults *)self _defaultWithPrefix:a4 forBundleIdentifier:a5];
  id v9 = NSNumber;
  [v8 timeIntervalSinceReferenceDate];
  double v11 = v10;

  id v12 = [v9 numberWithDouble:v11];
  [(NMSyncDefaults *)self _setObject:v12 forKey:v13];
}

- (id)lastSyncInfoRequestDateForBundleIdentifier:(id)a3
{
  return [(NMSyncDefaults *)self _lastSyncInfoRequestDateWithPrefix:@"LastSyncInfoRequestDate" forBundleIdentifier:a3];
}

- (void)setLastSyncInfoRequestDate:(id)a3 forBundleIdentifier:(id)a4
{
}

- (BOOL)debugSyncInfoEnabled
{
  id v2 = [(NMSyncDefaults *)self _objectForKey:@"DebugSyncInfoEnabled"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_dateValueForKey:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NMSyncDefaults *)self _objectForKey:@"AppActivityStatus"];
  id v9 = [v8 objectForKey:v6];

  double v10 = [v9 objectForKey:v7];

  return v10;
}

- (void)_writeDate:(id)a3 forKey:(id)a4 bundleID:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [(NMSyncDefaults *)self _objectForKey:@"AppActivityStatus"];
  if (v10)
  {
    double v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
    id v12 = [v11 objectForKey:v9];
    id v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v12];
    [v13 setObject:v14 forKey:v8];
    [v11 setObject:v13 forKey:v9];

    id v9 = v13;
  }
  else
  {
    id v12 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v14 forKey:v8];
    double v11 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v12 forKey:v9];
  }

  [(NMSyncDefaults *)self _setObject:v11 forKey:@"AppActivityStatus"];
}

- (void)clearAppActivityStatusDefaultsForBundleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Clearing app activity status defaults for %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(NMSyncDefaults *)self _objectForKey:@"AppActivityStatus"];
  id v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
  [v7 removeObjectForKey:v4];
  [(NMSyncDefaults *)self _setObject:v7 forKey:@"AppActivityStatus"];
}

- (void)setLastUserLaunchDateForBundleID:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  [(NMSyncDefaults *)self _writeDate:v6 forKey:@"LastUserLaunchDate" bundleID:v5];
}

- (void)setLastUserPinningChangeDateForBundleID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [(NMSyncDefaults *)self _writeDate:v5 forKey:@"LastUserPinningChangeDate" bundleID:v4];

  id v6 = NMLogForCategory(12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Set last user pinning change date for bundle %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setLastLocalPlaybackDateForBundleID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [(NMSyncDefaults *)self _writeDate:v5 forKey:@"LastLocalPlaybackDate" bundleID:v4];

  id v6 = NMLogForCategory(12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Set last local playback date for bundle %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setInstallDateForBundleID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [(NMSyncDefaults *)self _writeDate:v5 forKey:@"InstallDate" bundleID:v4];

  id v6 = NMLogForCategory(12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Set install date for bundle %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setLastContentUsedDateForBundleID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [(NMSyncDefaults *)self _writeDate:v5 forKey:@"LastContentUsedDate" bundleID:v4];

  id v6 = NMLogForCategory(12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Set last content used date for bundle %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)lastUserLaunchDateForBundleID:(id)a3
{
  return [(NMSyncDefaults *)self _dateValueForKey:@"LastUserLaunchDate" bundleID:a3];
}

- (id)lastUserPinningChangeDateForBundleID:(id)a3
{
  return [(NMSyncDefaults *)self _dateValueForKey:@"LastUserPinningChangeDate" bundleID:a3];
}

- (id)lastLocalPlaybackDateForBundleID:(id)a3
{
  return [(NMSyncDefaults *)self _dateValueForKey:@"LastLocalPlaybackDate" bundleID:a3];
}

- (id)installDateForBundleID:(id)a3
{
  return [(NMSyncDefaults *)self _dateValueForKey:@"InstallDate" bundleID:a3];
}

- (id)lastContentUsedDateForBundleID:(id)a3
{
  return [(NMSyncDefaults *)self _dateValueForKey:@"LastContentUsedDate" bundleID:a3];
}

- (int64_t)dormancyIntervalInHoursForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(NMSyncDefaults *)self _objectForKey:@"AppActivityStatus"];
  id v6 = [v5 objectForKey:v4];

  int v7 = [v6 objectForKey:@"HoursUntilDormant"];
  id v8 = v7;
  if (v7) {
    int64_t v9 = [v7 integerValue];
  }
  else {
    int64_t v9 = 504;
  }

  return v9;
}

- (id)_defaultWithPrefix:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  int v7 = [v5 stringWithFormat:@"-%@", a4];
  id v8 = [v6 stringByAppendingString:v7];

  return v8;
}

- (id)_objectForKey:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F57520];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithDomain:@"com.apple.NanoMusicSync"];
  id v6 = (id)[v5 synchronize];
  int v7 = [v5 objectForKey:v4];

  return v7;
}

- (void)_setLegacyObject:(id)a3 forKey:(id)a4 ifRemoteDeviceMissingCapability:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  BOOL v9 = [(NMSyncDefaults *)self _watchHasCapability:a5];
  if (!v10 || v9) {
    [(NMSyncDefaults *)self _removeObjectForKey:v8];
  }
  else {
    [(NMSyncDefaults *)self _setObject:v10 forKey:v8];
  }
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
}

- (void)_setObject:(id)a3 forKey:(id)a4 shouldSynchronizeToPairedDevice:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoMusicSync"];
    double v11 = v10;
    if (v10)
    {
      id v12 = (id)[v10 synchronize];
      id v13 = [v11 objectForKey:v9];
      if (([v8 isEqual:v13] & 1) == 0)
      {
        [v11 setObject:v8 forKey:v9];
        id v14 = (id)[v11 synchronize];
        if (v5)
        {
          id v15 = objc_alloc_init(MEMORY[0x263F57528]);
          uint64_t v16 = [MEMORY[0x263EFFA08] setWithObject:v9];
          [v15 synchronizeNanoDomain:@"com.apple.NanoMusicSync" keys:v16];
        }
        uint64_t v17 = NMLogForCategory(5);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412802;
          id v19 = v9;
          __int16 v20 = 2112;
          v21 = v13;
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_impl(&dword_2228FD000, v17, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] updated value for key: %@ from old value: %@ to new value: %@", (uint8_t *)&v18, 0x20u);
        }

        [(NMSyncDefaults *)self _notifyChangesForKey:v9];
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    [(NMSyncDefaults *)self _removeObjectForKey:v9];
  }
}

- (void)_removeObjectForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoMusicSync"];
  id v6 = (id)[v5 synchronize];
  if (v5)
  {
    int v7 = [v5 objectForKey:v4];

    if (v7)
    {
      [v5 removeObjectForKey:v4];
      id v8 = (id)[v5 synchronize];
      id v9 = objc_alloc_init(MEMORY[0x263F57528]);
      id v10 = [MEMORY[0x263EFFA08] setWithObject:v4];
      [v9 synchronizeNanoDomain:@"com.apple.NanoMusicSync" keys:v10];

      double v11 = NMLogForCategory(5);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Removing value for key: %@", (uint8_t *)&v12, 0xCu);
      }

      [(NMSyncDefaults *)self _notifyChangesForKey:v4];
    }
  }
}

- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  BOOL v5 = (objc_class *)MEMORY[0x263F57520];
  id v6 = a3;
  int v7 = (void *)[[v5 alloc] initWithDomain:@"com.apple.NanoMusicSync"];
  id v8 = (id)[v7 synchronize];
  char v11 = 0;
  char v9 = [v7 BOOLForKey:v6 keyExistsAndHasValidFormat:&v11];

  if (v11) {
    a4 = v9;
  }

  return a4;
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoMusicSync"];
  id v8 = v7;
  if (v7)
  {
    id v9 = (id)[v7 synchronize];
    LOBYTE(v17) = 0;
    int v10 = [v8 BOOLForKey:v6 keyExistsAndHasValidFormat:&v17];
    int v11 = v10;
    if (!(_BYTE)v17 || v10 != v4)
    {
      int v12 = [NSNumber numberWithBool:v4];
      [v8 setObject:v12 forKey:v6];

      id v13 = (id)[v8 synchronize];
      id v14 = objc_alloc_init(MEMORY[0x263F57528]);
      id v15 = [MEMORY[0x263EFFA08] setWithObject:v6];
      [v14 synchronizeNanoDomain:@"com.apple.NanoMusicSync" keys:v15];

      uint64_t v16 = NMLogForCategory(5);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412802;
        id v18 = v6;
        __int16 v19 = 1024;
        int v20 = v11;
        __int16 v21 = 1024;
        BOOL v22 = v4;
        _os_log_impl(&dword_2228FD000, v16, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Updated value for key: %@ from old value: %d to new value: %d", (uint8_t *)&v17, 0x18u);
      }

      [(NMSyncDefaults *)self _notifyChangesForKey:v6];
    }
  }
}

- (void)_notifyChangesForKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NSDictionary *)self->_notifiersDict objectForKeyedSubscript:a3];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) scheduleLocalDarwinNotification];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSNumber)lastFullySentAssetSyncPlaylistPersistentID
{
  return self->_lastFullySentAssetSyncPlaylistPersistentID;
}

- (NSNumber)lastFullySentAssetSyncPlaylistVersion
{
  return self->_lastFullySentAssetSyncPlaylistVersion;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setMusicSyncInfo:(id)a3
{
}

- (void)setPodcastsSyncInfo:(id)a3
{
}

- (void)setAudiobooksSyncInfo:(id)a3
{
}

- (unint64_t)assetSyncLimitType
{
  return self->_assetSyncLimitType;
}

- (unint64_t)assetSyncType
{
  return self->_assetSyncType;
}

- (NSNumber)assetSyncPlaylistPersistentID
{
  return self->_assetSyncPlaylistPersistentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSyncPlaylistPersistentID, 0);
  objc_storeStrong((id *)&self->_audiobooksSyncInfo, 0);
  objc_storeStrong((id *)&self->_podcastsSyncInfo, 0);
  objc_storeStrong((id *)&self->_musicSyncInfo, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastFullySentAssetSyncPlaylistVersion, 0);
  objc_storeStrong((id *)&self->_lastFullySentAssetSyncPlaylistPersistentID, 0);
  objc_storeStrong((id *)&self->_assetSyncLimit, 0);
  objc_storeStrong((id *)&self->_syncInfoRequestDateNotifier, 0);
  objc_storeStrong((id *)&self->_syncInfoNotifier, 0);
  objc_storeStrong((id *)&self->_syncStateNotifier, 0);
  objc_storeStrong((id *)&self->_audiobooksRecommendationsNotifier, 0);
  objc_storeStrong((id *)&self->_audiobooksPinningSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_podcastsPinningSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_storeRecoNotifier, 0);
  objc_storeStrong((id *)&self->_libraryRecoNotifier, 0);
  objc_storeStrong((id *)&self->_recoSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_musicPinningSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_settingsNotifier, 0);
  objc_storeStrong((id *)&self->_notifiersDict, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_domainAccessorQueue, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

- (MPMediaPlaylist)assetSyncPlaylist
{
  if (self->_assetSyncType == 1)
  {
    BOOL v3 = [(NMSyncDefaults *)self assetSyncPlaylistPersistentID];
    if (v3)
    {
      uint64_t v4 = [(NMSyncDefaults *)self _associatedObject];
      uint64_t v5 = [v4 assetSyncPlaylist];

      if (v5 && (uint64_t v6 = [v3 unsignedLongLongValue], v6 == objc_msgSend(v5, "persistentID")))
      {
        id v7 = v5;
      }
      else
      {
        long long v8 = [MEMORY[0x263F11E60] predicateWithValue:v3 forProperty:*MEMORY[0x263F11478]];
        long long v9 = [MEMORY[0x263F11E68] playlistsQuery];
        [v9 addFilterPredicate:v8];
        long long v10 = [v9 collections];
        long long v11 = [v10 firstObject];

        int v12 = [(NMSyncDefaults *)self _associatedObject];
        [v12 setAssetSyncPlaylist:v11];

        id v7 = v11;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (MPMediaPlaylist *)v7;
}

- (void)setAssetSyncPlaylist:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(NMSyncDefaults *)self _associatedObject];
  [v4 setAssetSyncPlaylist:v6];

  if (v6)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "persistentID"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(NMSyncDefaults *)self setAssetSyncPlaylistPersistentID:v5];
}

- (id)_associatedObject
{
  BOOL v3 = objc_getAssociatedObject(self, sel__associatedObject);
  if (!v3)
  {
    BOOL v3 = objc_opt_new();
    objc_setAssociatedObject(self, sel__associatedObject, v3, (void *)1);
  }

  return v3;
}

@end