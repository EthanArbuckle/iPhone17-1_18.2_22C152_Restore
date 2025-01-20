@interface TVLTimeSync
+ (void)invalidate;
+ (void)timeSyncWithRemoteIPv4:(id)a3 IPv6:(id)a4 interface:(id)a5 session:(id)a6 master:(BOOL)a7 completion:(id)a8;
- (BOOL)isMaster;
- (CUMessageSession)session;
- (NSData)IPv6;
- (NSString)networkInterfaceName;
- (OS_dispatch_semaphore)waitForPTPLock;
- (TSgPTPClock)clock;
- (TVLTimeSync)initWithRemoteIPv4:(id)a3 IPv6:(id)a4 interface:(id)a5;
- (unint64_t)convertToDomainTimeFromHostTime:(unint64_t)a3 grandmasterIdentity:(unint64_t *)a4;
- (unint64_t)convertToHostTimeFromDomainTime:(unint64_t)a3 grandmasterIdentity:(unint64_t *)a4;
- (unsigned)IPv4;
- (void)_clearWaitForPTPClock;
- (void)_startPTPWithSession:(id)a3 completionHandler:(id)a4;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)invalidate;
- (void)negotiateGrandmasterIdentityAttempt:(int64_t)a3 withCompletion:(id)a4;
- (void)setClock:(id)a3;
- (void)setIPv4:(unsigned int)a3;
- (void)setIPv6:(id)a3;
- (void)setMaster:(BOOL)a3;
- (void)setNetworkInterfaceName:(id)a3;
- (void)setSession:(id)a3;
- (void)setWaitForPTPLock:(id)a3;
@end

@implementation TVLTimeSync

+ (void)timeSyncWithRemoteIPv4:(id)a3 IPv6:(id)a4 interface:(id)a5 session:(id)a6 master:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void (**)(void))a8;
  id v18 = a1;
  objc_sync_enter(v18);
  if (_timeSync)
  {
    v17[2](v17);
  }
  else
  {
    v19 = [[TVLTimeSync alloc] initWithRemoteIPv4:v21 IPv6:v14 interface:v15];
    v20 = (void *)_timeSync;
    _timeSync = (uint64_t)v19;

    [(id)_timeSync setMaster:v9];
    [(id)_timeSync _startPTPWithSession:v16 completionHandler:v17];
  }
  objc_sync_exit(v18);
}

- (void)_startPTPWithSession:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_session, a3);
  objc_initWeak(&location, self);
  session = self->_session;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke;
  v14[3] = &unk_26491E688;
  objc_copyWeak(&v15, &location);
  [(CUMessageSession *)session registerRequestID:@"com.apple.tvlatency.timesync" options:0 handler:v14];
  v10 = dispatch_get_global_queue(25, 0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_16;
  v12[3] = &unk_26491E6D8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(v10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    BOOL v9 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v6;
      _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_DEFAULT, "Incoming Grandmaster Sync Request: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_1;
    v24 = &unk_26491E660;
    id v10 = v6;
    id v25 = v10;
    id v26 = v7;
    id v11 = (void (**)(void, void, void, void))MEMORY[0x230F6CE70](&v21);
    v12 = objc_msgSend(v10, "objectForKey:", @"MESSAGE", v21, v22, v23, v24);
    int v13 = [v12 isEqualToString:@"GM"];

    if (v13)
    {
      v27[0] = @"GM";
      id v14 = NSNumber;
      id v15 = [WeakRetained clock];
      id v16 = objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "grandmasterIdentity"));
      v27[1] = @"LOCKED";
      v28[0] = v16;
      v17 = NSNumber;
      id v18 = [WeakRetained clock];
      v19 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "lockState") == 2);
      v28[1] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v20);
    }
  }
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_1(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (_TVLLogDefault_onceToken != -1) {
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  }
  BOOL v9 = (id)_TVLLogDefault_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (a2)
    {
      id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
    }
    else
    {
      id v11 = 0;
    }
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_DEFAULT, "Responding To Grandmaster Sync Request: %{public}@ | Response: %{public}@ | Error: %{public}@", (uint8_t *)&v12, 0x20u);
    if (a2) {
  }
    }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_16(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x263F7F258];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_2;
  v3[3] = &unk_26491E700;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 notifyWhenClockManagerIsAvailable:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F7F258] sharedClockManager];
  id v9 = 0;
  int v3 = [v2 addgPTPServicesWithError:&v9];
  id v4 = v9;

  if (v3)
  {
    id v5 = (void *)MEMORY[0x263F7F268];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3;
    v6[3] = &unk_26491E700;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    id v7 = *(id *)(a1 + 32);
    [v5 notifyWhengPTPManagerIsAvailable:v6];

    objc_destroyWeak(&v8);
  }
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v35 = *MEMORY[0x263F7F278];
  int v3 = [MEMORY[0x263F7F268] sharedgPTPManager];
  id v34 = 0;
  int v4 = [v3 addDomain:&v35 error:&v34];
  id v5 = v34;

  if (v4)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    id v7 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_4;
    block[3] = &unk_26491E6B0;
    block[4] = WeakRetained;
    v28 = &v30;
    uint64_t v29 = v35;
    id v8 = v6;
    v27 = v8;
    dispatch_async(v7, block);

    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v8, v9);
    *((unsigned char *)v31 + 24) = 1;
    __int16 v25 = -1;
    if ([WeakRetained IPv4])
    {
      uint64_t v10 = [WeakRetained clock];
      id v11 = [WeakRetained networkInterfaceName];
      id v24 = 0;
      char v12 = objc_msgSend(v10, "addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", v11, objc_msgSend(WeakRetained, "IPv4"), &v25, &v24);
      id v13 = v24;

      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
      id v13 = [WeakRetained IPv6];

      if (!v13) {
        goto LABEL_9;
      }
      __int16 v14 = [WeakRetained clock];
      id v15 = [WeakRetained networkInterfaceName];
      id v16 = [WeakRetained IPv6];
      id v23 = 0;
      int v17 = objc_msgSend(v14, "addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", v15, objc_msgSend(v16, "bytes"), &v25, &v23);
      id v13 = v23;

      if (!v17) {
        goto LABEL_9;
      }
    }
    uint64_t v18 = [WeakRetained clock];

    if (v18)
    {
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      [WeakRetained setWaitForPTPLock:v19];

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_20;
      v21[3] = &unk_26491E6D8;
      v21[4] = WeakRetained;
      id v22 = *(id *)(a1 + 32);
      dispatch_async(v7, v21);

LABEL_14:
      _Block_object_dispose(&v30, 8);

      goto LABEL_15;
    }
LABEL_9:
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    v20 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_ERROR)) {
      __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3_cold_1((uint64_t)v13, v20);
    }
    +[TVLTimeSync invalidate];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_14;
  }
LABEL_15:
}

intptr_t __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) clock];
  if (v2)
  {
LABEL_2:
  }
  else
  {
    *(void *)&long long v3 = 138543618;
    long long v16 = v3;
    while (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      usleep(0x64u);
      id v5 = [MEMORY[0x263F7F258] sharedClockManager];
      dispatch_semaphore_t v6 = [v5 clockWithClockIdentifier:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) setClock:v6];

      if (_TVLLogDefault_onceToken != -1) {
        dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
      }
      id v7 = (void *)_TVLLogDefault_log;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_INFO))
      {
        id v8 = *(void **)(a1 + 32);
        dispatch_time_t v9 = v7;
        uint64_t v10 = [v8 clock];
        id v11 = [v10 clockName];
        char v12 = [*(id *)(a1 + 32) clock];
        uint64_t v13 = [v12 grandmasterIdentity];
        *(_DWORD *)buf = v16;
        uint64_t v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = v13;
        _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_INFO, "Initialized PTP clock %{public}@ with grandmasterIdentity %llu", buf, 0x16u);
      }
      __int16 v14 = objc_msgSend(*(id *)(a1 + 32), "clock", v16);

      if (v14)
      {
        id v15 = [*(id *)(a1 + 32) clock];
        [v15 addClient:*(void *)(a1 + 32)];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      v2 = [*(id *)(a1 + 32) clock];
      if (v2) {
        goto LABEL_2;
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_20(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) waitForPTPLock];
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v2, v3);

  int v4 = [*(id *)(a1 + 32) clock];
  int v5 = [v4 lockState];

  if (v5 == 1)
  {
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    dispatch_semaphore_t v6 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C7FF000, v6, OS_LOG_TYPE_DEFAULT, "PTP clock is locking. Waiting for lock...", buf, 2u);
    }
    return;
  }
  id v7 = [*(id *)(a1 + 32) clock];
  int v8 = [v7 lockState];

  if (v8 != 2)
  {
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    uint64_t v10 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_ERROR)) {
      __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_20_cold_1(v10);
    }
    [*(id *)(a1 + 32) _clearWaitForPTPClock];
    +[TVLTimeSync invalidate];
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_23;
  }
  if (![*(id *)(a1 + 32) isMaster])
  {
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    char v12 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_22C7FF000, v12, OS_LOG_TYPE_DEFAULT, "PTP clock is locked. Negotiating grandmaster with master remote...", v13, 2u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_23:
    v11();
    return;
  }
  if (_TVLLogDefault_onceToken != -1) {
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  }
  dispatch_time_t v9 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v14 = 0;
    _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_DEFAULT, "PTP clock is locked. Negotiating grandmaster with non-master remote...", v14, 2u);
  }
  [*(id *)(a1 + 32) negotiateGrandmasterIdentityAttempt:1 withCompletion:*(void *)(a1 + 40)];
}

+ (void)invalidate
{
  id obj = a1;
  objc_sync_enter(obj);
  [(id)_timeSync invalidate];
  v2 = (void *)_timeSync;
  _timeSync = 0;

  objc_sync_exit(obj);
}

- (TVLTimeSync)initWithRemoteIPv4:(id)a3 IPv6:(id)a4 interface:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TVLTimeSync;
  id v11 = [(TVLTimeSync *)&v20 init];
  if (v11)
  {
    if (v8) {
      uint64_t v12 = _IPv4ToHostByteOrder(v8);
    }
    else {
      uint64_t v12 = 0;
    }
    [(TVLTimeSync *)v11 setIPv4:v12];
    if (v9)
    {
      uint64_t v13 = _IPv6ToHostByteOrder(v9);
      [(TVLTimeSync *)v11 setIPv6:v13];
    }
    else
    {
      [(TVLTimeSync *)v11 setIPv6:0];
    }
    [(TVLTimeSync *)v11 setNetworkInterfaceName:v10];
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    __int16 v14 = (void *)_TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      long long v16 = [(TVLTimeSync *)v11 IPv6];
      if (v16)
      {
        if ([(TVLTimeSync *)v11 IPv4]) {
          int v17 = "4/6";
        }
        else {
          int v17 = "6";
        }
      }
      else
      {
        int v17 = "4";
      }
      uint64_t v18 = [(TVLTimeSync *)v11 networkInterfaceName];
      *(_DWORD *)buf = 136315394;
      id v22 = v17;
      __int16 v23 = 2114;
      id v24 = v18;
      _os_log_impl(&dword_22C7FF000, v15, OS_LOG_TYPE_DEFAULT, "Initializing PTP (IPv%s) Clock using network interface: %{public}@", buf, 0x16u);
    }
  }

  return v11;
}

- (void)invalidate
{
  dispatch_time_t v3 = [(TVLTimeSync *)self clock];

  if (v3)
  {
    int v4 = [(TVLTimeSync *)self clock];
    uint64_t v5 = [v4 clockIdentifier];

    dispatch_semaphore_t v6 = [(TVLTimeSync *)self clock];
    id v7 = [(TVLTimeSync *)self networkInterfaceName];
    id v8 = [(TVLTimeSync *)self IPv6];
    objc_msgSend(v6, "removeUnicastUDPv6EtEPortFromInterfaceNamed:withDestinationAddress:error:", v7, objc_msgSend(v8, "bytes"), 0);

    id v9 = [(TVLTimeSync *)self clock];
    id v10 = [(TVLTimeSync *)self networkInterfaceName];
    objc_msgSend(v9, "removeUnicastUDPv4EtEPortFromInterfaceNamed:withDestinationAddress:error:", v10, -[TVLTimeSync IPv4](self, "IPv4"), 0);

    id v11 = [(TVLTimeSync *)self clock];
    [v11 removeClient:self];

    [(TVLTimeSync *)self setClock:0];
    id v12 = [MEMORY[0x263F7F268] sharedgPTPManager];
    [v12 removeDomainWithIdentifier:v5 error:0];
  }
}

- (void)negotiateGrandmasterIdentityAttempt:(int64_t)a3 withCompletion:(id)a4
{
  v31[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3 < 21)
  {
    id v8 = NSNumber;
    id v9 = [(TVLTimeSync *)self clock];
    id v10 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "grandmasterIdentity"));

    v30[0] = @"MESSAGE";
    v30[1] = @"OPTIONS";
    v31[0] = @"GM";
    v28[0] = @"GM";
    v28[1] = @"LOCKED";
    v29[0] = v10;
    id v11 = NSNumber;
    id v12 = [(TVLTimeSync *)self clock];
    uint64_t v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "lockState") == 2);
    v29[1] = v13;
    __int16 v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    v31[1] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    long long v16 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      _os_log_impl(&dword_22C7FF000, v16, OS_LOG_TYPE_DEFAULT, "Outgoing Grandmaster Sync Request: %{public}@ | Attempt: %li", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    session = self->_session;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke;
    v19[3] = &unk_26491E750;
    objc_copyWeak(v23, (id *)buf);
    id v18 = v15;
    id v20 = v18;
    uint64_t v21 = self;
    id v22 = v6;
    v23[1] = (id)a3;
    [(CUMessageSession *)session sendRequestID:@"com.apple.tvlatency.timesync" options:0 request:v18 responseHandler:v19];

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    id v7 = _TVLLogDefault_log;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_ERROR)) {
      -[TVLTimeSync negotiateGrandmasterIdentityAttempt:withCompletion:](v7);
    }
    +[TVLTimeSync invalidate];
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  v34[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken != -1) {
      dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
    }
    id v8 = (id)_TVLLogDefault_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (a2)
      {
        id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
      }
      else
      {
        id v10 = 0;
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v9;
      __int16 v32 = 2114;
      *(void *)char v33 = v6;
      *(_WORD *)&v33[8] = 2114;
      v34[0] = v10;
      _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Response To Grandmaster Sync Request: %{public}@ | Response: %{public}@ | Error: %{public}@", buf, 0x20u);
      if (a2) {
    }
      }
    id v11 = [v6 objectForKey:@"GM"];
    uint64_t v12 = [v11 unsignedLongLongValue];

    uint64_t v13 = [v6 objectForKey:@"LOCKED"];
    int v14 = [v13 BOOLValue];

    id v15 = [WeakRetained clock];
    uint64_t v16 = [v15 grandmasterIdentity];

    if (v12 == v16)
    {
      if (_TVLLogDefault_onceToken != -1) {
        dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
      }
      int v17 = (void *)_TVLLogDefault_log;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        __int16 v19 = [WeakRetained clock];
        int v20 = [v19 lockState];
        *(_DWORD *)buf = 134218496;
        uint64_t v31 = v12;
        __int16 v32 = 1024;
        *(_DWORD *)char v33 = v14;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v20 == 2;
        _os_log_impl(&dword_22C7FF000, v18, OS_LOG_TYPE_DEFAULT, "Grandmaster Sync match=%llu, remoteLocked=%d, localLocked=%d", buf, 0x18u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (_TVLLogDefault_onceToken != -1) {
        dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
      }
      uint64_t v21 = (void *)_TVLLogDefault_log;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v21;
        __int16 v23 = [WeakRetained clock];
        int v24 = [v23 lockState];
        *(_DWORD *)buf = 134218752;
        uint64_t v31 = v12;
        __int16 v32 = 2048;
        *(void *)char v33 = v16;
        *(_WORD *)&v33[8] = 1024;
        LODWORD(v34[0]) = v14;
        WORD2(v34[0]) = 1024;
        *(_DWORD *)((char *)v34 + 6) = v24 == 2;
        _os_log_impl(&dword_22C7FF000, v22, OS_LOG_TYPE_DEFAULT, "Grandmaster Sync mismatch: remote=%llu, local=%llu, remoteLocked=%d, localLocked=%d", buf, 0x22u);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      dispatch_time_t v25 = dispatch_time(0, 1000000000);
      __int16 v26 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke_27;
      block[3] = &unk_26491E728;
      objc_copyWeak(v29, (id *)buf);
      v29[1] = *(id *)(a1 + 64);
      id v28 = *(id *)(a1 + 48);
      dispatch_after(v25, v26, block);

      objc_destroyWeak(v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __66__TVLTimeSync_negotiateGrandmasterIdentityAttempt_withCompletion___block_invoke_27(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained negotiateGrandmasterIdentityAttempt:*(void *)(a1 + 48) + 1 withCompletion:*(void *)(a1 + 32)];
}

- (unint64_t)convertToHostTimeFromDomainTime:(unint64_t)a3 grandmasterIdentity:(unint64_t *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  __int16 v11 = 0;
  id v6 = [(TVLTimeSync *)self clock];
  unint64_t v7 = [v6 convertFromDomainToMachAbsoluteTime:a3 grandmasterUsed:a4 portNumber:&v11];

  if (_TVLLogDefault_onceToken != -1) {
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  }
  id v8 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = *a4;
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = v9;
    _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Converted Domain Time -> Host Time using GM: %llu", buf, 0xCu);
  }
  return v7;
}

- (unint64_t)convertToDomainTimeFromHostTime:(unint64_t)a3 grandmasterIdentity:(unint64_t *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  __int16 v11 = 0;
  id v6 = [(TVLTimeSync *)self clock];
  unint64_t v7 = [v6 convertFromMachAbsoluteToDomainTime:a3 grandmasterUsed:a4 portNumber:&v11];

  if (_TVLLogDefault_onceToken != -1) {
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  }
  id v8 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = *a4;
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = v9;
    _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Converted Host Time -> Domain Time using GM: %llu", buf, 0xCu);
  }
  return v7;
}

- (void)_clearWaitForPTPClock
{
  id obj = self;
  objc_sync_enter(obj);
  v2 = [(TVLTimeSync *)obj waitForPTPLock];

  if (v2)
  {
    dispatch_time_t v3 = [(TVLTimeSync *)obj waitForPTPLock];
    dispatch_semaphore_signal(v3);

    [(TVLTimeSync *)obj setWaitForPTPLock:0];
  }
  objc_sync_exit(obj);
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (_TVLLogDefault_onceToken != -1) {
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  }
  unint64_t v7 = _TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a3;
    _os_log_impl(&dword_22C7FF000, v7, OS_LOG_TYPE_DEFAULT, "PTP clock lock state is now %i", (uint8_t *)v8, 8u);
  }
  if (a3)
  {
    if (a3 == 2) {
      [(TVLTimeSync *)self _clearWaitForPTPClock];
    }
  }
  else
  {
    +[TVLTimeSync invalidate];
  }
}

- (void)didChangeClockMasterForClock:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_TVLLogDefault_onceToken != -1) {
    dispatch_once(&_TVLLogDefault_onceToken, &__block_literal_global);
  }
  int v4 = (void *)_TVLLogDefault_log;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    id v6 = [v3 clockName];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22C7FF000, v5, OS_LOG_TYPE_DEFAULT, "Changed Clock Master for Clock %{public}@\n", (uint8_t *)&v7, 0xCu);
  }
}

- (unsigned)IPv4
{
  return self->_IPv4;
}

- (void)setIPv4:(unsigned int)a3
{
  self->_IPint v4 = a3;
}

- (NSData)IPv6
{
  return self->_IPv6;
}

- (void)setIPv6:(id)a3
{
}

- (TSgPTPClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (NSString)networkInterfaceName
{
  return self->_networkInterfaceName;
}

- (void)setNetworkInterfaceName:(id)a3
{
}

- (OS_dispatch_semaphore)waitForPTPLock
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWaitForPTPLock:(id)a3
{
}

- (CUMessageSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)isMaster
{
  return self->_master;
}

- (void)setMaster:(BOOL)a3
{
  self->_master = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_waitForPTPLock, 0);
  objc_storeStrong((id *)&self->_networkInterfaceName, 0);
  objc_storeStrong((id *)&self->_clock, 0);

  objc_storeStrong((id *)&self->_IPv6, 0);
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C7FF000, a2, OS_LOG_TYPE_ERROR, "There was an error creating a PTP clock at this time: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __54__TVLTimeSync__startPTPWithSession_completionHandler___block_invoke_20_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 0x4008000000000000;
  _os_log_error_impl(&dword_22C7FF000, log, OS_LOG_TYPE_ERROR, "Waiting for PTP clock lock has timed out (took over %fs).", (uint8_t *)&v1, 0xCu);
}

- (void)negotiateGrandmasterIdentityAttempt:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22C7FF000, log, OS_LOG_TYPE_ERROR, "Failed to negotiate grandmaster with remote", v1, 2u);
}

@end