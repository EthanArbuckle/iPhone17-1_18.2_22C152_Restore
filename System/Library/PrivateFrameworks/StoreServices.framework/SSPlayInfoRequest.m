@interface SSPlayInfoRequest
- (BOOL)start;
- (SSPlayInfoRequest)init;
- (SSPlayInfoRequest)initWithPlayInfoContext:(id)a3;
- (SSPlayInfoRequest)initWithXPCEncoding:(id)a3;
- (SSPlayInfoRequestContext)playInfoContext;
- (SSPlayInfoResponse)playInfoResponse;
- (id)copyXPCEncoding;
- (void)dealloc;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithPlayInfoResponseBlock:(id)a3;
@end

@implementation SSPlayInfoRequest

- (SSPlayInfoRequest)init
{
  return [(SSPlayInfoRequest *)self initWithPlayInfoContext:0];
}

- (SSPlayInfoRequest)initWithPlayInfoContext:(id)a3
{
  if (![a3 SICData]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Context must have SIC data"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SSPlayInfoRequest;
  v5 = [(SSRequest *)&v7 init];
  if (v5) {
    v5->_context = (SSPlayInfoRequestContext *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSPlayInfoRequest;
  [(SSRequest *)&v3 dealloc];
}

- (SSPlayInfoRequestContext)playInfoContext
{
  v2 = (void *)[(SSPlayInfoRequestContext *)self->_context copy];
  return (SSPlayInfoRequestContext *)v2;
}

- (SSPlayInfoResponse)playInfoResponse
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SSPlayInfoRequest_playInfoResponse__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (SSPlayInfoResponse *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SSPlayInfoRequest_playInfoResponse__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)startWithPlayInfoResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v21 = 136446210;
      v22 = "-[SSPlayInfoRequest startWithPlayInfoResponseBlock:]";
      LODWORD(v19) = 12;
      v18 = &v21;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke;
  v20[3] = &unk_1E5BAAAE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 58, v20, v18);
}

uint64_t __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  if (*(void *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      id v4 = (id)SSError(@"SSErrorDomain", 121, 0, 0);
      if (v4) {
        goto LABEL_5;
      }
    }
    else
    {
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      id v5 = [[SSPlayInfoResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "1")];

      *(void *)(*(void *)(a1 + 32) + 104) = [(SSPlayInfoResponse *)v5 copy];
      if (v5)
      {
LABEL_6:
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke_2;
        block[3] = &unk_1E5BA8608;
        uint64_t v7 = *(void *)(a1 + 40);
        block[5] = v4;
        block[6] = v7;
        block[4] = v5;
        dispatch_async(global_queue, block);

        return [*(id *)(a1 + 32) _shutdownRequest];
      }
      if (v4)
      {
LABEL_5:

        id v5 = 0;
        *(void *)(*(void *)(a1 + 32) + 104) = [[SSPlayInfoResponse alloc] initWithPlayInfoData:0 error:v4];
        goto LABEL_6;
      }
    }
    id v4 = (id)SSError(@"SSErrorDomain", 100, 0, 0);
    goto LABEL_5;
  }
  return [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__SSPlayInfoRequest_start__block_invoke;
  v3[3] = &unk_1E5BAAB08;
  v3[4] = self;
  [(SSPlayInfoRequest *)self startWithPlayInfoResponseBlock:v3];
  return 1;
}

void __26__SSPlayInfoRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SSPlayInfoRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA8630;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __26__SSPlayInfoRequest_start__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  char v4 = objc_opt_respondsToSelector();
  if (v3)
  {
    if (v4) {
      [v2 playInfoRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
    }
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      return [v2 requestDidFinish:v6];
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = [[SSPlayInfoResponse alloc] initWithPlayInfoData:0 error:*(void *)(a1 + 48)];
      [v2 playInfoRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
    }
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 48);
      return [v2 request:v8 didFailWithError:v9];
    }
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__SSPlayInfoRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BAAB30;
  v3[4] = a3;
  [(SSPlayInfoRequest *)self startWithPlayInfoResponseBlock:v3];
}

uint64_t __46__SSPlayInfoRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SSPlayInfoRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __36__SSPlayInfoRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "50", *(__CFString **)(*(void *)(a1 + 40) + 96));
  v2 = *(void **)(a1 + 32);
  xpc_object_t v3 = *(__CFString **)(*(void *)(a1 + 40) + 104);
  SSXPCDictionarySetCFObject(v2, "51", v3);
}

- (SSPlayInfoRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSPlayInfoRequest;
    id v5 = [(SSRequest *)&v7 init];
    if (v5)
    {
      v5->_context = [[SSPlayInfoRequestContext alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "50")];
      v5->_response = [[SSPlayInfoResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "51")];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end