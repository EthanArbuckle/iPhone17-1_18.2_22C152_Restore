@interface SUUIRedeemConfiguration
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIITunesPassConfiguration)ITunesPassConfiguration;
- (SUUIRedeemConfiguration)initWithOperationQueue:(id)a3 category:(int64_t)a4 clientContext:(id)a5;
- (UIImage)inputImage;
- (UIImage)landingImage;
- (UIImage)successImage;
- (id)_redeemPreflightRequestBodyData;
- (int64_t)category;
- (void)_didLoadWithResponseDictionary:(id)a3;
- (void)_loadConfigurationWithURLBagDictionary:(id)a3 completionBlock:(id)a4;
- (void)_loadDefaultImages;
- (void)_setInputImage:(id)a3;
- (void)_setLandingImage:(id)a3;
- (void)_setSuccessImage:(id)a3;
- (void)loadConfigurationWithCompletionBlock:(id)a3;
@end

@implementation SUUIRedeemConfiguration

- (SUUIRedeemConfiguration)initWithOperationQueue:(id)a3 category:(int64_t)a4 clientContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SUUIRedeemConfiguration;
  v11 = [(SUUIRedeemConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_category = a4;
    objc_storeStrong((id *)&v11->_clientContext, a5);
    objc_storeStrong((id *)&v12->_operationQueue, a3);
  }

  return v12;
}

- (void)loadConfigurationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(SUUIClientContext *)self->_clientContext URLBag];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SUUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke;
  v7[3] = &unk_265407680;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v5 loadWithCompletionBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__SUUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SUUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2;
    block[3] = &unk_2654033C0;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __64__SUUIRedeemConfiguration_loadConfigurationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _loadConfigurationWithURLBagDictionary:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
}

- (void)_didLoadWithResponseDictionary:(id)a3
{
  id v4 = a3;
  int64_t category = self->_category;
  id v6 = @"inputAppStore;";
  if (category == 2) {
    id v6 = @"inputIBooks";
  }
  if (category == 1) {
    id v7 = @"inputITunes";
  }
  else {
    id v7 = v6;
  }
  id v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  id v9 = @"RetinaImageUrl";
  if (v10 == 1.0) {
    id v9 = @"ImageUrl";
  }
  v11 = v9;

  v12 = [NSString stringWithFormat:@"%@%@", v7, v11];
  v13 = [NSString stringWithFormat:@"%@%@", @"landing", v11];
  objc_super v14 = [NSString stringWithFormat:@"%@%@", @"success", v11];
  v15 = [v4 objectForKey:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = objc_alloc(MEMORY[0x263F7B3A0]);
    v17 = [NSURL URLWithString:v15];
    v18 = (void *)[v16 initWithURL:v17];

    v19 = +[SSVURLDataConsumer consumer];
    [v18 setDataConsumer:v19];

    [v18 setITunesStoreRequest:0];
    objc_initWeak(&location, self);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke;
    v37[3] = &unk_265400BC0;
    objc_copyWeak(&v38, &location);
    [v18 setOutputBlock:v37];
    [(NSOperationQueue *)self->_operationQueue addOperation:v18];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  v20 = [v4 objectForKey:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = objc_alloc(MEMORY[0x263F7B3A0]);
    v22 = [NSURL URLWithString:v20];
    v23 = (void *)[v21 initWithURL:v22];

    v24 = +[SSVURLDataConsumer consumer];
    [v23 setDataConsumer:v24];

    [v23 setITunesStoreRequest:0];
    objc_initWeak(&location, self);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_3;
    v35[3] = &unk_265400BC0;
    objc_copyWeak(&v36, &location);
    [v23 setOutputBlock:v35];
    [(NSOperationQueue *)self->_operationQueue addOperation:v23];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  v25 = [v4 objectForKey:v12];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = objc_alloc(MEMORY[0x263F7B3A0]);
    v27 = [NSURL URLWithString:v25];
    v28 = (void *)[v26 initWithURL:v27];

    v29 = +[SSVURLDataConsumer consumer];
    [v28 setDataConsumer:v29];

    [v28 setITunesStoreRequest:0];
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_5;
    v33[3] = &unk_265400BC0;
    objc_copyWeak(&v34, &location);
    [v28 setOutputBlock:v33];
    [(NSOperationQueue *)self->_operationQueue addOperation:v28];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  v30 = [v4 objectForKey:@"itunesPass"];
  if (self->_itunesPassConfiguration)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[SUUIITunesPassConfiguration alloc] initWithITunesPassDictionary:v30 clientContext:self->_clientContext];
      itunesPassConfiguration = self->_itunesPassConfiguration;
      self->_itunesPassConfiguration = v31;
    }
  }
}

void __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_2;
  v5[3] = &unk_2654022F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setLandingImage:*(void *)(a1 + 32)];
}

void __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_4;
  v5[3] = &unk_2654022F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setSuccessImage:*(void *)(a1 + 32)];
}

void __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_6;
  v5[3] = &unk_2654022F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __58__SUUIRedeemConfiguration__didLoadWithResponseDictionary___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setInputImage:*(void *)(a1 + 32)];
}

- (void)_loadConfigurationWithURLBagDictionary:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"getAddCreditPassUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [[SUUIITunesPassConfiguration alloc] initWithITunesPassDictionary:0 clientContext:self->_clientContext];
    itunesPassConfiguration = self->_itunesPassConfiguration;
    self->_itunesPassConfiguration = v9;
  }
  [(SUUIRedeemConfiguration *)self _loadDefaultImages];
  v11 = [v6 objectForKey:@"redeemPreflightIosSrv"];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263EFC5E8]);
    v13 = [NSURL URLWithString:v11];
    objc_super v14 = (void *)[v12 initWithURL:v13];

    v15 = [(SUUIRedeemConfiguration *)self _redeemPreflightRequestBodyData];
    [v14 setHTTPBody:v15];

    [v14 setHTTPMethod:@"POST"];
    [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    id v16 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURLRequest:v14];
    v17 = +[SSVURLDataConsumer consumer];
    [v16 setDataConsumer:v17];

    [v16 setITunesStoreRequest:1];
    v18 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
    [v16 setStoreFrontSuffix:v18];

    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __82__SUUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke;
    v19[3] = &unk_2654021A8;
    objc_copyWeak(&v21, &location);
    id v20 = v7;
    [v16 setOutputBlock:v19];
    [(NSOperationQueue *)self->_operationQueue addOperation:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __82__SUUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__SUUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke_2;
  block[3] = &unk_2654033C0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

uint64_t __82__SUUIRedeemConfiguration__loadConfigurationWithURLBagDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didLoadWithResponseDictionary:*(void *)(a1 + 32)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_loadDefaultImages
{
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [MEMORY[0x263F827E8] imageNamed:@"RedemptionCardArtwork" inBundle:v9];
  inputImage = self->_inputImage;
  self->_inputImage = v3;

  id v5 = [MEMORY[0x263F827E8] imageNamed:@"RedemptionCardArtworkCobra" inBundle:v9];
  landingImage = self->_landingImage;
  self->_landingImage = v5;

  id v7 = [MEMORY[0x263F827E8] imageNamed:@"RedemptionCardStack" inBundle:v9];
  successImage = self->_successImage;
  self->_successImage = v7;
}

- (id)_redeemPreflightRequestBodyData
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"iosRedeemPreflightInfo" forKey:@"preflightKey"];
  [v2 setObject:@"application/json" forKey:@"response-content-type"];
  id v3 = [MEMORY[0x263F89480] sharedInstance];
  id v4 = [v3 guid];

  if (v4) {
    [v2 setObject:v4 forKey:@"guid"];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"{"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__SUUIRedeemConfiguration__redeemPreflightRequestBodyData__block_invoke;
  v9[3] = &unk_2654076A8;
  id v10 = v5;
  id v6 = v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v9];
  objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 1, 1, @"}");
  id v7 = [v6 dataUsingEncoding:4];

  return v7;
}

uint64_t __58__SUUIRedeemConfiguration__redeemPreflightRequestBodyData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\"%@\":\"%@\",", a2, a3];
}

- (void)_setInputImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_inputImage = &self->_inputImage;
  if (self->_inputImage != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_inputImage, a3);
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SUUIRedeemConfigurationImagesDidLoadNotification" object:self];

    id v5 = v8;
  }
  MEMORY[0x270F9A758](p_inputImage, v5);
}

- (void)_setLandingImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_landingImage = &self->_landingImage;
  if (self->_landingImage != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_landingImage, a3);
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SUUIRedeemConfigurationImagesDidLoadNotification" object:self];

    id v5 = v8;
  }
  MEMORY[0x270F9A758](p_landingImage, v5);
}

- (void)_setSuccessImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_successImage = &self->_successImage;
  if (self->_successImage != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_successImage, a3);
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SUUIRedeemConfigurationImagesDidLoadNotification" object:self];

    id v5 = v8;
  }
  MEMORY[0x270F9A758](p_successImage, v5);
}

- (int64_t)category
{
  return self->_category;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (UIImage)inputImage
{
  return self->_inputImage;
}

- (SUUIITunesPassConfiguration)ITunesPassConfiguration
{
  return self->_itunesPassConfiguration;
}

- (UIImage)landingImage
{
  return self->_landingImage;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (UIImage)successImage
{
  return self->_successImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successImage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_landingImage, 0);
  objc_storeStrong((id *)&self->_itunesPassConfiguration, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end