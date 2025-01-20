@interface ICQRemoteUIDataLoader
- (ICQRemoteUIDataLoader)init;
- (NSURLSession)session;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)addHeadersForRequest:(id)a3 withCompletion:(id)a4;
- (void)loadDataFromURL:(id)a3 completion:(id)a4;
- (void)setSession:(id)a3;
@end

@implementation ICQRemoteUIDataLoader

- (ICQRemoteUIDataLoader)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICQRemoteUIDataLoader;
  v2 = [(ICQRemoteUIDataLoader *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v4 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"ICQRemoteUILoaderSession"];
    objc_msgSend(v3, "set_appleIDContext:", v4);

    uint64_t v5 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v3];
    session = v2->_session;
    v2->_session = (NSURLSession *)v5;
  }
  return v2;
}

- (void)addHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[v5 mutableCopy];
  [v7 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  [v7 setValue:@"application/x-buddyml" forHTTPHeaderField:@"Accept"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__ICQRemoteUIDataLoader_addHeadersForRequest_withCompletion___block_invoke;
  v11[3] = &unk_264921A18;
  id v13 = v7;
  id v14 = v6;
  id v12 = v5;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  objc_msgSend(v8, "icq_addHeadersForUpgradeWithCompletion:", v11);
}

uint64_t __61__ICQRemoteUIDataLoader_addHeadersForRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) allHTTPHeaderFields];
    id v4 = [NSString alloc];
    id v5 = [*(id *)(a1 + 32) HTTPBody];
    id v6 = (void *)[v4 initWithData:v5 encoding:4];
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Request headers: %@, body (decoded from data): %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)loadDataFromURL:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[ICQRemoteUIDataLoader loadDataFromURL:completion:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s - server call to URL %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [MEMORY[0x263F089E0] requestWithURL:v6 cachePolicy:1 timeoutInterval:30.0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke;
  v11[3] = &unk_264921A68;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v7;
  id v12 = v10;
  [(ICQRemoteUIDataLoader *)self addHeadersForRequest:v9 withCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained session];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2;
  v8[3] = &unk_264921A40;
  id v9 = *(id *)(a1 + 32);
  id v7 = [v6 dataTaskWithRequest:v4 completionHandler:v8];

  [v7 setDelegate:WeakRetained];
  [v7 resume];
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_3(v9, v10);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_19;
  }
  v11 = _ICQGetLogSystem();
  id v10 = v11;
  if (!v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_1(v10);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Received remoteUI Page data %@", (uint8_t *)&v17, 0xCu);
  }

  id v12 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  id v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v12;
    _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Received remoteUI XML %@", (uint8_t *)&v17, 0xCu);
  }

  if ([v12 containsString:@"forceRefresh=\"true\""])
  {
    id v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_2(v14);
    }

    +[ICQPurchase clearCacheAndNotifyClients];
    uint64_t v15 = *(void *)(a1 + 32);
    __int16 v16 = ICQCreateError();
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

LABEL_19:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = a7;
  id v10 = a6;
  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v16 = "-[ICQRemoteUIDataLoader URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]";
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __97__ICQRemoteUIDataLoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v13[3] = &unk_264921A90;
  id v14 = v9;
  id v12 = v9;
  [(ICQRemoteUIDataLoader *)self addHeadersForRequest:v10 withCompletion:v13];
}

uint64_t __97__ICQRemoteUIDataLoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[ICQRemoteUIDataLoader loadDataFromURL:completion:]_block_invoke";
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Received no data and no error in %s!", (uint8_t *)&v1, 0xCu);
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Unable to present upsell, user is already a subscriber! Asking CSF to refresh status", v1, 2u);
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Error making HTTP call to url: %@", (uint8_t *)&v4, 0xCu);
}

@end