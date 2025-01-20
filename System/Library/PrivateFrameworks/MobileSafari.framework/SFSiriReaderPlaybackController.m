@interface SFSiriReaderPlaybackController
+ (BOOL)playerResponseIsForSiriReadThis:(id)a3;
+ (SFSiriReaderPlaybackController)sharedPlaybackController;
- (BOOL)_tearDownListenerIfNowPlayControllerIsTakenOverByResponse:(id)a3;
- (NSString)nowPlayingContentIdentifier;
- (SFSiriReaderPlaybackControllerDelegate)delegate;
- (float)currentPlaybackRate;
- (int64_t)currentPlaybackState;
- (void)controller:(id)a3 contentItemsDidUpdate:(id)a4;
- (void)controller:(id)a3 playbackRateDidChangeFrom:(float)a4 to:(float)a5;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)pause;
- (void)play;
- (void)setCurrentPlaybackState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setNowPlayingContentIdentifier:(id)a3;
- (void)setPlaybackRate:(double)a3;
- (void)setupNowPlayingListenerIfNeeded;
- (void)skipBackward;
- (void)skipForward;
- (void)updateContentIdentifierOnQueue:(id)a3 completion:(id)a4;
@end

@implementation SFSiriReaderPlaybackController

+ (SFSiriReaderPlaybackController)sharedPlaybackController
{
  if (sharedPlaybackController_onceToken != -1) {
    dispatch_once(&sharedPlaybackController_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedPlaybackController_sharedPlaybackController;

  return (SFSiriReaderPlaybackController *)v2;
}

void __58__SFSiriReaderPlaybackController_sharedPlaybackController__block_invoke()
{
  v0 = objc_alloc_init(SFSiriReaderPlaybackController);
  v1 = (void *)sharedPlaybackController_sharedPlaybackController;
  sharedPlaybackController_sharedPlaybackController = (uint64_t)v0;
}

- (void)setupNowPlayingListenerIfNeeded
{
  if (!self->_playbackController)
  {
    v3 = [MEMORY[0x1E4F77020] localDestination];
    destination = self->_destination;
    self->_destination = v3;

    v5 = (MRNowPlayingController *)[objc_alloc(MEMORY[0x1E4F77080]) initWithDestination:self->_destination];
    playbackController = self->_playbackController;
    self->_playbackController = v5;

    [(MRNowPlayingController *)self->_playbackController setDelegate:self];
    v7 = self->_playbackController;
    [(MRNowPlayingController *)v7 beginLoadingUpdates];
  }
}

- (void)play
{
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C354000, This, OS_LOG_TYPE_DEFAULT, "Safari requested unpausing playback", v4, 2u);
  }
  [(MRNowPlayingController *)self->_playbackController sendCommand:0 options:0 completion:&__block_literal_global_5];
}

void __38__SFSiriReaderPlaybackController_play__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR)) {
      __38__SFSiriReaderPlaybackController_play__block_invoke_cold_1(This);
    }
  }
}

- (void)pause
{
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C354000, This, OS_LOG_TYPE_DEFAULT, "Safari requested pausing playback", v4, 2u);
  }
  [(MRNowPlayingController *)self->_playbackController sendCommand:1 options:0 completion:&__block_literal_global_7];
}

void __39__SFSiriReaderPlaybackController_pause__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR)) {
      __39__SFSiriReaderPlaybackController_pause__block_invoke_cold_1(This);
    }
  }
}

- (void)skipForward
{
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C354000, This, OS_LOG_TYPE_DEFAULT, "Safari requested skipping forward playback", v4, 2u);
  }
  [(MRNowPlayingController *)self->_playbackController sendCommand:17 options:0 completion:&__block_literal_global_9];
}

void __45__SFSiriReaderPlaybackController_skipForward__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR)) {
      __45__SFSiriReaderPlaybackController_skipForward__block_invoke_cold_1(This);
    }
  }
}

- (void)skipBackward
{
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C354000, This, OS_LOG_TYPE_DEFAULT, "Safari requested skipping backward playback", v4, 2u);
  }
  [(MRNowPlayingController *)self->_playbackController sendCommand:18 options:0 completion:&__block_literal_global_11];
}

void __46__SFSiriReaderPlaybackController_skipBackward__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR)) {
      __46__SFSiriReaderPlaybackController_skipBackward__block_invoke_cold_1(This);
    }
  }
}

+ (BOOL)playerResponseIsForSiriReadThis:(id)a3
{
  id v3 = a3;
  v4 = [v3 playerPath];
  v5 = [v4 client];
  v6 = [v5 bundleIdentifier];
  int v7 = [v6 containsString:@"sirireaderd"];

  if (v7)
  {
    v8 = [v3 playerPath];
    v9 = [v8 client];
    v10 = [v9 parentApplicationBundleIdentifier];
    char v11 = [v10 isEqualToString:*MEMORY[0x1E4F981F8]];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)setPlaybackRate:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = a3;
    _os_log_impl(&dword_18C354000, This, OS_LOG_TYPE_DEFAULT, "Safari requested changing playback rate to %f", buf, 0xCu);
  }
  playbackController = self->_playbackController;
  uint64_t v11 = *MEMORY[0x1E4F776F8];
  int v7 = [NSNumber numberWithDouble:a3];
  v12 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke;
  v10[3] = &__block_descriptor_40_e25_v16__0__MRCommandResult_8l;
  *(double *)&v10[4] = a3;
  [(MRNowPlayingController *)playbackController sendCommand:19 options:v8 completion:v10];

  float v9 = a3;
  self->_currentPlaybackRate = v9;
}

void __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR)) {
      __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke_cold_1(a1, This);
    }
  }
}

- (void)updateContentIdentifierOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    int v7 = (objc_class *)MEMORY[0x1E4F77090];
    id v8 = a3;
    float v9 = (void *)[[v7 alloc] initWithDestination:self->_destination];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke;
    v10[3] = &unk_1E54E9BF0;
    id v11 = v6;
    [v9 requestNowPlayingItemMetadataOnQueue:v8 completion:v10];
  }
}

void __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR)) {
      __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke_cold_1(This);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  float v9 = [v5 contentIdentifier];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (BOOL)_tearDownListenerIfNowPlayControllerIsTakenOverByResponse:(id)a3
{
  if (+[SFSiriReaderPlaybackController playerResponseIsForSiriReadThis:a3])
  {
    return 0;
  }
  nowPlayingContentIdentifier = self->_nowPlayingContentIdentifier;
  id v5 = +[SFSiriVoiceUtilities sharedVoiceUtilities];
  id v6 = [v5 activeSiriReaderSessionIdentifier];
  LOBYTE(nowPlayingContentIdentifier) = [(NSString *)nowPlayingContentIdentifier isEqualToString:v6];

  if (nowPlayingContentIdentifier) {
    return 0;
  }
  [(MRNowPlayingController *)self->_playbackController endLoadingUpdates];
  playbackController = self->_playbackController;
  self->_playbackController = 0;

  self->_currentPlaybackState = 3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playbackStateDidChangeForSiriReaderPlaybackController:self];
  v10 = self->_nowPlayingContentIdentifier;
  self->_nowPlayingContentIdentifier = 0;

  [WeakRetained playbackContentIdentifierDidChangeForSiriReaderPlaybackController:self];
  return 1;
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  int v7 = [a3 response];
  BOOL v8 = [(SFSiriReaderPlaybackController *)self _tearDownListenerIfNowPlayControllerIsTakenOverByResponse:v7];

  if (v8) {
    return;
  }
  if (a5 != 2)
  {
    int64_t v9 = 0;
    goto LABEL_6;
  }
  if (self->_currentPlaybackState != 3)
  {
    int64_t v9 = 2;
LABEL_6:
    if (a5 == 1) {
      int64_t v9 = 1;
    }
    self->_currentPlaybackState = v9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playbackStateDidChangeForSiriReaderPlaybackController:self];
}

- (void)controller:(id)a3 playbackRateDidChangeFrom:(float)a4 to:(float)a5
{
  id v7 = a3;
  if (self->_currentPlaybackRate != a5)
  {
    id v10 = v7;
    BOOL v8 = [v7 response];
    BOOL v9 = [(SFSiriReaderPlaybackController *)self _tearDownListenerIfNowPlayControllerIsTakenOverByResponse:v8];

    id v7 = v10;
    if (!v9) {
      self->_currentPlaybackRate = a5;
    }
  }
}

- (void)controller:(id)a3 contentItemsDidUpdate:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  nowPlayingContentIdentifier = self->_nowPlayingContentIdentifier;
  BOOL v8 = [v6 objectAtIndexedSubscript:0];
  LOBYTE(nowPlayingContentIdentifier) = [(NSString *)nowPlayingContentIdentifier isEqualToString:v8];

  if ((nowPlayingContentIdentifier & 1) == 0)
  {
    BOOL v9 = [v13 response];
    [(SFSiriReaderPlaybackController *)self _tearDownListenerIfNowPlayControllerIsTakenOverByResponse:v9];

    id v10 = [v6 objectAtIndexedSubscript:0];
    id v11 = self->_nowPlayingContentIdentifier;
    self->_nowPlayingContentIdentifier = v10;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playbackContentIdentifierDidChangeForSiriReaderPlaybackController:self];
  }
}

- (SFSiriReaderPlaybackControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFSiriReaderPlaybackControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentPlaybackState
{
  return self->_currentPlaybackState;
}

- (void)setCurrentPlaybackState:(int64_t)a3
{
  self->_currentPlaybackState = a3;
}

- (float)currentPlaybackRate
{
  return self->_currentPlaybackRate;
}

- (NSString)nowPlayingContentIdentifier
{
  return self->_nowPlayingContentIdentifier;
}

- (void)setNowPlayingContentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingContentIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_playbackController, 0);
}

void __38__SFSiriReaderPlaybackController_play__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_1() error];
  v4 = objc_msgSend(v3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C354000, v5, v6, "Failed to start playing media for listening to page with error: %{public}@", v7, v8, v9, v10, v11);
}

void __39__SFSiriReaderPlaybackController_pause__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_1() error];
  v4 = objc_msgSend(v3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C354000, v5, v6, "Failed to pause playing media for listening to page with error: %{public}@", v7, v8, v9, v10, v11);
}

void __45__SFSiriReaderPlaybackController_skipForward__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_1() error];
  v4 = objc_msgSend(v3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C354000, v5, v6, "Failed to skip forward while listening to page with error: %{public}@", v7, v8, v9, v10, v11);
}

void __46__SFSiriReaderPlaybackController_skipBackward__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_1() error];
  v4 = objc_msgSend(v3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C354000, v5, v6, "Failed to skip backward while listening to page with error: %{public}@", v7, v8, v9, v10, v11);
}

void __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_1() error];
  uint64_t v6 = objc_msgSend(v5, "safari_privacyPreservingDescription");
  int v7 = 134218242;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_18C354000, v2, OS_LOG_TYPE_ERROR, "Failed to set the playback speed to %f while listening to page with error: %{public}@", (uint8_t *)&v7, 0x16u);
}

void __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18C354000, v4, v5, "Failed to request the now playing info while listening to page with error: %{public}@", v6, v7, v8, v9, v10);
}

@end