@interface PFOSTransactionQueue
+ (id)sharedASTCProcessingTransactionQueue;
+ (id)sharedTransactionQueueForName:(id)a3;
- (NSString)transactionName;
- (PFOSTransactionQueue)initWithTransactionName:(id)a3;
- (id)description;
- (void)_dispatchWork:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)dispatchAsync:(id)a3;
- (void)dispatchSync:(id)a3;
@end

@implementation PFOSTransactionQueue

+ (id)sharedTransactionQueueForName:(id)a3
{
  v3 = (__CFString *)a3;
  if (sharedTransactionQueueForName__onceToken != -1) {
    dispatch_once(&sharedTransactionQueueForName__onceToken, &__block_literal_global_7);
  }
  if (![(__CFString *)v3 length])
  {

    v3 = @"DEFAULT_TX_QUEUE";
  }
  id v4 = (id)sharedTransactionQueueForName__nameToQueueWeakMap;
  objc_sync_enter(v4);
  v5 = [(id)sharedTransactionQueueForName__nameToQueueWeakMap objectForKey:v3];
  if (!v5)
  {
    v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTransactionName:v3];
    [(id)sharedTransactionQueueForName__nameToQueueWeakMap setObject:v5 forKey:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

uint64_t __54__PFOSTransactionQueue_sharedTransactionQueueForName___block_invoke()
{
  sharedTransactionQueueForName__nameToQueueWeakMap = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  return MEMORY[0x270F9A758]();
}

+ (id)sharedASTCProcessingTransactionQueue
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PFOSTransactionQueue_sharedASTCProcessingTransactionQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedASTCProcessingTransactionQueue_onceToken != -1) {
    dispatch_once(&sharedASTCProcessingTransactionQueue_onceToken, block);
  }
  v2 = (void *)sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue;
  return v2;
}

void __60__PFOSTransactionQueue_sharedASTCProcessingTransactionQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) sharedTransactionQueueForName:@"sharedASTCProcessingTransactionQueue"];
  v2 = (void *)sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue;
  sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue = v1;

  if (sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue)
  {
    v3 = *(void **)(sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue + 8);
    [v3 setQualityOfService:25];
  }
}

- (PFOSTransactionQueue)initWithTransactionName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFOSTransactionQueue;
  v5 = [(PFOSTransactionQueue *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    transactionName = v5->_transactionName;
    v5->_transactionName = (NSString *)v6;

    v8 = [@"PFOSTransaction-" stringByAppendingString:v4];
    uint64_t v9 = objc_opt_new();
    txOperationQueue = v5->_txOperationQueue;
    v5->_txOperationQueue = (NSOperationQueue *)v9;

    [(NSOperationQueue *)v5->_txOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_txOperationQueue setName:v8];
  }
  return v5;
}

- (void)dispatchAsync:(id)a3
{
}

- (void)dispatchSync:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_transactionName withName:@"transactionName"];
  id v4 = [(NSOperationQueue *)self->_txOperationQueue progress];
  id v5 = (id)[v3 appendObject:v4 withName:@"progress"];

  uint64_t v6 = [v3 build];

  return v6;
}

- (void)_dispatchWork:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v4 = a4;
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    v7 = [(PFOSTransactionQueue *)self transactionName];
    txOperationQueue = self->_txOperationQueue;
    uint64_t v9 = (void *)MEMORY[0x263F086D0];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __56__PFOSTransactionQueue__dispatchWork_waitUntilFinished___block_invoke;
    v16 = &unk_26546EE48;
    id v17 = v7;
    id v18 = v6;
    id v10 = v7;
    v11 = [v9 blockOperationWithBlock:&v13];
    v19[0] = v11;
    objc_super v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v19, 1, v13, v14, v15, v16);
    [(NSOperationQueue *)txOperationQueue addOperations:v12 waitUntilFinished:v4];
  }
}

void __56__PFOSTransactionQueue__dispatchWork_waitUntilFinished___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  id v2 = (id)os_transaction_create();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)transactionName
{
  return self->_transactionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionName, 0);
  objc_storeStrong((id *)&self->_txOperationQueue, 0);
}

@end