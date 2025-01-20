@interface MTPreferences
+ (BOOL)_copyUserDefaultToSharedContainer:(id)a3 synchronize:(BOOL)a4;
+ (BOOL)copySettingsToSharedContainer;
+ (id)defaultSettings;
+ (int64_t)defaultEpisodeLimit;
+ (void)moveUserDefaultToSharedContainer:(id)a3;
+ (void)registerDefaults;
@end

@implementation MTPreferences

+ (BOOL)copySettingsToSharedContainer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[PFClientUtil isPodcastsApp]
    && ([MEMORY[0x1E4F1CB18] settingsAppWritesDirectlyToSharedUserDefaults] & 1) == 0)
  {
    v4 = [a1 defaultSettings];
    v5 = [v4 allKeys];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v6);
          }
          v9 |= objc_msgSend(a1, "_copyUserDefaultToSharedContainer:synchronize:", *(void *)(*((void *)&v14 + 1) + 8 * i), 0, (void)v14);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);

      if ((v9 & 1) == 0)
      {
        char v3 = 0;
        goto LABEL_16;
      }
      v12 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
      char v3 = [v12 synchronize];
    }
    else
    {
      char v3 = 0;
      v12 = v6;
    }

LABEL_16:
    return v3;
  }
  return 0;
}

void __32__MTPreferences_defaultSettings__block_invoke(uint64_t a1)
{
  v5[14] = *MEMORY[0x1E4F143B8];
  v4[0] = @"MTUseCustomColorsKey";
  v4[1] = @"MTWiFiDownloadOnly";
  v5[0] = MEMORY[0x1E4F1CC38];
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[2] = @"MTSyncSubscriptions";
  v4[3] = @"MTShowSiriSuggestions";
  v5[2] = MEMORY[0x1E4F1CC38];
  v5[3] = MEMORY[0x1E4F1CC38];
  v4[4] = @"MTPodcastAutoDownloadStateDefaultKey";
  v4[5] = @"MTCellularDownloadLimitKey";
  v5[4] = MEMORY[0x1E4F1CC38];
  v5[5] = &unk_1F03D7DB8;
  v4[6] = @"MTPodcastDeletePlayedEpisodesDefaultKey";
  v4[7] = @"MTHidePlayedEpisodes";
  v5[6] = &unk_1F03D7DD0;
  v5[7] = MEMORY[0x1E4F1CC28];
  v4[8] = @"MTContinuousPlaybackEnabled";
  v4[9] = @"MTSkipForwardIntervalDefault";
  v5[8] = MEMORY[0x1E4F1CC38];
  v5[9] = &unk_1F03D7DE8;
  v4[10] = @"MTSkipBackwardsIntervalDefault";
  v4[11] = @"MTRemoteSkipInsteadOfNextTrackDefault";
  v5[10] = &unk_1F03D7E00;
  v5[11] = MEMORY[0x1E4F1CC38];
  v5[12] = MEMORY[0x1E4F1CC38];
  v4[12] = @"MTDownloadEpisodesWhenSaving";
  v4[13] = @"MTPodcastEpisodeLimitDefaultKey";
  v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "defaultEpisodeLimit"));
  v5[13] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:14];
  char v3 = (void *)defaultSettings_defaults;
  defaultSettings_defaults = v2;
}

+ (int64_t)defaultEpisodeLimit
{
  return 4;
}

+ (void)registerDefaults
{
  if (+[PFClientUtil isPodcastsApp])
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v3 = [a1 defaultSettings];
    [v4 registerDefaults:v3];
  }
}

+ (id)defaultSettings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MTPreferences_defaultSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSettings_onceToken != -1) {
    dispatch_once(&defaultSettings_onceToken, block);
  }
  uint64_t v2 = (void *)defaultSettings_defaults;
  return v2;
}

+ (void)moveUserDefaultToSharedContainer:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 objectForKey:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
    uint64_t v7 = [v6 objectForKey:v3];

    if (v7)
    {
      uint64_t v8 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412802;
        id v16 = v3;
        __int16 v17 = 2112;
        v18 = v5;
        __int16 v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1AC9D5000, v8, OS_LOG_TYPE_DEFAULT, "WARNING: Overwriting shared user default %@ with %@ from %@", (uint8_t *)&v15, 0x20u);
      }
    }
    int v9 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
    [v9 setObject:v5 forKey:v3];

    uint64_t v10 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
    [v10 synchronize];

    v11 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
    v12 = [v11 objectForKey:v3];

    if ([v12 isEqual:v5])
    {
      v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v13 removeObjectForKey:v3];

      long long v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v14 synchronize];
    }
  }
}

+ (BOOL)_copyUserDefaultToSharedContainer:(id)a3 synchronize:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v7 = [v6 objectForKey:v5];

  uint64_t v8 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  int v9 = [v8 objectForKey:v5];

  if (v7 == v9 || ([v7 isEqual:v9] & 1) != 0)
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
    [v11 setObject:v7 forKey:v5];

    if (v4)
    {
      v12 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
      [v12 synchronize];
    }
    BOOL v10 = 1;
  }

  return v10;
}

@end