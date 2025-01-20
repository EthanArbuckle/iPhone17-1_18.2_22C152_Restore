@interface NTKPigmentSyncReceiver
- (BOOL)receivedUpdates;
- (NTKPigmentPersistentStorageController)storageController;
- (NTKPigmentSyncReceiver)init;
- (OS_dispatch_queue)privateQueue;
- (void)finishSyncingForDeviceUUID:(id)a3 success:(BOOL)a4;
- (void)processSyncData:(id)a3 domain:(id)a4 deviceUUID:(id)a5;
- (void)setPrivateQueue:(id)a3;
- (void)setReceivedUpdates:(BOOL)a3;
- (void)setStorageController:(id)a3;
@end

@implementation NTKPigmentSyncReceiver

- (NTKPigmentSyncReceiver)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKPigmentSyncReceiver;
  v2 = [(NTKPigmentSyncReceiver *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentSyncReceiver", v3);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(NTKPigmentPersistentStorageController);
    storageController = v2->_storageController;
    v2->_storageController = v6;
  }
  return v2;
}

- (void)processSyncData:(id)a3 domain:(id)a4 deviceUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  privateQueue = self->_privateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke;
  v15[3] = &unk_1E62C32F8;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(privateQueue, v15);
}

void __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = 1;
    [*(id *)(*(void *)(a1 + 32) + 24) startTransactionForDeviceUUID:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_queue_t v4 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_INFO, "#sync received color sync data for domain: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    int v7 = [*(id *)(a1 + 48) isEqualToString:@"sharedCollections"];
    id v8 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v9 = *(void *)(a1 + 56);
    if (v7) {
      [v8 persistSharedCollectionsData:v9 deviceUUID:*(void *)(a1 + 40)];
    }
    else {
      [v8 persistFacePigmentSetData:v9 domain:*(void *)(a1 + 48) deviceUUID:*(void *)(a1 + 40)];
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke_cold_1(v5);
    }
  }
}

- (void)finishSyncingForDeviceUUID:(id)a3 success:(BOOL)a4
{
  id v5 = a3;
  privateQueue = self->_privateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NTKPigmentSyncReceiver_finishSyncingForDeviceUUID_success___block_invoke;
  v8[3] = &unk_1E62C09C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(privateQueue, v8);
}

uint64_t __61__NTKPigmentSyncReceiver_finishSyncingForDeviceUUID_success___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 24) closeTransactionForDeviceUUID:*(void *)(result + 40)];
    uint64_t v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_queue_t v4 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_INFO, "#sync posting darwin notification color sync completed", v4, 2u);
    }

    result = +[NTKDarwinNotificationCenter postNotification:@"NTKColorSyncDataUpdatedNotificationName"];
    uint64_t v1 = *(void *)(v2 + 32);
  }
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NTKPigmentPersistentStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
}

- (BOOL)receivedUpdates
{
  return self->_receivedUpdates;
}

- (void)setReceivedUpdates:(BOOL)a3
{
  self->_receivedUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageController, 0);

  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "#sync received color sync data with no domain. Ignoring it.", v1, 2u);
}

@end