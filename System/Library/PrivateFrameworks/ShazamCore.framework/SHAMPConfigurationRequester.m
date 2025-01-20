@interface SHAMPConfigurationRequester
- (SHStorefront)storefront;
- (id)endpointURLWithHost:(id)a3 path:(id)a4 storefront:(id)a5;
- (void)configurationEndpoint:(id)a3;
- (void)fetchOffersAtURL:(id)a3 completionHandler:(id)a4;
- (void)fetchShazamAMPConfiguration:(id)a3 completionHandler:(id)a4;
- (void)fetchStreamingProvidersAtURL:(id)a3 completionHandler:(id)a4;
- (void)offersWithCompletion:(id)a3;
- (void)streamingProvidersWithCompletion:(id)a3;
@end

@implementation SHAMPConfigurationRequester

- (void)configurationEndpoint:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[SHRemoteConfiguration sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke;
  v7[3] = &unk_2647E58A8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 shazamAMPConfigurationAPIHostWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = +[SHRemoteConfiguration sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_2;
  v9[3] = &unk_2647E5880;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v9[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v10 = v8;
  id v11 = *(id *)(a1 + 40);
  [v7 shazamOfferAPIURLPathWithCompletion:v9];

  objc_destroyWeak(&v12);
}

void __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [WeakRetained storefront];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_3;
  v13[3] = &unk_2647E5858;
  id v9 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v9;
  id v15 = v5;
  id v10 = *(id *)(a1 + 48);
  id v16 = v6;
  id v17 = v10;
  id v11 = v6;
  id v12 = v5;
  [v8 storefrontCountryCode:v13];
}

void __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) endpointURLWithHost:*(void *)(a1 + 40) path:*(void *)(a1 + 48) storefront:a2];
  id v7 = (id)v4;
  if (*(void *)(a1 + 40) && a2 && *(void *)(a1 + 48) && v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = +[SHCoreError errorWithCode:401 underlyingError:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

- (void)offersWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SHAMPConfigurationRequester_offersWithCompletion___block_invoke;
  v6[3] = &unk_2647E58D0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SHAMPConfigurationRequester *)self configurationEndpoint:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__SHAMPConfigurationRequester_offersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained fetchOffersAtURL:v4 completionHandler:*(void *)(a1 + 32)];
}

- (void)streamingProvidersWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SHAMPConfigurationRequester_streamingProvidersWithCompletion___block_invoke;
  v6[3] = &unk_2647E58D0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SHAMPConfigurationRequester *)self configurationEndpoint:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __64__SHAMPConfigurationRequester_streamingProvidersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained fetchStreamingProvidersAtURL:v4 completionHandler:*(void *)(a1 + 32)];
}

- (id)endpointURLWithHost:(id)a3 path:(id)a4 storefront:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [SHTokenizedURL alloc];
  id v11 = [v9 name];

  id v12 = [(SHTokenizedURL *)v10 initWithHost:v11 URLPath:v8];
  [(SHTokenizedURL *)v12 updateToken:3 withValue:v7];

  v13 = [(SHTokenizedURL *)v12 URLRepresentation];

  return v13;
}

- (void)fetchOffersAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SHAMPConfigurationRequester_fetchOffersAtURL_completionHandler___block_invoke;
  v8[3] = &unk_2647E58F8;
  id v9 = v6;
  id v7 = v6;
  [(SHAMPConfigurationRequester *)self fetchShazamAMPConfiguration:a3 completionHandler:v8];
}

void __66__SHAMPConfigurationRequester_fetchOffersAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 offers];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)fetchStreamingProvidersAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__SHAMPConfigurationRequester_fetchStreamingProvidersAtURL_completionHandler___block_invoke;
  v8[3] = &unk_2647E58F8;
  id v9 = v6;
  id v7 = v6;
  [(SHAMPConfigurationRequester *)self fetchShazamAMPConfiguration:a3 completionHandler:v8];
}

void __78__SHAMPConfigurationRequester_fetchStreamingProvidersAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 streamingProviders];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)fetchShazamAMPConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F089E0];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithURL:v7];

  [v8 setHTTPMethod:@"POST"];
  id v9 = [MEMORY[0x263F08BF8] sharedSession];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__SHAMPConfigurationRequester_fetchShazamAMPConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_2647E5920;
  id v13 = v5;
  id v10 = v5;
  id v11 = [v9 dataTaskWithRequest:v8 completionHandler:v12];

  [v11 resume];
}

void __77__SHAMPConfigurationRequester_fetchShazamAMPConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v8 = 0;
    v3 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:&v8];
    id v4 = v8;
    if (v3)
    {
      id v5 = [[SHAMPConfiguration alloc] initWithResponse:v3];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v7 = shcore_log_object();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_226D94000, v7, OS_LOG_TYPE_ERROR, "Failed to parse the offer response %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

- (SHStorefront)storefront
{
  storefront = self->_storefront;
  if (!storefront)
  {
    id v4 = objc_alloc_init(SHStorefront);
    id v5 = self->_storefront;
    self->_storefront = v4;

    storefront = self->_storefront;
  }
  return storefront;
}

- (void).cxx_destruct
{
}

@end