@interface ICSuzeLeaseRequest
- (ICStoreRequestContext)requestContext;
- (ICSuzeLeaseRequest)initWithRequestContext:(id)a3 requestType:(int64_t)a4 leaseID:(id)a5 mediaType:(int64_t)a6 clientData:(id)a7;
- (NSData)clientData;
- (NSString)leaseID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)mediaType;
- (int64_t)qualityOfService;
- (int64_t)requestType;
- (void)performWithResponseHandler:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation ICSuzeLeaseRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_leaseID, 0);

  objc_storeStrong((id *)&self->_clientData, 0);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)leaseID
{
  return self->_leaseID;
}

- (NSData)clientData
{
  return self->_clientData;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(ICSuzeLeaseRequest *)self copy];
  v6 = [ICAsyncBlockOperation alloc];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke;
  v14 = &unk_1E5ACB5A0;
  id v15 = v5;
  id v16 = v4;
  id v7 = v4;
  id v8 = v5;
  v9 = [(ICAsyncBlockOperation *)v6 initWithStartHandler:&v11];
  v10 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", objc_msgSend(v8, "qualityOfService", v11, v12, v13, v14));
  [v10 addOperation:v9];
}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2;
  v17[3] = &unk_1E5AC9BC0;
  id v18 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v4 = v3;
  id v19 = v4;
  v5 = (void *)MEMORY[0x1A6240BF0](v17);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__22810;
  v15[4] = __Block_byref_object_dispose__22811;
  id v16 = 0;
  v6 = [*(id *)(a1 + 32) requestContext];
  id v7 = +[ICURLBagProvider sharedBagProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_4;
  v10[3] = &unk_1E5AC9C10;
  v14 = v15;
  id v11 = *(id *)(a1 + 32);
  id v8 = v6;
  id v12 = v8;
  id v9 = v5;
  id v13 = v9;
  [v7 getBagAndURLMetricsForRequestContext:v8 forceRefetch:0 withCompletionHandler:v10];

  _Block_object_dispose(v15, 8);
}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)[a1[4] qualityOfService], 0);
  id v11 = dispatch_queue_create("com.apple.iTunesCloud.ICSuzeLeaseRequest.calloutQueue", v10);

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_3;
  id v19 = &unk_1E5ACD2A0;
  id v12 = a1[6];
  id v20 = v7;
  id v21 = v8;
  id v22 = v9;
  id v23 = v12;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v11, &v16);
  objc_msgSend(a1[5], "finishWithError:", v13, v16, v17, v18, v19);
}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addingAggregatedMetrics:a3];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (v7)
  {
    unint64_t v12 = [*(id *)(a1 + 32) requestType] - 1;
    if (v12 > 2) {
      id v13 = 0;
    }
    else {
      id v13 = *off_1E5AC9C30[v12];
    }
    uint64_t v16 = [v7 urlForBagKey:v13];
    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      unint64_t v18 = [*(id *)(a1 + 32) mediaType] - 1;
      if (v18 > 6) {
        id v19 = @"unknown";
      }
      else {
        id v19 = off_1E5AC9C48[v18];
      }
      [v17 setObject:v19 forKey:@"media-kind"];
      id v23 = [*(id *)(a1 + 40) deviceInfo];
      uint64_t v24 = [v23 deviceGUID];

      if (v24) {
        [v17 setObject:v24 forKey:@"guid"];
      }
      uint64_t v25 = [*(id *)(a1 + 32) clientData];
      if (v25) {
        [v17 setObject:v25 forKey:@"client-data"];
      }
      v47 = (void *)v25;
      v48 = (void *)v24;
      v26 = [*(id *)(a1 + 32) leaseID];
      [v17 setObject:v26 forKey:@"lease-id"];

      id v52 = 0;
      v27 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v17 format:100 options:0 error:&v52];
      id v28 = v52;
      v29 = v28;
      if (v27)
      {
        id v45 = v8;
        v30 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v16];
        [v30 setHTTPMethod:@"POST"];
        [v30 setHTTPBody:v27];
        [v30 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
        v31 = [MEMORY[0x1E4F1C9C8] date];
        v32 = [[ICStoreURLRequest alloc] initWithURLRequest:v30 requestContext:*(void *)(a1 + 40)];
        [NSString stringWithFormat:@"suzeLease/%@", v13];
        v46 = v27;
        v33 = v16;
        v34 = v13;
        v36 = v35 = v29;
        [(ICURLRequest *)v32 enableLoadURLMetricsWithRequestName:v36];

        v37 = +[ICURLSessionManager defaultSession];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2_29;
        v49[3] = &unk_1E5AC9BE8;
        id v50 = v31;
        long long v44 = *(_OWORD *)(a1 + 48);
        id v38 = (id)v44;
        long long v51 = v44;
        id v39 = v31;
        [v37 enqueueDataRequest:v32 withCompletionHandler:v49];

        v29 = v35;
        id v13 = v34;
        uint64_t v16 = v33;
        v27 = v46;

        id v8 = v45;
      }
      else
      {
        uint64_t v40 = *(void *)(a1 + 48);
        uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        if (v28)
        {
          (*(void (**)(uint64_t, void, uint64_t, id))(v40 + 16))(v40, 0, v41, v28);
        }
        else
        {
          v43 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
          (*(void (**)(uint64_t, void, uint64_t, void *))(v40 + 16))(v40, 0, v41, v43);

          v29 = 0;
        }
      }
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v20 + 16))(v20, 0, v21, v22);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      (*(void (**)(void, void, uint64_t, id))(v14 + 16))(*(void *)(a1 + 48), 0, v15, v8);
    }
    else
    {
      v42 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7200 userInfo:0];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v14 + 16))(v14, 0, v15, v42);
    }
  }
}

void __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_2_29(void *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v7 = [v15 aggregatedPerformanceMetrics];
  uint64_t v8 = +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:v6 addingAggregatedMetrics:v7];
  uint64_t v9 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v5)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v11 = [v15 parsedBodyDictionary];
    if ([v11 count])
    {
      unint64_t v12 = [[ICSuzeLeaseResponse alloc] initWithResponseDictionary:v11 requestDate:a1[4]];
      id v13 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      uint64_t v14 = a1[5];
      unint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      id v13 = *(void (**)(void))(v14 + 16);
    }
    v13();
  }
}

uint64_t __49__ICSuzeLeaseRequest_performWithResponseHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSData *)self->_clientData copyWithZone:a3];
    id v7 = (void *)v5[1];
    v5[1] = v6;

    v5[6] = self->_requestType;
    uint64_t v8 = [(NSString *)self->_leaseID copyWithZone:a3];
    uint64_t v9 = (void *)v5[2];
    v5[2] = v8;

    v5[3] = self->_mediaType;
    v5[4] = self->_qualityOfService;
    id v10 = [(ICRequestContext *)self->_requestContext copyWithZone:a3];
    id v11 = (void *)v5[5];
    v5[5] = v10;
  }
  return v5;
}

- (ICSuzeLeaseRequest)initWithRequestContext:(id)a3 requestType:(int64_t)a4 leaseID:(id)a5 mediaType:(int64_t)a6 clientData:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ICSuzeLeaseRequest;
  id v15 = [(ICSuzeLeaseRequest *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    requestContext = v15->_requestContext;
    v15->_requestContext = (ICStoreRequestContext *)v16;

    v15->_requestType = a4;
    uint64_t v18 = [v13 copy];
    leaseID = v15->_leaseID;
    v15->_leaseID = (NSString *)v18;

    v15->_mediaType = a6;
    v15->_qualityOfService = 25;
    uint64_t v20 = [v14 copy];
    clientData = v15->_clientData;
    v15->_clientData = (NSData *)v20;
  }
  return v15;
}

@end