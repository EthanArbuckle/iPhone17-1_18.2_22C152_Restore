@interface TLAlertQueuePlayerController
+ ($96EE1C12479E9B303E9C2794B92A11A2)_externalEnvironmentValuesForAlert:(id)a3;
+ (BOOL)_prefersToPlayDuringWombatForAlert:(id)a3;
+ (BOOL)_shouldApplyAttentionAwarenessEffectsForAlert:(id)a3;
+ (BOOL)_shouldApplyStandardDelayAndAudioVolumeRampForAlert:(id)a3 externalEnvironmentValues:(id)a4;
+ (BOOL)_shouldBypassRingerSwitchPolicyForAlert:(id)a3;
+ (BOOL)_shouldEnsureActiveAudioSessionWhenStartingPlaybackForAlert:(id)a3;
+ (BOOL)_shouldHandleAudioSessionActivationForAlert:(id)a3;
+ (BOOL)_shouldRepeatVibrationForAlert:(id)a3 externalEnvironmentValues:(id)a4;
+ (BOOL)_shouldUseAuxiliaryAudioSessionForAlert:(id)a3;
+ (BOOL)_shouldVibrateForAlert:(id)a3;
+ (double)_audioPlaybackInitiationDelayForAlert:(id)a3 externalEnvironmentValues:(id)a4;
+ (double)_audioVolumeRampingDurationForAlert:(id)a3 externalEnvironmentValues:(id)a4 toneAssetDuration:(double)a5;
+ (id)_audioCategoryForAlert:(id)a3 externalEnvironmentValues:(id)a4;
+ (id)_audioModeForAlert:(id)a3 audioCategory:(id)a4;
+ (id)_clientNameForAlert:(id)a3;
+ (id)_mediaExperienceAudioCategoryForAudioSessionCategory:(id)a3;
+ (id)_propertyKeysOfInterestForToneAssets;
+ (int64_t)_audioVolumeApplicationPolicyForAlert:(id)a3 externalEnvironmentValues:(id)a4;
+ (int64_t)_clientPriorityForAlert:(id)a3;
+ (unint64_t)_audioCategoryOptionsForAlert:(id)a3 externalEnvironmentValues:(id)a4;
- (BOOL)_canPlayToneAsset:(id)a3;
- (BOOL)_isPreventingAudioSessionDeactivation;
- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (NSString)description;
- (TLAlertQueuePlayerController)init;
- (float)_audioVolumeForAlert:(id)a3 audioCategory:(id)a4;
- (id)_fallbackToneIdentifierForStateDescriptor:(id)a3;
- (void)_activateAudioSessionIfNeededForStateDescriptor:(id)a3;
- (void)_applyAudioVolume:(float)a3 forAlert:(id)a4;
- (void)_beginPreventingAudioSessionDeactivation;
- (void)_createQueuePlayerIfNecessaryForStateDescriptor:(id)a3;
- (void)_deactivateAudioSessionIfNeededForStateDescriptor:(id)a3;
- (void)_destroyQueuePlayerForStateDescriptor:(id)a3;
- (void)_didEndPlayingAlertForStateDescriptor:(id)a3;
- (void)_didReceiveAttentionPollingEventOfType:(int64_t)a3 stateDescriptor:(id)a4;
- (void)_endPreventingAudioSessionDeactivationForStateDescriptor:(id)a3;
- (void)_handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4 previousStateDescriptor:(id)a5 updatedStateDescriptor:(id)a6;
- (void)_handleAudioSessionInterruptionNotification:(id)a3;
- (void)_handleAudioSessionInterruptionOfType:(unint64_t)a3 withOptions:(unint64_t)a4;
- (void)_initiateAudioPlaybackForStateDescriptor:(id)a3 audioVolumeRampingDuration:(double)a4;
- (void)_performDelayedAudioPlaybackInitiationForStateDescriptor:(id)a3 audioVolumeRampingDuration:(double)a4;
- (void)_playAlertForStateDescriptor:(id)a3 previousStateDescriptor:(id)a4;
- (void)_prepareAudioEnvironmentForStateDescriptor:(id)a3;
- (void)_queuePlayer:(id)a3 currentItemStatusWasUpdatedToValue:(int64_t)a4;
- (void)_queuePlayer:(id)a3 currentItemWasUpdatedFromValue:(id)a4;
- (void)_reloadPlaybackForStateDescriptor:(id)a3 withToneIdentifier:(id)a4;
- (void)_resetClientPriorityForStateDescriptor:(id)a3;
- (void)_resetFlagsForSwitchingAuxiliaryAudioSession;
- (void)_restoreAudioEnvironmentForStateDescriptor:(id)a3;
- (void)_startObservingAudioSessionInterruptionNotificationsForStateDescriptor:(id)a3;
- (void)_startObservingQueuePlayer;
- (void)_startPlaybackForStateDescriptor:(id)a3 usingAssetWithLoadedProperties:(id)a4 shouldConfirmAlertStillPlaying:(BOOL)a5;
- (void)_startPlaybackForStateDescriptor:(id)a3 usingConfirmedPlayableAsset:(id)a4;
- (void)_startPlaybackForStateDescriptor:(id)a3 usingConfirmedPlayableAsset:(id)a4 hasAlreadyDetectedUserAttention:(BOOL)a5;
- (void)_stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:(id)a3;
- (void)_stopObservingQueuePlayer;
- (void)_stopPlaybackForStateDescriptor:(id)a3;
- (void)_stopPlaybackForStateDescriptor:(id)a3 withOptions:(id)a4 playerWasAlreadyPausedExternally:(BOOL)a5;
- (void)_stopPlayingAlertForStateDescriptor:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (void)_willBeginPlayingAlertForStateDescriptor:(id)a3;
- (void)dealloc;
- (void)handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playAlert:(id)a3 withCompletionHandler:(id)a4;
- (void)updateAudioVolumeDynamicallyForAlert:(id)a3 toValue:(float)a4;
@end

@implementation TLAlertQueuePlayerController

- (TLAlertQueuePlayerController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TLAlertQueuePlayerController;
  v2 = [(TLAlertQueuePlayerController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[TLAudioQueue sharedAudioQueue];
    audioQueue = v2->_audioQueue;
    v2->_audioQueue = (TLAudioQueue *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  audioQueue = self->_audioQueue;
  self->_audioQueue = 0;
  v4 = audioQueue;

  [(TLAudioQueue *)v4 assertNotRunningOnAudioQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__TLAlertQueuePlayerController_dealloc__block_invoke;
  v6[3] = &unk_1E6C20D60;
  v6[4] = self;
  [(TLAudioQueue *)v4 performSynchronousTaskWithBlock:v6];

  v5.receiver = self;
  v5.super_class = (Class)TLAlertQueuePlayerController;
  [(TLAlertQueuePlayerController *)&v5 dealloc];
}

void __39__TLAlertQueuePlayerController_dealloc__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (os_unfair_lock_s *)(v2 + 16);
  id v4 = *(id *)(v2 + 24);
  os_unfair_lock_unlock(v3);
  [*(id *)(a1 + 32) _destroyQueuePlayerForStateDescriptor:v4];
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  objc_super v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  stateDescriptor = self->_stateDescriptor;
  if (stateDescriptor)
  {
    v8 = NSString;
    v9 = stateDescriptor;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v8 stringWithFormat:@"<%@: %p>", v11, v9];
  }
  else
  {
    v12 = 0;
  }
  [v6 appendFormat:@"; stateDescriptor = %@", v12];
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor playingAlert];

  if (v8 == v6)
  {
    os_unfair_lock_unlock(&self->_lock);
    v14 = 0;
    v9 = 0;
  }
  else
  {
    v9 = self->_stateDescriptor;
    v10 = [[TLAlertQueuePlayerStateDescriptor alloc] initWithPlayingAlert:v6 completionHandler:v7 previousStateDescriptor:v9];
    objc_storeStrong((id *)&self->_stateDescriptor, v10);
    v11 = TLLogPlayback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      stateDescriptor = self->_stateDescriptor;
      *(_DWORD *)buf = 138543874;
      v19 = self;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      v23 = stateDescriptor;
      _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -playAlert:(%{public}@) …: Updated _stateDescriptor to %{public}@.", buf, 0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v10)
    {
      audioQueue = self->_audioQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __64__TLAlertQueuePlayerController_playAlert_withCompletionHandler___block_invoke;
      v15[3] = &unk_1E6C213D0;
      v15[4] = self;
      v14 = v10;
      v16 = v14;
      v9 = v9;
      v17 = v9;
      [(TLAudioQueue *)audioQueue performTaskWithBlock:v15];
    }
    else
    {
      v14 = 0;
    }
  }
}

uint64_t __64__TLAlertQueuePlayerController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playAlertForStateDescriptor:*(void *)(a1 + 40) previousStateDescriptor:*(void *)(a1 + 48)];
}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (a5 == 5)
  {
    v10 = TLLogGeneral();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

    if (v11)
    {
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m"];
      v13 = TLLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v12 lastPathComponent];
        v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        v48 = (TLAlertQueuePlayerController *)"-[TLAlertQueuePlayerController stopPlayingAlerts:withOptions:playbackCompletionType:]";
        __int16 v49 = 2113;
        uint64_t v50 = (uint64_t)v14;
        __int16 v51 = 2049;
        uint64_t v52 = 235;
        __int16 v53 = 2113;
        v54 = v15;
        _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        a5 = 5;
      }
    }
    else
    {
      v12 = TLLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    v16 = TLLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TLAlertQueuePlayerController stopPlayingAlerts:withOptions:playbackCompletionType:]();
    }
  }
  v17 = TLLogPlayback();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v8 count];
    v19 = NSStringFromTLAlertPlaybackCompletionType(a5);
    *(_DWORD *)buf = 138544130;
    v48 = self;
    __int16 v49 = 2048;
    uint64_t v50 = v18;
    __int16 v51 = 2114;
    uint64_t v52 = (uint64_t)v9;
    __int16 v53 = 2114;
    v54 = v19;
    _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts:(<%lu alerts>) options:(%{public}@) playbackCompletionType:(%{public}@).", buf, 0x2Au);
  }
  int64_t v36 = a5;
  v37 = v9;

  os_unfair_lock_lock(&self->_lock);
  __int16 v20 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor playingAlert];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v21 = v8;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v21);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        p_super = TLLogPlayback();
        BOOL v29 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
        if (v27 == v20)
        {
          if (v29)
          {
            *(_DWORD *)buf = 138543618;
            v48 = self;
            __int16 v49 = 2114;
            uint64_t v50 = (uint64_t)v20;
            _os_log_impl(&dword_1DB936000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts…: %{public}@ is playing. Interrupting it.", buf, 0x16u);
          }

          p_super = &v24->super;
          uint64_t v24 = self->_stateDescriptor;
        }
        else if (v29)
        {
          *(_DWORD *)buf = 138543618;
          v48 = self;
          __int16 v49 = 2114;
          uint64_t v50 = (uint64_t)v27;
          _os_log_impl(&dword_1DB936000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts…: %{public}@ is NOT playing. Skipping it.", buf, 0x16u);
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v24 = 0;
  }

  if (v24 == self->_stateDescriptor)
  {
    v30 = [(TLAlertQueuePlayerStateDescriptor *)v24 stateDescriptorForCompletedPlayback];
    stateDescriptor = self->_stateDescriptor;
    self->_stateDescriptor = v30;

    v32 = TLLogPlayback();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor debugDescription];
      *(_DWORD *)buf = 138543618;
      v48 = self;
      __int16 v49 = 2114;
      uint64_t v50 = (uint64_t)v33;
      _os_log_impl(&dword_1DB936000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts…: Updated _stateDescriptor to %{public}@.", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  if (v24)
  {
    audioQueue = self->_audioQueue;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __85__TLAlertQueuePlayerController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
    v38[3] = &unk_1E6C21BE8;
    v38[4] = self;
    v39 = v24;
    id v40 = v37;
    int64_t v41 = v36;
    [(TLAudioQueue *)audioQueue performTaskWithBlock:v38];
  }
  return v24 != 0;
}

uint64_t __85__TLAlertQueuePlayerController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopPlayingAlertForStateDescriptor:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) playbackCompletionType:*(void *)(a1 + 56)];
}

- (void)updateAudioVolumeDynamicallyForAlert:(id)a3 toValue:(float)a4
{
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor playingAlert];

  os_unfair_lock_unlock(&self->_lock);
  if (v7 == v6)
  {
    audioQueue = self->_audioQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__TLAlertQueuePlayerController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke;
    v9[3] = &unk_1E6C21AD0;
    v9[4] = self;
    id v10 = v6;
    float v11 = a4;
    [(TLAudioQueue *)audioQueue performTaskWithBlock:v9];
  }
}

uint64_t __77__TLAlertQueuePlayerController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TLLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = *(float *)(a1 + 48);
    int v8 = 138543874;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl(&dword_1DB936000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: -updateAudioVolumeDynamicallyForAlert:(%{public}@) toValue:(%f)", (uint8_t *)&v8, 0x20u);
  }

  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) _applyAudioVolume:*(void *)(a1 + 40) forAlert:v6];
}

- (void)handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_stateDescriptor;
  int v8 = v7;
  if (v4)
  {
    id v9 = [[TLAlertQueuePlayerStateDescriptor alloc] initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:v6 previousStateDescriptor:v7];
LABEL_3:
    __int16 v10 = v9;
    goto LABEL_9;
  }
  id v11 = [(TLAlertQueuePlayerStateDescriptor *)v7 alertForAudioEnvironmentSetup];
  if (v11 == v6)
  {
    BOOL v12 = [(TLAlertQueuePlayerStateDescriptor *)v8 isAlertActivationAssertionAcquired];

    if (v12)
    {
      id v9 = [(TLAlertQueuePlayerStateDescriptor *)v8 stateDescriptorByRelinquishingActivationAssertion];
      goto LABEL_3;
    }
  }
  else
  {
  }
  __int16 v10 = 0;
LABEL_9:
  objc_storeStrong((id *)&self->_stateDescriptor, v10);
  double v13 = TLLogPlayback();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v6 debugDescription];
    stateDescriptor = self->_stateDescriptor;
    *(_DWORD *)buf = 138544130;
    v26 = self;
    __int16 v27 = 2114;
    v28 = v14;
    __int16 v29 = 1024;
    BOOL v30 = v4;
    __int16 v31 = 2114;
    v32 = stateDescriptor;
    _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -handleActivationAssertionStatusChangeForAlert:(%{public}@) updatedStatus:(%{BOOL}d): Updated _stateDescriptor to %{public}@.", buf, 0x26u);
  }
  os_unfair_lock_unlock(&self->_lock);
  audioQueue = self->_audioQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__TLAlertQueuePlayerController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke;
  v20[3] = &unk_1E6C220C0;
  v20[4] = self;
  id v21 = v6;
  BOOL v24 = v4;
  uint64_t v22 = v8;
  id v23 = v10;
  id v17 = v10;
  uint64_t v18 = v8;
  id v19 = v6;
  [(TLAudioQueue *)audioQueue performTaskWithBlock:v20];
}

uint64_t __92__TLAlertQueuePlayerController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleActivationAssertionStatusChangeForAlert:*(void *)(a1 + 40) updatedStatus:*(unsigned __int8 *)(a1 + 64) previousStateDescriptor:*(void *)(a1 + 48) updatedStateDescriptor:*(void *)(a1 + 56)];
}

- (void)_playAlertForStateDescriptor:(id)a3 previousStateDescriptor:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (char *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  int v8 = [v6 playingAlert];
  id v9 = TLLogPlayback();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543874;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertForStateDescriptor:(%{public}@) previousStateDescriptor:(%{public}@).", (uint8_t *)&v18, 0x20u);
  }

  if (self->_audioSession)
  {
    __int16 v10 = [v6 alertForAudioEnvironmentSetup];
    int v11 = [(id)objc_opt_class() _shouldUseAuxiliaryAudioSessionForAlert:v10];
    int isUsingAuxiliaryAudioSession = self->_isUsingAuxiliaryAudioSession;
    if (isUsingAuxiliaryAudioSession == v11)
    {
      [(TLAlertQueuePlayerController *)self _beginPreventingAudioSessionDeactivation];
    }
    else
    {
      uint64_t v14 = TLLogPlayback();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = "auxiliary";
        audioSession = self->_audioSession;
        int v18 = 138544130;
        if (!isUsingAuxiliaryAudioSession) {
          v15 = "shared";
        }
        id v19 = self;
        __int16 v20 = 2114;
        id v21 = v10;
        __int16 v22 = 2082;
        id v23 = v15;
        __int16 v24 = 2114;
        uint64_t v25 = audioSession;
        _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlert: Policy for picking between auxiliary and shared audio session for %{public}@ doesn't match current state. Allowing deactivation of %{public}s audio session %{public}@.", (uint8_t *)&v18, 0x2Au);
      }
    }
    [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v7];
    [v7 invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:4 error:0];
    id v17 = [v8 toneIdentifier];
    [(TLAlertQueuePlayerController *)self _reloadPlaybackForStateDescriptor:v6 withToneIdentifier:v17];

    if (isUsingAuxiliaryAudioSession == v11) {
      [(TLAlertQueuePlayerController *)self _endPreventingAudioSessionDeactivationForStateDescriptor:v6];
    }
  }
  else
  {
    [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v7];
    [v7 invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:4 error:0];
    double v13 = [v8 toneIdentifier];
    [(TLAlertQueuePlayerController *)self _reloadPlaybackForStateDescriptor:v6 withToneIdentifier:v13];
  }
}

- (void)_stopPlayingAlertForStateDescriptor:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  __int16 v10 = TLLogPlayback();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = NSStringFromTLAlertPlaybackCompletionType(a5);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    UIBackgroundTaskInvalid = v9;
    LOWORD(v31[0]) = 2114;
    *(void *)((char *)v31 + 2) = v11;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertForStateDescriptor:(%{public}@) withOptions:(%{public}@) playbackCompletionType:(%{public}@).", buf, 0x2Au);
  }
  *(void *)v32 = 0;
  *(void *)&v32[8] = v32;
  *(void *)&v32[16] = 0x2050000000;
  BOOL v12 = (void *)getUIApplicationClass_softClass_0;
  uint64_t v33 = getUIApplicationClass_softClass_0;
  if (!getUIApplicationClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getUIApplicationClass_block_invoke_0;
    UIBackgroundTaskInvalid = &unk_1E6C210C8;
    v31[0] = v32;
    __getUIApplicationClass_block_invoke_0((uint64_t)buf);
    BOOL v12 = *(void **)(*(void *)&v32[8] + 24);
  }
  id v13 = v12;
  _Block_object_dispose(v32, 8);
  uint64_t v14 = [v13 sharedApplication];
  if (v14)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    UIBackgroundTaskInvalid = 0;
    UIBackgroundTaskInvalid = (void *)getUIBackgroundTaskInvalid();
    v15 = NSString;
    v16 = [v8 playingAlert];
    id v17 = [v15 stringWithFormat:@"Stopping playing alert: %@", v16];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __103__TLAlertQueuePlayerController__stopPlayingAlertForStateDescriptor_withOptions_playbackCompletionType___block_invoke_2;
    v24[3] = &unk_1E6C220E8;
    v28 = buf;
    id v18 = v14;
    id v25 = v18;
    uint64_t v26 = self;
    id v19 = v17;
    id v27 = v19;
    __int16 v20 = (void *)MEMORY[0x1E0195470](v24);
    uint64_t v21 = [v18 beginBackgroundTaskWithName:v19 expirationHandler:v20];
    *(void *)(*(void *)&buf[8] + 24) = v21;
    __int16 v22 = TLLogPlayback();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*(void *)&buf[8] + 24);
      *(_DWORD *)v32 = 138543874;
      *(void *)&v32[4] = self;
      *(_WORD *)&v32[12] = 2114;
      *(void *)&v32[14] = v19;
      *(_WORD *)&v32[22] = 2048;
      uint64_t v33 = v23;
      _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertFor…: Began background task with name: \"%{public}@\"; identifier: %lu.",
        v32,
        0x20u);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v20 = &__block_literal_global_15;
  }
  [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v8 withOptions:v9 playerWasAlreadyPausedExternally:0];
  [v8 invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:a5 error:0];
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

void __103__TLAlertQueuePlayerController__stopPlayingAlertForStateDescriptor_withOptions_playbackCompletionType___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v2 != getUIBackgroundTaskInvalid())
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = getUIBackgroundTaskInvalid();
    [*(id *)(a1 + 32) endBackgroundTask:v3];
    BOOL v4 = TLLogPlayback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1DB936000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertFor…: Ended background task with name: \"%{public}@\"; identifier: %lu.",
        (uint8_t *)&v7,
        0x20u);
    }
  }
}

- (void)_handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4 previousStateDescriptor:(id)a5 updatedStateDescriptor:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (!v12 && v8)
  {
    uint64_t v13 = TLLogGeneral();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m"];
      v16 = TLLogGeneral();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v15 lastPathComponent];
        id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v23 = 136381443;
        __int16 v24 = (TLAlertQueuePlayerController *)"-[TLAlertQueuePlayerController _handleActivationAssertionStatusChangeForAl"
                                              "ert:updatedStatus:previousStateDescriptor:updatedStateDescriptor:]";
        __int16 v25 = 2113;
        id v26 = v17;
        __int16 v27 = 2049;
        *(void *)v28 = 382;
        *(_WORD *)&v28[8] = 2113;
        *(void *)&v28[10] = v18;
        _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v23, 0x2Au);
      }
    }
    else
    {
      v15 = TLLogGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    id v19 = TLLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[TLAlertQueuePlayerController _handleActivationAssertionStatusChangeForAlert:updatedStatus:previousStateDescriptor:updatedStateDescriptor:]();
    }
  }
  __int16 v20 = TLLogPlayback();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138544386;
    __int16 v24 = self;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 1024;
    *(_DWORD *)v28 = v8;
    *(_WORD *)&v28[4] = 2114;
    *(void *)&v28[6] = v11;
    *(_WORD *)&v28[14] = 2114;
    *(void *)&v28[16] = v12;
    _os_log_impl(&dword_1DB936000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleActivationAssertionStatusChangeForAlert:(%{public}@) updatedStatus:(%{BOOL}d) previousStateDescriptor:(%{public}@) updatedStateDescriptor:(%{public}@).", (uint8_t *)&v23, 0x30u);
  }

  if (v8)
  {
    if (self->_isAudioEnvironmentSetup) {
      [(TLAlertQueuePlayerController *)self _restoreAudioEnvironmentForStateDescriptor:v11];
    }
    [(TLAlertQueuePlayerController *)self _prepareAudioEnvironmentForStateDescriptor:v12];
  }
  else
  {
    id v21 = [v11 alertForAudioEnvironmentSetup];
    if (v21 == v10)
    {
      int v22 = [v11 isAlertActivationAssertionAcquired];

      if (v22) {
        [(TLAlertQueuePlayerController *)self _restoreAudioEnvironmentForStateDescriptor:v11];
      }
    }
    else
    {
    }
  }
}

+ (id)_propertyKeysOfInterestForToneAssets
{
  return &unk_1F35FF700;
}

- (BOOL)_canPlayToneAsset:(id)a3
{
  void (*v10)(long long *__return_ptr, uint64_t, uint64_t);
  void *v11;
  void *v12;
  uint64_t (*v13)(unsigned char *, long long *);
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v20;
  long long v21;
  uint64_t v22;
  long long v23;
  uint64_t v24;
  long long v25;
  uint64_t v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  uint64_t v32;
  void *v33;
  uint8_t v34[128];
  unsigned char buf[24];
  void *v36;
  long long *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  [(id)objc_opt_class() _propertyKeysOfInterestForToneAssets];
  uint64_t v29 = 0u;
  BOOL v30 = 0u;
  __int16 v27 = 0u;
  v28 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v5);
      }
      __int16 v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
      if ([v4 statusOfValueForKey:v9 error:0] != 2) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (!v6) {
          goto LABEL_9;
        }
        goto LABEL_3;
      }
    }
    id v18 = TLLogPlayback();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2114;
      int64_t v36 = v9;
      _os_log_error_impl(&dword_1DB936000, v18, OS_LOG_TYPE_ERROR, "%{public}@: -_canPlayToneAsset:(%{public}@). Can't play tone asset because property %{public}@ is not loaded.", buf, 0x20u);
    }

    goto LABEL_24;
  }
LABEL_9:

  __int16 v25 = 0uLL;
  id v26 = 0;
  if (v4) {
    [v4 duration];
  }
  *(void *)&__int16 v31 = 0;
  *((void *)&v31 + 1) = &v31;
  v32 = 0x2020000000;
  id v10 = (void (*)(long long *__return_ptr, uint64_t, uint64_t))getCMTimeMakeSymbolLoc_ptr;
  uint64_t v33 = getCMTimeMakeSymbolLoc_ptr;
  if (!getCMTimeMakeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCMTimeMakeSymbolLoc_block_invoke;
    int64_t v36 = &unk_1E6C210C8;
    v37 = &v31;
    id v11 = (void *)CoreMediaLibrary();
    id v12 = dlsym(v11, "CMTimeMake");
    *(void *)(*((void *)v37 + 1) + 24) = v12;
    getCMTimeMakeSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v37 + 1) + 24);
    id v10 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t))(*((void *)&v31 + 1) + 24);
  }
  _Block_object_dispose(&v31, 8);
  if (!v10)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    goto LABEL_31;
  }
  v10(&v23, 1, 100);
  id v21 = v25;
  int v22 = v26;
  *(void *)&__int16 v31 = 0;
  *((void *)&v31 + 1) = &v31;
  v32 = 0x2020000000;
  uint64_t v13 = (uint64_t (*)(unsigned char *, long long *))getCMTimeCompareSymbolLoc_ptr;
  uint64_t v33 = getCMTimeCompareSymbolLoc_ptr;
  if (!getCMTimeCompareSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCMTimeCompareSymbolLoc_block_invoke;
    int64_t v36 = &unk_1E6C210C8;
    v37 = &v31;
    BOOL v14 = (void *)CoreMediaLibrary();
    v15 = dlsym(v14, "CMTimeCompare");
    *(void *)(*((void *)v37 + 1) + 24) = v15;
    getCMTimeCompareSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v37 + 1) + 24);
    uint64_t v13 = *(uint64_t (**)(unsigned char *, long long *))(*((void *)&v31 + 1) + 24);
  }
  _Block_object_dispose(&v31, 8);
  if (!v13)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
LABEL_31:
    __break(1u);
  }
  *(_OWORD *)buf = v21;
  *(void *)&buf[16] = v22;
  __int16 v31 = v23;
  v32 = v24;
  if ((v13(buf, &v31) & 0x80000000) != 0)
  {
    __int16 v20 = TLLogPlayback();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_1DB936000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_canPlayToneAsset:(%{public}@). Can't play tone asset because its duration is too short.", buf, 0x16u);
    }

LABEL_24:
    id v17 = 0;
    goto LABEL_25;
  }
  v16 = TLLogPlayback();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_canPlayToneAsset:(%{public}@). Can play!", buf, 0x16u);
  }

  id v17 = 1;
LABEL_25:

  return v17;
}

- (void)_reloadPlaybackForStateDescriptor:(id)a3 withToneIdentifier:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (TLAlertQueuePlayerStateDescriptor *)a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  uint64_t v8 = TLLogPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v60 = v7;
    _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlaybackForStateDescriptor:(%{public}@) withToneIdentifier:(%{public}@).", buf, 0x20u);
  }

  __int16 v9 = [(TLAlertQueuePlayerStateDescriptor *)v6 playingAlert];
  if (v9 && [v7 length])
  {
    id v10 = (NSString *)[v7 copy];
    playingToneIdentifier = self->_playingToneIdentifier;
    self->_playingToneIdentifier = v10;

    if ([(AVQueuePlayer *)self->_queuePlayer status] == 2)
    {
      id v12 = TLLogPlayback();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:].cold.5();
      }

      [(TLAlertQueuePlayerController *)self _destroyQueuePlayerForStateDescriptor:v6];
    }
    [(TLAlertQueuePlayerController *)self _createQueuePlayerIfNecessaryForStateDescriptor:v6];
    uint64_t v13 = [v9 toneIdentifier];
    int v14 = [v13 isEqualToString:self->_playingToneIdentifier];

    if (v14)
    {
      v15 = [v9 configuration];
      v16 = [v15 externalToneFileURL];
      if (v16)
      {

        goto LABEL_43;
      }
      uint64_t v51 = [v15 externalToneMediaLibraryItemIdentifier];
      if (v51)
      {
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2050000000;
        int v23 = (void *)getMPMediaPropertyPredicateClass_softClass;
        uint64_t v58 = getMPMediaPropertyPredicateClass_softClass;
        if (!getMPMediaPropertyPredicateClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getMPMediaPropertyPredicateClass_block_invoke;
          v60 = &unk_1E6C210C8;
          v61 = &v55;
          __getMPMediaPropertyPredicateClass_block_invoke((uint64_t)buf);
          int v23 = (void *)v56[3];
        }
        id v24 = v23;
        _Block_object_dispose(&v55, 8);
        __int16 v25 = [NSNumber numberWithUnsignedLongLong:v51];
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2020000000;
        id v26 = (void *)getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
        uint64_t v58 = getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
        if (!getMPMediaItemPropertyPersistentIDSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getMPMediaItemPropertyPersistentIDSymbolLoc_block_invoke;
          v60 = &unk_1E6C210C8;
          v61 = &v55;
          __int16 v27 = (void *)MediaPlayerLibrary();
          v28 = dlsym(v27, "MPMediaItemPropertyPersistentID");
          *(void *)(v61[1] + 24) = v28;
          getMPMediaItemPropertyPersistentIDSymbolLoc_ptr = *(void *)(v61[1] + 24);
          id v26 = (void *)v56[3];
        }
        _Block_object_dispose(&v55, 8);
        if (!v26) {
          goto LABEL_50;
        }
        uint64_t v50 = [v24 predicateWithValue:v25 forProperty:*v26];

        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2050000000;
        uint64_t v29 = (void *)getMPMediaQueryClass_softClass;
        uint64_t v58 = getMPMediaQueryClass_softClass;
        if (!getMPMediaQueryClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getMPMediaQueryClass_block_invoke;
          v60 = &unk_1E6C210C8;
          v61 = &v55;
          __getMPMediaQueryClass_block_invoke((uint64_t)buf);
          uint64_t v29 = (void *)v56[3];
        }
        id v30 = v29;
        _Block_object_dispose(&v55, 8);
        __int16 v31 = [v30 songsQuery];
        [v31 addFilterPredicate:v50];
        v32 = [v31 items];
        uint64_t v33 = [v32 lastObject];

        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2020000000;
        uint64_t v34 = (id *)getMPMediaItemPropertyFilePathSymbolLoc_ptr;
        uint64_t v58 = getMPMediaItemPropertyFilePathSymbolLoc_ptr;
        if (!getMPMediaItemPropertyFilePathSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getMPMediaItemPropertyFilePathSymbolLoc_block_invoke;
          v60 = &unk_1E6C210C8;
          v61 = &v55;
          v35 = (void *)MediaPlayerLibrary();
          int64_t v36 = dlsym(v35, "MPMediaItemPropertyFilePath");
          *(void *)(v61[1] + 24) = v36;
          getMPMediaItemPropertyFilePathSymbolLoc_ptr = *(void *)(v61[1] + 24);
          uint64_t v34 = (id *)v56[3];
        }
        _Block_object_dispose(&v55, 8);
        if (!v34)
        {
LABEL_50:
          __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
          __break(1u);
        }
        id v37 = *v34;
        v38 = [v33 valueForProperty:v37];

        if ([v38 length]
          && ([MEMORY[0x1E4F28CB8] defaultManager],
              v39 = objc_claimAutoreleasedReturnValue(),
              int v40 = [v39 fileExistsAtPath:v38],
              v39,
              v40))
        {
          int64_t v41 = TLLogPlayback();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v38;
            *(_WORD *)&buf[22] = 2048;
            v60 = (void *)v51;
            _os_log_impl(&dword_1DB936000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: found external media library asset at path %{public}@ for identifier %llu.", buf, 0x20u);
          }

          v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v38 isDirectory:0];
        }
        else
        {
          v16 = 0;
        }

        if (v16) {
          goto LABEL_43;
        }
      }
      else
      {
      }
    }
    if ([(NSString *)self->_playingToneIdentifier isEqualToString:@"<none>"])
    {
      [(TLAlertQueuePlayerController *)self _startPlaybackForStateDescriptor:v6 usingAssetWithLoadedProperties:0 shouldConfirmAlertStillPlaying:0];
      goto LABEL_19;
    }
    long long v42 = +[TLToneManager sharedToneManager];
    long long v43 = [v42 filePathForToneIdentifier:self->_playingToneIdentifier];

    v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v43 isDirectory:0];

    if (!v16)
    {
LABEL_47:
      v48 = TLLogPlayback();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:]();
      }

      __int16 v49 = [(TLAlertQueuePlayerController *)self _fallbackToneIdentifierForStateDescriptor:v6];
      [(TLAlertQueuePlayerController *)self _reloadPlaybackForStateDescriptor:v6 withToneIdentifier:v49];

      goto LABEL_19;
    }
LABEL_43:
    long long v44 = [MEMORY[0x1E4F166C8] assetWithURL:v16];
    if (v44)
    {
      long long v45 = TLLogPlayback();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v44;
        _os_log_impl(&dword_1DB936000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: [toneAsset loadValuesAsynchronouslyForKeys:…] for %{public}@.", buf, 0x16u);
      }

      self->_isWaitingToCompleteReloadPlaybackRequest = 1;
      v46 = [(id)objc_opt_class() _propertyKeysOfInterestForToneAssets];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke;
      v52[3] = &unk_1E6C213D0;
      v52[4] = self;
      id v53 = v44;
      v54 = v6;
      id v47 = v44;
      [v47 loadValuesAsynchronouslyForKeys:v46 completionHandler:v52];

      goto LABEL_19;
    }
    goto LABEL_47;
  }
  id v17 = TLLogPlayback();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:]();
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_stateDescriptor == v6)
  {
    id v18 = [(TLAlertQueuePlayerStateDescriptor *)v6 stateDescriptorForCompletedPlayback];
    stateDescriptor = self->_stateDescriptor;
    self->_stateDescriptor = v18;

    __int16 v20 = TLLogPlayback();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor debugDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1DB936000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: Updated _stateDescriptor to %{public}@.", buf, 0x16u);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v6];
  int v22 = objc_msgSend(MEMORY[0x1E4F28C58], "tl_errorWithDomain:description:", @"TLAlertErrorDomain", @"Failed to prepare tone asset for playback.");
  [(TLAlertQueuePlayerStateDescriptor *)v6 invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:5 error:v22];

LABEL_19:
}

void __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TLLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1DB936000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: did finish loading values asynchronously for %{public}@.", buf, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke_40;
  v7[3] = &unk_1E6C213D0;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  [v6 performTaskWithBlock:v7];
}

uint64_t __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke_40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startPlaybackForStateDescriptor:*(void *)(a1 + 40) usingAssetWithLoadedProperties:*(void *)(a1 + 48) shouldConfirmAlertStillPlaying:1];
}

- (void)_startPlaybackForStateDescriptor:(id)a3 usingAssetWithLoadedProperties:(id)a4 shouldConfirmAlertStillPlaying:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v10 = TLLogPlayback();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138544130;
    v15 = self;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v5;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlaybackForStateDescriptor:(%{public}@) usingAssetWithLoadedProperties:(%{public}@) shouldConfirmAlertStillPlaying:(%{BOOL}d).", (uint8_t *)&v14, 0x26u);
  }

  self->_isWaitingToCompleteReloadPlaybackRequest = 0;
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v11 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor playingAlert];
    __int16 v12 = [v8 playingAlert];

    os_unfair_lock_unlock(&self->_lock);
    if (v11 != v12)
    {
      uint64_t v13 = TLLogPlayback();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        v15 = self;
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… usingAssetWithLoadedProperties…: Playing alert for %{public}@ is no longer actually playing; aborting playback initiation.",
          (uint8_t *)&v14,
          0x16u);
      }
      goto LABEL_11;
    }
  }
  if (v9 && ![(TLAlertQueuePlayerController *)self _canPlayToneAsset:v9])
  {
    uint64_t v13 = [(TLAlertQueuePlayerController *)self _fallbackToneIdentifierForStateDescriptor:v8];
    [(TLAlertQueuePlayerController *)self _reloadPlaybackForStateDescriptor:v8 withToneIdentifier:v13];
LABEL_11:

    goto LABEL_12;
  }
  [(TLAlertQueuePlayerController *)self _startPlaybackForStateDescriptor:v8 usingConfirmedPlayableAsset:v9];
LABEL_12:
}

- (void)_startPlaybackForStateDescriptor:(id)a3 usingConfirmedPlayableAsset:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (AVQueuePlayer *)a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v8 = TLLogPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlaybackForStateDescriptor:(%{public}@) usingConfirmedPlayableAsset:(%{public}@).", (uint8_t *)&v14, 0x20u);
  }

  [(TLAlertQueuePlayerController *)self _stopObservingQueuePlayer];
  id v9 = TLLogPlayback();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    queuePlayer = self->_queuePlayer;
    int v14 = 138543618;
    v15 = self;
    __int16 v16 = 2114;
    id v17 = queuePlayer;
    _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… usingConfirmedPlayableAsset…: [_queuePlayer removeAllItems] on %{public}@ before initiating playback.", (uint8_t *)&v14, 0x16u);
  }

  [(AVQueuePlayer *)self->_queuePlayer removeAllItems];
  objc_storeStrong((id *)&self->_toneAssetForPendingPlayingAlert, a4);
  self->_hasToneAssetForPendingPlayingAlert = 1;
  [(TLAlertQueuePlayerController *)self _willBeginPlayingAlertForStateDescriptor:v6];
  if (self->_attentionPollingToken && !self->_isAttentionAwarenessSubsystemFullyInitialized)
  {
    uint64_t v13 = TLLogPlayback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… usingConfirmedPlayableAsset…: Currently polling for attention, and attention awareness subsystem not initialized yet. Waiting to see if we already have the user's attention.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    toneAssetForPendingPlayingAlert = self->_toneAssetForPendingPlayingAlert;
    self->_toneAssetForPendingPlayingAlert = 0;

    self->_hasToneAssetForPendingPlayingAlert = 0;
    BOOL v12 = self->_isAttentionAwarenessSubsystemFullyInitialized && self->_lastAttentionPollingEventType == 1;
    [(TLAlertQueuePlayerController *)self _startPlaybackForStateDescriptor:v6 usingConfirmedPlayableAsset:v7 hasAlreadyDetectedUserAttention:v12];
  }
}

- (void)_startPlaybackForStateDescriptor:(id)a3 usingConfirmedPlayableAsset:(id)a4 hasAlreadyDetectedUserAttention:(BOOL)a5
{
  BOOL v78 = a5;
  v99[3] = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  id v82 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v7 = TLLogPlayback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v79;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v98 = (uint64_t)v82;
    LOWORD(v99[0]) = 1024;
    *(_DWORD *)((char *)v99 + 2) = v78;
    _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlaybackForStateDescriptor:(%{public}@) usingConfirmedPlayableAsset:(%{public}@) hasAlreadyDetectedUserAttention:(%{BOOL}d).", buf, 0x26u);
  }

  v80 = [v79 playingAlert];
  if ([(id)objc_opt_class() _shouldVibrateForAlert:v80])
  {
    id v8 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    int v9 = [v8 hasSynchronizedEmbeddedVibrationsCapability];

    if (v9)
    {
      id v10 = [v80 toneIdentifier];
      uint64_t v11 = [v80 vibrationIdentifier];
      if (![v11 hasPrefix:@"synchronizedvibration:"]
        || ([v80 _hasSynchronizedVibrationUnmatchedWithTone] & 1) != 0
        || ([v10 hasPrefix:@"alarmWakeUp:"] & 1) != 0)
      {
        int v12 = 0;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v57 = [v82 URL];
          uint64_t v58 = [v57 pathExtension];

          v59 = [v58 lowercaseString];
          int v60 = [v59 isEqualToString:@"caf"];

          if (v60)
          {
            v61 = TLLogPlayback();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = self;
              _os_log_impl(&dword_1DB936000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: Vibrating using embedded haptic track is not supported for .caf audio assets.", buf, 0xCu);
            }

            int v12 = 0;
          }
          else
          {
            int v12 = 1;
          }
        }
        else
        {
          int v12 = 1;
        }
      }
      BOOL v75 = v12 == 0;
      uint64_t v13 = TLLogPlayback();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: Should vibrate using embedded haptic track: %{BOOL}d.", buf, 0x12u);
      }

      BOOL v81 = v12 != 0;
    }
    else
    {
      BOOL v81 = 0;
      BOOL v75 = 1;
    }
  }
  else
  {
    BOOL v81 = 0;
    BOOL v75 = 0;
  }
  v76 = [v80 configuration];
  if (!v82)
  {
    id v19 = 0;
    goto LABEL_58;
  }
  long long v91 = 0uLL;
  uint64_t v92 = 0;
  [v82 duration];
  long long v89 = 0uLL;
  uint64_t v90 = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  int v14 = (double (*)(unsigned char *))getCMTimeGetSecondsSymbolLoc_ptr;
  v96 = getCMTimeGetSecondsSymbolLoc_ptr;
  if (!getCMTimeGetSecondsSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCMTimeGetSecondsSymbolLoc_block_invoke;
    uint64_t v98 = (uint64_t)&unk_1E6C210C8;
    v99[0] = &v93;
    v15 = (void *)CoreMediaLibrary();
    __int16 v16 = dlsym(v15, "CMTimeGetSeconds");
    *(void *)(*(void *)(v99[0] + 8) + 24) = v16;
    getCMTimeGetSecondsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(v99[0] + 8) + 24);
    int v14 = (double (*)(unsigned char *))v94[3];
  }
  _Block_object_dispose(&v93, 8);
  if (!v14)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  *(_OWORD *)buf = v89;
  *(void *)&buf[16] = v90;
  double v17 = v14(buf);
  [(id)objc_opt_class() _audioVolumeRampingDurationForAlert:v80 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues toneAssetDuration:v17];
  id v19 = v18;
  if ([v76 shouldRepeat]) {
    unint64_t v20 = llround(1.0 / v17) + 2;
  }
  else {
    unint64_t v20 = 1;
  }
  BOOL v21 = TLLogPlayback();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    queuePlayer = self->_queuePlayer;
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v98 = (uint64_t)queuePlayer;
    LOWORD(v99[0]) = 2114;
    *(void *)((char *)v99 + 2) = v82;
    _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: inserting %lu player items into %{public}@ for tone asset: %{public}@.", buf, 0x2Au);
  }

  if (self->_attentionPollingToken)
  {
    id v24 = [(TLAttentionAwarenessEffectCoordinator *)self->_effectCoordinator audioMixForAsset:v82];
    if (!v20) {
      goto LABEL_57;
    }
    goto LABEL_28;
  }
  id v24 = 0;
  if (v20)
  {
LABEL_28:
    uint64_t v25 = 0;
    uint64_t v77 = *MEMORY[0x1E4F16038];
    *(void *)&long long v23 = 138543874;
    long long v74 = v23;
    while (1)
    {
      id v26 = objc_msgSend(MEMORY[0x1E4F16620], "playerItemWithAsset:", v82, v74);
      if (!v26)
      {
        id v37 = TLLogPlayback();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v74;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v98 = (uint64_t)v82;
          _os_log_error_impl(&dword_1DB936000, v37, OS_LOG_TYPE_ERROR, "%{public}@: -_startPlayback… hasAlreadyDetected…: (iteration #%lu) failed to create AVPlayerItem for tone asset: %{public}@.", buf, 0x20u);
        }

        goto LABEL_56;
      }
      if (v81) {
        break;
      }
LABEL_53:
      if (v24) {
        [v26 setAudioMix:v24];
      }
      [v26 setAudioSpatializationAllowed:0];
      [(AVQueuePlayer *)self->_queuePlayer insertItem:v26 afterItem:0];
LABEL_56:

      if (v20 == ++v25) {
        goto LABEL_57;
      }
    }
    __int16 v27 = TLLogPlayback();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      _os_log_impl(&dword_1DB936000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [playerItem setPlayHapticTracks:YES] on %{public}@.", buf, 0x16u);
    }

    [v26 setPlayHapticTracks:1];
    [v26 setHapticPlaybackLocality:v77];
    v28 = TLLogPlayback();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      _os_log_impl(&dword_1DB936000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [playerItem setHapticPlaybackLocality:AVPlayerItemHapticPlaybackLocalityDefaultWithFullStrength] on %{public}@.", buf, 0x16u);
    }

    uint64_t v29 = objc_msgSend(v26, "tl_hapticTracks");
    id v30 = [v29 attenuatedHapticPlayerItemTrack];
    __int16 v31 = [v29 hapticPlayerItemTrack];
    v32 = v31;
    if (v30)
    {
      if (v78)
      {
        [v31 setEnabled:0];
        [v32 setMutesHaptics:1];
        uint64_t v33 = TLLogPlayback();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v32;
          _os_log_impl(&dword_1DB936000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [hapticPlayerItemTrack setEnabled:NO] and [hapticPlayerItemTrack setMutesHaptics:YES] on %{public}@.", buf, 0x16u);
        }

        [v30 setEnabled:1];
        [v30 setMutesHaptics:0];
        uint64_t v34 = TLLogPlayback();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_52;
        }
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        v35 = v34;
        int64_t v36 = "%{public}@: -_startPlayback… hasAlreadyDetected…: [attenuatedHapticPlayerItemTrack setEnabled:YES] and [at"
              "tenuatedHapticPlayerItemTrack setMutesHaptics:NO] on %{public}@.";
      }
      else
      {
        [v31 setEnabled:1];
        [v32 setMutesHaptics:0];
        v39 = TLLogPlayback();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v32;
          _os_log_impl(&dword_1DB936000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [hapticPlayerItemTrack setEnabled:YES] and [hapticPlayerItemTrack setMutesHaptics:NO] on %{public}@.", buf, 0x16u);
        }

        [v30 setEnabled:1];
        [v30 setMutesHaptics:1];
        uint64_t v34 = TLLogPlayback();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_52;
        }
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        v35 = v34;
        int64_t v36 = "%{public}@: -_startPlayback… hasAlreadyDetected…: [attenuatedHapticPlayerItemTrack setEnabled:YES] and [at"
              "tenuatedHapticPlayerItemTrack setMutesHaptics:YES] on %{public}@.";
      }
      uint32_t v38 = 22;
    }
    else
    {
      [v31 setActiveHapticChannelIndex:v78];
      uint64_t v34 = TLLogPlayback();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
LABEL_52:

        goto LABEL_53;
      }
      *(_DWORD *)buf = v74;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v78;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v98 = (uint64_t)v32;
      v35 = v34;
      int64_t v36 = "%{public}@: -_startPlayback… hasAlreadyDetected…: [hapticPlayerItemTrack setActiveHapticChannelIndex:%ld] on %{public}@.";
      uint32_t v38 = 32;
    }
    _os_log_impl(&dword_1DB936000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
    goto LABEL_52;
  }
LABEL_57:

LABEL_58:
  [(TLAlertQueuePlayerController *)self _startObservingQueuePlayer];
  if (!v75) {
    goto LABEL_96;
  }
  int v40 = [v76 externalVibrationPattern];
  if (v40
    || ([v76 externalVibrationPatternFileURL], (long long v45 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v45],
        int v40 = objc_claimAutoreleasedReturnValue(),
        v45,
        v40))
  {
    if (([v76 shouldRepeat] & 1) == 0)
    {
      id v44 = v40;
      int v40 = v44;
LABEL_92:
      v64 = TLLogPlayback();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v65;
        _os_log_impl(&dword_1DB936000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [_queuePlayer setVibrationPattern:vibrationPattern] on player %{public}@ with a non-nil pattern.", buf, 0x16u);
      }

      [(AVQueuePlayer *)self->_queuePlayer setVibrationPattern:v44];
      goto LABEL_95;
    }
    int64_t v41 = [[TLVibrationPattern alloc] initWithPropertyListRepresentation:v40];
    long long v42 = v41;
    if (v41)
    {
      id v43 = [(TLVibrationPattern *)v41 _artificiallyRepeatingPropertyListRepresentation];
    }
    else
    {
      v54 = TLLogPlayback();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:]();
      }

      id v43 = v40;
      int v40 = v43;
    }
    id v44 = v43;
  }
  else
  {
    long long v42 = [v80 vibrationIdentifier];
    if ([v42 isEqualToString:@"<none>"])
    {
      v46 = [(AVQueuePlayer *)self->_queuePlayer vibrationPattern];
      BOOL v47 = v46 == 0;

      if (!v47)
      {
        v48 = TLLogGeneral();
        BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);

        if (v49)
        {
          uint64_t v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m"];
          uint64_t v51 = TLLogGeneral();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v52 = [v50 lastPathComponent];
            id v53 = [MEMORY[0x1E4F29060] callStackSymbols];
            *(_DWORD *)buf = 136381443;
            *(void *)&uint8_t buf[4] = "-[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableA"
                                 "sset:hasAlreadyDetectedUserAttention:]";
            *(_WORD *)&buf[12] = 2113;
            *(void *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2049;
            uint64_t v98 = 712;
            LOWORD(v99[0]) = 2113;
            *(void *)((char *)v99 + 2) = v53;
            _os_log_impl(&dword_1DB936000, v51, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
          }
        }
        else
        {
          uint64_t v50 = TLLogGeneral();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
          }
        }

        uint64_t v62 = TLLogGeneral();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:]();
        }
      }
      v56 = TLLogPlayback();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v63 = self->_queuePlayer;
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v63;
        *(_WORD *)&buf[22] = 2114;
        uint64_t v98 = @"<none>";
        _os_log_impl(&dword_1DB936000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…:. Leaving [_queuePlayer vibrationPattern] as nil on player %{public}@ because the vibration identifier is %{public}@.", buf, 0x20u);
      }
      id v44 = 0;
    }
    else
    {
      uint64_t v55 = [(id)objc_opt_class() _shouldRepeatVibrationForAlert:v80 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues];
      v56 = +[TLVibrationManager sharedVibrationManager];
      id v44 = [v56 patternForVibrationWithIdentifier:v42 repeating:v55];
    }

    int v40 = 0;
  }

  if (v44) {
    goto LABEL_92;
  }
LABEL_95:

LABEL_96:
  [(id)objc_opt_class() _audioPlaybackInitiationDelayForAlert:v80 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues];
  double v67 = v66;
  if (v66 <= 0.00000011920929)
  {
    [(TLAlertQueuePlayerController *)self _initiateAudioPlaybackForStateDescriptor:v79 audioVolumeRampingDuration:*(double *)&v19];
  }
  else
  {
    v68 = TLLogPlayback();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = self->_queuePlayer;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v98 = *(void *)&v67;
      _os_log_impl(&dword_1DB936000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: Skipping play command on %{public}@ because we need to honor a delay of %f seconds for the initiation of audio playback.", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    dispatch_time_t v70 = dispatch_time(0, (uint64_t)(v67 * 1000000000.0));
    v71 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke;
    block[3] = &unk_1E6C22110;
    objc_copyWeak(v88, (id *)buf);
    id v87 = v79;
    v88[1] = v19;
    dispatch_after(v70, v71, block);

    objc_destroyWeak(v88);
    objc_destroyWeak((id *)buf);
  }
  v72 = [v80 playbackObserver];
  if (objc_opt_respondsToSelector())
  {
    v73 = dispatch_get_global_queue(0, 0);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_3;
    v83[3] = &unk_1E6C20CC0;
    id v84 = v72;
    id v85 = v80;
    dispatch_async(v73, v83);
  }
}

void __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 1);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_2;
    v5[3] = &unk_1E6C21358;
    v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    [v4 performTaskWithBlock:v5];
  }
}

uint64_t __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDelayedAudioPlaybackInitiationForStateDescriptor:*(void *)(a1 + 40) audioVolumeRampingDuration:*(double *)(a1 + 48)];
}

uint64_t __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) alertDidBeginPlaying:*(void *)(a1 + 40)];
}

- (void)_initiateAudioPlaybackForStateDescriptor:(id)a3 audioVolumeRampingDuration:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  uint64_t v7 = TLLogPlayback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    double v27 = *(double *)&v6;
    __int16 v28 = 2050;
    double v29 = a4;
    _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_initiateAudioPlaybackForStateDescriptor:(%{public}@) audioVolumeRampingDuration:(%{public}f).", buf, 0x20u);
  }

  id v8 = TLLogPlayback();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4 <= 0.00000011920929)
  {
    if (v9)
    {
      queuePlayer = self->_queuePlayer;
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      double v27 = *(double *)&queuePlayer;
      _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_initiateAudioPlayback…: [_queuePlayer play] for %{public}@.", buf, 0x16u);
    }

    [(AVQueuePlayer *)self->_queuePlayer play];
    int v14 = [v6 playingAlert];
    if ([v14 type] == 13)
    {
      v15 = +[TLCapabilitiesManager sharedCapabilitiesManager];
      int v16 = [v15 isInternalInstall];

      if (v16)
      {
        double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB9430]), "initWithReporterID:serviceType:", -[AVAudioSession reporterID](self->_audioSession, "reporterID"), 4);
        v22[0] = @"alertType";
        __int16 v18 = NSStringFromTLAlertType(0xDuLL);
        v22[1] = @"toneIdentifier";
        v23[0] = v18;
        id v19 = [v14 toneIdentifier];
        v23[1] = v19;
        unint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

        [v17 sendMessage:v20 category:8 type:1];
      }
    }
  }
  else
  {
    if (v9)
    {
      id v10 = self->_queuePlayer;
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = self;
      __int16 v26 = 2050;
      double v27 = a4;
      __int16 v28 = 2114;
      double v29 = *(double *)&v10;
      _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_initiateAudioPlayback…: [_queuePlayer setRate:withVolumeRampDuration:] with %{public}f for %{public}@.", buf, 0x20u);
    }

    uint64_t v11 = self->_queuePlayer;
    soft_CMTimeMakeWithSeconds(a4);
    LODWORD(v12) = 1.0;
    [(AVQueuePlayer *)v11 setRate:v21 withVolumeRampDuration:v12];
  }
}

- (void)_performDelayedAudioPlaybackInitiationForStateDescriptor:(id)a3 audioVolumeRampingDuration:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  uint64_t v7 = TLLogPlayback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543874;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2050;
    double v17 = a4;
    _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_performDelayedAudioPlaybackInitiationForStateDescriptor:(%{public}@) audioVolumeRampingDuration:(%{public}f).", (uint8_t *)&v12, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v8 = self->_stateDescriptor;
  os_unfair_lock_unlock(&self->_lock);
  BOOL v9 = [v6 playingAlert];
  id v10 = [(TLAlertQueuePlayerStateDescriptor *)v8 playingAlert];
  if (v10 == v9)
  {
    [(TLAlertQueuePlayerController *)self _initiateAudioPlaybackForStateDescriptor:v8 audioVolumeRampingDuration:a4];
  }
  else
  {
    uint64_t v11 = TLLogPlayback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543874;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v10;
      __int16 v16 = 2114;
      double v17 = *(double *)&v9;
      _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_performDelayedAudioPlaybackInitiation…: playingAlert (%{public}@) doesn't match with alert with delayed audio playback initiation (%{public}@). Aborting.", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_stopPlaybackForStateDescriptor:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v5 withOptions:0 playerWasAlreadyPausedExternally:0];
}

- (void)_stopPlaybackForStateDescriptor:(id)a3 withOptions:(id)a4 playerWasAlreadyPausedExternally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (AVQueuePlayer *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v10 = TLLogPlayback();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    double v29 = self;
    __int16 v30 = 2114;
    double v31 = *(double *)&v8;
    __int16 v32 = 2114;
    uint64_t v33 = v9;
    __int16 v34 = 1024;
    BOOL v35 = v5;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackForStateDescriptor:(%{public}@) withOptions:(%{public}@) playerWasAlreadyPausedExternally:(%{BOOL}d).", buf, 0x26u);
  }

  BOOL isStoppingPlayingAlert = self->_isStoppingPlayingAlert;
  self->_BOOL isStoppingPlayingAlert = 1;
  if (self->_queuePlayer)
  {
    if (v5)
    {
      int v12 = TLLogPlayback();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        queuePlayer = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        double v29 = self;
        __int16 v30 = 2114;
        double v31 = *(double *)&queuePlayer;
        _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: playerWasAlreadyPausedExternally = YES for %{public}@.", buf, 0x16u);
      }
    }
    else if (v9 && ([(AVQueuePlayer *)v9 fadeOutDuration], double v15 = v14, v14 > 0.00000011920929))
    {
      __int16 v16 = TLLogPlayback();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double v17 = self->_queuePlayer;
        *(_DWORD *)buf = 138543874;
        double v29 = self;
        __int16 v30 = 2048;
        double v31 = v15;
        __int16 v32 = 2114;
        uint64_t v33 = v17;
        _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer setRate:withVolumeRampDuration:] with fadeOutDuration %f for %{public}@.", buf, 0x20u);
      }

      uint64_t v18 = self->_queuePlayer;
      soft_CMTimeMakeWithSeconds(v15);
      [(AVQueuePlayer *)v18 setRate:v27 withVolumeRampDuration:0.0];
    }
    else
    {
      id v19 = TLLogPlayback();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        double v29 = self;
        __int16 v30 = 2114;
        double v31 = *(double *)&v20;
        _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer pause] for %{public}@.", buf, 0x16u);
      }

      [(AVQueuePlayer *)self->_queuePlayer pause];
    }
    [(TLAlertQueuePlayerController *)self _stopObservingQueuePlayer];
    BOOL v21 = TLLogPlayback();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = self->_queuePlayer;
      *(_DWORD *)buf = 138543618;
      double v29 = self;
      __int16 v30 = 2114;
      double v31 = *(double *)&v22;
      _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer removeAllItems] for %{public}@.", buf, 0x16u);
    }

    [(AVQueuePlayer *)self->_queuePlayer removeAllItems];
    long long v23 = [(AVQueuePlayer *)self->_queuePlayer vibrationPattern];

    if (v23)
    {
      id v24 = TLLogPlayback();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        double v29 = self;
        __int16 v30 = 2114;
        double v31 = *(double *)&v25;
        _os_log_impl(&dword_1DB936000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer setVibrationPattern:nil] for %{public}@.", buf, 0x16u);
      }

      [(AVQueuePlayer *)self->_queuePlayer setVibrationPattern:0];
    }
  }
  [(TLAlertQueuePlayerController *)self _didEndPlayingAlertForStateDescriptor:v8];
  toneAssetForPendingPlayingAlert = self->_toneAssetForPendingPlayingAlert;
  self->_toneAssetForPendingPlayingAlert = 0;

  self->_hasToneAssetForPendingPlayingAlert = 0;
  self->_BOOL isStoppingPlayingAlert = isStoppingPlayingAlert;
}

- (void)_willBeginPlayingAlertForStateDescriptor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  BOOL v5 = TLLogPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_willBeginPlayingAlertForStateDescriptor:(%{public}@).", (uint8_t *)&v9, 0x16u);
  }

  if ([v4 isAlertActivationAssertionAcquired])
  {
    id v6 = TLLogPlayback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 alertForAudioEnvironmentSetup];
      id v8 = [v4 playingAlert];
      int v9 = 138543874;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v7;
      __int16 v13 = 2114;
      double v14 = v8;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_willBeginPlaying…: Alert activation assertion acquired for %{public}@. Skipping audio environment preparation steps for %{public}@.", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    [(TLAlertQueuePlayerController *)self _prepareAudioEnvironmentForStateDescriptor:v4];
  }
}

- (void)_didEndPlayingAlertForStateDescriptor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  BOOL v5 = TLLogPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didEndPlayingAlertForStateDescriptor:(%{public}@).", (uint8_t *)&v9, 0x16u);
  }

  if ([v4 isAlertActivationAssertionAcquired])
  {
    id v6 = TLLogPlayback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 alertForAudioEnvironmentSetup];
      id v8 = [v4 playingAlert];
      int v9 = 138543874;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v7;
      __int16 v13 = 2114;
      double v14 = v8;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didEndPlaying…: Alert activation assertion acquired for %{public}@. Skipping audio environment restoration steps for playing alert: %{public}@.", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    [(TLAlertQueuePlayerController *)self _restoreAudioEnvironmentForStateDescriptor:v4];
  }
}

- (void)_prepareAudioEnvironmentForStateDescriptor:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  double v4 = COERCE_DOUBLE(a3);
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  double v5 = [*(id *)&v4 alertForAudioEnvironmentSetup];
  id v6 = TLLogPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v109 = self;
    __int16 v110 = 2114;
    double v111 = v4;
    __int16 v112 = 2114;
    double v113 = v5;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironmentForStateDescriptor:(%{public}@). alertForAudioEnvironmentSetup = %{public}@", buf, 0x20u);
  }

  self->_externalEnvironmentValues = ($1778A69A063EB5A9373FEA3F0DAED699)[(id)objc_opt_class() _externalEnvironmentValuesForAlert:*(void *)&v5];
  if (self->_audioSession)
  {
    uint64_t v7 = TLLogPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&id v8 = COERCE_DOUBLE("auxiliary");
      audioSession = self->_audioSession;
      if (!self->_isUsingAuxiliaryAudioSession) {
        *(double *)&id v8 = COERCE_DOUBLE("shared");
      }
      *(_DWORD *)buf = 138544130;
      v109 = self;
      __int16 v110 = 2082;
      double v111 = *(double *)&v8;
      __int16 v112 = 2114;
      double v113 = *(double *)&audioSession;
      __int16 v114 = 2114;
      *(double *)v115 = v5;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment. Using previous %{public}s audio session %{public}@ for %{public}@.", buf, 0x2Au);
    }

    id v10 = TLLogPlayback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v109 = self;
      _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment. We are most likely about to being playing an alert which interrupted one that was already playing, and which was stopped while preventing the deactivation of the audio session.", buf, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (![(id)objc_opt_class() _shouldUseAuxiliaryAudioSessionForAlert:*(void *)&v5])
  {
    self->_int isUsingAuxiliaryAudioSession = 0;
    uint64_t v15 = [MEMORY[0x1E4F153E0] sharedInstance];
    __int16 v16 = self->_audioSession;
    self->_audioSession = v15;

    id v10 = TLLogPlayback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = self->_audioSession;
      *(_DWORD *)buf = 138543874;
      v109 = self;
      __int16 v110 = 2114;
      double v111 = *(double *)&v17;
      __int16 v112 = 2114;
      double v113 = v5;
      _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Using shared audio session %{public}@ for %{public}@.", buf, 0x20u);
    }
    goto LABEL_17;
  }
  self->_int isUsingAuxiliaryAudioSession = 1;
  __int16 v11 = [MEMORY[0x1E4F153E0] auxiliarySession];
  id v12 = self->_audioSession;
  self->_audioSession = v11;

  [(AVQueuePlayer *)self->_queuePlayer setAudioSession:self->_audioSession];
  __int16 v13 = TLLogPlayback();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = self->_audioSession;
    *(_DWORD *)buf = 138543874;
    v109 = self;
    __int16 v110 = 2114;
    double v111 = *(double *)&v14;
    __int16 v112 = 2114;
    double v113 = v5;
    _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Using auxiliary audio session %{public}@ for %{public}@.", buf, 0x20u);
  }

  [(TLAlertQueuePlayerController *)self _resetFlagsForSwitchingAuxiliaryAudioSession];
LABEL_18:
  double v18 = [(id)objc_opt_class() _audioCategoryForAlert:*(void *)&v5 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues];
  uint64_t v19 = [(id)objc_opt_class() _audioCategoryOptionsForAlert:*(void *)&v5 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues];
  v97 = [(id)objc_opt_class() _audioModeForAlert:*(void *)&v5 audioCategory:*(void *)&v18];
  if ([*(id *)&v18 length])
  {
    unint64_t v20 = [(AVAudioSession *)self->_audioSession category];
    double v21 = COERCE_DOUBLE([v20 copy]);

    unint64_t v22 = [(AVAudioSession *)self->_audioSession categoryOptions];
    long long v23 = [(AVAudioSession *)self->_audioSession mode];
    id v24 = (void *)[v23 copy];

    uint64_t v25 = self->_audioSession;
    id v107 = 0;
    BOOL v26 = [(AVAudioSession *)v25 setCategory:*(void *)&v18 mode:v97 options:v19 error:&v107];
    id v27 = v107;
    if (v27) {
      BOOL v28 = 0;
    }
    else {
      BOOL v28 = v26;
    }
    if (v28)
    {
      objc_storeStrong((id *)&self->_previousAudioCategory, *(id *)&v21);
      self->_previousAudioCategoryOptions = v22;
      objc_storeStrong((id *)&self->_previousAudioMode, v24);
      double v29 = TLLogPlayback();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if ([(__CFString *)v97 length]) {
          __int16 v30 = " with mode ";
        }
        else {
          __int16 v30 = "";
        }
        uint64_t v31 = [(__CFString *)v97 length];
        __int16 v32 = self->_audioSession;
        uint64_t v33 = &stru_1F35F7550;
        if (v31) {
          uint64_t v33 = v97;
        }
        *(_DWORD *)buf = 138544898;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = v18;
        __int16 v112 = 2082;
        double v113 = *(double *)&v30;
        __int16 v114 = 2114;
        *(void *)v115 = v33;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v19;
        *(_WORD *)&v115[14] = 2114;
        *(void *)&v115[16] = v32;
        __int16 v116 = 2114;
        double v117 = v5;
        _os_log_impl(&dword_1DB936000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully set audio category to %{public}@%{public}s%{public}@ and options 0x%x on audio session %{public}@ for %{public}@.", buf, 0x44u);
      }
    }
    else
    {
      __int16 v34 = v27;
      BOOL v35 = TLLogPlayback();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v81 = [(__CFString *)v97 length];
        id v82 = " with mode ";
        if (!v81) {
          id v82 = "";
        }
        uint64_t v95 = v82;
        if ([(__CFString *)v97 length]) {
          v83 = v97;
        }
        else {
          v83 = &stru_1F35F7550;
        }
        uint64_t v93 = v83;
        v94 = self->_audioSession;
        uint64_t v84 = objc_msgSend(v34, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138545154;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = v18;
        __int16 v112 = 2082;
        double v113 = *(double *)&v95;
        __int16 v114 = 2114;
        *(void *)v115 = v93;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v19;
        *(_WORD *)&v115[14] = 2114;
        *(void *)&v115[16] = v94;
        __int16 v116 = 2114;
        double v117 = v5;
        __int16 v118 = 2114;
        id v85 = (void *)v84;
        uint64_t v119 = v84;
        _os_log_error_impl(&dword_1DB936000, v35, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed setting audio category to %{public}@%{public}s%{public}@ and options 0x%x on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x4Eu);
      }
      uint64_t v36 = self->_audioSession;
      id v106 = v34;
      BOOL v37 = [(AVAudioSession *)v36 setCategory:*(void *)&v21 mode:v24 options:v22 error:&v106];
      double v29 = v106;

      if (v29) {
        BOOL v37 = 0;
      }
      uint32_t v38 = TLLogPlayback();
      v39 = v38;
      if (v37)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = self->_audioSession;
          *(_DWORD *)buf = 138544386;
          v109 = self;
          __int16 v110 = 2114;
          double v111 = v21;
          __int16 v112 = 2114;
          double v113 = *(double *)&v24;
          __int16 v114 = 1024;
          *(_DWORD *)v115 = v22;
          *(_WORD *)&v115[4] = 2114;
          *(void *)&v115[6] = v40;
          _os_log_impl(&dword_1DB936000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully reverted audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@.", buf, 0x30u);
        }
        double v29 = v39;
      }
      else
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v96 = self->_audioSession;
          v86 = [v29 tl_nonRedundantDescription];
          *(_DWORD *)buf = 138544642;
          v109 = self;
          __int16 v110 = 2114;
          double v111 = v21;
          __int16 v112 = 2114;
          double v113 = *(double *)&v24;
          __int16 v114 = 1024;
          *(_DWORD *)v115 = v22;
          *(_WORD *)&v115[4] = 2114;
          *(void *)&v115[6] = v96;
          *(_WORD *)&v115[14] = 2114;
          *(void *)&v115[16] = v86;
          _os_log_error_impl(&dword_1DB936000, v39, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed reverting audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@ with error: %{public}@.", buf, 0x3Au);
        }
      }
    }
  }
  if ([(id)objc_opt_class() _shouldBypassRingerSwitchPolicyForAlert:*(void *)&v5]
    && !self->_isBypassingRingerSwitchPolicy)
  {
    int64_t v41 = self->_audioSession;
    id v105 = 0;
    int v42 = [(AVAudioSession *)v41 setBypassRingerSwitchPolicy:1 error:&v105];
    id v43 = v105;
    if (v43) {
      int v44 = 0;
    }
    else {
      int v44 = v42;
    }
    if (v44 == 1)
    {
      self->_isBypassingRingerSwitchPolicy = 1;
      long long v45 = TLLogPlayback();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = *(double *)&v46;
        __int16 v112 = 2114;
        double v113 = v5;
        _os_log_impl(&dword_1DB936000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully bypassed ringer switch policy on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      long long v45 = TLLogPlayback();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v87 = self->_audioSession;
        v88 = objc_msgSend(v43, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544130;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = *(double *)&v87;
        __int16 v112 = 2114;
        double v113 = v5;
        __int16 v114 = 2114;
        *(void *)v115 = v88;
        _os_log_error_impl(&dword_1DB936000, v45, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed bypassing ringer switch policy on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);
      }
    }
  }
  BOOL v47 = [*(id *)&v5 configuration];
  int v48 = [v47 shouldIgnoreAccessibilityDisabledVibrationSetting];

  if (v48 && !self->_isIgnoringAccessibilityDisabledVibrationSetting)
  {
    BOOL v49 = self->_audioSession;
    id v104 = 0;
    int v50 = [(AVAudioSession *)v49 setPrefersToVibeWhenVibrationsAreDisabled:1 error:&v104];
    id v51 = v104;
    if (v51) {
      int v52 = 0;
    }
    else {
      int v52 = v50;
    }
    if (v52 == 1)
    {
      self->_isIgnoringAccessibilityDisabledVibrationSetting = 1;
      id v53 = TLLogPlayback();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = *(double *)&v54;
        __int16 v112 = 2114;
        double v113 = v5;
        _os_log_impl(&dword_1DB936000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully set prefersToVibeWhenVibrationsAreDisabled to YES on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      id v53 = TLLogPlayback();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        long long v89 = self->_audioSession;
        uint64_t v90 = objc_msgSend(v51, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544130;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = *(double *)&v89;
        __int16 v112 = 2114;
        double v113 = v5;
        __int16 v114 = 2114;
        *(void *)v115 = v90;
        _os_log_error_impl(&dword_1DB936000, v53, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed setting prefersToVibeWhenVibrationsAreDisabled to YES on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);
      }
    }
  }
  if ([(id)objc_opt_class() _prefersToPlayDuringWombatForAlert:*(void *)&v5]
    && !self->_prefersToPlayDuringWombat)
  {
    uint64_t v55 = self->_audioSession;
    double v56 = *MEMORY[0x1E4F76550];
    id v103 = 0;
    int v57 = [(AVAudioSession *)v55 setMXSessionProperty:*(void *)&v56 value:MEMORY[0x1E4F1CC38] error:&v103];
    id v58 = v103;
    if (v58) {
      int v59 = 0;
    }
    else {
      int v59 = v57;
    }
    if (v59 == 1)
    {
      self->_prefersToPlayDuringWombat = 1;
      int v60 = TLLogPlayback();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = self->_audioSession;
        *(_DWORD *)buf = 138544130;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = v56;
        __int16 v112 = 2114;
        double v113 = *(double *)&v61;
        __int16 v114 = 2114;
        *(double *)v115 = v5;
        _os_log_impl(&dword_1DB936000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully set MXSessionProperty %{public}@ to YES on audio session %{public}@ for %{public}@.", buf, 0x2Au);
      }
    }
    else
    {
      int v60 = TLLogPlayback();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        long long v91 = self->_audioSession;
        uint64_t v92 = objc_msgSend(v58, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544386;
        v109 = self;
        __int16 v110 = 2114;
        double v111 = v56;
        __int16 v112 = 2114;
        double v113 = *(double *)&v91;
        __int16 v114 = 2114;
        *(double *)v115 = v5;
        *(_WORD *)&v115[8] = 2114;
        *(void *)&v115[10] = v92;
        _os_log_error_impl(&dword_1DB936000, v60, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed setting MXSessionProperty %{public}@ to YES on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x34u);
      }
    }
  }
  [(TLAlertQueuePlayerController *)self _audioVolumeForAlert:*(void *)&v5 audioCategory:*(void *)&v18];
  int v63 = v62;
  if ([(id)objc_opt_class() _audioVolumeApplicationPolicyForAlert:*(void *)&v5 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues] == 3)
  {
    [(TLAlertQueuePlayerController *)self _activateAudioSessionIfNeededForStateDescriptor:*(void *)&v4];
    LODWORD(v65) = v63;
    [(TLAlertQueuePlayerController *)self _applyAudioVolume:*(void *)&v5 forAlert:v65];
  }
  else
  {
    LODWORD(v64) = v63;
    [(TLAlertQueuePlayerController *)self _applyAudioVolume:*(void *)&v5 forAlert:v64];
    [(TLAlertQueuePlayerController *)self _activateAudioSessionIfNeededForStateDescriptor:*(void *)&v4];
  }
  int v66 = [(id)objc_opt_class() _shouldApplyAttentionAwarenessEffectsForAlert:*(void *)&v5];
  attentionPollingToken = self->_attentionPollingToken;
  if (v66)
  {
    if (!attentionPollingToken)
    {
      objc_initWeak(&location, self);
      v68 = +[TLAttentionAwarenessObserver sharedAttentionAwarenessObserver];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke;
      v99[3] = &unk_1E6C22138;
      objc_copyWeak(&v101, &location);
      id v100 = *(id *)&v4;
      v69 = [v68 pollForAttentionWithEventHandler:v99];
      dispatch_time_t v70 = self->_attentionPollingToken;
      self->_attentionPollingToken = v69;

      v71 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      v72 = [(AVAudioSession *)self->_audioSession category];
      v73 = [(id)objc_opt_class() _mediaExperienceAudioCategoryForAudioSessionCategory:v72];
      float v98 = 0.0;
      int v74 = [v71 getVolume:&v98 forCategory:v73];
      BOOL v75 = TLLogPlayback();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        v109 = self;
        __int16 v110 = 2048;
        double v111 = v98;
        __int16 v112 = 2114;
        double v113 = *(double *)&v73;
        __int16 v114 = 2114;
        *(void *)v115 = v72;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v74;
        _os_log_impl(&dword_1DB936000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Retrieved existing audio volume %f for MediaExperience audio category %{public}@ (active audio session category: %{public}@); did succeed: %{BOOL}d.",
          buf,
          0x30u);
      }

      unint64_t v76 = TLAttentionAwarenessEffectParametersMake(v98);
      BOOL v78 = -[TLAttentionAwarenessEffectCoordinator initWithEffectParameters:audioSession:]([TLAttentionAwarenessEffectCoordinator alloc], "initWithEffectParameters:audioSession:", v76, v77, self->_audioSession);
      effectCoordinator = self->_effectCoordinator;
      self->_effectCoordinator = v78;

      objc_destroyWeak(&v101);
      objc_destroyWeak(&location);
    }
  }
  else if (!attentionPollingToken)
  {
    v80 = TLLogPlayback();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v109 = self;
      __int16 v110 = 2114;
      double v111 = v5;
      _os_log_impl(&dword_1DB936000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Skipping attention awareness effects for %{public}@.", buf, 0x16u);
    }
  }
  self->_isAudioEnvironmentSetup = 1;
}

void __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke_2;
    v7[3] = &unk_1E6C21358;
    v7[4] = WeakRetained;
    uint64_t v9 = a2;
    id v8 = *(id *)(a1 + 32);
    [v6 performTaskWithBlock:v7];
  }
}

uint64_t __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveAttentionPollingEventOfType:*(void *)(a1 + 48) stateDescriptor:*(void *)(a1 + 40)];
}

- (void)_restoreAudioEnvironmentForStateDescriptor:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  double v5 = [v4 alertForAudioEnvironmentSetup];
  id v6 = TLLogPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v72 = self;
    __int16 v73 = 2114;
    id v74 = v4;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironmentForStateDescriptor:(%{public}@).", buf, 0x16u);
  }

  self->_isAudioEnvironmentSetup = 0;
  uint64_t v7 = self->_attentionPollingToken;
  attentionPollingToken = self->_attentionPollingToken;
  self->_attentionPollingToken = 0;

  if (v7)
  {
    uint64_t v9 = +[TLAttentionAwarenessObserver sharedAttentionAwarenessObserver];
    [v9 cancelPollForAttentionWithToken:v7];
  }
  self->_isAttentionAwarenessSubsystemFullyInitialized = 0;
  self->_lastAttentionPollingEventType = 0;
  effectCoordinator = self->_effectCoordinator;
  self->_effectCoordinator = 0;

  BOOL isAudioSessionActive = self->_isAudioSessionActive;
  [(TLAlertQueuePlayerController *)self _deactivateAudioSessionIfNeededForStateDescriptor:v4];
  BOOL v12 = isAudioSessionActive && !self->_isAudioSessionActive;
  queuePlayer = self->_queuePlayer;
  if (queuePlayer)
  {
    [(AVQueuePlayer *)queuePlayer volume];
    if (fabsf(*(float *)&v14 + -1.0) > 0.00000011921)
    {
      LODWORD(v14) = 1.0;
      [(AVQueuePlayer *)self->_queuePlayer setVolume:v14];
      uint64_t v15 = TLLogPlayback();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = self->_queuePlayer;
        *(_DWORD *)buf = 138544130;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v16;
        __int16 v75 = 2048;
        uint64_t v76 = 0x3FF0000000000000;
        __int16 v77 = 2114;
        *(void *)BOOL v78 = v5;
        _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Reverted volume of %{public}@ to %f for %{public}@.", buf, 0x2Au);
      }
    }
  }
  if (self->_prefersToPlayDuringWombat)
  {
    audioSession = self->_audioSession;
    double v18 = (void *)*MEMORY[0x1E4F76550];
    id v70 = 0;
    int v19 = [(AVAudioSession *)audioSession setMXSessionProperty:v18 value:MEMORY[0x1E4F1CC28] error:&v70];
    id v20 = v70;
    double v21 = v20;
    if (!v19 || v20)
    {
      unint64_t v22 = TLLogPlayback();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v58 = self->_audioSession;
        int v59 = objc_msgSend(v21, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544386;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v18;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v58;
        __int16 v77 = 2114;
        *(void *)BOOL v78 = v5;
        *(_WORD *)&v78[8] = 2114;
        *(void *)&v78[10] = v59;
        _os_log_error_impl(&dword_1DB936000, v22, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed setting MXSessionProperty %{public}@ to YES on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x34u);
      }
    }
    else
    {
      self->_prefersToPlayDuringWombat = 0;
      unint64_t v22 = TLLogPlayback();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = self->_audioSession;
        *(_DWORD *)buf = 138544130;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v18;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v23;
        __int16 v77 = 2114;
        *(void *)BOOL v78 = v5;
        _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully set MXSessionProperty %{public}@ to NO on audio session %{public}@ for %{public}@.", buf, 0x2Au);
      }
    }
  }
  if (self->_isIgnoringAccessibilityDisabledVibrationSetting)
  {
    id v24 = self->_audioSession;
    id v69 = 0;
    int v25 = [(AVAudioSession *)v24 setPrefersToVibeWhenVibrationsAreDisabled:0 error:&v69];
    id v26 = v69;
    id v27 = v26;
    if (!v25 || v26)
    {
      BOOL v28 = TLLogPlayback();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v60 = self->_audioSession;
        v61 = objc_msgSend(v27, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544130;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v60;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v5;
        __int16 v77 = 2114;
        *(void *)BOOL v78 = v61;
        _os_log_error_impl(&dword_1DB936000, v28, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed setting prefersToVibeWhenVibrationsAreDisabled to NO on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);
      }
    }
    else
    {
      self->_isIgnoringAccessibilityDisabledVibrationSetting = 0;
      BOOL v28 = TLLogPlayback();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        double v29 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v29;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v5;
        _os_log_impl(&dword_1DB936000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully set prefersToVibeWhenVibrationsAreDisabled to NO on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }
  }
  if (self->_isBypassingRingerSwitchPolicy)
  {
    __int16 v30 = self->_audioSession;
    id v68 = 0;
    int v31 = [(AVAudioSession *)v30 setBypassRingerSwitchPolicy:0 error:&v68];
    id v32 = v68;
    uint64_t v33 = v32;
    if (!v31 || v32)
    {
      __int16 v34 = TLLogPlayback();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v62 = self->_audioSession;
        int v63 = objc_msgSend(v33, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544130;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v62;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v5;
        __int16 v77 = 2114;
        *(void *)BOOL v78 = v63;
        _os_log_error_impl(&dword_1DB936000, v34, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed to stop bypassing ringer switch policy on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);
      }
    }
    else
    {
      self->_isBypassingRingerSwitchPolicy = 0;
      __int16 v34 = TLLogPlayback();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v35 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v35;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v5;
        _os_log_impl(&dword_1DB936000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully stopped bypassing ringer switch policy on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }
  }
  if ([(NSString *)self->_previousAudioCategory length])
  {
    id v66 = v4;
    uint64_t v36 = v7;
    BOOL v37 = v5;
    BOOL v38 = v12;
    v39 = self->_previousAudioCategory;
    unint64_t previousAudioCategoryOptions = self->_previousAudioCategoryOptions;
    int64_t v41 = self->_previousAudioMode;
    int v42 = self->_audioSession;
    id v67 = 0;
    BOOL v43 = [(AVAudioSession *)v42 setCategory:v39 mode:v41 options:previousAudioCategoryOptions error:&v67];
    id v44 = v67;
    previousAudioCategory = self->_previousAudioCategory;
    self->_previousAudioCategory = 0;

    previousAudioMode = self->_previousAudioMode;
    self->_unint64_t previousAudioCategoryOptions = 0;
    self->_previousAudioMode = 0;

    BOOL v47 = TLLogPlayback();
    int v48 = v47;
    if (!v43 || v44)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        double v65 = self->_audioSession;
        double v64 = objc_msgSend(v44, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544642;
        v72 = self;
        __int16 v73 = 2114;
        id v74 = v39;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v41;
        __int16 v77 = 1024;
        *(_DWORD *)BOOL v78 = previousAudioCategoryOptions;
        *(_WORD *)&v78[4] = 2114;
        *(void *)&v78[6] = v65;
        *(_WORD *)&v78[14] = 2114;
        *(void *)&v78[16] = v64;
        _os_log_error_impl(&dword_1DB936000, v48, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed reverting audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@ with error: %{public}@.", buf, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v49 = self->_audioSession;
      *(_DWORD *)buf = 138544386;
      v72 = self;
      __int16 v73 = 2114;
      id v74 = v39;
      __int16 v75 = 2114;
      uint64_t v76 = (uint64_t)v41;
      __int16 v77 = 1024;
      *(_DWORD *)BOOL v78 = previousAudioCategoryOptions;
      *(_WORD *)&v78[4] = 2114;
      *(void *)&v78[6] = v49;
      _os_log_impl(&dword_1DB936000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully reverted audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@.", buf, 0x30u);
    }

    BOOL v12 = v38;
    double v5 = v37;
    uint64_t v7 = v36;
    id v4 = v66;
  }
  if (self->_audioSession)
  {
    if ([(TLAlertQueuePlayerController *)self _isPreventingAudioSessionDeactivation])
    {
      TLLogPlayback();
      int v50 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v50->super, OS_LOG_TYPE_DEFAULT))
      {
        id v51 = "auxiliary";
        int v52 = self->_audioSession;
        if (!self->_isUsingAuxiliaryAudioSession) {
          id v51 = "shared";
        }
        *(_DWORD *)buf = 138543874;
        v72 = self;
        __int16 v73 = 2082;
        id v74 = (id)v51;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v52;
        _os_log_impl(&dword_1DB936000, &v50->super, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Currently preventing audio session deactivation. Hence, not clearing %{public}s audio session %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      BOOL isUsingAuxiliaryAudioSession = self->_isUsingAuxiliaryAudioSession;
      int v50 = self->_audioSession;
      if (self->_isUsingAuxiliaryAudioSession)
      {
        [(TLAlertQueuePlayerController *)self _resetFlagsForSwitchingAuxiliaryAudioSession];
        [(TLAlertQueuePlayerController *)self _destroyQueuePlayerForStateDescriptor:v4];
        self->_BOOL isUsingAuxiliaryAudioSession = 0;
      }
      v54 = self->_audioSession;
      self->_audioSession = 0;

      uint64_t v55 = TLLogPlayback();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        double v56 = "auxiliary";
        *(_DWORD *)buf = 138543874;
        v72 = self;
        if (!isUsingAuxiliaryAudioSession) {
          double v56 = "shared";
        }
        __int16 v73 = 2082;
        id v74 = (id)v56;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v50;
        _os_log_impl(&dword_1DB936000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Cleared %{public}s audio session %{public}@.", buf, 0x20u);
      }
    }
  }
  self->_externalEnvironmentValues = 0;
  if (v12)
  {
    [(TLAlertQueuePlayerController *)self _resetClientPriorityForStateDescriptor:v4];
  }
  else
  {
    int v57 = TLLogPlayback();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v72 = self;
      _os_log_impl(&dword_1DB936000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Skipping reset client priority because the audio session was not just deactivated.", buf, 0xCu);
    }
  }
  [(TLAlertQueuePlayerController *)self _destroyQueuePlayerForStateDescriptor:v4];
}

- (void)_resetClientPriorityForStateDescriptor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  queuePlayer = self->_queuePlayer;
  if (queuePlayer)
  {
    [(AVQueuePlayer *)queuePlayer _setClientPriority:0];
    id v6 = TLLogPlayback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = self->_queuePlayer;
      id v8 = [v4 alertForAudioEnvironmentSetup];
      int v9 = 138544386;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2114;
      __int16 v16 = v7;
      __int16 v17 = 2114;
      double v18 = v8;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_resetClientPriorityForStateDescriptor:(%{public}@). Reset client priority to %ld on %{public}@ for %{public}@.", (uint8_t *)&v9, 0x34u);
    }
  }
}

- (void)_resetFlagsForSwitchingAuxiliaryAudioSession
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  BOOL isBypassingRingerSwitchPolicy = self->_isBypassingRingerSwitchPolicy;
  if (self->_isBypassingRingerSwitchPolicy) {
    self->_BOOL isBypassingRingerSwitchPolicy = 0;
  }
  if (self->_isIgnoringAccessibilityDisabledVibrationSetting)
  {
    p_BOOL isAudioSessionActive = &self->_isAudioSessionActive;
    BOOL isAudioSessionActive = self->_isAudioSessionActive;
    self->_isIgnoringAccessibilityDisabledVibrationSetting = 0;
    if (!isAudioSessionActive) {
      goto LABEL_8;
    }
  }
  else
  {
    p_BOOL isAudioSessionActive = &self->_isAudioSessionActive;
    if (!self->_isAudioSessionActive)
    {
      if (!isBypassingRingerSwitchPolicy) {
        return;
      }
      goto LABEL_8;
    }
  }
  *p_BOOL isAudioSessionActive = 0;
LABEL_8:
  id v6 = TLLogPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    audioSession = self->_audioSession;
    int v8 = 138543618;
    int v9 = self;
    __int16 v10 = 2114;
    __int16 v11 = audioSession;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_resetFlagsForSwitchingAuxiliaryAudioSession. Did reset internal flags related to auxiliary audio session %{public}@.", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_applyAudioVolume:(float)a3 forAlert:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  double v6 = COERCE_DOUBLE(a4);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  unint64_t v7 = [(id)objc_opt_class() _audioVolumeApplicationPolicyForAlert:*(void *)&v6 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues];
  unint64_t v8 = v7;
  if (v7 > 3) {
    *(double *)&int v9 = 0.0;
  }
  else {
    int v9 = off_1E6C221C8[v7];
  }
  __int16 v10 = TLLogPlayback();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    __int16 v34 = self;
    __int16 v35 = 2048;
    double v36 = a3;
    __int16 v37 = 2114;
    double v38 = v6;
    __int16 v39 = 2114;
    double v40 = *(double *)&v9;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_applyAudioVolume:(%f) forAlert:(%{public}@): Policy for applying audio volume: %{public}@.", buf, 0x2Au);
  }

  switch(v8)
  {
    case 3uLL:
      *(double *)&__int16 v13 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      float v32 = 0.0;
      if ([v13 getActiveCategoryVolume:&v32 andName:0]&& vabds_f32(v32, a3) <= 0.00000011921)
      {
        TLLogPlayback();
        *(double *)&id v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          __int16 v34 = self;
          __int16 v35 = 2114;
          double v36 = *(double *)&v13;
          __int16 v37 = 2048;
          double v38 = a3;
          __int16 v39 = 2114;
          double v40 = v6;
          double v21 = "%{public}@: -_applyAudioVolume…: Existing volume on %{public}@ for active audio category matches request"
                "ed volume %f for %{public}@.";
          unint64_t v22 = v20;
          uint32_t v23 = 42;
          goto LABEL_26;
        }
      }
      else
      {
        *(float *)&double v18 = a3;
        int v19 = [v13 setActiveCategoryVolumeTo:v18];
        TLLogPlayback();
        *(double *)&id v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          __int16 v34 = self;
          __int16 v35 = 2114;
          double v36 = *(double *)&v13;
          __int16 v37 = 2048;
          double v38 = a3;
          __int16 v39 = 2114;
          double v40 = v6;
          __int16 v41 = 1024;
          LODWORD(v42) = v19;
          double v21 = "%{public}@: -_applyAudioVolume…: Adjusted volume on %{public}@ for active audio category to %f for %{pub"
                "lic}@; did succeed: %{BOOL}d.";
          unint64_t v22 = v20;
          uint32_t v23 = 48;
LABEL_26:
          _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        }
      }
LABEL_31:

      goto LABEL_32;
    case 2uLL:
      *(double *)&__int16 v13 = [(id)objc_opt_class() _audioCategoryForAlert:*(void *)&v6 externalEnvironmentValues:*(_WORD *)&self->_externalEnvironmentValues];
      *(double *)&id v20 = [(id)objc_opt_class() _mediaExperienceAudioCategoryForAudioSessionCategory:v13];
      double v24 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      float v32 = 0.0;
      if ([*(id *)&v24 getVolume:&v32 forCategory:v20]
        && vabds_f32(v32, a3) <= 0.00000011921)
      {
        id v27 = TLLogPlayback();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          __int16 v34 = self;
          __int16 v35 = 2114;
          double v36 = v24;
          __int16 v37 = 2114;
          double v38 = *(double *)&v20;
          __int16 v39 = 2048;
          double v40 = a3;
          __int16 v41 = 2114;
          double v42 = v6;
          BOOL v28 = "%{public}@: -_applyAudioVolume…: Existing volume on %{public}@ for MediaExperience audio category %{publ"
                "ic}@ matches requested volume %f for %{public}@.";
          double v29 = v27;
          uint32_t v30 = 52;
          goto LABEL_29;
        }
      }
      else
      {
        *(float *)&double v25 = a3;
        int v26 = [*(id *)&v24 setVolumeTo:v20 forCategory:v25];
        id v27 = TLLogPlayback();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544642;
          __int16 v34 = self;
          __int16 v35 = 2114;
          double v36 = v24;
          __int16 v37 = 2114;
          double v38 = *(double *)&v20;
          __int16 v39 = 2048;
          double v40 = a3;
          __int16 v41 = 2114;
          double v42 = v6;
          __int16 v43 = 1024;
          int v44 = v26;
          BOOL v28 = "%{public}@: -_applyAudioVolume…: Adjusted volume on %{public}@ for MediaExperience audio category %{publ"
                "ic}@ to %f for %{public}@; did succeed: %{BOOL}d.";
          double v29 = v27;
          uint32_t v30 = 58;
LABEL_29:
          _os_log_impl(&dword_1DB936000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
        }
      }

      goto LABEL_31;
    case 1uLL:
      queuePlayer = self->_queuePlayer;
      if (queuePlayer)
      {
        [(AVQueuePlayer *)queuePlayer volume];
        if (vabds_f32(*(float *)&v12, a3) <= 0.00000011921)
        {
          TLLogPlayback();
          *(double *)&__int16 v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = self->_queuePlayer;
            *(_DWORD *)buf = 138543874;
            __int16 v34 = self;
            __int16 v35 = 2114;
            double v36 = *(double *)&v31;
            __int16 v37 = 2048;
            double v38 = a3;
            __int16 v15 = "%{public}@: -_applyAudioVolume…: Existing volume of %{public}@ is already set to %f.";
            __int16 v16 = v13;
            uint32_t v17 = 32;
            goto LABEL_23;
          }
        }
        else
        {
          *(float *)&double v12 = a3;
          [(AVQueuePlayer *)self->_queuePlayer setVolume:v12];
          TLLogPlayback();
          *(double *)&__int16 v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = self->_queuePlayer;
            *(_DWORD *)buf = 138544130;
            __int16 v34 = self;
            __int16 v35 = 2114;
            double v36 = *(double *)&v14;
            __int16 v37 = 2048;
            double v38 = a3;
            __int16 v39 = 2114;
            double v40 = v6;
            __int16 v15 = "%{public}@: -_applyAudioVolume…: Adjusted volume of %{public}@ to %f for %{public}@.";
            __int16 v16 = v13;
            uint32_t v17 = 42;
LABEL_23:
            _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
          }
        }
LABEL_32:
      }
      break;
  }
}

- (void)_didReceiveAttentionPollingEventOfType:(int64_t)a3 stateDescriptor:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (a3 == 1)
  {
    uint64_t v45 = @"attention detected";
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    if (a3) {
      uint64_t v45 = 0;
    }
    else {
      uint64_t v45 = @"initialized";
    }
  }
  unint64_t v8 = TLLogPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (objc_class *)objc_opt_class();
    __int16 v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138544130;
    int v52 = self;
    __int16 v53 = 2114;
    v54 = v45;
    __int16 v55 = 2114;
    uint64_t v56 = (uint64_t)v10;
    __int16 v57 = 2048;
    id v58 = v6;
    _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) stateDescriptor:(<%{public}@: %p>).", buf, 0x2Au);
  }
  self->_isAttentionAwarenessSubsystemFullyInitialized = 1;
  self->_lastAttentionPollingEventType = a3;
  __int16 v11 = self->_toneAssetForPendingPlayingAlert;
  BOOL hasToneAssetForPendingPlayingAlert = self->_hasToneAssetForPendingPlayingAlert;
  toneAssetForPendingPlayingAlert = self->_toneAssetForPendingPlayingAlert;
  self->_toneAssetForPendingPlayingAlert = 0;

  self->_BOOL hasToneAssetForPendingPlayingAlert = 0;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v14 = self->_stateDescriptor;
  os_unfair_lock_unlock(&self->_lock);
  __int16 v15 = [(TLAlertQueuePlayerStateDescriptor *)v14 alertForAudioEnvironmentSetup];
  __int16 v16 = [v6 alertForAudioEnvironmentSetup];
  if (v15 == v16)
  {
    if (a3 != 1)
    {
      if (a3 || !hasToneAssetForPendingPlayingAlert) {
        goto LABEL_12;
      }
      int v19 = self;
      id v20 = v14;
      double v21 = v11;
      uint64_t v22 = 0;
LABEL_21:
      [(TLAlertQueuePlayerController *)v19 _startPlaybackForStateDescriptor:v20 usingConfirmedPlayableAsset:v21 hasAlreadyDetectedUserAttention:v22];
      goto LABEL_12;
    }
    uint64_t v23 = [(TLAttentionAwarenessEffectCoordinator *)self->_effectCoordinator effectParameters];
    effectCoordinator = self->_effectCoordinator;
    if (hasToneAssetForPendingPlayingAlert)
    {
      -[TLAttentionAwarenessEffectCoordinator setEffectParameters:](effectCoordinator, "setEffectParameters:", v23, 1065353216);
      int v19 = self;
      id v20 = v14;
      double v21 = v11;
      uint64_t v22 = 1;
      goto LABEL_21;
    }
    double v40 = v15;
    __int16 v41 = v14;
    double v42 = v11;
    int v43 = v7;
    id v44 = v6;
    -[TLAttentionAwarenessEffectCoordinator setEffectParameters:effectMixFadeDuration:](effectCoordinator, "setEffectParameters:effectMixFadeDuration:", v23, 1065353216, 0.75);
    double v25 = [(AVQueuePlayer *)self->_queuePlayer items];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (!v26) {
      goto LABEL_39;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v47;
LABEL_24:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v47 != v28) {
        objc_enumerationMutation(v25);
      }
      uint32_t v30 = *(void **)(*((void *)&v46 + 1) + 8 * v29);
      if (![v30 playHapticTracks]) {
        goto LABEL_37;
      }
      int v31 = objc_msgSend(v30, "tl_hapticTracks");
      float v32 = [v31 attenuatedHapticPlayerItemTrack];
      uint64_t v33 = [v31 hapticPlayerItemTrack];
      __int16 v34 = v33;
      if (v32) {
        break;
      }
      [v33 setActiveHapticChannelIndex:1];
      double v36 = TLLogPlayback();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        int v52 = self;
        __int16 v53 = 2114;
        v54 = v45;
        __int16 v55 = 2048;
        uint64_t v56 = 1;
        __int16 v57 = 2114;
        id v58 = v34;
        __int16 v37 = v36;
        double v38 = "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: [hapticPlayerItemTrack setActiveHapt"
              "icChannelIndex:%ld] on %{public}@.";
        uint32_t v39 = 42;
LABEL_35:
        _os_log_impl(&dword_1DB936000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, v39);
      }
LABEL_36:

LABEL_37:
      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (!v27)
        {
LABEL_39:

          id v6 = v44;
          int v7 = v43;
          uint64_t v14 = v41;
          __int16 v11 = v42;
          __int16 v15 = v40;
          goto LABEL_12;
        }
        goto LABEL_24;
      }
    }
    [v33 setMutesHaptics:1];
    __int16 v35 = TLLogPlayback();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      int v52 = self;
      __int16 v53 = 2114;
      v54 = v45;
      __int16 v55 = 2114;
      uint64_t v56 = (uint64_t)v34;
      _os_log_impl(&dword_1DB936000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: [hapticPlayerItemTrack setMutesHaptics:YES] on %{public}@.", buf, 0x20u);
    }

    [v32 setMutesHaptics:0];
    double v36 = TLLogPlayback();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 138543874;
    int v52 = self;
    __int16 v53 = 2114;
    v54 = v45;
    __int16 v55 = 2114;
    uint64_t v56 = (uint64_t)v32;
    __int16 v37 = v36;
    double v38 = "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: [attenuatedHapticPlayerItemTrack setMute"
          "sHaptics:NO] on %{public}@.";
    uint32_t v39 = 32;
    goto LABEL_35;
  }
  uint32_t v17 = TLLogPlayback();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    int v52 = self;
    __int16 v53 = 2114;
    v54 = v45;
    __int16 v55 = 2114;
    uint64_t v56 = (uint64_t)v15;
    _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: alertForAudioEnvironmentSetup argument doesn't match with activeAlertForAudioEnvironmentSetup: %{public}@. Aborting logic to affect current playback state.", buf, 0x20u);
  }

LABEL_12:
  if (v7)
  {
    attentionPollingToken = self->_attentionPollingToken;
    self->_attentionPollingToken = 0;
  }
}

- (void)_createQueuePlayerIfNecessaryForStateDescriptor:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (AVQueuePlayer *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  double v5 = [(AVQueuePlayer *)v4 playingAlert];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() _clientNameForAlert:v5];
    uint64_t v7 = [(id)objc_opt_class() _clientPriorityForAlert:v5];
    int v8 = [(id)objc_opt_class() _shouldEnsureActiveAudioSessionWhenStartingPlaybackForAlert:v5];
    int v9 = [(id)objc_opt_class() _shouldUseAuxiliaryAudioSessionForAlert:v5];
    __int16 v10 = TLLogPlayback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      uint32_t v30 = self;
      __int16 v31 = 2114;
      float v32 = v4;
      __int16 v33 = 2114;
      uint64_t v34 = (uint64_t)v6;
      __int16 v35 = 2048;
      *(void *)double v36 = v7;
      *(_WORD *)&v36[8] = 1024;
      int v37 = v8;
      __int16 v38 = 1024;
      int v39 = v9;
      _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessaryForStateDescriptor:(%{public}@). clientName = %{public}@. clientPriority = %ld. shouldEnsureActiveAudioSessionWhenStartingPlayback = %{BOOL}d. shouldUseAuxiliaryAudioSession = %{BOOL}d.", buf, 0x36u);
    }

    queuePlayer = self->_queuePlayer;
    if (!queuePlayer) {
      goto LABEL_18;
    }
    int v27 = v8;
    uint64_t v28 = v7;
    double v12 = [(AVQueuePlayer *)queuePlayer _clientName];
    uint64_t v13 = [(AVQueuePlayer *)self->_queuePlayer _clientPriority];
    int v8 = [(AVQueuePlayer *)self->_queuePlayer _ensuresActiveAudioSessionWhenStartingPlayback];
    uint64_t v14 = [(AVQueuePlayer *)self->_queuePlayer audioSession];

    __int16 v15 = TLLogPlayback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      uint32_t v30 = self;
      __int16 v31 = 2114;
      float v32 = v12;
      __int16 v33 = 2048;
      uint64_t v34 = v13;
      __int16 v35 = 1024;
      *(_DWORD *)double v36 = v8;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v14 != 0;
      _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Existing player is configured with clientName = %{public}@. clientPriority = %ld. ensuresActiveAudioSessionWhenStartingPlayback = %{BOOL}d. BOOL isUsingAuxiliaryAudioSession = %{BOOL}d.", buf, 0x2Cu);
    }

    if ([(AVQueuePlayer *)v12 isEqualToString:v6] && v13 == v28)
    {
      BOOL v16 = v27 == v8;
      LOBYTE(v8) = v27;
      if (v16)
      {
        uint64_t v7 = v28;
        if (v9 == (v14 != 0))
        {
LABEL_17:

          if (self->_queuePlayer)
          {
LABEL_25:

            goto LABEL_26;
          }
LABEL_18:
          id v20 = objc_alloc(MEMORY[0x1E4F16670]);
          double v21 = [(TLAudioQueue *)self->_audioQueue _underlyingSerialQueue];
          uint64_t v22 = (AVQueuePlayer *)[v20 initWithDispatchQueue:v21];
          uint64_t v23 = self->_queuePlayer;
          self->_queuePlayer = v22;

          [(AVQueuePlayer *)self->_queuePlayer setAllowsExternalPlayback:0];
          [(AVQueuePlayer *)self->_queuePlayer _setClientPriority:v7];
          [(AVQueuePlayer *)self->_queuePlayer _setClientName:v6];
          if ((v8 & 1) == 0) {
            [(AVQueuePlayer *)self->_queuePlayer _setEnsuresActiveAudioSessionWhenStartingPlayback:0];
          }
          if (self->_isUsingAuxiliaryAudioSession) {
            [(AVQueuePlayer *)self->_queuePlayer setAudioSession:self->_audioSession];
          }
          double v24 = TLLogPlayback();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            double v25 = self->_queuePlayer;
            *(_DWORD *)buf = 138543618;
            uint32_t v30 = self;
            __int16 v31 = 2114;
            float v32 = v25;
            _os_log_impl(&dword_1DB936000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Created queue player: %{public}@.", buf, 0x16u);
          }

          goto LABEL_25;
        }
        uint32_t v17 = TLLogPlayback();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = self->_queuePlayer;
          *(_DWORD *)buf = 138543618;
          uint32_t v30 = self;
          __int16 v31 = 2114;
          float v32 = v26;
          _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Policy for picking between auxiliary and shared audio session doesn't match that of %{public}@. Destroying it.", buf, 0x16u);
        }
      }
      else
      {
        uint32_t v17 = TLLogPlayback();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          double v18 = self->_queuePlayer;
          *(_DWORD *)buf = 138543618;
          uint32_t v30 = self;
          __int16 v31 = 2114;
          float v32 = v18;
          _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Policy for ensuring active audio session when starting playback doesn't match that of %{public}@. Destroying it.", buf, 0x16u);
        }
        uint64_t v7 = v28;
      }
    }
    else
    {
      uint32_t v17 = TLLogPlayback();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        uint32_t v30 = self;
        __int16 v31 = 2114;
        float v32 = v19;
        _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Client name or priority don't match those of %{public}@. Destroying it.", buf, 0x16u);
      }
      uint64_t v7 = v28;
      LOBYTE(v8) = v27;
    }

    [(TLAlertQueuePlayerController *)self _destroyQueuePlayerForStateDescriptor:v4];
    goto LABEL_17;
  }
LABEL_26:
}

- (void)_destroyQueuePlayerForStateDescriptor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (AVQueuePlayer *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (self->_queuePlayer)
  {
    double v5 = TLLogPlayback();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      queuePlayer = self->_queuePlayer;
      int v10 = 138543874;
      __int16 v11 = self;
      __int16 v12 = 2114;
      uint64_t v13 = v4;
      __int16 v14 = 2114;
      __int16 v15 = queuePlayer;
      _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_destroyQueuePlayerForStateDescriptor:(%{public}@). _queuePlayer = %{public}@.", (uint8_t *)&v10, 0x20u);
    }

    if (!self->_isStoppingPlayingAlert) {
      [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v4];
    }
    uint64_t v7 = TLLogPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_queuePlayer;
      int v10 = 138543618;
      __int16 v11 = self;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_destroyQueuePlayer…: Tossing queue player: %{public}@.", (uint8_t *)&v10, 0x16u);
    }

    int v9 = self->_queuePlayer;
    self->_queuePlayer = 0;
  }
}

- (void)_startObservingQueuePlayer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (!self->_isObservingQueuePlayer && self->_queuePlayer)
  {
    uint64_t v3 = TLLogPlayback();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      queuePlayer = self->_queuePlayer;
      int v5 = 138543618;
      id v6 = self;
      __int16 v7 = 2114;
      int v8 = queuePlayer;
      _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startObservingQueuePlayer: %{public}@.", (uint8_t *)&v5, 0x16u);
    }

    [(AVQueuePlayer *)self->_queuePlayer addObserver:self forKeyPath:@"currentItem" options:2 context:_TLAlertQueuePlayerCurrentItemObservationContext];
    [(AVQueuePlayer *)self->_queuePlayer addObserver:self forKeyPath:@"currentItem.status" options:1 context:_TLAlertQueuePlayerCurrentItemStatusObservationContext];
    self->_isObservingQueuePlayer = 1;
  }
}

- (void)_stopObservingQueuePlayer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (self->_isObservingQueuePlayer)
  {
    uint64_t v3 = TLLogPlayback();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      queuePlayer = self->_queuePlayer;
      int v5 = 138543618;
      id v6 = self;
      __int16 v7 = 2114;
      int v8 = queuePlayer;
      _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopObservingQueuePlayer: %{public}@.", (uint8_t *)&v5, 0x16u);
    }

    [(AVQueuePlayer *)self->_queuePlayer removeObserver:self forKeyPath:@"currentItem" context:_TLAlertQueuePlayerCurrentItemObservationContext];
    [(AVQueuePlayer *)self->_queuePlayer removeObserver:self forKeyPath:@"currentItem.status" context:_TLAlertQueuePlayerCurrentItemStatusObservationContext];
    self->_isObservingQueuePlayer = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)_TLAlertQueuePlayerCurrentItemObservationContext == a6
    && [v10 isEqualToString:@"currentItem"])
  {
    uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
    audioQueue = self->_audioQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v24[3] = &unk_1E6C213D0;
    double v25 = v13;
    id v26 = v11;
    int v27 = self;
    id v15 = v13;
    [(TLAudioQueue *)audioQueue performTaskWithBlock:v24];

    uint64_t v16 = v25;
  }
  else
  {
    if ((void *)_TLAlertQueuePlayerCurrentItemStatusObservationContext != a6
      || ![v10 isEqualToString:@"currentItem.status"])
    {
      v19.receiver = self;
      v19.super_class = (Class)TLAlertQueuePlayerController;
      [(TLAlertQueuePlayerController *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_9;
    }
    uint32_t v17 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
    double v18 = self->_audioQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v20[3] = &unk_1E6C213D0;
    double v21 = v17;
    id v22 = v11;
    uint64_t v23 = self;
    id v15 = v17;
    [(TLAudioQueue *)v18 performTaskWithBlock:v20];

    uint64_t v16 = v21;
  }

LABEL_9:
}

void __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke(void *a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = (void *)a1[4];
      uint64_t v3 = a1[5];
      id v4 = (void *)a1[6];
      id v5 = v2;
      [v4 _queuePlayer:v3 currentItemWasUpdatedFromValue:v5];
    }
  }
}

uint64_t __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t v3 = [*(id *)(a1 + 32) integerValue];
      uint64_t v5 = *(void *)(a1 + 40);
      id v4 = *(void **)(a1 + 48);
      return [v4 _queuePlayer:v5 currentItemStatusWasUpdatedToValue:v3];
    }
  }
  return result;
}

- (void)_queuePlayer:(id)a3 currentItemWasUpdatedFromValue:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = (AVQueuePlayer *)a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (self->_queuePlayer == v6)
  {
    int v8 = TLLogPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      int v39 = v6;
      _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdatedFromValue:(%{public}@) for %{public}@.", buf, 0x20u);
    }

    uint64_t v9 = TLLogPlayback();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Calling [removedItem seekToTime:kCMTimeZero completionHandler:NULL] on %{public}@.", buf, 0x16u);
    }

    uint64_t v34 = 0;
    __int16 v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v10 = getkCMTimeZeroSymbolLoc_ptr;
    uint64_t v37 = getkCMTimeZeroSymbolLoc_ptr;
    if (!getkCMTimeZeroSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkCMTimeZeroSymbolLoc_block_invoke;
      int v39 = (AVQueuePlayer *)&unk_1E6C210C8;
      uint64_t v40 = &v34;
      id v11 = (void *)CoreMediaLibrary();
      id v12 = dlsym(v11, "kCMTimeZero");
      *(void *)(v40[1] + 24) = v12;
      getkCMTimeZeroSymbolLoc_ptr = *(void *)(v40[1] + 24);
      uint64_t v10 = v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (!v10)
    {
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
      __break(1u);
    }
    long long v13 = *(_OWORD *)v10;
    uint64_t v33 = *(void *)(v10 + 16);
    long long v32 = v13;
    [v7 seekToTime:&v32 completionHandler:0];
    __int16 v14 = [(AVQueuePlayer *)self->_queuePlayer items];
    uint64_t v15 = [v14 count];

    os_unfair_lock_lock(&self->_lock);
    uint64_t v16 = self->_stateDescriptor;
    uint32_t v17 = [(TLAlertQueuePlayerStateDescriptor *)v16 playingAlert];
    double v18 = [v17 configuration];
    int v19 = [v18 shouldRepeat];

    if ((v15 != 0) | v19 & 1)
    {
      os_unfair_lock_unlock(&self->_lock);
      if (v15)
      {
        [(TLAlertQueuePlayerController *)self _stopObservingQueuePlayer];
        BOOL v20 = [(AVQueuePlayer *)self->_queuePlayer status] == 2;
        double v21 = TLLogPlayback();
        id v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[TLAlertQueuePlayerController _queuePlayer:currentItemWasUpdatedFromValue:]();
          }
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v7;
            _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Re-inserting that same item again: %{public}@.", buf, 0x16u);
          }

          [(AVQueuePlayer *)self->_queuePlayer insertItem:v7 afterItem:0];
        }
        [(TLAlertQueuePlayerController *)self _startObservingQueuePlayer];
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v23 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor stateDescriptorForCompletedPlayback];
      stateDescriptor = self->_stateDescriptor;
      self->_stateDescriptor = v23;

      double v25 = TLLogPlayback();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor debugDescription];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_1DB936000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Updated _stateDescriptor to %{public}@.", buf, 0x16u);
      }
      os_unfair_lock_unlock(&self->_lock);
    }
    if (v19)
    {
      BOOL v27 = !self->_isWaitingToCompleteReloadPlaybackRequest;
      uint64_t v28 = TLLogPlayback();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v29)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl(&dword_1DB936000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: The queue was exhausted prematurely; this can happen if the ringtone ass"
            "et contains corrupted audio data. Start over with default tone.",
            buf,
            0xCu);
        }

        [(TLAlertQueuePlayerController *)self _stopObservingQueuePlayer];
        __int16 v31 = [(TLAlertQueuePlayerController *)self _fallbackToneIdentifierForStateDescriptor:v16];
        [(TLAlertQueuePlayerController *)self _reloadPlaybackForStateDescriptor:v16 withToneIdentifier:v31];
      }
      else
      {
        if (v29)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl(&dword_1DB936000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: The queue was exhausted prematurely, but we are already waiting for a fallback tone to begin playing. Doing nothing.", buf, 0xCu);
        }
      }
    }
    else
    {
      uint32_t v30 = TLLogPlayback();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_1DB936000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Playback of non repeating tone completed by playing to end.", buf, 0xCu);
      }

      [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v16];
      [(TLAlertQueuePlayerStateDescriptor *)v16 invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:0 error:0];
    }
    goto LABEL_33;
  }
LABEL_34:
}

- (void)_queuePlayer:(id)a3 currentItemStatusWasUpdatedToValue:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (AVQueuePlayer *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (a4 == 2 && self->_queuePlayer == v6)
  {
    id v7 = [(AVQueuePlayer *)v6 currentItem];
    int v8 = [v7 error];
    uint64_t v9 = [v8 code];

    uint64_t v10 = TLLogPlayback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138544130;
      uint64_t v16 = self;
      __int16 v17 = 2048;
      uint64_t v18 = 2;
      __int16 v19 = 2114;
      BOOL v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      _os_log_error_impl(&dword_1DB936000, v10, OS_LOG_TYPE_ERROR, "%{public}@: currentItemStatusWasUpdatedToValue:(%ld) for %{public}@. itemStatus == AVPlayerItemStatusFailed. currentItemErrorCode: %ld.", (uint8_t *)&v15, 0x2Au);
    }

    if (v9 != -11819)
    {
      BOOL isWaitingToCompleteReloadPlaybackRequest = self->_isWaitingToCompleteReloadPlaybackRequest;
      id v12 = TLLogPlayback();
      long long v13 = v12;
      if (isWaitingToCompleteReloadPlaybackRequest)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138543874;
          uint64_t v16 = self;
          __int16 v17 = 2048;
          uint64_t v18 = 2;
          __int16 v19 = 2114;
          BOOL v20 = v6;
          _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemStatusWasUpdatedToValue:(%ld) for %{public}@. Tone could not be prepared for playback, but we are already waiting for a fallback tone to begin playing. Doing nothing.", (uint8_t *)&v15, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[TLAlertQueuePlayerController _queuePlayer:currentItemStatusWasUpdatedToValue:]();
        }

        [(TLAlertQueuePlayerController *)self _stopObservingQueuePlayer];
        os_unfair_lock_lock(&self->_lock);
        __int16 v14 = self->_stateDescriptor;
        os_unfair_lock_unlock(&self->_lock);
        long long v13 = [(TLAlertQueuePlayerController *)self _fallbackToneIdentifierForStateDescriptor:v14];
        [(TLAlertQueuePlayerController *)self _reloadPlaybackForStateDescriptor:v14 withToneIdentifier:v13];
      }
    }
  }
}

+ (id)_clientNameForAlert:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configuration];
  uint64_t v5 = [v3 type];

  id v6 = [v4 topic];
  if (([v4 isForPreview] & 1) != 0 || v5 == 1)
  {
    id v7 = @"Phone";
  }
  else if (v5 == 16 {
         && ([v6 isEqualToString:@"TLAlertTopicSystemNotificationFindMyDevice"] & 1) != 0)
  }
  {
    id v7 = @"LocatePhone";
  }
  else
  {
    id v7 = @"ToneLibrary";
  }

  return v7;
}

+ (int64_t)_clientPriorityForAlert:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configuration];
  if ([v4 isForPreview])
  {
    int64_t v5 = 0;
  }
  else if ([v3 type] == 1)
  {
    int64_t v5 = 10;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldEnsureActiveAudioSessionWhenStartingPlaybackForAlert:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 configuration];
  if ([v5 isForPreview]) {
    LOBYTE(v6) = 1;
  }
  else {
    int v6 = [a1 _shouldHandleAudioSessionActivationForAlert:v4] ^ 1;
  }

  return v6;
}

+ (id)_audioCategoryForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  BOOL var0 = a4.var0;
  id v5 = a3;
  int v6 = [v5 configuration];
  uint64_t v7 = [v5 type];

  int v8 = [v6 topic];
  uint64_t v9 = [v6 audioCategory];
  if (![v9 length])
  {
    if ([v6 isForPreview])
    {
      uint64_t v10 = (id *)MEMORY[0x1E4F14FB8];
      if (v7 == 13) {
        uint64_t v10 = (id *)MEMORY[0x1E4F14F60];
      }
    }
    else
    {
      switch(v7)
      {
        case 16:
          if (([v8 isEqualToString:@"TLAlertTopicSystemNotificationFindMyDevice"] & 1) == 0) {
            goto LABEL_25;
          }
          goto LABEL_8;
        case 17:
          if (![v8 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"]) {
            goto LABEL_25;
          }
          id v11 = (id *)MEMORY[0x1E4F14F98];
          if (!var0) {
            id v11 = (id *)MEMORY[0x1E4F14F70];
          }
          goto LABEL_24;
        case 18:
          if ([v6 shouldForcePlayingAtUserSelectedAudioVolume])
          {
            id v11 = (id *)MEMORY[0x1E4F14F60];
          }
          else if ([v8 isEqualToString:@"TLAlertTopicEmergencyNonInterrupting"])
          {
            id v11 = (id *)MEMORY[0x1E4F14F98];
          }
          else
          {
            int v15 = [v6 shouldIgnoreRingerSwitch];
            id v11 = (id *)MEMORY[0x1E4F14F78];
            if (v15) {
              id v11 = (id *)MEMORY[0x1E4F14F70];
            }
          }
          goto LABEL_24;
        case 19:
        case 20:
        case 21:
          goto LABEL_25;
        case 22:
LABEL_8:
          id v11 = (id *)MEMORY[0x1E4F14F80];
          goto LABEL_24;
        default:
          if (v7 == 28) {
            goto LABEL_13;
          }
          if (v7 != 1) {
            goto LABEL_25;
          }
          if (([v8 isEqualToString:@"TLAlertTopicIncomingCallAppNotification"] & 1) == 0)
          {
            id v12 = [MEMORY[0x1E4F28F80] processInfo];
            long long v13 = [v12 processName];
            char v14 = [v13 isEqualToString:@"tlutil"];

            if ((v14 & 1) == 0) {
              goto LABEL_28;
            }
          }
LABEL_13:
          id v11 = (id *)MEMORY[0x1E4F14FB0];
LABEL_24:
          id v16 = *v11;

          uint64_t v9 = v16;
LABEL_25:
          if ([v9 length]) {
            goto LABEL_28;
          }
          uint64_t v10 = (id *)MEMORY[0x1E4F14F60];
          break;
      }
    }
    id v17 = *v10;

    uint64_t v9 = v17;
  }
LABEL_28:

  return v9;
}

+ (unint64_t)_audioCategoryOptionsForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  int v4 = *(_DWORD *)&a4.var0;
  id v5 = a3;
  uint64_t v6 = [v5 type];
  uint64_t v7 = [v5 configuration];

  int v8 = [v7 topic];

  if (v6 == 18)
  {
    unsigned int v9 = [v8 isEqualToString:@"TLAlertTopicEmergencyNonInterrupting"];
  }
  else if (v6 == 17)
  {
    unsigned int v9 = [v8 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"] & v4;
  }
  else
  {
    unsigned int v9 = 0;
  }
  unint64_t v10 = v9;

  return v10;
}

+ (id)_audioModeForAlert:(id)a3 audioCategory:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:*MEMORY[0x1E4F14F70]]
    && ([v5 configuration],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 _hasCustomAudioVolume],
        v6,
        v7))
  {
    id v8 = (id)*MEMORY[0x1E4F15058];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_mediaExperienceAudioCategoryForAudioSessionCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F14F60]])
  {
    int v4 = @"Alarm";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F14FB0]])
  {
    int v4 = @"Ringtone";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F14FB8]])
  {
    int v4 = @"RingtonePreview";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F14F80]])
  {
    int v4 = @"FindMyPhone";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F14F70]])
  {
    int v4 = @"EmergencyAlert";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F14F78]])
  {
    int v4 = @"EmergencyAlert_Muteable";
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (float)_audioVolumeForAlert:(id)a3 audioCategory:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v8 = [v6 configuration];
  [v8 audioVolume];
  float v10 = v9;
  if (([v8 _hasCustomAudioVolume] & 1) == 0
    && [v7 isEqualToString:*MEMORY[0x1E4F14F60]])
  {
    float v16 = 1.0;
    id v11 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    int v12 = [v11 getVolume:&v16 forCategory:@"Ringtone"];
    long long v13 = TLLogPlayback();
    char v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v18 = self;
        __int16 v19 = 2114;
        id v20 = v6;
        __int16 v21 = 2048;
        double v22 = v16;
        _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_audioVolumeFor…: Did retrieve ringer volume successfully for fallback volume value for alert %{public}@: %f.", buf, 0x20u);
      }

      float v10 = v16;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v18 = self;
        __int16 v19 = 2114;
        id v20 = v6;
        __int16 v21 = 2048;
        double v22 = v10;
        _os_log_error_impl(&dword_1DB936000, v14, OS_LOG_TYPE_ERROR, "%{public}@: -_audioVolumeFor…: Failed to retrieve ringer volume for fallback volume value for alert %{public}@. Using default value instead: %f.", buf, 0x20u);
      }
    }
  }

  return v10;
}

+ (BOOL)_shouldBypassRingerSwitchPolicyForAlert:(id)a3
{
  id v3 = a3;
  int v4 = [v3 configuration];
  if (([v4 isForPreview] & 1) != 0
    || [v3 type] == 18 && !objc_msgSend(v4, "shouldForcePlayingAtUserSelectedAudioVolume"))
  {
    char v5 = 0;
  }
  else
  {
    char v5 = [v4 shouldIgnoreRingerSwitch];
  }

  return v5;
}

+ (BOOL)_prefersToPlayDuringWombatForAlert:(id)a3
{
  return [a3 type] == 18;
}

+ (BOOL)_shouldUseAuxiliaryAudioSessionForAlert:(id)a3
{
  return [a3 type] != 1;
}

+ (BOOL)_shouldHandleAudioSessionActivationForAlert:(id)a3
{
  id v3 = a3;
  int v4 = [v3 configuration];
  uint64_t v5 = [v3 type];
  id v6 = [v3 configuration];

  id v7 = [v6 topic];

  if (v5 != 1
    || ([v4 isForPreview] & 1) != 0
    || ([v7 isEqualToString:@"TLAlertTopicIncomingCallAppNotification"] & 1) != 0)
  {
    char v8 = 1;
  }
  else
  {
    float v10 = [MEMORY[0x1E4F28F80] processInfo];
    id v11 = [v10 processName];
    char v8 = [v11 isEqualToString:@"tlutil"];
  }
  return v8;
}

- (void)_activateAudioSessionIfNeededForStateDescriptor:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  uint64_t v5 = [v4 alertForAudioEnvironmentSetup];
  if (!self->_isAudioSessionActive
    && [(id)objc_opt_class() _shouldHandleAudioSessionActivationForAlert:v5])
  {
    audioSession = self->_audioSession;
    id v15 = 0;
    BOOL v7 = [(AVAudioSession *)audioSession setActive:1 error:&v15];
    id v8 = v15;
    float v9 = v8;
    if (!v7 || v8)
    {
      int v12 = TLLogPlayback();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v13 = self->_audioSession;
        char v14 = objc_msgSend(v9, "tl_nonRedundantDescription");
        *(_DWORD *)buf = 138544130;
        id v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = v13;
        __int16 v20 = 2114;
        __int16 v21 = v5;
        __int16 v22 = 2114;
        uint64_t v23 = v14;
        _os_log_error_impl(&dword_1DB936000, v12, OS_LOG_TYPE_ERROR, "%{public}@: -_activateAudioSession…: Failed activating audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);
      }
    }
    else
    {
      self->_BOOL isAudioSessionActive = 1;
      float v10 = TLLogPlayback();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        id v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = v11;
        __int16 v20 = 2114;
        __int16 v21 = v5;
        _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_activateAudioSession…: Successfully activated audio session %{public}@ for %{public}@.", buf, 0x20u);
      }

      [(TLAlertQueuePlayerController *)self _startObservingAudioSessionInterruptionNotificationsForStateDescriptor:v4];
    }
  }
}

- (void)_deactivateAudioSessionIfNeededForStateDescriptor:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (AVAudioSession *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  uint64_t v5 = TLLogPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAudioSessionActive = self->_isAudioSessionActive;
    *(_DWORD *)buf = 138543874;
    __int16 v22 = self;
    __int16 v23 = 2114;
    uint64_t v24 = v4;
    __int16 v25 = 1024;
    LODWORD(v26) = isAudioSessionActive;
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSessionIfNeededForStateDescriptor:(%{public}@): _BOOL isAudioSessionActive = %{BOOL}d.", buf, 0x1Cu);
  }

  BOOL v7 = [(AVAudioSession *)v4 alertForAudioEnvironmentSetup];
  if (self->_isAudioSessionActive)
  {
    if ([(TLAlertQueuePlayerController *)self _isPreventingAudioSessionDeactivation])
    {
      id v8 = TLLogPlayback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v22 = self;
        _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSession…: Skipping audio session deactivation because it is currently being prevented.", buf, 0xCu);
      }
    }
    else
    {
      [(TLAlertQueuePlayerController *)self _stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:v4];
      float v9 = TLLogPlayback();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        audioSession = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        __int16 v22 = self;
        __int16 v23 = 2114;
        uint64_t v24 = audioSession;
        __int16 v25 = 2114;
        id v26 = v7;
        _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSession…: About to deactivate audio session %{public}@ for %{public}@.", buf, 0x20u);
      }

      id v11 = self->_audioSession;
      id v20 = 0;
      BOOL v12 = [(AVAudioSession *)v11 setActive:0 withOptions:1 error:&v20];
      long long v13 = v20;
      id v8 = v13;
      if (!v12 || v13)
      {
        if ([v13 code] != 560030580)
        {
          float v16 = TLLogPlayback();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            __int16 v18 = self->_audioSession;
            __int16 v19 = [v8 tl_nonRedundantDescription];
            *(_DWORD *)buf = 138544130;
            __int16 v22 = self;
            __int16 v23 = 2114;
            uint64_t v24 = v18;
            __int16 v25 = 2114;
            id v26 = v7;
            __int16 v27 = 2114;
            uint64_t v28 = v19;
            _os_log_error_impl(&dword_1DB936000, v16, OS_LOG_TYPE_ERROR, "%{public}@: -_deactivateAudioSession…: Failed to deactivate audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);
          }
          [(TLAlertQueuePlayerController *)self _startObservingAudioSessionInterruptionNotificationsForStateDescriptor:v4];
          goto LABEL_20;
        }
        self->_BOOL isAudioSessionActive = 0;
        char v14 = TLLogPlayback();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v17 = self->_audioSession;
          *(_DWORD *)buf = 138543874;
          __int16 v22 = self;
          __int16 v23 = 2114;
          uint64_t v24 = v17;
          __int16 v25 = 2114;
          id v26 = v7;
          _os_log_error_impl(&dword_1DB936000, v14, OS_LOG_TYPE_ERROR, "%{public}@: -_deactivateAudioSession…: Failed to deactivate audio session %{public}@ for %{public}@ with error code AVAudioSessionErrorCodeIsBusy. Treating that as a successful audio session deactivation.", buf, 0x20u);
        }
      }
      else
      {
        self->_BOOL isAudioSessionActive = 0;
        char v14 = TLLogPlayback();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = self->_audioSession;
          *(_DWORD *)buf = 138543874;
          __int16 v22 = self;
          __int16 v23 = 2114;
          uint64_t v24 = v15;
          __int16 v25 = 2114;
          id v26 = v7;
          _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSession…: Successfully deactivated audio session %{public}@ for %{public}@.", buf, 0x20u);
        }
      }
    }
LABEL_20:
  }
}

- (void)_startObservingAudioSessionInterruptionNotificationsForStateDescriptor:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (!self->_isObservingAudioSessionInterruptionNotification)
  {
    self->_isObservingAudioSessionInterruptionNotification = 1;
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handleAudioSessionInterruptionNotification_ name:*MEMORY[0x1E4F15000] object:self->_audioSession];

    id v6 = TLLogPlayback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [v4 playingAlert];
      int v8 = 138543618;
      float v9 = self;
      __int16 v10 = 2114;
      id v11 = v7;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startObservingAudioSessionInterruptionNotifications…: Started observing interruptions for %{public}@.", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (self->_isObservingAudioSessionInterruptionNotification)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4F15000] object:self->_audioSession];

    self->_isObservingAudioSessionInterruptionNotification = 0;
    id v6 = TLLogPlayback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [v4 playingAlert];
      int v8 = 138543618;
      float v9 = self;
      __int16 v10 = 2114;
      id v11 = v7;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopObservingAudioSessionInterruptionNotifications…: Stopped observing interruptions for %{public}@.", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_handleAudioSessionInterruptionNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F15020]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  int v8 = [v4 userInfo];

  float v9 = [v8 objectForKey:*MEMORY[0x1E4F15008]];
  uint64_t v10 = [v9 unsignedIntegerValue];

  audioQueue = self->_audioQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__TLAlertQueuePlayerController__handleAudioSessionInterruptionNotification___block_invoke;
  v12[3] = &unk_1E6C22160;
  v12[4] = self;
  v12[5] = v7;
  v12[6] = v10;
  [(TLAudioQueue *)audioQueue performTaskWithBlock:v12];
}

uint64_t __76__TLAlertQueuePlayerController__handleAudioSessionInterruptionNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAudioSessionInterruptionOfType:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48)];
}

- (void)_handleAudioSessionInterruptionOfType:(unint64_t)a3 withOptions:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  if (a3 == 1)
  {
    uint64_t v7 = TLLogPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      float v16 = self;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleAudioSessionInterruption…: Handling interruption of type AVAudioSessionInterruptionTypeBegan.", (uint8_t *)&v15, 0xCu);
    }

    os_unfair_lock_lock(p_lock);
    int v8 = self->_stateDescriptor;
    float v9 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor stateDescriptorForCompletedPlayback];
    stateDescriptor = self->_stateDescriptor;
    self->_stateDescriptor = v9;

    id v11 = TLLogPlayback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(TLAlertQueuePlayerStateDescriptor *)self->_stateDescriptor debugDescription];
      int v15 = 138543618;
      float v16 = self;
      __int16 v17 = 2114;
      __int16 v18 = v12;
      _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleAudioSessionInterruption…: Updated _stateDescriptor to %{public}@.", (uint8_t *)&v15, 0x16u);
    }
    os_unfair_lock_unlock(p_lock);
    long long v13 = TLLogPlayback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = [(TLAlertQueuePlayerStateDescriptor *)v8 playingAlert];
      int v15 = 138543618;
      float v16 = self;
      __int16 v17 = 2114;
      __int16 v18 = v14;
      _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleAudioSessionInterruption…: Resetting state and marking %{public}@ as interrupted by the system.", (uint8_t *)&v15, 0x16u);
    }
    self->_BOOL isAudioSessionActive = 0;
    [(TLAlertQueuePlayerController *)self _stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:v8];
    [(TLAlertQueuePlayerController *)self _stopPlaybackForStateDescriptor:v8 withOptions:0 playerWasAlreadyPausedExternally:1];
    [(TLAlertQueuePlayerStateDescriptor *)v8 invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:4 error:0];
  }
}

- (BOOL)_isPreventingAudioSessionDeactivation
{
  return self->_audioSessionDeactivationPreventionRequestsCount != 0;
}

- (void)_beginPreventingAudioSessionDeactivation
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  ++self->_audioSessionDeactivationPreventionRequestsCount;
  id v3 = TLLogPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPreventingAudioSessionDeactivation.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_endPreventingAudioSessionDeactivationForStateDescriptor:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  unint64_t audioSessionDeactivationPreventionRequestsCount = self->_audioSessionDeactivationPreventionRequestsCount;
  if (!audioSessionDeactivationPreventionRequestsCount)
  {
    uint64_t v6 = TLLogGeneral();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m"];
      float v9 = TLLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v8 lastPathComponent];
        id v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v18 = 136381443;
        uint64_t v19 = (TLAlertQueuePlayerController *)"-[TLAlertQueuePlayerController _endPreventingAudioSessionDeactivationForStateDescriptor:]";
        __int16 v20 = 2113;
        id v21 = v10;
        __int16 v22 = 2049;
        uint64_t v23 = 2069;
        __int16 v24 = 2113;
        __int16 v25 = v11;
        _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v18, 0x2Au);
      }
    }
    else
    {
      int v8 = TLLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    uint64_t v12 = TLLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[TLAlertQueuePlayerController _endPreventingAudioSessionDeactivationForStateDescriptor:]();
    }

    unint64_t audioSessionDeactivationPreventionRequestsCount = self->_audioSessionDeactivationPreventionRequestsCount;
  }
  self->_unint64_t audioSessionDeactivationPreventionRequestsCount = audioSessionDeactivationPreventionRequestsCount - 1;
  long long v13 = TLLogPlayback();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPreventingAudioSessionDeactivationForStateDescriptor:(%{public}@).", (uint8_t *)&v18, 0x16u);
  }

  if (!self->_audioSessionDeactivationPreventionRequestsCount)
  {
    char v14 = [v4 playingAlert];

    if (!v14)
    {
      int v15 = TLLogPlayback();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        uint64_t v19 = self;
        _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPreventingAudioSessionDeactivation…: No alert was playing, calling -_deactivateAudioSessionIfNeeded…", (uint8_t *)&v18, 0xCu);
      }

      BOOL isAudioSessionActive = self->_isAudioSessionActive;
      [(TLAlertQueuePlayerController *)self _deactivateAudioSessionIfNeededForStateDescriptor:v4];
      if (isAudioSessionActive && !self->_isAudioSessionActive)
      {
        [(TLAlertQueuePlayerController *)self _resetClientPriorityForStateDescriptor:v4];
      }
      else
      {
        __int16 v17 = TLLogPlayback();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138543362;
          uint64_t v19 = self;
          _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPreventingAudioSessionDeactivation…: Skipping reset client priority because the audio session was NOT just deactivated.", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
}

+ (BOOL)_shouldVibrateForAlert:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 18
    && ([v3 configuration],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 shouldIgnoreRingerSwitch],
        v4,
        (v5 & 1) != 0))
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = +[TLVibrationManager sharedVibrationManager];
    char v6 = [v7 shouldVibrateForCurrentRingerSwitchState];
  }
  return v6;
}

+ (BOOL)_shouldRepeatVibrationForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  id v6 = a3;
  if (+[TLAlertPlaybackPolicy shouldRepeatVibrationForAlert:v6 withPlaybackBackend:0])
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [a1 _shouldApplyStandardDelayAndAudioVolumeRampForAlert:v6 externalEnvironmentValues:*(unsigned __int16 *)&a4];
  }

  return v7;
}

+ (BOOL)_shouldApplyAttentionAwarenessEffectsForAlert:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configuration];
  char v5 = [v4 isForPreview];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    unint64_t v7 = [v3 type];
    BOOL v6 = 0;
    if (v7 <= 0x1C && ((1 << v7) & 0x10006002) != 0) {
      BOOL v6 = +[TLAttentionAwarenessObserver supportsAttenuatingTonesForAttentionDetected];
    }
  }

  return v6;
}

+ (int64_t)_audioVolumeApplicationPolicyForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [(id)objc_opt_class() _audioCategoryForAlert:v6 externalEnvironmentValues:*(unsigned __int16 *)&a4];
  if ([v7 isEqualToString:*MEMORY[0x1E4F14F60]])
  {
    int v8 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    int v9 = [v8 isHomePod];

    if (v9) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = 2;
    }
  }
  else
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F14F70]])
    {
      id v11 = [a1 _audioModeForAlert:v6 audioCategory:v7];
      if ([v11 isEqualToString:*MEMORY[0x1E4F15058]]) {
        int64_t v10 = 3;
      }
      else {
        int64_t v10 = 1;
      }
    }
    else
    {
      uint64_t v12 = [v6 type];
      long long v13 = [v6 configuration];
      id v11 = [v13 topic];

      if (v12 == 17)
      {
        unsigned int v14 = [v11 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"] ^ 1;
        if (a4.var0) {
          int64_t v10 = v14;
        }
        else {
          int64_t v10 = 1;
        }
      }
      else
      {
        int64_t v10 = 1;
      }
    }
  }
  return v10;
}

+ (double)_audioPlaybackInitiationDelayForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 configuration];
  [v7 _audioPlaybackInitiationDelay];
  double v9 = v8;
  if (v8 <= 0.00000011920929
    && [a1 _shouldApplyStandardDelayAndAudioVolumeRampForAlert:v6 externalEnvironmentValues:*(unsigned __int16 *)&a4])
  {
    double v9 = 3.0;
  }

  return v9;
}

+ (double)_audioVolumeRampingDurationForAlert:(id)a3 externalEnvironmentValues:(id)a4 toneAssetDuration:(double)a5
{
  id v8 = a3;
  double v9 = [v8 configuration];
  [v9 _audioVolumeRampingDuration];
  double v11 = v10;
  if (v10 <= 0.00000011920929)
  {
    int v12 = [a1 _shouldApplyStandardDelayAndAudioVolumeRampForAlert:v8 externalEnvironmentValues:*(unsigned __int16 *)&a4];
    double v13 = fmin(a5 * 0.5, 2.0);
    if (v12) {
      double v11 = v13;
    }
  }

  return v11;
}

+ (BOOL)_shouldApplyStandardDelayAndAudioVolumeRampForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  unint64_t v4 = *(void *)&a4.var0;
  id v5 = a3;
  uint64_t v6 = [v5 type];
  unint64_t v7 = [v5 configuration];

  id v8 = [v7 topic];

  if (v6 == 17) {
    BOOL v9 = [v8 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"] & (v4 >> 8) & 1;
  }
  else {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)_fallbackToneIdentifierForStateDescriptor:(id)a3
{
  audioQueue = self->_audioQueue;
  id v5 = a3;
  [(TLAudioQueue *)audioQueue assertRunningOnAudioQueue];
  uint64_t v6 = [v5 playingAlert];

  if (v6)
  {
    unint64_t v7 = [v6 type];
    id v8 = +[TLToneManager sharedToneManager];
    BOOL v9 = [v8 defaultToneIdentifierForAlertType:v7];
    double v10 = [v6 configuration];
    double v11 = [v10 topic];
    int v12 = [v8 currentToneIdentifierForAlertType:v7 topic:v11];

    if ([(NSString *)self->_playingToneIdentifier isEqualToString:v9])
    {
      double v13 = TLLogPlayback();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(TLAlertQueuePlayerController *)(uint64_t)self _fallbackToneIdentifierForStateDescriptor:v13];
      }

      unsigned int v14 = 0;
    }
    else
    {
      if ([(NSString *)self->_playingToneIdentifier isEqualToString:v12]
        && ([v12 isEqualToString:v9] & 1) == 0)
      {
        id v15 = v9;
      }
      else
      {
        id v15 = v12;
      }
      unsigned int v14 = v15;
    }
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v14;
}

+ ($96EE1C12479E9B303E9C2794B92A11A2)_externalEnvironmentValuesForAlert:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 configuration];
  unint64_t v7 = [v6 topic];

  if (v5 == 17 && [v7 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"])
  {
    id v8 = TLLogPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      id v20 = a1;
      __int16 v21 = 2114;
      id v22 = v4;
      _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _externalEnvironmentValuesForAlert:(%{public}@).", (uint8_t *)&v19, 0x16u);
    }

    BOOL v9 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    double v10 = [v9 attributeForKey:*MEMORY[0x1E4F74B08]];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v10 BOOLValue]) {
      int v11 = [v10 BOOLValue];
    }
    else {
      int v11 = 0;
    }
    double v13 = TLLogPlayback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543874;
      id v20 = a1;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 1024;
      LODWORD(v24) = v11;
      _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: _externalEnvironmentValuesForAlert:(%{public}@): isIncomingCallActive = %{BOOL}d.", (uint8_t *)&v19, 0x1Cu);
    }

    unsigned int v14 = [MEMORY[0x1E4F165D0] sharedSystemAudioContext];
    id v15 = [v14 outputDevice];
    uint64_t v16 = [v15 deviceSubType];

    __int16 v12 = v16 == 4;
    __int16 v17 = TLLogPlayback();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138544130;
      id v20 = a1;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      __int16 v25 = 1024;
      BOOL v26 = v16 == 4;
      _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: _externalEnvironmentValuesForAlert:(%{public}@): outputDeviceSubType = %lld; usesReceiverRoute = %{BOOL}d.",
        (uint8_t *)&v19,
        0x26u);
    }
  }
  else
  {
    __int16 v12 = 0;
    LOWORD(v11) = 0;
  }

  return ($96EE1C12479E9B303E9C2794B92A11A2)(v11 | (v12 << 8));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectCoordinator, 0);
  objc_storeStrong((id *)&self->_attentionPollingToken, 0);
  objc_storeStrong((id *)&self->_previousAudioMode, 0);
  objc_storeStrong((id *)&self->_previousAudioCategory, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_toneAssetForPendingPlayingAlert, 0);
  objc_storeStrong((id *)&self->_playingToneIdentifier, 0);
  objc_storeStrong((id *)&self->_stateDescriptor, 0);

  objc_storeStrong((id *)&self->_audioQueue, 0);
}

- (void)stopPlayingAlerts:withOptions:playbackCompletionType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "API misuse.", v2, v3, v4, v5, v6);
}

- (void)_handleActivationAssertionStatusChangeForAlert:updatedStatus:previousStateDescriptor:updatedStateDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "SPI misuse.", v2, v3, v4, v5, v6);
}

- (void)_reloadPlaybackForStateDescriptor:withToneIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DB936000, v0, OS_LOG_TYPE_ERROR, "%{public}@: -_reloadPlayback…: Failed to prepare tone asset for playback. Aborting.", v1, 0xCu);
}

- (void)_reloadPlaybackForStateDescriptor:withToneIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "%{public}@: -_reloadPlayback…: Failed to instantiate an AVURLAsset with URL: %{public}@.");
}

- (void)_reloadPlaybackForStateDescriptor:withToneIdentifier:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "%{public}@: -_reloadPlayback…: [_queuePlayer status] == AVPlayerStatusFailed for %{public}@. Destroying player.");
}

- (void)_startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "Vibration pattern on the _queuePlayer was expected to be nil at this point.", v2, v3, v4, v5, v6);
}

- (void)_startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DB936000, v0, OS_LOG_TYPE_ERROR, "%{public}@: -_startPlayback… hasAlreadyDetected…: Failed to wrap external vibration pattern as an instance of TLVibrationPattern. Falling back to passing the external vibration pattern through.", v1, 0xCu);
}

- (void)_queuePlayer:currentItemWasUpdatedFromValue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "%{public}@: currentItemWasUpdated…: [_queuePlayer status] == AVPlayerStatusFailed for %{public}@.");
}

- (void)_queuePlayer:currentItemStatusWasUpdatedToValue:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2048;
  uint64_t v4 = 2;
  __int16 v5 = 2114;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_1DB936000, v1, OS_LOG_TYPE_ERROR, "%{public}@: currentItemStatusWasUpdatedToValue:(%ld) for %{public}@. Tone could not be prepared for playback. Start over with fallback tone.", v2, 0x20u);
}

- (void)_endPreventingAudioSessionDeactivationForStateDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "Unbalanced calls to -_beginPreventingAudioSessionDeactivation… and -_endPreventingAudioSessionDeactivation….", v2, v3, v4, v5, v6);
}

- (void)_fallbackToneIdentifierForStateDescriptor:(NSObject *)a3 .cold.1(uint64_t a1, unint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromTLAlertType(a2);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_1DB936000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed to prepare default tone for alert type %{public}@ for playback. All possible fallback cases have been exhausted. Bailing.", (uint8_t *)&v6, 0x16u);
}

@end