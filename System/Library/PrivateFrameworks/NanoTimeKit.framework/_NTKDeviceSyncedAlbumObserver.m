@interface _NTKDeviceSyncedAlbumObserver
- (NRDevice)device;
- (NSString)syncedAlbumName;
- (_NTKDeviceSyncedAlbumObserver)initWithDevice:(id)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)addObserver:(id)a3;
- (void)collectionTargetLibraryDidUpdate:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation _NTKDeviceSyncedAlbumObserver

- (_NTKDeviceSyncedAlbumObserver)initWithDevice:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NTKDeviceSyncedAlbumObserver;
  v6 = [(_NTKDeviceSyncedAlbumObserver *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    syncedAlbumName = v7->_syncedAlbumName;
    v7->_syncedAlbumName = 0;
  }
  return v7;
}

- (void)dealloc
{
  [(NPTOCollectionTargetLibrary *)self->_library removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)_NTKDeviceSyncedAlbumObserver;
  [(_NTKDeviceSyncedAlbumObserver *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSHashTable *)self->_observers containsObject:v4])
  {
    [(NSHashTable *)self->_observers addObject:v4];
    [(_NTKDeviceSyncedAlbumObserver *)self _startObserving];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  [(_NTKDeviceSyncedAlbumObserver *)self _stopObserving];
  os_unfair_lock_unlock(p_lock);
}

- (void)_startObserving
{
  id v10 = [(NSHashTable *)self->_observers allObjects];
  if (![v10 count]) {
    goto LABEL_5;
  }
  library = self->_library;

  if (library) {
    return;
  }
  id v4 = (NPTOCollectionTargetLibrary *)[objc_alloc(MEMORY[0x1E4F79CC8]) initWithCollectionTarget:1 device:self->_device];
  id v5 = self->_library;
  self->_library = v4;

  [(NPTOCollectionTargetLibrary *)self->_library addObserver:self];
  v6 = [(NPTOCollectionTargetLibrary *)self->_library assetCollections];
  id v10 = [v6 anyObject];

  v7 = v10;
  if (v10)
  {
    _NTKTrueAlbumNameForAssetCollection(v10);
    uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    syncedAlbumName = self->_syncedAlbumName;
    self->_syncedAlbumName = v8;

LABEL_5:
    v7 = v10;
  }
}

- (void)_stopObserving
{
  objc_super v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(NPTOCollectionTargetLibrary *)self->_library removeObserver:self];
    library = self->_library;
    self->_library = 0;

    syncedAlbumName = self->_syncedAlbumName;
    self->_syncedAlbumName = 0;
  }
}

- (void)collectionTargetLibraryDidUpdate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NPTOCollectionTargetLibrary *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_library == v4)
  {
    v6 = [(NPTOCollectionTargetLibrary *)v4 assetCollections];
    v7 = [v6 anyObject];

    syncedAlbumName = self->_syncedAlbumName;
    self->_syncedAlbumName = 0;

    if (v7)
    {
      _NTKTrueAlbumNameForAssetCollection(v7);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v10 = self->_syncedAlbumName;
      self->_syncedAlbumName = v9;
    }
    v11 = (void *)MEMORY[0x1E4F1C978];
    objc_super v12 = [(NSHashTable *)self->_observers allObjects];
    v13 = [v11 arrayWithArray:v12];

    os_unfair_lock_unlock(p_lock);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "photoAlbumChanged", (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)syncedAlbumName
{
  return self->_syncedAlbumName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_syncedAlbumName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end