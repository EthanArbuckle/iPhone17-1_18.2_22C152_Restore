@interface SBNCSoundController
- (AVSpeechSynthesizer)speechSynthesizer;
- (BOOL)_isDeviceUILocked;
- (BOOL)_preventVibrations;
- (BOOL)canPlaySoundForNotificationRequest:(id)a3;
- (NSMutableDictionary)playingSounds;
- (NSMutableSet)requestsRequiringExplicitKill;
- (SBLockScreenManager)lockScreenManager;
- (SBLockStateAggregator)lockStateAggregator;
- (SBNCSoundController)init;
- (SBNCSoundController)initWithLockScreenManager:(id)a3 lockStateAggregator:(id)a4;
- (id)_ambientPresentationController;
- (void)_hardwareButtonPressed:(id)a3;
- (void)_killSounds;
- (void)_lockStateChanged:(id)a3;
- (void)_playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4 completion:(id)a5;
- (void)_playSoundIfPossibleForNotificationRequest:(id)a3 presentingDestination:(id)a4 completion:(id)a5;
- (void)playSoundAndReadOutForNotificationRequest:(id)a3 presentingDestination:(id)a4;
- (void)playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4;
- (void)playSoundIfPossibleForNotificationRequest:(id)a3 presentingDestination:(id)a4;
- (void)setLockScreenManager:(id)a3;
- (void)setLockStateAggregator:(id)a3;
- (void)setPlayingSounds:(id)a3;
- (void)setRequestsRequiringExplicitKill:(id)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)stopSoundForNotificationRequest:(id)a3;
@end

@implementation SBNCSoundController

- (SBNCSoundController)init
{
  return 0;
}

- (SBNCSoundController)initWithLockScreenManager:(id)a3 lockStateAggregator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBNCSoundController;
  v9 = [(SBNCSoundController *)&v16 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    playingSounds = v9->_playingSounds;
    v9->_playingSounds = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    requestsRequiringExplicitKill = v9->_requestsRequiringExplicitKill;
    v9->_requestsRequiringExplicitKill = (NSMutableSet *)v12;

    objc_storeStrong((id *)&v9->_lockScreenManager, a3);
    objc_storeStrong((id *)&v9->_lockStateAggregator, a4);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v9 selector:sel__hardwareButtonPressed_ name:*MEMORY[0x1E4FA7A70] object:0];
    [v14 addObserver:v9 selector:sel__hardwareButtonPressed_ name:*MEMORY[0x1E4FA7A78] object:0];
    [v14 addObserver:v9 selector:sel__lockStateChanged_ name:@"SBAggregateLockStateDidChangeNotification" object:0];
  }
  return v9;
}

- (BOOL)canPlaySoundForNotificationRequest:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 sound];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = [v5 options];
  int v9 = v7 & [v8 canPlaySound];

  uint64_t v10 = [(SBNCSoundController *)self lockScreenManager];
  int v11 = v9 & ([v10 isInLostMode] ^ 1);

  if ([(SBNCSoundController *)self _isDeviceUILocked])
  {
    uint64_t v12 = [v5 options];
    v11 &= [v12 alertsWhenLocked];
  }
  v13 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    v24 = [v5 notificationIdentifier];
    v14 = objc_msgSend(v24, "un_logDigest");
    v23 = [v5 sound];
    v15 = [v5 options];
    int v16 = [v15 canPlaySound];
    v17 = [(SBNCSoundController *)self lockScreenManager];
    int v18 = [v17 isInLostMode];
    BOOL v19 = [(SBNCSoundController *)self _isDeviceUILocked];
    v20 = [v5 options];
    *(_DWORD *)buf = 138545154;
    v26 = v14;
    __int16 v27 = 1024;
    int v28 = v11;
    __int16 v29 = 1024;
    BOOL v30 = v5 != 0;
    __int16 v31 = 1024;
    BOOL v32 = v23 != 0;
    __int16 v33 = 1024;
    int v34 = v16;
    __int16 v35 = 1024;
    int v36 = v18;
    __int16 v37 = 1024;
    BOOL v38 = v19;
    __int16 v39 = 1024;
    int v40 = [v20 alertsWhenLocked];
    _os_log_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEFAULT, "Sound can be played for notification %{public}@: %d [ hasRequest: %d hasSound: %d canPlaySound: %d isInLostMode: %d isDeviceUILocked: %d alertsWhenLocked: %d ]", buf, 0x36u);
  }
  return v11;
}

- (void)playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
}

- (void)_playSoundForNotificationRequest:(id)a3 presentingDestination:(id)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a5;
  if (v8 && ([v8 sound], int v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    uint64_t v12 = [(SBNCSoundController *)self playingSounds];
    v13 = [v8 notificationIdentifier];
    v14 = [v12 objectForKey:v13];

    if (v14)
    {
      v15 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = v15;
        v17 = [v8 notificationIdentifier];
        int v18 = objc_msgSend(v17, "un_logDigest");
        *(_DWORD *)buf = 138543362;
        v45 = v18;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Already playing sound for notification %{public}@", buf, 0xCu);
      }
      if (v10) {
        v10[2](v10, 1);
      }
    }
    else
    {
      BOOL v19 = [v8 sound];
      v20 = [v19 alertConfiguration];
      v21 = (void *)[v20 copy];

      if ([(SBNCSoundController *)self _preventVibrations]) {
        [v21 setVibrationIdentifier:*MEMORY[0x1E4FAF640]];
      }
      v22 = [MEMORY[0x1E4FAF5E0] alertWithConfiguration:v21];
      v23 = (void *)[objc_alloc(MEMORY[0x1E4FA79C8]) initWithToneAlert:v22];
      v24 = (void *)*MEMORY[0x1E4FB3750];
      BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v25)
        {
          v26 = v24;
          __int16 v27 = [v8 notificationIdentifier];
          int v28 = objc_msgSend(v27, "un_logDigest");
          *(_DWORD *)buf = 138543618;
          v45 = v28;
          __int16 v46 = 2114;
          v47 = v22;
          _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Play sound for notification %{public}@ : %{public}@", buf, 0x16u);
        }
        if ([v9 isEqualToString:*MEMORY[0x1E4FB3850]]) {
          uint64_t v29 = 3;
        }
        else {
          uint64_t v29 = 1;
        }
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __89__SBNCSoundController__playSoundForNotificationRequest_presentingDestination_completion___block_invoke;
        v41[3] = &unk_1E6AF5FC8;
        v41[4] = self;
        id v30 = v8;
        id v42 = v30;
        __int16 v31 = v10;
        v43 = v31;
        if ([v23 playInEvironments:v29 completion:v41])
        {
          playingSounds = self->_playingSounds;
          uint64_t v33 = [v30 notificationIdentifier];
          [(NSMutableDictionary *)playingSounds setObject:v23 forKey:v33];

          int v34 = [v30 options];
          LOBYTE(v33) = [v34 silencedByMenuButtonPress];

          if ((v33 & 1) == 0)
          {
            __int16 v35 = [(SBNCSoundController *)self requestsRequiringExplicitKill];
            int v36 = [v30 notificationIdentifier];
            [v35 addObject:v36];
          }
        }
        else if (v31)
        {
          v31[2](v31, 0);
        }
      }
      else
      {
        if (v25)
        {
          __int16 v37 = v24;
          BOOL v38 = [v8 notificationIdentifier];
          __int16 v39 = objc_msgSend(v38, "un_logDigest");
          int v40 = [v8 sound];
          *(_DWORD *)buf = 138543618;
          v45 = v39;
          __int16 v46 = 2112;
          v47 = v40;
          _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_DEFAULT, "cannot play sound for notification (failed to create SBUISound) %{public}@ : ncSound=%@", buf, 0x16u);
        }
        if (v10) {
          v10[2](v10, 0);
        }
      }
    }
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }
}

uint64_t __89__SBNCSoundController__playSoundForNotificationRequest_presentingDestination_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playingSounds];
  v3 = [*(id *)(a1 + 40) notificationIdentifier];
  [v2 removeObjectForKey:v3];

  id v4 = [*(id *)(a1 + 32) requestsRequiringExplicitKill];
  v5 = [*(id *)(a1 + 40) notificationIdentifier];
  [v4 removeObject:v5];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)playSoundIfPossibleForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
}

- (void)_playSoundIfPossibleForNotificationRequest:(id)a3 presentingDestination:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if ([(SBNCSoundController *)self canPlaySoundForNotificationRequest:v8])
  {
    int v11 = [v8 alertOptions];
    int v12 = [v11 shouldSuppress];

    if (!v12)
    {
      [(SBNCSoundController *)self _playSoundForNotificationRequest:v8 presentingDestination:v9 completion:v10];
      goto LABEL_8;
    }
    v13 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = [v8 notificationIdentifier];
      int v16 = objc_msgSend(v15, "un_logDigest");
      int v17 = 138543362;
      int v18 = v16;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Sound cannot be played for notification %{public}@ because DND suppressed it", (uint8_t *)&v17, 0xCu);
    }
  }
  if (v10) {
    v10[2](v10, 0);
  }
LABEL_8:
}

- (void)playSoundAndReadOutForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__SBNCSoundController_playSoundAndReadOutForNotificationRequest_presentingDestination___block_invoke;
  v9[3] = &unk_1E6AF7920;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [(SBNCSoundController *)self _playSoundIfPossibleForNotificationRequest:v8 presentingDestination:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __87__SBNCSoundController_playSoundAndReadOutForNotificationRequest_presentingDestination___block_invoke(uint64_t a1, char a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      v5 = [*(id *)(a1 + 32) sound];

      if (v5)
      {
        id v6 = [*(id *)(a1 + 32) options];
        id v7 = [v6 speechLanguage];

        if ([v7 length])
        {
          id v8 = [*(id *)(a1 + 32) content];
          id v9 = [v8 title];

          id v10 = [*(id *)(a1 + 32) content];
          id v11 = [v10 subtitle];

          int v12 = [*(id *)(a1 + 32) content];
          v13 = [v12 message];

          v14 = [MEMORY[0x1E4F28E78] string];
          if ([v9 length]) {
            [v14 appendString:v9];
          }
          if ([v11 length])
          {
            if ([v14 length]) {
              [v14 appendString:@", "];
            }
            [v14 appendString:v11];
          }
          if ([v13 length])
          {
            if ([v14 length]) {
              [v14 appendString:@", "];
            }
            [v14 appendString:v13];
          }
          if ([v14 length])
          {
            v15 = (void *)*MEMORY[0x1E4FB3750];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
            {
              int v16 = *(void **)(a1 + 32);
              int v17 = v15;
              int v18 = [v16 notificationIdentifier];
              uint64_t v19 = objc_msgSend(v18, "un_logDigest");
              int v23 = 138543618;
              v24 = v19;
              __int16 v25 = 2114;
              v26 = v7;
              _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Read out notification %{public}@ in language %{public}@", (uint8_t *)&v23, 0x16u);
            }
            v20 = [MEMORY[0x1E4F15498] speechUtteranceWithString:v14];
            v21 = [MEMORY[0x1E4F15478] voiceWithLanguage:v7];
            [v20 setVoice:v21];

            v22 = [WeakRetained speechSynthesizer];
            [v22 speakUtterance:v20];
          }
        }
      }
    }
  }
}

- (void)stopSoundForNotificationRequest:(id)a3
{
  id v9 = a3;
  id v4 = [(SBNCSoundController *)self playingSounds];
  v5 = [v9 notificationIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    [v6 stop];
    id v7 = [(SBNCSoundController *)self playingSounds];
    id v8 = [v9 notificationIdentifier];
    [v7 removeObjectForKey:v8];
  }
}

- (void)_killSounds
{
  v3 = [(SBNCSoundController *)self playingSounds];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(SBNCSoundController *)self playingSounds];
    id v10 = (id)[v5 mutableCopy];

    id v6 = [(SBNCSoundController *)self requestsRequiringExplicitKill];
    id v7 = [v6 allObjects];
    [v10 removeObjectsForKeys:v7];

    [v10 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_404];
    id v8 = [(SBNCSoundController *)self playingSounds];
    id v9 = [v10 allKeys];
    [v8 removeObjectsForKeys:v9];
  }
}

uint64_t __34__SBNCSoundController__killSounds__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 stop];
}

- (BOOL)_isDeviceUILocked
{
  v2 = [(SBNCSoundController *)self lockStateAggregator];
  char v3 = [v2 hasAnyLockState];

  return v3;
}

- (void)_hardwareButtonPressed:(id)a3
{
  id v4 = [a3 name];
  if ([(SBNCSoundController *)self _isDeviceUILocked]
    && (([v4 isEqualToString:*MEMORY[0x1E4FA7A78]] & 1) != 0
     || [v4 isEqualToString:*MEMORY[0x1E4FA7A70]]))
  {
    [(SBNCSoundController *)self _killSounds];
  }
}

- (void)_lockStateChanged:(id)a3
{
  if (![(SBLockScreenManager *)self->_lockScreenManager isUILocked])
  {
    [(SBNCSoundController *)self _killSounds];
  }
}

- (BOOL)_preventVibrations
{
  v2 = [(SBNCSoundController *)self _ambientPresentationController];
  char v3 = [v2 isPresented];

  return v3;
}

- (id)_ambientPresentationController
{
  v2 = [(id)SBApp windowSceneManager];
  char v3 = [v2 activeDisplayWindowScene];
  id v4 = [v3 ambientPresentationController];

  return v4;
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    id v4 = (AVSpeechSynthesizer *)objc_alloc_init(MEMORY[0x1E4F15488]);
    v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    [(AVSpeechSynthesizer *)self->_speechSynthesizer setIsInternalSynth:1];
    [(AVSpeechSynthesizer *)self->_speechSynthesizer setUsesApplicationAudioSession:0];
    speechSynthesizer = self->_speechSynthesizer;
  }
  return speechSynthesizer;
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
}

- (SBLockStateAggregator)lockStateAggregator
{
  return self->_lockStateAggregator;
}

- (void)setLockStateAggregator:(id)a3
{
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (NSMutableDictionary)playingSounds
{
  return self->_playingSounds;
}

- (void)setPlayingSounds:(id)a3
{
}

- (NSMutableSet)requestsRequiringExplicitKill
{
  return self->_requestsRequiringExplicitKill;
}

- (void)setRequestsRequiringExplicitKill:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsRequiringExplicitKill, 0);
  objc_storeStrong((id *)&self->_playingSounds, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end