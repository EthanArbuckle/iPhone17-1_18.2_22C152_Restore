@interface TLAlertSystemSoundController
+ (id)_descriptionForAlertComponentsSuppressionFlags:(unsigned int)a3;
+ (id)_optionsForSystemSoundAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5 isDeemphasized:(BOOL)a6;
+ (id)_soundForAlert:(id)a3 toneIdentifierForDeemphasizingAlert:(id)a4;
+ (id)_toneIdentifierForDeemphasizingAlert:(id)a3;
+ (id)_vibrationIdentifierForDeemphasizingAlert:(id)a3 correspondingToneIdentifierForDeemphasizingAlert:(id)a4;
+ (id)_vibrationPatternForAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5;
+ (unsigned)_componentSuppressionFlagsForAlert:(id)a3;
+ (unsigned)_soundBehaviorForAlert:(id)a3 withSound:(id)a4 isDeemphasized:(BOOL)a5;
- ($61DF9F24A7329A1BB61181F7D05C320D)_considerDeferringPlayingAlertForBacklightStatusResolution:(id)a3 alertSystemSoundContext:(id)a4;
- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (TLAlertSystemSoundController)init;
- (id)_playTaskDescriptorForAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5 alertSystemSoundContext:(id)a6;
- (id)_prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:(id)a3 withSound:(id)a4 playbackCompletionType:(int64_t)a5;
- (id)_prepareForStoppingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (void)_beginRequiringBacklightObservationForAlert:(id)a3 alertSystemSoundContext:(id)a4;
- (void)_didCompletePlaybackForAlert:(id)a3;
- (void)_endRequiringBacklightObservationForAlert:(id)a3 alertSystemSoundContext:(id)a4;
- (void)_playAlert:(id)a3 alertSystemSoundContext:(id)a4 toneIdentifierForDeemphasizingAlert:(id)a5 vibrationIdentifierForDeemphasizingAlert:(id)a6 backlightStatusResolutionDeferralContext:(id)a7;
- (void)_preheatForAlert:(id)a3 backlightStatus:(int64_t)a4 completionHandler:(id)a5;
- (void)_processDeemphasizableAlertChangesForBackglightStatus:(int64_t)a3 stopTasksDescriptorForDeemphasizedAlerts:(id)a4 deemphasizableAlertBeginPlayingContexts:(id)a5;
- (void)_processPlayTaskDescriptors:(id)a3;
- (void)_processPlaybackCompletionContexts:(id)a3;
- (void)_processStopTasksDescriptor:(id)a3;
- (void)_removeAlert:(id)a3 alertSystemSoundContext:(id)a4 didFailToPrepareSound:(BOOL)a5 appendingPlaybackCompletionContextToArray:(id)a6;
- (void)backlightStatusDidChange:(int64_t)a3;
- (void)dealloc;
- (void)playAlert:(id)a3 withCompletionHandler:(id)a4;
- (void)preheatForAlert:(id)a3 completionHandler:(id)a4;
@end

@implementation TLAlertSystemSoundController

- (TLAlertSystemSoundController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TLAlertSystemSoundController;
  v2 = [(TLAlertSystemSoundController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[TLAudioQueue sharedAudioQueue];
    audioQueue = v2->_audioQueue;
    v2->_audioQueue = (TLAudioQueue *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
    alertSystemSoundContexts = v2->_alertSystemSoundContexts;
    v2->_alertSystemSoundContexts = (NSMapTable *)v5;

    v2->_backlightStatus = -1;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = self->_audioQueue;
  audioQueue = self->_audioQueue;
  self->_audioQueue = 0;

  [(TLAudioQueue *)v4 assertNotRunningOnAudioQueue];
  os_unfair_lock_lock(p_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_alertSystemSoundContexts;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (!v9) {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v9 addObject:v12];
      }
      uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  if ([v9 count])
  {
    v13 = [(TLAlertSystemSoundController *)self _prepareForStoppingAlerts:v9 withOptions:0 playbackCompletionType:4];
  }
  else
  {
    v13 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__TLAlertSystemSoundController_dealloc__block_invoke;
  v16[3] = &unk_1E6C20CC0;
  id v17 = v13;
  v18 = self;
  id v14 = v13;
  [(TLAudioQueue *)v4 performSynchronousTaskWithBlock:v16];

  v15.receiver = self;
  v15.super_class = (Class)TLAlertSystemSoundController;
  [(TLAlertSystemSoundController *)&v15 dealloc];
}

uint64_t __39__TLAlertSystemSoundController_dealloc__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "_processStopTasksDescriptor:");
  }
  return result;
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  uint64_t v8 = objc_alloc_init(TLAlertPlaybackCompletionContext);
  [(TLAlertPlaybackCompletionContext *)v8 setCompletionHandler:v7];

  [(TLAlertPlaybackCompletionContext *)v8 setPlaybackCompletionType:0];
  os_unfair_lock_lock(&self->_lock);
  id v9 = [v6 playbackObserver];
  uint64_t v10 = [(id)objc_opt_class() _toneIdentifierForDeemphasizingAlert:v6];
  v11 = [(id)objc_opt_class() _vibrationIdentifierForDeemphasizingAlert:v6 correspondingToneIdentifierForDeemphasizingAlert:v10];
  uint64_t v12 = objc_alloc_init(TLAlertSystemSoundContext);
  [(TLAlertSystemSoundContext *)v12 setToneIdentifierForDeemphasizingAlert:v10];
  [(TLAlertSystemSoundContext *)v12 setVibrationIdentifierForDeemphasizingAlert:v11];
  [(TLAlertSystemSoundContext *)v12 setPlaybackCompletionContext:v8];
  [(TLAlertSystemSoundContext *)v12 setPlaybackObserver:v9];
  uint64_t v13 = [(TLAlertSystemSoundController *)self _considerDeferringPlayingAlertForBacklightStatusResolution:v6 alertSystemSoundContext:v12];
  uint64_t v15 = v14;
  if ((v14 & 0x100) != 0)
  {
    [(NSMapTable *)self->_alertSystemSoundContexts setObject:v12 forKey:v6];

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    uint64_t v16 = v13;
    [(TLAlertSystemSoundContext *)v12 setLoadingSound:1];
    [(NSMapTable *)self->_alertSystemSoundContexts setObject:v12 forKey:v6];

    os_unfair_lock_unlock(&self->_lock);
    audioQueue = self->_audioQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__TLAlertSystemSoundController_playAlert_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E6C21AA8;
    v18[4] = self;
    id v19 = v6;
    long long v20 = v12;
    id v21 = v10;
    id v22 = v11;
    uint64_t v23 = v16;
    uint64_t v24 = v15;
    [(TLAudioQueue *)audioQueue performTaskWithBlock:v18];
  }
}

uint64_t __64__TLAlertSystemSoundController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playAlert:alertSystemSoundContext:toneIdentifierForDeemphasizingAlert:vibrationIdentifierForDeemphasizingAlert:backlightStatusResolutionDeferralContext:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
}

- (void)_playAlert:(id)a3 alertSystemSoundContext:(id)a4 toneIdentifierForDeemphasizingAlert:(id)a5 vibrationIdentifierForDeemphasizingAlert:(id)a6 backlightStatusResolutionDeferralContext:(id)a7
{
  BOOL var1 = a7.var1;
  int64_t var0 = a7.var0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v17 = objc_opt_class();
  int v18 = var1 && var0 == 1;
  if (var1 && var0 == 1) {
    id v19 = v16;
  }
  else {
    id v19 = 0;
  }
  long long v20 = [v17 _soundForAlert:v13 toneIdentifierForDeemphasizingAlert:v19];

  id v31 = v15;
  if (v18 == 1)
  {
    id v21 = v15;
  }
  else
  {
    objc_msgSend(v13, "vibrationIdentifier", v15);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v22 = v21;
  int v23 = objc_msgSend(v20, "isValid", v31);
  uint64_t v24 = TLLogPlayback();
  v25 = v24;
  if (!v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v35 = self;
      __int16 v36 = 2114;
      id v37 = v13;
      __int16 v38 = 2114;
      v39 = v20;
      _os_log_error_impl(&dword_1DB936000, v25, OS_LOG_TYPE_ERROR, "%{public}@: _playAlert:(%{public}@) […]. Failed to begin playback with invalid sound: %{public}@.", buf, 0x20u);
    }

    os_unfair_lock_lock(&self->_lock);
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TLAlertSystemSoundController *)self _removeAlert:v13 alertSystemSoundContext:v14 didFailToPrepareSound:1 appendingPlaybackCompletionContextToArray:v27];
    [v14 setLoadingSound:0];
    v29 = 0;
    v28 = 0;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v35 = self;
    __int16 v36 = 2114;
    id v37 = v13;
    __int16 v38 = 2114;
    v39 = v20;
    _os_log_impl(&dword_1DB936000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: _playAlert:(%{public}@) […]. Sound: %{public}@.", buf, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (([v14 isBeingInterrupted] & 1) == 0)
  {
    [v14 setSound:v20];
    [v14 setVibrationIdentifier:v22];
    [v14 setDeemphasized:v18 & 1];
    [v14 setLoadingSound:0];
    if (var1) {
      [(TLAlertSystemSoundController *)self _beginRequiringBacklightObservationForAlert:v13 alertSystemSoundContext:v14];
    }
    v29 = [(TLAlertSystemSoundController *)self _prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:v13 withSound:v20 playbackCompletionType:4];
    v28 = [(TLAlertSystemSoundController *)self _playTaskDescriptorForAlert:v13 withSound:v20 vibrationIdentifier:v22 alertSystemSoundContext:v14];
    id v27 = 0;
LABEL_20:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_21;
  }
  [v14 setLoadingSound:0];
  os_unfair_lock_unlock(&self->_lock);
  v26 = TLLogPlayback();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v35 = self;
    __int16 v36 = 2114;
    id v37 = v13;
    _os_log_impl(&dword_1DB936000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: _playAlert:(%{public}@) […]. Aborting playback because this alert is already being interrupted.", buf, 0x16u);
  }

  id v27 = 0;
  v28 = 0;
  v29 = 0;
LABEL_21:
  if ([v27 count]) {
    [(TLAlertSystemSoundController *)self _processPlaybackCompletionContexts:v27];
  }
  if (v29) {
    [(TLAlertSystemSoundController *)self _processStopTasksDescriptor:v29];
  }
  if (v28)
  {
    v33 = v28;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    [(TLAlertSystemSoundController *)self _processPlayTaskDescriptors:v30];
  }
}

- ($61DF9F24A7329A1BB61181F7D05C320D)_considerDeferringPlayingAlertForBacklightStatusResolution:(id)a3 alertSystemSoundContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  int64_t backlightStatus = self->_backlightStatus;
  id v9 = [v7 toneIdentifierForDeemphasizingAlert];
  uint64_t v10 = [v9 length];

  uint64_t v11 = 0;
  if (v10 && backlightStatus == -1)
  {
    uint64_t v12 = TLLogPlayback();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: _considerDeferringPlayingAlertForBacklightStatusResolution:(%{public}@) […]. Deemphasizing this alert is allowed but the backlight status is unknown. Deferring until the backlight status is known.", (uint8_t *)&v15, 0x16u);
    }

    [(TLAlertSystemSoundController *)self _beginRequiringBacklightObservationForAlert:v6 alertSystemSoundContext:v7];
    uint64_t v11 = 256;
  }

  uint64_t v13 = v11 | (v10 != 0);
  int64_t v14 = backlightStatus;
  result.BOOL var1 = v13;
  result.var2 = BYTE1(v13);
  result.int64_t var0 = v14;
  return result;
}

- (id)_playTaskDescriptorForAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5 alertSystemSoundContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v14 = v10;
  if ([v10 hasPlaybackStarted])
  {
    if ([v10 isDeemphasized])
    {
      if ([v10 hasDeemphasizedPlaybackStarted]) {
        id v14 = 0;
      }
      else {
        id v14 = v10;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  int v15 = -[TLAlertSystemSoundPlayTaskDescriptor initWithAlert:sound:vibrationIdentifier:isDeemphasized:alertSystemSoundContext:]([TLAlertSystemSoundPlayTaskDescriptor alloc], "initWithAlert:sound:vibrationIdentifier:isDeemphasized:alertSystemSoundContext:", v13, v12, v11, [v10 isDeemphasized], v14);

  return v15;
}

- (void)_processPlayTaskDescriptors:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v45 = self;
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v46 = 0;
    uint64_t v43 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v63 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v9 = [v8 alert];
        id v10 = [v8 sound];
        id v11 = [v8 vibrationIdentifier];
        uint64_t v12 = [v8 isDeemphasized];
        [v10 beginRequiringUnderlyingSoundLoaded];
        id v13 = [v8 alertSystemSoundContext];
        if (v13)
        {
          id v14 = v46;
          if (!v46) {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v46 = v14;
          [v14 addObject:v8];
        }
        unsigned int v15 = [v10 soundID];
        id v16 = [(id)objc_opt_class() _optionsForSystemSoundAlert:v9 withSound:v10 vibrationIdentifier:v11 isDeemphasized:v12];
        __int16 v17 = TLLogPlayback();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v69 = self;
          __int16 v70 = 2114;
          v71 = v9;
          __int16 v72 = 2048;
          uint64_t v73 = v15;
          _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:(%{public}@). Calling AudioServicesPlaySystemSoundWithOptions for soundID: %lu.", buf, 0x20u);
        }

        uint64_t v55 = MEMORY[0x1E4F143A8];
        uint64_t v56 = 3221225472;
        v57 = __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke;
        v58 = &unk_1E6C21AD0;
        v59 = self;
        v60 = v9;
        unsigned int v61 = v15;
        id v18 = v9;
        AudioServicesPlaySystemSoundWithOptions();
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v6);
  }
  else
  {
    v46 = 0;
  }

  uint64_t v19 = v46;
  if ([v46 count])
  {
    os_unfair_lock_lock(lock);
    long long v54 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v51 = 0u;
    id v20 = v46;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v67 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v44 = 0;
      id v23 = 0;
      uint64_t v24 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          id v27 = [v26 alertSystemSoundContext];
          if (([v27 hasPlaybackStarted] & 1) == 0)
          {
            [v27 setHasPlaybackStarted:1];
            v28 = [v27 playbackObserver];
            if (objc_opt_respondsToSelector())
            {
              if (!v23) {
                id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v23 addObject:v26];
            }
          }
          if ([v27 isDeemphasized])
          {
            if (([v27 hasDeemphasizedPlaybackStarted] & 1) == 0)
            {
              [v27 setHasDeemphasizedPlaybackStarted:1];
              if ([v27 shouldBeInterruptedAfterDeemphasizedPlaybackStarts])
              {
                id v29 = v20;
                id v30 = v23;
                id v31 = [v26 alert];
                v32 = TLLogPlayback();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v69 = v45;
                  __int16 v70 = 2114;
                  v71 = v31;
                  _os_log_impl(&dword_1DB936000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:. Preparing for deferred interruption of %{public}@.", buf, 0x16u);
                }

                v33 = [v27 playbackCompletionContext];
                uint64_t v34 = [v33 playbackCompletionType];

                v35 = [v27 stoppingOptionsForDeferredInterruption];
                v66 = v31;
                __int16 v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
                id v37 = [(TLAlertSystemSoundController *)v45 _prepareForStoppingAlerts:v36 withOptions:v35 playbackCompletionType:v34];

                id v23 = v30;
                if (v37)
                {
                  id v38 = v44;
                  if (!v44) {
                    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  v44 = v38;
                  [v38 addObject:v37];
                }
                id v20 = v29;
                [v27 setStoppingOptionsForDeferredInterruption:0];
                [v27 setShouldBeInterruptedAfterDeemphasizedPlaybackStarts:0];
              }
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v67 count:16];
      }
      while (v22);
    }
    else
    {
      v44 = 0;
      id v23 = 0;
    }

    os_unfair_lock_unlock(lock);
    if ([v23 count])
    {
      v39 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_11;
      block[3] = &unk_1E6C20D60;
      id v50 = v23;
      dispatch_async(v39, block);
    }
    if ([v44 count])
    {
      audioQueue = v45->_audioQueue;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_2;
      v47[3] = &unk_1E6C20CC0;
      v47[4] = v45;
      id v48 = v44;
      [(TLAudioQueue *)audioQueue performSynchronousTaskWithOptions:1 block:v47];
    }
    uint64_t v19 = v46;
  }
}

uint64_t __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TLLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1DB936000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:(%{public}@). Running completion block for AudioServicesPlaySystemSoundWithOptions for soundID: %lu.", (uint8_t *)&v7, 0x20u);
  }

  return [*(id *)(a1 + 32) _didCompletePlaybackForAlert:*(void *)(a1 + 40)];
}

void __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_11(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        int v7 = objc_msgSend(v6, "alert", (void)v10);
        uint64_t v8 = [v6 alertSystemSoundContext];
        __int16 v9 = [v8 playbackObserver];
        [v9 alertDidBeginPlaying:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

void __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TLLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1DB936000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:. Processing deferred interruptions.", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 32), "_processStopTasksDescriptor:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  long long v11 = [(TLAlertSystemSoundController *)self _prepareForStoppingAlerts:v10 withOptions:v9 playbackCompletionType:a5];

  os_unfair_lock_unlock(p_lock);
  long long v12 = [v11 interruptedAlertsToSound];
  uint64_t v13 = [v12 count];

  if (v11)
  {
    audioQueue = self->_audioQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__TLAlertSystemSoundController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
    v16[3] = &unk_1E6C20CC0;
    void v16[4] = self;
    id v17 = v11;
    [(TLAudioQueue *)audioQueue performTaskWithBlock:v16];
  }
  return v13 != 0;
}

uint64_t __85__TLAlertSystemSoundController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processStopTasksDescriptor:*(void *)(a1 + 40)];
}

- (id)_prepareForStoppingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v10 = [v8 count];
  long long v11 = TLLogPlayback();
  int64_t v31 = a5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 == 1) {
      long long v12 = "";
    }
    else {
      long long v12 = "s";
    }
    uint64_t v13 = NSStringFromTLAlertPlaybackCompletionType(v31);
    *(_DWORD *)buf = 138544386;
    v41 = self;
    __int16 v42 = 2048;
    uint64_t v43 = v10;
    __int16 v44 = 2082;
    v45 = (void *)v12;
    a5 = v31;
    __int16 v46 = 2114;
    id v47 = v9;
    __int16 v48 = 2112;
    v49 = v13;
    _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts:([%lu alert%{public}s]) withOptions:(%{public}@) playbackCompletionType:(%@)", buf, 0x34u);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v32 = 0;
    v33 = 0;
    uint64_t v16 = *(void *)v36;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v19 = -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", v18, v31);
        id v20 = v19;
        if (v19)
        {
          if ([v19 isDeemphasized]
            && ![v20 hasDeemphasizedPlaybackStarted])
          {
            uint64_t v21 = [v20 playbackCompletionContext];
            [v21 setPlaybackCompletionType:a5];
            [v20 setStoppingOptionsForDeferredInterruption:v9];
            [v20 setShouldBeInterruptedAfterDeemphasizedPlaybackStarts:1];
            id v23 = TLLogPlayback();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v41 = self;
              __int16 v42 = 2114;
              uint64_t v43 = v18;
              __int16 v44 = 2114;
              v45 = v20;
              _os_log_impl(&dword_1DB936000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: Deferring stop request for %{public}@ with system sound context: %{public}@. Will process stop request after deemphasized playback starts.", buf, 0x20u);
            }
            goto LABEL_34;
          }
          if (![v20 isBeingInterrupted]) {
            goto LABEL_17;
          }
          if ([v20 isBeingDeemphasized])
          {
            [v20 setBeingDeemphasized:0];
LABEL_17:
            uint64_t v21 = [v20 playbackCompletionContext];
            [v21 setPlaybackCompletionType:a5];
            [v20 setBeingInterrupted:1];
            uint64_t v22 = TLLogPlayback();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v41 = self;
              __int16 v42 = 2114;
              uint64_t v43 = v18;
              __int16 v44 = 2114;
              v45 = v20;
              _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: Beginning interruption of %{public}@ with system sound context: %{public}@.", buf, 0x20u);
            }

            id v23 = [v20 sound];
            if (v23)
            {
              uint64_t v24 = v33;
              if (!v33) {
                uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
              }
              v33 = v24;
              [v24 setObject:v23 forKey:v18];
            }
            else
            {
              id v25 = v9;
              v26 = TLLogPlayback();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v41 = self;
                __int16 v42 = 2114;
                uint64_t v43 = v18;
                __int16 v44 = 2114;
                v45 = v21;
                _os_log_impl(&dword_1DB936000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: %{public}@ didn't even get a chance to begin playing. Merely processing playback completion context: %{public}@.", buf, 0x20u);
              }

              id v9 = v25;
              if (v21)
              {
                id v27 = v32;
                if (!v32) {
                  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                v32 = v27;
                [(TLAlertSystemSoundController *)self _removeAlert:v18 alertSystemSoundContext:v20 didFailToPrepareSound:0 appendingPlaybackCompletionContextToArray:v27];
              }
              a5 = v31;
            }
LABEL_34:

            goto LABEL_35;
          }
        }
        uint64_t v21 = TLLogPlayback();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v41 = self;
          __int16 v42 = 2114;
          uint64_t v43 = v18;
          __int16 v44 = 2114;
          v45 = v20;
          _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: Ignoring stop request for %{public}@ with system sound context: %{public}@.", buf, 0x20u);
        }
LABEL_35:
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v15) {
        goto LABEL_39;
      }
    }
  }
  v32 = 0;
  v33 = 0;
LABEL_39:

  if ([v33 count] || objc_msgSend(v32, "count"))
  {
    v28 = objc_alloc_init(TLAlertSystemSoundStopTasksDescriptor);
    [(TLAlertSystemSoundStopTasksDescriptor *)v28 setInterruptedAlertsToSound:v33];
    id v29 = v32;
    [(TLAlertSystemSoundStopTasksDescriptor *)v28 setPlaybackCompletionContextsToProcess:v32];
    [(TLAlertSystemSoundStopTasksDescriptor *)v28 setOptions:v9];
    [(TLAlertSystemSoundStopTasksDescriptor *)v28 setPlaybackCompletionType:a5];
  }
  else
  {
    v28 = 0;
    id v29 = v32;
  }

  return v28;
}

- (void)_processStopTasksDescriptor:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  uint64_t v21 = self;
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  uint64_t v5 = [v4 options];
  unint64_t v20 = [v4 playbackCompletionType];
  uint64_t v18 = v4;
  uint64_t v6 = [v4 interruptedAlertsToSound];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = [v6 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v22)
  {
    uint64_t v7 = *(void *)v24;
    uint64_t v19 = v6;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [v6 objectForKey:v9];
        unsigned int v11 = [v10 soundID];
        if (v5) {
          int v12 = [v5 shouldWaitUntilEndOfCurrentRepetition];
        }
        else {
          int v12 = 0;
        }
        uint64_t v13 = TLLogPlayback();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertPlaybackCompletionType(v20);
          uint64_t v14 = v5;
          v16 = uint64_t v15 = v7;
          *(_DWORD *)buf = 138544386;
          v28 = v21;
          __int16 v29 = 2114;
          id v30 = v16;
          __int16 v31 = 2048;
          uint64_t v32 = v11;
          __int16 v33 = 1024;
          int v34 = v12 ^ 1;
          __int16 v35 = 2114;
          uint64_t v36 = v9;
          _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: _processStopTasksDescriptor:. playbackCompletionType: %{public}@. Calling AudioServicesStopSystemSound for soundID: %lu with inStopNow = %{BOOL}d for alert %{public}@.", buf, 0x30u);

          uint64_t v7 = v15;
          uint64_t v5 = v14;
          uint64_t v6 = v19;
        }

        AudioServicesStopSystemSound();
      }
      uint64_t v22 = [v6 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v22);
  }
  id v17 = [v18 playbackCompletionContextsToProcess];
  [(TLAlertSystemSoundController *)v21 _processPlaybackCompletionContexts:v17];
}

- (id)_prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:(id)a3 withSound:(id)a4 playbackCompletionType:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v9 = [v7 configuration];
  char v10 = [v9 shouldRepeat];
  __int16 v29 = v9;
  int v11 = [v9 isForPreview];
  id v30 = v8;
  int v34 = [v8 soundID];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  __int16 v35 = self;
  obuint64_t j = self->_alertSystemSoundContexts;
  uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v12)
  {
    id v14 = 0;
    goto LABEL_24;
  }
  uint64_t v13 = v12;
  id v14 = 0;
  uint64_t v15 = *(void *)v37;
  char v33 = v10 ^ 1;
  int v16 = v11 ^ 1;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(id *)(*((void *)&v36 + 1) + 8 * i);
      if (v18 != v7)
      {
        uint64_t v19 = [(NSMapTable *)v35->_alertSystemSoundContexts objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        unint64_t v20 = [v19 sound];
        int v21 = [v20 soundID];

        int v22 = v21 == v34;
        if (v21 == v34) {
          char v23 = 1;
        }
        else {
          char v23 = v33;
        }
        if ((v23 & 1) == 0)
        {
          long long v24 = [v18 configuration];
          int v22 = [v24 shouldRepeat];
        }
        if ((v22 | v16))
        {
          if (!v22) {
            goto LABEL_19;
          }
        }
        else
        {
          long long v25 = [v18 configuration];
          char v26 = [v25 isForPreview];

          if ((v26 & 1) == 0)
          {
LABEL_19:

            continue;
          }
        }
        if (!v14) {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v14 addObject:v18];
        goto LABEL_19;
      }
    }
    uint64_t v13 = [(NSMapTable *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v13);
LABEL_24:

  id v27 = [(TLAlertSystemSoundController *)v35 _prepareForStoppingAlerts:v14 withOptions:0 playbackCompletionType:a5];

  return v27;
}

- (void)preheatForAlert:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  int64_t backlightStatus = self->_backlightStatus;
  os_unfair_lock_unlock(&self->_lock);
  audioQueue = self->_audioQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__TLAlertSystemSoundController_preheatForAlert_completionHandler___block_invoke;
  v12[3] = &unk_1E6C21AF8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  int64_t v15 = backlightStatus;
  id v10 = v7;
  id v11 = v6;
  [(TLAudioQueue *)audioQueue performTaskWithBlock:v12];
}

uint64_t __66__TLAlertSystemSoundController_preheatForAlert_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preheatForAlert:*(void *)(a1 + 40) backlightStatus:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)_preheatForAlert:(id)a3 backlightStatus:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v10 = [(id)objc_opt_class() _toneIdentifierForDeemphasizingAlert:v8];
  uint64_t v11 = [v10 length];
  uint64_t v12 = objc_opt_class();
  if (v11) {
    BOOL v13 = a4 == 1;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13) {
    id v14 = v10;
  }
  else {
    id v14 = 0;
  }
  int64_t v15 = [v12 _soundForAlert:v8 toneIdentifierForDeemphasizingAlert:v14];
  unsigned int v16 = [v15 soundID];
  char v17 = [v15 isValid];
  id v18 = TLLogPlayback();
  uint64_t v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v27 = self;
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2114;
      __int16 v31 = v15;
      __int16 v32 = 2048;
      uint64_t v33 = v16;
      _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: _preheatForAlert:(%{public}@). Pre-heating succeeded with sound: %{public}@ and soundID: %lu.", buf, 0x2Au);
    }

    unint64_t v20 = 0;
    if (!v9) {
      goto LABEL_16;
    }
LABEL_15:
    int v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__TLAlertSystemSoundController__preheatForAlert_backlightStatus_completionHandler___block_invoke;
    block[3] = &unk_1E6C21B20;
    id v24 = v9;
    BOOL v25 = v20 == 0;
    id v23 = v20;
    dispatch_async(v21, block);

    goto LABEL_16;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544130;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2114;
    __int16 v31 = v15;
    __int16 v32 = 2048;
    uint64_t v33 = v16;
    _os_log_error_impl(&dword_1DB936000, v19, OS_LOG_TYPE_ERROR, "%{public}@: _preheatForAlert:(%{public}@). Pre-heating failed with sound: %{public}@ and soundID: %lu.", buf, 0x2Au);
  }

  unint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "tl_errorWithDomain:description:", @"TLAlertErrorDomain", @"Failed to pre-heat alert %@.", v8);
  if (v9) {
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __83__TLAlertSystemSoundController__preheatForAlert_backlightStatus_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (id)_soundForAlert:(id)a3 toneIdentifierForDeemphasizingAlert:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 configuration];
  id v8 = [v7 externalToneFileURL];
  if (v8)
  {
    id v9 = [TLSystemSound alloc];
    id v10 = [(TLSystemSound *)v9 initWithSoundFileURL:v8 soundID:kSystemSoundID_InvalidTone requiresLongFormPlayback:0];
    goto LABEL_16;
  }
  uint64_t v11 = [v5 toneIdentifier];
  if ([v6 length])
  {
    id v12 = v6;

    uint64_t v11 = v12;
  }
  int v13 = [v7 isForPreview];
  id v14 = +[TLToneManager sharedToneManager];
  int64_t v15 = v14;
  if (v13) {
    [v14 _previewSoundForToneIdentifier:v11];
  }
  else {
  id v10 = [v14 _soundForToneIdentifier:v11];
  }

  if (!v10 || (unsigned int v16 = [(TLSystemSound *)v10 soundID], v16 == kSystemSoundID_NoneTone))
  {
    char v17 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    int v18 = [v17 hasVibratorCapability];

    if (v18)
    {
      uint64_t v19 = [v7 externalVibrationPattern];
      if (v19
        || ([v7 externalVibrationPatternFileURL],
            (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        int v22 = [v5 vibrationIdentifier];
        char v23 = [v22 isEqualToString:@"<none>"];

        if (v23) {
          goto LABEL_15;
        }
      }
      unint64_t v20 = [[TLSystemSound alloc] initWithSoundFileURL:0 soundID:4095 requiresLongFormPlayback:0];

      id v10 = v20;
    }
  }
LABEL_15:

LABEL_16:

  return v10;
}

+ (id)_toneIdentifierForDeemphasizingAlert:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configuration];
  if ([v4 isForPreview])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = +[TLToneManager sharedToneManager];
    uint64_t v7 = [v3 type];
    id v8 = [v4 topic];
    id v9 = [v3 toneIdentifier];
    id v5 = [v6 _toneIdentifierForDeemphasizingAlertWithType:v7 topic:v8 regularToneIdentifier:v9];
  }

  return v5;
}

+ (id)_vibrationIdentifierForDeemphasizingAlert:(id)a3 correspondingToneIdentifierForDeemphasizingAlert:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    uint64_t v7 = [v6 configuration];
    id v8 = +[TLVibrationManager sharedVibrationManager];
    id v9 = [v6 vibrationIdentifier];
    uint64_t v10 = [v6 type];

    uint64_t v11 = [v7 topic];
    id v12 = objc_msgSend(v8, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:", v9, v10, v11, objc_msgSend(v7, "targetDevice"), v5, 0);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (unsigned)_soundBehaviorForAlert:(id)a3 withSound:(id)a4 isDeemphasized:(BOOL)a5
{
  id v6 = a4;
  uint64_t v7 = [a3 configuration];
  uint64_t v8 = [v7 type];
  if ([v7 isForPreview])
  {
    if ((unint64_t)(v8 - 4) >= 9)
    {
      int v10 = 1307;
LABEL_7:
      if (v8 == 13)
      {
        if ([v6 requiresLongFormPlayback]) {
          unsigned int v9 = 1403;
        }
        else {
          unsigned int v9 = v10;
        }
      }
      else
      {
        unsigned int v9 = v10;
      }
    }
    else
    {
      unsigned int v9 = dword_1DB982818[v8 - 4];
    }
  }
  else
  {
    int v10 = 1;
    unsigned int v9 = 0;
    switch(v8)
    {
      case 1:
      case 28:
        break;
      case 2:
        uint64_t v11 = [v7 topic];
        int v12 = [v11 isEqualToString:@"TLAlertTopicTextMessageInConversation"];

        if (v12) {
          unsigned int v9 = 1003;
        }
        else {
          unsigned int v9 = 1007;
        }
        break;
      case 3:
        unsigned int v9 = 1003;
        break;
      case 5:
        unsigned int v9 = 1000;
        break;
      case 6:
      case 7:
      case 8:
      case 9:
        unsigned int v9 = 1001;
        break;
      case 10:
        unsigned int v9 = 1005;
        break;
      case 11:
        unsigned int v9 = 1017;
        break;
      case 12:
        unsigned int v9 = 1007;
        break;
      default:
        goto LABEL_7;
    }
  }

  return v9;
}

+ (id)_vibrationPatternForAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  int v9 = [v8 hasVibratorCapability];

  if (v9)
  {
    int v10 = [v6 configuration];
    uint64_t v11 = [v10 externalVibrationPattern];
    if (!v11)
    {
      int v12 = [v10 externalVibrationPatternFileURL];
      if (v12)
      {
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v12];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    BOOL v13 = +[TLAlertPlaybackPolicy shouldRepeatVibrationForAlert:v6 withPlaybackBackend:1];
    if (v13 && v11)
    {
      id v14 = [[TLVibrationPattern alloc] initWithPropertyListRepresentation:v11];
      uint64_t v15 = [(TLVibrationPattern *)v14 _artificiallyRepeatingPropertyListRepresentation];

      uint64_t v11 = (void *)v15;
    }
    if (!v11)
    {
      if ([v7 isEqualToString:@"Built-In-System-Sound-ID-Vibration"])
      {
        uint64_t v11 = 0;
      }
      else
      {
        unsigned int v16 = +[TLVibrationManager sharedVibrationManager];
        uint64_t v11 = [v16 patternForVibrationWithIdentifier:v7 repeating:v13];
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (unsigned)_componentSuppressionFlagsForAlert:(id)a3
{
  id v3 = a3;
  id v4 = [v3 toneIdentifier];
  unsigned int v5 = [v4 isEqualToString:@"<none>"];

  id v6 = [v3 vibrationIdentifier];

  LODWORD(v3) = [v6 isEqualToString:@"<none>"];
  if (v3) {
    return v5 | 2;
  }
  else {
    return v5;
  }
}

+ (id)_descriptionForAlertComponentsSuppressionFlags:(unsigned int)a3
{
  if (a3)
  {
    unsigned int v5 = @"kAudioServicesFlag_SuppressAudio";
    if ((a3 & 2) != 0)
    {
      unsigned int v5 = [NSString stringWithFormat:@"%@ | %@", @"kAudioServicesFlag_SuppressAudio", @"kAudioServicesFlag_SuppressVibe", v3];
    }
  }
  else if ((a3 & 2) != 0)
  {
    unsigned int v5 = @"kAudioServicesFlag_SuppressVibe";
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5;
}

+ (id)_optionsForSystemSoundAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5 isDeemphasized:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = [v10 configuration];
  uint64_t v15 = [(id)objc_opt_class() _soundBehaviorForAlert:v10 withSound:v11 isDeemphasized:v6];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = TLLogPlayback();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138544130;
      id v42 = a1;
      __int16 v43 = 2114;
      id v44 = v10;
      __int16 v45 = 2114;
      id v46 = v11;
      __int16 v47 = 2048;
      *(void *)&double v48 = v16;
      _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionBehaviorKey => %lu.", (uint8_t *)&v41, 0x2Au);
    }

    int v18 = [NSNumber numberWithUnsignedInt:v16];
    [v13 setObject:v18 forKey:*MEMORY[0x1E4F18A18]];
  }
  uint64_t v19 = [(id)objc_opt_class() _componentSuppressionFlagsForAlert:v10];
  if (!v19) {
    goto LABEL_9;
  }
  uint64_t v20 = v19;
  int v21 = TLLogPlayback();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    double v22 = [a1 _descriptionForAlertComponentsSuppressionFlags:v20];
    int v41 = 138544130;
    id v42 = a1;
    __int16 v43 = 2114;
    id v44 = v10;
    __int16 v45 = 2114;
    id v46 = v11;
    __int16 v47 = 2114;
    double v48 = v22;
    _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionFlagsKey => %{public}@.", (uint8_t *)&v41, 0x2Au);
  }
  char v23 = [NSNumber numberWithUnsignedInt:v20];
  [v13 setObject:v23 forKey:*MEMORY[0x1E4F18A20]];

  if ((v20 & 2) == 0)
  {
LABEL_9:
    uint64_t v24 = [(id)objc_opt_class() _vibrationPatternForAlert:v10 withSound:v11 vibrationIdentifier:v12];
    if (v24)
    {
      BOOL v25 = (void *)v24;
      char v26 = TLLogPlayback();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 138543874;
        id v42 = a1;
        __int16 v43 = 2114;
        id v44 = v10;
        __int16 v45 = 2114;
        id v46 = v11;
        _os_log_impl(&dword_1DB936000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionVibrationPatternKey => non-nil.", (uint8_t *)&v41, 0x20u);
      }

      [v13 setObject:v25 forKey:*MEMORY[0x1E4F18A48]];
    }
  }
  if ([v14 shouldRepeat])
  {
    id v27 = TLLogPlayback();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138543874;
      id v42 = a1;
      __int16 v43 = 2114;
      id v44 = v10;
      __int16 v45 = 2114;
      id v46 = v11;
      _os_log_impl(&dword_1DB936000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionLoopKey => true.", (uint8_t *)&v41, 0x20u);
    }

    [v13 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F18A30]];
  }
  __int16 v28 = +[TLToneManager sharedToneManager];
  id v29 = [v10 toneIdentifier];
  [v28 _unduckTimeForToneIdentifier:v29];
  double v31 = v30;

  if (llround(v31 * 8388608.0) != llround(0.0))
  {
    __int16 v32 = TLLogPlayback();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138544130;
      id v42 = a1;
      __int16 v43 = 2114;
      id v44 = v10;
      __int16 v45 = 2114;
      id v46 = v11;
      __int16 v47 = 2048;
      double v48 = v31;
      _os_log_impl(&dword_1DB936000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionUnduckTimeKey => %.3f.", (uint8_t *)&v41, 0x2Au);
    }

    uint64_t v33 = [NSNumber numberWithDouble:v31];
    [v13 setObject:v33 forKey:*MEMORY[0x1E4F18A40]];
  }
  if ([v14 _hasCustomAudioVolume])
  {
    uint64_t v34 = TLLogPlayback();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      [v14 audioVolume];
      int v41 = 138544130;
      id v42 = a1;
      __int16 v43 = 2114;
      id v44 = v10;
      __int16 v45 = 2114;
      id v46 = v11;
      __int16 v47 = 2048;
      double v48 = v35;
      _os_log_impl(&dword_1DB936000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionVolumeKey => %f.", (uint8_t *)&v41, 0x2Au);
    }

    long long v36 = NSNumber;
    [v14 audioVolume];
    long long v37 = objc_msgSend(v36, "numberWithFloat:");
    [v13 setObject:v37 forKey:*MEMORY[0x1E4F18A50]];
  }
  if (([v14 shouldIgnoreRingerSwitch] & 1) != 0 || objc_msgSend(v14, "isForPreview"))
  {
    long long v38 = TLLogPlayback();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138543874;
      id v42 = a1;
      __int16 v43 = 2114;
      id v44 = v10;
      __int16 v45 = 2114;
      id v46 = v11;
      _os_log_impl(&dword_1DB936000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionIgnoreRingerSwitchKey => true.", (uint8_t *)&v41, 0x20u);
    }

    [v13 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F18A28]];
  }
  if ([v14 prefersToDisallowExternalPlayback])
  {
    long long v39 = TLLogPlayback();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138543874;
      id v42 = a1;
      __int16 v43 = 2114;
      id v44 = v10;
      __int16 v45 = 2114;
      id v46 = v11;
      _os_log_impl(&dword_1DB936000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionPrefersToDisallowExternalPlaybackKey => true.", (uint8_t *)&v41, 0x20u);
    }

    [v13 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F18A38]];
  }

  return v13;
}

- (void)_didCompletePlaybackForAlert:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = [(NSMapTable *)self->_alertSystemSoundContexts objectForKey:v4];
  uint64_t v7 = [v6 sound];
  [v6 setSound:0];
  [v6 setVibrationIdentifier:0];
  uint64_t v8 = TLLogPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v4 debugDescription];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v49 = (uint64_t (*)(uint64_t, uint64_t))v7;
    LOWORD(v50) = 2114;
    *(void *)((char *)&v50 + 2) = v6;
    _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _didCompletePlaybackForAlert:(%{public}@). Removed sound %{public}@ from %{public}@.", buf, 0x2Au);
  }
  id v10 = [v6 playbackCompletionContext];
  if (v10)
  {
    id v11 = [v6 toneIdentifierForDeemphasizingAlert];
    id v12 = [v6 vibrationIdentifierForDeemphasizingAlert];
    if ([v11 length] && objc_msgSend(v6, "isBeingDeemphasized"))
    {
      [v6 setLoadingSound:1];
      int v13 = 1;
      goto LABEL_10;
    }
    [(TLAlertSystemSoundController *)self _removeAlert:v4 alertSystemSoundContext:v6 didFailToPrepareSound:0 appendingPlaybackCompletionContextToArray:v5];
  }
  else
  {
    id v12 = 0;
    id v11 = 0;
  }
  int v13 = 0;
LABEL_10:

  os_unfair_lock_unlock(&self->_lock);
  if (!v13)
  {
    uint64_t v18 = 0;
    goto LABEL_21;
  }
  uint64_t v22 = v7;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__3;
  *(void *)&long long v50 = __Block_byref_object_dispose__3;
  *((void *)&v50 + 1) = 0;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  float v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__3;
  long long v38 = __Block_byref_object_dispose__3;
  id v39 = 0;
  audioQueue = self->_audioQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke;
  v27[3] = &unk_1E6C21B48;
  double v31 = buf;
  v27[4] = self;
  id v15 = v4;
  id v28 = v15;
  id v29 = v11;
  __int16 v32 = &v40;
  uint64_t v33 = &v34;
  id v30 = v12;
  [(TLAudioQueue *)audioQueue performSynchronousTaskWithOptions:1 block:v27];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v16 = [(NSMapTable *)self->_alertSystemSoundContexts objectForKey:v15];
  char v17 = v16;
  if (!v16)
  {
    uint64_t v19 = TLLogPlayback();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v15 debugDescription];
      *(_DWORD *)id v44 = 138543618;
      __int16 v45 = self;
      __int16 v46 = 2114;
      __int16 v47 = v20;
      _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: _didCompletePlaybackForAlert:(%{public}@). System sound context for this alert has already been removed. This likely indicates that the alert was stopped programmatically around the time we were trying to load the deemphasized sound. Aborting deemphasizing process immediately.", v44, 0x16u);
    }
    goto LABEL_19;
  }
  if (!*((unsigned char *)v41 + 24))
  {
    [(TLAlertSystemSoundController *)self _removeAlert:v15 alertSystemSoundContext:v16 didFailToPrepareSound:1 appendingPlaybackCompletionContextToArray:v5];
    [v17 setLoadingSound:0];
LABEL_19:
    uint64_t v18 = 0;
    goto LABEL_20;
  }
  [v16 setSound:*(void *)(*(void *)&buf[8] + 40)];
  [v17 setVibrationIdentifier:v35[5]];
  [v17 setLoadingSound:0];
  [v17 setBeingDeemphasized:0];
  [v17 setBeingInterrupted:0];
  [v17 setDeemphasized:1];
  uint64_t v18 = [(TLAlertSystemSoundController *)self _playTaskDescriptorForAlert:v15 withSound:*(void *)(*(void *)&buf[8] + 40) vibrationIdentifier:v35[5] alertSystemSoundContext:v17];
LABEL_20:

  os_unfair_lock_unlock(&self->_lock);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(buf, 8);

LABEL_21:
  if (v7 | v18)
  {
    int v21 = self->_audioQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke_39;
    v23[3] = &unk_1E6C213D0;
    id v24 = (id)v7;
    id v25 = (id)v18;
    char v26 = self;
    [(TLAudioQueue *)v21 performSynchronousTaskWithOptions:1 block:v23];
  }
  if (objc_msgSend(v5, "count", v22)) {
    [(TLAlertSystemSoundController *)self _processPlaybackCompletionContexts:v5];
  }
}

void __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() _soundForAlert:*(void *)(a1 + 40) toneIdentifierForDeemphasizingAlert:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isValid];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 56));
  id v5 = TLLogPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) debugDescription];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    int v10 = 138544130;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    int v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: _didCompletePlaybackForAlert:(%{public}@). About to begin playing deemphasized sound: %{public}@ and vibration identifier: %{public}@.", (uint8_t *)&v10, 0x2Au);
  }
}

void __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke_39(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    [v2 endRequiringUnderlyingSoundLoaded];
  }
  uint64_t v3 = a1[5];
  if (v3)
  {
    id v4 = (void *)a1[6];
    v6[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v4 _processPlayTaskDescriptors:v5];
  }
}

- (void)_processPlaybackCompletionContexts:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if ([v4 count])
  {
    id v5 = [(TLAlertSystemSoundController *)self description];
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__TLAlertSystemSoundController__processPlaybackCompletionContexts___block_invoke;
    v8[3] = &unk_1E6C20CC0;
    id v9 = v4;
    id v10 = v5;
    id v7 = v5;
    dispatch_async(v6, v8);
  }
}

void __67__TLAlertSystemSoundController__processPlaybackCompletionContexts___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v8 = TLLogPlayback();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v9 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            uint64_t v18 = v9;
            __int16 v19 = 2114;
            uint64_t v20 = v7;
            _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_processPlaybackCompletionContexts: […]: Processing %{public}@.", buf, 0x16u);
          }

          uint64_t v10 = [v7 playbackCompletionType];
          uint64_t v11 = [v7 error];
          __int16 v12 = [v7 completionHandler];
          if (v12)
          {
            [v7 setCompletionHandler:0];
            ((void (**)(void, uint64_t, void *))v12)[2](v12, v10, v11);
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v4);
    }
  }
}

- (void)_removeAlert:(id)a3 alertSystemSoundContext:(id)a4 didFailToPrepareSound:(BOOL)a5 appendingPlaybackCompletionContextToArray:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v13 = [v11 playbackCompletionContext];
  long long v14 = v13;
  if (v7)
  {
    [v13 setPlaybackCompletionType:5];
    long long v15 = objc_msgSend(MEMORY[0x1E4F28C58], "tl_errorWithDomain:description:", @"TLAlertErrorDomain", @"Failed to prepare tone sound ID for playback.");
    [v14 setError:v15];
  }
  long long v16 = TLLogPlayback();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138544130;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 1024;
    BOOL v24 = v7;
    _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeAlert:(%{public}@) alertSystemSoundContext:(%{public}@) didFailToPrepareSound:(%{BOOL}u)…", (uint8_t *)&v17, 0x26u);
  }

  [(TLAlertSystemSoundController *)self _endRequiringBacklightObservationForAlert:v10 alertSystemSoundContext:v11];
  [(NSMapTable *)self->_alertSystemSoundContexts removeObjectForKey:v10];
  if (v14)
  {
    [v11 setPlaybackCompletionContext:0];
    [v12 addObject:v14];
  }
}

- (void)_beginRequiringBacklightObservationForAlert:(id)a3 alertSystemSoundContext:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v7 isRequiringBacklightObservation])
  {
    uint64_t v8 = TLLogGeneral();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/SystemSound/TLAlertSystemSoundController.m"];
      id v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v10 lastPathComponent];
        long long v13 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v26 = 136381443;
        id v27 = (TLAlertSystemSoundController *)"-[TLAlertSystemSoundController _beginRequiringBacklightObservationForAlert"
                                              ":alertSystemSoundContext:]";
        __int16 v28 = 2113;
        id v29 = v12;
        __int16 v30 = 2049;
        uint64_t v31 = 1233;
        __int16 v32 = 2113;
        unint64_t v33 = (unint64_t)v13;
        _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v26, 0x2Au);
      }
    }
    else
    {
      id v10 = TLLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[TLToneManager _migrateLegacyToneSettings];
      }
    }

    __int16 v21 = TLLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[TLAlertSystemSoundController _beginRequiringBacklightObservationForAlert:alertSystemSoundContext:]((uint64_t)v6, (uint64_t)v7, v21);
    }
  }
  [v7 setRequiringBacklightObservation:1];
  unint64_t backlightObservationRequestsCount = self->_backlightObservationRequestsCount;
  self->_unint64_t backlightObservationRequestsCount = backlightObservationRequestsCount + 1;
  __int16 v23 = TLLogPlayback();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v24 = self->_backlightObservationRequestsCount;
    int v26 = 138544386;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v6;
    __int16 v30 = 2114;
    uint64_t v31 = (uint64_t)v7;
    __int16 v32 = 2048;
    unint64_t v33 = backlightObservationRequestsCount;
    __int16 v34 = 2048;
    unint64_t v35 = v24;
    _os_log_impl(&dword_1DB936000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginRequiringBacklightObservationForAlert:(%{public}@) alertSystemSoundContext:(%{public}@); reques"
      "ts count incremented from %lu to %lu.",
      (uint8_t *)&v26,
      0x34u);
  }

  if (self->_backlightObservationRequestsCount == 1)
  {
    uint64_t v25 = +[TLBacklight sharedBacklight];
    [v25 addObserver:self];
  }
}

- (void)_endRequiringBacklightObservationForAlert:(id)a3 alertSystemSoundContext:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v7 isRequiringBacklightObservation])
  {
    [v7 setRequiringBacklightObservation:0];
    unint64_t backlightObservationRequestsCount = self->_backlightObservationRequestsCount;
    if (!backlightObservationRequestsCount)
    {
      BOOL v9 = TLLogGeneral();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

      if (v10)
      {
        id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/SystemSound/TLAlertSystemSoundController.m"];
        id v12 = TLLogGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          long long v13 = [v11 lastPathComponent];
          uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v33 = 136381443;
          __int16 v34 = (TLAlertSystemSoundController *)"-[TLAlertSystemSoundController _endRequiringBacklightObservationForAlert"
                                                ":alertSystemSoundContext:]";
          __int16 v35 = 2113;
          id v36 = v13;
          __int16 v37 = 2049;
          uint64_t v38 = 1251;
          __int16 v39 = 2113;
          unint64_t v40 = (unint64_t)v14;
          _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v33, 0x2Au);
        }
      }
      else
      {
        id v11 = TLLogGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          +[TLToneManager _migrateLegacyToneSettings];
        }
      }

      id v22 = TLLogGeneral();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[TLAlertSystemSoundController _endRequiringBacklightObservationForAlert:alertSystemSoundContext:](v22, v23, v24, v25, v26, v27, v28, v29);
      }

      unint64_t backlightObservationRequestsCount = self->_backlightObservationRequestsCount;
    }
    self->_unint64_t backlightObservationRequestsCount = backlightObservationRequestsCount - 1;
    __int16 v30 = TLLogPlayback();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v31 = self->_backlightObservationRequestsCount;
      int v33 = 138544386;
      __int16 v34 = self;
      __int16 v35 = 2114;
      id v36 = v6;
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v7;
      __int16 v39 = 2048;
      unint64_t v40 = backlightObservationRequestsCount;
      __int16 v41 = 2048;
      unint64_t v42 = v31;
      _os_log_impl(&dword_1DB936000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endRequiringBacklightObservationForAlert:(%{public}@) alertSystemSoundContext:(%{public}@); reques"
        "ts count incremented from %lu to %lu.",
        (uint8_t *)&v33,
        0x34u);
    }

    if (!self->_backlightObservationRequestsCount)
    {
      __int16 v32 = +[TLBacklight sharedBacklight];
      [v32 removeObserver:self];

      self->_int64_t backlightStatus = -1;
    }
  }
}

- (void)backlightStatusDidChange:(int64_t)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t backlightStatus = self->_backlightStatus;
  int64_t v47 = a3;
  if (backlightStatus == a3 || (self->_int64_t backlightStatus = a3, a3 == -1))
  {
    os_unfair_lock_unlock(p_lock);
    uint64_t v25 = 0;
    char v26 = 0;
    goto LABEL_34;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = self->_alertSystemSoundContexts;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int64_t v40 = backlightStatus;
    __int16 v41 = p_lock;
    uint64_t v43 = 0;
    char v45 = 0;
    id v46 = 0;
    uint64_t v10 = *(void *)v58;
    if (v47 == 1) {
      id v11 = @"on";
    }
    else {
      id v11 = @"off";
    }
    id v44 = v11;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v14 = -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", v13, v40);
        uint64_t v15 = [v14 toneIdentifierForDeemphasizingAlert];
        uint64_t v16 = [v14 vibrationIdentifierForDeemphasizingAlert];
        if ([v15 length])
        {
          uint64_t v17 = [v14 sound];

          if (v17)
          {
            if (v47 == 1
              && ([v14 isBeingDeemphasized] & 1) == 0
              && ([v14 isDeemphasized] & 1) == 0
              && ([v14 isBeingInterrupted] & 1) == 0)
            {
              uint64_t v18 = TLLogPlayback();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v42 = [v13 debugDescription];
                *(_DWORD *)buf = 138543874;
                long long v63 = self;
                __int16 v64 = 2114;
                long long v65 = @"on";
                __int16 v66 = 2114;
                v67 = v42;
                _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: backlightStatusDidChange:(%{public}@). Backlight was turned on. Deemphasizing: %{public}@.", buf, 0x20u);
              }
              [v14 setBeingDeemphasized:1];
              id v19 = v43;
              if (!v43) {
                id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              uint64_t v43 = v19;
              [v19 addObject:v13];
            }
          }
          else if ([v14 isLoadingSound])
          {
            uint64_t v20 = TLLogPlayback();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = [v13 debugDescription];
              *(_DWORD *)buf = 138544130;
              long long v63 = self;
              __int16 v64 = 2114;
              long long v65 = v44;
              __int16 v66 = 2114;
              v67 = v21;
              __int16 v68 = 2114;
              v69 = v14;
              _os_log_impl(&dword_1DB936000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: backlightStatusDidChange:(%{public}@). Backlight was turned on, but we are still loading the regular sound for %{public}@ with context %{public}@. Deferring application of updated backlight status.", buf, 0x2Au);
            }
            char v45 = 1;
          }
          else
          {
            [v14 setLoadingSound:1];
            id v22 = [[TLDeemphasizableAlertSystemSoundBeginPlayingContext alloc] initWithAlert:v13 alertSystemSoundContext:v14 toneIdentifierForDeemphasizingAlert:v15 vibrationIdentifierForDeemphasizingAlert:v16];
            id v23 = v46;
            if (!v46) {
              id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            id v46 = v23;
            [v23 addObject:v22];
          }
        }
      }
      uint64_t v9 = [(NSMapTable *)v7 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v9);

    if (v45)
    {
      self->_int64_t backlightStatus = v40;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      __int16 v30 = v43;
      uint64_t v32 = [(TLAlertStoppingOptions *)v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v54 != v34) {
              objc_enumerationMutation(v30);
            }
            id v36 = [(NSMapTable *)self->_alertSystemSoundContexts objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * j)];
            [v36 setBeingDeemphasized:0];
          }
          uint64_t v33 = [(TLAlertStoppingOptions *)v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v33);
      }

      [(TLAlertStoppingOptions *)v30 removeAllObjects];
      unint64_t v31 = 0;
      id v29 = 0;
      char v26 = 1;
      p_os_unfair_lock_t lock = v41;
      goto LABEL_48;
    }
    p_os_unfair_lock_t lock = v41;
    uint64_t v24 = v43;
  }
  else
  {

    id v46 = 0;
    uint64_t v24 = 0;
  }
  if ([v24 count])
  {
    __int16 v30 = objc_alloc_init(TLAlertStoppingOptions);
    [(TLAlertStoppingOptions *)v30 setShouldWaitUntilEndOfCurrentRepetition:1];
    unint64_t v31 = v24;
    id v29 = [(TLAlertSystemSoundController *)self _prepareForStoppingAlerts:v24 withOptions:v30 playbackCompletionType:0];
    char v26 = 0;
LABEL_48:

    goto LABEL_50;
  }
  unint64_t v31 = v24;
  char v26 = 0;
  id v29 = 0;
LABEL_50:

  os_unfair_lock_unlock(p_lock);
  uint64_t v25 = v46;
  if (v29)
  {
LABEL_51:
    audioQueue = self->_audioQueue;
    uint64_t v38 = v25;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __57__TLAlertSystemSoundController_backlightStatusDidChange___block_invoke;
    v48[3] = &unk_1E6C21B70;
    v48[4] = self;
    int64_t v51 = v47;
    id v29 = v29;
    id v49 = v29;
    id v39 = v38;
    id v50 = v39;
    char v52 = v26;
    [(TLAudioQueue *)audioQueue performTaskWithBlock:v48];

    uint64_t v25 = v39;
    goto LABEL_52;
  }
LABEL_34:
  uint64_t v27 = v25;
  uint64_t v28 = [v25 count];
  id v29 = 0;
  uint64_t v25 = v27;
  if ((v26 & 1) != 0 || v28) {
    goto LABEL_51;
  }
LABEL_52:
}

uint64_t __57__TLAlertSystemSoundController_backlightStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _processDeemphasizableAlertChangesForBackglightStatus:*(void *)(a1 + 56) stopTasksDescriptorForDeemphasizedAlerts:*(void *)(a1 + 40) deemphasizableAlertBeginPlayingContexts:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = TLLogPlayback();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = @"off";
      if (*(void *)(a1 + 56) == 1) {
        uint64_t v5 = @"on";
      }
      int v6 = 138543618;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: backlightStatusDidChange:(%{public}@). Triggering delayed application of updated backlight status.", (uint8_t *)&v6, 0x16u);
    }

    return [*(id *)(a1 + 32) backlightStatusDidChange:*(void *)(a1 + 56)];
  }
  return result;
}

- (void)_processDeemphasizableAlertChangesForBackglightStatus:(int64_t)a3 stopTasksDescriptorForDeemphasizedAlerts:(id)a4 deemphasizableAlertBeginPlayingContexts:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    uint64_t v10 = [v7 playbackCompletionContextsToProcess];
    if ([v10 count])
    {
      [v9 addObjectsFromArray:v10];
      [v7 setPlaybackCompletionContextsToProcess:0];
    }
    [(TLAlertSystemSoundController *)self _processStopTasksDescriptor:v7];
  }
  id v11 = (void *)[v8 count];
  if (!v11)
  {
    long long v57 = 0;
    goto LABEL_52;
  }
  long long v54 = v9;
  id v50 = v8;
  id v51 = v7;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v70 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v17 = [v16 alert];
        uint64_t v18 = [v16 toneIdentifierForDeemphasizingAlert];
        id v19 = [v16 vibrationIdentifierForDeemphasizingAlert];
        uint64_t v20 = objc_opt_class();
        if (a3 == 1) {
          uint64_t v21 = v18;
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = [v20 _soundForAlert:v17 toneIdentifierForDeemphasizingAlert:v21];
        if (a3 == 1)
        {
          id v23 = v19;
        }
        else
        {
          id v23 = [v17 vibrationIdentifier];
        }
        uint64_t v24 = v23;
        if ([v22 isValid])
        {
          [v16 setSound:v22];
          [v16 setVibrationIdentifier:v24];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
    }
    while (v13);
  }

  os_unfair_lock_lock(lock);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v55 = obj;
  uint64_t v25 = [v55 countByEnumeratingWithState:&v65 objects:v84 count:16];
  if (!v25)
  {
    long long v57 = 0;
    id v53 = 0;
    goto LABEL_51;
  }
  uint64_t v26 = v25;
  id v53 = 0;
  long long v57 = 0;
  id obja = *(id *)v66;
  uint64_t v27 = @"off";
  if (a3 == 1) {
    uint64_t v27 = @"on";
  }
  long long v56 = v27;
  do
  {
    for (uint64_t j = 0; j != v26; ++j)
    {
      if (*(id *)v66 != obja) {
        objc_enumerationMutation(v55);
      }
      id v29 = *(void **)(*((void *)&v65 + 1) + 8 * j);
      __int16 v30 = [v29 alert];
      unint64_t v31 = [v29 alertSystemSoundContext];
      uint64_t v32 = [v29 sound];
      uint64_t v33 = [v29 vibrationIdentifier];
      uint64_t v34 = TLLogPlayback();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v35 = [v30 debugDescription];
        *(_DWORD *)buf = 138544386;
        uint64_t v75 = self;
        __int16 v76 = 2114;
        v77 = v56;
        __int16 v78 = 2114;
        v79 = v35;
        __int16 v80 = 2114;
        v81 = v32;
        __int16 v82 = 2114;
        v83 = v33;
        _os_log_impl(&dword_1DB936000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: _processDeemphasizableAlertChanges…:(%{public}@). About to begin playing alert %{public}@ with sound: %{public}@ and vibration identifier: %{public}@.", buf, 0x34u);
      }
      if (!v32)
      {
        [(TLAlertSystemSoundController *)self _removeAlert:v30 alertSystemSoundContext:v31 didFailToPrepareSound:1 appendingPlaybackCompletionContextToArray:v54];
LABEL_45:
        [v31 setLoadingSound:0];
        goto LABEL_46;
      }
      id v36 = [(NSMapTable *)self->_alertSystemSoundContexts objectForKey:v30];

      if (!v36)
      {
        uint64_t v43 = TLLogPlayback();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          uint64_t v75 = self;
          __int16 v76 = 2114;
          v77 = v56;
          __int16 v78 = 2114;
          v79 = v30;
          __int16 v80 = 2114;
          v81 = v31;
          _os_log_impl(&dword_1DB936000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: _processDeemphasizableAlertChanges…:(%{public}@). Alert %{public}@ for %{public}@ has already been removed. Aborting.", buf, 0x2Au);
        }

        goto LABEL_45;
      }
      [v31 setSound:v32];
      [v31 setVibrationIdentifier:v33];
      [v31 setLoadingSound:0];
      [v31 setDeemphasized:a3 == 1];
      __int16 v37 = [(TLAlertSystemSoundController *)self _prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:v30 withSound:v32 playbackCompletionType:4];
      uint64_t v38 = v37;
      if (v37)
      {
        id v39 = [v37 playbackCompletionContextsToProcess];
        if ([v39 count])
        {
          [v54 addObjectsFromArray:v39];
          [v38 setPlaybackCompletionContextsToProcess:0];
        }
        id v40 = v53;
        if (!v53) {
          id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        id v53 = v40;
        [v40 addObject:v38];
      }
      __int16 v41 = [(TLAlertSystemSoundController *)self _playTaskDescriptorForAlert:v30 withSound:v32 vibrationIdentifier:v33 alertSystemSoundContext:v31];
      id v42 = v57;
      if (!v57) {
        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      long long v57 = v42;
      [v42 addObject:v41];

LABEL_46:
    }
    uint64_t v26 = [v55 countByEnumeratingWithState:&v65 objects:v84 count:16];
  }
  while (v26);
LABEL_51:

  os_unfair_lock_unlock(lock);
  id v8 = v50;
  id v7 = v51;
  id v11 = v53;
  id v9 = v54;
LABEL_52:
  id v44 = v11;
  if ([v11 count])
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v45 = v44;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v62;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v62 != v48) {
            objc_enumerationMutation(v45);
          }
          [(TLAlertSystemSoundController *)self _processStopTasksDescriptor:*(void *)(*((void *)&v61 + 1) + 8 * k)];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
      }
      while (v47);
    }
  }
  if ([v9 count]) {
    [(TLAlertSystemSoundController *)self _processPlaybackCompletionContexts:v9];
  }
  if ([v57 count]) {
    [(TLAlertSystemSoundController *)self _processPlayTaskDescriptors:v57];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSystemSoundContexts, 0);

  objc_storeStrong((id *)&self->_audioQueue, 0);
}

- (void)_beginRequiringBacklightObservationForAlert:(os_log_t)log alertSystemSoundContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DB936000, log, OS_LOG_TYPE_ERROR, "Already requiring backlight observation for %{public}@ with context %{public}@.", (uint8_t *)&v3, 0x16u);
}

- (void)_endRequiringBacklightObservationForAlert:(uint64_t)a3 alertSystemSoundContext:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end