@interface NPKStandaloneFirstUnlockCoordinator
- (NPKStandaloneFirstUnlockCoordinator)initWithQueue:(id)a3;
- (NSMutableArray)blocksToPerformAfterFirstDeviceUnlock;
- (OS_dispatch_queue)queue;
- (int)firstDeviceUnlockRegistrationToken;
- (void)_performFirstUnlockWork;
- (void)dealloc;
- (void)performSubjectToFirstUnlock:(id)a3;
- (void)setBlocksToPerformAfterFirstDeviceUnlock:(id)a3;
- (void)setFirstDeviceUnlockRegistrationToken:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation NPKStandaloneFirstUnlockCoordinator

- (NPKStandaloneFirstUnlockCoordinator)initWithQueue:(id)a3
{
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NPKStandaloneFirstUnlockCoordinator;
  v6 = [(NPKStandaloneFirstUnlockCoordinator *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    blocksToPerformAfterFirstDeviceUnlock = v7->_blocksToPerformAfterFirstDeviceUnlock;
    v7->_blocksToPerformAfterFirstDeviceUnlock = (NSMutableArray *)v8;

    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__NPKStandaloneFirstUnlockCoordinator_initWithQueue___block_invoke;
    v11[3] = &unk_2644D2870;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v7->_firstDeviceUnlockRegistrationToken, v5, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__NPKStandaloneFirstUnlockCoordinator_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: First unlock detected", v5, 2u);
    }
  }
  if (WeakRetained)
  {
    [WeakRetained _performFirstUnlockWork];
    if (notify_is_valid_token([WeakRetained firstDeviceUnlockRegistrationToken]))
    {
      notify_cancel([WeakRetained firstDeviceUnlockRegistrationToken]);
      [WeakRetained setFirstDeviceUnlockRegistrationToken:0xFFFFFFFFLL];
    }
  }
}

- (void)dealloc
{
  if (notify_is_valid_token([(NPKStandaloneFirstUnlockCoordinator *)self firstDeviceUnlockRegistrationToken]))
  {
    notify_cancel([(NPKStandaloneFirstUnlockCoordinator *)self firstDeviceUnlockRegistrationToken]);
    [(NPKStandaloneFirstUnlockCoordinator *)self setFirstDeviceUnlockRegistrationToken:0xFFFFFFFFLL];
  }
  v3.receiver = self;
  v3.super_class = (Class)NPKStandaloneFirstUnlockCoordinator;
  [(NPKStandaloneFirstUnlockCoordinator *)&v3 dealloc];
}

- (void)performSubjectToFirstUnlock:(id)a3
{
  id v4 = a3;
  v5 = [(NPKStandaloneFirstUnlockCoordinator *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(NPKStandaloneFirstUnlockCoordinator *)self blocksToPerformAfterFirstDeviceUnlock];
  v7 = (void *)MEMORY[0x223C37380](v4);

  [v6 addObject:v7];
  if (NPKProtectedDataAvailable())
  {
    [(NPKStandaloneFirstUnlockCoordinator *)self _performFirstUnlockWork];
  }
  else
  {
    uint64_t v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Deferring work until first device unlock", v11, 2u);
      }
    }
  }
}

- (void)_performFirstUnlockWork
{
  objc_super v3 = [(NPKStandaloneFirstUnlockCoordinator *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(NPKStandaloneFirstUnlockCoordinator *)self blocksToPerformAfterFirstDeviceUnlock];
  id v4 = [MEMORY[0x263EFF980] array];
  [(NPKStandaloneFirstUnlockCoordinator *)self setBlocksToPerformAfterFirstDeviceUnlock:v4];

  [v5 enumerateObjectsUsingBlock:&__block_literal_global_21];
}

uint64_t __62__NPKStandaloneFirstUnlockCoordinator__performFirstUnlockWork__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)blocksToPerformAfterFirstDeviceUnlock
{
  return self->_blocksToPerformAfterFirstDeviceUnlock;
}

- (void)setBlocksToPerformAfterFirstDeviceUnlock:(id)a3
{
}

- (int)firstDeviceUnlockRegistrationToken
{
  return self->_firstDeviceUnlockRegistrationToken;
}

- (void)setFirstDeviceUnlockRegistrationToken:(int)a3
{
  self->_firstDeviceUnlockRegistrationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksToPerformAfterFirstDeviceUnlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end