@interface SKUIRemoveFromWishlistOperation
- (SKUIRemoveFromWishlistOperation)initWithItemIdentifier:(int64_t)a3 entityIdentifier:(int64_t)a4 reason:(int64_t)a5;
- (void)main;
@end

@implementation SKUIRemoveFromWishlistOperation

- (SKUIRemoveFromWishlistOperation)initWithItemIdentifier:(int64_t)a3 entityIdentifier:(int64_t)a4 reason:(int64_t)a5
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIRemoveFromWishlistOperation;
  result = [(SKUIRemoveFromWishlistOperation *)&v10 init];
  if (result)
  {
    result->_entityID = a4;
    result->_itemID = a3;
    result->_reason = a5;
  }
  return result;
}

- (void)main
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA8268]);
  [v3 setAllowedRetryCount:0];
  [v3 setCachePolicy:1];
  [v3 setITunesStoreRequest:1];
  [v3 setShouldProcessProtocol:self->_reason == 0];
  [v3 setURLBagKey:@"removeFromWishlistBaseUrl"];
  [v3 setValue:@"Software" forHTTPHeaderField:*MEMORY[0x1E4FA86A0]];
  v4 = SSVDefaultUserAgent();
  [v3 setValue:v4 forHTTPHeaderField:@"User-Agent"];

  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", self->_itemID);
  [v3 setValue:v5 forRequestParameter:@"ids"];

  v6 = [(SSURLConnectionRequest *)[SKUIURLConnectionRequest alloc] initWithRequestProperties:v3];
  [(SSURLConnectionRequest *)v6 setShouldMescalSign:1];
  v7 = [MEMORY[0x1E4FA8100] defaultStore];
  v36 = [v7 activeAccount];

  v35 = (void *)[objc_alloc(MEMORY[0x1E4FA8130]) initWithAccount:v36];
  -[SSURLConnectionRequest setAuthenticationContext:](v6, "setAuthenticationContext:");
  v8 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    v9 |= 2u;
  }
  objc_super v10 = [v8 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (v11)
  {
    int64_t itemID = self->_itemID;
    LODWORD(v45) = 134217984;
    *(void *)((char *)&v45 + 4) = itemID;
    LODWORD(v32) = 12;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (v13)
    {
      v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v45, v32);
      free(v13);
      SSFileLog();
    }
  }
  else
  {
  }
  *(void *)&long long v45 = 0;
  *((void *)&v45 + 1) = &v45;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__94;
  v48 = __Block_byref_object_dispose__94;
  id v49 = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __39__SKUIRemoveFromWishlistOperation_main__block_invoke;
  v38[3] = &unk_1E642A138;
  v40 = &v45;
  v16 = v15;
  v39 = v16;
  [(SKUIURLConnectionRequest *)v6 startWithConnectionResponseBlock:v38];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v17 = *(void *)(*((void *)&v45 + 1) + 40);
  if (v17)
  {
    v18 = [MEMORY[0x1E4F28F98] propertyListWithData:v17 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    v34 = [v18 objectForKey:@"status"];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v33 = [v34 integerValue];
    v19 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v20 = [v19 shouldLog];
    int v21 = [v19 shouldLogToDisk];
    v22 = [v19 OSLogObject];
    v23 = v22;
    if (v21) {
      int v24 = v20 | 2;
    }
    else {
      int v24 = v20;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      int v25 = v24;
    }
    else {
      int v25 = v24 & 2;
    }
    if (v25)
    {
      int64_t v26 = self->_itemID;
      int v41 = 134218240;
      unint64_t v27 = v33;
      uint64_t v42 = v33;
      __int16 v43 = 2048;
      int64_t v44 = v26;
      LODWORD(v32) = 22;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28) {
        goto LABEL_24;
      }
      v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v41, v32);
      free(v28);
      SSFileLog();
    }
    else
    {
      unint64_t v27 = v33;
    }

LABEL_24:
    if (v27 <= 1)
    {
      id v29 = objc_alloc(MEMORY[0x1E4FA8398]);
      v30 = [v36 uniqueIdentifier];
      v31 = objc_msgSend(v29, "initWithAccountIdentifier:", objc_msgSend(v30, "longLongValue"));

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __39__SKUIRemoveFromWishlistOperation_main__block_invoke_33;
      v37[3] = &unk_1E6427FB8;
      v37[4] = self;
      [v31 performTransactionWithBlock:v37];
    }
    goto LABEL_26;
  }
LABEL_28:

  _Block_object_dispose(&v45, 8);
}

intptr_t __39__SKUIRemoveFromWishlistOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bodyData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

uint64_t __39__SKUIRemoveFromWishlistOperation_main__block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FA83A0];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithPersistentID:*(void *)(*(void *)(a1 + 32) + 248) inDatabase:v4];

  uint64_t v6 = [v5 deleteFromDatabase];
  return v6;
}

- (void)initWithItemIdentifier:entityIdentifier:reason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]";
}

@end