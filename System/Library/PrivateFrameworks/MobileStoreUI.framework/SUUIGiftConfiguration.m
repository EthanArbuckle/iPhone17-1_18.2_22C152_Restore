@interface SUUIGiftConfiguration
- (BOOL)loadCachedConfiguration;
- (NSArray)fixedGiftAmountLabels;
- (NSArray)fixedGiftAmountValues;
- (NSArray)themes;
- (NSString)currencySymbol;
- (NSString)senderEmailAddress;
- (NSString)senderName;
- (NSString)storeFrontName;
- (NSURL)giftPurchaseURL;
- (NSURL)giftValidationURL;
- (SUUIClientContext)clientContext;
- (SUUIGiftConfiguration)initWithOperationQueue:(id)a3 clientContext:(id)a4;
- (_NSRange)giftAmountRange;
- (id)charityForIdentifier:(id)a3;
- (id)logoImageForCharity:(id)a3;
- (int64_t)currencySymbolPosition;
- (int64_t)maximumMessageLength;
- (void)_finishLoadAccountInfoWithResponse:(id)a3 error:(id)a4 block:(id)a5;
- (void)_finishLoadWithResponse:(id)a3 error:(id)a4 block:(id)a5;
- (void)_loadThemeImages;
- (void)_setHeaderImage:(id)a3 forTheme:(id)a4;
- (void)_setLogoImage:(id)a3 forCharity:(id)a4;
- (void)addObserver:(id)a3;
- (void)loadConfigurationWithCompletionBlock:(id)a3;
- (void)loadLogoForCharity:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SUUIGiftConfiguration

- (SUUIGiftConfiguration)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftConfiguration;
  v9 = [(SUUIGiftConfiguration *)&v12 init];
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

- (BOOL)loadCachedConfiguration
{
  return 0;
}

- (void)loadConfigurationWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SUUIGiftConfiguration.m", 99, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  id v6 = self->_operationQueue;
  objc_initWeak(&location, self);
  uint64_t v7 = [(SUUIClientContext *)self->_clientContext URLBag];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__SUUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke;
  v11[3] = &unk_2654021D0;
  id v8 = v5;
  id v13 = v8;
  v11[4] = self;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  objc_super v12 = v9;
  [v7 loadValueForKey:@"giftPageData" completionBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__SUUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v13 = __62__SUUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2;
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

void __62__SUUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__SUUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3;
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

void __62__SUUIGiftConfiguration_loadConfigurationWithCompletionBlock___block_invoke_3(uint64_t a1)
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
      v12[2] = __44__SUUIGiftConfiguration_loadLogoForCharity___block_invoke;
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

void __44__SUUIGiftConfiguration_loadLogoForCharity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__SUUIGiftConfiguration_loadLogoForCharity___block_invoke_2;
    block[3] = &unk_2654012C8;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v7);
  }
}

void __44__SUUIGiftConfiguration_loadLogoForCharity___block_invoke_2(uint64_t a1)
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
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  v79 = v7;
  v72 = v8;
  if (objc_opt_isKindOfClass())
  {
    v70 = (void (**)(void, void, void))v9;
    v71 = [v7 objectForKey:@"charities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v11 = v71;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v92 objects:v98 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v93;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v93 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v92 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = [[SUUIGiftCharity alloc] initWithCharityDictionary:v15];
              [v10 addObject:v16];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v92 objects:v98 count:16];
        }
        while (v12);
      }

      v17 = (NSArray *)[v10 copy];
      charities = self->_charities;
      self->_charities = v17;
    }
    v73 = [v79 objectForKey:@"currency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v68 = [v73 objectForKey:@"symbol"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = (NSString *)[v68 copy];
        currencySymbol = self->_currencySymbol;
        self->_currencySymbol = v19;
      }
      v67 = [v73 objectForKey:@"symbolPlacement"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int64_t v21 = [v67 isEqualToString:@"LEFT"] ^ 1;
      }
      else {
        int64_t v21 = 0;
      }
      self->_currencySymbolPosition = v21;
      v69 = [v73 objectForKey:@"range"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [v69 objectForKey:@"min"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v23 = [v22 objectForKey:@"value"];
          if (objc_opt_respondsToSelector()) {
            self->_giftAmountRange.id location = [v23 integerValue];
          }
        }
        v24 = [v69 objectForKey:@"max"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = [v24 objectForKey:@"value"];
          if (objc_opt_respondsToSelector()) {
            self->_giftAmountRange.length = [v25 integerValue] - self->_giftAmountRange.location;
          }
        }
      }
      v66 = [v73 objectForKey:@"amounts"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [MEMORY[0x263F82670] currentDevice];
        BOOL v27 = [v26 userInterfaceIdiom] == 1;

        if (v27) {
          v28 = @"iPad";
        }
        else {
          v28 = @"iPhone";
        }
        v65 = [v66 objectForKey:v28];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v77 = objc_alloc_init(MEMORY[0x263EFF980]);
          id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v89 = 0u;
          long long v88 = 0u;
          id v29 = v65;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v88 objects:v97 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v89;
            do
            {
              uint64_t v32 = 0;
              do
              {
                if (*(void *)v89 != v31) {
                  objc_enumerationMutation(v29);
                }
                v33 = *(void **)(*((void *)&v88 + 1) + 8 * v32);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v34 = [v33 objectForKey:@"label"];
                  v35 = [v33 objectForKey:@"value"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
                  {
                    [v77 addObject:v34];
                    v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v35, "integerValue"));
                    [v75 addObject:v36];
                  }
                }
                ++v32;
              }
              while (v30 != v32);
              uint64_t v30 = [v29 countByEnumeratingWithState:&v88 objects:v97 count:16];
            }
            while (v30);
          }

          v37 = (NSArray *)[v77 copy];
          fixedGiftAmountLabels = self->_fixedGiftAmountLabels;
          self->_fixedGiftAmountLabels = v37;

          v39 = (NSArray *)[v75 copy];
          fixedGiftAmountValues = self->_fixedGiftAmountValues;
          self->_fixedGiftAmountValues = v39;
        }
      }
    }
    v41 = objc_msgSend(v79, "objectForKey:", @"giftBuyUrl", v65);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = (NSURL *)[objc_alloc(NSURL) initWithString:v41];
      giftPurchaseURL = self->_giftPurchaseURL;
      self->_giftPurchaseURL = v42;
    }
    v78 = [v79 objectForKey:@"giftValidateUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = (NSURL *)[objc_alloc(NSURL) initWithString:v78];
      giftValidationURL = self->_giftValidationURL;
      self->_giftValidationURL = v44;
    }
    v76 = [v79 objectForKey:@"messageMaxLength"];
    if (objc_opt_respondsToSelector()) {
      self->_maximumMessageLength = [v76 integerValue];
    }
    v46 = [v79 objectForKey:@"storeFront"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = [v46 objectForKey:@"adjectiveCountryName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v48 = (NSString *)[v47 copy];
        storeFrontName = self->_storeFrontName;
        self->_storeFrontName = v48;
      }
    }
    v50 = [v79 objectForKey:@"ubers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v52 = v50;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v96 count:16];
      if (v53)
      {
        uint64_t v54 = *(void *)v85;
        do
        {
          uint64_t v55 = 0;
          do
          {
            if (*(void *)v85 != v54) {
              objc_enumerationMutation(v52);
            }
            uint64_t v56 = *(void *)(*((void *)&v84 + 1) + 8 * v55);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v57 = [[SUUIGiftTheme alloc] initWithThemeDictionary:v56];
              if (v57) {
                [v51 addObject:v57];
              }
            }
            ++v55;
          }
          while (v53 != v55);
          uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v96 count:16];
        }
        while (v53);
      }

      v58 = (NSArray *)[v51 copy];
      themes = self->_themes;
      self->_themes = v58;

      [(SUUIGiftConfiguration *)self _loadThemeImages];
    }
    v60 = [v79 objectForKey:@"giftAccountInfoUrl"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v61 = (void *)[objc_alloc(NSURL) initWithString:v60]) != 0)
    {
      objc_initWeak(&location, self);
      v62 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v61];
      v63 = +[SSVURLDataConsumer consumer];
      [v62 setDataConsumer:v63];

      v64 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
      [v62 setStoreFrontSuffix:v64];

      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __61__SUUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke;
      v80[3] = &unk_2654021A8;
      objc_copyWeak(&v82, &location);
      v81 = v70;
      [v62 setOutputBlock:v80];
      [(NSOperationQueue *)self->_operationQueue addOperation:v62];

      objc_destroyWeak(&v82);
      objc_destroyWeak(&location);
    }
    else
    {
      v70[2](v70, 1, 0);
    }

    id v9 = v70;
  }
  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v8);
  }
}

void __61__SUUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SUUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke_2;
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

void __61__SUUIGiftConfiguration__finishLoadWithResponse_error_block___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishLoadAccountInfoWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40) block:*(void *)(a1 + 48)];
}

- (void)_finishLoadAccountInfoWithResponse:(id)a3 error:(id)a4 block:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v14 objectForKey:@"status"];
    id v10 = v8;
    if (objc_opt_respondsToSelector())
    {
      id v10 = v8;
      if (![v11 integerValue])
      {
        id v12 = [v14 objectForKey:@"senderEmail"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&self->_senderEmailAddress, v12);
        }
        id v13 = [v14 objectForKey:@"fromName"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&self->_senderName, v13);
        }

        id v10 = 0;
      }
    }
  }
  ((void (**)(id, uint64_t, id))v9)[2](v9, 1, v10);
}

- (void)_loadThemeImages
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_themes;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v7 = [v6 headerImageURL];
        id v8 = [v6 headerImage];
        if (v8) {
          BOOL v9 = 1;
        }
        else {
          BOOL v9 = v7 == 0;
        }
        int v10 = !v9;

        if (v10)
        {
          id v11 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v7];
          id v12 = +[SSVURLDataConsumer consumer];
          [v11 setDataConsumer:v12];

          [v11 setITunesStoreRequest:0];
          objc_initWeak(&location, self);
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __41__SUUIGiftConfiguration__loadThemeImages__block_invoke;
          v14[3] = &unk_2654021F8;
          objc_copyWeak(&v15, &location);
          v14[4] = v6;
          [v11 setOutputBlock:v14];
          [(NSOperationQueue *)self->_operationQueue addOperation:v11];
          objc_destroyWeak(&v15);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }
}

void __41__SUUIGiftConfiguration__loadThemeImages__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SUUIGiftConfiguration__loadThemeImages__block_invoke_2;
    block[3] = &unk_2654012C8;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v9);
  }
}

void __41__SUUIGiftConfiguration__loadThemeImages__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setHeaderImage:*(void *)(a1 + 32) forTheme:*(void *)(a1 + 40)];
}

- (void)_setHeaderImage:(id)a3 forTheme:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSArray *)self->_themes indexOfObjectIdenticalTo:v7] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(NSHashTable *)self->_observers allObjects];
    [v7 setHeaderImage:v6];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "giftConfigurationController:didLoadImageForTheme:", self, v7, (void)v15);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
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
      uint64_t v10 = self->_charityImages;
      self->_charityImages = v9;

      charityImages = self->_charityImages;
    }
    uint64_t v11 = [v7 identifier];
    [(NSMutableDictionary *)charityImages setObject:v6 forKey:v11];

    uint64_t v12 = [(NSHashTable *)self->_observers allObjects];
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
          long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v17 giftConfigurationController:self didLoadLogoForCharity:v7];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSString)currencySymbol
{
  return self->_currencySymbol;
}

- (int64_t)currencySymbolPosition
{
  return self->_currencySymbolPosition;
}

- (NSArray)fixedGiftAmountLabels
{
  return self->_fixedGiftAmountLabels;
}

- (NSArray)fixedGiftAmountValues
{
  return self->_fixedGiftAmountValues;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (_NSRange)giftAmountRange
{
  NSUInteger length = self->_giftAmountRange.length;
  NSUInteger location = self->_giftAmountRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSURL)giftPurchaseURL
{
  return self->_giftPurchaseURL;
}

- (NSURL)giftValidationURL
{
  return self->_giftValidationURL;
}

- (int64_t)maximumMessageLength
{
  return self->_maximumMessageLength;
}

- (NSString)senderEmailAddress
{
  return self->_senderEmailAddress;
}

- (NSString)storeFrontName
{
  return self->_storeFrontName;
}

- (NSArray)themes
{
  return self->_themes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themes, 0);
  objc_storeStrong((id *)&self->_storeFrontName, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_giftValidationURL, 0);
  objc_storeStrong((id *)&self->_giftPurchaseURL, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_fixedGiftAmountValues, 0);
  objc_storeStrong((id *)&self->_fixedGiftAmountLabels, 0);
  objc_storeStrong((id *)&self->_currencySymbol, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_charityImages, 0);
  objc_storeStrong((id *)&self->_charities, 0);
}

@end