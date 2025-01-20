@interface PXAudioPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentAssetDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (NSError)error;
- (NSString)description;
- (NSString)name;
- (NSTimer)currentTimeRecordUpdateTimer;
- (OS_dispatch_queue)sessionsQueue;
- (PXAudioAsset)currentAsset;
- (PXAudioPlayer)init;
- (PXAudioPlayer)initWithName:(id)a3;
- (PXAudioPlayerDelegate)audioSessionDelegate;
- (PXAudioSession)currentAudioSession;
- (PXAudioSession)sessionsQueue_currentSession;
- (PXCurrentTimeRecord)mainQueue_currentTimeRecord;
- (float)targetLoudnessInLKFS;
- (float)volume;
- (id)AVAudioSessionForAudioSession:(id)a3;
- (id)_createAudioSessionForAsset:(id)a3 startTime:(id *)a4;
- (id)_sessionsQueue_generateCurrentTimeRecord;
- (id)lcdStringForSize:(CGSize)a3;
- (id)windowSceneID;
- (int64_t)desiredPlayState;
- (int64_t)state;
- (void)_handleCurrentTimeRecordUpdateTimer;
- (void)_invalidateCurrentSessionState;
- (void)_invalidateCurrentTimeRecord;
- (void)_invalidateCurrentTimeRecordUpdateTimer;
- (void)_invalidateState;
- (void)_sessionsQueue_handleOutgoingSession:(id)a3;
- (void)_sessionsQueue_updateCurrentSessionStateWithDesiredPlayState:(int64_t)a3;
- (void)_sessionsQueue_updateCurrentTimeRecord;
- (void)_sessionsQueue_updateState;
- (void)_update;
- (void)_updateCurrentSessionState;
- (void)_updateCurrentTimeRecord;
- (void)_updateCurrentTimeRecordUpdateTimer;
- (void)_updateState;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)pause;
- (void)performChanges:(id)a3;
- (void)playFromStartTime:(id *)a3;
- (void)replayFromTime:(id *)a3;
- (void)sessionsQueue_setCurrentSession:(id)a3;
- (void)setAudioSessionDelegate:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentAsset:(id)a3 startTime:(id *)a4;
- (void)setCurrentAsset:(id)a3 startTime:(id *)a4 hostTime:(id *)a5;
- (void)setCurrentAssetDuration:(id *)a3;
- (void)setCurrentTimeRecordUpdateTimer:(id)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setMainQueue_currentTimeRecord:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetLoudnessInLKFS:(float)a3;
- (void)setVolume:(float)a3;
@end

@implementation PXAudioPlayer

- (id)lcdStringForSize:(CGSize)a3
{
  v4 = [(PXAudioPlayer *)self currentAsset];
  int64_t v5 = [(PXAudioPlayer *)self state];
  if (v5 == 1)
  {
    v9 = @"Idle…";
  }
  else
  {
    unint64_t v6 = v5;
    if (v5 == 5)
    {
      id v7 = [NSString alloc];
      v8 = [(PXAudioPlayer *)self error];
      v9 = (__CFString *)[v7 initWithFormat:@"Error: %@", v8];
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      [(PXAudioPlayer *)self currentAssetDuration];
      unint64_t v10 = 0x1E4F29000uLL;
      memset(&v36, 0, sizeof(v36));
      [(PXAudioPlayer *)self currentTime];
      CMTime v35 = v36;
      long double Seconds = CMTimeGetSeconds(&v35);
      v12 = NSString;
      LODWORD(v10) = vcvtmd_s64_f64(Seconds / 60.0);
      LODWORD(v13) = vcvtmd_s64_f64(fmod(Seconds, 60.0));
      v14 = [v12 stringWithFormat:@"%d:%02d/%@", v10, v13, @"?"];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__PXAudioPlayer_PXAscii__lcdStringForSize___block_invoke;
      aBlock[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
      aBlock[4] = 43;
      v15 = (void (**)(void *, void *))_Block_copy(aBlock);
      v9 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
      v16 = PXAudioPlayerStateDescription(v6);
      v17 = v15[2](v15, v16);
      [(__CFString *)v9 appendFormat:@"Status: %@\n", v17];

      v18 = [v4 title];
      v19 = v15[2](v15, v18);
      [(__CFString *)v9 appendFormat:@" Track: %@\n", v19];

      v20 = [v4 artistName];
      v21 = v15[2](v15, v20);
      [(__CFString *)v9 appendFormat:@"Artist: %@\n", v21];

      v22 = [v4 albumTitle];
      v23 = v15[2](v15, v22);
      [(__CFString *)v9 appendFormat:@" Album: %@\n", v23];

      unint64_t v24 = [v4 catalog];
      if (v24 > 4) {
        v25 = @"Mock";
      }
      else {
        v25 = off_1E5DC36E0[v24];
      }
      v26 = v25;
      v27 = v15[2](v15, v26);
      [(__CFString *)v9 appendFormat:@"  Type: %@\n", v27];

      v28 = [v4 assetTagsDescription];
      v29 = v15[2](v15, v28);
      [(__CFString *)v9 appendFormat:@"  Tags: %@\n", v29];

      [v4 pace];
      v30 = PFStoryRecipeSongPaceDescription();
      v31 = v15[2](v15, v30);
      [(__CFString *)v9 appendFormat:@"  Pace: %@\n", v31];

      v32 = v15[2](v15, v14);
      [(__CFString *)v9 appendFormat:@"  Time: %@\n", v32];
    }
  }

  return v9;
}

__CFString *__43__PXAudioPlayer_PXAscii__lcdStringForSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    if ((unint64_t)[v3 length] <= *(void *)(a1 + 32))
    {
      v8 = v4;
    }
    else
    {
      uint64_t v5 = [v4 length];
      if (v5 - 2 >= (unint64_t)(*(void *)(a1 + 32) - 2)) {
        uint64_t v6 = *(void *)(a1 + 32) - 2;
      }
      else {
        uint64_t v6 = v5 - 2;
      }
      id v7 = [v4 substringToIndex:v6];
      v8 = [v7 stringByAppendingString:@"…"];
    }
  }
  else
  {
    v8 = @"--";
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimeRecordUpdateTimer, 0);
  objc_storeStrong((id *)&self->_mainQueue_currentTimeRecord, 0);
  objc_storeStrong((id *)&self->_sessionsQueue_currentSession, 0);
  objc_storeStrong((id *)&self->_sessionsQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_destroyWeak((id *)&self->_audioSessionDelegate);
}

- (void)setCurrentTimeRecordUpdateTimer:(id)a3
{
}

- (NSTimer)currentTimeRecordUpdateTimer
{
  return self->_currentTimeRecordUpdateTimer;
}

- (void)setMainQueue_currentTimeRecord:(id)a3
{
}

- (PXCurrentTimeRecord)mainQueue_currentTimeRecord
{
  return self->_mainQueue_currentTimeRecord;
}

- (PXAudioSession)sessionsQueue_currentSession
{
  return self->_sessionsQueue_currentSession;
}

- (OS_dispatch_queue)sessionsQueue
{
  return self->_sessionsQueue;
}

- (float)targetLoudnessInLKFS
{
  return self->_targetLoudnessInLKFS;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (float)volume
{
  return self->_volume;
}

- (NSString)name
{
  return self->_name;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)state
{
  return self->_state;
}

- (PXAudioAsset)currentAsset
{
  return self->_currentAsset;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentAssetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 208);
  return self;
}

- (void)setAudioSessionDelegate:(id)a3
{
}

- (PXAudioPlayerDelegate)audioSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionDelegate);
  return (PXAudioPlayerDelegate *)WeakRetained;
}

- (id)windowSceneID
{
  v2 = [(PXAudioPlayer *)self audioSessionDelegate];
  id v3 = [v2 windowSceneID];

  return v3;
}

- (id)AVAudioSessionForAudioSession:(id)a3
{
  v4 = [(PXAudioPlayer *)self audioSessionDelegate];
  uint64_t v5 = [v4 AVAudioSessionForPlayer:self];

  return v5;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayer;
  [(PXAudioPlayer *)&v3 performChanges:a3];
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayer;
  [(PXAudioPlayer *)&v3 didPerformChanges];
  [(PXAudioPlayer *)self _update];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)CurrentSessionContext == a5) {
    px_dispatch_on_main_queue();
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"PXAudioPlayer.m" lineNumber:469 description:@"Code which should be unreachable has been reached"];

  abort();
}

uint64_t __46__PXAudioPlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PXAudioPlayer_observable_didChange_context___block_invoke_2;
  v3[3] = &unk_1E5DD09C8;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 performChanges:v3];
}

void __46__PXAudioPlayer_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 7) != 0)
  {
    [*(id *)(a1 + 32) _invalidateState];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 0xA) != 0) {
    [*(id *)(a1 + 32) _invalidateCurrentSessionState];
  }
}

- (void)_sessionsQueue_updateState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXAudioPlayer *)self sessionsQueue_currentSession];
  id v4 = [v3 asset];
  uint64_t v5 = [(PXAudioPlayer *)self currentAsset];

  if (v4 == v5)
  {
    v9 = [v3 error];
    memset(buf, 0, sizeof(buf));
    if (v3)
    {
      [v3 duration];
      if (buf[12]) {
        goto LABEL_10;
      }
    }
    unint64_t v10 = [(PXAudioPlayer *)self currentAsset];
    v11 = v10;
    if (v10)
    {
      [v10 duration];
    }
    else
    {
      long long v14 = 0uLL;
      uint64_t v15 = 0;
    }
    *(_OWORD *)buf = v14;
    *(void *)&buf[16] = v15;

    if (v3) {
LABEL_10:
    }
      [v3 status];
    id v12 = [(PXAudioPlayer *)self _sessionsQueue_generateCurrentTimeRecord];
    id v13 = v9;
    px_dispatch_on_main_queue();
  }
  uint64_t v6 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v3 asset];
    id v8 = [(PXAudioPlayer *)self currentAsset];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v17 = v8;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "%@ skipping state update because we are awaiting a new audio session for the current asset.\n\tCurrent asset: %@\n\tExisting asset: %@", buf, 0x20u);
  }
}

void __43__PXAudioPlayer__sessionsQueue_updateState__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PXAudioPlayer__sessionsQueue_updateState__block_invoke_2;
  v4[3] = &unk_1E5DD02A8;
  uint64_t v3 = *(void *)(a1 + 56);
  v4[4] = v2;
  uint64_t v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 80);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 performChanges:v4];
}

uint64_t __43__PXAudioPlayer__sessionsQueue_updateState__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  long long v3 = *(_OWORD *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 80);
  [*(id *)(a1 + 32) setCurrentAssetDuration:&v3];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  return objc_msgSend(*(id *)(a1 + 32), "setMainQueue_currentTimeRecord:", *(void *)(a1 + 48));
}

- (void)_sessionsQueue_updateCurrentSessionStateWithDesiredPlayState:(int64_t)a3
{
  uint64_t v4 = [(PXAudioPlayer *)self sessionsQueue_currentSession];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__PXAudioPlayer__sessionsQueue_updateCurrentSessionStateWithDesiredPlayState___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0___PXMutableAudioSession__8l;
  v5[4] = a3;
  [v4 performChanges:v5];
}

void __78__PXAudioPlayer__sessionsQueue_updateCurrentSessionStateWithDesiredPlayState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 == 1)
  {
    id v5 = v3;
    [v3 play];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    id v5 = v3;
    [v3 pause];
  }
  id v3 = v5;
LABEL_6:
}

- (void)_updateCurrentSessionState
{
  id v3 = [(PXAudioPlayer *)self desiredPlayState];
  objc_initWeak(&location, self);
  uint64_t v4 = [(PXAudioPlayer *)self sessionsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXAudioPlayer__updateCurrentSessionState__block_invoke;
  block[3] = &unk_1E5DD0260;
  objc_copyWeak(v6, &location);
  v6[1] = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __43__PXAudioPlayer__updateCurrentSessionState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sessionsQueue_updateCurrentSessionStateWithDesiredPlayState:", *(void *)(a1 + 40));
}

- (void)_invalidateCurrentSessionState
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 8) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"-[PXAudioPlayer _invalidateCurrentSessionState]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXAudioPlayer.m", 385, @"invalidating %lu after it already has been updated", 8);

    abort();
  }
  self->_updateFlags.needsUpdate |= 8uLL;
}

- (void)_updateState
{
  id v3 = [(PXAudioPlayer *)self sessionsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PXAudioPlayer__updateState__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__PXAudioPlayer__updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionsQueue_updateState");
}

- (void)_invalidateState
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"-[PXAudioPlayer _invalidateState]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXAudioPlayer.m", 373, @"invalidating %lu after it already has been updated", 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
}

- (void)_sessionsQueue_updateCurrentTimeRecord
{
  id v3 = [(PXAudioPlayer *)self _sessionsQueue_generateCurrentTimeRecord];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PXAudioPlayer__sessionsQueue_updateCurrentTimeRecord__block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v7, &location);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__PXAudioPlayer__sessionsQueue_updateCurrentTimeRecord__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMainQueue_currentTimeRecord:", v1);
}

- (void)_updateCurrentTimeRecord
{
  id v3 = [(PXAudioPlayer *)self sessionsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXAudioPlayer__updateCurrentTimeRecord__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__PXAudioPlayer__updateCurrentTimeRecord__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionsQueue_updateCurrentTimeRecord");
}

- (void)_invalidateCurrentTimeRecord
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 4) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"-[PXAudioPlayer _invalidateCurrentTimeRecord]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXAudioPlayer.m", 354, @"invalidating %lu after it already has been updated", 4);

    abort();
  }
  self->_updateFlags.needsUpdate |= 4uLL;
}

- (void)_updateCurrentTimeRecordUpdateTimer
{
  int64_t v3 = [(PXAudioPlayer *)self state];
  id v4 = [(PXAudioPlayer *)self currentTimeRecordUpdateTimer];

  if (v3 == 3)
  {
    if (!v4)
    {
      objc_initWeak(&location, self);
      id v5 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      unint64_t v10 = __52__PXAudioPlayer__updateCurrentTimeRecordUpdateTimer__block_invoke;
      v11 = &unk_1E5DD32D0;
      objc_copyWeak(&v12, &location);
      id v6 = objc_msgSend(v5, "px_scheduledTimerWithTimeInterval:repeats:block:", 1, &v8, 0.5);
      -[PXAudioPlayer setCurrentTimeRecordUpdateTimer:](self, "setCurrentTimeRecordUpdateTimer:", v6, v8, v9, v10, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else if (v4)
  {
    id v7 = [(PXAudioPlayer *)self currentTimeRecordUpdateTimer];
    [v7 invalidate];

    [(PXAudioPlayer *)self setCurrentTimeRecordUpdateTimer:0];
  }
}

void __52__PXAudioPlayer__updateCurrentTimeRecordUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCurrentTimeRecordUpdateTimer];
}

- (void)_invalidateCurrentTimeRecordUpdateTimer
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v3 = [NSString stringWithUTF8String:"-[PXAudioPlayer _invalidateCurrentTimeRecordUpdateTimer]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXAudioPlayer.m", 334, @"invalidating %lu after it already has been updated", 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
}

- (void)_update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PXAudioPlayer _update]"];
      [v8 handleFailureInFunction:v9, @"PXAudioPlayer.m", 316, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 8;
    if ((needsUpdate & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
      [(PXAudioPlayer *)self _updateCurrentSessionState];
      if (!p_updateFlags->isPerformingUpdate)
      {
        uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
        v16 = [NSString stringWithUTF8String:"-[PXAudioPlayer _update]"];
        [v15 handleFailureInFunction:v16, @"PXAudioPlayer.m", 320, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXAudioPlayer *)self _updateCurrentTimeRecordUpdateTimer];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = [NSString stringWithUTF8String:"-[PXAudioPlayer _update]"];
      [v10 handleFailureInFunction:v11, @"PXAudioPlayer.m", 323, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXAudioPlayer *)self _updateCurrentTimeRecord];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"-[PXAudioPlayer _update]"];
      [v12 handleFailureInFunction:v13, @"PXAudioPlayer.m", 326, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v7)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFELL;
      [(PXAudioPlayer *)self _updateState];
      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v14 = [NSString stringWithUTF8String:"-[PXAudioPlayer _update]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXAudioPlayer.m", 329, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
}

- (void)setError:(id)a3
{
  unint64_t v7 = (NSError *)a3;
  unint64_t v5 = self->_error;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSError *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      [(PXAudioPlayer *)self signalChange:32];
    }
  }
}

- (void)setCurrentAssetDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 currentAssetDuration = &self->_currentAssetDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 currentAssetDuration = self->_currentAssetDuration;
  if (CMTimeCompare(&time1, (CMTime *)&currentAssetDuration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_currentAssetDuration->epoch = a3->var3;
    *(_OWORD *)&p_currentAssetDuration->value = v6;
    [(PXAudioPlayer *)self signalChange:2];
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    unint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"PXAudioPlayerStateDidChangeNotification" object:self];

    [(PXAudioPlayer *)self _invalidateCurrentTimeRecordUpdateTimer];
    [(PXAudioPlayer *)self signalChange:4];
    long long v6 = [(PXAudioPlayer *)self log];
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXAudioPlayer *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXAudioPlayerChangedState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    uint64_t v9 = v6;
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        uint64_t v12 = [(PXAudioPlayer *)self logContext];
        int v17 = 134218240;
        uint64_t v18 = v12;
        __int16 v19 = 2048;
        int64_t v20 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_EVENT, v11, "PXAudioPlayerChangedState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    id v13 = v9;
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        uint64_t v16 = [(PXAudioPlayer *)self logContext];
        int v17 = 134218240;
        uint64_t v18 = v16;
        __int16 v19 = 2048;
        int64_t v20 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXAudioPlayerChangedState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)_handleCurrentTimeRecordUpdateTimer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__PXAudioPlayer__handleCurrentTimeRecordUpdateTimer__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXAudioPlayer *)self performChanges:v2];
}

uint64_t __52__PXAudioPlayer__handleCurrentTimeRecordUpdateTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCurrentTimeRecord];
}

- (void)_sessionsQueue_handleOutgoingSession:(id)a3
{
  id v4 = a3;
  [v4 performChanges:&__block_literal_global_48_281230];
  [v4 unregisterChangeObserver:self context:CurrentSessionContext];
}

uint64_t __54__PXAudioPlayer__sessionsQueue_handleOutgoingSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 performFinalCleanup];
}

- (void)sessionsQueue_setCurrentSession:(id)a3
{
  unint64_t v5 = (PXAudioSession *)a3;
  if (self->_sessionsQueue_currentSession != v5)
  {
    -[PXAudioPlayer _sessionsQueue_handleOutgoingSession:](self, "_sessionsQueue_handleOutgoingSession:");
    objc_storeStrong((id *)&self->_sessionsQueue_currentSession, a3);
    [(PXAudioSession *)v5 registerChangeObserver:self context:CurrentSessionContext];
    long long v6 = [(PXAudioPlayer *)self _sessionsQueue_generateCurrentTimeRecord];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke;
    v8[3] = &unk_1E5DD32A8;
    v8[4] = self;
    id v9 = v6;
    id v7 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke_2;
  v2[3] = &unk_1E5DD0328;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 performChanges:v2];
}

uint64_t __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateState];
  [*(id *)(a1 + 32) _invalidateCurrentSessionState];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return objc_msgSend(v2, "setMainQueue_currentTimeRecord:", v3);
}

- (id)_sessionsQueue_generateCurrentTimeRecord
{
  v2 = [(PXAudioPlayer *)self sessionsQueue_currentSession];
  uint64_t v3 = [v2 status];
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  if (v2) {
    [v2 currentTime];
  }
  id v4 = [PXCurrentTimeRecord alloc];
  double v5 = 0.0;
  if (v3 == 3) {
    *(float *)&double v5 = 1.0;
  }
  long long v8 = v10;
  uint64_t v9 = v11;
  long long v6 = [(PXCurrentTimeRecord *)v4 initWithSampleTime:&v8 rate:v5];

  return v6;
}

- (id)_createAudioSessionForAsset:(id)a3 startTime:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (objc_class *)[v6 audioSessionClass];
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = (CMTime)*a4;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    long long v8 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CMTime time1 = (CMTime)*a4;
      CFStringRef v9 = CMTimeCopyDescription(0, &time1);
      LODWORD(time1.value) = 138412546;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v9;
      LOWORD(time1.flags) = 2112;
      *(void *)((char *)&time1.flags + 2) = v6;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Requested start time %@ is less than the asset duration of %@. Restarting at zero.", (uint8_t *)&time1, 0x16u);
    }

    long long v10 = *MEMORY[0x1E4F1FA48];
    a4->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  id v11 = [v7 alloc];
  [(PXAudioPlayer *)self volume];
  unsigned int v13 = v12;
  os_signpost_id_t v14 = [(PXAudioPlayer *)self sessionsQueue];
  CMTime time1 = (CMTime)*a4;
  os_signpost_id_t v15 = objc_msgSend(v11, "initWithAsset:volume:startTime:queue:audioSessionDelegate:", v6, &time1, v14, self, COERCE_DOUBLE(__PAIR64__(HIDWORD(time1.value), v13)));

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__PXAudioPlayer__createAudioSessionForAsset_startTime___block_invoke;
  v17[3] = &unk_1E5DD0238;
  v17[4] = self;
  [v15 performChanges:v17];

  return v15;
}

void __55__PXAudioPlayer__createAudioSessionForAsset_startTime___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 targetLoudnessInLKFS];
  objc_msgSend(v3, "setTargetLoudnessInLKFS:");
  [v3 prepareToPlay];
}

- (PXAudioSession)currentAudioSession
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__281234;
  id v11 = __Block_byref_object_dispose__281235;
  id v12 = 0;
  id v3 = [(PXAudioPlayer *)self sessionsQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __36__PXAudioPlayer_currentAudioSession__block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PXAudioSession *)v4;
}

void __36__PXAudioPlayer_currentAudioSession__block_invoke(uint64_t a1)
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3810000000;
  v4[3] = &unk_1AB5D584F;
  memset(&v4[4], 0, 24);
  px_dispatch_on_main_queue_sync();
}

void __28__PXAudioPlayer_currentTime__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "mainQueue_currentTimeRecord");
  id v3 = v2;
  if (v2)
  {
    [v2 currentTime];
  }
  else
  {
    long long v5 = 0uLL;
    uint64_t v6 = 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 48) = v6;
}

- (void)pause
{
  id v3 = [(PXAudioPlayer *)self sessionsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__PXAudioPlayer_pause__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __22__PXAudioPlayer_pause__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 performChanges:&__block_literal_global_281237];
}

uint64_t __22__PXAudioPlayer_pause__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pause];
}

- (void)replayFromTime:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((a3->var2 & 1) == 0) {
    PXAssertGetLog();
  }
  long long v5 = [(PXAudioPlayer *)self sessionsQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __32__PXAudioPlayer_replayFromTime___block_invoke;
  v6[3] = &unk_1E5DD01C8;
  v6[4] = self;
  long long v7 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  dispatch_async(v5, v6);
}

void __32__PXAudioPlayer_replayFromTime___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__PXAudioPlayer_replayFromTime___block_invoke_2;
  v3[3] = &__block_descriptor_56_e33_v16__0___PXMutableAudioSession__8l;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  [v2 performChanges:v3];
}

uint64_t __32__PXAudioPlayer_replayFromTime___block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 playFromTime:&v3];
}

- (void)setCurrentAsset:(id)a3 startTime:(id *)a4 hostTime:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v8 = (PXAudioAsset *)a3;
  if ((a4->var2 & 1) == 0)
  {
    long long v9 = *MEMORY[0x1E4F1FA48];
    a4->int64_t var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a4->var0 = v9;
  }
  long long v10 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CMTime time = (CMTime)*a4;
    Float64 Seconds = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 138412802;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
    LOWORD(time.flags) = 2112;
    *(void *)((char *)&time.flags + 2) = v8;
    HIWORD(time.epoch) = 2048;
    Float64 v43 = Seconds;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "%@ asked to play asset %@ from start time %f", (uint8_t *)&time, 0x20u);
  }

  memset(&time, 0, sizeof(time));
  if (v8) {
    [(PXAudioAsset *)v8 duration];
  }
  id v12 = self->_currentAsset;
  unsigned int v13 = v8;
  if (v12 == v8) {
    goto LABEL_22;
  }
  os_signpost_id_t v14 = v12;
  os_signpost_id_t v15 = v8;
  char v16 = [(PXAudioAsset *)v15 isEqual:v14];

  if ((v16 & 1) == 0)
  {
    if (v8)
    {
      v40 = @"PXAudioPlayerCurrentAssetDidChangeNotificationCurrentAssetKey";
      v41 = v15;
      unsigned int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    }
    else
    {
      unsigned int v13 = 0;
    }
    int v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"PXAudioPlayerCurrentAssetDidChangeNotification" object:self userInfo:v13];

    [(PXAudioPlayer *)self signalChange:1];
    uint64_t v18 = [(PXAudioPlayer *)self log];
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = [(PXAudioPlayer *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, v20, "PXAudioPlayerChangedCurrentAsset", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    uint64_t v21 = v18;
    os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, self);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v23 = v22;
      if (os_signpost_enabled(v21))
      {
        uint64_t v24 = [(PXAudioPlayer *)self logContext];
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v21, OS_SIGNPOST_EVENT, v23, "PXAudioPlayerChangedCurrentAsset", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
      }
    }

    v25 = v21;
    os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, self);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v27 = v26;
      if (os_signpost_enabled(v25))
      {
        uint64_t v28 = [(PXAudioPlayer *)self logContext];
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "PXAudioPlayerChangedCurrentAsset", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
      }
    }

    CMTime v38 = time;
    [(PXAudioPlayer *)self setCurrentAssetDuration:&v38];
    v29 = [PXCurrentTimeRecord alloc];
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(void *)&buf[16] = a4->var3;
    v30 = [(PXCurrentTimeRecord *)v29 initWithSampleTime:buf rate:0.0];
    [(PXAudioPlayer *)self setMainQueue_currentTimeRecord:v30];

LABEL_22:
  }
  objc_storeStrong((id *)&self->_currentAsset, a3);
  v31 = [(PXAudioPlayer *)self sessionsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PXAudioPlayer_setCurrentAsset_startTime_hostTime___block_invoke;
  block[3] = &unk_1E5DD01F0;
  v34 = v8;
  CMTime v35 = self;
  long long v36 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v32 = v8;
  dispatch_async(v31, block);
}

void __52__PXAudioPlayer_setCurrentAsset_startTime_hostTime___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      LODWORD(v7) = 138412290;
      *(void *)((char *)&v7 + 4) = v3;
      _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%@ creating new session.", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    long long v7 = *(_OWORD *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v6 = [v4 _createAudioSessionForAsset:v5 startTime:&v7];
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "sessionsQueue_setCurrentSession:", v6);
}

- (void)setCurrentAsset:(id)a3 startTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  long long v4 = *MEMORY[0x1E4F1F9F8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(PXAudioPlayer *)self setCurrentAsset:a3 startTime:&v6 hostTime:&v4];
}

- (void)setCurrentAsset:(id)a3
{
  long long v3 = *MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(PXAudioPlayer *)self setCurrentAsset:a3 startTime:&v3];
}

- (void)playFromStartTime:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((a3->var2 & 1) == 0) {
    PXAssertGetLog();
  }
  uint64_t v5 = [(PXAudioPlayer *)self sessionsQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __35__PXAudioPlayer_playFromStartTime___block_invoke;
  v6[3] = &unk_1E5DD01C8;
  v6[4] = self;
  long long v7 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  dispatch_async(v5, v6);

  [(PXAudioPlayer *)self setDesiredPlayState:1];
}

void __35__PXAudioPlayer_playFromStartTime___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__PXAudioPlayer_playFromStartTime___block_invoke_2;
  v3[3] = &__block_descriptor_56_e33_v16__0___PXMutableAudioSession__8l;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  [v2 performChanges:v3];
}

uint64_t __35__PXAudioPlayer_playFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 playFromTime:&v3];
}

- (void)setDesiredPlayState:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    uint64_t v5 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_desiredPlayState == 1) {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = @"Playing";
      }
      else {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = @"Paused";
      }
      int v20 = 138412546;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      int64_t v23 = (int64_t)v6;
      long long v7 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "%@ desired play state is now %@", (uint8_t *)&v20, 0x16u);
    }
    [(PXAudioPlayer *)self signalChange:16];
    uint64_t v8 = [(PXAudioPlayer *)self log];
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXAudioPlayer *)self logContext];
        int v20 = 134217984;
        uint64_t v21 = (PXAudioPlayer *)v11;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PXAudioPlayerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
      }
    }

    id v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXAudioPlayer *)self logContext];
        int v20 = 134218240;
        uint64_t v21 = (PXAudioPlayer *)v15;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_EVENT, v14, "PXAudioPlayerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v20, 0x16u);
      }
    }

    char v16 = v12;
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v18 = v17;
      if (os_signpost_enabled(v16))
      {
        uint64_t v19 = [(PXAudioPlayer *)self logContext];
        int v20 = 134218240;
        uint64_t v21 = (PXAudioPlayer *)v19;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXAudioPlayerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v20, 0x16u);
      }
    }

    [(PXAudioPlayer *)self _invalidateCurrentSessionState];
  }
}

- (void)setTargetLoudnessInLKFS:(float)a3
{
  if (self->_targetLoudnessInLKFS != a3)
  {
    self->_targetLoudnessInLKFS = a3;
    uint64_t v5 = [(PXAudioPlayer *)self sessionsQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    id v6[2] = __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke;
    v6[3] = &unk_1E5DD0180;
    v6[4] = self;
    float v7 = a3;
    dispatch_async(v5, v6);
  }
}

void __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke_2;
  v3[3] = &__block_descriptor_36_e33_v16__0___PXMutableAudioSession__8l;
  int v4 = *(_DWORD *)(a1 + 40);
  [v2 performChanges:v3];
}

uint64_t __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setTargetLoudnessInLKFS:a3];
}

- (void)setVolume:(float)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_volume != a3)
  {
    self->_volume = a3;
    [(PXAudioPlayer *)self signalChange:8];
    uint64_t v5 = [(PXAudioPlayer *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = [(PXAudioPlayer *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXAudioPlayerChangedVolume", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    uint64_t v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXAudioPlayer *)self logContext];
        *(_DWORD *)buf = 134218240;
        uint64_t v20 = v11;
        __int16 v21 = 2048;
        double v22 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXAudioPlayerChangedVolume", "Context=%{signpost.telemetry:string2}lu %.2f", buf, 0x16u);
      }
    }

    id v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXAudioPlayer *)self logContext];
        *(_DWORD *)buf = 134218240;
        uint64_t v20 = v15;
        __int16 v21 = 2048;
        double v22 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXAudioPlayerChangedVolume", "Context=%{signpost.telemetry:string2}lu %.2f", buf, 0x16u);
      }
    }

    char v16 = [(PXAudioPlayer *)self sessionsQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __27__PXAudioPlayer_setVolume___block_invoke;
    v17[3] = &unk_1E5DD0180;
    v17[4] = self;
    float v18 = a3;
    dispatch_async(v16, v17);
  }
}

void __27__PXAudioPlayer_setVolume___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__PXAudioPlayer_setVolume___block_invoke_2;
  v3[3] = &__block_descriptor_36_e33_v16__0___PXMutableAudioSession__8l;
  int v4 = *(_DWORD *)(a1 + 40);
  [v2 performChanges:v3];
}

uint64_t __27__PXAudioPlayer_setVolume___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setVolume:a3];
}

- (PXAudioPlayer)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAudioPlayer.m", 101, @"%s is not available as initializer", "-[PXAudioPlayer init]");

  abort();
}

- (NSString)description
{
  id v3 = [NSString alloc];
  int v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  os_signpost_id_t v6 = [(PXAudioPlayer *)self name];
  os_signpost_id_t v7 = PXAudioPlayerStateDescription([(PXAudioPlayer *)self state]);
  [(PXAudioPlayer *)self currentTime];
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(PXAudioPlayer *)self currentAssetDuration];
  Float64 v9 = CMTimeGetSeconds(&v13);
  os_signpost_id_t v10 = [(PXAudioPlayer *)self currentAsset];
  uint64_t v11 = objc_msgSend(v3, "initWithFormat:", @"<%@: %p; name: %@; state: %@; currentTime: %.1f/%.1fs; currentAsset: %@>",
                  v5,
                  self,
                  v6,
                  v7,
                  *(void *)&Seconds,
                  *(void *)&v9,
                  v10);

  return (NSString *)v11;
}

- (PXAudioPlayer)initWithName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXAudioPlayer;
  uint64_t v5 = [(PXAudioPlayer *)&v14 init];
  os_signpost_id_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v5->_currentAssetDuration.value = *MEMORY[0x1E4F1F9F8];
    v5->_currentAssetDuration.epoch = *(void *)(v7 + 16);
    uint64_t v8 = [v4 copy];
    name = v6->_name;
    v6->_name = (NSString *)v8;

    v6->_state = 1;
    os_signpost_id_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PhotosUICore.PXAudioPlayer.sessions", v10);
    sessionsQueue = v6->_sessionsQueue;
    v6->_sessionsQueue = (OS_dispatch_queue *)v11;

    v6->_volume = 1.0;
  }

  return v6;
}

@end