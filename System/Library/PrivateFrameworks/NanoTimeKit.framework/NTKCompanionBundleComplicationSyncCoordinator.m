@interface NTKCompanionBundleComplicationSyncCoordinator
+ (NTKCompanionBundleComplicationSyncCoordinator)sharedInstance;
- (BOOL)loaded;
- (NTKCompanionBundleComplicationSyncCoordinator)init;
- (id)descriptorsForBundleIdentifier:(id)a3;
- (void)_lock_updateLoaded;
- (void)activeDeviceChanged;
- (void)complicationCollectionDidLoad:(id)a3;
- (void)complicationCollectionDidReload:(id)a3;
- (void)dealloc;
@end

@implementation NTKCompanionBundleComplicationSyncCoordinator

- (void)activeDeviceChanged
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  complicationCollection = self->_complicationCollection;
  if (complicationCollection) {
    [(NTKComplicationCollection *)complicationCollection removeObserver:self];
  }
  v5 = [MEMORY[0x1E4F19A30] currentDevice];
  v6 = +[NTKCompanionComplicationCollectionManager sharedBundleComplicationCollectionForDevice:v5];
  v7 = self->_complicationCollection;
  self->_complicationCollection = v6;

  [(NTKComplicationCollection *)self->_complicationCollection addObserver:self];
  self->_loaded = 0;
  [(NTKCompanionBundleComplicationSyncCoordinator *)self _lock_updateLoaded];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updateLoaded
{
  BOOL loaded = self->_loaded;
  BOOL v4 = [(NTKComplicationCollection *)self->_complicationCollection hasLoaded];
  self->_BOOL loaded = v4;
  if (!loaded && v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__NTKCompanionBundleComplicationSyncCoordinator__lock_updateLoaded__block_invoke;
    block[3] = &unk_1E62BFF20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (BOOL)loaded
{
  return self->_loaded;
}

void __63__NTKCompanionBundleComplicationSyncCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v1;
}

- (NTKCompanionBundleComplicationSyncCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCompanionBundleComplicationSyncCoordinator;
  v2 = [(NTKCompanionBundleComplicationSyncCoordinator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_activeDeviceChanged name:*MEMORY[0x1E4F19620] object:0];

    [(NTKCompanionBundleComplicationSyncCoordinator *)v3 activeDeviceChanged];
  }
  return v3;
}

+ (NTKCompanionBundleComplicationSyncCoordinator)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NTKCompanionBundleComplicationSyncCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_20 != -1) {
    dispatch_once(&sharedInstance_onceToken_20, block);
  }
  v2 = (void *)sharedInstance_instance_2;
  return (NTKCompanionBundleComplicationSyncCoordinator *)v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19620] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKCompanionBundleComplicationSyncCoordinator;
  [(NTKCompanionBundleComplicationSyncCoordinator *)&v4 dealloc];
}

- (id)descriptorsForBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_super v6 = [(NTKComplicationCollection *)self->_complicationCollection complicationDescriptorsForClientIdentifier:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)complicationCollectionDidLoad:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NTKCompanionBundleComplicationSyncCoordinator *)self _lock_updateLoaded];
  os_unfair_lock_unlock(p_lock);
}

- (void)complicationCollectionDidReload:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NTKCompanionBundleComplicationSyncCoordinator *)self _lock_updateLoaded];
  os_unfair_lock_unlock(p_lock);
}

void __67__NTKCompanionBundleComplicationSyncCoordinator__lock_updateLoaded__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKCompanionBundleComplicationManagerDidLoadNotification" object:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end