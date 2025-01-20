@interface VUIPlayer
+ (id)savedPreferredAudioLanguageCode;
+ (void)initialize;
+ (void)updateSupplementaryAvailableAudioLanguageCodes:(id)a3;
- (VUIPlayer)initWithName:(id)a3;
- (void)_configurePlayerForCurrentNetworkSettingsAndMediaItem;
- (void)_videoPlaybackSettingsDidChange:(id)a3;
- (void)dealloc;
@end

@implementation VUIPlayer

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_11);
  }
}

void __23__VUIPlayer_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIPlayer");
  v1 = (void *)sLogObject_1;
  sLogObject_1 = (uint64_t)v0;
}

- (VUIPlayer)initWithName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VUIPlayer;
  v3 = [(TVPPlayer *)&v12 initWithName:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__currentMediaItemDidChange_ name:*MEMORY[0x1E4FAA240] object:v3];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = +[VUIPlaybackSettings sharedSettings];
    [v5 addObserver:v3 selector:sel__videoPlaybackSettingsDidChange_ name:@"VUIPlaybackSettingsUserPreferencesDidChange" object:v6];

    v7 = +[VUIPlaybackSettings sharedSettings];
    uint64_t v8 = [v7 cellularDataPlaybackEnabled];

    v9 = sLogObject_1;
    if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
    {
      v10 = @"not ";
      if (v8) {
        v10 = &stru_1F3E921E0;
      }
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Use Cellular Data for Playback setting is %@enabled", buf, 0xCu);
    }
    [(TVPPlayer *)v3 setAllowsCellularUsage:v8];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIPlayer;
  [(TVPPlayer *)&v4 dealloc];
}

+ (id)savedPreferredAudioLanguageCode
{
  v2 = +[VUIPlaybackSettings sharedSettings];
  v3 = [v2 preferredAudioLanguageCode];

  return v3;
}

+ (void)updateSupplementaryAvailableAudioLanguageCodes:(id)a3
{
  id v3 = a3;
  id v4 = +[VUIPlaybackSettings sharedSettings];
  [v4 updateSupplementaryAvailableAudioLanguageCodes:v3];
}

- (void)_videoPlaybackSettingsDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = +[VUIPlaybackSettings sharedSettings];
  uint64_t v5 = [v4 cellularDataPlaybackEnabled];

  v6 = sLogObject_1;
  if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"not ";
    if (v5) {
      v7 = &stru_1F3E921E0;
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "After settings change, Use Cellular Data for Playback setting is %@enabled", (uint8_t *)&v8, 0xCu);
  }
  [(TVPPlayer *)self setAllowsCellularUsage:v5];
  [(VUIPlayer *)self _configurePlayerForCurrentNetworkSettingsAndMediaItem];
}

- (void)_configurePlayerForCurrentNetworkSettingsAndMediaItem
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [(TVPPlayer *)self currentMediaItem];
  id v4 = v3;
  if (!v3) {
    goto LABEL_46;
  }
  uint64_t v5 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB8]];
  int v6 = [v5 BOOLValue];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    v9 = +[VUIPlaybackSettings sharedSettings];
    uint64_t v8 = [v9 preferredWifiPlaybackQuality];

    uint64_t v10 = +[VUIPlaybackSettings sharedSettings];
    uint64_t v7 = [v10 preferredCellularPlaybackQuality];
  }
  v11 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v12 = [v11 networkType];

  v13 = sLogObject_1;
  if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
  {
    v14 = @"Good";
    uint64_t v15 = @"Best";
    if (!v8) {
      v14 = @"Best";
    }
    if (v7) {
      uint64_t v15 = @"Auto";
    }
    *(_DWORD *)v42 = 138412802;
    *(void *)&v42[4] = v14;
    *(_WORD *)&v42[12] = 2112;
    *(void *)&v42[14] = v15;
    v16 = @"NO";
    if (v6) {
      v16 = @"YES";
    }
    *(_WORD *)&v42[22] = 2112;
    v43 = v16;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Wifi playback quality setting: %@, cellular playback quality setting: %@, force high quality: %@", v42, 0x20u);
  }
  v17 = (void *)sLogObject_1;
  if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
  {
    v18 = @"Unknown";
    if (v12 > 99)
    {
      if (v12 > 1000)
      {
        switch(v12)
        {
          case 1001:
            v18 = @"Bridged WiFi";
            break;
          case 2000:
            v18 = @"Wired Ethernet";
            break;
          case 3000:
            v18 = @"Other";
            break;
        }
        goto LABEL_17;
      }
      if (v12 != 100)
      {
        if (v12 == 500)
        {
          v18 = @"Bluetooth";
        }
        else if (v12 == 1000)
        {
          v18 = @"WiFi";
        }
        goto LABEL_17;
      }
    }
    else if ((unint64_t)(v12 - 1) >= 8)
    {
LABEL_17:
      v19 = (void *)MEMORY[0x1E4FB8618];
      v20 = v17;
      v21 = [v19 sharedMonitor];
      int v22 = [v21 isCurrentNetworkLinkExpensive];
      *(_DWORD *)v42 = 134218498;
      v23 = @"NO";
      if (v22) {
        v23 = @"YES";
      }
      *(void *)&v42[4] = v12;
      *(_WORD *)&v42[12] = 2112;
      *(void *)&v42[14] = v18;
      *(_WORD *)&v42[22] = 2112;
      v43 = v23;
      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Network type is %ld (%@) is expensive: %@", v42, 0x20u);

      goto LABEL_20;
    }
    v18 = @"Cellular";
    goto LABEL_17;
  }
LABEL_20:
  double v24 = *MEMORY[0x1E4F1DB30];
  double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v7) {
    double v26 = 432.0;
  }
  else {
    double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (v7) {
    double v27 = 768.0;
  }
  else {
    double v27 = *MEMORY[0x1E4F1DB30];
  }
  int IsCellular = ICEnvironmentNetworkTypeIsCellular();
  if (v8) {
    int v29 = IsCellular;
  }
  else {
    int v29 = 1;
  }
  if (!v29)
  {
    double v24 = 1024.0;
    double v25 = 576.0;
  }
  [(TVPPlayer *)self preferredMaximumResolution];
  if (v24 != v31 || v25 != v30)
  {
    v33 = (void *)sLogObject_1;
    if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      v45.width = v24;
      v45.height = v25;
      v35 = NSStringFromCGSize(v45);
      *(_DWORD *)v42 = 138412290;
      *(void *)&v42[4] = v35;
      _os_log_impl(&dword_1E2BD7000, v34, OS_LOG_TYPE_DEFAULT, "Setting preferredMaximumResolution to %@", v42, 0xCu);
    }
    -[TVPPlayer setPreferredMaximumResolution:](self, "setPreferredMaximumResolution:", v24, v25);
  }
  [(TVPPlayer *)self preferredMaximumResolutionForExpensiveNetworks];
  if (v27 != v37 || v26 != v36)
  {
    v39 = (void *)sLogObject_1;
    if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v39;
      v46.width = v27;
      v46.height = v26;
      v41 = NSStringFromCGSize(v46);
      *(_DWORD *)v42 = 138412290;
      *(void *)&v42[4] = v41;
      _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_DEFAULT, "Setting preferredMaximumResolutionForExpensiveNetworks to %@", v42, 0xCu);
    }
    -[TVPPlayer setPreferredMaximumResolutionForExpensiveNetworks:](self, "setPreferredMaximumResolutionForExpensiveNetworks:", v27, v26);
  }

LABEL_46:
}

@end