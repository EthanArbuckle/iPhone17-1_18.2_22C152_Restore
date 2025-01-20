@interface NNMKSyncEndpoint
- (NNMKSyncEndpoint)initWithQueue:(id)a3;
- (NSMutableDictionary)datesForIDSIdentifiersScheduledToBeResent;
- (NSMutableDictionary)lastResendIntervalByIDSIdentifier;
- (OS_dispatch_queue)endpointQueue;
- (OS_dispatch_queue)resendingQueue;
- (unint64_t)newResendIntervalForPreviousResendInterval:(unint64_t)a3 errorCode:(int64_t)a4;
- (void)dealloc;
- (void)dequeueIDSIdentifierForResend:(id)a3;
- (void)enqueueIDSIdentifierForResend:(id)a3 atDate:(id)a4 silent:(BOOL)a5;
- (void)enqueueIDSIdentifiersForResend:(id)a3;
- (void)resendAllIDSIdentifiers;
- (void)resendReadyIDSIdentifiers;
- (void)setDatesForIDSIdentifiersScheduledToBeResent:(id)a3;
- (void)setEndpointQueue:(id)a3;
- (void)setLastResendIntervalByIDSIdentifier:(id)a3;
- (void)setResendingQueue:(id)a3;
@end

@implementation NNMKSyncEndpoint

- (NNMKSyncEndpoint)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NNMKSyncEndpoint;
  v6 = [(NNMKSyncEndpoint *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointQueue, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.NanoMail.resendingQueue", MEMORY[0x263EF83A8]);
    resendingQueue = v7->_resendingQueue;
    v7->_resendingQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    datesForIDSIdentifiersScheduledToBeResent = v7->_datesForIDSIdentifiersScheduledToBeResent;
    v7->_datesForIDSIdentifiersScheduledToBeResent = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    lastResendIntervalByIDSIdentifier = v7->_lastResendIntervalByIDSIdentifier;
    v7->_lastResendIntervalByIDSIdentifier = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (void)dealloc
{
  resendingQueue = self->_resendingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__NNMKSyncEndpoint_dealloc__block_invoke;
  block[3] = &unk_264E99F20;
  block[4] = self;
  dispatch_sync(resendingQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)NNMKSyncEndpoint;
  [(NNMKSyncEndpoint *)&v4 dealloc];
}

uint64_t __27__NNMKSyncEndpoint_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v2 removeAllObjects];
}

- (void)enqueueIDSIdentifiersForResend:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3)
  {
    objc_super v4 = (NSMutableDictionary *)[a3 mutableCopy];
    datesForIDSIdentifiersScheduledToBeResent = self->_datesForIDSIdentifiersScheduledToBeResent;
    self->_datesForIDSIdentifiersScheduledToBeResent = v4;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = [(NSMutableDictionary *)self->_datesForIDSIdentifiersScheduledToBeResent allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v12 = [(NSMutableDictionary *)self->_datesForIDSIdentifiersScheduledToBeResent objectForKeyedSubscript:v11];
          [(NNMKSyncEndpoint *)self enqueueIDSIdentifierForResend:v11 atDate:v12 silent:0];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)enqueueIDSIdentifierForResend:(id)a3 atDate:(id)a4 silent:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableDictionary *)self->_datesForIDSIdentifiersScheduledToBeResent objectForKeyedSubscript:v8];

  if (v10)
  {
    if (a5) {
      goto LABEL_9;
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_datesForIDSIdentifiersScheduledToBeResent setObject:v9 forKeyedSubscript:v8];
    if (a5) {
      goto LABEL_9;
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke;
  v17[3] = &unk_264E99F48;
  v17[4] = self;
  id v18 = v8;
  uint64_t v11 = (void (**)(void))MEMORY[0x23ED00AC0](v17);
  [v9 timeIntervalSinceNow];
  if (v12 <= 0.0)
  {
    v11[2](v11);
  }
  else
  {
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
    resendingQueue = self->_resendingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_3;
    block[3] = &unk_264E99F70;
    long long v16 = v11;
    dispatch_after(v13, resendingQueue, block);
  }
LABEL_9:
}

void __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_2;
  v3[3] = &unk_264E99F48;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    id v5 = v2;
    v3 = [MEMORY[0x263EFF910] date];
    uint64_t v4 = [v5 compare:v3];

    v2 = v5;
    if (v4 != 1)
    {
      [*(id *)(a1 + 32) resendObjectsForIDSIdentifier:*(void *)(a1 + 40)];
      v2 = v5;
    }
  }
}

uint64_t __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resendReadyIDSIdentifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(NSMutableDictionary *)self->_datesForIDSIdentifiersScheduledToBeResent allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [(NSMutableDictionary *)self->_datesForIDSIdentifiersScheduledToBeResent objectForKeyedSubscript:v8];
        [v9 timeIntervalSinceNow];
        if (v10 <= 0.0) {
          [(NNMKSyncEndpoint *)self resendObjectsForIDSIdentifier:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)resendAllIDSIdentifiers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMutableDictionary *)self->_datesForIDSIdentifiersScheduledToBeResent allKeys];
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
        [(NNMKSyncEndpoint *)self resendObjectsForIDSIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)newResendIntervalForPreviousResendInterval:(unint64_t)a3 errorCode:(int64_t)a4
{
  if (a4 == 27) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 1;
  }
  if (5 * a3 >= 0xE10) {
    return 3600;
  }
  return 5 * a3;
}

- (void)dequeueIDSIdentifierForResend:(id)a3
{
}

- (NSMutableDictionary)datesForIDSIdentifiersScheduledToBeResent
{
  return 0;
}

- (OS_dispatch_queue)endpointQueue
{
  return self->_endpointQueue;
}

- (void)setEndpointQueue:(id)a3
{
}

- (OS_dispatch_queue)resendingQueue
{
  return self->_resendingQueue;
}

- (void)setResendingQueue:(id)a3
{
}

- (void)setDatesForIDSIdentifiersScheduledToBeResent:(id)a3
{
}

- (NSMutableDictionary)lastResendIntervalByIDSIdentifier
{
  return self->_lastResendIntervalByIDSIdentifier;
}

- (void)setLastResendIntervalByIDSIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResendIntervalByIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_datesForIDSIdentifiersScheduledToBeResent, 0);
  objc_storeStrong((id *)&self->_resendingQueue, 0);
  objc_storeStrong((id *)&self->_endpointQueue, 0);
}

@end