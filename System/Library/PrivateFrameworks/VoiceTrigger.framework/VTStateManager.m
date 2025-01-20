@interface VTStateManager
+ (BOOL)iPhoneShouldStartVoiceTriggerInCoreSpeech;
+ (BOOL)isLastTriggerForced;
+ (BOOL)isLastTriggerSecondChanceTriggered;
+ (id)_serviceClient;
+ (id)firstChanceAudioBuffer;
+ (id)firstChanceTriggeredDate;
+ (id)firstChanceVTEventInfo;
+ (id)requestCurrentBuiltInRTModelDictionary;
+ (id)requestCurrentVoiceTriggerAssetDictionary;
+ (int64_t)getVoiceTriggerCount;
+ (void)clearVoiceTriggerCount;
+ (void)notifyVoiceTrigger;
+ (void)notifyVoiceTriggeredSiriSessionCancelled;
+ (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3;
+ (void)requestAudioCapture:(double)a3;
+ (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3;
+ (void)requestForcedSecondChance;
+ (void)requestForcedTriggerEvent;
+ (void)requestPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4;
+ (void)requestVoiceTriggerEnabled:(BOOL)a3 forReason:(id)a4;
+ (void)setCurrentBuiltInRTModelDictionary:(id)a3;
- (VTCoreSpeechKeepAliveHandler)coreSpeechKeepAliveHandler;
- (VTStateManager)initWithProperty:(id)a3 callbackWithMessage:(id)a4;
- (VTStateManager)initWithProperty:(id)a3 callbackWithMessageAndTimestamp:(id)a4;
- (VTStateManager)initWithProperty:(id)a3 phraseSpotter:(id)a4 enablePolicy:(id)a5 callbackWithMessageAndTimestamp:(id)a6;
- (id)getModel;
- (id)getPhraseSpotter;
- (void)VTFirstUnlockMonitor:(id)a3 didReceiveFirstUnlock:(BOOL)a4;
- (void)_initializeXPCService;
- (void)_notifyStateTransitionToState:(int64_t)a3 withStartTimestamp:(unint64_t)a4;
- (void)_powerlog:(id)a3;
- (void)_stateTransitionDidOccur:(BOOL)a3 fromCallback:(BOOL)a4;
- (void)gestureMonitorDidReceiveSleepGesture:(id)a3;
- (void)gestureMonitorDidReceiveWakeGesture:(id)a3;
- (void)setCoreSpeechKeepAliveHandler:(id)a3;
@end

@implementation VTStateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpeechKeepAliveHandler, 0);
  objc_storeStrong((id *)&self->_remoteDarwinHIDEventNotifier, 0);
  objc_storeStrong((id *)&self->_gestureMonitor, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_enablePolicy, 0);
  objc_storeStrong(&self->_callbackWithMessageAndTimestamp, 0);
  objc_storeStrong((id *)&self->_builtInRTModel, 0);
  objc_storeStrong((id *)&self->_phraseSpotter, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setCoreSpeechKeepAliveHandler:(id)a3
{
}

- (VTCoreSpeechKeepAliveHandler)coreSpeechKeepAliveHandler
{
  return self->_coreSpeechKeepAliveHandler;
}

- (void)_initializeXPCService
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(VTXPCServiceServer);
  xpcServer = self->_xpcServer;
  self->_xpcServer = v3;

  [(VTXPCServiceServer *)self->_xpcServer startService];
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    v7 = "com.apple.voicetrigger.XPCRestarted";
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Notifying Post : %{public}s", (uint8_t *)&v6, 0xCu);
  }
  notify_post("com.apple.voicetrigger.XPCRestarted");
}

- (void)VTFirstUnlockMonitor:(id)a3 didReceiveFirstUnlock:(BOOL)a4
{
  if (a4) {
    notify_post("com.apple.corespeech.voicetriggerassetchange");
  }
}

- (void)gestureMonitorDidReceiveSleepGesture:(id)a3
{
  if (!+[VTUtilities isNano])
  {
    phraseSpotter = self->_phraseSpotter;
    [(VTPhraseSpotter *)phraseSpotter didReceiveSleepGesture];
  }
}

- (void)gestureMonitorDidReceiveWakeGesture:(id)a3
{
  if (+[VTUtilities isNano])
  {
    self->_wakeGestureHostTime = mach_absolute_time();
  }
  else
  {
    phraseSpotter = self->_phraseSpotter;
    [(VTPhraseSpotter *)phraseSpotter didReceiveWakeGesture];
  }
}

- (void)_powerlog:(id)a3
{
  id v3 = a3;
  if (PLShouldLogRegisteredEvent()) {
    PLLogRegisteredEvent();
  }
}

- (id)getModel
{
  return [(VTPhraseSpotter *)self->_phraseSpotter getCorealisRTModel];
}

- (id)getPhraseSpotter
{
  return self->_phraseSpotter;
}

- (void)_notifyStateTransitionToState:(int64_t)a3 withStartTimestamp:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_callbackWithMessageAndTimestamp)
  {
    if (a3)
    {
      if (a3 == 2 && !self->_rtModelDownloaded) {
        self->_rtModelDownloaded = 1;
      }
    }
    else if (!self->_rtModelDownloaded)
    {
      v7 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: For the first start request, we need to ask update model before start request", (uint8_t *)&v9, 2u);
        v7 = VTLogContextFacilityVoiceTrigger;
      }
      self->_rtModelDownloaded = 1;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134349056;
        int64_t v10 = 2;
        _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: Callback with message and timestamp : %{public}ld, 0", (uint8_t *)&v9, 0xCu);
      }
      (*((void (**)(void))self->_callbackWithMessageAndTimestamp + 2))();
    }
    kdebug_trace();
    uint64_t v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134349312;
      int64_t v10 = a3;
      __int16 v11 = 2050;
      unint64_t v12 = a4;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "::: Callback with message and timestamp : %{public}ld, %{public}llu", (uint8_t *)&v9, 0x16u);
    }
    (*((void (**)(void))self->_callbackWithMessageAndTimestamp + 2))();
  }
}

- (void)_stateTransitionDidOccur:(BOOL)a3 fromCallback:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_voiceTriggerIsEnabledOnCoreSpeechDaemon != a3)
  {
    self->_voiceTriggerIsEnabledOnCoreSpeechDaemon = a3;
    notify_post("com.apple.voicetrigger.enablePolicyChanged");
  }
  if (v5)
  {
    v7 = +[VTPreferences sharedPreferences];
    int v8 = [v7 voiceTriggerInCoreSpeech] ^ 1;
  }
  else
  {
    int v8 = 0;
  }
  int v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = @"Stop";
    if (v8) {
      int64_t v10 = @"Start";
    }
    *(_DWORD *)v25 = 138543362;
    *(void *)&v25[4] = v10;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "VoiceTrigger will %{public}@", v25, 0xCu);
  }
  if (v4 && self->_voiceTriggerIsEnabled == v8)
  {
    __int16 v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v12 = @"stopped";
      if (v8) {
        unint64_t v12 = @"running";
      }
      *(_DWORD *)v25 = 138543362;
      *(void *)&v25[4] = v12;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "VoiceTrigger is already %{public}@, nothing to change", v25, 0xCu);
    }
  }
  else
  {
    self->_voiceTriggerIsEnabled = v8;
    uint64_t v13 = +[VTAggregator sharedAggregator];
    v14 = v13;
    if (v8)
    {
      [v13 logTimeVoiceTriggerTransitionsToState:1];

      [(VTStateManager *)self _powerlog:&unk_26C9A8AD0];
      v15 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "::: Voice Trigger started", v25, 2u);
      }
      if (!self->_wakeGestureHostTime) {
        self->_unint64_t wakeGestureHostTime = mach_absolute_time();
      }
      *(void *)v25 = 0;
      mach_timebase_info((mach_timebase_info_t)v25);
      if (*(_DWORD *)v25)
      {
        LODWORD(v16) = *(_DWORD *)&v25[4];
        unint64_t v17 = (unint64_t)((double)v16 / (double)*(unsigned int *)v25 * 1000000000.0 * 0.05);
      }
      else
      {
        unint64_t v17 = 0;
      }
      unint64_t wakeGestureHostTime = self->_wakeGestureHostTime;
      BOOL v23 = wakeGestureHostTime >= v17;
      unint64_t v24 = wakeGestureHostTime - v17;
      if (v23) {
        unint64_t v21 = v24;
      }
      else {
        unint64_t v21 = 0;
      }
      self->_unint64_t wakeGestureHostTime = v21;
      v19 = self;
      uint64_t v20 = 0;
    }
    else
    {
      [v13 logTimeVoiceTriggerTransitionsToState:0];

      [(VTStateManager *)self _powerlog:&unk_26C9A8AF8];
      v18 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "::: Voice Trigger stopped", v25, 2u);
      }
      self->_unint64_t wakeGestureHostTime = 0;
      v19 = self;
      uint64_t v20 = 1;
      unint64_t v21 = 0;
    }
    [(VTStateManager *)v19 _notifyStateTransitionToState:v20 withStartTimestamp:v21];
  }
}

- (VTStateManager)initWithProperty:(id)a3 phraseSpotter:(id)a4 enablePolicy:(id)a5 callbackWithMessageAndTimestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v47.receiver = self;
  v47.super_class = (Class)VTStateManager;
  id v14 = [(VTStateManager *)&v47 init];
  if (+[VTUtilities VTIsHorseman])
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      unint64_t v16 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
LABEL_10:
      _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&buf, 2u);
      unint64_t v17 = 0;
      goto LABEL_29;
    }
    goto LABEL_11;
  }
  if (+[VTUtilities isNonUI])
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      unint64_t v16 = "VoiceTrigger framework not available on Non-UI, Retuning nil for VTStateManager";
      goto LABEL_10;
    }
LABEL_11:
    unint64_t v17 = 0;
    goto LABEL_29;
  }
  if (os_variant_is_darwinos())
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      unint64_t v16 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v14)
  {
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.voicetrigger.VTStateManager", 0);
    v19 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v18;

    uint64_t v20 = MEMORY[0x21D46B9F0](v13);
    unint64_t v21 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = v20;

    objc_storeStrong((id *)v14 + 2, a4);
    v22 = objc_alloc_init(VTBuiltInRTModel);
    BOOL v23 = (void *)*((void *)v14 + 3);
    *((void *)v14 + 3) = v22;

    *((_WORD *)v14 + 28) = 0;
    *((unsigned char *)v14 + 58) = 0;
    *((void *)v14 + 9) = 0;
    if (v10)
    {
      unint64_t v24 = [v10 objectForKeyedSubscript:@"VoiceTriggerAvailable"];
      v25 = v24;
      if (v24 && [v24 BOOLValue])
      {
        uint64_t v26 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_21844F000, v26, OS_LOG_TYPE_DEFAULT, "Obtained VoiceTrigger available from AQME, registering callback", (uint8_t *)&buf, 2u);
        }
        v27 = (void *)*((void *)v14 + 2);
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke;
        v45[3] = &unk_264325ED0;
        id v46 = v14;
        [v27 notifyAssetChangeWithCallback:v45];
      }
    }
    [v14 _initializeXPCService];
    dispatch_async(*((dispatch_queue_t *)v14 + 1), &__block_literal_global_3795);
    v28 = +[VTPreferences sharedPreferences];
    int v29 = [v28 gestureSubscriptionEnabled];

    if (v29)
    {
      uint64_t v30 = +[VTGestureMonitor defaultGestureMonitor];
      v31 = (void *)*((void *)v14 + 8);
      *((void *)v14 + 8) = v30;

      [*((id *)v14 + 8) setDelegate:v14];
      [*((id *)v14 + 8) startObserving];
    }
    v32 = objc_alloc_init(VTCoreSpeechKeepAliveHandler);
    v33 = (void *)*((void *)v14 + 11);
    *((void *)v14 + 11) = v32;

    [*((id *)v14 + 11) start];
    objc_storeStrong((id *)v14 + 5, a5);
    objc_initWeak(&buf, v14);
    v34 = (void *)*((void *)v14 + 5);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_16;
    v42[3] = &unk_264325F28;
    objc_copyWeak(&v43, &buf);
    [v34 setCallback:v42];
    if ([*((id *)v14 + 5) isEnabled])
    {
      v35 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_21844F000, v35, OS_LOG_TYPE_DEFAULT, "::: Checking VTStateManager policy: init to be : Start", v41, 2u);
      }
      [v14 _stateTransitionDidOccur:1 fromCallback:0];
      v36 = [v14 coreSpeechKeepAliveHandler];
      [v36 voiceTriggerPolicyDidChange:1];
    }
    else
    {
      v36 = [v14 coreSpeechKeepAliveHandler];
      [v36 voiceTriggerPolicyDidChange:0];
    }

    v37 = +[VTFirstUnlockMonitor sharedInstance];
    [v37 addObserver:v14];

    v38 = objc_alloc_init(VTRemoteDarwinHIDEventNotifier);
    v39 = (void *)*((void *)v14 + 10);
    *((void *)v14 + 10) = v38;

    [*((id *)v14 + 10) startObserving];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&buf);
  }
  unint64_t v17 = (VTStateManager *)v14;
LABEL_29:

  return v17;
}

uint64_t __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyStateTransitionToState:2 withStartTimestamp:0];
}

void __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = @"NO";
    if (a2) {
      BOOL v5 = @"YES";
    }
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "::: Checking VTStateManager policy: Should be running? %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [WeakRetained _stateTransitionDidOccur:a2 fromCallback:1];
  int v6 = [WeakRetained coreSpeechKeepAliveHandler];
  [v6 voiceTriggerPolicyDidChange:a2];
}

void __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_2()
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v0 = (void *)getCSActivationEventNotifierClass_softClass;
  uint64_t v14 = getCSActivationEventNotifierClass_softClass;
  if (!getCSActivationEventNotifierClass_softClass)
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    int v8 = __getCSActivationEventNotifierClass_block_invoke;
    uint64_t v9 = &unk_264326190;
    id v10 = &v11;
    __getCSActivationEventNotifierClass_block_invoke((uint64_t)&v6);
    v0 = (void *)v12[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v11, 8);
  v2 = [v1 sharedNotifier];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v3 = (void *)getCSActivationEventClass_softClass;
  uint64_t v14 = getCSActivationEventClass_softClass;
  if (!getCSActivationEventClass_softClass)
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    int v8 = __getCSActivationEventClass_block_invoke;
    uint64_t v9 = &unk_264326190;
    id v10 = &v11;
    __getCSActivationEventClass_block_invoke((uint64_t)&v6);
    id v3 = (void *)v12[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v11, 8);
  BOOL v5 = [v4 mediaserverdLaunchedEvent:mach_absolute_time()];
  [v2 notifyActivationEvent:v5 completion:&__block_literal_global_12];
}

void __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_3()
{
  v0 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_21844F000, v0, OS_LOG_TYPE_DEFAULT, "finished mediaserverd launch notification", v1, 2u);
  }
}

- (VTStateManager)initWithProperty:(id)a3 callbackWithMessageAndTimestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[VTUtilities VTIsHorseman])
  {
    int v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      uint64_t v9 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
      id v10 = (uint8_t *)&v17;
LABEL_10:
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else if (+[VTUtilities isNonUI])
  {
    int v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      uint64_t v9 = "VoiceTrigger framework not available on Non-UI, Retuning nil for VTStateManager";
      id v10 = (uint8_t *)&v16;
      goto LABEL_10;
    }
  }
  else
  {
    if (!os_variant_is_darwinos())
    {
      uint64_t v13 = [[VTPhraseSpotter alloc] initWithHardwareSampleRate:16000.0];
      uint64_t v14 = +[VTPolicy defaultVoiceTriggerEnablePolicy];
      self = [(VTStateManager *)self initWithProperty:v6 phraseSpotter:v13 enablePolicy:v14 callbackWithMessageAndTimestamp:v7];

      uint64_t v11 = self;
      goto LABEL_12;
    }
    int v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      uint64_t v9 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
      id v10 = (uint8_t *)&v15;
      goto LABEL_10;
    }
  }
  uint64_t v11 = 0;
LABEL_12:

  return v11;
}

- (VTStateManager)initWithProperty:(id)a3 callbackWithMessage:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__VTStateManager_initWithProperty_callbackWithMessage___block_invoke;
  v10[3] = &unk_2643257F0;
  id v11 = v6;
  id v7 = v6;
  int v8 = [(VTStateManager *)self initWithProperty:a3 callbackWithMessageAndTimestamp:v10];

  return v8;
}

uint64_t __55__VTStateManager_initWithProperty_callbackWithMessage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)iPhoneShouldStartVoiceTriggerInCoreSpeech
{
  v2 = +[VTPreferences sharedPreferences];
  int v3 = [v2 voiceTriggerInCoreSpeech];

  if (!v3) {
    return 0;
  }
  id v4 = +[VTPolicy defaultVoiceTriggerEnablePolicy];
  char v5 = [v4 isEnabled];

  return v5;
}

+ (void)notifyVoiceTrigger
{
  v2 = +[VTPreferences sharedPreferences];
  int v3 = [v2 useSiriActivationSPIForiOS];

  if (v3)
  {
    mach_absolute_time();
    id v6 = +[VTPhraseSpotter currentSpotter];
    id v4 = [v6 lastVoiceTriggerEventInfo];
    AFSiriActivationBuiltInMicVoiceTrigger();
  }
  else
  {
    notify_post("com.apple.coreaudio.borealisTrigger");
    char v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Use legacy trigger notificiation", buf, 2u);
    }
  }
}

void __36__VTStateManager_notifyVoiceTrigger__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "AFSiriActivationBuiltInMicVoiceTrigger success", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    id v7 = [v4 localizedDescription];
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "AFSiriActivationBuiltInMicVoiceTrigger failed : %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

+ (void)setCurrentBuiltInRTModelDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[VTStateManager _serviceClient];
  [v4 setCurrentBuiltInRTModelDictionary:v3];
}

+ (id)requestCurrentBuiltInRTModelDictionary
{
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }
  id v3 = objc_alloc_init(VTXPCServiceClient);
  id v4 = [(VTXPCServiceClient *)v3 requestCurrentBuiltInRTModelDictionary];

  return v4;
}

+ (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  char v5 = +[VTStateManager _serviceClient];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__VTStateManager_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke;
  v9[3] = &unk_264325818;
  id v6 = v3;
  id v11 = v6;
  id v7 = v4;
  uint64_t v10 = v7;
  [v5 requestCurrentVoiceTriggerAssetDictionaryWithReply:v9];

  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v7, v8)) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

intptr_t __69__VTStateManager_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

+ (id)requestCurrentVoiceTriggerAssetDictionary
{
  v2 = objc_alloc_init(VTXPCServiceClient);
  id v3 = [(VTXPCServiceClient *)v2 requestCurrentVoiceTriggerAssetDictionary];

  return v3;
}

+ (void)requestAudioCapture:(double)a3
{
  id v4 = +[VTStateManager _serviceClient];
  [v4 requestAudioCapture:a3];
}

+ (id)firstChanceTriggeredDate
{
  v2 = +[VTStateManager _serviceClient];
  id v3 = [v2 getFirstChanceTriggeredDate];

  return v3;
}

+ (id)firstChanceVTEventInfo
{
  v2 = +[VTStateManager _serviceClient];
  id v3 = [v2 getFirstChanceVTEventInfo];

  return v3;
}

+ (id)firstChanceAudioBuffer
{
  v2 = +[VTStateManager _serviceClient];
  id v3 = [v2 getFirstChanceAudioBuffer];

  return v3;
}

+ (int64_t)getVoiceTriggerCount
{
  v2 = +[VTStateManager _serviceClient];
  int64_t v3 = [v2 getVoiceTriggerCount];

  return v3;
}

+ (void)clearVoiceTriggerCount
{
  id v2 = +[VTStateManager _serviceClient];
  [v2 clearVoiceTriggerCount];
}

+ (BOOL)isLastTriggerSecondChanceTriggered
{
  id v2 = +[VTStateManager _serviceClient];
  BOOL v3 = [v2 getLastTriggerType] == 2;

  return v3;
}

+ (BOOL)isLastTriggerForced
{
  id v2 = +[VTStateManager _serviceClient];
  BOOL v3 = [v2 getLastTriggerType] == 3;

  return v3;
}

+ (void)requestForcedTriggerEvent
{
  id v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "::: Received request to force trigger event", v4, 2u);
  }
  BOOL v3 = +[VTStateManager _serviceClient];
  [v3 notifyTriggerEventRequest];
}

+ (void)requestForcedSecondChance
{
  id v2 = +[VTStateManager _serviceClient];
  [v2 notifySecondChanceRequest];
}

+ (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "::: Received voice triggered siri session cancellation with reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  char v5 = +[VTStateManager _serviceClient];
  [v5 notifyVoiceTriggeredSiriSessionCancelled:v3];
}

+ (void)notifyVoiceTriggeredSiriSessionCancelled
{
  id v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "::: Received voice triggered siri session cancellation", v6, 2u);
  }
  id v3 = +[VTPreferences sharedPreferences];
  int v4 = [v3 corespeechDaemonEnabled];

  if (v4)
  {
    char v5 = [getCSVoiceTriggerXPCServiceClass() sharedService];
    [v5 notifyVoiceTriggeredSiriSessionCancelled];
  }
  else
  {
    char v5 = +[VTStateManager _serviceClient];
    [v5 notifyVoiceTriggeredSiriSessionCancelled:@"Unknown"];
  }
}

+ (void)requestPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"DO NOT";
    if (v5) {
      id v7 = @"DO";
    }
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2050;
    double v14 = a4;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "::: Received request to %{public}@ bypass phrase spotter with timeout: %{public}f", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = +[VTPreferences sharedPreferences];
  int v9 = [v8 corespeechDaemonEnabled];

  if (v9) {
    [getCSVoiceTriggerXPCServiceClass() sharedService];
  }
  else {
  uint64_t v10 = +[VTStateManager _serviceClient];
  }
  [v10 setPhraseSpotterBypassing:v5 timeout:a4];
}

+ (void)requestVoiceTriggerEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"DISABLE";
    if (v4) {
      id v7 = @"ENABLE";
    }
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "::: Received request to %{public}@ voice trigger - Reason: %{public}@)", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = +[VTPreferences sharedPreferences];
  int v9 = [v8 corespeechDaemonEnabled];

  if (v9) {
    [getCSVoiceTriggerXPCServiceClass() sharedService];
  }
  else {
  uint64_t v10 = +[VTStateManager _serviceClient];
  }
  [v10 enableVoiceTrigger:v4 withAssertion:v5];
}

+ (id)_serviceClient
{
  if (_serviceClient_onceToken != -1) {
    dispatch_once(&_serviceClient_onceToken, &__block_literal_global_61_3874);
  }
  id v2 = (void *)_serviceClient__serviceClient;

  return v2;
}

uint64_t __32__VTStateManager__serviceClient__block_invoke()
{
  _serviceClient__serviceClient = objc_alloc_init(VTXPCServiceClient);

  return MEMORY[0x270F9A758]();
}

@end