@interface TLAlertPairedWatchController
- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (TLAlertPairedWatchController)init;
- (void)_didCompletePlaybackForAlertWithContext:(id)a3;
- (void)_playAlertWithContext:(id)a3;
- (void)_processCompletionForAlertWithContext:(id)a3 playbackCompletionType:(int64_t)a4 error:(id)a5;
- (void)_stopPlayingAlertWithContext:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (void)dealloc;
- (void)playAlert:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation TLAlertPairedWatchController

- (TLAlertPairedWatchController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TLAlertPairedWatchController;
  v2 = [(TLAlertPairedWatchController *)&v6 init];
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
  [(TLAudioQueue *)v4 performSynchronousTaskWithBlock:&__block_literal_global_7];

  v5.receiver = self;
  v5.super_class = (Class)TLAlertPairedWatchController;
  [(TLAlertPairedWatchController *)&v5 dealloc];
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  v9 = [[TLAlertPairedWatchPlaybackContext alloc] initWithAlert:v8 completionHandler:v7];

  os_unfair_lock_lock(p_lock);
  v10 = self->_playbackContext;
  objc_storeStrong((id *)&self->_playbackContext, v9);
  os_unfair_lock_unlock(p_lock);
  audioQueue = self->_audioQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__TLAlertPairedWatchController_playAlert_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E6C213D0;
  v15 = v10;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  [(TLAudioQueue *)audioQueue performTaskWithBlock:v14];
}

uint64_t __64__TLAlertPairedWatchController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) _stopPlayingAlertWithContext:v2 withOptions:0 playbackCompletionType:4];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _playAlertWithContext:v4];
}

- (void)_playAlertWithContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (TLAlertPairedWatchPlaybackContext *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  objc_super v5 = [(TLAlertPairedWatchPlaybackContext *)v4 alert];
  uint64_t v6 = [v5 type];
  id v7 = [v5 configuration];
  id v8 = TLLogPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Beginning playback for %{public}@.", buf, 0x16u);
  }

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v9 = (void *)getNACAlertProxyClass_softClass;
  uint64_t v24 = getNACAlertProxyClass_softClass;
  if (!getNACAlertProxyClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNACAlertProxyClass_block_invoke;
    v26 = &unk_1E6C210C8;
    v27 = &v21;
    __getNACAlertProxyClass_block_invoke((uint64_t)buf);
    v9 = (void *)v22[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v21, 8);
  v11 = [v10 alertProxyWithConfiguration:v7];
  [(TLAlertPairedWatchPlaybackContext *)v4 setAlertProxy:v11];
  v12 = TLLogPlayback();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[TLAlertPairedWatchController _playAlertWithContext:]((uint64_t)self, v13);
    }

    os_unfair_lock_lock(&self->_lock);
    if (self->_playbackContext == v4)
    {
      self->_playbackContext = 0;

      v18 = objc_msgSend(MEMORY[0x1E4F28C58], "tl_errorWithDomain:description:", @"TLAlertErrorDomain", @"Failed to create alert proxy using NanoAudioControl.");
      os_unfair_lock_unlock(&self->_lock);
      [(TLAlertPairedWatchController *)self _processCompletionForAlertWithContext:v4 playbackCompletionType:5 error:v18];

      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Created NanoAudioControl alert proxy: %{public}@.", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_playbackContext != v4)
  {
LABEL_21:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_22;
  }
  os_unfair_lock_unlock(&self->_lock);
  v14 = TLLogPlayback();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Will call -play on NanoAudioControl alert proxy: %{public}@.", buf, 0x16u);
  }

  [v11 play];
  v15 = TLLogPlayback();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Did call -play on NanoAudioControl alert proxy: %{public}@.", buf, 0x16u);
  }

  if (([v7 shouldRepeat] & 1) == 0)
  {
    if (v6 == 1) {
      int64_t v16 = 4000000000;
    }
    else {
      int64_t v16 = 2000000000;
    }
    dispatch_time_t v17 = dispatch_time(0, v16);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__TLAlertPairedWatchController__playAlertWithContext___block_invoke;
    v19[3] = &unk_1E6C20CC0;
    v19[4] = self;
    v20 = v4;
    dispatch_after(v17, MEMORY[0x1E4F14428], v19);
  }
LABEL_22:
}

uint64_t __54__TLAlertPairedWatchController__playAlertWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompletePlaybackForAlertWithContext:*(void *)(a1 + 40)];
}

- (void)_didCompletePlaybackForAlertWithContext:(id)a3
{
  uint64_t v4 = (TLAlertPairedWatchPlaybackContext *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_playbackContext == v4)
  {
    self->_playbackContext = 0;

    os_unfair_lock_unlock(&self->_lock);
    [(TLAlertPairedWatchController *)self _processCompletionForAlertWithContext:v4 playbackCompletionType:0 error:0];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_processCompletionForAlertWithContext:(id)a3 playbackCompletionType:(int64_t)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v10 = [v8 alert];
  v11 = TLLogPlayback();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromTLAlertPlaybackCompletionType(a4);
      v14 = objc_msgSend(v9, "tl_nonRedundantDescription");
      *(_DWORD *)buf = 138544130;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      v26 = v10;
      __int16 v27 = 2114;
      uint64_t v28 = v13;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_error_impl(&dword_1DB936000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Processing completion for alert %{public}@ with completion type %{public}@ and error: %{public}@.", buf, 0x2Au);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromTLAlertPlaybackCompletionType(a4);
    *(_DWORD *)buf = 138543874;
    uint64_t v24 = self;
    __int16 v25 = 2114;
    v26 = v10;
    __int16 v27 = 2114;
    uint64_t v28 = v13;
    _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Processing completion for alert %{public}@ with completion type %{public}@.", buf, 0x20u);
    goto LABEL_6;
  }

  v15 = [v8 completionHandler];
  int64_t v16 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__TLAlertPairedWatchController__processCompletionForAlertWithContext_playbackCompletionType_error___block_invoke;
  block[3] = &unk_1E6C21BC0;
  id v21 = v15;
  int64_t v22 = a4;
  id v20 = v9;
  id v17 = v9;
  id v18 = v15;
  dispatch_async(v16, block);
}

uint64_t __99__TLAlertPairedWatchController__processCompletionForAlertWithContext_playbackCompletionType_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v8 = self->_playbackContext;
  playbackContext = self->_playbackContext;
  self->_playbackContext = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    audioQueue = self->_audioQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__TLAlertPairedWatchController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
    v12[3] = &unk_1E6C21BE8;
    v12[4] = self;
    v13 = v8;
    id v14 = v7;
    int64_t v15 = a5;
    [(TLAudioQueue *)audioQueue performTaskWithBlock:v12];
  }
  return v8 != 0;
}

uint64_t __85__TLAlertPairedWatchController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopPlayingAlertWithContext:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) playbackCompletionType:*(void *)(a1 + 56)];
}

- (void)_stopPlayingAlertWithContext:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(TLAudioQueue *)self->_audioQueue assertRunningOnAudioQueue];
  id v10 = [v8 alertProxy];
  v11 = TLLogPlayback();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    int64_t v16 = v10;
    _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertWithContext: […]: Will call -stop… on NanoAudioControl alert proxy: %{public}@.", (uint8_t *)&v13, 0x16u);
  }

  [v10 stopWithOptions:v9];
  v12 = TLLogPlayback();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    int64_t v16 = v10;
    _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertWithContext: […]: Did call -stop… on NanoAudioControl alert proxy: %{public}@.", (uint8_t *)&v13, 0x16u);
  }

  [(TLAlertPairedWatchController *)self _processCompletionForAlertWithContext:v8 playbackCompletionType:a5 error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackContext, 0);

  objc_storeStrong((id *)&self->_audioQueue, 0);
}

- (void)_playAlertWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB936000, a2, OS_LOG_TYPE_ERROR, "%{public}@: -_playAlertWithContext: […]: Failed to create NanoAudioControl alert proxy.", (uint8_t *)&v2, 0xCu);
}

@end