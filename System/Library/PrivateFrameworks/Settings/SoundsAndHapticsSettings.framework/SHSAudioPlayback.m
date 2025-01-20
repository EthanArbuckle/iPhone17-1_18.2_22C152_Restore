@interface SHSAudioPlayback
- (AVAudioSession)_audioSession;
- (AVPlayerItem)_currentItem;
- (AVPlayerLooper)_playerLooper;
- (AVQueuePlayer)_queuePlayer;
- (BOOL)isPlayingRingtone;
- (NSString)ringtoneIdentifier;
- (SHSAudioPlayback)init;
- (id)_serverConnectionDiedToken;
- (void)dealloc;
- (void)playRingtoneWithIdentifier:(id)a3 loop:(BOOL)a4;
- (void)setAudioSessionCategory;
- (void)setRingtoneIdentifier:(id)a3;
- (void)set_audioSession:(id)a3;
- (void)set_currentItem:(id)a3;
- (void)set_playerLooper:(id)a3;
- (void)set_queuePlayer:(id)a3;
- (void)set_serverConnectionDiedToken:(id)a3;
- (void)stopPlayback;
- (void)stopRingtoneWithFadeOut:(float)a3;
@end

@implementation SHSAudioPlayback

void __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _playerLooper];
  [v2 disableLooping];

  objc_msgSend(WeakRetained, "set_playerLooper:", 0);
  v3 = [WeakRetained _queuePlayer];
  [v3 pause];

  v4 = [WeakRetained _queuePlayer];
  [v4 removeAllItems];

  [WeakRetained setRingtoneIdentifier:0];
  dispatch_time_t v5 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2;
  block[3] = &unk_264CD01F8;
  block[4] = WeakRetained;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

- (AVQueuePlayer)_queuePlayer
{
  return self->__queuePlayer;
}

- (void)set_playerLooper:(id)a3
{
}

- (void)setRingtoneIdentifier:(id)a3
{
}

- (void)stopRingtoneWithFadeOut:(float)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_time_t v5 = SHSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(float *)&double v6 = a3;
    v7 = [NSNumber numberWithFloat:v6];
    *(_DWORD *)buf = 136315394;
    v14 = "-[SHSAudioPlayback stopRingtoneWithFadeOut:]";
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s: fadeOutDuration '%{public}@'.", buf, 0x16u);
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  v8 = [(SHSAudioPlayback *)self _queuePlayer];
  CMTimeMake(&v12, (uint64_t)(float)(a3 * 100.0), 100);
  [v8 setRate:&v12 withVolumeRampDuration:0.0];

  objc_initWeak((id *)buf, self);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0) + 10);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke;
  v10[3] = &unk_264CD0220;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_after(v9, MEMORY[0x263EF83A0], v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (SHSAudioPlayback)init
{
  v15.receiver = self;
  v15.super_class = (Class)SHSAudioPlayback;
  v2 = [(SHSAudioPlayback *)&v15 init];
  if (v2)
  {
    v3 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x263EFA860]);
    queuePlayer = v2->__queuePlayer;
    v2->__queuePlayer = v3;

    uint64_t v5 = [MEMORY[0x263EF93E0] sharedInstance];
    audioSession = v2->__audioSession;
    v2->__audioSession = (AVAudioSession *)v5;

    objc_initWeak(&location, v2);
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = *MEMORY[0x263F54470];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __24__SHSAudioPlayback_init__block_invoke;
    v12[3] = &unk_264CD01D0;
    objc_copyWeak(&v13, &location);
    uint64_t v9 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:v12];
    id serverConnectionDiedToken = v2->__serverConnectionDiedToken;
    v2->__id serverConnectionDiedToken = (id)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__SHSAudioPlayback_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _playerLooper];
  [v1 disableLooping];

  objc_msgSend(WeakRetained, "set_playerLooper:", 0);
  v2 = [WeakRetained _queuePlayer];
  [v2 removeAllItems];

  objc_msgSend(WeakRetained, "set_queuePlayer:", 0);
  objc_msgSend(WeakRetained, "set_currentItem:", 0);
  [WeakRetained setRingtoneIdentifier:0];
  objc_msgSend(WeakRetained, "set_audioSession:", 0);
  id v3 = objc_alloc_init(MEMORY[0x263EFA860]);
  objc_msgSend(WeakRetained, "set_queuePlayer:", v3);

  v4 = [MEMORY[0x263EF93E0] sharedInstance];
  objc_msgSend(WeakRetained, "set_audioSession:", v4);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->__serverConnectionDiedToken];

  v4 = [(SHSAudioPlayback *)self _playerLooper];
  [v4 disableLooping];

  [(SHSAudioPlayback *)self set_playerLooper:0];
  uint64_t v5 = [(SHSAudioPlayback *)self _queuePlayer];
  [v5 removeAllItems];

  [(SHSAudioPlayback *)self set_queuePlayer:0];
  [(SHSAudioPlayback *)self set_currentItem:0];
  [(SHSAudioPlayback *)self setRingtoneIdentifier:0];
  [(SHSAudioPlayback *)self set_audioSession:0];
  v6.receiver = self;
  v6.super_class = (Class)SHSAudioPlayback;
  [(SHSAudioPlayback *)&v6 dealloc];
}

- (void)setAudioSessionCategory
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_237305000, v2, OS_LOG_TYPE_ERROR, "%s: Failed to set the audio session category to '%{public}@' with error '%{public}@'.", (uint8_t *)v3, 0x20u);
}

- (BOOL)isPlayingRingtone
{
  os_log_t v2 = [(SHSAudioPlayback *)self _queuePlayer];
  [v2 rate];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)playRingtoneWithIdentifier:(id)a3 loop:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  v7 = SHSLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NONE";
    uint64_t v9 = @"NO";
    if (v6) {
      uint64_t v8 = v6;
    }
    v39 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]";
    *(_DWORD *)buf = 136315650;
    v41 = v8;
    __int16 v40 = 2114;
    if (v4) {
      uint64_t v9 = @"YES";
    }
    __int16 v42 = 2114;
    v43 = v9;
    _os_log_impl(&dword_237305000, v7, OS_LOG_TYPE_DEFAULT, "%s: identifier: '%{public}@', loop '%{public}@'.", buf, 0x20u);
  }

  if (v6) {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_stopPlayback object:0];
  }
  else {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  }
  v10 = [(SHSAudioPlayback *)self _playerLooper];
  [v10 disableLooping];

  if (v6)
  {
    id v11 = [(SHSAudioPlayback *)self ringtoneIdentifier];
    char v12 = [(__CFString *)v6 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      id v13 = [(SHSAudioPlayback *)self _queuePlayer];
      [v13 removeAllItems];

      v14 = [MEMORY[0x263F7FC90] sharedToneManager];
      objc_super v15 = [v14 filePathForToneIdentifier:v6];

      v16 = (void *)MEMORY[0x263EFA800];
      uint64_t v17 = [NSURL fileURLWithPath:v15];
      v18 = [v16 playerItemWithURL:v17];
      [(SHSAudioPlayback *)self set_currentItem:v18];

      if (v4)
      {
        v19 = (void *)MEMORY[0x263EFA840];
        v20 = [(SHSAudioPlayback *)self _queuePlayer];
        v21 = [(SHSAudioPlayback *)self _currentItem];
        v22 = [v19 playerLooperWithPlayer:v20 templateItem:v21];
        [(SHSAudioPlayback *)self set_playerLooper:v22];
      }
      else
      {
        [(SHSAudioPlayback *)self set_playerLooper:0];
        v26 = [(SHSAudioPlayback *)self _queuePlayer];
        v27 = [(SHSAudioPlayback *)self _currentItem];
        int v28 = [v26 canInsertItem:v27 afterItem:0];

        if (v28)
        {
          v20 = [(SHSAudioPlayback *)self _queuePlayer];
          v29 = [(SHSAudioPlayback *)self _currentItem];
          [v20 insertItem:v29 afterItem:0];
        }
        else
        {
          v20 = SHSLogForCategory(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[SHSAudioPlayback playRingtoneWithIdentifier:loop:](v20);
          }
        }
      }

      [(SHSAudioPlayback *)self setRingtoneIdentifier:v6];
    }
    [(SHSAudioPlayback *)self setAudioSessionCategory];
    v30 = SHSLogForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]";
      _os_log_impl(&dword_237305000, v30, OS_LOG_TYPE_DEFAULT, "%s: Activating audio session prior to playback.", buf, 0xCu);
    }

    v31 = [(SHSAudioPlayback *)self _audioSession];
    id v36 = 0;
    char v32 = [v31 setActive:1 error:&v36];
    id v33 = v36;

    if ((v32 & 1) == 0)
    {
      v34 = SHSLogForCategory(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SHSAudioPlayback playRingtoneWithIdentifier:loop:]();
      }
    }
    v35 = [(SHSAudioPlayback *)self _queuePlayer];
    [v35 play];
  }
  else
  {
    v23 = [(SHSAudioPlayback *)self _queuePlayer];
    [v23 pause];

    v24 = [(SHSAudioPlayback *)self _queuePlayer];
    [v24 removeAllItems];

    [(SHSAudioPlayback *)self set_currentItem:0];
    [(SHSAudioPlayback *)self setRingtoneIdentifier:0];
    dispatch_time_t v25 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke;
    block[3] = &unk_264CD01F8;
    block[4] = self;
    dispatch_after(v25, MEMORY[0x263EF83A0], block);
  }
}

void __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_t v2 = SHSLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]_block_invoke";
    _os_log_impl(&dword_237305000, v2, OS_LOG_TYPE_DEFAULT, "%s: Deactivating Audio Session.", buf, 0xCu);
  }

  float v3 = [*(id *)(a1 + 32) _audioSession];
  id v7 = 0;
  char v4 = [v3 setActive:0 withOptions:1 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = SHSLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke_cold_1();
    }
  }
}

void __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_t v2 = SHSLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[SHSAudioPlayback stopRingtoneWithFadeOut:]_block_invoke_2";
    _os_log_impl(&dword_237305000, v2, OS_LOG_TYPE_DEFAULT, "%s: Deactivating Audio Session.", buf, 0xCu);
  }

  float v3 = [*(id *)(a1 + 32) _audioSession];
  id v7 = 0;
  char v4 = [v3 setActive:0 withOptions:1 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = SHSLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2_cold_1();
    }
  }
}

- (void)stopPlayback
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  float v3 = SHSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SHSAudioPlayback stopPlayback]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  char v4 = [(SHSAudioPlayback *)self _queuePlayer];

  if (v4) {
    [(SHSAudioPlayback *)self playRingtoneWithIdentifier:0 loop:0];
  }
}

- (NSString)ringtoneIdentifier
{
  return self->_ringtoneIdentifier;
}

- (AVAudioSession)_audioSession
{
  return self->__audioSession;
}

- (void)set_audioSession:(id)a3
{
}

- (void)set_queuePlayer:(id)a3
{
}

- (AVPlayerLooper)_playerLooper
{
  return self->__playerLooper;
}

- (AVPlayerItem)_currentItem
{
  return self->__currentItem;
}

- (void)set_currentItem:(id)a3
{
}

- (id)_serverConnectionDiedToken
{
  return self->__serverConnectionDiedToken;
}

- (void)set_serverConnectionDiedToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__serverConnectionDiedToken, 0);
  objc_storeStrong((id *)&self->__currentItem, 0);
  objc_storeStrong((id *)&self->__playerLooper, 0);
  objc_storeStrong((id *)&self->__queuePlayer, 0);
  objc_storeStrong((id *)&self->__audioSession, 0);
  objc_storeStrong((id *)&self->_ringtoneIdentifier, 0);
}

- (void)playRingtoneWithIdentifier:loop:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237305000, v0, v1, "%s: Failed to activate audio session with error '%{public}@'.", v2, v3, v4, v5, 2u);
}

- (void)playRingtoneWithIdentifier:(os_log_t)log loop:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SHSAudioPlayback playRingtoneWithIdentifier:loop:]";
  _os_log_error_impl(&dword_237305000, log, OS_LOG_TYPE_ERROR, "%s: Player could not insert item.", (uint8_t *)&v1, 0xCu);
}

void __52__SHSAudioPlayback_playRingtoneWithIdentifier_loop___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237305000, v0, v1, "%s: Failed to deactivate audio session with error '%{public}@'.", v2, v3, v4, v5, 2u);
}

void __44__SHSAudioPlayback_stopRingtoneWithFadeOut___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237305000, v0, v1, "%s: Failed to deactivate audio session with error '%{public}@'.", v2, v3, v4, v5, 2u);
}

@end