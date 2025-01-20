@interface VCSyncDataHandler
+ (Class)changeClass;
+ (int)messageType;
- (BOOL)applyChanges:(id)a3 fromSyncService:(id)a4 error:(id *)a5;
- (BOOL)deleteSyncedData:(id *)a3;
- (BOOL)markChangesAsSynced:(id)a3 withSyncService:(id)a4 metadata:(id)a5 error:(id *)a6;
- (BOOL)resetSyncStateForService:(id)a3 error:(id *)a4;
- (NSArray)services;
- (NSHashTable)servicesTable;
- (OS_dispatch_queue)queue;
- (VCSyncDataHandler)init;
- (id)unsyncedChangesForSyncService:(id)a3 metadata:(id *)a4 error:(id *)a5;
- (void)deregisterSyncService:(id)a3;
- (void)registerSyncService:(id)a3;
- (void)requestFullResync;
- (void)requestSync;
@end

@implementation VCSyncDataHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_servicesTable, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSHashTable)servicesTable
{
  return self->_servicesTable;
}

- (void)deregisterSyncService:(id)a3
{
  id v4 = a3;
  v5 = [(VCSyncDataHandler *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__VCSyncDataHandler_deregisterSyncService___block_invoke;
  v7[3] = &unk_1E6541F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __43__VCSyncDataHandler_deregisterSyncService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) servicesTable];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)registerSyncService:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"VCSyncDataHandler.m", 96, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
  }
  id v6 = [(VCSyncDataHandler *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCSyncDataHandler_registerSyncService___block_invoke;
  block[3] = &unk_1E6541F68;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(v6, block);
}

void __41__VCSyncDataHandler_registerSyncService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) servicesTable];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (BOOL)deleteSyncedData:(id *)a3
{
  BOOL result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[VCSyncDataHandler deleteSyncedData:] must be overridden"];
  __break(1u);
  return result;
}

- (BOOL)applyChanges:(id)a3 fromSyncService:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  BOOL result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[VCSyncDataHandler applyChanges:fromSyncService:error:] must be overridden"];
  __break(1u);
  return result;
}

- (BOOL)resetSyncStateForService:(id)a3 error:(id *)a4
{
  id v4 = a3;
  BOOL result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[VCSyncDataHandler resetSyncStateForService:error:] must be overridden"];
  __break(1u);
  return result;
}

- (BOOL)markChangesAsSynced:(id)a3 withSyncService:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[VCSyncDataHandler markChangesAsSynced:withSyncService:metadata:error:] must be overridden"];
  __break(1u);
  return result;
}

- (id)unsyncedChangesForSyncService:(id)a3 metadata:(id *)a4 error:(id *)a5
{
  id v5 = a3;
  id result = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[VCSyncDataHandler unsyncedChangesForSyncService:metadata:error:] must be overridden"];
  __break(1u);
  return result;
}

- (void)requestFullResync
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(VCSyncDataHandler *)self services];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) requestFullResync];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)requestSync
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(VCSyncDataHandler *)self services];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) requestSync];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)services
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(VCSyncDataHandler *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__VCSyncDataHandler_services__block_invoke;
  v6[3] = &unk_1E6542078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __29__VCSyncDataHandler_services__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) servicesTable];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (VCSyncDataHandler)init
{
  v13.receiver = self;
  v13.super_class = (Class)VCSyncDataHandler;
  uint64_t v2 = [(VCSyncDataHandler *)&v13 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    id v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    servicesTable = v2->_servicesTable;
    v2->_servicesTable = (NSHashTable *)v9;

    v11 = v2;
  }

  return v2;
}

+ (Class)changeClass
{
  int v2 = [a1 messageType];
  return (Class)VCSYChangeClassFromMessageType(v2);
}

+ (int)messageType
{
  int result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"+[VCSyncDataHandler messageType] must be overridden"];
  __break(1u);
  return result;
}

@end