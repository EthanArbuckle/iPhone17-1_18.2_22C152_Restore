@interface VUIPlaybackSettings
+ (id)sharedSettings;
- (BOOL)cellularDataDownloadEnabled;
- (BOOL)cellularDataPlaybackEnabled;
- (BOOL)preferAVAdapterCompatibility;
- (BOOL)useDefaultSubtitleDownloadLanguages;
- (NSArray)preferredAudioDownloadLanguages;
- (NSArray)preferredSubtitleDownloadLanguages;
- (NSString)preferredAudioLanguageCode;
- (VUIPlaybackSettings)init;
- (id)_descriptionForExternalScreenType:(unsigned int)a3;
- (int64_t)_downloadQualityForString:(id)a3;
- (int64_t)_playbackQualityForString:(id)a3 forCellular:(BOOL)a4;
- (int64_t)networkStatus;
- (int64_t)preferredCellularDownloadQuality;
- (int64_t)preferredCellularPlaybackQuality;
- (int64_t)preferredDownloadQualityForCurrentNetworkStatus;
- (int64_t)preferredPlaybackQualityForCurrentNetworkStatus;
- (int64_t)preferredWifiDownloadQuality;
- (int64_t)preferredWifiPlaybackQuality;
- (void)_externalScreenTypeDidChange:(id)a3;
- (void)_handlePreferencesDidChangeNotification:(id)a3;
- (void)_registerObserverForUserPrefsChange;
- (void)_sceneWillConnect:(id)a3;
- (void)_updateNetworkStatus;
- (void)_updatePropertiesFromUserPrefs;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)setCellularDataDownloadEnabled:(BOOL)a3;
- (void)setCellularDataPlaybackEnabled:(BOOL)a3;
- (void)setNetworkStatus:(int64_t)a3;
- (void)setPreferAVAdapterCompatibility:(BOOL)a3;
- (void)setPreferredAudioDownloadLanguages:(id)a3;
- (void)setPreferredAudioLanguageCode:(id)a3;
- (void)setPreferredCellularDownloadQuality:(int64_t)a3;
- (void)setPreferredCellularPlaybackQuality:(int64_t)a3;
- (void)setPreferredSubtitleDownloadLanguages:(id)a3;
- (void)setPreferredWifiDownloadQuality:(int64_t)a3;
- (void)setPreferredWifiPlaybackQuality:(int64_t)a3;
- (void)setUseDefaultSubtitleDownloadLanguages:(BOOL)a3;
- (void)updateSupplementaryAvailableAudioLanguageCodes:(id)a3;
@end

@implementation VUIPlaybackSettings

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

void __37__VUIPlaybackSettings_sharedSettings__block_invoke()
{
  v0 = objc_alloc_init(VUIPlaybackSettings);
  v1 = (void *)sharedSettings_sSharedSettings;
  sharedSettings_sSharedSettings = (uint64_t)v0;
}

- (VUIPlaybackSettings)init
{
  v20.receiver = self;
  v20.super_class = (Class)VUIPlaybackSettings;
  v2 = [(VUIPlaybackSettings *)&v20 init];
  if (v2)
  {
    MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();
    v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v3 registerObserver:v2];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__externalScreenTypeDidChange_ name:*MEMORY[0x1E4F77388] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__sceneWillConnect_ name:*MEMORY[0x1E4FB2EA0] object:0];

    objc_initWeak(&location, v2);
    id v7 = MEMORY[0x1E4F14428];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __27__VUIPlaybackSettings_init__block_invoke;
    v17 = &unk_1E6DF6770;
    objc_copyWeak(&v18, &location);
    MRMediaRemoteGetExternalScreenType();

    v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v9 = [v8 vuiIsNonLightningAVAdapterConnected];

    if (v9)
    {
      v10 = VUIDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "A non-Lightning AV adapter is connected", v13, 2u);
      }

      v11 = [MEMORY[0x1E4FB5178] sharedPreferences];
      [v11 setHasAVAdapterEvenBeenConnected:1];
    }
    [(VUIPlaybackSettings *)v2 _updateNetworkStatus];
    [(VUIPlaybackSettings *)v2 _updatePropertiesFromUserPrefs];
    [(VUIPlaybackSettings *)v2 _registerObserverForUserPrefsChange];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_updateNetworkStatus
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v4 = [v3 networkType];

  v5 = VUIDefaultLogObject();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_8;
  }
  v6 = @"Unknown";
  if (v4 > 99)
  {
    if (v4 > 1000)
    {
      switch(v4)
      {
        case 1001:
          v6 = @"Bridged WiFi";
          break;
        case 2000:
          v6 = @"Wired Ethernet";
          break;
        case 3000:
          v6 = @"Other";
          break;
      }
      goto LABEL_5;
    }
    if (v4 != 100)
    {
      if (v4 == 500)
      {
        v6 = @"Bluetooth";
      }
      else if (v4 == 1000)
      {
        v6 = @"WiFi";
      }
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if ((unint64_t)(v4 - 1) < 8) {
LABEL_4:
  }
    v6 = @"Cellular";
LABEL_5:
  id v7 = [MEMORY[0x1E4FB8618] sharedMonitor];
  int v8 = [v7 isCurrentNetworkLinkExpensive];
  int v9 = @"NO";
  *(_DWORD *)v11 = 134218498;
  *(void *)&v11[4] = v4;
  *(_WORD *)&v11[12] = 2112;
  if (v8) {
    int v9 = @"YES";
  }
  *(void *)&v11[14] = v6;
  __int16 v12 = 2112;
  v13 = v9;
  _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Network type did change to %ld (%@) is expensive: %@", v11, 0x20u);

LABEL_8:
  if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0
    || (ICEnvironmentNetworkTypeIsWired() & 1) != 0
    || (ICEnvironmentNetworkTypeIsBluetooth() & 1) != 0)
  {
    uint64_t v10 = 1;
  }
  else if (ICEnvironmentNetworkTypeIsCellular())
  {
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 0;
  }
  -[VUIPlaybackSettings setNetworkStatus:](self, "setNetworkStatus:", v10, *(_OWORD *)v11);
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (void)_registerObserverForUserPrefsChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handlePreferencesDidChangeNotification_ name:*MEMORY[0x1E4FB52A8] object:0];
}

- (void)_updatePropertiesFromUserPrefs
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB5178] sharedPreferences];
  char v25 = [v3 useCellularDataPlayback];

  uint64_t v4 = [MEMORY[0x1E4FB5178] sharedPreferences];
  v5 = [v4 wifiQualityPlayback];

  v6 = [MEMORY[0x1E4FB5178] sharedPreferences];
  id v7 = [v6 cellularQualityPlayback];

  int v8 = [MEMORY[0x1E4FB5178] sharedPreferences];
  v24 = [v8 audioLanguageCode];

  int v9 = [MEMORY[0x1E4FB5178] sharedPreferences];
  char v10 = [v9 useCellularDataDownload];

  v11 = [MEMORY[0x1E4FB5178] sharedPreferences];
  char v12 = [v11 downloadsCompatibleWithAVAdapter];

  v13 = [MEMORY[0x1E4FB5178] sharedPreferences];
  uint64_t v14 = [v13 wifiQualityDownload];

  uint64_t v15 = [MEMORY[0x1E4FB5178] sharedPreferences];
  v16 = [v15 cellularQualityDownload];

  v17 = [MEMORY[0x1E4FB5178] sharedPreferences];
  id v18 = [v17 selectedAudioLanguagesDownload];

  if (![v18 count])
  {
    v26[0] = @"ORIGINAL_AUDIO_LANGUAGE";
    v26[1] = @"DEVICE_AUDIO_LANGUAGE";
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    goto LABEL_5;
  }
  if ([v18 containsObject:@"DEFAULT_LANGUAGE"])
  {
    v19 = (void *)[v18 mutableCopy];
    [v19 removeObject:@"DEFAULT_LANGUAGE"];
    [v19 insertObject:@"ORIGINAL_AUDIO_LANGUAGE" atIndex:0];
    [v19 insertObject:@"DEVICE_AUDIO_LANGUAGE" atIndex:1];
LABEL_5:

    id v18 = v19;
  }
  objc_super v20 = [MEMORY[0x1E4FB5178] sharedPreferences];
  [v20 subtitleDefaultLanguageEnabledDownload];

  v21 = [MEMORY[0x1E4FB5178] sharedPreferences];
  v22 = [v21 subtitleAudioLanguagesDownload];

  [(VUIPlaybackSettings *)self setPreferredWifiPlaybackQuality:[(VUIPlaybackSettings *)self _playbackQualityForString:v5 forCellular:0]];
  [(VUIPlaybackSettings *)self setPreferredCellularPlaybackQuality:[(VUIPlaybackSettings *)self _playbackQualityForString:v7 forCellular:1]];
  [(VUIPlaybackSettings *)self setPreferredCellularDownloadQuality:[(VUIPlaybackSettings *)self _downloadQualityForString:v16]];
  [(VUIPlaybackSettings *)self setPreferredAudioDownloadLanguages:v18];
  [(VUIPlaybackSettings *)self setUseDefaultSubtitleDownloadLanguages:1];
  [(VUIPlaybackSettings *)self setPreferredSubtitleDownloadLanguages:v22];
  self->_cellularDataPlaybackEnabled = v25;
  self->_cellularDataDownloadEnabled = v10;
  preferredAudioLanguageCode = self->_preferredAudioLanguageCode;
  self->_preferredAudioLanguageCode = v24;

  self->_preferAVAdapterCompatibility = v12;
  self->_preferredWifiDownloadQuality = [(VUIPlaybackSettings *)self _downloadQualityForString:v14];
}

- (int64_t)_playbackQualityForString:(id)a3 forCellular:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isEqualToString:*MEMORY[0x1E4FB51C8]]) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4FB51D0]] | v4;
  }

  return v6;
}

- (int64_t)_downloadQualityForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4FB51B8]])
  {
    int64_t v4 = 0;
  }
  else
  {
    [v3 isEqualToString:*MEMORY[0x1E4FB51C0]];
    int64_t v4 = 1;
  }

  return v4;
}

- (void)setUseDefaultSubtitleDownloadLanguages:(BOOL)a3
{
  self->_useDefaultSubtitleDownloadLanguages = a3;
}

- (void)setPreferredWifiPlaybackQuality:(int64_t)a3
{
  self->_preferredWifiPlaybackQuality = a3;
}

- (void)setPreferredWifiDownloadQuality:(int64_t)a3
{
  self->_preferredWifiDownloadQuality = a3;
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    id v3 = (id *)MEMORY[0x1E4FB51C0];
  }
  else
  {
    id v3 = (id *)MEMORY[0x1E4FB51B8];
  }
  id v4 = *v3;
  if (v4)
  {
    id v6 = v4;
    id v5 = [MEMORY[0x1E4FB5178] sharedPreferences];
    [v5 setWifiQualityDownload:v6];
  }
}

- (void)setPreferredSubtitleDownloadLanguages:(id)a3
{
}

- (void)setPreferredCellularPlaybackQuality:(int64_t)a3
{
  self->_preferredCellularPlaybackQuality = a3;
}

- (void)setPreferredCellularDownloadQuality:(int64_t)a3
{
  self->_preferredCellularDownloadQuality = a3;
}

- (void)setPreferredAudioDownloadLanguages:(id)a3
{
}

void __27__VUIPlaybackSettings_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [WeakRetained _descriptionForExternalScreenType:a2];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Initial external screen type is %@", (uint8_t *)&v7, 0xCu);
  }
  if (a2 == 2)
  {
    id v6 = [MEMORY[0x1E4FB5178] sharedPreferences];
    [v6 setHasAVAdapterEvenBeenConnected:1];
  }
}

- (id)_descriptionForExternalScreenType:(unsigned int)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6DF6790[a3];
  }
}

+ (id)sharedSettings
{
  if (sharedSettings_onceToken != -1) {
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)sharedSettings_sSharedSettings;
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackSettings;
  [(VUIPlaybackSettings *)&v4 dealloc];
}

- (int64_t)preferredPlaybackQualityForCurrentNetworkStatus
{
  int64_t v3 = [(VUIPlaybackSettings *)self networkStatus];
  if (v3 == 2)
  {
    return [(VUIPlaybackSettings *)self preferredCellularPlaybackQuality];
  }
  else if (v3 == 1)
  {
    return [(VUIPlaybackSettings *)self preferredWifiPlaybackQuality];
  }
  else
  {
    return 0;
  }
}

- (int64_t)preferredDownloadQualityForCurrentNetworkStatus
{
  int64_t v3 = [(VUIPlaybackSettings *)self networkStatus];
  if (v3 == 2)
  {
    return [(VUIPlaybackSettings *)self preferredCellularDownloadQuality];
  }
  else if (v3 == 1)
  {
    return [(VUIPlaybackSettings *)self preferredWifiDownloadQuality];
  }
  else
  {
    return 1;
  }
}

- (BOOL)cellularDataPlaybackEnabled
{
  return self->_cellularDataPlaybackEnabled;
}

- (void)setCellularDataPlaybackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_cellularDataPlaybackEnabled = a3;
  id v4 = [MEMORY[0x1E4FB5178] sharedPreferences];
  [v4 setUseCellularDataPlayback:v3];
}

- (BOOL)cellularDataDownloadEnabled
{
  return self->_cellularDataDownloadEnabled;
}

- (void)setCellularDataDownloadEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_cellularDataDownloadEnabled = a3;
  id v4 = [MEMORY[0x1E4FB5178] sharedPreferences];
  [v4 setUseCellularDataDownload:v3];
}

- (NSString)preferredAudioLanguageCode
{
  return self->_preferredAudioLanguageCode;
}

- (void)setPreferredAudioLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, a3);
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB5178] sharedPreferences];
  [v5 setAudioLanguageCode:v4];
}

- (BOOL)preferAVAdapterCompatibility
{
  return self->_preferAVAdapterCompatibility;
}

- (void)setPreferAVAdapterCompatibility:(BOOL)a3
{
  BOOL v3 = a3;
  self->_preferAVAdapterCompatibility = a3;
  id v4 = [MEMORY[0x1E4FB5178] sharedPreferences];
  [v4 setHasAVAdapterEvenBeenConnected:1];

  id v5 = [MEMORY[0x1E4FB5178] sharedPreferences];
  [v5 setDownloadsCompatibleWithAVAdapter:v3];
}

- (int64_t)preferredWifiDownloadQuality
{
  return self->_preferredWifiDownloadQuality;
}

- (void)updateSupplementaryAvailableAudioLanguageCodes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Updating supplementary available audio language codes with %@", buf, 0xCu);
  }

  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [MEMORY[0x1E4FB5178] sharedPreferences];
  int v7 = [v6 supplementaryAvailableAudioLanguages];
  id v8 = (id)[v5 initWithArray:v7];

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14, (void)v17) & 1) == 0) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  uint64_t v15 = VUIDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Updated supplementary available audio language codes: %@", buf, 0xCu);
  }

  v16 = [MEMORY[0x1E4FB5178] sharedPreferences];
  [v16 setSupplementaryAvailableAudioLanguages:v8];
}

- (void)_externalScreenTypeDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = objc_msgSend(v4, "vui_numberForKey:", *MEMORY[0x1E4F77390]);
  uint64_t v6 = [v5 unsignedIntValue];

  int v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(VUIPlaybackSettings *)self _descriptionForExternalScreenType:v6];
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "External screen type did change to %@", (uint8_t *)&v10, 0xCu);
  }
  if (v6 == 2)
  {
    id v9 = [MEMORY[0x1E4FB5178] sharedPreferences];
    [v9 setHasAVAdapterEvenBeenConnected:1];
  }
}

- (void)_sceneWillConnect:(id)a3
{
  id v3 = [a3 object];
  if (objc_msgSend(v3, "vui_isNonLightningSecondScreenScene"))
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "A non-Lightning AV adapter was connected", v6, 2u);
    }

    id v5 = [MEMORY[0x1E4FB5178] sharedPreferences];
    [v5 setHasAVAdapterEvenBeenConnected:1];
  }
}

- (void)_handlePreferencesDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v4 = __63__VUIPlaybackSettings__handlePreferencesDidChangeNotification___block_invoke;
  id v5 = &unk_1E6DF3D58;
  uint64_t v6 = self;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __63__VUIPlaybackSettings__handlePreferencesDidChangeNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePropertiesFromUserPrefs];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VUIPlaybackSettingsUserPreferencesDidChange" object:*(void *)(a1 + 32)];
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __62__VUIPlaybackSettings_environmentMonitorDidChangeNetworkType___block_invoke;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__VUIPlaybackSettings_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateNetworkStatus];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VUIPlaybackSettingsNetworkStatusDidChange" object:*(void *)(a1 + 32)];
}

- (int64_t)preferredWifiPlaybackQuality
{
  return self->_preferredWifiPlaybackQuality;
}

- (int64_t)preferredCellularPlaybackQuality
{
  return self->_preferredCellularPlaybackQuality;
}

- (int64_t)preferredCellularDownloadQuality
{
  return self->_preferredCellularDownloadQuality;
}

- (NSArray)preferredAudioDownloadLanguages
{
  return self->_preferredAudioDownloadLanguages;
}

- (BOOL)useDefaultSubtitleDownloadLanguages
{
  return self->_useDefaultSubtitleDownloadLanguages;
}

- (NSArray)preferredSubtitleDownloadLanguages
{
  return self->_preferredSubtitleDownloadLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSubtitleDownloadLanguages, 0);
  objc_storeStrong((id *)&self->_preferredAudioDownloadLanguages, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, 0);
}

@end