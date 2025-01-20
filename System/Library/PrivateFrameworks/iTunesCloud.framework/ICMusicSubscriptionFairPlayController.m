@interface ICMusicSubscriptionFairPlayController
+ (ICMusicSubscriptionFairPlayController)sharedController;
- (id)_init;
- (id)getKeyStatusForAccountUniqueIdentifier:(unint64_t)a3 error:(id *)a4;
- (void)_handleSubscriptionFairPlayKeyStatusChangedDistributedNotification:(id)a3;
- (void)generateSubscriptionBagRequestWithAccountUniqueIdentifier:(unint64_t)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 completionHandler:(id)a6;
- (void)generateSubscriptionLeaseRequestWithAccountUniqueID:(unint64_t)a3 transactionType:(unsigned int)a4 certificateData:(id)a5 assetIDData:(id)a6 completionHandler:(id)a7;
- (void)getKeyStatusListWithCompletionHandler:(id)a3;
- (void)importSubscriptionKeyBagData:(id)a3 completionHandler:(id)a4;
- (void)importSubscriptionKeyBagData:(id)a3 leaseInfoData:(id)a4 completionHandler:(id)a5;
- (void)stopSubscriptionLeaseWithCompletion:(id)a3;
@end

@implementation ICMusicSubscriptionFairPlayController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionKeyBagStatusCache, 0);
  objc_storeStrong((id *)&self->_fairPlaySerialQueue, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)_handleSubscriptionFairPlayKeyStatusChangedDistributedNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __108__ICMusicSubscriptionFairPlayController__handleSubscriptionFairPlayKeyStatusChangedDistributedNotification___block_invoke;
  v3[3] = &unk_1E5ACD318;
  v3[4] = self;
  [(ICMusicSubscriptionFairPlayController *)self getKeyStatusListWithCompletionHandler:v3];
}

void __108__ICMusicSubscriptionFairPlayController__handleSubscriptionFairPlayKeyStatusChangedDistributedNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICMusicSubscriptionFairPlayKeyStatusDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)stopSubscriptionLeaseWithCompletion:(id)a3
{
  id v4 = a3;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(fairPlaySerialQueue, v7);
}

void __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke(uint64_t a1)
{
  int v13 = 0;
  id v12 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v13, &v12);
  id v3 = v12;
  id v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    Hbz0lOyjnO0();
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v5 userInfo:0];

      id v4 = (void *)v6;
    }
  }
  else if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5ACD2F0;
    id v11 = v7;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
}

uint64_t __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)generateSubscriptionLeaseRequestWithAccountUniqueID:(unint64_t)a3 transactionType:(unsigned int)a4 certificateData:(id)a5 assetIDData:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke;
  v19[3] = &unk_1E5ACD2C8;
  id v23 = v14;
  unint64_t v24 = a3;
  unsigned int v25 = a4;
  id v20 = v12;
  id v21 = v13;
  v22 = self;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(fairPlaySerialQueue, v19);
}

void __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke(uint64_t a1)
{
  unsigned int v21 = 0;
  id v20 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v21, &v20);
  id v3 = v20;
  id v4 = v3;
  if (!ContextIdentifierForFolderPath)
  {
    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    }
    v7 = 0;
LABEL_7:
    id v8 = 0;
    goto LABEL_8;
  }
  uint64_t v19 = 0;
  int v18 = 0;
  uint64_t v17 = 0;
  int v16 = 0;
  PhUojZmspd(v21, *(void *)(a1 + 64), *(unsigned int *)(a1 + 72), [*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)&v19, (uint64_t)&v18, (uint64_t)&v17, (uint64_t)&v16);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v5 userInfo:0];

    v7 = 0;
    id v8 = 0;
    id v4 = (void *)v6;
    goto LABEL_8;
  }
  if (v16)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v17);
  }
  else
  {
    v7 = 0;
  }
  if (!v18) {
    goto LABEL_7;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v19);
LABEL_8:
  v9 = *(void **)(a1 + 56);
  if (v9)
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 48) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2A0;
    id v15 = v9;
    id v12 = v8;
    id v13 = v7;
    id v14 = v4;
    dispatch_async(v10, block);
  }
}

uint64_t __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)generateSubscriptionBagRequestWithAccountUniqueIdentifier:(unint64_t)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke;
  block[3] = &unk_1E5ACD278;
  unsigned int v20 = a4;
  id v18 = v11;
  unint64_t v19 = a3;
  id v16 = v10;
  uint64_t v17 = self;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(fairPlaySerialQueue, block);
}

void __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke(uint64_t a1)
{
  unsigned int v17 = 0;
  id v16 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v17, &v16);
  id v3 = v16;
  id v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    uint64_t v15 = 0;
    int v14 = 0;
    V3lNO(v17, *(void *)(a1 + 56), *(unsigned int *)(a1 + 64), [*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"), (uint64_t)&v15, (uint64_t)&v14);
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v5 userInfo:0];

      v7 = 0;
      id v4 = (void *)v6;
      goto LABEL_9;
    }
    if (v14)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v15);
      goto LABEL_9;
    }
  }
  else if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  }
  v7 = 0;
LABEL_9:
  id v8 = *(void **)(a1 + 48);
  if (v8)
  {
    v9 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD250;
    id v13 = v8;
    id v11 = v7;
    id v12 = v4;
    dispatch_async(v9, block);
  }
}

uint64_t __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)importSubscriptionKeyBagData:(id)a3 leaseInfoData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(fairPlaySerialQueue, v15);
}

void __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v23 = 0;
  id v22 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v23, &v22);
  id v3 = v22;
  id v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    uint64_t v21 = 0;
    int v20 = 0;
    int v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      unsigned int v25 = v6;
      __int16 v26 = 1024;
      int v27 = v23;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:leaseInfoData:completionHandler: - Calling FairPlayImportSubscriptionResponse() - contextID: %u", buf, 0x12u);
    }

    [*(id *)(a1 + 40) bytes];
    [*(id *)(a1 + 40) length];
    [*(id *)(a1 + 48) bytes];
    [*(id *)(a1 + 48) length];
    NY6eB6();
    if (v7)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v7 userInfo:0];
      id v4 = v8 = v4;
    }
    else
    {
      id v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v25 = "-[ICMusicSubscriptionFairPlayController importSubscriptionKeyBagData:leaseInfoData:completionHandler:]_block_invoke";
        __int16 v26 = 1024;
        int v27 = v23;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "[Lease] - %s - FairPlayImportSubscriptionResponse() - Success - contextID: %u", buf, 0x12u);
      }

      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        unsigned int v25 = v11;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData", buf, 0xCu);
      }

      id v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(v12 + 24);
        *(_DWORD *)buf = 138544130;
        unsigned int v25 = (const char *)v12;
        __int16 v26 = 1024;
        int v27 = v23;
        __int16 v28 = 1024;
        int v29 = 0;
        __int16 v30 = 2112;
        uint64_t v31 = v13;
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:leaseInfoData:completionHandler: - Retrieved FairPlayImportSubscriptionResponse() - contextID: %u - keyBagStatusChanged: %{BOOL}u, _subscriptionKeyBagStatusCache: %@", buf, 0x22u);
      }
    }
  }
  else if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  }
  id v14 = *(void **)(a1 + 56);
  if (v14)
  {
    uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke_20;
    block[3] = &unk_1E5ACD250;
    id v19 = v14;
    id v17 = 0;
    id v18 = v4;
    dispatch_async(v15, block);
  }
}

uint64_t __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke_20(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)importSubscriptionKeyBagData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(fairPlaySerialQueue, block);
}

void __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v20 = 0;
  id v19 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v20, &v19);
  id v3 = v19;
  id v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    uint64_t v18 = 0;
    int v17 = 0;
    int v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v6;
      __int16 v23 = 1024;
      int v24 = v20;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:completionHandler: - Calling FairPlayImportSubscriptionBag() - contextID: %u", buf, 0x12u);
    }

    [*(id *)(a1 + 40) bytes];
    [*(id *)(a1 + 40) length];
    jr3lMuU8uaAR();
    if (v7)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v7 userInfo:0];
      id v4 = v8 = v4;
    }
    else
    {
      id v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(v9 + 24);
        *(_DWORD *)buf = 138544130;
        uint64_t v22 = v9;
        __int16 v23 = 1024;
        int v24 = v20;
        __int16 v25 = 1024;
        int v26 = 0;
        __int16 v27 = 2112;
        uint64_t v28 = v10;
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:completionHandler: - Retrieved FairPlayImportSubscriptionBag() - contextID: %u - keyBagStatusChanged: %{BOOL}u, _subscriptionKeyBagStatusCache: %@", buf, 0x22u);
      }
    }
  }
  else if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  }
  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke_19;
    block[3] = &unk_1E5ACD250;
    id v16 = v11;
    id v14 = 0;
    uint64_t v15 = v4;
    dispatch_async(v12, block);
  }
}

uint64_t __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke_19(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getKeyStatusListWithCompletionHandler:(id)a3
{
  id v4 = a3;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACD2F0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(fairPlaySerialQueue, v7);
}

void __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v21 = 0;
  id v20 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v21, &v20);
  id v3 = v20;
  id v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    uint64_t v19 = 0;
    int v18 = 0;
    int v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v23 = "-[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%s - FairPlayGetSubscriptionStatus() - Calling", buf, 0xCu);
    }

    NjiEJ7prRY3();
    int v7 = v6;
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v23 = "-[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%s - FairPlayGetSubscriptionStatus() - Error", buf, 0xCu);
      }

      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v7 userInfo:0];

      id v4 = (void *)v10;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v23 = "-[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%s - FairPlayGetSubscriptionStatus() - Success", buf, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
    }
  }
  else if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  }
  id v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke_18;
    block[3] = &unk_1E5ACD250;
    id v17 = v11;
    id v15 = 0;
    id v16 = v4;
    dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v12, v13);
  }
}

uint64_t __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke_18(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)getKeyStatusForAccountUniqueIdentifier:(unint64_t)a3 error:(id *)a4
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__38945;
  v14[4] = __Block_byref_object_dispose__38946;
  id v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__38945;
  id v12 = __Block_byref_object_dispose__38946;
  id v13 = 0;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__ICMusicSubscriptionFairPlayController_getKeyStatusForAccountUniqueIdentifier_error___block_invoke;
  block[3] = &unk_1E5ACD228;
  void block[5] = &v8;
  block[6] = a3;
  void block[4] = v14;
  dispatch_sync(fairPlaySerialQueue, block);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);

  return v5;
}

void __86__ICMusicSubscriptionFairPlayController_getKeyStatusForAccountUniqueIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v9 = 0;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v9, &obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  if (ContextIdentifierForFolderPath)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[ICMusicSubscriptionFairPlayController getKeyStatusForAccountUniqueIdentifier:error:]_block_invoke";
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%s - FairPlayGetSubscriptionStatus()", buf, 0xCu);
    }

    NjiEJ7prRY3();
  }
  else if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionFairPlayController;
  uint64_t v2 = [(ICMusicSubscriptionFairPlayController *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionFairPlayController.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionFairPlayController.fairPlaySerialQueue", 0);
    fairPlaySerialQueue = v2->_fairPlaySerialQueue;
    v2->_fairPlaySerialQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    subscriptionKeyBagStatusCache = v2->_subscriptionKeyBagStatusCache;
    v2->_subscriptionKeyBagStatusCache = (NSMutableDictionary *)v7;

    int v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v9 addObserver:v2 selector:sel__handleSubscriptionFairPlayKeyStatusChangedDistributedNotification_ name:@"com.apple.itunescloud.ICMusicSubscriptionFairPlayKeyStatusDidChangeNotification" object:0];

    [(ICMusicSubscriptionFairPlayController *)v2 getKeyStatusListWithCompletionHandler:&__block_literal_global_13_38954];
  }
  return v2;
}

+ (ICMusicSubscriptionFairPlayController)sharedController
{
  if (sharedController_sOnceToken_38963 != -1) {
    dispatch_once(&sharedController_sOnceToken_38963, &__block_literal_global_38964);
  }
  uint64_t v2 = (void *)sharedController_sSharedController_38965;

  return (ICMusicSubscriptionFairPlayController *)v2;
}

uint64_t __57__ICMusicSubscriptionFairPlayController_sharedController__block_invoke()
{
  id v0 = [[ICMusicSubscriptionFairPlayController alloc] _init];
  uint64_t v1 = sharedController_sSharedController_38965;
  sharedController_sSharedController_38965 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end