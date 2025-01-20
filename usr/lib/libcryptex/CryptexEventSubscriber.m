@interface CryptexEventSubscriber
+ (NSMutableDictionary)subscribers;
+ (OS_dispatch_queue)streamQueue;
+ (void)attachToStream:(id)a3 withRegistration:(id)a4;
+ (void)detachFromStream:(id)a3;
+ (void)initializeEventStream;
- (BOOL)active;
- (CryptexEventSubscriber)initWithFlags:(unint64_t)a3 name:(id)a4;
- (NSString)xpcEventName;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (id)_handleXPCEvent:(id)a3;
- (id)callback;
- (id)registerForEvents:(unint64_t)a3 onQueue:(id)a4 withCompletion:(id)a5;
- (unint64_t)flags;
- (void)cancel;
- (void)dealloc;
- (void)handleXPCEvent:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCallback:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CryptexEventSubscriber

+ (OS_dispatch_queue)streamQueue
{
  if (streamQueue_onceToken != -1) {
    dispatch_once(&streamQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_streamQueue;

  return (OS_dispatch_queue *)v2;
}

uint64_t __37__CryptexEventSubscriber_streamQueue__block_invoke()
{
  _streamQueue = (uint64_t)dispatch_queue_create("com.apple.security.libcryptex.com.apple.security.cryptex.events", 0);

  return MEMORY[0x270F9A758]();
}

+ (NSMutableDictionary)subscribers
{
  if (subscribers_onceToken != -1) {
    dispatch_once(&subscribers_onceToken, &__block_literal_global_7);
  }
  v2 = +[CryptexEventSubscriber streamQueue];
  dispatch_assert_queue_V2(v2);

  v3 = (void *)_subscribers;

  return (NSMutableDictionary *)v3;
}

uint64_t __37__CryptexEventSubscriber_subscribers__block_invoke()
{
  _subscribers = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);

  return MEMORY[0x270F9A758]();
}

+ (void)initializeEventStream
{
  if (initializeEventStream_onceToken != -1) {
    dispatch_once(&initializeEventStream_onceToken, &__block_literal_global_10);
  }
}

void __47__CryptexEventSubscriber_initializeEventStream__block_invoke()
{
  v0 = +[CryptexEventSubscriber streamQueue];
  xpc_set_event_stream_handler("com.apple.security.cryptex.events", v0, &__block_literal_global_14);
}

void __47__CryptexEventSubscriber_initializeEventStream__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (const char *)*MEMORY[0x263EF86C8];
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, v2);
  v5 = +[CryptexEventSubscriber subscribers];
  v6 = [NSString stringWithUTF8String:string];
  id v7 = [v5 objectForKeyedSubscript:v6];

  [v7 handleXPCEvent:v3];
}

+ (void)attachToStream:(id)a3 withRegistration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[CryptexEventSubscriber initializeEventStream];
  id v7 = +[CryptexEventSubscriber streamQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__CryptexEventSubscriber_attachToStream_withRegistration___block_invoke;
  v10[3] = &unk_264470B48;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __58__CryptexEventSubscriber_attachToStream_withRegistration___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[CryptexEventSubscriber subscribers];
  v4 = [*(id *)(a1 + 32) xpcEventName];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = [*(id *)(a1 + 32) xpcEventName];
  [v5 UTF8String];
  xpc_set_event();
}

+ (void)detachFromStream:(id)a3
{
  id v3 = a3;
  +[CryptexEventSubscriber initializeEventStream];
  v4 = +[CryptexEventSubscriber streamQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CryptexEventSubscriber_detachFromStream___block_invoke;
  block[3] = &unk_264470B70;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __43__CryptexEventSubscriber_detachFromStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CryptexEventSubscriber subscribers];
  id v3 = [*(id *)(a1 + 32) xpcEventName];
  [v2 removeObjectForKey:v3];

  id v4 = [*(id *)(a1 + 32) xpcEventName];
  [v4 UTF8String];
  xpc_set_event();
}

- (CryptexEventSubscriber)initWithFlags:(unint64_t)a3 name:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)CryptexEventSubscriber;
    id v8 = [(CryptexEventSubscriber *)&v14 init];
    if (v8)
    {
      os_log_t v9 = os_log_create("com.apple.libcryptex", "event_subscriber");
      log = v8->_log;
      v8->_log = (OS_os_log *)v9;

      v8->_flags = a3;
      v8->_active = 0;
      queue = v8->_queue;
      v8->_queue = 0;

      objc_storeStrong((id *)&v8->_xpcEventName, a4);
    }
    self = v8;
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)registerForEvents:(unint64_t)a3 onQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    if (v9)
    {
      [(CryptexEventSubscriber *)self setCallback:v9];
      id v11 = dispatch_queue_attr_make_initially_inactive(0);
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.security.libcryptex.event_subscriber", v11);

      [(CryptexEventSubscriber *)self setQueue:v12];
      v13 = [(CryptexEventSubscriber *)self queue];
      dispatch_set_target_queue(v13, v8);

      objc_super v14 = [(CryptexEventSubscriber *)self queue];
      dispatch_activate(v14);

      [(CryptexEventSubscriber *)self setActive:1];
      uint64_t v15 = cryptex_event_mask_ext_to_int(a3);
      xpc_dictionary_set_uint64(v10, "CryptexEventMask", v15);
      v16 = getprogname();
      xpc_dictionary_set_string(v10, "CryptexEventClientName", v16);
      +[CryptexEventSubscriber attachToStream:self withRegistration:v10];
      CFErrorRef v17 = 0;
      goto LABEL_13;
    }
    v21 = [(CryptexEventSubscriber *)self log];

    if (v21)
    {
      v22 = [(CryptexEventSubscriber *)self log];
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("-[CryptexEventSubscriber registerForEvents:onQueue:withCompletion:]", "event.m", 125, "com.apple.security.cryptex", 3, 0, v20);
  }
  else
  {
    v18 = [(CryptexEventSubscriber *)self log];

    if (v18)
    {
      v19 = [(CryptexEventSubscriber *)self log];
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("-[CryptexEventSubscriber registerForEvents:onQueue:withCompletion:]", "event.m", 118, "com.apple.security.cryptex", 3, 0, v20);
  }
  CFErrorRef v17 = Error;
  free(v20);
LABEL_13:

  return v17;
}

- (void)cancel
{
  id v3 = [(CryptexEventSubscriber *)self queue];
  id v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__CryptexEventSubscriber_cancel__block_invoke;
    block[3] = &unk_264470B70;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

void __32__CryptexEventSubscriber_cancel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  if ([*(id *)(a1 + 32) active])
  {
    [*(id *)(a1 + 32) setActive:0];
    [*(id *)(a1 + 32) setCallback:0];
    [*(id *)(a1 + 32) setQueue:0];
    +[CryptexEventSubscriber detachFromStream:*(void *)(a1 + 32)];
    if (v2) {
      (*((void (**)(id, void, void, void))v2 + 2))(v2, 0, 0, 0);
    }
  }
}

- (void)dealloc
{
  [(CryptexEventSubscriber *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CryptexEventSubscriber;
  [(CryptexEventSubscriber *)&v3 dealloc];
}

- (id)_handleXPCEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29 = 0;
  uint64_t v30 = 0;
  size_t length = 0;
  id v5 = [(CryptexEventSubscriber *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(CryptexEventSubscriber *)self active])
  {
    xpc_object_t v10 = 0;
    CFErrorRef v11 = 0;
    goto LABEL_23;
  }
  id v6 = [(CryptexEventSubscriber *)self callback];

  if (!v6)
  {
    dispatch_queue_t v12 = [(CryptexEventSubscriber *)self log];

    if (v12)
    {
      v13 = [(CryptexEventSubscriber *)self log];
      os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      LOWORD(v31) = 0;
      id v9 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      LOWORD(v31) = 0;
      id v9 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 201, "com.apple.security.cryptex", 3, 0, v9);
    goto LABEL_22;
  }
  if (_xpc_dictionary_try_get_uint64(v4, "CRYPTEX_EVENT_TYPE", (uint64_t *)&v30))
  {
    id v7 = [(CryptexEventSubscriber *)self log];

    if (v7)
    {
      id v8 = [(CryptexEventSubscriber *)self log];
      os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_TYPE";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_TYPE";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 210, "com.apple.security.cryptex", 3, 0, v9);
LABEL_22:
    CFErrorRef v11 = Error;
    free(v9);
    xpc_object_t v10 = 0;
    goto LABEL_23;
  }
  if (_xpc_dictionary_try_get_string(v4, "CRYPTEX_EVENT_CRYPTEX_NAME", &v29))
  {
    objc_super v14 = [(CryptexEventSubscriber *)self log];

    if (v14)
    {
      uint64_t v15 = [(CryptexEventSubscriber *)self log];
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_CRYPTEX_NAME";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v31 = 136315138;
      v32 = "CRYPTEX_EVENT_CRYPTEX_NAME";
      id v9 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef Error = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 219, "com.apple.security.cryptex", 3, 0, v9);
    goto LABEL_22;
  }
  data = xpc_dictionary_get_data(v4, "CRYPTEX_EVENT_INFO", &length);
  if (data)
  {
    v18 = (void *)MEMORY[0x263F08AC0];
    v19 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:length];
    id v27 = 0;
    xpc_object_t v10 = [v18 propertyListWithData:v19 options:0 format:0 error:&v27];
    CFErrorRef v11 = (CFErrorRef)v27;

    if (!v10)
    {
      v20 = [(CryptexEventSubscriber *)self log];

      if (v20)
      {
        v21 = [(CryptexEventSubscriber *)self log];
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        LOWORD(v31) = 0;
        v22 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        LOWORD(v31) = 0;
        v22 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v26 = createError("-[CryptexEventSubscriber _handleXPCEvent:]", "event.m", 232, "com.apple.security.cryptex", 3, v11, v22);
      free(v22);

      xpc_object_t v10 = 0;
      CFErrorRef v11 = v26;
      goto LABEL_23;
    }
  }
  else
  {
    xpc_object_t v10 = 0;
    CFErrorRef v11 = 0;
  }
  uint64_t v24 = cryptex_event_type_int_to_ext(v30);
  v25 = [(CryptexEventSubscriber *)self callback];
  ((void (**)(void, uint64_t, const char *, void *))v25)[2](v25, v24, v29, v10);

LABEL_23:

  return v11;
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(CryptexEventSubscriber *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CryptexEventSubscriber_handleXPCEvent___block_invoke;
  v7[3] = &unk_264470B48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__CryptexEventSubscriber_handleXPCEvent___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _handleXPCEvent:*(void *)(a1 + 40)];
  if (v2)
  {
    int v3 = *__error();
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 138543618;
      id v6 = v2;
      __int16 v7 = 1024;
      int v8 = 72;
      _os_log_impl(&dword_21DAF1000, v4, OS_LOG_TYPE_FAULT, "Failed to handle XPC event: %{public}@: %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
    }

    *__error() = v3;
  }
}

- (NSString)xpcEventName
{
  return self->_xpcEventName;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_xpcEventName, 0);
}

@end