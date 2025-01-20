@interface STKUSSDAlertSession
- (BOOL)hasReceivedContent;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connectionQueue;
- (NSXPCConnection)ussdConnection;
- (NSXPCListener)ussdListener;
- (STKUSSDAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 event:(int64_t)a5 options:(id)a6 sound:(id)a7;
- (int64_t)event;
- (void)invalidate;
- (void)performUSSDUpdate:(id)a3;
- (void)setHasReceivedContent:(BOOL)a3;
@end

@implementation STKUSSDAlertSession

- (STKUSSDAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 event:(int64_t)a5 options:(id)a6 sound:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)STKUSSDAlertSession;
  v8 = [(STKAlertSession *)&v15 initWithLogger:a3 responseProvider:a4 options:a6 sound:a7];
  v9 = v8;
  if (v8)
  {
    v8->_event = a5;
    uint64_t v10 = [MEMORY[0x263F08D88] anonymousListener];
    ussdListener = v9->_ussdListener;
    v9->_ussdListener = (NSXPCListener *)v10;

    [(NSXPCListener *)v9->_ussdListener setDelegate:v9];
    [(NSXPCListener *)v9->_ussdListener resume];
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    connectionQueue = v9->_connectionQueue;
    v9->_connectionQueue = (NSMutableArray *)v12;
  }
  return v9;
}

- (void)invalidate
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__STKUSSDAlertSession_invalidate__block_invoke;
  v4[3] = &unk_2645F4458;
  v4[4] = self;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  v3.receiver = self;
  v3.super_class = (Class)STKUSSDAlertSession;
  [(STKAlertSession *)&v3 invalidate];
}

uint64_t __33__STKUSSDAlertSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 41)) {
    return [*(id *)(v1 + 88) invalidate];
  }
  return result;
}

- (BOOL)hasReceivedContent
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__STKUSSDAlertSession_hasReceivedContent__block_invoke;
  v4[3] = &unk_2645F4890;
  v4[4] = self;
  void v4[5] = &v5;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__STKUSSDAlertSession_hasReceivedContent__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)setHasReceivedContent:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__STKUSSDAlertSession_setHasReceivedContent___block_invoke;
  v3[3] = &unk_2645F48B8;
  v3[4] = self;
  BOOL v4 = a3;
  _STKWithLock((os_unfair_lock_s *)self, v3);
}

uint64_t __45__STKUSSDAlertSession_setHasReceivedContent___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = *(unsigned char *)(result + 40);
  return result;
}

- (void)performUSSDUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__STKUSSDAlertSession_performUSSDUpdate___block_invoke;
  v6[3] = &unk_2645F46C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _STKWithLock((os_unfair_lock_s *)self, v6);
}

void __41__STKUSSDAlertSession_performUSSDUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 96))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v4 = [*(id *)(v1 + 96) remoteObjectProxy];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    objc_super v3 = *(void **)(v1 + 104);
    id v4 = (id)MEMORY[0x223C91DC0](*(void *)(a1 + 40));
    objc_msgSend(v3, "addObject:");
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = STKUSSDSessionCommunicationInterface();
  [v6 setRemoteObjectInterface:v7];

  char v8 = STKUSSDHostCommunicationInterface();
  [v6 setExportedInterface:v8];

  [v6 setExportedObject:self];
  [v6 resume];
  objc_storeStrong((id *)&self->_ussdConnection, a4);
  v9 = [(NSXPCConnection *)self->_ussdConnection remoteObjectProxy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = self->_connectionQueue;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(NSMutableArray *)self->_connectionQueue removeAllObjects];
  return 1;
}

- (int64_t)event
{
  return self->_event;
}

- (NSXPCListener)ussdListener
{
  return self->_ussdListener;
}

- (NSXPCConnection)ussdConnection
{
  return self->_ussdConnection;
}

- (NSMutableArray)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_ussdConnection, 0);

  objc_storeStrong((id *)&self->_ussdListener, 0);
}

@end