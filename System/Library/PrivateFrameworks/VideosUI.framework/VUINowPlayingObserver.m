@interface VUINowPlayingObserver
- (BOOL)isObserving;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUINowPlayingObservation)latestObservation;
- (VUINowPlayingObserver)init;
- (VUINowPlayingObserverDelegate)delegate;
- (unint64_t)updateObservationContext;
- (void)_handleNowPlayingAppDidChangeNotification:(id)a3;
- (void)_handleNowPlayingAppIsPlayingDidChangeNotification:(id)a3;
- (void)_notifyDelegateLatestObservationDidChange:(id)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)_updateLatestObservation;
- (void)_updateLatestObservationWithBundleIdentifier:(id)a3 playbackState:(unsigned int)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setLatestObservation:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
- (void)setUpdateObservationContext:(unint64_t)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation VUINowPlayingObserver

- (VUINowPlayingObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUINowPlayingObserver;
  v2 = [(VUINowPlayingObserver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.videosui.VUINowPlayingObserver.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v2->_serialProcessingDispatchQueue;
    v2->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(VUINowPlayingObserver *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)VUINowPlayingObserver;
  [(VUINowPlayingObserver *)&v3 dealloc];
}

- (void)startObserving
{
  objc_initWeak(&location, self);
  objc_super v3 = [(VUINowPlayingObserver *)self serialProcessingDispatchQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__VUINowPlayingObserver_startObserving__block_invoke;
  v4[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__VUINowPlayingObserver_startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    char v3 = [WeakRetained isObserving];
    v2 = v4;
    if ((v3 & 1) == 0)
    {
      [v4 setObserving:1];
      [v4 _startObserving];
      v2 = v4;
    }
  }
}

- (void)stopObserving
{
  objc_initWeak(&location, self);
  char v3 = [(VUINowPlayingObserver *)self serialProcessingDispatchQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__VUINowPlayingObserver_stopObserving__block_invoke;
  v4[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__VUINowPlayingObserver_stopObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    int v3 = [WeakRetained isObserving];
    v2 = v4;
    if (v3)
    {
      [v4 setObserving:0];
      [v4 _stopObserving];
      v2 = v4;
    }
  }
}

- (VUINowPlayingObservation)latestObservation
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  id v12 = 0;
  int v3 = [(VUINowPlayingObserver *)self serialProcessingDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__VUINowPlayingObserver_latestObservation__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (VUINowPlayingObservation *)v4;
}

void __42__VUINowPlayingObserver_latestObservation__block_invoke(uint64_t a1)
{
}

- (void)_handleNowPlayingAppDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(VUINowPlayingObserver *)self serialProcessingDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__VUINowPlayingObserver__handleNowPlayingAppDidChangeNotification___block_invoke;
  v6[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__VUINowPlayingObserver__handleNowPlayingAppDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLatestObservation];
}

- (void)_handleNowPlayingAppIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(VUINowPlayingObserver *)self serialProcessingDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__VUINowPlayingObserver__handleNowPlayingAppIsPlayingDidChangeNotification___block_invoke;
  v6[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __76__VUINowPlayingObserver__handleNowPlayingAppIsPlayingDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLatestObservation];
}

- (void)setLatestObservation:(id)a3
{
  id v5 = a3;
  objc_super v6 = self->_latestObservation;
  id v7 = (VUINowPlayingObservation *)v5;
  uint64_t v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(VUINowPlayingObservation *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_latestObservation, a3);
    [(VUINowPlayingObserver *)self _notifyDelegateLatestObservationDidChange:v9];
  }
LABEL_9:
}

- (void)_startObserving
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleNowPlayingAppDidChangeNotification_ name:*MEMORY[0x1E4F773C8] object:0];
  [v3 addObserver:self selector:sel__handleNowPlayingAppIsPlayingDidChangeNotification_ name:*MEMORY[0x1E4F773D0] object:0];
  MRMediaRemoteSetWantsNowPlayingNotifications();
  [(VUINowPlayingObserver *)self _updateLatestObservation];
}

- (void)_stopObserving
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  MRMediaRemoteSetWantsNowPlayingNotifications();
  [(VUINowPlayingObserver *)self setLatestObservation:0];
}

- (void)_updateLatestObservation
{
  id v3 = (void *)([(VUINowPlayingObserver *)self updateObservationContext] + 1);
  [(VUINowPlayingObserver *)self setUpdateObservationContext:v3];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__VUINowPlayingObserver__updateLatestObservation__block_invoke;
  aBlock[3] = &unk_1E6DFAD90;
  objc_copyWeak(v8, &location);
  v8[1] = v3;
  id v4 = _Block_copy(aBlock);
  id v5 = [(VUINowPlayingObserver *)self serialProcessingDispatchQueue];
  id v6 = v4;
  MRMediaRemoteGetNowPlayingClient();

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __49__VUINowPlayingObserver__updateLatestObservation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7 == [WeakRetained updateObservationContext]) {
      [v6 _updateLatestObservationWithBundleIdentifier:v8 playbackState:a3];
    }
  }
}

void __49__VUINowPlayingObserver__updateLatestObservation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = MRNowPlayingClientGetBundleIdentifier();
    id v6 = *(id *)(a1 + 40);
    id v4 = v3;
    MRMediaRemoteGetPlaybackStateForClient();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

uint64_t __49__VUINowPlayingObserver__updateLatestObservation__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)_updateLatestObservationWithBundleIdentifier:(id)a3 playbackState:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v5 = (a4 < 6) & (0x26u >> a4);
    id v6 = a3;
    uint64_t v7 = [[VUINowPlayingObservation alloc] initWithBundleIdentifier:v6 isPlaying:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(VUINowPlayingObserver *)self setLatestObservation:v7];
}

- (void)_notifyDelegateLatestObservationDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUINowPlayingObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__VUINowPlayingObserver__notifyDelegateLatestObservationDidChange___block_invoke;
    v7[3] = &unk_1E6DF64E8;
    id v8 = v5;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __67__VUINowPlayingObserver__notifyDelegateLatestObservationDidChange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 nowPlayingObserver:WeakRetained latestObservationDidChange:*(void *)(a1 + 40)];
}

- (VUINowPlayingObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUINowPlayingObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (unint64_t)updateObservationContext
{
  return self->_updateObservationContext;
}

- (void)setUpdateObservationContext:(unint64_t)a3
{
  self->_updateObservationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestObservation, 0);
}

@end