@interface PKAssertionCoordinator
+ (id)sharedInstance;
- (id)_existingRemoteObjectProxy;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)initSharedInstance;
- (void)_removeAssertionWithIdentifier:(id)a3;
- (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5;
- (void)assertion:(id)a3 shouldInvalidateWhenBackgrounded:(BOOL)a4;
- (void)dealloc;
- (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4;
- (void)invalidateAssertion:(id)a3 completion:(id)a4;
- (void)isAssertionValid:(id)a3 completion:(id)a4;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)remoteServiceDidSuspend:(id)a3;
@end

@implementation PKAssertionCoordinator

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PKAssertionCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_271 != -1) {
    dispatch_once(&_MergedGlobals_271, block);
  }
  v2 = (void *)qword_1EB403400;
  return v2;
}

void __40__PKAssertionCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initSharedInstance];
  v2 = (void *)qword_1EB403400;
  qword_1EB403400 = v1;
}

- (id)initSharedInstance
{
  v2 = [(PKAssertionCoordinator *)self init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PassKitCore.assertioncoordinator", v3);
    coordinatorSerialQueue = v2->_coordinatorSerialQueue;
    v2->_coordinatorSerialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    acquiredAssertions = v2->_acquiredAssertions;
    v2->_acquiredAssertions = (NSHashTable *)v6;

    v8 = [PKXPCService alloc];
    v9 = PDAssertionCoordinatorInterface();
    uint64_t v10 = [(PKXPCService *)v8 initWithMachServiceName:@"com.apple.passd.assertions" remoteObjectInterface:v9 exportedObjectInterface:0 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v10;

    [(PKXPCService *)v2->_remoteService setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(PKXPCService *)self->_remoteService setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PKAssertionCoordinator;
  [(PKAssertionCoordinator *)&v3 dealloc];
}

- (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if ([(PKXPCService *)self->_remoteService isSuspended])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_7;
      block[3] = &unk_1E56D8360;
      id v16 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v10 = v16;
    }
    else
    {
      v11 = [MEMORY[0x1E4F29128] UUID];
      v12 = [v11 UUIDString];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke;
      v22[3] = &unk_1E56D8360;
      id v13 = v9;
      id v23 = v13;
      v14 = [(PKAssertionCoordinator *)self _remoteObjectProxyWithFailureHandler:v22];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_3;
      v17[3] = &unk_1E56F15B0;
      unint64_t v21 = a3;
      v17[4] = self;
      id v18 = v12;
      id v19 = v8;
      id v20 = v13;
      id v10 = v12;
      [v14 acquireAssertionOfType:a3 withIdentifier:v10 reason:v19 handler:v17];
    }
  }
}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.passkit.assertion" code:-3 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_3(uint64_t a1, char a2)
{
  objc_super v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_4;
  v6[3] = &unk_1E56E3A98;
  char v12 = a2;
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = *(id *)(a1 + 56);
  dispatch_async(v3, v6);
}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = [[PKAssertion alloc] initWithType:*(void *)(a1 + 64) identifier:*(void *)(a1 + 32) reason:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 48) + 8) addObject:v2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_5;
    block[3] = &unk_1E56D83D8;
    id v3 = *(id *)(a1 + 56);
    id v8 = v2;
    id v9 = v3;
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_6;
    v5[3] = &unk_1E56D8360;
    uint64_t v6 = (PKAssertion *)*(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], v5);
    id v4 = v6;
  }
}

uint64_t __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_6(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.passkit.assertion" code:-1 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PKAssertionCoordinator_acquireAssertionOfType_withReason_completion___block_invoke_7(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.passkit.assertion" code:-2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateAssertion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  if ([(PKXPCService *)self->_remoteService connectionEstablished])
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke;
    v25[3] = &unk_1E56D8360;
    id v9 = v7;
    id v26 = v9;
    id v10 = [(PKAssertionCoordinator *)self _remoteObjectProxyWithFailureHandler:v25];
    uint64_t v11 = [v6 type];
    char v12 = [v6 identifier];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_3;
    v22[3] = &unk_1E56D89F0;
    void v22[4] = self;
    id v23 = v8;
    id v24 = v9;
    id v13 = v9;
    id v14 = v8;
    [v10 invalidateAssertionOfType:v11 withIdentifier:v12 handler:v22];

    v15 = v26;
  }
  else
  {
    coordinatorSerialQueue = self->_coordinatorSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_6;
    block[3] = &unk_1E56D89F0;
    void block[4] = self;
    id v20 = v8;
    id v21 = v7;
    id v17 = v7;
    id v18 = v8;
    dispatch_async(coordinatorSerialQueue, block);

    v15 = v20;
  }
}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_2;
    block[3] = &unk_1E56D8360;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_4;
  block[3] = &unk_1E56D89F0;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAssertionWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_5;
    block[3] = &unk_1E56D8360;
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAssertionWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_7;
    block[3] = &unk_1E56D8360;
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__PKAssertionCoordinator_invalidateAssertion_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)assertion:(id)a3 shouldInvalidateWhenBackgrounded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = [(PKAssertionCoordinator *)self _remoteObjectProxy];
  uint64_t v7 = [v6 type];
  id v8 = [v6 identifier];

  [v9 assertionOfType:v7 withIdentifier:v8 shouldInvalidateWhenBackgrounded:v4];
}

- (void)isAssertionValid:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PKAssertionCoordinator *)self _remoteObjectProxy];
  uint64_t v8 = [v7 type];
  id v9 = [v7 identifier];

  [v10 assertionOfType:v8 withIdentifier:v9 isValid:v6];
}

- (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PKAssertionCoordinator *)self _remoteObjectProxy];
  [v7 hasValidAssertionOfType:a3 completion:v6];
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PKAssertionCoordinator_remoteService_didInterruptConnection___block_invoke;
  v6[3] = &unk_1E56D8AE0;
  void v6[4] = self;
  id v5 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_17;
  block[3] = &unk_1E56D8360;
  id v8 = v5;
  dispatch_async(coordinatorSerialQueue, block);
}

void __63__PKAssertionCoordinator_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  id v3 = (id)[v2 copy];

  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_186];
}

uint64_t __63__PKAssertionCoordinator_remoteService_didInterruptConnection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 markAsInvalidatedAndNotify];
}

- (void)remoteServiceDidSuspend:(id)a3
{
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PKAssertionCoordinator_remoteServiceDidSuspend___block_invoke;
  v5[3] = &unk_1E56D8AE0;
  void v5[4] = self;
  BOOL v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_17;
  block[3] = &unk_1E56D8360;
  id v7 = v4;
  dispatch_async(coordinatorSerialQueue, block);
}

void __50__PKAssertionCoordinator_remoteServiceDidSuspend___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  id v3 = (void *)[v2 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "invalidateWhenBackgrounded", (void)v10))
        {
          [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v9];
          [v9 markAsInvalidatedAndNotify];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
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

- (id)_existingRemoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService existingRemoteObjectProxy];
}

- (void)_removeAssertionWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_coordinatorSerialQueue);
  uint64_t v5 = (void *)MEMORY[0x192FDC630]();
  uint64_t v6 = [(NSHashTable *)self->_acquiredAssertions allObjects];
  uint64_t v7 = (void *)[v6 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "identifier", (void)v16);
        int v15 = [v14 isEqualToString:v4];

        if (v15) {
          [(NSHashTable *)self->_acquiredAssertions removeObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_acquiredAssertions, 0);
}

@end