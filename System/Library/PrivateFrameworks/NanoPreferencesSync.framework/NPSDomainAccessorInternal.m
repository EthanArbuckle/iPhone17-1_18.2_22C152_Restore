@interface NPSDomainAccessorInternal
+ (BOOL)domainIsValid:(id)a3;
+ (BOOL)valueIsValid:(id)a3;
+ (id)cfTypeNameForCFPropertyListRef:(void *)a3;
+ (id)copyDomainListForPairingDataStore:(id)a3;
+ (id)internalAccessorForPairingID:(id)a3 pairingDataStore:(id)a4 domain:(id)a5;
+ (id)readDomainURL:(id)a3 withError:(id *)a4;
+ (id)urlForDomain:(id)a3 pairingDataStore:(id)a4;
+ (id)writeDomain:(id)a3 toURL:(id)a4;
+ (void)applicationDidEnterBackground;
+ (void)applicationDidResume;
+ (void)decrementInternalAccessorReferenceCount:(id)a3;
+ (void)extensionDidBecomeActive;
+ (void)extensionWillResignActive;
+ (void)initialize;
+ (void)invalidateAndReleaseUnreferencedAccessors;
+ (void)mergeDirtyKeys:(id)a3 fromDictionary:(id)a4 toDictionary:(id)a5;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (BOOL)hasReadFromDisk;
- (BOOL)nanoSettingsDirectoryExists;
- (BOOL)requiresDeviceUnlockedSinceBoot;
- (NPSDomainAccessorFilePresenter)filePresenter;
- (NPSDomainAccessorInternal)initWithPairingID:(id)a3 pairingDataStore:(id)a4 domain:(id)a5;
- (NSMutableDictionary)map;
- (NSMutableSet)dirtyKeysForWriting;
- (NSString)domain;
- (NSString)pairingStorePath;
- (NSURL)domainURL;
- (NSUUID)pairingID;
- (OS_dispatch_queue)externalQueue;
- (OS_dispatch_queue)internalQueue;
- (double)doubleForKey:(id)a3;
- (double)doubleForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (float)floatForKey:(id)a3;
- (float)floatForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (id)URLForKey:(id)a3;
- (id)_copyKeyList;
- (id)_dictionaryRepresentation;
- (id)_objectForKey:(id)a3 error:(id *)a4;
- (id)_synchronizeReadOnly:(BOOL)a3;
- (id)arrayForKey:(id)a3;
- (id)canSynchronizeForReadingURL:(id)a3;
- (id)canSynchronizeForWritingURL:(id)a3 readFirst:(BOOL)a4;
- (id)copyKeyList;
- (id)createNanoSettingsDirectory;
- (id)dataForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryRepresentation;
- (id)objectForKey:(id)a3;
- (id)stringArrayForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)synchronize;
- (int64_t)integerForKey:(id)a3;
- (int64_t)integerForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (int64_t)longForKey:(id)a3;
- (int64_t)longForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (unint64_t)domainSize;
- (unint64_t)referenceCounter;
- (void)_invalidatePresenter;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)filePresenterDidBecomeNonCurrent:(id)a3;
- (void)invalidatePresenter;
- (void)objectForKey:(id)a3 completionHandler:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDirtyKeysForWriting:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDomainURL:(id)a3;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setExternalQueue:(id)a3;
- (void)setFilePresenter:(id)a3;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setHasReadFromDisk:(BOOL)a3;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setInternalQueue:(id)a3;
- (void)setLong:(int64_t)a3 forKey:(id)a4;
- (void)setMap:(id)a3;
- (void)setNanoSettingsDirectoryExists:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)setPairingID:(id)a3;
- (void)setPairingStorePath:(id)a3;
- (void)setReferenceCounter:(unint64_t)a3;
- (void)setURL:(id)a3 forKey:(id)a4;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation NPSDomainAccessorInternal

+ (void)initialize
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoprefsync.frmrk.internalAccessors", v3);
  v5 = (void *)internalAccessorsQueue;
  internalAccessorsQueue = (uint64_t)v4;

  uint64_t v6 = objc_opt_new();
  v7 = (void *)internalAccessors;
  internalAccessors = v6;

  uiApplicationClass = (uint64_t)NSClassFromString(&cfstr_Uiapplication.isa);
  v8 = [(id)uiApplicationClass sharedApplication];
  if (v8)
  {
    int v9 = 0;
    atomic_compare_exchange_strong(&applicationEnteredBackground, (unsigned int *)&v9, 1u);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:a1 selector:sel_applicationDidResume name:@"UIApplicationDidBecomeActiveNotification" object:v8];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:a1 selector:sel_applicationDidEnterBackground name:@"UIApplicationDidEnterBackgroundNotification" object:v8];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:a1 selector:sel_applicationDidResume name:@"UIApplicationResumedNotification" object:v8];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__NPSDomainAccessorInternal_initialize__block_invoke;
    v19[3] = &unk_1E6217C50;
    id v20 = v8;
    v13 = (void (**)(void))MEMORY[0x1BA9EB780](v19);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v13[2](v13);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v13);
    }
  }
  else
  {
    if (ProcessIsExtension_once != -1) {
      dispatch_once(&ProcessIsExtension_once, &__block_literal_global_294);
    }
    if (ProcessIsExtension_result)
    {
      int v14 = 0;
      atomic_compare_exchange_strong(&applicationEnteredBackground, (unsigned int *)&v14, 1u);
      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 addObserver:a1 selector:sel_extensionDidBecomeActive name:*MEMORY[0x1E4F28270] object:0];

      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 addObserver:a1 selector:sel_extensionWillResignActive name:*MEMORY[0x1E4F28288] object:0];
    }
  }
  v17 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, (dispatch_queue_t)internalAccessorsQueue);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__NPSDomainAccessorInternal_initialize__block_invoke_20;
  v18[3] = &__block_descriptor_40_e5_v8__0l;
  v18[4] = a1;
  dispatch_source_set_event_handler(v17, v18);
  dispatch_resume(v17);
}

void __39__NPSDomainAccessorInternal_initialize__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) applicationState];
  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = v1;
    _os_log_impl(&dword_1BA426000, v2, OS_LOG_TYPE_DEFAULT, "Application state: %ld", (uint8_t *)&v4, 0xCu);
  }
  if (!v1)
  {
    int v3 = 1;
    atomic_compare_exchange_strong(&applicationEnteredBackground, (unsigned int *)&v3, 0);
  }
}

+ (BOOL)domainIsValid:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  BOOL v5 = v3
    && [v3 rangeOfString:@"/"] == 0x7FFFFFFFFFFFFFFFLL
    && [v4 rangeOfString:@".."] == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

+ (void)applicationDidResume
{
  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1BA426000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1BA432E2F, v4, 2u);
  }
  int v3 = 1;
  atomic_compare_exchange_strong(&applicationEnteredBackground, (unsigned int *)&v3, 0);
}

void __39__NPSDomainAccessorInternal_initialize__block_invoke_20(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&_block_invoke_lastFlush > 10.0) {
    [*(id *)(a1 + 32) invalidateAndReleaseUnreferencedAccessors];
  }
  _block_invoke_lastFlush = *(void *)&Current;
}

+ (void)applicationDidEnterBackground
{
  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA426000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1BA432E2F, buf, 2u);
  }
  int v3 = [(id)uiApplicationClass sharedApplication];
  uint64_t v4 = [v3 beginBackgroundTaskWithName:@"NPSDomainAccessorInternal" expirationHandler:&__block_literal_global_1];

  int v5 = 0;
  atomic_compare_exchange_strong(&applicationEnteredBackground, (unsigned int *)&v5, 1u);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_24;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)internalAccessorsQueue, block);
}

void __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke()
{
  v0 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1BA426000, v0, OS_LOG_TYPE_DEFAULT, "Expiration handler called", v1, 2u);
  }
}

void __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_24(uint64_t a1)
{
  [(id)internalAccessors enumerateKeysAndObjectsUsingBlock:&__block_literal_global_27];
  id v2 = [(id)uiApplicationClass sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 32)];
}

uint64_t __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_30];
}

uint64_t __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidatePresenter];
}

+ (void)extensionDidBecomeActive
{
  id v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BA426000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1BA432E2F, v4, 2u);
  }
  int v3 = 1;
  atomic_compare_exchange_strong(&applicationEnteredBackground, (unsigned int *)&v3, 0);
}

+ (void)extensionWillResignActive
{
  id v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1BA426000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1BA432E2F, v5, 2u);
  }
  int v3 = 0;
  atomic_compare_exchange_strong(&applicationEnteredBackground, (unsigned int *)&v3, 1u);
  uint64_t v4 = [MEMORY[0x1E4F28F80] processInfo];
  [v4 performExpiringActivityWithReason:@"NPSDomainAccessor" usingBlock:&__block_literal_global_37];
}

void __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "expired: (%d)", (uint8_t *)v4, 8u);
  }
  dispatch_sync((dispatch_queue_t)internalAccessorsQueue, &__block_literal_global_40);
}

uint64_t __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke_38()
{
  return [(id)internalAccessors enumerateKeysAndObjectsUsingBlock:&__block_literal_global_42];
}

uint64_t __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_44];
}

uint64_t __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidatePresenter];
}

+ (id)internalAccessorForPairingID:(id)a3 pairingDataStore:(id)a4 domain:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v10 = internalAccessorsQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke;
  v16[3] = &unk_1E6217F48;
  id v17 = v7;
  id v18 = v9;
  id v19 = v8;
  id v20 = &v21;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  dispatch_sync(v10, v16);
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke(void *a1)
{
  id v2 = [(id)internalAccessors objectForKey:a1[4]];
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = [v2 objectForKey:a1[5]];
    uint64_t v5 = *(void *)(a1[7] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = *(void *)(a1[7] + 8);
    id v8 = *(void **)(v7 + 40);
    if (v8)
    {
      objc_msgSend(v8, "setReferenceCounter:", objc_msgSend(*(id *)(v7 + 40), "referenceCounter") + 1);
      id v9 = [*(id *)(*(void *)(a1[7] + 8) + 40) internalQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke_2;
      block[3] = &unk_1E6217F20;
      block[4] = a1[7];
      dispatch_async(v9, block);
    }
    else
    {
      id v14 = [[NPSDomainAccessorInternal alloc] initWithPairingID:a1[4] pairingDataStore:a1[6] domain:a1[5]];
      uint64_t v15 = *(void *)(a1[7] + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      [v3 setObject:*(void *)(*(void *)(a1[7] + 8) + 40) forKey:a1[5]];
    }
  }
  else
  {
    v10 = [[NPSDomainAccessorInternal alloc] initWithPairingID:a1[4] pairingDataStore:a1[6] domain:a1[5]];
    uint64_t v11 = *(void *)(a1[7] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      int v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", *(void *)(*(void *)(a1[7] + 8) + 40), a1[5], 0);
      [(id)internalAccessors setObject:v3 forKey:a1[4]];
      id v13 = *(void **)(*(void *)(a1[7] + 8) + 40);
    }
    else
    {
      id v13 = 0;
      int v3 = 0;
    }
    id v17 = (id)[v13 createNanoSettingsDirectory];
  }
}

void __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) filePresenter];

  if (!v2)
  {
    int v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    [v3 setHasReadFromDisk:0];
  }
}

+ (void)decrementInternalAccessorReferenceCount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = internalAccessorsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke;
  block[3] = &unk_1E6217C50;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

uint64_t __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 referenceCounter];
  uint64_t result = [v1 setReferenceCounter:v2 - 1];
  if (!v2) {
    __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke_cold_1();
  }
  return result;
}

- (void)invalidatePresenter
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NPSDomainAccessorInternal_invalidatePresenter__block_invoke;
  block[3] = &unk_1E6217C50;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __48__NPSDomainAccessorInternal_invalidatePresenter__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePresenter];
}

- (void)_invalidatePresenter
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_filePresenter)
  {
    objc_msgSend(MEMORY[0x1E4F28CA0], "removeFilePresenter:");
    id v3 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      filePresenter = self->_filePresenter;
      int v6 = 134218240;
      id v7 = self;
      __int16 v8 = 2048;
      id v9 = filePresenter;
      _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self:(%p); Unregisted file presenter: (%p)",
        (uint8_t *)&v6,
        0x16u);
    }
    id v5 = self->_filePresenter;
    self->_filePresenter = 0;
  }
}

+ (void)invalidateAndReleaseUnreferencedAccessors
{
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)internalAccessors;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke;
  v5[3] = &unk_1E6217F98;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  [(id)internalAccessors removeObjectsForKeys:v4];
}

void __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke_2;
  v10[3] = &unk_1E6217F70;
  id v8 = v7;
  id v11 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  [v6 removeObjectsForKeys:v8];
  uint64_t v9 = [v6 count];

  if (!v9) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (![v5 referenceCounter])
  {
    [v5 invalidatePresenter];
    [*(id *)(a1 + 32) addObject:v6];
  }
}

+ (id)urlForDomain:(id)a3 pairingDataStore:(id)a4
{
  if (a3)
  {
    id v5 = NSString;
    id v6 = a4;
    id v7 = [v5 stringWithFormat:@"NanoPreferencesSync/NanoDomains/%@", a3];
    id v8 = [v6 stringByAppendingPathComponent:v7];
  }
  else
  {
    id v7 = a4;
    id v8 = [v7 stringByAppendingPathComponent:@"NanoPreferencesSync/NanoDomains/"];
  }

  uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:a3 == 0];

  return v9;
}

- (NPSDomainAccessorInternal)initWithPairingID:(id)a3 pairingDataStore:(id)a4 domain:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([(id)objc_opt_class() domainIsValid:v11] & 1) == 0) {
    -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]();
  }
  if (!v9) {
    -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]();
  }
  if (!v10) {
    -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]();
  }
  v30.receiver = self;
  v30.super_class = (Class)NPSDomainAccessorInternal;
  id v12 = [(NPSDomainAccessorInternal *)&v30 init];
  if (v12)
  {
    id v13 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v32 = v12;
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v11;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_1BA426000, v13, OS_LOG_TYPE_DEFAULT, "self: (%p); pairingID: (%@); domain: (%@); pairingDataStore: (%@)",
        buf,
        0x2Au);
    }
    objc_storeStrong((id *)&v12->_domain, a5);
    objc_storeStrong((id *)&v12->_pairingID, a3);
    v12->_hasReadFromDisk = 0;
    objc_storeStrong((id *)&v12->_pairingStorePath, a4);
    v12->_nanoSettingsDirectoryExists = 0;
    v12->_referenceCounter = 1;
    uint64_t v14 = [(id)objc_opt_class() urlForDomain:v11 pairingDataStore:v10];
    domainURL = v12->_domainURL;
    v12->_domainURL = (NSURL *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v17 = NSString;
    id v18 = [v9 UUIDString];
    id v19 = [v17 stringWithFormat:@"com.apple.nanoprefsync.frmrk.internalAccessor.int.%@.%@", v18, v11];
    id v20 = (const char *)[v19 UTF8String];

    dispatch_queue_t v21 = dispatch_queue_create(v20, v16);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = NSString;
    v24 = [v9 UUIDString];
    id v25 = [v23 stringWithFormat:@"com.apple.nanoprefsync.frmrk.internalAccessor.ext.%@.%@", v24, v11];
    id v26 = (const char *)[v25 UTF8String];

    dispatch_queue_t v27 = dispatch_queue_create(v26, 0);
    externalQueue = v12->_externalQueue;
    v12->_externalQueue = (OS_dispatch_queue *)v27;
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self:(%p)", buf, 0xCu);
  }
  [(NPSDomainAccessorInternal *)self _invalidatePresenter];
  v4.receiver = self;
  v4.super_class = (Class)NPSDomainAccessorInternal;
  [(NPSDomainAccessorInternal *)&v4 dealloc];
}

+ (BOOL)valueIsValid:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v6 = nps_domain_accessor_log;
    BOOL v4 = 0;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1BA426000, v6, OS_LOG_TYPE_DEFAULT, "Invalid type: (%@)", (uint8_t *)&v7, 0xCu);
      BOOL v4 = 0;
    }
  }

  return v4;
}

+ (id)cfTypeNameForCFPropertyListRef:(void *)a3
{
  if (!a3) {
    return @"n/a/";
  }
  CFTypeID v3 = CFGetTypeID(a3);
  if (v3 == CFDataGetTypeID()) {
    return @"CFDataRef";
  }
  if (v3 == CFStringGetTypeID()) {
    return @"CFStringRef";
  }
  if (v3 == CFArrayGetTypeID()) {
    return @"CFArrayRef";
  }
  if (v3 == CFDictionaryGetTypeID()) {
    return @"CFDictionaryRef";
  }
  if (v3 == CFDateGetTypeID()) {
    return @"CFDateRef";
  }
  if (v3 == CFBooleanGetTypeID()) {
    return @"CFBooleanRef";
  }
  if (v3 == CFNumberGetTypeID()) {
    return @"CFNumberRef";
  }
  return @"unknown";
}

+ (void)mergeDirtyKeys:(id)a3 fromDictionary:(id)a4 toDictionary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__NPSDomainAccessorInternal_mergeDirtyKeys_fromDictionary_toDictionary___block_invoke;
  v11[3] = &unk_1E6217FC0;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [a3 enumerateObjectsUsingBlock:v11];
}

void __72__NPSDomainAccessorInternal_mergeDirtyKeys_fromDictionary_toDictionary___block_invoke(uint64_t a1, void *a2)
{
  CFTypeID v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = *(void **)(a1 + 40);
  id v7 = (id)v5;
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:v4];
  }
  else {
    [v6 removeObjectForKey:v4];
  }
}

- (id)copyKeyList
{
  CFTypeID v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1BA432E2F, buf, 2u);
  }
  *(void *)buf = 0;
  id v9 = buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NPSDomainAccessorInternal_copyKeyList__block_invoke;
  v7[3] = &unk_1E6217C78;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(internalQueue, v7);
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:*((void *)v9 + 5)];
  _Block_object_dispose(buf, 8);

  return v5;
}

uint64_t __40__NPSDomainAccessorInternal_copyKeyList__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _copyKeyList];
  return MEMORY[0x1F41817F8]();
}

- (id)_copyKeyList
{
  if (!self->_hasReadFromDisk) {
    id v3 = [(NPSDomainAccessorInternal *)self _synchronizeReadOnly:1];
  }
  [(NSMutableDictionary *)self->_map allKeys];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)copyDomainListForPairingDataStore:(id)a3
{
  id v3 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  uint64_t v5 = +[NPSDomainAccessorInternal urlForDomain:0 pairingDataStore:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__NPSDomainAccessorInternal_copyDomainListForPairingDataStore___block_invoke;
  v9[3] = &unk_1E6217FE8;
  v9[4] = &v11;
  v9[5] = v17;
  id v10 = 0;
  [v4 coordinateReadingItemAtURL:v5 options:1 error:&v10 byAccessor:v9];
  id v6 = v10;
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v12[5]];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v17, 8);

  return v7;
}

void __63__NPSDomainAccessorInternal_copyDomainListForPairingDataStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a2;
  uint64_t v5 = [v3 defaultManager];
  id v6 = [v4 path];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v5 contentsOfDirectoryAtPath:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)synchronize
{
  id v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1BA432E2F, buf, 2u);
  }
  *(void *)buf = 0;
  uint64_t v9 = buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NPSDomainAccessorInternal_synchronize__block_invoke;
  v7[3] = &unk_1E6217C78;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(internalQueue, v7);
  id v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

uint64_t __40__NPSDomainAccessorInternal_synchronize__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _synchronizeReadOnly:0];
  return MEMORY[0x1F41817F8]();
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = (void *)MEMORY[0x1BA9EB780](v4);
    *(_DWORD *)buf = 134218240;
    id v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1BA426000, v6, OS_LOG_TYPE_DEFAULT, "self: (%p); completionHandler: (%p)", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6218010;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(internalQueue, v10);
}

void __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _synchronizeReadOnly:0];
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E6217CA0;
    id v7 = v3;
    id v6 = v2;
    dispatch_async(v4, v5);
  }
}

uint64_t __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_synchronizeReadOnly:(BOOL)a3
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_ERROR)) {
      -[NPSDomainAccessorInternal _synchronizeReadOnly:](v5);
    }
    id v6 = (void *)nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_ERROR)) {
      -[NPSDomainAccessorInternal _synchronizeReadOnly:](v6);
    }
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  BOOL v7 = !a3 && self->_dirtyKeysForWriting != 0;
  if (self->_hasReadFromDisk && (filePresenter = self->_filePresenter) != 0)
  {
    char v9 = ![(NPSDomainAccessorFilePresenter *)filePresenter isCurrent];
    if ((v9 & 1) == 0 && !v7)
    {
      id v10 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    char v9 = 1;
  }
  id v11 = self->_filePresenter;
  if (!v11) {
    id v11 = [[NPSDomainAccessorFilePresenter alloc] initWithDelegate:self domainURL:self->_domainURL];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__NPSDomainAccessorInternal__synchronizeReadOnly___block_invoke;
  v16[3] = &unk_1E6218038;
  void v16[4] = self;
  id v12 = v11;
  char v19 = v9;
  BOOL v20 = v7;
  id v17 = v12;
  id v18 = &v21;
  uint64_t v13 = [(NPSDomainAccessorFilePresenter *)v12 synchronizeForReadingOnly:!v7 handler:v16];
  __int16 v14 = (void *)v22[5];
  v22[5] = v13;

  id v10 = (id)v22[5];
LABEL_18:
  _Block_object_dispose(&v21, 8);

  return v10;
}

BOOL __50__NPSDomainAccessorInternal__synchronizeReadOnly___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!applicationEnteredBackground && !*(void *)(*(void *)(a1 + 32) + 88))
  {
    [MEMORY[0x1E4F28CA0] addFilePresenter:*(void *)(a1 + 40)];
    id v6 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v15 = 134218240;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1BA426000, v6, OS_LOG_TYPE_DEFAULT, "self: (%p); Registered file presenter: (%p)",
        (uint8_t *)&v15,
        0x16u);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  }
  if (*(unsigned char *)(a1 + 57))
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = a3 ^ 1u;
    }
    uint64_t v10 = [*(id *)(a1 + 32) canSynchronizeForWritingURL:v5 readFirst:v9];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) canSynchronizeForReadingURL:v5];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) == 0;
  return v13;
}

- (id)objectForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1BA426000, v5, OS_LOG_TYPE_DEFAULT, "key: (%@)", (uint8_t *)&buf, 0xCu);
  }
  if (!v4)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    id v12 = [NSString stringWithFormat:@"key: (%@)", 0];
    id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  BOOL v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NPSDomainAccessorInternal_objectForKey___block_invoke;
  block[3] = &unk_1E6218060;
  id v15 = v4;
  p_long long buf = &buf;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(internalQueue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

uint64_t __42__NPSDomainAccessorInternal_objectForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _objectForKey:*(void *)(a1 + 40) error:0];
  return MEMORY[0x1F41817F8]();
}

- (void)objectForKey:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)MEMORY[0x1BA9EB780](v7);
    *(_DWORD *)long long buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2048;
    dispatch_queue_t v27 = v10;
    _os_log_impl(&dword_1BA426000, v9, OS_LOG_TYPE_DEFAULT, "key: (%@); completionHandler: (%p)", buf, 0x16u);
  }
  if (!v6 || !v7)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    __int16 v17 = NSString;
    uint64_t v18 = (void *)MEMORY[0x1BA9EB780](v7);
    uint64_t v19 = [v17 stringWithFormat:@"nil key (%@) or completion handler (%p)", v6, v18];
    id v20 = [v15 exceptionWithName:v16 reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
  uint64_t v11 = (void *)[v6 copy];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke;
  block[3] = &unk_1E6218088;
  void block[4] = self;
  id v22 = v11;
  id v23 = v7;
  id v13 = v7;
  id v14 = v11;
  dispatch_async(internalQueue, block);
}

void __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v14 = 0;
  id v4 = [v2 _objectForKey:v3 error:&v14];
  id v5 = v14;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke_2;
  v10[3] = &unk_1E6217CF0;
  id v7 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = v7;
  id v11 = v4;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

uint64_t __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_objectForKey:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_hasReadFromDisk
    || ([(NPSDomainAccessorInternal *)self _synchronizeReadOnly:1],
        (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = [(NSMutableDictionary *)self->_map objectForKeyedSubscript:v6];
    id v8 = (void *)nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      uint64_t v10 = [(id)objc_opt_class() cfTypeNameForCFPropertyListRef:v7];
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1BA426000, v9, OS_LOG_TYPE_DEFAULT, "key: (%@); value type: (%@); value: (%@)",
        (uint8_t *)&v14,
        0x20u);
    }
  }
  else
  {
    id v12 = v11;
    if (a4) {
      *a4 = v11;
    }

    id v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[NPSDomainAccessorInternal setObject:forKey:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1BA426000, v8, OS_LOG_TYPE_DEFAULT, "%s: value : %@; key: %@", (uint8_t *)&v9, 0x20u);
  }
  [(NPSDomainAccessorInternal *)self setObject:v6 forKey:v7 completionHandler:0];
}

- (void)setObject:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    __int16 v13 = [(id)objc_opt_class() cfTypeNameForCFPropertyListRef:v8];
    id v14 = (void *)MEMORY[0x1BA9EB780](v10);
    *(_DWORD *)long long buf = 138413058;
    id v37 = v9;
    __int16 v38 = 2112;
    uint64_t v39 = v13;
    __int16 v40 = 2112;
    id v41 = v8;
    __int16 v42 = 2048;
    v43 = v14;
    _os_log_impl(&dword_1BA426000, v12, OS_LOG_TYPE_DEFAULT, "key: (%@); value type: (%@): value: (%@); completionHandler: (%p)",
      buf,
      0x2Au);
  }
  if (!v9 || ([(id)objc_opt_class() valueIsValid:v8] & 1) == 0)
  {
    id v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
    dispatch_queue_t v27 = [NSString stringWithFormat:@"nil or invalid key (%@) or value (%@)", v9, v8];
    id v28 = [v25 exceptionWithName:v26 reason:v27 userInfo:0];

    objc_exception_throw(v28);
  }
  uint64_t v15 = (void *)[v9 copy];
  __int16 v16 = (void *)MEMORY[0x1BA9EB5C0]();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], v8, 0);
  internalQueue = self->_internalQueue;
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke;
    block[3] = &unk_1E62180B0;
    uint64_t v19 = &v33;
    void block[4] = self;
    __int16 v33 = DeepCopy;
    uint64_t v20 = &v34;
    id v34 = v15;
    id v35 = v10;
    id v21 = v15;
    id v22 = DeepCopy;
    dispatch_async(internalQueue, block);
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_3;
    v29[3] = &unk_1E62180D8;
    uint64_t v19 = &v30;
    v29[4] = self;
    objc_super v30 = DeepCopy;
    uint64_t v20 = &v31;
    v31 = v15;
    id v23 = v15;
    id v24 = DeepCopy;
    dispatch_sync(internalQueue, v29);
  }
}

void __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_2;
    block[3] = &unk_1E6217D40;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  unint64_t v14 = (unint64_t)a3;
  id v6 = a4;
  if (self->_hasReadFromDisk && self->_filePresenter
    || [(NSMutableSet *)self->_dirtyKeysForWriting containsObject:v6])
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_map objectForKeyedSubscript:v6];
    if (!(v14 | v7) || ([(id)v7 isEqual:v14] & 1) != 0)
    {

      goto LABEL_15;
    }
  }
  dirtyKeysForWriting = self->_dirtyKeysForWriting;
  if (!dirtyKeysForWriting)
  {
    id v9 = (NSMutableSet *)objc_opt_new();
    id v10 = self->_dirtyKeysForWriting;
    self->_dirtyKeysForWriting = v9;

    dirtyKeysForWriting = self->_dirtyKeysForWriting;
  }
  [(NSMutableSet *)dirtyKeysForWriting addObject:v6];
  map = self->_map;
  if (v14)
  {
    if (!map)
    {
      id v12 = (NSMutableDictionary *)objc_opt_new();
      __int16 v13 = self->_map;
      self->_map = v12;

      map = self->_map;
    }
    [(NSMutableDictionary *)map setObject:v14 forKeyedSubscript:v6];
  }
  else
  {
    [(NSMutableDictionary *)map removeObjectForKey:v6];
  }
LABEL_15:
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)stringForKey:(id)a3
{
  uint64_t v3 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  id v4 = +[NPSDomainAccessorUtils stringForObject:v3];

  return v4;
}

- (id)arrayForKey:(id)a3
{
  uint64_t v3 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  id v4 = +[NPSDomainAccessorUtils arrayForObject:v3];

  return v4;
}

- (id)dictionaryForKey:(id)a3
{
  uint64_t v3 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  id v4 = +[NPSDomainAccessorUtils dictionaryForObject:v3];

  return v4;
}

- (id)dataForKey:(id)a3
{
  uint64_t v3 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  id v4 = +[NPSDomainAccessorUtils dataForObject:v3];

  return v4;
}

- (id)stringArrayForKey:(id)a3
{
  uint64_t v3 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  id v4 = +[NPSDomainAccessorUtils stringArrayForObject:v3];

  return v4;
}

- (int64_t)integerForKey:(id)a3
{
  return [(NPSDomainAccessorInternal *)self integerForKey:a3 keyExistsAndHasValidFormat:0];
}

- (int64_t)longForKey:(id)a3
{
  return [(NPSDomainAccessorInternal *)self longForKey:a3 keyExistsAndHasValidFormat:0];
}

- (float)floatForKey:(id)a3
{
  [(NPSDomainAccessorInternal *)self floatForKey:a3 keyExistsAndHasValidFormat:0];
  return result;
}

- (double)doubleForKey:(id)a3
{
  [(NPSDomainAccessorInternal *)self doubleForKey:a3 keyExistsAndHasValidFormat:0];
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return [(NPSDomainAccessorInternal *)self BOOLForKey:a3 keyExistsAndHasValidFormat:0];
}

- (int64_t)integerForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v5 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  int64_t v6 = +[NPSDomainAccessorUtils integerForObject:v5 existsAndHasValidFormat:a4];

  return v6;
}

- (int64_t)longForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v5 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  int64_t v6 = +[NPSDomainAccessorUtils longForObject:v5 existsAndHasValidFormat:a4];

  return v6;
}

- (float)floatForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v5 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  +[NPSDomainAccessorUtils floatForObject:v5 existsAndHasValidFormat:a4];
  float v7 = v6;

  return v7;
}

- (double)doubleForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v5 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  +[NPSDomainAccessorUtils doubleForObject:v5 existsAndHasValidFormat:a4];
  double v7 = v6;

  return v7;
}

- (BOOL)BOOLForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v5 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  LOBYTE(a4) = +[NPSDomainAccessorUtils BOOLForObject:v5 existsAndHasValidFormat:a4];

  return (char)a4;
}

- (id)URLForKey:(id)a3
{
  uint64_t v3 = [(NPSDomainAccessorInternal *)self objectForKey:a3];
  id v4 = +[NPSDomainAccessorUtils URLForObject:v3];

  return v4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(NPSDomainAccessorInternal *)self setObject:v8 forKey:v7];
}

- (void)setLong:(int64_t)a3 forKey:(id)a4
{
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(NPSDomainAccessorInternal *)self setObject:v8 forKey:v7];
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  double v6 = NSNumber;
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(NPSDomainAccessorInternal *)self setObject:v9 forKey:v7];
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(NPSDomainAccessorInternal *)self setObject:v8 forKey:v7];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(NPSDomainAccessorInternal *)self setObject:v8 forKey:v7];
}

- (void)setURL:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = +[NPSDomainAccessorUtils objectForURL:a3];
  [(NPSDomainAccessorInternal *)self setObject:v7 forKey:v6];
}

- (id)dictionaryRepresentation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  __int16 v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NPSDomainAccessorInternal_dictionaryRepresentation__block_invoke;
  v7[3] = &unk_1E6217C78;
  v7[4] = self;
  v7[5] = &buf;
  dispatch_sync(internalQueue, v7);
  id v5 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v5;
}

uint64_t __53__NPSDomainAccessorInternal_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _dictionaryRepresentation];
  return MEMORY[0x1F41817F8]();
}

- (id)_dictionaryRepresentation
{
  if (!self->_hasReadFromDisk) {
    id v3 = [(NPSDomainAccessorInternal *)self _synchronizeReadOnly:1];
  }
  map = self->_map;
  return map;
}

- (id)canSynchronizeForReadingURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v13 = self;
    _os_log_impl(&dword_1BA426000, v5, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  id v11 = 0;
  id v6 = [(id)objc_opt_class() readDomainURL:v4 withError:&v11];
  id v7 = v11;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    if (self->_dirtyKeysForWriting) {
      [(id)objc_opt_class() mergeDirtyKeys:self->_dirtyKeysForWriting fromDictionary:self->_map toDictionary:v6];
    }
    objc_storeStrong((id *)&self->_map, v6);
    self->_hasReadFromDisk = 1;
  }

  return v8;
}

- (id)canSynchronizeForWritingURL:(id)a3 readFirst:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v20 = "-[NPSDomainAccessorInternal canSynchronizeForWritingURL:readFirst:]";
    _os_log_impl(&dword_1BA426000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (v4)
  {
    id v18 = 0;
    id v8 = [(id)objc_opt_class() readDomainURL:v6 withError:&v18];
    id v9 = (NSString *)v18;
    if (v9)
    {
      id v10 = v9;
      id v11 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v20 = "-[NPSDomainAccessorInternal canSynchronizeForWritingURL:readFirst:]";
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_1BA426000, v11, OS_LOG_TYPE_DEFAULT, "%s: Read First error %@", buf, 0x16u);
      }
      id v12 = v10;

      goto LABEL_13;
    }
    [(id)objc_opt_class() mergeDirtyKeys:self->_dirtyKeysForWriting fromDictionary:self->_map toDictionary:v8];
    map = self->_map;
    self->_map = v8;

    self->_hasReadFromDisk = 1;
  }
  id v12 = [(id)objc_opt_class() writeDomain:self->_map toURL:v6];
  if (v12)
  {
    uint64_t v14 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)long long buf = 136315650;
      uint64_t v20 = "-[NPSDomainAccessorInternal canSynchronizeForWritingURL:readFirst:]";
      __int16 v21 = 2112;
      id v22 = domain;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_1BA426000, v14, OS_LOG_TYPE_DEFAULT, "%s: Error saving domain %@. Error: %@", buf, 0x20u);
    }
  }
  else
  {
    dirtyKeysForWriting = self->_dirtyKeysForWriting;
    self->_dirtyKeysForWriting = 0;
  }
LABEL_13:

  return v12;
}

- (id)createNanoSettingsDirectory
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (self->_nanoSettingsDirectoryExists)
  {
    id v2 = 0;
    goto LABEL_15;
  }
  BOOL v4 = [(NSString *)self->_pairingStorePath stringByAppendingPathComponent:@"NanoPreferencesSync/NanoDomains/"];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v5 fileExistsAtPath:v4] & 1) == 0)
  {
    id v6 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1BA426000, v6, OS_LOG_TYPE_DEFAULT, "Creating NanoDomains directory (%@) as it doesn't exist", buf, 0xCu);
    }
    uint64_t v17 = *MEMORY[0x1E4F28370];
    v18[0] = *MEMORY[0x1E4F28378];
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v12 = 0;
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v7 error:&v12];
    id v2 = v12;

    if (!v2) {
      goto LABEL_10;
    }
    id v8 = [v2 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v9 = [v2 code];

      if (v9 == 516)
      {
LABEL_10:
        self->_nanoSettingsDirectoryExists = 1;
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v10 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v14 = v4;
      __int16 v15 = 2112;
      id v16 = v2;
      _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create the NanoDomains directory (%@) with error: (%@)", buf, 0x16u);
    }
    goto LABEL_14;
  }
  id v2 = 0;
LABEL_14:

LABEL_15:
  return v2;
}

+ (id)readDomainURL:(id)a3 withError:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    id v25 = a1;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_1BA426000, v7, OS_LOG_TYPE_DEFAULT, "self: (%p); domainURL: (%@)", buf, 0x16u);
  }
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = [v6 path];
  id v10 = [v8 attributesOfItemAtPath:v9 error:0];

  if (v10)
  {
    id v11 = [v10 objectForKey:*MEMORY[0x1E4F28390]];
    if ([v11 integerValue] > 102400)
    {
      id v12 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_FAULT)) {
        +[NPSDomainAccessorInternal readDomainURL:withError:]((uint64_t)v6, (uint64_t)v11, v12);
      }
    }
    id v23 = 0;
    uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:2 error:&v23];
    id v14 = v23;
    if (v14)
    {
      id v15 = v14;
      id v16 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v25 = v6;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_impl(&dword_1BA426000, v16, OS_LOG_TYPE_DEFAULT, "Failed to read domain from disk (%@) with error: (%@). Resetting it.", buf, 0x16u);
      }
      if (a4)
      {
        id v15 = v15;
        uint64_t v17 = 0;
        *a4 = v15;
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      id v22 = 0;
      id v18 = [MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:&v22];
      id v15 = v22;
      uint64_t v17 = (void *)[v18 mutableCopy];

      if (v15)
      {
        uint64_t v19 = nps_domain_accessor_log;
        if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412802;
          id v25 = v13;
          __int16 v26 = 2112;
          id v27 = v6;
          __int16 v28 = 2112;
          id v29 = v15;
          _os_log_impl(&dword_1BA426000, v19, OS_LOG_TYPE_DEFAULT, "Failed to un-serialize domain (%@) at path (%@) with error: (%@). Resetting it.", buf, 0x20u);
        }
        uint64_t v20 = objc_opt_new();

        uint64_t v17 = (void *)v20;
      }
    }
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }

  return v17;
}

+ (id)writeDomain:(id)a3 toURL:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315906;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    __int16 v33 = 2048;
    id v34 = a1;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_1BA426000, v8, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); domainDict: (%@); url: (%@)", buf, 0x2Au);
  }
  uint64_t v9 = [v6 count];
  id v10 = nps_domain_accessor_log;
  BOOL v11 = os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 136315138;
      v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
      _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "%s: Deleting domain.", buf, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v28 = 0;
    [v12 removeItemAtURL:v7 error:&v28];
    id v17 = v28;
    id v18 = v17;
    if (!v17) {
      goto LABEL_26;
    }
    uint64_t v19 = [v17 domain];
    if ([v19 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v20 = [v18 code];

      if (v20 == 4)
      {

        id v18 = 0;
        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v26 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v18;
      id v23 = "%s: Failed to delete domain from disk (%@) with error: (%@).";
      id v24 = v26;
      uint32_t v25 = 32;
LABEL_25:
      _os_log_impl(&dword_1BA426000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
LABEL_26:

    id v16 = v18;
    goto LABEL_27;
  }
  if (v11)
  {
    *(_DWORD *)long long buf = 136315138;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "%s: Updating domain.", buf, 0xCu);
  }
  id v30 = 0;
  id v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v30];
  id v13 = v30;
  if (!v13)
  {
    if ((unint64_t)[v12 length] > 0x19000)
    {
      __int16 v21 = (void *)nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_FAULT)) {
        +[NPSDomainAccessorInternal writeDomain:toURL:]((uint64_t)v7, v21, v12);
      }
    }
    id v29 = 0;
    [v12 writeToURL:v7 options:268435457 error:&v29];
    id v18 = v29;
    if (!v18) {
      goto LABEL_26;
    }
    uint64_t v22 = nps_domain_accessor_log;
    if (!os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)long long buf = 136315906;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v18;
    id v23 = "%s: Failed to write to disk (%@) the domain (%@) with error: (%@).";
    id v24 = v22;
    uint32_t v25 = 42;
    goto LABEL_25;
  }
  id v14 = v13;
  id v15 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315906;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_1BA426000, v15, OS_LOG_TYPE_DEFAULT, "%s: Failed to serialize domain (%@) with error: (%@). Not persisting it to disk (%@).", buf, 0x2Au);
  }
  id v16 = v14;

LABEL_27:
  return v16;
}

- (void)filePresenterDidBecomeNonCurrent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v9 = self;
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl(&dword_1BA426000, v5, OS_LOG_TYPE_DEFAULT, "self: (%p); filePresenter: (%p)", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NPSDomainAccessorInternal_filePresenterDidBecomeNonCurrent___block_invoke;
  block[3] = &unk_1E6217C50;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __62__NPSDomainAccessorInternal_filePresenterDidBecomeNonCurrent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) isCurrent];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _invalidatePresenter];
  }
  return result;
}

- (unint64_t)domainSize
{
  id v2 = [(NSURL *)self->_domainURL absoluteString];
  unint64_t v3 = +[NPSPrefPlistSizeUtil sizeForPlistAtPath:v2];

  return v3;
}

- (BOOL)requiresDeviceUnlockedSinceBoot
{
  id v2 = [(NSURL *)self->_domainURL absoluteString];
  BOOL v3 = +[NPSPrefPlistProtectedUtil isPlistProtectedAtPath:v2];

  return v3;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (NSString)pairingStorePath
{
  return self->_pairingStorePath;
}

- (void)setPairingStorePath:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSURL)domainURL
{
  return self->_domainURL;
}

- (void)setDomainURL:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (void)setExternalQueue:(id)a3
{
}

- (unint64_t)referenceCounter
{
  return self->_referenceCounter;
}

- (void)setReferenceCounter:(unint64_t)a3
{
  self->_referenceCounter = a3;
}

- (BOOL)nanoSettingsDirectoryExists
{
  return self->_nanoSettingsDirectoryExists;
}

- (void)setNanoSettingsDirectoryExists:(BOOL)a3
{
  self->_nanoSettingsDirectoryExists = a3;
}

- (BOOL)hasReadFromDisk
{
  return self->_hasReadFromDisk;
}

- (void)setHasReadFromDisk:(BOOL)a3
{
  self->_hasReadFromDisk = a3;
}

- (NSMutableSet)dirtyKeysForWriting
{
  return self->_dirtyKeysForWriting;
}

- (void)setDirtyKeysForWriting:(id)a3
{
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
}

- (NPSDomainAccessorFilePresenter)filePresenter
{
  return self->_filePresenter;
}

- (void)setFilePresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePresenter, 0);
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_dirtyKeysForWriting, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_domainURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_pairingStorePath, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
}

void __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke_cold_1()
{
}

- (void)initWithPairingID:pairingDataStore:domain:.cold.1()
{
}

- (void)initWithPairingID:pairingDataStore:domain:.cold.2()
{
}

- (void)initWithPairingID:pairingDataStore:domain:.cold.3()
{
}

- (void)_synchronizeReadOnly:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F29060];
  id v2 = a1;
  BOOL v3 = [v1 callStackSymbols];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1BA426000, v2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);
}

- (void)_synchronizeReadOnly:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BA426000, log, OS_LOG_TYPE_ERROR, "ERROR: NPSDomainAccessor init() and synchronize called on main thread! his could result in thread getting blocked indefinitely.", v1, 2u);
}

+ (void)readDomainURL:(os_log_t)log withError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  __int16 v7 = 2112;
  id v8 = &unk_1F13F02D8;
  _os_log_fault_impl(&dword_1BA426000, log, OS_LOG_TYPE_FAULT, "Plist for %{public}@ is too large (%@) > (%@)", (uint8_t *)&v3, 0x20u);
}

+ (void)writeDomain:(void *)a3 toURL:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  __int16 v5 = NSNumber;
  uint64_t v6 = a2;
  __int16 v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "length"));
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  id v13 = &unk_1F13F02D8;
  _os_log_fault_impl(&dword_1BA426000, v6, OS_LOG_TYPE_FAULT, "Plist for %{public}@ is too large (%@) > (%@)", (uint8_t *)&v8, 0x20u);
}

@end