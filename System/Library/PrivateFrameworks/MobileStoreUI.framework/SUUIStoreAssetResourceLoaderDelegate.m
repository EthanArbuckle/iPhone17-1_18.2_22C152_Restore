@interface SUUIStoreAssetResourceLoaderDelegate
+ (id)storeAssetResourceLoaderDelegateForPlayableAsset:(id)a3 clientContext:(id)a4;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (SUUIClientContext)clientContext;
@end

@implementation SUUIStoreAssetResourceLoaderDelegate

+ (id)storeAssetResourceLoaderDelegateForPlayableAsset:(id)a3 clientContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 shouldUseITunesStoreSecureKeyDelivery])
  {
    v7 = objc_alloc_init(SUUIStoreAssetResourceLoaderDelegate);
    v8 = v7;
    if (!v7) {
      goto LABEL_11;
    }
    v7->_shouldUseITunesStoreSecureKeyDelivery = 1;
  }
  else
  {
    clientContext = [v5 keyCertificateURL];
    uint64_t v10 = [v5 keyServerURL];
    v11 = (NSURL *)v10;
    if (!clientContext || !v10 || (v12 = objc_alloc_init(SUUIStoreAssetResourceLoaderDelegate)) == 0)
    {

      v8 = 0;
      goto LABEL_10;
    }
    v8 = v12;
    keyCertificateURL = v12->_keyCertificateURL;
    v12->_keyCertificateURL = clientContext;
    v14 = clientContext;

    keyServerURL = v8->_keyServerURL;
    v8->_keyServerURL = v11;

    v8->_isITunesStream = [v5 isITunesStream];
  }
  v16 = (SUUIClientContext *)v6;
  clientContext = (NSURL *)v8->_clientContext;
  v8->_clientContext = v16;
LABEL_10:

LABEL_11:
  return v8;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest();
  if (v8)
  {
    if (!self->_operationQueue)
    {
      v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v9;

      [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.iTunesStoreUI.SUUIStoreAssetResourceLoaderDelegate.operationQueue"];
      [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:3];
    }
    uint64_t v38 = 0;
    v39 = (id *)&v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__7;
    v42 = __Block_byref_object_dispose__7;
    id v43 = 0;
    uint64_t v32 = 0;
    v33 = (id *)&v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__7;
    v36 = __Block_byref_object_dispose__7;
    id v37 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    aBlock[3] = &unk_265401660;
    v25 = &v38;
    v26 = &v32;
    v27 = &v28;
    id v23 = v7;
    v24 = self;
    v11 = _Block_copy(aBlock);
    if (self->_shouldUseITunesStoreSecureKeyDelivery)
    {
      *((unsigned char *)v29 + 24) = 1;
      v12 = [(SUUIClientContext *)self->_clientContext URLBag];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        v15 = (void *)MEMORY[0x263F7B350];
        v16 = [MEMORY[0x263F7B358] contextWithBagType:0];
        id v14 = [v15 URLBagForContext:v16];
      }
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
      v18[3] = &unk_265401688;
      v20 = &v32;
      v21 = &v38;
      id v19 = v11;
      [v14 loadWithCompletionBlock:v18];
    }
    else
    {
      objc_storeStrong(v39 + 5, self->_keyCertificateURL);
      objc_storeStrong(v33 + 5, self->_keyServerURL);
      *((unsigned char *)v29 + 24) = self->_isITunesStream;
      (*((void (**)(void *, void))v11 + 2))(v11, 0);
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
  }

  return v8;
}

void __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) finishLoadingWithError:v3];
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v4 = objc_alloc_init(MEMORY[0x263F7B3D0]);
      [v4 setITunesStoreRequest:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      [v4 setCertificateURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v4 setKeyServerURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [v4 setResourceLoadingRequest:*(void *)(a1 + 32)];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
      v6[3] = &unk_265401638;
      id v7 = *(id *)(a1 + 32);
      [v4 setResponseBlock:v6];
      [*(id *)(*(void *)(a1 + 40) + 32) addOperation:v4];
    }
    else
    {
      id v5 = *(void **)(a1 + 32);
      SSError();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [v5 finishLoadingWithError:v4];
    }
  }
}

uint64_t __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishLoadingWithError:a2];
  }
  else {
    return [v2 finishLoading];
  }
}

void __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v14 = a3;
  if (!v14)
  {
    id v5 = (objc_class *)MEMORY[0x263F7B3F8];
    id v6 = a2;
    id v7 = (void *)[[v5 alloc] initWithURLBagDictionary:v6];

    uint64_t v8 = [v7 pastisKeyServerURL];
    uint64_t v9 = *(void *)(a1[5] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [v7 pastisCertificateURL];
    uint64_t v12 = *(void *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
}

@end