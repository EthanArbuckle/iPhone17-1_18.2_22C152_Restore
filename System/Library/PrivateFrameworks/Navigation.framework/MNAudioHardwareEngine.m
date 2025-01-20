@interface MNAudioHardwareEngine
+ (BOOL)deviceSpeakerIsInUse;
+ (BOOL)headphonesAreInUse;
- (BOOL)_hardwareIsBusy;
- (BOOL)_speechMuted;
- (BOOL)_stopCurrentEvent;
- (BOOL)speaking;
- (BOOL)vibrateForShortPrompt:(unint64_t)a3;
- (MNAudioHardwareEngine)initWithAudioSystemOptions:(id)a3 voiceLanguage:(id)a4 transportType:(int)a5;
- (MNAudioPathwayResourceAccess)pathwayAccess;
- (MNAudioSessionResourceAccess)sessionAccess;
- (MNAudioSystemOptions)options;
- (MNHapticResourceController)hapticController;
- (MNSoundEffectResourceController)sfxController;
- (MNSpeechResourceController)speechController;
- (double)durationOf:(id)a3;
- (void)_finishedProcessingEventWithStatus:(unint64_t)a3;
- (void)_mediaSessionServicesWereLost:(id)a3;
- (void)_mediaSessionServicesWereReset:(id)a3;
- (void)_process:(id)a3;
- (void)_processNextEvent;
- (void)_processNextEventIfNecessary;
- (void)_updateForNewGuidanceLevel;
- (void)audioSessionResourceAccess:(id)a3 didActivateSession:(BOOL)a4;
- (void)audioSessionResourceAccess:(id)a3 didDeactivateSession:(BOOL)a4;
- (void)audioSessionResourceAccess:(id)a3 didFailWhileActivatingSession:(id)a4;
- (void)audioSessionResourceAccess:(id)a3 didFailWhileDeactivatingSession:(id)a4;
- (void)audioSystemEventQueue:(id)a3 eventWillInterrupt:(id)a4;
- (void)audioSystemOptions:(id)a3 didChangeGuidanceLevel:(unint64_t)a4 transportType:(int)a5;
- (void)audioSystemOptions:(id)a3 didUpdatePauseSpokenAudio:(BOOL)a4;
- (void)audioSystemOptions:(id)a3 didUpdateUseHFP:(BOOL)a4;
- (void)cache:(id)a3;
- (void)changeTransportType:(int)a3;
- (void)clearAllEvents;
- (void)dealloc;
- (void)forceStop;
- (void)registerObserver:(id)a3;
- (void)requestSpeech:(id)a3 guidanceLevel:(unint64_t)a4 shortPromptType:(unint64_t)a5 completionHandler:(id)a6;
- (void)setHapticController:(id)a3;
- (void)setPathwayAccess:(id)a3;
- (void)setSessionAccess:(id)a3;
- (void)setSfxController:(id)a3;
- (void)setSpeechController:(id)a3;
- (void)soundEffectResourceController:(id)a3 didFailWhilePlayingIndicator:(unint64_t)a4 withError:(id)a5;
- (void)soundEffectResourceController:(id)a3 didFinishPlayingIndicator:(unint64_t)a4;
- (void)soundEffectResourceController:(id)a3 wasInterruptedWhilePlayingIndicator:(unint64_t)a4 withError:(id)a5;
- (void)speechResourceController:(id)a3 didFailWhileSpeakingUtterance:(id)a4 withError:(id)a5;
- (void)speechResourceController:(id)a3 didFinishSpeakingUtterance:(id)a4 withDuration:(double)a5;
- (void)speechResourceController:(id)a3 didTimeoutWhileSpeakingUtterance:(id)a4 withError:(id)a5;
- (void)speechResourceController:(id)a3 wasInterruptedWhileSpeakingUtterance:(id)a4 withError:(id)a5;
- (void)speechResourceController:(id)a3 willStartSpeakingUtterance:(id)a4;
- (void)stop;
- (void)unregisterObserver:(id)a3;
@end

@implementation MNAudioHardwareEngine

- (MNAudioHardwareEngine)initWithAudioSystemOptions:(id)a3 voiceLanguage:(id)a4 transportType:(int)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9 || ![v10 length]) {
    goto LABEL_11;
  }
  v12 = 0;
  if (a5 > 3 || a5 == 1) {
    goto LABEL_15;
  }
  v32.receiver = self;
  v32.super_class = (Class)MNAudioHardwareEngine;
  self = [(MNAudioHardwareEngine *)&v32 init];
  if (!self)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_15;
  }
  v13 = (NSString *)[v11 copy];
  voiceLanguage = self->_voiceLanguage;
  self->_voiceLanguage = v13;

  self->_uint64_t transportType = a5;
  objc_storeStrong((id *)&self->_options, a3);
  v15 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    options = self->_options;
    *(_DWORD *)buf = 138412290;
    v34 = options;
    _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "ⓜ Setting audio system options : %@", buf, 0xCu);
  }

  BOOL v17 = [(MNAudioSystemOptions *)self->_options useHFP];
  v18 = [(MNAudioHardwareEngine *)self pathwayAccess];
  [v18 setEnableHFPUse:v17];

  v19 = [(MNAudioHardwareEngine *)self pathwayAccess];
  [v19 setWantsVolumeControl:1];

  [(MNAudioHardwareEngine *)self _updateForNewGuidanceLevel];
  v20 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = self->_voiceLanguage;
    uint64_t transportType = self->_transportType;
    if (transportType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_transportType);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E60F6DE8[transportType];
    }
    *(_DWORD *)buf = 138412546;
    v34 = (MNAudioSystemOptions *)v21;
    __int16 v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_INFO, "ⓦ Initialization: using voice language : %@, and transport type : %@", buf, 0x16u);
  }
  self->_currentUtteranceGuidanceLevel = 0;
  v24 = [[MNAudioSystemEventQueue alloc] initWithCapacity:32];
  queue = self->_queue;
  self->_queue = v24;

  [(MNAudioSystemEventQueue *)self->_queue setDelegate:self];
  self->_chimeBeforeInstruction = GEOConfigGetBOOL();
  objc_initWeak((id *)buf, self);
  id v26 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v31, (id *)buf);
  v27 = _GEOConfigAddBlockListenerForKey();
  id chimeBeforeInstructionListenerHandle = self->_chimeBeforeInstructionListenerHandle;
  self->_id chimeBeforeInstructionListenerHandle = v27;

  [(MNAudioSystemOptions *)self->_options registerObserver:self];
  v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v29 addObserver:self selector:sel__mediaSessionServicesWereLost_ name:*MEMORY[0x1E4F4E890] object:0];
  [v29 addObserver:self selector:sel__mediaSessionServicesWereReset_ name:*MEMORY[0x1E4F4E8A0] object:0];
  self = self;

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
  v12 = self;
LABEL_15:

  return v12;
}

void __80__MNAudioHardwareEngine_initWithAudioSystemOptions_voiceLanguage_transportType___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    WeakRetained[64] = GEOConfigGetBOOL();
    WeakRetained = v2;
  }
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  [(MNAudioSystemOptions *)self->_options unregisterObserver:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MNAudioHardwareEngine;
  [(MNAudioHardwareEngine *)&v4 dealloc];
}

- (MNAudioSystemOptions)options
{
  return self->_options;
}

- (MNAudioPathwayResourceAccess)pathwayAccess
{
  pathwayAccess = self->_pathwayAccess;
  if (!pathwayAccess)
  {
    objc_super v4 = [[MNAudioPathwayResourceAccess alloc] initWithHFPEnabled:[(MNAudioSystemOptions *)self->_options useHFP]];
    v5 = self->_pathwayAccess;
    self->_pathwayAccess = v4;

    pathwayAccess = self->_pathwayAccess;
  }
  return pathwayAccess;
}

- (MNAudioSessionResourceAccess)sessionAccess
{
  sessionAccess = self->_sessionAccess;
  if (!sessionAccess)
  {
    objc_super v4 = (MNAudioSessionResourceAccess *)objc_opt_new();
    v5 = self->_sessionAccess;
    self->_sessionAccess = v4;

    [(MNAudioSessionResourceAccess *)self->_sessionAccess setDelegate:self];
    sessionAccess = self->_sessionAccess;
  }
  return sessionAccess;
}

- (MNHapticResourceController)hapticController
{
  hapticController = self->_hapticController;
  if (!hapticController)
  {
    objc_super v4 = (MNHapticResourceController *)objc_opt_new();
    v5 = self->_hapticController;
    self->_hapticController = v4;

    [(MNHapticResourceController *)self->_hapticController setDelegate:self];
    hapticController = self->_hapticController;
  }
  return hapticController;
}

- (MNSoundEffectResourceController)sfxController
{
  sfxController = self->_sfxController;
  if (!sfxController)
  {
    objc_super v4 = (MNSoundEffectResourceController *)objc_opt_new();
    v5 = self->_sfxController;
    self->_sfxController = v4;

    [(MNSoundEffectResourceController *)self->_sfxController setDelegate:self];
    sfxController = self->_sfxController;
  }
  return sfxController;
}

- (MNSpeechResourceController)speechController
{
  speechController = self->_speechController;
  if (!speechController)
  {
    objc_super v4 = [[MNSpeechResourceController alloc] initWithLanguage:self->_voiceLanguage];
    v5 = self->_speechController;
    self->_speechController = v4;

    [(MNSpeechResourceController *)self->_speechController setDelegate:self];
    speechController = self->_speechController;
  }
  return speechController;
}

- (BOOL)speaking
{
  v2 = [(MNAudioHardwareEngine *)self speechController];
  char v3 = [v2 speaking];

  return v3;
}

- (void)registerObserver:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_1F0E55DE8])
    {
      if (!self->_observers)
      {
        v6 = GetAudioLogForMNAudioHardwareEngineCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "ⓦ Creating observer table", (uint8_t *)&v11, 2u);
        }

        v7 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E55DE8];
        observers = self->_observers;
        self->_observers = v7;
      }
      id v9 = GetAudioLogForMNAudioHardwareEngineCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "ⓦ Adding observer : %@", (uint8_t *)&v11, 0xCu);
      }

      [(MNObserverHashTable *)self->_observers registerObserver:v5];
    }
    else
    {
      id v10 = GetAudioLogForMNAudioHardwareEngineCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "⒲ Object isn't a MNAudioHardwareEngineObserver : %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 conformsToProtocol:&unk_1F0E55DE8];
    v7 = GetAudioLogForMNAudioHardwareEngineCategory();
    observers = (MNObserverHashTable *)v7;
    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        int v11 = v5;
        _os_log_impl(&dword_1B542B000, &observers->super, OS_LOG_TYPE_ERROR, "⒲ Object isn't a MNAudioHardwareEngineObserver : %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_11;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      int v11 = v5;
      _os_log_impl(&dword_1B542B000, &observers->super, OS_LOG_TYPE_DEBUG, "ⓦ Removing observer : %@", (uint8_t *)&v10, 0xCu);
    }

    [(MNObserverHashTable *)self->_observers unregisterObserver:v5];
    if (![(MNObserverHashTable *)self->_observers hasObservers])
    {
      id v9 = GetAudioLogForMNAudioHardwareEngineCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "ⓦ Observer table empty; destroying",
          (uint8_t *)&v10,
          2u);
      }

      observers = self->_observers;
      self->_observers = 0;
LABEL_11:
    }
  }
}

- (void)changeTransportType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 > 3 || a3 == 1)
  {
    id v4 = GetAudioLogForMNAudioHardwareEngineCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if v3 < 7 && ((0x73u >> v3))
      {
        v5 = off_1E60F6E20[(int)v3];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "ⓜ Invalid transport type passed to changeTransportType: %@", buf, 0xCu);
    }
  }
  else
  {
    self->_uint64_t transportType = a3;
  }
}

- (void)cache:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315395;
    id v9 = "-[MNAudioHardwareEngine cache:]";
    __int16 v10 = 2113;
    id v11 = v4;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEBUG, "%s : '%{private}@'", (uint8_t *)&v8, 0x16u);
  }

  if ([v4 length])
  {
    uint64_t v6 = objc_msgSend(v4, "_navigation_isPrivate") ^ 1;
    v7 = [(MNAudioHardwareEngine *)self speechController];
    [v7 cache:v4 withDisclosure:v6 andReport:0];
  }
}

- (void)requestSpeech:(id)a3 guidanceLevel:(unint64_t)a4 shortPromptType:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if ([v10 length])
  {
    uint64_t v12 = [[MNAudioSystemEvent alloc] initWithUtterance:v10 andShortPrompt:a5 andVoiceGuidanceLevel:a4 andCompletion:v11];
    if (v12)
    {
      queue = self->_queue;
      id v17 = 0;
      BOOL v14 = [(MNAudioSystemEventQueue *)queue enqueue:v12 withOptions:8 andReport:&v17];
      v15 = v17;
      if (v14)
      {
        [(MNAudioHardwareEngine *)self _processNextEventIfNecessary];
      }
      else
      {
        v16 = GetAudioLogForMNAudioHardwareEngineCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v19 = (const char *)v12;
          _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_INFO, "⒲ Could not enqueue event : %{private}@", buf, 0xCu);
        }
      }
    }
    else
    {
      v15 = GetAudioLogForMNAudioHardwareEngineCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "⒲ Could not create event", buf, 2u);
      }
    }
  }
  else
  {
    GetAudioLogForMNAudioHardwareEngineCategory();
    uint64_t v12 = (MNAudioSystemEvent *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[MNAudioHardwareEngine requestSpeech:guidanceLevel:shortPromptType:completionHandler:]";
      _os_log_impl(&dword_1B542B000, &v12->super, OS_LOG_TYPE_INFO, "⒲ %s : string is empty", buf, 0xCu);
    }
  }
}

- (void)forceStop
{
  [(MNAudioHardwareEngine *)self clearAllEvents];
  uint64_t v3 = [(MNAudioHardwareEngine *)self sfxController];
  [v3 stop];

  id v4 = [(MNAudioHardwareEngine *)self hapticController];
  [v4 stopVibrating];

  id v5 = [(MNAudioHardwareEngine *)self sessionAccess];
  [v5 deactivateWithForce:1];
}

- (void)stop
{
  [(MNAudioHardwareEngine *)self clearAllEvents];
  uint64_t v3 = [(MNAudioHardwareEngine *)self sfxController];
  [v3 stop];

  id v4 = [(MNAudioHardwareEngine *)self hapticController];
  [v4 stopVibrating];
}

- (void)clearAllEvents
{
  [(MNAudioHardwareEngine *)self _stopCurrentEvent];
  queue = self->_queue;
  [(MNAudioSystemEventQueue *)queue clear];
}

- (BOOL)vibrateForShortPrompt:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 & 0xF;
  unint64_t v4 = v3 - 3;
  if (v3 - 3 > 2)
  {
    id v5 = GetAudioLogForMNAudioHardwareEngineCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v3);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = off_1E60F6E58[v3];
      }
      *(_DWORD *)buf = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "ⓦ Vibration ignored: short prompt type - %@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [(MNAudioHardwareEngine *)self hapticController];
    [v5 triggerVibration];
  }

  return v4 < 3;
}

- (double)durationOf:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(MNAudioHardwareEngine *)self speechController];
    [v5 durationOf:v4];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (BOOL)headphonesAreInUse
{
  return +[MNAudioSessionResourceAccess headphonesAreInUse];
}

+ (BOOL)deviceSpeakerIsInUse
{
  return +[MNAudioSessionResourceAccess deviceSpeakerIsInUse];
}

- (void)_processNextEventIfNecessary
{
  if (![(MNAudioHardwareEngine *)self _hardwareIsBusy])
  {
    [(MNAudioHardwareEngine *)self _processNextEvent];
  }
}

- (void)_processNextEvent
{
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = (id)objc_opt_new();
  uint64_t v31 = 0;
  objc_super v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  __int16 v35 = __Block_byref_object_dispose__3;
  id v36 = (id)objc_opt_new();
  unint64_t v3 = [(MNAudioSystemOptions *)self->_options guidanceLevelForTransportType:self->_transportType];
  while (1)
  {
    unint64_t v4 = [(MNAudioSystemEventQueue *)self->_queue count];
    if (!v4) {
      break;
    }
    id v5 = [(MNAudioSystemEventQueue *)self->_queue dequeue];
    double v6 = [v5 utterance];
    uint64_t v7 = [v6 length];

    if (!v7) {
      goto LABEL_9;
    }
    if ([(MNAudioHardwareEngine *)self _speechMuted])
    {
      int v8 = v38;
LABEL_8:
      [(id)v8[5] addObject:v5];
LABEL_9:

      id v5 = 0;
      goto LABEL_10;
    }
    if (v3 < [v5 guidanceLevel])
    {
      int v8 = v32;
      goto LABEL_8;
    }
LABEL_10:
    if (v5) {
      goto LABEL_13;
    }
  }
  id v5 = 0;
LABEL_13:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MNAudioHardwareEngine__processNextEvent__block_invoke;
  block[3] = &unk_1E60F6DC8;
  block[4] = &v37;
  block[5] = &v31;
  block[6] = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (!v4)
  {
    uint64_t v13 = GetAudioLogForMNAudioHardwareEngineCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "ⓦ No more events to process; deactivating the audio session",
        buf,
        2u);
    }

    BOOL v14 = [(MNAudioHardwareEngine *)self sessionAccess];
    [v14 deactivate];
    goto LABEL_32;
  }
  if (([v5 shortPrompt] & 0x40) != 0) {
    goto LABEL_28;
  }
  id v9 = [(MNAudioHardwareEngine *)self sessionAccess];
  uint64_t v10 = [v9 promptStyle];

  if (v10 != 1936224884)
  {
    if (v10 == 1852796517)
    {
      id v11 = [v5 handler];

      if (v11)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __42__MNAudioHardwareEngine__processNextEvent__block_invoke_68;
        v27[3] = &unk_1E60F6B98;
        id v28 = v5;
        uint64_t v12 = (void *)MEMORY[0x1E4F14428];
        dispatch_async(MEMORY[0x1E4F14428], v27);
      }
      [(MNAudioHardwareEngine *)self _processNextEvent];
      goto LABEL_33;
    }
LABEL_28:
    v18 = [(MNAudioHardwareEngine *)self sessionAccess];
    uint64_t v19 = [v18 state];

    if (v19)
    {
      uint64_t v20 = [(MNAudioHardwareEngine *)self sessionAccess];
      uint64_t v21 = [v20 state];

      if (v21 == 2) {
        [(MNAudioHardwareEngine *)self _process:v5];
      }
      goto LABEL_33;
    }
    objc_storeStrong((id *)&self->_pendingEvent, v5);
    BOOL v14 = [(MNAudioHardwareEngine *)self sessionAccess];
    [v14 activate];
LABEL_32:

    goto LABEL_33;
  }
  unint64_t v15 = [v5 shortPrompt] & 0xF;
  if (v15 > 3 || v15 == 2) {
    goto LABEL_28;
  }
  v16 = [v5 handler];

  if (v16)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __42__MNAudioHardwareEngine__processNextEvent__block_invoke_2;
    v25 = &unk_1E60F6B98;
    id v26 = v5;
    id v17 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], &v22);
  }
  [(MNAudioHardwareEngine *)self _processNextEvent];
LABEL_33:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
}

void __42__MNAudioHardwareEngine__processNextEvent__block_invoke(void *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v1 = *(id *)(*(void *)(a1[4] + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = *(__CFString **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v7 = GetAudioLogForMNAudioHardwareEngineCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v38 = v6;
          _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "ⓦ Speech is muted; dropping event - %{private}@",
            buf,
            0xCu);
        }

        int v8 = [(__CFString *)v6 handler];

        if (v8)
        {
          id v9 = [(__CFString *)v6 handler];
          v9[2](v9, 0);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v3);
  }

  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        v18 = GetAudioLogForMNAudioHardwareEngineCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v17 guidanceLevel];
          if ((unint64_t)(v19 + 1) >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v19);
            uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v20 = off_1E60F6E88[v19 + 1];
          }
          uint64_t v21 = v20;
          unint64_t v22 = a1[6] + 1;
          if (v22 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", a1[6]);
            uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v23 = off_1E60F6E88[v22];
          }
          *(_DWORD *)buf = 138412546;
          v38 = v21;
          __int16 v39 = 2112;
          v40 = v23;
          _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_INFO, "ⓦ Voice guidance level not met - min required: %@, actual: %@", buf, 0x16u);
        }
        v24 = [v17 handler];

        if (v24)
        {
          v25 = [v17 handler];
          v25[2](v25, 1);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v14);
  }

  uint64_t v26 = *(void *)(a1[5] + 8);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = 0;
}

void __42__MNAudioHardwareEngine__processNextEvent__block_invoke_68(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) handler];
  v1[2](v1, 2);
}

void __42__MNAudioHardwareEngine__processNextEvent__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) handler];
  v1[2](v1, 3);
}

- (void)_process:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    *(void *)v25 = v4;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "ⓦ Processing event - %{private}@", buf, 0xCu);
  }

  uint64_t v6 = 1852992876;
  if (([v4 shortPrompt] & 0x40) == 0)
  {
    uint64_t v7 = [(MNAudioHardwareEngine *)self sessionAccess];
    uint64_t v6 = [v7 promptStyle];
  }
  int v8 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = [(MNAudioHardwareEngine *)self sessionAccess];
    unsigned int v9 = [v23 promptStyle] >> 24;
    uint64_t v10 = [(MNAudioHardwareEngine *)self sessionAccess];
    int v11 = ([v10 promptStyle] >> 16);
    id v12 = [(MNAudioHardwareEngine *)self sessionAccess];
    int v13 = ((unsigned __int16)[v12 promptStyle] >> 8);
    uint64_t v14 = [(MNAudioHardwareEngine *)self sessionAccess];
    unsigned __int8 v15 = [v14 promptStyle];
    *(_DWORD *)buf = 67110912;
    *(_DWORD *)v25 = BYTE3(v6);
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = BYTE2(v6);
    __int16 v26 = 1024;
    int v27 = BYTE1(v6);
    __int16 v28 = 1024;
    int v29 = v6;
    __int16 v30 = 1024;
    unsigned int v31 = v9;
    __int16 v32 = 1024;
    int v33 = v11;
    __int16 v34 = 1024;
    int v35 = v13;
    __int16 v36 = 1024;
    int v37 = v15;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "ⓦ Processing: Using a prompt style of '%c%c%c%c' - audio session's prompt style: '%c%c%c%c'", buf, 0x32u);
  }
  self->_currentUtteranceGuidanceLevel = 0;
  if (self->_chimeBeforeInstruction)
  {
    if (([v4 shortPrompt] & 0x10) != 0) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
    id v17 = [(MNAudioHardwareEngine *)self sfxController];
    [v17 playSound:v16 andReport:0];
  }
  if (v6 == 1852992876)
  {
    uint64_t v18 = [v4 isPrivate] ^ 1;
    uint64_t v19 = [(MNAudioHardwareEngine *)self speechController];
    uint64_t v20 = [v4 utterance];
    [v19 speak:v20 withDisclosure:v18 andReport:0];

    self->_currentUtteranceGuidanceLevel = [v4 guidanceLevel];
  }
  else
  {
    if ([v4 hasSoundEffect])
    {
      if (([v4 shortPrompt] & 0x10) != 0) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 2;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    unint64_t v22 = [(MNAudioHardwareEngine *)self sfxController];
    [v22 playSound:v21 andReport:0];
  }
}

- (void)_finishedProcessingEventWithStatus:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (a3 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", a3);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E60F6EA8[a3];
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[MNAudioHardwareEngine _finishedProcessingEventWithStatus:]";
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "ⓦ %s : %@", buf, 0x16u);
  }
  uint64_t v7 = self->_pendingEvent;
  pendingEvent = self->_pendingEvent;
  self->_pendingEvent = 0;

  self->_currentUtteranceGuidanceLevel = 0;
  unsigned int v9 = [(MNAudioSystemEvent *)v7 handler];

  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MNAudioHardwareEngine__finishedProcessingEventWithStatus___block_invoke;
    block[3] = &unk_1E60F6BC0;
    int v11 = v7;
    unint64_t v12 = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  [(MNAudioHardwareEngine *)self _processNextEventIfNecessary];
}

void __60__MNAudioHardwareEngine__finishedProcessingEventWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) handler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (BOOL)_hardwareIsBusy
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  pendingEvent = self->_pendingEvent;
  id v4 = [(MNAudioHardwareEngine *)self speechController];
  int v5 = [v4 speaking];

  uint64_t v6 = [(MNAudioHardwareEngine *)self sfxController];
  int v7 = [v6 playing];

  int v8 = [(MNAudioHardwareEngine *)self hapticController];
  int v9 = [v8 vibrating];

  uint64_t v10 = [(MNAudioHardwareEngine *)self sessionAccess];
  int v11 = 1;
  if ([v10 state] != 1 && !pendingEvent)
  {
    unint64_t v12 = [(MNAudioHardwareEngine *)self speechController];
    if (([v12 speaking] & 1) == 0)
    {
      int v13 = [(MNAudioHardwareEngine *)self sfxController];
      if (([v13 playing] & 1) == 0)
      {
        uint64_t v14 = [(MNAudioHardwareEngine *)self hapticController];
        int v11 = [v14 vibrating];
      }
    }
  }
  __int16 v15 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v27 = v9;
    int v16 = v7;
    int v17 = v5;
    if (v11) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    uint64_t v19 = [(MNAudioHardwareEngine *)self sessionAccess];
    unint64_t v20 = [v19 state];
    if (v20 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v20);
      uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v21 = off_1E60F6F00[v20];
    }
    if (pendingEvent) {
      unint64_t v22 = @"YES";
    }
    else {
      unint64_t v22 = @"NO";
    }
    *(_DWORD *)buf = 138413570;
    if (v17) {
      uint64_t v23 = @"YES";
    }
    else {
      uint64_t v23 = @"NO";
    }
    int v29 = v18;
    __int16 v30 = 2112;
    if (v16) {
      v24 = @"YES";
    }
    else {
      v24 = @"NO";
    }
    unsigned int v31 = v21;
    if (v27) {
      v25 = @"YES";
    }
    else {
      v25 = @"NO";
    }
    __int16 v32 = 2112;
    int v33 = v22;
    __int16 v34 = 2112;
    int v35 = v23;
    __int16 v36 = 2112;
    int v37 = v24;
    __int16 v38 = 2112;
    __int16 v39 = v25;
    _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "ⓦ Is hardware busy? %@, because\n{\n\tSession state: %@\n\tHas pending event: %@\n\tSpeech active: %@\n\tSFX active: %@\n\tHaptics active: %@\n}", buf, 0x3Eu);
  }
  return v11;
}

- (BOOL)_speechMuted
{
  return [(MNAudioSystemOptions *)self->_options guidanceLevelForTransportType:self->_transportType] == 0;
}

- (BOOL)_stopCurrentEvent
{
  uint64_t v3 = [(MNAudioHardwareEngine *)self speechController];
  int v4 = [v3 speaking];

  if (v4)
  {
    int v5 = [(MNAudioHardwareEngine *)self speechController];
    [v5 stopSpeakingAndReport:0];
  }
  return v4;
}

- (void)_updateForNewGuidanceLevel
{
  unint64_t v3 = [(MNAudioSystemOptions *)self->_options guidanceLevelForTransportType:self->_transportType];
  if (v3 == 1)
  {
    if (self->_currentUtteranceGuidanceLevel == 2) {
      [(MNAudioHardwareEngine *)self stop];
    }
    if ((GEOConfigGetBOOL() & 1) == 0)
    {
      int v4 = _MNStringFromSpokenLocalization(@"Navigation_FirstTimeSwitchToAlertsOnlyGuidanceLevel");
      [(MNAudioHardwareEngine *)self requestSpeech:v4 guidanceLevel:1 shortPromptType:64 completionHandler:0];
      GEOConfigSetBOOL();
    }
  }
  else if (!v3)
  {
    [(MNAudioHardwareEngine *)self stop];
  }
  id v5 = [(MNAudioHardwareEngine *)self sessionAccess];
  [v5 updatePropertiesWithOptions:self->_options transportType:self->_transportType error:0];
}

- (void)audioSystemEventQueue:(id)a3 eventWillInterrupt:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[MNAudioHardwareEngine audioSystemEventQueue:eventWillInterrupt:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %@", (uint8_t *)&v9, 0x20u);
  }

  if (![(MNAudioHardwareEngine *)self _stopCurrentEvent]) {
    [(MNAudioHardwareEngine *)self _processNextEventIfNecessary];
  }
}

- (void)audioSessionResourceAccess:(id)a3 didActivateSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    int v9 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didActivateSession:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %d", (uint8_t *)&v8, 0x1Cu);
  }

  [(MNObserverHashTable *)self->_observers audioHardwareEngine:self didActivateAudioSession:1];
  [(MNAudioHardwareEngine *)self _process:self->_pendingEvent];
}

- (void)audioSessionResourceAccess:(id)a3 didFailWhileActivatingSession:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    __int16 v10 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didFailWhileActivatingSession:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %@", (uint8_t *)&v9, 0x20u);
  }

  [(MNAudioHardwareEngine *)self _process:self->_pendingEvent];
}

- (void)audioSessionResourceAccess:(id)a3 didDeactivateSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    int v9 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didDeactivateSession:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %d", (uint8_t *)&v8, 0x1Cu);
  }

  [(MNObserverHashTable *)self->_observers audioHardwareEngine:self didActivateAudioSession:0];
  if ([(MNAudioSystemEventQueue *)self->_queue count]) {
    [(MNAudioHardwareEngine *)self _processNextEventIfNecessary];
  }
}

- (void)audioSessionResourceAccess:(id)a3 didFailWhileDeactivatingSession:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    __int16 v10 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didFailWhileDeactivatingSession:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %@", (uint8_t *)&v9, 0x20u);
  }

  if ([(MNAudioSystemEventQueue *)self->_queue count]) {
    [(MNAudioHardwareEngine *)self _processNextEventIfNecessary];
  }
}

- (void)audioSystemOptions:(id)a3 didChangeGuidanceLevel:(unint64_t)a4 transportType:(int)a5
{
  if (self->_transportType == a5) {
    [(MNAudioHardwareEngine *)self _updateForNewGuidanceLevel];
  }
}

- (void)audioSystemOptions:(id)a3 didUpdateUseHFP:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(MNAudioHardwareEngine *)self pathwayAccess];
  [v5 setEnableHFPUse:v4];
}

- (void)audioSystemOptions:(id)a3 didUpdatePauseSpokenAudio:(BOOL)a4
{
  id v5 = [(MNAudioHardwareEngine *)self sessionAccess];
  [v5 updatePropertiesWithOptions:self->_options transportType:self->_transportType error:0];
}

- (void)soundEffectResourceController:(id)a3 didFinishPlayingIndicator:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    int v9 = "-[MNAudioHardwareEngine soundEffectResourceController:didFinishPlayingIndicator:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %lu", (uint8_t *)&v8, 0x20u);
  }

  [(MNAudioHardwareEngine *)self _finishedProcessingEventWithStatus:10];
}

- (void)soundEffectResourceController:(id)a3 didFailWhilePlayingIndicator:(unint64_t)a4 withError:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315906;
    __int16 v12 = "-[MNAudioHardwareEngine soundEffectResourceController:didFailWhilePlayingIndicator:withError:]";
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %lu : %@", (uint8_t *)&v11, 0x2Au);
  }

  [(MNAudioHardwareEngine *)self _finishedProcessingEventWithStatus:6];
}

- (void)soundEffectResourceController:(id)a3 wasInterruptedWhilePlayingIndicator:(unint64_t)a4 withError:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315906;
    __int16 v12 = "-[MNAudioHardwareEngine soundEffectResourceController:wasInterruptedWhilePlayingIndicator:withError:]";
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %lu : %@", (uint8_t *)&v11, 0x2Au);
  }

  [(MNAudioHardwareEngine *)self _finishedProcessingEventWithStatus:5];
}

- (void)speechResourceController:(id)a3 willStartSpeakingUtterance:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315651;
    __int16 v10 = "-[MNAudioHardwareEngine speechResourceController:willStartSpeakingUtterance:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2113;
    id v14 = v7;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@'", (uint8_t *)&v9, 0x20u);
  }

  [(MNObserverHashTable *)self->_observers audioHardwareEngine:self didStartSpeakingPrompt:v7];
}

- (void)speechResourceController:(id)a3 didFinishSpeakingUtterance:(id)a4 withDuration:(double)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315907;
    id v12 = "-[MNAudioHardwareEngine speechResourceController:didFinishSpeakingUtterance:withDuration:]";
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2113;
    id v16 = v9;
    __int16 v17 = 2048;
    double v18 = a5;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@' : %f", (uint8_t *)&v11, 0x2Au);
  }

  [(MNAudioHardwareEngine *)self _finishedProcessingEventWithStatus:9];
}

- (void)speechResourceController:(id)a3 didFailWhileSpeakingUtterance:(id)a4 withError:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315907;
    id v14 = "-[MNAudioHardwareEngine speechResourceController:didFailWhileSpeakingUtterance:withError:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2113;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@' : %@", (uint8_t *)&v13, 0x2Au);
  }

  if ([v10 code] == 3604 || objc_msgSend(v10, "code") == 3608) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = 6;
  }
  [(MNAudioHardwareEngine *)self _finishedProcessingEventWithStatus:v12];
}

- (void)speechResourceController:(id)a3 didTimeoutWhileSpeakingUtterance:(id)a4 withError:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315906;
    int v13 = "-[MNAudioHardwareEngine speechResourceController:didTimeoutWhileSpeakingUtterance:withError:]";
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%@{private}' : %@", (uint8_t *)&v12, 0x2Au);
  }

  [(MNAudioHardwareEngine *)self _finishedProcessingEventWithStatus:7];
}

- (void)speechResourceController:(id)a3 wasInterruptedWhileSpeakingUtterance:(id)a4 withError:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315907;
    int v13 = "-[MNAudioHardwareEngine speechResourceController:wasInterruptedWhileSpeakingUtterance:withError:]";
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2113;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@' : %@", (uint8_t *)&v12, 0x2Au);
  }

  [(MNAudioHardwareEngine *)self _finishedProcessingEventWithStatus:4];
}

- (void)_mediaSessionServicesWereLost:(id)a3
{
  BOOL v4 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "ⓦ Media services were lost", v6, 2u);
  }

  [(MNAudioHardwareEngine *)self stop];
  id v5 = [(MNAudioHardwareEngine *)self pathwayAccess];
  [v5 setWantsVolumeControl:0];
}

- (void)_mediaSessionServicesWereReset:(id)a3
{
  BOOL v4 = GetAudioLogForMNAudioHardwareEngineCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "ⓦ Media services were reset", v7, 2u);
  }

  id v5 = [(MNAudioHardwareEngine *)self sessionAccess];
  [v5 updatePropertiesWithOptions:self->_options transportType:self->_transportType error:0];

  id v6 = [(MNAudioHardwareEngine *)self pathwayAccess];
  [v6 setWantsVolumeControl:1];
}

- (void)setPathwayAccess:(id)a3
{
}

- (void)setSessionAccess:(id)a3
{
}

- (void)setHapticController:(id)a3
{
}

- (void)setSfxController:(id)a3
{
}

- (void)setSpeechController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechController, 0);
  objc_storeStrong((id *)&self->_sfxController, 0);
  objc_storeStrong((id *)&self->_hapticController, 0);
  objc_storeStrong((id *)&self->_sessionAccess, 0);
  objc_storeStrong((id *)&self->_pathwayAccess, 0);
  objc_storeStrong(&self->_chimeBeforeInstructionListenerHandle, 0);
  objc_storeStrong((id *)&self->_pendingEvent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t NavigationConfig_MNAudioHardwareEngine_ChangedToAlertsOnly_Metadata_block_invoke_162()
{
  return MEMORY[0x1E4F1CC28];
}

@end