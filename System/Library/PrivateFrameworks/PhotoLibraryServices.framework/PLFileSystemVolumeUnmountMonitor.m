@interface PLFileSystemVolumeUnmountMonitor
- (PLFileSystemVolumeUnmountMonitor)initWithVolumeURL:(id)a3;
- (id)description;
- (void)addVolumeUnmountObserver:(id)a3;
- (void)dealloc;
- (void)removeVolumeUnmountObserver:(id)a3;
@end

@implementation PLFileSystemVolumeUnmountMonitor

- (PLFileSystemVolumeUnmountMonitor)initWithVolumeURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLFileSystemVolumeUnmountMonitor;
  v5 = [(PLFileSystemVolumeUnmountMonitor *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    uint64_t v9 = [v4 copy];
    volumeURL = v6->_volumeURL;
    v6->_volumeURL = (NSURL *)v9;

    v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v6->_volumeURL;
      *(_DWORD *)buf = 134218242;
      v16 = v6;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Initialized Volume Unmount Monitor %p for %@", buf, 0x16u);
    }
  }
  return v6;
}

- (void)addVolumeUnmountObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

uint64_t __61__PLFileSystemVolumeUnmountMonitor_addVolumeUnmountObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeURL, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)removeVolumeUnmountObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

uint64_t __64__PLFileSystemVolumeUnmountMonitor_removeVolumeUnmountObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ %p %@", objc_opt_class(), self, self->_volumeURL];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PLFileSystemVolumeUnmountMonitor;
  [(PLFileSystemVolumeUnmountMonitor *)&v2 dealloc];
}

@end