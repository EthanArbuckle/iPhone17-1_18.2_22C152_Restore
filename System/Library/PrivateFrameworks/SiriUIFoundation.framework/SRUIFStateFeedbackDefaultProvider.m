@interface SRUIFStateFeedbackDefaultProvider
- (SRUIFStateFeedbackDefaultProvider)initWithConnection:(id)a3;
- (SRUIFStateFeedbackDefaultProvider)initWithConnection:(id)a3 withPlaybackOptions:(unint64_t)a4;
- (id)currentAudioPlaybackRequest;
- (id)uuidForCurrentStateFeedback;
- (id)uuidForFirstDelayTone;
- (void)_playAudioPlaybackRequest:(id)a3 completion:(id)a4;
- (void)_playFeedbackWithSoundId:(int64_t)a3 hapticLibraryKey:(id)a4 UUID:(id)a5 completion:(id)a6;
- (void)_startDelayFeedbackWithResponseMode:(id)a3 withCompletion:(id)a4;
- (void)_startSuccessFeedback:(id)a3 withCompletion:(id)a4;
- (void)cancelFeedback;
- (void)cancelFeedbackWithCompletion:(id)a3;
- (void)playAudioPlaybackRequest:(id)a3 completion:(id)a4;
- (void)playFeedbackForStateFeedbackType:(int64_t)a3 withResponseMode:(id)a4 completion:(id)a5;
- (void)releaseAudioSessionWithCompletion:(id)a3;
@end

@implementation SRUIFStateFeedbackDefaultProvider

- (SRUIFStateFeedbackDefaultProvider)initWithConnection:(id)a3
{
  return [(SRUIFStateFeedbackDefaultProvider *)self initWithConnection:a3 withPlaybackOptions:0];
}

- (SRUIFStateFeedbackDefaultProvider)initWithConnection:(id)a3 withPlaybackOptions:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRUIFStateFeedbackDefaultProvider;
  v7 = [(SRUIFStateFeedbackDefaultProvider *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_connection, v6);
    v8->_options = a4;
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siri.stateFeedbackProviderQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;
  }
  return v8;
}

- (id)currentAudioPlaybackRequest
{
  return self->_currentAudioPlaybackRequest;
}

- (id)uuidForFirstDelayTone
{
  return self->_uuidForFirstDelayTone;
}

- (void)playFeedbackForStateFeedbackType:(int64_t)a3 withResponseMode:(id)a4 completion:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (a3 == 1)
  {
    [(SRUIFStateFeedbackDefaultProvider *)self _startSuccessFeedback:v8 withCompletion:v9];
  }
  else if (a3)
  {
    v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      objc_super v12 = "-[SRUIFStateFeedbackDefaultProvider playFeedbackForStateFeedbackType:withResponseMode:completion:]";
      _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_DEFAULT, "%s #statefeedback state feedback type not handled by feedback provier", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    [(SRUIFStateFeedbackDefaultProvider *)self _startDelayFeedbackWithResponseMode:v8 withCompletion:v9];
  }
}

- (void)playAudioPlaybackRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 itemURL];
  if (v8)
  {

LABEL_4:
    id v10 = objc_alloc(MEMORY[0x263F28420]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke;
    v20[3] = &unk_264785B68;
    id v21 = v6;
    int v11 = (AFAudioPlaybackRequest *)[v10 initWithBuilder:v20];
    currentAudioPlaybackRequest = self->_currentAudioPlaybackRequest;
    self->_currentAudioPlaybackRequest = v11;
    uint64_t v13 = v11;

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2;
    v18[3] = &unk_264785B90;
    id v19 = v7;
    [(SRUIFStateFeedbackDefaultProvider *)self _playAudioPlaybackRequest:v13 completion:v18];

    goto LABEL_5;
  }
  id v9 = [v6 itemData];

  if (v9) {
    goto LABEL_4;
  }
  v14 = [v6 toneLibraryAlertType];

  if (v14)
  {
    v15 = [v6 toneLibraryAlertType];
    uint64_t v16 = [v15 integerValue];

    [MEMORY[0x263F7FC68] playAlertForType:v16];
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
  else
  {
    v17 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFStateFeedbackDefaultProvider playAudioPlaybackRequest:completion:](v17);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_5:
}

void __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  v3 = [*(id *)(a1 + 32) aceId];
  [v24 setUUID:v3];

  v4 = [*(id *)(a1 + 32) itemURL];

  if (v4)
  {
    id v5 = objc_alloc(NSURL);
    id v6 = [*(id *)(a1 + 32) itemURL];
    id v7 = (void *)[v5 initWithString:v6];

    [v24 setItemURL:v7];
  }
  id v8 = [*(id *)(a1 + 32) itemData];
  id v9 = [v8 audioBuffer];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) itemData];
    int v11 = [v10 audioBuffer];
    [v24 setItemData:v11];
  }
  objc_super v12 = [*(id *)(a1 + 32) volume];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) volume];
    [v13 floatValue];
    objc_msgSend(v24, "setVolume:");
  }
  v14 = [*(id *)(a1 + 32) fadeInDuration];

  if (v14)
  {
    v15 = [*(id *)(a1 + 32) fadeInDuration];
    [v15 floatValue];
    [v24 setFadeInDuration:v16];
  }
  v17 = [*(id *)(a1 + 32) fadeOutDuration];

  if (v17)
  {
    v18 = [*(id *)(a1 + 32) fadeOutDuration];
    [v18 floatValue];
    [v24 setFadeOutDuration:v19];
  }
  v20 = [*(id *)(a1 + 32) numberOfLoops];

  if (v20)
  {
    id v21 = [*(id *)(a1 + 32) numberOfLoops];
    objc_msgSend(v24, "setNumberOfLoops:", objc_msgSend(v21, "integerValue"));
  }
  v22 = [*(id *)(a1 + 32) hapticLibraryKey];

  if (v22)
  {
    v23 = [*(id *)(a1 + 32) hapticLibraryKey];
    [v24 setHapticLibraryKey:v23];
  }
}

void __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2_cold_1(v4);
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (void)cancelFeedback
{
}

- (void)cancelFeedbackWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  if (self->_currentAudioPlaybackRequest)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    [WeakRetained stopAudioPlaybackRequest:self->_currentAudioPlaybackRequest immediately:0];

    if (self->_audioSessionRelinquishBlock)
    {
      id v6 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[SRUIFStateFeedbackDefaultProvider cancelFeedbackWithCompletion:]";
        _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling feedback, calling audio session relinquish block", buf, 0xCu);
      }
      (*((void (**)(void))self->_audioSessionRelinquishBlock + 2))();
      id audioSessionRelinquishBlock = self->_audioSessionRelinquishBlock;
      self->_id audioSessionRelinquishBlock = 0;
    }
    currentAudioPlaybackRequest = self->_currentAudioPlaybackRequest;
    self->_currentAudioPlaybackRequest = 0;

    uuidForFirstDelayTone = self->_uuidForFirstDelayTone;
    self->_uuidForFirstDelayTone = 0;
  }
  [(AFWatchdogTimer *)self->_delayToneTimer cancel];
  if (self->_acquiringAudioSession)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__SRUIFStateFeedbackDefaultProvider_cancelFeedbackWithCompletion___block_invoke;
    v12[3] = &unk_264785BB8;
    uint64_t v13 = v4;
    id v10 = (void *)MEMORY[0x22A643DA0](v12);
    id audioSessionAcquiredBlock = self->_audioSessionAcquiredBlock;
    self->_id audioSessionAcquiredBlock = v10;
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __66__SRUIFStateFeedbackDefaultProvider_cancelFeedbackWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)releaseAudioSessionWithCompletion:(id)a3
{
  p_connection = &self->_connection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained forceAudioSessionInactiveWithOptions:0 completion:v4];
}

- (id)uuidForCurrentStateFeedback
{
  return (id)[(AFAudioPlaybackRequest *)self->_currentAudioPlaybackRequest UUID];
}

- (void)_playFeedbackWithSoundId:(int64_t)a3 hapticLibraryKey:(id)a4 UUID:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  id v12 = a6;
  if (AFSoundIDGetIsValidAndSpecified())
  {
    uint64_t v13 = [MEMORY[0x263F28440] sharedManager];
    uint64_t v14 = [v13 URLForSoundID:a3];
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v10 | v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F28420]);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke;
    v23[3] = &unk_264785BE0;
    id v24 = (id)v14;
    id v25 = v11;
    id v26 = (id)v10;
    uint64_t v16 = (AFAudioPlaybackRequest *)[v15 initWithBuilder:v23];
    currentAudioPlaybackRequest = self->_currentAudioPlaybackRequest;
    self->_currentAudioPlaybackRequest = v16;
    v18 = v16;

    float v19 = self->_currentAudioPlaybackRequest;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke_2;
    v21[3] = &unk_264785B90;
    id v22 = v12;
    [(SRUIFStateFeedbackDefaultProvider *)self _playAudioPlaybackRequest:v19 completion:v21];
  }
  else
  {
    v20 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[SRUIFStateFeedbackDefaultProvider _playFeedbackWithSoundId:hapticLibraryKey:UUID:completion:]";
      _os_log_impl(&dword_225FBA000, v20, OS_LOG_TYPE_DEFAULT, "%s #statefeedback no audio or haptic specified, visual only feedback", buf, 0xCu);
    }
    if (v12) {
      (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
    }
  }
}

void __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v5 = a2;
  [v5 setItemURL:v3];
  [v5 setNumberOfLoops:0];
  LODWORD(v4) = 1.0;
  [v5 setVolume:v4];
  [v5 setFadeOutDuration:0.5];
  [v5 setUUID:a1[5]];
  [v5 setHapticLibraryKey:a1[6]];
}

uint64_t __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)_playAudioPlaybackRequest:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F285D0]) initWithBuilder:&__block_literal_global];
  objc_initWeak(&location, self);
  self->_acquiringAudioSession = 1;
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v19 = "-[SRUIFStateFeedbackDefaultProvider _playAudioPlaybackRequest:completion:]";
    _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Acquiring Audio Session", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_9;
  v13[3] = &unk_264785C28;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [WeakRetained acquireAudioSessionWithContext:v8 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setReason:3];
  [v2 setOptions:2];
}

void __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[56] = 0;
    uint64_t v9 = *((void *)WeakRetained + 8);
    if (v9)
    {
      (*(void (**)(void))(v9 + 16))();
      unint64_t v10 = (void *)*((void *)v8 + 8);
      *((void *)v8 + 8) = 0;
    }
    id v11 = [v5 error];

    id v12 = (os_log_t *)MEMORY[0x263F28348];
    uint64_t v13 = (void *)*MEMORY[0x263F28348];
    id v14 = *MEMORY[0x263F28348];
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_9_cold_1(v13, v5);
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v13;
        int v20 = 136315394;
        id v21 = "-[SRUIFStateFeedbackDefaultProvider _playAudioPlaybackRequest:completion:]_block_invoke";
        __int16 v22 = 1024;
        int v23 = [v5 audioSessionID];
        _os_log_impl(&dword_225FBA000, v15, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Acquired Audio Session: %d", (uint8_t *)&v20, 0x12u);
      }
      if (*((void *)v8 + 2))
      {
        id v16 = objc_loadWeakRetained((id *)v8 + 1);
        [v16 startAudioPlaybackRequest:*(void *)(a1 + 32) options:*((void *)v8 + 3) completion:*(void *)(a1 + 40)];

        uint64_t v17 = MEMORY[0x22A643DA0](v6);
        v18 = (void *)*((void *)v8 + 4);
        *((void *)v8 + 4) = v17;
      }
      else
      {
        float v19 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315138;
          id v21 = "-[SRUIFStateFeedbackDefaultProvider _playAudioPlaybackRequest:completion:]_block_invoke";
          _os_log_impl(&dword_225FBA000, v19, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Relinquishing audio session as there is no active audio playback request anymore", (uint8_t *)&v20, 0xCu);
        }
        v6[2](v6);
      }
    }
  }
}

- (void)_startSuccessFeedback:(id)a3 withCompletion:(id)a4
{
  id v9 = a4;
  uint64_t v5 = AFSoundIDGetFromName();
  if ([MEMORY[0x263F286B8] isSAEEnabled]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08C38]);
    id v8 = [v7 UUIDString];
    [(SRUIFStateFeedbackDefaultProvider *)self _playFeedbackWithSoundId:v5 hapticLibraryKey:@"TestPattern01" UUID:v8 completion:v9];
  }
}

- (void)_startDelayFeedbackWithResponseMode:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v9 = [v8 UUIDString];

  if ([MEMORY[0x263F286B8] isSAEEnabled])
  {
    uint64_t v10 = AFSoundIDGetFromName();
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 8;
    }
  }
  else
  {
    uint64_t v11 = 8;
  }
  if (([v6 isEqualToString:*MEMORY[0x263F65E88]] & 1) == 0
    && (!AFIsNano() || ![v6 isEqualToString:*MEMORY[0x263F65E80]]))
  {
    objc_storeStrong((id *)&self->_uuidForFirstDelayTone, v9);
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke;
    v12[3] = &unk_264785C98;
    objc_copyWeak(v15, &location);
    int v16 = 1076887552;
    v15[1] = (id)v11;
    id v13 = 0;
    id v14 = v7;
    [(SRUIFStateFeedbackDefaultProvider *)self _playFeedbackWithSoundId:v11 hapticLibraryKey:0 UUID:v9 completion:v12];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    -[SRUIFStateFeedbackDefaultProvider _startDelayFeedbackWithResponseMode:withCompletion:]();
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (v7) {
LABEL_9:
  }
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
LABEL_13:
}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_cold_1();
      }
    }
    else if (a2 != 1)
    {
      id v7 = objc_alloc(MEMORY[0x263F286E8]);
      double v8 = *(float *)(a1 + 64);
      uint64_t v9 = *((void *)WeakRetained + 9);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_21;
      v20[3] = &unk_264785C70;
      uint64_t v10 = *(void *)(a1 + 56);
      void v20[4] = WeakRetained;
      uint64_t v22 = v10;
      id v21 = *(id *)(a1 + 32);
      uint64_t v11 = [v7 initWithTimeoutInterval:v9 onQueue:v20 timeoutHandler:v8];
      id v12 = (void *)*((void *)WeakRetained + 5);
      *((void *)WeakRetained + 5) = v11;

      id v13 = (void *)*((void *)WeakRetained + 2);
      if (v13
        && ([v13 UUID],
            id v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v14 isEqualToString:*((void *)WeakRetained + 6)],
            v14,
            v15))
      {
        int v16 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          double v17 = *(float *)(a1 + 64);
          *(_DWORD *)buf = 136315394;
          uint64_t v24 = "-[SRUIFStateFeedbackDefaultProvider _startDelayFeedbackWithResponseMode:withCompletion:]_block_invoke";
          __int16 v25 = 2048;
          double v26 = v17;
          _os_log_impl(&dword_225FBA000, v16, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Starting timer for second delay tone for %f seconds", buf, 0x16u);
        }
        [*((id *)WeakRetained + 5) start];
      }
      else
      {
        v18 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v24 = "-[SRUIFStateFeedbackDefaultProvider _startDelayFeedbackWithResponseMode:withCompletion:]_block_invoke";
          _os_log_impl(&dword_225FBA000, v18, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Not playing second delay tone, delay feedback has been cancelled", buf, 0xCu);
        }
      }
    }
    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      (*(void (**)(uint64_t, uint64_t, id))(v19 + 16))(v19, a2, v5);
    }
  }
}

uint64_t __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playFeedbackWithSoundId:*(void *)(a1 + 48) hapticLibraryKey:*(void *)(a1 + 40) UUID:0 completion:&__block_literal_global_24];
}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_2_cold_1();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_audioSessionAcquiredBlock, 0);
  objc_storeStrong((id *)&self->_uuidForFirstDelayTone, 0);
  objc_storeStrong((id *)&self->_delayToneTimer, 0);
  objc_storeStrong(&self->_audioSessionRelinquishBlock, 0);
  objc_storeStrong((id *)&self->_currentAudioPlaybackRequest, 0);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)playAudioPlaybackRequest:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[SRUIFStateFeedbackDefaultProvider playAudioPlaybackRequest:completion:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s Failed to play SAUIPlayAudioCommand, illformed command", (uint8_t *)&v1, 0xCu);
}

void __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[SRUIFStateFeedbackDefaultProvider playAudioPlaybackRequest:completion:]_block_invoke_2";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s Failed to play SAUIPlayAudioCommand, illformed command", (uint8_t *)&v1, 0xCu);
}

void __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_9_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  double v4 = [a2 error];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225FBA000, v3, OS_LOG_TYPE_ERROR, "%s #statefeedback Failed to acquire Audio Session for playback with error: %@", (uint8_t *)v5, 0x16u);
}

- (void)_startDelayFeedbackWithResponseMode:withCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_225FBA000, v0, OS_LOG_TYPE_DEBUG, "%s #statefeedback Stripping delay tone sound for response mode: %@", (uint8_t *)v1, 0x16u);
}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225FBA000, v0, OS_LOG_TYPE_ERROR, "%s #statefeedback Failed to play first delay tone: %@", (uint8_t *)v1, 0x16u);
}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225FBA000, v0, OS_LOG_TYPE_ERROR, "%s #statefeedback Failed to play second delay tone: %@", (uint8_t *)v1, 0x16u);
}

@end