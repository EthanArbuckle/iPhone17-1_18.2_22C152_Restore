@interface PLThumbnailCascadingDownscaleContext
- (BOOL)downscaleImageSurface:(__IOSurface *)a3 destinationCount:(int)a4 sizes:(id *)a5 cropModes:(int *)a6 pixelFormat:(unsigned int)a7 bytesPerRowAlignment:(int)a8 destinationData:(id)a9;
- (PLThumbnailCascadingDownscaleContext)init;
- (void)dealloc;
- (void)discardContexts;
@end

@implementation PLThumbnailCascadingDownscaleContext

- (PLThumbnailCascadingDownscaleContext)init
{
  v15.receiver = self;
  v15.super_class = (Class)PLThumbnailCascadingDownscaleContext;
  v2 = [(PLThumbnailCascadingDownscaleContext *)&v15 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;

    objc_initWeak(&location, v2);
    v5 = [PLThumbnailContextCleanupTimer alloc];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __44__PLThumbnailCascadingDownscaleContext_init__block_invoke;
    v12 = &unk_1E5875F08;
    objc_copyWeak(&v13, &location);
    uint64_t v6 = [(PLThumbnailContextCleanupTimer *)v5 initWithHandler:&v9];
    idleCleanupTimer = v2->_idleCleanupTimer;
    v2->_idleCleanupTimer = (PLThumbnailContextCleanupTimer *)v6;

    [(PLThumbnailContextCleanupTimer *)v2->_idleCleanupTimer activate];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleCleanupTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (BOOL)downscaleImageSurface:(__IOSurface *)a3 destinationCount:(int)a4 sizes:(id *)a5 cropModes:(int *)a6 pixelFormat:(unsigned int)a7 bytesPerRowAlignment:(int)a8 destinationData:(id)a9
{
  uint64_t v13 = *(void *)&a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v16 = a9;
  if (a3)
  {
    int v37 = a8;
    v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v46 = v13;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Downscale context: downscaleImageSurface with destinationCount: %d", buf, 8u);
    }

    [(PLThumbnailContextCleanupTimer *)self->_idleCleanupTimer startOrRestartTimer];
    IOSurfaceGetWidth(a3);
    IOSurfaceGetHeight(a3);
    v33[1] = (unint64_t)PLSizeMake() >> 32;
    [(NSLock *)self->_lock lock];
    if (!self->_portraitContext)
    {
      v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Downscale context: Creating CMPhotoCascadeContexts", buf, 2u);
      }

      IOSurfaceGetPixelFormat(a3);
      self->_portraitContext = (_CMPhotoCascadeContext *)CMPhotoCascadingDownscaleCreate();
      IOSurfaceGetPixelFormat(a3);
      self->_landscapeContext = (_CMPhotoCascadeContext *)CMPhotoCascadingDownscaleCreate();
    }
    unsigned int v34 = a7;
    v35 = a5;
    v38 = a6;
    [(NSLock *)self->_lock unlock];
    v33[0] = v33;
    uint64_t v36 = v13;
    unint64_t v19 = 8 * v13;
    v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFF0);
    if (v19 >= 0x200) {
      size_t v21 = 512;
    }
    else {
      size_t v21 = 8 * v13;
    }
    bzero((char *)v33 - ((v19 + 15) & 0xFFFFFFFF0), v21);
    long long v43 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    long long v40 = 0u;
    id v39 = v16;
    id v22 = v16;
    uint64_t v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16, v33[0]);
    if (v23)
    {
      uint64_t v24 = v23;
      int v25 = 0;
      uint64_t v26 = *(void *)v41;
      do
      {
        uint64_t v27 = 0;
        int v28 = v25;
        v29 = &v20[8 * v25];
        do
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v22);
          }
          *(void *)&v29[8 * v27] = [*(id *)(*((void *)&v40 + 1) + 8 * v27) mutableBytes];
          ++v27;
        }
        while (v24 != v27);
        int v25 = v28 + v27;
        uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v24);
    }

    [(NSLock *)self->_lock lock];
    int v30 = CMPhotoCascadingDownscale();
    [(NSLock *)self->_lock unlock];
    BOOL v31 = v30 == 0;
    id v16 = v39;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (void)discardContexts
{
  v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Downscale context: Destroying CMPhotoCascadeContexts", v4, 2u);
  }

  [(NSLock *)self->_lock lock];
  if (self->_portraitContext)
  {
    CMPhotoCascadingDownscaleDestroy();
    self->_portraitContext = 0;
  }
  if (self->_landscapeContext)
  {
    CMPhotoCascadingDownscaleDestroy();
    self->_landscapeContext = 0;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)dealloc
{
  [(PLThumbnailContextCleanupTimer *)self->_idleCleanupTimer invalidate];
  if (self->_portraitContext) {
    CMPhotoCascadingDownscaleDestroy();
  }
  if (self->_landscapeContext) {
    CMPhotoCascadingDownscaleDestroy();
  }
  lock = self->_lock;
  self->_lock = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLThumbnailCascadingDownscaleContext;
  [(PLThumbnailCascadingDownscaleContext *)&v4 dealloc];
}

void __44__PLThumbnailCascadingDownscaleContext_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupTimerFired];
}

@end