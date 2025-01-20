@interface TSClockInterface
- (TSClock)clock;
- (TSClockInterface)initWithClockIdentifier:(unint64_t)a3;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didEndClockGrandmasterChangeForClock:(id)a3;
- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)setClock:(id)a3;
- (void)setLockStateNotificationCallback:(void *)a3 refcon:(void *)a4;
- (void)setMasterChangeNotificationCallback:(void *)a3 refcon:(void *)a4;
- (void)setTimeSyncTimeChangeNotificationCallback:(void *)a3 refcon:(void *)a4;
- (void)setgPTPGrandmasterIDAndPortNotificationCallback:(void *)a3 refcon:(void *)a4;
- (void)setgPTPGrandmasterNotificationCallback:(void *)a3 refcon:(void *)a4;
- (void)setgPTPLocalPortNotificationCallback:(void *)a3 refcon:(void *)a4;
@end

@implementation TSClockInterface

- (TSClockInterface)initWithClockIdentifier:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)TSClockInterface;
  v4 = [(TSClockInterface *)&v15 init];
  if (v4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.timesync.TSClockInterface.0x%016llx.notifications", a3);
    id v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    notificationsQueue = v4->_notificationsQueue;
    v4->_notificationsQueue = (OS_dispatch_queue *)v6;

    int v8 = 20;
    while (1)
    {
      v9 = +[TSClockManager sharedClockManager];
      uint64_t v10 = [v9 clockWithClockIdentifier:a3];
      clock = v4->_clock;
      v4->_clock = (TSClock *)v10;

      [(TSClock *)v4->_clock addClient:v4];
      if (v4->_clock) {
        break;
      }
      usleep(0x186A0u);
      v12 = v4->_clock;
      BOOL v13 = v8-- != 0;
      if (v12 || v8 == 0 || !v13)
      {
        if (!v12)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v17 = "_clock != nil";
            __int16 v18 = 2048;
            uint64_t v19 = 0;
            __int16 v20 = 2048;
            uint64_t v21 = 0;
            __int16 v22 = 2080;
            v23 = "";
            __int16 v24 = 2080;
            v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
            __int16 v26 = 1024;
            int v27 = 150;
            _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
          }

          return 0;
        }
        return v4;
      }
    }
  }
  return v4;
}

- (void)setLockStateNotificationCallback:(void *)a3 refcon:(void *)a4
{
  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TSClockInterface_setLockStateNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E622B2D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void *__60__TSClockInterface_setLockStateNotificationCallback_refcon___block_invoke(void *result)
{
  *(void *)(result[4] + 16) = result[5];
  *(void *)(result[4] + 24) = result[6];
  return result;
}

- (void)setMasterChangeNotificationCallback:(void *)a3 refcon:(void *)a4
{
  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__TSClockInterface_setMasterChangeNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E622B2D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void *__63__TSClockInterface_setMasterChangeNotificationCallback_refcon___block_invoke(void *result)
{
  *(void *)(result[4] + 32) = result[5];
  *(void *)(result[4] + 40) = result[6];
  return result;
}

- (void)setTimeSyncTimeChangeNotificationCallback:(void *)a3 refcon:(void *)a4
{
  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__TSClockInterface_setTimeSyncTimeChangeNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E622B2D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void __69__TSClockInterface_setTimeSyncTimeChangeNotificationCallback_refcon___block_invoke(void *a1)
{
  v2 = +[TSClockManager sharedClockManager];
  id v7 = [v2 translationClock];

  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void *)(v3 + 48);
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    objc_msgSend(v7, "removeClient:");
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
  }
  *(void *)(v3 + 48) = v4;
  *(void *)(a1[4] + 56) = a1[6];
  if (a1[5] && !v5) {
    [v7 addClient:a1[4]];
  }
}

- (void)setgPTPGrandmasterNotificationCallback:(void *)a3 refcon:(void *)a4
{
  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__TSClockInterface_setgPTPGrandmasterNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E622B2D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void *__66__TSClockInterface_setgPTPGrandmasterNotificationCallback_refcon___block_invoke(void *result)
{
  *(void *)(result[4] + 64) = result[5];
  *(void *)(result[4] + 72) = result[6];
  return result;
}

- (void)setgPTPGrandmasterIDAndPortNotificationCallback:(void *)a3 refcon:(void *)a4
{
  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__TSClockInterface_setgPTPGrandmasterIDAndPortNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E622B2D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void *__75__TSClockInterface_setgPTPGrandmasterIDAndPortNotificationCallback_refcon___block_invoke(void *result)
{
  *(void *)(result[4] + 80) = result[5];
  *(void *)(result[4] + 88) = result[6];
  return result;
}

- (void)setgPTPLocalPortNotificationCallback:(void *)a3 refcon:(void *)a4
{
  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__TSClockInterface_setgPTPLocalPortNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E622B2D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void *__64__TSClockInterface_setgPTPLocalPortNotificationCallback_refcon___block_invoke(void *result)
{
  *(void *)(result[4] + 96) = result[5];
  *(void *)(result[4] + 104) = result[6];
  return result;
}

- (void)didChangeClockMasterForClock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (TSClock *)a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(TSClockInterface *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = [v5 UTF8String];
    __int16 v13 = 2048;
    uint64_t v14 = [(TSClock *)v4 clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s didChangeClockMasterForClock:0x%016llx\n", buf, 0x16u);
  }
  notificationsQueue = self->_notificationsQueue;
  if (self->_clock == v4)
  {
    id v7 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    int v8 = __49__TSClockInterface_didChangeClockMasterForClock___block_invoke;
  }
  else
  {
    id v7 = v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    int v8 = __49__TSClockInterface_didChangeClockMasterForClock___block_invoke_71;
  }
  v7[2] = v8;
  v7[3] = &unk_1E622A8F8;
  v7[4] = self;
  dispatch_async(notificationsQueue, v7);
}

void __49__TSClockInterface_didChangeClockMasterForClock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    v2 = (void *)MEMORY[0x1BA9F1DF0]();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      uint64_t v4 = [v3 UTF8String];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v5 + 32);
      uint64_t v6 = *(void *)(v5 + 40);
      int v13 = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s calling master changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);
    }
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 32))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 40));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) description];
      uint64_t v9 = [v8 UTF8String];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v10 + 32);
      uint64_t v11 = *(void *)(v10 + 40);
      int v13 = 136315650;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished master changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);
    }
  }
}

void __49__TSClockInterface_didChangeClockMasterForClock___block_invoke_71(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    v2 = (void *)MEMORY[0x1BA9F1DF0]();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      uint64_t v4 = [v3 UTF8String];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v5 + 48);
      uint64_t v6 = *(void *)(v5 + 56);
      int v13 = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s calling tiesynctime changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);
    }
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 48))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 56));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) description];
      uint64_t v9 = [v8 UTF8String];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v10 + 48);
      uint64_t v11 = *(void *)(v10 + 56);
      int v13 = 136315650;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished tiesynctime changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(TSClockInterface *)self description];
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = [v7 UTF8String];
    __int16 v16 = 1024;
    *(_DWORD *)__int16 v17 = a3;
    *(_WORD *)&v17[4] = 2048;
    *(void *)&v17[6] = [v6 clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s didChangeLockStateTo:%d forClock:0x%016llx\n", buf, 0x1Cu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(TSClockInterface *)self description];
    uint64_t v9 = [v8 UTF8String];
    uint64_t v10 = [v6 clockIdentifier];
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    *(void *)__int16 v17 = v10;
    *(_WORD *)&v17[8] = 1024;
    *(_DWORD *)&v17[10] = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Lock state] Client %s received lock state change for clock 0x%016llx to %d", buf, 0x1Cu);
  }
  notificationsQueue = self->_notificationsQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__TSClockInterface_didChangeLockStateTo_forClock___block_invoke;
  v12[3] = &unk_1E622AB48;
  v12[4] = self;
  int v13 = a3;
  dispatch_async(notificationsQueue, v12);
}

void __50__TSClockInterface_didChangeLockStateTo_forClock___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1BA9F1DF0]();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      uint64_t v4 = [v3 UTF8String];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v5 + 16);
      uint64_t v6 = *(void *)(v5 + 24);
      int v8 = *(_DWORD *)(a1 + 40);
      int v15 = 136315906;
      uint64_t v16 = v4;
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v6;
      __int16 v21 = 1024;
      int v22 = v8;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s calling lock state callback function %p refcon %p lockstate %d\n", (uint8_t *)&v15, 0x26u);
    }
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 24), *(unsigned int *)(a1 + 40));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) description];
      uint64_t v10 = [v9 UTF8String];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(v11 + 16);
      uint64_t v12 = *(void *)(v11 + 24);
      int v14 = *(_DWORD *)(a1 + 40);
      int v15 = 136315906;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v12;
      __int16 v21 = 1024;
      int v22 = v14;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished lock state callback function %p refcon %p lockstate %d\n", (uint8_t *)&v15, 0x26u);
    }
  }
}

- (void)didEndClockGrandmasterChangeForClock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(TSClockInterface *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = [v5 UTF8String];
    __int16 v16 = 2048;
    uint64_t v17 = [v4 clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s didEndClockGrandmasterChangeForClock:0x%016llx\n", buf, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(TSClockInterface *)self description];
    uint64_t v7 = [v6 UTF8String];
    uint64_t v8 = [v4 clockIdentifier];
    uint64_t v9 = [v4 grandmasterIdentity];
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[GM Change] Client %s received GM change callback for clock 0x%016llx to GMID 0x%016llx", buf, 0x20u);
  }
  notificationsQueue = self->_notificationsQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__TSClockInterface_didEndClockGrandmasterChangeForClock___block_invoke;
  v12[3] = &unk_1E622AAB0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(notificationsQueue, v12);
}

void __57__TSClockInterface_didEndClockGrandmasterChangeForClock___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    v2 = (void *)MEMORY[0x1BA9F1DF0]();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      uint64_t v4 = [v3 UTF8String];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 64);
      uint64_t v7 = *(void *)(v5 + 72);
      uint64_t v8 = [*(id *)(a1 + 40) clockIdentifier];
      uint64_t v9 = [*(id *)(a1 + 40) grandmasterIdentity];
      int v17 = 136316162;
      uint64_t v18 = v4;
      __int16 v19 = 2048;
      uint64_t v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s calling end grandmaster changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx\n", (uint8_t *)&v17, 0x34u);
    }
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 64))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 72), [*(id *)(a1 + 40) grandmasterIdentity]);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 32) description];
      uint64_t v11 = [v10 UTF8String];
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(v12 + 64);
      uint64_t v14 = *(void *)(v12 + 72);
      uint64_t v15 = [*(id *)(a1 + 40) clockIdentifier];
      uint64_t v16 = [*(id *)(a1 + 40) grandmasterIdentity];
      int v17 = 136316162;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished end grandmaster changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx\n", (uint8_t *)&v17, 0x34u);
    }
  }
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(TSClockInterface *)self description];
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = [v9 UTF8String];
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 1024;
    int v24 = v5;
    __int16 v25 = 2048;
    unint64_t v26 = [v8 clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s didEndClockGrandmasterChangeWithGrandmasterID:0x%016llx localPort:%hu forClock:0x%016llx\n", buf, 0x26u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(TSClockInterface *)self description];
    uint64_t v11 = [v10 UTF8String];
    uint64_t v12 = [v8 clockIdentifier];
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    unint64_t v22 = v12;
    __int16 v23 = 1024;
    int v24 = v5;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[GM Change] Client %s received GM change callback for clock 0x%016llx, port %hu, to GMID 0x%016llx", buf, 0x26u);
  }
  notificationsQueue = self->_notificationsQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__TSClockInterface_didEndClockGrandmasterChangeWithGrandmasterID_localPort_forClock___block_invoke;
  v15[3] = &unk_1E622B2F8;
  v15[4] = self;
  id v16 = v8;
  unint64_t v17 = a3;
  __int16 v18 = v5;
  id v14 = v8;
  dispatch_async(notificationsQueue, v15);
}

void __85__TSClockInterface_didEndClockGrandmasterChangeWithGrandmasterID_localPort_forClock___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    v2 = (void *)MEMORY[0x1BA9F1DF0]();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      uint64_t v4 = [v3 UTF8String];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 80);
      uint64_t v7 = *(void *)(v5 + 88);
      uint64_t v8 = [*(id *)(a1 + 40) clockIdentifier];
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = *(unsigned __int16 *)(a1 + 56);
      int v19 = 136316418;
      uint64_t v20 = v4;
      __int16 v21 = 2048;
      uint64_t v22 = v6;
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      __int16 v27 = 2048;
      uint64_t v28 = v9;
      __int16 v29 = 1024;
      int v30 = v10;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s calling end grandmaster and port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);
    }
    (*(void (**)(void, void, void, void))(*(void *)(a1 + 32) + 80))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 88), *(void *)(a1 + 48), *(unsigned __int16 *)(a1 + 56));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 32) description];
      uint64_t v12 = [v11 UTF8String];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v13 + 80);
      uint64_t v15 = *(void *)(v13 + 88);
      uint64_t v16 = [*(id *)(a1 + 40) clockIdentifier];
      uint64_t v17 = *(void *)(a1 + 48);
      int v18 = *(unsigned __int16 *)(a1 + 56);
      int v19 = 136316418;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = v17;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished end grandmaster and port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);
    }
  }
}

- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(TSClockInterface *)self description];
    *(_DWORD *)buf = 136315906;
    uint64_t v17 = [v9 UTF8String];
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    __int16 v20 = 1024;
    int v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = [v8 clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s didChangeLocalPortWithGrandmasterID:0x%016llx localPort:%hu forClock:0x%016llx\n", buf, 0x26u);
  }
  notificationsQueue = self->_notificationsQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__TSClockInterface_didChangeLocalPortWithGrandmasterID_localPort_forClock___block_invoke;
  v12[3] = &unk_1E622B2F8;
  v12[4] = self;
  id v13 = v8;
  unint64_t v14 = a3;
  __int16 v15 = v5;
  id v11 = v8;
  dispatch_async(notificationsQueue, v12);
}

void __75__TSClockInterface_didChangeLocalPortWithGrandmasterID_localPort_forClock___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 96))
  {
    v2 = (void *)MEMORY[0x1BA9F1DF0]();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      uint64_t v4 = [v3 UTF8String];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 96);
      uint64_t v7 = *(void *)(v5 + 104);
      uint64_t v8 = [*(id *)(a1 + 40) clockIdentifier];
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = *(unsigned __int16 *)(a1 + 56);
      int v19 = 136316418;
      uint64_t v20 = v4;
      __int16 v21 = 2048;
      uint64_t v22 = v6;
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      __int16 v27 = 2048;
      uint64_t v28 = v9;
      __int16 v29 = 1024;
      int v30 = v10;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s calling local port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);
    }
    (*(void (**)(void, void, void, void))(*(void *)(a1 + 32) + 96))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 104), *(void *)(a1 + 48), *(unsigned __int16 *)(a1 + 56));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 32) description];
      uint64_t v12 = [v11 UTF8String];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v13 + 96);
      uint64_t v15 = *(void *)(v13 + 104);
      uint64_t v16 = [*(id *)(a1 + 40) clockIdentifier];
      uint64_t v17 = *(void *)(a1 + 48);
      int v18 = *(unsigned __int16 *)(a1 + 56);
      int v19 = 136316418;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = v17;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished local port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);
    }
  }
}

- (TSClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
}

@end