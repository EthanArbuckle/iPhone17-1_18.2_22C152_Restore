@interface SSVFairPlaySubscriptionController
- (BOOL)generateSubscriptionBagRequestWithAccountUniqueIdentifier:(unint64_t)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 returningSubscriptionBagData:(id *)a6 error:(id *)a7;
- (BOOL)generateSubscriptionLeaseRequestWithAccountUniqueID:(unint64_t)a3 transactionType:(unsigned int)a4 certificateData:(id)a5 assetIDData:(id)a6 returningLeaseData:(id *)a7 subscriptionBagData:(id *)a8 error:(id *)a9;
- (BOOL)importSubscriptionKeyBagData:(id)a3 leaseInfoData:(id)a4 returningError:(id *)a5;
- (BOOL)importSubscriptionKeyBagData:(id)a3 returningError:(id *)a4;
- (BOOL)stopSubscriptionLease:(id *)a3;
- (SSVFairPlaySubscriptionController)init;
- (id)_accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:(FPSubscriptionInfo_ *)a3 subscriptionInfoListLength:(unsigned int)a4;
- (id)_subscriptionStatusForFPSubscriptionInfo:(FPSubscriptionInfo_)a3;
- (id)subscriptionStatusForAccountUniqueIdentifier:(unint64_t)a3;
- (void)_enumerateSubscriptionInfoUsingBlock:(id)a3;
- (void)_notifySubscriptionStatusDidChange;
- (void)dealloc;
- (void)enumerateAccountSubscriptionStatusUsingBlock:(id)a3;
@end

@implementation SSVFairPlaySubscriptionController

- (SSVFairPlaySubscriptionController)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSVFairPlaySubscriptionController;
  v2 = [(SSVFairPlaySubscriptionController *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVFairPlaySubscriptionController.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v5 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__SSVFairPlaySubscriptionController_init__block_invoke;
    v8[3] = &unk_1E5BA7F98;
    objc_copyWeak(&v9, &location);
    uint32_t v6 = notify_register_dispatch("com.apple.StoreServices.SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification", &v2->_subscriptionStatusDidChangeNotifyToken, v5, v8);

    if (!v6) {
      v2->_hasValidSubscriptionStatusDidChangeNotifyToken = 1;
    }
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__SSVFairPlaySubscriptionController_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      uint64_t v4 = state64;
      if (v4 != getpid())
      {
        v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v5 postNotificationName:@"SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification" object:WeakRetained];
      }
    }
  }
}

- (void)dealloc
{
  if (self->_hasValidSubscriptionStatusDidChangeNotifyToken) {
    notify_cancel(self->_subscriptionStatusDidChangeNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)SSVFairPlaySubscriptionController;
  [(SSVFairPlaySubscriptionController *)&v3 dealloc];
}

- (void)enumerateAccountSubscriptionStatusUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__SSVFairPlaySubscriptionController_enumerateAccountSubscriptionStatusUsingBlock___block_invoke;
    v6[3] = &unk_1E5BADD80;
    v6[4] = self;
    id v7 = v4;
    [(SSVFairPlaySubscriptionController *)self _enumerateSubscriptionInfoUsingBlock:v6];
  }
}

uint64_t __82__SSVFairPlaySubscriptionController_enumerateAccountSubscriptionStatusUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_subscriptionStatusForFPSubscriptionInfo:", a2, a3);
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return MEMORY[0x1F4181820]();
}

- (id)subscriptionStatusForAccountUniqueIdentifier:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__67;
  v10 = __Block_byref_object_dispose__67;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__SSVFairPlaySubscriptionController_subscriptionStatusForAccountUniqueIdentifier___block_invoke;
  v5[3] = &unk_1E5BADDA8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(SSVFairPlaySubscriptionController *)self _enumerateSubscriptionInfoUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __82__SSVFairPlaySubscriptionController_subscriptionStatusForAccountUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2 == *(void *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_subscriptionStatusForFPSubscriptionInfo:", a2, a3);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (BOOL)generateSubscriptionBagRequestWithAccountUniqueIdentifier:(unint64_t)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 returningSubscriptionBagData:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v22 = 0;
  unsigned int v21 = 0;
  id v11 = a5;
  uint64_t v12 = SSVFairPlayContextIdentifier();
  id v13 = v11;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  V3lNO(v12, a3, v9, v14, v15, (uint64_t)&v22, (uint64_t)&v21);
  if (v16)
  {
    v17 = SSError(@"SSVFairPlayErrorDomain", v16, 0, 0);
    v18 = 0;
    if (!a6) {
      goto LABEL_4;
    }
  }
  else
  {
    if (v21)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v18 = (void *)[v20 initWithBytesNoCopy:v22 length:v21 deallocator:&__block_literal_global_33];
    }
    else
    {
      v18 = 0;
    }
    v17 = 0;
    if (!a6) {
      goto LABEL_4;
    }
  }
  *a6 = v18;
LABEL_4:
  if (a7) {
    *a7 = v17;
  }

  return v17 == 0;
}

void __160__SSVFairPlaySubscriptionController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_returningSubscriptionBagData_error___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)generateSubscriptionLeaseRequestWithAccountUniqueID:(unint64_t)a3 transactionType:(unsigned int)a4 certificateData:(id)a5 assetIDData:(id)a6 returningLeaseData:(id *)a7 subscriptionBagData:(id *)a8 error:(id *)a9
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v33 = 0;
  unsigned int v32 = 0;
  uint64_t v31 = 0;
  unsigned int v30 = 0;
  id v14 = a6;
  id v15 = a5;
  uint64_t v16 = SSVFairPlayContextIdentifier();
  id v17 = v15;
  uint64_t v18 = [v17 bytes];
  uint64_t v19 = [v17 length];

  id v20 = v14;
  uint64_t v21 = [v20 bytes];
  uint64_t v22 = [v20 length];

  PhUojZmspd(v16, a3, v12, v18, v19, v21, v22, (uint64_t)&v33, (uint64_t)&v32, (uint64_t)&v31, (uint64_t)&v30);
  if (v23)
  {
    v24 = SSError(@"SSVFairPlayErrorDomain", v23, 0, 0);
    v25 = 0;
    v26 = 0;
  }
  else
  {
    if (v30)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v25 = (void *)[v27 initWithBytesNoCopy:v31 length:v30 deallocator:&__block_literal_global_9_1];
    }
    else
    {
      v25 = 0;
    }
    if (v32)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v26 = (void *)[v28 initWithBytesNoCopy:v33 length:v32 deallocator:&__block_literal_global_11];
    }
    else
    {
      v26 = 0;
    }
    v24 = 0;
  }
  if (a8) {
    *a8 = v25;
  }
  if (a7) {
    *a7 = v26;
  }
  if (a9) {
    *a9 = v24;
  }

  return v24 == 0;
}

void __178__SSVFairPlaySubscriptionController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_returningLeaseData_subscriptionBagData_error___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __178__SSVFairPlaySubscriptionController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_returningLeaseData_subscriptionBagData_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (BOOL)importSubscriptionKeyBagData:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__67;
  uint64_t v18 = __Block_byref_object_dispose__67;
  id v19 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_returningError___block_invoke;
  block[3] = &unk_1E5BA8DF8;
  block[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v14;
  dispatch_barrier_sync(accessQueue, block);
  if (a4) {
    *a4 = (id) v15[5];
  }
  BOOL v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __81__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_returningError___block_invoke(uint64_t a1)
{
  SSVFairPlayContextIdentifier();
  NjiEJ7prRY3();
  v2 = [*(id *)(a1 + 32) _accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:0 subscriptionInfoListLength:0];
  SSVFairPlayContextIdentifier();
  [*(id *)(a1 + 40) bytes];
  [*(id *)(a1 + 40) length];
  jr3lMuU8uaAR();
  if (v3)
  {
    uint64_t v4 = SSError(@"SSVFairPlayErrorDomain", v3, 0, 0);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    SSVFairPlayContextIdentifier();
    NjiEJ7prRY3();
    uint64_t v7 = [*(id *)(a1 + 32) _accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:0 subscriptionInfoListLength:0];
    if (v2 != v7 && ([v2 isEqualToDictionary:v7] & 1) == 0) {
      [*(id *)(a1 + 32) _notifySubscriptionStatusDidChange];
    }
  }
}

- (BOOL)importSubscriptionKeyBagData:(id)a3 leaseInfoData:(id)a4 returningError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__67;
  int v23 = __Block_byref_object_dispose__67;
  id v24 = 0;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_leaseInfoData_returningError___block_invoke;
  v15[3] = &unk_1E5BADDD0;
  v15[4] = self;
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  uint64_t v18 = &v19;
  dispatch_barrier_sync(accessQueue, v15);
  if (a5) {
    *a5 = (id) v20[5];
  }
  BOOL v13 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __95__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_leaseInfoData_returningError___block_invoke(uint64_t a1)
{
  SSVFairPlayContextIdentifier();
  NjiEJ7prRY3();
  v2 = [*(id *)(a1 + 32) _accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:0 subscriptionInfoListLength:0];
  SSVFairPlayContextIdentifier();
  [*(id *)(a1 + 40) bytes];
  [*(id *)(a1 + 40) length];
  [*(id *)(a1 + 48) bytes];
  [*(id *)(a1 + 48) length];
  NY6eB6();
  if (v3)
  {
    uint64_t v4 = SSError(@"SSVFairPlayErrorDomain", v3, 0, 0);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    SSVFairPlayContextIdentifier();
    NjiEJ7prRY3();
    uint64_t v7 = [*(id *)(a1 + 32) _accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:0 subscriptionInfoListLength:0];
    if (v2 != v7 && ([v2 isEqualToDictionary:v7] & 1) == 0) {
      [*(id *)(a1 + 32) _notifySubscriptionStatusDidChange];
    }
  }
}

- (BOOL)stopSubscriptionLease:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__67;
  BOOL v13 = __Block_byref_object_dispose__67;
  id v14 = 0;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SSVFairPlaySubscriptionController_stopSubscriptionLease___block_invoke;
  v8[3] = &unk_1E5BADDF8;
  void v8[4] = &v15;
  v8[5] = &v9;
  dispatch_barrier_sync(accessQueue, v8);
  int v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((unsigned char *)v16 + 24))
  {
    *a3 = (id) v10[5];
    int v5 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __59__SSVFairPlaySubscriptionController_stopSubscriptionLease___block_invoke(uint64_t a1)
{
  SSVFairPlayContextIdentifier();
  YMQGEcsGvUj();
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (id)_accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:(FPSubscriptionInfo_ *)a3 subscriptionInfoListLength:(unsigned int)a4
{
  if (a4)
  {
    int v5 = 0;
    p_var1 = &a3->var1;
    uint64_t v7 = a4;
    do
    {
      uint64_t v8 = *((void *)p_var1 - 1);
      uint64_t v9 = -[SSVFairPlaySubscriptionController _subscriptionStatusForFPSubscriptionInfo:](self, "_subscriptionStatusForFPSubscriptionInfo:", v8, *(void *)p_var1);
      if (v9)
      {
        if (!v5) {
          int v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
        }
        v10 = [NSNumber numberWithUnsignedLongLong:v8];
        [v5 setObject:v9 forKey:v10];
      }
      p_var1 += 4;

      --v7;
    }
    while (v7);
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (void)_enumerateSubscriptionInfoUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  if (v4)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SSVFairPlaySubscriptionController__enumerateSubscriptionInfoUsingBlock___block_invoke;
    block[3] = &unk_1E5BADDF8;
    block[4] = &v18;
    void block[5] = &v14;
    dispatch_sync(accessQueue, block);
    if (*((_DWORD *)v15 + 6))
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = (uint64_t *)(v19[3] + v6);
        uint64_t v9 = *v8;
        uint64_t v10 = v8[1];
        char v12 = 0;
        v4[2](v4, v9, v10, &v12);
        if (v12) {
          break;
        }
        ++v7;
        v6 += 16;
      }
      while (v7 < *((unsigned int *)v15 + 6));
    }
    uint64_t v11 = v19[3];
    if (v11) {
      jEHf8Xzsv8K(v11);
    }
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
}

void __74__SSVFairPlaySubscriptionController__enumerateSubscriptionInfoUsingBlock___block_invoke()
{
  SSVFairPlayContextIdentifier();
  NjiEJ7prRY3();
}

- (void)_notifySubscriptionStatusDidChange
{
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SSVFairPlaySubscriptionController__notifySubscriptionStatusDidChange__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_async(v3, block);

  if (self->_hasValidSubscriptionStatusDidChangeNotifyToken)
  {
    int subscriptionStatusDidChangeNotifyToken = self->_subscriptionStatusDidChangeNotifyToken;
    pid_t v5 = getpid();
    notify_set_state(subscriptionStatusDidChangeNotifyToken, v5);
  }
  notify_post("com.apple.StoreServices.SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification");
}

void __71__SSVFairPlaySubscriptionController__notifySubscriptionStatusDidChange__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (id)_subscriptionStatusForFPSubscriptionInfo:(FPSubscriptionInfo_)a3
{
  if ((a3.var1 - 1) > 2)
  {
    pid_t v5 = 0;
  }
  else
  {
    BOOL v3 = (a3.var1 & 0xFFFFFFFD) == 1;
    BOOL v4 = (a3.var1 & 0xFFFFFFFE) == 2;
    pid_t v5 = objc_alloc_init(SSVFairPlaySubscriptionStatus);
    [(SSVFairPlaySubscriptionStatus *)v5 setHasSubscriptionLease:v3];
    [(SSVFairPlaySubscriptionStatus *)v5 setHasSubscriptionSlot:v4];
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end