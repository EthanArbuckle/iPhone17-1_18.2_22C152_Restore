@interface _UIKBFeedbackGenerator
+ (uint64_t)_usesCoreHapticsForAudioOnly;
- (BOOL)_isRingerSwitchOn;
- (BOOL)isActive;
- (_UIKBFeedbackGenerator)init;
- (uint64_t)_areKeyClicksEnabled;
- (uint64_t)_updateMode;
- (void)_deactivateWithCompletionBlock:(uint64_t)a1;
- (void)_dictationDidBeginNotification:(id)a3;
- (void)_dictationDidEndNotification:(id)a3;
- (void)_effectiveVolumeDidChangeNotification:(id)a3;
- (void)_keyboardPreferencesDidUpdateNotification:(id)a3;
- (void)_performOnMain:(void *)a1;
- (void)_performOnQueue:(void *)a1;
- (void)_recreateEngineAndPlayersIfNecessaryOnQueueWithMode:(void *)a3 reason:;
- (void)_recreateEngineAndPlayersOnQueueWithMode:(void *)a3 reason:;
- (void)_releaseEngineAndPlayersOnQueue;
- (void)_resetIdleTimer;
- (void)_resetWithReason:(void *)a1;
- (void)_sendAnalyticsEvent;
- (void)_serverConnectionDiedNotification:(id)a3;
- (void)_setIsEngineRunning:(uint64_t)a1;
- (void)_startEngineIfNecessaryOnQueueWithReason:(void *)a3 completionBlock:;
- (void)_stopEngineDueToIdle;
- (void)_stopEngineForApplicationNotification:(id)a3;
- (void)_stopEngineIfNecessaryOnQueueAndReleaseResources:(void *)a3 completionBlock:;
- (void)actionOccurred:(int64_t)a3;
- (void)actionOccurred:(int64_t)a3 atLocation:(CGPoint)a4;
- (void)activateWithCompletionBlock:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _UIKBFeedbackGenerator

+ (uint64_t)_usesCoreHapticsForAudioOnly
{
  if (qword_1EB2601A0 != -1) {
    dispatch_once(&qword_1EB2601A0, &__block_literal_global_151);
  }
  return _MergedGlobals_1014;
}

- (_UIKBFeedbackGenerator)init
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_UIKBFeedbackGenerator;
  v2 = [(_UIKBFeedbackGenerator *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.UIKit.UIKBFeedbackGenerator", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.preferences.sounds"];
    soundsDefaults = v2->_soundsDefaults;
    v2->_soundsDefaults = (NSUserDefaults *)v6;

    [(NSUserDefaults *)v2->_soundsDefaults addObserver:v2 forKeyPath:@"keyboard-audio" options:1 context:&kKVOContext];
    v2->_ringerStateNotifyToken = -1;
    objc_initWeak(&location, v2);
    id v8 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30___UIKBFeedbackGenerator_init__block_invoke;
    handler[3] = &unk_1E52EAC08;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.springboard.ringerstate", &v2->_ringerStateNotifyToken, MEMORY[0x1E4F14428], handler);

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__keyboardPreferencesDidUpdateNotification_ name:@"UIKeyboardPreferencesDidUpdateNotification" object:0];
    [v9 addObserver:v2 selector:sel__dictationDidBeginNotification_ name:@"UIKeyboardDidBeginDictationNotification" object:0];
    [v9 addObserver:v2 selector:sel__dictationDidEndNotification_ name:@"UIDictationControllerDictationDidFinish" object:0];
    if (_UIApplicationIsExtension())
    {
      [v9 addObserver:v2 selector:sel__stopEngineForApplicationNotification_ name:0x1ED1802E0 object:0];
      [v9 addObserver:v2 selector:sel__stopEngineForApplicationNotification_ name:0x1ED180300 object:0];
      uint64_t v10 = 0;
      v11 = &_UIViewServiceRemoteViewControllerWillDisconnectNotificationName;
    }
    else
    {
      [v9 addObserver:v2 selector:sel__stopEngineForApplicationNotification_ name:@"UIApplicationWillResignActiveNotification" object:UIApp];
      [v9 addObserver:v2 selector:sel__stopEngineForApplicationNotification_ name:@"UIApplicationSuspendedNotification" object:UIApp];
      uint64_t v10 = UIApp;
      v11 = UIApplicationSuspendedEventsOnlyNotification;
    }
    [v9 addObserver:v2 selector:sel__stopEngineForApplicationNotification_ name:*v11 object:v10];
    -[_UIKBFeedbackGenerator _updateMode]((uint64_t)v2);
    v19[0] = &unk_1ED3F3B28;
    v19[1] = &unk_1ED3F3B58;
    v20[0] = &unk_1ED3F3B40;
    v20[1] = &unk_1ED3F3B70;
    v19[2] = &unk_1ED3F3B88;
    v19[3] = &unk_1ED3F3BB8;
    v20[2] = &unk_1ED3F3BA0;
    v20[3] = &unk_1ED3F3BA0;
    v19[4] = &unk_1ED3F3BD0;
    v19[5] = &unk_1ED3F3BE8;
    v20[4] = &unk_1ED3F3BA0;
    v20[5] = &unk_1ED3F3B70;
    v19[6] = &unk_1ED3F3C00;
    v19[7] = &unk_1ED3F3C18;
    v20[6] = &unk_1ED3F3B40;
    v20[7] = &unk_1ED3F3B70;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:8];
    systemSounds = v2->_systemSounds;
    v2->_systemSounds = (NSDictionary *)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (uint64_t)_updateMode
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 _feedbackSupportLevel];

  dispatch_queue_t v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v5 = [v4 preferencesActions];
  uint64_t v6 = [v5 visceral];

  BOOL v7 = v3 != 2 || v6 == 0;
  int v8 = !v7;
  BOOL isRingerSwitch = -[_UIKBFeedbackGenerator _isRingerSwitchOn](a1);
  int v10 = -[_UIKBFeedbackGenerator _areKeyClicksEnabled](*(void **)(a1 + 16));
  int v11 = v8 ^ 1;
  if ((v10 & isRingerSwitch & 1) != 0 || v11)
  {
    int v13 = v10 & isRingerSwitch ^ 1;
    BOOL v7 = (v11 | v13) == 0;
    uint64_t v14 = 3;
    if (!v7) {
      uint64_t v14 = 0;
    }
    if ((v8 | v13) == 1) {
      uint64_t v12 = v14;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 2;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __37___UIKBFeedbackGenerator__updateMode__block_invoke;
  v22[3] = &__block_descriptor_40_e32_v16__0___UIKBFeedbackGenerator_8l;
  v22[4] = v12;
  -[_UIKBFeedbackGenerator _performOnQueue:]((void *)a1, v22);
  v15 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = "unsupported";
    if (v3 == 2) {
      id v16 = "supported";
    }
    v17 = "disabled";
    if (v6) {
      objc_super v18 = "enabled";
    }
    else {
      objc_super v18 = "disabled";
    }
    v19 = "off";
    if (isRingerSwitch) {
      v19 = "on";
    }
    if (v10) {
      v17 = "enabled";
    }
    if ((unint64_t)(v12 - 1) > 2) {
      v20 = @"none";
    }
    else {
      v20 = off_1E52EAEE0[v12 - 1];
    }
    *(_DWORD *)buf = 138413570;
    uint64_t v24 = a1;
    __int16 v25 = 2080;
    v26 = v16;
    __int16 v27 = 2080;
    v28 = v18;
    __int16 v29 = 2080;
    v30 = v19;
    __int16 v31 = 2080;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "%@: Updating mode. Haptics: %s. Haptics: %s. Ringer: %s. Sound: %s. Mode: %@", buf, 0x3Eu);
  }

  *(void *)(a1 + 120) = v12;
  return v12;
}

- (void)dealloc
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  -[_UIKBFeedbackGenerator _sendAnalyticsEvent]((uint64_t)self);
  engine = self->_engine;
  if (*(_OWORD *)&self->_engine != 0)
  {
    *(void *)&long long v31 = 0;
    *((void *)&v31 + 1) = &v31;
    uint64_t v32 = 0x3032000000;
    __int16 v33 = __Block_byref_object_copy__65;
    v34 = __Block_byref_object_dispose__65;
    uint64_t v35 = engine;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__65;
    v22 = __Block_byref_object_dispose__65;
    v23 = self->_players;
    dispatch_queue_t v4 = self->_engine;
    self->_engine = 0;

    players = self->_players;
    self->_players = 0;

    uint64_t v6 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 40);
      uint64_t v8 = v19[5];
      *(_DWORD *)buf = 138412802;
      v26 = self;
      __int16 v27 = 2048;
      uint64_t v28 = v7;
      __int16 v29 = 2048;
      uint64_t v30 = v8;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%@: Engine %p or players %p exist during dealloc, releasing them from our worker queue.", buf, 0x20u);
    }

    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33___UIKBFeedbackGenerator_dealloc__block_invoke;
    block[3] = &unk_1E52EAC30;
    block[4] = &v31;
    block[5] = &v18;
    dispatch_after(v9, queue, block);
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v31, 8);
  }
  int v11 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v31) = 138412290;
    *(void *)((char *)&v31 + 4) = self;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "%@: Stopping engine: dealloc", (uint8_t *)&v31, 0xCu);
  }

  notify_cancel(self->_ringerStateNotifyToken);
  [(NSUserDefaults *)self->_soundsDefaults removeObserver:self forKeyPath:@"keyboard-audio" context:kKVOContext];
  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v24[0] = @"UIKeyboardPreferencesDidUpdateNotification";
  v24[1] = 0x1ED1802E0;
  v24[2] = 0x1ED180300;
  v24[3] = @"_UIViewServiceRemoteViewControllerWillDisconnectNotification";
  v24[4] = @"UIApplicationWillResignActiveNotification";
  v24[5] = @"UIApplicationSuspendedNotification";
  v24[6] = @"UIApplicationSuspendedEventsOnlyNotification";
  v24[7] = @"UIKeyboardDidBeginDictationNotification";
  v24[8] = @"UIDictationControllerDictationDidFinish";
  int v13 = getAVSystemController_EffectiveVolumeDidChangeNotification();
  v24[9] = v13;
  uint64_t v14 = getAVSystemController_ServerConnectionDiedNotification();
  v24[10] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:11];
  -[NSNotificationCenter _uiRemoveObserver:names:](v12, self, v15);

  v16.receiver = self;
  v16.super_class = (Class)_UIKBFeedbackGenerator;
  [(_UIKBFeedbackGenerator *)&v16 dealloc];
}

- (void)_sendAnalyticsEvent
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      v2 = [MEMORY[0x1E4F1C9C8] now];
      [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
      *(double *)(a1 + 40) = v3 + *(double *)(a1 + 40);

      dispatch_queue_t v4 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      +[UIKBAnalyticsDispatcher hapticEventEngineDuration:v5 startCount:*(void *)(a1 + 56) actionCount:*(double *)(a1 + 40)];
      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kKVOContext == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", @"keyboard-audio", a4, a5))
    {
      -[_UIKBFeedbackGenerator _resetWithReason:](self, @"audio keyboard feedback setting was changed");
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIKBFeedbackGenerator;
    -[_UIKBFeedbackGenerator observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_resetWithReason:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    int v4 = [a1 isActive];
    uint64_t v5 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = "no";
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = a1;
      if (v4) {
        uint64_t v6 = "yes";
      }
      __int16 v13 = 2080;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%@: Calling deactivate (was active: %s) for reason: %@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, a1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43___UIKBFeedbackGenerator__resetWithReason___block_invoke;
    v7[3] = &unk_1E52EAD18;
    objc_copyWeak(&v9, (id *)buf);
    char v10 = v4;
    id v8 = v3;
    -[_UIKBFeedbackGenerator _deactivateWithCompletionBlock:]((uint64_t)a1, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_performOnQueue:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    int v4 = a1[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42___UIKBFeedbackGenerator__performOnQueue___block_invoke;
    block[3] = &unk_1E52E95A0;
    objc_copyWeak(&v7, &location);
    id v6 = v3;
    dispatch_async(v4, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_performOnMain:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (pthread_main_np() == 1)
    {
      v3[2](v3, a1);
    }
    else
    {
      objc_initWeak(&location, a1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41___UIKBFeedbackGenerator__performOnMain___block_invoke;
      block[3] = &unk_1E52E95A0;
      objc_copyWeak(&v6, &location);
      uint64_t v5 = v3;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setIsEngineRunning:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(unsigned __int8 *)(a1 + 112) != a2)
    {
      *(unsigned char *)(a1 + 112) = a2;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __46___UIKBFeedbackGenerator__setIsEngineRunning___block_invoke;
      v4[3] = &unk_1E52EACF0;
      char v5 = a2;
      v4[4] = a1;
      -[_UIKBFeedbackGenerator _performOnMain:]((void *)a1, v4);
    }
  }
}

- (void)_recreateEngineAndPlayersOnQueueWithMode:(void *)a3 reason:
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  int v66 = *(unsigned __int8 *)(a1 + 112);
  -[_UIKBFeedbackGenerator _releaseEngineAndPlayersOnQueue](a1);
  id v6 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%@: Recreating engine with reason %@.", buf, 0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (*(unsigned char *)(a1 + 76))
  {
    id v7 = _UIKBFeedbackLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = a1;
    id v8 = "%@: Feedback is disabled; skipping CoreHaptics engine and player creation.";
    goto LABEL_6;
  }
  if (!*(unsigned char *)(a1 + 77) || *(unsigned char *)(a1 + 78))
  {
    v84[0] = &unk_1ED3F3B28;
    uint64_t v67 = 0;
    uint64_t v68 = (uint64_t)&v67;
    uint64_t v69 = 0x2020000000;
    id v9 = (id *)qword_1EB2601B8;
    v70 = (void *)qword_1EB2601B8;
    if (!qword_1EB2601B8)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCHHapticPatternLibraryKeyKeyboardInputTextSymbolLoc_block_invoke;
      v86 = &unk_1E52D9900;
      v87 = &v67;
      char v10 = CoreHapticsLibrary();
      int v11 = dlsym(v10, "CHHapticPatternLibraryKeyKeyboardInputText");
      *(void *)(v87[1] + 24) = v11;
      qword_1EB2601B8 = *(void *)(v87[1] + 24);
      id v9 = *(id **)(v68 + 24);
    }
    _Block_object_dispose(&v67, 8);
    if (v9)
    {
      id v65 = *v9;
      *(void *)buf = v65;
      v84[1] = &unk_1ED3F3B58;
      uint64_t v74 = 0;
      uint64_t v75 = (uint64_t)&v74;
      uint64_t v76 = 0x2020000000;
      uint64_t v12 = (id *)qword_1EB2601C0;
      v77 = (void *)qword_1EB2601C0;
      if (!qword_1EB2601C0)
      {
        uint64_t v67 = MEMORY[0x1E4F143A8];
        uint64_t v68 = 3221225472;
        uint64_t v69 = (uint64_t)__getCHHapticPatternLibraryKeyKeyboardInputSeparatorSymbolLoc_block_invoke;
        v70 = &unk_1E52D9900;
        v71 = &v74;
        __int16 v13 = CoreHapticsLibrary();
        uint64_t v14 = dlsym(v13, "CHHapticPatternLibraryKeyKeyboardInputSeparator");
        *(void *)(v71[1] + 24) = v14;
        qword_1EB2601C0 = *(void *)(v71[1] + 24);
        uint64_t v12 = *(id **)(v75 + 24);
      }
      _Block_object_dispose(&v74, 8);
      if (v12)
      {
        id v64 = *v12;
        *(void *)&buf[8] = v64;
        v84[2] = &unk_1ED3F3B88;
        uint64_t v74 = 0;
        uint64_t v75 = (uint64_t)&v74;
        uint64_t v76 = 0x2020000000;
        __int16 v15 = (id *)qword_1EB2601C8;
        v77 = (void *)qword_1EB2601C8;
        if (!qword_1EB2601C8)
        {
          uint64_t v67 = MEMORY[0x1E4F143A8];
          uint64_t v68 = 3221225472;
          uint64_t v69 = (uint64_t)__getCHHapticPatternLibraryKeyKeyboardDeletionSymbolLoc_block_invoke;
          v70 = &unk_1E52D9900;
          v71 = &v74;
          id v16 = CoreHapticsLibrary();
          uint64_t v17 = dlsym(v16, "CHHapticPatternLibraryKeyKeyboardDeletion");
          *(void *)(v71[1] + 24) = v17;
          qword_1EB2601C8 = *(void *)(v71[1] + 24);
          __int16 v15 = *(id **)(v75 + 24);
        }
        _Block_object_dispose(&v74, 8);
        if (v15)
        {
          id v18 = *v15;
          *(void *)&buf[16] = v18;
          v84[3] = &unk_1ED3F3BB8;
          uint64_t v74 = 0;
          uint64_t v75 = (uint64_t)&v74;
          uint64_t v76 = 0x2020000000;
          v19 = (id *)qword_1EB2601D0;
          v77 = (void *)qword_1EB2601D0;
          if (!qword_1EB2601D0)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            uint64_t v69 = (uint64_t)__getCHHapticPatternLibraryKeyKeyboardDeletionRepeatSymbolLoc_block_invoke;
            v70 = &unk_1E52D9900;
            v71 = &v74;
            uint64_t v20 = CoreHapticsLibrary();
            v21 = dlsym(v20, "CHHapticPatternLibraryKeyKeyboardDeletionRepeat");
            *(void *)(v71[1] + 24) = v21;
            qword_1EB2601D0 = *(void *)(v71[1] + 24);
            v19 = *(id **)(v75 + 24);
          }
          _Block_object_dispose(&v74, 8);
          if (v19)
          {
            id v22 = *v19;
            v86 = v22;
            v84[4] = &unk_1ED3F3BD0;
            uint64_t v74 = 0;
            uint64_t v75 = (uint64_t)&v74;
            uint64_t v76 = 0x2020000000;
            v23 = (id *)qword_1EB2601D8;
            v77 = (void *)qword_1EB2601D8;
            if (!qword_1EB2601D8)
            {
              uint64_t v67 = MEMORY[0x1E4F143A8];
              uint64_t v68 = 3221225472;
              uint64_t v69 = (uint64_t)__getCHHapticPatternLibraryKeyKeyboardDeletionRapidSymbolLoc_block_invoke;
              v70 = &unk_1E52D9900;
              v71 = &v74;
              uint64_t v24 = CoreHapticsLibrary();
              __int16 v25 = dlsym(v24, "CHHapticPatternLibraryKeyKeyboardDeletionRapid");
              *(void *)(v71[1] + 24) = v25;
              qword_1EB2601D8 = *(void *)(v71[1] + 24);
              v23 = *(id **)(v75 + 24);
            }
            _Block_object_dispose(&v74, 8);
            if (v23)
            {
              v26 = (uint64_t *)*v23;
              v87 = v26;
              v84[5] = &unk_1ED3F3BE8;
              __int16 v27 = getCHHapticPatternLibraryKeyKeyboardOther();
              v88 = v27;
              v84[6] = &unk_1ED3F3C00;
              uint64_t v74 = 0;
              uint64_t v75 = (uint64_t)&v74;
              uint64_t v76 = 0x2020000000;
              uint64_t v28 = (id *)qword_1EB2601E0;
              v77 = (void *)qword_1EB2601E0;
              if (!qword_1EB2601E0)
              {
                uint64_t v67 = MEMORY[0x1E4F143A8];
                uint64_t v68 = 3221225472;
                uint64_t v69 = (uint64_t)__getCHHapticPatternLibraryKeyKeyboardInputCandidateSymbolLoc_block_invoke;
                v70 = &unk_1E52D9900;
                v71 = &v74;
                __int16 v29 = CoreHapticsLibrary();
                uint64_t v30 = dlsym(v29, "CHHapticPatternLibraryKeyKeyboardInputCandidate");
                *(void *)(v71[1] + 24) = v30;
                qword_1EB2601E0 = *(void *)(v71[1] + 24);
                uint64_t v28 = *(id **)(v75 + 24);
              }
              _Block_object_dispose(&v74, 8);
              if (v28)
              {
                id v89 = *v28;
                v84[7] = &unk_1ED3F3C18;
                id v31 = v89;
                uint64_t v32 = getCHHapticPatternLibraryKeyKeyboardOther();
                v90 = v32;
                id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v84 count:8];

                __int16 v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSObject count](v7, "count"));
                uint64_t v67 = MEMORY[0x1E4F143A8];
                uint64_t v68 = 3221225472;
                uint64_t v69 = (uint64_t)__65___UIKBFeedbackGenerator__createEngineAndPlayersOnQueueWithMode___block_invoke;
                v70 = &unk_1E52EAC58;
                v71 = (uint64_t *)a1;
                uint64_t v73 = a2;
                id v34 = v33;
                id v72 = v34;
                [v7 enumerateKeysAndObjectsUsingBlock:&v67];
                objc_storeStrong((id *)(a1 + 88), v33);
                uint64_t v35 = *(void **)(a1 + 64);
                *(void *)(a1 + 64) = 0;

                if (a2 != 3)
                {
                  int v36 = +[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]() ^ 1;
                  if (a2 != 1) {
                    LOBYTE(v36) = 1;
                  }
                  if (v36) {
                    goto LABEL_37;
                  }
                }
                uint64_t v79 = 0;
                v80 = &v79;
                uint64_t v81 = 0x2050000000;
                v37 = (void *)qword_1EB2601F0;
                uint64_t v82 = qword_1EB2601F0;
                if (!qword_1EB2601F0)
                {
                  uint64_t v74 = MEMORY[0x1E4F143A8];
                  uint64_t v75 = 3221225472;
                  uint64_t v76 = (uint64_t)__getAVSystemControllerClass_block_invoke;
                  v77 = &unk_1E52D9900;
                  v78 = &v79;
                  __getAVSystemControllerClass_block_invoke((uint64_t)&v74);
                  v37 = (void *)v80[3];
                }
                id v38 = v37;
                _Block_object_dispose(&v79, 8);
                uint64_t v39 = [v38 sharedAVSystemController];
                v40 = *(void **)(a1 + 64);
                *(void *)(a1 + 64) = v39;

                v41 = getAVSystemController_EffectiveVolumeDidChangeNotification();
                v83 = v41;
                v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];

                v43 = *(void **)(a1 + 64);
                uint64_t v79 = 0;
                v80 = &v79;
                uint64_t v81 = 0x2020000000;
                v44 = (void *)qword_1EB2601F8;
                uint64_t v82 = qword_1EB2601F8;
                if (!qword_1EB2601F8)
                {
                  uint64_t v74 = MEMORY[0x1E4F143A8];
                  uint64_t v75 = 3221225472;
                  uint64_t v76 = (uint64_t)__getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_block_invoke;
                  v77 = &unk_1E52D9900;
                  v78 = &v79;
                  v45 = MediaExperienceLibrary();
                  v46 = dlsym(v45, "AVSystemController_SubscribeToNotificationsAttribute");
                  *(void *)(v78[1] + 24) = v46;
                  qword_1EB2601F8 = *(void *)(v78[1] + 24);
                  v44 = (void *)v80[3];
                }
                _Block_object_dispose(&v79, 8);
                if (v44)
                {
                  [v43 setAttribute:v42 forKey:*v44 error:0];
                  v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
                  v48 = getAVSystemController_EffectiveVolumeDidChangeNotification();
                  [v47 addObserver:a1 selector:sel__effectiveVolumeDidChangeNotification_ name:v48 object:*(void *)(a1 + 64)];

                  v49 = getAVSystemController_ServerConnectionDiedNotification();
                  [v47 addObserver:a1 selector:sel__serverConnectionDiedNotification_ name:v49 object:0];

                  [*(id *)(a1 + 64) getVolume:a1 + 72 forCategory:@"Ringtone"];
LABEL_37:

                  goto LABEL_39;
                }
                v62 = [MEMORY[0x1E4F28B00] currentHandler];
                v63 = [NSString stringWithUTF8String:"NSString *getAVSystemController_SubscribeToNotificationsAttribute(void)"];
                objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, @"_UIKBFeedbackGenerator.m", 51, @"%s", dlerror());
              }
              else
              {
                v60 = [MEMORY[0x1E4F28B00] currentHandler];
                v61 = [NSString stringWithUTF8String:"CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardInputCandidate(void)"];
                objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, @"_UIFeedbackCoreHapticsEngineUtilities.h", 90, @"%s", dlerror());
              }
            }
            else
            {
              v58 = [MEMORY[0x1E4F28B00] currentHandler];
              v59 = [NSString stringWithUTF8String:"CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardDeletionRapid(void)"];
              objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, @"_UIFeedbackCoreHapticsEngineUtilities.h", 88, @"%s", dlerror());
            }
          }
          else
          {
            v56 = [MEMORY[0x1E4F28B00] currentHandler];
            v57 = [NSString stringWithUTF8String:"CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardDeletionRepeat(void)"];
            objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, @"_UIFeedbackCoreHapticsEngineUtilities.h", 87, @"%s", dlerror());
          }
        }
        else
        {
          v54 = [MEMORY[0x1E4F28B00] currentHandler];
          v55 = [NSString stringWithUTF8String:"CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardDeletion(void)"];
          objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"_UIFeedbackCoreHapticsEngineUtilities.h", 86, @"%s", dlerror());
        }
      }
      else
      {
        v52 = [MEMORY[0x1E4F28B00] currentHandler];
        v53 = [NSString stringWithUTF8String:"CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardInputSeparator(void)"];
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"_UIFeedbackCoreHapticsEngineUtilities.h", 85, @"%s", dlerror());
      }
    }
    else
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v51 = [NSString stringWithUTF8String:"CHHapticPatternLibraryKey getCHHapticPatternLibraryKeyKeyboardInputText(void)"];
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, @"_UIFeedbackCoreHapticsEngineUtilities.h", 84, @"%s", dlerror());
    }
    __break(1u);
  }
  id v7 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = a1;
    id v8 = "%@: Audio-only mode; skipping CoreHaptics engine and player creation.";
LABEL_6:
    _os_log_error_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
  }
LABEL_39:

  if (v66) {
    -[_UIKBFeedbackGenerator _startEngineIfNecessaryOnQueueWithReason:completionBlock:](a1, v5, 0);
  }
  else {
    -[_UIKBFeedbackGenerator _performOnMain:]((void *)a1, &__block_literal_global_117);
  }
}

- (void)_deactivateWithCompletionBlock:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = v3;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke;
    aBlock[3] = &unk_1E52DA040;
    id v5 = v3;
    id v17 = v5;
    id v6 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v7 = *(void *)(a1 + 120);
    if (v7 == 1)
    {
      if (+[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]())
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_2;
        v14[3] = &unk_1E52EADB0;
        __int16 v15 = v6;
        -[_UIKBFeedbackGenerator _performOnQueue:]((void *)a1, v14);
        id v8 = v15;
LABEL_9:

LABEL_14:
        goto LABEL_15;
      }
      char v10 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = a1;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "%@: Cooling System Sounds.", buf, 0xCu);
      }

      int v11 = +[UIDevice currentDevice];
      [v11 _unregisterForSystemSounds:a1];

      *(unsigned char *)(a1 + 28) = 0;
    }
    else if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      id v9 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = a1;
        __int16 v20 = 2080;
        v21 = "-[_UIKBFeedbackGenerator _deactivateWithCompletionBlock:]";
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%@: Request engine to stop for: %s", buf, 0x16u);
      }

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_148;
      v12[3] = &unk_1E52EADB0;
      id v13 = v5;
      -[_UIKBFeedbackGenerator _performOnQueue:]((void *)a1, v12);
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel__stopEngineDueToIdle object:0];
      id v8 = v13;
      goto LABEL_9;
    }
    v6[2](v6);
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_recreateEngineAndPlayersIfNecessaryOnQueueWithMode:(void *)a3 reason:
{
  id v5 = a3;
  if (a1 && !*(void *)(a1 + 80))
  {
    id v6 = v5;
    -[_UIKBFeedbackGenerator _recreateEngineAndPlayersOnQueueWithMode:reason:](a1, a2, v5);
    id v5 = v6;
  }
}

- (void)_releaseEngineAndPlayersOnQueue
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = a1;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "%@: Releasing engine and players.", (uint8_t *)&v5, 0xCu);
    }

    -[_UIKBFeedbackGenerator _setIsEngineRunning:](a1, 0);
    id v3 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    int v4 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;
  }
}

- (void)_startEngineIfNecessaryOnQueueWithReason:(void *)a3 completionBlock:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(unsigned char *)(a1 + 112))
    {
      if (v6) {
        v6[2](v6, 1);
      }
    }
    else
    {
      uint64_t v7 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%@: Requesting engine start for reason: %@", buf, 0x16u);
      }

      id v8 = v6;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      id v9 = *(void **)(a1 + 80);
      if (v9)
      {
        id v15 = 0;
        [v9 startAndReturnError:&v15];
        id v10 = v15;
        int v11 = _UIKBFeedbackLog();
        uint64_t v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v10;
            _os_log_error_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Error starting CHHapticEngine: %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "%@: Engine started (or it was already running).", buf, 0xCu);
          }

          -[_UIKBFeedbackGenerator _setIsEngineRunning:](a1, 1);
        }
        char v14 = *(unsigned char *)(a1 + 112);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __65___UIKBFeedbackGenerator__startEngineOnQueueWithCompletionBlock___block_invoke;
        id v17 = &unk_1E52EAD88;
        char v19 = v14;
        id v18 = v8;
        -[_UIKBFeedbackGenerator _performOnMain:]((void *)a1, buf);
      }
      else
      {
        id v13 = _UIKBFeedbackLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_error_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "%@: Error: Cannot start engine because it does not exist.", buf, 0xCu);
        }

        if (v8) {
          v8[2](v8, 0);
        }
      }
    }
  }
}

- (BOOL)_isRingerSwitchOn
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 == -1)
  {
    int v4 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v5 = 138412290;
      *(void *)&v5[4] = a1;
      _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%@: Error, attempting to read ringer state with an invalid token.", v5, 0xCu);
    }

    return 0;
  }
  else
  {
    *(void *)id v5 = 0;
    notify_get_state(v2, (uint64_t *)v5);
    return *(void *)v5 != 0;
  }
}

- (uint64_t)_areKeyClicksEnabled
{
  v1 = [a1 objectForKey:@"keyboard-audio"];
  int v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (void)_stopEngineIfNecessaryOnQueueAndReleaseResources:(void *)a3 completionBlock:
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(unsigned char *)(a1 + 112))
    {
      objc_initWeak(location, (id)a1);
      uint64_t v6 = *(void **)(a1 + 80);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke;
      v8[3] = &unk_1E52EADD8;
      objc_copyWeak(&v10, location);
      id v9 = v5;
      char v11 = a2;
      [v6 stopWithCompletionHandler:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v7 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = (id)a1;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%@: Engine is not running.", (uint8_t *)location, 0xCu);
      }

      if (a2) {
        -[_UIKBFeedbackGenerator _releaseEngineAndPlayersOnQueue](a1);
      }
      if (v5) {
        v5[2](v5);
      }
    }
  }
}

- (void)_resetIdleTimer
{
  if (!a1) {
    return;
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel__stopEngineDueToIdle object:0];
  if (a1[15] == 1) {
    return;
  }
  int v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v4 = [v2 valueForPreferenceKey:@"KeyboardFeedbackIdleTimeout"];

  if (v4)
  {
    [v4 doubleValue];
    if (v3 <= 0.0) {
      goto LABEL_9;
    }
  }
  else
  {
    double v3 = 5.0;
  }
  [a1 performSelector:sel__stopEngineDueToIdle withObject:0 afterDelay:v3];
LABEL_9:
}

- (void)_stopEngineDueToIdle
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%@: Requesting engine stop for idle.", (uint8_t *)&v4, 0xCu);
  }

  -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_135);
  if (self) {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__stopEngineDueToIdle object:0];
  }
}

- (void)_dictationDidBeginNotification:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%@: Dictation did begin.", (uint8_t *)&v5, 0xCu);
  }

  -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_137_1);
}

- (void)_dictationDidEndNotification:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%@: Dictation did end.", (uint8_t *)&v5, 0xCu);
  }

  -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_139);
}

- (void)_keyboardPreferencesDidUpdateNotification:(id)a3
{
}

- (void)_stopEngineForApplicationNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self && (self->__mode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    int v5 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 name];
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%@: Request engine stop for application notification: %@", (uint8_t *)&v7, 0x16u);
    }
    -[_UIKBFeedbackGenerator _performOnQueue:](self, &__block_literal_global_144);
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__stopEngineDueToIdle object:0];
  }
}

- (void)_effectiveVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = [v4 userInfo];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v6 = (id *)getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr;
  uint64_t v22 = getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr;
  if (!getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_block_invoke;
    id v17 = &unk_1E52D9900;
    id v18 = &v19;
    int v7 = MediaExperienceLibrary();
    v20[3] = (uint64_t)dlsym(v7, "AVSystemController_EffectiveVolumeNotificationParameter_Category");
    getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr = *(void *)(v18[1] + 24);
    uint64_t v6 = (id *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v6)
  {
    id v8 = *v6;
    __int16 v9 = [v5 objectForKeyedSubscript:v8];

    if ([v9 isEqualToString:@"Ringtone"])
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64___UIKBFeedbackGenerator__effectiveVolumeDidChangeNotification___block_invoke;
      v12[3] = &unk_1E52EAE00;
      id v13 = v9;
      -[_UIKBFeedbackGenerator _performOnQueue:](self, v12);
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"NSString *getAVSystemController_EffectiveVolumeNotificationParameter_Category(void)"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"_UIKBFeedbackGenerator.m", 54, @"%s", dlerror());

    __break(1u);
  }
}

- (void)_serverConnectionDiedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%@: AVSystemController error notification: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)activateWithCompletionBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke;
  aBlock[3] = &unk_1E52D9FE8;
  id v5 = v4;
  id v23 = v5;
  int v6 = _Block_copy(aBlock);
  int v7 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [NSString stringWithUTF8String:"-[_UIKBFeedbackGenerator activateWithCompletionBlock:]"];
    *(_DWORD *)buf = 138412546;
    __int16 v25 = self;
    __int16 v26 = 2112;
    __int16 v27 = v8;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  if (!self->_isActive)
  {
    int64_t mode = self->__mode;
    if (mode)
    {
      if ((_UIApplicationIsExtension() & 1) != 0
        || (_UIApplicationMayVendViews() & 1) != 0
        || ![(id)UIApp isSuspended])
      {
        if (mode == 1)
        {
          if (!+[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]())
          {
            uint64_t v14 = _UIKBFeedbackLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v25 = self;
              _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "%@: Preheating System Sounds.", buf, 0xCu);
            }

            uint64_t v15 = +[UIDevice currentDevice];
            [v15 _registerForSystemSounds:self];

            self->_isActive = 1;
            goto LABEL_7;
          }
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_147;
          v19[3] = &unk_1E52EAE28;
          uint64_t v21 = 1;
          v19[4] = self;
          id v20 = v6;
          -[_UIKBFeedbackGenerator _performOnQueue:](self, v19);
          id v13 = v20;
        }
        else
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_4;
          v16[3] = &unk_1E52EAE78;
          int64_t v18 = mode;
          id v17 = v6;
          -[_UIKBFeedbackGenerator _performOnQueue:](self, v16);
          id v13 = v17;
        }

        goto LABEL_21;
      }
      uint64_t v11 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v25 = self;
        uint64_t v12 = "%@: Cannot activate engine while suspended.";
LABEL_19:
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v25 = self;
        uint64_t v12 = "%@: Nothing to activate. Keyboard feedback is disabled.";
        goto LABEL_19;
      }
    }

    (*((void (**)(void *, void))v6 + 2))(v6, 0);
    goto LABEL_21;
  }
  id v9 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v25 = self;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%@: Skipping activation. Already activated.", buf, 0xCu);
  }

LABEL_7:
  (*((void (**)(void *, uint64_t))v6 + 2))(v6, 1);
LABEL_21:
}

- (void)deactivate
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36___UIKBFeedbackGenerator_deactivate__block_invoke;
  v3[3] = &unk_1E52DC308;
  objc_copyWeak(&v4, &location);
  -[_UIKBFeedbackGenerator _deactivateWithCompletionBlock:]((uint64_t)self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)actionOccurred:(int64_t)a3
{
}

- (void)actionOccurred:(int64_t)a3 atLocation:(CGPoint)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self && self->__mode)
  {
    if (![(_UIKBFeedbackGenerator *)self isActive])
    {
      int v6 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v9 = self;
        __int16 v10 = 2080;
        uint64_t v11 = "-[_UIKBFeedbackGenerator actionOccurred:atLocation:]";
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%@: Activating for %s", buf, 0x16u);
      }

      [(_UIKBFeedbackGenerator *)self activateWithCompletionBlock:0];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52___UIKBFeedbackGenerator_actionOccurred_atLocation___block_invoke;
    v7[3] = &__block_descriptor_40_e32_v16__0___UIKBFeedbackGenerator_8l;
    void v7[4] = a3;
    -[_UIKBFeedbackGenerator _performOnQueue:](self, v7);
    -[_UIKBFeedbackGenerator _resetIdleTimer](self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSounds, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_engineStartDate, 0);
  objc_storeStrong((id *)&self->_soundsDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end