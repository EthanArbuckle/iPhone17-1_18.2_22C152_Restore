@interface RadioRequest
+ (id)defaultURLCache;
+ (void)loadServiceConfigurationWithCompletionHandler:(id)a3;
- (BOOL)isAsynchronousBackgroundRequest;
- (BOOL)isCachedResponse;
- (NSDictionary)unparsedResponseDictionary;
- (RadioRequest)init;
- (RadioRequestContext)requestContext;
- (double)retryInterval;
- (int64_t)errorCode;
- (int64_t)status;
- (void)_loadRadioStoreBagAndAllowRetry:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_loadRadioStoreBagWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)setAsynchronousBackgroundRequest:(BOOL)a3;
- (void)setCachedResponse:(BOOL)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setRequestContext:(id)a3;
- (void)setRetryInterval:(double)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUnparsedResponseDictionary:(id)a3;
@end

@implementation RadioRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unparsedResponseDictionary, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_loadRadioStoreBagWithCompletionHandler:(id)a3
{
}

- (void)_loadRadioStoreBagAndAllowRetry:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(RadioLoadStoreBagRequest);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__RadioRequest__loadRadioStoreBagAndAllowRetry_withCompletionHandler___block_invoke;
  v10[3] = &unk_2643AA0C8;
  BOOL v12 = v4;
  if (v4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 3;
  }
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(RadioLoadStoreBagRequest *)v7 loadStoreBagWithOptions:v8 completionHandler:v10];
}

- (RadioRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)RadioRequest;
  v2 = [(RadioRequest *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Radio.RadioRequest", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(RadioRequest *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)RadioRequest;
  [(RadioRequest *)&v3 dealloc];
}

void __70__RadioRequest__loadRadioStoreBagAndAllowRetry_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 baseURL];
  uint64_t v8 = [v5 radioConfigurationDictionary];
  if (v8 && v7 || !*(unsigned char *)(a1 + 48))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
    }
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_21B56B000, v9, OS_LOG_TYPE_INFO, "[RadioRequest] No valid tilt dictionary, invalidating URL bag and retrying...", v11, 2u);
    }

    [*(id *)(a1 + 32) _loadRadioStoreBagAndAllowRetry:0 withCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (BOOL)isAsynchronousBackgroundRequest
{
  return self->_asynchronousBackgroundRequest;
}

+ (id)defaultURLCache
{
  if (defaultURLCache_sOnceToken != -1) {
    dispatch_once(&defaultURLCache_sOnceToken, &__block_literal_global_274);
  }
  v2 = (void *)defaultURLCache_sDefaultURLCache;
  return v2;
}

void __31__RadioRequest_defaultURLCache__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263F7B408]);
  [v2 setSessionIdentifier:@"com.apple.Radio.RadioRequestURLCache"];
  [v2 setSupportsProcessSharing:1];
  uint64_t v0 = [objc_alloc(MEMORY[0x263F7B400]) initWithConfiguration:v2];
  v1 = (void *)defaultURLCache_sDefaultURLCache;
  defaultURLCache_sDefaultURLCache = v0;
}

- (void)setAsynchronousBackgroundRequest:(BOOL)a3
{
  self->_asynchronousBackgroundRequest = a3;
}

- (NSDictionary)unparsedResponseDictionary
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__266;
  uint64_t v10 = __Block_byref_object_dispose__267;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__RadioRequest_unparsedResponseDictionary__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __42__RadioRequest_unparsedResponseDictionary__block_invoke(uint64_t a1)
{
}

- (void)setUnparsedResponseDictionary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__RadioRequest_setUnparsedResponseDictionary___block_invoke;
  v7[3] = &unk_2643AA1C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __46__RadioRequest_setUnparsedResponseDictionary___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (int64_t)status
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__RadioRequest_status__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__RadioRequest_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (void)setStatus:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__RadioRequest_setStatus___block_invoke;
  v4[3] = &unk_2643AA0F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __26__RadioRequest_setStatus___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

- (void)setRetryInterval:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__RadioRequest_setRetryInterval___block_invoke;
  v4[3] = &unk_2643AA0F8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __33__RadioRequest_setRetryInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (void)setRequestContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__RadioRequest_setRequestContext___block_invoke;
  v7[3] = &unk_2643AA1C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void *__34__RadioRequest_setRequestContext___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  double result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 32) != result)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = [result copy];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setErrorCode:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__RadioRequest_setErrorCode___block_invoke;
  v4[3] = &unk_2643AA0F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __29__RadioRequest_setErrorCode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  return result;
}

- (void)setCachedResponse:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__RadioRequest_setCachedResponse___block_invoke;
  v4[3] = &unk_2643AA470;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __34__RadioRequest_setCachedResponse___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (double)retryInterval
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__RadioRequest_retryInterval__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __29__RadioRequest_retryInterval__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 40);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (RadioRequestContext)requestContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__266;
  uint64_t v10 = __Block_byref_object_dispose__267;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__RadioRequest_requestContext__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (RadioRequestContext *)v3;
}

uint64_t __30__RadioRequest_requestContext__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return MEMORY[0x270F9A758]();
}

- (BOOL)isCachedResponse
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__RadioRequest_isCachedResponse__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__RadioRequest_isCachedResponse__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (int64_t)errorCode
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__RadioRequest_errorCode__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__RadioRequest_errorCode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

+ (void)loadServiceConfigurationWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(RadioLoadStoreBagRequest);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke;
  v6[3] = &unk_2643AA0A0;
  id v7 = v3;
  id v5 = v3;
  [(RadioLoadStoreBagRequest *)v4 loadStoreBagWithOptions:1 completionHandler:v6];
}

void __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_2643AA498;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __62__RadioRequest_loadServiceConfigurationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) radioConfigurationDictionary];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, *(void *)(a1 + 40));
  }
}

@end