@interface SUUIDonationConfiguration
- (NSArray)allCharities;
- (NSURL)donationPurchaseURL;
- (NSURL)donationValidationURL;
- (SUUIClientContext)clientContext;
- (SUUIDonationConfiguration)initWithOperationQueue:(id)a3 clientContext:(id)a4;
- (id)charityForIdentifier:(id)a3;
- (id)logoImageForCharity:(id)a3;
- (void)_finishLoadWithResponse:(id)a3 error:(id)a4 block:(id)a5;
- (void)_setLogoImage:(id)a3 forCharity:(id)a4;
- (void)addObserver:(id)a3;
- (void)loadConfigurationWithCompletionBlock:(id)a3;
- (void)loadLogoForCharity:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SUUIDonationConfiguration

- (SUUIDonationConfiguration)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDonationConfiguration;
  v9 = [(SUUIDonationConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_operationQueue, a3);
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  objc_initWeak(&location, a3);
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSHashTable *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  id v7 = objc_loadWeakRetained(&location);
  [(NSHashTable *)observers addObject:v7];

  objc_destroyWeak(&location);
}

- (id)charityForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_charities;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)loadConfigurationWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SUUIDonationConfiguration.m", 71, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  id v6 = self->_operationQueue;
  objc_initWeak(&location, self);
  uint64_t v7 = [(SUUIClientContext *)self->_clientContext URLBag];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__SUUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke;
  v11[3] = &unk_2654021D0;
  id v8 = v5;
  id v13 = v8;
  v11[4] = self;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  objc_super v12 = v9;
  [v7 loadValueForKey:@"charityGiftPageData" completionBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__SUUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)[objc_alloc(NSURL) initWithString:v5];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v7];
    v9 = +[SSVURLDataConsumer consumer];
    [v8 setDataConsumer:v9];

    v10 = [*(id *)(*(void *)(a1 + 32) + 24) valueForConfigurationKey:@"sfsuffix"];
    [v8 setStoreFrontSuffix:v10];

    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __66__SUUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2;
    id v14 = &unk_2654021A8;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    id v15 = *(id *)(a1 + 48);
    [v8 setOutputBlock:&v11];
    objc_msgSend(*(id *)(a1 + 40), "addOperation:", v8, v11, v12, v13, v14);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __66__SUUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__SUUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3;
  v9[3] = &unk_265402180;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __66__SUUIDonationConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishLoadWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40) block:*(void *)(a1 + 48)];
}

- (void)loadLogoForCharity:(id)a3
{
  id v4 = a3;
  charityImages = self->_charityImages;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)charityImages objectForKey:v6];

  if (!v7)
  {
    id v8 = [v4 logoArtwork];
    v9 = [v8 URL];

    if (v9)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v9];
      id v11 = +[SSVURLDataConsumer consumer];
      [v10 setDataConsumer:v11];

      [v10 setITunesStoreRequest:0];
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __48__SUUIDonationConfiguration_loadLogoForCharity___block_invoke;
      v12[3] = &unk_2654021F8;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      [v10 setOutputBlock:v12];
      [(NSOperationQueue *)self->_operationQueue addOperation:v10];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __48__SUUIDonationConfiguration_loadLogoForCharity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SUUIDonationConfiguration_loadLogoForCharity___block_invoke_2;
    block[3] = &unk_2654012C8;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v7);
  }
}

void __48__SUUIDonationConfiguration_loadLogoForCharity___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setLogoImage:*(void *)(a1 + 32) forCharity:*(void *)(a1 + 40)];
}

- (id)logoImageForCharity:(id)a3
{
  charityImages = self->_charityImages;
  id v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)charityImages objectForKey:v4];

  return v5;
}

- (void)removeObserver:(id)a3
{
  observers = self->_observers;
  id v4 = a3;
  [(NSHashTable *)observers removeObject:v4];
}

- (void)_finishLoadWithResponse:(id)a3 error:(id)a4 block:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v8 objectForKey:@"charities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = self;
      id v30 = v9;
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v28 = v11;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v32;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * v17);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[SUUIGiftCharity alloc] initWithCharityDictionary:v18];
              [v12 addObject:v19];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v15);
      }

      uint64_t v20 = [v12 copy];
      self = v29;
      charities = v29->_charities;
      v29->_charities = (NSArray *)v20;

      id v9 = v30;
      id v11 = v28;
    }
    v22 = [v8 objectForKey:@"donationBuyUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (NSURL *)[objc_alloc(NSURL) initWithString:v22];
      donationPurchaseURL = self->_donationPurchaseURL;
      self->_donationPurchaseURL = v23;
    }
    v25 = [v8 objectForKey:@"donationValidateUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = (NSURL *)[objc_alloc(NSURL) initWithString:v25];
      donationValidationURL = self->_donationValidationURL;
      self->_donationValidationURL = v26;
    }
    v10[2](v10, 1, 0);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v10)[2](v10, 0, v9);
  }
}

- (void)_setLogoImage:(id)a3 forCharity:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSArray *)self->_charities indexOfObjectIdenticalTo:v7] != 0x7FFFFFFFFFFFFFFFLL)
  {
    charityImages = self->_charityImages;
    if (!charityImages)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v10 = self->_charityImages;
      self->_charityImages = v9;

      charityImages = self->_charityImages;
    }
    id v11 = [v7 identifier];
    [(NSMutableDictionary *)charityImages setObject:v6 forKey:v11];

    id v12 = [(NSHashTable *)self->_observers allObjects];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v17 donationConfigurationController:self didLoadLogoForCharity:v7];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (NSArray)allCharities
{
  return self->_charities;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSURL)donationPurchaseURL
{
  return self->_donationPurchaseURL;
}

- (NSURL)donationValidationURL
{
  return self->_donationValidationURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_donationValidationURL, 0);
  objc_storeStrong((id *)&self->_donationPurchaseURL, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_charityImages, 0);
  objc_storeStrong((id *)&self->_charities, 0);
}

@end