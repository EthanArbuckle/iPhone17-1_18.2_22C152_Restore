@interface ICRadioFetchMetadataRequest
- (ICRadioFetchMetadataRequest)init;
- (ICStoreRequestContext)storeRequestContext;
- (NSArray)storeAdamIDs;
- (NSData)timedMetadataData;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)qualityOfService;
- (void)performWithResponseHandler:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setStoreAdamIDs:(id)a3;
- (void)setStoreRequestContext:(id)a3;
- (void)setTimedMetadataData:(id)a3;
@end

@implementation ICRadioFetchMetadataRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataData, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);

  objc_storeStrong((id *)&self->_storeAdamIDs, 0);
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setTimedMetadataData:(id)a3
{
}

- (NSData)timedMetadataData
{
  return self->_timedMetadataData;
}

- (void)setStoreRequestContext:(id)a3
{
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (void)setStoreAdamIDs:(id)a3
{
}

- (NSArray)storeAdamIDs
{
  return self->_storeAdamIDs;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(ICRadioFetchMetadataRequest *)self copy];
  v6 = [v5 storeRequestContext];
  if (v6)
  {
    v7 = [ICAsyncBlockOperation alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke;
    v11[3] = &unk_1E5ACC0B0;
    id v14 = v4;
    id v12 = v6;
    id v13 = v5;
    v8 = [(ICAsyncBlockOperation *)v7 initWithStartHandler:v11];
    v9 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
    [v9 addOperation:v8];
  }
  else if (v4)
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_2;
  v14[3] = &unk_1E5AC77F8;
  id v4 = *(id *)(a1 + 48);
  id v15 = v3;
  id v16 = v4;
  id v5 = v3;
  v6 = (void *)MEMORY[0x1A6240BF0](v14);
  v7 = +[ICURLBagProvider sharedBagProvider];
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_3;
  v10[3] = &unk_1E5ACD1D8;
  id v11 = v8;
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v9 = v6;
  [v7 getBagForRequestContext:v11 withCompletionHandler:v10];
}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    id v5 = v7;
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 radioConfiguration];
  id v7 = [v6 baseURL];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 URLByAppendingPathComponent:@"fetchMetadata" isDirectory:0];
    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v9];
      [v10 setHTTPMethod:@"POST"];
      id v11 = [[ICRadioURLRequest alloc] initWithURLRequest:v10 requestContext:*(void *)(a1 + 32)];
      uint64_t v12 = [v6 maxSupportedProtocolVersion];
      if (v12 <= 6) {
        uint64_t v13 = 6;
      }
      else {
        uint64_t v13 = v12;
      }
      [(ICRadioURLRequest *)v11 setProtocolVersion:v13];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_4;
      v20[3] = &unk_1E5AC9D58;
      id v21 = *(id *)(a1 + 40);
      [(ICRadioURLRequest *)v11 setRadioContentDictionaryCreationBlock:v20];
      id v14 = +[ICURLSessionManager highPrioritySession];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_5;
      v18[3] = &unk_1E5AC9D80;
      id v19 = *(id *)(a1 + 48);
      [v14 enqueueDataRequest:v11 withCompletionHandler:v18];
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 48);
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v10);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(void, void, id))(v15 + 16))(*(void *)(a1 + 48), 0, v5);
    }
    else
    {
      v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v17);
    }
  }
}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v8 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [*(id *)(a1 + 32) timedMetadataData];
  if (v6) {
    [v5 setObject:v6 forKey:@"timed-metadata"];
  }
  id v7 = [*(id *)(a1 + 32) storeAdamIDs];
  if (v7) {
    [v5 setObject:v7 forKey:@"ids"];
  }
  if (v8) {
    v8[2](v8, v5, 0);
  }
}

void __58__ICRadioFetchMetadataRequest_performWithResponseHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    uint64_t v6 = [(ICRadioResponse *)[ICRadioFetchMetadataResponse alloc] initWithURLResponse:v11];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = (void (**)(uint64_t, void, void *))(v7 + 16);
    if (v6)
    {
      id v9 = v6;
      id v10 = 0;
LABEL_7:
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v9, v10);
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = (void (**)(uint64_t, void, void *))(v7 + 16);
  }
  if (v5)
  {
    id v9 = 0;
    id v10 = v5;
    goto LABEL_7;
  }
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
  (*v8)(v7, 0, v9);
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  id v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_storeAdamIDs);
    objc_storeStrong(v5 + 2, self->_storeRequestContext);
    objc_storeStrong(v5 + 3, self->_timedMetadataData);
    v5[4] = self->_qualityOfService;
  }
  return v5;
}

- (ICRadioFetchMetadataRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICRadioFetchMetadataRequest;
  result = [(ICRadioFetchMetadataRequest *)&v3 init];
  if (result) {
    result->_qualityOfService = 25;
  }
  return result;
}

@end