@interface SSURLConnectionRequest
- (BOOL)_canRunInProcess;
- (BOOL)runsInProcess;
- (BOOL)sendsResponseForHTTPFailures;
- (BOOL)shouldMescalSign;
- (BOOL)start;
- (NSURL)destinationFileURL;
- (NSURLRequest)URLRequest;
- (SSAuthenticationContext)authenticationContext;
- (SSURLConnectionRequest)init;
- (SSURLConnectionRequest)initWithRequestProperties:(id)a3;
- (SSURLConnectionRequest)initWithURLRequest:(id)a3;
- (SSURLConnectionRequest)initWithXPCEncoding:(id)a3;
- (SSURLRequestProperties)requestProperties;
- (SSVFairPlaySAPSession)SAPSession;
- (SSVSAPSignaturePolicy)SAPSignaturePolicy;
- (SSVURLDataConsumer)dataConsumer;
- (id)copyXPCEncoding;
- (void)configureWithURLBag:(id)a3;
- (void)configureWithURLBagDictionary:(id)a3;
- (void)dealloc;
- (void)setAuthenticationContext:(id)a3;
- (void)setDataConsumer:(id)a3;
- (void)setDestinationFileURL:(id)a3;
- (void)setRunsInProcess:(BOOL)a3;
- (void)setSAPSession:(id)a3;
- (void)setSAPSignaturePolicy:(id)a3;
- (void)setSendsResponseForHTTPFailures:(BOOL)a3;
- (void)setShouldMescalSign:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithConnectionResponseBlock:(id)a3;
@end

@implementation SSURLConnectionRequest

- (SSURLConnectionRequest)init
{
  return [(SSURLConnectionRequest *)self initWithURLRequest:0];
}

- (SSURLConnectionRequest)initWithRequestProperties:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"properties must not be nil"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SSURLConnectionRequest;
  v5 = [(SSRequest *)&v7 init];
  if (v5) {
    v5->_requestProperties = (SSURLRequestProperties *)[a3 copy];
  }
  return v5;
}

- (SSURLConnectionRequest)initWithURLRequest:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"URLRequest must not be nil"];
  }
  v5 = [[SSURLRequestProperties alloc] initWithURLRequest:a3];
  v6 = [(SSURLConnectionRequest *)self initWithRequestProperties:v5];

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSURLConnectionRequest;
  [(SSRequest *)&v3 dealloc];
}

- (NSURL)destinationFileURL
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SSURLConnectionRequest_destinationFileURL__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSURLConnectionRequest_destinationFileURL__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 120) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SSURLRequestProperties)requestProperties
{
  v2 = self->_requestProperties;
  return v2;
}

- (void)setDestinationFileURL:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SSURLConnectionRequest_setDestinationFileURL___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __48__SSURLConnectionRequest_setDestinationFileURL___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 120);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 120) = result;
  }
  return result;
}

- (void)setShouldMescalSign:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SSURLConnectionRequest_setShouldMescalSign___block_invoke;
  v4[3] = &unk_1E5BA8488;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __46__SSURLConnectionRequest_setShouldMescalSign___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 153) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)shouldMescalSign
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLConnectionRequest_shouldMescalSign__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLConnectionRequest_shouldMescalSign__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 153);
  return result;
}

- (void)startWithConnectionResponseBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(SSURLConnectionRequest *)self _canRunInProcess])
  {
    BOOL v5 = [[SSVLoadURLOperation alloc] initWithURLRequestProperties:self->_requestProperties];
    uint64_t v6 = [(SSURLConnectionRequest *)self dataConsumer];
    if (!v6) {
      uint64_t v6 = +[SSVURLDataConsumer consumer];
    }
    [(SSVLoadURLOperation *)v5 setDataConsumer:v6];
    dispatchQueue = self->super._dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke;
    block[3] = &unk_1E5BA7448;
    block[4] = self;
    block[5] = v5;
    dispatch_sync(dispatchQueue, block);
    if (a3)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2;
      v26[3] = &unk_1E5BA8F20;
      v26[4] = a3;
      [(SSVLoadURLOperation *)v5 setOutputBlock:v26];
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3;
    v25[3] = &unk_1E5BA73F8;
    v25[4] = v5;
    dispatch_async(global_queue, v25);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      id v9 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v9) {
        id v9 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        int v12 = v11;
      }
      else {
        int v12 = v11 & 2;
      }
      if (v12)
      {
        int v28 = 136446210;
        v29 = "-[SSURLConnectionRequest startWithConnectionResponseBlock:]";
        LODWORD(v23) = 12;
        v22 = &v28;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v28, v23);
          free(v14);
          SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, v15);
        }
      }
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_24;
    v24[3] = &unk_1E5BA7750;
    v24[4] = self;
    v24[5] = a3;
    -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 62, v24, v22);
  }
}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 168))
  {
    objc_msgSend(*(id *)(a1 + 40), "_configureWithURLBagInterpreter:");
  }
  else if (*(void *)(v2 + 160))
  {
    objc_msgSend(*(id *)(a1 + 40), "configureWithURLBag:");
  }
  [*(id *)(a1 + 40) setSAPSession:*(void *)(*(void *)(a1 + 32) + 136)];
  char v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 144);
  return [v3 setSAPSignaturePolicy:v4];
}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) main];
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_24(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      uint64_t v4 = (uint64_t)(id)SSError(@"SSErrorDomain", 121, 0, 0);
      unint64_t v5 = 0;
    }
    else
    {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      unint64_t v5 = [[SSURLConnectionResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "1")];
    }
    if (!(v5 | v4)) {
      uint64_t v4 = (uint64_t)(id)SSError(@"SSErrorDomain", 100, 0, 0);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2_29;
    block[3] = &unk_1E5BA8608;
    uint64_t v7 = *(void *)(a1 + 40);
    block[5] = v4;
    void block[6] = v7;
    block[4] = v5;
    dispatch_async(global_queue, block);
  }
  return [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2_29(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSURLRequest)URLRequest
{
  id v2 = [(SSURLRequestProperties *)self->_requestProperties copyURLRequest];
  return (NSURLRequest *)v2;
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__SSURLConnectionRequest_start__block_invoke;
  v3[3] = &unk_1E5BA8F48;
  v3[4] = self;
  [(SSURLConnectionRequest *)self startWithConnectionResponseBlock:v3];
  return 1;
}

void __31__SSURLConnectionRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SSURLConnectionRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA8630;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  void block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __31__SSURLConnectionRequest_start__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      [v2 urlConnectionRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
    }
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      return [v2 requestDidFinish:v4];
    }
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      return [v2 request:v5 didFailWithError:v6];
    }
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SSURLConnectionRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BA8F20;
  v3[4] = a3;
  [(SSURLConnectionRequest *)self startWithConnectionResponseBlock:v3];
}

uint64_t __51__SSURLConnectionRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (SSAuthenticationContext)authenticationContext
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = __Block_byref_object_copy__12;
  int v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLConnectionRequest_authenticationContext__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (SSAuthenticationContext *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __47__SSURLConnectionRequest_authenticationContext__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 104);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)configureWithURLBag:(id)a3
{
  urlBag = self->_urlBag;
  if (urlBag != a3)
  {

    self->_urlBag = (SSURLBag *)a3;
  }
}

- (void)configureWithURLBagDictionary:(id)a3
{
  self->_urlBagInterpreter = [[SSVURLBagInterpreter alloc] initWithURLBagDictionary:a3];
}

- (SSVURLDataConsumer)dataConsumer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = __Block_byref_object_copy__12;
  int v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SSURLConnectionRequest_dataConsumer__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (SSVURLDataConsumer *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__SSURLConnectionRequest_dataConsumer__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 112);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)runsInProcess
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSURLConnectionRequest_runsInProcess__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSURLConnectionRequest_runsInProcess__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 128);
  return result;
}

- (SSVFairPlaySAPSession)SAPSession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__12;
  int v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLConnectionRequest_SAPSession__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (SSVFairPlaySAPSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SSURLConnectionRequest_SAPSession__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 136);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SSVSAPSignaturePolicy)SAPSignaturePolicy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__12;
  int v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SSURLConnectionRequest_SAPSignaturePolicy__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (SSVSAPSignaturePolicy *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSURLConnectionRequest_SAPSignaturePolicy__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)sendsResponseForHTTPFailures
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SSURLConnectionRequest_sendsResponseForHTTPFailures__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__SSURLConnectionRequest_sendsResponseForHTTPFailures__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 152);
  return result;
}

- (void)setAuthenticationContext:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SSURLConnectionRequest_setAuthenticationContext___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __51__SSURLConnectionRequest_setAuthenticationContext___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 104);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 104) = result;
  }
  return result;
}

- (void)setDataConsumer:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SSURLConnectionRequest_setDataConsumer___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__42__SSURLConnectionRequest_setDataConsumer___block_invoke(void *result)
{
  v1 = *(void **)(result[4] + 112);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    uint64_t result = (id)v2[5];
    *(void *)(v2[4] + 112) = result;
  }
  return result;
}

- (void)setRunsInProcess:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SSURLConnectionRequest_setRunsInProcess___block_invoke;
  v4[3] = &unk_1E5BA8488;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SSURLConnectionRequest_setRunsInProcess___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 128) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setSAPSession:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SSURLConnectionRequest_setSAPSession___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__40__SSURLConnectionRequest_setSAPSession___block_invoke(void *result)
{
  v1 = *(void **)(result[4] + 136);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    uint64_t result = (id)v2[5];
    *(void *)(v2[4] + 136) = result;
  }
  return result;
}

- (void)setSAPSignaturePolicy:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SSURLConnectionRequest_setSAPSignaturePolicy___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __48__SSURLConnectionRequest_setSAPSignaturePolicy___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 144);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 144) = result;
  }
  return result;
}

- (void)setSendsResponseForHTTPFailures:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SSURLConnectionRequest_setSendsResponseForHTTPFailures___block_invoke;
  v4[3] = &unk_1E5BA8488;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __58__SSURLConnectionRequest_setSendsResponseForHTTPFailures___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 152) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_canRunInProcess
{
  BOOL v3 = [(SSURLConnectionRequest *)self runsInProcess];
  if (v3) {
    LOBYTE(v3) = [(SSURLRequestProperties *)self->_requestProperties URL] != 0;
  }
  return v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)[(SSURLConnectionRequest *)self authenticationContext]);
  SSXPCDictionarySetCFObject(v3, "54", (__CFString *)[(NSURL *)[(SSURLConnectionRequest *)self destinationFileURL] absoluteString]);
  SSXPCDictionarySetCFObject(v3, "51", (__CFString *)self->_requestProperties);
  xpc_dictionary_set_BOOL(v3, "53", [(SSURLConnectionRequest *)self sendsResponseForHTTPFailures]);
  xpc_dictionary_set_BOOL(v3, "52", [(SSURLConnectionRequest *)self shouldMescalSign]);
  return v3;
}

- (SSURLConnectionRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSURLConnectionRequest;
    uint64_t v7 = [(SSRequest *)&v10 init];
    BOOL v5 = v7;
    if (v7)
    {

      v5->_authenticationContext = [[SSAuthenticationContext alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "50")];
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "54");

      if (v8) {
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
      }
      else {
        uint64_t v9 = 0;
      }
      v5->_destinationFileURL = (NSURL *)v9;

      v5->_requestProperties = [[SSURLRequestProperties alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "51")];
      [(SSURLConnectionRequest *)v5 setSendsResponseForHTTPFailures:xpc_dictionary_get_BOOL(a3, "53")];
      [(SSURLConnectionRequest *)v5 setShouldMescalSign:xpc_dictionary_get_BOOL(a3, "52")];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end