@interface PXAppleMusicAudioSession
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (BOOL)stateQueue_hasSeekedOrPlayed;
- (BOOL)stateQueue_isPreparingToPlay;
- (BOOL)stateQueue_shouldPlayWhenPrepared;
- (NSString)playerClientIdentifier;
- (OS_dispatch_queue)stateQueue;
- (PXAppleMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7;
- (PXAppleMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7 playerController:(id)a8;
- (PXAppleMusicPlayerController)playerController;
- (int64_t)stateQueue_playerPlaybackState;
- (void)_ensureCurrentPlayerClient;
- (void)_handlePlayerPreparedToPlay:(BOOL)a3 error:(id)a4;
- (void)_handlePlayerTransactionDeclinedWithError:(id)a3;
- (void)_stateQueue_handlePlayerPreparedToPlay:(BOOL)a3 error:(id)a4;
- (void)_stateQueue_pause;
- (void)_stateQueue_play;
- (void)_stateQueue_playFromTime:(id *)a3;
- (void)_stateQueue_prepareToPlayIfNeeded;
- (void)_stateQueue_updateState;
- (void)_updateContentLoudness;
- (void)_updatePlayerVolume;
- (void)_updateStatus;
- (void)desiredPlayerVolumeDidChange;
- (void)errorDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)pause;
- (void)performFinalCleanup;
- (void)play;
- (void)playFromTime:(id *)a3;
- (void)prepareToPlay;
- (void)setPlayerController:(id)a3;
- (void)setStateQueue_hasSeekedOrPlayed:(BOOL)a3;
- (void)setStateQueue_isPreparingToPlay:(BOOL)a3;
- (void)setStateQueue_playerPlaybackState:(int64_t)a3;
- (void)setStateQueue_shouldPlayWhenPrepared:(BOOL)a3;
@end

@implementation PXAppleMusicAudioSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playerClientIdentifier, 0);
}

- (int64_t)stateQueue_playerPlaybackState
{
  return self->_stateQueue_playerPlaybackState;
}

- (void)setStateQueue_shouldPlayWhenPrepared:(BOOL)a3
{
  self->_stateQueue_shouldPlayWhenPrepared = a3;
}

- (BOOL)stateQueue_shouldPlayWhenPrepared
{
  return self->_stateQueue_shouldPlayWhenPrepared;
}

- (void)setStateQueue_hasSeekedOrPlayed:(BOOL)a3
{
  self->_stateQueue_hasSeekedOrPlayed = a3;
}

- (BOOL)stateQueue_hasSeekedOrPlayed
{
  return self->_stateQueue_hasSeekedOrPlayed;
}

- (BOOL)stateQueue_isPreparingToPlay
{
  return self->_stateQueue_isPreparingToPlay;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (PXAppleMusicPlayerController)playerController
{
  return self->_playerController;
}

- (NSString)playerClientIdentifier
{
  return self->_playerClientIdentifier;
}

- (void)_handlePlayerTransactionDeclinedWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PXAppleMusicAudioSession__handlePlayerTransactionDeclinedWithError___block_invoke;
  v6[3] = &unk_1E5DBA608;
  id v7 = v4;
  id v5 = v4;
  [(PXAudioSession *)self performInternalChanges:v6];
}

uint64_t __70__PXAppleMusicAudioSession__handlePlayerTransactionDeclinedWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setError:*(void *)(a1 + 32)];
}

- (void)_stateQueue_updateState
{
  if ([(PXAppleMusicAudioSession *)self stateQueue_playerPlaybackState] == 2)
  {
    uint64_t v3 = 3;
  }
  else if ([(PXAppleMusicAudioSession *)self stateQueue_isPreparingToPlay])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 2;
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke;
  block[3] = &unk_1E5DD0260;
  objc_copyWeak(v5, &location);
  v5[1] = (id)v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke_2;
  v3[3] = &__block_descriptor_40_e41_v16__0___PXInternalMutableAudioSession__8l;
  v3[4] = *(void *)(a1 + 40);
  [WeakRetained performInternalChanges:v3];
}

void __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 error];

  if (v3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  [v5 setStatus:v4];
}

- (void)setStateQueue_playerPlaybackState:(int64_t)a3
{
  if (self->_stateQueue_playerPlaybackState != a3)
  {
    self->_stateQueue_playerPlaybackState = a3;
    [(PXAppleMusicAudioSession *)self _stateQueue_updateState];
  }
}

- (void)_updateStatus
{
  uint64_t v3 = [(PXAudioSession *)self error];

  if (v3)
  {
    [(PXAudioSession *)self performInternalChanges:&__block_literal_global_39];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v4 = [(PXAppleMusicAudioSession *)self stateQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __41__PXAppleMusicAudioSession__updateStatus__block_invoke_2;
    v5[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v6, &location);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __41__PXAppleMusicAudioSession__updateStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateQueue_updateState");
}

uint64_t __41__PXAppleMusicAudioSession__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatus:4];
}

- (void)_stateQueue_handlePlayerPreparedToPlay:(BOOL)a3 error:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PXAppleMusicAudioSession *)self log];
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      v29 = (PXAppleMusicAudioSession *)[(PXAppleMusicAudioSession *)self logContext];
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v9, "StoryAppleMusicSessionPrepareToPlay", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  [(PXAppleMusicAudioSession *)self setStateQueue_isPreparingToPlay:0];
  BOOL v10 = [(PXAppleMusicAudioSession *)self stateQueue_shouldPlayWhenPrepared];
  if (objc_msgSend(v6, "px_isDomain:code:", @"PXAppleMusicPlayerControllerErrorDomain", 2))
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = @"Apple Music player timed out while preparing to play.";
    uint64_t v13 = 5;
    goto LABEL_17;
  }
  if (!a3)
  {
    char v18 = objc_msgSend(v6, "px_isDomain:code:", @"PXAppleMusicPlayerControllerErrorDomain", 3);
    v19 = PLAudioPlaybackGetLog();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "%@ player was cancelled while preparing to play: %@", buf, 0x16u);
      }

      v16 = 0;
      goto LABEL_18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "%@ player encountered error while preparing to play: %@", buf, 0x16u);
    }

    v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = @"Apple Music encountered an error while preparing to play";
    uint64_t v13 = 1;
LABEL_17:
    v16 = objc_msgSend(v11, "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXAudioSessionErrorDomain", v13, v6, v12);
LABEL_18:
    int v17 = 0;
    goto LABEL_19;
  }
  v14 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [NSNumber numberWithBool:v10];
    *(_DWORD *)buf = 138412546;
    v29 = self;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "%@ player finished preparing to play. Will begin playback: %@", buf, 0x16u);
  }
  v16 = 0;
  int v17 = 1;
LABEL_19:
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __73__PXAppleMusicAudioSession__stateQueue_handlePlayerPreparedToPlay_error___block_invoke;
  v25 = &unk_1E5DBA6E8;
  char v27 = v17;
  id v21 = v16;
  id v26 = v21;
  [(PXAudioSession *)self performInternalChanges:&v22];
  if (v10 & v17) {
    [(PXAppleMusicAudioSession *)self _stateQueue_play];
  }
}

void __73__PXAppleMusicAudioSession__stateQueue_handlePlayerPreparedToPlay_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setIsReadyToPlay:v3];
  [v4 setError:*(void *)(a1 + 32)];
}

- (void)_handlePlayerPreparedToPlay:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(PXAppleMusicAudioSession *)self stateQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PXAppleMusicAudioSession__handlePlayerPreparedToPlay_error___block_invoke;
  v9[3] = &unk_1E5DD0928;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__PXAppleMusicAudioSession__handlePlayerPreparedToPlay_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stateQueue_handlePlayerPreparedToPlay:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setStateQueue_isPreparingToPlay:(BOOL)a3
{
  if (self->_stateQueue_isPreparingToPlay != a3)
  {
    self->_stateQueue_isPreparingToPlay = a3;
    [(PXAppleMusicAudioSession *)self _updateStatus];
  }
}

- (void)_stateQueue_prepareToPlayIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(PXAppleMusicAudioSession *)self stateQueue_isPreparingToPlay])
  {
    uint64_t v3 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PXAudioSession *)self asset];
      *(_DWORD *)buf = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      int v17 = v4;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "%@ will begin preparing to play %@.", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    [(PXAppleMusicAudioSession *)self setStateQueue_isPreparingToPlay:1];
    id v5 = [(PXAppleMusicAudioSession *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        uint64_t v8 = [(PXAppleMusicAudioSession *)self logContext];
        *(_DWORD *)buf = 134217984;
        v15 = (PXAppleMusicAudioSession *)v8;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StoryAppleMusicSessionPrepareToPlay", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    os_signpost_id_t v9 = [(PXAppleMusicAudioSession *)self playerController];
    id v10 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke;
    v11[3] = &unk_1E5DBA6C0;
    objc_copyWeak(&v12, &location);
    [v9 clientIdentifier:v10 performAsyncPlayerTransaction:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke_2;
    v10[3] = &unk_1E5DD0950;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    [v7 prepareToPlayWithCompletionHandler:v10];
    objc_destroyWeak(&v11);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handlePlayerPreparedToPlay:0 error:v8];
  }
}

void __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handlePlayerPreparedToPlay:a2 error:v5];
}

- (void)_stateQueue_pause
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXAppleMusicAudioSession *)self stateQueue_isPreparingToPlay];
  id v4 = PLAudioPlaybackGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      os_signpost_id_t v6 = [(PXAudioSession *)self asset];
      int v10 = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%@ cancelling playback of %@ when preparation finishes.", (uint8_t *)&v10, 0x16u);
    }
    [(PXAppleMusicAudioSession *)self setStateQueue_shouldPlayWhenPrepared:0];
  }
  else
  {
    if (v5)
    {
      id v7 = [(PXAudioSession *)self asset];
      int v10 = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%@ will pause playback of %@.", (uint8_t *)&v10, 0x16u);
    }
    id v8 = [(PXAppleMusicAudioSession *)self playerController];
    os_signpost_id_t v9 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
    [v8 clientIdentifier:v9 performAsyncPlayerTransaction:&__block_literal_global_29_108328];
  }
}

uint64_t __45__PXAppleMusicAudioSession__stateQueue_pause__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pause];
}

- (void)_stateQueue_play
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXAppleMusicAudioSession *)self stateQueue_isPreparingToPlay];
  id v4 = PLAudioPlaybackGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      os_signpost_id_t v6 = [(PXAudioSession *)self asset];
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%@ will begin playback of %@ when preparation finishes.", buf, 0x16u);
    }
    [(PXAppleMusicAudioSession *)self setStateQueue_shouldPlayWhenPrepared:1];
  }
  else
  {
    if (v5)
    {
      id v7 = [(PXAudioSession *)self asset];
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%@ will begin playback of %@.", buf, 0x16u);
    }
    [(PXAudioSession *)self desiredPlayerVolume];
    int v9 = v8;
    objc_initWeak((id *)buf, self);
    int v10 = [(PXAppleMusicAudioSession *)self playerController];
    id v11 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __44__PXAppleMusicAudioSession__stateQueue_play__block_invoke;
    v15 = &unk_1E5DBA698;
    int v17 = v9;
    objc_copyWeak(&v16, (id *)buf);
    [v10 clientIdentifier:v11 becomeCurrentClientIfNeeded:1 performAsyncPlayerTransaction:&v12];

    -[PXAppleMusicAudioSession setStateQueue_hasSeekedOrPlayed:](self, "setStateQueue_hasSeekedOrPlayed:", 1, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __44__PXAppleMusicAudioSession__stateQueue_play__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v10 = a4;
  double v7 = *(float *)(a1 + 40);
  id v8 = a2;
  [v8 setVolume:v7];
  [v8 play];

  if ((a3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handlePlayerTransactionDeclinedWithError:v10];
  }
}

- (void)setPlayerController:(id)a3
{
  BOOL v5 = (PXAppleMusicPlayerController *)a3;
  p_playerController = &self->_playerController;
  playerController = self->_playerController;
  if (playerController != v5)
  {
    id v11 = v5;
    id v8 = [(PXAppleMusicPlayerController *)playerController observable];
    [v8 unregisterChangeObserver:self context:PlayerControllerContext];

    objc_storeStrong((id *)&self->_playerController, a3);
    int v9 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
    [(PXAppleMusicPlayerController *)*p_playerController setCurrentClientIdentifier:v9];

    id v10 = [(PXAppleMusicPlayerController *)*p_playerController observable];
    [v10 registerChangeObserver:self context:PlayerControllerContext];

    [(PXAppleMusicAudioSession *)self _updatePlayerVolume];
    BOOL v5 = v11;
  }
}

- (void)_ensureCurrentPlayerClient
{
  id v4 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
  BOOL v3 = [(PXAppleMusicAudioSession *)self playerController];
  [v3 setCurrentClientIdentifier:v4];
}

- (void)_updatePlayerVolume
{
  [(PXAudioSession *)self desiredPlayerVolume];
  int v4 = v3;
  BOOL v5 = [(PXAppleMusicAudioSession *)self playerController];
  os_signpost_id_t v6 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PXAppleMusicAudioSession__updatePlayerVolume__block_invoke;
  v7[3] = &__block_descriptor_36_e62_v28__0___PXMutableAppleMusicPlayerController__8B16__NSError_20l;
  int v8 = v4;
  [v5 clientIdentifier:v6 performAsyncPlayerTransaction:v7];
}

uint64_t __47__PXAppleMusicAudioSession__updatePlayerVolume__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVolume:*(float *)(a1 + 32)];
}

- (void)_updateContentLoudness
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = [(PXAudioSession *)self asset];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;

    if (v4)
    {
      BOOL v5 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v6 = [v4 loudnessMainValue];
        double v7 = [v4 loudnessMainPeak];
        *(_DWORD *)buf = 138543874;
        id v11 = v4;
        __int16 v12 = 2114;
        uint64_t v13 = v6;
        __int16 v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Applying content loudness for %{public}@:\n\tLoudness: %{public}@\n\tPeak: %{public}@", buf, 0x20u);
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __50__PXAppleMusicAudioSession__updateContentLoudness__block_invoke;
      v8[3] = &unk_1E5DBA608;
      id v4 = v4;
      id v9 = v4;
      [(PXAudioSession *)self performInternalChanges:v8];
    }
  }
  else
  {

    id v4 = 0;
  }
}

void __50__PXAppleMusicAudioSession__updateContentLoudness__block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 loudnessMainPeak];
  [v4 setContentPeakDecibels:v5];

  id v6 = [*(id *)(a1 + 32) loudnessMainValue];
  [v4 setContentLoudnessInLKFS:v6];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PlayerControllerContext == a5)
  {
    id v6 = [(PXAppleMusicAudioSession *)self playerController];
    uint64_t v7 = [v6 playbackState];

    int v8 = [(PXAppleMusicAudioSession *)self stateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PXAppleMusicAudioSession_observable_didChange_context___block_invoke;
    v9[3] = &unk_1E5DD08D8;
    void v9[4] = self;
    v9[5] = v7;
    dispatch_async(v8, v9);
  }
}

uint64_t __57__PXAppleMusicAudioSession_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateQueue_playerPlaybackState:", *(void *)(a1 + 40));
}

- (void)performFinalCleanup
{
  v5.receiver = self;
  v5.super_class = (Class)PXAppleMusicAudioSession;
  [(PXAudioSession *)&v5 performFinalCleanup];
  int v3 = [(PXAppleMusicAudioSession *)self playerController];
  id v4 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
  [v3 clientIdentifier:v4 performAsyncPlayerTransaction:&__block_literal_global_108337];

  [(PXAppleMusicAudioSession *)self setPlayerController:0];
}

uint64_t __47__PXAppleMusicAudioSession_performFinalCleanup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pause];
}

- (void)errorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXAppleMusicAudioSession;
  [(PXAudioSession *)&v3 errorDidChange];
  [(PXAppleMusicAudioSession *)self _updateStatus];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  long long v11 = *MEMORY[0x1E4F1F9F8];
  int64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  result = [(PXAudioSession *)self status];
  if (result != ($3CC8671D27C23BF42ADDB32F2B5E48AE *)4)
  {
    if (self->_stateQueue_hasSeekedOrPlayed)
    {
      id v6 = [(PXAppleMusicAudioSession *)self playerController];
      [v6 fetchCurrentTime];
      long long v11 = v7;
      int64_t v12 = v8;
    }
    else
    {
      result = [(PXAudioSession *)self startTime];
      long long v11 = v9;
      int64_t v12 = v10;
    }
  }
  *(_OWORD *)&retstr->var0 = v11;
  retstr->var3 = v12;
  return result;
}

- (void)_stateQueue_playFromTime:(id *)a3
{
  objc_super v5 = [(PXAppleMusicAudioSession *)self playerController];
  id v6 = [(PXAppleMusicAudioSession *)self playerClientIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PXAppleMusicAudioSession__stateQueue_playFromTime___block_invoke;
  v7[3] = &unk_1E5DBA630;
  void v7[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [v5 clientIdentifier:v6 performAsyncPlayerTransaction:v7];
}

void __53__PXAppleMusicAudioSession__stateQueue_playFromTime___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_super v5 = [v3 asset];
  id v6 = [v5 identifier];
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  [v4 setItemWithStoreID:v6 startTime:&v7];

  [v4 play];
}

- (void)playFromTime:(id *)a3
{
  objc_initWeak(&location, self);
  objc_super v5 = [(PXAppleMusicAudioSession *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXAppleMusicAudioSession_playFromTime___block_invoke;
  block[3] = &unk_1E5DCE6A8;
  objc_copyWeak(&v7, &location);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__PXAppleMusicAudioSession_playFromTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  objc_msgSend(WeakRetained, "_stateQueue_playFromTime:", &v3);
}

- (void)play
{
  objc_initWeak(&location, self);
  long long v3 = [(PXAppleMusicAudioSession *)self stateQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__PXAppleMusicAudioSession_play__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__PXAppleMusicAudioSession_play__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateQueue_play");
}

- (void)pause
{
  long long v3 = [(PXAppleMusicAudioSession *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXAppleMusicAudioSession_pause__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __33__PXAppleMusicAudioSession_pause__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stateQueue_pause");
}

- (void)prepareToPlay
{
  objc_initWeak(&location, self);
  long long v3 = [(PXAppleMusicAudioSession *)self stateQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PXAppleMusicAudioSession_prepareToPlay__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__PXAppleMusicAudioSession_prepareToPlay__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateQueue_prepareToPlayIfNeeded");
}

- (void)desiredPlayerVolumeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXAppleMusicAudioSession;
  [(PXAudioSession *)&v3 desiredPlayerVolumeDidChange];
  [(PXAppleMusicAudioSession *)self _updatePlayerVolume];
}

- (PXAppleMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7 playerController:(id)a8
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PXAppleMusicAudioSession;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a5;
  v19 = [(PXAudioSession *)&v25 initWithAsset:v15 volume:&buf startTime:v16 queue:v17 audioSessionDelegate:COERCE_DOUBLE(__PAIR64__(HIDWORD(buf.var0), LODWORD(a4)))];
  if (v19)
  {
    __int16 v20 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      LODWORD(buf.var0) = 138412546;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v22;
      LOWORD(buf.var2) = 2112;
      *(void *)((char *)&buf.var2 + 2) = v15;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "Creating %@ instance to play asset %@.", (uint8_t *)&buf, 0x16u);
    }
    if ([v15 catalog] != 2)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v19, @"PXAppleMusicAudioSession.m", 58, @"Invalid parameter not satisfying: %@", @"asset.catalog == PXAudioAssetCatalogAppleMusic" object file lineNumber description];
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
  }

  return 0;
}

void __103__PXAppleMusicAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate_playerController___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    long long v11 = *(_OWORD *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 64);
    [v7 setItemWithStoreID:v9 startTime:&v11];
    [v7 setVolume:*(float *)(a1 + 72)];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _handlePlayerTransactionDeclinedWithError:v8];
  }
}

void __103__PXAppleMusicAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate_playerController___block_invoke_13(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithFormat:@"Unable to play asset %@ because it does not have a store ID", *(void *)(a1 + 32)];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = objc_msgSend(v6, "px_audioSessionErrorWithCode:userInfo:", 1, v7);
  [v4 setError:v8];
}

- (PXAppleMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a5;
  return -[PXAppleMusicAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:playerController:](self, "initWithAsset:volume:startTime:queue:audioSessionDelegate:playerController:", a3, &v8, a6, a7, 0);
}

@end