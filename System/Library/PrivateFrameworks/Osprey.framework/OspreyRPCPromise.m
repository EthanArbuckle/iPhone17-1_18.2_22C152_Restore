@interface OspreyRPCPromise
- (OspreyRPCPromise)initWithFulfillmentQueue:(id)a3;
- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6;
- (id)clientStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 responseHandler:(id)a5;
- (void)fulfill:(id)a3;
- (void)serverStreamingRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 streamingResponseHandler:(id)a6 completion:(id)a7;
- (void)unaryRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 responseHandler:(id)a6;
@end

@implementation OspreyRPCPromise

- (OspreyRPCPromise)initWithFulfillmentQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OspreyRPCPromise;
  v6 = [(OspreyRPCPromise *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fulfillmentQueue, a3);
    v8 = [[OspreyDeferredObject alloc] initWithFulfillmentQueue:v5];
    deferredRPC = v7->_deferredRPC;
    v7->_deferredRPC = v8;
  }
  return v7;
}

- (void)fulfill:(id)a3
{
}

- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [[OspreyClientStreamContextPromise alloc] initWithFulfillmentQueue:self->_fulfillmentQueue];
  deferredRPC = self->_deferredRPC;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __115__OspreyRPCPromise_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v24[3] = &unk_1E63CBFB0;
  id v25 = v10;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  v16 = v14;
  v26 = v16;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [(OspreyDeferredObject *)deferredRPC fulfilledWithCompletion:v24];
  v21 = v26;
  v22 = v16;

  return v22;
}

void __115__OspreyRPCPromise_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 bidirectionalStreamingRequestWithMethodName:*(void *)(a1 + 32) requestBuilder:*(void *)(a1 + 48) streamingResponseHandler:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  [*(id *)(a1 + 40) fulfill:v3];
}

- (id)clientStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[OspreyClientStreamContextPromise alloc] initWithFulfillmentQueue:self->_fulfillmentQueue];
  deferredRPC = self->_deferredRPC;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __88__OspreyRPCPromise_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke;
  v20[3] = &unk_1E63CBFD8;
  id v21 = v8;
  id v23 = v9;
  id v24 = v10;
  id v13 = v11;
  v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(OspreyDeferredObject *)deferredRPC fulfilledWithCompletion:v20];
  id v17 = v22;
  id v18 = v13;

  return v18;
}

void __88__OspreyRPCPromise_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 clientStreamingRequestWithMethodName:*(void *)(a1 + 32) requestBuilder:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) fulfill:v3];
}

- (void)serverStreamingRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 streamingResponseHandler:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  deferredRPC = self->_deferredRPC;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __120__OspreyRPCPromise_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v23[3] = &unk_1E63CC000;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [(OspreyDeferredObject *)deferredRPC fulfilledWithCompletion:v23];
}

uint64_t __120__OspreyRPCPromise_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke(void *a1, void *a2)
{
  return [a2 serverStreamingRequestWithMethodName:a1[4] requestData:a1[5] requestBuilder:a1[6] streamingResponseHandler:a1[7] completion:a1[8]];
}

- (void)unaryRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  deferredRPC = self->_deferredRPC;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__OspreyRPCPromise_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke;
  v19[3] = &unk_1E63CC028;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(OspreyDeferredObject *)deferredRPC fulfilledWithCompletion:v19];
}

uint64_t __90__OspreyRPCPromise_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke(void *a1, void *a2)
{
  return [a2 unaryRequestWithMethodName:a1[4] requestData:a1[5] requestBuilder:a1[6] responseHandler:a1[7]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredRPC, 0);

  objc_storeStrong((id *)&self->_fulfillmentQueue, 0);
}

@end