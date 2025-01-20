@interface SCROClient
+ (BOOL)isClientTrustedWithPortToken:(id *)a3;
+ (id)addClientGetIdentifier:(unsigned int *)a3 token:(id *)a4 getPort:(unsigned int *)a5;
+ (id)callbacksForClientIdentifier:(unsigned int)a3;
+ (int64_t)removeClientWithPort:(unsigned int)a3;
+ (void)initialize;
+ (void)registerCallbackWithKey:(int)a3 forClientIdentifier:(unsigned int)a4;
+ (void)sendCallback:(id)a3;
- (BOOL)_wantsCallback:(id)a3;
- (SCROClient)init;
- (id)_dequeueCallbacks;
- (void)_invalidate;
- (void)_lock;
- (void)_registerCallbackWithKey:(int)a3;
- (void)_sendCallback:(id)a3;
- (void)_unlock;
- (void)dealloc;
@end

@implementation SCROClient

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _LastIdentifier = 0;
    id v2 = objc_alloc_init(MEMORY[0x263F08958]);
    v3 = (void *)_Lock;
    _Lock = (uint64_t)v2;

    uint64_t v4 = objc_opt_new();
    v5 = (void *)_ClientPortDictionary;
    _ClientPortDictionary = v4;

    uint64_t v6 = objc_opt_new();
    v7 = (void *)_ClientIdentifierDictionary;
    _ClientIdentifierDictionary = v6;

    uint64_t v8 = objc_opt_new();
    _ClientTrustDictionary = v8;
    MEMORY[0x270F9A758](v8);
  }
}

+ (id)addClientGetIdentifier:(unsigned int *)a3 token:(id *)a4 getPort:(unsigned int *)a5
{
  uint64_t v8 = (unsigned int *)objc_alloc_init((Class)a1);
  long long v9 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&atoken.val[4] = v9;
  pid_t pidp = 0;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  v8[6] = pidp;
  [(id)_Lock lock];
  v8[4] = ++_LastIdentifier;
  *a5 = v8[5];
  *a3 = v8[4];
  v10 = (void *)_ClientPortDictionary;
  v11 = [NSNumber numberWithUnsignedInt:v8[5]];
  [v10 setObject:v8 forKey:v11];

  v12 = (void *)_ClientIdentifierDictionary;
  v13 = [NSNumber numberWithUnsignedInt:v8[4]];
  [v12 setObject:v8 forKey:v13];

  [(id)_Lock unlock];

  return v8;
}

+ (int64_t)removeClientWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(id)_Lock lock];
  uint64_t v4 = (void *)_ClientPortDictionary;
  v5 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    v7 = (void *)_ClientIdentifierDictionary;
    uint64_t v8 = [NSNumber numberWithUnsignedInt:v6[4]];
    [v7 removeObjectForKey:v8];

    long long v9 = (void *)_ClientPortDictionary;
    v10 = [NSNumber numberWithUnsignedInt:v6[5]];
    [v9 removeObjectForKey:v10];

    v11 = (void *)_ClientTrustDictionary;
    v12 = [NSNumber numberWithInt:v6[6]];
    [v11 removeObjectForKey:v12];
  }
  int64_t v13 = [(id)_ClientPortDictionary count];
  [(id)_Lock unlock];
  if (v6)
  {
    [v6 _lock];
    [v6 _invalidate];
    [v6 _unlock];
  }

  return v13;
}

+ (BOOL)isClientTrustedWithPortToken:(id *)a3
{
  MEMORY[0x270FA5388](a1, a2, a3);
  uint64_t v4 = v3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v5 = v3[1];
  *(_OWORD *)atoken.val = *v3;
  *(_OWORD *)&atoken.val[4] = v5;
  pid_t pidp = 0;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  uint64_t v6 = pidp;
  [(id)_Lock lock];
  v7 = (void *)_ClientTrustDictionary;
  uint64_t v8 = [NSNumber numberWithInt:v6];
  long long v9 = [v7 objectForKey:v8];

  if (v9)
  {
    LOBYTE(v10) = [v9 BOOLValue];
  }
  else
  {
    long long v11 = v4[1];
    *(_OWORD *)atoken.val = *v4;
    *(_OWORD *)&atoken.val[4] = v11;
    pid_t pidp = 0;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    pid_t v12 = pidp;
    bzero(&atoken, 0x1000uLL);
    if (proc_pidpath(v12, &atoken, 0x1000u) <= 0)
    {
      uint64_t v10 = 0;
    }
    else
    {
      int64_t v13 = [NSString stringWithUTF8String:&atoken];
      v14 = [NSURL fileURLWithPath:v13];

      uint64_t v10 = v14 != 0;
    }
    v15 = (void *)_ClientTrustDictionary;
    v16 = [NSNumber numberWithBool:v10];
    v17 = [NSNumber numberWithInt:v6];
    [v15 setObject:v16 forKey:v17];
  }
  [(id)_Lock unlock];

  return v10;
}

+ (void)sendCallback:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [(id)_Lock lock];
  if ([(id)_ClientIdentifierDictionary count] <= 0)
  {
    [(id)_Lock unlock];
    goto LABEL_23;
  }
  uint64_t v4 = (void *)[(id)_ClientIdentifierDictionary copy];
  [(id)_Lock unlock];
  if (v4)
  {
    CFSetRef Mutable = CFSetCreateMutable(0, 0, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v7) {
      goto LABEL_21;
    }
    uint64_t v8 = *(void *)v16;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [v6 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v10 _lock];
        if ([v10 _wantsCallback:v3])
        {
          if ([v3 isAtomic])
          {
            long long v11 = (const void *)(int)[v3 key];
            if (CFSetContainsValue(Mutable, v11))
            {
              int v12 = 0;
              goto LABEL_18;
            }
            CFSetSetValue(Mutable, v11);
          }
          [v10 _sendCallback:v3];
        }
        else
        {
          int64_t v13 = _SCROD_LOG();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_21C66E000, v13, OS_LOG_TYPE_DEFAULT, "+[SCROClient sendCallback:]: client doesn't want callback.", v14, 2u);
          }
        }
        int v12 = 1;
LABEL_18:
        [v10 _unlock];

        if (!v12) {
          goto LABEL_21;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v7)
      {
LABEL_21:

        CFRelease(Mutable);
        break;
      }
    }
  }
LABEL_23:
}

+ (id)callbacksForClientIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(id)_Lock lock];
  uint64_t v4 = (void *)_ClientIdentifierDictionary;
  long long v5 = [NSNumber numberWithUnsignedInt:v3];
  id v6 = [v4 objectForKey:v5];

  [(id)_Lock unlock];
  if (v6)
  {
    [v6 _lock];
    uint64_t v7 = [v6 _dequeueCallbacks];
    [v6 _unlock];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (void)registerCallbackWithKey:(int)a3 forClientIdentifier:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  [(id)_Lock lock];
  id v6 = (void *)_ClientIdentifierDictionary;
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v4];
  id v8 = [v6 objectForKey:v7];

  [(id)_Lock unlock];
  if (v8)
  {
    [v8 _lock];
    [v8 _registerCallbackWithKey:v5];
    [v8 _unlock];
  }
}

- (SCROClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)SCROClient;
  id v2 = [(SCROClient *)&v12 init];
  if (v2)
  {
    uint64_t v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = *MEMORY[0x263EF8960];
    int v11 = 1;
    mach_port_allocate(v5, 1u, &v2->_port);
    mach_port_insert_right(v5, v2->_port, v2->_port, 0x14u);
    MEMORY[0x21D4AD410](v5, v2->_port, 1, &v11, 4);
    uint64_t v6 = os_transaction_create();
    scrodTransaction = v2->_scrodTransaction;
    v2->_scrodTransaction = (OS_os_transaction *)v6;

    id v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_DEFAULT, "Storing a transaction com.apple.ScreenReaderOutput", v10, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    CFRelease(queue);
  }
  callbackSet = self->_callbackSet;
  if (callbackSet) {
    CFRelease(callbackSet);
  }
  scrodTransaction = self->_scrodTransaction;
  self->_scrodTransaction = 0;

  uint64_t v6 = _SCROD_LOG();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C66E000, v6, OS_LOG_TYPE_DEFAULT, "Releasing a transaction com.apple.ScreenReaderOutput", buf, 2u);
  }

  [(SCROClient *)self _invalidate];
  v7.receiver = self;
  v7.super_class = (Class)SCROClient;
  [(SCROClient *)&v7 dealloc];
}

- (void)_lock
{
}

- (void)_unlock
{
}

- (void)_invalidate
{
  mach_port_name_t port = self->_port;
  if (port)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], port, 4u, -1);
    self->_mach_port_name_t port = 0;
  }
}

- (void)_registerCallbackWithKey:(int)a3
{
  callbackSet = self->_callbackSet;
  if (!callbackSet)
  {
    callbackSet = CFSetCreateMutable(0, 0, 0);
    self->_callbackSet = callbackSet;
  }

  CFSetSetValue(callbackSet, (const void *)a3);
}

- (id)_dequeueCallbacks
{
  queue = self->_queue;
  if (queue)
  {
    CFAutorelease(queue);
    uint64_t v4 = self->_queue;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;
  self->_queue = 0;

  return v5;
}

- (BOOL)_wantsCallback:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  callbackSet = self->_callbackSet;
  if (callbackSet && CFSetContainsValue(callbackSet, (const void *)(int)[v4 key]))
  {
    queue = self->_queue;
    if (!queue || CFArrayGetCount(queue) < 51)
    {
      BOOL v10 = 1;
      goto LABEL_10;
    }
    id v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFIndex Count = CFArrayGetCount(self->_queue);
      int v12 = 134218240;
      CFIndex v13 = Count;
      __int16 v14 = 1024;
      int v15 = 50;
      _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_DEFAULT, "SCRO Queue is flooded: queue size (%ld) > max size (%d)", (uint8_t *)&v12, 0x12u);
    }
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (void)_sendCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  value = v4;
  if (!queue)
  {
    queue = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    id v4 = value;
    self->_queue = queue;
  }
  CFArrayAppendValue(queue, v4);
  _SCROPing(self->_port, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrodTransaction, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end