@interface WBSCloudKitContainerManateeObserver
- (NSString)containerIdentifier;
- (WBSCloudKitContainerManateeObserver)initWithContainerIdentifier:(id)a3 appleAccountInformationProvider:(id)a4;
- (id)stateChangeObserver;
- (void)_accountChanged:(id)a3;
- (void)_determineAccountStateWithCompletion:(id)a3;
- (void)determineAccountStateWithCompletion:(id)a3;
- (void)setStateChangeObserver:(id)a3;
@end

@implementation WBSCloudKitContainerManateeObserver

- (WBSCloudKitContainerManateeObserver)initWithContainerIdentifier:(id)a3 appleAccountInformationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WBSCloudKitContainerManateeObserver;
  v8 = [(WBSCloudKitContainerManateeObserver *)&v24 init];
  if (v8)
  {
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    id v12 = [v9 stringWithFormat:@"com.apple.SafariCore.%@.%p", v11, v8];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [v6 copy];
    containerIdentifier = v8->_containerIdentifier;
    v8->_containerIdentifier = (NSString *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    stateDeterminationCompletionBlocks = v8->_stateDeterminationCompletionBlocks;
    v8->_stateDeterminationCompletionBlocks = (NSMutableArray *)v17;

    objc_storeStrong((id *)&v8->_appleAccountInformationProvider, a4);
    if (NSClassFromString(&cfstr_Ckcontainer.isa))
    {
      uint64_t v19 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:v8->_containerIdentifier];
      container = v8->_container;
      v8->_container = (CKContainer *)v19;

      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 addObserver:v8 selector:sel__accountChanged_ name:*MEMORY[0x1E4F19BE0] object:0];
    }
    v22 = v8;
  }

  return v8;
}

- (void)setStateChangeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__WBSCloudKitContainerManateeObserver_setStateChangeObserver___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__WBSCloudKitContainerManateeObserver_setStateChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (id)stateChangeObserver
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__WBSCloudKitContainerManateeObserver_stateChangeObserver__block_invoke;
  v5[3] = &unk_1E615A970;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  uint64_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__WBSCloudKitContainerManateeObserver_stateChangeObserver__block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_accountChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke(uint64_t a1)
{
  v1 = *(_OWORD **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke_2;
  v4[3] = &unk_1E615A998;
  long long v2 = v1[2];
  v4[4] = v1;
  long long v5 = v2;
  return [v1 _determineAccountStateWithCompletion:v4];
}

uint64_t __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke_2(uint64_t result)
{
  v1 = *(void **)(result + 32);
  if (*(void *)(result + 40) != v1[4] || *(void *)(result + 48) != v1[5])
  {
    result = v1[6];
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)_determineAccountStateWithCompletion:(id)a3
{
  stateDeterminationCompletionBlocks = self->_stateDeterminationCompletionBlocks;
  long long v5 = _Block_copy(a3);
  [(NSMutableArray *)stateDeterminationCompletionBlocks addObject:v5];

  if (!self->_determiningManateeState)
  {
    self->_determiningManateeState = 1;
    container = self->_container;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke;
    v7[3] = &unk_1E615AA10;
    v7[4] = self;
    [(CKContainer *)container accountInfoWithCompletionHandler:v7];
  }
}

void __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E615A9C0;
  aBlock[4] = *(void *)(a1 + 32);
  id v7 = v6;
  id v18 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_3;
  block[3] = &unk_1E615A9E8;
  id v15 = v5;
  id v16 = v8;
  id v14 = v7;
  id v10 = v5;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);
}

void __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  *(void *)(*(void *)(a1 + 32) + 32) = a2;
  *(void *)(*(void *)(a1 + 32) + 40) = a3;
  id v4 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

uint64_t __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (![*(id *)(a1 + 40) supportsDeviceToDeviceEncryption]) {
      [*(id *)(a1 + 40) deviceToDeviceEncryptionAvailability];
    }
    long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v2();
}

- (void)determineAccountStateWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WBSCloudKitContainerManateeObserver_determineAccountStateWithCompletion___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __75__WBSCloudKitContainerManateeObserver_determineAccountStateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineAccountStateWithCompletion:*(void *)(a1 + 40)];
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_appleAccountInformationProvider, 0);
  objc_storeStrong((id *)&self->_stateDeterminationCompletionBlocks, 0);
  objc_storeStrong(&self->_stateChangeObserver, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end