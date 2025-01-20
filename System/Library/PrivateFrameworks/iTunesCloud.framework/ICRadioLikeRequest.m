@interface ICRadioLikeRequest
- (ICRadioLikeRequest)initWithRequestContext:(id)a3;
- (ICStoreRequestContext)requestContext;
- (NSString)stationHash;
- (NSString)stationStringID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)likeState;
- (int64_t)qualityOfService;
- (int64_t)stationID;
- (int64_t)storeAdamID;
- (void)performWithResponseHandler:(id)a3;
- (void)setLikeState:(int64_t)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRequestContext:(id)a3;
- (void)setStationHash:(id)a3;
- (void)setStationID:(int64_t)a3;
- (void)setStationStringID:(id)a3;
- (void)setStoreAdamID:(int64_t)a3;
@end

@implementation ICRadioLikeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);

  objc_storeStrong((id *)&self->_stationHash, 0);
}

- (void)setRequestContext:(id)a3
{
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

- (void)setStationStringID:(id)a3
{
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (void)setStationHash:(id)a3
{
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (void)setLikeState:(int64_t)a3
{
  self->_likeState = a3;
}

- (int64_t)likeState
{
  return self->_likeState;
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->_storeAdamID = a3;
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(ICRadioLikeRequest *)self copy];
  v6 = [v5 requestContext];
  if (v6)
  {
    v7 = [ICAsyncBlockOperation alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke;
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

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_2;
  v14[3] = &unk_1E5AC9D28;
  id v4 = *(id *)(a1 + 48);
  id v15 = v3;
  id v16 = v4;
  id v5 = v3;
  v6 = (void *)MEMORY[0x1A6240BF0](v14);
  v7 = +[ICURLBagProvider sharedBagProvider];
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_3;
  v10[3] = &unk_1E5ACD1D8;
  id v11 = v8;
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v9 = v6;
  [v7 getBagForRequestContext:v11 withCompletionHandler:v10];
}

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 radioConfiguration];
  id v7 = [v6 urlForBagRadioKey:@"like-event-url"];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v7];
    [v8 setHTTPMethod:@"POST"];
    id v9 = [[ICRadioURLRequest alloc] initWithURLRequest:v8 requestContext:*(void *)(a1 + 32)];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_4;
    v14[3] = &unk_1E5AC9D58;
    id v15 = *(id *)(a1 + 40);
    [(ICRadioURLRequest *)v9 setRadioContentDictionaryCreationBlock:v14];
    v10 = +[ICURLSessionManager defaultSession];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_29;
    v12[3] = &unk_1E5AC9D80;
    id v13 = *(id *)(a1 + 48);
    [v10 enqueueDataRequest:v9 withCompletionHandler:v12];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v5);
      goto LABEL_6;
    }
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v8);
  }

LABEL_6:
}

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v16 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [*(id *)(a1 + 32) stationStringID];
  if ([v6 length])
  {
    [v5 setObject:v6 forKey:@"radio-station-id"];
    goto LABEL_9;
  }
  uint64_t v7 = [*(id *)(a1 + 32) stationID];
  if (v7)
  {
    v8 = [NSNumber numberWithLongLong:v7];
    id v9 = @"station-id";
LABEL_7:
    [v5 setObject:v8 forKey:v9];
    goto LABEL_8;
  }
  v8 = [*(id *)(a1 + 32) stationHash];
  if ([v8 length])
  {
    id v9 = @"station-hash";
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  uint64_t v10 = [*(id *)(a1 + 32) storeAdamID];
  if (v10)
  {
    uint64_t v11 = [NSNumber numberWithLongLong:v10];
    [v5 setObject:v11 forKey:@"id"];
  }
  [v5 setObject:&unk_1EF6409F0 forKey:@"type"];
  uint64_t v12 = [*(id *)(a1 + 32) likeState];
  if (v12 == -1) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v12 == 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v13;
  }
  id v15 = [NSNumber numberWithInteger:v14];
  [v5 setObject:v15 forKey:@"like-value"];

  if (v16) {
    v16[2](v16, v5, 0);
  }
}

void __49__ICRadioLikeRequest_performWithResponseHandler___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    uint64_t v6 = [(ICRadioResponse *)[ICRadioLikeResponse alloc] initWithURLResponse:v11];
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
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = v5;
  if (v5)
  {
    v5[2] = self->_likeState;
    v5[1] = self->_storeAdamID;
    v5[4] = self->_stationID;
    uint64_t v7 = [(NSString *)self->_stationHash copyWithZone:a3];
    v8 = (void *)v6[3];
    v6[3] = v7;

    uint64_t v9 = [(NSString *)self->_stationStringID copyWithZone:a3];
    id v10 = (void *)v6[5];
    v6[5] = v9;

    v6[6] = self->_qualityOfService;
    id v11 = [(ICRequestContext *)self->_requestContext copyWithZone:a3];
    uint64_t v12 = (void *)v6[7];
    v6[7] = v11;
  }
  return v6;
}

- (ICRadioLikeRequest)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICRadioLikeRequest;
  id v5 = [(ICRadioLikeRequest *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_qualityOfService = 25;
    uint64_t v7 = [v4 copy];
    requestContext = v6->_requestContext;
    v6->_requestContext = (ICStoreRequestContext *)v7;
  }
  return v6;
}

@end