@interface NTKSyncedAlbumObserver
+ (id)sharedInstance;
- (NTKSyncedAlbumObserver)init;
- (id)syncedAlbumNameForDevice:(id)a3;
- (void)addObserver:(id)a3 forDevice:(id)a4;
- (void)removeObserver:(id)a3 forDevice:(id)a4;
@end

@implementation NTKSyncedAlbumObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_16 != -1) {
    dispatch_once(&sharedInstance_onceToken_16, &__block_literal_global_116);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

void __40__NTKSyncedAlbumObserver_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v0;
}

- (NTKSyncedAlbumObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSyncedAlbumObserver;
  v2 = [(NTKSyncedAlbumObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deviceAlbumObservers = v2->_deviceAlbumObservers;
    v2->_deviceAlbumObservers = (NSMutableDictionary *)v3;

    v2->_observersLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)addObserver:(id)a3 forDevice:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [v6 nrDeviceUUID];
  if (v7)
  {
    os_unfair_lock_lock(&self->_observersLock);
    v8 = [(NSMutableDictionary *)self->_deviceAlbumObservers objectForKey:v7];
    if (!v8)
    {
      v9 = [_NTKDeviceSyncedAlbumObserver alloc];
      v10 = [v6 nrDevice];
      v8 = [(_NTKDeviceSyncedAlbumObserver *)v9 initWithDevice:v10];

      [(NSMutableDictionary *)self->_deviceAlbumObservers setObject:v8 forKey:v7];
    }
    os_unfair_lock_unlock(&self->_observersLock);
    [(_NTKDeviceSyncedAlbumObserver *)v8 addObserver:v11];
  }
}

- (void)removeObserver:(id)a3 forDevice:(id)a4
{
  id v9 = a3;
  id v6 = [a4 nrDeviceUUID];
  if (v6)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    v8 = [(NSMutableDictionary *)self->_deviceAlbumObservers objectForKey:v6];
    os_unfair_lock_unlock(p_observersLock);
    [v8 removeObserver:v9];
  }
}

- (id)syncedAlbumNameForDevice:(id)a3
{
  v4 = [a3 nrDeviceUUID];
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    v5 = [(NSMutableDictionary *)self->_deviceAlbumObservers objectForKey:v4];
    os_unfair_lock_unlock(&self->_observersLock);
    if (v5)
    {
      id v6 = [v5 syncedAlbumName];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = &stru_1F1635E90;
  }
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
}

@end