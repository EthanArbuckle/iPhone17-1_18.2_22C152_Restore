@interface SKManager
+ (BOOL)isMountPointWithPath:(id)a3;
+ (id)BSDNameFromString:(id)a3;
+ (id)defaultVisibleRoles;
+ (id)sharedManager;
+ (id)sharedManagerWithBindingsSafety:(BOOL)a3;
+ (id)syncSharedManager;
- (BOOL)isBusy;
- (NSSet)visibleRoles;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)frameworkAsyncOperationsQueue;
- (SKManager)initWithBindingSafety:(BOOL)a3;
- (id)_diskForPath:(id)a3;
- (id)_diskForString:(id)a3;
- (id)allDisks;
- (id)allDisksSet;
- (id)childDisksForWholeDisk:(id)a3;
- (id)contentDiskWithDisk:(id)a3;
- (id)diskForBSDname:(id)a3;
- (id)diskForPath:(id)a3;
- (id)diskForString:(id)a3;
- (id)diskForUUID:(id)a3;
- (id)diskForVolumeName:(id)a3;
- (id)filesystemWithSKType:(id)a3 isCaseSensitive:(BOOL)a4 isEncrypted:(BOOL)a5;
- (id)filesystems;
- (id)formatableFileSystems;
- (id)knownDiskForDictionary:(id)a3;
- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4;
- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5;
- (id)knownDisksForDictionaries:(id)a3;
- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4;
- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5;
- (id)newDiskWithDictionary:(id)a3;
- (id)physicalStoresForAPFSVolume:(id)a3;
- (id)visibleDisks;
- (id)volumesForAPFSPS:(id)a3;
- (id)wholeDiskForDisk:(id)a3;
- (void)_disksAppeared:(id)a3 toListener:(id)a4;
- (void)_initialPopulateCompleteForListener:(id)a3;
- (void)addListener:(id)a3;
- (void)disksAppeared:(id)a3;
- (void)disksChanged:(id)a3;
- (void)disksDisappeared:(id)a3;
- (void)initialPopulateComplete;
- (void)knownDiskForDictionary:(id)a3 notify:(id)a4 onQueue:(id)a5;
- (void)managerResumed;
- (void)managerStalled;
- (void)removeListener:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setFrameworkAsyncOperationsQueue:(id)a3;
- (void)setVisibleRoles:(id)a3;
- (void)syncAllDisks;
@end

@implementation SKManager

+ (id)sharedManagerWithBindingsSafety:(BOOL)a3
{
  if (a3) {
    +[SKManager sharedManagerWithBindingsSafety:]();
  }

  return +[SKManager sharedManager];
}

+ (id)sharedManager
{
  if (NSClassFromString(&cfstr_Skdaemonmanage.isa))
  {
    v2 = +[SKBaseManager sharedManager];
    [v2 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_0];

    v3 = SKGetOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23F40C000, v3, OS_LOG_TYPE_FAULT, "Client sharedManager has been called from the daemon.", v6, 2u);
    }
  }
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_30);
  }
  v4 = (void *)sSharedManager;

  return v4;
}

id __26__SKManager_sharedManager__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKManager.m", 59);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __26__SKManager_sharedManager__block_invoke_27()
{
  sSharedManager = [[SKManager alloc] initWithBindingSafety:0];

  return MEMORY[0x270F9A758]();
}

- (SKManager)initWithBindingSafety:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SKManager;
  v4 = [(SKBaseManager *)&v21 init];
  v5 = v4;
  if (v4)
  {
    v4->_shouldBeBindingsSafe = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:10];
    allDisks = v5->allDisks;
    v5->allDisks = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
    listenersAppearedDisks = v5->_listenersAppearedDisks;
    v5->_listenersAppearedDisks = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v10;

    uint64_t v12 = objc_opt_new();
    waitingForDiskSet = v5->_waitingForDiskSet;
    v5->_waitingForDiskSet = (NSMutableSet *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SKManager.waitingForDisk", 0);
    waitingForDiskQueue = v5->_waitingForDiskQueue;
    v5->_waitingForDiskQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = +[SKManager defaultVisibleRoles];
    visibleRoles = v5->_visibleRoles;
    v5->_visibleRoles = (NSSet *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.SKManager.frameworkOperations", MEMORY[0x263EF83A8]);
    frameworkAsyncOperationsQueue = v5->_frameworkAsyncOperationsQueue;
    v5->_frameworkAsyncOperationsQueue = (OS_dispatch_queue *)v18;
  }
  return v5;
}

+ (id)syncSharedManager
{
  v2 = [a1 sharedManager];
  [v2 syncAllDisks];

  return v2;
}

- (OS_dispatch_queue)callbackQueue
{
  v2 = +[SKHelperClient sharedClient];
  v3 = [v2 callbackQueue];

  return (OS_dispatch_queue *)v3;
}

- (void)setCallbackQueue:(id)a3
{
  id v3 = a3;
  id v4 = +[SKHelperClient sharedClient];
  [v4 setCallbackQueue:v3];
}

- (id)allDisks
{
  id v3 = self->allDisks;
  objc_sync_enter(v3);
  id v4 = [(NSMutableSet *)self->allDisks allObjects];
  objc_sync_exit(v3);

  return v4;
}

- (id)allDisksSet
{
  id v3 = self->allDisks;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableSet *)self->allDisks copy];
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)isBusy
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v2 = +[SKHelperClient sharedClient];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __19__SKManager_isBusy__block_invoke;
  v4[3] = &unk_26506BC20;
  v4[4] = &v5;
  [v2 isBusyWithBlocking:1 completionBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __19__SKManager_isBusy__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)syncAllDisks
{
  id v2 = +[SKHelperClient sharedClient];
  [v2 syncAllDisksWithBlocking:1 completionBlock:0];
}

- (void)setVisibleRoles:(id)a3
{
  id v7 = a3;
  id v4 = self->allDisks;
  objc_sync_enter(v4);
  uint64_t v5 = (NSSet *)[v7 copy];
  visibleRoles = self->_visibleRoles;
  self->_visibleRoles = v5;

  objc_sync_exit(v4);
}

- (id)visibleDisks
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  id v4 = self->allDisks;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->allDisks;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "role", (void)v12);
        if ([(NSSet *)self->_visibleRoles containsObject:v10]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);

  return v3;
}

+ (id)defaultVisibleRoles
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", kSKDiskRoleLegacyMacData[0], kSKDiskRoleLegacyMacSystem[0], kSKDiskRoleMacData[0], kSKDiskRoleMacSystem[0], kSKDiskRoleWindowsData[0], kSKDiskRoleWindowsSystem[0], kSKDiskRoleUnknown[0], 0);
}

- (id)diskForBSDname:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self->allDisks;
    objc_sync_enter(v5);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "diskIdentifier", (void)v14);
          int v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)contentDiskWithDisk:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)diskForUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  obj = self->allDisks;
  objc_sync_enter(obj);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->allDisks;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 volumeUUID];
        if ([v10 isEqualToString:v4])
        {

LABEL_13:
          long long v13 = [(SKManager *)self contentDiskWithDisk:v9];
          goto LABEL_14;
        }
        v11 = [v9 mediaUUID];
        int v12 = [v11 isEqualToString:v4];

        if (v12) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      long long v13 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    long long v13 = 0;
  }
LABEL_14:

  objc_sync_exit(obj);

  return v13;
}

- (id)diskForVolumeName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->allDisks;
  objc_sync_enter(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->allDisks;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "volumeName", (void)v15);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          long long v13 = [(SKManager *)self contentDiskWithDisk:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v13 = 0;
LABEL_11:

  objc_sync_exit(v5);

  return v13;
}

+ (BOOL)isMountPointWithPath:(id)a3
{
  int v7 = 0;
  uint64_t v6 = 0;
  v5[1] = 0x400000000;
  v5[2] = 0;
  v5[0] = 0x800000005;
  int v3 = getattrlist((const char *)[a3 fileSystemRepresentation], v5, &v6, 0xCuLL, 0);
  BOOL result = 0;
  if (!v3) {
    return (HIDWORD(v6) == 2) & v7;
  }
  return result;
}

+ (id)BSDNameFromString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"apfs://disk"])
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(\\/dev\\/)?r?(disk\\d+(s\\d+){0,2})$" options:1 error:0];
    uint64_t v6 = objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    int v7 = v6;
    if (v6 && [v6 count] == 1)
    {
      uint64_t v8 = [v7 objectAtIndexedSubscript:0];
      unint64_t v9 = [v8 numberOfRanges];

      id v4 = 0;
      if (v9 >= 3)
      {
        uint64_t v10 = [v7 objectAtIndexedSubscript:0];
        uint64_t v11 = [v10 rangeAtIndex:2];
        objc_msgSend(v3, "substringWithRange:", v11, v12);
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)_diskForString:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(uu, 0, sizeof(uu));
  if ([v4 length] != 36
    || (id v5 = v4, uuid_parse((const char *)[v5 UTF8String], uu))
    || ([(SKManager *)self diskForUUID:v5], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [(id)objc_opt_class() BSDNameFromString:v4];
    if (v6)
    {
      int v7 = [(SKManager *)self diskForBSDname:v6];
LABEL_5:
      id v8 = 0;
LABEL_12:

      goto LABEL_13;
    }
    unint64_t v9 = [(SKManager *)self _diskForPath:v4];
    if (v9 && +[SKManager isMountPointWithPath:v4])
    {
      id v10 = v9;
    }
    else
    {
      int v7 = [(SKManager *)self diskForVolumeName:v4];

      if (!v7) {
        goto LABEL_5;
      }
      id v10 = v7;
    }
    id v8 = v10;
    int v7 = v10;
    goto LABEL_12;
  }
  id v8 = v12;
  int v7 = v8;
LABEL_13:

  return v7;
}

- (id)diskForString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [(SKManager *)self _diskForString:v5];
    int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      [(SKManager *)self syncAllDisks];
      id v8 = [(SKManager *)self _diskForString:v5];
    }
    unint64_t v9 = v8;
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)_diskForPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(&v22, 0, 512);
  if (([v4 isEqualToString:@"/"] & 1) == 0)
  {
    id v4 = v4;
    int v5 = open((const char *)[v4 fileSystemRepresentation], 0x200000);
    if (v5 != -1)
    {
      int v6 = v5;
      if (!fstatfs(v5, &v22))
      {
        uint64_t v7 = [NSString stringWithUTF8String:v22.f_mntonname];

        id v4 = (id)v7;
      }
      close(v6);
    }
  }
  id v8 = self->allDisks;
  objc_sync_enter(v8);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v9 = self->allDisks;
  id v10 = (id)[(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "mountPoint", (void)v17);
        int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_16;
        }
      }
      id v10 = (id)[(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  objc_sync_exit(v8);

  return v10;
}

- (id)diskForPath:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [(SKManager *)self _diskForPath:v5];
    if (!v6)
    {
      [(SKManager *)self syncAllDisks];
      id v6 = [(SKManager *)self _diskForPath:v5];
      if (!v6)
      {
        uint64_t v10 = 0;
        uint64_t v11 = &v10;
        uint64_t v12 = 0x3032000000;
        long long v13 = __Block_byref_object_copy_;
        uint64_t v14 = __Block_byref_object_dispose_;
        id v15 = 0;
        uint64_t v7 = +[SKHelperClient sharedClient];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __25__SKManager_diskForPath___block_invoke;
        v9[3] = &unk_26506BC48;
        v9[4] = &v10;
        [v7 diskForPath:v5 blocking:1 withCallbackBlock:v9];

        id v6 = (id)v11[5];
        _Block_object_dispose(&v10, 8);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __25__SKManager_diskForPath___block_invoke(uint64_t a1, void *a2)
{
}

- (id)wholeDiskForDisk:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  if ([v4 isWholeDisk])
  {
    id v5 = v4;
LABEL_3:
    id v6 = v5;
    goto LABEL_7;
  }
  uint64_t v7 = [v4 cachedWholeDiskByIdentifier];
  if (!v7)
  {
    [(SKManager *)self syncAllDisks];
    uint64_t v7 = [v4 cachedWholeDiskByIdentifier];
    if (!v7)
    {
      unint64_t v9 = +[SKHelperClient sharedClient];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __30__SKManager_wholeDiskForDisk___block_invoke;
      v10[3] = &unk_26506BC48;
      v10[4] = &v11;
      [v9 wholeDiskForDisk:v4 blocking:1 withCallbackBlock:v10];

      id v5 = (id)v12[5];
      goto LABEL_3;
    }
  }
  id v6 = v7;

LABEL_7:
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __30__SKManager_wholeDiskForDisk___block_invoke(uint64_t a1, void *a2)
{
}

- (id)childDisksForWholeDisk:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [v4 type];
  char v6 = [v5 isEqualToString:kSKDiskTypeRAID[0]];

  if ((v6 & 1) == 0
    && (([v4 children], (unint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(SKManager *)self syncAllDisks],
         [v4 children],
         (unint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    id v8 = v9;
  }
  else
  {
    uint64_t v7 = +[SKHelperClient sharedClient];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__SKManager_childDisksForWholeDisk___block_invoke;
    v11[3] = &unk_26506BC70;
    v11[4] = &v12;
    [v7 childDisksForWholeDisk:v4 blocking:1 withCallbackBlock:v11];

    id v8 = (id)v13[5];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __36__SKManager_childDisksForWholeDisk___block_invoke(uint64_t a1, void *a2)
{
}

- (id)filesystems
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__SKManager_filesystems__block_invoke;
  block[3] = &unk_26506BC98;
  block[4] = self;
  if (filesystems_onceToken != -1) {
    dispatch_once(&filesystems_onceToken, block);
  }
  return self->_filesystems;
}

void __24__SKManager_filesystems__block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy_;
  id v8 = __Block_byref_object_dispose_;
  id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:20];
  id v2 = +[SKHelperClient sharedClient];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __24__SKManager_filesystems__block_invoke_2;
  v3[3] = &unk_26506BC70;
  v3[4] = &v4;
  [v2 filesystemsWithBlocking:1 callbackBlock:v3];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), (id)v5[5]);
  _Block_object_dispose(&v4, 8);
}

void __24__SKManager_filesystems__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_DEFAULT, "Initializing filesystems dictionary", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        uint64_t v11 = [SKFilesystem alloc];
        uint64_t v12 = -[SKFilesystem initWithDictionaryRepresentation:](v11, "initWithDictionaryRepresentation:", v10, (void)v13);
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)formatableFileSystems
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [(SKManager *)self filesystems];
  id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "shouldShow", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)filesystemWithSKType:(id)a3 isCaseSensitive:(BOOL)a4 isEncrypted:(BOOL)a5
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  [(SKManager *)self filesystems];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "type", (void)v19);
        if ([v15 isEqualToString:v8]
          && [v14 isCaseSensitive] == v6)
        {
          int v16 = [v14 isEncrypted];

          if (v16 == v5)
          {
            id v17 = v14;
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_14:

  return v17;
}

- (id)physicalStoresForAPFSVolume:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  id v4 = +[SKHelperClient sharedClient];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SKManager_physicalStoresForAPFSVolume___block_invoke;
  v7[3] = &unk_26506BC70;
  v7[4] = &v8;
  [v4 physicalStoresForAPFSVolume:v3 blocking:1 completionBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __41__SKManager_physicalStoresForAPFSVolume___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
}

- (id)volumesForAPFSPS:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  id v4 = +[SKHelperClient sharedClient];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SKManager_volumesForAPFSPS___block_invoke;
  v7[3] = &unk_26506BC70;
  v7[4] = &v8;
  [v4 volumesForAPFSPS:v3 blocking:1 completionBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __30__SKManager_volumesForAPFSPS___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
}

- (id)knownDisksForDictionaries:(id)a3
{
  id v4 = a3;
  id v5 = [(SKManager *)self allDisksSet];
  int v6 = [(SKManager *)self knownDisksForDictionaries:v4 waitingForDaemon:1 fromSet:v5];

  return v6;
}

- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SKManager *)self allDisksSet];
  uint64_t v8 = [(SKManager *)self knownDisksForDictionaries:v6 waitingForDaemon:v4 fromSet:v7];

  return v8;
}

- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  id v11 = v9;
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v36;
    *(void *)&long long v15 = 138413058;
    long long v30 = v15;
    v32 = v10;
    id v33 = v11;
    unsigned int v31 = v6;
    do
    {
      uint64_t v18 = 0;
      uint64_t v34 = v16;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
        long long v20 = -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:](v10, "knownDiskForDictionary:waitingForDaemon:fromSet:", v19, v6, v11, v30);
        if (v20)
        {
          [v12 addObject:v20];
        }
        else
        {
          long long v21 = +[SKBaseManager sharedManager];
          [v21 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_52];

          long long v22 = SKGetOSLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            uint64_t v23 = [v19 objectForKey:@"volumeName"];
            [v19 objectForKey:@"volumeUUID"];
            v25 = id v24 = v13;
            [v19 objectForKey:@"diskIdentifier"];
            v27 = v26 = v12;
            v28 = [v19 objectForKey:@"mountPoint"];
            *(_DWORD *)buf = v30;
            v40 = v23;
            __int16 v41 = 2114;
            v42 = v25;
            __int16 v43 = 2114;
            v44 = v27;
            __int16 v45 = 2112;
            v46 = v28;
            _os_log_impl(&dword_23F40C000, v22, OS_LOG_TYPE_FAULT, "SKManager: no known disk resembling: {%@,%{public}@,%{public}@,%@}", buf, 0x2Au);

            uint64_t v12 = v26;
            id v13 = v24;

            uint64_t v6 = v31;
            uint64_t v10 = v32;
            id v11 = v33;
          }

          uint64_t v16 = v34;
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v16);
  }

  return v12;
}

id __64__SKManager_knownDisksForDictionaries_waitingForDaemon_fromSet___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKManager.m", 554);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (void)knownDiskForDictionary:(id)a3 notify:(id)a4 onQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a5;
  if (v8)
  {
    id v11 = [(SKManager *)self allDisksSet];
    id v12 = [(SKManager *)self knownDiskForDictionary:v8 waitingForDaemon:0 fromSet:v11];

    if (v12)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_2;
      block[3] = &unk_26506BCE8;
      id v22 = v9;
      id v12 = v12;
      id v21 = v12;
      dispatch_async(v10, block);

      id v13 = v22;
    }
    else
    {
      dispatch_time_t v14 = dispatch_time(0, 100000000);
      long long v15 = dispatch_get_global_queue(0, 0);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_3;
      v16[3] = &unk_26506BD10;
      v16[4] = self;
      id v17 = v8;
      id v19 = v9;
      uint64_t v18 = v10;
      dispatch_after(v14, v15, v16);

      id v13 = v17;
    }
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke;
    v23[3] = &unk_26506BCC0;
    id v24 = v9;
    dispatch_async(v10, v23);
    id v12 = v24;
  }
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) knownDiskForDictionary:*(void *)(a1 + 40) notify:*(void *)(a1 + 56) onQueue:*(void *)(a1 + 48)];
}

- (id)knownDiskForDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(SKManager *)self allDisksSet];
  uint64_t v6 = [(SKManager *)self knownDiskForDictionary:v4 waitingForDaemon:1 fromSet:v5];

  return v6;
}

- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SKManager *)self allDisksSet];
  id v8 = [(SKManager *)self knownDiskForDictionary:v6 waitingForDaemon:v4 fromSet:v7];

  return v8;
}

- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5
{
  BOOL v6 = a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v8
    && ([MEMORY[0x263EFF9D0] null],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v8 isEqual:v10],
        v10,
        (v11 & 1) == 0))
  {
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x3032000000;
    long long v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    id v40 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    waitingForDiskQueue = self->_waitingForDiskQueue;
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke;
    v28 = &unk_26506BD60;
    id v29 = v9;
    id v15 = v8;
    id v30 = v15;
    id v33 = &v35;
    BOOL v34 = v6;
    uint64_t v16 = v13;
    unsigned int v31 = v16;
    v32 = self;
    dispatch_sync(waitingForDiskQueue, &v25);
    id v17 = v36;
    if (v6 && !v36[5])
    {
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      id v17 = v36;
      if (!v36[5])
      {
        uint64_t v18 = +[SKBaseManager sharedManager];
        [v18 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_68];

        id v19 = SKGetOSLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          id v20 = [v15 objectForKey:@"volumeName"];
          id v21 = [v15 objectForKey:@"volumeUUID"];
          id v22 = [v15 objectForKey:@"diskIdentifier"];
          uint64_t v23 = [v15 objectForKey:@"mountPoint"];
          *(_DWORD *)buf = 138413058;
          id v42 = v20;
          __int16 v43 = 2114;
          id v44 = v21;
          __int16 v45 = 2114;
          id v46 = v22;
          __int16 v47 = 2112;
          uint64_t v48 = v23;
          _os_log_impl(&dword_23F40C000, v19, OS_LOG_TYPE_FAULT, "SKManager: no daemon-known disk resembling: {%@,%{public}@,%{public}@,%@}", buf, 0x2Au);
        }
        id v17 = v36;
      }
    }
    id v12 = (id)v17[5];

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v7 matchesDictionary:*(void *)(a1 + 40)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (*(unsigned char *)(a1 + 72) && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v8 = objc_alloc_init(SKWaitingForDiskElement);
    [(SKWaitingForDiskElement *)v8 setDiskDictionary:*(void *)(a1 + 40)];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    char v11 = __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_2;
    id v12 = &unk_26506BD38;
    uint64_t v14 = *(void *)(a1 + 64);
    id v13 = *(id *)(a1 + 48);
    [(SKWaitingForDiskElement *)v8 setBlock:&v9];
    objc_msgSend(*(id *)(*(void *)(a1 + 56) + 64), "addObject:", v8, v9, v10, v11, v12);
  }
  objc_sync_exit(v2);
}

void __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_3()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKManager.m", 639);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (id)newDiskWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"type"];
  uint64_t v5 = [v3 objectForKey:@"**ClassName**"];
  if ([v4 isEqualToString:kSKDiskTypeAPFSPS[0]]
    && ([v5 isEqualToString:@"SKAPFSStoreDisk"] & 1) != 0)
  {
    BOOL v6 = off_26506BA60;
  }
  else if ([v4 isEqualToString:kSKDiskTypeAPFSContainer[0]] {
         && ([v5 isEqualToString:@"SKAPFSContainerDisk"] & 1) != 0)
  }
  {
    BOOL v6 = off_26506BA48;
  }
  else if ([v4 isEqualToString:kSKDiskTypeAPFSLV[0]] {
         && ([v5 isEqualToString:@"SKAPFSDisk"] & 1) != 0)
  }
  {
    BOOL v6 = off_26506BA50;
  }
  else if ([v5 isEqualToString:@"SKAPFSSnapshotDisk"])
  {
    BOOL v6 = off_26506BA58;
  }
  else
  {
    if (([v5 isEqualToString:@"SKDisk"] & 1) == 0) {
      -[SKManager newDiskWithDictionary:](v5);
    }
    BOOL v6 = off_26506BA70;
  }
  uint64_t v7 = (void *)[objc_alloc(*v6) initWithDictionary:v3];

  return v7;
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_listeners;
  objc_sync_enter(v5);
  [(NSHashTable *)self->_listeners addObject:v4];
  listenersAppearedDisks = self->_listenersAppearedDisks;
  uint64_t v7 = [MEMORY[0x263EFF9C0] setWithCapacity:5];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  [(NSMutableDictionary *)listenersAppearedDisks setObject:v7 forKey:v8];

  uint64_t v9 = [(SKManager *)self allDisks];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    char v11 = +[SKHelperClient sharedClient];
    id v12 = [v11 xpcQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__SKManager_addListener___block_invoke;
    block[3] = &unk_26506BD88;
    void block[4] = self;
    id v18 = v4;
    dispatch_async(v12, block);
  }
  objc_sync_exit(v5);

  id v13 = +[SKHelperClient sharedClient];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __25__SKManager_addListener___block_invoke_2;
  v15[3] = &unk_26506BD88;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v13 syncAllDisksWithCompletionBlock:v15];
}

void __25__SKManager_addListener___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 allDisks];
  [v2 _disksAppeared:v3 toListener:*(void *)(a1 + 40)];
}

uint64_t __25__SKManager_addListener___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initialPopulateCompleteForListener:*(void *)(a1 + 40)];
}

- (void)removeListener:(id)a3
{
  id v7 = a3;
  id v4 = self->_listeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_listeners removeObject:v7];
  listenersAppearedDisks = self->_listenersAppearedDisks;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  [(NSMutableDictionary *)listenersAppearedDisks removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (void)initialPopulateComplete
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = self->_listeners;
  objc_sync_enter(v3);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_listeners;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[SKManager _initialPopulateCompleteForListener:](self, "_initialPopulateCompleteForListener:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)_initialPopulateCompleteForListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKManager *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SKManager__initialPopulateCompleteForListener___block_invoke;
  block[3] = &unk_26506BC98;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __49__SKManager__initialPopulateCompleteForListener___block_invoke(uint64_t a1)
{
  id v2 = SKGetOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23F40C000, v2, OS_LOG_TYPE_DEFAULT, "CLIENT - Initial Populate Complete", v4, 2u);
  }

  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [*(id *)(a1 + 32) initialPopulateComplete];
  }
  return result;
}

- (void)disksAppeared:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = [MEMORY[0x263EFF9C0] set];
  uint64_t v35 = 0;
  long long v36 = (os_log_type_t *)&v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [(SKManager *)self knownDiskForDictionary:v11 waitingForDaemon:0];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          id v14 = [(SKManager *)self newDiskWithDictionary:v11];
          [v5 addObject:v14];
        }
        else
        {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v8);
  }

  waitingForDiskQueue = self->_waitingForDiskQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SKManager_disksAppeared___block_invoke;
  block[3] = &unk_26506BDB0;
  void block[4] = self;
  id v16 = v5;
  id v29 = v16;
  id v30 = &v35;
  dispatch_sync(waitingForDiskQueue, block);
  if ([v6 count])
  {
    long long v17 = [v6 allObjects];
    [(SKManager *)self disksChanged:v17];
  }
  id v18 = self->_listeners;
  objc_sync_enter(v18);
  id v19 = [v16 allObjects];
  SKLogArrayRedacted(v36[24], (uint64_t)"CLIENT - Disks appeared:", v19);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v20 = self->_listeners;
  uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v24 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v20);
        }
        -[SKManager _disksAppeared:toListener:](self, "_disksAppeared:toListener:", v19, *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
      }
      uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v24 objects:v39 count:16];
    }
    while (v21);
  }

  objc_sync_exit(v18);
  _Block_object_dispose(&v35, 8);
}

void __27__SKManager_disksAppeared___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = v1;
    obuint64_t j = *(id *)(v1 + 40);
    uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(obj);
          }
          id v3 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v4 = objc_opt_new();
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v5 = *(id *)(*(void *)(v17 + 32) + 64);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v19;
            do
            {
              for (uint64_t j = 0; j != v6; ++j)
              {
                if (*(void *)v19 != v7) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * j);
                long long v10 = [v9 diskDictionary];
                int v11 = [v3 matchesDictionary:v10];

                if (v11)
                {
                  id v12 = [v9 block];
                  ((void (**)(void, void *))v12)[2](v12, v3);

                  [v4 addObject:v9];
                }
              }
              uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v6);
          }

          [*(id *)(*(void *)(v17 + 32) + 64) minusSet:v4];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v16);
    }

    uint64_t v1 = v17;
  }
  id v13 = *(id *)(*(void *)(v1 + 32) + 24);
  objc_sync_enter(v13);
  if ([*(id *)(*(void *)(v1 + 32) + 24) count]) {
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 0;
  }
  [*(id *)(*(void *)(v1 + 32) + 24) unionSet:*(void *)(v1 + 40)];
  objc_sync_exit(v13);
}

- (void)_disksAppeared:(id)a3 toListener:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    listenersAppearedDisks = self->_listenersAppearedDisks;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
    long long v10 = [(NSMutableDictionary *)listenersAppearedDisks objectForKey:v9];

    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v7 visibleDiskRoles], int v11 = objc_claimAutoreleasedReturnValue(),
                                                v11,
                                                v11))
    {
      id v12 = (void *)MEMORY[0x263F08A98];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __39__SKManager__disksAppeared_toListener___block_invoke;
      v20[3] = &unk_26506BDD8;
      id v21 = v10;
      id v22 = v7;
      id v13 = [v12 predicateWithBlock:v20];
      id v14 = [v6 filteredArrayUsingPredicate:v13];
    }
    else
    {
      id v14 = v6;
    }
    uint64_t v15 = [MEMORY[0x263EFFA08] setWithArray:v14];
    [v10 unionSet:v15];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__SKManager__disksAppeared_toListener___block_invoke_2;
    v17[3] = &unk_26506BD88;
    id v18 = v14;
    id v19 = v7;
    id v16 = v14;
    dispatch_async(MEMORY[0x263EF83A0], v17);
  }
}

uint64_t __39__SKManager__disksAppeared_toListener___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) visibleDiskRoles];
    id v6 = [v3 role];
    uint64_t v4 = [v5 containsObject:v6];
  }
  return v4;
}

uint64_t __39__SKManager__disksAppeared_toListener___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return [v3 disksAppeared:v4];
  }
  return result;
}

- (void)disksDisappeared:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v32 = a3;
  long long v33 = self;
  id v30 = [(SKManager *)self allDisksSet];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v32, "count"));
  obuint64_t j = self->allDisks;
  objc_sync_enter(obj);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = self->allDisks;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v10 = v32;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v43 != v12) {
                objc_enumerationMutation(v10);
              }
              if ([v9 matchesDictionary:*(void *)(*((void *)&v42 + 1) + 8 * j)])
              {
                [v4 addObject:v9];
                [v9 setIsValid:0];
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v6);
  }

  [(NSMutableSet *)v33->allDisks minusSet:v4];
  objc_sync_exit(obj);

  obja = v33->_listeners;
  objc_sync_enter(obja);
  SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks disappeared:", v4);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v31 = v33->_listeners;
  uint64_t v14 = [(NSHashTable *)v31 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v31);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        if (objc_opt_respondsToSelector())
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || ([v17 visibleDiskRoles],
                id v18 = objc_claimAutoreleasedReturnValue(),
                BOOL v19 = v18 == 0,
                v18,
                v19))
          {
            id v22 = [(SKManager *)v33 knownDisksForDictionaries:v32 waitingForDaemon:0 fromSet:v30];
          }
          else
          {
            long long v20 = [v4 allObjects];
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __30__SKManager_disksDisappeared___block_invoke;
            v37[3] = &unk_26506BDD8;
            v37[4] = v33;
            v37[5] = v17;
            id v21 = [MEMORY[0x263F08A98] predicateWithBlock:v37];
            id v22 = [v20 filteredArrayUsingPredicate:v21];
          }
          listenersAppearedDisks = v33->_listenersAppearedDisks;
          long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
          long long v25 = [(NSMutableDictionary *)listenersAppearedDisks objectForKey:v24];

          long long v26 = [MEMORY[0x263EFFA08] setWithArray:v22];
          [v25 minusSet:v26];

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __30__SKManager_disksDisappeared___block_invoke_2;
          block[3] = &unk_26506BD88;
          id v35 = v22;
          long long v36 = v17;
          id v27 = v22;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
      }
      uint64_t v14 = [(NSHashTable *)v31 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v14);
  }

  objc_sync_exit(obja);
}

uint64_t __30__SKManager_disksDisappeared___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = NSNumber;
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v2, "hash"));
  uint64_t v7 = [v3 objectForKey:v6];

  uint64_t v8 = [v7 containsObject:v5];
  return v8;
}

uint64_t __30__SKManager_disksDisappeared___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return [v3 disksDisappeared:v4];
  }
  return result;
}

- (void)disksChanged:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__SKManager_disksChanged___block_invoke;
  aBlock[3] = &unk_26506BD88;
  long long v44 = self;
  aBlock[4] = self;
  id v36 = v4;
  id v67 = v36;
  blocuint64_t k = (void (**)(void))_Block_copy(aBlock);
  if (self->_shouldBeBindingsSafe) {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else {
    block[2]();
  }
  long long v40 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v38 = self->allDisks;
  objc_sync_enter(v38);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v10 = v44->allDisks;
        uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v58 objects:v69 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v59;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v59 != v12) {
                objc_enumerationMutation(v10);
              }
              if ([*(id *)(*((void *)&v58 + 1) + 8 * j) matchesDictionary:v9])
              {

                goto LABEL_19;
              }
            }
            uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v58 objects:v69 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        [v40 addObject:v9];
LABEL_19:
        ;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v38);
  if ([v40 count])
  {
    [(SKManager *)v44 disksAppeared:v40];
    [obj removeObjectsInArray:v40];
  }
  uint64_t v14 = [(SKManager *)v44 knownDisksForDictionaries:obj waitingForDaemon:0];
  long long v39 = v44->_listeners;
  objc_sync_enter(v39);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v41 = v44->_listeners;
  uint64_t v15 = [(NSHashTable *)v41 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v41);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([v18 visibleDiskRoles],
              BOOL v19 = objc_claimAutoreleasedReturnValue(),
              BOOL v20 = v19 == 0,
              v19,
              v20))
        {
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __26__SKManager_disksChanged___block_invoke_5;
          v45[3] = &unk_26506BD88;
          v45[4] = v18;
          id v46 = v14;
          dispatch_async(MEMORY[0x263EF83A0], v45);
          id v22 = v46;
        }
        else
        {
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __26__SKManager_disksChanged___block_invoke_2;
          v53[3] = &unk_26506BE00;
          v53[4] = v18;
          id v21 = [MEMORY[0x263F08A98] predicateWithBlock:v53];
          id v22 = [v14 filteredArrayUsingPredicate:v21];

          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __26__SKManager_disksChanged___block_invoke_3;
          v52[3] = &unk_26506BE00;
          v52[4] = v18;
          long long v23 = [MEMORY[0x263F08A98] predicateWithBlock:v52];
          long long v43 = [v14 filteredArrayUsingPredicate:v23];

          listenersAppearedDisks = v44->_listenersAppearedDisks;
          long long v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "hash"));
          long long v26 = [(NSMutableDictionary *)listenersAppearedDisks objectForKey:v25];

          id v27 = v14;
          uint64_t v28 = v16;
          uint64_t v29 = v15;
          id v30 = [MEMORY[0x263EFF9C0] setWithArray:v43];
          [v30 intersectSet:v26];
          long long v31 = [MEMORY[0x263EFF9C0] setWithArray:v22];
          [v31 minusSet:v26];
          id v32 = [MEMORY[0x263EFF9C0] setWithArray:v22];
          [v32 minusSet:v31];
          [v32 minusSet:v30];
          [v26 minusSet:v30];
          [v26 unionSet:v31];
          v47[0] = MEMORY[0x263EF8330];
          v47[1] = 3221225472;
          v47[2] = __26__SKManager_disksChanged___block_invoke_4;
          v47[3] = &unk_26506BE28;
          id v48 = v32;
          long long v49 = v18;
          id v50 = v30;
          id v51 = v31;
          id v33 = v31;
          id v34 = v30;
          id v35 = v32;
          dispatch_async(MEMORY[0x263EF83A0], v47);

          uint64_t v15 = v29;
          uint64_t v16 = v28;
          uint64_t v14 = v27;
        }
      }
      uint64_t v15 = [(NSHashTable *)v41 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v15);
  }

  objc_sync_exit(v39);
}

void __26__SKManager_disksChanged___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v12 = *(id *)(*(void *)(a1 + 32) + 24);
  objc_sync_enter(v12);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v19 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v6 = *(id *)(a1 + 40);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v15;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v15 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v14 + 1) + 8 * j);
              if (objc_msgSend(v5, "matchesDictionary:", v10, v12))
              {
                id v11 = v10;
                objc_sync_enter(v11);
                [v5 updateWithDictionary:v11];
                objc_sync_exit(v11);
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v7);
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v2);
  }

  objc_sync_exit(v12);
}

uint64_t __26__SKManager_disksChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 visibleDiskRoles];
  id v5 = [v3 role];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

uint64_t __26__SKManager_disksChanged___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 visibleDiskRoles];
  id v5 = [v3 role];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

void __26__SKManager_disksChanged___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks changed:", *(void **)(a1 + 32));
    uint64_t v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) allObjects];
    [v2 disksChanged:v3];
  }
  if ([*(id *)(a1 + 48) count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks disappeared:", *(void **)(a1 + 48));
    id v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) allObjects];
    [v4 disksDisappeared:v5];
  }
  if ([*(id *)(a1 + 56) count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 56) allObjects];
    [v6 disksAppeared:v7];

    uint64_t v8 = *(void **)(a1 + 56);
    SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks appeared:", v8);
  }
}

uint64_t __26__SKManager_disksChanged___block_invoke_5(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 disksChanged:v4];
  }
  return result;
}

- (void)managerStalled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->diskQueueStucuint64_t k = 1;
  obuint64_t j = self->_listeners;
  objc_sync_enter(obj);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_listeners;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __27__SKManager_managerStalled__block_invoke;
          block[3] = &unk_26506BC98;
          void block[4] = v8;
          dispatch_async(v6, block);
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  objc_sync_exit(obj);
}

uint64_t __27__SKManager_managerStalled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) managerStalled];
}

- (void)managerResumed
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->diskQueueStucuint64_t k = 0;
  id v3 = self->_listeners;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_listeners;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __27__SKManager_managerResumed__block_invoke;
        block[3] = &unk_26506BC98;
        void block[4] = v9;
        dispatch_async(v7, block);
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

uint64_t __27__SKManager_managerResumed__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 managerResumed];
  }
  return result;
}

- (NSSet)visibleRoles
{
  return self->_visibleRoles;
}

- (OS_dispatch_queue)frameworkAsyncOperationsQueue
{
  return self->_frameworkAsyncOperationsQueue;
}

- (void)setFrameworkAsyncOperationsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkAsyncOperationsQueue, 0);
  objc_storeStrong((id *)&self->_visibleRoles, 0);
  objc_storeStrong((id *)&self->_filesystems, 0);
  objc_storeStrong((id *)&self->_waitingForDiskSet, 0);
  objc_storeStrong((id *)&self->_waitingForDiskQueue, 0);
  objc_storeStrong((id *)&self->_listenersAppearedDisks, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->allDisks, 0);
}

+ (void)sharedManagerWithBindingsSafety:.cold.1()
{
  __assert_rtn("+[SKManager sharedManagerWithBindingsSafety:]", "SKManager.m", 51, "isBindingsSafe == NO");
}

- (void)newDiskWithDictionary:(void *)a1 .cold.1(void *a1)
{
}

@end