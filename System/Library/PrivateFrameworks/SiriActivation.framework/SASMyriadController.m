@interface SASMyriadController
- (BOOL)_isTrialFeatureFlagEnabled;
- (BOOL)_isTrialMotionBoostEnabled;
- (BOOL)_isTrialUnlockBoostEnabled;
- (BOOL)_isTrialWakeBoostEnabled;
- (BOOL)activateForRequest:(id)a3 visible:(BOOL)a4;
- (BOOL)activateForRequest:(id)a3 withTimeout:(id)a4 visible:(BOOL)a5;
- (BOOL)activateForRequest:(id)a3 withTimeout:(id)a4 visible:(BOOL)a5 quiet:(BOOL)a6;
- (BOOL)canceledByMyriad;
- (SASMyriadController)initWithDelegate:(id)a3;
- (double)_calculateExponentialBoost:(double)a3 secondDegree:(double)a4 firstDegree:(double)a5 intercept:(double)a6;
- (unsigned)_calculateExpBoosts:(double)a3 eventTime:(double)a4 trialBoostSecondDegree:(id)a5 trialBoostFirstDegree:(id)a6 trialBoostIntercept:(id)a7;
- (void)_cacheFactors;
- (void)_configureMotionActivityManager;
- (void)_scdaCheckForAttention:(id)a3 withTimeout:(double)a4;
- (void)_setupTrialRefresh;
- (void)_updateRaiseToWakeTimeForTransition:(id)a3;
- (void)activateForInTaskRequest:(BOOL)a3 isVisible:(BOOL)a4;
- (void)dealloc;
- (void)didChangeLockState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3;
- (void)scdaShouldContinue:(id)a3;
- (void)setCanceledByMyriad:(BOOL)a3;
@end

@implementation SASMyriadController

void __40__SASMyriadController_initWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if ([v8 backlightState] == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained _updateRaiseToWakeTimeForTransition:v9];
    }
    else
    {
      v11 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        v13 = "-[SASMyriadController initWithDelegate:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE observerCalled. Screen is not activeOn. Ignoring transition=%@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_updateRaiseToWakeTimeForTransition:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    int v12 = "-[SASMyriadController _updateRaiseToWakeTimeForTransition:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE observerCalled transition=%@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [v4 transitionReasons];
  if (([v7 containsObject:*MEMORY[0x1E4FA6D48]] & 1) != 0
    || ([v7 containsObject:*MEMORY[0x1E4FA6D50]] & 1) != 0
    || ([v7 containsObject:*MEMORY[0x1E4FA6D58]] & 1) != 0
    || ([v7 containsObject:*MEMORY[0x1E4FA6D60]] & 1) != 0
    || ([v7 containsObject:*MEMORY[0x1E4FA6D70]] & 1) != 0
    || [v7 containsObject:*MEMORY[0x1E4FA6D78]])
  {
    id v8 = [MEMORY[0x1E4F28F80] processInfo];
    [v8 systemUptime];
    self->_raiseToWakeTime = v9;

    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "-[SASMyriadController _updateRaiseToWakeTimeForTransition:]";
      _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE wake gesture noted", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (SASMyriadController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SASMyriadController;
  v5 = [(SASMyriadController *)&v42 init];
  if (v5)
  {
    id inited = objc_initWeak(&location, v5);
    v5->_activityManagerLock._os_unfair_lock_opaque = 0;
    id v7 = inited;
    [(SASMyriadController *)v5 _configureMotionActivityManager];

    id v8 = [MEMORY[0x1E4F62950] configurationForDefaultMainDisplayMonitor];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    v38 = __40__SASMyriadController_initWithDelegate___block_invoke;
    v39 = &unk_1E6B67720;
    objc_copyWeak(&v40, &location);
    double v9 = _Block_copy(&v36);
    objc_msgSend(v8, "setTransitionHandler:", v9, v36, v37, v38, v39);
    uint64_t v10 = [MEMORY[0x1E4F62948] monitorWithConfiguration:v8];
    displayMonitor = v5->_displayMonitor;
    v5->_displayMonitor = (FBSDisplayLayoutMonitor *)v10;

    int v12 = objc_alloc_init(SASLockStateMonitor);
    lockStateMonitor = v5->_lockStateMonitor;
    v5->_lockStateMonitor = v12;

    [(SASLockStateMonitor *)v5->_lockStateMonitor setDelegate:v5];
    v5->_isLocked = 0;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F9FAE0]) initWithDelegate:v5];
    scdaCoordinator = v5->_scdaCoordinator;
    v5->_scdaCoordinator = (SCDACoordinator *)v14;

    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    uint64_t v16 = (void *)getAWAttentionAwarenessConfigurationClass_softClass;
    uint64_t v51 = getAWAttentionAwarenessConfigurationClass_softClass;
    if (!getAWAttentionAwarenessConfigurationClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAWAttentionAwarenessConfigurationClass_block_invoke;
      v46 = &unk_1E6B677B8;
      v47 = &v48;
      __getAWAttentionAwarenessConfigurationClass_block_invoke((uint64_t)buf);
      uint64_t v16 = (void *)v49[3];
    }
    v17 = v16;
    _Block_object_dispose(&v48, 8);
    id v18 = objc_alloc_init(v17);
    [v18 setIdentifier:@"com.apple.siri.SASMyriadController"];
    [v18 setEventMask:128];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    v19 = (void *)getAWAttentionAwarenessClientClass_softClass;
    uint64_t v51 = getAWAttentionAwarenessClientClass_softClass;
    if (!getAWAttentionAwarenessClientClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getAWAttentionAwarenessClientClass_block_invoke;
      v46 = &unk_1E6B677B8;
      v47 = &v48;
      __getAWAttentionAwarenessClientClass_block_invoke((uint64_t)buf);
      v19 = (void *)v49[3];
    }
    v20 = v19;
    _Block_object_dispose(&v48, 8);
    v21 = (AWAttentionAwarenessClient *)objc_alloc_init(v20);
    attentionClient = v5->_attentionClient;
    v5->_attentionClient = v21;

    [(AWAttentionAwarenessClient *)v5->_attentionClient setConfiguration:v18];
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.myriad_attention", v24);
    myriadAttentionQueue = v5->_myriadAttentionQueue;
    v5->_myriadAttentionQueue = (OS_dispatch_queue *)v25;

    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_destroyWeak(&v40);

    objc_destroyWeak(&location);
  }
  uint64_t v27 = [MEMORY[0x1E4FB0098] clientWithIdentifier:294];
  trialClient = v5->_trialClient;
  v5->_trialClient = (TRIClient *)v27;

  v29 = (id *)MEMORY[0x1E4F4E378];
  os_signpost_id_t v30 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F4E378]);
  v31 = *v29;
  v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9588000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SASMyriadController._cacheFactors", (const char *)&unk_1D95E21C3, buf, 2u);
  }

  [(SASMyriadController *)v5 _cacheFactors];
  v33 = *v29;
  v34 = v33;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9588000, v34, OS_SIGNPOST_INTERVAL_END, v30, "SASMyriadController._cacheFactors", (const char *)&unk_1D95E21C3, buf, 2u);
  }

  [(SASMyriadController *)v5 _setupTrialRefresh];
  return v5;
}

- (void)_cacheFactors
{
  id v3 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"WAKE_BOOST_TRIAL_ENABLE" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v4 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"MOTION_BOOST_TRIAL_ENABLE" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v5 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"UNLOCK_BOOST_TRIAL_ENABLE" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v6 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"WAKE_BOOST_SECOND_DEGREE_COEFF" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v7 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"WAKE_BOOST_FIRST_DEGREE_COEFF" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v8 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"WAKE_BOOST_INTERCEPT" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v9 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"MOTION_BOOST_SECOND_DEGREE_COEFF" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v10 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"MOTION_BOOST_FIRST_DEGREE_COEFF" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v11 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"MOTION_BOOST_INTERCEPT" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v12 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"UNLOCK_SECOND_DEGREE_COEFF" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v13 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"UNLOCK_FIRST_DEGREE_COEFF" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v14 = (id)[(TRIClient *)self->_trialClient levelForFactor:@"UNLOCK_BOOST_INTERCEPT" withNamespaceName:@"MYRIAD_BOOSTS"];
}

- (void)_setupTrialRefresh
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[SASMyriadController _setupTrialRefresh]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_INFO, "%s Registering update handler", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __41__SASMyriadController__setupTrialRefresh__block_invoke;
  id v12 = &unk_1E6B67748;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = self;
  id v4 = _Block_copy(&v9);
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("SASMyriadController", v5);

  trialRefreshQueue = self->_trialRefreshQueue;
  self->_trialRefreshQueue = v6;

  id v8 = (id)[(TRIClient *)self->_trialClient addUpdateHandlerForNamespaceName:@"MYRIAD_BOOSTS", self->_trialRefreshQueue, v4, v9, v10, v11, v12 queue usingBlock];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __41__SASMyriadController__setupTrialRefresh__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[SASMyriadController _setupTrialRefresh]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_INFO, "%s Myriad Trial boosts updated: %@", (uint8_t *)&v7, 0x16u);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] refresh];
    [*(id *)(a1 + 32) _cacheFactors];
  }
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_displayMonitor invalidate];
  [(CMMotionActivityManager *)self->_activityManager stopActivityUpdates];
  v3.receiver = self;
  v3.super_class = (Class)SASMyriadController;
  [(SASMyriadController *)&v3 dealloc];
}

- (void)setCanceledByMyriad:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SASMyriadController setCanceledByMyriad:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad setCanceledByMyriad: %d", (uint8_t *)&v6, 0x12u);
  }
  self->_canceledByMyriad = v3;
}

- (BOOL)activateForRequest:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isVoiceRequest]
    && (+[SASSystemState sharedSystemState],
        int v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isConnectedToCarPlay],
        v7,
        v8))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28ED0]);
    LODWORD(v10) = 1148846080;
    uint64_t v11 = (void *)[v9 initWithFloat:v10];
    BOOL v12 = [(SASMyriadController *)self activateForRequest:v6 withTimeout:v11 visible:v4];
  }
  else
  {
    BOOL v12 = [(SASMyriadController *)self activateForRequest:v6 withTimeout:0 visible:v4];
  }

  return v12;
}

- (BOOL)activateForRequest:(id)a3 withTimeout:(id)a4 visible:(BOOL)a5
{
  return [(SASMyriadController *)self activateForRequest:a3 withTimeout:a4 visible:a5 quiet:0];
}

- (BOOL)activateForRequest:(id)a3 withTimeout:(id)a4 visible:(BOOL)a5 quiet:(BOOL)a6
{
  BOOL v125 = a5;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 context];
  objc_opt_class();
  v126 = v10;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v11 = [v10 requestInfo];
    BOOL v12 = [v11 speechRequestOptions];
  }
  else
  {
    BOOL v12 = 0;
  }
  int v13 = [v12 isVoiceTrigger];
  id v14 = (id *)MEMORY[0x1E4F4E360];
  if (v13)
  {
    id v15 = [v12 scdaContext];
    uint64_t v16 = *v14;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SASMyriadController activateForRequest:withTimeout:visible:quiet:].cold.5(v15, v16);
    }

    if (AFCDAFaceDetection())
    {
      objc_initWeak((id *)location, self);
      myriadAttentionQueue = self->_myriadAttentionQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__SASMyriadController_activateForRequest_withTimeout_visible_quiet___block_invoke;
      block[3] = &unk_1E6B676F8;
      objc_copyWeak(&v131, (id *)location);
      id v15 = v15;
      id v130 = v15;
      dispatch_async(myriadAttentionQueue, block);
      id v18 = *v14;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[SASMyriadController activateForRequest:withTimeout:visible:quiet:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
      }

      objc_destroyWeak(&v131);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    id v15 = 0;
  }
  if (AFCDAFaceDetection() && AFAccessibilitySupportsAttentionAwareFeatures())
  {
    v26 = *v14;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[SASMyriadController activateForRequest:withTimeout:visible:quiet:](v26, v27, v28, v29, v30, v31, v32, v33);
    }

    uint64_t v34 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_activityManagerLock);
    if (self->_activityManager)
    {
      uint64_t v128 = 0x10000000000000;
      double liftEndTime = self->_liftEndTime;
      uint64_t v36 = [MEMORY[0x1E4F28F80] processInfo];
      [v36 systemUptime];
      uint64_t v34 = SASMyriadUtilCurrentBoostForDecay(20, (double *)&v128, 10.0, liftEndTime, v37);

      v38 = *v14;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315650;
        *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
        __int16 v133 = 2048;
        *(void *)v134 = v128;
        *(_WORD *)&v134[8] = 1024;
        *(_DWORD *)v135 = v34;
        _os_log_impl(&dword_1D9588000, v38, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE lift time delta %f, adjusting by %d", location, 0x1Cu);
      }

      if ([(SASMyriadController *)self _isTrialFeatureFlagEnabled])
      {
        v39 = *v14;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id location = 136315138;
          *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
          _os_log_impl(&dword_1D9588000, v39, OS_LOG_TYPE_DEFAULT, "%s #myriad Myriad Trial FF enabled", location, 0xCu);
        }

        if ([(SASMyriadController *)self _isTrialMotionBoostEnabled])
        {
          id v40 = *v14;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id location = 136315138;
            *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
            _os_log_impl(&dword_1D9588000, v40, OS_LOG_TYPE_DEFAULT, "%s #myriad trialMotionBoostEnabled", location, 0xCu);
          }

          v41 = [MEMORY[0x1E4F28F80] processInfo];
          [v41 systemUptime];
          double v43 = v42;

          uint64_t v34 = [(SASMyriadController *)self _calculateExpBoosts:@"MOTION_BOOST_SECOND_DEGREE_COEFF" eventTime:@"MOTION_BOOST_FIRST_DEGREE_COEFF" trialBoostSecondDegree:@"MOTION_BOOST_INTERCEPT" trialBoostFirstDegree:v43 trialBoostIntercept:self->_liftEndTime];
        }
      }
    }
    else
    {
      uint64_t v34 = 0;
    }
    os_unfair_lock_unlock(&self->_activityManagerLock);
  }
  id v127 = v9;
  if (AFMyriadEmitSelfMetrics()) {
    [(SCDACoordinator *)self->_scdaCoordinator instrumentationUpdateBoost:5 value:v34];
  }
  int v124 = v34;
  unint64_t v44 = [(SASLockStateMonitor *)self->_lockStateMonitor lockState];
  if (AFCDAFaceDetection() && AFAccessibilitySupportsAttentionAwareFeatures())
  {
    v45 = *v14;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      -[SASMyriadController activateForRequest:withTimeout:visible:quiet:](v45, v46, v47, v48, v49, v50, v51, v52);
    }

    goto LABEL_38;
  }
  if (v44)
  {
LABEL_38:
    uint64_t v53 = 0;
    goto LABEL_39;
  }
  uint64_t v128 = 0x10000000000000;
  double unlockTime = self->_unlockTime;
  v97 = [MEMORY[0x1E4F28F80] processInfo];
  [v97 systemUptime];
  uint64_t v53 = SASMyriadUtilCurrentBoostForDecay(4, (double *)&v128, 180.0, unlockTime, v98);

  v99 = *v14;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id location = 136315650;
    *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
    __int16 v133 = 2048;
    *(void *)v134 = v128;
    *(_WORD *)&v134[8] = 1024;
    *(_DWORD *)v135 = v53;
    _os_log_impl(&dword_1D9588000, v99, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE unlock time delta %f, adjusting by %d", location, 0x1Cu);
  }

  if ([(SASMyriadController *)self _isTrialFeatureFlagEnabled])
  {
    v100 = *v14;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
      _os_log_impl(&dword_1D9588000, v100, OS_LOG_TYPE_DEFAULT, "%s #myriad Myriad Trial FF enabled", location, 0xCu);
    }

    if ([(SASMyriadController *)self _isTrialUnlockBoostEnabled])
    {
      v101 = *v14;
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315138;
        *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
        _os_log_impl(&dword_1D9588000, v101, OS_LOG_TYPE_DEFAULT, "%s #myriad trialUnlockBoostEnabled]", location, 0xCu);
      }

      v102 = [MEMORY[0x1E4F28F80] processInfo];
      [v102 systemUptime];
      double v104 = v103;

      uint64_t v53 = [(SASMyriadController *)self _calculateExpBoosts:@"UNLOCK_SECOND_DEGREE_COEFF" eventTime:@"UNLOCK_FIRST_DEGREE_COEFF" trialBoostSecondDegree:@"UNLOCK_BOOST_INTERCEPT" trialBoostFirstDegree:v104 trialBoostIntercept:self->_unlockTime];
    }
  }
LABEL_39:
  if (AFMyriadEmitSelfMetrics()) {
    [(SCDACoordinator *)self->_scdaCoordinator instrumentationUpdateBoost:2 value:v53];
  }
  if (v44) {
    BOOL v54 = [(SASLockStateMonitor *)self->_lockStateMonitor isScreenOn];
  }
  else {
    BOOL v54 = 1;
  }
  v55 = *v14;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v56 = [(SASLockStateMonitor *)self->_lockStateMonitor isScreenOn];
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
    __int16 v133 = 1024;
    *(_DWORD *)v134 = v44 != 0;
    *(_WORD *)&v134[4] = 1024;
    *(_DWORD *)&v134[6] = v56;
    *(_WORD *)v135 = 1024;
    *(_DWORD *)&v135[2] = v54;
    _os_log_impl(&dword_1D9588000, v55, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE raise-to-wake locked=%d, screen=%d => shouldBoost:%d", location, 0x1Eu);
  }

  if (self->_displayMonitor) {
    BOOL v57 = v54;
  }
  else {
    BOOL v57 = 0;
  }
  if (v57)
  {
    uint64_t v128 = 0x10000000000000;
    double raiseToWakeTime = self->_raiseToWakeTime;
    v59 = [MEMORY[0x1E4F28F80] processInfo];
    [v59 systemUptime];
    uint64_t v61 = SASMyriadUtilCurrentBoostForDecay(85, (double *)&v128, 17.0, raiseToWakeTime, v60);

    v62 = *v14;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
      __int16 v133 = 2048;
      *(void *)v134 = v128;
      *(_WORD *)&v134[8] = 1024;
      *(_DWORD *)v135 = v61;
      _os_log_impl(&dword_1D9588000, v62, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE raise-to-wake time delta %f, adjusting by %d", location, 0x1Cu);
    }

    if ([(SASMyriadController *)self _isTrialFeatureFlagEnabled])
    {
      v63 = *v14;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315138;
        *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
        _os_log_impl(&dword_1D9588000, v63, OS_LOG_TYPE_DEFAULT, "%s #myriad Trial FF enabled", location, 0xCu);
      }

      if ([(SASMyriadController *)self _isTrialWakeBoostEnabled])
      {
        v64 = *v14;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id location = 136315138;
          *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
          _os_log_impl(&dword_1D9588000, v64, OS_LOG_TYPE_DEFAULT, "%s #myriad trialWakeBoostEnabled", location, 0xCu);
        }

        v65 = (id *)MEMORY[0x1E4F4E378];
        os_signpost_id_t v66 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F4E378]);
        v67 = *v65;
        v68 = v67;
        os_signpost_id_t spid = v66;
        unint64_t v69 = v66 - 1;
        if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
        {
          *(_WORD *)id location = 0;
          _os_signpost_emit_with_name_impl(&dword_1D9588000, v68, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SASMyriadController._calculateTrialWakeBoost", (const char *)&unk_1D95E21C3, location, 2u);
        }

        v70 = [MEMORY[0x1E4F28F80] processInfo];
        [v70 systemUptime];
        double v72 = v71;

        uint64_t v61 = [(SASMyriadController *)self _calculateExpBoosts:@"WAKE_BOOST_SECOND_DEGREE_COEFF" eventTime:@"WAKE_BOOST_FIRST_DEGREE_COEFF" trialBoostSecondDegree:@"WAKE_BOOST_INTERCEPT" trialBoostFirstDegree:v72 trialBoostIntercept:self->_raiseToWakeTime];
        v73 = *v65;
        v74 = v73;
        if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
        {
          *(_WORD *)id location = 0;
          _os_signpost_emit_with_name_impl(&dword_1D9588000, v74, OS_SIGNPOST_INTERVAL_END, spid, "SASMyriadController._calculateTrialWakeBoost", (const char *)&unk_1D95E21C3, location, 2u);
        }
      }
    }
    if (AFMyriadEmitSelfMetrics()) {
      [(SCDACoordinator *)self->_scdaCoordinator instrumentationUpdateBoost:3 value:v61];
    }
  }
  else
  {
    LODWORD(v61) = 0;
  }
  if ([v8 isVoiceRequest]
    && (+[SASSystemState sharedSystemState],
        v75 = objc_claimAutoreleasedReturnValue(),
        int v76 = [v75 isConnectedToCarPlay],
        v75,
        v76))
  {
    v77 = *v14;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
      __int16 v133 = 1024;
      *(_DWORD *)v134 = 15;
      _os_log_impl(&dword_1D9588000, v77, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE connected to carplay, adjusting by %d", location, 0x12u);
    }

    int v78 = 15;
    if (AFMyriadEmitSelfMetrics()) {
      [(SCDACoordinator *)self->_scdaCoordinator instrumentationUpdateBoost:1 value:15];
    }
  }
  else
  {
    int v78 = 0;
  }
  if ([v12 isVoiceTrigger])
  {
    v79 = [v12 scdaContext];

    if ([v8 isVoiceRequest]
      && (+[SASSystemState sharedSystemState],
          v80 = objc_claimAutoreleasedReturnValue(),
          int v81 = [v80 isConnectedToCarPlay],
          v80,
          v81))
    {
      v82 = *v14;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
        -[SASMyriadController activateForRequest:withTimeout:visible:quiet:](v82, v83, v84, v85, v86, v87, v88, v89);
      }

      id v15 = (id)[MEMORY[0x1E4F9FAD8] newWithBuilder:&__block_literal_global_4];
    }
    else
    {
      id v15 = v79;
    }
    if (!v125)
    {
      v105 = *v14;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136316418;
        *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
        __int16 v133 = 1024;
        *(_DWORD *)v134 = v53;
        *(_WORD *)&v134[4] = 1024;
        *(_DWORD *)&v134[6] = v124;
        *(_WORD *)v135 = 1024;
        *(_DWORD *)&v135[2] = v78;
        __int16 v136 = 1024;
        int v137 = v61;
        __int16 v138 = 1024;
        int v139 = v53 + v124 + v61 + v78;
        _os_log_impl(&dword_1D9588000, v105, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad voice trigger advertising needed adjusted by ul=%d + lt=%d + cp=%d + rtw=%d = %d", location, 0x2Au);
      }

      [(SASMyriadController *)self setCanceledByMyriad:0];
      if ((int)v53 + v124 + (int)v61 + v78 >= 255) {
        char v106 = -1;
      }
      else {
        char v106 = v53 + v124 + v61 + v78;
      }
      scdaCoordinator = self->_scdaCoordinator;
      if (v15) {
        [(SCDACoordinator *)scdaCoordinator startAdvertisingFromVoiceTriggerAdjusted:v106 withContext:v15];
      }
      else {
        [(SCDACoordinator *)scdaCoordinator startAdvertisingFromVoiceTriggerAdjusted:v106];
      }
      v92 = v127;
      id v14 = (id *)MEMORY[0x1E4F4E360];
      if (!v127) {
        goto LABEL_113;
      }
      goto LABEL_116;
    }
    v94 = *v14;
    v92 = v127;
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
      _os_log_impl(&dword_1D9588000, v94, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad voice trigger advertising while isVisible", location, 0xCu);
    }

    [(SASMyriadController *)self setCanceledByMyriad:0];
    v95 = self->_scdaCoordinator;
    if (v15)
    {
      [(SCDACoordinator *)v95 startAdvertisingFromInTaskVoiceTriggerWithContext:v15];
      if (!v127) {
        goto LABEL_113;
      }
LABEL_116:
      v109 = *v14;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v110 = [v8 activationEvent];
        *(_DWORD *)id location = 136315394;
        *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
        __int16 v133 = 2048;
        *(void *)v134 = v110;
        _os_log_impl(&dword_1D9588000, v109, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Siri is delayed for Myriad decision, evt = %ld", location, 0x16u);
      }

      [v92 floatValue];
      dispatch_time_t v112 = dispatch_time(0, (uint64_t)(float)(v111 * 1000000.0));
      v113 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
      self->_myriadFinishedSemaphore = v113;

      intptr_t v115 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_myriadFinishedSemaphore, v112);
      v116 = self->_myriadFinishedSemaphore;
      self->_myriadFinishedSemaphore = 0;

      if (v115)
      {
        v117 = *v14;
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id location = 136315394;
          *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
          __int16 v133 = 2048;
          *(void *)v134 = v115;
          _os_log_impl(&dword_1D9588000, v117, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE timed out waiting for Myriad decision, sem=%ld", location, 0x16u);
        }
      }
      BOOL canceledByMyriad = self->_canceledByMyriad;
      BOOL v108 = !self->_canceledByMyriad;
      v119 = *v14;
      BOOL v120 = os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT);
      if (canceledByMyriad)
      {
        if (v120)
        {
          *(_DWORD *)id location = 136315138;
          *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
          v121 = "%s #myriad BTLE Canceled Myriad decision. Not activating Siri.";
LABEL_127:
          _os_log_impl(&dword_1D9588000, v119, OS_LOG_TYPE_DEFAULT, v121, location, 0xCu);
        }
      }
      else if (v120)
      {
        *(_DWORD *)id location = 136315138;
        *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
        v121 = "%s #myriad BTLE Got Myriad decision. Activating Siri.";
        goto LABEL_127;
      }

      goto LABEL_129;
    }
    [(SCDACoordinator *)v95 startAdvertisingFromInTaskVoiceTrigger];
    if (v127) {
      goto LABEL_116;
    }
  }
  else
  {
    v90 = *v14;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]";
      _os_log_impl(&dword_1D9588000, v90, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad direct trigger advertising needed", location, 0xCu);
    }

    [(SASMyriadController *)self setCanceledByMyriad:0];
    v91 = self->_scdaCoordinator;
    v92 = v127;
    if (!v12)
    {
      [(SCDACoordinator *)self->_scdaCoordinator startAdvertisingFromDirectTrigger];
      if (!v127) {
        goto LABEL_113;
      }
      goto LABEL_116;
    }
    v93 = [v12 scdaContext];
    [(SCDACoordinator *)v91 startAdvertisingFromDirectTriggerWithContext:v93];

    if (v127) {
      goto LABEL_116;
    }
  }
LABEL_113:
  BOOL v108 = 1;
LABEL_129:

  return v108;
}

void __68__SASMyriadController_activateForRequest_withTimeout_visible_quiet___block_invoke(uint64_t a1)
{
  v2 = (NSObject **)MEMORY[0x1E4F4E360];
  BOOL v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
    __68__SASMyriadController_activateForRequest_withTimeout_visible_quiet___block_invoke_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v12 = WeakRetained;
  if (WeakRetained)
  {
    int v13 = [WeakRetained[10] isScreenOn];
    id v14 = *v2;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __68__SASMyriadController_activateForRequest_withTimeout_visible_quiet___block_invoke_cold_1(v13, v14);
    }
    double v15 = 0.75;
    if (v13) {
      double v15 = 0.5;
    }
    [v12 _scdaCheckForAttention:*(void *)(a1 + 32) withTimeout:v15];
  }
}

void __68__SASMyriadController_activateForRequest_withTimeout_visible_quiet___block_invoke_86(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F9FAE8];
  id v3 = a2;
  id v4 = (id)[[v2 alloc] initWithOverrideOption:1 reason:@"CarPlay request"];
  [v3 setOverrideState:v4];
}

- (BOOL)_isTrialUnlockBoostEnabled
{
  v2 = [(TRIClient *)self->_trialClient levelForFactor:@"UNLOCK_BOOST_TRIAL_ENABLE" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLeanValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isTrialMotionBoostEnabled
{
  v2 = [(TRIClient *)self->_trialClient levelForFactor:@"MOTION_BOOST_TRIAL_ENABLE" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLeanValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isTrialWakeBoostEnabled
{
  v2 = [(TRIClient *)self->_trialClient levelForFactor:@"WAKE_BOOST_TRIAL_ENABLE" withNamespaceName:@"MYRIAD_BOOSTS"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLeanValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isTrialFeatureFlagEnabled
{
  return _os_feature_enabled_impl();
}

- (unsigned)_calculateExpBoosts:(double)a3 eventTime:(double)a4 trialBoostSecondDegree:(id)a5 trialBoostFirstDegree:(id)a6 trialBoostIntercept:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  int v13 = [(TRIClient *)self->_trialClient levelForFactor:v10 withNamespaceName:@"MYRIAD_BOOSTS"];
  id v14 = [(TRIClient *)self->_trialClient levelForFactor:v11 withNamespaceName:@"MYRIAD_BOOSTS"];
  uint64_t v15 = [(TRIClient *)self->_trialClient levelForFactor:v12 withNamespaceName:@"MYRIAD_BOOSTS"];
  uint64_t v16 = (void *)v15;
  if (v13) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17 || v15 == 0)
  {
    uint64_t v19 = *MEMORY[0x1E4F4E360];
    LOBYTE(v20) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 136315138;
      uint64_t v36 = "-[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:]";
      _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #myriad error reading trial levels for trialBoostSecondDegree", (uint8_t *)&v35, 0xCu);
      LOBYTE(v20) = 0;
    }
  }
  else
  {
    [v13 doubleValue];
    uint64_t v22 = v21;
    [v14 doubleValue];
    uint64_t v24 = v23;
    [v16 doubleValue];
    uint64_t v26 = v25;
    uint64_t v27 = (NSObject **)MEMORY[0x1E4F4E360];
    uint64_t v28 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 136316674;
      uint64_t v36 = "-[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:]";
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2048;
      uint64_t v40 = v22;
      __int16 v41 = 2112;
      id v42 = v11;
      __int16 v43 = 2048;
      uint64_t v44 = v24;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2048;
      uint64_t v48 = v26;
      _os_log_impl(&dword_1D9588000, v28, OS_LOG_TYPE_DEFAULT, "%s #myriad trial coefficients %@:%f, %@:%f, %@:%f", (uint8_t *)&v35, 0x48u);
    }
    uint64_t v20 = SCDAGoodnessComputeExponentialBoost();
    uint64_t v30 = *v27;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v32 = v30;
      uint64_t v33 = [v31 numberWithUnsignedChar:v20];
      int v35 = 136315394;
      uint64_t v36 = "-[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:]";
      __int16 v37 = 2112;
      id v38 = v33;
      _os_log_impl(&dword_1D9588000, v32, OS_LOG_TYPE_DEFAULT, "%s #myriad trial bump uint8_t %@", (uint8_t *)&v35, 0x16u);
    }
  }

  return v20;
}

- (double)_calculateExponentialBoost:(double)a3 secondDegree:(double)a4 firstDegree:(double)a5 intercept:(double)a6
{
  return exp(-(a3 * a5 + a4 * (a3 * a3) + a6));
}

- (void)activateForInTaskRequest:(BOOL)a3 isVisible:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F4E360];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v7)
    {
      int v9 = 136315394;
      id v10 = "-[SASMyriadController activateForInTaskRequest:isVisible:]";
      __int16 v11 = 1024;
      BOOL v12 = v5;
      _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad voice trigger advertising while is visible [isVoiceTrigger %d]", (uint8_t *)&v9, 0x12u);
    }
    if (!v5)
    {
      uint64_t v8 = [MEMORY[0x1E4F9FAE0] currentCoordinator];
      [v8 startAdvertisingFromDirectTrigger];
    }
  }
  else if (v7)
  {
    int v9 = 136315650;
    id v10 = "-[SASMyriadController activateForInTaskRequest:isVisible:]";
    __int16 v11 = 1024;
    BOOL v12 = v5;
    __int16 v13 = 1024;
    int v14 = 0;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad ignoring advertisement [isVoiceTrigger %d, isVisible %d]", (uint8_t *)&v9, 0x18u);
  }
}

- (void)_scdaCheckForAttention:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (a4 == 0.0) {
    a4 = 0.5;
  }
  BOOL v7 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v8 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
    -[SASMyriadController _scdaCheckForAttention:withTimeout:].cold.5(v8, a4);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_myriadAttentionQueue);
  attentionClient = self->_attentionClient;
  id v24 = 0;
  char v10 = [(AWAttentionAwarenessClient *)attentionClient resumeWithError:&v24];
  id v11 = v24;
  if ((v10 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
    -[SASMyriadController _scdaCheckForAttention:withTimeout:].cold.4();
  }
  BOOL v12 = self->_attentionClient;
  id v22 = 0;
  id v23 = 0;
  int v13 = [(AWAttentionAwarenessClient *)v12 pollForAttentionWithTimeout:&v23 event:&v22 error:a4];
  id v14 = v23;
  id v15 = v22;
  os_log_t v16 = *v7;
  BOOL v17 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v17)
    {
      -[SASMyriadController _scdaCheckForAttention:withTimeout:](v14, v16, v15);
      if (!v14) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
    if (v14) {
LABEL_11:
    }
      [(SCDACoordinator *)self->_scdaCoordinator faceDetectedBoostWithContext:v6];
  }
  else if (v17)
  {
    -[SASMyriadController _scdaCheckForAttention:withTimeout:]((uint64_t)v14, v16, v15);
  }
LABEL_14:
  id v18 = self->_attentionClient;
  id v21 = 0;
  char v19 = [(AWAttentionAwarenessClient *)v18 suspendWithError:&v21];
  id v20 = v21;
  if ((v19 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
    -[SASMyriadController _scdaCheckForAttention:withTimeout:]();
  }
}

- (void)scdaShouldContinue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[SASMyriadController scdaShouldContinue:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad", (uint8_t *)&v10, 0xCu);
  }
  myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
  if (myriadFinishedSemaphore) {
    dispatch_semaphore_signal(myriadFinishedSemaphore);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 scdaShouldContinue:self];
  }
}

- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[SASMyriadController scdaShouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad", (uint8_t *)&v10, 0xCu);
  }
  self->_BOOL canceledByMyriad = 1;
  myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
  if (myriadFinishedSemaphore) {
    dispatch_semaphore_signal(myriadFinishedSemaphore);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 scdaShouldAbort:self];
  }
}

- (void)didChangeLockState:(unint64_t)a3 toState:(unint64_t)a4
{
  unsigned __int8 v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v7 = (a4 == 0) & a3;
  char v8 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "-[SASMyriadController didChangeLockState:toState:]";
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 1024;
    int v16 = (a3 == 0) & v4;
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_INFO, "%s #myriad screen lock -> unlock: %d, screen unlock -> lock: %d", (uint8_t *)&v11, 0x18u);
  }
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F28F80] processInfo];
    [v9 systemUptime];
    self->_double unlockTime = v10;
  }
}

- (void)_configureMotionActivityManager
{
  self->_double liftEndTime = -10.0;
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(21, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SASMyriadController__configureMotionActivityManager__block_invoke;
  v3[3] = &unk_1E6B675D8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__SASMyriadController__configureMotionActivityManager__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F22220] isActivityAvailable])
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v4 = (os_log_t *)MEMORY[0x1E4F4E360];
      BOOL v5 = (void *)*MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (void *)MEMORY[0x1E4F29060];
        int v7 = v5;
        char v8 = [v6 currentThread];
        *(_DWORD *)buf = 136315394;
        id v18 = "-[SASMyriadController _configureMotionActivityManager]_block_invoke";
        __int16 v19 = 2048;
        uint64_t v20 = [v8 qualityOfService];
        _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_activityManagerLock about to lock with qos: %zd", buf, 0x16u);
      }
      os_unfair_lock_lock(WeakRetained + 26);
      id v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = "-[SASMyriadController _configureMotionActivityManager]_block_invoke";
        _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_activityManagerLock successfully locked", buf, 0xCu);
      }
      id v10 = objc_alloc_init(MEMORY[0x1E4F22220]);
      int v11 = *(void **)&WeakRetained[28]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[28]._os_unfair_lock_opaque = v10;

      uint64_t v12 = *(void **)&WeakRetained[28]._os_unfair_lock_opaque;
      __int16 v13 = [MEMORY[0x1E4F28F08] mainQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__SASMyriadController__configureMotionActivityManager__block_invoke_101;
      v15[3] = &unk_1E6B67790;
      objc_copyWeak(&v16, v2);
      [v12 startActivityUpdatesToQueue:v13 withHandler:v15];

      os_unfair_lock_unlock(WeakRetained + 26);
      int v14 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = "-[SASMyriadController _configureMotionActivityManager]_block_invoke_2";
        _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_activityManagerLock unlocked", buf, 0xCu);
      }
      objc_destroyWeak(&v16);
    }
  }
}

void __54__SASMyriadController__configureMotionActivityManager__block_invoke_101(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
    BOOL v5 = WeakRetained;
    if (WeakRetained)
    {
      os_unfair_lock_lock(WeakRetained + 26);
      int v6 = [v9 stationary];
      LOBYTE(v5[22]._os_unfair_lock_opaque) = v6;
      if (v6)
      {
        int v7 = [MEMORY[0x1E4F28F80] processInfo];
        [v7 systemUptime];
        *(void *)&v5[24]._os_unfair_lock_opaque = v8;
      }
      os_unfair_lock_unlock(v5 + 26);
    }

    id v3 = v9;
  }
}

- (BOOL)canceledByMyriad
{
  return self->_canceledByMyriad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionClient, 0);
  objc_storeStrong((id *)&self->_myriadAttentionQueue, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_myriadFinishedSemaphore, 0);
  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
  objc_storeStrong((id *)&self->_trialRefreshQueue, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 quiet:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 quiet:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 quiet:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 quiet:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activateForRequest:(void *)a1 withTimeout:(NSObject *)a2 visible:quiet:.cold.5(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 debugDescription];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D9588000, a2, OS_LOG_TYPE_DEBUG, "%s #myriad scdaContext: %@", (uint8_t *)v4, 0x16u);
}

void __68__SASMyriadController_activateForRequest_withTimeout_visible_quiet___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SASMyriadController activateForRequest:withTimeout:visible:quiet:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_1D9588000, a2, OS_LOG_TYPE_DEBUG, "%s #myriad attention isScreenOn?: %d", (uint8_t *)&v2, 0x12u);
}

void __68__SASMyriadController_activateForRequest_withTimeout_visible_quiet___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_scdaCheckForAttention:withTimeout:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D9588000, v0, OS_LOG_TYPE_ERROR, "%s #myriad attention failed suspendWithError: %@", (uint8_t *)v1, 0x16u);
}

- (void)_scdaCheckForAttention:(void *)a3 withTimeout:.cold.2(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = a2;
  int v6 = [a1 isMetadataValid];
  int v7 = [a3 debugDescription];
  v10[0] = 136315906;
  OUTLINED_FUNCTION_2();
  __int16 v11 = 1024;
  int v12 = v6;
  __int16 v13 = v8;
  uint64_t v14 = v9;
  _os_log_debug_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEBUG, "%s #myriad attention awareness received attention event: %@, isMetadataValid %d, error: %@", (uint8_t *)v10, 0x26u);
}

- (void)_scdaCheckForAttention:(void *)a3 withTimeout:.cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  __int16 v4 = a2;
  int v5 = [a3 debugDescription];
  v8[0] = 136315650;
  OUTLINED_FUNCTION_2();
  __int16 v9 = v6;
  uint64_t v10 = v7;
  _os_log_debug_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEBUG, "%s #myriad attention timed out with event: %@, error: %@", (uint8_t *)v8, 0x20u);
}

- (void)_scdaCheckForAttention:withTimeout:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D9588000, v0, OS_LOG_TYPE_ERROR, "%s #myriad attention failed with resumeWithError: %@", (uint8_t *)v1, 0x16u);
}

- (void)_scdaCheckForAttention:(os_log_t)log withTimeout:(double)a2 .cold.5(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SASMyriadController _scdaCheckForAttention:withTimeout:]";
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_debug_impl(&dword_1D9588000, log, OS_LOG_TYPE_DEBUG, "%s #myriad attention with timeout: %f", (uint8_t *)&v2, 0x16u);
}

@end