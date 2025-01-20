@interface SiriCoreNetworkActivityTracing
+ (id)sharedNetworkActivityTracing;
- (SiriCoreNetworkActivityTracing)init;
- (void)_networkActivityActivate:(int64_t)a3;
- (void)_networkActivityAddNWConnection:(id)a3;
- (void)_networkActivityRemoveNWConnection:(id)a3 completion:(id)a4;
- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4;
- (void)_networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5;
- (void)_networkActivityTracingCancel;
- (void)currentNetworkActivityTokenWithCompletion:(id)a3;
- (void)networkActivityActivate:(int64_t)a3;
- (void)networkActivityAddNWConnection:(id)a3;
- (void)networkActivityRemoveNWConnection:(id)a3 completion:(id)a4;
- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4;
- (void)networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5;
- (void)networkActivityTracingCancel;
@end

@implementation SiriCoreNetworkActivityTracing

- (void)_networkActivityTracingCancel
{
  [(NSMutableDictionary *)self->_activities removeAllObjects];
  connections = self->_connections;

  [(NSMutableSet *)connections removeAllObjects];
}

+ (id)sharedNetworkActivityTracing
{
  if (sharedNetworkActivityTracing_sActivityTracerInitToken != -1) {
    dispatch_once(&sharedNetworkActivityTracing_sActivityTracerInitToken, &__block_literal_global);
  }
  v2 = (void *)sharedNetworkActivityTracing_sActivityTracer;

  return v2;
}

uint64_t __62__SiriCoreNetworkActivityTracing_networkActivityTracingCancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityTracingCancel];
}

- (void)networkActivityTracingCancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SiriCoreNetworkActivityTracing_networkActivityTracingCancel__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_activities, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_networkActivityRemoveNWConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([(NSMutableSet *)self->_connections containsObject:v6])
  {
    [(NSMutableSet *)self->_connections removeObject:v6];
    activities = self->_activities;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__SiriCoreNetworkActivityTracing__networkActivityRemoveNWConnection_completion___block_invoke;
    v9[3] = &unk_26443A2D8;
    id v10 = v6;
    [(NSMutableDictionary *)activities enumerateKeysAndObjectsUsingBlock:v9];
  }
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __80__SiriCoreNetworkActivityTracing__networkActivityRemoveNWConnection_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeConnection:*(void *)(a1 + 32)];
}

- (void)_networkActivityAddNWConnection:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_connections containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_connections addObject:v4];
    activities = self->_activities;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __66__SiriCoreNetworkActivityTracing__networkActivityAddNWConnection___block_invoke;
    v6[3] = &unk_26443A2D8;
    id v7 = v4;
    [(NSMutableDictionary *)activities enumerateKeysAndObjectsUsingBlock:v6];
  }
}

uint64_t __66__SiriCoreNetworkActivityTracing__networkActivityAddNWConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addConnection:*(void *)(a1 + 32)];
}

- (void)_networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a5;
  unint64_t v9 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 8) {
    id v10 = @"invalid";
  }
  else {
    id v10 = off_26443A2F8[v9];
  }
  v11 = [(NSMutableDictionary *)self->_activities objectForKey:v10];
  if (a3 == 1)
  {
    activities = self->_activities;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__SiriCoreNetworkActivityTracing__networkActivityStop_withReason_andError___block_invoke;
    v17[3] = &unk_26443A2B0;
    uint64_t v19 = 1;
    int64_t v20 = a4;
    id v18 = v8;
    [(NSMutableDictionary *)activities enumerateKeysAndObjectsUsingBlock:v17];
  }
  if ([v11 hasStarted])
  {
    v13 = (void *)*MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_INFO))
    {
      if (v9 > 8) {
        v14 = @"invalid";
      }
      else {
        v14 = off_26443A2F8[v9];
      }
      if ((unint64_t)(a4 - 1) > 4) {
        v15 = @"SiriCoreNetworkActivityInvalid";
      }
      else {
        v15 = off_26443A340[a4 - 1];
      }
      *(_DWORD *)buf = 136315906;
      v22 = "-[SiriCoreNetworkActivityTracing _networkActivityStop:withReason:andError:]";
      __int16 v23 = 2112;
      v24 = v14;
      __int16 v25 = 2112;
      v26 = v15;
      __int16 v27 = 2112;
      id v28 = v8;
      v16 = v13;
      _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_INFO, "%s Stopping network activity %@ with reason %@ and error: %@", buf, 0x2Au);
    }
    [v11 setHasStarted:0];
    [v11 stopWithCompletionReason:a4 andError:v8];
  }
}

void __75__SiriCoreNetworkActivityTracing__networkActivityStop_withReason_andError___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 parentLabel] == a1[5] && objc_msgSend(v4, "hasStarted"))
  {
    v5 = (void *)*MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = a1[5] - 1;
      if (v6 > 8) {
        id v7 = @"invalid";
      }
      else {
        id v7 = off_26443A2F8[v6];
      }
      unint64_t v8 = a1[6] - 1;
      if (v8 > 4) {
        unint64_t v9 = @"SiriCoreNetworkActivityInvalid";
      }
      else {
        unint64_t v9 = off_26443A340[v8];
      }
      uint64_t v10 = a1[4];
      *(_DWORD *)v12 = 136315906;
      *(void *)&v12[4] = "-[SiriCoreNetworkActivityTracing _networkActivityStop:withReason:andError:]_block_invoke";
      *(_WORD *)&v12[12] = 2112;
      *(void *)&v12[14] = v7;
      *(_WORD *)&v12[22] = 2112;
      v13 = v9;
      LOWORD(v14) = 2112;
      *(void *)((char *)&v14 + 2) = v10;
      v11 = v5;
      _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s Stopping network sub-activity %@ with reason %@ and error: %@", v12, 0x2Au);
    }
    objc_msgSend(v4, "setHasStarted:", 0, *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
    [v4 stopWithCompletionReason:a1[6] andError:a1[4]];
  }
}

- (void)_networkActivityActivate:(int64_t)a3
{
  activities = self->_activities;
  if ((unint64_t)(a3 - 1) > 8) {
    id v4 = @"invalid";
  }
  else {
    id v4 = off_26443A2F8[a3 - 1];
  }
  id v5 = [(NSMutableDictionary *)activities objectForKey:v4];
  [v5 activate];
}

- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 1) > 8) {
    id v7 = @"invalid";
  }
  else {
    id v7 = off_26443A2F8[a3 - 1];
  }
  unint64_t v8 = [(NSMutableDictionary *)self->_activities objectForKey:v7];
  if (!v8)
  {
    if (a3 == 1)
    {
      unint64_t v9 = [[SiriCoreNetworkActivity alloc] initWithLabel:1 parent:0];
      if (v9)
      {
LABEL_7:
        [(NSMutableDictionary *)self->_activities setObject:v9 forKey:v7];
        if (v4) {
          [(SiriCoreNetworkActivityTracing *)self _networkActivityActivate:a3];
        }
        if ([(NSMutableSet *)self->_connections count])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v10 = self->_connections;
          uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                -[SiriCoreNetworkActivity addConnection:](v9, "addConnection:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
              }
              uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v12);
          }
        }
        uint64_t v15 = v9;
        goto LABEL_25;
      }
    }
    else
    {
      v16 = [(NSMutableDictionary *)self->_activities objectForKey:@"uiRequest"];
      v17 = v16;
      if (v16)
      {
        id v18 = [v16 nwActivity];
        unint64_t v9 = [[SiriCoreNetworkActivity alloc] initWithLabel:a3 parent:v18];
      }
      else
      {
        unint64_t v9 = 0;
      }

      if (v9) {
        goto LABEL_7;
      }
    }
    if ([0 hasStarted])
    {
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v15 = 0;
LABEL_25:
    -[SiriCoreNetworkActivity setHasStarted:](v15, "setHasStarted:", 1, (void)v19);
    goto LABEL_26;
  }
LABEL_27:
}

- (void)currentNetworkActivityTokenWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__SiriCoreNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke;
  v7[3] = &unk_26443AB48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __76__SiriCoreNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"uiRequest"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  if (v2)
  {
    id v4 = [v2 nwActivityToken];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)networkActivityRemoveNWConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__SiriCoreNetworkActivityTracing_networkActivityRemoveNWConnection_completion___block_invoke;
  block[3] = &unk_26443AFD8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __79__SiriCoreNetworkActivityTracing_networkActivityRemoveNWConnection_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityRemoveNWConnection:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)networkActivityAddNWConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__SiriCoreNetworkActivityTracing_networkActivityAddNWConnection___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __65__SiriCoreNetworkActivityTracing_networkActivityAddNWConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityAddNWConnection:*(void *)(a1 + 40)];
}

- (void)networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__SiriCoreNetworkActivityTracing_networkActivityStop_withReason_andError___block_invoke;
  v11[3] = &unk_26443A288;
  int64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __74__SiriCoreNetworkActivityTracing_networkActivityStop_withReason_andError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityStop:*(void *)(a1 + 48) withReason:*(void *)(a1 + 56) andError:*(void *)(a1 + 40)];
}

- (void)networkActivityActivate:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SiriCoreNetworkActivityTracing_networkActivityActivate___block_invoke;
  v4[3] = &unk_26443AB70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __58__SiriCoreNetworkActivityTracing_networkActivityActivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityActivate:*(void *)(a1 + 40)];
}

- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SiriCoreNetworkActivityTracing_networkActivityStart_activate___block_invoke;
  block[3] = &unk_26443A518;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

uint64_t __64__SiriCoreNetworkActivityTracing_networkActivityStart_activate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityStart:*(void *)(a1 + 40) activate:*(unsigned __int8 *)(a1 + 48)];
}

- (SiriCoreNetworkActivityTracing)init
{
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreNetworkActivityTracing;
  v2 = [(SiriCoreNetworkActivityTracing *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:9];
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:4];
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v9 = dispatch_queue_create("network.activity.tracing", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

uint64_t __62__SiriCoreNetworkActivityTracing_sharedNetworkActivityTracing__block_invoke()
{
  sharedNetworkActivityTracing_sActivityTracer = objc_alloc_init(SiriCoreNetworkActivityTracing);

  return MEMORY[0x270F9A758]();
}

@end