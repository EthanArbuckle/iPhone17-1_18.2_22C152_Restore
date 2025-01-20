@interface WiFiP2PSPITransactionRequestor
+ (id)shared;
- (WiFiP2PSPITransactionRequestor)init;
- (id)remoteObjectInterface;
- (void)_removeOpenTransaction:(int64_t)a3;
- (void)beginTransaction:(int64_t)a3 completionHandler:(id)a4;
- (void)endTransaction:(int64_t)a3;
- (void)endTransaction:(int64_t)a3 completionHandler:(id)a4;
- (void)handleConnectionEstablishedWithProxy:(id)a3;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
@end

@implementation WiFiP2PSPITransactionRequestor

- (void)endTransaction:(int64_t)a3
{
}

- (void)endTransaction:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke;
  v13[3] = &unk_1E633F160;
  v13[5] = v14;
  v13[6] = a3;
  v13[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke_2;
  v9[3] = &unk_1E633F188;
  v11 = v14;
  int64_t v12 = a3;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v13 clientCompletionHandler:v9];

  _Block_object_dispose(v14, 8);
}

- (void)beginTransaction:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke;
  v13[3] = &unk_1E633F160;
  v13[5] = v14;
  v13[6] = a3;
  v13[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke_2;
  v9[3] = &unk_1E633F188;
  v11 = v14;
  int64_t v12 = a3;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v13 clientCompletionHandler:v9];

  _Block_object_dispose(v14, 8);
}

void __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = *(void **)(a1[4] + 8);
  id v6 = NSNumber;
  uint64_t v7 = a1[6];
  id v8 = a3;
  id v10 = a2;
  v9 = [v6 numberWithInteger:v7];
  [v5 addObject:v9];

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  [v10 beginTransaction:a1[6] completionHandler:v8];
}

void __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = (void *)a1[4];
  uint64_t v6 = a1[6];
  id v7 = a3;
  id v8 = a2;
  [v5 _removeOpenTransaction:v6];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  [v8 endTransaction:a1[6] completionHandler:v7];
}

- (void)_removeOpenTransaction:(int64_t)a3
{
  openTransactions = self->_openTransactions;
  v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [(NSMutableArray *)openTransactions indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = self->_openTransactions;
    [(NSMutableArray *)v7 removeObjectAtIndex:v6];
  }
}

uint64_t __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) _removeOpenTransaction:*(void *)(a1 + 56)];
  }
  if (![*(id *)(*(void *)(a1 + 32) + 8) count]) {
    [*(id *)(*(void *)(a1 + 32) + 16) stop];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (id)shared
{
  if (_MergedGlobals_1 != -1) {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_4);
  }
  v2 = (void *)qword_1EB6F1660;

  return v2;
}

uint64_t __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      [*(id *)(a1 + 32) _removeOpenTransaction:*(void *)(a1 + 56)];
    }
    if (![*(id *)(*(void *)(a1 + 32) + 8) count]) {
      [*(id *)(*(void *)(a1 + 32) + 16) stop];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1815598];
}

- (void)handleConnectionEstablishedWithProxy:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_openTransactions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "beginTransaction:completionHandler:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "integerValue", (void)v10), &__block_literal_global_53);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (WiFiP2PSPITransactionRequestor)init
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiP2PSPITransactionRequestor;
  v2 = [(WiFiP2PSPITransactionRequestor *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    openTransactions = v2->_openTransactions;
    v2->_openTransactions = (NSMutableArray *)v3;

    v5 = [WiFiP2PXPCConnection alloc];
    uint64_t v6 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PSPI", 0, v6);
    uint64_t v8 = [(WiFiP2PXPCConnection *)v5 initWithEndpointType:0 queue:v7 retryTimeout:-1];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (WiFiP2PXPCConnection *)v8;

    [(WiFiP2PXPCConnection *)v2->_xpcConnection setDelegate:v2];
  }
  return v2;
}

uint64_t __40__WiFiP2PSPITransactionRequestor_shared__block_invoke()
{
  qword_1EB6F1660 = objc_alloc_init(WiFiP2PSPITransactionRequestor);

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_openTransactions, 0);
}

@end