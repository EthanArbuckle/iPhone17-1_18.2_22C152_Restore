@interface PXSharedLibraryParticipantValidationManager
- (PXSharedLibraryParticipantValidationManager)init;
- (void)requestValidationForPhoneNumbers:(id)a3 emailAddresses:(id)a4 resultHandler:(id)a5;
@end

@implementation PXSharedLibraryParticipantValidationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_queryAddressesToQueries, 0);
}

- (void)requestValidationForPhoneNumbers:(id)a3 emailAddresses:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantValidationManager.m", 42, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DAF280;
  aBlock[4] = self;
  id v15 = v12;
  id v28 = v15;
  v16 = (void (**)(void *, id, id))_Block_copy(aBlock);
  v16[2](v16, v9, v13);
  v16[2](v16, v10, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DD3280;
  id v17 = v11;
  id v26 = v17;
  id v18 = v15;
  id v25 = v18;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if ([v14 count] || objc_msgSend(v13, "count"))
  {
    v19 = (void *)MEMORY[0x1E4F392E8];
    v20 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_4;
    v22[3] = &unk_1E5DB1910;
    v22[4] = self;
    id v23 = v17;
    [v19 queryParticipantsWithEmails:v14 phoneNumbers:v13 photoLibrary:v20 completionHandler:v22];
  }
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2;
  v8[3] = &unk_1E5DC1940;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a2 enumerateObjectsUsingBlock:v8];
}

uint64_t __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void (**)(uint64_t, id, id))(v6 + 16);
  id v8 = a2;
  v7(v6, v8, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_5;
  v10[3] = &unk_1E5DCB200;
  v10[4] = *(void *)(a1 + 32);
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  if (v5)
  {
    id v9 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Error validating participants: %@", buf, 0xCu);
    }
  }
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = [a3 BOOLValue];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_6;
  block[3] = &unk_1E5DD21E8;
  void block[4] = v7;
  id v11 = v5;
  char v12 = v6;
  id v9 = v5;
  dispatch_sync(v8, block);
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 setIsValid:v1];
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5396;
  id v28 = __Block_byref_object_dispose__5397;
  id v29 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_202;
  block[3] = &unk_1E5DCCA20;
  id v23 = &v24;
  void block[4] = v4;
  id v6 = v3;
  id v22 = v6;
  dispatch_sync(v5, block);
  uint64_t v7 = (void *)v25[5];
  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isValid"));
    id v9 = (PXSharedLibraryParticipantValidationQuery *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v9 forKey:v6];
  }
  else
  {
    id v10 = [[PXSharedLibraryParticipantValidationQuery alloc] initWithAddress:v6];
    uint64_t v11 = *(void *)(a1 + 32);
    char v12 = *(NSObject **)(v11 + 16);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2_206;
    id v17 = &unk_1E5DD0F30;
    uint64_t v18 = v11;
    id v13 = v6;
    id v19 = v13;
    id v9 = v10;
    v20 = v9;
    dispatch_sync(v12, &v14);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13, v14, v15, v16, v17, v18);
  }
  _Block_object_dispose(&v24, 8);
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_202(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2_206(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (PXSharedLibraryParticipantValidationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryParticipantValidationManager;
  uint64_t v2 = [(PXSharedLibraryParticipantValidationManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryAddressesToQueries = v2->_queryAddressesToQueries;
    v2->_queryAddressesToQueries = v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("PXSharedLibraryParticipantValidationQueryQueue", v6);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

@end