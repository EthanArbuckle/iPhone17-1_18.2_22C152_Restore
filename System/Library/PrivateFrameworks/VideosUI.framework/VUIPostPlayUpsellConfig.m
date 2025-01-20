@interface VUIPostPlayUpsellConfig
+ (id)sharedInstance;
- (BOOL)_canShowUpsellForChannelId:(id)a3 showId:(id)a4 duration:(double)a5 elapsedTime:(double)a6;
- (BOOL)_isHistoryArrayFull:(id)a3 forMaxCount:(unint64_t)a4 inDurationWindow:(double)a5;
- (BOOL)hasShownPostPlay;
- (BOOL)isUpsellLimitedPerChannel;
- (BOOL)isUpsellLimitedPerShow;
- (BOOL)isUpsellOnPIPPlaybackExitEnabled;
- (BOOL)isUpsellOnPlaybackExitDisabled;
- (double)minPlaybackProgressPercentage;
- (double)upsellCountDurationPerChannel;
- (double)upsellCountDurationPerShow;
- (id)_cleanupHistory:(id)a3 atCurrentDate:(id)a4 isShow:(BOOL)a5;
- (id)_trimHistoryArray:(id)a3 forMaxCount:(unint64_t)a4 inDurationWindow:(double)a5 atCurrentDate:(id)a6;
- (id)appContext;
- (unint64_t)upsellMaxCountPerChannel;
- (unint64_t)upsellMaxCountPerShow;
- (void)_canShowUpsellForPolicy:(id)a3 duration:(double)a4 elapsedTime:(double)a5 completion:(id)a6;
- (void)_recordUpsellHistoryForShowId:(id)a3 onChannelId:(id)a4;
- (void)canShowUpsellForMediaItem:(id)a3 withElapsedTime:(double)a4 completion:(id)a5;
- (void)configureUsingDictionary:(id)a3;
- (void)disableUpsellOnPlaybackExit:(BOOL)a3;
- (void)enableUpsellOnPIPPlaybackExit:(BOOL)a3;
- (void)setChannelLevelUpsellRateOfMaxCount:(unint64_t)a3 inHours:(double)a4;
- (void)setHasShownPostPlay:(BOOL)a3;
- (void)setIsUpsellLimitedPerChannel:(BOOL)a3;
- (void)setIsUpsellLimitedPerShow:(BOOL)a3;
- (void)setIsUpsellOnPIPPlaybackExitEnabled:(BOOL)a3;
- (void)setIsUpsellOnPlaybackExitDisabled:(BOOL)a3;
- (void)setMinPlaybackProgressPercentage:(double)a3;
- (void)setMinPlaybackProgressPercentageForUpsellOnExit:(double)a3;
- (void)setShowLevelUpsellRateOfMaxCount:(unint64_t)a3 inHours:(double)a4;
- (void)setUpsellCountDurationPerChannel:(double)a3;
- (void)setUpsellCountDurationPerShow:(double)a3;
- (void)setUpsellMaxCountPerChannel:(unint64_t)a3;
- (void)setUpsellMaxCountPerShow:(unint64_t)a3;
@end

@implementation VUIPostPlayUpsellConfig

- (void)configureUsingDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - setting via JS %@", (uint8_t *)&v14, 0xCu);
    }

    -[VUIPostPlayUpsellConfig disableUpsellOnPlaybackExit:](self, "disableUpsellOnPlaybackExit:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"isDisabled", 0));
    -[VUIPostPlayUpsellConfig enableUpsellOnPIPPlaybackExit:](self, "enableUpsellOnPIPPlaybackExit:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"isPIPEnabled", 0));
    v6 = objc_msgSend(v4, "vui_numberForKey:", @"minPlaybackProgressPercentage");
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      -[VUIPostPlayUpsellConfig setMinPlaybackProgressPercentageForUpsellOnExit:](self, "setMinPlaybackProgressPercentageForUpsellOnExit:");
    }
    v8 = objc_msgSend(v4, "vui_numberForKey:", @"maxCountPerChannel");
    if (v8)
    {
      v9 = objc_msgSend(v4, "vui_numberForKey:", @"countDurationHrsPerChannel");
      uint64_t v10 = [v8 unsignedIntegerValue];
      [v9 doubleValue];
      -[VUIPostPlayUpsellConfig setChannelLevelUpsellRateOfMaxCount:inHours:](self, "setChannelLevelUpsellRateOfMaxCount:inHours:", v10);
    }
    v11 = objc_msgSend(v4, "vui_numberForKey:", @"maxCountPerShow");
    if (v11)
    {
      v12 = objc_msgSend(v4, "vui_numberForKey:", @"countDurationHrsPerShow");
      uint64_t v13 = [v11 unsignedIntegerValue];
      [v12 doubleValue];
      -[VUIPostPlayUpsellConfig setShowLevelUpsellRateOfMaxCount:inHours:](self, "setShowLevelUpsellRateOfMaxCount:inHours:", v13);
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_26 != -1) {
    dispatch_once(&sharedInstance_onceToken_26, &__block_literal_global_116);
  }
  v2 = (void *)sharedInstance_instance_3;
  return v2;
}

- (void)setMinPlaybackProgressPercentageForUpsellOnExit:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_minPlaybackProgressPercentage != a3)
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      double v7 = a3;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - set progress percentage for upsell on exit: %lf", (uint8_t *)&v6, 0xCu);
    }

    self->_minPlaybackProgressPercentage = a3;
  }
}

- (void)enableUpsellOnPIPPlaybackExit:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_isUpsellOnPIPPlaybackExitEnabled != a3)
  {
    BOOL v3 = a3;
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = "disable";
      if (v3) {
        int v6 = "enable";
      }
      int v7 = 136315138;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - %s upsell on pip pb exit", (uint8_t *)&v7, 0xCu);
    }

    self->_isUpsellOnPIPPlaybackExitEnabled = v3;
  }
}

- (void)disableUpsellOnPlaybackExit:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_isUpsellOnPlaybackExitDisabled != a3)
  {
    BOOL v3 = a3;
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = "enable";
      if (v3) {
        int v6 = "disable";
      }
      int v7 = 136315138;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - %s upsell on pb exit", (uint8_t *)&v7, 0xCu);
    }

    self->_isUpsellOnPlaybackExitDisabled = v3;
  }
}

uint64_t __41__VUIPostPlayUpsellConfig_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIPostPlayUpsellConfig);
  v1 = (void *)sharedInstance_instance_3;
  sharedInstance_instance_3 = (uint64_t)v0;

  [(id)sharedInstance_instance_3 setChannelLevelUpsellRateOfMaxCount:3 inHours:24.0];
  [(id)sharedInstance_instance_3 setShowLevelUpsellRateOfMaxCount:2 inHours:24.0];
  v2 = (void *)sharedInstance_instance_3;
  return [v2 setMinPlaybackProgressPercentageForUpsellOnExit:0.85];
}

- (void)setShowLevelUpsellRateOfMaxCount:(unint64_t)a3 inHours:(double)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 && a4 >= 0.001 || self->_upsellMaxCountPerShow != a3 || self->_upsellCountDurationPerShow != a4)
  {
    int v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      unint64_t v9 = a3;
      __int16 v10 = 2048;
      double v11 = a4;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - set show level rate: %ld per %f hrs", (uint8_t *)&v8, 0x16u);
    }

    if (a3)
    {
      self->_isUpsellLimitedPerShow = 1;
      self->_upsellMaxCountPerShow = a3;
      self->_upsellCountDurationPerShow = a4;
    }
    else
    {
      self->_isUpsellLimitedPerShow = 0;
    }
  }
}

- (void)setChannelLevelUpsellRateOfMaxCount:(unint64_t)a3 inHours:(double)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 && a4 >= 0.001 || self->_upsellMaxCountPerChannel != a3 || self->_upsellCountDurationPerChannel != a4)
  {
    int v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      unint64_t v9 = a3;
      __int16 v10 = 2048;
      double v11 = a4;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - set channel level rate: %ld per %f hrs", (uint8_t *)&v8, 0x16u);
    }

    if (a3)
    {
      self->_isUpsellLimitedPerChannel = 1;
      self->_upsellMaxCountPerChannel = a3;
      self->_upsellCountDurationPerChannel = a4;
    }
    else
    {
      self->_isUpsellLimitedPerChannel = 0;
    }
  }
}

- (id)appContext
{
  v2 = +[VUITVAppLauncher sharedInstance];
  BOOL v3 = [v2 appController];
  id v4 = [v3 appContext];

  return v4;
}

- (void)canShowUpsellForMediaItem:(id)a3 withElapsedTime:(double)a4 completion:(id)a5
{
  id v13 = a3;
  int v8 = (void (**)(id, void))a5;
  if ([(VUIPostPlayUpsellConfig *)self hasShownPostPlay])
  {
    v8[2](v8, 0);
  }
  else
  {
    unint64_t v9 = [v13 mediaItemMetadataForProperty:@"VUIContentMetadataPlaybackExitUpsellPolicy"];
    __int16 v10 = [v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EB0]];
    [v10 doubleValue];
    double v12 = v11;

    [(VUIPostPlayUpsellConfig *)self _canShowUpsellForPolicy:v9 duration:v8 elapsedTime:v12 completion:a4];
  }
}

- (void)_canShowUpsellForPolicy:(id)a3 duration:(double)a4 elapsedTime:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if ([v10 showUpsell])
  {
    double v12 = [(VUIPostPlayUpsellConfig *)self appContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke;
    v13[3] = &unk_1E6DFA9B0;
    double v16 = a5;
    double v17 = a4;
    id v14 = v10;
    id v15 = v11;
    [v12 evaluate:v13];
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

void __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke(uint64_t a1, void *a2)
{
  v18[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a2 objectForKeyedSubscript:@"ExitUpsellInterface"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  v18[0] = v4;
  v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 56)];
  v18[1] = v5;
  int v6 = [*(id *)(a1 + 32) playbackThreshold];
  v18[2] = v6;
  uint64_t v7 = [*(id *)(a1 + 32) thresholdValueType];
  int v8 = &unk_1F3F3D2C8;
  if (!v7) {
    int v8 = &unk_1F3F3D2B0;
  }
  v18[3] = v8;
  unint64_t v9 = [*(id *)(a1 + 32) rateLimitPolicies];
  v18[4] = v9;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_36;
  double v16 = &unk_1E6DF3D80;
  id v17 = *(id *)(a1 + 40);
  id v10 = _Block_copy(&v13);
  v18[5] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 6, v13, v14, v15, v16);
  id v12 = (id)[v3 invokeMethod:@"showUpsell" withArguments:v11];
}

void __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_36(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_2;
  v3[3] = &unk_1E6DF6338;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_canShowUpsellForChannelId:(id)a3 showId:(id)a4 duration:(double)a5 elapsedTime:(double)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v13 = [v12 dictionaryForKey:@"PostPlayUpsellConfig"];

  if (self->_isUpsellLimitedPerChannel)
  {
    uint64_t v14 = objc_msgSend(v13, "vui_dictionaryForKey:", @"PostPlayUpsellChannelHistory");
    id v15 = [v14 vui_arrayForKey:v10];
    if ([(VUIPostPlayUpsellConfig *)self _isHistoryArrayFull:v15 forMaxCount:self->_upsellMaxCountPerChannel inDurationWindow:self->_upsellCountDurationPerChannel])
    {
      double v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t upsellMaxCountPerChannel = self->_upsellMaxCountPerChannel;
        double upsellCountDurationPerChannel = self->_upsellCountDurationPerChannel;
        int v28 = 134218498;
        double v29 = *(double *)&upsellMaxCountPerChannel;
        __int16 v30 = 2048;
        double v31 = upsellCountDurationPerChannel;
        __int16 v32 = 2112;
        id v33 = v10;
        v19 = "VUIPostPlayUpsellConfig - post play upsell reached its per channel rate(%lu/%fhrs) limit for channel %@";
LABEL_10:
        _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, 0x20u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  if (self->_isUpsellLimitedPerShow)
  {
    uint64_t v14 = objc_msgSend(v13, "vui_dictionaryForKey:", @"PostPlayUpsellShowHistory");
    id v15 = [v14 vui_arrayForKey:v11];
    if ([(VUIPostPlayUpsellConfig *)self _isHistoryArrayFull:v15 forMaxCount:self->_upsellMaxCountPerShow inDurationWindow:self->_upsellCountDurationPerShow])
    {
      double v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t upsellMaxCountPerShow = self->_upsellMaxCountPerShow;
        double upsellCountDurationPerShow = self->_upsellCountDurationPerShow;
        int v28 = 134218498;
        double v29 = *(double *)&upsellMaxCountPerShow;
        __int16 v30 = 2048;
        double v31 = upsellCountDurationPerShow;
        __int16 v32 = 2112;
        id v33 = v11;
        v19 = "VUIPostPlayUpsellConfig - post play upsell reached its per show rate(%lu/%fhrs) limit for show %@";
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
  }
  double minPlaybackProgressPercentage = self->_minPlaybackProgressPercentage;
  if (minPlaybackProgressPercentage <= 0.0) {
    goto LABEL_21;
  }
  if (*MEMORY[0x1E4FA9DC8] == a5)
  {
    v23 = VUIDefaultLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - unknown content playback duration", (uint8_t *)&v28, 2u);
    }

    goto LABEL_19;
  }
  double v25 = a6 / a5;
  if (v25 >= minPlaybackProgressPercentage)
  {
LABEL_21:
    [(VUIPostPlayUpsellConfig *)self _recordUpsellHistoryForShowId:v11 onChannelId:v10];
    BOOL v24 = 1;
    goto LABEL_22;
  }
  uint64_t v14 = VUIDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v27 = self->_minPlaybackProgressPercentage;
    int v28 = 134218240;
    double v29 = v25;
    __int16 v30 = 2048;
    double v31 = v27;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - not enough played, playbackProgressPercentage %f < _minPlaybackProgressPercentage %f", (uint8_t *)&v28, 0x16u);
  }
LABEL_12:

LABEL_19:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (void)_recordUpsellHistoryForShowId:(id)a3 onChannelId:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  if (v31 && v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    int v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v9 = [v8 dictionaryForKey:@"PostPlayUpsellConfig"];

    __int16 v30 = (void *)v9;
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
    }
    else
    {
      id v10 = objc_opt_new();
    }
    id v11 = v10;
    uint64_t v12 = objc_msgSend(v10, "vui_dictionaryForKey:", @"PostPlayUpsellChannelHistory");
    double v29 = (void *)v12;
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
    }
    else
    {
      uint64_t v13 = objc_opt_new();
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = objc_msgSend(v11, "vui_dictionaryForKey:", @"PostPlayUpsellShowHistory");
    int v28 = (void *)v15;
    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v15];
    }
    else
    {
      uint64_t v16 = objc_opt_new();
    }
    id v17 = (void *)v16;
    uint64_t v18 = objc_msgSend(v14, "vui_arrayForKey:", v6);
    double v27 = (void *)v18;
    if (v18)
    {
      v19 = [MEMORY[0x1E4F1CA48] arrayWithArray:v18];
    }
    else
    {
      v19 = objc_opt_new();
    }
    v20 = v19;
    [v19 addObject:v7];
    [v14 setValue:v20 forKey:v6];
    v21 = objc_msgSend(v17, "vui_arrayForKey:", v31);
    if (v21)
    {
      v22 = [MEMORY[0x1E4F1CA48] arrayWithArray:v21];
    }
    else
    {
      v22 = objc_opt_new();
    }
    v23 = v22;
    [v22 addObject:v7];
    [v17 setValue:v23 forKey:v31];
    BOOL v24 = [(VUIPostPlayUpsellConfig *)self _cleanupHistory:v17 atCurrentDate:v7 isShow:1];

    double v25 = [(VUIPostPlayUpsellConfig *)self _cleanupHistory:v14 atCurrentDate:v7 isShow:0];

    [v11 setValue:v25 forKey:@"PostPlayUpsellChannelHistory"];
    [v11 setValue:v24 forKey:@"PostPlayUpsellShowHistory"];
    v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v26 setValue:v11 forKey:@"PostPlayUpsellConfig"];
  }
}

- (id)_cleanupHistory:(id)a3 atCurrentDate:(id)a4 isShow:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a4;
  [v8 allKeys];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = 40;
    if (v5) {
      uint64_t v12 = 24;
    }
    uint64_t v21 = v12;
    if (v5) {
      uint64_t v13 = 32;
    }
    else {
      uint64_t v13 = 48;
    }
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v8, "vui_arrayForKey:", v15);
        if (v16)
        {
          id v17 = [MEMORY[0x1E4F1CA48] arrayWithArray:v16];
          uint64_t v18 = [(VUIPostPlayUpsellConfig *)self _trimHistoryArray:v17 forMaxCount:*(Class *)((char *)&self->super.isa + v21) inDurationWindow:v22 atCurrentDate:*(double *)((char *)&self->super.isa + v13)];

          if ([v18 count]) {
            [v8 setValue:v18 forKey:v15];
          }
          else {
            [v8 removeObjectForKey:v15];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  return v8;
}

- (BOOL)_isHistoryArrayFull:(id)a3 forMaxCount:(unint64_t)a4 inDurationWindow:(double)a5
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [v7 count];
  if (v9)
  {
    uint64_t v10 = 0;
    double v11 = a5 * 60.0 * 60.0;
    uint64_t v12 = v9 - 1;
    do
    {
      uint64_t v13 = v10;
      if (v12 + v10 < 0) {
        break;
      }
      uint64_t v14 = [v7 objectAtIndexedSubscript:v12 + v10];
      [v8 timeIntervalSinceDate:v14];
      double v16 = v15;

      uint64_t v10 = v13 - 1;
    }
    while (v16 <= v11);
    BOOL v17 = -v13 >= a4;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)_trimHistoryArray:(id)a3 forMaxCount:(unint64_t)a4 inDurationWindow:(double)a5 atCurrentDate:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [v9 count];
  if (v11)
  {
    unint64_t v12 = v11;
    double v13 = a5 * 60.0 * 60.0;
    unint64_t v14 = v11;
    while ((--v14 & 0x8000000000000000) == 0)
    {
      double v15 = [v9 objectAtIndexedSubscript:v14];
      [v10 timeIntervalSinceDate:v15];
      double v17 = v16;

      if (v17 > v13)
      {
        if (v14 < v12) {
          objc_msgSend(v9, "removeObjectsInRange:", 0, v14 + 1);
        }
        break;
      }
    }
    if ((uint64_t)([v9 count] - a4) >= 1) {
      [v9 removeObjectsInRange:0];
    }
  }

  return v9;
}

- (BOOL)hasShownPostPlay
{
  return self->_hasShownPostPlay;
}

- (void)setHasShownPostPlay:(BOOL)a3
{
  self->_hasShownPostPlay = a3;
}

- (BOOL)isUpsellOnPlaybackExitDisabled
{
  return self->_isUpsellOnPlaybackExitDisabled;
}

- (void)setIsUpsellOnPlaybackExitDisabled:(BOOL)a3
{
  self->_isUpsellOnPlaybackExitDisabled = a3;
}

- (BOOL)isUpsellOnPIPPlaybackExitEnabled
{
  return self->_isUpsellOnPIPPlaybackExitEnabled;
}

- (void)setIsUpsellOnPIPPlaybackExitEnabled:(BOOL)a3
{
  self->_isUpsellOnPIPPlaybackExitEnabled = a3;
}

- (double)minPlaybackProgressPercentage
{
  return self->_minPlaybackProgressPercentage;
}

- (void)setMinPlaybackProgressPercentage:(double)a3
{
  self->_double minPlaybackProgressPercentage = a3;
}

- (BOOL)isUpsellLimitedPerShow
{
  return self->_isUpsellLimitedPerShow;
}

- (void)setIsUpsellLimitedPerShow:(BOOL)a3
{
  self->_isUpsellLimitedPerShow = a3;
}

- (unint64_t)upsellMaxCountPerShow
{
  return self->_upsellMaxCountPerShow;
}

- (void)setUpsellMaxCountPerShow:(unint64_t)a3
{
  self->_unint64_t upsellMaxCountPerShow = a3;
}

- (double)upsellCountDurationPerShow
{
  return self->_upsellCountDurationPerShow;
}

- (void)setUpsellCountDurationPerShow:(double)a3
{
  self->_double upsellCountDurationPerShow = a3;
}

- (BOOL)isUpsellLimitedPerChannel
{
  return self->_isUpsellLimitedPerChannel;
}

- (void)setIsUpsellLimitedPerChannel:(BOOL)a3
{
  self->_isUpsellLimitedPerChannel = a3;
}

- (unint64_t)upsellMaxCountPerChannel
{
  return self->_upsellMaxCountPerChannel;
}

- (void)setUpsellMaxCountPerChannel:(unint64_t)a3
{
  self->_unint64_t upsellMaxCountPerChannel = a3;
}

- (double)upsellCountDurationPerChannel
{
  return self->_upsellCountDurationPerChannel;
}

- (void)setUpsellCountDurationPerChannel:(double)a3
{
  self->_double upsellCountDurationPerChannel = a3;
}

@end