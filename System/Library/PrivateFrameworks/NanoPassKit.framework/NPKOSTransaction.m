@interface NPKOSTransaction
+ (NPKOSTransaction)transactionWithName:(id)a3;
- (NSString)name;
- (id)_initWithName:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation NPKOSTransaction

- (id)_initWithName:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NPKOSTransaction;
  v5 = [(NPKOSTransaction *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.nanopasskit.ostransaction", 0);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    id v10 = [@"com.apple.nanopasskit." stringByAppendingString:v4];
    [v10 UTF8String];
    uint64_t v11 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v11;

    v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_opt_class();
        v17 = v5->_name;
        *(_DWORD *)buf = 138412546;
        v22 = v16;
        __int16 v23 = 2112;
        v24 = v17;
        id v18 = v16;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: %@: %@ begin", buf, 0x16u);
      }
    }
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_transaction)
  {
    v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = objc_opt_class();
        name = self->_name;
        *(_DWORD *)buf = 136447234;
        uint64_t v11 = "-[NPKOSTransaction dealloc]";
        __int16 v12 = 2082;
        v13 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKOSTransaction.m";
        __int16 v14 = 2048;
        uint64_t v15 = 31;
        __int16 v16 = 2112;
        v17 = v6;
        __int16 v18 = 2112;
        v19 = name;
        id v8 = v6;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %@: %@ was not invalidated prior to deallocation)", buf, 0x34u);
      }
    }
    _NPKAssertAbort();
  }
  v9.receiver = self;
  v9.super_class = (Class)NPKOSTransaction;
  [(NPKOSTransaction *)&v9 dealloc];
}

+ (NPKOSTransaction)transactionWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithName:v4];

  return (NPKOSTransaction *)v5;
}

- (void)invalidate
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__NPKOSTransaction_invalidate__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __30__NPKOSTransaction_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = objc_opt_class();
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
        int v14 = 138412546;
        uint64_t v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        id v8 = v6;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@: %@ invalidated", (uint8_t *)&v14, 0x16u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 8);
    *(void *)(v9 + 8) = 0;
LABEL_7:

    return;
  }
  if (v4)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 24);
      int v14 = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      id v13 = v11;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Warning: %@: %@ was already invalidated", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_7;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end