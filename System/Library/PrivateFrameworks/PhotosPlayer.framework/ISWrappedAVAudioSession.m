@interface ISWrappedAVAudioSession
+ (ISWrappedAVAudioSession)sharedAmbientInstance;
+ (ISWrappedAVAudioSession)sharedVideoPlaybackInstance;
+ (id)auxiliarySession;
+ (id)sharedPhotosOneUpInstance;
+ (void)sharedAmbientInstanceWithLoadHandler:(id)a3;
+ (void)sharedPhotosOneUpInstanceWithLoadHandler:(id)a3;
+ (void)sharedVideoPlaybackInstanceWithLoadHandler:(id)a3;
- (AVAudioSession)audioSession;
- (BOOL)setActive:(BOOL)a3 error:(id *)a4;
- (BOOL)setCategory:(id)a3 error:(id *)a4;
- (BOOL)setCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 error:(id *)a7;
- (BOOL)setCategory:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (ISWrappedAVAudioSession)initWithAudioSession:(id)a3;
- (ISWrappedAVAudioSession)initWithAudioSession:(id)a3 category:(id)a4;
- (NSString)category;
- (void)_beginObservingOutputVolumeIfNeeded;
- (void)_endObservingOutputVolumeIfNeeded;
- (void)_main_informObserversOfVolumeChangeFrom:(float)a3 to:(float)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerVolumeObserver:(id)a3;
- (void)unregisterVolumeObserver:(id)a3;
@end

@implementation ISWrappedAVAudioSession

- (void)dealloc
{
  [(ISWrappedAVAudioSession *)self _endObservingOutputVolumeIfNeeded];
  v3 = self->_audioSession;
  v4 = +[ISDeferredDealloc sharedInstance];
  [v4 _performDeferredDealloc:v3];

  v5.receiver = self;
  v5.super_class = (Class)ISWrappedAVAudioSession;
  [(ISWrappedAVAudioSession *)&v5 dealloc];
}

+ (id)auxiliarySession
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F153E0] auxiliarySession];
  v4 = (void *)[v2 initWithAudioSession:v3 category:*MEMORY[0x1E4F14F68]];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_main_volumeObservers, 0);

  objc_storeStrong((id *)&self->_expectedCategory, 0);
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  v11 = v10;
  if ((void *)OutputVolumeObservationContext == a6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__ISWrappedAVAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13[3] = &unk_1E6BECF48;
    v13[4] = self;
    id v14 = v10;
    is_dispatch_on_main_queue(v13);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ISWrappedAVAudioSession;
    [(ISWrappedAVAudioSession *)&v12 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

void __74__ISWrappedAVAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
  [v9 floatValue];
  int v4 = v3;
  objc_super v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  [v5 floatValue];
  LODWORD(v7) = v6;
  LODWORD(v8) = v4;
  objc_msgSend(v2, "_main_informObserversOfVolumeChangeFrom:to:", v8, v7);
}

- (void)_main_informObserversOfVolumeChangeFrom:(float)a3 to:(float)a4
{
  double v7 = [(NSHashTable *)self->_main_volumeObservers allObjects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ISWrappedAVAudioSession__main_informObserversOfVolumeChangeFrom_to___block_invoke;
  v8[3] = &unk_1E6BECD08;
  v8[4] = self;
  float v9 = a3;
  float v10 = a4;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __70__ISWrappedAVAudioSession__main_informObserversOfVolumeChangeFrom_to___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  LODWORD(a4) = *(_DWORD *)(a1 + 44);
  return [a2 wrappedAudioSession:*(void *)(a1 + 32) didChangeVolumeFrom:a3 to:a4];
}

- (void)_endObservingOutputVolumeIfNeeded
{
  if (self->_didBeginObservingOutputVolume)
  {
    self->_didBeginObservingOutputVolume = 0;
    [(AVAudioSession *)self->_audioSession removeObserver:self forKeyPath:@"outputVolume" context:OutputVolumeObservationContext];
  }
}

- (void)_beginObservingOutputVolumeIfNeeded
{
  if (!self->_didBeginObservingOutputVolume)
  {
    self->_didBeginObservingOutputVolume = 1;
    [(AVAudioSession *)self->_audioSession addObserver:self forKeyPath:@"outputVolume" options:3 context:OutputVolumeObservationContext];
  }
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 error:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = ISGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413314;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2048;
    unint64_t v25 = a5;
    __int16 v26 = 2048;
    unint64_t v27 = a6;
    __int16 v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_1DB21E000, v14, OS_LOG_TYPE_DEFAULT, "Setting category (%@) mode (%@) routeSharingPolicy (%lu) options (%lu) on wrapped audio session %@", (uint8_t *)&v20, 0x34u);
  }

  BOOL v15 = [(AVAudioSession *)self->_audioSession setCategory:v12 mode:v13 routeSharingPolicy:a5 options:a6 error:a7];
  if (v15)
  {
    v16 = (NSString *)[v12 copy];
    expectedCategory = self->_expectedCategory;
    self->_expectedCategory = v16;
  }
  else
  {
    expectedCategory = ISGetLog();
    if (os_log_type_enabled(expectedCategory, OS_LOG_TYPE_ERROR))
    {
      id v19 = *a7;
      int v20 = 138412290;
      id v21 = v19;
      _os_log_error_impl(&dword_1DB21E000, expectedCategory, OS_LOG_TYPE_ERROR, "Failed! %@", (uint8_t *)&v20, 0xCu);
    }
  }

  return v15;
}

- (BOOL)setCategory:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [(AVAudioSession *)self->_audioSession setCategory:v8 mode:*MEMORY[0x1E4F15050] routeSharingPolicy:0 options:a4 error:a5];
  if (v9)
  {
    float v10 = (NSString *)[v8 copy];
    expectedCategory = self->_expectedCategory;
    self->_expectedCategory = v10;
  }
  return v9;
}

- (NSString)category
{
  return self->_expectedCategory;
}

- (BOOL)setActive:(BOOL)a3 error:(id *)a4
{
  return [(AVAudioSession *)self->_audioSession setActive:a3 error:a4];
}

- (void)unregisterVolumeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__ISWrappedAVAudioSession_unregisterVolumeObserver___block_invoke;
  v6[3] = &unk_1E6BECF48;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  is_dispatch_on_main_queue(v6);
}

uint64_t __52__ISWrappedAVAudioSession_unregisterVolumeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (!result)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 _endObservingOutputVolumeIfNeeded];
  }
  return result;
}

- (void)registerVolumeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__ISWrappedAVAudioSession_registerVolumeObserver___block_invoke;
  v6[3] = &unk_1E6BECF48;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  is_dispatch_on_main_queue(v6);
}

uint64_t __50__ISWrappedAVAudioSession_registerVolumeObserver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  int v6 = *(void **)(a1 + 32);

  return [v6 _beginObservingOutputVolumeIfNeeded];
}

- (BOOL)setCategory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(AVAudioSession *)self->_audioSession setCategory:v6 error:a4];
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    expectedCategory = self->_expectedCategory;
    self->_expectedCategory = v8;
  }
  return v7;
}

- (ISWrappedAVAudioSession)initWithAudioSession:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ISWrappedAVAudioSession;
  BOOL v9 = [(ISWrappedAVAudioSession *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    expectedCategory = v9->_expectedCategory;
    v9->_expectedCategory = (NSString *)v10;

    objc_storeStrong((id *)&v9->_audioSession, a3);
  }

  return v9;
}

- (ISWrappedAVAudioSession)initWithAudioSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISWrappedAVAudioSession;
  id v6 = [(ISWrappedAVAudioSession *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_expectedCategory, (id)*MEMORY[0x1E4F14F68]);
    objc_storeStrong((id *)&v7->_audioSession, a3);
  }

  return v7;
}

+ (id)sharedPhotosOneUpInstance
{
  if (sharedPhotosOneUpInstance_onceToken != -1) {
    dispatch_once(&sharedPhotosOneUpInstance_onceToken, &__block_literal_global_10_3869);
  }
  id v2 = (void *)sharedPhotosOneUpInstance_sharedVideoPlaybackInstance;

  return v2;
}

void __52__ISWrappedAVAudioSession_sharedPhotosOneUpInstance__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[ISWrappedAVAudioSession auxiliarySession];
  v1 = (void *)sharedPhotosOneUpInstance_sharedVideoPlaybackInstance;
  sharedPhotosOneUpInstance_sharedVideoPlaybackInstance = v0;

  uint64_t v2 = *MEMORY[0x1E4F14F68];
  uint64_t v3 = *MEMORY[0x1E4F15050];
  id v7 = 0;
  char v4 = [(id)sharedPhotosOneUpInstance_sharedVideoPlaybackInstance setCategory:v2 mode:v3 routeSharingPolicy:0 options:0 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    id v6 = ISGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1DB21E000, v6, OS_LOG_TYPE_ERROR, "Unable to configure Playback audio session. Error: %@", buf, 0xCu);
    }
  }
  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_13);
}

void __52__ISWrappedAVAudioSession_sharedPhotosOneUpInstance__block_invoke_11()
{
  mainQueue_ISWrappedAVAudioSessionDidLoadOneUpInstance = 1;
}

+ (void)sharedPhotosOneUpInstanceWithLoadHandler:(id)a3
{
  char v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (mainQueue_ISWrappedAVAudioSessionDidLoadOneUpInstance == 1)
    {
      id v5 = [a1 sharedPhotosOneUpInstance];
      v4[2](v4, v5);
    }
    else
    {
      id v6 = dispatch_get_global_queue(2, 0);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68__ISWrappedAVAudioSession_sharedPhotosOneUpInstanceWithLoadHandler___block_invoke;
      v7[3] = &unk_1E6BECCE0;
      id v8 = v4;
      id v9 = a1;
      dispatch_async(v6, v7);
    }
  }
}

void __68__ISWrappedAVAudioSession_sharedPhotosOneUpInstanceWithLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) sharedPhotosOneUpInstance];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (void)sharedVideoPlaybackInstanceWithLoadHandler:(id)a3
{
  char v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (mainQueue_ISWrappedAVAudioSessionDidLoadPlaybackInstance == 1)
    {
      id v5 = [a1 sharedVideoPlaybackInstance];
      v4[2](v4, v5);
    }
    else
    {
      id v6 = dispatch_get_global_queue(2, 0);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __70__ISWrappedAVAudioSession_sharedVideoPlaybackInstanceWithLoadHandler___block_invoke;
      v7[3] = &unk_1E6BECCE0;
      id v8 = v4;
      id v9 = a1;
      dispatch_async(v6, v7);
    }
  }
}

void __70__ISWrappedAVAudioSession_sharedVideoPlaybackInstanceWithLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) sharedVideoPlaybackInstance];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (ISWrappedAVAudioSession)sharedVideoPlaybackInstance
{
  if (sharedVideoPlaybackInstance_onceToken != -1) {
    dispatch_once(&sharedVideoPlaybackInstance_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)sharedVideoPlaybackInstance_sharedVideoPlaybackInstance;

  return (ISWrappedAVAudioSession *)v2;
}

void __54__ISWrappedAVAudioSession_sharedVideoPlaybackInstance__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[ISWrappedAVAudioSession auxiliarySession];
  uint64_t v1 = (void *)sharedVideoPlaybackInstance_sharedVideoPlaybackInstance;
  sharedVideoPlaybackInstance_sharedVideoPlaybackInstance = v0;

  uint64_t v2 = *MEMORY[0x1E4F14F68];
  uint64_t v3 = *MEMORY[0x1E4F15050];
  id v7 = 0;
  char v4 = [(id)sharedVideoPlaybackInstance_sharedVideoPlaybackInstance setCategory:v2 mode:v3 routeSharingPolicy:0 options:0 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    id v6 = ISGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1DB21E000, v6, OS_LOG_TYPE_ERROR, "Unable to configure Playback audio session. Error: %@", buf, 0xCu);
    }
  }
  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_8);
}

void __54__ISWrappedAVAudioSession_sharedVideoPlaybackInstance__block_invoke_6()
{
  mainQueue_ISWrappedAVAudioSessionDidLoadPlaybackInstance = 1;
}

+ (void)sharedAmbientInstanceWithLoadHandler:(id)a3
{
  char v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (mainQueue_ISWrappedAVAudioSessionDidLoadAmbientInstance == 1)
    {
      id v5 = [a1 sharedAmbientInstance];
      v4[2](v4, v5);
    }
    else
    {
      id v6 = dispatch_get_global_queue(2, 0);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __64__ISWrappedAVAudioSession_sharedAmbientInstanceWithLoadHandler___block_invoke;
      v7[3] = &unk_1E6BECCE0;
      id v8 = v4;
      id v9 = a1;
      dispatch_async(v6, v7);
    }
  }
}

void __64__ISWrappedAVAudioSession_sharedAmbientInstanceWithLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) sharedAmbientInstance];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (ISWrappedAVAudioSession)sharedAmbientInstance
{
  if (sharedAmbientInstance_onceToken != -1) {
    dispatch_once(&sharedAmbientInstance_onceToken, &__block_literal_global_3875);
  }
  id v2 = (void *)sharedAmbientInstance_sharedAmbientInstance;

  return (ISWrappedAVAudioSession *)v2;
}

void __48__ISWrappedAVAudioSession_sharedAmbientInstance__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[ISWrappedAVAudioSession auxiliarySession];
  uint64_t v1 = (void *)sharedAmbientInstance_sharedAmbientInstance;
  sharedAmbientInstance_sharedAmbientInstance = v0;

  uint64_t v2 = *MEMORY[0x1E4F14F68];
  uint64_t v3 = *MEMORY[0x1E4F15050];
  id v7 = 0;
  char v4 = [(id)sharedAmbientInstance_sharedAmbientInstance setCategory:v2 mode:v3 routeSharingPolicy:0 options:0 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    id v6 = ISGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1DB21E000, v6, OS_LOG_TYPE_ERROR, "Unable to configure Ambient audio session. Error: %@", buf, 0xCu);
    }
  }
  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_3_3878);
}

void __48__ISWrappedAVAudioSession_sharedAmbientInstance__block_invoke_1()
{
  mainQueue_ISWrappedAVAudioSessionDidLoadAmbientInstance = 1;
}

@end