@interface PKIDSService
- (IDSService)underlyingService;
- (PKIDSService)init;
- (PKIDSService)initWithService:(id)a3;
- (PKIDSService)initWithServiceName:(id)a3;
- (void)_enumerateDelegatesWithBlock:(id)a3;
- (void)_receivedMessage:(id)a3 isRequest:(BOOL)a4 service:(id)a5 account:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)_receivedRequestMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_receivedResponseMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_setProtobufAction:(SEL)a3 target:(id)a4 messageType:(unsigned __int16)a5 isRequest:(BOOL)a6 queue:(id)a7;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)registerListenerForMessageType:(unsigned __int16)a3 isRequest:(BOOL)a4 referenceObject:(id)a5 onMessageReceived:(id)a6;
- (void)registerListenerForMessageType:(unsigned __int16)a3 isRequest:(BOOL)a4 referenceObject:(id)a5 queue:(id)a6 onMessageReceived:(id)a7;
- (void)removeDelegate:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setProtobufAction:(SEL)a3 target:(id)a4 forIncomingRequestsOfType:(unsigned __int16)a5 queue:(id)a6;
- (void)setProtobufAction:(SEL)a3 target:(id)a4 forIncomingResponsesOfType:(unsigned __int16)a5 queue:(id)a6;
- (void)start;
- (void)unregisterListenersForTarget:(id)a3;
@end

@implementation PKIDSService

- (PKIDSService)init
{
  return 0;
}

- (PKIDSService)initWithServiceName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F6AB90];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithService:v5];

  v7 = [(PKIDSService *)self initWithService:v6];
  return v7;
}

- (PKIDSService)initWithService:(id)a3
{
  result = (PKIDSService *)a3;
  if (result)
  {
    v6 = result;
    v17.receiver = self;
    v17.super_class = (Class)PKIDSService;
    v7 = [(PKIDSService *)&v17 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_underlyingService, a3);
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      listeners = v8->_listeners;
      v8->_listeners = v9;

      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      delegates = v8->_delegates;
      v8->_delegates = (NSHashTable *)v11;

      v8->_lock._os_unfair_lock_opaque = 0;
      dispatch_queue_t v13 = dispatch_queue_create("com.apple.passd.idsservice.internal", 0);
      internalQueue = v8->_internalQueue;
      v8->_internalQueue = (OS_dispatch_queue *)v13;

      dispatch_queue_t v15 = dispatch_queue_create("com.apple.passd.idsservice.reply", 0);
      replyQueue = v8->_replyQueue;
      v8->_replyQueue = (OS_dispatch_queue *)v15;
    }
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  [(IDSService *)self->_underlyingService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKIDSService;
  [(PKIDSService *)&v3 dealloc];
}

- (void)start
{
}

- (void)setProtobufAction:(SEL)a3 target:(id)a4 forIncomingRequestsOfType:(unsigned __int16)a5 queue:(id)a6
{
}

- (void)setProtobufAction:(SEL)a3 target:(id)a4 forIncomingResponsesOfType:(unsigned __int16)a5 queue:(id)a6
{
}

- (void)_setProtobufAction:(SEL)a3 target:(id)a4 messageType:(unsigned __int16)a5 isRequest:(BOOL)a6 queue:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a5;
  id v12 = a4;
  id v13 = a7;
  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__PKIDSService__setProtobufAction_target_messageType_isRequest_queue___block_invoke;
  v14[3] = &unk_1E56E4168;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(v16, &from);
  v16[1] = (id)a3;
  [(PKIDSService *)self registerListenerForMessageType:v9 isRequest:v8 referenceObject:v12 queue:v13 onMessageReceived:v14];
  objc_destroyWeak(v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __70__PKIDSService__setProtobufAction_target_messageType_isRequest_queue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v18 = a2;
  id v17 = a3;
  id v16 = a4;
  id v15 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = v10;
  if (WeakRetained && v10)
  {
    id v12 = (void *)MEMORY[0x1E4F1CA18];
    id v13 = objc_msgSend(WeakRetained, "methodSignatureForSelector:", *(void *)(a1 + 48), v15, v16, v17, v18);
    v14 = [v12 invocationWithMethodSignature:v13];

    [v14 setSelector:*(void *)(a1 + 48)];
    [v14 setTarget:WeakRetained];
    [v14 setArgument:&v18 atIndex:2];
    [v14 setArgument:v11 + 48 atIndex:3];
    [v14 setArgument:&v17 atIndex:4];
    [v14 setArgument:&v16 atIndex:5];
    [v14 setArgument:&v15 atIndex:6];
    [v14 invoke];
  }
}

- (void)registerListenerForMessageType:(unsigned __int16)a3 isRequest:(BOOL)a4 referenceObject:(id)a5 onMessageReceived:(id)a6
{
}

- (void)registerListenerForMessageType:(unsigned __int16)a3 isRequest:(BOOL)a4 referenceObject:(id)a5 queue:(id)a6 onMessageReceived:(id)a7
{
  BOOL v9 = a4;
  uint64_t v10 = a3;
  p_lock = &self->_lock;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  os_unfair_lock_lock(p_lock);
  id v16 = [[PKIDSServiceListenerRegistrationKey alloc] initWithMessageType:v10 isRequest:v9];
  uint64_t v17 = [(NSMutableDictionary *)self->_listeners objectForKeyedSubscript:v16];
  if (v17)
  {
    id v18 = (void *)v17;
    v19 = [[PKIDSServiceListener alloc] initWithReferenceObject:v15 onMessageReceived:v13];

    [(PKIDSServiceListener *)v19 setReplyQueue:v14];
    [v18 addObject:v19];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_listeners setObject:v20 forKeyedSubscript:v16];
    v21 = [[PKIDSServiceListener alloc] initWithReferenceObject:v15 onMessageReceived:v13];

    [(PKIDSServiceListener *)v21 setReplyQueue:v14];
    [v20 addObject:v21];

    os_unfair_lock_unlock(p_lock);
    underlyingService = self->_underlyingService;
    if (v9)
    {
      [(IDSService *)underlyingService setProtobufAction:sel__receivedRequestMessage_service_account_fromID_context_ forIncomingRequestsOfType:v10];
    }
    else
    {
      [(IDSService *)underlyingService setProtobufAction:sel__receivedResponseMessage_service_account_fromID_context_ forIncomingResponsesOfType:v10];
    }
  }
}

- (void)_receivedRequestMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)_receivedResponseMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)_receivedMessage:(id)a3 isRequest:(BOOL)a4 service:(id)a5 account:(id)a6 fromID:(id)a7 context:(id)a8
{
  BOOL v11 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v18 = -[PKIDSServiceListenerRegistrationKey initWithMessageType:isRequest:]([PKIDSServiceListenerRegistrationKey alloc], "initWithMessageType:isRequest:", [v13 type], v11);
  v19 = [(NSMutableDictionary *)self->_listeners objectForKeyedSubscript:v18];
  id v20 = objc_msgSend(v19, "pk_objectsPassingTest:", &__block_literal_global_78);
  v21 = (void *)[v20 mutableCopy];

  [(NSMutableDictionary *)self->_listeners setObject:v21 forKeyedSubscript:v18];
  v22 = (void *)[v21 copy];

  os_unfair_lock_unlock(p_lock);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v22;
  uint64_t v23 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v28 = [v27 replyQueue];
        if (v28)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __74__PKIDSService__receivedMessage_isRequest_service_account_fromID_context___block_invoke_2;
          block[3] = &unk_1E56DB960;
          block[4] = v27;
          id v32 = v13;
          id v33 = v14;
          id v34 = v15;
          id v35 = v16;
          dispatch_async(v28, block);
        }
        else
        {
          v29 = [v27 onMessageReceived];
          ((void (**)(void, id, id, id, id))v29)[2](v29, v13, v14, v15, v16);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v24);
  }
}

BOOL __74__PKIDSService__receivedMessage_isRequest_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 referenceObject];
  BOOL v3 = v2 != 0;

  return v3;
}

void __74__PKIDSService__receivedMessage_isRequest_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) onMessageReceived];
  (*((void (**)(id, void, void, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (void)unregisterListenersForTarget:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(NSMutableDictionary *)self->_listeners allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->_listeners objectForKeyedSubscript:v9];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __45__PKIDSService_unregisterListenersForTarget___block_invoke;
        v15[3] = &unk_1E56E41B0;
        id v16 = v4;
        BOOL v11 = objc_msgSend(v10, "pk_objectsPassingTest:", v15);
        id v12 = (void *)[v11 mutableCopy];

        if ([v12 count]) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
        [(NSMutableDictionary *)self->_listeners setObject:v13 forKeyedSubscript:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

BOOL __45__PKIDSService_unregisterListenersForTarget___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 referenceObject];
  BOOL v4 = v3 != *(void **)(a1 + 32);

  return v4;
}

- (void)addDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_delegates addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_delegates removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__PKIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
  v18[3] = &unk_1E56E41D8;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(PKIDSService *)self _enumerateDelegatesWithBlock:v18];
}

void __71__PKIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:a1[4] account:a1[5] identifier:a1[6] hasBeenDeliveredWithContext:a1[7]];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__PKIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
  v22[3] = &unk_1E56E4200;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  [(PKIDSService *)self _enumerateDelegatesWithBlock:v22];
}

void __73__PKIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:a1[4] account:a1[5] incomingUnhandledProtobuf:a1[6] fromID:a1[7] context:a1[8]];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__PKIDSService_service_account_identifier_didSendWithSuccess_error_context___block_invoke;
  v24[3] = &unk_1E56E4228;
  id v25 = v14;
  id v26 = v15;
  BOOL v30 = a6;
  id v27 = v16;
  id v28 = v17;
  id v29 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  [(PKIDSService *)self _enumerateDelegatesWithBlock:v24];
}

void __76__PKIDSService_service_account_identifier_didSendWithSuccess_error_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 service:*(void *)(a1 + 32) account:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) didSendWithSuccess:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 56)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 service:*(void *)(a1 + 32) account:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) didSendWithSuccess:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
  }
}

- (void)_enumerateDelegatesWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)[(NSHashTable *)self->_delegates copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        replyQueue = self->_replyQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__PKIDSService__enumerateDelegatesWithBlock___block_invoke;
        block[3] = &unk_1E56D83D8;
        id v12 = v4;
        block[4] = v10;
        id v15 = v12;
        dispatch_async(replyQueue, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __45__PKIDSService__enumerateDelegatesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (IDSService)underlyingService
{
  return self->_underlyingService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingService, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end