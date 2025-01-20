@interface _PXAppleMusicPlayerController
+ (BOOL)canApplyWorkaroundFor80278485;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fetchCurrentTime;
- (BOOL)isAtEnd;
- (NSString)currentClientIdentifier;
- (NSString)windowSceneID;
- (_PXAppleMusicPlayerController)init;
- (double)volume;
- (id)_init;
- (int64_t)playbackState;
- (void)_handleDidPrepareToPlayWithExpectation:(id)a3 error:(id)a4;
- (void)_handleItemPlaybackDidEnd;
- (void)_handlePlaybackStateDidChange;
- (void)_queue_callPreparationCompletionHandler:(BOOL)a3 error:(id)a4;
- (void)_queue_handleDidPrepareToPlayWithError:(id)a3;
- (void)_queue_handlePreparationExpectationFulfilled:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_queue_setCurrentClientIdentifier:(id)a3;
- (void)_queue_setWindowSceneID:(id)a3;
- (void)clientIdentifier:(id)a3 becomeCurrentClientIfNeeded:(BOOL)a4 performAsyncPlayerTransaction:(id)a5;
- (void)clientIdentifier:(id)a3 performAsyncPlayerTransaction:(id)a4;
- (void)dealloc;
- (void)pause;
- (void)play;
- (void)prepareToPlayWithCompletionHandler:(id)a3;
- (void)setCurrentClientIdentifier:(id)a3;
- (void)setIsAtEnd:(BOOL)a3;
- (void)setItemWithStoreID:(id)a3 startTime:(id *)a4;
- (void)setPlaybackState:(int64_t)a3;
- (void)setVolume:(double)a3;
- (void)setWindowSceneID:(id)a3;
@end

@implementation _PXAppleMusicPlayerController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playbackDidEndObserver, 0);
  objc_storeStrong(&self->_playbackStateChangeObserver, 0);
  objc_storeStrong((id *)&self->_queue_preparationExpectation, 0);
  objc_storeStrong(&self->_queue_preparationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_queue_player, 0);
  objc_storeStrong((id *)&self->_queue_windowSceneID, 0);
  objc_storeStrong((id *)&self->_queue_currentClientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_itemStoreID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isAtEnd
{
  return self->_isAtEnd;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)_handleItemPlaybackDidEnd
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___PXAppleMusicPlayerController__handleItemPlaybackDidEnd__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_handlePlaybackStateDidChange
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke;
  block[3] = &unk_1E5DD20C8;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setIsAtEnd:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_isAtEnd != a3)
  {
    BOOL v3 = a3;
    id v5 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = @"No";
      if (v3) {
        v6 = @"Yes";
      }
      *(_DWORD *)buf = 138543618;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change IsAtEnd: %@", buf, 0x16u);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44___PXAppleMusicPlayerController_setIsAtEnd___block_invoke;
    v7[3] = &unk_1E5DCEB78;
    v7[4] = self;
    BOOL v8 = v3;
    [(_PXAppleMusicPlayerController *)self performChanges:v7];
  }
}

- (void)setPlaybackState:(int64_t)a3
{
  if (self->_playbackState != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50___PXAppleMusicPlayerController_setPlaybackState___block_invoke;
    v3[3] = &unk_1E5DD09C8;
    v3[4] = self;
    v3[5] = a3;
    [(_PXAppleMusicPlayerController *)self performChanges:v3];
  }
}

- (void)_queue_callPreparationCompletionHandler:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F56658];
  int64_t preparationSignpostID = self->_preparationSignpostID;
  uint64_t v9 = *MEMORY[0x1E4F56440];
  uint64_t v21 = *MEMORY[0x1E4F56580];
  v22[0] = @"com.apple.photos.CPAnalytics.appleMusicPreparedToPlay";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  [v7 endSignpost:preparationSignpostID forEventName:v9 withPayload:v10];

  __int16 v11 = (void *)MEMORY[0x1E4F56658];
  if (v4) {
    v12 = @"com.apple.photos.CPAnalytics.appleMusicPreparationSucceeded";
  }
  else {
    v12 = @"com.apple.photos.CPAnalytics.appleMusicPreparationFailed";
  }
  uint64_t v19 = *MEMORY[0x1E4F56560];
  uint64_t v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v20 = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v16 = objc_msgSend(v15, "px_dictionaryBySettingObject:forKey:", v6, *MEMORY[0x1E4F56568]);
  [v11 sendEvent:v12 withPayload:v16];

  queue_preparationCompletionHandler = (void (**)(id, BOOL, id))self->_queue_preparationCompletionHandler;
  if (queue_preparationCompletionHandler)
  {
    queue_preparationCompletionHandler[2](queue_preparationCompletionHandler, v4, v6);
    id v18 = self->_queue_preparationCompletionHandler;
    self->_queue_preparationCompletionHandler = 0;
  }
}

- (void)_queue_setWindowSceneID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSString *)a3;
  id v5 = self->_queue_windowSceneID;
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(NSString *)v4 isEqualToString:v5];

    if (!v7)
    {
      BOOL v8 = self->_queue_currentClientIdentifier;
      uint64_t v9 = (NSString *)[(NSString *)v4 copy];
      queue_windowSceneID = self->_queue_windowSceneID;
      self->_queue_windowSceneID = v9;

      __int16 v11 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_queue_windowSceneID;
        int v13 = 138543874;
        v14 = self;
        __int16 v15 = 2114;
        v16 = v8;
        __int16 v17 = 2114;
        id v18 = v12;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change audio scene ID %{public}@ => %{public}@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)_queue_setCurrentClientIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSString *)a3;
  id v5 = self->_queue_currentClientIdentifier;
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(NSString *)v4 isEqualToString:v5];

    if (!v7)
    {
      BOOL v8 = self->_queue_currentClientIdentifier;
      uint64_t v9 = (NSString *)[(NSString *)v4 copy];
      queue_currentClientIdentifier = self->_queue_currentClientIdentifier;
      self->_queue_currentClientIdentifier = v9;

      __int16 v11 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_queue_currentClientIdentifier;
        int v13 = 138543874;
        v14 = self;
        __int16 v15 = 2114;
        v16 = v8;
        __int16 v17 = 2114;
        id v18 = v12;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change current client identifier %{public}@ => %{public}@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)_queue_handleDidPrepareToPlayWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "px_isDomain:code:", *MEMORY[0x1E4F31718], 2))
  {

LABEL_7:
    id v6 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = self;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully finished preparing to play.", (uint8_t *)&v8, 0xCu);
    }
    id v4 = 0;
    id v5 = 0;
    uint64_t v7 = 1;
    goto LABEL_10;
  }
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXAppleMusicPlayerControllerErrorDomain", 4, v4, @"Encountered a MediaPlayer error when preparing to play Apple Music.");
  id v6 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    __int16 v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "%{public}@ encountered an error while preparing to play: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = 0;
LABEL_10:

  [(_PXAppleMusicPlayerController *)self _queue_callPreparationCompletionHandler:v7 error:v5];
}

- (void)_handleDidPrepareToPlayWithExpectation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78___PXAppleMusicPlayerController__handleDidPrepareToPlayWithExpectation_error___block_invoke;
  v11[3] = &unk_1E5DD2548;
  id v12 = v6;
  id v9 = v6;
  objc_copyWeak(&v14, &location);
  id v13 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_queue_handlePreparationExpectationFulfilled:(id)a3 success:(BOOL)a4 error:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (self->_queue_preparationExpectation == a3 && !a4)
  {
    id v9 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "%{public}@ timed out preparing to play. Error: %{public}@", buf, 0x16u);
    }

    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXAppleMusicPlayerControllerErrorDomain", 2, v8, @"Apple Music playback preparation timed out after %fs.", 0x403E000000000000);
    [(_PXAppleMusicPlayerController *)self _queue_callPreparationCompletionHandler:0 error:v10];
  }
}

- (void)setVolume:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  float v6 = a3;
  self->_queue_volume = v6;
  if (self->_playerRespondsToRelativeVolume)
  {
    queue_player = self->_queue_player;
    -[MPMusicPlayerApplicationController setRelativeVolume:](queue_player, "setRelativeVolume:");
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43___PXAppleMusicPlayerController_setVolume___block_invoke;
    v8[3] = &unk_1E5DD08D8;
    v8[4] = self;
    v8[5] = a2;
    if (setVolume__onceToken != -1) {
      dispatch_once(&setVolume__onceToken, v8);
    }
  }
}

- (void)play
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2[0] = 0;
  v2[1] = v2;
  v2[2] = 0x2020000000;
  char v3 = 0;
  px_dispatch_on_main_queue_sync();
}

- (void)pause
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v3 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    queue_player = self->_queue_player;
    int v5 = 138543618;
    float v6 = self;
    __int16 v7 = 2112;
    id v8 = queue_player;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sending pause command to %@.", (uint8_t *)&v5, 0x16u);
  }

  [(MPMusicPlayerApplicationController *)self->_queue_player pause];
}

- (void)prepareToPlayWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  queue_preparationExpectation = self->_queue_preparationExpectation;
  if (queue_preparationExpectation)
  {
    self->_queue_preparationExpectation = 0;
  }
  if (self->_queue_preparationCompletionHandler)
  {
    __int16 v7 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ informing existing preparation completion handler that preparation is being interrupted.", buf, 0xCu);
    }

    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXAppleMusicPlayerControllerErrorDomain", 5, @"Apple Music playback preparation was interrupted by another prepare command.");
    [(_PXAppleMusicPlayerController *)self _queue_callPreparationCompletionHandler:0 error:v8];
  }
  self->_int64_t preparationSignpostID = [MEMORY[0x1E4F56658] startSignpost];
  uint64_t v9 = [PXExpectation alloc];
  queue = self->_queue;
  __int16 v11 = NSStringFromSelector(a2);
  id v12 = -[PXExpectation initWithQueue:labelFormat:](v9, "initWithQueue:labelFormat:", queue, @"%@; Client: %@",
          v11,
          self->_queue_currentClientIdentifier);

  objc_initWeak(&from, v12);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E5DC3838;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  [(PXExpectation *)v12 performWhenFulfilled:v22 timeout:30.0];
  __int16 v13 = (void *)[v5 copy];
  id queue_preparationCompletionHandler = self->_queue_preparationCompletionHandler;
  self->_id queue_preparationCompletionHandler = v13;

  objc_storeStrong((id *)&self->_queue_preparationExpectation, v12);
  uint64_t v15 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ will prepare to play", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke_40;
  aBlock[3] = &unk_1E5DC3860;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  v16 = _Block_copy(aBlock);
  char v17 = objc_opt_respondsToSelector();
  queue_player = self->_queue_player;
  if (v17) {
    [(MPMusicPlayerApplicationController *)queue_player prepareToPlayWithCompletionHandler:v16 timeout:30.0];
  }
  else {
    [(MPMusicPlayerApplicationController *)queue_player prepareToPlayWithCompletionHandler:v16];
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (void)setItemWithStoreID:(id)a3 startTime:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  float v6 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((a4->var2 & 0x1D) != 1)
  {
    long long v7 = *MEMORY[0x1E4F1FA48];
    a4->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a4->var0 = v7;
  }
  self->_isAtEnd = 0;
  id v8 = self->_queue_itemStoreID;
  if (v8 == v6)
  {
  }
  else
  {
    uint64_t v9 = v8;
    id v10 = v6;
    BOOL v11 = [(NSString *)v10 isEqualToString:v9];

    if (!v11)
    {
      id v12 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.var0) = 138543618;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)self;
        LOWORD(buf.var2) = 2114;
        *(void *)((char *)&buf.var2 + 2) = v10;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ preparing item with store ID %{public}@.", (uint8_t *)&buf, 0x16u);
      }

      __int16 v13 = (NSString *)[(NSString *)v10 copy];
      queue_itemStoreID = self->_queue_itemStoreID;
      self->_queue_itemStoreID = v13;

      id v15 = objc_alloc(MEMORY[0x1E4F319C8]);
      id v20 = v10;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      char v17 = (void *)[v15 initWithStoreIDs:v16];

      [v17 setPrivate:1];
      $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
      [v17 setStartTime:v10 forItemWithStoreID:CMTimeGetSeconds((CMTime *)&buf)];
      [(MPMusicPlayerApplicationController *)self->_queue_player setQueueWithDescriptor:v17];

      goto LABEL_12;
    }
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
  double Seconds = CMTimeGetSeconds((CMTime *)&buf);
  uint64_t v19 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.var0) = 138543618;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)self;
    LOWORD(buf.var2) = 2048;
    *(double *)((char *)&buf.var2 + 2) = Seconds;
    _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ seeking item in place to new time %.2f.", (uint8_t *)&buf, 0x16u);
  }

  [(MPMusicPlayerApplicationController *)self->_queue_player setCurrentPlaybackTime:Seconds];
LABEL_12:
}

- (double)volume
{
  uint64_t v6 = 0;
  long long v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39___PXAppleMusicPlayerController_volume__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fetchCurrentTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  id v10 = &unk_1AB5D584F;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___PXAppleMusicPlayerController_fetchCurrentTime__block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(queue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)clientIdentifier:(id)a3 becomeCurrentClientIfNeeded:(BOOL)a4 performAsyncPlayerTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108___PXAppleMusicPlayerController_clientIdentifier_becomeCurrentClientIfNeeded_performAsyncPlayerTransaction___block_invoke;
  v13[3] = &unk_1E5DCFDB8;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)clientIdentifier:(id)a3 performAsyncPlayerTransaction:(id)a4
{
}

- (NSString)windowSceneID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__192691;
  id v10 = __Block_byref_object_dispose__192692;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___PXAppleMusicPlayerController_windowSceneID__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setWindowSceneID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50___PXAppleMusicPlayerController_setWindowSceneID___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (NSString)currentClientIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__192691;
  id v10 = __Block_byref_object_dispose__192692;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56___PXAppleMusicPlayerController_currentClientIdentifier__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setCurrentClientIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___PXAppleMusicPlayerController_setCurrentClientIdentifier___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_playbackStateChangeObserver];
  [v3 removeObserver:self->_playbackDidEndObserver];

  v4.receiver = self;
  v4.super_class = (Class)_PXAppleMusicPlayerController;
  [(_PXAppleMusicPlayerController *)&v4 dealloc];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_PXAppleMusicPlayerController;
  if ([(_PXAppleMusicPlayerController *)&v3 init])
  {
    [MEMORY[0x1E4F319B8] setShouldUseSystemMusicAppOnMacOS:0];
    px_dispatch_queue_create_serial();
  }
  return 0;
}

- (_PXAppleMusicPlayerController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicPlayerController.m", 76, @"%s is not available as initializer", "-[_PXAppleMusicPlayerController init]");

  abort();
}

+ (BOOL)canApplyWorkaroundFor80278485
{
  if (canApplyWorkaroundFor80278485_onceToken != -1) {
    dispatch_once(&canApplyWorkaroundFor80278485_onceToken, &__block_literal_global_192716);
  }
  return canApplyWorkaroundFor80278485_canApply;
}

@end