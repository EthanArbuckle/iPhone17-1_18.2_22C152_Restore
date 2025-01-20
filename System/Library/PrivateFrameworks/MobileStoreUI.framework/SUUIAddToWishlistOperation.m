@interface SUUIAddToWishlistOperation
- (SUUIAddToWishlistOperation)initWithItem:(id)a3 reason:(int64_t)a4;
- (void)main;
@end

@implementation SUUIAddToWishlistOperation

- (SUUIAddToWishlistOperation)initWithItem:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIAddToWishlistOperation;
  v7 = [(SUUIAddToWishlistOperation *)&v19 init];
  if (v7)
  {
    v7->_itemIdentifier = [v6 itemIdentifier];
    v7->_reason = a4;
    v8 = [v6 primaryItemOffer];
    v9 = [v8 actionParameters];

    if (v9)
    {
      uint64_t v10 = [NSURL copyDictionaryForQueryString:v9 unescapedValues:1];
      requestParameters = v7->_requestParameters;
      v7->_requestParameters = (NSMutableDictionary *)v10;

      [(NSMutableDictionary *)v7->_requestParameters removeObjectForKey:@"salableAdamId"];
    }
    else
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v13 = v7->_requestParameters;
      v7->_requestParameters = v12;
    }
    v14 = v7->_requestParameters;
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v7->_itemIdentifier);
    [(NSMutableDictionary *)v14 setObject:v15 forKey:@"id"];

    v16 = [v6 title];
    if (v16) {
      [(NSMutableDictionary *)v7->_requestParameters setObject:v16 forKey:@"wishlistItemName"];
    }
    v17 = [v6 itemKindString];

    if (v17) {
      [(NSMutableDictionary *)v7->_requestParameters setObject:v17 forKey:@"kind"];
    }
  }
  return v7;
}

- (void)main
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v3 setAllowedRetryCount:0];
  [v3 setCachePolicy:1];
  [v3 setITunesStoreRequest:1];
  [v3 setRequestParameters:self->_requestParameters];
  [v3 setShouldProcessProtocol:self->_reason == 0];
  [v3 setURLBagKey:@"addToWishlistBaseUrl"];
  [v3 setValue:@"Software" forHTTPHeaderField:*MEMORY[0x263F7B7B8]];
  v4 = SSVDefaultUserAgent();
  [v3 setValue:v4 forHTTPHeaderField:@"User-Agent"];

  v5 = [(SSURLConnectionRequest *)[SUUIURLConnectionRequest alloc] initWithRequestProperties:v3];
  [(SSURLConnectionRequest *)v5 setShouldMescalSign:1];
  id v6 = [MEMORY[0x263F7B0E8] defaultStore];
  v7 = [v6 activeAccount];

  v8 = (void *)[objc_alloc(MEMORY[0x263F7B120]) initWithAccount:v7];
  [(SSURLConnectionRequest *)v5 setAuthenticationContext:v8];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__26;
  v36 = __Block_byref_object_dispose__26;
  id v37 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __34__SUUIAddToWishlistOperation_main__block_invoke;
  v29[3] = &unk_265403070;
  v31 = &v32;
  uint64_t v10 = v9;
  v30 = v10;
  [(SUUIURLConnectionRequest *)v5 startWithConnectionResponseBlock:v29];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = v33[5];
  if (v11)
  {
    v27 = [MEMORY[0x263F08AC0] propertyListWithData:v11 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    v26 = [v27 objectForKey:@"status"];
    v12 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v13 = [v12 shouldLog];
    int v14 = [v12 shouldLogToDisk];
    v15 = [v12 OSLogObject];
    v16 = v15;
    if (v14) {
      int v17 = v13 | 2;
    }
    else {
      int v17 = v13;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      int v18 = v17;
    }
    else {
      int v18 = v17 & 2;
    }
    if (v18)
    {
      int64_t itemIdentifier = self->_itemIdentifier;
      int v38 = 138412546;
      v39 = v26;
      __int16 v40 = 2048;
      int64_t v41 = itemIdentifier;
      LODWORD(v25) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_13:

        if (objc_opt_respondsToSelector())
        {
          if ((unint64_t)[v26 integerValue] >= 2) {
            uint64_t v21 = 3;
          }
          else {
            uint64_t v21 = 0;
          }
        }
        else
        {
          uint64_t v21 = 3;
        }
        id v22 = objc_alloc(MEMORY[0x263F7B428]);
        v23 = [v7 uniqueIdentifier];
        v24 = objc_msgSend(v22, "initWithAccountIdentifier:", objc_msgSend(v23, "longLongValue"));

        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __34__SUUIAddToWishlistOperation_main__block_invoke_41;
        v28[3] = &unk_2654033E8;
        v28[4] = self;
        v28[5] = v21;
        [v24 performTransactionWithBlock:v28];

        goto LABEL_19;
      }
      v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v38, v25);
      free(v20);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_20:

  _Block_object_dispose(&v32, 8);
}

intptr_t __34__SUUIAddToWishlistOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bodyData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

uint64_t __34__SUUIAddToWishlistOperation_main__block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F7B308];
  uint64_t v4 = *MEMORY[0x263F7BD48];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 248);
  id v6 = a2;
  v7 = [v3 predicateWithProperty:v4 equalToLongLong:v5];
  v8 = [MEMORY[0x263F7B430] anyInDatabase:v6 predicate:v7];

  dispatch_semaphore_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v8 setValue:v9 forProperty:*MEMORY[0x263F7BD60]];

  return 1;
}

- (void).cxx_destruct
{
}

@end