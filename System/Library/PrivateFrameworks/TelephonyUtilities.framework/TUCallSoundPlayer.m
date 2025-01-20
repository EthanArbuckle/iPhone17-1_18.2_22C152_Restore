@interface TUCallSoundPlayer
- (BOOL)attemptToPlayDescriptor:(id)a3;
- (BOOL)attemptToPlayDescriptor:(id)a3 completion:(id)a4;
- (BOOL)attemptToPlaySoundType:(int64_t)a3 forCall:(id)a4;
- (BOOL)attemptToPlaySoundType:(int64_t)a3 forCall:(id)a4 completion:(id)a5;
- (BOOL)isPlaying;
- (TUCallSoundPlayer)init;
- (TUSoundPlayer)player;
- (int64_t)currentlyPlayingSoundType;
- (void)dealloc;
- (void)setCurrentlyPlayingSoundType:(int64_t)a3;
- (void)setPlayer:(id)a3;
- (void)stopPlaying;
@end

@implementation TUCallSoundPlayer

- (TUCallSoundPlayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUCallSoundPlayer;
  v2 = [(TUCallSoundPlayer *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(TUSoundPlayer);
    [(TUCallSoundPlayer *)v2 setPlayer:v3];
  }
  return v2;
}

- (void)dealloc
{
  v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "TUCallSoundPlayer dealloc", buf, 2u);
  }

  [(TUCallSoundPlayer *)self stopPlaying];
  v4.receiver = self;
  v4.super_class = (Class)TUCallSoundPlayer;
  [(TUCallSoundPlayer *)&v4 dealloc];
}

- (BOOL)attemptToPlaySoundType:(int64_t)a3 forCall:(id)a4
{
  return [(TUCallSoundPlayer *)self attemptToPlaySoundType:a3 forCall:a4 completion:0];
}

- (BOOL)attemptToPlaySoundType:(int64_t)a3 forCall:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [[TUCallSoundPlayerDescriptor alloc] initWithSoundType:a3 call:v8];
  if (v10)
  {
    BOOL v11 = [(TUCallSoundPlayer *)self attemptToPlayDescriptor:v10 completion:v9];
  }
  else
  {
    v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      int64_t v15 = a3;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Not playing sound since no valid sound descriptor was returned for type=%lu call=%@", (uint8_t *)&v14, 0x16u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)attemptToPlayDescriptor:(id)a3
{
  return [(TUCallSoundPlayer *)self attemptToPlayDescriptor:a3 completion:0];
}

- (BOOL)attemptToPlayDescriptor:(id)a3 completion:(id)a4
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(TUCallSoundPlayer *)self isPlaying]
    && (uint64_t v8 = [v6 soundType],
        v8 == [(TUCallSoundPlayer *)self currentlyPlayingSoundType]))
  {
    BOOL v9 = 0;
  }
  else
  {
    v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v35 = v6;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Playing %@", buf, 0xCu);
    }

    if ([v6 audioPlayingWarmupNeeded])
    {
      BOOL v11 = (void *)CUTWeakLinkClass();
      v12 = TUDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [v11 hasActiveAudioSession];
        *(_DWORD *)buf = 67109378;
        v35[0] = v13;
        LOWORD(v35[1]) = 2112;
        *(void *)((char *)&v35[1] + 2) = v6;
        _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] audio stack ready: %d for %@", buf, 0x12u);
      }

      if (([v11 hasActiveAudioSession] & 1) == 0 && objc_msgSend(v6, "soundType") == 1)
      {
        dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
        int64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        v30 = __56__TUCallSoundPlayer_attemptToPlayDescriptor_completion___block_invoke;
        v31 = &unk_1E58E79B0;
        id v16 = v6;
        id v32 = v16;
        id v17 = v14;
        v33 = v17;
        uint64_t v18 = [v15 addObserverForName:@"TUCallAudioStackReadyNotification" object:0 queue:0 usingBlock:&v28];

        v19 = TUDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v35 = v16;
          _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] waiting for AVAudioClient setup to play %@", buf, 0xCu);
        }

        dispatch_time_t v20 = dispatch_time(0, 2000000000);
        dispatch_semaphore_wait(v17, v20);
        v21 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v28, v29, v30, v31);
        [v21 removeObserver:v18];

        v22 = TUDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v35 = v16;
          _os_log_impl(&dword_19C496000, v22, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] finished waiting for AVAudioClient setup to play %@", buf, 0xCu);
        }
      }
    }
    v23 = [(TUCallSoundPlayer *)self player];
    v24 = [v6 sound];
    uint64_t v25 = [v24 unsignedIntValue];
    uint64_t v26 = [v6 iterations];
    [v6 pauseDuration];
    objc_msgSend(v23, "playSound:iterations:pauseDurationBetweenIterations:completion:", v25, v26, v7);

    -[TUCallSoundPlayer setCurrentlyPlayingSoundType:](self, "setCurrentlyPlayingSoundType:", [v6 soundType]);
    BOOL v9 = 1;
  }

  return v9;
}

intptr_t __56__TUCallSoundPlayer_attemptToPlayDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] received notification that AVAudioClient setup has completed for %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)stopPlaying
{
  uint64_t v3 = [(TUCallSoundPlayer *)self player];
  [v3 stopPlaying];

  [(TUCallSoundPlayer *)self setCurrentlyPlayingSoundType:0];
}

- (BOOL)isPlaying
{
  v2 = [(TUCallSoundPlayer *)self player];
  char v3 = [v2 isPlaying];

  return v3;
}

- (int64_t)currentlyPlayingSoundType
{
  return self->_currentlyPlayingSoundType;
}

- (void)setCurrentlyPlayingSoundType:(int64_t)a3
{
  self->_currentlyPlayingSoundType = a3;
}

- (TUSoundPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end