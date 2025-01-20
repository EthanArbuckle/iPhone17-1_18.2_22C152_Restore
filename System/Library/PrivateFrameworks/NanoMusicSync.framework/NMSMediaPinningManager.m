@interface NMSMediaPinningManager
+ (BOOL)_playlistPIDValidForPinning:(id)a3;
+ (id)_cachedAlbumIdentifiersFilePath;
+ (id)_cachedAudiobookIdentifiersFilePath;
+ (id)_cachedIdentifiersDirectoryPath;
+ (id)_cachedPlaylistIdentifiersFilePath;
+ (id)_fetchMusicRecommendations;
+ (id)_tokenForInstance:(id)a3;
+ (id)sharedManager;
+ (unint64_t)_mediaStorageSizeForCurrentDevice;
+ (void)_mediaStorageSizeForCurrentDevice;
+ (void)_persistNewClientToken;
- (BOOL)_deviceSupportsPodcastsPinningSettingsV2;
- (BOOL)_isAlbumPinned:(id)a3;
- (BOOL)_isAppDownloadingDormantForBundleIdentifier:(id)a3;
- (BOOL)_isAudiobookPinned:(id)a3;
- (BOOL)_isPlaylistPinned:(id)a3;
- (BOOL)_legacy_musicIsOutOfSpace;
- (BOOL)_requiresICEnvironmentMonitor;
- (BOOL)_shouldCalculateCachedIdentifiers;
- (BOOL)_shouldIncludeMusicManualDownloadsInQuotaEvaluation;
- (BOOL)_shouldSkipQuotaManagerEvaluation;
- (BOOL)isAlbumPinned:(id)a3;
- (BOOL)isAudiobookPinned:(id)a3;
- (BOOL)isItemGroupWithinQuota:(id)a3;
- (BOOL)isPlaylistPinned:(id)a3;
- (BOOL)isReadingNowEnabled;
- (BOOL)isWantToReadEnabled;
- (BOOL)pinnedPodcastsAreUserSet;
- (BOOL)savedEpisodesEnabled;
- (NMSMediaDownloadInfo)downloadInfo;
- (NMSMediaPinningManager)init;
- (NMSPodcastsDownloadSettings)podcastsSavedEpisodesDownloadSettings;
- (NMSPodcastsDownloadSettings)podcastsUpNextDownloadSettings;
- (NSArray)albumIdentifiers;
- (NSArray)audiobookIdentifiers;
- (NSArray)pinnedAlbums;
- (NSArray)pinnedPlaylists;
- (NSArray)playlistIdentifiers;
- (NSArray)podcastFeedURLs;
- (NSArray)podcastStationUUIDs;
- (NSNumber)workoutPlaylistID;
- (NSOrderedSet)pinnedAudiobooks;
- (NSOrderedSet)readingNowAudiobooks;
- (NSOrderedSet)wantToReadAudiobooks;
- (NSSet)podcastsSelectedShowFeedURLs;
- (NSSet)podcastsSelectedStationUUIDs;
- (double)_audiobookDownloadLimit;
- (double)audiobookDownloadLimit;
- (id)_legacy_newAudiobooksGroupIteratorWithDownloadedItemsOnly:(BOOL)a3;
- (id)_legacy_newGroupIteratorForBundleIdentifier:(id)a3 downloadedItemsOnly:(BOOL)a4;
- (id)_legacy_newMusicGroupIteratorWithDownloadedItemsOnly:(BOOL)a3;
- (id)_legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:(BOOL)a3;
- (id)_legacy_quotaManagerWithDownloadedItemsOnly:(BOOL)a3;
- (id)_newAudiobooksEnumeratorWithDownloadedItemsOnly:(BOOL)a3;
- (id)_newItemEnumeratorForBundleIdentifier:(id)a3 downloadedItemsOnly:(BOOL)a4;
- (id)_newMusicEnumeratorWithDownloadedItemsOnly:(BOOL)a3;
- (id)_quotaManagerWithDownloadedItemsOnly:(BOOL)a3;
- (id)downloadInfoForBundleIdentifier:(id)a3;
- (id)downloadInfoWithinAvailableSpace:(unint64_t)a3;
- (id)podcastsDownloadSettingsForShowFeedURL:(id)a3;
- (id)podcastsDownloadSettingsForStationUUID:(id)a3;
- (unint64_t)_mediaQuota;
- (void)_fetchAudiobooksIdentifiers;
- (void)_fetchMusicIdentifiers;
- (void)_handleAudiobooksPinningSelectionsDidChangeNotification:(id)a3;
- (void)_handleAudiobooksRecommendationsDidChangeNotification:(id)a3;
- (void)_handleICAgeVerificationStateDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryDynamicPropertiesDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryEntitiesAddedOrRemovedNotification:(id)a3;
- (void)_handleMediaPinningAudiobooksContentsInvalidatedNotification:(id)a3;
- (void)_handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification:(id)a3;
- (void)_handleMediaPinningManagerMusicIdentifiersDidChangeNotification:(id)a3;
- (void)_handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification:(id)a3;
- (void)_handleMediaPinningMusicContentsInvalidatedNotification:(id)a3;
- (void)_handleMediaPinningPodcastsContentsInvalidatedNotification:(id)a3;
- (void)_handleMusicPinningSelectionsDidChangeNotification:(id)a3;
- (void)_handlePairedDeviceDidBecomeActiveNotification:(id)a3;
- (void)_handlePodcastSizeInfoDidChangeNotification:(id)a3;
- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3;
- (void)_handleRecommendationLibraryContentsDidChangeNotification:(id)a3;
- (void)_handleRecommendationSelectionsDidChangeNotification:(id)a3;
- (void)_handleRecommendationsDidUpdateNotification:(id)a3;
- (void)_invalidateAddedItemsCache;
- (void)_invalidateMediaCacheForAppIdentifiers:(unint64_t)a3;
- (void)_legacy_refreshAudiobooksIdentifiers;
- (void)_legacy_refreshMusicIdentifiers;
- (void)_legacy_refreshPodcastsIdentifiers;
- (void)_notePinningSettingsChangedLocally;
- (void)_refreshAudiobooksIdentifiers;
- (void)_refreshMusicIdentifiers;
- (void)_refreshPodcastsIdentifiers;
- (void)_setWorkoutPlaylistID:(id)a3;
- (void)_updateWorkoutSettingsPlaylistPIDTo:(id)a3;
- (void)dealloc;
- (void)downloadableContentProviderDidChangeContent:(id)a3;
- (void)extensionAccessDidChange;
- (void)invalidateAudiobooksCache;
- (void)invalidateMusicCache;
- (void)invalidatePodcastsCache;
- (void)pinAlbum:(id)a3 completionHandler:(id)a4;
- (void)pinAudiobook:(id)a3;
- (void)pinPlaylist:(id)a3 completionHandler:(id)a4;
- (void)pinPodcastStationWithUUID:(id)a3;
- (void)pinPodcastWithFeedURL:(id)a3;
- (void)podcastsDownloadableContentControllerContentDidChange:(id)a3;
- (void)setAudiobookDownloadLimit:(double)a3;
- (void)setAvailableSpace:(unint64_t)a3;
- (void)setPinnedPodcastsAreUserSet:(BOOL)a3;
- (void)setPodcastsDownloadSettings:(id)a3 forShowFeedURL:(id)a4;
- (void)setPodcastsDownloadSettings:(id)a3 forStationUUID:(id)a4;
- (void)setPodcastsSavedEpisodesDownloadSettings:(id)a3;
- (void)setPodcastsUpNextDownloadSettings:(id)a3;
- (void)setReadingNowAudiobooks:(id)a3;
- (void)setReadingNowEnabled:(BOOL)a3;
- (void)setSavedEpisodesEnabled:(BOOL)a3;
- (void)setWantToReadAudiobooks:(id)a3;
- (void)setWantToReadEnabled:(BOOL)a3;
- (void)setWorkoutPlaylistID:(id)a3;
- (void)unpinAlbum:(id)a3 completionHandler:(id)a4;
- (void)unpinAudiobook:(id)a3;
- (void)unpinPlaylist:(id)a3 completionHandler:(id)a4;
- (void)unpinPodcastStationWithUUID:(id)a3;
- (void)unpinPodcastWithFeedURL:(id)a3;
@end

@implementation NMSMediaPinningManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NMSMediaPinningManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager___sharedMananger;

  return v2;
}

uint64_t __39__NMSMediaPinningManager_sharedManager__block_invoke()
{
  sharedManager___sharedMananger = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NMSMediaPinningManager)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)NMSMediaPinningManager;
  v2 = [(NMSMediaPinningManager *)&v24 init];
  if (v2)
  {
    uint64_t v3 = +[NMSyncDefaults sharedDefaults];
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NMSyncDefaults *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NanoMusicSync.MediaPinning", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    if ([(NMSMediaPinningManager *)v2 _shouldCalculateCachedIdentifiers]
      || ![(NMSMediaPinningManager *)v2 _shouldSkipQuotaManagerEvaluation])
    {
      if ([(NMSMediaPinningManager *)v2 _deviceSupportsPodcastsPinningSettingsV2])
      {
        v12 = objc_alloc_init(NMSPodcastsDownloadableContentProvider);
        podcastsDownloadableContentProvider = v2->_podcastsDownloadableContentProvider;
        v2->_podcastsDownloadableContentProvider = v12;

        [(NMSPodcastsDownloadableContentProvider *)v2->_podcastsDownloadableContentProvider setDelegate:v2];
LABEL_10:
        [v8 addObserver:v2 selector:sel__handlePodcastsPinningSelectionsDidChangeNotification_ name:@"com.apple.nanomusicsync.podcasts-pinning-selections" object:0];
        [v8 addObserver:v2 selector:sel__handleMusicPinningSelectionsDidChangeNotification_ name:@"com.apple.nanomusicsync.music-pinning-selections" object:0];
        [v8 addObserver:v2 selector:sel__handleRecommendationLibraryContentsDidChangeNotification_ name:@"com.apple.nanomusicsync.reco-library" object:0];
        [v8 addObserver:v2 selector:sel__handleRecommendationsDidUpdateNotification_ name:@"NMSMusicRecommendationsDidUpdateNotification" object:0];
        [v8 addObserver:v2 selector:sel__handleAudiobooksPinningSelectionsDidChangeNotification_ name:@"com.apple.nanomusicsync.audiobooks-pinning-selections" object:0];
        [v8 addObserver:v2 selector:sel__handleAudiobooksRecommendationsDidChangeNotification_ name:@"com.apple.nanomusicsync.audiobooks-recommendations" object:0];
        [v8 addObserver:v2 selector:sel__handleICAgeVerificationStateDidChangeNotification_ name:*MEMORY[0x263F88EA0] object:0];
        [v8 addObserver:v2 selector:sel__handleRecommendationSelectionsDidChangeNotification_ name:@"com.apple.nanomusicsync.reco-selections" object:0];
        [v8 addObserver:v2 selector:sel__handlePairedDeviceDidBecomeActiveNotification_ name:*MEMORY[0x263F57688] object:0];
        [v8 addObserver:v2 selector:sel__handleMediaLibraryDidChangeNotification_ name:*MEMORY[0x263F11418] object:0];
        [v8 addObserver:v2 selector:sel__handleMediaLibraryDynamicPropertiesDidChangeNotification_ name:*MEMORY[0x263F11428] object:0];
        v16 = [MEMORY[0x263F11E40] defaultMediaLibrary];
        [v16 beginGeneratingLibraryChangeNotifications];

        v17 = [MEMORY[0x263F087C8] defaultCenter];
        [v17 addObserver:v2 selector:sel__handleMediaPinningMusicContentsInvalidatedNotification_ name:@"NMSMediaPinningMusicContentsInvalidatedNotification" object:0];

        v18 = [MEMORY[0x263F087C8] defaultCenter];
        [v18 addObserver:v2 selector:sel__handleMediaPinningPodcastsContentsInvalidatedNotification_ name:@"NMSMediaPinningPodcastsContentsInvalidatedNotification" object:0];

        v19 = [MEMORY[0x263F087C8] defaultCenter];
        [v19 addObserver:v2 selector:sel__handleMediaPinningAudiobooksContentsInvalidatedNotification_ name:@"NMSMediaPinningAudiobooksContentsInvalidatedNotification" object:0];

        v20 = [MEMORY[0x263F087C8] defaultCenter];
        [v20 addObserver:v2 selector:sel__handleMediaPinningManagerMusicIdentifiersDidChangeNotification_ name:@"NMSMediaPinningManagerMusicIdentifiersDidChangeNotification" object:0];

        v21 = [MEMORY[0x263F087C8] defaultCenter];
        [v21 addObserver:v2 selector:sel__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification_ name:@"NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification" object:0];

        v22 = [MEMORY[0x263F087C8] defaultCenter];
        [v22 addObserver:v2 selector:sel__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification_ name:@"NMSMediaPinningManagerAudiobooksIdentifiersDidChangeNotification" object:0];

        return v2;
      }
      v14 = objc_alloc_init(NMSPodcastsDownloadableContentController_Legacy);
      legacy_podcastsDownloadableContentController = v2->_legacy_podcastsDownloadableContentController;
      v2->_legacy_podcastsDownloadableContentController = v14;

      [(NMSPodcastsDownloadableContentController_Legacy *)v2->_legacy_podcastsDownloadableContentController setDelegate:v2];
      v9 = [MEMORY[0x263F5E9D8] sharedInstance];
      [v9 addObserver:v2];
    }
    else
    {
      v9 = NMLogForCategory(5);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = [(NMSMediaPinningManager *)v2 _shouldCalculateCachedIdentifiers];
        BOOL v11 = [(NMSMediaPinningManager *)v2 _shouldSkipQuotaManagerEvaluation];
        *(_DWORD *)buf = 67109376;
        BOOL v26 = v10;
        __int16 v27 = 1024;
        BOOL v28 = v11;
        _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "Not creating NMSPodcastsDownloadableContentProvider. _shouldCalculateCachedIdentifiers %x _shouldSkipQuotaManagerEvaluation %x", buf, 0xEu);
      }
    }

    goto LABEL_10;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F11E40] defaultMediaLibrary];
  [v3 endGeneratingLibraryChangeNotifications];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NMSMediaPinningManager;
  [(NMSMediaPinningManager *)&v5 dealloc];
}

- (id)downloadInfoWithinAvailableSpace:(unint64_t)a3
{
  [(NMSMediaPinningManager *)self setAvailableSpace:a3];

  return [(NMSMediaPinningManager *)self downloadInfo];
}

- (void)setAvailableSpace:(unint64_t)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__NMSMediaPinningManager_setAvailableSpace___block_invoke;
  v4[3] = &unk_264634338;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __44__NMSMediaPinningManager_setAvailableSpace___block_invoke(uint64_t a1)
{
  unint64_t v2 = [(id)objc_opt_class() _mediaStorageSizeForCurrentDevice];
  if (v2 >= *(void *)(a1 + 40)) {
    unint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    unint64_t v3 = v2;
  }
  uint64_t result = [*(id *)(a1 + 32) _mediaQuota];
  if (result - v3 >= 0x4C4B41)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:v3];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 32);
    return [v8 _invalidateAddedItemsCache];
  }
  return result;
}

- (NMSMediaDownloadInfo)downloadInfo
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  if ([(NMSMediaPinningManager *)self _deviceSupportsPodcastsPinningSettingsV2])
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__NMSMediaPinningManager_downloadInfo__block_invoke_2;
    v7[3] = &unk_264634248;
    v7[4] = self;
    v7[5] = &v9;
    v4 = v7;
  }
  else
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__NMSMediaPinningManager_downloadInfo__block_invoke;
    block[3] = &unk_264634248;
    block[4] = self;
    void block[5] = &v9;
    v4 = block;
  }
  dispatch_sync(internalQueue, v4);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NMSMediaDownloadInfo *)v5;
}

void __38__NMSMediaPinningManager_downloadInfo__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = [MEMORY[0x263F89110] sharedMonitor];
  objc_msgSend(v2, "_legacy_quotaManagerWithDownloadedItemsOnly:", objc_msgSend(v3, "isCharging") ^ 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [v7 downloadInfoWithinQuota];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __38__NMSMediaPinningManager_downloadInfo__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = [MEMORY[0x263F89110] sharedMonitor];
  objc_msgSend(v2, "_quotaManagerWithDownloadedItemsOnly:", objc_msgSend(v3, "isCharging") ^ 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [v7 downloadInfoWithinQuota];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)downloadInfoForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NMSMediaPinningManager *)self _deviceSupportsPodcastsPinningSettingsV2];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke_2;
    v11[3] = &unk_264634360;
    id v12 = v4;
    v13 = &v17;
    v11[4] = self;
    id v7 = v4;
    dispatch_sync(internalQueue, v11);
    id v8 = (id)v18[5];
    uint64_t v9 = v12;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke;
    block[3] = &unk_264634360;
    id v15 = v4;
    v16 = &v17;
    block[4] = self;
    id v7 = v4;
    dispatch_sync(internalQueue, block);
    id v8 = (id)v18[5];
    uint64_t v9 = v15;
  }

  _Block_object_dispose(&v17, 8);

  return v8;
}

void __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 downloadInfoWithinQuotaForBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _quotaManagerWithDownloadedItemsOnly:0];
  uint64_t v2 = [v5 downloadInfoWithinQuotaForBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isItemGroupWithinQuota:(id)a3
{
  id v4 = a3;
  if ([(NMSMediaPinningManager *)self _deviceSupportsPodcastsPinningSettingsV2])
  {
    id v5 = [(NMSMediaPinningManager *)self _quotaManagerWithDownloadedItemsOnly:0];
    uint64_t v6 = [v5 downloadInfoWithinQuota];

    id v7 = [[NMSItemGroupEnumerator alloc] initWithItemGroup:v4];
    uint64_t v8 = [(NMSItemGroupEnumerator *)v7 nextItem];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      do
      {
        LODWORD(internalQueue) = [v6 containsItem:v9];
        if (!internalQueue) {
          break;
        }
        uint64_t v11 = [(NMSItemGroupEnumerator *)v7 nextItem];

        uint64_t v9 = (void *)v11;
      }
      while (v11);
    }
    else
    {
      LOBYTE(internalQueue) = 1;
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__NMSMediaPinningManager_isItemGroupWithinQuota___block_invoke;
    block[3] = &unk_264634360;
    id v15 = &v16;
    block[4] = self;
    id v14 = v4;
    dispatch_sync(internalQueue, block);
    LOBYTE(internalQueue) = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return (char)internalQueue;
}

void __49__NMSMediaPinningManager_isItemGroupWithinQuota___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isItemGroupWithinQuota:*(void *)(a1 + 40)];
}

- (void)invalidateMusicCache
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NMSMediaPinningManager_invalidateMusicCache__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __46__NMSMediaPinningManager_invalidateMusicCache__block_invoke(uint64_t a1)
{
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Music cache. [External]", v4, 2u);
  }

  return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:1];
}

- (NSNumber)workoutPlaylistID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  BOOL v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) workoutPlaylistID];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(unsigned char *)(*(void *)(a1 + 32) + 113))
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) longLongValue]
      && ([(id)objc_opt_class() _playlistPIDValidForPinning:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
    {
      uint64_t v6 = NMLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke_cold_1(a1 + 40, v6, v7, v8, v9, v10, v11, v12);
      }

      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;

      [*(id *)(a1 + 32) _setWorkoutPlaylistID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
  }
}

- (void)invalidatePodcastsCache
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NMSMediaPinningManager_invalidatePodcastsCache__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __49__NMSMediaPinningManager_invalidatePodcastsCache__block_invoke(uint64_t a1)
{
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Podcasts cache. [External]", v4, 2u);
  }

  return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:2];
}

- (NMSPodcastsDownloadSettings)podcastsUpNextDownloadSettings
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__NMSMediaPinningManager_podcastsUpNextDownloadSettings__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSPodcastsDownloadSettings *)v3;
}

void __56__NMSMediaPinningManager_podcastsUpNextDownloadSettings__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"PodcastsUpNextDownloadSettings"];
  id v2 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:0 dictionary:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPodcastsUpNextDownloadSettings:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__NMSMediaPinningManager_setPodcastsUpNextDownloadSettings___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __60__NMSMediaPinningManager_setPodcastsUpNextDownloadSettings___block_invoke(uint64_t a1)
{
  id v4 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:0 legacyDownloadSettings:*(void *)(a1 + 32)];
  id v2 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = [(NMSPodcastsDownloadSettings *)v4 dictionaryRepresentation];
  [v2 setObject:v3 forKey:@"PodcastsUpNextDownloadSettings"];

  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
}

- (NMSPodcastsDownloadSettings)podcastsSavedEpisodesDownloadSettings
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__NMSMediaPinningManager_podcastsSavedEpisodesDownloadSettings__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSPodcastsDownloadSettings *)v3;
}

void __63__NMSMediaPinningManager_podcastsSavedEpisodesDownloadSettings__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"PodcastsSavedEpisodesDownloadSettings"];
  id v2 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:1 dictionary:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPodcastsSavedEpisodesDownloadSettings:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NMSMediaPinningManager_setPodcastsSavedEpisodesDownloadSettings___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __67__NMSMediaPinningManager_setPodcastsSavedEpisodesDownloadSettings___block_invoke(uint64_t a1)
{
  id v4 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:1 legacyDownloadSettings:*(void *)(a1 + 32)];
  id v2 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = [(NMSPodcastsDownloadSettings *)v4 dictionaryRepresentation];
  [v2 setObject:v3 forKey:@"PodcastsSavedEpisodesDownloadSettings"];

  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
}

- (id)podcastsDownloadSettingsForStationUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NMSMediaPinningManager_podcastsDownloadSettingsForStationUUID___block_invoke;
  block[3] = &unk_2646343B0;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __65__NMSMediaPinningManager_podcastsDownloadSettingsForStationUUID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKey:@"PodcastsStationDownloadSettings"];
  id v6 = [v2 objectForKey:a1[5]];

  uint64_t v3 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:2 dictionary:v6];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setPodcastsDownloadSettings:(id)a3 forStationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forStationUUID___block_invoke;
  block[3] = &unk_2646343D8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forStationUUID___block_invoke(uint64_t a1)
{
  id v10 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:2 legacyDownloadSettings:*(void *)(a1 + 32)];
  id v2 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:@"PodcastsStationDownloadSettings"];
  uint64_t v3 = (void *)[v2 mutableCopy];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v6 = v5;

  id v7 = [(NMSPodcastsDownloadSettings *)v10 dictionaryRepresentation];
  [v6 setObject:v7 forKey:*(void *)(a1 + 48)];

  id v8 = *(void **)(*(void *)(a1 + 40) + 8);
  id v9 = (void *)[v6 copy];
  [v8 setObject:v9 forKey:@"PodcastsStationDownloadSettings"];

  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
}

- (NSSet)podcastsSelectedStationUUIDs
{
  if ([(NMSMediaPinningManager *)self _deviceSupportsPodcastsPinningSettingsV2])
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    internalQueue = self->_internalQueue;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_2;
    id v12 = &unk_264634388;
    uint64_t v13 = self;
    id v14 = v3;
    id v5 = v3;
    dispatch_sync(internalQueue, &v9);
    id v6 = (id)objc_msgSend(v5, "copy", v9, v10, v11, v12, v13);
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    char v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    id v21 = [MEMORY[0x263EFFA08] set];
    id v7 = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke;
    block[3] = &unk_264633AA8;
    void block[4] = self;
    void block[5] = &v16;
    dispatch_sync(v7, block);
    id v6 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }

  return (NSSet *)v6;
}

void __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) pinnedPodcastStationUUIDs];
  uint64_t v3 = [v2 setWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"PodcastsStationDownloadSettings"];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_3;
  v3[3] = &unk_264634400;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:2 dictionary:v5];

  if ([(NMSPodcastsDownloadSettings *)v6 isEnabled]) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)podcastsDownloadSettingsForShowFeedURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NMSMediaPinningManager_podcastsDownloadSettingsForShowFeedURL___block_invoke;
  block[3] = &unk_2646343B0;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __65__NMSMediaPinningManager_podcastsDownloadSettingsForShowFeedURL___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKey:@"PodcastsShowDownloadSettings"];
  id v6 = [v2 objectForKey:a1[5]];

  uint64_t v3 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:3 dictionary:v6];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setPodcastsDownloadSettings:(id)a3 forShowFeedURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forShowFeedURL___block_invoke;
  block[3] = &unk_2646343D8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forShowFeedURL___block_invoke(uint64_t a1)
{
  id v10 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:3 legacyDownloadSettings:*(void *)(a1 + 32)];
  id v2 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:@"PodcastsShowDownloadSettings"];
  uint64_t v3 = (void *)[v2 mutableCopy];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v6 = v5;

  id v7 = [(NMSPodcastsDownloadSettings *)v10 dictionaryRepresentation];
  [v6 setObject:v7 forKey:*(void *)(a1 + 48)];

  id v8 = *(void **)(*(void *)(a1 + 40) + 8);
  id v9 = (void *)[v6 copy];
  [v8 setObject:v9 forKey:@"PodcastsShowDownloadSettings"];

  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
}

- (NSSet)podcastsSelectedShowFeedURLs
{
  if ([(NMSMediaPinningManager *)self _deviceSupportsPodcastsPinningSettingsV2])
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    internalQueue = self->_internalQueue;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_2;
    id v12 = &unk_264634388;
    uint64_t v13 = self;
    id v14 = v3;
    id v5 = v3;
    dispatch_sync(internalQueue, &v9);
    id v6 = (id)objc_msgSend(v5, "copy", v9, v10, v11, v12, v13);
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    char v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    id v21 = [MEMORY[0x263EFFA08] set];
    id v7 = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke;
    block[3] = &unk_264633AA8;
    void block[4] = self;
    void block[5] = &v16;
    dispatch_sync(v7, block);
    id v6 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }

  return (NSSet *)v6;
}

void __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) pinnedPodcastFeedURLs];
  uint64_t v3 = [v2 setWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"PodcastsShowDownloadSettings"];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_3;
  v3[3] = &unk_264634400;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[NMSPodcastsDownloadSettings alloc] initWithCollectionType:3 dictionary:v5];

  if ([(NMSPodcastsDownloadSettings *)v6 isEnabled]) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (BOOL)pinnedPodcastsAreUserSet
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__NMSMediaPinningManager_pinnedPodcastsAreUserSet__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__NMSMediaPinningManager_pinnedPodcastsAreUserSet__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) pinnedPodcastsAreUserSet];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPinnedPodcastsAreUserSet:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__NMSMediaPinningManager_setPinnedPodcastsAreUserSet___block_invoke;
  v4[3] = &unk_264634428;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __54__NMSMediaPinningManager_setPinnedPodcastsAreUserSet___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) pinnedPodcastsAreUserSet];
  if (v2 != result)
  {
    id v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "Setting new pinned podcasts are user set value %x", (uint8_t *)v6, 8u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setPinnedPodcastsAreUserSet:*(unsigned __int8 *)(a1 + 40)];
    return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:2];
  }
  return result;
}

- (BOOL)savedEpisodesEnabled
{
  if ([(NMSMediaPinningManager *)self _deviceSupportsPodcastsPinningSettingsV2])
  {
    char v3 = [(NMSMediaPinningManager *)self podcastsSavedEpisodesDownloadSettings];
    char v4 = [v3 isEnabled];

    return v4;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    internalQueue = self->_internalQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__NMSMediaPinningManager_savedEpisodesEnabled__block_invoke;
    v8[3] = &unk_264634248;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(internalQueue, v8);
    char v7 = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

uint64_t __46__NMSMediaPinningManager_savedEpisodesEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) pinnedPodcastsAreUserSet];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) savedEpisodesEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSavedEpisodesEnabled:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__NMSMediaPinningManager_setSavedEpisodesEnabled___block_invoke;
  v4[3] = &unk_264634428;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __50__NMSMediaPinningManager_setSavedEpisodesEnabled___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) savedEpisodesEnabled];
  if (v2 != result)
  {
    char v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "Setting new saved episodes enabled value %x", (uint8_t *)v6, 8u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setSavedEpisodesEnabled:*(unsigned __int8 *)(a1 + 40)];
    return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:2];
  }
  return result;
}

- (NSArray)podcastFeedURLs
{
  int v2 = [(NMSMediaPinningManager *)self podcastsSelectedShowFeedURLs];
  char v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)podcastStationUUIDs
{
  int v2 = [(NMSMediaPinningManager *)self podcastsSelectedStationUUIDs];
  char v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)_refreshPodcastsIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if ([(NMSMediaPinningManager *)self _deviceSupportsPodcastsPinningSettingsV2])
  {
    obj = [(NMSyncDefaults *)self->_sharedDefaults objectForKey:@"PodcastsUpNextDownloadSettings"];
    char v3 = [(NMSyncDefaults *)self->_sharedDefaults objectForKey:@"PodcastsSavedEpisodesDownloadSettings"];
    char v4 = [(NMSyncDefaults *)self->_sharedDefaults objectForKey:@"PodcastsStationDownloadSettings"];
    int v5 = [(NMSyncDefaults *)self->_sharedDefaults objectForKey:@"PodcastsShowDownloadSettings"];
    p_cachedUpNextDownloadSettings = &self->_cachedUpNextDownloadSettings;
    uint64_t v7 = self->_cachedUpNextDownloadSettings;
    uint64_t v8 = v7;
    if (v7 == obj) {
      HIDWORD(v22) = 0;
    }
    else {
      HIDWORD(v22) = -[NSDictionary isEqual:](v7, "isEqual:") ^ 1;
    }

    p_cachedSavedEpisodesDownloadSettings = &self->_cachedSavedEpisodesDownloadSettings;
    uint64_t v10 = self->_cachedSavedEpisodesDownloadSettings;
    uint64_t v11 = v10;
    if (v10 == v3) {
      LODWORD(v22) = 0;
    }
    else {
      LODWORD(v22) = [(NSDictionary *)v10 isEqual:v3] ^ 1;
    }

    p_cachedStationDownloadSettings = &self->_cachedStationDownloadSettings;
    uint64_t v13 = self->_cachedStationDownloadSettings;
    id v14 = v13;
    if (v13 == v4) {
      int v15 = 0;
    }
    else {
      int v15 = [(NSDictionary *)v13 isEqual:v4] ^ 1;
    }

    cachedShowDownloadSettings = self->_cachedShowDownloadSettings;
    p_cachedShowDownloadSettings = &self->_cachedShowDownloadSettings;
    uint64_t v18 = cachedShowDownloadSettings;
    char v19 = v18;
    if (v18 == v5) {
      int v20 = 0;
    }
    else {
      int v20 = [(NSDictionary *)v18 isEqual:v5] ^ 1;
    }

    objc_storeStrong((id *)p_cachedUpNextDownloadSettings, obj);
    objc_storeStrong((id *)p_cachedSavedEpisodesDownloadSettings, v3);
    objc_storeStrong((id *)p_cachedStationDownloadSettings, v4);
    objc_storeStrong((id *)p_cachedShowDownloadSettings, v5);
    if (((HIDWORD(v22) | v22 | v15) & 1) != 0 || v20)
    {
      id v21 = objc_msgSend(MEMORY[0x263F087C8], "defaultCenter", v22);
      [v21 postNotificationName:@"NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification" object:0];
    }
  }
  else
  {
    [(NMSMediaPinningManager *)self _legacy_refreshPodcastsIdentifiers];
  }
}

- (void)pinPodcastWithFeedURL:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__NMSMediaPinningManager_pinPodcastWithFeedURL___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __48__NMSMediaPinningManager_pinPodcastWithFeedURL___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Pinning podcast <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastFeedURLs];
  int v5 = (void *)[v4 mutableCopy];

  [v5 addObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedPodcastFeedURLs:v5];
  if ([*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastsAreUserSet]) {
    [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
  }
}

- (void)unpinPodcastWithFeedURL:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__NMSMediaPinningManager_unpinPodcastWithFeedURL___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __50__NMSMediaPinningManager_unpinPodcastWithFeedURL___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning podcast <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastFeedURLs];
  int v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedPodcastFeedURLs:v5];
  if ([*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastsAreUserSet]) {
    [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
  }
}

- (void)pinPodcastStationWithUUID:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__NMSMediaPinningManager_pinPodcastStationWithUUID___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __52__NMSMediaPinningManager_pinPodcastStationWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Pinning podcast station <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastStationUUIDs];
  int v5 = (void *)[v4 mutableCopy];

  [v5 addObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedPodcastStationUUIDs:v5];
  if ([*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastsAreUserSet]) {
    [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
  }
}

- (void)unpinPodcastStationWithUUID:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__NMSMediaPinningManager_unpinPodcastStationWithUUID___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __54__NMSMediaPinningManager_unpinPodcastStationWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning podcast station <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastStationUUIDs];
  int v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedPodcastStationUUIDs:v5];
  if ([*(id *)(*(void *)(a1 + 40) + 8) pinnedPodcastsAreUserSet]) {
    [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:2];
  }
}

- (void)invalidateAudiobooksCache
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NMSMediaPinningManager_invalidateAudiobooksCache__block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __51__NMSMediaPinningManager_invalidateAudiobooksCache__block_invoke(uint64_t a1)
{
  int v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Audiobooks cache. [External]", v4, 2u);
  }

  return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:4];
}

- (NSArray)audiobookIdentifiers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__NMSMediaPinningManager_audiobookIdentifiers__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__NMSMediaPinningManager_audiobookIdentifiers__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (!v2[13])
  {
    int v3 = [v2 _shouldCalculateCachedIdentifiers];
    id v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 _refreshAudiobooksIdentifiers];
    }
    else {
      [v4 _fetchAudiobooksIdentifiers];
    }
  }
  int v5 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v5);
}

- (void)_fetchAudiobooksIdentifiers
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "Failed to unarchive cached audiobookIdentifiers due to %@", v2, v3, v4, v5, v6);
}

- (void)_refreshAudiobooksIdentifiers
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "Failed to archive audiobookIdentifiers due to %@", v2, v3, v4, v5, v6);
}

- (BOOL)isWantToReadEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__NMSMediaPinningManager_isWantToReadEnabled__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__NMSMediaPinningManager_isWantToReadEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) wantToReadEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setWantToReadEnabled:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NMSMediaPinningManager_setWantToReadEnabled___block_invoke;
  v4[3] = &unk_264634428;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __47__NMSMediaPinningManager_setWantToReadEnabled___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) wantToReadEnabled];
  if (v2 != result)
  {
    uint64_t v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "Setting new wantToReadEnabled value: %x", (uint8_t *)v6, 8u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setWantToReadEnabled:*(unsigned __int8 *)(a1 + 40)];
    return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:4];
  }
  return result;
}

- (NSOrderedSet)wantToReadAudiobooks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__NMSMediaPinningManager_wantToReadAudiobooks__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

void __46__NMSMediaPinningManager_wantToReadAudiobooks__block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x263EFF9D8];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) wantToReadAudiobooks];
  uint64_t v3 = [v2 orderedSetWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setWantToReadAudiobooks:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__NMSMediaPinningManager_setWantToReadAudiobooks___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __50__NMSMediaPinningManager_setWantToReadAudiobooks___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) array];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) wantToReadAudiobooks];
  if (v2 == v3)
  {
  }
  else
  {
    id v4 = v3;
    char v5 = [v2 isEqual:v3];

    if ((v5 & 1) == 0)
    {
      id v6 = NMLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 138543362;
        uint64_t v9 = v7;
        _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Setting wantToReadAudiobooks %{public}@", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 40) + 8) setWantToReadAudiobooks:v2];
      if ([*(id *)(*(void *)(a1 + 40) + 8) wantToReadEnabled]) {
        [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:4];
      }
    }
  }
}

- (BOOL)isReadingNowEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__NMSMediaPinningManager_isReadingNowEnabled__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__NMSMediaPinningManager_isReadingNowEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) readingNowEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setReadingNowEnabled:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NMSMediaPinningManager_setReadingNowEnabled___block_invoke;
  v4[3] = &unk_264634428;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __47__NMSMediaPinningManager_setReadingNowEnabled___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) readingNowEnabled];
  if (v2 != result)
  {
    id v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "Setting new readingNowEnabled value: %x", (uint8_t *)v6, 8u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setReadingNowEnabled:*(unsigned __int8 *)(a1 + 40)];
    return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:4];
  }
  return result;
}

- (NSOrderedSet)readingNowAudiobooks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__NMSMediaPinningManager_readingNowAudiobooks__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

void __46__NMSMediaPinningManager_readingNowAudiobooks__block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x263EFF9D8];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) readingNowAudiobooks];
  uint64_t v3 = [v2 orderedSetWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setReadingNowAudiobooks:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__NMSMediaPinningManager_setReadingNowAudiobooks___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __50__NMSMediaPinningManager_setReadingNowAudiobooks___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) array];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) readingNowAudiobooks];
  if (v2 == v3)
  {
  }
  else
  {
    id v4 = v3;
    char v5 = [v2 isEqual:v3];

    if ((v5 & 1) == 0)
    {
      id v6 = NMLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 138543362;
        uint64_t v9 = v7;
        _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Setting readingNowAudiobooks %{public}@", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 40) + 8) setReadingNowAudiobooks:v2];
      if ([*(id *)(*(void *)(a1 + 40) + 8) readingNowEnabled]) {
        [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:4];
      }
    }
  }
}

- (NSOrderedSet)pinnedAudiobooks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__NMSMediaPinningManager_pinnedAudiobooks__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

void __42__NMSMediaPinningManager_pinnedAudiobooks__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) pinnedAudiobooks];
  uint64_t v3 = [v2 orderedSetWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)isAudiobookPinned:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NMSMediaPinningManager_isAudiobookPinned___block_invoke;
  block[3] = &unk_264634360;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __44__NMSMediaPinningManager_isAudiobookPinned___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isAudiobookPinned:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)pinAudiobook:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__NMSMediaPinningManager_pinAudiobook___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __39__NMSMediaPinningManager_pinAudiobook___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Pinning audiobook <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedAudiobooks];
  char v5 = (void *)[v4 mutableCopy];

  [v5 addObject:*(void *)(a1 + 32)];
  id v6 = (void *)[v5 copy];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedAudiobooks:v6];

  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:4];
}

- (void)unpinAudiobook:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__NMSMediaPinningManager_unpinAudiobook___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __41__NMSMediaPinningManager_unpinAudiobook___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning audiobook <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedAudiobooks];
  char v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:*(void *)(a1 + 32)];
  id v6 = (void *)[v5 copy];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedAudiobooks:v6];

  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:4];
}

- (double)audiobookDownloadLimit
{
  uint64_t v6 = 0;
  int v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__NMSMediaPinningManager_audiobookDownloadLimit__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__NMSMediaPinningManager_audiobookDownloadLimit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _audiobookDownloadLimit];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setAudiobookDownloadLimit:(double)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__NMSMediaPinningManager_setAudiobookDownloadLimit___block_invoke;
  v4[3] = &unk_264634338;
  *(double *)&void v4[5] = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

void __52__NMSMediaPinningManager_setAudiobookDownloadLimit___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) audiobookDownloadLimit];
  if (v2 == v3)
  {
  }
  else
  {
    id v4 = v3;
    char v5 = [v2 isEqual:v3];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = NMLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = 134217984;
        uint64_t v9 = v7;
        _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Setting new audiobookDownloadLimit value: %f", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 8) setAudiobookDownloadLimit:v2];
      [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:4];
    }
  }
}

+ (id)_tokenForInstance:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"Instance";
  v8[1] = @"Date";
  v9[0] = a3;
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  char v5 = [v3 date];
  v9[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (void)_persistNewClientToken
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = +[NMSyncDefaults sharedDefaults];
  id v4 = [v3 clientPinningSettingsToken];

  char v5 = [v4 objectForKeyedSubscript:@"Instance"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    char v5 = 0;
  }
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "unsignedLongLongValue") + 1);
  uint64_t v7 = [a1 _tokenForInstance:v6];
  int v8 = NMLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Generated new syncState stateToken: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = +[NMSyncDefaults sharedDefaults];
  [v9 setClientPinningSettingsToken:v7];
}

- (void)_notePinningSettingsChangedLocally
{
  id v2 = objc_opt_class();

  [v2 _persistNewClientToken];
}

- (void)_handleMusicPinningSelectionsDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__NMSMediaPinningManager__handleMusicPinningSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __77__NMSMediaPinningManager__handleMusicPinningSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"IsInProcessNotification"];
  int v4 = [v3 BOOLValue];

  char v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"another";
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4) {
      id v6 = @"local";
    }
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v10, 0x16u);
  }

  id v8 = *(void **)(a1 + 40);
  if (v4) {
    return [v8 _notePinningSettingsChangedLocally];
  }
  else {
    return [v8 _invalidateMediaCacheForAppIdentifiers:1];
  }
}

- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__NMSMediaPinningManager__handlePodcastsPinningSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __80__NMSMediaPinningManager__handlePodcastsPinningSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"IsInProcessNotification"];
  int v4 = [v3 BOOLValue];

  char v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"another";
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4) {
      id v6 = @"local";
    }
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v8, 0x16u);
  }

  if (v4) {
    [*(id *)(a1 + 40) _notePinningSettingsChangedLocally];
  }
}

- (void)_handleAudiobooksPinningSelectionsDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__NMSMediaPinningManager__handleAudiobooksPinningSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __82__NMSMediaPinningManager__handleAudiobooksPinningSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"IsInProcessNotification"];
  int v4 = [v3 BOOLValue];

  char v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"another";
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4) {
      id v6 = @"local";
    }
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v10, 0x16u);
  }

  id v8 = *(void **)(a1 + 40);
  if (v4) {
    return [v8 _notePinningSettingsChangedLocally];
  }
  else {
    return [v8 _invalidateMediaCacheForAppIdentifiers:4];
  }
}

- (void)_handleAudiobooksRecommendationsDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__NMSMediaPinningManager__handleAudiobooksRecommendationsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __80__NMSMediaPinningManager__handleAudiobooksRecommendationsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"IsInProcessNotification"];
  int v4 = [v3 BOOLValue];

  char v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"another";
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4) {
      id v6 = @"local";
    }
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v10, 0x16u);
  }

  id v8 = *(void **)(a1 + 40);
  if (v4) {
    return [v8 _notePinningSettingsChangedLocally];
  }
  else {
    return [v8 _invalidateMediaCacheForAppIdentifiers:4];
  }
}

- (void)_handleRecommendationLibraryContentsDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__NMSMediaPinningManager__handleRecommendationLibraryContentsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __84__NMSMediaPinningManager__handleRecommendationLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:1];
}

- (void)_handleRecommendationsDidUpdateNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__NMSMediaPinningManager__handleRecommendationsDidUpdateNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __70__NMSMediaPinningManager__handleRecommendationsDidUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:1];
}

- (void)_handleMediaLibraryEntitiesAddedOrRemovedNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__NMSMediaPinningManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __80__NMSMediaPinningManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:7];
}

- (void)_handleMediaLibraryDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NMSMediaPinningManager__handleMediaLibraryDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __67__NMSMediaPinningManager__handleMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:7];
}

- (void)_handleMediaLibraryDynamicPropertiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__NMSMediaPinningManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __84__NMSMediaPinningManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:7];
}

- (void)_handlePodcastSizeInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__NMSMediaPinningManager__handlePodcastSizeInfoDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __70__NMSMediaPinningManager__handlePodcastSizeInfoDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateAddedItemsCache];
}

- (void)_handleICAgeVerificationStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__NMSMediaPinningManager__handleICAgeVerificationStateDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __77__NMSMediaPinningManager__handleICAgeVerificationStateDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:1];
}

- (void)_handleRecommendationSelectionsDidChangeNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__NMSMediaPinningManager__handleRecommendationSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __79__NMSMediaPinningManager__handleRecommendationSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"IsInProcessNotification"];
  int v4 = [v3 BOOLValue];

  int v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"another";
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4) {
      id v6 = @"local";
    }
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v8, 0x16u);
  }

  if (v4) {
    [*(id *)(a1 + 40) _notePinningSettingsChangedLocally];
  }
}

- (void)_handlePairedDeviceDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__NMSMediaPinningManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke;
  v7[3] = &unk_264634388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __73__NMSMediaPinningManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:7];
}

- (void)_handleMediaPinningMusicContentsInvalidatedNotification:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldCalculateCachedIdentifiers] & 1) == 0) {
    [*(id *)(a1 + 32) _fetchMusicIdentifiers];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke_2;
  block[3] = &unk_264633B20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSMediaPinningMusicContentsInvalidatedNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleMediaPinningPodcastsContentsInvalidatedNotification:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke_2;
  block[3] = &unk_264633B20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSMediaPinningPodcastsContentsInvalidatedNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleMediaPinningAudiobooksContentsInvalidatedNotification:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldCalculateCachedIdentifiers] & 1) == 0) {
    [*(id *)(a1 + 32) _fetchAudiobooksIdentifiers];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke_2;
  block[3] = &unk_264633B20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSMediaPinningAudiobooksContentsInvalidatedNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleMediaPinningManagerMusicIdentifiersDidChangeNotification:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldCalculateCachedIdentifiers] & 1) == 0) {
    [*(id *)(a1 + 32) _fetchMusicIdentifiers];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke_2;
  block[3] = &unk_264633B20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSMediaPinningManagerMusicIdentifiersDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke_2;
  block[3] = &unk_264633B20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldCalculateCachedIdentifiers] & 1) == 0) {
    [*(id *)(a1 + 32) _fetchAudiobooksIdentifiers];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke_2;
  block[3] = &unk_264633B20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSMediaPinningManagerAudiobooksIdentifiersDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)downloadableContentProviderDidChangeContent:(id)a3
{
  if (self->_podcastsDownloadableContentProvider == a3)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__NMSMediaPinningManager_downloadableContentProviderDidChangeContent___block_invoke;
    block[3] = &unk_264633B20;
    void block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __70__NMSMediaPinningManager_downloadableContentProviderDidChangeContent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:2];
}

- (BOOL)_isAppDownloadingDormantForBundleIdentifier:(id)a3
{
  return 0;
}

- (BOOL)_shouldIncludeMusicManualDownloadsInQuotaEvaluation
{
  return 0;
}

- (id)_newMusicEnumeratorWithDownloadedItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v91 = *MEMORY[0x263EF8340];
  int v5 = [MEMORY[0x263EFF980] array];
  if ([(NMSMediaPinningManager *)self _shouldIncludeMusicManualDownloadsInQuotaEvaluation])
  {
    uint64_t v6 = [(NMSyncDefaults *)self->_sharedDefaults workoutPlaylistID];
    uint64_t v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = v6;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) workoutPlaylistID: %{public}@", buf, 0xCu);
    }

    if ([v6 longLongValue])
    {
      id v8 = [NMSItemGroupEnumerator alloc];
      uint64_t v9 = +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:v6 downloadedItemsOnly:v3];
      __int16 v10 = [(NMSItemGroupEnumerator *)v8 initWithItemGroup:v9];
      [v5 addObject:v10];
    }
    uint64_t v11 = [(NMSyncDefaults *)self->_sharedDefaults pinnedPlaylists];
    uint64_t v12 = NMLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = v11;
      _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedPlaylists %{public}@", buf, 0xCu);
    }
    obuint64_t j = v6;

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v81 objects:v88 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v82 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v81 + 1) + 8 * i);
          char v19 = [NMSItemGroupEnumerator alloc];
          int v20 = +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:v18 downloadedItemsOnly:v3];
          id v21 = [(NMSItemGroupEnumerator *)v19 initWithItemGroup:v20];
          [v5 addObject:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v81 objects:v88 count:16];
      }
      while (v15);
    }

    uint64_t v22 = [(NMSyncDefaults *)self->_sharedDefaults pinnedAlbums];
    v23 = NMLogForCategory(5);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = v22;
      _os_log_impl(&dword_2228FD000, v23, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedAlbums %{public}@", buf, 0xCu);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v77 objects:v87 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v78 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v77 + 1) + 8 * j);
          v30 = [NMSItemGroupEnumerator alloc];
          v31 = +[NMSMediaItemGroup itemGroupWithSyncedAlbumID:v29 downloadedItemsOnly:v3];
          v32 = [(NMSItemGroupEnumerator *)v30 initWithItemGroup:v31];
          [v5 addObject:v32];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v77 objects:v87 count:16];
      }
      while (v26);
    }
  }
  v33 = [(id)objc_opt_class() _fetchMusicRecommendations];
  v34 = [MEMORY[0x263EFF980] array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obja = v33;
  uint64_t v35 = [obja countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v74;
    *(void *)&long long v36 = 138543362;
    long long v65 = v36;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v74 != v38) {
          objc_enumerationMutation(obja);
        }
        v40 = *(void **)(*((void *)&v73 + 1) + 8 * k);
        v41 = objc_msgSend(v40, "identifier", v65);
        char v42 = [v41 isEqualToString:NMSRecommendationRecentMusicIdentifier];

        if (v42)
        {
          [v34 addObject:v40];
        }
        else
        {
          int v43 = [v40 isSelected];
          v44 = NMLogForCategory(5);
          BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          if (v43)
          {
            if (v45)
            {
              *(_DWORD *)buf = v65;
              v90 = v40;
              _os_log_impl(&dword_2228FD000, v44, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled store recommendation %{public}@", buf, 0xCu);
            }

            v46 = [NMSItemGroupEnumerator alloc];
            v47 = +[NMSMediaItemGroup itemGroupWithRecommendation:v40 downloadedItemsOnly:v3];
            v48 = [(NMSItemGroupEnumerator *)v46 initWithItemGroup:v47];
            [v5 addObject:v48];
          }
          else
          {
            if (v45)
            {
              *(_DWORD *)buf = v65;
              v90 = v40;
              _os_log_impl(&dword_2228FD000, v44, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) NOT including disabled store recommendation %{public}@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v37 = [obja countByEnumeratingWithState:&v73 objects:v86 count:16];
    }
    while (v37);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v49 = v34;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v50)
  {
    uint64_t v52 = v50;
    uint64_t v53 = *(void *)v70;
    *(void *)&long long v51 = 138543362;
    long long v66 = v51;
    do
    {
      for (uint64_t m = 0; m != v52; ++m)
      {
        if (*(void *)v70 != v53) {
          objc_enumerationMutation(v49);
        }
        v55 = *(void **)(*((void *)&v69 + 1) + 8 * m);
        int v56 = objc_msgSend(v55, "isSelected", v66);
        v57 = NMLogForCategory(5);
        BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
        if (v56)
        {
          if (v58)
          {
            *(_DWORD *)buf = v66;
            v90 = v55;
            _os_log_impl(&dword_2228FD000, v57, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled recommendation %{public}@", buf, 0xCu);
          }

          v59 = [NMSItemGroupEnumerator alloc];
          v57 = +[NMSMediaItemGroup itemGroupWithRecommendation:v55 downloadedItemsOnly:v3];
          v60 = [(NMSItemGroupEnumerator *)v59 initWithItemGroup:v57];
          [v5 addObject:v60];
        }
        else if (v58)
        {
          *(_DWORD *)buf = v66;
          v90 = v55;
          _os_log_impl(&dword_2228FD000, v57, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) NOT including disabled recommendation %{public}@", buf, 0xCu);
        }
      }
      uint64_t v52 = [v49 countByEnumeratingWithState:&v69 objects:v85 count:16];
    }
    while (v52);
  }

  v61 = [NMSSequentialItemEnumerator alloc];
  v62 = (void *)[v5 copy];
  v63 = [(NMSSequentialItemEnumerator *)v61 initWithItemEnumerators:v62];

  return v63;
}

- (id)_newAudiobooksEnumeratorWithDownloadedItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v64 = *MEMORY[0x263EF8340];
  int v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(NMSyncDefaults *)self->_sharedDefaults wantToReadEnabled];
    BOOL v7 = [(NMSyncDefaults *)self->_sharedDefaults readingNowEnabled];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v63 = v6;
    *(_WORD *)&v63[4] = 1024;
    *(_DWORD *)&v63[6] = v7;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobooks containers) wantToReadEnabled: %x, readingNowEnabled: %x", buf, 0xEu);
  }

  id v8 = [MEMORY[0x263EFF980] array];
  [(NMSMediaPinningManager *)self _audiobookDownloadLimit];
  double v10 = v9;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  int v43 = self;
  obuint64_t j = [(NMSyncDefaults *)self->_sharedDefaults pinnedAudiobooks];
  uint64_t v11 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v16 = [NMSItemGroupEnumerator alloc];
        id v17 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v15 downloadLimit:(unint64_t)v10 manuallyAdded:0 downloadedItemsOnly:v3];
        uint64_t v18 = [(NMSItemGroupEnumerator *)v16 initWithItemGroup:v17];
        [v8 addObject:v18];

        char v19 = NMLogForCategory(5);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v63 = v15;
          _os_log_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding pinned audiobook %{public}@", buf, 0xCu);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v12);
  }

  int v20 = v43;
  if ([(NMSyncDefaults *)v43->_sharedDefaults readingNowEnabled])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obja = [(NMSyncDefaults *)v43->_sharedDefaults readingNowAudiobooks];
    uint64_t v21 = [obja countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(obja);
          }
          uint64_t v25 = *(void *)(*((void *)&v51 + 1) + 8 * j);
          uint64_t v26 = [NMSItemGroupEnumerator alloc];
          uint64_t v27 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v25 downloadLimit:(unint64_t)v10 manuallyAdded:0 downloadedItemsOnly:v3];
          BOOL v28 = [(NMSItemGroupEnumerator *)v26 initWithItemGroup:v27];
          [v8 addObject:v28];

          uint64_t v29 = NMLogForCategory(5);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v63 = v25;
            _os_log_impl(&dword_2228FD000, v29, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding readingNow audiobook %{public}@", buf, 0xCu);
          }
        }
        uint64_t v22 = [obja countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v22);
    }

    int v20 = v43;
  }
  if ([(NMSyncDefaults *)v20->_sharedDefaults wantToReadEnabled])
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id objb = [(NMSyncDefaults *)v20->_sharedDefaults wantToReadAudiobooks];
    uint64_t v30 = [objb countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(objb);
          }
          uint64_t v34 = *(void *)(*((void *)&v47 + 1) + 8 * k);
          uint64_t v35 = [NMSItemGroupEnumerator alloc];
          long long v36 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v34 downloadLimit:(unint64_t)v10 manuallyAdded:0 downloadedItemsOnly:v3];
          uint64_t v37 = [(NMSItemGroupEnumerator *)v35 initWithItemGroup:v36];
          [v8 addObject:v37];

          uint64_t v38 = NMLogForCategory(5);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v63 = v34;
            _os_log_impl(&dword_2228FD000, v38, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding wantToRead audiobook %{public}@", buf, 0xCu);
          }
        }
        uint64_t v31 = [objb countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v31);
    }
  }
  v39 = [NMSSequentialItemEnumerator alloc];
  v40 = (void *)[v8 copy];
  v41 = [(NMSSequentialItemEnumerator *)v39 initWithItemEnumerators:v40];

  return v41;
}

- (id)_newItemEnumeratorForBundleIdentifier:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:@"com.apple.NanoMusic"])
  {
    id v7 = [(NMSMediaPinningManager *)self _newMusicEnumeratorWithDownloadedItemsOnly:v4];
  }
  else if ([v6 isEqualToString:@"com.apple.podcasts"])
  {
    id v7 = [(NMSPodcastsDownloadableContentProvider *)self->_podcastsDownloadableContentProvider createItemEnumerator];
  }
  else
  {
    if (![v6 isEqualToString:@"com.apple.NanoBooks"])
    {
      id v8 = 0;
      goto LABEL_8;
    }
    id v7 = [(NMSMediaPinningManager *)self _newAudiobooksEnumeratorWithDownloadedItemsOnly:v4];
  }
  id v8 = v7;
LABEL_8:

  return v8;
}

- (id)_quotaManagerWithDownloadedItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ([(NMSMediaPinningManager *)self _shouldSkipQuotaManagerEvaluation])
  {
    int v5 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = 24;
  if (v3) {
    uint64_t v6 = 32;
  }
  id v7 = (id *)((char *)&self->super.isa + v6);
  int v5 = (NMSMediaQuotaManager *)*(id *)((char *)&self->super.isa + v6);
  if (!v5)
  {
    location = v7;
    id v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        double v9 = @"downloaded";
      }
      else {
        double v9 = @"added";
      }
      *(_DWORD *)buf = 138412546;
      v33 = v9;
      __int16 v34 = 2048;
      unint64_t v35 = [(NMSMediaPinningManager *)self _mediaQuota];
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[QuotaManager Caching] Creating new %@ items quota manager for quota:%llu", buf, 0x16u);
    }

    double v10 = [MEMORY[0x263EFF9A0] dictionary];
    v31[0] = @"com.apple.NanoMusic";
    v31[1] = @"com.apple.podcasts";
    v31[2] = @"com.apple.NanoBooks";
    [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(__CFString **)(*((void *)&v24 + 1) + 8 * i);
          if (![(NMSMediaPinningManager *)self _isAppDownloadingDormantForBundleIdentifier:v16])
          {
            id v17 = [(NMSMediaPinningManager *)self _newItemEnumeratorForBundleIdentifier:v16 downloadedItemsOnly:v3];
            if (!v17) {
              goto LABEL_23;
            }
LABEL_22:
            [v10 setObject:v17 forKeyedSubscript:v16];
            goto LABEL_23;
          }
          id v17 = [(NMSMediaPinningManager *)self _newItemEnumeratorForBundleIdentifier:v16 downloadedItemsOnly:1];
          uint64_t v18 = NMLogForCategory(12);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v16;
            _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "Skipping downloading of %@ items because it is download-dormant.", buf, 0xCu);
          }

          if (v17) {
            goto LABEL_22;
          }
LABEL_23:
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v13);
    }

    v28[0] = @"com.apple.NanoMusic";
    v28[1] = @"com.apple.podcasts";
    v29[0] = &unk_26D51CF80;
    v29[1] = &unk_26D51CF98;
    v28[2] = @"com.apple.NanoBooks";
    v29[2] = &unk_26D51CFB0;
    char v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
    int v20 = [NMSMediaQuotaManager alloc];
    uint64_t v21 = (void *)[v10 copy];
    int v5 = [(NMSMediaQuotaManager *)v20 initWithItemEnumerators:v21 estimatedItemSizes:v19 quota:[(NMSMediaPinningManager *)self _mediaQuota]];

    objc_storeStrong(location, v5);
  }
LABEL_26:

  return v5;
}

- (BOOL)_shouldSkipQuotaManagerEvaluation
{
  if (_shouldSkipQuotaManagerEvaluation_onceToken != -1) {
    dispatch_once(&_shouldSkipQuotaManagerEvaluation_onceToken, &__block_literal_global_4);
  }
  return _shouldSkipQuotaManagerEvaluation_shouldSkipQuotaManagerEvaluation;
}

void __59__NMSMediaPinningManager__shouldSkipQuotaManagerEvaluation__block_invoke()
{
  v0 = [MEMORY[0x263EFFA08] setWithObject:@"bookdatastored"];
  uint64_t v1 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", @"com.apple.NanoNowPlaying", @"com.apple.SessionTrackerApp", @"com.apple.NanoSettings", @"com.apple.NanoMusic", @"com.apple.podcasts", @"com.apple.NanoBooks", 0);
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 bundleIdentifier];
  if ([v1 containsObject:v3])
  {
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F086E0] mainBundle];
    int v5 = [v4 executableURL];
    uint64_t v6 = [v5 lastPathComponent];
    int v7 = [v0 containsObject:v6];

    if (!v7) {
      goto LABEL_7;
    }
  }
  id v8 = NMLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager not supported for this bundle identifier", buf, 2u);
  }

  _shouldSkipQuotaManagerEvaluation_shouldSkipQuotaManagerEvaluation = 1;
LABEL_7:
}

- (BOOL)_shouldCalculateCachedIdentifiers
{
  if (_shouldCalculateCachedIdentifiers_onceToken != -1) {
    dispatch_once(&_shouldCalculateCachedIdentifiers_onceToken, &__block_literal_global_129);
  }
  return _shouldCalculateCachedIdentifiers_shouldCalculateCachedIdentifiers;
}

void __59__NMSMediaPinningManager__shouldCalculateCachedIdentifiers__block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _shouldCalculateCachedIdentifiers_shouldCalculateCachedIdentifiers = [v0 isEqualToString:@"com.apple.Bridge"];
}

- (BOOL)_requiresICEnvironmentMonitor
{
  return ![(NMSMediaPinningManager *)self _shouldSkipQuotaManagerEvaluation];
}

- (void)_invalidateAddedItemsCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[QuotaManager Caching] NMSMediaPinningManager invalidating addedItemsCache. [Internal]", v8, 2u);
  }

  addedItemsQuotaManager = self->_addedItemsQuotaManager;
  self->_addedItemsQuotaManager = 0;

  downloadedItemsQuotaManager = self->_downloadedItemsQuotaManager;
  self->_downloadedItemsQuotaManager = 0;

  legacy_addedItemsQuotaManager = self->_legacy_addedItemsQuotaManager;
  self->_legacy_addedItemsQuotaManager = 0;

  legacy_downloadedItemsQuotaManager = self->_legacy_downloadedItemsQuotaManager;
  self->_legacy_downloadedItemsQuotaManager = 0;
}

- (void)_invalidateMediaCacheForAppIdentifiers:(unint64_t)a3
{
  char v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (![(NMSMediaPinningManager *)self _shouldSkipQuotaManagerEvaluation])
  {
    [(NMSMediaPinningManager *)self _invalidateAddedItemsCache];
    if ([(NMSMediaPinningManager *)self _shouldCalculateCachedIdentifiers])
    {
      if (v3)
      {
        int v5 = NMLogForCategory(5);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Music cache. Refreshing playlists and albums [Internal]", buf, 2u);
        }

        [(NMSMediaPinningManager *)self _refreshMusicIdentifiers];
        uint64_t v6 = [MEMORY[0x263F087C8] defaultCenter];
        [v6 postNotificationName:@"NMSMediaPinningMusicContentsInvalidatedNotification" object:0];

        if ((v3 & 2) == 0)
        {
LABEL_5:
          if ((v3 & 4) == 0)
          {
LABEL_16:
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __65__NMSMediaPinningManager__invalidateMediaCacheForAppIdentifiers___block_invoke;
            block[3] = &unk_264633B20;
            void block[4] = self;
            dispatch_async(MEMORY[0x263EF83A0], block);
            return;
          }
LABEL_13:
          double v9 = NMLogForCategory(5);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Audiobooks cache. [Internal]", buf, 2u);
          }

          [(NMSMediaPinningManager *)self _refreshAudiobooksIdentifiers];
          double v10 = [MEMORY[0x263F087C8] defaultCenter];
          [v10 postNotificationName:@"NMSMediaPinningAudiobooksContentsInvalidatedNotification" object:0];

          goto LABEL_16;
        }
      }
      else if ((v3 & 2) == 0)
      {
        goto LABEL_5;
      }
      int v7 = NMLogForCategory(5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Podcasts cache. Refreshing shows [Internal]", buf, 2u);
      }

      [(NMSMediaPinningManager *)self _refreshPodcastsIdentifiers];
      id v8 = [MEMORY[0x263F087C8] defaultCenter];
      [v8 postNotificationName:@"NMSMediaPinningPodcastsContentsInvalidatedNotification" object:0];

      if ((v3 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }
}

void __65__NMSMediaPinningManager__invalidateMediaCacheForAppIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSMediaPinningManagerDownloadInfoDidInvalidateNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)_isAlbumPinned:(id)a3
{
  internalQueue = self->_internalQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  uint64_t v6 = [(NMSyncDefaults *)self->_sharedDefaults pinnedAlbums];
  LOBYTE(internalQueue) = [v6 containsObject:v5];

  return (char)internalQueue;
}

- (BOOL)_isPlaylistPinned:(id)a3
{
  internalQueue = self->_internalQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  uint64_t v6 = [(NMSyncDefaults *)self->_sharedDefaults pinnedPlaylists];
  LOBYTE(internalQueue) = [v6 containsObject:v5];

  return (char)internalQueue;
}

- (BOOL)_isAudiobookPinned:(id)a3
{
  internalQueue = self->_internalQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  uint64_t v6 = [(NMSyncDefaults *)self->_sharedDefaults pinnedAudiobooks];
  LOBYTE(internalQueue) = [v6 containsObject:v5];

  return (char)internalQueue;
}

- (double)_audiobookDownloadLimit
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  char v3 = [(NMSyncDefaults *)self->_sharedDefaults audiobookDownloadLimit];
  if (v3)
  {
    BOOL v4 = [(NMSyncDefaults *)self->_sharedDefaults audiobookDownloadLimit];
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 18000.0;
  }

  return v6;
}

+ (id)_cachedPlaylistIdentifiersFilePath
{
  id v2 = [a1 _cachedIdentifiersDirectoryPath];
  char v3 = [v2 stringByAppendingPathComponent:@"playlists"];
  BOOL v4 = [v3 stringByAppendingString:@".plist"];

  return v4;
}

+ (id)_cachedAlbumIdentifiersFilePath
{
  id v2 = [a1 _cachedIdentifiersDirectoryPath];
  char v3 = [v2 stringByAppendingPathComponent:@"albums"];
  BOOL v4 = [v3 stringByAppendingString:@".plist"];

  return v4;
}

+ (id)_cachedAudiobookIdentifiersFilePath
{
  id v2 = [a1 _cachedIdentifiersDirectoryPath];
  char v3 = [v2 stringByAppendingPathComponent:@"audiobooks"];
  BOOL v4 = [v3 stringByAppendingString:@".plist"];

  return v4;
}

+ (id)_cachedIdentifiersDirectoryPath
{
  if (_cachedIdentifiersDirectoryPath_onceToken != -1) {
    dispatch_once(&_cachedIdentifiersDirectoryPath_onceToken, &__block_literal_global_146);
  }
  id v2 = (void *)_cachedIdentifiersDirectoryPath_path;

  return v2;
}

void __57__NMSMediaPinningManager__cachedIdentifiersDirectoryPath__block_invoke()
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = @"Library";
  v4[2] = @"NanoMusicSync";
  v4[3] = @"CachedIdentifiers";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  uint64_t v1 = [NSString pathWithComponents:v0];
  id v2 = (void *)_cachedIdentifiersDirectoryPath_path;
  _cachedIdentifiersDirectoryPath_path = v1;

  char v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 createDirectoryAtPath:_cachedIdentifiersDirectoryPath_path withIntermediateDirectories:1 attributes:0 error:0];
}

+ (unint64_t)_mediaStorageSizeForCurrentDevice
{
  id v2 = [MEMORY[0x263F57730] sharedInstance];
  char v3 = [v2 getActivePairedDevice];

  BOOL v4 = [v3 valueForProperty:*MEMORY[0x263F57670]];
  double v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 unsignedLongLongValue];
    _mediaStorageSizeForCurrentDevice_totalCapacity = v6;
  }
  else
  {
    int v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[NMSMediaPinningManager _mediaStorageSizeForCurrentDevice]();
    }

    unint64_t v6 = _mediaStorageSizeForCurrentDevice_totalCapacity;
  }
  unint64_t v8 = 16000000000;
  if (v6 <= 0x3B9ACA000 && (unint64_t v8 = 8000000000, v6 <= 0x1DCD65000)) {
    unint64_t v8 = _mediaStorageSizeForCurrentDevice_mediaStorageSize;
  }
  else {
    _mediaStorageSizeForCurrentDevice_mediaStorageSize = v8;
  }

  return v8;
}

- (unint64_t)_mediaQuota
{
  if (!self->_mediaQuota)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)objc_opt_class(), "_mediaStorageSizeForCurrentDevice"));
    char v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    mediaQuota = self->_mediaQuota;
    self->_mediaQuota = v3;
  }
  double v5 = [(NMSyncDefaults *)self->_sharedDefaults objectForKey:@"AutomaticDownloadsQuota"];
  unint64_t v6 = v5;
  if (v5)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "unsignedLongLongValue"));
    int v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = self->_mediaQuota;
    self->_mediaQuota = v7;
  }
  unint64_t v9 = [(NSNumber *)self->_mediaQuota unsignedLongLongValue];

  return v9;
}

+ (id)_fetchMusicRecommendations
{
  id v2 = +[NMSMusicRecommendationManager sharedManager];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__NMSMediaPinningManager__fetchMusicRecommendations__block_invoke;
  v7[3] = &unk_264634450;
  unint64_t v9 = &v10;
  BOOL v4 = v3;
  unint64_t v8 = v4;
  [v2 fetchRecommendationsWithQueue:0 completion:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

void __52__NMSMediaPinningManager__fetchMusicRecommendations__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSArray)albumIdentifiers
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__NMSMediaPinningManager_albumIdentifiers__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __42__NMSMediaPinningManager_albumIdentifiers__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[8])
  {
    int v3 = [v2 _shouldCalculateCachedIdentifiers];
    id v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 _refreshMusicIdentifiers];
    }
    else {
      [v4 _fetchMusicIdentifiers];
    }
  }
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v5);
}

- (void)_fetchMusicIdentifiers
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "Failed to unarchive cached albumIdentifiers due to %@", v2, v3, v4, v5, v6);
}

- (void)_refreshMusicIdentifiers
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "Failed to archive albumIdentifiers due to %@", v2, v3, v4, v5, v6);
}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));
}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));
}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = a2;
  id v4 = [v2 workoutPlaylistID];
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v4, "longLongValue"));
}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 identifiers];
  id v4 = [v5 library];
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v4, "persistentID"));
}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 identifiers];
  id v4 = [v5 library];
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v4, "persistentID"));
}

- (NSArray)pinnedAlbums
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__NMSMediaPinningManager_pinnedAlbums__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __38__NMSMediaPinningManager_pinnedAlbums__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) pinnedAlbums];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)playlistIdentifiers
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__NMSMediaPinningManager_playlistIdentifiers__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__NMSMediaPinningManager_playlistIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[7])
  {
    int v3 = [v2 _shouldCalculateCachedIdentifiers];
    id v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 _refreshMusicIdentifiers];
    }
    else {
      [v4 _fetchMusicIdentifiers];
    }
  }
  id v5 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v5);
}

- (NSArray)pinnedPlaylists
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) pinnedPlaylists];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = a1 + 40;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 112))
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)v4 + 8) + 40);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_2;
    v15[3] = &unk_2646344A0;
    v15[4] = v7;
    unint64_t v9 = [v8 indexesOfObjectsPassingTest:v15];
    uint64_t v10 = [v9 count];
    if (v10 != [*(id *)(*(void *)(*(void *)v4 + 8) + 40) count])
    {
      id v11 = NMLogForCategory(5);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_cold_1();
      }

      uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectsAtIndexes:v9];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      [*(id *)(*(void *)(a1 + 32) + 8) setPinnedPlaylists:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
  }
}

uint64_t __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() _playlistPIDValidForPinning:v2];

  return v3;
}

- (BOOL)isAlbumPinned:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NMSMediaPinningManager_isAlbumPinned___block_invoke;
  block[3] = &unk_264634360;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __40__NMSMediaPinningManager_isAlbumPinned___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isAlbumPinned:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)isPlaylistPinned:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NMSMediaPinningManager_isPlaylistPinned___block_invoke;
  block[3] = &unk_264634360;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __43__NMSMediaPinningManager_isPlaylistPinned___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPlaylistPinned:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)pinAlbum:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NMSMediaPinningManager_pinAlbum_completionHandler___block_invoke;
  block[3] = &unk_264633C68;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __53__NMSMediaPinningManager_pinAlbum_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Pinning album <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedAlbums];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 addObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedAlbums:v5];
  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:1];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }
}

- (void)pinPlaylist:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NMSMediaPinningManager_pinPlaylist_completionHandler___block_invoke;
  block[3] = &unk_264633C68;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __56__NMSMediaPinningManager_pinPlaylist_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(id)objc_opt_class() _playlistPIDValidForPinning:*(void *)(a1 + 40)];
  uint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"NO";
    uint64_t v5 = *(void *)(a1 + 40);
    if (v2) {
      id v4 = @"YES";
    }
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[Pinning Validation] pinPlaylist: <%{public}@>, valid: %@", (uint8_t *)&v11, 0x16u);
  }

  if (v2)
  {
    id v6 = NMLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 138543362;
      uint64_t v12 = v7;
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "Pinning playlist <%{public}@>", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) pinnedPlaylists];
    id v9 = (void *)[v8 mutableCopy];

    [v9 addObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 8) setPinnedPlaylists:v9];
    [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:1];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  }
  return result;
}

- (void)unpinAlbum:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NMSMediaPinningManager_unpinAlbum_completionHandler___block_invoke;
  block[3] = &unk_264633C68;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __55__NMSMediaPinningManager_unpinAlbum_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning album <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedAlbums];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedAlbums:v5];
  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:1];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }
}

- (void)unpinPlaylist:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NMSMediaPinningManager_unpinPlaylist_completionHandler___block_invoke;
  block[3] = &unk_264633C68;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __58__NMSMediaPinningManager_unpinPlaylist_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning playlist <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) pinnedPlaylists];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setPinnedPlaylists:v5];
  [*(id *)(a1 + 40) _invalidateMediaCacheForAppIdentifiers:1];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }
}

+ (BOOL)_playlistPIDValidForPinning:(id)a3
{
  v26[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if ([v3 longLongValue])
  {
    id v4 = [MEMORY[0x263F57410] predicateWithProperty:*MEMORY[0x263F57310] value:v3 comparison:1];
    uint64_t v5 = (void *)MEMORY[0x263F57418];
    uint64_t v6 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
    int v7 = [v5 unrestrictedQueryWithLibrary:v6 predicate:v4 orderingTerms:0];

    uint64_t v18 = 0;
    char v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    *((unsigned char *)v23 + 24) = 1;
    uint64_t v8 = *MEMORY[0x263F57338];
    v26[0] = *MEMORY[0x263F57350];
    v26[1] = v8;
    uint64_t v9 = *MEMORY[0x263F57330];
    v26[2] = *MEMORY[0x263F57368];
    v26[3] = v9;
    v26[4] = *MEMORY[0x263F57360];
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:5];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __54__NMSMediaPinningManager__playlistPIDValidForPinning___block_invoke;
    v14[3] = &unk_2646344C8;
    uint64_t v16 = &v18;
    id v15 = v3;
    id v17 = &v22;
    [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:v14];

    if (v19[3] != 1)
    {
      int v11 = NMLogForCategory(5);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[NMSMediaPinningManager _playlistPIDValidForPinning:]();
      }

      *((unsigned char *)v23 + 24) = 0;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[NMSMediaPinningManager _playlistPIDValidForPinning:]();
    }
  }

  BOOL v12 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __54__NMSMediaPinningManager__playlistPIDValidForPinning___block_invoke(void *a1, uint64_t a2, id *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  int v5 = [a3[1] BOOLValue];
  int v6 = [a3[2] BOOLValue];
  int v7 = [a3[3] BOOLValue];
  int v8 = [a3[4] BOOLValue];
  int v9 = v8;
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || (v7 & 1) != 0 || v8)
  {
    id v10 = NMLogForCategory(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[4];
      int v12 = 138544386;
      uint64_t v13 = v11;
      __int16 v14 = 1024;
      int v15 = v5;
      __int16 v16 = 1024;
      int v17 = v6;
      __int16 v18 = 1024;
      int v19 = v7;
      __int16 v20 = 1024;
      int v21 = v9;
      _os_log_error_impl(&dword_2228FD000, v10, OS_LOG_TYPE_ERROR, "[Pinning Validation] Rejecting invalid Playlist PID: %{public}@ -- hidden:%d geniusPlaylist:%d geniusMix:%d folder:%d", (uint8_t *)&v12, 0x24u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)_updateWorkoutSettingsPlaylistPIDTo:(id)a3
{
  id v7 = a3;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp"];
  if ([v7 longLongValue])
  {
    [v3 setBool:1 forKey:@"EnableMusicAutoStart"];
    [v3 setObject:v7 forKey:@"MusicPlaylistPersistentID"];
  }
  else
  {
    [v3 setBool:0 forKey:@"EnableMusicAutoStart"];
    [v3 removeObjectForKey:@"MusicPlaylistPersistentID"];
  }
  id v4 = (id)[v3 synchronize];
  id v5 = objc_alloc_init(MEMORY[0x263F57528]);
  int v6 = [MEMORY[0x263EFFA08] setWithObject:@"MusicPlaylistPersistentID"];
  [v5 synchronizeNanoDomain:@"com.apple.nanolifestyle.sessiontrackerapp" keys:v6];
}

- (void)_setWorkoutPlaylistID:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F57730] sharedInstance];
  int v6 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  id v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
  int v8 = [v7 firstObject];
  int v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  char v10 = [v8 supportsCapability:v9];

  if (v10)
  {
    uint64_t v11 = NMLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v4;
      _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "Setting workoutPlaylistID <%{public}@>", buf, 0xCu);
    }

    [(NMSyncDefaults *)self->_sharedDefaults setWorkoutPlaylistID:v4];
    [(NMSMediaPinningManager *)self _updateWorkoutSettingsPlaylistPIDTo:v4];
    if (v4)
    {
      int v12 = objc_msgSend(MEMORY[0x263F11F98], "nms_modelObjectWithLibraryPersistentID:", objc_msgSend(v4, "integerValue"));
      uint64_t v13 = objc_alloc_init(NMSKeepLocalRequestOptions);
      [(NMSKeepLocalRequestOptions *)v13 setRequiresValidation:0];
      [(NMSKeepLocalRequestOptions *)v13 setPowerPolicy:2];
      [(NMSKeepLocalRequestOptions *)v13 setCellularPolicy:2];
      [(NMSKeepLocalRequestOptions *)v13 setQualityOfService:25];
      [(NMSKeepLocalRequestOptions *)v13 setTimeout:0.0];
      __int16 v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithModelObject:v12 enableState:1];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke;
      v19[3] = &unk_2646344F0;
      id v20 = v4;
      [v14 performWithOptions:v13 completion:v19];
    }
  }
  else
  {
    if ([v4 longLongValue]) {
      int v15 = [(id)objc_opt_class() _playlistPIDValidForPinning:v4];
    }
    else {
      int v15 = 1;
    }
    __int16 v16 = NMLogForCategory(5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = @"NO";
      if (v15) {
        int v17 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      id v22 = v4;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      _os_log_impl(&dword_2228FD000, v16, OS_LOG_TYPE_DEFAULT, "[Pinning Validation] setWorkoutPlaylistID: <%{public}@>, valid: %@", buf, 0x16u);
    }

    if (v15)
    {
      __int16 v18 = NMLogForCategory(5);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v4;
        _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "Setting workoutPlaylistID <%{public}@>", buf, 0xCu);
      }

      [(NMSyncDefaults *)self->_sharedDefaults setWorkoutPlaylistID:v4];
      [(NMSMediaPinningManager *)self _updateWorkoutSettingsPlaylistPIDTo:v4];
      [(NMSMediaPinningManager *)self _invalidateMediaCacheForAppIdentifiers:1];
    }
  }
}

void __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)setWorkoutPlaylistID:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__NMSMediaPinningManager_setWorkoutPlaylistID___block_invoke;
  v7[3] = &unk_264634388;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __47__NMSMediaPinningManager_setWorkoutPlaylistID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setWorkoutPlaylistID:*(void *)(a1 + 40)];
}

- (BOOL)_deviceSupportsPodcastsPinningSettingsV2
{
  uint64_t v2 = [MEMORY[0x263F57730] sharedInstance];
  id v3 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D718E4BE-8067-432E-AF41-7342473499D5"];
  char v7 = [v5 supportsCapability:v6];

  return v7;
}

- (void)_legacy_refreshMusicIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v3 = [(NMSMediaPinningManager *)self _legacy_quotaManagerWithDownloadedItemsOnly:0];
  id v4 = [v3 groupIteratorForBundleIdentifier:@"com.apple.NanoMusic"];
  id v5 = [v4 identifiersForContainersOfType:1];

  id v6 = [v3 groupIteratorForBundleIdentifier:@"com.apple.NanoMusic"];
  char v7 = [v6 identifiersForContainersOfType:0];

  id v8 = self->_cachedAlbumIdentifiers;
  if (v8 == v5)
  {

    goto LABEL_9;
  }
  int v9 = v8;
  char v10 = [(NSArray *)v8 isEqual:v5];

  if (v10)
  {
LABEL_9:
    int v15 = 0;
    goto LABEL_10;
  }
  id v26 = 0;
  uint64_t v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v26];
  id v12 = v26;
  if (v12)
  {
    uint64_t v13 = NMLogForCategory(5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NMSMediaPinningManager _refreshMusicIdentifiers]();
    }
  }
  __int16 v14 = [(id)objc_opt_class() _cachedAlbumIdentifiersFilePath];
  int v15 = 1;
  [v11 writeToFile:v14 atomically:1];

  objc_storeStrong((id *)&self->_cachedAlbumIdentifiers, v5);
LABEL_10:
  p_cachedPlaylistIdentifiers = &self->_cachedPlaylistIdentifiers;
  int v17 = self->_cachedPlaylistIdentifiers;
  if (v17 == v7)
  {
  }
  else
  {
    __int16 v18 = v17;
    char v19 = [(NSArray *)v17 isEqual:v7];

    if ((v19 & 1) == 0)
    {
      id v25 = 0;
      id v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v25];
      id v21 = v25;
      if (v21)
      {
        id v22 = NMLogForCategory(5);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[NMSMediaPinningManager _refreshMusicIdentifiers]();
        }
      }
      __int16 v23 = [(id)objc_opt_class() _cachedPlaylistIdentifiersFilePath];
      [v20 writeToFile:v23 atomically:1];

      objc_storeStrong((id *)p_cachedPlaylistIdentifiers, v7);
      goto LABEL_19;
    }
  }
  if (v15)
  {
LABEL_19:
    uint64_t v24 = [MEMORY[0x263F087C8] defaultCenter];
    [v24 postNotificationName:@"NMSMediaPinningManagerMusicIdentifiersDidChangeNotification" object:0];
  }
}

- (void)_legacy_refreshPodcastsIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  obuint64_t j = [(NMSyncDefaults *)self->_sharedDefaults pinnedPodcastFeedURLs];
  id v3 = [(NMSyncDefaults *)self->_sharedDefaults pinnedPodcastStationUUIDs];
  int v4 = [(NMSyncDefaults *)self->_sharedDefaults savedEpisodesEnabled];
  int v5 = [(NMSyncDefaults *)self->_sharedDefaults pinnedPodcastsAreUserSet];
  id v6 = self->_legacy_cachedPodcastFeedURLs;
  char v7 = v6;
  if (v6 == obj) {
    int v8 = 0;
  }
  else {
    int v8 = -[NSArray isEqual:](v6, "isEqual:") ^ 1;
  }

  int v9 = self->_legacy_cachedPodcastStationUUIDs;
  char v10 = v9;
  if (v9 == v3) {
    int v11 = 0;
  }
  else {
    int v11 = [(NSArray *)v9 isEqual:v3] ^ 1;
  }

  int legacy_cachedSavedEpisodesEnabled = self->_legacy_cachedSavedEpisodesEnabled;
  int legacy_cachedPinnedPodcastsAreUserSet = self->_legacy_cachedPinnedPodcastsAreUserSet;
  objc_storeStrong((id *)&self->_legacy_cachedPodcastFeedURLs, obj);
  objc_storeStrong((id *)&self->_legacy_cachedPodcastStationUUIDs, v3);
  self->_int legacy_cachedSavedEpisodesEnabled = v4;
  self->_int legacy_cachedPinnedPodcastsAreUserSet = v5;
  if (((v8 | v11) & 1) != 0 || legacy_cachedSavedEpisodesEnabled != v4 || legacy_cachedPinnedPodcastsAreUserSet != v5)
  {
    __int16 v14 = [MEMORY[0x263F087C8] defaultCenter];
    [v14 postNotificationName:@"NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification" object:0];
  }
}

- (void)_legacy_refreshAudiobooksIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v3 = [(NMSMediaPinningManager *)self _legacy_quotaManagerWithDownloadedItemsOnly:0];
  int v4 = [v3 groupIteratorForBundleIdentifier:@"com.apple.NanoBooks"];
  int v5 = [v4 identifiersForContainersOfType:7];

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__NMSMediaPinningManager__legacy_refreshAudiobooksIdentifiers__block_invoke;
  v18[3] = &unk_264634518;
  char v7 = v6;
  char v19 = v7;
  [v5 enumerateObjectsUsingBlock:v18];
  p_cachedAudiobookIdentifiers = &self->_cachedAudiobookIdentifiers;
  int v9 = self->_cachedAudiobookIdentifiers;
  char v10 = v7;
  if (v9 == v7)
  {
LABEL_8:

    goto LABEL_9;
  }
  int v11 = v9;
  char v12 = [(NSArray *)v9 isEqual:v7];

  if ((v12 & 1) == 0)
  {
    id v17 = 0;
    uint64_t v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v17];
    char v10 = (NSArray *)v17;
    if (v10)
    {
      __int16 v14 = NMLogForCategory(5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NMSMediaPinningManager _refreshAudiobooksIdentifiers]();
      }
    }
    int v15 = [(id)objc_opt_class() _cachedAudiobookIdentifiersFilePath];
    [v13 writeToFile:v15 atomically:1];

    objc_storeStrong((id *)p_cachedAudiobookIdentifiers, v6);
    __int16 v16 = [MEMORY[0x263F087C8] defaultCenter];
    [v16 postNotificationName:@"NMSMediaPinningManagerAudiobooksIdentifiersDidChangeNotification" object:0];

    goto LABEL_8;
  }
LABEL_9:
}

void __62__NMSMediaPinningManager__legacy_refreshAudiobooksIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v5 = [a2 universalStore];
  int v4 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "adamID"));
  [v2 addObject:v4];
}

- (BOOL)_legacy_musicIsOutOfSpace
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__NMSMediaPinningManager__legacy_musicIsOutOfSpace__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __51__NMSMediaPinningManager__legacy_musicIsOutOfSpace__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v2 = [v3 sizeOfNominatedItemsForBundleIdentifier:@"com.apple.NanoMusic"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 > [v3 sizeOfItemsWithinQuotaForBundleIdentifier:@"com.apple.NanoMusic"];
}

- (id)_legacy_newMusicGroupIteratorWithDownloadedItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF9B0] orderedSet];
  if ([(NMSMediaPinningManager *)self _shouldIncludeMusicManualDownloadsInQuotaEvaluation])
  {
    uint64_t v6 = [(NMSyncDefaults *)self->_sharedDefaults workoutPlaylistID];
    char v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v66 = v6;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) workoutPlaylistID: %{public}@", buf, 0xCu);
    }

    if ([v6 longLongValue])
    {
      uint64_t v8 = +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:v6 downloadedItemsOnly:v3];
      [v5 addObject:v8];
    }
    obuint64_t j = v6;
    char v9 = v5;
    char v10 = [(NMSyncDefaults *)self->_sharedDefaults pinnedPlaylists];
    int v11 = NMLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v66 = v10;
      _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedPlaylists %{public}@", buf, 0xCu);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    char v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v62 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:*(void *)(*((void *)&v61 + 1) + 8 * i) downloadedItemsOnly:v3];
          [v9 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }
      while (v14);
    }

    __int16 v18 = [(NMSyncDefaults *)self->_sharedDefaults pinnedAlbums];
    char v19 = NMLogForCategory(5);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v66 = v18;
      _os_log_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedAlbums %{public}@", buf, 0xCu);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v58 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = +[NMSMediaItemGroup itemGroupWithSyncedAlbumID:*(void *)(*((void *)&v57 + 1) + 8 * j) downloadedItemsOnly:v3];
          [v9 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v22);
    }

    id v5 = v9;
  }
  [(id)objc_opt_class() _fetchMusicRecommendations];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [obja countByEnumeratingWithState:&v53 objects:v69 count:16];
  if (!v26) {
    goto LABEL_52;
  }
  uint64_t v28 = v26;
  long long v50 = v5;
  uint64_t v29 = 0;
  uint64_t v30 = *(void *)v54;
  *(void *)&long long v27 = 138543618;
  long long v49 = v27;
  do
  {
    for (uint64_t k = 0; k != v28; ++k)
    {
      if (*(void *)v54 != v30) {
        objc_enumerationMutation(obja);
      }
      uint64_t v32 = *(NSObject **)(*((void *)&v53 + 1) + 8 * k);
      v33 = [v32 identifier];
      char v34 = [v33 isEqualToString:NMSRecommendationRecentMusicIdentifier];

      int v35 = [v32 isSelected];
      int v36 = v35;
      if (v34)
      {
        if (v35)
        {
          if (v29)
          {
            uint64_t v37 = NMLogForCategory(5);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v49;
              long long v66 = v29;
              __int16 v67 = 2114;
              v68 = v32;
              _os_log_error_impl(&dword_2228FD000, v37, OS_LOG_TYPE_ERROR, "_quotaManager (Music containers) Multiple recentMusicRecommendation; have:%{public}@; got:%{public}@",
                buf,
                0x16u);
            }
          }
          uint64_t v38 = v29;
          uint64_t v29 = v32;
          goto LABEL_46;
        }
        uint64_t v38 = NMLogForCategory(5);
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_46;
        }
        *(_WORD *)buf = 0;
        v40 = v38;
        v41 = "_quotaManager (Music containers) NOT including disabled Recent Music.";
        uint32_t v42 = 2;
LABEL_45:
        _os_log_impl(&dword_2228FD000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, v42);
        goto LABEL_46;
      }
      uint64_t v38 = NMLogForCategory(5);
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if (!v36)
      {
        if (!v39) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 138543362;
        long long v66 = v32;
        v40 = v38;
        v41 = "_quotaManager (Music containers) NOT including disabled store recommendation %{public}@";
        uint32_t v42 = 12;
        goto LABEL_45;
      }
      if (v39)
      {
        *(_DWORD *)buf = 138543362;
        long long v66 = v32;
        _os_log_impl(&dword_2228FD000, v38, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled store recommendation %{public}@", buf, 0xCu);
      }

      uint64_t v38 = +[NMSMediaItemGroup itemGroupWithRecommendation:v32 downloadedItemsOnly:v3];
      [v50 addObject:v38];
LABEL_46:
    }
    uint64_t v28 = [obja countByEnumeratingWithState:&v53 objects:v69 count:16];
  }
  while (v28);
  id v5 = v50;
  if (v29)
  {
    int v43 = NMLogForCategory(5);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v66 = v29;
      _os_log_impl(&dword_2228FD000, v43, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled HR recommendation %{public}@", buf, 0xCu);
    }

    v44 = +[NMSMediaItemGroup itemGroupWithRecommendation:v29 downloadedItemsOnly:v3];
    [v50 addObject:v44];
    goto LABEL_55;
  }
LABEL_52:
  v44 = NMLogForCategory(5);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v44, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) skipping Recent Music because there is no enabled Recent Music recommendation.", buf, 2u);
  }
  uint64_t v29 = 0;
LABEL_55:

  BOOL v45 = [NMSSequentialMediaItemGroupIterator alloc];
  v46 = [v5 array];
  long long v47 = [(NMSMediaItemGroupIterator *)v45 initWithItemGroups:v46 estimatedItemSize:7000000];

  return v47;
}

- (id)_legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F5E9D8] sharedInstance];
  char v6 = [v5 isReady];

  char v7 = NMLogForCategory(5);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(NMSyncDefaults *)self->_sharedDefaults pinnedPodcastsAreUserSet];
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v9;
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) pinnedPodcastsAreUserSet %x", buf, 8u);
    }

    char v10 = [MEMORY[0x263EFF980] array];
    if ([(NMSyncDefaults *)self->_sharedDefaults pinnedPodcastsAreUserSet])
    {
      if ([(NMSyncDefaults *)self->_sharedDefaults savedEpisodesEnabled])
      {
        int v11 = NMLogForCategory(5);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding Saved Episodes item group", buf, 2u);
        }

        char v12 = +[NMSMediaItemGroup itemGroupWithSavedEpisodesDownloadedItemsOnly:v3];
        [v10 addObject:v12];
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      char v34 = self;
      uint64_t v13 = [(NMSyncDefaults *)self->_sharedDefaults pinnedPodcastStationUUIDs];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            char v19 = NMLogForCategory(5);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v45 = v18;
              _os_log_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding station %{public}@", buf, 0xCu);
            }

            id v20 = +[NMSMediaItemGroup itemGroupWithPodcastStationUUID:v18 downloadedItemsOnly:v3];
            [v10 addObject:v20];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v46 count:16];
        }
        while (v15);
      }

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v21 = [(NMSyncDefaults *)v34->_sharedDefaults pinnedPodcastFeedURLs];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * j);
            long long v27 = NMLogForCategory(5);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v45 = v26;
              _os_log_impl(&dword_2228FD000, v27, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding podcast with feed url %{public}@", buf, 0xCu);
            }

            uint64_t v28 = +[NMSMediaItemGroup itemGroupWithCustomPodcastFeedURL:v26 downloadedItemsOnly:v3];
            [v10 addObject:v28];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v23);
      }
    }
    else
    {
      uint64_t v30 = NMLogForCategory(5);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v30, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding Up Next item group", buf, 2u);
      }

      uint64_t v21 = +[NMSMediaItemGroup itemGroupWithUpNextEpisodesDownloadedItemsOnly:v3];
      [v10 addObject:v21];
    }

    uint64_t v31 = [NMSAlternatingMediaItemGroupIterator alloc];
    uint64_t v32 = (void *)[v10 copy];
    uint64_t v29 = [(NMSMediaItemGroupIterator *)v31 initWithItemGroups:v32 estimatedItemSize:50000000];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NMSMediaPinningManager _legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:](v8);
    }

    char v10 = [MEMORY[0x263F5E9D8] sharedInstance];
    [v10 attemptToFix];
    uint64_t v29 = 0;
  }

  return v29;
}

- (id)_legacy_newAudiobooksGroupIteratorWithDownloadedItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(NMSyncDefaults *)self->_sharedDefaults wantToReadEnabled];
    BOOL v7 = [(NMSyncDefaults *)self->_sharedDefaults readingNowEnabled];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)long long v57 = v6;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v7;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobooks containers) wantToReadEnabled: %x, readingNowEnabled: %x", buf, 0xEu);
  }

  uint64_t v8 = [MEMORY[0x263EFF9B0] orderedSet];
  [(NMSMediaPinningManager *)self _audiobookDownloadLimit];
  double v10 = v9;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v40 = self;
  int v11 = [(NMSyncDefaults *)self->_sharedDefaults pinnedAudiobooks];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        id v17 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v16 downloadLimit:(unint64_t)v10 manuallyAdded:0 downloadedItemsOnly:v3];
        [v8 addObject:v17];

        uint64_t v18 = NMLogForCategory(5);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)long long v57 = v16;
          _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding pinned audiobook %{public}@", buf, 0xCu);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v13);
  }

  char v19 = v40;
  if ([(NMSyncDefaults *)v40->_sharedDefaults readingNowEnabled])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v20 = [(NMSyncDefaults *)v40->_sharedDefaults readingNowAudiobooks];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v26 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v25 downloadLimit:(unint64_t)v10 manuallyAdded:0 downloadedItemsOnly:v3];
          [v8 addObject:v26];

          long long v27 = NMLogForCategory(5);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)long long v57 = v25;
            _os_log_impl(&dword_2228FD000, v27, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding readingNow audiobook %{public}@", buf, 0xCu);
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v22);
    }

    char v19 = v40;
  }
  if ([(NMSyncDefaults *)v19->_sharedDefaults wantToReadEnabled])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v28 = [(NMSyncDefaults *)v19->_sharedDefaults wantToReadAudiobooks];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v41 + 1) + 8 * k);
          char v34 = +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:v33 downloadLimit:(unint64_t)v10 manuallyAdded:0 downloadedItemsOnly:v3];
          [v8 addObject:v34];

          long long v35 = NMLogForCategory(5);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)long long v57 = v33;
            _os_log_impl(&dword_2228FD000, v35, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding wantToRead audiobook %{public}@", buf, 0xCu);
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v30);
    }
  }
  long long v36 = [NMSSequentialMediaItemGroupIterator alloc];
  long long v37 = [v8 array];
  long long v38 = [(NMSMediaItemGroupIterator *)v36 initWithItemGroups:v37 estimatedItemSize:143000000];

  return v38;
}

- (id)_legacy_newGroupIteratorForBundleIdentifier:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:@"com.apple.NanoMusic"])
  {
    uint64_t v7 = [(NMSMediaPinningManager *)self _legacy_newMusicGroupIteratorWithDownloadedItemsOnly:v4];
LABEL_7:
    uint64_t v8 = (void *)v7;
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"com.apple.podcasts"])
  {
    uint64_t v7 = [(NMSMediaPinningManager *)self _legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:v4];
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"com.apple.NanoBooks"])
  {
    uint64_t v7 = [(NMSMediaPinningManager *)self _legacy_newAudiobooksGroupIteratorWithDownloadedItemsOnly:v4];
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (id)_legacy_quotaManagerWithDownloadedItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ([(NMSMediaPinningManager *)self _shouldSkipQuotaManagerEvaluation])
  {
    id v5 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = 128;
  if (v3) {
    uint64_t v6 = 136;
  }
  uint64_t v7 = (id *)((char *)&self->super.isa + v6);
  id v5 = (NMSMediaQuotaManager_Legacy *)*(id *)((char *)&self->super.isa + v6);
  if (!v5)
  {
    location = v7;
    uint64_t v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        double v9 = @"downloaded";
      }
      else {
        double v9 = @"added";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v9;
      __int16 v31 = 2048;
      unint64_t v32 = [(NMSMediaPinningManager *)self _mediaQuota];
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[QuotaManager Caching] Creating new %@ items quota manager for quota:%llu", buf, 0x16u);
    }

    double v10 = [MEMORY[0x263EFF9A0] dictionary];
    v28[0] = @"com.apple.NanoMusic";
    v28[1] = @"com.apple.podcasts";
    v28[2] = @"com.apple.NanoBooks";
    [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(__CFString **)(*((void *)&v23 + 1) + 8 * i);
          if (![(NMSMediaPinningManager *)self _isAppDownloadingDormantForBundleIdentifier:v16])
          {
            id v17 = [(NMSMediaPinningManager *)self _legacy_newGroupIteratorForBundleIdentifier:v16 downloadedItemsOnly:v3];
            if (!v17) {
              goto LABEL_23;
            }
LABEL_22:
            [v10 setObject:v17 forKeyedSubscript:v16];
            goto LABEL_23;
          }
          id v17 = [(NMSMediaPinningManager *)self _legacy_newGroupIteratorForBundleIdentifier:v16 downloadedItemsOnly:1];
          uint64_t v18 = NMLogForCategory(12);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v16;
            _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "Skipping downloading of %@ items because it is download-dormant.", buf, 0xCu);
          }

          if (v17) {
            goto LABEL_22;
          }
LABEL_23:
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    char v19 = [NMSMediaQuotaManager_Legacy alloc];
    id v20 = (void *)[v10 copy];
    id v5 = [(NMSMediaQuotaManager_Legacy *)v19 initWithGroupIterators:v20 quota:[(NMSMediaPinningManager *)self _mediaQuota]];

    objc_storeStrong(location, v5);
  }
LABEL_26:

  return v5;
}

- (void)extensionAccessDidChange
{
  BOOL v3 = [MEMORY[0x263F5E9D8] sharedInstance];
  int v4 = [v3 isReady];

  if (v4)
  {
    id v5 = NMLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager can open PodcastsDB again. Invalidating added items and kicking off syncs", v6, 2u);
    }

    [(NMSMediaPinningManager *)self invalidatePodcastsCache];
  }
}

- (void)podcastsDownloadableContentControllerContentDidChange:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NMSMediaPinningManager_podcastsDownloadableContentControllerContentDidChange___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __80__NMSMediaPinningManager_podcastsDownloadableContentControllerContentDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateMediaCacheForAppIdentifiers:2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacy_cachedPodcastStationUUIDs, 0);
  objc_storeStrong((id *)&self->_legacy_cachedPodcastFeedURLs, 0);
  objc_storeStrong((id *)&self->_legacy_downloadedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_legacy_addedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_legacy_podcastsDownloadableContentController, 0);
  objc_storeStrong((id *)&self->_cachedAudiobookIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedShowDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedStationDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedSavedEpisodesDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedUpNextDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedAlbumIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedPlaylistIdentifiers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_mediaQuota, 0);
  objc_storeStrong((id *)&self->_downloadedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_addedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_podcastsDownloadableContentProvider, 0);

  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

void __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_mediaStorageSizeForCurrentDevice
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "Could not get total storage information from the active watch: %@", v2, v3, v4, v5, v6);
}

void __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "[Pinning Validation] Removing invalid pinnedPlaylists; validPlaylistIndices: %{public}@, original pinnedPlaylists: %{public}@");
}

+ (void)_playlistPIDValidForPinning:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "[Pinning Validation] Rejecting invalid Playlist PID: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_playlistPIDValidForPinning:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "[Pinning Validation] Rejecting invalid Playlist PID: %{public}@ -- matchedObjects:%tu");
}

void __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_2228FD000, a2, a3, "Failed to set keep local for workoutPlaylistID <%{public}@>.  Error=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2228FD000, log, OS_LOG_TYPE_ERROR, "NMSMediaPinningManager cannot open PodcastsDB. Not adding Podcasts iterator.", v1, 2u);
}

@end