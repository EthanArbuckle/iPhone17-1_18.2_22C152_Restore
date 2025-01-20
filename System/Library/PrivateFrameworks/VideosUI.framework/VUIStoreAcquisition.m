@interface VUIStoreAcquisition
+ (id)sharedInstance;
- (VUIStoreAcquisition)init;
- (id)acquireWithProperties:(id)a3 completionBlock:(id)a4;
- (void)_handleRequest:(id)a3;
- (void)_handleResponse:(id)a3 responseDict:(id)a4 forRequest:(id)a5 error:(id)a6 cancelled:(BOOL)a7;
- (void)_processFirstRequest;
- (void)_processRequest:(id)a3;
- (void)cancelAcquisition:(id)a3;
- (void)postCrossProcessNotificationWithBuyParams:(id)a3 error:(id)a4;
@end

@implementation VUIStoreAcquisition

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_16 != -1) {
    dispatch_once(&sharedInstance_onceToken_16, &__block_literal_global_73);
  }
  v2 = (void *)sharedInstance_sSharedInstance_1;
  return v2;
}

void __37__VUIStoreAcquisition_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIStoreAcquisition);
  v1 = (void *)sharedInstance_sSharedInstance_1;
  sharedInstance_sSharedInstance_1 = (uint64_t)v0;
}

- (VUIStoreAcquisition)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIStoreAcquisition;
  v2 = [(VUIStoreAcquisition *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingQueue = v2->_pendingQueue;
    v2->_pendingQueue = v3;

    v2->_concurrentCount = 1;
  }
  return v2;
}

- (id)acquireWithProperties:(id)a3 completionBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 buyParams];
  if (![v8 length])
  {

    goto LABEL_16;
  }
  v9 = [v6 buyParams];
  v10 = [(VUIAcquisitionRequest *)self->_activeRequest properties];
  v11 = [v10 buyParams];
  char v12 = [v9 isEqualToString:v11];

  if (v12)
  {
LABEL_16:
    v23 = 0;
    goto LABEL_17;
  }
  id v25 = v7;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v13 = self->_pendingQueue;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v19 = [v6 buyParams];
        v20 = [v18 properties];
        v21 = [v20 buyParams];
        if ([v19 isEqualToString:v21])
        {
          char v22 = [v18 isCancelled];

          if ((v22 & 1) == 0)
          {

            v23 = 0;
            id v7 = v25;
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  v23 = objc_alloc_init(VUIAcquisitionRequest);
  id v7 = v25;
  [(VUIAcquisitionRequest *)v23 setCompletionBlock:v25];
  [(VUIAcquisitionRequest *)v23 setProperties:v6];
  [(NSMutableArray *)self->_pendingQueue addObject:v23];
  [(VUIStoreAcquisition *)self _processFirstRequest];
LABEL_17:

  return v23;
}

- (void)cancelAcquisition:(id)a3
{
}

- (void)_processFirstRequest
{
  if ([(NSMutableArray *)self->_pendingQueue count] && self->_concurrentCount)
  {
    id obj = [(NSMutableArray *)self->_pendingQueue objectAtIndex:0];
    if ([obj isCancelled])
    {
      [(NSMutableArray *)self->_pendingQueue removeObjectAtIndex:0];
      [(VUIStoreAcquisition *)self _processFirstRequest];
    }
    else
    {
      --self->_concurrentCount;
      objc_storeStrong((id *)&self->_activeRequest, obj);
      [(VUIStoreAcquisition *)self _processRequest:obj];
      [(NSMutableArray *)self->_pendingQueue removeObjectAtIndex:0];
    }
  }
}

- (void)_processRequest:(id)a3
{
  id v7 = a3;
  v4 = [v7 properties];
  v5 = [v4 userAgent];
  if (v5 || ([v4 dsid], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    [(VUIStoreAcquisition *)self _handleCustomRequest:v7];
    goto LABEL_5;
  }
  id v6 = [v4 strongToken];

  if (v6) {
    goto LABEL_4;
  }
  [(VUIStoreAcquisition *)self _handleRequest:v7];
LABEL_5:
}

- (void)_handleRequest:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 properties];
  id v6 = [v5 urlBagKey];
  id v7 = [v5 buyParams];
  if ([v7 length])
  {
    id v8 = [MEMORY[0x1E4FA8270] purchaseWithBuyParameters:v7];
    if ([v6 isEqualToString:@"redownloadProduct"])
    {
      v9 = objc_opt_new();
      [v9 setURLBagKey:v6];
      [v9 setShouldProcessProtocol:0];
      [v8 setRequestProperties:v9];
    }
    if (!v6 || [v6 isEqualToString:@"buyProduct"])
    {
      v10 = [v8 requestProperties];
      id v11 = (id)[v10 mutableCopy];

      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x1E4FA8268]);
      }
      [v8 setRequestProperties:v11];
    }
    objc_msgSend(v8, "setIgnoresForcedPasswordRestriction:", objc_msgSend(v5, "ignoresForcedPasswordRestriction"));
    id v12 = objc_alloc(MEMORY[0x1E4FA8278]);
    v29[0] = v8;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    id v14 = (id)[v12 initWithPurchases:v13];

    [v14 setCreatesDownloads:0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__VUIStoreAcquisition__handleRequest___block_invoke_58;
    v21[3] = &unk_1E6DF82B8;
    uint64_t v15 = &v22;
    v21[4] = self;
    id v22 = v4;
    id v16 = v4;
    [v14 startWithPurchaseResponseBlock:v21 completionBlock:&__block_literal_global_64];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setObject:@"Error making purchase: no buy params specified in request" forKey:*MEMORY[0x1E4F28568]];
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TVCKCloudDataClientError" code:0 userInfo:v8];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v24 = __38__VUIStoreAcquisition__handleRequest___block_invoke;
    id v25 = &unk_1E6DF45D8;
    long long v26 = self;
    id v27 = v4;
    id v28 = v17;
    v18 = (void *)MEMORY[0x1E4F29060];
    id v19 = v4;
    id v14 = v17;
    if ([v18 isMainThread]) {
      v24((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    uint64_t v15 = &v27;
    v20 = VUIDefaultLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreAcquisition _handleRequest:](v20);
    }
  }
}

uint64_t __38__VUIStoreAcquisition__handleRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleResponse:0 responseDict:0 forRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48) cancelled:1];
}

void __38__VUIStoreAcquisition__handleRequest___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 URLResponse];
  v5 = [v4 bodyData];

  if (v5)
  {
    id v31 = 0;
    id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v31];
    id v7 = v31;
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }
  uint64_t v8 = [v3 error];
  v9 = (void *)v8;
  if (v6) {
    v10 = 0;
  }
  else {
    v10 = v7;
  }
  if (v8) {
    v10 = (void *)v8;
  }
  id v11 = v10;

  id v12 = [v11 domain];
  if ([v12 isEqualToString:*MEMORY[0x1E4FB87D0]])
  {
    uint64_t v13 = [v11 code];

    if (v13 == 16)
    {
      BOOL v14 = 1;
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v15 = [v6 objectForKey:*MEMORY[0x1E4FB8880]];
  BOOL v14 = v15 != 0;

  if (!v7 && !v11 && !v15 && v6)
  {
    LOBYTE(v14) = 0;
    id v7 = 0;
    goto LABEL_21;
  }
LABEL_18:
  id v16 = VUIDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v7;
    __int16 v36 = 1024;
    BOOL v37 = v14;
    _os_log_error_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_ERROR, "Error making purchse: [%@] plist error [%@] Was cancelled [%d]", buf, 0x1Cu);
  }

LABEL_21:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v23 = __38__VUIStoreAcquisition__handleRequest___block_invoke_60;
  v24 = &unk_1E6DF5EC8;
  v17 = *(void **)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 32);
  id v26 = v3;
  id v27 = v6;
  id v28 = v17;
  id v29 = v11;
  BOOL v30 = v14;
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = v11;
  id v20 = v6;
  id v21 = v3;
  if ([v18 isMainThread]) {
    v23((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __38__VUIStoreAcquisition__handleRequest___block_invoke_60(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  [*(id *)(a1 + 32) _processFirstRequest];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
  return [v4 _handleResponse:v5 responseDict:v6 forRequest:v7 error:v8 cancelled:v9];
}

- (void)_handleResponse:(id)a3 responseDict:(id)a4 forRequest:(id)a5 error:(id)a6 cancelled:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v12 == 0;
  }
  uint64_t v16 = 2;
  if (v15) {
    uint64_t v16 = 0;
  }
  if (v7) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v16;
  }
  v18 = [v13 properties];
  id v19 = [v18 urlBagKey];

  id v20 = [v13 completionBlock];

  if (v20)
  {
    id v21 = [v13 completionBlock];
    ((void (**)(void, uint64_t, id, id))v21)[2](v21, v17, v12, v14);
  }
  id v22 = [v11 URLResponse];
  v23 = [v22 allHeaderFields];
  uint64_t v24 = objc_msgSend(v23, "vui_appleTimingAppHeaderValue");

  uint64_t v25 = VUIDefaultLogObject();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v28 = 134217984;
    uint64_t v29 = v24;
    _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_INFO, "Time to process buy in ms [%ld]", (uint8_t *)&v28, 0xCu);
  }

  if (v17 == 2 && (!v19 || [v19 isEqualToString:@"buyProduct"]))
  {
    id v26 = +[VUIMediaLibraryManager defaultManager];
    id v27 = [v26 deviceMediaLibrary];
    [v27 updateFromCloudWithReason:1];
  }
}

- (void)postCrossProcessNotificationWithBuyParams:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_opt_new();
  uint64_t v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:@"VUIStoreAcquisitionCrossProcessNotificationKeyError"];
  }
  if ([v5 length]) {
    [v8 setObject:v5 forKeyedSubscript:@"VUIStoreAcquisitionCrossProcessNotificationKeyBuyParams"];
  }
  uint64_t v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "Posting VUIStoreAcquisitionCrossProcessNotification with buy params: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = [MEMORY[0x1E4F28C40] defaultCenter];
  objc_msgSend(v10, "vui_postNotificationName:object:userInfo:", @"com.apple.VideosUI.StoreAcquisitionCrossProcessNotification", 0, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
}

- (void)_handleRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Error making purchse: no buy params specified in request", v1, 2u);
}

@end