@interface UpgradeInterfaceLock
+ (id)getSharedInstance;
- (BOOL)_isLockedOnQueue;
- (BOOL)isLocked;
- (NSMutableArray)onNextLockReleaseCallbacks;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (OS_xpc_object)lockConn;
- (UpgradeInterfaceLock)init;
- (id)_acquireLockOnQueue;
- (id)_createXPCRequest;
- (id)acquireLock;
- (int)releaseLock;
- (void)_handleXPCMessage:(id)a3;
- (void)_onNextLockRelease:(id)a3;
- (void)dealloc;
- (void)setLockConn:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation UpgradeInterfaceLock

+ (id)getSharedInstance
{
  if (getSharedInstance_onceToken != -1) {
    dispatch_once(&getSharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)getSharedInstance_gLockState;

  return v2;
}

uint64_t __41__UpgradeInterfaceLock_getSharedInstance__block_invoke()
{
  getSharedInstance_gLockState = objc_alloc_init(UpgradeInterfaceLock);

  return MEMORY[0x270F9A758]();
}

- (UpgradeInterfaceLock)init
{
  v12.receiver = self;
  v12.super_class = (Class)UpgradeInterfaceLock;
  v2 = [(UpgradeInterfaceLock *)&v12 init];
  v3 = v2;
  if (v2)
  {
    lockConn = v2->_lockConn;
    v2->_lockConn = 0;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.security.libcryptex.interface.upgrade_lock", MEMORY[0x263EF83A8]);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    os_log_t v7 = os_log_create("com.apple.libcryptex", "upgrade_lock");
    log = v3->_log;
    v3->_log = (OS_os_log *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    onNextLockReleaseCallbacks = v3->_onNextLockReleaseCallbacks;
    v3->_onNextLockReleaseCallbacks = v9;
  }
  return v3;
}

- (void)dealloc
{
  lockConn = self->_lockConn;
  if (lockConn)
  {
    xpc_connection_cancel(lockConn);
    v4 = self->_lockConn;
    self->_lockConn = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)UpgradeInterfaceLock;
  [(UpgradeInterfaceLock *)&v5 dealloc];
}

- (BOOL)isLocked
{
  v2 = self;
  uint64_t v6 = 0;
  os_log_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(UpgradeInterfaceLock *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__UpgradeInterfaceLock_isLocked__block_invoke;
  v5[3] = &unk_26443DA40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __32__UpgradeInterfaceLock_isLocked__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isLockedOnQueue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)releaseLock
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = -1;
  dispatch_group_t v3 = dispatch_group_create();
  if (v3)
  {
    v4 = [(UpgradeInterfaceLock *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__UpgradeInterfaceLock_releaseLock__block_invoke;
    block[3] = &unk_26443DA68;
    block[4] = self;
    v13 = &v14;
    objc_super v5 = v3;
    objc_super v12 = v5;
    dispatch_barrier_sync(v4, block);

    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    intptr_t v7 = dispatch_group_wait(v5, v6);
    uint64_t v8 = v15;
    if (!v7)
    {
      int v9 = 0;
      *((_DWORD *)v15 + 6) = 0;
      goto LABEL_7;
    }
    int v9 = 60;
  }
  else
  {
    uint64_t v8 = v15;
    int v9 = 12;
  }
  *((_DWORD *)v8 + 6) = v9;
LABEL_7:
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __35__UpgradeInterfaceLock_releaseLock__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lockConn];

  if (v2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __35__UpgradeInterfaceLock_releaseLock__block_invoke_2;
    v5[3] = &unk_26443D918;
    dispatch_group_t v3 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v3 _onNextLockRelease:v5];
    v4 = [*(id *)(a1 + 32) lockConn];
    xpc_connection_cancel(v4);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 57;
  }
}

void __35__UpgradeInterfaceLock_releaseLock__block_invoke_2(uint64_t a1)
{
}

- (id)acquireLock
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  dispatch_group_t v3 = [(UpgradeInterfaceLock *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__UpgradeInterfaceLock_acquireLock__block_invoke;
  v6[3] = &unk_26443DA40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __35__UpgradeInterfaceLock_acquireLock__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _acquireLockOnQueue];

  return MEMORY[0x270F9A758]();
}

- (void)_onNextLockRelease:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UpgradeInterfaceLock *)self queue];
  dispatch_assert_queue_barrier(v5);

  id v7 = [(UpgradeInterfaceLock *)self onNextLockReleaseCallbacks];
  id v6 = (void *)MEMORY[0x21D4B9A70](v4);

  [v7 addObject:v6];
}

- (id)_createXPCRequest
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "SUBSYSTEM", "UPGRADE_LOCK");

  return empty;
}

- (BOOL)_isLockedOnQueue
{
  v2 = self;
  dispatch_group_t v3 = [(UpgradeInterfaceLock *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(UpgradeInterfaceLock *)v2 lockConn];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)_acquireLockOnQueue
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  dispatch_group_t v3 = [(UpgradeInterfaceLock *)self queue];
  dispatch_assert_queue_barrier(v3);

  if (![(UpgradeInterfaceLock *)self _isLockedOnQueue])
  {
    v10 = [(UpgradeInterfaceLock *)self queue];
    connection = cryptex_xpc_create_connection(v10);

    if (connection)
    {
      id v7 = [(UpgradeInterfaceLock *)self _createXPCRequest];
      if (!v7)
      {
        v15 = [(UpgradeInterfaceLock *)self log];

        if (v15)
        {
          uint64_t v16 = [(UpgradeInterfaceLock *)self log];
          os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          int v17 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_WORD *)buf = 0;
          int v17 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef Error = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 170, "com.apple.security.cryptex", 24, 0, v17);
        free(v17);
        id v6 = Error;
        uint64_t v8 = 0;
        goto LABEL_39;
      }
      xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(connection, v7);
      uint64_t v8 = v11;
      if (v11)
      {
        if (MEMORY[0x21D4B9D80](v11) == MEMORY[0x263EF8720])
        {
          v22 = (void *)MEMORY[0x21D4B9C60](v8);
          v23 = [(UpgradeInterfaceLock *)self log];

          if (v23)
          {
            v24 = [(UpgradeInterfaceLock *)self log];
            os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 136446210;
            v45 = v22;
            v25 = (char *)_os_log_send_and_compose_impl();
          }
          else
          {
            *(_DWORD *)buf = 136446210;
            v45 = v22;
            v25 = (char *)_os_log_send_and_compose_impl();
          }
          CFErrorRef v39 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 186, "com.apple.security.cryptex", 16, 0, v25);
          free(v25);
          id v6 = v39;
          free(v22);
          goto LABEL_39;
        }
        id v6 = 0;
      }
      else
      {
        v18 = [(UpgradeInterfaceLock *)self log];

        if (v18)
        {
          v19 = [(UpgradeInterfaceLock *)self log];
          os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v20 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_WORD *)buf = 0;
          v20 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef v27 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 179, "com.apple.security.cryptex", 16, 0, v20);
        free(v20);
        id v6 = v27;
      }
      int cferr = _xpc_dictionary_try_get_cferr(v8, "upgrade_lock_error", (CFErrorRef *)&cf);
      if ((cferr | 2) != 2)
      {
        v32 = [(UpgradeInterfaceLock *)self log];

        if (v32)
        {
          v33 = [(UpgradeInterfaceLock *)self log];
          os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = cferr;
          v34 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = cferr;
          v34 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef v38 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 201, "com.apple.security.cryptex", 16, 0, v34);
        free(v34);
        v37 = v38;

        goto LABEL_36;
      }
      if (cf)
      {
        v29 = [(UpgradeInterfaceLock *)self log];

        if (v29)
        {
          v30 = [(UpgradeInterfaceLock *)self log];
          os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v31 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_WORD *)buf = 0;
          v31 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef v36 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 210, "com.apple.security.cryptex", 25, cf, v31);
        free(v31);
        v37 = v36;

LABEL_36:
        id v6 = v37;
LABEL_39:
        xpc_connection_cancel(connection);
        goto LABEL_40;
      }
      [(UpgradeInterfaceLock *)self setLockConn:connection];

      v35 = [(UpgradeInterfaceLock *)self lockConn];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __43__UpgradeInterfaceLock__acquireLockOnQueue__block_invoke;
      handler[3] = &unk_26443DA90;
      handler[4] = self;
      xpc_connection_set_event_handler(v35, handler);
    }
    else
    {
      id v12 = [(UpgradeInterfaceLock *)self log];

      if (v12)
      {
        v13 = [(UpgradeInterfaceLock *)self log];
        os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        *(_WORD *)buf = 0;
        uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_WORD *)buf = 0;
        uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v21 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 161, "com.apple.security.cryptex", 23, 0, v14);
      free(v14);
      id v6 = v21;
      id v7 = 0;
      uint64_t v8 = 0;
    }
    connection = 0;
    goto LABEL_40;
  }
  int v4 = *__error();
  objc_super v5 = [(UpgradeInterfaceLock *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21CC4F000, v5, OS_LOG_TYPE_DEBUG, "Upgrade interface is already locked by the current process.", buf, 2u);
  }

  id v6 = 0;
  id v7 = 0;
  uint64_t v8 = 0;
  connection = 0;
  *__error() = v4;
LABEL_40:
  v40 = v6;

  if (cf) {
    CFRelease(cf);
  }

  return v40;
}

uint64_t __43__UpgradeInterfaceLock__acquireLockOnQueue__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleXPCMessage:a2];
}

- (void)_handleXPCMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x21D4B9C60](v4);
    if (MEMORY[0x21D4B9D80](v5) == MEMORY[0x263EF8720])
    {
      int v12 = *__error();
      v13 = [(UpgradeInterfaceLock *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        int v17 = v6;
        _os_log_impl(&dword_21CC4F000, v13, OS_LOG_TYPE_DEBUG, "XPC error while upgrade interface was locked: %{public}s", buf, 0xCu);
      }

      *__error() = v12;
      uint64_t v14 = [(UpgradeInterfaceLock *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__UpgradeInterfaceLock__handleXPCMessage___block_invoke;
      block[3] = &unk_26443D918;
      block[4] = self;
      dispatch_barrier_async(v14, block);
    }
    else
    {
      int v7 = *__error();
      uint64_t v8 = [(UpgradeInterfaceLock *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        int v17 = v6;
        __int16 v18 = 1024;
        int v19 = 5;
        _os_log_impl(&dword_21CC4F000, v8, OS_LOG_TYPE_ERROR, "Unexpected message: %{public}s: %{darwin.errno}d", buf, 0x12u);
      }

      *__error() = v7;
      uint64_t v9 = [(UpgradeInterfaceLock *)self lockConn];
      xpc_connection_cancel(v9);
    }
  }
  else
  {
    int v10 = *__error();
    xpc_object_t v11 = [(UpgradeInterfaceLock *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 22;
      _os_log_impl(&dword_21CC4F000, v11, OS_LOG_TYPE_ERROR, "Invalid input.: %{darwin.errno}d", buf, 8u);
    }

    id v6 = 0;
    *__error() = v10;
  }
  free(v6);
}

uint64_t __42__UpgradeInterfaceLock__handleXPCMessage___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [*(id *)(a1 + 32) onNextLockReleaseCallbacks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  int v7 = [*(id *)(a1 + 32) onNextLockReleaseCallbacks];
  [v7 removeAllObjects];

  return [*(id *)(a1 + 32) setLockConn:0];
}

- (OS_xpc_object)lockConn
{
  return self->_lockConn;
}

- (void)setLockConn:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableArray)onNextLockReleaseCallbacks
{
  return self->_onNextLockReleaseCallbacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onNextLockReleaseCallbacks, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_lockConn, 0);
}

@end