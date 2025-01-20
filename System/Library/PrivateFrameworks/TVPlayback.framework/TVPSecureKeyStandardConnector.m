@interface TVPSecureKeyStandardConnector
- (NSOperationQueue)operationQueue;
- (TVPSecureKeyStandardConnector)init;
- (id)secureKeyStandardLoader:(id)a3 requestForFetchingDataFromURL:(id)a4;
- (id)secureKeyStandardLoader:(id)a3 requestForPostingData:(id)a4 toURL:(id)a5;
- (void)secureKeyStandardLoader:(id)a3 sendAsynchronousRequest:(id)a4 completionHandler:(id)a5;
- (void)setOperationQueue:(id)a3;
@end

@implementation TVPSecureKeyStandardConnector

- (TVPSecureKeyStandardConnector)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVPSecureKeyStandardConnector;
  v2 = [(TVPSecureKeyStandardConnector *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:5];
  }
  return v2;
}

- (id)secureKeyStandardLoader:(id)a3 requestForFetchingDataFromURL:(id)a4
{
  v4 = (objc_class *)MEMORY[0x263F089E0];
  id v5 = a4;
  objc_super v6 = (void *)[[v4 alloc] initWithURL:v5];

  [v6 setHTTPMethod:@"GET"];
  [v6 setTimeoutInterval:30.0];
  return v6;
}

- (id)secureKeyStandardLoader:(id)a3 requestForPostingData:(id)a4 toURL:(id)a5
{
  objc_super v6 = (objc_class *)MEMORY[0x263F089E0];
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)[[v6 alloc] initWithURL:v7];

  [v9 setHTTPMethod:@"POST"];
  [v9 setHTTPBody:v8];

  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v9 setTimeoutInterval:30.0];
  return v9;
}

- (void)secureKeyStandardLoader:(id)a3 sendAsynchronousRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURLRequest:v9];
  [v11 setITunesStoreRequest:1];
  objc_initWeak(&location, v11);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke;
  v14[3] = &unk_264CC6900;
  id v12 = v10;
  id v15 = v12;
  objc_copyWeak(&v16, &location);
  [v11 setOutputBlock:v14];
  v13 = [(TVPSecureKeyStandardConnector *)self operationQueue];
  [v13 addOperation:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke_2;
  v9[3] = &unk_264CC68D8;
  id v12 = *(id *)(a1 + 32);
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = [WeakRetained URLResponse];
  (*(void (**)(uint64_t, uint64_t, void *, void))(v2 + 16))(v2, v3, v4, *(void *)(a1 + 40));
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end