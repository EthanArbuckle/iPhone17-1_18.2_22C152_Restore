@interface NTKCompanionFaceCollectionsManager
+ (id)sharedInstance;
- (NTKCompanionFaceCollectionsManager)init;
- (id)sharedFaceCollectionForDevice:(id)a3 forCollectionIdentifier:(id)a4;
- (id)sharedLibraryFaceCollectionsForAllDevices;
- (void)_handlePairedDeviceDidChangeVersionNotification;
- (void)dealloc;
@end

@implementation NTKCompanionFaceCollectionsManager

- (id)sharedFaceCollectionForDevice:(id)a3 forCollectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = [v6 nrDeviceUUID];
  if (([v8 isEqual:self->_lock_activeDeviceUUID] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lock_activeDeviceUUID, v8);
    [(NSMutableDictionary *)self->_lock_faceCollectionsForCollectionIdentifier removeAllObjects];
  }
  v9 = [v6 nrDevice];
  if (v8 && ([MEMORY[0x1E4F19A30] NRDeviceIsRunningDaytonaOrLater:v9] & 1) != 0)
  {
  }
  else
  {
    char v10 = [v7 isEqualToString:@"LibraryFaces"];

    if (v10)
    {
      v11 = 0;
      goto LABEL_10;
    }
  }
  v11 = [(NSMutableDictionary *)self->_lock_faceCollectionsForCollectionIdentifier objectForKeyedSubscript:v7];
  if (!v11)
  {
    v11 = [[NTKPersistentFaceCollection alloc] initWithCollectionIdentifier:v7 deviceUUID:self->_lock_activeDeviceUUID];
    [(NSMutableDictionary *)self->_lock_faceCollectionsForCollectionIdentifier setObject:v11 forKeyedSubscript:v7];
  }
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);

  return v11;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_26 != -1) {
    dispatch_once(&sharedInstance_onceToken_26, &__block_literal_global_170);
  }
  v2 = (void *)sharedInstance_singleton_0;

  return v2;
}

void __52__NTKCompanionFaceCollectionsManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_singleton_0;
  sharedInstance_singleton_0 = v0;
}

- (NTKCompanionFaceCollectionsManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)NTKCompanionFaceCollectionsManager;
  v2 = [(NTKCompanionFaceCollectionsManager *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    lock_activeDeviceUUID = v2->_lock_activeDeviceUUID;
    v2->_lock_activeDeviceUUID = 0;

    uint64_t v5 = objc_opt_new();
    lock_faceCollectionsForCollectionIdentifier = v3->_lock_faceCollectionsForCollectionIdentifier;
    v3->_lock_faceCollectionsForCollectionIdentifier = (NSMutableDictionary *)v5;

    objc_initWeak(&location, v3);
    id v7 = (const char *)[(id)*MEMORY[0x1E4F79ED8] UTF8String];
    v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__NTKCompanionFaceCollectionsManager_init__block_invoke;
    v11[3] = &unk_1E62C0DD0;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch(v7, &v3->_pairedDeviceVersionChangeNotificationToken, v8, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __42__NTKCompanionFaceCollectionsManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePairedDeviceDidChangeVersionNotification];
}

- (void)dealloc
{
  notify_cancel(self->_pairedDeviceVersionChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NTKCompanionFaceCollectionsManager;
  [(NTKCompanionFaceCollectionsManager *)&v3 dealloc];
}

- (void)_handlePairedDeviceDidChangeVersionNotification
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_activeDeviceUUID = self->_lock_activeDeviceUUID;
  self->_lock_activeDeviceUUID = 0;

  os_unfair_lock_unlock(p_lock);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"com.apple.nanotimekit.CompanionFaceCollectionsDidChangeNotification" object:0];
}

- (id)sharedLibraryFaceCollectionsForAllDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v13 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v2 = [v13 getPairedDevices];
  objc_super v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v10 = [MEMORY[0x1E4F19A30] CLKDeviceUUIDForNRDevice:v9];
        if (v10 && [MEMORY[0x1E4F19A30] NRDeviceIsRunningDaytonaOrLater:v9])
        {
          v11 = [[NTKPersistentFaceCollection alloc] initWithCollectionIdentifier:@"LibraryFaces" deviceUUID:v10];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_faceCollectionsForCollectionIdentifier, 0);

  objc_storeStrong((id *)&self->_lock_activeDeviceUUID, 0);
}

@end