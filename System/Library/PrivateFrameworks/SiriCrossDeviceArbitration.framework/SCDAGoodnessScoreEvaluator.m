@interface SCDAGoodnessScoreEvaluator
- (BOOL)deviceAdjustTrialEnabled;
- (BOOL)evaluateForAudioAccessory;
- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5;
- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5 instrumentation:(id)a6;
- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 queue:(id)a4;
- (double)lastActivationTime;
- (id)_createSettingsConnectionIfRequired;
- (id)_readSidekickBoostsFile:(id)a3;
- (int64_t)deviceAdjustTrialValue;
- (unint64_t)_findSidekickBoost:(id)a3 isSpeaker:(BOOL)a4 model:(id)a5;
- (unsigned)_bumpGoodnessScore:(id)a3 lastActivationTime:(double)a4 mediaPlaybackInterruptedTime:(double)a5 ignoreAdjustedBoost:(BOOL)a6 recentlyWonBySmallAmount:(BOOL)a7;
- (unsigned)_getRecentBump:(double)a3 ignoreAdjustedBoost:(BOOL)a4 recentlyWonBySmallAmount:(BOOL)a5;
- (unsigned)getMyriadAdjustedBoostForGoodnessScoreContext:(id)a3;
- (unsigned)getPlatformBias;
- (void)_fetchDevicePlatformBiasIfRequired;
- (void)_reloadTrialConfiguredBoostValues;
- (void)_updateDeviceAdjust:(int64_t)a3;
- (void)_updateDeviceAdjustTrialEnabled:(BOOL)a3;
- (void)_updateMediaPlaybackBoost:(unsigned __int8)a3;
- (void)_updatePlatformBias:(unsigned __int8)a3;
- (void)_updateRecentSiriBoostTrialEnabled:(BOOL)a3;
- (void)_updateRecentSiriExponentialBoostDefined:(BOOL)a3 withSecondDegree:(double)a4 andFirstDegree:(double)a5 andIntercept:(double)a6;
- (void)_updateSidekickBoosts:(id)a3;
- (void)dealloc;
- (void)myriadTrialBoostsUpdated:(id)a3;
- (void)preheat;
- (void)setLastActivationTime:(double)a3;
@end

@implementation SCDAGoodnessScoreEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointModelName, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_pref, 0);
  objc_storeStrong((id *)&self->_deviceInstanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLastActivationTime:(double)a3
{
  self->_lastActivationTime = a3;
}

- (double)lastActivationTime
{
  return self->_lastActivationTime;
}

- (BOOL)evaluateForAudioAccessory
{
  return self->_evaluateForAudioAccessory;
}

- (unsigned)getMyriadAdjustedBoostForGoodnessScoreContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    v18 = "-[SCDAGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s #scda", (uint8_t *)&v17, 0xCu);
  }
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  BOOL v7 = [(SCDAAssistantPreferences *)self->_pref myriadShouldIgnoreAdjustedBoost];
  BOOL v8 = [(SCDAAssistantPreferences *)self->_pref ignoreMyriadPlatformBias];
  BOOL v9 = v8;
  if (v7 && v8)
  {
    unsigned int v10 = 0;
  }
  else if (v7)
  {
    unsigned int v10 = [(SCDAGoodnessScoreEvaluator *)self getPlatformBias];
  }
  else
  {
    v11 = [v4 reasons];
    double lastActivationTime = self->_lastActivationTime;
    [v4 mediaPlaybackInterruptedTime];
    unsigned int v10 = -[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:](self, "_bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:", v11, 0, [v4 recentlyWonBySmallAmount], lastActivationTime, v13);

    if (!v9) {
      v10 += [(SCDAGoodnessScoreEvaluator *)self getPlatformBias];
    }
  }
  v14 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    v18 = "-[SCDAGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    _os_log_impl(&dword_25C707000, v14, OS_LOG_TYPE_INFO, "%s #scda adjusted score: %ld", (uint8_t *)&v17, 0x16u);
  }
  if (v10 >= 0xFF) {
    unsigned __int8 v15 = -1;
  }
  else {
    unsigned __int8 v15 = v10;
  }
  os_unfair_lock_unlock(p_scoreEvaluationLock);

  return v15;
}

- (void)preheat
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SCDAGoodnessScoreEvaluator_preheat__block_invoke;
  block[3] = &unk_2654B81C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__SCDAGoodnessScoreEvaluator_preheat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDevicePlatformBiasIfRequired];
}

- (void)_reloadTrialConfiguredBoostValues
{
  v17[2] = *MEMORY[0x263EF8340];
  p_queue = &self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__1654;
  v14 = __Block_byref_object_dispose__1655;
  id v15 = (id)[objc_alloc(MEMORY[0x263F285E0]) initWithInstanceContext:self->_deviceInstanceContext];
  [(id)v11[5] setXPCConnectionManagementQueue:*p_queue];
  objc_initWeak(&location, self);
  id v4 = (void *)v11[5];
  v17[0] = @"RECENT_SIRI_BOOST_TRIAL_ENABLE";
  v17[1] = @"DEVICE_ADJUST_ENABLE";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v16[0] = @"RECENT_PLAYBACK_BOOST";
  v16[1] = @"HOMEPOD_BOOST";
  v16[2] = @"RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF";
  v16[3] = @"RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF";
  v16[4] = @"RECENT_SIRI_BOOST_INTERCEPT";
  v16[5] = @"DEVICE_ADJUST";
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SCDAGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke;
  v7[3] = &unk_2654B7A48;
  objc_copyWeak(&v8, &location);
  v7[4] = &v10;
  [v4 getTrialEnables:v5 doubleFactors:v6 withCompletion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);
}

void __63__SCDAGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      v11 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
        __int16 v56 = 2112;
        id v57 = v9;
        _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, "%s #scda Error loading Trial factors: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v12 = [v7 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_TRIAL_ENABLE"];
      uint64_t v13 = [v12 BOOLValue];
      if (v12)
      {
        [WeakRetained _updateRecentSiriBoostTrialEnabled:v13];
      }
      else
      {
        v14 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_25C707000, v14, OS_LOG_TYPE_DEBUG, "%s #scda Recent Siri Boost Trial Enable Not Loaded", buf, 0xCu);
        }
      }
      id v15 = [v7 objectForKeyedSubscript:@"DEVICE_ADJUST_ENABLE"];
      uint64_t v16 = [v15 BOOLValue];
      if (v15)
      {
        [WeakRetained _updateDeviceAdjustTrialEnabled:v16];
      }
      else
      {
        int v17 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_25C707000, v17, OS_LOG_TYPE_DEBUG, "%s #scda Device Adjust Trial Enable not loaded", buf, 0xCu);
        }
      }
      v18 = [v8 objectForKeyedSubscript:@"DEVICE_ADJUST"];
      v51 = v18;
      if (v18)
      {
        objc_msgSend(WeakRetained, "_updateDeviceAdjust:", objc_msgSend(v18, "integerValue"));
      }
      else
      {
        __int16 v19 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_25C707000, v19, OS_LOG_TYPE_DEBUG, "%s #scda Device Adjust Trial Value not loaded", buf, 0xCu);
        }
      }
      uint64_t v20 = [v8 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF"];
      uint64_t v21 = [v8 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF"];
      uint64_t v22 = [v8 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_INTERCEPT"];
      if (v20) {
        int v23 = v13;
      }
      else {
        int v23 = 0;
      }
      v52 = (void *)v22;
      v53 = v21;
      if (v23 == 1 && v21 && v22)
      {
        v24 = (void *)v22;
        [v20 doubleValue];
        double v26 = v25;
        [v21 doubleValue];
        double v28 = v27;
        [v24 doubleValue];
        double v30 = v29;
        v31 = WeakRetained;
        uint64_t v32 = 1;
        double v33 = v26;
        double v34 = v28;
      }
      else
      {
        v35 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          __int16 v56 = 2112;
          id v57 = v20;
          __int16 v58 = 2112;
          v59 = v53;
          __int16 v60 = 2112;
          v61 = v52;
          _os_log_debug_impl(&dword_25C707000, v35, OS_LOG_TYPE_DEBUG, "%s #scda Recent Siri exponential factors not loaded: %@ %@ %@", buf, 0x2Au);
        }
        double v33 = 0.0;
        double v34 = 0.0;
        double v30 = 0.0;
        v31 = WeakRetained;
        uint64_t v32 = 0;
      }
      [v31 _updateRecentSiriExponentialBoostDefined:v32 withSecondDegree:v33 andFirstDegree:v34 andIntercept:v30];
      v36 = [v8 objectForKeyedSubscript:@"RECENT_PLAYBACK_BOOST"];
      unsigned int v37 = [v36 unsignedIntValue];
      if (v36 && v37 <= 0xFF)
      {
        [WeakRetained _updateMediaPlaybackBoost:v37];
      }
      else
      {
        v38 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          __int16 v56 = 2112;
          id v57 = v36;
          _os_log_debug_impl(&dword_25C707000, v38, OS_LOG_TYPE_DEBUG, "%s #scda Trial Playback Boost not loaded: %@", buf, 0x16u);
        }
      }
      if (+[SCDAUtilities isCommunal])
      {
        v49 = v12;
        v50 = v15;
        v39 = [v8 objectForKeyedSubscript:@"HOMEPOD_BOOST"];
        v40 = [v7 objectForKeyedSubscript:@"MULTI_DEVICE_TRIAL_TREATMENT_CONSENSUS"];
        int v41 = [v40 BOOLValue];

        unsigned int v42 = [v39 unsignedIntValue];
        if (v39 && (unsigned __int8 v43 = v42, v42 <= 0xFF))
        {
          if (SCDAIsInternalInstall_onceToken != -1) {
            dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
          }
          if (SCDAIsInternalInstall_isInternal && !v41)
          {
            v45 = WeakRetained;
            uint64_t v44 = 12;
          }
          else
          {
            uint64_t v44 = v43;
            v45 = WeakRetained;
          }
          [v45 _updatePlatformBias:v44];
          uint64_t v12 = v49;
        }
        else
        {
          v46 = SCDALogContextCore;
          uint64_t v12 = v49;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
            __int16 v56 = 2112;
            id v57 = v39;
            _os_log_debug_impl(&dword_25C707000, v46, OS_LOG_TYPE_DEBUG, "%s #scda Trial HomePod Boost not loaded: %@", buf, 0x16u);
          }
        }

        id v15 = v50;
      }
      uint64_t v47 = *(void *)(*(void *)(a1 + 32) + 8);
      v48 = *(void **)(v47 + 40);
      *(void *)(v47 + 40) = 0;
    }
  }
}

- (unint64_t)_findSidekickBoost:(id)a3 isSpeaker:(BOOL)a4 model:(id)a5
{
  return 0;
}

- (id)_readSidekickBoostsFile:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    if (([v4 fileExistsAtPath:v3] & 1) == 0)
    {
      v11 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v3;
        _os_log_error_impl(&dword_25C707000, v11, OS_LOG_TYPE_ERROR, "%s Unable to find sidekick boosts plist at path %@.", buf, 0x16u);
      }
      id v10 = 0;
      goto LABEL_23;
    }
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v3];
    if (!v5)
    {
      uint64_t v12 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v3;
        _os_log_error_impl(&dword_25C707000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read sidekick boosts plist file at path %@.", buf, 0x16u);
      }
      id v10 = 0;
      goto LABEL_22;
    }
    id v18 = 0;
    v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:&v18];
    id v7 = v18;
    if (v7)
    {
      id v8 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v3;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_error_impl(&dword_25C707000, v8, OS_LOG_TYPE_ERROR, "%s Unable to initialize sidekick boosts from plist file at path %@ due to error %@", buf, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v6;
LABEL_21:

LABEL_22:
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v13 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        id v15 = v13;
        uint64_t v16 = (objc_class *)objc_opt_class();
        int v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v17;
        _os_log_error_impl(&dword_25C707000, v15, OS_LOG_TYPE_ERROR, "%s Unexpected type of initialized sidekick boosts plist %@.", buf, 0x16u);
      }
    }
    id v10 = 0;
    goto LABEL_21;
  }
  id v9 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
    _os_log_error_impl(&dword_25C707000, v9, OS_LOG_TYPE_ERROR, "%s _readSidekickBoostsFile: called with empty filepath", buf, 0xCu);
  }
  id v10 = 0;
LABEL_24:

  return v10;
}

- (void)_fetchDevicePlatformBiasIfRequired
{
  if (self->_platformBiasAcquisitionState != 2)
  {
    if (+[SCDAUtilities isHorseman]) {
      [(SCDAGoodnessScoreEvaluator *)self _updatePlatformBias:12];
    }
    self->_platformBiasAcquisitionState = 2;
  }
}

- (id)_createSettingsConnectionIfRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    id v4 = (AFSettingsConnection *)[objc_alloc(MEMORY[0x263F285E0]) initWithInstanceContext:self->_deviceInstanceContext];
    v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    [(AFSettingsConnection *)self->_settingsConnection setXPCConnectionManagementQueue:self->_queue];
    settingsConnection = self->_settingsConnection;
  }
  v6 = settingsConnection;
  return v6;
}

- (void)_updateSidekickBoosts:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[SCDAGoodnessScoreEvaluator _updateSidekickBoosts:]";
    _os_log_error_impl(&dword_25C707000, v3, OS_LOG_TYPE_ERROR, "%s #scda Error updating sidekick boosts: unsupported platform", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_updateRecentSiriExponentialBoostDefined:(BOOL)a3 withSecondDegree:(double)a4 andFirstDegree:(double)a5 andIntercept:(double)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_BOOL isExponentialBoostDefined = a3;
  self->_double recentSiriSecondDegreeCoefficient = a4;
  self->_double recentSiriFirstDegreeCoefficient = a5;
  self->_double recentSiriIntercept = a6;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  uint64_t v12 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    BOOL isExponentialBoostDefined = self->_isExponentialBoostDefined;
    double recentSiriSecondDegreeCoefficient = self->_recentSiriSecondDegreeCoefficient;
    double recentSiriFirstDegreeCoefficient = self->_recentSiriFirstDegreeCoefficient;
    double recentSiriIntercept = self->_recentSiriIntercept;
    int v17 = 136316162;
    id v18 = "-[SCDAGoodnessScoreEvaluator _updateRecentSiriExponentialBoostDefined:withSecondDegree:andFirstDegree:andIntercept:]";
    __int16 v19 = 1024;
    BOOL v20 = isExponentialBoostDefined;
    __int16 v21 = 2048;
    double v22 = recentSiriSecondDegreeCoefficient;
    __int16 v23 = 2048;
    double v24 = recentSiriFirstDegreeCoefficient;
    __int16 v25 = 2048;
    double v26 = recentSiriIntercept;
    _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s #scda updated Trial recent Siri exponential boost to %du %.12f %.12f %.12f", (uint8_t *)&v17, 0x30u);
  }
}

- (void)_updateDeviceAdjust:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 129) > 0xFFFFFFFFFFFFFEFELL)
  {
    os_unfair_lock_lock(&self->_scoreEvaluationLock);
    self->_int64_t deviceAdjust = a3;
    os_unfair_lock_unlock(&self->_scoreEvaluationLock);
    uint64_t v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      id v7 = @"YES";
      int64_t deviceAdjust = self->_deviceAdjust;
      if (!self->_isDeviceAdjustTrialEnabled) {
        id v7 = @"NO";
      }
      int v9 = 136315650;
      id v10 = "-[SCDAGoodnessScoreEvaluator _updateDeviceAdjust:]";
      __int16 v11 = 2112;
      int64_t v12 = (int64_t)v7;
      __int16 v13 = 2048;
      int64_t v14 = deviceAdjust;
      _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda updated Trial Device Adjust to (Enabled: %@) Value %ld", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[SCDAGoodnessScoreEvaluator _updateDeviceAdjust:]";
      __int16 v11 = 2048;
      int64_t v12 = a3;
      _os_log_error_impl(&dword_25C707000, v5, OS_LOG_TYPE_ERROR, "%s #scda Error: Attempting to assign out of bounds device adjust: %ld", (uint8_t *)&v9, 0x16u);
    }
    os_unfair_lock_lock(&self->_scoreEvaluationLock);
    self->_int64_t deviceAdjust = 0;
    os_unfair_lock_unlock(&self->_scoreEvaluationLock);
  }
}

- (void)_updateDeviceAdjustTrialEnabled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isDeviceAdjustTrialEnabled = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  uint64_t v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    id v7 = @"YES";
    int64_t deviceAdjust = self->_deviceAdjust;
    if (!self->_isDeviceAdjustTrialEnabled) {
      id v7 = @"NO";
    }
    int v9 = 136315650;
    id v10 = "-[SCDAGoodnessScoreEvaluator _updateDeviceAdjustTrialEnabled:]";
    __int16 v11 = 2112;
    int64_t v12 = v7;
    __int16 v13 = 2048;
    int64_t v14 = deviceAdjust;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda updated isDeviceAdjustTrialEnabled to Enabled: %@ (Value: %ld)", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_updateRecentSiriBoostTrialEnabled:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isRecentSiriBoostTrialEnabled = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  uint64_t v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    id v7 = @"YES";
    if (!self->_isRecentSiriBoostTrialEnabled) {
      id v7 = @"NO";
    }
    int v8 = 136315394;
    int v9 = "-[SCDAGoodnessScoreEvaluator _updateRecentSiriBoostTrialEnabled:]";
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda updated _isRecentSiriBoostTrialEnabled to %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_updateMediaPlaybackBoost:(unsigned __int8)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_int mediaPlaybackBoost = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  uint64_t v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int mediaPlaybackBoost = self->_mediaPlaybackBoost;
    int v8 = 136315394;
    int v9 = "-[SCDAGoodnessScoreEvaluator _updateMediaPlaybackBoost:]";
    __int16 v10 = 1024;
    int v11 = mediaPlaybackBoost;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda updated _mediaPlaybackBoost to %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)_updatePlatformBias:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_myriadPlatformBias = v3;
  myriadInstrumentation = self->_myriadInstrumentation;
  if (myriadInstrumentation) {
    [(SCDAInstrumentation *)myriadInstrumentation updateBoost:1 value:v3];
  }
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  id v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "-[SCDAGoodnessScoreEvaluator _updatePlatformBias:]";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s #scda updated platform bias to %d", (uint8_t *)&v8, 0x12u);
  }
}

- (unsigned)_bumpGoodnessScore:(id)a3 lastActivationTime:(double)a4 mediaPlaybackInterruptedTime:(double)a5 ignoreAdjustedBoost:(BOOL)a6 recentlyWonBySmallAmount:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  __int16 v13 = v12;
  if (!v12 || ([v12 containsObject:&unk_2709D7938] & 1) != 0)
  {
    LOBYTE(alarmTimerBoost) = 0;
    goto LABEL_4;
  }
  if ([v13 containsObject:&unk_2709D7950])
  {
    uint64_t alarmTimerBoost = self->_alarmTimerBoost;
    int v17 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)double v29 = 136315394;
      *(void *)&v29[4] = "-[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTi"
                           "me:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      *(_WORD *)&v29[12] = 1024;
      *(_DWORD *)&v29[14] = alarmTimerBoost;
      _os_log_impl(&dword_25C707000, v17, OS_LOG_TYPE_INFO, "%s #scda bumping goodness score (reason: alarm/timer firing, adjusted score: %d)", v29, 0x12u);
    }
    myriadInstrumentation = self->_myriadInstrumentation;
    if (myriadInstrumentation) {
      [(SCDAInstrumentation *)myriadInstrumentation updateBoost:7 value:alarmTimerBoost];
    }
  }
  else
  {
    LOBYTE(alarmTimerBoost) = 0;
  }
  if ([v13 containsObject:&unk_2709D7968])
  {
    if (!+[SCDAUtilities isCommunal]) {
      goto LABEL_4;
    }
    LOBYTE(alarmTimerBoost) = self->_mediaPlaybackBoost + alarmTimerBoost;
    uint64_t v19 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)double v29 = 136315394;
    *(void *)&v29[4] = "-[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime"
                         ":ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = alarmTimerBoost;
    BOOL v20 = "%s #scda bumping goodness score (reason: media playback active, bump: %d)";
    __int16 v21 = v19;
    uint32_t v22 = 18;
    goto LABEL_15;
  }
  if (![v13 containsObject:&unk_2709D7980]) {
    goto LABEL_4;
  }
  if (!+[SCDAUtilities isCommunal]) {
    goto LABEL_4;
  }
  double v24 = [MEMORY[0x263F08AB0] processInfo];
  [v24 systemUptime];
  double v26 = v25;

  if (v26 <= a5) {
    goto LABEL_4;
  }
  double v27 = v26 - a5;
  if (v27 > 60.0) {
    goto LABEL_4;
  }
  LOBYTE(alarmTimerBoost) = self->_mediaPlaybackBoost + alarmTimerBoost;
  uint64_t v28 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)double v29 = 136315650;
    *(void *)&v29[4] = "-[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime"
                         ":ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
    *(_WORD *)&v29[12] = 2048;
    *(double *)&v29[14] = v27;
    *(_WORD *)&v29[22] = 1024;
    LODWORD(v30) = alarmTimerBoost;
    BOOL v20 = "%s #scda bumping goodness score (reason: media playback interrupted, last playback time: %f seconds ago, bump: %d)";
    __int16 v21 = v28;
    uint32_t v22 = 28;
LABEL_15:
    _os_log_impl(&dword_25C707000, v21, OS_LOG_TYPE_INFO, v20, v29, v22);
  }
LABEL_16:
  __int16 v23 = self->_myriadInstrumentation;
  if (v23) {
    [(SCDAInstrumentation *)v23 updateBoost:6 value:alarmTimerBoost];
  }
LABEL_4:
  unsigned __int8 v15 = -[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:](self, "_getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:", v8, v7, a4, *(_OWORD *)v29, *(void *)&v29[16], v30);

  return v15 + alarmTimerBoost;
}

- (int64_t)deviceAdjustTrialValue
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int64_t deviceAdjust = self->_deviceAdjust;
    int v6 = 136315394;
    BOOL v7 = "-[SCDAGoodnessScoreEvaluator deviceAdjustTrialValue]";
    __int16 v8 = 2048;
    int64_t v9 = deviceAdjust;
    _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s #scda device adjust value: %ld", (uint8_t *)&v6, 0x16u);
  }
  return self->_deviceAdjust;
}

- (BOOL)deviceAdjustTrialEnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    BOOL isDeviceAdjustTrialEnabled = self->_isDeviceAdjustTrialEnabled;
    int v6 = 136315394;
    BOOL v7 = "-[SCDAGoodnessScoreEvaluator deviceAdjustTrialEnabled]";
    __int16 v8 = 1024;
    BOOL v9 = isDeviceAdjustTrialEnabled;
    _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s #scda device adjust trial enabled: %du", (uint8_t *)&v6, 0x12u);
  }
  return self->_isDeviceAdjustTrialEnabled;
}

- (unsigned)getPlatformBias
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int myriadPlatformBias = self->_myriadPlatformBias;
    int v7 = 136315394;
    __int16 v8 = "-[SCDAGoodnessScoreEvaluator getPlatformBias]";
    __int16 v9 = 1024;
    int v10 = myriadPlatformBias;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s #scda bumping goodness score (reason: platform bias, adjusted bias: %d)", (uint8_t *)&v7, 0x12u);
  }
  myriadInstrumentation = self->_myriadInstrumentation;
  if (myriadInstrumentation) {
    [(SCDAInstrumentation *)myriadInstrumentation updateBoost:1 value:self->_myriadPlatformBias];
  }
  return self->_myriadPlatformBias;
}

- (unsigned)_getRecentBump:(double)a3 ignoreAdjustedBoost:(BOOL)a4 recentlyWonBySmallAmount:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a4)
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v28 = 136315138;
      double v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s #scda ignoring recent event bump", (uint8_t *)&v28, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    BOOL v7 = a5;
    double v10 = 0.0;
    double v11 = 0.0;
    if (+[SCDAUtilities isIOS])
    {
      if (+[SCDAUtilities isDeviceUnlocked])
      {
        if (!+[SCDAUtilities accessibilitySupportsAttentionAwareFeatures])
        {
          id v12 = SCDALogContextCore;
          double v11 = 4.0;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            int v28 = 136315138;
            double v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
            _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s #scda device is unlocked and doesn't support attention, apply +4 bump", (uint8_t *)&v28, 0xCu);
          }
        }
      }
    }
    __int16 v13 = [MEMORY[0x263F08AB0] processInfo];
    [v13 systemUptime];
    double v15 = v14;

    double v16 = v15 - a3;
    double v17 = v15 - a3 + -15.0;
    if (v17 < 0.0) {
      double v17 = 0.0;
    }
    double v18 = v17 * -0.0444444455 + 8.0;
    if (v18 >= 0.0) {
      double v10 = v18;
    }
    if (self->_isRecentSiriBoostTrialEnabled && self->_isExponentialBoostDefined)
    {
      unsigned int v19 = SCDAGoodnessComputeExponentialBoost(a3, v15, self->_recentSiriSecondDegreeCoefficient, self->_recentSiriFirstDegreeCoefficient, self->_recentSiriIntercept);
      BOOL v20 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v28 = 136315650;
        double v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        __int16 v30 = 2048;
        double v31 = v10;
        __int16 v32 = 1024;
        *(_DWORD *)double v33 = v19;
        _os_log_impl(&dword_25C707000, v20, OS_LOG_TYPE_INFO, "%s #scda trial exponential boost configured, replacing %f with %du", (uint8_t *)&v28, 0x1Cu);
      }
      double v10 = (double)v19;
    }
    __int16 v21 = SCDALogContextCore;
    if (v7 && v10 > v11)
    {
      double v22 = 0.0;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v28 = 136316162;
        double v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        __int16 v30 = 2048;
        double v31 = v16;
        __int16 v32 = 2048;
        *(double *)double v33 = v11;
        *(_WORD *)&v33[8] = 2048;
        *(double *)&v33[10] = v11;
        *(_WORD *)&v33[18] = 2048;
        *(double *)&v33[20] = v10;
        _os_log_impl(&dword_25C707000, v21, OS_LOG_TYPE_INFO, "%s #scda previous close win: canceling recency bump from secsAgo=%f yields %f = %f(act) + %f(siri)", (uint8_t *)&v28, 0x34u);
        __int16 v21 = SCDALogContextCore;
      }
    }
    else
    {
      double v22 = v10;
    }
    if (v11 >= v22) {
      double v23 = v11;
    }
    else {
      double v23 = v22;
    }
    int v6 = (int)v23;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v28 = 136316162;
      double v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      __int16 v30 = 2048;
      double v31 = v16;
      __int16 v32 = 1024;
      *(_DWORD *)double v33 = v6;
      *(_WORD *)&v33[4] = 2048;
      *(double *)&v33[6] = v11;
      *(_WORD *)&v33[14] = 2048;
      *(double *)&v33[16] = v22;
      _os_log_impl(&dword_25C707000, v21, OS_LOG_TYPE_INFO, "%s #scda bumptoGoodness secsAgo=%f yields %d = %f(act) + %f(siri)", (uint8_t *)&v28, 0x30u);
    }
    myriadInstrumentation = self->_myriadInstrumentation;
    if (myriadInstrumentation && v6)
    {
      if (v11 <= v22)
      {
        uint64_t v25 = v22;
        uint64_t v26 = 4;
      }
      else
      {
        uint64_t v25 = v11;
        uint64_t v26 = 2;
      }
      [(SCDAInstrumentation *)myriadInstrumentation updateBoost:v26 value:v25];
    }
  }
  return v6;
}

- (void)myriadTrialBoostsUpdated:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SCDAGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke;
  block[3] = &unk_2654B81C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__SCDAGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[SCDAGoodnessScoreEvaluator myriadTrialBoostsUpdated:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s Trial Boosts Updated Notification", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _reloadTrialConfiguredBoostValues];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SCDAGoodnessScoreEvaluator;
  [(SCDAGoodnessScoreEvaluator *)&v4 dealloc];
}

- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5 instrumentation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  __int16 v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SCDAGoodnessScoreEvaluator;
  double v15 = [(SCDAGoodnessScoreEvaluator *)&v26 init];
  double v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deviceInstanceContext, a3);
    if (v12) {
      double v17 = (SCDAAssistantPreferences *)v12;
    }
    else {
      double v17 = [[SCDAAssistantPreferences alloc] initWithInstanceContext:v16->_deviceInstanceContext];
    }
    pref = v16->_pref;
    v16->_pref = v17;

    v16->_platformBiasAcquisitionState = 0;
    objc_storeStrong((id *)&v16->_queue, a5);
    v16->_evaluateForAudioAccessory = 0;
    v16->_scoreEvaluationLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v16->_myriadInstrumentation, a6);
    *(_WORD *)&v16->_int mediaPlaybackBoost = 5127;
    v16->_isSpeakerEndpoint = 0;
    endpointModelName = v16->_endpointModelName;
    v16->_endpointModelName = 0;

    *(_WORD *)&v16->_isRecentSiriBoostTrialEnabled = 0;
    v16->_BOOL isExponentialBoostDefined = 0;
    uint64_t v20 = MEMORY[0x263EF8330];
    *(_OWORD *)&v16->_double recentSiriSecondDegreeCoefficient = 0u;
    *(_OWORD *)&v16->_double recentSiriIntercept = 0u;
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __94__SCDAGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke;
    block[3] = &unk_2654B81C8;
    __int16 v21 = v16;
    uint64_t v25 = v21;
    dispatch_async(v13, block);
    double v22 = [MEMORY[0x263F087C8] defaultCenter];
    [v22 addObserver:v21 selector:sel_myriadTrialBoostsUpdated_ name:*MEMORY[0x263F282F0] object:0];
  }
  return v16;
}

uint64_t __94__SCDAGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchDevicePlatformBiasIfRequired];
  v2 = *(void **)(a1 + 32);
  return [v2 _reloadTrialConfiguredBoostValues];
}

- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5
{
  return [(SCDAGoodnessScoreEvaluator *)self initWithDeviceInstanceContext:a3 preferences:a4 queue:a5 instrumentation:0];
}

- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 queue:(id)a4
{
  return [(SCDAGoodnessScoreEvaluator *)self initWithDeviceInstanceContext:a3 preferences:0 queue:a4 instrumentation:0];
}

@end