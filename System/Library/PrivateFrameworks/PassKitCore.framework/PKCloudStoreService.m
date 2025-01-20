@interface PKCloudStoreService
+ (id)sharedInstance;
- (PKCloudStoreService)init;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4;
- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5;
- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)changeHistoryForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4;
- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4;
- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4;
- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4;
- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 completion:(id)a5;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5;
- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3;
- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4;
- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7;
- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5;
- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4;
- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4;
- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6;
@end

@implementation PKCloudStoreService

- (PKCloudStoreService)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKCloudStoreService;
  v2 = [(PKCloudStoreService *)&v8 init];
  if (v2)
  {
    v3 = [PKXPCService alloc];
    v4 = PDCloudStoreServiceInterface();
    uint64_t v5 = [(PKXPCService *)v3 initWithMachServiceName:@"com.apple.passd.cloud-store" remoteObjectInterface:v4 exportedObjectInterface:0 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PKCloudStoreService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_280 != -1) {
    dispatch_once(&_MergedGlobals_280, block);
  }
  v2 = (void *)qword_1EB4034A8;
  return v2;
}

void __37__PKCloudStoreService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB4034A8;
  qword_1EB4034A8 = (uint64_t)v1;
}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  v10 = _Block_copy(aBlock);
  v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_2;
  v13[3] = &unk_1E56DD728;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateCloudStoreWithLocalItemsWithConfigurations:v9 completion:v13];
}

void __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_11;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v10 = __dispatch_async_ar_block_invoke_20;
  v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v24 = a2;
  id v14 = v13;
  aBlock[4] = self;
  id v23 = v14;
  id v15 = a5;
  id v16 = a4;
  SEL v17 = _Block_copy(aBlock);
  id v18 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v17];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_2;
  v20[3] = &unk_1E56F37A8;
  v20[4] = self;
  id v21 = v14;
  id v19 = v14;
  [v18 removeAllItems:a3 inZoneName:v16 containerName:v15 storeLocally:v7 completion:v20];
}

void __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_13;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v23 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  SEL v17 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_2;
  v19[3] = &unk_1E56D8770;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 removeRecordWithRecordName:v15 zoneName:v14 containerName:v13 completion:v19];
}

void __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_15;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  BOOL v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v18 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v17 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_2;
  v14[3] = &unk_1E56F47D8;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 allItemsOfItemType:a3 storeLocally:v5 completion:v14];
}

void __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_17;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_2;
  v16[3] = &unk_1E56F47D8;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 applePayContainerItemsFromDate:v12 toDate:v11 completion:v16];
}

void __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_19;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_19(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v21 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v20 = v12;
  id v13 = a4;
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_2;
  v17[3] = &unk_1E56F47D8;
  v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 itemOfItemTypeFromAllZones:a3 recordName:v13 qualityOfService:a5 completion:v17];
}

void __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_20;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_2;
  v13[3] = &unk_1E56F47D8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 cloudStoreRecordArrayWithConfiguration:v9 completion:v13];
}

void __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_21;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_21(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 completion:(id)a5
{
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v21 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v20 = v12;
  id v13 = a4;
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_2;
  v17[3] = &unk_1E56F4800;
  v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 itemOfItemType:a3 recordName:v13 qualityOfService:a5 completion:v17];
}

void __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_22;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_22(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_2;
  v16[3] = &unk_1E56D8928;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 resetContainerWithIdentifier:v12 zoneNames:v11 completion:v16];
}

void __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_24;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F47D8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 generateRandomTransactionForTransactionSourceIdentifier:v9 completion:v13];
}

void __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_26;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_26(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v21 = v12;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_2;
  v18[3] = &unk_1E56F47D8;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 uploadTransaction:v14 forTransactionSourceIdentifier:v13 includeServerData:v6 completion:v18];
}

void __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_27;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  BOOL v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_27(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_2;
  v16[3] = &unk_1E56D8928;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteZone:v12 containerName:v11 completion:v16];
}

void __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_28;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_2;
  v16[3] = &unk_1E56D8928;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 createZone:v12 containerName:v11 completion:v16];
}

void __59__PKCloudStoreService_createZone_containerName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_29;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_29(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56F47D8;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 populateEvents:v12 forAccountIdentifier:v11 completion:v16];
}

void __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_30;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_30(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F4828;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 simulateCloudStorePushForContainerIdentifier:v9 completion:v13];
}

void __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_31;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_31(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

void __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = dispatch_get_global_queue(0, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  uint64_t v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8770;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 simulatePassProvisioningForPassUniqueIdentifier:v9 completion:v13];
}

void __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_33;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_33(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v13 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke;
  v23[3] = &unk_1E56D8388;
  id v14 = v13;
  id v24 = v14;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(PKCloudStoreService *)self errorHandlerForMethod:a2 completion:v23];
  id v19 = [(PKCloudStoreService *)self _remoteObjectProxyWithErrorHandler:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2;
  v21[3] = &unk_1E56D8928;
  v21[4] = self;
  id v22 = v14;
  id v20 = v14;
  [v19 declineInvitationForRecipientHandle:v17 zoneName:v16 containerName:v15 qualityOfService:a6 completion:v21];
}

uint64_t __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v13 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke;
  v23[3] = &unk_1E56D8388;
  id v14 = v13;
  id v24 = v14;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(PKCloudStoreService *)self errorHandlerForMethod:a2 completion:v23];
  id v19 = [(PKCloudStoreService *)self _remoteObjectProxyWithErrorHandler:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2;
  v21[3] = &unk_1E56D8928;
  v21[4] = self;
  id v22 = v14;
  id v20 = v14;
  [v19 createInvitationForRecipientHandle:v17 zoneName:v16 containerName:v15 qualityOfService:a6 completion:v21];
}

uint64_t __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v21 = v12;
  id v13 = a4;
  id v14 = a3;
  char v15 = _Block_copy(aBlock);
  id v16 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_2;
  v18[3] = &unk_1E56F47D8;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 shareForZoneName:v14 containerName:v13 qualityOfService:a5 completion:v18];
}

void __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_34;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_34(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_2;
  v13[3] = &unk_1E56F4850;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 cloudStoreStatusForContainer:v9 completion:v13];
}

void __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_35;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_35(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

void __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_3;
  v14[3] = &unk_1E56E4828;
  id v10 = *(id *)(a1 + 40);
  char v19 = a3;
  id v15 = v7;
  id v16 = v8;
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v10;
  id v11 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v21 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, block);
}

uint64_t __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40));
  }
  return result;
}

- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_2;
  v13[3] = &unk_1E56D8928;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 setupCloudDatabaseForContainerName:v9 completion:v13];
}

void __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_37;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_37(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 checkTLKsMissingWithCompletion:v10];
}

void __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_38;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 resetApplePayManateeViewWithCompletion:v10];
}

void __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_39;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_39(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_2;
  v13[3] = &unk_1E56F4878;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 diagnosticInfoForContainerWithName:v9 completion:v13];
}

void __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_40;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_40(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_2;
  v13[3] = &unk_1E56F48A0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 diagnosticSnapshotForContainerWithName:v9 completion:v13];
}

void __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_42;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_42(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = _Block_copy(aBlock);
  id v13 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_2;
  v15[3] = &unk_1E56D8388;
  id v16 = v10;
  id v14 = v10;
  [v13 performAction:a3 inContainerWithName:v11 completion:v15];
}

void __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_44;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_2;
  v13[3] = &unk_1E56F47D8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 performBackgroundTransactionSyncFromDate:v9 completion:v13];
}

void __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_45;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_45(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8770;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 performBackgroundRecordChangesSyncWithCompletion:v10];
}

void __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_46;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_46(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)changeHistoryForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKCloudStoreService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56DD728;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 changeHistoryForContainerIdentifier:v9 completion:v13];
}

void __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_47;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_20;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_47(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)_remoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxy];
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:a3];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  id v12 = v6;
  SEL v13 = a3;
  aBlock[4] = self;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  id v9 = _Block_copy(v8);

  return v9;
}

void __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke_48;
  v11[3] = &unk_1E56D8428;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v16 = __dispatch_async_ar_block_invoke_20;
  SEL v17 = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v3;
  dispatch_async(v6, &buf);
}

uint64_t __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke_48(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void).cxx_destruct
{
}

@end