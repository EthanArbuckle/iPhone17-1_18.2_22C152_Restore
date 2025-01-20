@interface NPKDoubleClickClientSuppressor
+ (BOOL)isSuppressingDoubleClickClients;
+ (id)sharedInstance;
+ (unint64_t)requestDoubleClickClientSuppressionWithResponseHandler:(id)a3;
+ (void)endDoubleClickClientSuppressionWithRequestToken:(unint64_t)a3;
- (BOOL)isSuppressingDoubleClickClients;
- (NPKAssertion)suppressionAssertion;
- (NPKDoubleClickClientSuppressor)init;
- (NSMutableIndexSet)suppressionRequestTokens;
- (OS_dispatch_queue)suppressorQueue;
- (unint64_t)nextSuppressionRequestToken;
- (unint64_t)requestDoubleClickClientSuppressionWithResponseHandler:(id)a3;
- (void)_acquireSuppressionAssertionIfNeededWithCompletion:(id)a3;
- (void)_acquireSuppressionAssertionWithCompletion:(id)a3;
- (void)_postSuppressionStateChanged;
- (void)dealloc;
- (void)endDoubleClickClientSuppressionWithRequestToken:(unint64_t)a3;
- (void)setNextSuppressionRequestToken:(unint64_t)a3;
- (void)setSuppressionAssertion:(id)a3;
- (void)setSuppressionRequestTokens:(id)a3;
- (void)setSuppressorQueue:(id)a3;
@end

@implementation NPKDoubleClickClientSuppressor

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__NPKDoubleClickClientSuppressor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;
  return v2;
}

void __48__NPKDoubleClickClientSuppressor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v1;
}

- (NPKDoubleClickClientSuppressor)init
{
  v9.receiver = self;
  v9.super_class = (Class)NPKDoubleClickClientSuppressor;
  v2 = [(NPKDoubleClickClientSuppressor *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanopasskit.NPKDoubleClickClientSuppressor", 0);
    suppressorQueue = v2->_suppressorQueue;
    v2->_suppressorQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_suppressorQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__NPKDoubleClickClientSuppressor_init__block_invoke;
    block[3] = &unk_2644D2910;
    v8 = v2;
    dispatch_sync(v5, block);
  }
  return v2;
}

void __38__NPKDoubleClickClientSuppressor_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *(void *)(*(void *)(a1 + 32) + 24) = 1;
}

- (void)dealloc
{
  uint64_t v3 = [(NPKDoubleClickClientSuppressor *)self suppressionAssertion];
  [v3 invalidateWithCompletion:0];

  v4.receiver = self;
  v4.super_class = (Class)NPKDoubleClickClientSuppressor;
  [(NPKDoubleClickClientSuppressor *)&v4 dealloc];
}

+ (unint64_t)requestDoubleClickClientSuppressionWithResponseHandler:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NPKDoubleClickClientSuppressor sharedInstance];
  unint64_t v5 = [v4 requestDoubleClickClientSuppressionWithResponseHandler:v3];

  return v5;
}

+ (void)endDoubleClickClientSuppressionWithRequestToken:(unint64_t)a3
{
  id v4 = +[NPKDoubleClickClientSuppressor sharedInstance];
  [v4 endDoubleClickClientSuppressionWithRequestToken:a3];
}

+ (BOOL)isSuppressingDoubleClickClients
{
  id v2 = +[NPKDoubleClickClientSuppressor sharedInstance];
  char v3 = [v2 isSuppressingDoubleClickClients];

  return v3;
}

- (unint64_t)requestDoubleClickClientSuppressionWithResponseHandler:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  BOOL v5 = [(NPKDoubleClickClientSuppressor *)self isSuppressingDoubleClickClients];
  objc_initWeak(&location, self);
  v6 = [(NPKDoubleClickClientSuppressor *)self suppressorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke;
  block[3] = &unk_2644D67B0;
  objc_copyWeak(&v10, &location);
  void block[4] = self;
  void block[5] = &v13;
  BOOL v11 = v5;
  dispatch_sync(v6, block);

  [(NPKDoubleClickClientSuppressor *)self _acquireSuppressionAssertionIfNeededWithCompletion:v4];
  unint64_t v7 = v14[3];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained nextSuppressionRequestToken];
  [WeakRetained setNextSuppressionRequestToken:v3 + 1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  [*(id *)(*(void *)(a1 + 32) + 16) addIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  if (!*(unsigned char *)(a1 + 56))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke_2;
    block[3] = &unk_2644D2910;
    void block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSuppressionStateChanged];
}

- (void)endDoubleClickClientSuppressionWithRequestToken:(unint64_t)a3
{
  BOOL v5 = [(NPKDoubleClickClientSuppressor *)self isSuppressingDoubleClickClients];
  objc_initWeak(&location, self);
  v6 = [(NPKDoubleClickClientSuppressor *)self suppressorQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke;
  v7[3] = &unk_2644D67D8;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  BOOL v9 = v5;
  dispatch_async(v6, v7);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained suppressionRequestTokens];
  [v3 removeIndex:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 48))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke_2;
    block[3] = &unk_2644D2910;
    void block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  id v4 = [WeakRetained suppressionRequestTokens];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    v6 = [WeakRetained suppressionAssertion];
    [v6 invalidateWithCompletion:0];
  }
}

uint64_t __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSuppressionStateChanged];
}

- (BOOL)isSuppressingDoubleClickClients
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  uint64_t v3 = [(NPKDoubleClickClientSuppressor *)self suppressorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NPKDoubleClickClientSuppressor_isSuppressingDoubleClickClients__block_invoke;
  block[3] = &unk_2644D6800;
  objc_copyWeak(&v6, &location);
  void block[4] = &v8;
  dispatch_sync(v3, block);

  LOBYTE(v3) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)v3;
}

void __65__NPKDoubleClickClientSuppressor_isSuppressingDoubleClickClients__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained suppressionRequestTokens];

  if (v2)
  {
    uint64_t v3 = [WeakRetained suppressionRequestTokens];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count] != 0;
  }
}

- (void)_acquireSuppressionAssertionIfNeededWithCompletion:(id)a3
{
  unint64_t v7 = (void (**)(id, void))a3;
  id v4 = [(NPKDoubleClickClientSuppressor *)self suppressionAssertion];

  if (v4
    && ([(NPKDoubleClickClientSuppressor *)self suppressionAssertion],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isAcquired],
        v5,
        v6))
  {
    v7[2](v7, 0);
  }
  else
  {
    [(NPKDoubleClickClientSuppressor *)self _acquireSuppressionAssertionWithCompletion:v7];
  }
}

- (void)_acquireSuppressionAssertionWithCompletion:(id)a3
{
  BOOL v9 = (void (**)(id, uint64_t))a3;
  id v4 = [[NPKAssertion alloc] initWithType:0 reason:@"Double click client suppression"];
  uint64_t v5 = [(NPKDoubleClickClientSuppressor *)self suppressionAssertion];
  [v5 invalidateWithCompletion:0];

  int v6 = [(NPKDoubleClickClientSuppressor *)self suppressionRequestTokens];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [(NPKDoubleClickClientSuppressor *)self setSuppressionAssertion:v4];
    uint64_t v8 = 0;
  }
  else
  {
    [(NPKAssertion *)v4 invalidateWithCompletion:0];
    uint64_t v8 = 1;
  }
  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)_postSuppressionStateChanged
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NPKDoubleClickClientSuppressionChangedNotification" object:0];
}

- (NPKAssertion)suppressionAssertion
{
  return self->_suppressionAssertion;
}

- (void)setSuppressionAssertion:(id)a3
{
}

- (NSMutableIndexSet)suppressionRequestTokens
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSuppressionRequestTokens:(id)a3
{
}

- (unint64_t)nextSuppressionRequestToken
{
  return self->_nextSuppressionRequestToken;
}

- (void)setNextSuppressionRequestToken:(unint64_t)a3
{
  self->_nextSuppressionRequestToken = a3;
}

- (OS_dispatch_queue)suppressorQueue
{
  return self->_suppressorQueue;
}

- (void)setSuppressorQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressorQueue, 0);
  objc_storeStrong((id *)&self->_suppressionRequestTokens, 0);
  objc_storeStrong((id *)&self->_suppressionAssertion, 0);
}

@end