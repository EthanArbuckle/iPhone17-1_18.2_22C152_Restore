@interface ICSAPSessionPrepareFairPlayContextOperation
- (ICSAPSession)sapSession;
- (id)responseHandler;
- (void)_exchangeDataWithSAPContext:(id)a3 requestContext:(id)a4 setupURL:(id)a5 responseData:(id)a6 completionHandler:(id)a7;
- (void)execute;
- (void)setResponseHandler:(id)a3;
- (void)setSapSession:(id)a3;
@end

@implementation ICSAPSessionPrepareFairPlayContextOperation

- (void)execute
{
  v3 = [(ICSAPSession *)self->_sapSession _sapContext];
  if (v3)
  {
    responseHandler = (void (**)(id, void *, void))self->_responseHandler;
    if (responseHandler) {
      responseHandler[2](responseHandler, v3, 0);
    }
    [(ICAsyncOperation *)self finishWithError:0];
  }
  else
  {
    v5 = [(ICSAPSession *)self->_sapSession _certificateURL];
    v6 = [(ICSAPSession *)self->_sapSession _setupURL];
    v7 = [(ICSAPSession *)self->_sapSession _requestContext];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__26631;
    v25 = __Block_byref_object_dispose__26632;
    id v26 = 0;
    v8 = [ICFPSAPContext alloc];
    v9 = (id *)(v22 + 5);
    id obj = (id)v22[5];
    id v10 = [(ICFPSAPContext *)v8 initReturningError:&obj];
    objc_storeStrong(v9, obj);
    v11 = v22;
    if (v10 && !v22[5])
    {
      v13 = +[ICURLSessionManager unlimitedHighPrioritySession];
      v14 = [[ICStoreURLRequest alloc] initWithURL:v5 requestContext:v7];
      [(ICStoreURLRequest *)v14 setShouldUseMescalSigning:0];
      [(ICURLRequest *)v14 setPrioritize:1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke;
      v15[3] = &unk_1E5ACA670;
      v15[4] = self;
      id v16 = v10;
      id v17 = v7;
      id v18 = v6;
      v19 = &v21;
      [v13 enqueueDataRequest:v14 withCompletionHandler:v15];
    }
    else
    {
      v12 = (void (**)(id, void, uint64_t))self->_responseHandler;
      if (v12)
      {
        v12[2](v12, 0, v22[5]);
        v11 = v22;
      }
      [(ICAsyncOperation *)self finishWithError:v11[5]];
    }

    _Block_object_dispose(&v21, 8);
  }
}

- (void)_exchangeDataWithSAPContext:(id)a3 requestContext:(id)a4 setupURL:(id)a5 responseData:(id)a6 completionHandler:(id)a7
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, id))a7;
  char v36 = -1;
  sapSession = self->_sapSession;
  id v17 = a6;
  id v34 = 0;
  id v35 = 0;
  LODWORD(sapSession) = objc_msgSend(v12, "exchangeWithSAPVersion:data:returningData:exchangeStatus:error:", -[ICSAPSession sapVersion](sapSession, "sapVersion"), v17, &v35, &v36, &v34);

  id v18 = v35;
  id v19 = v34;
  if (!sapSession)
  {
    v15[2](v15, v19);
LABEL_10:
    id v22 = v19;
    goto LABEL_13;
  }
  if (!v18 || v36 != 1)
  {
    if (v36)
    {
      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      v15[2](v15, v23);
    }
    else
    {
      v15[2](v15, 0);
    }
    goto LABEL_10;
  }
  v37 = @"sign-sap-setup-buffer";
  v38[0] = v18;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  id v33 = 0;
  uint64_t v21 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v20 format:100 options:0 error:&v33];
  id v22 = v33;

  if (v22)
  {
    v15[2](v15, v22);
  }
  else
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v14];
    [v24 setHTTPMethod:@"POST"];
    [v24 setHTTPBody:v21];
    id v26 = +[ICURLSessionManager unlimitedHighPrioritySession];
    v27 = v21;
    v25 = [[ICStoreURLRequest alloc] initWithURLRequest:v24 requestContext:v13];
    [(ICStoreURLRequest *)v25 setShouldUseMescalSigning:0];
    [(ICURLRequest *)v25 setPrioritize:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __130__ICSAPSessionPrepareFairPlayContextOperation__exchangeDataWithSAPContext_requestContext_setupURL_responseData_completionHandler___block_invoke;
    v28[3] = &unk_1E5ACA698;
    v28[4] = self;
    id v29 = v12;
    id v30 = v13;
    id v31 = v14;
    v32 = v15;
    [v26 enqueueUploadRequest:v25 withCompletionHandler:v28];

    uint64_t v21 = v27;
  }

LABEL_13:
}

void __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 parsedBodyDictionary];
  v7 = [v6 objectForKey:@"sign-sap-setup-cert"];

  if (_NSIsNSData())
  {
    v9 = (void *)a1[4];
    v8 = (void *)a1[5];
    uint64_t v11 = a1[6];
    uint64_t v10 = a1[7];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke_2;
    v15[3] = &unk_1E5ACC788;
    v15[4] = v9;
    id v16 = v8;
    [v9 _exchangeDataWithSAPContext:v16 requestContext:v11 setupURL:v10 responseData:v7 completionHandler:v15];
  }
  else
  {
    id v12 = v5;
    if (!v5)
    {
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    }
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v12);
    if (!v5) {

    }
    id v13 = (void *)a1[4];
    uint64_t v14 = v13[37];
    if (v14)
    {
      (*(void (**)(void, void, void))(v14 + 16))(v13[37], 0, *(void *)(*(void *)(a1[8] + 8) + 40));
      id v13 = (void *)a1[4];
    }
    [v13 finishWithError:*(void *)(*(void *)(a1[8] + 8) + 40)];
  }
}

void __130__ICSAPSessionPrepareFairPlayContextOperation__exchangeDataWithSAPContext_requestContext_setupURL_responseData_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v4();
  }
  else
  {
    id v5 = [a2 parsedBodyDictionary];
    id v8 = [v5 objectForKey:@"sign-sap-setup-buffer"];

    if (_NSIsNSData())
    {
      [*(id *)(a1 + 32) _exchangeDataWithSAPContext:*(void *)(a1 + 40) requestContext:*(void *)(a1 + 48) setupURL:*(void *)(a1 + 56) responseData:v8 completionHandler:*(void *)(a1 + 64)];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 64);
      v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_sapSession, 0);
}

- (void)setSapSession:(id)a3
{
}

- (void)setResponseHandler:(id)a3
{
}

void __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(v4 + 296);
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = 0;
  }
  else
  {
    [*(id *)(v4 + 288) _setSAPContext:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 296);
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = *(void *)(a1 + 40);
  }
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
  uint64_t v4 = *(void *)(a1 + 32);
LABEL_7:
  [(id)v4 finishWithError:v7];
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (ICSAPSession)sapSession
{
  return self->_sapSession;
}

@end