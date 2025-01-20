@interface SFAppContent
- (BOOL)installed;
- (NSArray)adamIDs;
- (NSURL)amsURLOverride;
- (OS_dispatch_queue)dispatchQueue;
- (SFAppContent)initWithAdamIDs:(id)a3;
- (id)_amsAppNameFromResult:(id)a3;
- (id)_amsArtworkDictionaryFromResult:(id)a3;
- (id)_amsFirstResponseDataItemFromResult:(id)a3;
- (id)_amsLaunchURLFromResult:(id)a3;
- (id)_launchOptions;
- (void)_amsFetchAppResultsWithCompletion:(id)a3;
- (void)_amsFetchArtworkIfNeeded;
- (void)_amsFetchArtworkWithRequest:(id)a3;
- (void)_amsFetchResults;
- (void)_amsLaunchIfNeeded;
- (void)_amsRun;
- (void)_fetchNameAndIconWithSize:(CGSize)a3 completion:(id)a4;
- (void)_launchWithCompletion:(id)a3;
- (void)fetchNameAndIconWithSize:(CGSize)a3 completion:(id)a4;
- (void)launchWithCompletion:(id)a3;
- (void)setAdamIDs:(id)a3;
- (void)setAmsURLOverride:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SFAppContent

- (SFAppContent)initWithAdamIDs:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFAppContent;
  v6 = [(SFAppContent *)&v32 init];
  v7 = v6;
  if (v6)
  {
    id v27 = v5;
    objc_storeStrong((id *)&v6->_adamIDs, a3);
    uint64_t v8 = MEMORY[0x223C13960]();
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    infoFetchRequests = v7->_infoFetchRequests;
    v7->_infoFetchRequests = (NSMutableArray *)v10;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v12 = v7->_adamIDs;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = (void *)MEMORY[0x263F01868];
          v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "integerValue"));
          v19 = [v17 applicationProxyForItemID:v18];

          v20 = [v19 appState];
          int v21 = [v20 isInstalled];

          if (v21)
          {
            appProxy = v7->_appProxy;
            v7->_appProxy = (LSApplicationProxy *)v19;
            id v23 = v19;

            uint64_t v24 = [(LSApplicationProxy *)v7->_appProxy itemName];
            appName = v7->_appName;
            v7->_appName = (NSString *)v24;

            goto LABEL_12;
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v5 = v27;
  }

  return v7;
}

- (BOOL)installed
{
  v2 = [(LSApplicationProxy *)self->_appProxy appState];
  char v3 = [v2 isInstalled];

  return v3;
}

- (void)_amsRun
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (![(SFAppContent *)self installed])
  {
    if (self->_amsResultsState != 4
      && ([(NSMutableArray *)self->_infoFetchRequests count] || self->_launchRequest))
    {
      [(SFAppContent *)self _amsFetchResults];
    }
    [(SFAppContent *)self _amsFetchArtworkIfNeeded];
    [(SFAppContent *)self _amsLaunchIfNeeded];
    if (self->_amsResultsState == 3)
    {
      self->_amsResultsState = 0;
      amsResultsError = self->_amsResultsError;
      self->_amsResultsError = 0;
    }
  }
}

- (void)_amsFetchResults
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_amsResultsState)
  {
    self->_amsResultsState = 1;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __32__SFAppContent__amsFetchResults__block_invoke;
    v3[3] = &unk_264472090;
    v3[4] = self;
    [(SFAppContent *)self _amsFetchAppResultsWithCompletion:v3];
  }
}

void __32__SFAppContent__amsFetchResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SFAppContent__amsFetchResults__block_invoke_2;
  block[3] = &unk_264471F30;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __32__SFAppContent__amsFetchResults__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  char v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = [*(id *)(a1 + 48) _amsAppNameFromResult:v4];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;

    uint64_t v8 = [*(id *)(a1 + 48) _amsArtworkDictionaryFromResult:v4];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [*(id *)(a1 + 48) _amsLaunchURLFromResult:v4];
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = v11;

    uint64_t v14 = *(void **)(a1 + 48);
    if (v14[4] && v14[5] && v14[6])
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = NSErrorWithOSStatusF();
    }

    id v2 = (id)v15;
  }
  uint64_t v16 = *(void *)(a1 + 48);
  v17 = *(void **)(v16 + 56);
  *(void *)(v16 + 56) = v2;
  id v19 = v2;

  [*(id *)(a1 + 48) _amsRun];
  if (v19) {
    int v18 = 3;
  }
  else {
    int v18 = 4;
  }
  *(_DWORD *)(*(void *)(a1 + 48) + 64) = v18;
}

- (void)_amsFetchAppResultsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v5 = [(objc_class *)getAMSMediaTaskClass() bagSubProfile];
  uint64_t v6 = [(objc_class *)getAMSMediaTaskClass() bagSubProfileVersion];
  Class AMSBagKeySetClass = getAMSBagKeySetClass();
  uint64_t v8 = [(objc_class *)getAMSMediaTaskClass() bagKeySet];
  [(objc_class *)AMSBagKeySetClass registerBagKeySet:v8 forProfile:v5 profileVersion:v6];

  uint64_t v9 = [(objc_class *)getAMSBagClass() bagForProfile:v5 profileVersion:v6];
  id v10 = (void *)[objc_alloc(getAMSMediaTaskClass()) initWithType:0 clientIdentifier:@"com.apple.sharing" clientVersion:@"1" bag:v9];
  [v10 setItemIdentifiers:self->_adamIDs];
  [v10 setIncludedResultKeys:&unk_26CE7E278];
  if (gLogCategory_SFSubCredentialAppContent <= 50
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v11 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  uint64_t v12 = [v10 perform];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke;
  v17[3] = &unk_2644720B8;
  v17[4] = v11;
  id v18 = v4;
  id v13 = v4;
  [v12 addFinishBlock:v17];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke_2;
  handler[3] = &unk_264471EE0;
  id v16 = v12;
  id v14 = v12;
  dispatch_source_set_event_handler(v11, handler);
  CUDispatchTimerSet();
  dispatch_activate(v11);
}

void __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  dispatch_source_cancel(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFSubCredentialAppContent <= 90
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 32);
  return [v2 cancel];
}

- (void)_amsFetchArtworkIfNeeded
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(NSMutableArray *)self->_infoFetchRequests count])
  {
    if (self->_amsArtworkDict)
    {
      if (gLogCategory_SFSubCredentialAppContent <= 50
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      char v3 = self->_infoFetchRequests;
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v36 != v6) {
              objc_enumerationMutation(v3);
            }
            [(SFAppContent *)self _amsFetchArtworkWithRequest:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          }
          uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v5);
      }

      [(NSMutableArray *)self->_infoFetchRequests removeAllObjects];
    }
    else if (self->_amsResultsError)
    {
      if (gLogCategory_SFSubCredentialAppContent <= 90
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v8 = objc_alloc_init(getACAccountStoreClass());
      uint64_t v9 = getACAccountTypeIdentifieriTunesStore();
      uint64_t v10 = [v8 accountTypeWithAccountTypeIdentifier:v9];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v25 = (void *)v10;
      v26 = v8;
      uint64_t v11 = [v8 accountsWithAccountType:v10];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v32 != v14) {
              objc_enumerationMutation(v11);
            }
            if (gLogCategory_SFSubCredentialAppContent <= 90)
            {
              id v16 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              if (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize())
              {
                uint64_t v24 = objc_msgSend(v16, "objectForKeyedSubscript:", @"storefrontID", v24);
                LogPrintF();
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v13);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v17 = self->_infoFetchRequests;
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * k), "infoResponseHandler", v24);
            id v23 = (void *)v22;
            if (v22) {
              (*(void (**)(uint64_t, void, void, NSError *))(v22 + 16))(v22, 0, 0, self->_amsResultsError);
            }
          }
          uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
        }
        while (v19);
      }

      [(NSMutableArray *)self->_infoFetchRequests removeAllObjects];
    }
  }
}

- (void)_amsFetchArtworkWithRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v5 = (void *)[objc_alloc(getAMSMediaArtworkClass()) initWithDictionary:self->_amsArtworkDict];
  [v4 iconSize];
  double v7 = v6;
  double v9 = v8;
  uint64_t AMSMediaArtworkCropStyleBoundedBox = getAMSMediaArtworkCropStyleBoundedBox();
  uint64_t v11 = objc_msgSend(v5, "URLWithSize:cropStyle:format:", AMSMediaArtworkCropStyleBoundedBox, getAMSMediaArtworkFormatPNG(), v7, v9);
  id v12 = objc_alloc_init(MEMORY[0x263F089E0]);
  [v12 setURL:v11];
  [v12 setTimeoutInterval:5.0];
  uint64_t v13 = [MEMORY[0x263F08BF8] sharedSession];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke;
  uint64_t v19 = &unk_264472108;
  uint64_t v20 = self;
  id v21 = v4;
  id v14 = v4;
  uint64_t v15 = [v13 dataTaskWithRequest:v12 completionHandler:&v16];

  objc_msgSend(v15, "resume", v16, v17, v18, v19, v20);
}

void __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke_2;
  block[3] = &unk_2644720E0;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v11;
  uint64_t v21 = v12;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v10, block);
}

void __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFSubCredentialAppContent <= 50
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = [*(id *)(a1 + 32) length];
    char v3 = "yes";
    if (!*(void *)(a1 + 40)) {
      char v3 = "no";
    }
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v6 = v2;
    LogPrintF();
  }
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x263F827E8], "imageWithData:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 56), "infoResponseHandler", v6, v7, v8);
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, void, id, void))(v4 + 16))(v4, *(void *)(*(void *)(a1 + 64) + 32), v9, *(void *)(a1 + 48));
  }
  else if (gLogCategory_SFSubCredentialAppContent <= 90 {
         && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_amsLaunchIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  launchRequest = self->_launchRequest;
  if (launchRequest)
  {
    if (self->_amsLaunchURL)
    {
      amsURLOverride = self->_amsURLOverride;
      if (amsURLOverride)
      {
        uint64_t v5 = amsURLOverride;
      }
      else
      {
        objc_msgSend(NSURL, "URLWithString:");
        uint64_t v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      }
      id v7 = v5;
      if (gLogCategory_SFSubCredentialAppContent <= 50
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        id v14 = v7;
        LogPrintF();
      }
      uint64_t v8 = objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", v14);
      id v9 = [(SFAppContent *)self _launchOptions];
      id v16 = 0;
      [v8 openURL:v7 withOptions:v9 error:&v16];
      id v10 = v16;

      id v11 = [(SFLaunchRequest *)self->_launchRequest completionHandler];

      if (v11)
      {
        uint64_t v12 = [(SFLaunchRequest *)self->_launchRequest completionHandler];
        ((void (**)(void, id))v12)[2](v12, v10);
      }
      else if (gLogCategory_SFSubCredentialAppContent <= 90 {
             && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
      id v13 = self->_launchRequest;
      self->_launchRequest = 0;
    }
    else if (self->_amsResultsError)
    {
      uint64_t v6 = [(SFLaunchRequest *)launchRequest completionHandler];

      if (v6)
      {
        id v15 = [(SFLaunchRequest *)self->_launchRequest completionHandler];
        v15[2](v15, self->_amsResultsError);
      }
    }
  }
}

- (id)_amsAppNameFromResult:(id)a3
{
  char v3 = [(SFAppContent *)self _amsFirstResponseDataItemFromResult:a3];
  uint64_t v4 = [v3 valueForKeyPath:@"attributes.name"];

  return v4;
}

- (id)_amsArtworkDictionaryFromResult:(id)a3
{
  char v3 = [(SFAppContent *)self _amsFirstResponseDataItemFromResult:a3];
  uint64_t v4 = [v3 valueForKeyPath:@"attributes.platformAttributes.ios.artwork"];

  return v4;
}

- (id)_amsFirstResponseDataItemFromResult:(id)a3
{
  char v3 = [a3 responseDataItems];
  uint64_t v4 = [v3 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_amsLaunchURLFromResult:(id)a3
{
  char v3 = [(SFAppContent *)self _amsFirstResponseDataItemFromResult:a3];
  uint64_t v4 = [v3 valueForKeyPath:@"attributes.url"];

  return v4;
}

- (void)fetchNameAndIconWithSize:(CGSize)a3 completion:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__SFAppContent_fetchNameAndIconWithSize_completion___block_invoke;
  v10[3] = &unk_264472130;
  CGFloat v12 = width;
  CGFloat v13 = height;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(dispatchQueue, v10);
}

uint64_t __52__SFAppContent_fetchNameAndIconWithSize_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNameAndIconWithSize:completion:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_fetchNameAndIconWithSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    if ([(SFAppContent *)self installed])
    {
      uint64_t v8 = [(LSApplicationProxy *)self->_appProxy bundleIdentifier];
      if (v8)
      {
        id v9 = (void *)[objc_alloc(getISIconClass()) initWithBundleIdentifier:v8];
        if (gLogCategory_SFSubCredentialAppContent <= 50
          && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id v11 = objc_msgSend(objc_alloc(getISImageDescriptorClass()), "initWithSize:scale:", width, height, 2.0);
        v15[0] = v11;
        CGFloat v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
        [v9 prepareImagesForImageDescriptors:v12];

        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke;
        v13[3] = &unk_264472180;
        v13[4] = self;
        id v14 = v7;
        [v9 getCGImageForImageDescriptor:v11 completion:v13];
      }
      else
      {
        id v10 = NSErrorWithOSStatusF();
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v10);
      }
    }
    else
    {
      if (gLogCategory_SFSubCredentialAppContent <= 50
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v8 = objc_opt_new();
      objc_msgSend(v8, "setIconSize:", width, height);
      [v8 setInfoResponseHandler:v7];
      [(NSMutableArray *)self->_infoFetchRequests addObject:v8];
      [(SFAppContent *)self _amsRun];
    }
  }
}

void __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke(uint64_t a1, CGImageRef image)
{
  if (image) {
    CGImageRetain(image);
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke_2;
  block[3] = &unk_264472158;
  CGImageRef v8 = image;
  id v5 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v4, block);
}

void __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    CGImageRelease(*(CGImageRef *)(a1 + 48));
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
  }
}

- (void)launchWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SFAppContent_launchWithCompletion___block_invoke;
  v7[3] = &unk_2644721A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __37__SFAppContent_launchWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchWithCompletion:*(void *)(a1 + 40)];
}

- (void)_launchWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(SFAppContent *)self installed])
  {
    id v5 = [MEMORY[0x263F01880] defaultWorkspace];
    id v6 = objc_alloc_init(MEMORY[0x263F018D8]);
    id v7 = [(SFAppContent *)self _launchOptions];
    [v6 setFrontBoardOptions:v7];

    id v8 = [(LSApplicationProxy *)self->_appProxy bundleIdentifier];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__SFAppContent__launchWithCompletion___block_invoke;
    v11[3] = &unk_2644721F8;
    v11[4] = self;
    id v12 = v4;
    [v5 openApplicationWithBundleIdentifier:v8 configuration:v6 completionHandler:v11];
  }
  else
  {
    id v9 = (SFLaunchRequest *)objc_opt_new();
    [(SFLaunchRequest *)v9 setCompletionHandler:v4];
    launchRequest = self->_launchRequest;
    self->_launchRequest = v9;

    [(SFAppContent *)self _amsRun];
  }
}

void __38__SFAppContent__launchWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (gLogCategory_SFSubCredentialAppContent <= 50
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 24) applicationIdentifier];
    LogPrintF();
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SFAppContent__launchWithCompletion___block_invoke_2;
  block[3] = &unk_2644721D0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v4;
  id v11 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

uint64_t __38__SFAppContent__launchWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)_launchOptions
{
  return &unk_26CE7E308;
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void)setAdamIDs:(id)a3
{
}

- (NSURL)amsURLOverride
{
  return self->_amsURLOverride;
}

- (void)setAmsURLOverride:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_amsURLOverride, 0);
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_launchRequest, 0);
  objc_storeStrong((id *)&self->_infoFetchRequests, 0);
  objc_storeStrong((id *)&self->_amsResultsError, 0);
  objc_storeStrong((id *)&self->_amsLaunchURL, 0);
  objc_storeStrong((id *)&self->_amsArtworkDict, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
  objc_storeStrong((id *)&self->_amsBag, 0);
}

@end