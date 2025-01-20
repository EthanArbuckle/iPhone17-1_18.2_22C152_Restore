@interface NWListener
- (NWListener)initWithLayer:(void *)a3;
- (void)setListener:(id)a3;
- (void)stopListening;
- (void)waitForReady;
@end

@implementation NWListener

- (NWListener)initWithLayer:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NWListener;
  v4 = [(NWListener *)&v8 init];
  if (v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    readySemaphore = v4->readySemaphore;
    v4->readySemaphore = (OS_dispatch_semaphore *)v5;

    v4->listenerState = 0;
    v4->layer = a3;
  }
  return v4;
}

- (void)stopListening
{
  if (self->listener)
  {
    v3 = *re::networkLogObjects((re *)self);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_semaphore_t v5 = 0;
      _os_log_impl(&dword_228C70000, v3, OS_LOG_TYPE_INFO, "NWListener.stopListening", v5, 2u);
    }
    nw_listener_cancel((nw_listener_t)self->listener);
    nw_listener_set_state_changed_handler((nw_listener_t)self->listener, 0);
    nw_listener_set_new_connection_handler((nw_listener_t)self->listener, 0);
    listener = self->listener;
    self->listener = 0;
  }
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->listener, a3);
  id v5 = a3;
  v6 = self;
  nw_listener_set_queue((nw_listener_t)self->listener, (dispatch_queue_t)v6->listenerQueue);
  listener = self->listener;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __26__NWListener_setListener___block_invoke;
  handler[3] = &unk_2648547A0;
  objc_super v8 = v6;
  v14 = v8;
  nw_listener_set_state_changed_handler(listener, handler);
  v9 = self->listener;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __26__NWListener_setListener___block_invoke_3;
  v11[3] = &unk_2648547F0;
  v12 = v8;
  v10 = v8;
  nw_listener_set_new_connection_handler(v9, v11);
  nw_listener_start((nw_listener_t)self->listener);
}

void __26__NWListener_setListener___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = *re::networkLogObjects(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v7)
  {
    objc_super v8 = v6;
    if (a2 > 4) {
      v9 = "unknown";
    }
    else {
      v9 = off_2648548F0[a2];
    }
    int v14 = 136315138;
    uint64_t v15 = (uint64_t)v9;
    _os_log_impl(&dword_228C70000, v8, OS_LOG_TYPE_INFO, "NWListener.stateChanged state=%s.", (uint8_t *)&v14, 0xCu);
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = a2;
  if (a2 == 2) {
    goto LABEL_10;
  }
  if (a2 == 3)
  {
    v10 = *re::networkLogObjects((re *)v7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      id v12 = [(re *)v5 description];
      uint64_t v13 = [v12 UTF8String];
      int v14 = 136315138;
      uint64_t v15 = v13;
      _os_log_error_impl(&dword_228C70000, v11, OS_LOG_TYPE_ERROR, "NWListener failed error=%s", (uint8_t *)&v14, 0xCu);
    }
LABEL_10:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24));
  }
}

void __26__NWListener_setListener___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = *re::networkLogObjects(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228C70000, v4, OS_LOG_TYPE_INFO, "NWListener.newConnection", buf, 2u);
  }
  id v5 = *(void **)(a1 + 32);
  v6 = v5[2];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __26__NWListener_setListener___block_invoke_4;
  v8[3] = &unk_2648547C8;
  v9 = v5;
  v10 = v3;
  BOOL v7 = v3;
  dispatch_sync(v6, v8);
}

void __26__NWListener_setListener___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v1)
  {
    re::NWProtocolLayer::addConnection(&v11, v1, *(void **)(a1 + 40));
    v3 = nw_connection_copy_endpoint(*(nw_connection_t *)(a1 + 40));
    hostname = nw_endpoint_get_hostname(v3);
    if (hostname)
    {
      id v5 = (re::Address *)hostname;
      port = (const char *)nw_endpoint_get_port(v3);

      re::Address::makeFromIPAndPort(v5, port, (re::DynamicString *)v10);
    }
    else
    {
      description = (const char *)nw_endpoint_get_description();

      re::DynamicString::DynamicString((re::DynamicString *)v10, (const re::DynamicString *)&v12);
      if (v12 && (v13 & 1) != 0) {
        (*(void (**)(void))(*(void *)v12 + 40))();
      }
    }
    unint64_t v7 = v11;
    re::DynamicString::operator=((re::DynamicString *)(v11 + 1784), (re::DynamicString *)v10);
    if (*(void *)&v10[0])
    {
      if (BYTE8(v10[0])) {
        (*(void (**)(void))(**(void **)&v10[0] + 40))();
      }
      memset(v10, 0, sizeof(v10));
    }

    if (v7) {
  }
    }
}

- (void)waitForReady
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->readySemaphore, 0);
  objc_storeStrong((id *)&self->transportQueue, 0);
  objc_storeStrong((id *)&self->listenerQueue, 0);
}

@end