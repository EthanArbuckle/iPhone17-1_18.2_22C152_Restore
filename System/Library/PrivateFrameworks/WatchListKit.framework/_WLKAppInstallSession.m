@interface _WLKAppInstallSession
+ (id)_matchingAppProxyFromProxies:(id)a3 forInstallable:(id)a4;
- (AMSLookupItemOffer)offer;
- (BOOL)_canOpenAppWithBundleID:(id)a3;
- (NSString)sceneIdentifier;
- (WLKInstallable)installable;
- (_WLKAppInstallSession)initWithInstallable:(id)a3 offer:(id)a4 sceneIdentifier:(id)a5;
- (void)_doPurchaseWithAppAdamID:(id)a3 offerBuyParams:(id)a4;
- (void)_sendCompletionWithError:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)beginInstallationWithProgressHandler:(id)a3 completion:(id)a4;
- (void)dealloc;
@end

@implementation _WLKAppInstallSession

- (_WLKAppInstallSession)initWithInstallable:(id)a3 offer:(id)a4 sceneIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_WLKAppInstallSession;
  v10 = [(_WLKAppInstallSession *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_installable, a3);
    objc_storeStrong((id *)&v11->_offer, a4);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.WatchListKit._WLKAppInstallSession", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v14 addObserver:v11];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_WLKAppInstallSession;
  [(_WLKAppInstallSession *)&v4 dealloc];
}

- (void)applicationsWillInstall:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() _matchingAppProxyFromProxies:v4 forInstallable:self->_installable];

  v5 = v6;
  if (v6)
  {
    NSLog(&cfstr_AppWillInstall.isa, v6);
    v5 = v6;
  }
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _matchingAppProxyFromProxies:v4 forInstallable:self->_installable];

  if (v5)
  {
    NSLog(&cfstr_AppInstallDidS.isa, v5);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53___WLKAppInstallSession_applicationInstallsDidStart___block_invoke;
    block[3] = &unk_1E6209F68;
    block[4] = self;
    id v8 = v5;
    dispatch_async(queue, block);
  }
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _matchingAppProxyFromProxies:v4 forInstallable:self->_installable];

  if (v5)
  {
    NSLog(&cfstr_AppInstallDidC.isa, v5);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54___WLKAppInstallSession_applicationInstallsDidChange___block_invoke;
    block[3] = &unk_1E6209F68;
    block[4] = self;
    id v8 = v5;
    dispatch_async(queue, block);
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() _matchingAppProxyFromProxies:v4 forInstallable:self->_installable];

  if (v6)
  {
    NSLog(&cfstr_AppInstallDidF.isa, v6);
    v5 = [v6 bundleIdentifier];
    [(_WLKAppInstallSession *)self _canOpenAppWithBundleID:v5];

    [(_WLKAppInstallSession *)self _sendCompletionWithError:0];
  }
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4 = a3;
  id v7 = [(id)objc_opt_class() _matchingAppProxyFromProxies:v4 forInstallable:self->_installable];

  v5 = v7;
  if (v7)
  {
    NSLog(&cfstr_AppInstallDidF_0.isa, v7);
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKAppInstallerErrorDomain" code:-1 userInfo:0];
    [(_WLKAppInstallSession *)self _sendCompletionWithError:v6];

    v5 = v7;
  }
}

- (void)beginInstallationWithProgressHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke;
  block[3] = &unk_1E620B4D8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)_doPurchaseWithAppAdamID:(id)a3 offerBuyParams:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v32 = v5;
  NSLog(&cfstr_CallingPurchas.isa, v5, v6);
  if (![v6 length])
  {
    NSLog(&cfstr_RedownloadFail_0.isa, v5);
    v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKAppInstallerErrorDomain" code:-1 userInfo:0];
    [(_WLKAppInstallSession *)self _sendCompletionWithError:v22];

    id v13 = v6;
    goto LABEL_23;
  }
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  id v7 = (void *)getASDPurchaseClass_softClass;
  uint64_t v48 = getASDPurchaseClass_softClass;
  if (!getASDPurchaseClass_softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __getASDPurchaseClass_block_invoke;
    v43 = &unk_1E620B528;
    v44 = &v45;
    __getASDPurchaseClass_block_invoke((uint64_t)&v40);
    id v7 = (void *)v46[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v45, 8);
  id v31 = objc_alloc_init(v8);
  id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
  [v31 setItemID:v9];

  id v10 = [(_WLKAppInstallSession *)self installable];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v13 = v6;
LABEL_19:

    goto LABEL_20;
  }
  v11 = [(_WLKAppInstallSession *)self installable];
  int v12 = [v11 forceDSIDlessInstall];

  id v13 = v6;
  if (v12)
  {
    NSLog(&cfstr_InstallableFor.isa, v5);
    id v10 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v10 setPercentEncodedQuery:v6];
    v14 = [v10 queryItems];
    v29 = (void *)[v14 mutableCopy];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v15 = [v10 queryItems];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v20 = [v19 name];
          int v21 = [v20 isEqualToString:@"appExtVrsId"];

          if (v21)
          {
            v23 = (void *)MEMORY[0x1E4F290C8];
            v24 = [v19 value];
            v25 = [v23 queryItemWithName:@"externalVersionId" value:v24];

            [v29 addObject:v25];
            goto LABEL_18;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v49 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    [v10 setQueryItems:v29];
    id v13 = [v10 query];

    [v31 setIsDSIDLess:1];
    goto LABEL_19;
  }
LABEL_20:
  [v31 setBuyParameters:v13];
  NSLog(&cfstr_StartingRedown.isa, v32, v31);
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  v26 = (void *)getASDPurchaseManagerClass_softClass;
  uint64_t v48 = getASDPurchaseManagerClass_softClass;
  if (!getASDPurchaseManagerClass_softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __getASDPurchaseManagerClass_block_invoke;
    v43 = &unk_1E620B528;
    v44 = &v45;
    __getASDPurchaseManagerClass_block_invoke((uint64_t)&v40);
    v26 = (void *)v46[3];
  }
  id v27 = v26;
  _Block_object_dispose(&v45, 8);
  v28 = [v27 sharedManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __65___WLKAppInstallSession__doPurchaseWithAppAdamID_offerBuyParams___block_invoke;
  v33[3] = &unk_1E620B500;
  id v34 = v32;
  v35 = self;
  [v28 processPurchase:v31 withResponseHandler:v33];

LABEL_23:
}

+ (id)_matchingAppProxyFromProxies:(id)a3 forInstallable:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v12 = objc_msgSend(v6, "appBundleIDs", (void)v16);
        id v13 = [v11 bundleIdentifier];
        int v14 = [v12 containsObject:v13];

        if (v14)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_sendCompletionWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50___WLKAppInstallSession__sendCompletionWithError___block_invoke;
  v7[3] = &unk_1E6209F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_canOpenAppWithBundleID:(id)a3
{
  id v3 = a3;
  char v4 = 1;
  sleep(1u);
  uint64_t v10 = 0;
  id v5 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  char v6 = [v5 canOpenApplication:v3 reason:&v10];
  NSLog(&cfstr_CheckingIfCanO.isa, v3, 5, v10);
  if ((v6 & 1) == 0)
  {
    unint64_t v7 = 5;
    do
    {
      sleep(1u);
      char v4 = [v5 canOpenApplication:v3 reason:&v10];
      NSLog(&cfstr_ReCheckingIfCa.isa, v3, v7 - 1, v10);
      if (v4) {
        break;
      }
    }
    while (v7-- > 1);
  }

  return v4;
}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (AMSLookupItemOffer)offer
{
  return self->_offer;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_installable, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end