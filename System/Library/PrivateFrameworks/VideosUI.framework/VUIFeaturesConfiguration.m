@interface VUIFeaturesConfiguration
+ (BOOL)BOOLValueForKey:(id)a3 fromDictionary:(id)a4 defaultValue:(BOOL)a5;
+ (id)defaultsNumberValueForKey:(id)a3;
+ (id)defaultsStringValueForKey:(id)a3;
+ (id)numberValueForKey:(id)a3 fromDictionary:(id)a4;
+ (id)sharedInstance;
+ (id)stringValueForKey:(id)a3 fromDictionary:(id)a4;
- (BOOL)_populateConfigWithDictionary:(id)a3;
- (BOOL)_updateFromCache;
- (NSMutableDictionary)cachedConfigDictionary;
- (VUIAccountConfig)accountConfig;
- (VUIAccountMessageConfig)accountMessageConfig;
- (VUIAutoPlayConfig)autoPlayConfig;
- (VUICanonicalConfig)canonicalConfig;
- (VUIDownloadConfig)downloadConfig;
- (VUIDropOnTabConfig)dropOnTabConfig;
- (VUIFeaturesConfiguration)init;
- (VUIGDPRConfig)gdprConfig;
- (VUILaunchConfig)launchConfig;
- (VUILibConfig)libConfig;
- (VUILiveLinkConfig)liveLinkConfig;
- (VUILivePostPlayConfig)livePostPlayConfig;
- (VUIMediaShowcasingConfig)mediaShowcaseConfig;
- (VUIMultiviewConfig)multiviewConfig;
- (VUINowPlayingConfig)nowPlayingConfig;
- (VUIPlaybackUpNextConfig)playbackUpNextConfig;
- (VUIPlayerTabsConfig)playerTabsConfig;
- (VUIRootControllerConfig)rootControllerConfig;
- (VUISyndicationConfig)syndicationConfig;
- (VUITabItemsUpdateConfig)tabItemsUpdateConfig;
- (VUITimedMetadataConfig)timedMetadataConfig;
- (VUIUpNextConfig)upNextConfig;
- (id)_cachePath;
- (void)_cacheFeatureConfiguration:(id)a3;
- (void)_populateAccountConfig:(id)a3;
- (void)_populateAccountMessageConfig:(id)a3;
- (void)_populateCanonicalConfig:(id)a3;
- (void)_populateGDPRConfig:(id)a3;
- (void)_populateLaunchConfig:(id)a3;
- (void)_populateLibConfig:(id)a3;
- (void)_populateLivePostPlayConfig:(id)a3;
- (void)_populateMediaShowcaseConfig:(id)a3;
- (void)_populateMultiviewConfig:(id)a3;
- (void)_populateRootControllerConfig:(id)a3;
- (void)_populateTabItemsUpdateConfig:(id)a3;
- (void)_populateTimedMetadataConfig:(id)a3;
- (void)_updateTVSettingsIfNeeded:(BOOL)a3;
- (void)parseUpNextConfig:(id)a3;
- (void)setCachedConfigDictionary:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation VUIFeaturesConfiguration

- (VUILibConfig)libConfig
{
  return self->_libConfig;
}

+ (id)numberValueForKey:(id)a3 fromDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = +[VUIFeaturesConfiguration defaultsNumberValueForKey:v5];
    if (!v7)
    {
      v7 = objc_msgSend(v6, "vui_numberForKey:", v5);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)defaultsNumberValueForKey:(id)a3
{
  id v3 = a3;
  int has_internal_content = os_variant_has_internal_content();
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = v5;
  if (!has_internal_content) {
    goto LABEL_9;
  }
  id v7 = [v5 objectForKey:v3];
  if (!v7)
  {
LABEL_8:

LABEL_9:
    id v7 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_opt_new();
      uint64_t v9 = [v8 numberFromString:v7];

      id v7 = (id)v9;
      if (!v9) {
        goto LABEL_10;
      }
      goto LABEL_6;
    }
    goto LABEL_8;
  }
LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v7;
    v10 = v7;
    goto LABEL_11;
  }
LABEL_10:
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1) {
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_100);
  }
  v2 = (void *)sharedInstance_defaultConfig;
  return v2;
}

- (VUILaunchConfig)launchConfig
{
  return self->_launchConfig;
}

void __49__VUIFeaturesConfiguration_updateWithDictionary___block_invoke(uint64_t a1)
{
  v2 = VUISignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.WriteCache", "", buf, 2u);
  }

  id v3 = +[VUIFeaturesConfiguration sharedInstance];
  [v3 _cacheFeatureConfiguration:*(void *)(a1 + 32)];

  v4 = VUISignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.WriteCache", "", v5, 2u);
  }
}

- (void)_cacheFeatureConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v11];
  id v5 = v11;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: cache feature configs error: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [(VUIFeaturesConfiguration *)self _cachePath];
    id v7 = v8;
    if (v8)
    {
      int v9 = [v4 writeToFile:v8 atomically:1];
      v10 = VUIDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v9;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: cache features config, result: %d", buf, 8u);
      }
    }
  }
}

- (id)_cachePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 firstObject];

  if (v3)
  {
    v4 = [v3 stringByAppendingPathComponent:@"features_config"];
  }
  else
  {
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: Unable to find cache path", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (BOOL)_populateConfigWithDictionary:(id)a3
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    uint64_t v5 = objc_msgSend(v4, "vui_dictionaryForKey:", @"postPlayUpsellConfig");
    BOOL v6 = +[VUIPostPlayUpsellConfig sharedInstance];
    v131 = (void *)v5;
    [v6 configureUsingDictionary:v5];

    id v7 = objc_msgSend(v4, "vui_dictionaryForKey:", @"postPlayConfig");
    unint64_t v8 = 0x1E4F1C000uLL;
    v130 = v7;
    v133 = self;
    if ([v7 count])
    {
      int v9 = objc_msgSend(v7, "vui_numberForKey:", @"bootStrapInterval");
      v10 = v9;
      if (v9)
      {
        playbackUpNextConfig = self->_playbackUpNextConfig;
        [v9 doubleValue];
        -[VUIPlaybackUpNextConfig setBootstrapInterval:](playbackUpNextConfig, "setBootstrapInterval:");
        v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v12 setObject:v10 forKey:@"bootStrapInterval"];
      }
      id v13 = objc_msgSend(v7, "vui_numberForKey:", @"documentUpdateOffsetInterval");
      uint64_t v14 = v13;
      if (v13)
      {
        v15 = self->_playbackUpNextConfig;
        [v13 doubleValue];
        -[VUIPlaybackUpNextConfig setDocumentUpdateOffsetInterval:](v15, "setDocumentUpdateOffsetInterval:");
      }
      v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v17 = [v16 objectForKey:@"maximumAutoPlayableItemsQAOverride"];

      if (!v17)
      {
        v18 = objc_msgSend(v7, "vui_numberForKey:", @"maximumAutoPlayableItems");
        v19 = v18;
        if (v18)
        {
          -[VUIPlaybackUpNextConfig setMaximumAutoPlayableItems:](self->_playbackUpNextConfig, "setMaximumAutoPlayableItems:", [v18 unsignedIntegerValue]);
          v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          [v20 setObject:v19 forKey:@"maximumAutoPlayableItems"];
        }
      }
      v21 = objc_msgSend(v7, "vui_numberForKey:", @"duration");
      v22 = v21;
      if (v21)
      {
        v23 = self->_playbackUpNextConfig;
        [v21 doubleValue];
        -[VUIPlaybackUpNextConfig setDuration:](v23, "setDuration:");
      }
      v24 = objc_msgSend(v7, "vui_numberForKey:", @"autoPlayTimerDuration");
      v25 = v24;
      if (v24)
      {
        v26 = self->_playbackUpNextConfig;
        [v24 doubleValue];
        -[VUIPlaybackUpNextConfig setAutoPlayTimerDuration:](v26, "setAutoPlayTimerDuration:");
        v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v27 setObject:v25 forKey:@"autoPlayTimerDuration"];
      }
      v28 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v29 = [v28 objectForKey:@"minAutoPlayStopTimeQAOverride"];

      if (!v29)
      {
        v30 = objc_msgSend(v7, "vui_numberForKey:", @"minAutoPlayStopTime");
        v31 = v30;
        if (v30)
        {
          v32 = v133->_playbackUpNextConfig;
          [v30 doubleValue];
          -[VUIPlaybackUpNextConfig setMinAutoPlayStopTime:](v32, "setMinAutoPlayStopTime:");
          v33 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          [v33 setObject:v31 forKey:@"minAutoPlayStopTime"];
        }
      }
      v34 = objc_msgSend(v7, "vui_numberForKey:", @"minTimeIntervalFromEndToDisplay");
      v35 = v34;
      if (v34)
      {
        v36 = v133->_playbackUpNextConfig;
        [v34 doubleValue];
        -[VUIPlaybackUpNextConfig setMinTimeIntervalFromEndToDisplay:](v36, "setMinTimeIntervalFromEndToDisplay:");
        v37 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v37 setObject:v35 forKey:@"minTimeIntervalFromEndToDisplay"];
      }
      v38 = objc_msgSend(v7, "vui_numberForKey:", @"disablePostPlayTypeHLSQueryParam");
      v39 = v38;
      if (v38) {
        -[VUIPlaybackUpNextConfig setDisablePostPlayTypeHLSQueryParam:](v133->_playbackUpNextConfig, "setDisablePostPlayTypeHLSQueryParam:", [v38 BOOLValue]);
      }

      self = v133;
      unint64_t v8 = 0x1E4F1C000;
    }
    v40 = objc_msgSend(v4, "vui_dictionaryForKey:", @"playerTabsConfig");
    if ([v40 count]) {
      -[VUIPlayerTabsConfig setInfoTabMustHaveImageToDisplay:](self->_playerTabsConfig, "setInfoTabMustHaveImageToDisplay:", objc_msgSend(v40, "vui_BOOLForKey:defaultValue:", @"infoTabMustHaveImageToDisplay", 0));
    }
    v129 = v40;
    v41 = objc_msgSend(v4, "vui_dictionaryForKey:", @"nowPlayingConfig");
    v132 = v41;
    if ([v41 count])
    {
      -[VUINowPlayingConfig setShowsLozengeForLivePlayback:](self->_nowPlayingConfig, "setShowsLozengeForLivePlayback:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"showsLozengeForLivePlayback", 0));
      -[VUINowPlayingConfig setShowsUpNextInHUDForVOD:](self->_nowPlayingConfig, "setShowsUpNextInHUDForVOD:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"showsUpNextInHUDForVOD", 1));
      -[VUINowPlayingConfig setShowsUpNextInHUDForLive:](self->_nowPlayingConfig, "setShowsUpNextInHUDForLive:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"showsUpNextInHUDForLive", 1));
      -[VUINowPlayingConfig setRefetchesUpNextDataForVOD:](self->_nowPlayingConfig, "setRefetchesUpNextDataForVOD:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"refetchesUpNextDataForVOD", 1));
      -[VUINowPlayingConfig setRefetchesUpNextDataForLive:](self->_nowPlayingConfig, "setRefetchesUpNextDataForLive:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"refetchesUpNextDataForLive", 1));
      -[VUINowPlayingConfig setShowsStillWatchingAlert:](self->_nowPlayingConfig, "setShowsStillWatchingAlert:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"showsStillWatchingAlertForLivePlayback", 1));
      v42 = objc_msgSend(v41, "vui_numberForKey:", @"alertDurationForLivePlayback");
      v43 = v42;
      if (v42)
      {
        nowPlayingConfig = self->_nowPlayingConfig;
        [v42 doubleValue];
        -[VUINowPlayingConfig setStillWatchingAlertDuration:](nowPlayingConfig, "setStillWatchingAlertDuration:");
      }
      v45 = objc_msgSend(v41, "vui_numberForKey:", @"alertIdleTimeout");
      v46 = v45;
      if (v45)
      {
        v47 = self->_nowPlayingConfig;
        [v45 doubleValue];
        [(VUINowPlayingConfig *)v47 setAlertIdleTimeout:"setAlertIdleTimeout:"];
      }
      v127 = objc_msgSend(v41, "vui_arrayForKey:", @"excludedMediaTypesFromReporting");
      v123 = v46;
      v125 = v43;
      if ([v127 count])
      {
        id v122 = v4;
        v48 = objc_opt_new();
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id obj = v127;
        uint64_t v49 = [obj countByEnumeratingWithState:&v146 objects:v150 count:16];
        if (!v49) {
          goto LABEL_48;
        }
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v147;
        uint64_t v137 = *MEMORY[0x1E4FAA200];
        uint64_t v139 = *MEMORY[0x1E4FAA1E8];
        uint64_t v52 = *MEMORY[0x1E4FAA1F8];
        uint64_t v53 = *MEMORY[0x1E4FAA1F0];
        uint64_t v54 = *MEMORY[0x1E4FAA208];
        while (1)
        {
          uint64_t v55 = 0;
          do
          {
            if (*(void *)v147 != v51) {
              objc_enumerationMutation(obj);
            }
            v56 = *(void **)(*((void *)&v146 + 1) + 8 * v55);
            char v57 = [v56 isEqualToString:@"Trailer"];
            uint64_t v58 = v53;
            uint64_t v59 = v54;
            if ((v57 & 1) != 0
              || (v60 = [v56 isEqualToString:@"Movie"], uint64_t v58 = v139, v59 = v52, (v60 & 1) != 0))
            {
              [v48 addObject:v58];
LABEL_41:
              [v48 addObject:v59];
              goto LABEL_42;
            }
            uint64_t v59 = v137;
            if ([v56 isEqualToString:@"Show"]) {
              goto LABEL_41;
            }
            uint64_t v59 = v137;
            if ([v56 isEqualToString:@"Episode"]) {
              goto LABEL_41;
            }
LABEL_42:
            ++v55;
          }
          while (v50 != v55);
          uint64_t v61 = [obj countByEnumeratingWithState:&v146 objects:v150 count:16];
          uint64_t v50 = v61;
          if (!v61)
          {
LABEL_48:

            self = v133;
            [(VUINowPlayingConfig *)v133->_nowPlayingConfig setMediaTypesExcludedFromReporting:obj];

            id v4 = v122;
            v41 = v132;
            break;
          }
        }
      }
      -[VUINowPlayingConfig setAllowQOSReportingForiTunesLibraryPlayback:](self->_nowPlayingConfig, "setAllowQOSReportingForiTunesLibraryPlayback:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"allowQOSReportingForiTunesLibraryPlayback", 1));
      -[VUINowPlayingConfig setConvertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero:](self->_nowPlayingConfig, "setConvertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero", 1));
      v62 = objc_msgSend(v41, "vui_arrayForKey:", @"mediaCharacteristicsToLocalize");
      if ([v62 count]) {
        [(VUINowPlayingConfig *)self->_nowPlayingConfig setMediaCharacteristicsToLocalize:v62];
      }
      v63 = objc_msgSend(v41, "vui_dictionaryForKey:", @"mediaLocalizationKeyMapping");
      if ([v63 count]) {
        [(VUINowPlayingConfig *)self->_nowPlayingConfig setMediaLocalizationKeyMapping:v63];
      }
      v141 = v63;
      id obja = v62;
      v64 = objc_msgSend(v41, "vui_arrayForKey:", @"audioIDPrefixes");
      if ([v64 count]) {
        [(VUINowPlayingConfig *)self->_nowPlayingConfig setAudioIDPrefixes:v64];
      }
      v65 = objc_msgSend(v41, "vui_numberForKey:", @"liveSportsStartFromBeginningOffset");
      v66 = v65;
      if (v65)
      {
        v67 = self->_nowPlayingConfig;
        [v65 doubleValue];
        -[VUINowPlayingConfig setLiveSportsStartFromBeginningOffset:](v67, "setLiveSportsStartFromBeginningOffset:");
      }
      -[VUINowPlayingConfig setShouldSendLiveStreamStartAndEndTimesToAVKit:](self->_nowPlayingConfig, "setShouldSendLiveStreamStartAndEndTimesToAVKit:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"shouldSendLiveStreamStartAndEndTimesToAVKit", 1));
      -[VUINowPlayingConfig setShouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime:](self->_nowPlayingConfig, "setShouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime", 1));
      -[VUINowPlayingConfig setShouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime:](self->_nowPlayingConfig, "setShouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime:", objc_msgSend(v41, "vui_BOOLForKey:defaultValue:", @"shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime", 1));
      v68 = objc_msgSend(v41, "vui_numberForKey:", @"liveStreamStartTimeAdjustmentSlopFactor");
      v69 = v68;
      if (v68)
      {
        v70 = self->_nowPlayingConfig;
        [v68 doubleValue];
        -[VUINowPlayingConfig setLiveStreamStartTimeAdjustmentSlopFactor:](v70, "setLiveStreamStartTimeAdjustmentSlopFactor:");
      }
      v71 = objc_msgSend(v41, "vui_numberForKey:", @"liveStreamStartAndEndTimeBadMetadataCutoff");
      v72 = v71;
      if (v71)
      {
        v73 = self->_nowPlayingConfig;
        [v71 doubleValue];
        -[VUINowPlayingConfig setLiveStreamStartAndEndTimeBadMetadataCutoff:](v73, "setLiveStreamStartAndEndTimeBadMetadataCutoff:");
      }
      v74 = objc_msgSend(v41, "vui_numberForKey:", @"liveStreamOverrunExtension");
      v75 = v74;
      if (v74)
      {
        v76 = v133->_nowPlayingConfig;
        [v74 doubleValue];
        -[VUINowPlayingConfig setLiveStreamOverrunExtension:](v76, "setLiveStreamOverrunExtension:");
      }
      v77 = objc_msgSend(v41, "vui_numberForKey:", @"prerollFadeInEndOffset");
      v78 = v77;
      self = v133;
      if (v77)
      {
        v79 = v133->_nowPlayingConfig;
        [v77 doubleValue];
        -[VUINowPlayingConfig setPrerollFadeInEndOffset:](v79, "setPrerollFadeInEndOffset:");
      }
      -[VUINowPlayingConfig setShowsLongLoadingAlert:](v133->_nowPlayingConfig, "setShowsLongLoadingAlert:", objc_msgSend(v132, "vui_BOOLForKey:defaultValue:", @"showsLongLoadingAlert", 1));
      v80 = objc_msgSend(v132, "vui_numberForKey:", @"longLoadingTimeout");
      v81 = v80;
      if (v80)
      {
        v82 = v133->_nowPlayingConfig;
        [v80 doubleValue];
        [(VUINowPlayingConfig *)v82 setLongLoadingTimeout:"setLongLoadingTimeout:"];
      }

      unint64_t v8 = 0x1E4F1C000uLL;
    }
    v83 = objc_msgSend(v4, "vui_dictionaryForKey:", @"autoPlayConfig");
    if ([v83 count])
    {
      v84 = objc_msgSend(v83, "vui_numberForKey:", @"autoPlayDelayInterval");
      v85 = v84;
      if (v84)
      {
        autoPlayConfig = self->_autoPlayConfig;
        [v84 doubleValue];
        -[VUIAutoPlayConfig setAutoPlayDelayInterval:](autoPlayConfig, "setAutoPlayDelayInterval:");
      }
      v87 = [MEMORY[0x1E4FB16C8] currentDevice];
      BOOL v88 = [v87 userInterfaceIdiom] == 2;

      [(VUIAutoPlayConfig *)self->_autoPlayConfig setAutoPlayVideoSound:+[VUIFeaturesConfiguration BOOLValueForKey:@"autoPlayVideoSound" fromDictionary:v83 defaultValue:v88]];
    }
    v89 = objc_msgSend(v4, "vui_dictionaryForKey:", @"liveLinkConfig");
    if ([v89 count]) {
      -[VUILiveLinkConfig setIsEnabled:](self->_liveLinkConfig, "setIsEnabled:", objc_msgSend(v89, "vui_BOOLForKey:defaultValue:", @"isEnabled", 0));
    }
    v90 = objc_msgSend(v4, "vui_dictionaryForKey:", @"downloadConfig");
    if ([v90 count])
    {
      v91 = objc_msgSend(v90, "vui_arrayForKey:", @"blacklistedEarlyRenewalBrands");
      if (v91) {
        [(VUIDownloadConfig *)self->_downloadConfig setBlacklistedEarlyRenewalBrands:v91];
      }
      v92 = [*(id *)(v8 + 2840) standardUserDefaults];
      v93 = [v92 objectForKey:@"allowEnhancedDownloads"];

      if (!v93)
      {
        v94 = objc_msgSend(v90, "vui_numberForKey:", @"allowEnhancedDownloads");
        v95 = v94;
        if (v94) {
          -[VUIDownloadConfig setAllowEnhancedDownloads:](self->_downloadConfig, "setAllowEnhancedDownloads:", [v94 BOOLValue]);
        }
      }
    }
    v96 = objc_msgSend(v4, "vui_dictionaryForKey:", @"syndicationConfig");
    if ([v96 count])
    {
      v97 = objc_msgSend(v96, "vui_numberForKey:", @"highlightsFetchLimit");
      v98 = v97;
      if (v97) {
        -[VUISyndicationConfig setHighlightsFetchLimit:](self->_syndicationConfig, "setHighlightsFetchLimit:", [v97 unsignedIntegerValue]);
      }
    }
    [(VUIFeaturesConfiguration *)self parseUpNextConfig:v4];
    v99 = objc_msgSend(v4, "vui_dictionaryForKey:", @"ageVerificationConfig");
    if ([v99 count])
    {
      v100 = +[VUIAgeVerification sharedInstance];
      [v100 configureAgeVerification:v99];
    }
    v136 = v99;
    v138 = v96;
    v101 = objc_msgSend(v4, "vui_dictionaryForKey:", @"dropOnTabConfig");
    if ([v101 count])
    {
      v102 = objc_msgSend(v101, "vui_numberForKey:", @"daysWithoutOpeningThreshold");
      if (v102) {
        [(VUIDropOnTabConfig *)self->_dropOnTabConfig setDaysWithoutOpeningThreshold:v102];
      }
      v103 = objc_msgSend(v101, "vui_numberForKey:", @"daysWithoutPlaybackThreshold");
      if (v103) {
        [(VUIDropOnTabConfig *)self->_dropOnTabConfig setDaysWithoutPlaybackThreshold:v103];
      }
      v104 = +[VUIFeaturesConfiguration defaultsStringValueForKey:@"dropOnTabIdentifier"];
      uint64_t v105 = [v101 objectForKey:@"dropOnTabIdentifier"];
      v106 = (void *)v105;
      v107 = v104;
      if (v104 || (v107 = (void *)v105) != 0) {
        [(VUIDropOnTabConfig *)self->_dropOnTabConfig setDropOnTabIdentifier:v107];
      }
    }
    v135 = v101;
    v140 = v90;
    v142 = v89;
    id objb = v83;
    v134 = objc_msgSend(v4, "vui_dictionaryForKey:", @"mediaShowcaseConfig");
    -[VUIFeaturesConfiguration _populateMediaShowcaseConfig:](self, "_populateMediaShowcaseConfig:");
    v128 = objc_msgSend(v4, "vui_dictionaryForKey:", @"canonicalConfig");
    -[VUIFeaturesConfiguration _populateCanonicalConfig:](self, "_populateCanonicalConfig:");
    v126 = objc_msgSend(v4, "vui_dictionaryForKey:", @"accountConfig");
    -[VUIFeaturesConfiguration _populateAccountConfig:](self, "_populateAccountConfig:");
    v124 = objc_msgSend(v4, "vui_dictionaryForKey:", @"accountMessageConfig");
    -[VUIFeaturesConfiguration _populateAccountMessageConfig:](self, "_populateAccountMessageConfig:");
    v108 = objc_msgSend(v4, "vui_dictionaryForKey:", @"rootControllerConfig");
    [(VUIFeaturesConfiguration *)self _populateRootControllerConfig:v108];
    v109 = objc_msgSend(v4, "vui_dictionaryForKey:", @"multiviewConfig");
    [(VUIFeaturesConfiguration *)self _populateMultiviewConfig:v109];
    v110 = objc_msgSend(v4, "vui_dictionaryForKey:", @"arQLConfig");
    if ([v110 count])
    {
      v111 = +[VUIARQLPreviewManager sharedInstance];
      [v111 configureUsingDictionary:v4];
    }
    v112 = objc_msgSend(v4, "vui_dictionaryForKey:", @"tabItemsUpdateConfig");
    [(VUIFeaturesConfiguration *)self _populateTabItemsUpdateConfig:v112];
    v113 = objc_msgSend(v4, "vui_dictionaryForKey:", @"launchConfig");
    [(VUIFeaturesConfiguration *)self _populateLaunchConfig:v113];
    v114 = objc_msgSend(v4, "vui_dictionaryForKey:", @"libConfig");
    [(VUIFeaturesConfiguration *)self _populateLibConfig:v114];
    v115 = objc_msgSend(v4, "vui_dictionaryForKey:", @"gdprConfig");
    [(VUIFeaturesConfiguration *)self _populateGDPRConfig:v115];
    v116 = objc_msgSend(v4, "vui_dictionaryForKey:", @"timedMetadataConfig");
    [(VUIFeaturesConfiguration *)self _populateTimedMetadataConfig:v116];
    uint64_t v117 = objc_msgSend(v4, "vui_dictionaryForKey:", @"livePostPlayConfig");
    v118 = self;
    v119 = (void *)v117;
    [(VUIFeaturesConfiguration *)v118 _populateLivePostPlayConfig:v117];

    BOOL v120 = 1;
  }
  else
  {
    BOOL v120 = 0;
  }

  return v120;
}

- (void)_populateRootControllerConfig:(id)a3
{
  id v35 = a3;
  uint64_t v4 = +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", @"normalControllerLimit");
  if (v4) {
    [(VUIRootControllerConfig *)self->_rootControllerConfig setNormalControllerLimit:v4];
  }
  uint64_t v5 = +[VUIFeaturesConfiguration numberValueForKey:@"warningControllerLimit" fromDictionary:v35];
  if (v5) {
    [(VUIRootControllerConfig *)self->_rootControllerConfig setWarningControllerLimit:v5];
  }
  uint64_t v6 = +[VUIFeaturesConfiguration numberValueForKey:@"criticalControllerLimit" fromDictionary:v35];
  if (v6) {
    [(VUIRootControllerConfig *)self->_rootControllerConfig setCriticalControllerLimit:v6];
  }
  v34 = (void *)v4;
  uint64_t v7 = objc_msgSend(v35, "vui_arrayForKey:", @"doNotPurgeList");
  if (v7) {
    [(VUIRootControllerConfig *)self->_rootControllerConfig setDoNotPurgeList:v7];
  }
  v31 = (void *)v7;
  unint64_t v8 = +[VUIFeaturesConfiguration numberValueForKey:@"sidebarImagePrefetchBatchLimit" fromDictionary:v35];
  int v9 = v8;
  if (v8) {
    -[VUIRootControllerConfig setSidebarImagePrefetchBatchLimit:](self->_rootControllerConfig, "setSidebarImagePrefetchBatchLimit:", [v8 integerValue]);
  }
  v10 = +[VUIFeaturesConfiguration numberValueForKey:@"programmaticOpenSidebarTimeout" fromDictionary:v35];
  id v11 = v10;
  if (v10)
  {
    rootControllerConfig = self->_rootControllerConfig;
    [v10 doubleValue];
    [(VUIRootControllerConfig *)rootControllerConfig setProgrammaticOpenSidebarTimeout:"setProgrammaticOpenSidebarTimeout:"];
  }
  id v13 = +[VUIFeaturesConfiguration numberValueForKey:@"userDrivenSidebarTimeout" fromDictionary:v35];
  uint64_t v14 = v13;
  if (v13)
  {
    v15 = self->_rootControllerConfig;
    [v13 doubleValue];
    [(VUIRootControllerConfig *)v15 setUserDrivenSidebarTimeout:"setUserDrivenSidebarTimeout:"];
  }
  v16 = +[VUIFeaturesConfiguration numberValueForKey:@"stackActiveDuration" fromDictionary:v35];
  v17 = v16;
  if (v16)
  {
    v18 = self->_rootControllerConfig;
    [v16 doubleValue];
    -[VUIRootControllerConfig setStackActiveDuration:](v18, "setStackActiveDuration:");
  }
  v33 = (void *)v5;
  v19 = +[VUIFeaturesConfiguration numberValueForKey:@"numTeachableMomentsPerUser" fromDictionary:v35];
  v20 = v19;
  if (v19) {
    -[VUIRootControllerConfig setNumTeachableMomentsPerUser:](self->_rootControllerConfig, "setNumTeachableMomentsPerUser:", [v19 integerValue]);
  }
  v32 = (void *)v6;
  v21 = +[VUIFeaturesConfiguration numberValueForKey:@"teachableMomentSidebarTimeout" fromDictionary:v35];
  v22 = v21;
  if (v21)
  {
    v23 = self->_rootControllerConfig;
    [v21 doubleValue];
    [(VUIRootControllerConfig *)v23 setTeachableMomentSidebarTimeout:"setTeachableMomentSidebarTimeout:"];
  }
  v24 = +[VUIFeaturesConfiguration numberValueForKey:@"teachableMomentPillUITimeout" fromDictionary:v35];
  v25 = v24;
  if (v24)
  {
    v26 = self->_rootControllerConfig;
    [v24 doubleValue];
    [(VUIRootControllerConfig *)v26 setTeachableMomentPillUITimeout:"setTeachableMomentPillUITimeout:"];
  }
  v27 = +[VUIFeaturesConfiguration numberValueForKey:@"teachableBackgroundReshowTime" fromDictionary:v35];
  v28 = v27;
  if (v27)
  {
    v29 = self->_rootControllerConfig;
    [v27 doubleValue];
    -[VUIRootControllerConfig setTeachableBackgroundReshowTime:](v29, "setTeachableBackgroundReshowTime:");
  }
  v30 = objc_msgSend(v35, "vui_numberForKey:", @"teachableMomentImpressionsDictionaryHash");
  if (v30) {
    [(VUIRootControllerConfig *)self->_rootControllerConfig setTeachableMomentImpressionsDictionaryHash:v30];
  }
}

- (void)parseUpNextConfig:(id)a3
{
  v12 = objc_msgSend(a3, "vui_dictionaryForKey:", @"upNextConfig");
  uint64_t v4 = [v12 count];
  uint64_t v5 = v12;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v12, "vui_numberForKey:", @"delayForUpnextCallAfterMarkAsWatched");
    uint64_t v7 = v6;
    if (v6) {
      -[VUIUpNextConfig setUpNextCallDelayAfterMarkAsWatched:](self->_upNextConfig, "setUpNextCallDelayAfterMarkAsWatched:", [v6 unsignedIntegerValue]);
    }
    unint64_t v8 = objc_msgSend(v12, "vui_numberForKey:", @"delayForRefreshUpnextCallAfterRemoveFromUpNext");
    int v9 = v8;
    if (v8) {
      -[VUIUpNextConfig setUpNextRefreshCallDelayAfterRemoveFromUpNext:](self->_upNextConfig, "setUpNextRefreshCallDelayAfterRemoveFromUpNext:", [v8 unsignedIntegerValue]);
    }
    v10 = objc_msgSend(v12, "vui_numberForKey:", @"shouldUpdateOutboundAfterRemoveFromUpNext");
    id v11 = v10;
    if (v10) {
      -[VUIUpNextConfig setShouldUpdateOutboundAfterRemoveFromUpNext:](self->_upNextConfig, "setShouldUpdateOutboundAfterRemoveFromUpNext:", [v10 BOOLValue]);
    }

    uint64_t v5 = v12;
  }
}

- (void)_populateTimedMetadataConfig:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v24 = v4;
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_msgSend(v24, "vui_dictionaryForKey:", @"visualSmoothingConfig");
    uint64_t v7 = +[VUIFeaturesConfiguration numberValueForKey:@"timeRangeProximityThreshold" fromDictionary:v6];
    unint64_t v8 = v7;
    if (v7)
    {
      [v7 floatValue];
      [v5 setTimeRangeProximityThreshold:v9];
    }
    v10 = +[VUIFeaturesConfiguration numberValueForKey:@"initialLookAhead" fromDictionary:v6];
    id v11 = v10;
    if (v10)
    {
      [v10 floatValue];
      [v5 setInitialLookAhead:v12];
    }
    id v13 = +[VUIFeaturesConfiguration numberValueForKey:@"initialLookBack" fromDictionary:v6];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 floatValue];
      [v5 setInitialLookBack:v15];
    }
    v16 = +[VUIFeaturesConfiguration numberValueForKey:@"lookAhead" fromDictionary:v6];
    v17 = v16;
    if (v16)
    {
      [v16 floatValue];
      [v5 setLookAhead:v18];
    }
    v19 = objc_msgSend(v24, "vui_dictionaryForKey:", @"audioSmoothingConfig");
    v20 = objc_opt_new();
    v21 = +[VUIFeaturesConfiguration numberValueForKey:@"durationToRetainAudioEntity" fromDictionary:v19];
    v22 = v21;
    if (v21)
    {
      [v21 floatValue];
      [v20 setDurationToRetainAudioEntity:v23];
    }
    [(VUITimedMetadataConfig *)self->_timedMetadataConfig setVisualSmoothingConfig:v5];
    [(VUITimedMetadataConfig *)self->_timedMetadataConfig setAudioSmoothingConfig:v20];

    id v4 = v24;
  }
}

- (void)_populateTabItemsUpdateConfig:(id)a3
{
  id v4 = objc_msgSend(a3, "vui_dictionaryForKey:", @"eventDescriptors");
  if (v4)
  {
    uint64_t v5 = v4;
    [(VUITabItemsUpdateConfig *)self->_tabItemsUpdateConfig setEventDescriptors:v4];
    id v4 = v5;
  }
}

- (void)_populateMultiviewConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "vui_numberForKey:", @"isEnabled");
  uint64_t v6 = objc_msgSend(v4, "vui_numberForKey:", @"useExperienceController");
  uint64_t v7 = objc_msgSend(v4, "vui_numberForKey:", @"maximumPlayerCount");

  unint64_t v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412802;
    v10 = v5;
    __int16 v11 = 2112;
    float v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: _populateMultiviewConfig isEnabled = %@, maximumPlayerCount = %@, useExperienceController: %@", (uint8_t *)&v9, 0x20u);
  }

  if (v5) {
    -[VUIMultiviewConfig setIsEnabled:](self->_multiviewConfig, "setIsEnabled:", [v5 BOOLValue]);
  }
  if (v7) {
    -[VUIMultiviewConfig setMaximumPlayerCount:](self->_multiviewConfig, "setMaximumPlayerCount:", [v7 integerValue]);
  }
}

- (void)_populateMediaShowcaseConfig:(id)a3
{
  id v96 = a3;
  if ([v96 count])
  {
    id v4 = +[VUIFeaturesConfiguration numberValueForKey:@"playbackDelayInterval" fromDictionary:v96];
    uint64_t v5 = v4;
    if (v4)
    {
      mediaShowcaseConfig = self->_mediaShowcaseConfig;
      [v4 doubleValue];
      -[VUIMediaShowcasingConfig setPlaybackDelayInterval:](mediaShowcaseConfig, "setPlaybackDelayInterval:");
    }
    uint64_t v7 = +[VUIFeaturesConfiguration numberValueForKey:@"animationTransitionDuration" fromDictionary:v96];
    unint64_t v8 = v7;
    if (v7)
    {
      int v9 = self->_mediaShowcaseConfig;
      [v7 doubleValue];
      -[VUIMediaShowcasingConfig setAnimationTransitionDuration:](v9, "setAnimationTransitionDuration:");
    }
    v10 = +[VUIFeaturesConfiguration numberValueForKey:@"backgroundVolume" fromDictionary:v96];
    __int16 v11 = v10;
    if (v10)
    {
      float v12 = self->_mediaShowcaseConfig;
      [v10 floatValue];
      -[VUIMediaShowcasingConfig setBackgroundVolume:](v12, "setBackgroundVolume:");
    }
    __int16 v13 = +[VUIFeaturesConfiguration numberValueForKey:@"foregroundVolume" fromDictionary:v96];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = self->_mediaShowcaseConfig;
      [v13 floatValue];
      -[VUIMediaShowcasingConfig setForegroundVolume:](v15, "setForegroundVolume:");
    }
    v92 = v14;
    v16 = v11;
    [(VUIMediaShowcasingConfig *)self->_mediaShowcaseConfig setBackgroundMediaTransferEnabled:+[VUIFeaturesConfiguration BOOLValueForKey:@"backgroundMediaTransferEnabled" fromDictionary:v96 defaultValue:1]];
    v17 = +[VUIFeaturesConfiguration numberValueForKey:@"backgroundMediaTransferAnimationDuration" fromDictionary:v96];
    float v18 = v17;
    if (v17)
    {
      v19 = self->_mediaShowcaseConfig;
      [v17 doubleValue];
      -[VUIMediaShowcasingConfig setBackgroundMediaTransferAnimationDuration:](v19, "setBackgroundMediaTransferAnimationDuration:");
    }
    v20 = v8;
    v21 = +[VUIFeaturesConfiguration numberValueForKey:@"fullscreenPlaybackTransitionDuration" fromDictionary:v96];
    v22 = v21;
    if (v21)
    {
      float v23 = self->_mediaShowcaseConfig;
      [v21 floatValue];
      [(VUIMediaShowcasingConfig *)v23 setBackgroundMediaFullscreenTransitionDuration:v24];
    }
    v25 = v5;
    v26 = +[VUIFeaturesConfiguration numberValueForKey:@"volumeTransitionAnimationDuration" fromDictionary:v96];
    v27 = v26;
    if (v26)
    {
      v28 = self->_mediaShowcaseConfig;
      [v26 floatValue];
      [(VUIMediaShowcasingConfig *)v28 setVolumeTransitionAnimationDuration:v29];
    }
    v30 = +[VUIFeaturesConfiguration numberValueForKey:@"numberOfVolumeIncrementsKey" fromDictionary:v96];
    v31 = v30;
    if (v30)
    {
      v32 = self->_mediaShowcaseConfig;
      [v30 floatValue];
      -[VUIMediaShowcasingConfig setBackgroundVolume:](v32, "setBackgroundVolume:");
    }
    BOOL v88 = v31;
    [(VUIMediaShowcasingConfig *)self->_mediaShowcaseConfig setRubberBandingEnabled:+[VUIFeaturesConfiguration BOOLValueForKey:@"rubberBandingEnabled" fromDictionary:v96 defaultValue:1]];
    v33 = +[VUIFeaturesConfiguration numberValueForKey:@"swipingEndAnimationDuration" fromDictionary:v96];
    v34 = v33;
    if (v33)
    {
      id v35 = self->_mediaShowcaseConfig;
      [v33 floatValue];
      [(VUIMediaShowcasingConfig *)v35 setSwipingEndAnimationDuration:v36];
    }
    v87 = v34;
    v37 = +[VUIFeaturesConfiguration numberValueForKey:@"autoSwipeAnimationDuration" fromDictionary:v96];
    v95 = v25;
    v38 = v37;
    if (v37)
    {
      v39 = self->_mediaShowcaseConfig;
      [v37 floatValue];
      [(VUIMediaShowcasingConfig *)v39 setAutoSwipeAnimationDuration:v40];
    }
    v86 = v38;
    [(VUIMediaShowcasingConfig *)self->_mediaShowcaseConfig setCarouselBehaviorEnabled:+[VUIFeaturesConfiguration BOOLValueForKey:@"carouselBehaviorEnabled" fromDictionary:v96 defaultValue:1]];
    v41 = +[VUIFeaturesConfiguration numberValueForKey:@"titleViewTransitionDistance" fromDictionary:v96];
    v94 = v20;
    v42 = v41;
    if (v41)
    {
      v43 = self->_mediaShowcaseConfig;
      [v41 floatValue];
      -[VUIMediaShowcasingConfig setTitleViewTransitionDistance:](v43, "setTitleViewTransitionDistance:");
    }
    v44 = +[VUIFeaturesConfiguration numberValueForKey:@"navigationBarTransitionDistance" fromDictionary:v96];
    v45 = v44;
    if (v44)
    {
      v46 = self->_mediaShowcaseConfig;
      [v44 floatValue];
      -[VUIMediaShowcasingConfig setNavigationBarTransitionDistance:](v46, "setNavigationBarTransitionDistance:");
    }
    v84 = v45;
    [(VUIMediaShowcasingConfig *)self->_mediaShowcaseConfig setAutoAdvanceToNextPageEnabled:+[VUIFeaturesConfiguration BOOLValueForKey:@"autoAdvanceToNextPageEnabled" fromDictionary:v96 defaultValue:1]];
    v47 = +[VUIFeaturesConfiguration numberValueForKey:@"advanceToNextPageDelayDuration" fromDictionary:v96];
    v48 = v47;
    if (v47)
    {
      uint64_t v49 = self->_mediaShowcaseConfig;
      [v47 floatValue];
      [(VUIMediaShowcasingConfig *)v49 setAdvanceToNextPageDelayDuration:v50];
    }
    uint64_t v51 = +[VUIFeaturesConfiguration numberValueForKey:@"advanceToNextPageDelayDurationImageOnly" fromDictionary:v96];
    uint64_t v52 = v51;
    if (v51)
    {
      uint64_t v53 = self->_mediaShowcaseConfig;
      [v51 floatValue];
      [(VUIMediaShowcasingConfig *)v53 setAdvanceToNextPageDelayDurationImageOnly:v54];
    }
    v82 = v52;
    v91 = v18;
    [(VUIMediaShowcasingConfig *)self->_mediaShowcaseConfig setParallaxEnabled:+[VUIFeaturesConfiguration BOOLValueForKey:@"parallaxEnabled" fromDictionary:v96 defaultValue:1]];
    uint64_t v55 = +[VUIFeaturesConfiguration numberValueForKey:@"parallaxRatio" fromDictionary:v96];
    v56 = v55;
    if (v55)
    {
      char v57 = self->_mediaShowcaseConfig;
      [v55 floatValue];
      -[VUIMediaShowcasingConfig setParallaxRatio:](v57, "setParallaxRatio:");
    }
    v90 = v22;
    uint64_t v58 = +[VUIFeaturesConfiguration numberValueForKey:@"metadataFadeOutSpeed" fromDictionary:v96];
    uint64_t v59 = v58;
    if (v58)
    {
      char v60 = self->_mediaShowcaseConfig;
      [v58 floatValue];
      -[VUIMediaShowcasingConfig setMetadataFadeOutSpeed:](v60, "setMetadataFadeOutSpeed:");
    }
    v89 = v27;
    uint64_t v61 = +[VUIFeaturesConfiguration numberValueForKey:@"metadataFadeInSpeed" fromDictionary:v96];
    v62 = v61;
    if (v61)
    {
      v63 = self->_mediaShowcaseConfig;
      [v61 floatValue];
      -[VUIMediaShowcasingConfig setMetadataFadeInSpeed:](v63, "setMetadataFadeInSpeed:");
    }
    v83 = v48;
    v64 = +[VUIFeaturesConfiguration numberValueForKey:@"swipeCompletionSpeedFactor" fromDictionary:v96];
    v65 = v64;
    if (v64)
    {
      v66 = self->_mediaShowcaseConfig;
      [v64 floatValue];
      -[VUIMediaShowcasingConfig setSwipeCompletionSpeedFactor:](v66, "setSwipeCompletionSpeedFactor:");
    }
    v67 = +[VUIFeaturesConfiguration numberValueForKey:@"itemHoverDelayDuration", v96, v56 fromDictionary];
    v68 = v67;
    if (v67)
    {
      v69 = self->_mediaShowcaseConfig;
      [v67 doubleValue];
      -[VUIMediaShowcasingConfig setItemHoverDelayDuration:](v69, "setItemHoverDelayDuration:");
    }
    v85 = v42;
    v93 = v16;
    v70 = +[VUIFeaturesConfiguration numberValueForKey:@"gradientUsesImageColor" fromDictionary:v96];
    v71 = v70;
    if (v70) {
      -[VUIMediaShowcasingConfig setGradientUsesImageColor:](self->_mediaShowcaseConfig, "setGradientUsesImageColor:", [v70 BOOLValue]);
    }
    v72 = +[VUIFeaturesConfiguration numberValueForKey:@"hideMuteButtonDelayDuration" fromDictionary:v96];
    v73 = v72;
    if (v72)
    {
      v74 = self->_mediaShowcaseConfig;
      [v72 doubleValue];
      -[VUIMediaShowcasingConfig setHideMuteButtonDelayDuration:](v74, "setHideMuteButtonDelayDuration:");
    }
    v75 = +[VUIFeaturesConfiguration numberValueForKey:@"hidePageIndicatorsDelayDuration" fromDictionary:v96];
    v76 = v75;
    if (v75)
    {
      v77 = self->_mediaShowcaseConfig;
      [v75 doubleValue];
      -[VUIMediaShowcasingConfig setHidePageIndicatorsDelayDuration:](v77, "setHidePageIndicatorsDelayDuration:");
    }
    if (+[VUIFeaturesConfiguration BOOLValueForKey:@"mediaShowcasingAllowsFullscreenTransition" fromDictionary:v96 defaultValue:0])
    {
      [(VUIMediaShowcasingConfig *)self->_mediaShowcaseConfig setAllowsFullscreenMediaTransition:1];
    }
    v78 = +[VUIFeaturesConfiguration numberValueForKey:@"sidebarOpenDuringAnimationThreshold" fromDictionary:v96];
    v79 = v78;
    if (v78)
    {
      v80 = self->_mediaShowcaseConfig;
      [v78 floatValue];
      -[VUIMediaShowcasingConfig setSidebarOpenDuringAnimationThreshold:](v80, "setSidebarOpenDuringAnimationThreshold:");
    }
  }
  MEMORY[0x1F4181870]();
}

+ (BOOL)BOOLValueForKey:(id)a3 fromDictionary:(id)a4 defaultValue:(BOOL)a5
{
  uint64_t v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    int v9 = +[VUIFeaturesConfiguration defaultsNumberValueForKey:v7];
    if (v9)
    {
      v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      LOBYTE(v5) = [v10 BOOLForKey:v7];
    }
    else
    {
      LOBYTE(v5) = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", v7, v5);
    }
  }
  return v5;
}

- (void)_populateLibConfig:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = +[VUIFeaturesConfiguration numberValueForKey:@"collectionItemLimit" fromDictionary:a3];
    uint64_t v5 = v4;
    if (v4)
    {
      -[VUILibConfig setCollectionItemLimit:](self->_libConfig, "setCollectionItemLimit:", [v4 integerValue]);
      if ((int)[v5 intValue] <= 1000)
      {
        uint64_t v6 = VUIDefaultLogObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7[0] = 67109120;
          v7[1] = [v5 intValue];
          _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: collectionItemLimit is not allowed to set to %d", (uint8_t *)v7, 8u);
        }
      }
    }
  }
}

- (void)_populateLaunchConfig:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[VUIFeaturesConfiguration numberValueForKey:@"useConfigCacheIgnoreExpiry" fromDictionary:v4];
  uint64_t v6 = v5;
  if (v5) {
    -[VUILaunchConfig setUseConfigCacheIgnoreExpiry:](self->_launchConfig, "setUseConfigCacheIgnoreExpiry:", [v5 BOOLValue]);
  }
  id v7 = +[VUIFeaturesConfiguration numberValueForKey:@"extendedCacheExpireDuration" fromDictionary:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    launchConfig = self->_launchConfig;
    [v7 doubleValue];
    -[VUILaunchConfig setExtendedCacheExpireDuration:](launchConfig, "setExtendedCacheExpireDuration:");
  }
  v10 = +[VUIFeaturesConfiguration numberValueForKey:@"useSharedURLSession" fromDictionary:v4];
  __int16 v11 = v10;
  if (v10) {
    -[VUILaunchConfig setUseSharedURLSession:](self->_launchConfig, "setUseSharedURLSession:", [v10 BOOLValue]);
  }
  float v12 = +[VUIFeaturesConfiguration numberValueForKey:@"prewarmUTSConnection" fromDictionary:v4];
  __int16 v13 = v12;
  if (v12) {
    -[VUILaunchConfig setPrewarmUTSConnection:](self->_launchConfig, "setPrewarmUTSConnection:", [v12 BOOLValue]);
  }
  uint64_t v51 = v13;
  uint64_t v14 = +[VUIFeaturesConfiguration numberValueForKey:@"alwaysPrefetchAppConfiguration" fromDictionary:v4];
  uint64_t v15 = v14;
  if (v14) {
    -[VUILaunchConfig setAlwaysPrefetchAppConfiguration:](self->_launchConfig, "setAlwaysPrefetchAppConfiguration:", [v14 BOOLValue]);
  }
  v16 = +[VUIFeaturesConfiguration numberValueForKey:@"prefetchLastSelectedTab" fromDictionary:v4];
  v17 = v16;
  if (v16) {
    -[VUILaunchConfig setPrefetchLastSelectedTab:](self->_launchConfig, "setPrefetchLastSelectedTab:", [v16 BOOLValue]);
  }
  float v18 = +[VUIFeaturesConfiguration numberValueForKey:@"prefetchedTabExpirationDuration" fromDictionary:v4];
  v19 = v18;
  if (v18)
  {
    v20 = self->_launchConfig;
    [v18 doubleValue];
    -[VUILaunchConfig setPrefetchedTabExpirationDuration:](v20, "setPrefetchedTabExpirationDuration:");
  }
  v46 = v17;
  uint64_t v49 = v19;
  v21 = +[VUIFeaturesConfiguration numberValueForKey:@"prewarmImageConnection" fromDictionary:v4];
  v22 = v21;
  if (v21) {
    -[VUILaunchConfig setPrewarmImageConnection:](self->_launchConfig, "setPrewarmImageConnection:", [v21 BOOLValue]);
  }
  float v23 = +[VUIFeaturesConfiguration numberValueForKey:@"minimalSessionImageLoading" fromDictionary:v4];
  float v24 = v23;
  if (v23) {
    -[VUILaunchConfig setMinimalSessionImageLoading:](self->_launchConfig, "setMinimalSessionImageLoading:", [v23 BOOLValue]);
  }
  v48 = v24;
  float v54 = v6;
  uint64_t v25 = +[VUIFeaturesConfiguration stringValueForKey:@"prewarmImageUrl" fromDictionary:v4];
  if (v25) {
    [(VUILaunchConfig *)self->_launchConfig setPrewarmImageUrl:v25];
  }
  v47 = (void *)v25;
  uint64_t v53 = v8;
  v26 = +[VUIFeaturesConfiguration numberValueForKey:@"prewarmJetpackLoading" fromDictionary:v4];
  v27 = v26;
  v28 = v15;
  if (v26) {
    -[VUILaunchConfig setPrewarmJetpackLoading:](self->_launchConfig, "setPrewarmJetpackLoading:", [v26 BOOLValue]);
  }
  uint64_t v52 = v11;
  float v29 = +[VUIFeaturesConfiguration numberValueForKey:@"layoutReuseIdleTimeToLive" fromDictionary:v4];
  v30 = v29;
  if (v29) {
    -[VUILaunchConfig setLayoutReuseIdleTimeToLive:](self->_launchConfig, "setLayoutReuseIdleTimeToLive:", [v29 integerValue]);
  }
  v31 = +[VUIFeaturesConfiguration numberValueForKey:@"collectionUseIdForReuseIdEnabled" fromDictionary:v4];
  v32 = v31;
  if (v31)
  {
    -[VUILaunchConfig setCollectionUseIdForReuseIdEnabled:](self->_launchConfig, "setCollectionUseIdForReuseIdEnabled:", [v31 BOOLValue]);
    v33 = VUIDefaultLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v32;
      _os_log_impl(&dword_1E2BD7000, v33, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig collectionUseIdForReuseIdEnabled: %@", buf, 0xCu);
    }
  }
  v34 = +[VUIFeaturesConfiguration numberValueForKey:@"gridViewUseItemIdAsReuseId" fromDictionary:v4];
  id v35 = v34;
  if (v34)
  {
    -[VUILaunchConfig setGridViewUseItemIdAsReuseId:](self->_launchConfig, "setGridViewUseItemIdAsReuseId:", [v34 BOOLValue]);
    float v36 = VUIDefaultLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v35;
      _os_log_impl(&dword_1E2BD7000, v36, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig gridViewUseItemIdAsReuseId: %@", buf, 0xCu);
    }
  }
  float v50 = v28;
  v37 = +[VUIFeaturesConfiguration numberValueForKey:@"memoryImageCacheEnabled" fromDictionary:v4];
  v38 = v37;
  if (v37)
  {
    -[VUILaunchConfig setMemoryImageCacheEnabled:](self->_launchConfig, "setMemoryImageCacheEnabled:", [v37 BOOLValue]);
    v39 = VUIDefaultLogObject();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v38;
      _os_log_impl(&dword_1E2BD7000, v39, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig memoryImageCacheEnabled: %@", buf, 0xCu);
    }
  }
  float v40 = +[VUIFeaturesConfiguration numberValueForKey:@"imageInMemoryCacheSizeLimitInBytes", v4, v22 fromDictionary];
  if (v32)
  {
    -[VUILaunchConfig setImageInMemoryCacheSizeLimitInBytes:](self->_launchConfig, "setImageInMemoryCacheSizeLimitInBytes:", [v32 integerValue]);
    v41 = VUIDefaultLogObject();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v40;
      _os_log_impl(&dword_1E2BD7000, v41, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig imageInMemoryCacheSizeLimitInBytes: %@", buf, 0xCu);
    }
  }
  v42 = +[VUIFeaturesConfiguration numberValueForKey:@"deferRichTextViewUpdate" fromDictionary:v4];
  v43 = v42;
  if (v42)
  {
    -[VUILaunchConfig setDeferRichTextViewUpdate:](self->_launchConfig, "setDeferRichTextViewUpdate:", [v42 BOOLValue]);
    v44 = VUIDefaultLogObject();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v43;
      _os_log_impl(&dword_1E2BD7000, v44, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig deferRichTextViewUpdate: %@", buf, 0xCu);
    }
  }
}

- (void)_populateGDPRConfig:(id)a3
{
  if (a3)
  {
    id v4 = +[VUIFeaturesConfiguration numberValueForKey:@"popoverHeight" fromDictionary:a3];
    if (v4)
    {
      gdprConfig = self->_gdprConfig;
      id v7 = v4;
      [v4 floatValue];
      [(VUIGDPRConfig *)gdprConfig setPopoverHeight:v6];
      id v4 = v7;
    }
  }
}

- (void)_populateCanonicalConfig:(id)a3
{
  id v12 = a3;
  if ([v12 count])
  {
    id v4 = +[VUIFeaturesConfiguration numberValueForKey:@"videoViewOffscreenThresholdToStopPlayback" fromDictionary:v12];
    uint64_t v5 = v4;
    if (v4)
    {
      canonicalConfig = self->_canonicalConfig;
      [v4 floatValue];
      -[VUICanonicalConfig setVideoViewOffscreenThresholdToStopPlayback:](canonicalConfig, "setVideoViewOffscreenThresholdToStopPlayback:");
    }
    id v7 = +[VUIFeaturesConfiguration numberValueForKey:@"playbackDelayInterval" fromDictionary:v12];
    uint64_t v8 = v7;
    if (v7)
    {
      int v9 = self->_canonicalConfig;
      [v7 doubleValue];
      -[VUICanonicalConfig setPlaybackDelayInterval:](v9, "setPlaybackDelayInterval:");
    }
    v10 = +[VUIFeaturesConfiguration stringValueForKey:@"storeTabIdentifer" fromDictionary:v12];
    if (v10) {
      [(VUICanonicalConfig *)self->_canonicalConfig setStoreTabIdentifier:v10];
    }
    __int16 v11 = +[VUIFeaturesConfiguration stringValueForKey:@"tvShowsTabIdentifier" fromDictionary:v12];
    if (v11) {
      [(VUICanonicalConfig *)self->_canonicalConfig setTvShowsTabIdentifier:v11];
    }
  }
  MEMORY[0x1F4181870]();
}

- (void)_populateAccountMessageConfig:(id)a3
{
  id v4 = a3;
  id v10 = [v4 objectForKey:@"visibilityBehaviours"];
  uint64_t v5 = +[VUIFeaturesConfiguration defaultsStringValueForKey:@"fallbackVisibilityType"];
  float v6 = [v4 objectForKey:@"fallbackVisibilityType"];
  id v7 = +[VUIFeaturesConfiguration numberValueForKey:@"alwaysForceOpenSidebarAnimated" fromDictionary:v4];
  uint64_t v8 = +[VUIFeaturesConfiguration numberValueForKey:@"alwaysForceOpenSidebarNonAnimated" fromDictionary:v4];

  if (v10) {
    [(VUIAccountMessageConfig *)self->_accountMessageConfig setVisibilityBehaviours:v10];
  }
  int v9 = v5;
  if (v5 || (int v9 = v6) != 0) {
    [(VUIAccountMessageConfig *)self->_accountMessageConfig setFallbackVisibilityType:VUIAccountMessageVisibilityTypeFromString(v9)];
  }
  if (v7) {
    -[VUIAccountMessageConfig setAlwaysForceOpenSidebarAnimated:](self->_accountMessageConfig, "setAlwaysForceOpenSidebarAnimated:", [v7 BOOLValue]);
  }
  if (v8) {
    -[VUIAccountMessageConfig setAlwaysForceOpenSidebarNonAnimated:](self->_accountMessageConfig, "setAlwaysForceOpenSidebarNonAnimated:", [v8 BOOLValue]);
  }
}

+ (id)stringValueForKey:(id)a3 fromDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = +[VUIFeaturesConfiguration defaultsStringValueForKey:v5];
    if (!v7)
    {
      id v7 = objc_msgSend(v6, "vui_stringForKey:", v5);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)defaultsStringValueForKey:(id)a3
{
  id v3 = a3;
  int has_internal_content = os_variant_has_internal_content();
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = v5;
  if (!has_internal_content) {
    goto LABEL_7;
  }
  id v7 = [v5 objectForKey:v3];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v7;
    uint64_t v8 = v7;
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (void)_populateAccountConfig:(id)a3
{
  id v4 = a3;
  id v6 = +[VUIFeaturesConfiguration numberValueForKey:@"showAccountSettingButtonOnLibraryTab" fromDictionary:v4];
  id v5 = +[VUIFeaturesConfiguration numberValueForKey:@"showAccountSettingOnSidebar" fromDictionary:v4];

  if (v6) {
    -[VUIAccountConfig setShowAccountSettingButtonOnLibraryTab:](self->_accountConfig, "setShowAccountSettingButtonOnLibraryTab:", [v6 BOOLValue]);
  }
  if (v5) {
    -[VUIAccountConfig setShowAccountSettingOnSidebar:](self->_accountConfig, "setShowAccountSettingOnSidebar:", [v5 BOOLValue]);
  }
}

- (VUIDropOnTabConfig)dropOnTabConfig
{
  return self->_dropOnTabConfig;
}

- (void)updateWithDictionary:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(VUIFeaturesConfiguration *)self _populateConfigWithDictionary:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    id v5 = [(VUIFeaturesConfiguration *)self cachedConfigDictionary];

    if (!v5)
    {
      id v6 = objc_opt_new();
      [(VUIFeaturesConfiguration *)self setCachedConfigDictionary:v6];
    }
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = @"launchConfig";
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    int v9 = [v7 setWithArray:v8];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if ([v9 containsObject:v15])
          {
            v16 = [v10 objectForKeyedSubscript:v15];
            [(NSMutableDictionary *)self->_cachedConfigDictionary setObject:v16 forKeyedSubscript:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }
  }
  v17 = [(VUIFeaturesConfiguration *)self cachedConfigDictionary];
  float v18 = (void *)[v17 copy];

  v19 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VUIFeaturesConfiguration_updateWithDictionary___block_invoke;
  block[3] = &unk_1E6DF3D58;
  id v22 = v18;
  id v20 = v18;
  dispatch_async(v19, block);
}

- (NSMutableDictionary)cachedConfigDictionary
{
  return self->_cachedConfigDictionary;
}

- (void)setCachedConfigDictionary:(id)a3
{
}

void __42__VUIFeaturesConfiguration_sharedInstance__block_invoke()
{
  v0 = VUISignpostLogObject();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Init", "", buf, 2u);
  }

  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance_defaultConfig;
  sharedInstance_defaultConfig = v1;

  id v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Init", "", v4, 2u);
  }
}

- (VUIFeaturesConfiguration)init
{
  v50.receiver = self;
  v50.super_class = (Class)VUIFeaturesConfiguration;
  v2 = [(VUIFeaturesConfiguration *)&v50 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    playbackUpNextConfig = v2->_playbackUpNextConfig;
    v2->_playbackUpNextConfig = (VUIPlaybackUpNextConfig *)v3;

    uint64_t v5 = objc_opt_new();
    nowPlayingConfig = v2->_nowPlayingConfig;
    v2->_nowPlayingConfig = (VUINowPlayingConfig *)v5;

    uint64_t v7 = objc_opt_new();
    playerTabsConfig = v2->_playerTabsConfig;
    v2->_playerTabsConfig = (VUIPlayerTabsConfig *)v7;

    uint64_t v9 = objc_opt_new();
    autoPlayConfig = v2->_autoPlayConfig;
    v2->_autoPlayConfig = (VUIAutoPlayConfig *)v9;

    uint64_t v11 = objc_opt_new();
    liveLinkConfig = v2->_liveLinkConfig;
    v2->_liveLinkConfig = (VUILiveLinkConfig *)v11;

    uint64_t v13 = objc_opt_new();
    downloadConfig = v2->_downloadConfig;
    v2->_downloadConfig = (VUIDownloadConfig *)v13;

    uint64_t v15 = objc_opt_new();
    syndicationConfig = v2->_syndicationConfig;
    v2->_syndicationConfig = (VUISyndicationConfig *)v15;

    uint64_t v17 = objc_opt_new();
    dropOnTabConfig = v2->_dropOnTabConfig;
    v2->_dropOnTabConfig = (VUIDropOnTabConfig *)v17;

    uint64_t v19 = objc_opt_new();
    mediaShowcaseConfig = v2->_mediaShowcaseConfig;
    v2->_mediaShowcaseConfig = (VUIMediaShowcasingConfig *)v19;

    uint64_t v21 = objc_opt_new();
    upNextConfig = v2->_upNextConfig;
    v2->_upNextConfig = (VUIUpNextConfig *)v21;

    uint64_t v23 = objc_opt_new();
    canonicalConfig = v2->_canonicalConfig;
    v2->_canonicalConfig = (VUICanonicalConfig *)v23;

    uint64_t v25 = objc_opt_new();
    accountConfig = v2->_accountConfig;
    v2->_accountConfig = (VUIAccountConfig *)v25;

    uint64_t v27 = objc_opt_new();
    accountMessageConfig = v2->_accountMessageConfig;
    v2->_accountMessageConfig = (VUIAccountMessageConfig *)v27;

    uint64_t v29 = objc_opt_new();
    rootControllerConfig = v2->_rootControllerConfig;
    v2->_rootControllerConfig = (VUIRootControllerConfig *)v29;

    uint64_t v31 = objc_opt_new();
    tabItemsUpdateConfig = v2->_tabItemsUpdateConfig;
    v2->_tabItemsUpdateConfig = (VUITabItemsUpdateConfig *)v31;

    uint64_t v33 = objc_opt_new();
    launchConfig = v2->_launchConfig;
    v2->_launchConfig = (VUILaunchConfig *)v33;

    uint64_t v35 = objc_opt_new();
    multiviewConfig = v2->_multiviewConfig;
    v2->_multiviewConfig = (VUIMultiviewConfig *)v35;

    uint64_t v37 = objc_opt_new();
    libConfig = v2->_libConfig;
    v2->_libConfig = (VUILibConfig *)v37;

    uint64_t v39 = objc_opt_new();
    gdprConfig = v2->_gdprConfig;
    v2->_gdprConfig = (VUIGDPRConfig *)v39;

    uint64_t v41 = objc_opt_new();
    timedMetadataConfig = v2->_timedMetadataConfig;
    v2->_timedMetadataConfig = (VUITimedMetadataConfig *)v41;

    uint64_t v43 = objc_opt_new();
    livePostPlayConfig = v2->_livePostPlayConfig;
    v2->_livePostPlayConfig = (VUILivePostPlayConfig *)v43;

    v45 = VUISignpostLogObject();
    if (os_signpost_enabled(v45))
    {
      *(_WORD *)uint64_t v49 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v45, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.ReadCache", "", v49, 2u);
    }

    BOOL v46 = [(VUIFeaturesConfiguration *)v2 _updateFromCache];
    v47 = VUISignpostLogObject();
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)uint64_t v49 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.ReadCache", "", v49, 2u);
    }

    if (!v46) {
      [(VUIFeaturesConfiguration *)v2 _populateRootControllerConfig:0];
    }
  }
  return v2;
}

- (BOOL)_updateFromCache
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIFeaturesConfiguration *)self _cachePath];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
    if (v4)
    {
      id v11 = 0;
      uint64_t v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
      id v6 = v11;
      uint64_t v7 = VUIDefaultLogObject();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 || !v5)
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v6;
          _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: Unable to load cache config: %@", buf, 0xCu);
        }

        BOOL v9 = 0;
      }
      else
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: populate features config from cache", buf, 2u);
        }

        BOOL v9 = [(VUIFeaturesConfiguration *)self _populateConfigWithDictionary:v5];
      }
    }
    else
    {
      id v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: There is no cached data, ignore", buf, 2u);
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_updateTVSettingsIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109120;
    BOOL v13 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: _updateTVSettingsIfNeeded autoPlayVideoSound = %d", (uint8_t *)&v12, 8u);
  }

  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 valueForKey:@"AutoPlayBgVideoSoundUserHasChanged"];
  uint64_t v7 = v6;
  if (v6 && [v6 BOOLValue])
  {
    BOOL v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: Ignore updating AutoPlayBgVideoSound because user has changed the value", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    BOOL v9 = [v5 valueForKey:@"AutoPlayBgVideoSound"];
    BOOL v8 = v9;
    if (v9) {
      int v10 = [v9 BOOLValue];
    }
    else {
      int v10 = 1;
    }
    if (v10 != v3)
    {
      id v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 67109120;
        BOOL v13 = v3;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: Update AutoPlayBgVideoSound to %d", (uint8_t *)&v12, 8u);
      }

      [v5 setBool:v3 forKey:@"AutoPlayBgVideoSound"];
    }
  }
}

- (void)_populateLivePostPlayConfig:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = objc_msgSend(v4, "vui_numberForKey:", @"clockScorePollingInterval");
    id v6 = v5;
    if (v5)
    {
      livePostPlayConfig = self->_livePostPlayConfig;
      [v5 doubleValue];
      -[VUILivePostPlayConfig setClockScorePollingInterval:](livePostPlayConfig, "setClockScorePollingInterval:");
    }
    BOOL v8 = objc_msgSend(v11, "vui_numberForKey:", @"dismissPlaybackDelay");
    BOOL v9 = v8;
    if (v8)
    {
      int v10 = self->_livePostPlayConfig;
      [v8 doubleValue];
      -[VUILivePostPlayConfig setDismissPlaybackDelay:](v10, "setDismissPlaybackDelay:");
    }

    id v4 = v11;
  }
}

- (VUIPlaybackUpNextConfig)playbackUpNextConfig
{
  return self->_playbackUpNextConfig;
}

- (VUINowPlayingConfig)nowPlayingConfig
{
  return self->_nowPlayingConfig;
}

- (VUIPlayerTabsConfig)playerTabsConfig
{
  return self->_playerTabsConfig;
}

- (VUIAutoPlayConfig)autoPlayConfig
{
  return self->_autoPlayConfig;
}

- (VUILiveLinkConfig)liveLinkConfig
{
  return self->_liveLinkConfig;
}

- (VUIDownloadConfig)downloadConfig
{
  return self->_downloadConfig;
}

- (VUISyndicationConfig)syndicationConfig
{
  return self->_syndicationConfig;
}

- (VUIMediaShowcasingConfig)mediaShowcaseConfig
{
  return self->_mediaShowcaseConfig;
}

- (VUIUpNextConfig)upNextConfig
{
  return self->_upNextConfig;
}

- (VUICanonicalConfig)canonicalConfig
{
  return self->_canonicalConfig;
}

- (VUIAccountConfig)accountConfig
{
  return self->_accountConfig;
}

- (VUIAccountMessageConfig)accountMessageConfig
{
  return self->_accountMessageConfig;
}

- (VUIRootControllerConfig)rootControllerConfig
{
  return self->_rootControllerConfig;
}

- (VUITabItemsUpdateConfig)tabItemsUpdateConfig
{
  return self->_tabItemsUpdateConfig;
}

- (VUIMultiviewConfig)multiviewConfig
{
  return self->_multiviewConfig;
}

- (VUIGDPRConfig)gdprConfig
{
  return self->_gdprConfig;
}

- (VUITimedMetadataConfig)timedMetadataConfig
{
  return self->_timedMetadataConfig;
}

- (VUILivePostPlayConfig)livePostPlayConfig
{
  return self->_livePostPlayConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfigDictionary, 0);
  objc_storeStrong((id *)&self->_livePostPlayConfig, 0);
  objc_storeStrong((id *)&self->_timedMetadataConfig, 0);
  objc_storeStrong((id *)&self->_gdprConfig, 0);
  objc_storeStrong((id *)&self->_libConfig, 0);
  objc_storeStrong((id *)&self->_multiviewConfig, 0);
  objc_storeStrong((id *)&self->_launchConfig, 0);
  objc_storeStrong((id *)&self->_tabItemsUpdateConfig, 0);
  objc_storeStrong((id *)&self->_rootControllerConfig, 0);
  objc_storeStrong((id *)&self->_accountMessageConfig, 0);
  objc_storeStrong((id *)&self->_accountConfig, 0);
  objc_storeStrong((id *)&self->_canonicalConfig, 0);
  objc_storeStrong((id *)&self->_upNextConfig, 0);
  objc_storeStrong((id *)&self->_mediaShowcaseConfig, 0);
  objc_storeStrong((id *)&self->_dropOnTabConfig, 0);
  objc_storeStrong((id *)&self->_syndicationConfig, 0);
  objc_storeStrong((id *)&self->_downloadConfig, 0);
  objc_storeStrong((id *)&self->_liveLinkConfig, 0);
  objc_storeStrong((id *)&self->_autoPlayConfig, 0);
  objc_storeStrong((id *)&self->_playerTabsConfig, 0);
  objc_storeStrong((id *)&self->_nowPlayingConfig, 0);
  objc_storeStrong((id *)&self->_playbackUpNextConfig, 0);
}

@end