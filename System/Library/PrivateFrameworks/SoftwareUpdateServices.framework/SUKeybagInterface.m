@interface SUKeybagInterface
+ (id)sharedInstance;
- (BOOL)_queue_hasPasscodeSetFromLockState:(int)a3;
- (BOOL)_queue_isPasscodeLockedFromLockState:(int)a3;
- (BOOL)createInstallationKeybagForDescriptor:(id)a3 withLASecret:(id)a4 forUnattendedInstall:(BOOL)a5;
- (BOOL)createInstallationKeybagForDescriptor:(id)a3 withSecret:(id)a4 forUnattendedInstall:(BOOL)a5;
- (BOOL)disableKeybagStash;
- (BOOL)hadFirstUnlock;
- (BOOL)hasPasscodeSet;
- (BOOL)isPasscodeLocked;
- (BOOL)persistKeybagStash;
- (SUKeybagInterface)init;
- (id)_init;
- (id)createPreventLockAssertionWithDuration:(double)a3;
- (id)stringForStashMode:(int)a3;
- (int)_queue_fetchKeybagState;
- (int)installationKeybagStateForDescriptor:(id)a3;
- (void)_queue_passcodeChanged;
- (void)_queue_refreshState;
- (void)_queue_setHasPasscodeSet:(BOOL)a3;
- (void)_queue_setIsPasscodeLocked:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SUKeybagInterface

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance___instance_5;
  if (!sharedInstance___instance_5)
  {
    id v3 = [[SUKeybagInterface alloc] _init];
    v4 = (void *)sharedInstance___instance_5;
    sharedInstance___instance_5 = (uint64_t)v3;

    v2 = (void *)sharedInstance___instance_5;
  }
  return v2;
}

- (SUKeybagInterface)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SUKeybagInterface.m" lineNumber:102 description:@"Please use the sharedInstance."];

  return 0;
}

- (id)_init
{
  v21.receiver = self;
  v21.super_class = (Class)SUKeybagInterface;
  id v2 = [(SUKeybagInterface *)&v21 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.softwareupdateservices.keybag", 0);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.softwareupdateservices.keybag.observerCallout", 0);
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    *((_WORD *)v2 + 12) = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__10;
    v19[4] = __Block_byref_object_dispose__10;
    v9 = (int *)v2;
    v20 = v9;
    v9[10] = -1;
    v10 = *((void *)v2 + 1);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __26__SUKeybagInterface__init__block_invoke;
    handler[3] = &unk_26447D700;
    handler[4] = v19;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v9 + 10, v10, handler);
    v9[11] = -1;
    v11 = (const char *)[(id)*MEMORY[0x263F53B08] cStringUsingEncoding:4];
    v12 = *((void *)v2 + 1);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __26__SUKeybagInterface__init__block_invoke_2;
    v17[3] = &unk_26447D700;
    v17[4] = v19;
    notify_register_dispatch(v11, v9 + 11, v12, v17);
    v13 = *((void *)v2 + 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__SUKeybagInterface__init__block_invoke_3;
    block[3] = &unk_26447C878;
    v16 = v9;
    dispatch_sync(v13, block);

    _Block_object_dispose(v19, 8);
  }
  return v2;
}

uint64_t __26__SUKeybagInterface__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_queue_refreshState");
}

uint64_t __26__SUKeybagInterface__init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_queue_passcodeChanged");
}

uint64_t __26__SUKeybagInterface__init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshState");
}

- (BOOL)hasPasscodeSet
{
  BSDispatchQueueAssertNot();
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SUKeybagInterface_hasPasscodeSet__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __35__SUKeybagInterface_hasPasscodeSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (BOOL)isPasscodeLocked
{
  BSDispatchQueueAssertNot();
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SUKeybagInterface_isPasscodeLocked__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __37__SUKeybagInterface_isPasscodeLocked__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 25);
  return result;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SUKeybagInterface.m", 156, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUKeybagInterface_addObserver___block_invoke;
  block[3] = &unk_26447C8C8;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __33__SUKeybagInterface_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SUKeybagInterface.m", 165, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SUKeybagInterface_removeObserver___block_invoke;
  block[3] = &unk_26447C8C8;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __36__SUKeybagInterface_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)hadFirstUnlock
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

- (int)installationKeybagStateForDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = +[SUPreferences sharedInstance];
  uint64_t v6 = [v5 keybagState];

  if (!v6)
  {
    if (![(SUKeybagInterface *)self hasPasscodeSet])
    {
      v26 = @"No passcode set, keybag is not required";
      goto LABEL_10;
    }
    if ([v4 isSplatOnly])
    {
      v26 = @"Splat update does not require installation keybag";
LABEL_10:
      SULogInfo(v26, v19, v20, v21, v22, v23, v24, v25, v49);
      unsigned int v18 = 0;
      goto LABEL_37;
    }
    v27 = (void *)MKBKeyBagKeyStashVerify();
    v28 = v27;
    if (!v27) {
      goto LABEL_27;
    }
    v29 = [v27 objectForKey:@"StashBagValidOnDisk"];
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v30 = [v29 intValue];
    }
    else {
      int v30 = 2;
    }
    v31 = [v28 objectForKey:@"StashStagedManifest"];
    SULogInfo(@"manifestValue from stashVerify: %@", v32, v33, v34, v35, v36, v37, v38, (uint64_t)v31);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v39 = [v31 BOOLValue];
    }
    else {
      int v39 = 0;
    }

    if (!v30)
    {
      if (v39) {
        v47 = @"keybag is valid in memory";
      }
      else {
        v47 = @"keybag is in memory, but staged manifest does not exist";
      }
      if (v39) {
        unsigned int v18 = 2;
      }
      else {
        unsigned int v18 = 1;
      }
      goto LABEL_36;
    }
    if (v30 == 1)
    {
      if (v39) {
        v47 = @"keybag is valid and committed";
      }
      else {
        v47 = @"keybag is valid on disk, but staged manifest does not exist";
      }
      if (v39) {
        unsigned int v18 = 3;
      }
      else {
        unsigned int v18 = 1;
      }
    }
    else
    {
LABEL_27:
      unsigned int v18 = [(SUKeybagInterface *)self hasPasscodeSet];
      if (v18) {
        v47 = @"keybag is required";
      }
      else {
        v47 = @"keybag is not required";
      }
    }
LABEL_36:
    SULogInfo(v47, v40, v41, v42, v43, v44, v45, v46, v49);

    goto LABEL_37;
  }
  id v7 = +[SUPreferences sharedInstance];
  uint64_t v8 = [v7 keybagState];
  int v9 = [v8 intValue];

  if (v9 >= 3) {
    int v17 = 3;
  }
  else {
    int v17 = v9;
  }
  unsigned int v18 = v17 & ~(v17 >> 31);
  SULogInfo(@"Override keybag state with %d", v10, v11, v12, v13, v14, v15, v16, v18);
LABEL_37:

  return v18;
}

- (BOOL)createInstallationKeybagForDescriptor:(id)a3 withSecret:(id)a4 forUnattendedInstall:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    uint64_t v40 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v41 = @"secret";
    [v40 handleFailureInMethod:a2 object:self file:@"SUKeybagInterface.m" lineNumber:253 description:@"Invalid parameter not satisfying: %@"];
  }
  uint64_t v11 = +[SUManifestBuilder manifestFromDescriptor:v9];
  uint64_t v19 = [v10 dataUsingEncoding:4];
  if (!v11)
  {
    SULogInfo(@"createInstallationKeybag - Unable to create stashbag because manifest was required but no manifest was provided.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v41);
    goto LABEL_10;
  }
  BOOL v20 = !v5;
  BOOL v21 = 1;
  if (v20) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2;
  }
  uint64_t v23 = [v9 productBuildVersion];
  uint64_t v42 = [(SUKeybagInterface *)self stringForStashMode:v22];
  SULogInfo(@"createInstallationKeybag - Creating stashbag. descriptor productBuildVersion: %@; stashMode: %@; manifest: %@",
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    (uint64_t)v23);

  uint64_t v31 = MKBKeyBagKeyStashCreateWithManifest();
  if (v31)
  {
    SULogInfo(@"createInstallationKeybag - Failed to create installation keybag stash from secret: %d", v32, v33, v34, v35, v36, v37, v38, v31);
LABEL_10:
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)createInstallationKeybagForDescriptor:(id)a3 withLASecret:(id)a4 forUnattendedInstall:(BOOL)a5
{
  BOOL v5 = a5;
  v44[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    uint64_t v40 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v41 = @"secret";
    [v40 handleFailureInMethod:a2 object:self file:@"SUKeybagInterface.m" lineNumber:279 description:@"Invalid parameter not satisfying: %@"];
  }
  uint64_t v18 = +[SUManifestBuilder manifestFromDescriptor:v9];
  if (v18)
  {
    if (v5) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
    BOOL v20 = [v9 productBuildVersion];
    uint64_t v42 = [(SUKeybagInterface *)self stringForStashMode:v19];
    SULogInfo(@"createInstallationKeybag - Creating stashbag with LAContext secret. descriptor productBuildVersion: %@; stashMode: %@; manifest: %@",
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v20);

    uint64_t v43 = @"Manifest";
    v44[0] = v18;
    uint64_t v28 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v29 = [v10 externalizedContext];
    uint64_t v30 = MKBKeyBagKeyStashCreateWithOpts();

    BOOL v38 = v30 == 0;
    if (v30) {
      SULogInfo(@"createInstallationKeybag - Failed to create installation keybag stash from secret: %d", v31, v32, v33, v34, v35, v36, v37, v30);
    }
  }
  else
  {
    SULogInfo(@"createInstallationKeybag - Unable to create stashbag because manifest was required but no manifest was provided.", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v41);
    BOOL v38 = 0;
  }

  return v38;
}

- (BOOL)persistKeybagStash
{
  return MKBKeyBagKeyStashPersist() == 0;
}

- (BOOL)disableKeybagStash
{
  return MKBKeyBagKeyStashCreateWithMode() == 0;
}

- (id)createPreventLockAssertionWithDuration:(double)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  v18[0] = @"MKBAssertionKey";
  v18[1] = @"MKBAssertionTimeout";
  v19[0] = @"RemoteProfile";
  id v4 = [NSNumber numberWithLongLong:(uint64_t)a3];
  v19[1] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  uint64_t v6 = MKBDeviceLockAssertion();
  if (v6
    && (uint64_t v14 = (const void *)v6,
        uint64_t v15 = [[SUKeybagPreventLockAssertion alloc] initWithKeybagAssertion:v6], CFRelease(v14), v15))
  {
    SULogInfo(@"Applying prevent lock assertion for duration: %f", v7, v8, v9, v10, v11, v12, v13, *(uint64_t *)&a3);
  }
  else
  {
    SULogInfo(@"Failed to create prevent lock assertion", v7, v8, v9, v10, v11, v12, v13, v17);
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)stringForStashMode:(int)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown stash mode (%d)", *(void *)&a3);
  BOOL v5 = v4;
  if (a3 >= 4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = off_26447DAF8[a3];
  }

  return v6;
}

- (void)_queue_refreshState
{
  BSDispatchQueueAssert();
  uint64_t v3 = [(SUKeybagInterface *)self _queue_fetchKeybagState];
  [(SUKeybagInterface *)self _queue_setHasPasscodeSet:[(SUKeybagInterface *)self _queue_hasPasscodeSetFromLockState:v3]];
  BOOL v4 = [(SUKeybagInterface *)self _queue_isPasscodeLockedFromLockState:v3];
  [(SUKeybagInterface *)self _queue_setIsPasscodeLocked:v4];
}

- (void)_queue_passcodeChanged
{
  BSDispatchQueueAssert();
  SULogInfo(@"SUKeybagInterface got passcode changed event", v3, v4, v5, v6, v7, v8, v9, v13[0]);
  [(SUKeybagInterface *)self _queue_refreshState];
  uint64_t v10 = [(NSHashTable *)self->_queue_observers allObjects];
  observerCalloutQueue = self->_observerCalloutQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = (uint64_t)__43__SUKeybagInterface__queue_passcodeChanged__block_invoke;
  v13[3] = (uint64_t)&unk_26447C8C8;
  id v14 = v10;
  uint64_t v15 = self;
  id v12 = v10;
  dispatch_async(observerCalloutQueue, v13);
}

void __43__SUKeybagInterface__queue_passcodeChanged__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "keybagInterfacePasscodeDidChange:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (int)_queue_fetchKeybagState
{
  v4[2] = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  v3[0] = *MEMORY[0x263F55A68];
  v3[1] = @"ExtendedDeviceLockState";
  v4[0] = &unk_26CEBD048;
  v4[1] = MEMORY[0x263EFFA88];
  [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return MKBGetDeviceLockState();
}

- (BOOL)_queue_isPasscodeLockedFromLockState:(int)a3
{
  return (a3 < 7) & (0x46u >> a3);
}

- (BOOL)_queue_hasPasscodeSetFromLockState:(int)a3
{
  return a3 != 3;
}

- (void)_queue_setHasPasscodeSet:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_hasPasscodeSet != v3)
  {
    self->_queue_hasPasscodeSet = v3;
    uint64_t v5 = [(NSHashTable *)self->_queue_observers allObjects];
    observerCalloutQueue = self->_observerCalloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__SUKeybagInterface__queue_setHasPasscodeSet___block_invoke;
    block[3] = &unk_26447CED8;
    id v9 = v5;
    long long v10 = self;
    BOOL v11 = v3;
    id v7 = v5;
    dispatch_async(observerCalloutQueue, block);
  }
}

void __46__SUKeybagInterface__queue_setHasPasscodeSet___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "keybagInterface:hasPasscodeSetDidChange:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_queue_setIsPasscodeLocked:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_isPasscodeLocked != v3)
  {
    self->_queue_isPasscodeLocked = v3;
    uint64_t v5 = [(NSHashTable *)self->_queue_observers allObjects];
    observerCalloutQueue = self->_observerCalloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SUKeybagInterface__queue_setIsPasscodeLocked___block_invoke;
    block[3] = &unk_26447CED8;
    id v9 = v5;
    long long v10 = self;
    BOOL v11 = v3;
    id v7 = v5;
    dispatch_async(observerCalloutQueue, block);
  }
}

void __48__SUKeybagInterface__queue_setIsPasscodeLocked___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "keybagInterface:passcodeLockedStateDidChange:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end