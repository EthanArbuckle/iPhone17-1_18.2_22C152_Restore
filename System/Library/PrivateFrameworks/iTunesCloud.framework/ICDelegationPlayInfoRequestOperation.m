@interface ICDelegationPlayInfoRequestOperation
- (ICDelegationPlayInfoRequest)playInfoRequest;
- (ICStoreRequestContext)storeRequestContext;
- (id)responseHandler;
- (void)_finishWithResult:(BOOL)a3 tokens:(id)a4 error:(id)a5;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)finishWithResponse:(id)a3 requestDate:(id)a4 error:(id)a5;
- (void)setPlayInfoRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setStoreRequestContext:(id)a3;
@end

@implementation ICDelegationPlayInfoRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_playInfoRequest, 0);

  objc_storeStrong((id *)&self->_strongSelf, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setStoreRequestContext:(id)a3
{
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (void)setPlayInfoRequest:(id)a3
{
}

- (ICDelegationPlayInfoRequest)playInfoRequest
{
  return self->_playInfoRequest;
}

- (void)_finishWithResult:(BOOL)a3 tokens:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  responseHandler = (void (**)(id, BOOL, id, id))self->_responseHandler;
  id v12 = v8;
  if (responseHandler)
  {
    if (a4) {
      id v10 = a4;
    }
    else {
      id v10 = (id)MEMORY[0x1E4F1CC08];
    }
    responseHandler[2](responseHandler, v6, v10, v8);
    id v11 = self->_responseHandler;
    self->_responseHandler = 0;

    id v8 = v12;
  }
  [(ICDelegationPlayInfoRequestOperation *)self finishWithError:v8];
}

- (void)finishWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICDelegationPlayInfoRequestOperation;
  [(ICAsyncOperation *)&v5 finishWithError:a3];
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;
}

- (void)execute
{
  objc_storeStrong((id *)&self->_strongSelf, self);
  v3 = +[ICURLBagProvider sharedBagProvider];
  storeRequestContext = self->_storeRequestContext;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke;
  v5[3] = &unk_1E5ACD950;
  v5[4] = self;
  [v3 getBagForRequestContext:storeRequestContext withCompletionHandler:v5];
}

void __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    v4 = [a2 urlForBagKey:@"getWholeHouseAudioPlayInfo"];
    if (v4)
    {
      objc_super v5 = [*(id *)(*(void *)(a1 + 32) + 296) propertyListRepresentation];
      BOOL v6 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
      v7 = [v6 deviceGUID];

      if (v7) {
        [v5 setObject:v7 forKey:@"guid"];
      }
      id v20 = 0;
      id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v20];
      if (v8)
      {
        v9 = (objc_class *)MEMORY[0x1E4F18D50];
        id v10 = v20;
        id v11 = (id)[[v9 alloc] initWithURL:v4 cachePolicy:1 timeoutInterval:30.0];
        [v11 setHTTPBody:v8];
        [v11 setHTTPMethod:@"POST"];
        [v11 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        v13 = [[ICStoreURLRequest alloc] initWithURLRequest:v11 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
        v14 = +[ICURLSessionManager defaultSession];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke_2;
        v18[3] = &unk_1E5ACAF80;
        v18[4] = *(void *)(a1 + 32);
        id v19 = v12;
        id v15 = v12;
        [v14 enqueueDataRequest:v13 withCompletionHandler:v18];
      }
      else
      {
        v17 = *(void **)(a1 + 32);
        id v11 = v20;
        [v17 _finishWithResult:0 tokens:0 error:v11];
      }
    }
    else
    {
      objc_super v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [*(id *)(a1 + 32) _finishWithResult:0 tokens:0 error:v5];
    }
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    [v16 _finishWithResult:0 tokens:0 error:a3];
  }
}

uint64_t __47__ICDelegationPlayInfoRequestOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResponse:a2 requestDate:*(void *)(a1 + 40) error:a3];
}

- (void)finishWithResponse:(id)a3 requestDate:(id)a4 error:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  if (a3)
  {
    id v8 = [a3 parsedBodyArray];
    if (v8)
    {
      v23 = self;
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v24 = v8;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        id v26 = v9;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (_NSIsNSDictionary())
            {
              id v15 = [v14 objectForKey:@"dsid"];
              v16 = [v14 objectForKey:@"play-info"];
              if _NSIsNSData() && (objc_opt_respondsToSelector())
              {
                v17 = [v14 objectForKey:@"token-ttl-in-seconds"];
                if (objc_opt_respondsToSelector())
                {
                  [v17 doubleValue];
                  v18 = objc_msgSend(v25, "dateByAddingTimeInterval:");
                }
                else
                {
                  v18 = 0;
                }
                id v19 = objc_alloc_init(ICDelegationPlayInfoResponseToken);
                [(ICDelegationPlayInfoResponseToken *)v19 setTokenData:v16];
                [(ICDelegationPlayInfoResponseToken *)v19 setExpirationDate:v18];
                id v20 = [v14 objectForKey:@"storefront"];
                if (_NSIsNSString()) {
                  [(ICDelegationPlayInfoResponseToken *)v19 setStorefrontIdentifier:v20];
                }
                v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "longLongValue"));
                [v27 setObject:v19 forKey:v21];

                id v9 = v26;
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }

      [(ICDelegationPlayInfoRequestOperation *)v23 _finishWithResult:1 tokens:v27 error:0];
      id v8 = v24;
    }
    else
    {
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      [(ICDelegationPlayInfoRequestOperation *)self _finishWithResult:0 tokens:0 error:v22];
    }
  }
  else
  {
    [(ICDelegationPlayInfoRequestOperation *)self _finishWithResult:0 tokens:0 error:a5];
  }
}

@end