@interface NPSDomainAccessor
+ (id)copyDomainList;
+ (id)copyDomainListForPairingID:(id)a3 pairingDataStore:(id)a4;
+ (void)resolveActivePairedDevicePairingID:(id *)a3 pairingDataStore:(id *)a4;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (BOOL)activeDeviceChanged;
- (BOOL)initializedWithActiveDevice;
- (BOOL)requiresDeviceUnlockedSinceBoot;
- (NPSDomainAccessor)initWithDomain:(id)a3;
- (NPSDomainAccessor)initWithDomain:(id)a3 pairedDevice:(id)a4;
- (NPSDomainAccessor)initWithDomain:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5;
- (NPSDomainAccessor)initWithDomain:(id)a3 queue:(id)a4;
- (NPSDomainAccessor)initWithDomain:(id)a3 queue:(id)a4 pairingID:(id)a5 pairingDataStore:(id)a6;
- (NPSDomainAccessor)initWithInternalDomainAccessor:(id)a3 queue:(id)a4;
- (NPSDomainAccessorInternal)internalAccessor;
- (NSString)domain;
- (NSUUID)pairingID;
- (OS_dispatch_queue)externalQueue;
- (OS_dispatch_queue)invalidationQueue;
- (double)doubleForKey:(id)a3;
- (double)doubleForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (float)floatForKey:(id)a3;
- (float)floatForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)copyKeyList;
- (id)dataForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryRepresentation;
- (id)objectForKey:(id)a3;
- (id)queue;
- (id)shouldNotDoWork;
- (id)stringArrayForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)synchronize;
- (int64_t)integerForKey:(id)a3;
- (int64_t)integerForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (int64_t)longForKey:(id)a3;
- (int64_t)longForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4;
- (unint64_t)domainSize;
- (void)dealloc;
- (void)invalidate;
- (void)objectForKey:(id)a3 completionHandler:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setExternalQueue:(id)a3;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setInitializedWithActiveDevice:(BOOL)a3;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setInternalAccessor:(id)a3;
- (void)setInvalidationQueue:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)setURL:(id)a3 forKey:(id)a4;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation NPSDomainAccessor

- (NPSDomainAccessor)initWithDomain:(id)a3 pairedDevice:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F79E10];
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 valueForProperty:v6];
  v10 = [v7 valueForProperty:*MEMORY[0x1E4F79DC8]];

  v11 = [(NPSDomainAccessor *)self initWithDomain:v8 pairingID:v9 pairingDataStore:v10];
  return v11;
}

- (NPSDomainAccessor)initWithDomain:(id)a3 queue:(id)a4 pairingID:(id)a5 pairingDataStore:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136316162;
    v22 = "-[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:]";
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    _os_log_impl(&dword_1BA426000, v14, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@); queue: (%@); pairingID: (%@); pairingDataStore: (%@)",
      (uint8_t *)&v21,
      0x34u);
  }
  BOOL v15 = +[NPSDomainAccessorInternal domainIsValid:v10];
  if (v13 && v12 && v15)
  {
    v16 = +[NPSDomainAccessorInternal internalAccessorForPairingID:v12 pairingDataStore:v13 domain:v10];
    if (v16)
    {
      self = [(NPSDomainAccessor *)self initWithInternalDomainAccessor:v16 queue:v11];
      v17 = self;
    }
    else
    {
      v19 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315138;
        v22 = "-[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:]";
        _os_log_impl(&dword_1BA426000, v19, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor.", (uint8_t *)&v21, 0xCu);
      }
      v17 = 0;
    }
  }
  else
  {
    v18 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      v22 = "-[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:]";
      _os_log_impl(&dword_1BA426000, v18, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor. domain not valid.", (uint8_t *)&v21, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (NPSDomainAccessor)initWithDomain:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  return [(NPSDomainAccessor *)self initWithDomain:a3 queue:0 pairingID:a4 pairingDataStore:a5];
}

void __73__NPSDomainAccessor_resolveActivePairedDevicePairingID_pairingDataStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAccessor, 0);
  objc_storeStrong((id *)&self->_invalidationQueue, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
}

- (NPSDomainAccessor)initWithDomain:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[NPSDomainAccessor initWithDomain:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1BA426000, v5, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@)", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = [(NPSDomainAccessor *)self initWithDomain:v4 queue:0];

  return v6;
}

+ (void)resolveActivePairedDevicePairingID:(id *)a3 pairingDataStore:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v6 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NPSDomainAccessor_resolveActivePairedDevicePairingID_pairingDataStore___block_invoke;
  v11[3] = &unk_1E6217C00;
  v11[4] = &v18;
  v11[5] = &v12;
  [v6 altAccountPairingStorePathPairingID:v11];

  id v7 = (void *)v19[5];
  if (v7 && v13[5])
  {
    if (a3) {
      *a3 = v7;
    }
    if (a4) {
      *a4 = (id) v13[5];
    }
  }
  else
  {
    int v8 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v19[5];
      uint64_t v10 = v13[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_impl(&dword_1BA426000, v8, OS_LOG_TYPE_DEFAULT, "Failed to resolve pairing ID (%@) or data store (%@) for active device", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

- (NPSDomainAccessor)initWithDomain:(id)a3 queue:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v14 = 0;
  id v15 = 0;
  [(id)objc_opt_class() resolveActivePairedDevicePairingID:&v15 pairingDataStore:&v14];
  id v8 = v15;
  id v9 = v14;
  self->_initializedWithActiveDevice = 1;
  uint64_t v10 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v17 = "-[NPSDomainAccessor initWithDomain:queue:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@) pairingID: (%@); pairingDataStore: (%@)",
      buf,
      0x2Au);
  }
  if (v8 && v9)
  {
    self = [(NPSDomainAccessor *)self initWithDomain:v6 queue:v7 pairingID:v8 pairingDataStore:v9];
    id v11 = self;
  }
  else
  {
    uint64_t v12 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[NPSDomainAccessor initWithDomain:queue:]";
      _os_log_impl(&dword_1BA426000, v12, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor. No pairing ID or data store.", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  if (self->_internalAccessor) {
    +[NPSDomainAccessorInternal decrementInternalAccessorReferenceCount:](NPSDomainAccessorInternal, "decrementInternalAccessorReferenceCount:");
  }
  v4.receiver = self;
  v4.super_class = (Class)NPSDomainAccessor;
  [(NPSDomainAccessor *)&v4 dealloc];
}

- (NSString)domain
{
  v2 = [(NPSDomainAccessor *)self internalAccessor];
  v3 = [v2 domain];

  return (NSString *)v3;
}

- (NSUUID)pairingID
{
  v2 = [(NPSDomainAccessor *)self internalAccessor];
  v3 = [v2 pairingID];

  return (NSUUID *)v3;
}

- (id)queue
{
  return self->_externalQueue;
}

- (NPSDomainAccessor)initWithInternalDomainAccessor:(id)a3 queue:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NPSDomainAccessor;
  id v9 = [(NPSDomainAccessor *)&v21 init];
  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v10 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v23 = (const char *)v9;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2048;
    id v27 = v7;
    _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "self: (%p); queue: (%@); internalAccessor: (%p)",
      buf,
      0x20u);
  }
  objc_storeStrong((id *)&v9->_internalAccessor, a3);
  if (v8)
  {
    id v11 = (OS_dispatch_queue *)v8;
    externalQueue = v9->_externalQueue;
    v9->_externalQueue = v11;
  }
  else
  {
    id v13 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
    externalQueue = v9->_externalQueue;
    v9->_externalQueue = v13;
  }

  dispatch_queue_t v15 = dispatch_queue_create("com.apple.nanoprefsync.frmrk.accessor", 0);
  invalidationQueue = v9->_invalidationQueue;
  v9->_invalidationQueue = (OS_dispatch_queue *)v15;

  id v17 = [(NPSDomainAccessor *)v9 shouldNotDoWork];

  if (v17)
  {
    __int16 v18 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[NPSDomainAccessor initWithInternalDomainAccessor:queue:]";
      _os_log_impl(&dword_1BA426000, v18, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor.", buf, 0xCu);
    }
    id v19 = 0;
  }
  else
  {
LABEL_11:
    id v19 = v9;
  }

  return v19;
}

- (BOOL)activeDeviceChanged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  [(id)objc_opt_class() resolveActivePairedDevicePairingID:&v11 pairingDataStore:0];
  id v3 = v11;
  objc_super v4 = (void *)nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    internalAccessor = self->_internalAccessor;
    id v6 = v4;
    id v7 = [(NPSDomainAccessorInternal *)internalAccessor pairingID];
    *(_DWORD *)buf = 136315650;
    id v13 = "-[NPSDomainAccessor activeDeviceChanged]";
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1BA426000, v6, OS_LOG_TYPE_DEFAULT, "%s: Current active pairing ID: %@. Old ID %@.", buf, 0x20u);
  }
  id v8 = [(NPSDomainAccessorInternal *)self->_internalAccessor pairingID];
  char v9 = [v3 isEqual:v8];

  return v9 ^ 1;
}

- (id)shouldNotDoWork
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  invalidationQueue = self->_invalidationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__NPSDomainAccessor_shouldNotDoWork__block_invoke;
  v5[3] = &unk_1E6217C28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(invalidationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__NPSDomainAccessor_shouldNotDoWork__block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8] && [v2 activeDeviceChanged])
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"NPS domain accessor invalid because the active watch has changed- to resolve this specify a device when creating an NPSDomainAccessor";
    objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v5 = [v3 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8) && !NPSShouldRun())
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v25 = @"NPS domain accessor invalid because there are no paired or pairing watches";
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v10 = [v8 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v13 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = *(void **)(*(void *)(a1 + 32) + 32);
    id v15 = v13;
    __int16 v16 = [v14 domain];
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v18 = 136315650;
    id v19 = "-[NPSDomainAccessor shouldNotDoWork]_block_invoke";
    __int16 v20 = 2114;
    objc_super v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    _os_log_impl(&dword_1BA426000, v15, OS_LOG_TYPE_DEFAULT, "%s: domain: %{public}@ error: %{public}@", (uint8_t *)&v18, 0x20u);
  }
}

- (void)invalidate
{
  invalidationQueue = self->_invalidationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__NPSDomainAccessor_invalidate__block_invoke;
  block[3] = &unk_1E6217C50;
  block[4] = self;
  dispatch_sync(invalidationQueue, block);
}

void __31__NPSDomainAccessor_invalidate__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9EB5C0]();
  [*(id *)(*(void *)(a1 + 32) + 32) invalidatePresenter];
}

- (NPSDomainAccessorInternal)internalAccessor
{
  id v3 = [(NPSDomainAccessor *)self shouldNotDoWork];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy_;
    __int16 v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    invalidationQueue = self->_invalidationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__NPSDomainAccessor_internalAccessor__block_invoke;
    v9[3] = &unk_1E6217C78;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(invalidationQueue, v9);
    uint64_t v6 = (void *)v11[5];
    if (!v6)
    {
      id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Accessor is used after being invalidated" userInfo:0];
      objc_exception_throw(v8);
    }
    id v4 = v6;
    _Block_object_dispose(&v10, 8);
  }
  return (NPSDomainAccessorInternal *)v4;
}

void __37__NPSDomainAccessor_internalAccessor__block_invoke(uint64_t a1)
{
}

- (id)synchronize
{
  v2 = [(NPSDomainAccessor *)self internalAccessor];
  id v3 = [v2 synchronize];

  return v3;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_externalQueue;
  uint64_t v6 = [(NPSDomainAccessor *)self shouldNotDoWork];
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke;
    block[3] = &unk_1E6217CA0;
    id v7 = &v15;
    id v15 = v4;
    id v8 = &v14;
    id v14 = v6;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  else
  {
    char v9 = [(NPSDomainAccessor *)self internalAccessor];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E6217CC8;
    id v7 = &v12;
    id v12 = v4;
    id v8 = (id *)&v11;
    uint64_t v11 = v5;
    [v9 synchronizeWithCompletionHandler:v10];
  }
}

uint64_t __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E6217CA0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPSDomainAccessor *)self internalAccessor];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)objectForKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_externalQueue;
  char v9 = [(NPSDomainAccessor *)self shouldNotDoWork];
  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke;
    block[3] = &unk_1E6217CA0;
    uint64_t v10 = &v18;
    id v18 = v7;
    uint64_t v11 = &v17;
    id v17 = v9;
    dispatch_async((dispatch_queue_t)v8, block);
  }
  else
  {
    id v12 = [(NPSDomainAccessor *)self internalAccessor];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6217D18;
    uint64_t v10 = &v15;
    id v15 = v7;
    uint64_t v11 = (id *)&v14;
    id v14 = v8;
    [v12 objectForKey:v6 completionHandler:v13];
  }
}

uint64_t __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_3;
    block[3] = &unk_1E6217CF0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPSDomainAccessor *)self internalAccessor];
  [v8 setObject:v7 forKey:v6];
}

- (void)setObject:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_externalQueue;
  id v12 = [(NPSDomainAccessor *)self shouldNotDoWork];

  if (v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke;
    block[3] = &unk_1E6217D40;
    id v13 = &v21;
    id v21 = v10;
    id v14 = v10;
    dispatch_async((dispatch_queue_t)v11, block);
  }
  else
  {
    id v15 = [(NPSDomainAccessor *)self internalAccessor];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_2;
    v17[3] = &unk_1E6217CA0;
    id v13 = &v19;
    id v19 = v10;
    id v18 = v11;
    id v16 = v10;
    [v15 setObject:v8 forKey:v9 completionHandler:v17];
  }
}

uint64_t __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_3;
    block[3] = &unk_1E6217D40;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  [v5 removeObjectForKey:v4];
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  id v6 = [v5 stringForKey:v4];

  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  id v6 = [v5 arrayForKey:v4];

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  id v6 = [v5 dictionaryForKey:v4];

  return v6;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  id v6 = [v5 dataForKey:v4];

  return v6;
}

- (id)stringArrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  id v6 = [v5 arrayForKey:v4];

  return v6;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  int64_t v6 = [v5 integerForKey:v4];

  return v6;
}

- (int64_t)longForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  int64_t v6 = [v5 longForKey:v4];

  return v6;
}

- (float)floatForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  [v5 floatForKey:v4];
  float v7 = v6;

  return v7;
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  [v5 doubleForKey:v4];
  double v7 = v6;

  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NPSDomainAccessor *)self internalAccessor];
  char v6 = [v5 URLForKey:v4];

  return v6;
}

- (int64_t)integerForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [(NPSDomainAccessor *)self internalAccessor];
  int64_t v8 = [v7 integerForKey:v6 keyExistsAndHasValidFormat:a4];

  return v8;
}

- (int64_t)longForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [(NPSDomainAccessor *)self internalAccessor];
  int64_t v8 = [v7 longForKey:v6 keyExistsAndHasValidFormat:a4];

  return v8;
}

- (float)floatForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [(NPSDomainAccessor *)self internalAccessor];
  [v7 floatForKey:v6 keyExistsAndHasValidFormat:a4];
  float v9 = v8;

  return v9;
}

- (double)doubleForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [(NPSDomainAccessor *)self internalAccessor];
  [v7 doubleForKey:v6 keyExistsAndHasValidFormat:a4];
  double v9 = v8;

  return v9;
}

- (BOOL)BOOLForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [(NPSDomainAccessor *)self internalAccessor];
  LOBYTE(a4) = [v7 BOOLForKey:v6 keyExistsAndHasValidFormat:a4];

  return (char)a4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(NPSDomainAccessor *)self internalAccessor];
  [v7 setInteger:a3 forKey:v6];
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = [(NPSDomainAccessor *)self internalAccessor];
  *(float *)&double v7 = a3;
  [v8 setFloat:v6 forKey:v7];
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(NPSDomainAccessor *)self internalAccessor];
  [v7 setDouble:v6 forKey:a3];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(NPSDomainAccessor *)self internalAccessor];
  [v7 setBool:v4 forKey:v6];
}

- (void)setURL:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPSDomainAccessor *)self internalAccessor];
  [v8 setURL:v7 forKey:v6];
}

- (id)dictionaryRepresentation
{
  v2 = [(NPSDomainAccessor *)self internalAccessor];
  id v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)copyKeyList
{
  v2 = [(NPSDomainAccessor *)self internalAccessor];
  id v3 = (void *)[v2 copyKeyList];

  return v3;
}

+ (id)copyDomainList
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "+[NPSDomainAccessor copyDomainList]";
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (NPSShouldRun())
  {
    id v10 = 0;
    id v11 = 0;
    [(id)objc_opt_class() resolveActivePairedDevicePairingID:&v11 pairingDataStore:&v10];
    id v4 = v11;
    id v5 = v10;
    id v6 = v5;
    id v7 = 0;
    if (v4 && v5) {
      id v7 = (void *)[a1 copyDomainListForPairingID:v4 pairingDataStore:v5];
    }
  }
  else
  {
    id v8 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "+[NPSDomainAccessor copyDomainList]";
      _os_log_impl(&dword_1BA426000, v8, OS_LOG_TYPE_DEFAULT, "%s: No paired watches, returning nil", buf, 0xCu);
    }
    return 0;
  }
  return v7;
}

+ (id)copyDomainListForPairingID:(id)a3 pairingDataStore:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "+[NPSDomainAccessor copyDomainListForPairingID:pairingDataStore:]";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BA426000, v7, OS_LOG_TYPE_DEFAULT, "%s: pairingID: (%@); pairingDataStore: (%@)",
      (uint8_t *)&v11,
      0x20u);
  }
  if (NPSShouldRun())
  {
    id v8 = +[NPSDomainAccessorInternal copyDomainListForPairingDataStore:v6];
  }
  else
  {
    double v9 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "+[NPSDomainAccessor copyDomainListForPairingID:pairingDataStore:]";
      _os_log_impl(&dword_1BA426000, v9, OS_LOG_TYPE_DEFAULT, "%s: No paired watches, returning nil", (uint8_t *)&v11, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)domainSize
{
  v2 = [(NPSDomainAccessor *)self internalAccessor];
  unint64_t v3 = [v2 domainSize];

  return v3;
}

- (BOOL)requiresDeviceUnlockedSinceBoot
{
  v2 = [(NPSDomainAccessor *)self internalAccessor];
  char v3 = [v2 requiresDeviceUnlockedSinceBoot];

  return v3;
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (void)setExternalQueue:(id)a3
{
}

- (OS_dispatch_queue)invalidationQueue
{
  return self->_invalidationQueue;
}

- (void)setInvalidationQueue:(id)a3
{
}

- (void)setInternalAccessor:(id)a3
{
}

- (BOOL)initializedWithActiveDevice
{
  return self->_initializedWithActiveDevice;
}

- (void)setInitializedWithActiveDevice:(BOOL)a3
{
  self->_initializedWithActiveDevice = a3;
}

@end