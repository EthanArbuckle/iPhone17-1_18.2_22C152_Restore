@interface OspreyGRPCChannel
- (AbsintheAuthenticationDurations)absintheDurations;
- (OspreyGRPCChannel)initWithURL:(id)a3 configuration:(id)a4 queue:(id)a5;
- (id)bidirectionalStreamingRequest:(id)a3 streamingResponseHandler:(id)a4 completion:(id)a5;
- (id)clientStreamingContextForRequest:(id)a3 streamingResponseHandler:(id)a4 completion:(id)a5;
- (id)clientStreamingRequest:(id)a3 responseHandler:(id)a4 streamingContext:(id)a5;
- (id)connectionMetricsHandler;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)_startTask:(id)a3;
- (void)bidirectionalStreamingRequest:(id)a3 streamingContext:(id)a4;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)preconnect;
- (void)serverStreamingRequest:(id)a3 requestData:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6;
- (void)setAbsintheDurations:(id)a3;
- (void)setAbsintheTimestampForKey:(id)a3;
- (void)setConnectionMetricsHandler:(id)a3;
- (void)unaryRequest:(id)a3 requestData:(id)a4 responseHandler:(id)a5;
@end

@implementation OspreyGRPCChannel

- (OspreyGRPCChannel)initWithURL:(id)a3 configuration:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)OspreyGRPCChannel;
  v11 = [(OspreyGRPCChannel *)&v25 init];
  if (v11)
  {
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
      -[OspreyGRPCChannel initWithURL:configuration:queue:]();
    }
    uint64_t v12 = [v8 copy];
    baseURL = v11->_baseURL;
    v11->_baseURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    id v14 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v14 setUnderlyingQueue:v11->_queue];
    if (OspreyIsEntitledForMPTCP())
    {
      objc_msgSend(v9, "set_allowsMultipathTCP:", 1);
      objc_msgSend(v9, "set_multipathAlternatePort:", 5228);
      OspreyLoggingInit();
      v15 = (void *)OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
        -[OspreyGRPCChannel initWithURL:configuration:queue:](v9, v15);
      }
    }
    objc_msgSend(v9, "set_allowsTLSFalseStart:", 1);
    uint64_t v16 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v9 delegate:v11 delegateQueue:v14];
    session = v11->_session;
    v11->_session = (NSURLSession *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    taskToContext = v11->_taskToContext;
    v11->_taskToContext = (NSMapTable *)v18;

    v20 = objc_alloc_init(OspreyMessageWriter);
    messageWriter = v11->_messageWriter;
    v11->_messageWriter = v20;

    v22 = objc_alloc_init(AbsintheAuthenticationDurations);
    absintheDurations = v11->_absintheDurations;
    v11->_absintheDurations = v22;
  }
  return v11;
}

- (void)dealloc
{
  [(OspreyGRPCChannel *)self close];
  v3.receiver = self;
  v3.super_class = (Class)OspreyGRPCChannel;
  [(OspreyGRPCChannel *)&v3 dealloc];
}

- (void)close
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1BEDB4000, v0, v1, "%s session: %@", v2, v3, v4, v5, 2u);
}

- (void)cancel
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1BEDB4000, v0, v1, "%s session: %@", v2, v3, v4, v5, 2u);
}

- (void)setAbsintheTimestampForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(OspreyGRPCChannel *)self absintheDurations];
  [v5 setAbsintheAuthenticationTimestampForKey:v4];
}

- (void)_startTask:(id)a3
{
}

- (id)clientStreamingContextForRequest:(id)a3 streamingResponseHandler:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[OspreyGRPCStreamingContext alloc] initWithQueue:self->_queue responseHandler:v9 completion:v8];

  uint64_t v12 = [v10 useCompression];
  [(OspreyGRPCStreamingContext *)v11 setCompressionEnabled:v12];

  return v11;
}

- (void)unaryRequest:(id)a3 requestData:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke;
  v21[3] = &unk_1E63CBDD8;
  v21[4] = v22;
  v21[5] = v24;
  v11 = (void *)MEMORY[0x1C189D2A0](v21);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke_2;
  uint64_t v18 = &unk_1E63CBD60;
  id v12 = v10;
  id v19 = v12;
  v20 = v24;
  v13 = (void *)MEMORY[0x1C189D2A0](&v15);
  id v14 = -[OspreyGRPCChannel bidirectionalStreamingRequest:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequest:streamingResponseHandler:completion:", v8, v11, v13, v15, v16, v17, v18);
  [v14 writeFrame:v9];
  [v14 finishWriting];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke(uint64_t a1, void *a2)
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

uint64_t __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  return result;
}

- (void)serverStreamingRequest:(id)a3 requestData:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = [(OspreyGRPCChannel *)self bidirectionalStreamingRequest:a3 streamingResponseHandler:a5 completion:a6];
  [v11 writeFrame:v10];

  [v11 finishWriting];
}

- (id)clientStreamingRequest:(id)a3 responseHandler:(id)a4 streamingContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__2;
  v25[4] = __Block_byref_object_dispose__2;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke;
  void v22[3] = &unk_1E63CBDD8;
  v22[4] = v23;
  v22[5] = v25;
  id v11 = (void *)MEMORY[0x1C189D2A0](v22);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke_2;
  id v19 = &unk_1E63CBD60;
  id v12 = v9;
  id v20 = v12;
  v21 = v25;
  v13 = (void *)MEMORY[0x1C189D2A0](&v16);
  id v14 = -[OspreyGRPCChannel bidirectionalStreamingRequest:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequest:streamingResponseHandler:completion:", v8, v11, v13, v16, v17, v18, v19);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  return v14;
}

void __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke(uint64_t a1, void *a2)
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

uint64_t __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  return result;
}

- (id)bidirectionalStreamingRequest:(id)a3 streamingResponseHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(OspreyGRPCChannel *)self clientStreamingContextForRequest:v8 streamingResponseHandler:a4 completion:a5];
  [(OspreyGRPCChannel *)self bidirectionalStreamingRequest:v8 streamingContext:v9];

  return v9;
}

- (void)bidirectionalStreamingRequest:(id)a3 streamingContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  OspreyLoggingInit();
  id v8 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_INFO))
  {
    baseURL = self->_baseURL;
    id v10 = v8;
    id v11 = [v6 methodName];
    int v14 = 136315650;
    uint64_t v15 = "-[OspreyGRPCChannel bidirectionalStreamingRequest:streamingContext:]";
    __int16 v16 = 2112;
    uint64_t v17 = baseURL;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_1BEDB4000, v10, OS_LOG_TYPE_INFO, "%s baseURL: %@, method: %@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [v6 grpcRequestWithBaseURL:self->_baseURL];
  [v7 bindToUrlRequest:v12];
  v13 = [(NSURLSession *)self->_session dataTaskWithRequest:v12];
  [(NSMapTable *)self->_taskToContext setObject:v7 forKey:v13];

  [(OspreyGRPCChannel *)self _startTask:v13];
}

- (void)preconnect
{
  id v3 = [(NSURLSession *)self->_session dataTaskWithURL:self->_baseURL completionHandler:&__block_literal_global_6];
  objc_msgSend(v3, "set_preconnect:", 1);
  [(OspreyGRPCChannel *)self _startTask:v3];
}

void __31__OspreyGRPCChannel_preconnect__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    OspreyLoggingInit();
    id v9 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
      __31__OspreyGRPCChannel_preconnect__block_invoke_cold_3(v9, v8);
    }
  }
  else
  {
    OspreyLoggingInit();
    id v10 = OspreyLogContextGRPC;
    BOOL v11 = os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v11) {
        __31__OspreyGRPCChannel_preconnect__block_invoke_cold_2(v10);
      }
    }
    else if (v11)
    {
      __31__OspreyGRPCChannel_preconnect__block_invoke_cold_1(v10);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  OspreyLoggingInit();
  id v7 = OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    int v14 = "-[OspreyGRPCChannel URLSession:task:didFinishCollectingMetrics:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BEDB4000, v7, OS_LOG_TYPE_INFO, "%s Successfully collected metrics %@", (uint8_t *)&v13, 0x16u);
  }
  if (v6)
  {
    id v8 = [[OspreyConnectionMetrics alloc] initWithMetrics:v6];
    id v9 = [(OspreyGRPCChannel *)self absintheDurations];
    id v10 = [(OspreyConnectionMetrics *)v8 connectionMethod];
    [v9 setAbsintheConnectionMethodWith:v10];

    BOOL v11 = +[OspreyAnalytics reporter];
    [v11 reportConnectionMetrics:v8];

    connectionMetricsHandler = (void (**)(id, OspreyConnectionMetrics *))self->_connectionMetricsHandler;
    if (connectionMetricsHandler) {
      connectionMetricsHandler[2](connectionMetricsHandler, v8);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  queue = self->_queue;
  id v6 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2(queue);
  v6[2](v6, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [v7 originalRequest];
  id v10 = [v9 URL];

  BOOL v11 = [(NSMapTable *)self->_taskToContext objectForKey:v7];
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
  {
    -[OspreyGRPCChannel URLSession:task:didCompleteWithError:]();
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v8)
  {
LABEL_3:
    id v12 = +[OspreyAnalytics reporter];
    [v12 reportError:v8 forURL:v10];
  }
LABEL_4:
  [v11 completeWithError:v8];
  [(NSMapTable *)self->_taskToContext removeObjectForKey:v7];
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  queue = self->_queue;
  id v9 = (void (**)(id, uint64_t, void))a5;
  dispatch_assert_queue_V2(queue);
  id v10 = [v7 protectionSpace];
  BOOL v11 = [v10 authenticationMethod];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F28988]];

  OspreyLoggingInit();
  int v13 = (void *)OspreyLogContextGRPC;
  BOOL v14 = os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      -[OspreyGRPCChannel URLSession:didReceiveChallenge:completionHandler:]();
    }
    uint64_t v15 = 0;
  }
  else
  {
    if (v14) {
      -[OspreyGRPCChannel URLSession:didReceiveChallenge:completionHandler:]((uint64_t)v7, v13, v10);
    }
    uint64_t v15 = 1;
  }
  v9[2](v9, v15, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void (**)(id, void))a6;
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
    -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:].cold.4();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v12 = v10;
  uint64_t v13 = [v12 statusCode];
  BOOL v14 = [v12 allHeaderFields];
  uint64_t v15 = [v14 objectForKey:@"grpc-status"];
  uint64_t v16 = [v15 longLongValue];

  uint64_t v17 = +[OspreyAnalytics reporter];
  __int16 v18 = [v12 URL];
  [v17 reportHttpStatus:v13 grpcStatus:v16 forURL:v18];

  if (v13 != 200)
  {
    uint64_t v20 = [MEMORY[0x1E4F28D20] localizedStringForStatusCode:v13];
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR)) {
      -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:]();
    }
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F289A0];
    char v23 = [v12 allHeaderFields];
    char v24 = v27;
    uint64_t v25 = v28;
    uint64_t v26 = v13;
    goto LABEL_11;
  }
  if (v16)
  {
    id v19 = [v12 allHeaderFields];
    uint64_t v20 = [v19 objectForKey:@"grpc-message"];

    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR)) {
      -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:]();
    }
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F289A0];
    char v23 = [v12 allHeaderFields];
    char v24 = v21;
    uint64_t v25 = v22;
    uint64_t v26 = -1011;
LABEL_11:
    v29 = [v24 errorWithDomain:v25 code:v26 userInfo:v23];

    v30 = [(NSMapTable *)self->_taskToContext objectForKey:v9];
    [v30 completeWithError:v29];
    [(NSMapTable *)self->_taskToContext removeObjectForKey:v9];
    v11[2](v11, 0);

    goto LABEL_12;
  }
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
    -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:]();
  }
  v11[2](v11, 1);
LABEL_12:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
    -[OspreyGRPCChannel URLSession:dataTask:didReceiveData:]();
  }
  id v9 = [(NSMapTable *)self->_taskToContext objectForKey:v7];
  [v9 handleResponseData:v8];
}

- (id)connectionMetricsHandler
{
  return self->_connectionMetricsHandler;
}

- (void)setConnectionMetricsHandler:(id)a3
{
}

- (AbsintheAuthenticationDurations)absintheDurations
{
  return self->_absintheDurations;
}

- (void)setAbsintheDurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absintheDurations, 0);
  objc_storeStrong(&self->_connectionMetricsHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_taskToContext, 0);
  objc_storeStrong((id *)&self->_messageWriter, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)initWithURL:(void *)a1 configuration:(void *)a2 queue:.cold.1(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = 136315906;
  id v5 = "-[OspreyGRPCChannel initWithURL:configuration:queue:]";
  __int16 v6 = 2112;
  id v7 = a1;
  __int16 v8 = 1024;
  int v9 = [a1 _allowsMultipathTCP];
  __int16 v10 = 2048;
  uint64_t v11 = [a1 _multipathAlternatePort];
  _os_log_debug_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_DEBUG, "%s %@ mptcp: %d port: %lu", (uint8_t *)&v4, 0x26u);
}

- (void)initWithURL:configuration:queue:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_4(&dword_1BEDB4000, v0, v1, "%s Initializing Osprey GRPC channel and NSURLSession -- %@", v2, v3, v4, v5, 2u);
}

void __31__OspreyGRPCChannel_preconnect__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[OspreyGRPCChannel preconnect]_block_invoke";
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Preconnection successful!", (uint8_t *)&v1, 0xCu);
}

void __31__OspreyGRPCChannel_preconnect__block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[OspreyGRPCChannel preconnect]_block_invoke";
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Perconnection error: response should be nil.", (uint8_t *)&v1, 0xCu);
}

void __31__OspreyGRPCChannel_preconnect__block_invoke_cold_3(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_DEBUG, "%s Preconnection error: %@", (uint8_t *)v5, 0x16u);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_4(&dword_1BEDB4000, v0, v1, "%s Completed with error: %@", v2, v3, v4, v5, 2u);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_4(&dword_1BEDB4000, v0, v1, "%s Got challenge %@", v2, v3, v4, v5, 2u);
}

- (void)URLSession:(uint64_t)a1 didReceiveChallenge:(void *)a2 completionHandler:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint64_t v6 = [a3 authenticationMethod];
  int v7 = 136315650;
  __int16 v8 = "-[OspreyGRPCChannel URLSession:didReceiveChallenge:completionHandler:]";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_1BEDB4000, v5, OS_LOG_TYPE_DEBUG, "%s Using default handling for challenge %@ with authenticationMethod %@", (uint8_t *)&v7, 0x20u);
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1BEDB4000, v0, v1, "%s %@ got response %@", v2);
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_1BEDB4000, v0, v1, "%s Encountered grpc error status: %lld - %@", v2);
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_1BEDB4000, v0, v1, "%s Encountered HTTP error status: %ld - %@", v2);
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_4(&dword_1BEDB4000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1BEDB4000, v0, v1, "%s %@ got %@", v2);
}

@end