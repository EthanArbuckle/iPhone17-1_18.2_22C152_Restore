@interface PKSharingChannelHandle
+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4;
+ (void)descriptorsForAccountDevices:(id)a3;
- (BOOL)_lock_isStatusValidForAction:(BOOL)a3;
- (BOOL)hasOutstandingMessage;
- (BOOL)isInvalid;
- (OS_dispatch_queue)replyQueue;
- (PKSharingChannelHandle)init;
- (id)_initWithQueue:(id)a3;
- (id)createActionAssertion;
- (id)createActionAssertionAllowWhileTransferring:(BOOL)a3;
- (id)invalidationHandler;
- (id)messageReceivedHandler;
- (void)_didReceiveMessage;
- (void)attachAndFetchMessage:(id)a3;
- (void)attachWithCompletion:(id)a3;
- (void)closeWithCompletion:(id)a3;
- (void)dealloc;
- (void)detachHandleForTransfer:(id)a3;
- (void)didInvalidate;
- (void)didReceiveMessages:(id)a3;
- (void)fetchHandleTransferToken:(id)a3;
- (void)handleOutstandingMessage:(id)a3;
- (void)invalidate;
- (void)invalidateWithCompletion:(id)a3;
- (void)invalidateWithRemoteWithCompletion:(id)a3;
- (void)invalidateWithSource:(unint64_t)a3 completion:(id)a4;
- (void)markMessageAsHandled:(id)a3;
- (void)pingWithCompletion:(id)a3;
- (void)relinquishWithCompletion:(id)a3;
- (void)remoteDeviceInformation:(id)a3;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)sendMessageAndWaitForReply:(id)a3 timeout:(double)a4 messageHandler:(id)a5 invalidationHandler:(id)a6;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageReceivedHandler:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)startProximityAdvertisementOfType:(unint64_t)a3 completion:(id)a4;
- (void)startProximityDetectionForAdvertisement:(id)a3 completion:(id)a4;
- (void)waitForMessageWithTimeout:(double)a3 messageHandler:(id)a4 invalidationHandler:(id)a5;
@end

@implementation PKSharingChannelHandle

- (PKSharingChannelHandle)init
{
  return 0;
}

- (id)_initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSharingChannelHandle;
  v6 = [(PKSharingChannelHandle *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    outstandingMessages = v7->_outstandingMessages;
    v7->_outstandingMessages = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    receivedMessageIdentifiers = v7->_receivedMessageIdentifiers;
    v7->_receivedMessageIdentifiers = v10;

    v7->_status = 0;
  }

  return v7;
}

+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4
{
  return +[PKSharingChannelHandle_Client createHandleForDescriptor:a3 queue:a4];
}

- (void)dealloc
{
  [(PKSharingChannelHandle *)self invalidateWithSource:3 completion:0];
  v3.receiver = self;
  v3.super_class = (Class)PKSharingChannelHandle;
  [(PKSharingChannelHandle *)&v3 dealloc];
}

- (BOOL)hasOutstandingMessage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = 0;
  if ([(PKSharingChannelHandle *)self _lock_isStatusValidForAction:0]) {
    BOOL v4 = [(NSMutableArray *)self->_outstandingMessages count] != 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)handleOutstandingMessage:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (!v5)
  {
    v4[2](v4, 0, &__block_literal_global_194);
LABEL_8:

    return;
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_messageBeingHandled)
  {
    v6 = [(NSMutableArray *)self->_outstandingMessages firstObject];
    if (v6)
    {
      objc_storeStrong((id *)&self->_messageBeingHandled, v6);
      os_unfair_lock_unlock(&self->_lock);
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_3;
      aBlock[3] = &unk_1E56F2868;
      objc_copyWeak(&v22, &location);
      id v7 = v6;
      id v20 = v7;
      id v21 = v5;
      v8 = _Block_copy(aBlock);
      v9 = [PKDeallocationGuard alloc];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_4;
      v17[3] = &unk_1E56D8360;
      id v10 = v8;
      id v18 = v10;
      v11 = [(PKDeallocationGuard *)v9 initWithBlock:v17];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_5;
      v14[3] = &unk_1E56D86A8;
      v12 = v11;
      v15 = v12;
      id v13 = v10;
      id v16 = v13;
      ((void (**)(id, id, void *))v4)[2](v4, v7, v14);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v4[2](v4, 0, &__block_literal_global_49_0);
    }

    goto LABEL_8;
  }
  __break(1u);
}

void __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_3(uint64_t a1, int a2)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = (id *)WeakRetained;
    id v5 = WeakRetained + 2;
    os_unfair_lock_lock(WeakRetained + 2);
    if (a2)
    {
      [v8[10] removeObjectAtIndex:0];
      id v6 = v8[8];
      v8[8] = 0;

      os_unfair_lock_unlock(v5);
      [v8 markMessageAsHandled:*(void *)(a1 + 32)];
    }
    else
    {
      id v7 = v8[8];
      v8[8] = 0;

      os_unfair_lock_unlock(v5);
    }
    WeakRetained = (os_unfair_lock_s *)v8;
  }
}

uint64_t __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__PKSharingChannelHandle_handleOutstandingMessage___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)waitForMessageWithTimeout:(double)a3 messageHandler:(id)a4 invalidationHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [[PKSharingChannelHandleMessageWaiter alloc] initWithTimeout:v9 messageHandler:v8 invalidationHandler:self->_replyQueue replyQueue:a3];

  [(PKSharingChannelHandleMessageWaiter *)v10 startForHandle:self];
}

- (void)sendMessageAndWaitForReply:(id)a3 timeout:(double)a4 messageHandler:(id)a5 invalidationHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke;
  v14[3] = &unk_1E56F2890;
  void v14[4] = self;
  id v15 = v11;
  double v17 = a4;
  id v16 = v10;
  id v12 = v10;
  id v13 = v11;
  [(PKSharingChannelHandle *)self sendMessage:a3 completion:v14];
}

void __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    double v2 = *(double *)(a1 + 56);
    uint64_t v3 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke_2;
    v6[3] = &unk_1E56D8ED8;
    BOOL v4 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v4 waitForMessageWithTimeout:v3 messageHandler:v6 invalidationHandler:v2];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

uint64_t __96__PKSharingChannelHandle_sendMessageAndWaitForReply_timeout_messageHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didReceiveMessages:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "identifier", (void)v12);
          if (([(NSMutableSet *)self->_receivedMessageIdentifiers containsObject:v11] & 1) == 0)
          {
            [(NSMutableSet *)self->_receivedMessageIdentifiers addObject:v11];
            [(NSMutableArray *)self->_outstandingMessages addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
    [(PKSharingChannelHandle *)self _didReceiveMessage];
  }
}

- (void)_didReceiveMessage
{
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PKSharingChannelHandle__didReceiveMessage__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(replyQueue, block);
}

uint64_t __44__PKSharingChannelHandle__didReceiveMessage__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 96);
  if (result) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)setMessageReceivedHandler:(id)a3
{
  aBlock = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_outstandingMessages count]) {
    BOOL v4 = self->_messageBeingHandled == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = _Block_copy(aBlock);
  id messageReceivedHandler = self->_messageReceivedHandler;
  self->_id messageReceivedHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v7 = aBlock;
  if (aBlock && v4)
  {
    aBlock[2](aBlock);
    uint64_t v7 = aBlock;
  }
}

- (void)setInvalidationHandler:(id)a3
{
  aBlock = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status > 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    if (aBlock) {
      aBlock[2]();
    }
  }
  else
  {
    BOOL v4 = _Block_copy(aBlock);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)attachAndFetchMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke;
  v6[3] = &unk_1E56D8928;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKSharingChannelHandle *)self attachWithCompletion:v6];
}

void __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke_2;
    v5[3] = &unk_1E56F28B8;
    id v4 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v4 handleOutstandingMessage:v5];
  }
}

void __48__PKSharingChannelHandle_attachAndFetchMessage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void (**)(uint64_t, void))(a3 + 16);
  id v6 = a2;
  v5(a3, 0);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_lock_isStatusValidForAction:(BOOL)a3
{
  unint64_t status = self->_status;
  unint64_t v4 = status - 2;
  BOOL v5 = status == 1 && a3;
  if (status) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 1;
  }
  return v4 >= 2 && v6;
}

- (void)invalidate
{
}

- (void)invalidateWithCompletion:(id)a3
{
}

- (void)invalidateWithSource:(unint64_t)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(void))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status <= 1)
  {
    unint64_t actionAssertionCount = self->_actionAssertionCount;
    id v9 = PKLogFacilityTypeGetObject(0x22uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PKSharingChannelHandle *)self transportIdentifier];
      uint64_t v11 = PKSharingLoggableMailboxAddress(v10);
      long long v12 = (void *)v11;
      if (a3 > 4) {
        long long v13 = @"unknown";
      }
      else {
        long long v13 = off_1E56F2978[a3];
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v11;
      __int16 v40 = 2112;
      v41 = v13;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Handle<%@> invalidating from source: '%@'", buf, 0x16u);
    }
    self->_unint64_t status = 2;
    id v16 = (void *)[self->_invalidationHandler copy];
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    invalidationCompletions = self->_invalidationCompletions;
    if (invalidationCompletions) {
      v19 = invalidationCompletions;
    }
    else {
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v20 = self->_invalidationCompletions;
    self->_invalidationCompletions = v19;

    id v21 = self->_invalidationCompletions;
    id v22 = _Block_copy(v16);
    [(NSMutableArray *)v21 safelyAddObject:v22];

    v23 = self->_invalidationCompletions;
    v24 = _Block_copy(v6);
    [(NSMutableArray *)v23 safelyAddObject:v24];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke;
    aBlock[3] = &unk_1E56D8AE0;
    void aBlock[4] = self;
    v25 = _Block_copy(aBlock);
    v26 = v25;
    if (a3 - 1 >= 3)
    {
      if (a3 == 4)
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_5;
        v31[3] = &unk_1E56D8A18;
        v31[4] = self;
        id v32 = v25;
        v27 = (void (**)(void))_Block_copy(v31);
        v28 = v32;
      }
      else
      {
        if (a3)
        {
          v27 = 0;
          if (!actionAssertionCount)
          {
LABEL_21:

            os_unfair_lock_unlock(&self->_lock);
            if (v27)
            {
              v27[2](v27);
            }
            goto LABEL_23;
          }
LABEL_20:
          v29 = _Block_copy(v27);
          id didInvalidateReply = self->_didInvalidateReply;
          self->_id didInvalidateReply = v29;

          v27 = 0;
          goto LABEL_21;
        }
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_2;
        v35[3] = &unk_1E56D8A18;
        v35[4] = self;
        id v36 = v25;
        v27 = (void (**)(void))_Block_copy(v35);
        v28 = v36;
      }
    }
    else
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_4;
      v33[3] = &unk_1E56D83D8;
      v33[4] = self;
      id v34 = v25;
      v27 = (void (**)(void))_Block_copy(v33);
      v28 = v34;
    }

    if (!actionAssertionCount) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if ([(NSMutableArray *)self->_invalidationCompletions count] || self->_didInvalidateReply)
  {
    long long v14 = self->_invalidationCompletions;
    long long v15 = _Block_copy(v6);
    [(NSMutableArray *)v14 safelyAddObject:v15];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v6) {
      v6[2](v6);
    }
  }
LABEL_23:
}

void __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_3;
  v4[3] = &unk_1E56D83D8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 invalidateWithRemoteWithCompletion:v4];
}

uint64_t __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 didInvalidate];
}

uint64_t __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 didInvalidate];
}

void __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_6;
  v2[3] = &unk_1E56D8360;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 invalidateWithRemoteWithCompletion:v2];
}

uint64_t __58__PKSharingChannelHandle_invalidateWithSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didInvalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t status = 3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalid
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_status != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)createActionAssertion
{
  return [(PKSharingChannelHandle *)self createActionAssertionAllowWhileTransferring:0];
}

- (id)createActionAssertionAllowWhileTransferring:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(PKSharingChannelHandle *)self _lock_isStatusValidForAction:v3])
  {
    ++self->_actionAssertionCount;
    os_unfair_lock_unlock(p_lock);
    uint64_t v6 = [PKDeallocationGuard alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PKSharingChannelHandle_createActionAssertionAllowWhileTransferring___block_invoke;
    v9[3] = &unk_1E56D8AE0;
    v9[4] = self;
    uint64_t v7 = [(PKDeallocationGuard *)v6 initWithBlock:v9];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    uint64_t v7 = 0;
  }
  return v7;
}

void __70__PKSharingChannelHandle_createActionAssertionAllowWhileTransferring___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  --*(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  if (v3 == 2)
  {
    if (*(void *)(v2 + 24) || (uint64_t v7 = *(void **)(v2 + 32)) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      uint64_t v4 = 0;
      goto LABEL_12;
    }
    uint64_t v14 = [v7 copy];
    uint64_t v8 = *(void *)(a1 + 32);
    long long v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;

    uint64_t v5 = v14;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 56);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v13 = (void (**)(void))v5;
  if (v3 == 1 && !*(void *)(v2 + 24) && (long long v10 = *(void **)(v2 + 40)) != 0)
  {
    uint64_t v6 = (void (**)(void))[v10 copy];
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  uint64_t v4 = v13;
  if (v13)
  {
    v13[2](v13);
    uint64_t v4 = v13;
  }
  if (v6)
  {
    v6[2](v6);

    uint64_t v4 = v13;
  }
LABEL_12:
}

- (void)pingWithCompletion:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)attachWithCompletion:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

- (void)closeWithCompletion:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)relinquishWithCompletion:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)markMessageAsHandled:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)invalidateWithRemoteWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)detachHandleForTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __50__PKSharingChannelHandle_detachHandleForTransfer___block_invoke;
  uint64_t v13 = &unk_1E56D8A18;
  uint64_t v14 = self;
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void))_Block_copy(&v10);
  os_unfair_lock_lock(&self->_lock);
  if (-[PKSharingChannelHandle _lock_isStatusValidForAction:](self, "_lock_isStatusValidForAction:", 0, v10, v11, v12, v13, v14))
  {
    unint64_t actionAssertionCount = self->_actionAssertionCount;
    self->_unint64_t status = 1;
    if (!actionAssertionCount)
    {
      os_unfair_lock_unlock(&self->_lock);
      v6[2](v6);
      goto LABEL_6;
    }
    uint64_t v8 = _Block_copy(v6);
    id pendingOwnershipTransfer = self->_pendingOwnershipTransfer;
    self->_id pendingOwnershipTransfer = v8;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_6:
}

uint64_t __50__PKSharingChannelHandle_detachHandleForTransfer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchHandleTransferToken:*(void *)(a1 + 40)];
}

- (void)fetchHandleTransferToken:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)remoteDeviceInformation:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)startProximityAdvertisementOfType:(unint64_t)a3 completion:(id)a4
{
  id v4 = a4;
  __break(1u);
}

- (void)startProximityDetectionForAdvertisement:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

+ (void)descriptorsForAccountDevices:(id)a3
{
  id v3 = a3;
  if (PKRunningInPassd())
  {
    __break(1u);
  }
  else
  {
    +[PKSharingChannelHandle_Client descriptorsForAccountDevices:v3];
  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)messageReceivedHandler
{
  return self->_messageReceivedHandler;
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_outstandingMessages, 0);
  objc_storeStrong((id *)&self->_receivedMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_messageBeingHandled, 0);
  objc_storeStrong((id *)&self->_invalidationCompletions, 0);
  objc_storeStrong(&self->_pendingOwnershipTransfer, 0);
  objc_storeStrong(&self->_didInvalidateReply, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

uint64_t __65__PKSharingChannelHandle_Client_createHandleForDescriptor_queue___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 == 0;
  return result;
}

void __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v9 = a1[6];
  id v7 = v3;
  id v8 = a1[5];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, *(void *)(a1 + 32));
}

void __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_4;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v9 = a1[6];
  id v7 = v3;
  id v8 = a1[5];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, *(void *)(a1 + 32));
}

void __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_4;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v9 = a1[6];
  id v7 = v3;
  id v8 = a1[5];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_4;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v9 = a1[6];
  id v7 = v3;
  id v8 = a1[5];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_4;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v9 = a1[6];
  id v7 = v3;
  id v8 = a1[5];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_4;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__PKSharingChannelHandle_Client_fetchHandleTransferToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] replyQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_2;
  v3[3] = &unk_1E56D83D8;
  id v5 = a1[6];
  id v4 = a1[5];
  dispatch_async(v2, v3);
}

uint64_t __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_4;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58__PKSharingChannelHandle_Client__fetchTransportIdentifier__block_invoke(uint64_t a1, void *a2)
{
}

void __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke_4;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke_4;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_4;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end