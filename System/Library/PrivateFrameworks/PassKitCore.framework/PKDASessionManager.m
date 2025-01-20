@interface PKDASessionManager
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PKDASessionManager)initWithQueue:(id)a3 sessionCreationBlock:(id)a4;
- (void)createSession;
- (void)performBlockWithSession:(id)a3;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation PKDASessionManager

- (PKDASessionManager)initWithQueue:(id)a3 sessionCreationBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKDASessionManager;
  v9 = [(PKDASessionManager *)&v17 init];
  if (v9)
  {
    dispatch_group_t v10 = dispatch_group_create();
    dispatchGroup = v9->_dispatchGroup;
    v9->_dispatchGroup = (OS_dispatch_group *)v10;

    objc_storeStrong((id *)&v9->_queue, a3);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    workItems = v9->_workItems;
    v9->_workItems = v12;

    v14 = _Block_copy(v8);
    id sessionCreationBlock = v9->_sessionCreationBlock;
    v9->_id sessionCreationBlock = v14;
  }
  return v9;
}

- (void)performBlockWithSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PKDASessionManager_performBlockWithSession___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__PKDASessionManager_performBlockWithSession___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if ((v2 || ([*(id *)(a1 + 32) createSession], (v2 = *(void **)(*(void *)(a1 + 32) + 24)) != 0))
    && [v2 state] != 2)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 32);
    id v4 = _Block_copy(*(const void **)(a1 + 40));
    [v3 addObject:v4];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __46__PKDASessionManager_performBlockWithSession___block_invoke_2(uint64_t a1)
{
}

- (void)createSession
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  (*((void (**)(void))self->_sessionCreationBlock + 2))();
  v3 = (PKDASession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v3;

  v5 = self->_session;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Starting session: %@", buf, 0xCu);
    }

    dispatchGroup = self->_dispatchGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__PKDASessionManager_createSession__block_invoke;
    block[3] = &unk_1E56D8AE0;
    block[4] = self;
    dispatch_group_notify(dispatchGroup, queue, block);
  }
}

uint64_t __35__PKDASessionManager_createSession__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Ending session: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 24) endSession];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%@: %p; session: %@ >",
                       objc_opt_class(),
                       self,
                       self->_session);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PKDASessionManager_session_didChangeState___block_invoke;
  block[3] = &unk_1E56DF798;
  v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __45__PKDASessionManager_session_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Session state changed: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 24) state];
  if (v4 == result)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6 == 3)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      v13 = *(void **)(v12 + 24);
      *(void *)(v12 + 24) = 0;

      uint64_t result = [*(id *)(*(void *)(a1 + 40) + 32) count];
      if (result)
      {
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Restarting credential management session", buf, 2u);
        }

        return [*(id *)(a1 + 40) createSession];
      }
    }
    else if (v6 == 2)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = *(id *)(*(void *)(a1 + 40) + 32);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))();
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      return [*(id *)(*(void *)(a1 + 40) + 32) removeAllObjects];
    }
  }
  return result;
}

void __45__PKDASessionManager_session_didChangeState___block_invoke_15(uint64_t a1)
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_sessionCreationBlock, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end