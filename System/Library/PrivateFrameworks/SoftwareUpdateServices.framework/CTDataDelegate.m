@interface CTDataDelegate
+ (id)sharedInstance;
- (CTDataDelegate)init;
- (id)getCTClient;
- (id)getPreferredDataSubscriptionContext;
- (void)_initCTClient;
- (void)preferredDataSimChanged:(id)a3;
@end

@implementation CTDataDelegate

- (CTDataDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTDataDelegate;
  v2 = [(CTDataDelegate *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SoftwareUpdateServices.CTDataDelegate", 0);
    initiationQueue = v2->_initiationQueue;
    v2->_initiationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_2 != -1) {
    dispatch_once(&sharedInstance___once_2, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance___instance_8;
  return v2;
}

uint64_t __32__CTDataDelegate_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CTDataDelegate);
  uint64_t v1 = sharedInstance___instance_8;
  sharedInstance___instance_8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)_initCTClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_initiationQueue);
  if (!self->_client)
  {
    dispatch_queue_t v3 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:0];
    client = self->_client;
    self->_client = v3;
    MEMORY[0x270F9A758](v3, client);
  }
}

- (id)getCTClient
{
  initiationQueue = self->_initiationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__CTDataDelegate_getCTClient__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(initiationQueue, block);
  return self->_client;
}

uint64_t __29__CTDataDelegate_getCTClient__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initCTClient];
}

- (id)getPreferredDataSubscriptionContext
{
  initiationQueue = self->_initiationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CTDataDelegate_getPreferredDataSubscriptionContext__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(initiationQueue, block);
  return self->_subscriptionContext;
}

void __53__CTDataDelegate_getPreferredDataSubscriptionContext__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[2])
  {
    [v2 _initCTClient];
    dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    id v19 = 0;
    uint64_t v4 = [v3 getPreferredDataSubscriptionContextSync:&v19];
    id v5 = v19;
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v4;

    uint64_t v8 = *(void *)(a1 + 32);
    if (v5)
    {
      v9 = *(void **)(v8 + 16);
      *(void *)(v8 + 16) = 0;

      SULogDebug(@"%s: %@\n", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[CTDataDelegate getPreferredDataSubscriptionContext]_block_invoke");
    }
    else
    {
      v17 = *(void **)(v8 + 24);
      v18 = +[CTDataDelegate sharedInstance];
      [v17 setDelegate:v18];
    }
  }
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4 = a3;
  initiationQueue = self->_initiationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CTDataDelegate_preferredDataSimChanged___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(initiationQueue, v7);
}

void __42__CTDataDelegate_preferredDataSimChanged___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_initiationQueue, 0);
}

@end