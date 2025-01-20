@interface WCMClientProxy
- (BOOL)connectToServer;
- (WCMClientProxy)init;
- (WCMClientProxy)initWithClientProcessId:(int)a3 delegate:(id)a4 dispatch:(id)a5;
- (void)dealloc;
- (void)reConnect;
- (void)registerToServer;
- (void)sendMessage:(int)a3 argument:(id)a4;
@end

@implementation WCMClientProxy

- (WCMClientProxy)init
{
  return 0;
}

- (void)dealloc
{
  xpc_release(self->mConnection);
  v3.receiver = self;
  v3.super_class = (Class)WCMClientProxy;
  [(WCMClientProxy *)&v3 dealloc];
}

- (WCMClientProxy)initWithClientProcessId:(int)a3 delegate:(id)a4 dispatch:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)WCMClientProxy;
  v8 = [(WCMClientProxy *)&v13 init];
  v9 = v8;
  if (v8)
  {
    if (a3 && a4)
    {
      v8->mProcessId = a3;
      v10 = (WCMClientCallback *)a4;
      v11 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      if (a5) {
        v11 = (OS_dispatch_queue *)a5;
      }
      v9->mDelegate = v10;
      v9->mQueue = v11;
      v9->mIsRegistered = 0;
      if ([(WCMClientProxy *)v9 connectToServer])
      {
        [(WCMClientProxy *)v9 registerToServer];
        return v9;
      }
      NSLog(&cfstr_FailedToConnec.isa);
    }

    return 0;
  }
  return v9;
}

- (BOOL)connectToServer
{
  self->mIsRegistered = 0;
  mConnection = self->mConnection;
  if (mConnection) {
    xpc_release(mConnection);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", (dispatch_queue_t)self->mQueue, 0);
  v5 = mach_service;
  self->mConnection = mach_service;
  if (mach_service)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __33__WCMClientProxy_connectToServer__block_invoke;
    handler[3] = &unk_26422A8C8;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(self->mConnection);
  }
  return v5 != 0;
}

void __33__WCMClientProxy_connectToServer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x2166AF130](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (a2 == (void *)MEMORY[0x263EF86A0])
    {
      v10 = *(void **)(a1 + 32);
      [v10 registerToServer];
    }
    else if (a2 == (void *)MEMORY[0x263EF86A8])
    {
      v11 = *(void **)(a1 + 32);
      [v11 connectToServer];
    }
    else
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
      NSLog(&cfstr_XpcErrorS.isa, string);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(a2, "kMessageId");
    xpc_object_t value = xpc_dictionary_get_value(a2, "kMessageArgs");
    v9 = *(void **)(*(void *)(a1 + 32) + 16);
    [v9 receiveMessage:uint64 argument:value];
  }
  else
  {
    v5 = (void *)MEMORY[0x2166AF060](a2);
    NSLog(&cfstr_UnexpectedXpcM.isa, v5);
    free(v5);
  }
}

- (void)registerToServer
{
  keys[1] = *(char **)MEMORY[0x263EF8340];
  NSLog(&cfstr_TryToReRegiste.isa, a2);
  keys[0] = "kWCMRegisterProcess_ProcessId";
  xpc_object_t v3 = xpc_uint64_create(self->mProcessId);
  xpc_object_t values = v3;
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v8 = xmmword_26422A8E8;
  xpc_object_t v5 = xpc_uint64_create(1uLL);
  v7[0] = v5;
  v7[1] = v4;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v8, v7, 2uLL);
  xpc_connection_send_message(self->mConnection, v6);
  xpc_release(v3);
  xpc_release(v4);
  xpc_release(v5);
  xpc_release(v6);
  self->mIsRegistered = 1;
}

- (void)sendMessage:(int)a3 argument:(id)a4
{
  if (a4) {
    xpc_retain(a4);
  }
  mQueue = self->mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WCMClientProxy_sendMessage_argument___block_invoke;
  block[3] = &unk_26422A900;
  int v9 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(mQueue, block);
}

void __39__WCMClientProxy_sendMessage_argument___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[32]) {
    [v2 registerToServer];
  }
  *(_OWORD *)keys = xmmword_26422A8E8;
  xpc_object_t v3 = xpc_uint64_create(*(unsigned int *)(a1 + 48));
  xpc_object_t v4 = *(void **)(a1 + 40);
  object[0] = v3;
  object[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 40), v5);
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(object[0]);
  xpc_release(v5);
}

- (void)reConnect
{
}

@end