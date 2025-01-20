@interface PLSearchIndexingAccessManager
- (PLSearchIndexingAccessManager)initWithQueue:(id)a3 openBlock:(id)a4 closeBlock:(id)a5 deferCloseSeconds:(unint64_t)a6;
- (void)_closeIfZeroUsers;
- (void)addUser;
- (void)removeUser;
- (void)reset;
@end

@implementation PLSearchIndexingAccessManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_closeBlock, 0);
  objc_storeStrong(&self->_openBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_closeIfZeroUsers
{
}

uint64_t __50__PLSearchIndexingAccessManager__closeIfZeroUsers__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 40))
  {
    if (*(unsigned char *)(v1 + 56))
    {
      *(unsigned char *)(v1 + 56) = 0;
      return (*(uint64_t (**)(void))(*(void *)(*(void *)(result + 32) + 32) + 16))();
    }
  }
  return result;
}

- (void)reset
{
}

void __38__PLSearchIndexingAccessManager_reset__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Access manager reset user count to 0", v4, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 56))
  {
    *(unsigned char *)(v3 + 56) = 0;
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
  }
}

- (void)removeUser
{
  location[1] = (id)MEMORY[0x1E4F143A8];
  location[2] = (id)3221225472;
  location[3] = __43__PLSearchIndexingAccessManager_removeUser__block_invoke;
  location[4] = &unk_1E5870538;
  location[5] = self;
  uint64_t v3 = PLResultWithUnfairLock();
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    objc_initWeak(location, self);
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * self->_deferCloseSeconds);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLSearchIndexingAccessManager_removeUser__block_invoke_2;
    block[3] = &unk_1E5875F08;
    objc_copyWeak(&v8, location);
    dispatch_after(v5, queue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

id __43__PLSearchIndexingAccessManager_removeUser__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2)
  {
    *(void *)(v1 + 40) = v2 - 1;
    int v4 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
      int v9 = 134217984;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Access manager removed user, current user count: %lu", (uint8_t *)&v9, 0xCu);
    }

    v6 = [NSNumber numberWithInt:*(void *)(*(void *)(a1 + 32) + 40) == 0];
  }
  else
  {
    v7 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Access manager unable to remove user, user count already at 0", (uint8_t *)&v9, 2u);
    }

    v6 = (void *)MEMORY[0x1E4F1CC28];
  }
  return v6;
}

void __43__PLSearchIndexingAccessManager_removeUser__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _closeIfZeroUsers];
}

- (void)addUser
{
}

void __40__PLSearchIndexingAccessManager_addUser__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Access manager added user, current user count: %lu", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 40) == 1 && !*(unsigned char *)(v4 + 56))
  {
    *(unsigned char *)(v4 + 56) = 1;
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  }
}

- (PLSearchIndexingAccessManager)initWithQueue:(id)a3 openBlock:(id)a4 closeBlock:(id)a5 deferCloseSeconds:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLSearchIndexingAccessManager;
  v14 = [(PLSearchIndexingAccessManager *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [v12 copy];
    id openBlock = v15->_openBlock;
    v15->_id openBlock = (id)v16;

    uint64_t v18 = [v13 copy];
    id closeBlock = v15->_closeBlock;
    v15->_id closeBlock = (id)v18;

    v15->_deferCloseSeconds = a6;
    objc_storeStrong((id *)&v15->_queue, a3);
  }

  return v15;
}

@end