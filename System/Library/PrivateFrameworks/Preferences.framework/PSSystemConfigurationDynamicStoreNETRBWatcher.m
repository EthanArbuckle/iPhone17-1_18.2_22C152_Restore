@interface PSSystemConfigurationDynamicStoreNETRBWatcher
+ (id)sharedManager;
- (BOOL)isDataEnabled;
- (BOOL)isTetheringEnabled;
- (BOOL)shouldShowTethering;
- (PSSystemConfigurationDynamicStoreNETRBWatcher)init;
- (void)dealloc;
- (void)getNETRBState:(int *)a3 andReason:(int *)a4;
- (void)readNETRBState:(int *)a3 andReason:(int *)a4;
- (void)sendStateUpdate;
@end

@implementation PSSystemConfigurationDynamicStoreNETRBWatcher

- (BOOL)isDataEnabled
{
  int v4 = 0;
  int v3 = 0;
  [(PSSystemConfigurationDynamicStoreNETRBWatcher *)self readNETRBState:&v4 andReason:&v3];
  return v3 != 4;
}

- (BOOL)shouldShowTethering
{
  unsigned int v4 = 0;
  int v3 = 0;
  [(PSSystemConfigurationDynamicStoreNETRBWatcher *)self readNETRBState:&v4 andReason:&v3];
  return v4 > 0x3FD;
}

- (BOOL)isTetheringEnabled
{
  int v4 = 0;
  int v3 = 0;
  [(PSSystemConfigurationDynamicStoreNETRBWatcher *)self readNETRBState:&v4 andReason:&v3];
  return v4 == 1023;
}

- (void)readNETRBState:(int *)a3 andReason:(int *)a4
{
  int netrbState = self->_netrbState;
  int netrbReason = self->_netrbReason;
  v8 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, @"com.apple.MobileInternetSharing");
  id v11 = v8;
  if (v8)
  {
    v9 = [v8 objectForKey:@"State"];
    int netrbState = [v9 intValue];

    v10 = [v11 objectForKey:@"Reason"];
    int netrbReason = [v10 intValue];
  }
  if (a3) {
    *a3 = netrbState;
  }
  if (a4) {
    *a4 = netrbReason;
  }
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PSSystemConfigurationDynamicStoreNETRBWatcher_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_cacheOnce != -1) {
    dispatch_once(&sharedManager_cacheOnce, block);
  }
  v2 = (void *)sharedManager_gSharedNETRBWatcherInstance;
  return v2;
}

uint64_t __62__PSSystemConfigurationDynamicStoreNETRBWatcher_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_gSharedNETRBWatcherInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (PSSystemConfigurationDynamicStoreNETRBWatcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSSystemConfigurationDynamicStoreNETRBWatcher;
  v2 = [(PSSystemConfigurationDynamicStoreNETRBWatcher *)&v8 init];
  int v3 = v2;
  if (v2)
  {
    *(void *)&v2->_int netrbState = 1020;
    v7.version = 0;
    memset(&v7.retain, 0, 24);
    v7.info = v2;
    SCDynamicStoreRef v4 = SCDynamicStoreCreate(0, @"com.apple.preferences.NETRBManager", (SCDynamicStoreCallBack)__SCDynamicStoreCallback, &v7);
    v3->_scDynamicStore = v4;
    if (v4)
    {
      SCDynamicStoreAddWatchedKey();
      v3->_scRunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v3->_scDynamicStore, 0);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v3->_scRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    }
  }
  return v3;
}

- (void)dealloc
{
  if (self->_scRunLoopSource)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_scRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_scRunLoopSource);
  }
  scDynamicStore = self->_scDynamicStore;
  if (scDynamicStore) {
    CFRelease(scDynamicStore);
  }
  v5.receiver = self;
  v5.super_class = (Class)PSSystemConfigurationDynamicStoreNETRBWatcher;
  [(PSSystemConfigurationDynamicStoreNETRBWatcher *)&v5 dealloc];
}

- (void)getNETRBState:(int *)a3 andReason:(int *)a4
{
  p_int netrbState = &self->_netrbState;
  p_int netrbReason = &self->_netrbReason;
  [(PSSystemConfigurationDynamicStoreNETRBWatcher *)self readNETRBState:&self->_netrbState andReason:&self->_netrbReason];
  if (a3) {
    *a3 = *p_netrbState;
  }
  if (a4) {
    *a4 = *p_netrbReason;
  }
}

- (void)sendStateUpdate
{
  uint64_t v14 = 0;
  [(PSSystemConfigurationDynamicStoreNETRBWatcher *)self readNETRBState:(char *)&v14 + 4 andReason:&v14];
  uint64_t netrbState = self->_netrbState;
  if (HIDWORD(v14) != netrbState)
  {
    uint64_t netrbReason = self->_netrbReason;
    uint64_t v4 = v14;
    goto LABEL_5;
  }
  uint64_t v4 = v14;
  uint64_t netrbReason = self->_netrbReason;
  if (v14 != netrbReason)
  {
LABEL_5:
    NSLog(&cfstr_SNetrbStateCha.isa, "-[PSSystemConfigurationDynamicStoreNETRBWatcher sendStateUpdate]", netrbState, HIDWORD(v14), netrbReason, v4);
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    SCDynamicStoreContext v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:HIDWORD(v14)];
    objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v14];
    v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_netrbState];
    v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_netrbReason];
    id v11 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"State", v8, @"Reason", v9, @"PreviousState", v10, @"PreviousReason", 0);

    int v12 = v14;
    self->_uint64_t netrbState = HIDWORD(v14);
    self->_uint64_t netrbReason = v12;
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"com.apple.Preferences.NETRB" object:0 userInfo:v11];
  }
}

@end