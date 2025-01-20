@interface TLAlertController
+ (BOOL)_shouldStopAlertForUserInterruption:(id)a3;
+ (TLAlertController)sharedAlertController;
+ (int64_t)_playbackBackEndForAlert:(id)a3;
+ (int64_t)_playbackBackEndForAlertType:(int64_t)a3 topic:(id)a4;
- (BOOL)_stopAllAlertsInCurrentProcessWithUserInterruptionDate:(id)a3;
- (BOOL)_stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (BOOL)stopAllAlerts;
- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5;
- (TLAlertController)init;
- (id)_controllerForPlaybackBackEnd:(int64_t)a3;
- (id)_pairedWatchController;
- (id)_prepareForPlayingAlert:(id)a3;
- (id)_queuePlayerController;
- (id)_systemSoundController;
- (void)_assertRunningOnAccessQueue;
- (void)_didCompletePlaybackOfAlert:(id)a3;
- (void)_didReachTimeoutForAlert:(id)a3;
- (void)_handleUserInterruptionNotification:(id)a3;
- (void)_performBlockOnAccessQueue:(id)a3;
- (void)dealloc;
- (void)handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4;
- (void)playAlert:(id)a3 withCompletionHandler:(id)a4;
- (void)preheatForAlert:(id)a3 completionHandler:(id)a4;
- (void)updateAudioVolumeDynamicallyForAlert:(id)a3 toValue:(float)a4;
@end

@implementation TLAlertController

+ (TLAlertController)sharedAlertController
{
  if (sharedAlertController__TLAlertControllerSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedAlertController__TLAlertControllerSharedInstanceOnceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedAlertController__TLAlertControllerSharedInstance;

  return (TLAlertController *)v2;
}

uint64_t __42__TLAlertController_sharedAlertController__block_invoke()
{
  sharedAlertController__TLAlertControllerSharedInstance = objc_alloc_init(TLAlertController);

  return MEMORY[0x1F41817F8]();
}

- (TLAlertController)init
{
  v21.receiver = self;
  v21.super_class = (Class)TLAlertController;
  v2 = [(TLAlertController *)&v21 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSString;
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
    v6 = [v5 bundleIdentifier];
    v7 = NSStringFromClass(v3);
    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [v4 stringWithFormat:@"%@.%@-%@-%@", v6, v7, @"AccessQueue", v9];
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v10;

    dispatch_queue_t v12 = dispatch_queue_create([(NSString *)v2->_accessQueueLabel UTF8String], 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    v14 = +[TLSystemApplication defaultSystemApplication];
    if (!v14) {
      goto LABEL_4;
    }
    v15 = [MEMORY[0x1E4F28B50] mainBundle];
    v16 = [v15 bundleIdentifier];
    v17 = [v14 bundleIdentifier];
    char v18 = [v16 isEqualToString:v17];

    if ((v18 & 1) == 0)
    {
LABEL_4:
      v19 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v19 addObserver:v2 selector:sel__handleUserInterruptionNotification_ name:@"_TLAlertControllerUserInterruptionNotification" object:0];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = self->_accessQueue;
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;

  v5 = +[TLSystemApplication defaultSystemApplication];
  if (!v5) {
    goto LABEL_3;
  }
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 bundleIdentifier];
  v8 = [v5 bundleIdentifier];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
LABEL_3:
    uint64_t v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v10 removeObserver:self name:@"_TLAlertControllerUserInterruptionNotification" object:0];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__TLAlertController_dealloc__block_invoke;
  block[3] = &unk_1E6C20D60;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)v3, block);

  v11.receiver = self;
  v11.super_class = (Class)TLAlertController;
  [(TLAlertController *)&v11 dealloc];
}

void __28__TLAlertController_dealloc__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1C9C8] now];
  [v1 _stopAllAlertsInCurrentProcessWithUserInterruptionDate:v2];
}

- (void)_performBlockOnAccessQueue:(id)a3
{
  accessQueue = self->_accessQueue;
  if (accessQueue) {
    dispatch_sync(accessQueue, a3);
  }
}

- (void)_assertRunningOnAccessQueue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (strcmp(label, [(NSString *)self->_accessQueueLabel UTF8String]))
    {
      v5 = TLLogGeneral();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertController.m"];
        v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          char v9 = [v7 lastPathComponent];
          uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
          int v12 = 136381443;
          v13 = "-[TLAlertController _assertRunningOnAccessQueue]";
          __int16 v14 = 2113;
          v15 = v9;
          __int16 v16 = 2049;
          uint64_t v17 = 117;
          __int16 v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);
        }
      }
      else
      {
        v7 = TLLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue](v7);
        }
      }

      objc_super v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue](v11);
      }
    }
  }
}

- (BOOL)stopAllAlerts
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = TLLogPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopAllAlerts was called.", (uint8_t *)&buf, 0xCu);
  }

  v4 = [MEMORY[0x1E4F1C9C8] now];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v5 = +[TLSystemApplication defaultSystemApplication];
  if (!v5) {
    goto LABEL_10;
  }
  BOOL v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 bundleIdentifier];
  v8 = [v5 bundleIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __34__TLAlertController_stopAllAlerts__block_invoke;
    v19[3] = &unk_1E6C20D88;
    p_long long buf = &buf;
    v19[4] = self;
    id v10 = v4;
    id v20 = v10;
    [(TLAlertController *)self _performBlockOnAccessQueue:v19];
    objc_super v11 = TLLogPlayback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138543874;
      v25 = self;
      __int16 v26 = 2114;
      v27 = @"_TLAlertControllerUserInterruptionNotification";
      __int16 v28 = 2114;
      id v29 = v10;
      _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Will post %{public}@ notification with user interruption date: %{public}@.", v24, 0x20u);
    }

    int v12 = [MEMORY[0x1E4F28C40] defaultCenter];
    v22 = @"userInterruptionDate";
    id v23 = v10;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v12 postNotificationName:@"_TLAlertControllerUserInterruptionNotification" object:0 userInfo:v13];

    __int16 v14 = TLLogPlayback();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138543874;
      v25 = self;
      __int16 v26 = 2114;
      v27 = @"_TLAlertControllerUserInterruptionNotification";
      __int16 v28 = 2114;
      id v29 = v10;
      _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Did post %{public}@ notification with user interruption date: %{public}@.", v24, 0x20u);
    }
  }
  else
  {
LABEL_10:
    v15 = (void *)MEMORY[0x1E4F1CA00];
    __int16 v16 = [v5 name];
    [v15 raise:*MEMORY[0x1E4F1C3B8], @"The method +[TLAlert _stopAllAlerts] should not be called from anywere except the %@ process.", v16 format];
  }
  BOOL v17 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v17;
}

uint64_t __34__TLAlertController_stopAllAlerts__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _stopAllAlertsInCurrentProcessWithUserInterruptionDate:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  objc_super v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__TLAlertController_playAlert_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E6C20D88;
  BOOL v17 = &v18;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  [(TLAlertController *)self _performBlockOnAccessQueue:v15];
  int v9 = (void *)v19[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E6C22070;
  v12[4] = self;
  id v10 = v8;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 playAlert:v10 withCompletionHandler:v12];

  _Block_object_dispose(&v18, 8);
}

uint64_t __53__TLAlertController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _prepareForPlayingAlert:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

void __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E6C20CC0;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 40);
  [v6 _performBlockOnAccessQueue:v8];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

uint64_t __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompletePlaybackOfAlert:*(void *)(a1 + 40)];
}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__TLAlertController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
  v13[3] = &unk_1E6C22098;
  id v16 = &v18;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  int64_t v17 = a5;
  [(TLAlertController *)self _performBlockOnAccessQueue:v13];
  LOBYTE(a5) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return a5;
}

uint64_t __74__TLAlertController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _stopPlayingAlerts:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) playbackCompletionType:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)updateAudioVolumeDynamicallyForAlert:(id)a3 toValue:(float)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  int64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8;
  uint64_t v20 = __Block_byref_object_dispose__8;
  id v21 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __66__TLAlertController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke;
  int v12 = &unk_1E6C20EA0;
  id v13 = self;
  id v7 = v6;
  id v14 = v7;
  id v15 = &v16;
  [(TLAlertController *)self _performBlockOnAccessQueue:&v9];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v8 = a4;
    [(id)v17[5] updateAudioVolumeDynamicallyForAlert:v7 toValue:v8];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Updating the audio volume of %@ is not supported. Please refer to TLAlert_Private.h for more details on the limitations of the audio volume dynamic update API.", v7, v9, v10, v11, v12, v13 format];
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __66__TLAlertController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_controllerForPlaybackBackEnd:", objc_msgSend((id)objc_opt_class(), "_playbackBackEndForAlert:", *(void *)(a1 + 40)));

  return MEMORY[0x1F41817F8]();
}

- (void)handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __81__TLAlertController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke;
  id v11 = &unk_1E6C20EA0;
  int v12 = self;
  id v7 = v6;
  id v13 = v7;
  id v14 = &v15;
  [(TLAlertController *)self _performBlockOnAccessQueue:&v8];
  if (objc_opt_respondsToSelector()) {
    [(id)v16[5] handleActivationAssertionStatusChangeForAlert:v7 updatedStatus:v4];
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Setting up an activation assertion for %@ is not supported.", v7, v8, v9, v10, v11, v12 format];
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __81__TLAlertController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_controllerForPlaybackBackEnd:", objc_msgSend((id)objc_opt_class(), "_playbackBackEndForAlert:", *(void *)(a1 + 40)));

  return MEMORY[0x1F41817F8]();
}

- (id)_prepareForPlayingAlert:(id)a3
{
  id v4 = a3;
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  uint64_t v5 = [(id)objc_opt_class() _playbackBackEndForAlert:v4];
  id v6 = objc_alloc_init(TLAlertContext);
  [(TLAlertContext *)v6 setPlaybackBackEnd:v5];
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  [(TLAlertContext *)v6 setPlaybackStartDate:v7];

  alertContexts = self->_alertContexts;
  if (!alertContexts)
  {
    uint64_t v9 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
    uint64_t v10 = self->_alertContexts;
    self->_alertContexts = v9;

    alertContexts = self->_alertContexts;
  }
  [(NSMapTable *)alertContexts setObject:v6 forKey:v4];
  id v11 = [v4 configuration];
  [v11 maximumDuration];
  double v13 = v12;

  if (v13 > 0.00000011920929)
  {
    id v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_accessQueue);
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __45__TLAlertController__prepareForPlayingAlert___block_invoke;
    id v21 = &unk_1E6C20CC0;
    v22 = self;
    id v23 = v4;
    dispatch_source_set_event_handler(v14, &v18);
    -[TLAlertContext setTimeoutTimerSource:](v6, "setTimeoutTimerSource:", v14, v18, v19, v20, v21, v22);
    dispatch_resume(v14);
  }
  uint64_t v16 = [(TLAlertController *)self _controllerForPlaybackBackEnd:v5];

  return v16;
}

uint64_t __45__TLAlertController__prepareForPlayingAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReachTimeoutForAlert:*(void *)(a1 + 40)];
}

- (BOOL)_stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v35 = a4;
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_23;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v43 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * i);
      id v14 = [(NSMapTable *)self->_alertContexts objectForKey:v13];
      dispatch_time_t v15 = v14;
      if (!v14)
      {
        uint64_t v16 = TLLogPlayback();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)long long buf = 138543618;
        v48 = self;
        __int16 v49 = 2114;
        uint64_t v50 = v13;
        uint64_t v17 = v16;
        uint64_t v18 = "%{public}@: No alert context could be found for %{public}@. This alert is not playing; ignoring stop request.";
        goto LABEL_12;
      }
      if ([v14 isBeingInterrupted])
      {
        uint64_t v16 = TLLogPlayback();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)long long buf = 138543618;
        v48 = self;
        __int16 v49 = 2114;
        uint64_t v50 = v13;
        uint64_t v17 = v16;
        uint64_t v18 = "%{public}@: %{public}@ is already being interrupted; ignoring stop request.";
LABEL_12:
        _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
        goto LABEL_19;
      }
      [v15 setBeingInterrupted:1];
      uint64_t v19 = [v15 playbackBackEnd];
      uint64_t v16 = [NSNumber numberWithInteger:v19];
      uint64_t v20 = [v10 objectForKey:v16];
      if (v20)
      {
        id v21 = (id)v20;
      }
      else
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        [v10 setObject:v21 forKey:v16];
      }
      [v21 addObject:v13];

LABEL_19:
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  }
  while (v9);
LABEL_23:

  if ([v10 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
    v24 = v35;
    if (v23)
    {
      uint64_t v25 = v23;
      int v26 = 0;
      uint64_t v27 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v39 != v27) {
            objc_enumerationMutation(v22);
          }
          id v29 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          v30 = [v22 objectForKey:v29];
          uint64_t v31 = -[TLAlertController _controllerForPlaybackBackEnd:](self, "_controllerForPlaybackBackEnd:", [v29 integerValue]);
          char v32 = v31;
          if (v31) {
            int v26 = (v26 | [v31 stopPlayingAlerts:v30 withOptions:v35 playbackCompletionType:a5]) & 1;
          }
        }
        uint64_t v25 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v25);
    }
    else
    {
      LOBYTE(v26) = 0;
    }

    BOOL v33 = v26 & 1;
  }
  else
  {
    BOOL v33 = 0;
    v24 = v35;
  }

  return v33;
}

- (void)_didReachTimeoutForAlert:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  [(TLAlertController *)self _stopPlayingAlerts:v5 withOptions:0 playbackCompletionType:1];
}

- (void)_didCompletePlaybackOfAlert:(id)a3
{
  id v8 = a3;
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  id v4 = [(NSMapTable *)self->_alertContexts objectForKey:v8];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 timeoutTimerSource];
    id v7 = v6;
    if (v6) {
      dispatch_source_cancel(v6);
    }
    [(NSMapTable *)self->_alertContexts removeObjectForKey:v8];
  }
}

- (void)preheatForAlert:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__8;
  uint64_t v20 = __Block_byref_object_dispose__8;
  id v21 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__TLAlertController_preheatForAlert_completionHandler___block_invoke;
  double v12 = &unk_1E6C20EA0;
  uint64_t v13 = self;
  id v8 = v6;
  id v14 = v8;
  dispatch_time_t v15 = &v16;
  [(TLAlertController *)self _performBlockOnAccessQueue:&v9];
  if (objc_opt_respondsToSelector()) {
    [(id)v17[5] preheatForAlert:v8 completionHandler:v7];
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Pre-heating for %@ is not supported.", v8, v9, v10, v11, v12, v13 format];
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __55__TLAlertController_preheatForAlert_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_controllerForPlaybackBackEnd:", objc_msgSend((id)objc_opt_class(), "_playbackBackEndForAlert:", *(void *)(a1 + 40)));

  return MEMORY[0x1F41817F8]();
}

+ (int64_t)_playbackBackEndForAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v6 = [v4 configuration];

  id v7 = [v6 topic];
  int64_t v8 = [a1 _playbackBackEndForAlertType:v5 topic:v7];
  if ([v6 targetDevice] == 1) {
    int64_t v8 = 2;
  }

  return v8;
}

+ (int64_t)_playbackBackEndForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  unsigned int v6 = 1;
  switch(a3)
  {
    case 13:
      unsigned int v6 = [v5 isEqualToString:@"TLAlertTopicAlarmGoToSleep"];
      break;
    case 14:
    case 18:
    case 28:
      goto LABEL_2;
    case 15:
    case 19:
    case 20:
    case 21:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      break;
    case 16:
      if (([v5 isEqualToString:@"TLAlertTopicSystemNotificationFindMyDevice"] & 1) == 0
        && ![v5 isEqualToString:@"TLAlertTopicSystemNotificationGeneric"])
      {
        goto LABEL_10;
      }
      goto LABEL_2;
    case 17:
      id v7 = TLAlertTopicAppNotificationCriticalAlert;
      goto LABEL_13;
    case 22:
      id v7 = TLAlertTopicSOSCountdownTick;
LABEL_13:
      unsigned int v6 = [v5 isEqualToString:*v7] ^ 1;
      break;
    default:
      if (a3 == 1)
      {
        if (([v5 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeGroupInvitation"] & 1) != 0
          || ([v5 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeParticipantJoined"] & 1) != 0)
        {
LABEL_10:
          unsigned int v6 = 1;
        }
        else
        {
LABEL_2:
          unsigned int v6 = 0;
        }
      }
      break;
  }
  int64_t v8 = v6;

  return v8;
}

+ (BOOL)_shouldStopAlertForUserInterruption:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configuration];
  int v5 = [v4 isForPreview];
  uint64_t v6 = [v3 type];

  if (v6 == 28 || v6 == 22)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = v5 ^ 1;
    if (v6 == 1)
    {
      int64_t v8 = [v4 topic];
      if (([v8 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeGroupInvitation"] & 1) == 0
        && ([v8 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeParticipantJoined"] & 1) == 0)
      {
        v7 &= [v8 isEqualToString:@"TLAlertTopicIncomingCallAppNotification"];
      }
    }
  }

  return v7;
}

- (id)_controllerForPlaybackBackEnd:(int64_t)a3
{
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  if (a3 == 2)
  {
    int v5 = [(TLAlertController *)self _pairedWatchController];
  }
  else if (a3 == 1)
  {
    int v5 = [(TLAlertController *)self _systemSoundController];
  }
  else if (a3)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(TLAlertController *)self _queuePlayerController];
  }

  return v5;
}

- (id)_queuePlayerController
{
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  queuePlayerController = self->_queuePlayerController;
  if (!queuePlayerController)
  {
    id v4 = objc_alloc_init(TLAlertQueuePlayerController);
    int v5 = self->_queuePlayerController;
    self->_queuePlayerController = v4;

    queuePlayerController = self->_queuePlayerController;
  }

  return queuePlayerController;
}

- (id)_systemSoundController
{
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  systemSoundController = self->_systemSoundController;
  if (!systemSoundController)
  {
    id v4 = objc_alloc_init(TLAlertSystemSoundController);
    int v5 = self->_systemSoundController;
    self->_systemSoundController = v4;

    systemSoundController = self->_systemSoundController;
  }

  return systemSoundController;
}

- (id)_pairedWatchController
{
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  pairedWatchController = self->_pairedWatchController;
  if (!pairedWatchController)
  {
    id v4 = objc_alloc_init(TLAlertPairedWatchController);
    int v5 = self->_pairedWatchController;
    self->_pairedWatchController = v4;

    pairedWatchController = self->_pairedWatchController;
  }

  return pairedWatchController;
}

- (BOOL)_stopAllAlertsInCurrentProcessWithUserInterruptionDate:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  [(TLAlertController *)self _assertRunningOnAccessQueue];
  id v4 = TLLogPlayback();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v23;
    _os_log_impl(&dword_1DB936000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcessWithUserInterruptionDate:(%{public}@) was called.", buf, 0x16u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v5 = self->_alertContexts;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    id v22 = 0;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 138543874;
    long long v21 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ([(id)objc_opt_class() _shouldStopAlertForUserInterruption:v11])
        {
          double v12 = [(NSMapTable *)self->_alertContexts objectForKey:v11];
          uint64_t v13 = [v12 playbackStartDate];
          uint64_t v14 = [v13 compare:v23];
          dispatch_time_t v15 = TLLogPlayback();
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v14 == -1)
          {
            if (v16)
            {
              *(_DWORD *)long long buf = v21;
              id v29 = self;
              __int16 v30 = 2114;
              id v31 = v13;
              __int16 v32 = 2114;
              uint64_t v33 = v11;
              _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcess…: Playback started at %{public}@, i.e. before user interruption, for %{public}@. Scheduling this alert to be interrupted.", buf, 0x20u);
            }

            id v17 = v22;
            if (!v22) {
              id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            id v22 = v17;
            objc_msgSend(v17, "addObject:", v11, v21);
          }
          else
          {
            if (v16)
            {
              *(_DWORD *)long long buf = v21;
              id v29 = self;
              __int16 v30 = 2114;
              id v31 = v13;
              __int16 v32 = 2114;
              uint64_t v33 = v11;
              _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcess…: Playback started at %{public}@, i.e. after user interruption, for %{public}@. Leaving this alert playing.", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v8 = [(NSMapTable *)v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v8);
  }
  else
  {
    id v22 = 0;
  }

  BOOL v18 = [(TLAlertController *)self _stopPlayingAlerts:v22 withOptions:0 playbackCompletionType:3];
  uint64_t v19 = TLLogPlayback();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = self;
    __int16 v30 = 1024;
    LODWORD(v31) = v18;
    _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcess…: Returning willStopAnyAlert = %{BOOL}u.", buf, 0x12u);
  }

  return v18;
}

- (void)_handleUserInterruptionNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = TLLogPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleUserInterruptionNotification:(%{public}@).", buf, 0x16u);
  }

  uint64_t v6 = [v4 userInfo];
  long long v7 = [v6 objectForKey:@"userInterruptionDate"];

  uint64_t v8 = TLLogPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleUserInterruption…: User interruption date: %{public}@.", buf, 0x16u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__TLAlertController__handleUserInterruptionNotification___block_invoke;
  v10[3] = &unk_1E6C20CC0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(TLAlertController *)self _performBlockOnAccessQueue:v10];
}

uint64_t __57__TLAlertController__handleUserInterruptionNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAllAlertsInCurrentProcessWithUserInterruptionDate:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertContexts, 0);
  objc_storeStrong((id *)&self->_pairedWatchController, 0);
  objc_storeStrong((id *)&self->_systemSoundController, 0);
  objc_storeStrong((id *)&self->_queuePlayerController, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end