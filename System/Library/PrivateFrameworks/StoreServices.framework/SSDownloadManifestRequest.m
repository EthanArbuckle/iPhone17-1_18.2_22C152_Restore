@interface SSDownloadManifestRequest
- (BOOL)shouldHideUserPrompts;
- (BOOL)start;
- (NSURLRequest)URLRequest;
- (SSDownloadManifestRequest)init;
- (SSDownloadManifestRequest)initWithURLRequest:(id)a3;
- (SSDownloadManifestRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)manifestFormat;
- (void)dealloc;
- (void)setManifestFormat:(int64_t)a3;
- (void)setShouldHideUserPrompts:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithManifestResponseBlock:(id)a3;
@end

@implementation SSDownloadManifestRequest

- (SSDownloadManifestRequest)init
{
  return [(SSDownloadManifestRequest *)self initWithURLRequest:0];
}

- (SSDownloadManifestRequest)initWithURLRequest:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSDownloadManifestRequest.m", 25, @"Must provide a URL request");
  }
  v7.receiver = self;
  v7.super_class = (Class)SSDownloadManifestRequest;
  v5 = [(SSRequest *)&v7 init];
  if (v5) {
    v5->_urlRequest = (NSURLRequest *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManifestRequest;
  [(SSRequest *)&v3 dealloc];
}

- (void)setShouldHideUserPrompts:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SSDownloadManifestRequest_setShouldHideUserPrompts___block_invoke;
  v4[3] = &unk_1E5BA8488;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __54__SSDownloadManifestRequest_setShouldHideUserPrompts___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 104) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)shouldHideUserPrompts
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SSDownloadManifestRequest_shouldHideUserPrompts__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SSDownloadManifestRequest_shouldHideUserPrompts__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 104);
  return result;
}

- (void)startWithManifestResponseBlock:(id)a3
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
      v22 = "-[SSDownloadManifestRequest startWithManifestResponseBlock:]";
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
  v20[2] = __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 56, v20, v18);
}

uint64_t __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke(uint64_t a1, void *a2)
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
      unint64_t v5 = [[SSDownloadManifestResponse alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "1")];
    }
    if (!(v5 | v4)) {
      uint64_t v4 = (uint64_t)(id)SSError(@"SSErrorDomain", 200, 0, 0);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA8608;
    uint64_t v7 = *(void *)(a1 + 40);
    block[5] = v4;
    block[6] = v7;
    block[4] = v5;
    dispatch_async(global_queue, block);
  }
  return [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSURLRequest)URLRequest
{
  v2 = self->_urlRequest;
  return v2;
}

- (int64_t)manifestFormat
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSDownloadManifestRequest_manifestFormat__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSDownloadManifestRequest_manifestFormat__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 96);
  return result;
}

- (void)setManifestFormat:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSDownloadManifestRequest_setManifestFormat___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __47__SSDownloadManifestRequest_setManifestFormat___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 96) = *(void *)(result + 40);
  return result;
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__SSDownloadManifestRequest_start__block_invoke;
  v3[3] = &unk_1E5BA8658;
  v3[4] = self;
  [(SSDownloadManifestRequest *)self startWithManifestResponseBlock:v3];
  return 1;
}

void __34__SSDownloadManifestRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSDownloadManifestRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA8630;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __34__SSDownloadManifestRequest_start__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      [v2 downloadManifestRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
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
  v3[2] = __54__SSDownloadManifestRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BA8680;
  v3[4] = a3;
  [(SSDownloadManifestRequest *)self startWithManifestResponseBlock:v3];
}

uint64_t __54__SSDownloadManifestRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v6[2] = __44__SSDownloadManifestRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __44__SSDownloadManifestRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "50", *(unsigned char *)(*(void *)(a1 + 40) + 104));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "51", *(void *)(*(void *)(a1 + 40) + 96));
  v2 = *(void **)(a1 + 32);
  xpc_object_t v3 = *(__CFString **)(*(void *)(a1 + 40) + 112);
  SSXPCDictionarySetCFObject(v2, "52", v3);
}

- (SSDownloadManifestRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSDownloadManifestRequest;
    uint64_t v5 = [(SSRequest *)&v7 init];
    if (v5)
    {
      v5->_shouldHideUserPrompts = xpc_dictionary_get_BOOL(a3, "50");
      v5->_manifestFormat = xpc_dictionary_get_int64(a3, "51");
      v5->_urlRequest = (NSURLRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E4F290D0]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "52"));
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end