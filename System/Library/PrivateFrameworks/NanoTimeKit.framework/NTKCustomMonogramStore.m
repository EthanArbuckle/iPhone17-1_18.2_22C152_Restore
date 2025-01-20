@interface NTKCustomMonogramStore
+ (id)sharedInstance;
- (NTKCustomMonogramStore)init;
- (id)_customMonogramFromPrefs;
- (void)_notifyClientsOfChange;
- (void)dealloc;
- (void)setCustomMonogram:(id)a3;
@end

@implementation NTKCustomMonogramStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_34);
  }
  v2 = (void *)sharedInstance_sInstance;

  return v2;
}

void __40__NTKCustomMonogramStore_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NTKCustomMonogramStore);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;
}

- (NTKCustomMonogramStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCustomMonogramStore;
  v2 = [(NTKCustomMonogramStore *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCustomMonogramStore_HandleStoreChanged, @"com.apple.NanoTimeKit.NTKNanoPrefsChanges", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKCustomMonogramStore_BroadcastChanges, @"NTKCustomMonogramChangedNotification", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NTKCustomMonogramStore;
  [(NTKCustomMonogramStore *)&v4 dealloc];
}

- (id)_customMonogramFromPrefs
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit"];
  id v3 = (id)[v2 synchronize];
  objc_super v4 = [v2 stringForKey:@"customMonogram"];

  return v4;
}

- (void)setCustomMonogram:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F79CD8];
  id v5 = a3;
  id v12 = (id)[[v4 alloc] initWithDomain:@"com.apple.NanoTimeKit"];
  [v12 setObject:v5 forKey:@"customMonogram"];

  id v6 = (id)[v12 synchronize];
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    v8 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    v9 = self->_npsManager;
    self->_npsManager = v8;

    npsManager = self->_npsManager;
  }
  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"customMonogram"];
  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.NanoTimeKit" keys:v10];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NTKCustomMonogramChangedNotification", 0, 0, 1u);
}

- (void)_notifyClientsOfChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NTKCustomMonogramChangedNotification" object:self];
}

- (void).cxx_destruct
{
}

@end