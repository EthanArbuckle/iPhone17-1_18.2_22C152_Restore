@interface NUANFEmbedConfigurationLoader
- (FCAsyncOnceOperation)asyncOnceOperation;
- (FCFlintResourceManager)flintResourceManager;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (NUANFEmbedConfigurationLoader)initWithAppConfigManager:(id)a3 flintResourceManager:(id)a4;
- (SXJSONDictionary)embedConfiguration;
- (id)asyncLoadEmbedConfigurationOnceWithCompletion:(id)a3;
- (id)loadEmbededConfigurationWithCompletion:(id)a3;
- (void)setAppConfigurationManager:(id)a3;
- (void)setAsyncOnceOperation:(id)a3;
- (void)setFlintResourceManager:(id)a3;
@end

@implementation NUANFEmbedConfigurationLoader

- (id)asyncLoadEmbedConfigurationOnceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [NUEmbedConfigurationOperation alloc];
  v6 = [(NUANFEmbedConfigurationLoader *)self appConfigurationManager];
  v7 = [(NUANFEmbedConfigurationLoader *)self flintResourceManager];
  v8 = [(NUEmbedConfigurationOperation *)v5 initWithAppConfigManager:v6 flintResourceManager:v7];

  [(FCOperation *)v8 setQualityOfService:25];
  [(FCOperation *)v8 setRelativePriority:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke;
  v12[3] = &unk_2645FF088;
  id v13 = v4;
  id v9 = v4;
  [(NUEmbedConfigurationOperation *)v8 setCompletion:v12];
  v10 = objc_msgSend(MEMORY[0x263F08A48], "fc_sharedConcurrentQueue");
  [v10 addOperation:v8];

  return v8;
}

- (NUANFEmbedConfigurationLoader)initWithAppConfigManager:(id)a3 flintResourceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NUANFEmbedConfigurationLoader;
  id v9 = [(NUANFEmbedConfigurationLoader *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_flintResourceManager, a4);
    v11 = [v7 possiblyUnfetchedAppConfiguration];
    v12 = v11;
    if (!__embedConfiguration
      || (uint64_t v13 = __loadedEmbedConfigurationID,
          [v11 embedConfigurationAssetID],
          v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          (void *)v13 != v14))
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x263F59390]) initWithTarget:v10 selector:sel_asyncLoadEmbedConfigurationOnceWithCompletion_];
      asyncOnceOperation = v10->_asyncOnceOperation;
      v10->_asyncOnceOperation = (FCAsyncOnceOperation *)v15;

      [(FCAsyncOnceOperation *)v10->_asyncOnceOperation setRelativePriority:1];
    }
  }
  return v10;
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

void __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 data];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F08900];
    v6 = [v3 data];
    id v7 = [v5 JSONObjectWithData:v6 options:4 error:0];

    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F6C620]) initWithValueClassBlock:&__block_literal_global_9 objectValueClassBlock:0 purgeBlock:0 andJSONObject:v7 andVersion:0];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_5;
      block[3] = &unk_2645FE180;
      id v11 = v8;
      id v12 = v3;
      id v13 = *(id *)(a1 + 32);
      id v9 = v8;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_3;
      v14[3] = &unk_2645FE158;
      id v15 = *(id *)(a1 + 32);
      __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_3((uint64_t)v14);
      id v9 = v15;
    }
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_2;
    v16[3] = &unk_2645FE158;
    id v17 = *(id *)(a1 + 32);
    __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_2((uint64_t)v16);
    id v7 = v17;
  }
}

uint64_t __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)&__embedConfiguration, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  id v3 = (void *)__loadedEmbedConfigurationID;
  __loadedEmbedConfigurationID = v2;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

- (id)loadEmbededConfigurationWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = [(NUANFEmbedConfigurationLoader *)self asyncOnceOperation];

  if (v5)
  {
    v6 = [(NUANFEmbedConfigurationLoader *)self asyncOnceOperation];
    id v7 = [v6 executeWithCompletionHandler:v4];
  }
  else
  {
    if (__embedConfiguration) {
      v4[2](v4);
    }
    id v7 = 0;
  }

  return v7;
}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (SXJSONDictionary)embedConfiguration
{
  return (SXJSONDictionary *)(id)__embedConfiguration;
}

uint64_t __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__NUANFEmbedConfigurationLoader_asyncLoadEmbedConfigurationOnceWithCompletion___block_invoke_4()
{
  return objc_opt_class();
}

- (void)setAppConfigurationManager:(id)a3
{
}

- (void)setFlintResourceManager:(id)a3
{
}

- (void)setAsyncOnceOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);

  objc_storeStrong((id *)&self->_embedConfiguration, 0);
}

@end