@interface PFCameraViewfinderSessionWatcher
- (BOOL)isCameraRunning;
- (PFCameraViewfinderSessionWatcher)initWithDispatchQueue:(id)a3 delegate:(id)a4;
- (PFCameraViewfinderSessionWatcherDelegate)delegate;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4;
- (void)dealloc;
- (void)startWatching;
- (void)stopWatching;
@end

@implementation PFCameraViewfinderSessionWatcher

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_counter;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  if ((v5 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_isCameraRunning);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cameraWatcherDidChangeState:self];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
    if (v7) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFCameraViewfinderSessionWatcher] viewfinderSessionDidBegin:, _isCameraRunning state: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  if ((v5 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_isCameraRunning);
    ++self->_counter;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cameraWatcherDidChangeState:self];

    unint64_t counter = self->_counter;
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__PFCameraViewfinderSessionWatcher_cameraViewfinder_viewfinderSessionWillBegin___block_invoke;
    v12[3] = &unk_1E5B2DE78;
    v12[4] = self;
    v12[5] = counter;
    dispatch_after(v8, queue, v12);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
    if (v10) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFCameraViewfinderSessionWatcher] cameraViewfinder:viewfinderSessionWillBegin:, _isCameraRunning state: %@", buf, 0xCu);
  }
}

- (BOOL)isCameraRunning
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  return v2 & 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_viewFinder, 0);
}

- (PFCameraViewfinderSessionWatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PFCameraViewfinderSessionWatcherDelegate *)WeakRetained;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_counter;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  if (v5)
  {
    atomic_store(0, (unsigned __int8 *)&self->_isCameraRunning);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cameraWatcherDidChangeState:self];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
    if (v7) {
      dispatch_time_t v8 = @"YES";
    }
    else {
      dispatch_time_t v8 = @"NO";
    }
    int v9 = 138412290;
    unsigned __int8 v10 = v8;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFCameraViewfinderSessionWatcher] viewfinderSessionDidEnd:, _isCameraRunning state: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __80__PFCameraViewfinderSessionWatcher_cameraViewfinder_viewfinderSessionWillBegin___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v1 + 16))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFCameraViewfinderSessionWatcher] cameraViewfinder:viewfinderSessionWillBegin: called but session didn't begin 5s later, manually setting _isCameraRunning to NO", v4, 2u);
      uint64_t v1 = *(void *)(a1 + 32);
    }
    atomic_store(0, (unsigned __int8 *)(v1 + 32));
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained cameraWatcherDidChangeState:*(void *)(a1 + 32)];
  }
}

- (void)stopWatching
{
  [(FigCameraViewfinder *)self->_viewFinder setDelegate:0 queue:0];
  viewFinder = self->_viewFinder;

  [(FigCameraViewfinder *)viewFinder stop];
}

- (void)startWatching
{
}

- (void)dealloc
{
  [(FigCameraViewfinder *)self->_viewFinder stop];
  v3.receiver = self;
  v3.super_class = (Class)PFCameraViewfinderSessionWatcher;
  [(PFCameraViewfinderSessionWatcher *)&v3 dealloc];
}

- (PFCameraViewfinderSessionWatcher)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFCameraViewfinderSessionWatcher;
  int v9 = [(PFCameraViewfinderSessionWatcher *)&v14 init];
  unsigned __int8 v10 = v9;
  if (v9)
  {
    atomic_store(0, (unsigned __int8 *)&v9->_isCameraRunning);
    v9->_unint64_t counter = 0;
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [MEMORY[0x1E4F50EE0] cameraViewfinder];
    viewFinder = v10->_viewFinder;
    v10->_viewFinder = (FigCameraViewfinder *)v11;

    [(FigCameraViewfinder *)v10->_viewFinder setDelegate:v10 queue:v7];
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

@end