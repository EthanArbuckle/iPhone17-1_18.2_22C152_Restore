@interface SKUIStoreAssetResourceLoaderDelegate
+ (id)storeAssetResourceLoaderDelegateForPlayableAsset:(id)a3 clientContext:(id)a4;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (SKUIClientContext)clientContext;
@end

@implementation SKUIStoreAssetResourceLoaderDelegate

+ (id)storeAssetResourceLoaderDelegateForPlayableAsset:(id)a3 clientContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUIStoreAssetResourceLoaderDelegate storeAssetResourceLoaderDelegateForPlayableAsset:clientContext:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  if ([v5 shouldUseITunesStoreSecureKeyDelivery])
  {
    v15 = objc_alloc_init(SKUIStoreAssetResourceLoaderDelegate);
    v16 = v15;
    if (!v15) {
      goto LABEL_15;
    }
    v15->_shouldUseITunesStoreSecureKeyDelivery = 1;
  }
  else
  {
    clientContext = [v5 keyCertificateURL];
    uint64_t v18 = [v5 keyServerURL];
    v19 = (NSURL *)v18;
    if (!clientContext || !v18 || (v20 = objc_alloc_init(SKUIStoreAssetResourceLoaderDelegate)) == 0)
    {

      v16 = 0;
      goto LABEL_14;
    }
    v16 = v20;
    keyCertificateURL = v20->_keyCertificateURL;
    v20->_keyCertificateURL = clientContext;
    v22 = clientContext;

    keyServerURL = v16->_keyServerURL;
    v16->_keyServerURL = v19;

    v16->_isITunesStream = [v5 isITunesStream];
  }
  v24 = (SKUIClientContext *)v6;
  clientContext = (NSURL *)v16->_clientContext;
  v16->_clientContext = v24;
LABEL_14:

LABEL_15:

  return v16;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIStoreAssetResourceLoaderDelegate resourceLoader:shouldWaitForLoadingOfRequestedResource:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  int v16 = SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest();
  if (v16)
  {
    if (!self->_operationQueue)
    {
      v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v17;

      [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.StoreKitUI.SKUIStoreAssetResourceLoaderDelegate.operationQueue"];
      [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:3];
    }
    uint64_t v46 = 0;
    v47 = (id *)&v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__4;
    v50 = __Block_byref_object_dispose__4;
    id v51 = 0;
    uint64_t v40 = 0;
    v41 = (id *)&v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__4;
    v44 = __Block_byref_object_dispose__4;
    id v45 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    aBlock[3] = &unk_1E64235C0;
    v33 = &v46;
    v34 = &v40;
    v35 = &v36;
    id v31 = v7;
    v32 = self;
    v19 = _Block_copy(aBlock);
    if (self->_shouldUseITunesStoreSecureKeyDelivery)
    {
      *((unsigned char *)v37 + 24) = 1;
      v20 = [(SKUIClientContext *)self->_clientContext URLBag];
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E4FA82F8];
        v24 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
        id v22 = [v23 URLBagForContext:v24];
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
      v26[3] = &unk_1E64235E8;
      v28 = &v40;
      v29 = &v46;
      id v27 = v19;
      [v22 loadWithCompletionBlock:v26];
    }
    else
    {
      objc_storeStrong(v47 + 5, self->_keyCertificateURL);
      objc_storeStrong(v41 + 5, self->_keyServerURL);
      *((unsigned char *)v37 + 24) = self->_isITunesStream;
      (*((void (**)(void *, void))v19 + 2))(v19, 0);
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&v46, 8);
  }

  return v16;
}

void __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2)
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
      id v4 = objc_alloc_init(MEMORY[0x1E4FA8368]);
      [v4 setITunesStoreRequest:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      [v4 setCertificateURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v4 setKeyServerURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [v4 setResourceLoadingRequest:*(void *)(a1 + 32)];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
      v6[3] = &unk_1E6423598;
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

uint64_t __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishLoadingWithError:a2];
  }
  else {
    return [v2 finishLoading];
  }
}

void __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v14 = a3;
  if (!v14)
  {
    id v5 = (objc_class *)MEMORY[0x1E4FA8378];
    id v6 = a2;
    id v7 = (void *)[[v5 alloc] initWithURLBagDictionary:v6];

    uint64_t v8 = [v7 pastisKeyServerURL];
    uint64_t v9 = *(void *)(a1[5] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [v7 pastisCertificateURL];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (SKUIClientContext)clientContext
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

+ (void)storeAssetResourceLoaderDelegateForPlayableAsset:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resourceLoader:(uint64_t)a3 shouldWaitForLoadingOfRequestedResource:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end