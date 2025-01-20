@interface IPPSessionTransaction
- (DocumentCompressor)documentCompressor;
- (IPPSessionTransaction)initWithURL:(id)a3 ippRequest:(id)a4 session:(id)a5;
- (NSError)transportError;
- (id)boundInterfaceSet_callback;
- (id)getLogCategory;
- (id)getLogLeader;
- (id)initialPayloadSentCallback;
- (id)pass_callback;
- (id)transactionCompletedCallback;
- (id)trust_callback;
- (id)writeDocumentData0:(const char *)a3 length:(unint64_t)a4;
- (id)writeDocumentDataBlocking:(const char *)a3 length:(unint64_t)a4;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)_send0_initialPayload:(id)a3;
- (void)_send1_sendClearToSendBody:(BOOL)a3;
- (void)dealloc;
- (void)finishedWriting;
- (void)finishedWriting0;
- (void)invalidate;
- (void)prependLogLeader:(id)a3;
- (void)setBoundInterfaceSet_callback:(id)a3;
- (void)setDocumentCompressor:(id)a3;
- (void)setInitialPayloadSentCallback:(id)a3;
- (void)setPass_callback:(id)a3;
- (void)setTransactionCompletedCallback:(id)a3;
- (void)setTrust_callback:(id)a3;
- (void)start;
- (void)updateInitialPayloadUserName:(id)a3;
@end

@implementation IPPSessionTransaction

- (IPPSessionTransaction)initWithURL:(id)a3 ippRequest:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)IPPSessionTransaction;
  v12 = [(IPPSessionTransaction *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    v14 = (ipp_request_t *)[v10 copy];
    initialRequest = v13->_initialRequest;
    v13->_initialRequest = v14;

    v13->_canResendInitialRequest = 0;
    objc_storeStrong((id *)&v13->_session, a5);
    v16 = [(IPPSession *)v13->_session URLSession];
    if (!v16) {
      __assert_rtn("-[IPPSessionTransaction initWithURL:ippRequest:session:]", "platform_http.mm", 404, "_session.URLSession");
    }

    uint64_t v17 = [(IPPSession *)v13->_session workQueue];
    taskQueue = v13->_taskQueue;
    v13->_taskQueue = (OS_dispatch_queue *)v17;
  }
  return v13;
}

- (void)dealloc
{
  if (self->_transactionCompletedCallback)
  {
    v3 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "transactionCompletedCallback was never invoked", buf, 2u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)IPPSessionTransaction;
  [(IPPSessionTransaction *)&v4 dealloc];
}

- (void)prependLogLeader:(id)a3
{
  id v6 = a3;
  objc_super v4 = +[NSString stringWithFormat:@"%@: ", v6];
  logLeader = self->_logLeader;
  self->_logLeader = v4;
}

- (id)getLogLeader
{
  logLeader = self->_logLeader;
  [(IPPSessionTransaction *)self description];
  if (logLeader) {
    v3 = {;
  }
    objc_super v4 = +[NSString stringWithFormat:@"%@: %@", logLeader, v3];
  }
  else {
    objc_super v4 = {;
  }
  }

  return v4;
}

- (id)getLogCategory
{
  return PKLogCategoryNetwork[0];
}

- (void)start
{
  v3 = self->_url;
  objc_super v4 = [(NSURL *)v3 scheme];
  v5 = [v4 lowercaseString];

  if (([v5 isEqualToString:@"https"] & 1) != 0
    || [v5 isEqualToString:@"ipps"])
  {
    id v6 = @"https";
  }
  else
  {
    id v6 = @"http";
  }
  PKURLByReplacingScheme(v6, v3);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  transportError = self->_transportError;
  self->_transportError = 0;

  id v8 = objc_alloc((Class)NSMutableURLRequest);
  id v9 = [(IPPSession *)self->_session URLSession];
  id v10 = [v9 configuration];
  [v10 timeoutIntervalForRequest];
  id v11 = objc_msgSend(v8, "initWithURL:cachePolicy:timeoutInterval:", v21, 1);

  v12 = sub_10000A670(v11);
  if (v12)
  {
    v13 = [(IPPSessionTransaction *)self boundInterfaceSet_callback];

    if (v13)
    {
      v14 = [(IPPSessionTransaction *)self boundInterfaceSet_callback];
      ((void (**)(void, void *))v14)[2](v14, v12);
    }
  }
  [v11 setHTTPMethod:@"POST"];
  [v11 setValue:@"application/ipp" forHTTPHeaderField:@"Content-Type"];
  [v11 setValue:@"deflate, gzip, identity", @"Accept-Encoding" forHTTPHeaderField];
  v15 = [v21 host];
  if ([v15 hasSuffix:@"."])
  {
    v16 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", (char *)objc_msgSend(v15, "length") - 1, 1, &stru_1000A4B68);
    [v11 setValue:v16 forHTTPHeaderField:@"Host"];
  }
  self->_canResendInitialRequest = self->_initialPayloadSentCallback == 0;
  [v11 setValue:@"chunked" forHTTPHeaderField:@"Transfer-Encoding"];
  uint64_t v17 = [(IPPSession *)self->_session URLSession];
  v18 = [v17 uploadTaskWithStreamedRequest:v11];
  objc_storeWeak((id *)&self->_task, v18);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);
  [WeakRetained setDelegate:self];

  id v20 = objc_loadWeakRetained((id *)&self->_task);
  [v20 resume];
}

- (id)writeDocumentData0:(const char *)a3 length:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskQueue);
  outputStream = self->_outputStream;
  if (self->_documentCompressor)
  {
    id v8 = outputStream;
    documentCompressor = self->_documentCompressor;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000AB18;
    v20[3] = &unk_1000951D8;
    id v21 = v8;
    id v10 = v8;
    unsigned int v11 = [(DocumentCompressor *)documentCompressor compressChunk:a3 length:a4 completionHandler:v20];

    if (v11)
    {
LABEL_3:
      self->_ctWritten += a4;
      goto LABEL_8;
    }
  }
  else if (sub_10000A9D0(outputStream, (unint64_t)a3, a4))
  {
    goto LABEL_3;
  }
  v12 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t ctWritten = self->_ctWritten;
    *(_DWORD *)buf = 134217984;
    unint64_t v23 = ctWritten;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "writeDocumentData0: failed after writing %ld uncompressed", buf, 0xCu);
  }

  v14 = +[NSError errorWithDomain:NSURLErrorDomain code:-3003 userInfo:0];
  transportError = self->_transportError;
  self->_transportError = v14;

  [(NSOutputStream *)self->_outputStream close];
  v16 = self->_outputStream;
  self->_outputStream = 0;

  inputStream = self->_inputStream;
  self->_inputStream = 0;

LABEL_8:
  v18 = self->_transportError;

  return v18;
}

- (id)writeDocumentDataBlocking:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000ACE4;
  v26 = sub_10000ACF4;
  id v27 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  taskQueue = self->_taskQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ACFC;
  block[3] = &unk_100095338;
  v19 = &v22;
  id v20 = a3;
  block[4] = self;
  unint64_t v21 = a4;
  id v9 = v7;
  v18 = v9;
  dispatch_async(taskQueue, block);
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);
  v12 = v23;
  if (v11 && !v23[5])
  {
    uint64_t v13 = +[NSError errorWithDomain:NSURLErrorDomain code:-1001 userInfo:0];
    v14 = (void *)v23[5];
    v23[5] = v13;

    v12 = v23;
  }
  id v15 = (id)v12[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

- (void)finishedWriting0
{
  outputStream = self->_outputStream;
  if (outputStream && self->_documentCompressor)
  {
    objc_super v4 = outputStream;
    documentCompressor = self->_documentCompressor;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000AE3C;
    v9[3] = &unk_1000951D8;
    dispatch_time_t v10 = v4;
    id v6 = v4;
    [(DocumentCompressor *)documentCompressor finalChunkCompletionHandler:v9];

    outputStream = self->_outputStream;
  }
  [(NSOutputStream *)outputStream close];
  dispatch_semaphore_t v7 = self->_outputStream;
  self->_outputStream = 0;

  inputStream = self->_inputStream;
  self->_inputStream = 0;
}

- (void)finishedWriting
{
  taskQueue = self->_taskQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AEB8;
  block[3] = &unk_100095360;
  block[4] = self;
  dispatch_async(taskQueue, block);
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);
  [WeakRetained setDelegate:0];

  [(IPPSessionTransaction *)self setTrust_callback:0];
  [(IPPSessionTransaction *)self setPass_callback:0];
  [(IPPSessionTransaction *)self setBoundInterfaceSet_callback:0];
  [(IPPSessionTransaction *)self setInitialPayloadSentCallback:0];

  [(IPPSessionTransaction *)self setTransactionCompletedCallback:0];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  intptr_t v11 = (void (**)(id, uint64_t, void))a6;
  v12 = [v10 protectionSpace];
  uint64_t v13 = [v12 authenticationMethod];

  v14 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v36 = v9;
    __int16 v37 = 2114;
    v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "task %{public}@ received challenge %{public}@", buf, 0x16u);
  }

  if ([v13 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    id v15 = objc_retainBlock(self->_trust_callback);
    v16 = [v10 protectionSpace];
    id v17 = [v16 serverTrust];

    if (!v17)
    {
      v11[2](v11, 3, 0);
      goto LABEL_13;
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000B388;
    v31[3] = &unk_1000953B0;
    v32 = [[PKSecTrustWrapper alloc] initWithTrust:v17];
    id v34 = v15;
    id v33 = v9;
    v18 = v15;
    v19 = v32;
    id v20 = objc_retainBlock(v31);
  }
  else
  {
    if ([v13 isEqualToString:NSURLAuthenticationMethodClientCertificate]) {
      goto LABEL_11;
    }
    id pass_callback = self->_pass_callback;
    if (!pass_callback) {
      goto LABEL_11;
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000B644;
    v27[3] = &unk_1000953D8;
    id v30 = objc_retainBlock(pass_callback);
    id v28 = v10;
    id v29 = v9;
    v19 = (PKSecTrustWrapper *)v30;
    id v20 = objc_retainBlock(v27);

    v18 = v30;
  }

  if (v20)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v22 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B6E4;
    block[3] = &unk_100095428;
    id v24 = v20;
    v25 = v11;
    id v15 = v20;
    objc_copyWeak(&v26, (id *)buf);
    dispatch_async(v22, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
LABEL_13:

    goto LABEL_14;
  }
LABEL_11:
  v11[2](v11, 1, 0);
LABEL_14:
}

- (void)updateInitialPayloadUserName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    initialRequest = self->_initialRequest;
    dispatch_semaphore_t v7 = NSStringFromSelector(a2);
    sub_10000F088(v8, initialRequest, v7);

    sub_10000B968((uint64_t)v8, v5);
    sub_10000F138((uint64_t)v8);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskQueue);
  p_outputStream = &self->_outputStream;
  outputStream = self->_outputStream;
  if (outputStream)
  {
    [(NSOutputStream *)outputStream close];
    intptr_t v11 = *p_outputStream;
    *p_outputStream = 0;
  }
  if (self->_initialPayloadSentCallback || self->_canResendInitialRequest)
  {
    v12 = [(ipp_t *)self->_initialRequest dataRepresentation];
    id v13 = [v12 length];
    if ((unint64_t)v13 <= 0x8000) {
      uint64_t v14 = 0x8000;
    }
    else {
      uint64_t v14 = (uint64_t)v13;
    }
    id v20 = 0;
    id v21 = 0;
    +[NSInputStream getBoundStreamsWithBufferSize:v14 inputStream:&v21 outputStream:&v20];
    id v15 = v21;
    id v16 = v21;
    id v17 = v20;
    id v18 = v20;
    [v18 open];
    if ([v18 streamStatus] == (id)2)
    {
      objc_storeStrong((id *)&self->_inputStream, v15);
      objc_storeStrong((id *)&self->_outputStream, v17);
      v8[2](v8, v16);
      [(IPPSessionTransaction *)self _send0_initialPayload:v12];
      if (self->_canResendInitialRequest) {
        [(IPPSessionTransaction *)self finishedWriting];
      }
    }
    else
    {
      v8[2](v8, 0);
    }
  }
  else
  {
    v19 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "body stream already spent", buf, 2u);
    }

    v8[2](v8, 0);
    [v7 cancel];
  }
}

- (void)_send0_initialPayload:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskQueue);
  outputStream = self->_outputStream;
  if (outputStream)
  {
    id v6 = outputStream;
    id v7 = v4;
    BOOL v8 = sub_10000A9D0(v6, (unint64_t)[v7 bytes], (uint64_t)objc_msgSend(v7, "length"));

    if (v8)
    {
      objc_initWeak(location, self);
      id v9 = [(IPPSession *)self->_session workQueue];
      BOOL tlsRetry = self->_tlsRetry;
      dispatch_time_t v11 = dispatch_time(0, 3000000000);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000BE4C;
      v16[3] = &unk_100095450;
      objc_copyWeak(&v17, location);
      BOOL v18 = tlsRetry;
      dispatch_after(v11, v9, v16);
      objc_destroyWeak(&v17);

      objc_destroyWeak(location);
    }
    else
    {
      id v13 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Couldn't send initial payload to output stream", (uint8_t *)location, 2u);
      }

      [(NSOutputStream *)self->_outputStream close];
      inputStream = self->_inputStream;
      self->_inputStream = 0;

      id v15 = self->_outputStream;
      self->_outputStream = 0;
    }
  }
  else
  {
    v12 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "no stream to write to", (uint8_t *)location, 2u);
    }
  }
}

- (void)_send1_sendClearToSendBody:(BOOL)a3
{
  if (self->_tlsRetry != a3)
  {
    id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Retry with TLS changed, so not signaling";
      id v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (self->_httpResponse)
  {
    id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v5 = "We already got a response";
      id v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  BOOL v8 = (void (**)(void))objc_retainBlock(self->_initialPayloadSentCallback);
  id initialPayloadSentCallback = self->_initialPayloadSentCallback;
  self->_id initialPayloadSentCallback = 0;

  if (v8) {
    v8[2]();
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    objc_storeStrong((id *)&self->_httpResponse, a5);
    if ([v11 statusCode] == (id)426)
    {
      v12 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "redirect to TLS received", (uint8_t *)&v16, 2u);
      }

      uint64_t v13 = 0;
      self->_BOOL tlsRetry = 1;
      p_super = &self->_httpResponse->super.super;
      self->_httpResponse = 0;
    }
    else if (self->_initialPayloadSentCallback)
    {
      p_super = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "never started additional payload", (uint8_t *)&v16, 2u);
      }
      uint64_t v13 = 0;
    }
    else
    {
      p_super = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "response received and we've sent initial payload", (uint8_t *)&v16, 2u);
      }
      uint64_t v13 = 1;
    }

    v10[2](v10, v13);
  }
  else
  {
    id v15 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "non http response received %{public}@", (uint8_t *)&v16, 0xCu);
    }

    v10[2](v10, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_initialPayloadSentCallback) {
    __assert_rtn("-[IPPSessionTransaction URLSession:dataTask:didReceiveData:]", "platform_http.mm", 899, "_initialPayloadSentCallback == nil");
  }
  responseData = self->_responseData;
  if (responseData)
  {
    [(NSMutableData *)responseData appendData:v9];
  }
  else
  {
    id v11 = (NSMutableData *)[v9 mutableCopy];
    v12 = self->_responseData;
    self->_responseData = v11;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_tlsRetry)
  {
    id v11 = [(NSURL *)self->_url scheme];
    v12 = [v11 lowercaseString];

    if ([v12 isEqualToString:@"ipp"])
    {
      id v13 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Retrying with TLS", v20, 2u);
      }

      PKURLByReplacingScheme(@"ipps", self->_url);
      uint64_t v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      self->_url = v14;

      [(IPPSessionTransaction *)self start];
      goto LABEL_11;
    }
  }
  objc_storeStrong((id *)&self->_transportError, a5);
  id initialPayloadSentCallback = self->_initialPayloadSentCallback;
  if (initialPayloadSentCallback)
  {
    v12 = (void (**)(void))objc_retainBlock(initialPayloadSentCallback);
    id v17 = self->_initialPayloadSentCallback;
    self->_id initialPayloadSentCallback = 0;

    v12[2](v12);
LABEL_11:

    goto LABEL_12;
  }
  id transactionCompletedCallback = self->_transactionCompletedCallback;
  if (transactionCompletedCallback)
  {
    v12 = (void (**)(void))objc_retainBlock(transactionCompletedCallback);
    id v19 = self->_transactionCompletedCallback;
    self->_id transactionCompletedCallback = 0;

    ((void (*)(void (**)(void), id, NSHTTPURLResponse *, NSMutableData *))v12[2])(v12, v10, self->_httpResponse, self->_responseData);
    goto LABEL_11;
  }
LABEL_12:
}

- (id)trust_callback
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setTrust_callback:(id)a3
{
}

- (id)pass_callback
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setPass_callback:(id)a3
{
}

- (id)boundInterfaceSet_callback
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setBoundInterfaceSet_callback:(id)a3
{
}

- (id)initialPayloadSentCallback
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setInitialPayloadSentCallback:(id)a3
{
}

- (id)transactionCompletedCallback
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setTransactionCompletedCallback:(id)a3
{
}

- (NSError)transportError
{
  return (NSError *)objc_getProperty(self, a2, 152, 1);
}

- (DocumentCompressor)documentCompressor
{
  return (DocumentCompressor *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDocumentCompressor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentCompressor, 0);
  objc_storeStrong((id *)&self->_transportError, 0);
  objc_storeStrong(&self->_transactionCompletedCallback, 0);
  objc_storeStrong(&self->_initialPayloadSentCallback, 0);
  objc_storeStrong(&self->_boundInterfaceSet_callback, 0);
  objc_storeStrong(&self->_pass_callback, 0);
  objc_storeStrong(&self->_trust_callback, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_logLeader, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_destroyWeak((id *)&self->_task);
  objc_storeStrong((id *)&self->_initialRequest, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end