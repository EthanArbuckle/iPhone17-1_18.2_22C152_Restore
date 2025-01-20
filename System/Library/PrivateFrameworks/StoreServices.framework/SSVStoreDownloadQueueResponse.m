@interface SSVStoreDownloadQueueResponse
- (BOOL)shouldCancelPurchaseBatch;
- (BOOL)triggeredQueueCheck;
- (NSArray)rangesToLoad;
- (NSData)keybag;
- (NSError)error;
- (NSNumber)userIdentifier;
- (NSOrderedSet)downloads;
- (NSString)clientIdentifier;
- (NSString)storeCorrelationID;
- (SSVStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4;
- (SSVStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5;
- (SSVStoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4;
- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4;
- (id)_initStoreDownloadQueueResponse;
- (id)errorForItemIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setShouldCancelPurchaseBatch:(BOOL)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setTriggeredQueueCheck:(BOOL)a3;
@end

@implementation SSVStoreDownloadQueueResponse

- (id)_initStoreDownloadQueueResponse
{
  v6.receiver = self;
  v6.super_class = (Class)SSVStoreDownloadQueueResponse;
  v2 = [(SSVStoreDownloadQueueResponse *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storeservices.StoreDownloadQueueResponse", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (SSVStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4
{
  return [(SSVStoreDownloadQueueResponse *)self initWithDictionary:a3 userIdentifier:a4 preferredAssetFlavor:0];
}

- (SSVStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SSVStoreDownloadQueueResponse *)self _initStoreDownloadQueueResponse];
  if (v11)
  {
    v12 = [v8 objectForKey:@"page-type"];
    unint64_t v13 = 0x1E4F1C000uLL;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v12 objectForKey:@"template-name"];

      v12 = (void *)v14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v15 = [v12 isEqualToString:@"preorder-success"];
    }
    else {
      char v15 = 0;
    }
    v16 = [v8 objectForKey:@"more"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = SSVCopyLoadMoreRangesFromArray(v16);
      rangesToLoad = v11->_rangesToLoad;
      v11->_rangesToLoad = (NSArray *)v17;
    }
    v19 = [v8 objectForKey:@"failureType"];

    if (v19)
    {
      v20 = [v8 objectForKey:@"customerMessage"];
      uint64_t v21 = [(SSVStoreDownloadQueueResponse *)v11 _errorWithFailureType:v19 customerMessage:v20];
      error = v11->_error;
      v11->_error = (NSError *)v21;
    }
    id v23 = [v8 objectForKey:@"failed-items"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v58 = v15;
      id v60 = v10;
      id v61 = v8;
      id v62 = v9;
      v24 = v11;
      id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v59 = v23;
      id v25 = v23;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v69 objects:v74 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v70 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unint64_t v31 = v13;
              v32 = [v30 objectForKey:@"item-id"];
              v33 = [v30 objectForKey:@"failureType"];
              v34 = [v30 objectForKey:@"customerMessage"];
              v35 = [(SSVStoreDownloadQueueResponse *)v24 _errorWithFailureType:v33 customerMessage:v34];

              if (v32) {
                BOOL v36 = v35 == 0;
              }
              else {
                BOOL v36 = 1;
              }
              if (!v36) {
                [v64 setObject:v35 forKey:v32];
              }

              unint64_t v13 = v31;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v69 objects:v74 count:16];
        }
        while (v27);
      }

      uint64_t v37 = [v64 copy];
      v11 = v24;
      itemErrors = v24->_itemErrors;
      v24->_itemErrors = (NSDictionary *)v37;

      id v8 = v61;
      id v9 = v62;
      id v23 = v59;
      id v10 = v60;
      char v15 = v58;
    }
    uint64_t v39 = [v8 objectForKey:@"keybag"];
    keybag = v11->_keybag;
    v11->_keybag = (NSData *)v39;

    v41 = [v8 objectForKey:@"dsPersonId"];
    v42 = SSAccountGetUniqueIdentifierFromValue(v41);

    if (v42) {
      v43 = v42;
    }
    else {
      v43 = v9;
    }
    objc_storeStrong((id *)&v11->_userIdentifier, v43);
    if ((v15 & 1) == 0)
    {
      uint64_t v44 = [v8 objectForKey:@"items"];

      id v23 = (id)v44;
      if (!v44)
      {
        id v23 = [v8 objectForKey:@"songList"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v63 = v9;
        v45 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
        downloads = v11->_downloads;
        v11->_downloads = v45;

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v23 = v23;
        uint64_t v47 = [v23 countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v66;
          do
          {
            v50 = v23;
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v66 != v49) {
                objc_enumerationMutation(v50);
              }
              v52 = [[SSVStoreDownload alloc] initWithDictionary:*(void *)(*((void *)&v65 + 1) + 8 * j)];
              if ([v10 length]) {
                [(SSVStoreDownload *)v52 setPreferredAssetFlavor:v10];
              }
              [(NSMutableOrderedSet *)v11->_downloads addObject:v52];
            }
            id v23 = v50;
            uint64_t v48 = [v50 countByEnumeratingWithState:&v65 objects:v73 count:16];
          }
          while (v48);
        }

        id v9 = v63;
      }
    }
    v53 = [v8 objectForKey:@"cancel-purchase-batch"];

    if (objc_opt_respondsToSelector()) {
      char v54 = [v53 BOOLValue];
    }
    else {
      char v54 = 0;
    }
    v11->_shouldCancelPurchaseBatch = v54;
    v55 = [[SSDictionaryResponse alloc] initWithResponseDictionary:v8];
    v56 = [(SSDictionaryResponse *)v55 actionsWithActionType:@"SSResponseActionTypeCheckDownloadQueues"];
    v11->_triggeredQueueCheck = [v56 count] != 0;
  }
  return v11;
}

- (SSVStoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SSVStoreDownloadQueueResponse *)self _initStoreDownloadQueueResponse];
  id v10 = (SSVStoreDownloadQueueResponse *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 3, a3);
    objc_storeStrong((id *)&v10->_userIdentifier, a4);
  }

  return v10;
}

- (NSOrderedSet)downloads
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_downloads copy];
  return (NSOrderedSet *)v2;
}

- (NSError)error
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__80;
  id v10 = __Block_byref_object_dispose__80;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SSVStoreDownloadQueueResponse_error__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __38__SSVStoreDownloadQueueResponse_error__block_invoke(uint64_t a1)
{
}

- (id)errorForItemIdentifier:(id)a3
{
  return [(NSDictionary *)self->_itemErrors objectForKey:a3];
}

- (NSData)keybag
{
  return self->_keybag;
}

- (NSArray)rangesToLoad
{
  return self->_rangesToLoad;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SSVStoreDownloadQueueResponse_setError___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __42__SSVStoreDownloadQueueResponse_setError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 24);
  id v4 = (id *)(v2 + 24);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)setShouldCancelPurchaseBatch:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__SSVStoreDownloadQueueResponse_setShouldCancelPurchaseBatch___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __62__SSVStoreDownloadQueueResponse_setShouldCancelPurchaseBatch___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 56) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setTriggeredQueueCheck:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SSVStoreDownloadQueueResponse_setTriggeredQueueCheck___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __56__SSVStoreDownloadQueueResponse_setTriggeredQueueCheck___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 57) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)shouldCancelPurchaseBatch
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SSVStoreDownloadQueueResponse_shouldCancelPurchaseBatch__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SSVStoreDownloadQueueResponse_shouldCancelPurchaseBatch__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

- (BOOL)triggeredQueueCheck
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SSVStoreDownloadQueueResponse_triggeredQueueCheck__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__SSVStoreDownloadQueueResponse_triggeredQueueCheck__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 57);
  return result;
}

- (NSNumber)userIdentifier
{
  return self->_userIdentifier;
}

- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v6 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = (int)[v5 intValue];
    uint64_t v8 = @"SSServerErrorDomain";
  }
  else
  {
    uint64_t v8 = @"SSErrorDomain";
    uint64_t v7 = 100;
  }
  char v9 = SSError((uint64_t)v8, v7, (uint64_t)v6, 0);

  return v9;
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
  self->_storeCorrelationID = (NSString *)a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  self->_clientIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_itemErrors, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end