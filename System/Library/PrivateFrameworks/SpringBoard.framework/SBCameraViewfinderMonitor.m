@interface SBCameraViewfinderMonitor
+ (id)sharedInstance;
- (FigCameraViewfinder)cameraViewFinder;
- (id)addObserver:(id)a3;
- (id)auditTokenForProcessWithActiveOrImminentViewfinderSession;
- (void)_cancel;
- (void)_removeObserver:(id)a3;
- (void)_start;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4;
- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3;
- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3;
- (void)setCameraViewFinder:(id)a3;
@end

@implementation SBCameraViewfinderMonitor

- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E4F4F6A8];
  if (v7) {
    [v7 clientAuditToken];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  v10 = [v9 tokenFromAuditToken:v24];
  if (v10)
  {
    id v19 = v6;
    objc_storeStrong((id *)&self->_activeSessionAuditToken, v10);
    v11 = SBLogCaptureViewfinderMonitor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v10 bundleID];
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Camera Viewfinder Active for: %@", buf, 0xCu);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v18 cameraViewfinderMonitorSessionWillBegin:self auditToken:v10];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v15);
    }

    id v6 = v19;
  }
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E4F4F6A8];
  if (v7) {
    [v7 clientAuditToken];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  v10 = [v9 tokenFromAuditToken:v25];
  v11 = v10;
  if (v10)
  {
    if (([v10 hasSameProcessAsAuditToken:self->_activeSessionAuditToken] & 1) == 0)
    {
      v12 = SBLogCaptureViewfinderMonitor();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v11 bundleID];
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v13;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Camera Viewfinder Active for: %@", buf, 0xCu);
      }
    }
    id v20 = v6;
    objc_storeStrong((id *)&self->_activeSessionAuditToken, v11);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v19 cameraViewfinderMonitorSessionDidBegin:self auditToken:v11];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }

    id v6 = v20;
  }
}

- (id)auditTokenForProcessWithActiveOrImminentViewfinderSession
{
  return self->_activeSessionAuditToken;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SBCameraViewfinderMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance___result;
  return v2;
}

void __43__SBCameraViewfinderMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___result;
  sharedInstance___result = (uint64_t)v1;
}

- (void)_start
{
  if (!self->_cameraViewFinder)
  {
    v3 = [MEMORY[0x1E4F50EE0] cameraViewfinder];
    cameraViewFinder = self->_cameraViewFinder;
    self->_cameraViewFinder = v3;

    [(FigCameraViewfinder *)self->_cameraViewFinder setDelegate:self queue:MEMORY[0x1E4F14428]];
    v5 = self->_cameraViewFinder;
    [(FigCameraViewfinder *)v5 startWithOptions:0];
  }
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  if (v4 && ![(NSHashTable *)self->_observers containsObject:v4])
  {
    observers = self->_observers;
    if (!observers)
    {
      id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v4];
    if ([(NSHashTable *)self->_observers count] == 1) {
      [(SBCameraViewfinderMonitor *)self _start];
    }
    v5 = [[SBCameraViewfinderMonitorToken alloc] initWithMonitor:self observer:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_removeObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;

    [(SBCameraViewfinderMonitor *)self _cancel];
  }
}

- (void)_cancel
{
  cameraViewFinder = self->_cameraViewFinder;
  if (cameraViewFinder)
  {
    [(FigCameraViewfinder *)cameraViewFinder stop];
    id v4 = self->_cameraViewFinder;
    self->_cameraViewFinder = 0;
  }
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E4F4F6A8];
  if (v7) {
    [v7 clientAuditToken];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  v10 = [v9 tokenFromAuditToken:v26];
  v11 = v10;
  if (v10)
  {
    if ([v10 hasSameProcessAsAuditToken:self->_activeSessionAuditToken])
    {
      activeSessionAuditToken = self->_activeSessionAuditToken;
      self->_activeSessionAuditToken = 0;

      v13 = SBLogCaptureViewfinderMonitor();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v11 bundleID];
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v14;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Camera Viewfinder Inactive for: %@", buf, 0xCu);
      }
    }
    id v21 = v6;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v15 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v20 cameraViewfinderMonitorSessionDidEnd:self auditToken:v11];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v17);
    }

    id v6 = v21;
  }
}

- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 cameraViewfinderMonitorSessionDidBeginMovieRecording:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 cameraViewfinderMonitorSessionDidEndMovieRecording:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (FigCameraViewfinder)cameraViewFinder
{
  return self->_cameraViewFinder;
}

- (void)setCameraViewFinder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraViewFinder, 0);
  objc_storeStrong((id *)&self->_activeSessionAuditToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end