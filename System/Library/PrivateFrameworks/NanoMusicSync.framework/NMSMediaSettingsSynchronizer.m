@interface NMSMediaSettingsSynchronizer
+ (NMSMediaSettingsSynchronizer)sharedSynchronizer;
- (id)_podcastsAppGroupPath;
- (id)_podcastsUserDefaults;
- (int64_t)_preferredGreenTeaMusicStreamingResolutionPreference;
- (void)_createDefaultGreenTeaSettingsIfNecessary;
- (void)_migrateMusicDefaultsIfNecessary;
- (void)_reconcileGreenTeaSettingsIfNecessary;
- (void)_syncPodcastDefaultsIfNecessary;
- (void)beginObservingUpdates;
- (void)dealloc;
- (void)endObservingUpdates;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NMSMediaSettingsSynchronizer

+ (NMSMediaSettingsSynchronizer)sharedSynchronizer
{
  if (sharedSynchronizer_onceToken != -1) {
    dispatch_once(&sharedSynchronizer_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedSynchronizer_instance;

  return (NMSMediaSettingsSynchronizer *)v2;
}

uint64_t __50__NMSMediaSettingsSynchronizer_sharedSynchronizer__block_invoke()
{
  v0 = objc_alloc_init(NMSMediaSettingsSynchronizer);
  uint64_t v1 = sharedSynchronizer_instance;
  sharedSynchronizer_instance = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)dealloc
{
  [(NMSMediaSettingsSynchronizer *)self endObservingUpdates];
  v3.receiver = self;
  v3.super_class = (Class)NMSMediaSettingsSynchronizer;
  [(NMSMediaSettingsSynchronizer *)&v3 dealloc];
}

- (void)beginObservingUpdates
{
  if (!self->_isObserving)
  {
    objc_super v3 = NMLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Begin observing setting updates.", v15, 2u);
    }

    self->_isObserving = 1;
    v4 = (NSUserDefaults *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mediaplaybackcore"];
    mediaPlaybackCoreDefaults = self->_mediaPlaybackCoreDefaults;
    self->_mediaPlaybackCoreDefaults = v4;

    [(NSUserDefaults *)self->_mediaPlaybackCoreDefaults addObserver:self forKeyPath:@"MPCPlaybackPrivateListeningEnabled" options:0 context:@"MPCPlaybackPrivateListeningEnabled"];
    v6 = (NSUserDefaults *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobileipod"];
    mobileIPodDefaults = self->_mobileIPodDefaults;
    self->_mobileIPodDefaults = v6;

    [(NSUserDefaults *)self->_mobileIPodDefaults addObserver:self forKeyPath:@"MusicLowBandwidthResolution" options:0 context:@"MusicLowBandwidthResolution"];
    v8 = (NSUserDefaults *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Music"];
    musicDefaults = self->_musicDefaults;
    self->_musicDefaults = v8;

    [(NSUserDefaults *)self->_musicDefaults addObserver:self forKeyPath:@"AllowsCellularDataDownloads" options:0 context:@"AllowsCellularDataDownloads"];
    v10 = (NSUserDefaults *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoMusicSync"];
    nanoMusicSyncDefaults = self->_nanoMusicSyncDefaults;
    self->_nanoMusicSyncDefaults = v10;

    [(NSUserDefaults *)self->_nanoMusicSyncDefaults addObserver:self forKeyPath:@"GreenTeaMobileIpodCellularKeysAreMirrored" options:0 context:@"GreenTeaMobileIpodCellularKeysAreMirrored"];
    [(NSUserDefaults *)self->_nanoMusicSyncDefaults addObserver:self forKeyPath:@"GreenTeaMusicAllowsCellularData" options:0 context:@"GreenTeaMusicAllowsCellularData"];
    [(NSUserDefaults *)self->_nanoMusicSyncDefaults addObserver:self forKeyPath:@"GreenTeaMusicAllowsHighQualityStreamingOnCellular" options:0 context:@"GreenTeaMusicAllowsHighQualityStreamingOnCellular"];
    [(NSUserDefaults *)self->_nanoMusicSyncDefaults addObserver:self forKeyPath:@"GreenTeaMusicAllowsDownloadsOverCellular" options:0 context:@"GreenTeaMusicAllowsDownloadsOverCellular"];
    [(NMSMediaSettingsSynchronizer *)self _migrateMusicDefaultsIfNecessary];
    [(NMSMediaSettingsSynchronizer *)self _createDefaultGreenTeaSettingsIfNecessary];
    v12 = [(NMSMediaSettingsSynchronizer *)self _podcastsUserDefaults];
    podcastsDefaults = self->_podcastsDefaults;
    self->_podcastsDefaults = v12;

    [(NSUserDefaults *)self->_podcastsDefaults addObserver:self forKeyPath:@"MTSyncSubscriptions" options:0 context:@"MTSyncSubscriptions"];
    [(NSUserDefaults *)self->_podcastsDefaults addObserver:self forKeyPath:@"MTPodcastUpdateIntervalDefault" options:0 context:@"MTPodcastUpdateIntervalDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults addObserver:self forKeyPath:@"MTContinuousPlaybackEnabled" options:0 context:@"MTContinuousPlaybackEnabled"];
    [(NSUserDefaults *)self->_podcastsDefaults addObserver:self forKeyPath:@"MTSkipForwardIntervalDefault" options:0 context:@"MTSkipForwardIntervalDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults addObserver:self forKeyPath:@"MTSkipBackwardsIntervalDefault" options:0 context:@"MTSkipBackwardsIntervalDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults addObserver:self forKeyPath:@"MTRemoteSkipInsteadOfNextTrackDefault" options:0 context:@"MTRemoteSkipInsteadOfNextTrackDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults addObserver:self forKeyPath:@"MTPrivacyResetIdentifier" options:0 context:@"MTPrivacyResetIdentifier"];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:self selector:sel__syncPodcastDefaultsIfNecessary name:*MEMORY[0x263F57688] object:0];

    [(NMSMediaSettingsSynchronizer *)self _syncPodcastDefaultsIfNecessary];
  }
}

- (void)_createDefaultGreenTeaSettingsIfNecessary
{
  v14[1] = *MEMORY[0x263EF8340];
  v2 = [(NSUserDefaults *)self->_nanoMusicSyncDefaults objectForKey:@"GreenTeaMobileIpodCellularKeysAreMirrored"];

  objc_super v3 = NMLogForCategory(5);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Already have default Green Tea cellular settings", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Will set default Green Tea cellular settings", buf, 2u);
    }

    objc_super v3 = dispatch_queue_create("com.apple.NanoMusicSync.MediaSettingsSynchronizer", 0);
    _CTServerConnectionAddIdentifierException();
    _CTServerConnectionCreateOnTargetQueue();
    uint64_t v13 = *MEMORY[0x263F02DE8];
    v14[0] = *MEMORY[0x263F02DF8];
    v5 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t CellularUsagePolicyMirroring = _CTServerConnectionGetCellularUsagePolicyMirroring();
    if (CellularUsagePolicyMirroring)
    {
      v7 = NMLogForCategory(5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v10 = CellularUsagePolicyMirroring;
        __int16 v11 = 1024;
        int v12 = HIDWORD(CellularUsagePolicyMirroring);
        _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Error fetching mirroring policy %d %d", buf, 0xEu);
      }

      __73__NMSMediaSettingsSynchronizer__createDefaultGreenTeaSettingsIfNecessary__block_invoke(v8, 0);
    }
  }
}

void __73__NMSMediaSettingsSynchronizer__createDefaultGreenTeaSettingsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = +[NMSGreenTeaStreamingDefaults sharedInstance];
  [v3 setGreenTeaMusicAllowCellularForStreaming:0];

  BOOL v4 = +[NMSGreenTeaStreamingDefaults sharedInstance];
  [v4 setGreenTeaMusicAllowCellularForHighQualityStreaming:0];

  id v5 = +[NMSGreenTeaStreamingDefaults sharedInstance];
  [v5 setGreenTeaMusicIsMirroringStreamingSettings:a2];
}

uint64_t __73__NMSMediaSettingsSynchronizer__createDefaultGreenTeaSettingsIfNecessary__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = NMLogForCategory(5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      int v9 = 67109376;
      int v10 = a3;
      __int16 v11 = 1024;
      int v12 = HIDWORD(a3);
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Error fetching mirroring policy %d %d", (uint8_t *)&v9, 0xEu);
    }
  }
  else if (v7)
  {
    int v9 = 67109120;
    int v10 = a2;
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Fetched mirroring policy %x", (uint8_t *)&v9, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reconcileGreenTeaSettingsIfNecessary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((isEitherDeviceGreenTeaCapable() & 1) == 0)
  {
    uint64_t v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      int v9 = "[NMSMediaSettingsSynchronizer] Neither device is Green Tea capable. Will not reconcile.";
LABEL_11:
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 2u);
    }
LABEL_12:

    return;
  }
  objc_super v3 = [(NSUserDefaults *)self->_nanoMusicSyncDefaults objectForKey:@"GreenTeaMobileIpodCellularKeysAreMirrored"];

  if (!v3)
  {
    uint64_t v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      int v9 = "[NMSMediaSettingsSynchronizer] Companion has not set Green Tea mirroring yet. We'll wait.";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v4 = +[NMSGreenTeaStreamingDefaults sharedInstance];
  char v5 = [v4 greenTeaMusicIsMirroringStreamingSettings];

  if ((v5 & 1) == 0)
  {
    int64_t v6 = [(NMSMediaSettingsSynchronizer *)self _preferredGreenTeaMusicStreamingResolutionPreference];
    BOOL v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int64_t v11 = v6;
      _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Reconciling on init. Overriding LowBandwidthResolution with %ld", (uint8_t *)&v10, 0xCu);
    }

    CFPreferencesSetAppValue(@"MusicLowBandwidthResolution", (CFPropertyListRef)[NSNumber numberWithInteger:v6], @"com.apple.mobileipod");
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
  }
}

- (void)_migrateMusicDefaultsIfNecessary
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  NSInteger v3 = [(NSUserDefaults *)self->_nanoMusicSyncDefaults integerForKey:@"NMLastSyncedMusicSettingsVersion"];
  if (v3 != 10)
  {
    unint64_t v4 = v3;
    char v5 = NMLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = v4;
      __int16 v27 = 2048;
      uint64_t v28 = 10;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Music settings migration required. LastSyncedVersion:%lu, CurrentVersion:%lu", buf, 0x16u);
    }

    if (v4 > 3)
    {
      if (v4 > 9) {
        return;
      }
    }
    else
    {
      if (!isEitherDeviceGreenTeaCapable()
        || (+[NMSGreenTeaStreamingDefaults sharedInstance],
            int64_t v6 = objc_claimAutoreleasedReturnValue(),
            int v7 = [v6 greenTeaMusicIsMirroringStreamingSettings],
            v6,
            v7))
      {
        uint64_t v8 = [MEMORY[0x263F57730] sharedInstance];
        int v9 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
        int v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];
        int64_t v11 = [v10 firstObject];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"88D7381B-F0D1-498F-88D5-9F016A27EB4F"];
        int v13 = [v11 supportsCapability:v12];

        if (v13)
        {
          id v14 = objc_alloc_init(MEMORY[0x263F57528]);
          [MEMORY[0x263EFFA08] setWithObject:@"MusicLowBandwidthResolution"];
        }
        else
        {
          NSInteger v16 = [(NSUserDefaults *)self->_mobileIPodDefaults integerForKey:@"MusicLowBandwidthResolution"];
          CFPreferencesSetAppValue(@"MusicAllowsCellularData", (CFPropertyListRef)[NSNumber numberWithInt:v16 != 0], @"com.apple.mobileipod");
          CFPreferencesSetAppValue(@"MusicAllowsHighQualityStreamingOnCellular", (CFPropertyListRef)[NSNumber numberWithInt:v16 == 256], @"com.apple.mobileipod");
          CFPreferencesAppSynchronize(@"com.apple.mobileipod");
          id v14 = objc_alloc_init(MEMORY[0x263F57528]);
          objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"MusicAllowsCellularData", @"MusicAllowsHighQualityStreamingOnCellular", 0);
        v15 = };
        [v14 synchronizeUserDefaultsDomain:@"com.apple.mobileipod" keys:v15];
      }
      [(NSUserDefaults *)self->_nanoMusicSyncDefaults setInteger:4 forKey:@"NMLastSyncedMusicSettingsVersion"];
    }
    v17 = [MEMORY[0x263F57730] sharedInstance];
    v18 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
    v19 = [v17 getAllDevicesWithArchivedAltAccountDevicesMatching:v18];
    v20 = [v19 firstObject];
    v21 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C79D46D1-84CF-4208-AEA0-39117F9770E7"];
    int v22 = [v20 supportsCapability:v21];

    if (v22)
    {
      CFPreferencesAppSynchronize(@"com.apple.Music");
      v23 = objc_opt_new();
      v24 = [MEMORY[0x263EFFA08] setWithObject:@"AllowsCellularDataDownloads"];
      [v23 synchronizeUserDefaultsDomain:@"com.apple.Music" keys:v24];

      [(NSUserDefaults *)self->_nanoMusicSyncDefaults setInteger:10 forKey:@"NMLastSyncedMusicSettingsVersion"];
    }
  }
}

- (int64_t)_preferredGreenTeaMusicStreamingResolutionPreference
{
  v2 = +[NMSGreenTeaStreamingDefaults sharedInstance];
  int v3 = [v2 greenTeaMusicAllowCellularForStreaming];

  if (v3) {
    int64_t v4 = 64;
  }
  else {
    int64_t v4 = 0;
  }
  char v5 = +[NMSGreenTeaStreamingDefaults sharedInstance];
  int v6 = [v5 greenTeaMusicAllowCellularForHighQualityStreaming];

  if (v6) {
    return 256;
  }
  else {
    return v4;
  }
}

- (id)_podcastsUserDefaults
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [getLSBundleProxyClass() bundleProxyForIdentifier:@"com.apple.podcasts"];
  int v3 = [v2 dataContainerURL];

  int64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) _initWithSuiteName:@"com.apple.podcasts" container:v3];
  char v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Observing podcasts user defaults %@ at %@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (id)_podcastsAppGroupPath
{
  v2 = [getLSBundleProxyClass() bundleProxyForIdentifier:@"com.apple.podcasts"];
  int v3 = [v2 groupContainerURLs];
  int64_t v4 = [v3 allValues];
  char v5 = [v4 firstObject];

  int v6 = [v5 path];

  return v6;
}

- (void)_syncPodcastDefaultsIfNecessary
{
  int v3 = [MEMORY[0x263F57730] sharedInstance];
  int64_t v4 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  char v5 = [v3 getAllDevicesWithArchivedDevicesMatching:v4];
  int v6 = [v5 firstObject];
  int v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"54FC3688-3F2A-435A-A95D-2F1866839415"];
  char v8 = [v6 supportsCapability:v7];

  if ((v8 & 1) == 0)
  {
    unint64_t v9 = [(NSUserDefaults *)self->_nanoMusicSyncDefaults integerForKey:@"NMLastSyncedPodcastsSettingsVersion"];
    if (v9 != 3)
    {
      if (v9 <= 2)
      {
        int v10 = NMLogForCategory(5);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Never synced podcasts defaults before.", v11, 2u);
        }

        [(NMSMediaSettingsSynchronizer *)self observeValueForKeyPath:0 ofObject:0 change:0 context:@"MTSyncSubscriptions"];
        [(NMSMediaSettingsSynchronizer *)self observeValueForKeyPath:0 ofObject:0 change:0 context:@"MTPodcastUpdateIntervalDefault"];
        [(NMSMediaSettingsSynchronizer *)self observeValueForKeyPath:0 ofObject:0 change:0 context:@"MTContinuousPlaybackEnabled"];
        [(NMSMediaSettingsSynchronizer *)self observeValueForKeyPath:0 ofObject:0 change:0 context:@"MTSkipForwardIntervalDefault"];
        [(NMSMediaSettingsSynchronizer *)self observeValueForKeyPath:0 ofObject:0 change:0 context:@"MTSkipBackwardsIntervalDefault"];
        [(NMSMediaSettingsSynchronizer *)self observeValueForKeyPath:0 ofObject:0 change:0 context:@"MTRemoteSkipInsteadOfNextTrackDefault"];
        [(NMSMediaSettingsSynchronizer *)self observeValueForKeyPath:0 ofObject:0 change:0 context:@"MTPrivacyResetIdentifier"];
      }
      [(NSUserDefaults *)self->_nanoMusicSyncDefaults setInteger:3 forKey:@"NMLastSyncedPodcastsSettingsVersion"];
    }
  }
}

- (void)endObservingUpdates
{
  if (self->_isObserving)
  {
    int v3 = NMLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v4 = 0;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] End observing setting updates.", v4, 2u);
    }

    self->_isObserving = 0;
    [(NSUserDefaults *)self->_mediaPlaybackCoreDefaults removeObserver:self forKeyPath:@"MPCPlaybackPrivateListeningEnabled" context:@"MPCPlaybackPrivateListeningEnabled"];
    [(NSUserDefaults *)self->_mobileIPodDefaults removeObserver:self forKeyPath:@"MusicLowBandwidthResolution" context:@"MusicLowBandwidthResolution"];
    [(NSUserDefaults *)self->_musicDefaults removeObserver:self forKeyPath:@"AllowsCellularDataDownloads" context:@"AllowsCellularDataDownloads"];
    [(NSUserDefaults *)self->_nanoMusicSyncDefaults removeObserver:self forKeyPath:@"GreenTeaMobileIpodCellularKeysAreMirrored" context:@"GreenTeaMobileIpodCellularKeysAreMirrored"];
    [(NSUserDefaults *)self->_nanoMusicSyncDefaults removeObserver:self forKeyPath:@"GreenTeaMusicAllowsCellularData" context:@"GreenTeaMusicAllowsCellularData"];
    [(NSUserDefaults *)self->_nanoMusicSyncDefaults removeObserver:self forKeyPath:@"GreenTeaMusicAllowsHighQualityStreamingOnCellular" context:@"GreenTeaMusicAllowsHighQualityStreamingOnCellular"];
    [(NSUserDefaults *)self->_nanoMusicSyncDefaults removeObserver:self forKeyPath:@"GreenTeaMusicAllowsDownloadsOverCellular" context:@"GreenTeaMusicAllowsDownloadsOverCellular"];
    [(NSUserDefaults *)self->_podcastsDefaults removeObserver:self forKeyPath:@"MTSyncSubscriptions" context:@"MTSyncSubscriptions"];
    [(NSUserDefaults *)self->_podcastsDefaults removeObserver:self forKeyPath:@"MTPodcastUpdateIntervalDefault" context:@"MTPodcastUpdateIntervalDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults removeObserver:self forKeyPath:@"MTContinuousPlaybackEnabled" context:@"MTContinuousPlaybackEnabled"];
    [(NSUserDefaults *)self->_podcastsDefaults removeObserver:self forKeyPath:@"MTSkipForwardIntervalDefault" context:@"MTSkipForwardIntervalDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults removeObserver:self forKeyPath:@"MTSkipBackwardsIntervalDefault" context:@"MTSkipBackwardsIntervalDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults removeObserver:self forKeyPath:@"MTRemoteSkipInsteadOfNextTrackDefault" context:@"MTRemoteSkipInsteadOfNextTrackDefault"];
    [(NSUserDefaults *)self->_podcastsDefaults removeObserver:self forKeyPath:@"MTPrivacyResetIdentifier" context:@"MTPrivacyResetIdentifier"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v72 = a3;
  id v73 = a4;
  if (isEitherDeviceGreenTeaCapable())
  {
    unint64_t v9 = NMLogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] We found a Green Tea device", buf, 2u);
    }

    int v10 = +[NMSGreenTeaStreamingDefaults sharedInstance];
    int v11 = [v10 greenTeaMusicIsMirroringStreamingSettings];
  }
  else
  {
    int v11 = 1;
  }
  v71 = self;
  int v70 = v11;
  if (a6 == @"MPCPlaybackPrivateListeningEnabled")
  {
    v74 = @"MPCPlaybackPrivateListeningEnabled";
    int v13 = -[NSUserDefaults objectForKey:](self->_mediaPlaybackCoreDefaults, "objectForKey:");
    uint64_t v12 = @"com.apple.mediaplaybackcore";
    goto LABEL_14;
  }
  if (a6 != @"MusicLowBandwidthResolution")
  {
    if (a6 == @"AllowsCellularDataDownloads")
    {
      if (v11)
      {
        v74 = @"AllowsCellularDataDownloads";
        int v13 = -[NSUserDefaults objectForKey:](self->_musicDefaults, "objectForKey:");
        uint64_t v12 = @"com.apple.Music";
        goto LABEL_14;
      }
    }
    else if (@"GreenTeaMusicAllowsCellularData" == a6 {
           || @"GreenTeaMusicAllowsHighQualityStreamingOnCellular" == a6
    }
           || @"GreenTeaMusicAllowsDownloadsOverCellular" == a6)
    {
      uint64_t v12 = @"com.apple.NanoMusicSync";
      v74 = a6;
      int v13 = -[NSUserDefaults objectForKey:](self->_nanoMusicSyncDefaults, "objectForKey:");
LABEL_14:
      char v14 = 1;
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (!v11)
  {
LABEL_20:
    char v14 = 0;
    int v13 = 0;
    v74 = 0;
    uint64_t v12 = 0;
    goto LABEL_22;
  }
  v15 = [MEMORY[0x263F57730] sharedInstance];
  NSInteger v16 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  v17 = [v15 getAllDevicesWithArchivedAltAccountDevicesMatching:v16];
  v18 = [v17 firstObject];
  v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"88D7381B-F0D1-498F-88D5-9F016A27EB4F"];
  int v20 = [v18 supportsCapability:v19];

  mobileIPodDefaults = self->_mobileIPodDefaults;
  if (v20)
  {
    v74 = @"MusicLowBandwidthResolution";
    int v13 = -[NSUserDefaults objectForKey:](mobileIPodDefaults, "objectForKey:");
    uint64_t v12 = @"com.apple.mobileipod";
    char v14 = 1;
  }
  else
  {
    uint64_t v22 = [(NSUserDefaults *)mobileIPodDefaults integerForKey:@"MusicLowBandwidthResolution"];
    uint64_t v12 = @"com.apple.mobileipod";
    CFPreferencesSetAppValue(@"MusicAllowsCellularData", (CFPropertyListRef)[NSNumber numberWithInt:v22 != 0], @"com.apple.mobileipod");
    CFPreferencesSetAppValue(@"MusicAllowsHighQualityStreamingOnCellular", (CFPropertyListRef)[NSNumber numberWithInt:v22 == 256], @"com.apple.mobileipod");
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
    id v23 = objc_alloc_init(MEMORY[0x263F57528]);
    v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"MusicAllowsCellularData", @"MusicAllowsHighQualityStreamingOnCellular", 0);
    [v23 synchronizeUserDefaultsDomain:@"com.apple.mobileipod" keys:v24];

    char v14 = 0;
    int v13 = 0;
    v74 = 0;
  }
LABEL_22:
  v25 = [MEMORY[0x263F57730] sharedInstance];
  unint64_t v26 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  __int16 v27 = [v25 getAllDevicesWithArchivedDevicesMatching:v26];
  uint64_t v28 = [v27 firstObject];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"54FC3688-3F2A-435A-A95D-2F1866839415"];
  char v30 = [v28 supportsCapability:v29];

  if (v30)
  {
LABEL_23:
    if (v14)
    {
      v31 = v13;
      v32 = v72;
      v33 = v74;
LABEL_44:
      v41 = NMLogForCategory(5);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v76 = v12;
        *(_WORD *)&v76[8] = 2112;
        *(void *)v77 = v33;
        *(_WORD *)&v77[8] = 2112;
        *(void *)v78 = v31;
        _os_log_impl(&dword_2228FD000, v41, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Synchronizing defaults for domain: %@, key: %@, value: %@", buf, 0x20u);
      }

      id v35 = objc_alloc_init(MEMORY[0x263F57528]);
      v37 = [MEMORY[0x263EFFA08] setWithObject:v33];
      [v35 synchronizeUserDefaultsDomain:v12 keys:v37];
      goto LABEL_47;
    }
    id v35 = 0;
    v31 = v13;
    goto LABEL_35;
  }
  v33 = @"MTSyncSubscriptions";
  if (a6 == @"MTSyncSubscriptions")
  {
    p_isa = (id *)&v71->super.isa;
LABEL_39:

    id v35 = [p_isa _podcastsAppGroupPath];

    v31 = [p_isa[6] objectForKey:v33];

    goto LABEL_40;
  }
  v33 = @"MTPodcastUpdateIntervalDefault";
  p_isa = (id *)&v71->super.isa;
  if (a6 == @"MTPodcastUpdateIntervalDefault") {
    goto LABEL_39;
  }
  v33 = @"MTContinuousPlaybackEnabled";
  if (a6 == @"MTContinuousPlaybackEnabled") {
    goto LABEL_39;
  }
  v33 = @"MTSkipForwardIntervalDefault";
  if (a6 == @"MTSkipForwardIntervalDefault") {
    goto LABEL_39;
  }
  v33 = @"MTSkipBackwardsIntervalDefault";
  if (a6 == @"MTSkipBackwardsIntervalDefault") {
    goto LABEL_39;
  }
  v33 = @"MTRemoteSkipInsteadOfNextTrackDefault";
  if (a6 == @"MTRemoteSkipInsteadOfNextTrackDefault") {
    goto LABEL_39;
  }
  if (a6 != @"MTPrivacyResetIdentifier") {
    goto LABEL_23;
  }

  id v35 = [(NMSMediaSettingsSynchronizer *)v71 _podcastsAppGroupPath];

  v33 = @"MTPrivacyResetIdentifier";
  v31 = [(NSUserDefaults *)v71->_podcastsDefaults objectForKey:@"MTPrivacyResetIdentifier"];

  if (([v31 BOOLValue] & 1) == 0)
  {
    v74 = @"MTPrivacyResetIdentifier";
    uint64_t v12 = @"243LU875E5.groups.com.apple.podcasts";
LABEL_35:
    v36 = NMLogForCategory(5);
    v37 = v36;
    if (@"GreenTeaMobileIpodCellularKeysAreMirrored" == a6)
    {
      v42 = v71;
      v32 = v72;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v37, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] GreenTeaMobileIpodCellularKeysAreMirrored did change", buf, 2u);
      }

      if (v70)
      {
        uint64_t v68 = [(NSUserDefaults *)v71->_mobileIPodDefaults integerForKey:@"MusicLowBandwidthResolution"];
        v43 = [MEMORY[0x263F57730] sharedInstance];
        v44 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
        v45 = [v43 getAllDevicesWithArchivedAltAccountDevicesMatching:v44];
        v46 = [v45 firstObject];
        v47 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"88D7381B-F0D1-498F-88D5-9F016A27EB4F"];
        int v69 = [v46 supportsCapability:v47];

        v48 = NMLogForCategory(5);
        BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
        if (v69)
        {
          if (v49)
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v76 = v68;
            _os_log_impl(&dword_2228FD000, v48, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing preferredMusicLowBandwidthResolution %ld", buf, 0xCu);
          }

          id v50 = objc_alloc_init(MEMORY[0x263F57528]);
          uint64_t v51 = [MEMORY[0x263EFFA08] setWithObject:@"MusicLowBandwidthResolution"];
        }
        else
        {
          if (v49)
          {
            v56 = [(NSUserDefaults *)v71->_mobileIPodDefaults objectForKey:@"MusicAllowsCellularData"];
            v57 = [(NSUserDefaults *)v71->_mobileIPodDefaults objectForKey:@"MusicAllowsHighQualityStreamingOnCellular"];
            *(_DWORD *)buf = 138412546;
            *(void *)v76 = v56;
            *(_WORD *)&v76[8] = 2112;
            *(void *)v77 = v57;
            _os_log_impl(&dword_2228FD000, v48, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing CellularStreamingAllowed %@ and MusicAllowsHighQualityStreamingOnCellular %@", buf, 0x16u);
          }
          id v50 = objc_alloc_init(MEMORY[0x263F57528]);
          uint64_t v51 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"MusicAllowsCellularData", @"MusicAllowsHighQualityStreamingOnCellular", 0);
        }
        v58 = (void *)v51;
        [v50 synchronizeUserDefaultsDomain:@"com.apple.mobileipod" keys:v51];
        v42 = v71;

        v59 = NMLogForCategory(5);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = [(NSUserDefaults *)v71->_musicDefaults objectForKey:@"AllowsCellularDataDownloads"];
          *(_DWORD *)buf = 138412290;
          *(void *)v76 = v60;
          _os_log_impl(&dword_2228FD000, v59, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing AllowsDownloadsOverCellular %@", buf, 0xCu);
        }
        id v61 = objc_alloc_init(MEMORY[0x263F57528]);
        v62 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"AllowsCellularDataDownloads", 0);
        v63 = @"com.apple.Music";
        v64 = v61;
      }
      else
      {
        v52 = NMLogForCategory(5);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [(NSUserDefaults *)v71->_nanoMusicSyncDefaults objectForKey:@"GreenTeaMusicAllowsCellularData"];
          v54 = -[NSUserDefaults objectForKey:](v71->_nanoMusicSyncDefaults, "objectForKey:");
          v55 = -[NSUserDefaults objectForKey:](v71->_nanoMusicSyncDefaults, "objectForKey:");
          *(_DWORD *)buf = 138412802;
          *(void *)v76 = v53;
          *(_WORD *)&v76[8] = 2112;
          *(void *)v77 = v54;
          *(_WORD *)&v77[8] = 2112;
          *(void *)v78 = v55;
          _os_log_impl(&dword_2228FD000, v52, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing GreenTeaCellularStreamingAllowed %@, GreenTeaMusicAllowsHighQualityStreamingOnCellular %@, and GreenTeaMusicAllowsDownloadsOverCellular: %@", buf, 0x20u);

          v42 = v71;
        }

        id v61 = objc_alloc_init(MEMORY[0x263F57528]);
        v62 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"GreenTeaMusicAllowsCellularData", @"GreenTeaMusicAllowsHighQualityStreamingOnCellular", @"GreenTeaMusicAllowsDownloadsOverCellular", 0);
        v64 = v61;
        v63 = @"com.apple.NanoMusicSync";
      }
      [v64 synchronizeUserDefaultsDomain:v63 keys:v62];

      v65 = NMLogForCategory(5);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = [(NSUserDefaults *)v42->_nanoMusicSyncDefaults objectForKey:a6];
        *(_DWORD *)buf = 138412546;
        *(void *)v76 = v66;
        *(_WORD *)&v76[8] = 1024;
        *(_DWORD *)v77 = v70;
        _os_log_impl(&dword_2228FD000, v65, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer]\tSynchronizing GreenTeaMobileIpodCellularKeysAreMirrored %@ BOOL value %x", buf, 0x12u);
      }
      v37 = objc_alloc_init(MEMORY[0x263F57528]);
      v67 = [MEMORY[0x263EFFA08] setWithObject:a6];
      [v37 synchronizeUserDefaultsDomain:@"com.apple.NanoMusicSync" keys:v67];

      v33 = v74;
    }
    else
    {
      v32 = v72;
      v33 = v74;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v38 = isEitherDeviceGreenTeaCapable();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v76 = v38;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v70;
        *(_WORD *)v77 = 2112;
        *(void *)&v77[2] = v72;
        *(_WORD *)v78 = 2112;
        *(void *)&v78[2] = v73;
        *(_WORD *)v79 = 2112;
        *(void *)&v79[2] = a6;
        _os_log_error_impl(&dword_2228FD000, v37, OS_LOG_TYPE_ERROR, "[NMSMediaSettingsSynchronizer] Did not sync value change. isGreenTea %x, isMirroringCellularPolicy: %x, keypath: %@, object: %@, context: %@", buf, 0x2Cu);
      }
    }
    goto LABEL_47;
  }
LABEL_40:
  v32 = v72;
  uint64_t v12 = @"243LU875E5.groups.com.apple.podcasts";
  if (!v35) {
    goto LABEL_44;
  }
  v39 = NMLogForCategory(5);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)v76 = @"243LU875E5.groups.com.apple.podcasts";
    *(_WORD *)&v76[8] = 2112;
    *(void *)v77 = @"com.apple.podcasts";
    *(_WORD *)&v77[8] = 2112;
    *(void *)v78 = @"243LU875E5.groups.com.apple.podcasts";
    *(_WORD *)&v78[8] = 2112;
    *(void *)v79 = v33;
    *(_WORD *)&v79[8] = 2112;
    v80 = v31;
    _os_log_impl(&dword_2228FD000, v39, OS_LOG_TYPE_DEFAULT, "[NMSMediaSettingsSynchronizer] Synchronizing defaults for domain: %@, container: %@, appGroup: %@, key: %@, value: %@", buf, 0x34u);
  }

  v37 = objc_alloc_init(MEMORY[0x263F57528]);
  v40 = [MEMORY[0x263EFFA08] setWithObject:v33];
  [v37 synchronizeUserDefaultsDomain:@"243LU875E5.groups.com.apple.podcasts" keys:v40 container:@"com.apple.podcasts" appGroupContainer:@"243LU875E5.groups.com.apple.podcasts"];

LABEL_47:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastsDefaults, 0);
  objc_storeStrong((id *)&self->_nanoMusicSyncDefaults, 0);
  objc_storeStrong((id *)&self->_musicDefaults, 0);
  objc_storeStrong((id *)&self->_mobileIPodDefaults, 0);

  objc_storeStrong((id *)&self->_mediaPlaybackCoreDefaults, 0);
}

@end