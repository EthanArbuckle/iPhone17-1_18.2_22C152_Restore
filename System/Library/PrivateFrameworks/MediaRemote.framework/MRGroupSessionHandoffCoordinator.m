@interface MRGroupSessionHandoffCoordinator
- (MRGroupSessionDiscovery)groupSessionDiscovery;
- (MRGroupSessionHandoffCoordinator)initWithDelegate:(id)a3;
- (MRGroupSessionHandoffCoordinatorDelegate)delegate;
- (MRNowPlayingController)nowPlayingController;
- (NSSet)handoffSuppressedDevices;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)queue;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)controller:(id)a3 playerPathDidChange:(id)a4;
- (void)groupSessionDiscovery:(id)a3 discoveredSessionsDidChange:(id)a4;
- (void)reevaluate;
- (void)setDelegate:(id)a3;
- (void)setGroupSessionDiscovery:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRGroupSessionHandoffCoordinator

- (MRGroupSessionHandoffCoordinator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MRGroupSessionHandoffCoordinator;
  v5 = [(MRGroupSessionHandoffCoordinator *)&v27 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = MRGroupSessionSubsystemGetQueue();
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRGroupSessionHandoffCoordinator.serialQueue", v7, v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = MRGroupSessionSubsystemGetNotificationQueue();
    dispatch_queue_t v13 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRGroupSessionHandoffCoordinator.notificationQueue", v11, v12);
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v13;

    v15 = [[MRGroupSessionDiscovery alloc] initWithDelegate:v6];
    groupSessionDiscovery = v6->_groupSessionDiscovery;
    v6->_groupSessionDiscovery = v15;

    uint64_t v17 = +[MRNowPlayingController localRouteController];
    nowPlayingController = v6->_nowPlayingController;
    v6->_nowPlayingController = (MRNowPlayingController *)v17;

    v19 = [(MRNowPlayingController *)v6->_nowPlayingController configuration];
    [v19 setWantsChangeCallbacksDuringInitialLoad:1];

    v20 = [(MRNowPlayingController *)v6->_nowPlayingController configuration];
    [v20 setRequestPlaybackState:1];

    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = [(MRNowPlayingController *)v6->_nowPlayingController configuration];
    [v23 setLabel:v22];

    [(MRNowPlayingController *)v6->_nowPlayingController setDelegate:v6];
    [(MRNowPlayingController *)v6->_nowPlayingController beginLoadingUpdates];
    v24 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionHandoffCoordinator] Begin observing", v26, 2u);
    }
  }
  return v6;
}

- (void)groupSessionDiscovery:(id)a3 discoveredSessionsDidChange:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__MRGroupSessionHandoffCoordinator_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __86__MRGroupSessionHandoffCoordinator_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reevaluate];
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MRGroupSessionHandoffCoordinator_controller_playbackStateDidChangeFrom_to___block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __77__MRGroupSessionHandoffCoordinator_controller_playbackStateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reevaluate];
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MRGroupSessionHandoffCoordinator_controller_playerPathDidChange___block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __67__MRGroupSessionHandoffCoordinator_controller_playerPathDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reevaluate];
}

- (void)reevaluate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [(MRGroupSessionHandoffCoordinator *)self nowPlayingController];
  id v4 = [v3 response];

  v5 = [v4 playerPath];
  char v6 = [v5 isSystemMediaApplication];

  BOOL IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing([v4 playbackState]);
  if ((v6 & 1) != 0 || !IsAdvancing)
  {
    dispatch_queue_t v9 = [(MRGroupSessionDiscovery *)self->_groupSessionDiscovery discoveredSessions];
    v10 = objc_msgSend(v9, "msv_map:", &__block_literal_global_113);

    v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  if (([(NSSet *)self->_handoffSuppressedDevices isEqual:v8] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_handoffSuppressedDevices, v8);
    notificationQueue = self->_notificationQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__MRGroupSessionHandoffCoordinator_reevaluate__block_invoke_2;
    v12[3] = &unk_1E57D0790;
    v12[4] = self;
    id v13 = v8;
    dispatch_async(notificationQueue, v12);
  }
}

MRGroupSessionHandoffDevice *__46__MRGroupSessionHandoffCoordinator_reevaluate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRGroupSessionHandoffDevice alloc] initWithDiscoveredSession:v2];

  return v3;
}

void __46__MRGroupSessionHandoffCoordinator_reevaluate__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 coordinator:*(void *)(a1 + 32) handoffSuppressedDevicesDidChange:*(void *)(a1 + 40)];
}

- (NSSet)handoffSuppressedDevices
{
  return self->_handoffSuppressedDevices;
}

- (MRGroupSessionHandoffCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRGroupSessionHandoffCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRGroupSessionDiscovery)groupSessionDiscovery
{
  return self->_groupSessionDiscovery;
}

- (void)setGroupSessionDiscovery:(id)a3
{
}

- (MRNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_groupSessionDiscovery, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_handoffSuppressedDevices, 0);
}

@end