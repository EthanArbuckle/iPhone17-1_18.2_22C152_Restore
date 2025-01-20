@interface OspreyChannel
- (BOOL)enableDeviceAuthentication;
- (BOOL)forceHTTPv2;
- (BOOL)useAbsinthe;
- (NSString)clientTraceId;
- (OspreyChannel)initWithURL:(id)a3 configuration:(id)a4;
- (OspreyChannel)initWithURL:(id)a3 configuration:(id)a4 useCache:(BOOL)a5;
- (id)_buildRequestWithMethodName:(id)a3 requestBuilder:(id)a4;
- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6;
- (id)clientStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 responseHandler:(id)a5;
- (id)connectionMetricsHandler;
- (id)getConnectionMetricsHandler;
- (void)_prepareChannelWithRequest:(id)a3 continueWith:(id)a4;
- (void)_prepareDeviceAuthenticationWithCompletion:(id)a3;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)initializeDeviceAuthenticationSessionWithCompletion:(id)a3;
- (void)ocp_setAssociatedHandle:(id)a3;
- (void)performBidirectionalStreamingRequest:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)performRequest:(id)a3 handler:(id)a4;
- (void)preconnect;
- (void)serverStreamingRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 streamingResponseHandler:(id)a6 completion:(id)a7;
- (void)setClientTraceId:(id)a3;
- (void)setConnectionMetricsHandler:(id)a3;
- (void)setEnableDeviceAuthentication:(BOOL)a3;
- (void)setForceHTTPv2:(BOOL)a3;
- (void)setUseAbsinthe:(BOOL)a3;
- (void)setUseCompression:(BOOL)a3;
- (void)unaryRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 responseHandler:(id)a6;
@end

@implementation OspreyChannel

- (OspreyChannel)initWithURL:(id)a3 configuration:(id)a4
{
  return [(OspreyChannel *)self initWithURL:a3 configuration:a4 useCache:0];
}

- (OspreyChannel)initWithURL:(id)a3 configuration:(id)a4 useCache:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)OspreyChannel;
  v10 = [(OspreyChannel *)&v36 init];
  if (v10)
  {
    OspreyLoggingInit();
    v11 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG)) {
      -[OspreyChannel initWithURL:configuration:useCache:](v11);
    }
    uint64_t v12 = [v8 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v12;

    v14 = [(NSURL *)v10->_url host];
    uint64_t v15 = [v9 copy];
    configuration = v10->_configuration;
    v10->_configuration = (NSURLSessionConfiguration *)v15;

    id v17 = [@"OspreyChannel." stringByAppendingString:v14];
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v20;

    v22 = [OspreyPreferences alloc];
    v23 = objc_alloc_init(OspreyKeychain);
    uint64_t v24 = [(OspreyPreferences *)v22 initWithKeychain:v23];
    preferences = v10->_preferences;
    v10->_preferences = (OspreyPreferences *)v24;

    uint64_t v26 = [(OspreyPreferences *)v10->_preferences connectionPreferencesForHost:v14];
    connectionPreferences = v10->_connectionPreferences;
    v10->_connectionPreferences = (OspreyConnectionPreferences *)v26;

    v28 = objc_alloc_init(OspreyChannelRequestOptions);
    defaultRequestOptions = v10->_defaultRequestOptions;
    v10->_defaultRequestOptions = v28;

    v10->_enableDeviceAuthentication = 1;
    dispatch_group_t v30 = dispatch_group_create();
    validationGroup = v10->_validationGroup;
    v10->_validationGroup = (OS_dispatch_group *)v30;

    v10->_waitingForSignature = 0;
    signatureError = v10->_signatureError;
    v10->_signatureError = 0;

    if (!a5) {
      [v9 setRequestCachePolicy:4];
    }
    v33 = [[OspreyGRPCChannel alloc] initWithURL:v8 configuration:v9 queue:v10->_queue];
    channel = v10->_channel;
    v10->_channel = v33;
  }
  return v10;
}

- (void)dealloc
{
  [(OspreyChannel *)self close];
  v3.receiver = self;
  v3.super_class = (Class)OspreyChannel;
  [(OspreyChannel *)&v3 dealloc];
}

- (BOOL)forceHTTPv2
{
  return [(OspreyChannelRequestOptions *)self->_defaultRequestOptions forceHTTPv2];
}

- (void)setForceHTTPv2:(BOOL)a3
{
}

- (void)setUseCompression:(BOOL)a3
{
}

- (void)setConnectionMetricsHandler:(id)a3
{
}

- (id)getConnectionMetricsHandler
{
  return [(OspreyGRPCChannel *)self->_channel connectionMetricsHandler];
}

- (void)unaryRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 responseHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(OspreyChannel *)self _buildRequestWithMethodName:a3 requestBuilder:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__OspreyChannel_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke;
  v16[3] = &unk_1E63CBD88;
  v16[4] = self;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  [(OspreyChannel *)self _prepareChannelWithRequest:v14 continueWith:v16];
}

uint64_t __87__OspreyChannel_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke(void *a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else {
    return [*(id *)(a1[4] + 32) unaryRequest:a1[5] requestData:a1[6] responseHandler:a1[7]];
  }
}

- (void)serverStreamingRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 streamingResponseHandler:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(OspreyChannel *)self _buildRequestWithMethodName:a3 requestBuilder:a5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __117__OspreyChannel_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v20[3] = &unk_1E63CBDB0;
  v20[4] = self;
  id v21 = v15;
  id v22 = v12;
  id v23 = v14;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v15;
  id v19 = v14;
  [(OspreyChannel *)self _prepareChannelWithRequest:v18 continueWith:v20];
}

uint64_t __117__OspreyChannel_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke(void *a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else {
    return [*(id *)(a1[4] + 32) serverStreamingRequest:a1[5] requestData:a1[6] streamingResponseHandler:a1[8] completion:a1[7]];
  }
}

- (id)clientStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(OspreyChannel *)self _buildRequestWithMethodName:v8 requestBuilder:v9];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke;
  v29[3] = &unk_1E63CBDD8;
  v29[4] = v30;
  v29[5] = v32;
  id v12 = (void *)MEMORY[0x1C189D2A0](v29);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_2;
  v26[3] = &unk_1E63CBD60;
  id v13 = v10;
  id v27 = v13;
  v28 = v32;
  id v14 = (void *)MEMORY[0x1C189D2A0](v26);
  id v15 = [(OspreyGRPCChannel *)self->_channel clientStreamingContextForRequest:v11 streamingResponseHandler:v12 completion:v14];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_3;
  v22[3] = &unk_1E63CBD88;
  id v16 = v13;
  id v25 = v16;
  v22[4] = self;
  id v17 = v11;
  id v23 = v17;
  id v18 = v15;
  id v24 = v18;
  [(OspreyChannel *)self _prepareChannelWithRequest:v17 continueWith:v22];
  id v19 = v24;
  id v20 = v18;

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  return v20;
}

void __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v4 = v5;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

uint64_t __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  return result;
}

uint64_t __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_3(void *a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else {
    return [*(id *)(a1[4] + 32) bidirectionalStreamingRequest:a1[5] streamingContext:a1[6]];
  }
}

- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [(OspreyChannel *)self _buildRequestWithMethodName:a3 requestBuilder:a4];
  id v13 = [(OspreyGRPCChannel *)self->_channel clientStreamingContextForRequest:v12 streamingResponseHandler:v11 completion:v10];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__OspreyChannel_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v20[3] = &unk_1E63CBD88;
  id v23 = v10;
  v20[4] = self;
  id v21 = v12;
  id v14 = v13;
  id v22 = v14;
  id v15 = v12;
  id v16 = v10;
  [(OspreyChannel *)self _prepareChannelWithRequest:v15 continueWith:v20];
  id v17 = v22;
  id v18 = v14;

  return v18;
}

uint64_t __112__OspreyChannel_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke(void *a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else {
    return [*(id *)(a1[4] + 32) bidirectionalStreamingRequest:a1[5] streamingContext:a1[6]];
  }
}

- (void)preconnect
{
}

- (void)initializeDeviceAuthenticationSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (self->_enableDeviceAuthentication)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke;
    v8[3] = &unk_1E63CBE28;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
  else
  {
    OspreyLoggingInit();
    v7 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_ERROR)) {
      -[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:](v7);
    }
    v5[2](v5, 0);
  }
}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2;
  v2[3] = &unk_1E63CBE00;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _prepareDeviceAuthenticationWithCompletion:v2];
}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  OspreyLoggingInit();
  id v5 = OspreyLogContextChannel;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_ERROR)) {
      __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_2(v5, v4);
    }
  }
  else if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG))
  {
    __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_1(v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)close
{
}

- (void)cancel
{
}

- (id)_buildRequestWithMethodName:(id)a3 requestBuilder:(id)a4
{
  v6 = (void (**)(id, OspreyMutableRequest *))a4;
  id v7 = a3;
  id v8 = [[OspreyMutableRequest alloc] initWithMethodName:v7];

  [(OspreyMutableRequest *)v8 setEnableDeviceAuthentication:self->_enableDeviceAuthentication];
  [(OspreyChannelRequestOptions *)self->_defaultRequestOptions applyToOspreyMutableRequest:v8];
  if (v6) {
    v6[2](v6, v8);
  }
  id v9 = [(OspreyMutableRequest *)v8 buildInternalRequest];

  return v9;
}

- (void)_prepareChannelWithRequest:(id)a3 continueWith:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke;
  block[3] = &unk_1E63CBE78;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) enableDeviceAuthentication])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke_2;
    v7[3] = &unk_1E63CBE50;
    v2 = *(void **)(a1 + 40);
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    id v8 = v3;
    uint64_t v9 = v4;
    id v10 = v5;
    [v2 _prepareDeviceAuthenticationWithCompletion:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

void __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (!v7)
  {
    [*(id *)(a1 + 32) setSignedDeviceAuthenticationData:a2];
    id v5 = *(void **)(a1 + 32);
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "currentStrategyVersion"));
    [v5 setDeviceAuthenticationVersion:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_prepareDeviceAuthenticationWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_deviceAuthenticator)
  {
    id v5 = [[OspreyDeviceAuthentication alloc] initWithChannel:self->_channel connectionPreferences:self->_connectionPreferences allPreferences:self->_preferences];
    deviceAuthenticator = self->_deviceAuthenticator;
    self->_deviceAuthenticator = v5;
  }
  id v7 = [(OspreyConnectionPreferences *)self->_connectionPreferences deviceAttestationData];
  if (v7)
  {
    OspreyLoggingInit();
    id v8 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[OspreyChannel _prepareDeviceAuthenticationWithCompletion:]";
      _os_log_impl(&dword_1BEDB4000, v8, OS_LOG_TYPE_INFO, "%s Reusing existing session info", buf, 0xCu);
    }
    v4[2](v4, v7, 0);
  }
  else
  {
    if (self->_waitingForSignature)
    {
      validationGroup = self->_validationGroup;
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke;
      block[3] = &unk_1E63CBBE8;
      void block[4] = self;
      id v19 = v4;
      dispatch_group_notify(validationGroup, queue, block);
      id v11 = v19;
    }
    else
    {
      self->_waitingForSignature = 1;
      dispatch_group_enter((dispatch_group_t)self->_validationGroup);
      id v12 = self->_deviceAuthenticator;
      id v13 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2;
      v16[3] = &unk_1E63CBEC8;
      v16[4] = self;
      id v17 = v4;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_16;
      v14[3] = &unk_1E63CBB20;
      v14[4] = self;
      id v15 = v17;
      [(OspreyDeviceAuthentication *)v12 signData:v13 success:v16 failure:v14];

      id v11 = v17;
    }
  }
}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 80) deviceAttestationData];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(*(void *)(a1 + 32) + 64));
}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 24);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_3;
  v11[3] = &unk_1E63CBEA0;
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  OspreyLoggingInit();
  uint64_t v2 = (void *)OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 base64EncodedStringWithOptions:0];
    int v10 = 136315394;
    id v11 = "-[OspreyChannel _prepareDeviceAuthenticationWithCompletion:]_block_invoke_3";
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1BEDB4000, v4, OS_LOG_TYPE_INFO, "%s Signed validation header data: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = 0;

  id v8 = *(void **)(*(void *)(a1 + 40) + 80);
  id v9 = (void *)[*(id *)(a1 + 32) copy];
  [v8 setDeviceAttestationData:v9 withExpiration:*(void *)(a1 + 48)];

  [*(id *)(*(void *)(a1 + 40) + 72) setConnectionPreferences:*(void *)(*(void *)(a1 + 40) + 80)];
  [*(id *)(*(void *)(a1 + 40) + 72) synchronize];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  *(unsigned char *)(*(void *)(a1 + 40) + 56) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 48));
}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2_17;
  block[3] = &unk_1E63CBEF0;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2_17(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  [*(id *)(*(void *)(a1 + 32) + 80) deleteDeviceAttestationData];
  [*(id *)(*(void *)(a1 + 32) + 72) setConnectionPreferences:*(void *)(*(void *)(a1 + 32) + 80)];
  [*(id *)(*(void *)(a1 + 32) + 72) synchronize];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 48);

  dispatch_group_leave(v5);
}

- (BOOL)useAbsinthe
{
  return self->_enableDeviceAuthentication;
}

- (void)setUseAbsinthe:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (void)performRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 methodName];
  id v9 = [v6 data];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__OspreyChannel_performRequest_handler___block_invoke;
  v11[3] = &unk_1E63CBF18;
  id v12 = v6;
  id v10 = v6;
  [(OspreyChannel *)self unaryRequestWithMethodName:v8 requestData:v9 requestBuilder:v11 responseHandler:v7];
}

void __40__OspreyChannel_performRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) clientTraceId];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) clientTraceId];
    [v5 setClientTraceIdentifier:v4];
  }
}

- (void)performBidirectionalStreamingRequest:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__OspreyChannel_performBidirectionalStreamingRequest_handler_completion___block_invoke;
  v17[3] = &unk_1E63CBF18;
  id v9 = v8;
  id v18 = v9;
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x1C189D2A0](v17);
  uint64_t v13 = [v9 methodName];
  uint64_t v14 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:v13 requestBuilder:v12 streamingResponseHandler:v11 completion:v10];

  id v15 = [v9 data];

  if (v15)
  {
    id v16 = [v9 data];
    [v14 writeFrame:v16];

    [v14 finishWriting];
  }
}

void __73__OspreyChannel_performBidirectionalStreamingRequest_handler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) clientTraceId];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) clientTraceId];
    [v5 setClientTraceIdentifier:v4];
  }
}

- (BOOL)enableDeviceAuthentication
{
  return self->_enableDeviceAuthentication;
}

- (void)setEnableDeviceAuthentication:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (id)connectionMetricsHandler
{
  return self->_connectionMetricsHandler;
}

- (NSString)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setClientTraceId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong(&self->_connectionMetricsHandler, 0);
  objc_storeStrong((id *)&self->_defaultRequestOptions, 0);
  objc_storeStrong((id *)&self->_connectionPreferences, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_signatureError, 0);
  objc_storeStrong((id *)&self->_validationGroup, 0);
  objc_storeStrong((id *)&self->_deviceAuthenticator, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)ocp_setAssociatedHandle:(id)a3
{
}

- (void)initWithURL:(os_log_t)log configuration:useCache:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[OspreyChannel initWithURL:configuration:useCache:]";
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Initializing Osprey channel...", (uint8_t *)&v1, 0xCu);
}

- (void)initializeDeviceAuthenticationSessionWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:]";
  _os_log_error_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_ERROR, "%s Failed to initialize device authentication session: device authentication was disabled!", (uint8_t *)&v1, 0xCu);
}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:]_block_invoke";
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Successfully initialized device authentication session!", (uint8_t *)&v1, 0xCu);
}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_2(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 136315394;
  id v6 = "-[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:]_block_invoke_2";
  __int16 v7 = 2112;
  id v8 = v4;
  _os_log_error_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_ERROR, "%s Failed to initialize device authentication session: %@", (uint8_t *)&v5, 0x16u);
}

@end