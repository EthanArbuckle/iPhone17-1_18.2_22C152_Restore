@interface SRUIFStateFeedbackManager
- (SRUIFStateFeedbackManager)initWithStateFeedbackProvider:(id)a3 delegate:(id)a4;
- (void)_cancelFeedback;
- (void)_cancelFeedbackWithCompletion:(id)a3;
- (void)_playDelayFeedback;
- (void)_playSuccessFeedback;
- (void)_scheduleDelayToneFor:(double)a3;
- (void)audioPlaybackRequestDidStartForRequest:(id)a3;
- (void)cancelFeedbackWithCompletion:(id)a3;
- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6;
- (void)didUpdateEstimatedEndOfUserInput:(unint64_t)a3;
- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6;
- (void)playAudioPlaybackRequest:(id)a3 completion:(id)a4;
- (void)siriSessionDidEnd;
- (void)updateResponseMode:(id)a3;
@end

@implementation SRUIFStateFeedbackManager

- (SRUIFStateFeedbackManager)initWithStateFeedbackProvider:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SRUIFStateFeedbackManager;
  v9 = [(SRUIFStateFeedbackManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.siri.stateFeedbackManagerQueue", 0);
    nowPlayingObserverQueue = v10->_nowPlayingObserverQueue;
    v10->_nowPlayingObserverQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F72288]) initWithQueue:v10->_nowPlayingObserverQueue];
    nowPlayingObserver = v10->_nowPlayingObserver;
    v10->_nowPlayingObserver = (SOMediaNowPlayingObserver *)v13;

    [(SOMediaNowPlayingObserver *)v10->_nowPlayingObserver addListener:v10];
  }

  return v10;
}

- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = SRUIFSiriSessionStateGetDescription(a3);
    v10 = SRUIFSiriSessionStateGetDescription(a4);
    int v11 = 136315650;
    v12 = "-[SRUIFStateFeedbackManager didTransitionFromState:toState:]";
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    objc_super v16 = v10;
    _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Transitioning fromState: %@ toState: %@", (uint8_t *)&v11, 0x20u);
  }
  if (a4 != 2)
  {
    if (a4 == 1) {
      self->_stateFeedbackNeeded = 1;
    }
    else {
      [(SRUIFStateFeedbackManager *)self _cancelFeedback];
    }
  }
}

- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(SRUIFStateFeedbackManager *)self didTransitionFromState:a3 toState:a4];
  if (a5 == 16)
  {
    self->_stateFeedbackNeeded = 1;
    v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[SRUIFStateFeedbackManager didTransitionFromState:toState:event:machAbsoluteTransitionTime:]";
      _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #statefeedback will play delay tone for head gesture request if needed", (uint8_t *)&v10, 0xCu);
    }
    [(SRUIFStateFeedbackManager *)self didUpdateEstimatedEndOfUserInput:(unint64_t)a6];
  }
}

- (void)didUpdateEstimatedEndOfUserInput:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  double v5 = 2.75 - v4;
  v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SRUIFStateFeedbackManager didUpdateEstimatedEndOfUserInput:]";
    __int16 v9 = 2048;
    double v10 = v5;
    _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s #statefeedback waiting %f seconds until delay tone", (uint8_t *)&v7, 0x16u);
  }
  [(SRUIFStateFeedbackManager *)self _scheduleDelayToneFor:v5];
}

- (void)siriSessionDidEnd
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[SRUIFStateFeedbackManager siriSessionDidEnd]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling state feedback for ui session end", (uint8_t *)&v4, 0xCu);
  }
  [(SRUIFStateFeedbackManager *)self _cancelFeedback];
}

- (void)cancelFeedbackWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[SRUIFStateFeedbackManager cancelFeedbackWithCompletion:]";
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling state feedback", (uint8_t *)&v6, 0xCu);
  }
  [(SRUIFStateFeedbackManager *)self _cancelFeedbackWithCompletion:v4];
}

- (void)updateResponseMode:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SRUIFStateFeedbackManager updateResponseMode:]";
    __int16 v9 = 2112;
    double v10 = v4;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #statefeedback updating response mode to: %@", (uint8_t *)&v7, 0x16u);
  }
  responseMode = self->_responseMode;
  self->_responseMode = v4;
}

- (void)audioPlaybackRequestDidStartForRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a3 UUID];
  double v5 = [(SRUIFStateFeedbackProviding *)self->_provider uuidForCurrentStateFeedback];
  BOOL v6 = !self->_stateFeedbackNeeded || v4 == 0;
  if (!v6 && [v4 isEqualToString:v5])
  {
    int v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      double v10 = "-[SRUIFStateFeedbackManager audioPlaybackRequestDidStartForRequest:]";
      _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, "%s #statefeedback audio playback request for state feedback started", (uint8_t *)&v9, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stateFeedbackManagerDidStartPlaybackForStateFeedbackType:0];
  }
}

- (void)playAudioPlaybackRequest:(id)a3 completion:(id)a4
{
}

- (void)_cancelFeedback
{
}

- (void)_cancelFeedbackWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[SRUIFStateFeedbackManager _cancelFeedbackWithCompletion:]";
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling state feedback", buf, 0xCu);
  }
  self->_stateFeedbackNeeded = 0;
  [(AFWatchdogTimer *)self->_delayToneTimer cancelIfNotAlreadyCanceled];
  provider = self->_provider;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__SRUIFStateFeedbackManager__cancelFeedbackWithCompletion___block_invoke;
  v8[3] = &unk_264785BB8;
  id v9 = v4;
  id v7 = v4;
  [(SRUIFStateFeedbackProviding *)provider cancelFeedbackWithCompletion:v8];
}

uint64_t __59__SRUIFStateFeedbackManager__cancelFeedbackWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_playSuccessFeedback
{
  objc_initWeak(&location, self);
  provider = self->_provider;
  responseMode = self->_responseMode;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__SRUIFStateFeedbackManager__playSuccessFeedback__block_invoke;
  v5[3] = &unk_264786618;
  objc_copyWeak(&v6, &location);
  [(SRUIFStateFeedbackProviding *)provider playFeedbackForStateFeedbackType:1 withResponseMode:responseMode completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __49__SRUIFStateFeedbackManager__playSuccessFeedback__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 24))
    {
      if (a2)
      {
        double v5 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315138;
          id v9 = "-[SRUIFStateFeedbackManager _playSuccessFeedback]_block_invoke";
          _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #statefeedback started, should inform delegate", (uint8_t *)&v8, 0xCu);
        }
        id v6 = objc_loadWeakRetained(v4 + 2);
        [v6 stateFeedbackManagerDidStartPlaybackForStateFeedbackType:1];
      }
    }
    else
    {
      id v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        id v9 = "-[SRUIFStateFeedbackManager _playSuccessFeedback]_block_invoke";
        _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, "%s #statefeedback playDelayFeedback completion called, but no state feedback is needed at this time", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)_playDelayFeedback
{
  objc_initWeak(&location, self);
  provider = self->_provider;
  responseMode = self->_responseMode;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SRUIFStateFeedbackManager__playDelayFeedback__block_invoke;
  v5[3] = &unk_264786618;
  objc_copyWeak(&v6, &location);
  [(SRUIFStateFeedbackProviding *)provider playFeedbackForStateFeedbackType:0 withResponseMode:responseMode completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__SRUIFStateFeedbackManager__playDelayFeedback__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 24))
    {
      if (a3)
      {
        id v7 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          uint64_t v12 = "-[SRUIFStateFeedbackManager _playDelayFeedback]_block_invoke";
          int v8 = "%s #statefeedback audio playback request for state feedback started";
LABEL_11:
          _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
      if (a2 == 1)
      {
        id v7 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          uint64_t v12 = "-[SRUIFStateFeedbackManager _playDelayFeedback]_block_invoke";
          int v8 = "%s #statefeedback state feedback provider decided to inform immediately";
          goto LABEL_11;
        }
LABEL_12:
        id v10 = objc_loadWeakRetained(v6 + 2);
        [v10 stateFeedbackManagerDidStartPlaybackForStateFeedbackType:0];
      }
    }
    else
    {
      id v9 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        uint64_t v12 = "-[SRUIFStateFeedbackManager _playDelayFeedback]_block_invoke";
        _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #statefeedback playDelayFeedback completion called, but no state feedback is needed at this time", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_scheduleDelayToneFor:(double)a3
{
  delayToneTimer = self->_delayToneTimer;
  if (delayToneTimer) {
    [(AFWatchdogTimer *)delayToneTimer cancelIfNotAlreadyCanceled];
  }
  if (a3 <= 0.0)
  {
    if (self->_stateFeedbackNeeded)
    {
      [(SRUIFStateFeedbackManager *)self _playDelayFeedback];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x263F286E8]);
    uint64_t v7 = MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __51__SRUIFStateFeedbackManager__scheduleDelayToneFor___block_invoke;
    v14 = &unk_264785A20;
    objc_copyWeak(&v15, &location);
    id v9 = (AFWatchdogTimer *)[v6 initWithTimeoutInterval:v7 onQueue:&v11 timeoutHandler:a3];
    id v10 = self->_delayToneTimer;
    self->_delayToneTimer = v9;

    [(AFWatchdogTimer *)self->_delayToneTimer start];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __51__SRUIFStateFeedbackManager__scheduleDelayToneFor___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v3 = WeakRetained[24];
      int v4 = 136315394;
      double v5 = "-[SRUIFStateFeedbackManager _scheduleDelayToneFor:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = v3;
      _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #statefeedback delay tone timer fired, isWaitingForDelayTone: %d", (uint8_t *)&v4, 0x12u);
    }
    if (WeakRetained[24]) {
      [WeakRetained _playDelayFeedback];
    }
  }
}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (self->_nowPlayingState != a5)
  {
    uint64_t v12 = (os_log_t *)MEMORY[0x263F28348];
    uint64_t v13 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      id v15 = AFMediaPlaybackStateGetName();
      objc_super v16 = AFMediaPlaybackStateGetName();
      *(_DWORD *)buf = 136315650;
      v22 = "-[SRUIFStateFeedbackManager nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
      __int16 v23 = 2112;
      v24 = v15;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_225FBA000, v14, OS_LOG_TYPE_DEFAULT, "%s #statefeedback: Media playback state changed from: %@ to: %@", buf, 0x20u);
    }
    self->_nowPlayingState = a5;
    BOOL v17 = a4 == 4 || a4 == 2;
    if (v17 && a5 == 1)
    {
      v18 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[SRUIFStateFeedbackManager nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
        _os_log_impl(&dword_225FBA000, v18, OS_LOG_TYPE_DEFAULT, "%s #statefeedback: In process of resuming media, cancel feedback", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __94__SRUIFStateFeedbackManager_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke;
      block[3] = &unk_264785A20;
      objc_copyWeak(&v20, (id *)buf);
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __94__SRUIFStateFeedbackManager_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancelFeedback];
    id WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_nowPlayingObserverQueue, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_delayToneTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end