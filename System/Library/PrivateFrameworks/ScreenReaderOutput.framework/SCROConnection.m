@interface SCROConnection
+ (BOOL)inUnitTests;
+ (BOOL)supportsSecureCoding;
+ (void)_addConnectionToRunLoop:(id)a3;
+ (void)_configServer;
+ (void)_configServerWithMachServiceName:(char *)a3;
+ (void)_createConnectionRunLoop;
+ (void)_unconfigServerAndRetry:(BOOL)a3;
+ (void)initialize;
- (SCROConnection)initWithCoder:(id)a3;
- (SCROConnection)initWithHandlerType:(int)a3 delegate:(id)a4;
- (id)handlerArrayValueForKey:(int)a3;
- (id)handlerValueForKey:(int)a3;
- (id)handlerValueForKey:(int)a3 withObject:(id)a4;
- (int)performHandlerActionForKey:(int)a3;
- (int)registerHandlerCallbackForKey:(int)a3;
- (int)sendEvent:(id)a3;
- (int)setHandlerValue:(id)a3 forKey:(int)a4;
- (void)_ping;
- (void)_startConnection;
- (void)_stopConnection;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation SCROConnection

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08958]);
    v4 = (void *)_Lock_0;
    _Lock_0 = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x263F08958]);
    v6 = (void *)_ConfigLock;
    _ConfigLock = (uint64_t)v5;

    v7 = (const CFSetCallBacks *)MEMORY[0x263EFFFA0];
    _PendingConnections = (uint64_t)CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
    _ActiveConnections = (uint64_t)CFSetCreateMutable(0, 0, v7);
    v8 = (void *)MEMORY[0x263F08B88];
    [v8 detachNewThreadSelector:sel__createConnectionRunLoop toTarget:a1 withObject:0];
  }
}

+ (void)_createConnectionRunLoop
{
  memset(&context, 0, 72);
  context.perform = (void (__cdecl *)(void *))_addConnections;
  CFRunLoopSourceRef v3 = CFRunLoopSourceCreate(0, 0, &context);
  v8.version = 0;
  memset(&v8.retain, 0, 24);
  v8.info = a1;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerRef v5 = CFRunLoopTimerCreate(0, Current + 630720000.0, 630720000.0, 0, 0, (CFRunLoopTimerCallBack)_retryHandler, &v8);
  objc_msgSend((id)_Lock_0, "lock", *(_OWORD *)&v8.version, *(_OWORD *)&v8.retain, v8.copyDescription);
  _RetryState_2 = 0xC1E6CEAF20000000;
  _ShouldLogDeath = 1;
  _ShouldLogRebirth = 0;
  _ConnectionSource = (uint64_t)v3;
  _ConnectionRetryTimer = (uint64_t)v5;
  _ConnectionRunLoop = (uint64_t)CFRunLoopGetCurrent();
  CFRunLoopAddSource((CFRunLoopRef)_ConnectionRunLoop, (CFRunLoopSourceRef)_ConnectionSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  CFRunLoopAddTimer((CFRunLoopRef)_ConnectionRunLoop, (CFRunLoopTimerRef)_ConnectionRetryTimer, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFRunLoopSourceSignal((CFRunLoopSourceRef)_ConnectionSource);
  CFRunLoopWakeUp((CFRunLoopRef)_ConnectionRunLoop);
  v6 = (void *)MEMORY[0x21D4AD500]([(id)_Lock_0 unlock]);
  [a1 _configServer];
  while (1)
  {
    v7 = (void *)MEMORY[0x21D4AD500]();
    CFRunLoopRun();
  }
}

+ (BOOL)inUnitTests
{
  if (inUnitTests_onceToken != -1) {
    dispatch_once(&inUnitTests_onceToken, &__block_literal_global_6);
  }
  return inUnitTests_InUnitTests;
}

Class __29__SCROConnection_inUnitTests__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Scrolocalconne.isa);
  inUnitTests_InUnitTests = result != 0;
  return result;
}

+ (void)_configServer
{
  if (NSClassFromString(&cfstr_Scrolocalconne.isa)) {
    CFRunLoopSourceRef v3 = "com.apple.scrod.unittest";
  }
  else {
    CFRunLoopSourceRef v3 = "com.apple.scrod";
  }

  [a1 _configServerWithMachServiceName:v3];
}

+ (void)_configServerWithMachServiceName:(char *)a3
{
  kern_return_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  mach_port_name_t v10;
  mach_port_t v11;
  __CFRunLoopTimer *v12;
  CFAbsoluteTime Current;
  uint64_t v14;
  void block[5];

  if ([(id)_ConfigLock tryLock])
  {
    int v5 = 1;
    if ((_IsServerConfigured & 1) == 0 && _ConnectionRunLoop)
    {
      ipc_space_t v6 = *MEMORY[0x263EF8960];
      HIDWORD(v14) = 0;
      v7 = bootstrap_look_up(*MEMORY[0x263EF87F0], a3, (mach_port_t *)&v14 + 1);
      [(id)_Lock_0 lock];
      _ServerPort = HIDWORD(v14);
      [(id)_Lock_0 unlock];
      if (v7)
      {
        if (v7 == 1102 && ([(id)objc_opt_class() inUnitTests] & 1) == 0)
        {
          CFRunLoopTimerContext v8 = _SCROD_LOG();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            +[SCROConnection _configServerWithMachServiceName:]((uint64_t)a3, v8);
          }
        }
      }
      else
      {
        _DeathSource = MSHCreateMachServerSource();
        if (_DeathSource)
        {
          LODWORD(v14) = 0;
          v10 = _ServerPort;
          v11 = MSHGetMachPortFromSource();
          mach_port_request_notification(v6, v10, 72, 0, v11, 0x15u, (mach_port_t *)&v14);
          CFRunLoopAddSource((CFRunLoopRef)_ConnectionRunLoop, (CFRunLoopSourceRef)_DeathSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
          _IsServerConfigured = 1;
          v12 = (__CFRunLoopTimer *)_ConnectionRetryTimer;
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFRunLoopTimerSetNextFireDate(v12, Current + 630720000.0);
          CFSetApplyFunction((CFSetRef)_ActiveConnections, (CFSetApplierFunction)_startConnection, 0);
          CFRunLoopSourceSignal((CFRunLoopSourceRef)_ConnectionSource);
          CFRunLoopWakeUp((CFRunLoopRef)_ConnectionRunLoop);
          if (_ShouldLogRebirth == 1)
          {
            _ShouldLogRebirth = 0;
            fwrite("Screen Reader Output Server: CONNECTED\n", 0x27uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
          }
          int v5 = 1;
          _ShouldLogDeath = 1;
          goto LABEL_18;
        }
        NSLog(&cfstr_ErrorCouldNotC.isa);
      }
      int v5 = 0;
    }
LABEL_18:
    objc_msgSend((id)_ConfigLock, "unlock", v14);
    if (!v5) {
      [a1 _unconfigServerAndRetry:1];
    }
    return;
  }
  if (*(double *)&_RetryState_1 < 10.0)
  {
    v9 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SCROConnection__configServerWithMachServiceName___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_after(v9, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __51__SCROConnection__configServerWithMachServiceName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unconfigServerAndRetry:1];
}

+ (void)_unconfigServerAndRetry:(BOOL)a3
{
  BOOL v3 = a3;
  [(id)_ConfigLock lock];
  if (_IsServerConfigured == 1) {
    CFSetApplyFunction((CFSetRef)_ActiveConnections, (CFSetApplierFunction)_stopConnection, 0);
  }
  _IsServerConfigured = 0;
  if (_DeathSource)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)_DeathSource);
    CFRelease((CFTypeRef)_DeathSource);
    _DeathSource = 0;
  }
  [(id)_Lock_0 lock];
  if (_ServerPort)
  {
    mach_port_deallocate(*MEMORY[0x263EF8960], _ServerPort);
    _ServerPort = 0;
  }
  [(id)_Lock_0 unlock];
  if (v3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - *(double *)&_RetryState_2 <= 60.0)
    {
      ++_RetryState_0;
      HIDWORD(v5) = -858993459 * _RetryState_0;
      LODWORD(v5) = -858993459 * _RetryState_0;
      if ((v5 >> 1) <= 0x19999999)
      {
        _RetryState_0 = 0;
        double v6 = *(double *)&_RetryState_1 + *(double *)&_RetryState_1;
        *(double *)&_RetryState_1 = *(double *)&_RetryState_1 + *(double *)&_RetryState_1;
        goto LABEL_12;
      }
    }
    else
    {
      _RetryState_1 = 0x3F847AE147AE147BLL;
      _RetryState_0 = 1;
    }
    double v6 = *(double *)&_RetryState_1;
LABEL_12:
    if (v6 > 20.0) {
      _RetryState_1 = 0x4034000000000000;
    }
    _RetryState_2 = *(void *)&Current;
    v7 = (__CFRunLoopTimer *)_ConnectionRetryTimer;
    CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v7, v8 + *(double *)&_RetryState_1);
    if (_ShouldLogDeath == 1)
    {
      _ShouldLogDeath = 0;
      fwrite("Screen Reader Output Server: NOT AVAILABLE\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
  }
  _ShouldLogRebirth = 1;
  [(id)_ConfigLock unlock];
}

+ (void)_addConnectionToRunLoop:(id)a3
{
  id v4 = a3;
  [a1 _configServer];
  [(id)_Lock_0 lock];
  CFSetSetValue((CFMutableSetRef)_PendingConnections, v4);

  if (_ConnectionRunLoop)
  {
    CFRunLoopSourceSignal((CFRunLoopSourceRef)_ConnectionSource);
    CFRunLoopWakeUp((CFRunLoopRef)_ConnectionRunLoop);
  }
  unint64_t v5 = (void *)_Lock_0;

  [v5 unlock];
}

- (SCROConnection)initWithHandlerType:(int)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCROConnection;
  v7 = [(SCROConnection *)&v10 init];
  CFAbsoluteTime v8 = v7;
  if (v7)
  {
    v7->_handlerType = a3;
    objc_storeWeak(&v7->_delegate, v6);
    [(id)objc_opt_class() _addConnectionToRunLoop:v8];
  }

  return v8;
}

- (void)invalidate
{
  invalidationSource = self->_invalidationSource;
  if (invalidationSource) {
    BOOL v3 = _ConnectionRunLoop == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    CFRunLoopSourceSignal(invalidationSource);
    id v4 = (__CFRunLoop *)_ConnectionRunLoop;
    CFRunLoopWakeUp(v4);
  }
}

- (void)_startConnection
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C66E000, log, OS_LOG_TYPE_ERROR, "Could not connect to Screen Reader Output Server.", v1, 2u);
}

void __34__SCROConnection__startConnection__block_invoke(uint64_t a1)
{
  v2 = [[SCROCallback alloc] initWithKey:3 object:*(void *)(a1 + 32)];
  [(SCROCallback *)v2 postToHandler:*(void *)(a1 + 40)];
}

- (void)_stopConnection
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  id v9 = WeakRetained;
  if ((v4 & 1) != 0 && WeakRetained)
  {
    unint64_t v5 = [[SCROCallback alloc] initWithKey:4 object:self];
    [(SCROCallback *)v5 postToHandler:v9];
  }
  atomic_store(0, (unsigned __int8 *)&self->_isConnectionStarted);
  pingSource = self->_pingSource;
  if (pingSource)
  {
    CFRunLoopSourceInvalidate(pingSource);
    CFRelease(self->_pingSource);
    self->_pingSource = 0;
  }
  invalidationSource = self->_invalidationSource;
  if (invalidationSource)
  {
    CFRunLoopSourceInvalidate(invalidationSource);
    CFRelease(self->_invalidationSource);
    self->_invalidationSource = 0;
  }
  mach_port_name_t pingPort = self->_pingPort;
  if (pingPort)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], pingPort, 1u, -1);
    self->_mach_port_name_t pingPort = 0;
  }
}

- (int)sendEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v19, 0, 512);
  unsigned int v17 = 0;
  *(void *)&v16[1] = 0;
  v16[0] = 0;
  memset(v18, 0, 512);
  int v15 = 0;
  size_t v13 = 0;
  v14 = 0;
  uint64_t v5 = [v4 mainDictionary];
  id v6 = (void *)v5;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v7 & 1) == 0)
  {
    int v8 = 1;
    goto LABEL_6;
  }
  BOOL v9 = SCROSerializeWrapper(v5, 4096, v19, &v17, (void **)&v16[1], v16);
  LODWORD(v13) = v9;
  if (v9)
  {
    NSLog(&cfstr_ErrorWhileSeri.isa, v9);
LABEL_5:
    int v8 = v13;
    goto LABEL_6;
  }
  [(id)_Lock_0 lock];
  if (_ServerPort)
  {
    uint64_t v11 = _SCROSendEvent(_ServerPort, 6000, self->_handlerType, (uint64_t)v19, v17, *(uint64_t *)&v16[1], v16[0], (uint64_t)v18, &v15, &v14, (_DWORD *)&v13 + 1, &v13);
    [(id)_Lock_0 unlock];
    if (v16[0] && *(void *)&v16[1]) {
      munmap(*(void **)&v16[1], v16[0]);
    }
    if (!v11)
    {
      if (v13)
      {
        NSLog(&cfstr_ErrorReturnedF.isa, v13);
        if (HIDWORD(v13) && v14) {
          munmap(v14, HIDWORD(v13));
        }
      }
      else
      {
        if (!(v15 | HIDWORD(v13))) {
          goto LABEL_28;
        }
        uint64_t v12 = SCROUnserializeWrapper((uint64_t)v18, v15, (uint64_t)v14, SHIDWORD(v13));
        LODWORD(v13) = v12;
        if (HIDWORD(v13) && v14)
        {
          munmap(v14, HIDWORD(v13));
          uint64_t v12 = v13;
        }
        if (!v12)
        {
LABEL_28:
          int v8 = 0;
          goto LABEL_6;
        }
        NSLog(&cfstr_ErrorWhileDese.isa, v12);
      }
      goto LABEL_5;
    }
    NSLog(&cfstr_ErrorWhileSend.isa, v11);
    int v8 = 1;
    if (HIDWORD(v13) && v14) {
      munmap(v14, HIDWORD(v13));
    }
  }
  else
  {
    [(id)_Lock_0 unlock];
    int v8 = 1;
    if (v16[0] && *(void *)&v16[1]) {
      munmap(*(void **)&v16[1], v16[0]);
    }
  }
LABEL_6:

  return v8;
}

- (int)registerHandlerCallbackForKey:(int)a3
{
  unsigned int v8 = 0;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v3 & 1) == 0) {
    return 1;
  }
  [(id)_Lock_0 lock];
  if (!_ServerPort)
  {
    [(id)_Lock_0 unlock];
    return 1;
  }
  uint64_t v6 = _SCRORegisterForCallback(_ServerPort, 0x1770u, self->_identifier, self->_handlerType, a3, &v8);
  [(id)_Lock_0 unlock];
  if (v6)
  {
    NSLog(&cfstr_ErrorWhileSend_0.isa, v6);
    return 1;
  }
  if (!v8) {
    return 0;
  }
  NSLog(&cfstr_ErrorReturnedF_0.isa, v8);
  return v8;
}

- (int)setHandlerValue:(id)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned __int8 v7 = v6;
  unsigned int v15 = 0;
  memset(v16, 0, 512);
  unsigned int v14 = 0;
  memset(v13, 0, sizeof(v13));
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v8 & 1) == 0) {
    goto LABEL_2;
  }
  BOOL v10 = SCROSerializeWrapper((uint64_t)v6, 4096, v16, &v14, (void **)&v13[1], v13);
  int v9 = v10;
  unsigned int v15 = v10;
  if (v10)
  {
    NSLog(&cfstr_ErrorWhileSeri.isa, v10);
    goto LABEL_5;
  }
  [(id)_Lock_0 lock];
  if (_ServerPort)
  {
    uint64_t v12 = _SCROSetValueForKey(_ServerPort, 6000, self->_handlerType, v4, (uint64_t)v16, v14, *(uint64_t *)&v13[1], v13[0], (int *)&v15);
    [(id)_Lock_0 unlock];
    if (v13[0] && *(void *)&v13[1]) {
      munmap(*(void **)&v13[1], v13[0]);
    }
    if (v12)
    {
      NSLog(&cfstr_ErrorWhileSend_1.isa, v12);
LABEL_2:
      int v9 = 1;
      goto LABEL_5;
    }
    if (v15)
    {
      NSLog(&cfstr_ErrorReturnedF_1.isa, v15);
      int v9 = v15;
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    [(id)_Lock_0 unlock];
    int v9 = 1;
    if (v13[0] && *(void *)&v13[1])
    {
      munmap(*(void **)&v13[1], v13[0]);
      goto LABEL_2;
    }
  }
LABEL_5:

  return v9;
}

- (id)handlerArrayValueForKey:(int)a3
{
  unsigned __int8 v3 = [(SCROConnection *)self handlerValueForKey:*(void *)&a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)handlerValueForKey:(int)a3
{
  uint64_t v4 = MEMORY[0x270FA5388](self, a2, *(void *)&a3);
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v13 = 0;
  memset(v14, 0, 512);
  int v12 = 0;
  memset(v11, 0, sizeof(v11));
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(v4 + 48));
  if (v5)
  {
    uint64_t v6 = v3;
    [(id)_Lock_0 lock];
    if (_ServerPort)
    {
      uint64_t v7 = _SCROGetValueForKey(_ServerPort, 6000, *(unsigned int *)(v4 + 36), v6, (uint64_t)v14, (uint64_t)&v12, (uint64_t)&v11[1], (uint64_t)v11, &v13);
      [(id)_Lock_0 unlock];
      if (v7)
      {
        NSLog(&cfstr_ErrorWhileGett.isa, v7);
        size_t v8 = v11[0];
        if (v11[0] && *(void *)&v11[1]) {
LABEL_6:
        }
          munmap(*(void **)&v11[1], v8);
      }
      else if (v13)
      {
        NSLog(&cfstr_ErrorReturnedF_2.isa, v13);
        size_t v8 = v11[0];
        if (v11[0] && *(void *)&v11[1]) {
          goto LABEL_6;
        }
      }
      else if (v12 | v11[0])
      {
        uint64_t v10 = SCROUnserializeWrapper((uint64_t)v14, v12, *(uint64_t *)&v11[1], v11[0]);
        unsigned int v13 = v10;
        if (v11[0] && *(void *)&v11[1])
        {
          munmap(*(void **)&v11[1], v11[0]);
          uint64_t v10 = v13;
        }
        if (v10) {
          NSLog(&cfstr_ErrorWhileDese.isa, v10);
        }
      }
    }
    else
    {
      [(id)_Lock_0 unlock];
    }
  }

  return 0;
}

- (id)handlerValueForKey:(int)a3 withObject:(id)a4
{
  uint64_t v4 = MEMORY[0x270FA5388](self, a2, *(void *)&a3);
  int v6 = v5;
  uint64_t v7 = v4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = v8;
  uint64_t v10 = v9;
  BOOL v22 = 0;
  memset(v24, 0, 512);
  int v21 = 0;
  memset(v20, 0, sizeof(v20));
  memset(__dst, 0, 512);
  int v19 = 0;
  memset(v18, 0, sizeof(v18));
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)(v7 + 48));
  if (v11)
  {
    BOOL v12 = SCROSerializeWrapper((uint64_t)v9, 4096, v24, &v21, (void **)&v20[1], v20);
    BOOL v22 = v12;
    if (v12)
    {
      NSLog(&cfstr_ErrorWhileSeri_0.isa, v12);
      goto LABEL_4;
    }
    [(id)_Lock_0 lock];
    if (_ServerPort)
    {
      uint64_t v14 = _SCROGetValueForKeyWithObject(_ServerPort, 6000, *(unsigned int *)(v7 + 36), v6, (int)v24, v21, v20[1], v20[0], __dst, &v19, &v18[1], v18, &v22);
      [(id)_Lock_0 unlock];
      if (v20[0] && *(void *)&v20[1]) {
        munmap(*(void **)&v20[1], v20[0]);
      }
      if (v14)
      {
        NSLog(&cfstr_ErrorWhileGett_0.isa, v14);
        size_t v15 = v18[0];
        if (v18[0])
        {
          v16 = *(void **)&v18[1];
          if (*(void *)&v18[1]) {
LABEL_14:
          }
            munmap(v16, v15);
        }
      }
      else if (v22)
      {
        NSLog(&cfstr_ErrorReturnedF_3.isa, v22);
        size_t v15 = v18[0];
        if (v18[0])
        {
          v16 = *(void **)&v18[1];
          if (*(void *)&v18[1]) {
            goto LABEL_14;
          }
        }
      }
      else if (v19 | v18[0])
      {
        BOOL v17 = SCROUnserializeWrapper((uint64_t)__dst, v19, *(uint64_t *)&v18[1], v18[0]);
        BOOL v22 = v17;
        if (v18[0] && *(void *)&v18[1])
        {
          munmap(*(void **)&v18[1], v18[0]);
          BOOL v17 = v22;
        }
        if (v17) {
          NSLog(&cfstr_ErrorWhileDese.isa, v17);
        }
      }
    }
    else
    {
      [(id)_Lock_0 unlock];
      if (v20[0] && *(void *)&v20[1]) {
        munmap(*(void **)&v20[1], v20[0]);
      }
    }
  }
LABEL_4:

  return 0;
}

- (int)performHandlerActionForKey:(int)a3
{
  unsigned int v8 = 0;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
  if ((v3 & 1) == 0) {
    return 1;
  }
  [(id)_Lock_0 lock];
  if (!_ServerPort)
  {
    [(id)_Lock_0 unlock];
    return 1;
  }
  uint64_t v6 = _SCROPerformAction(_ServerPort, 0x1770u, self->_identifier, self->_handlerType, a3, &v8);
  [(id)_Lock_0 unlock];
  if (v6)
  {
    NSLog(&cfstr_ErrorWhileSend_2.isa, v6);
    return 1;
  }
  if (!v8) {
    return 0;
  }
  NSLog(&cfstr_ErrorReturnedF_4.isa, v8);
  return v8;
}

- (void)_ping
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isConnectionStarted);
    if (v4)
    {
      [(id)_Lock_0 lock];
      if (_ServerPort)
      {
        uint64_t v5 = _SCROGetCallbacks(_ServerPort, 6000, self->_identifier);
        [(id)_Lock_0 unlock];
        if (v5) {
          NSLog(&cfstr_ErrorWhileGett_1.isa, v5);
        }
      }
      else
      {
        [(id)_Lock_0 unlock];
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_NoteSecureCodi.isa);
  uint64_t v5 = -[SCROConnection initWithHandlerType:delegate:](self, "initWithHandlerType:delegate:", [v4 decodeIntegerForKey:@"handlerType"], 0);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)_configServerWithMachServiceName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C66E000, a2, OS_LOG_TYPE_ERROR, "Could not find bootstrap server for Screen Reader Output Server. name:%s", (uint8_t *)&v2, 0xCu);
}

@end