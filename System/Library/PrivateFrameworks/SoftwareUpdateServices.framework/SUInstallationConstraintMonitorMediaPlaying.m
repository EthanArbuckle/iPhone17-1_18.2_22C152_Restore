@interface SUInstallationConstraintMonitorMediaPlaying
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (unint64_t)unsatisfiedConstraints;
- (void)_handlePlaybackChangeNotification:(id)a3;
- (void)_queue_pollSatisfied;
- (void)dealloc;
@end

@implementation SUInstallationConstraintMonitorMediaPlaying

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BSDispatchQueueAssert();
  v13.receiver = self;
  v13.super_class = (Class)SUInstallationConstraintMonitorMediaPlaying;
  v8 = [(SUInstallationConstraintMonitorBase *)&v13 initOnQueue:v7 withRepresentedInstallationConstraints:1024 andDownload:v6];

  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.softwareupdateservices.mediaremote", 0);
    v10 = (void *)v8[7];
    v8[7] = v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v8 selector:sel__handlePlaybackChangeNotification_ name:*MEMORY[0x263F54B30] object:0];

    MRMediaRemoteSetWantsNowPlayingNotifications();
    objc_msgSend(v8, "_queue_pollSatisfied");
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  MRMediaRemoteSetWantsNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)SUInstallationConstraintMonitorMediaPlaying;
  [(SUInstallationConstraintMonitorMediaPlaying *)&v4 dealloc];
}

- (void)_queue_pollSatisfied
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v10 = MEMORY[0x263EF8330];
  objc_super v4 = v3;
  v11 = v4;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v4, v5);
  int v6 = *((unsigned __int8 *)v13 + 24);
  if (self->_queue_mediaPlaying != v6)
  {
    self->_queue_mediaPlaying = v6;
    id v7 = SULogInstallConstraints();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_mediaPlaying) {
        v8 = @"NO";
      }
      else {
        v8 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_21DCF7000, v7, OS_LOG_TYPE_DEFAULT, "%@ - media playing constraint changed (satisfied? %@)", buf, 0x16u);
    }

    dispatch_queue_t v9 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v9, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
  _Block_object_dispose(&v12, 8);
}

intptr_t __67__SUInstallationConstraintMonitorMediaPlaying__queue_pollSatisfied__block_invoke(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handlePlaybackChangeNotification:(id)a3
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__SUInstallationConstraintMonitorMediaPlaying__handlePlaybackChangeNotification___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __81__SUInstallationConstraintMonitorMediaPlaying__handlePlaybackChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  [(SUInstallationConstraintMonitorMediaPlaying *)self _queue_pollSatisfied];
  if (!self->_queue_mediaPlaying) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void).cxx_destruct
{
}

@end