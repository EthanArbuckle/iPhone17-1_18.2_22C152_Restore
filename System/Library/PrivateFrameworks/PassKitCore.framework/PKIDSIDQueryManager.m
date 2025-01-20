@interface PKIDSIDQueryManager
- (PKIDSIDQueryManager)init;
- (PKIDSIDQueryManager)initWithQueue:(id)a3;
- (void)checkDeviceSupportForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 capability:(id)a6 completion:(id)a7;
- (void)checkIDSStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 completion:(id)a6;
- (void)reachableDestinationsForDestination:(id)a3 service:(id)a4 completion:(id)a5;
@end

@implementation PKIDSIDQueryManager

- (PKIDSIDQueryManager)init
{
  return 0;
}

- (PKIDSIDQueryManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIDSIDQueryManager;
  v6 = [(PKIDSIDQueryManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)reachableDestinationsForDestination:(id)a3 service:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(PKIDSBatchIDQueryControllerWrapper);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke;
  v15[3] = &unk_1E56E8C88;
  v16 = v11;
  id v17 = v8;
  v15[4] = self;
  v13 = v11;
  id v14 = v8;
  [(PKIDSBatchIDQueryControllerWrapper *)v13 reachableDestinationsForDestination:v10 service:v9 queue:queue completion:v15];
}

void __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 48);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)checkIDSStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = (void *)MEMORY[0x1E4F6AB38];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v11 sharedInstance];
  v16 = PKIDSNormalizedAddress(v14);

  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke;
  v19[3] = &unk_1E56DE098;
  v19[4] = self;
  id v20 = v10;
  id v18 = v10;
  [v15 refreshIDStatusForDestination:v16 service:v13 listenerID:v12 queue:queue completionBlock:v19];
}

void __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a2 == 1;
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke_2;
  v4[3] = &unk_1E56D8680;
  id v5 = *(id *)(a1 + 40);
  BOOL v6 = v2;
  dispatch_async(v3, v4);
}

uint64_t __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)checkDeviceSupportForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 capability:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_87);
  id v17 = [MEMORY[0x1E4F6AB38] sharedInstance];
  queue = self->_queue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_2;
  v22[3] = &unk_1E56E8D00;
  id v23 = v16;
  id v24 = v12;
  v25 = self;
  id v26 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v16;
  [v17 currentRemoteDevicesForDestinations:v21 service:v15 listenerID:v14 queue:queue completionBlock:v22];
}

id __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke(uint64_t a1, void *a2)
{
  return PKIDSNormalizedAddress(a2);
}

void __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_3;
  v10[3] = &unk_1E56E8CD8;
  id v11 = v3;
  v4 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v5 = v3;
  LOBYTE(v4) = objc_msgSend(v4, "pk_containsObjectPassingTest:", v10);
  BOOL v6 = *(NSObject **)(*(void *)(a1 + 48) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_5;
  v7[3] = &unk_1E56D8680;
  id v8 = *(id *)(a1 + 56);
  char v9 = (char)v4;
  dispatch_async(v6, v7);
}

uint64_t __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_4;
  v6[3] = &unk_1E56E8CB0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

BOOL __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 capabilities];
  BOOL v4 = [v3 valueForCapability:*(void *)(a1 + 32)] != 0;

  return v4;
}

uint64_t __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void).cxx_destruct
{
}

@end