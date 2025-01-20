@interface SSTransactionStore
+ (id)defaultStore;
- (SSTransactionStore)init;
- (void)releaseKeepAliveWithTransactionID:(id)a3;
- (void)takeKeepAliveWithTransactionID:(id)a3;
@end

@implementation SSTransactionStore

- (SSTransactionStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSTransactionStore;
  v2 = [(SSTransactionStore *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    transactionCount = v2->_transactionCount;
    v2->_transactionCount = (NSCountedSet *)v3;

    uint64_t v5 = objc_opt_new();
    transactionStore = v2->_transactionStore;
    v2->_transactionStore = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.storeservices.TransactionStore", v7);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

+ (id)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSTransactionStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken != -1) {
    dispatch_once(&defaultStore_onceToken, block);
  }
  v2 = (void *)defaultStore_transactionStore;
  return v2;
}

void __34__SSTransactionStore_defaultStore__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultStore_transactionStore;
  defaultStore_transactionStore = (uint64_t)v0;
}

- (void)takeKeepAliveWithTransactionID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SSTransactionStore_takeKeepAliveWithTransactionID___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __53__SSTransactionStore_takeKeepAliveWithTransactionID___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) countForObject:*(void *)(a1 + 40)];
  uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
  id v4 = (void *)v3;
  if (v2 != 1)
  {
    if (!v3)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v17 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = [v4 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      int v30 = 138543362;
      uint64_t v31 = v21;
      LODWORD(v29) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22) {
        goto LABEL_27;
      }
      v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v30, v29);
      free(v22);
      SSFileLog(v4, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v19);
    }

    goto LABEL_27;
  }
  if (!v3)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  int v30 = 138543362;
  uint64_t v31 = v9;
  LODWORD(v29) = 12;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v30, v29);
    free(v10);
    SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
LABEL_13:
  }
  [*(id *)(a1 + 40) UTF8String];
  id v4 = (void *)os_transaction_create();
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
LABEL_27:
}

- (void)releaseKeepAliveWithTransactionID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 15000000000);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SSTransactionStore_releaseKeepAliveWithTransactionID___block_invoke;
  v8[3] = &unk_1E5BA7018;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, dispatchQueue, v8);
}

void __56__SSTransactionStore_releaseKeepAliveWithTransactionID___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) countForObject:*(void *)(a1 + 40)];
  uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      int v8 = v6;
    }
    else {
      int v8 = v6 & 2;
    }
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v30 = 138543362;
      uint64_t v31 = v9;
      LODWORD(v29) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_14:

        return;
      }
      id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v30, v29);
      free(v10);
      SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  if (!v3)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v17 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  v19 = [v4 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
    int v20 = v18;
  }
  else {
    int v20 = v18 & 2;
  }
  if (!v20) {
    goto LABEL_26;
  }
  uint64_t v21 = *(void *)(a1 + 40);
  int v30 = 138543362;
  uint64_t v31 = v21;
  LODWORD(v29) = 12;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v30, v29);
    free(v22);
    SSFileLog(v4, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v19);
LABEL_26:
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_transactionStore, 0);
  objc_storeStrong((id *)&self->_transactionCount, 0);
}

@end