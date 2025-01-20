@interface platform_http_t
- (NSString)documentCompression;
- (id)createTransactionResult:(id)a3 response:(id)a4 data:(id)a5;
- (id)finishStreamedIPPRequest;
- (id)httpResponseForError:(id)a3;
- (id)makeTask:(id)a3 forRequest:(const Real_IPP_Message *)a4;
- (id)pass_callback;
- (id)sendSingleIPPRequest:(const Real_IPP_Message *)a3;
- (id)startStreamedIPPRequest:(const Real_IPP_Message *)a3;
- (id)trust_callback;
- (int64_t)writeIPPDocumentPayload:(const char *)a3 length:(unint64_t)a4;
- (platform_http_t)initWithURL:(id)a3 session:(id)a4;
- (void)_streamedTaskCompleted:(id)a3 response:(id)a4 data:(id)a5;
- (void)_teardownTask;
- (void)sendSingleIPPRequest:(const Real_IPP_Message *)a3 completionHandler:(id)a4;
- (void)setDocumentCompression:(id)a3;
- (void)setPass_callback:(id)a3;
- (void)setTrust_callback:(id)a3;
@end

@implementation platform_http_t

- (platform_http_t)initWithURL:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)platform_http_t;
  v9 = [(platform_http_t *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_session, a4);
  }

  return v10;
}

- (id)makeTask:(id)a3 forRequest:(const Real_IPP_Message *)a4
{
  id v6 = a3;
  id v7 = [[IPPSessionTransaction alloc] initWithURL:self->_url ippRequest:a4->var1 session:self->_session];
  id v8 = +[NSString stringWithFormat:@"%@(%@)", self->_logLeader, v6];
  [(IPPSessionTransaction *)v7 prependLogLeader:v8];

  uint64_t add = atomic_fetch_add(dword_1000C5A58, 1u);
  self->_seq = add;
  v10 = +[NSString stringWithFormat:@"<platform_http(%p) seq %d, %@>", self, add, v6];
  logLeader = self->_logLeader;
  self->_logLeader = v10;

  [(IPPSessionTransaction *)v7 prependLogLeader:self->_logLeader];
  if (self->_trust_callback)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000CA0C;
    v19[3] = &unk_1000954A0;
    v19[4] = self;
    [(IPPSessionTransaction *)v7 setTrust_callback:v19];
  }
  if (self->_pass_callback)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000CBC4;
    v18[3] = &unk_1000954F0;
    v18[4] = self;
    [(IPPSessionTransaction *)v7 setPass_callback:v18];
  }
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CDAC;
  v15[3] = &unk_100095518;
  objc_copyWeak(&v16, &location);
  [(IPPSessionTransaction *)v7 setBoundInterfaceSet_callback:v15];
  objc_super v12 = [(IPPSession *)self->_session controlLogging];

  if (v12)
  {
    v13 = [(IPPSession *)self->_session controlLogging];
    [v13 preserveRequest:a4->var1 forSequence:self->_seq];
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v7;
}

- (void)sendSingleIPPRequest:(const Real_IPP_Message *)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(platform_http_t *)self makeTask:@"single" forRequest:a3];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_10000CF34;
  objc_super v12 = &unk_100095540;
  v13 = self;
  id v8 = v6;
  id v14 = v8;
  [v7 setTransactionCompletedCallback:&v9];
  -[platform_http_t debugLogIPP:ipp:](self, "debugLogIPP:ipp:", "SEND_IPP", a3->var1, v9, v10, v11, v12, v13);
  [v7 start];
}

- (id)sendSingleIPPRequest:(const Real_IPP_Message *)a3
{
  v4 = self;
  if (object_isClass(v4)) {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[platform_http_t sendSingleIPPRequest:]");
  }
  else {
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%p>: %s", objc_opt_class(), v4, "-[platform_http_t sendSingleIPPRequest:]");
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D2C0;
  v8[3] = &unk_100095568;
  v8[4] = v4;
  v8[5] = a3;
  id v6 = sub_10000D17C(v5, v8, 30.0);

  return v6;
}

- (id)httpResponseForError:(id)a3
{
  id v4 = a3;
  v5 = [v4 domain];
  unsigned int v6 = [v5 isEqualToString:NSURLErrorDomain];

  if (v6)
  {
    id v7 = [v4 code];
    uint64_t v8 = 1;
    switch((unint64_t)v7)
    {
      case 0xFFFFFFFFFFFFFC0BLL:
        uint64_t v8 = 3;
        break;
      case 0xFFFFFFFFFFFFFC0CLL:
        uint64_t v8 = 6;
        break;
      case 0xFFFFFFFFFFFFFC0DLL:
      case 0xFFFFFFFFFFFFFC0ELL:
      case 0xFFFFFFFFFFFFFC0FLL:
      case 0xFFFFFFFFFFFFFC10:
      case 0xFFFFFFFFFFFFFC11:
      case 0xFFFFFFFFFFFFFC16:
      case 0xFFFFFFFFFFFFFC18:
        break;
      case 0xFFFFFFFFFFFFFC12:
      case 0xFFFFFFFFFFFFFC13:
      case 0xFFFFFFFFFFFFFC14:
      case 0xFFFFFFFFFFFFFC15:
      case 0xFFFFFFFFFFFFFC17:
        uint64_t v8 = 5;
        break;
      case 0xFFFFFFFFFFFFFC19:
        if (self->_userCanceledAuth) {
          uint64_t v8 = 6;
        }
        else {
          uint64_t v8 = 3;
        }
        break;
      default:
        if ((unint64_t)v7 + 1206 >= 7) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = 4;
        }
        break;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  v9 = [[http_ipp_response_t alloc] initWithTransportStatus:v8];
  uint64_t v10 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "transport error: %{public}@ => %{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

- (void)_teardownTask
{
  streamedTask = self->_streamedTask;
  self->_streamedTask = 0;

  [(IPPSessionTransaction *)self->_streamedTask setTransactionCompletedCallback:0];
  streamedTaskFinishedSemaphore = self->_streamedTaskFinishedSemaphore;
  self->_streamedTaskFinishedSemaphore = 0;
}

- (id)createTransactionResult:(id)a3 response:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v22 = [(platform_http_t *)self httpResponseForError:v8];
    v23 = [v8 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"transport %@/%d", v23, [v8 code]);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v11 = (char *)[v9 statusCode];
  if (v11 != (char *)200)
  {
    v24 = [http_ipp_response_t alloc];
    if ((unint64_t)(v11 - 500) >= 0x64) {
      unsigned int v25 = 1;
    }
    else {
      unsigned int v25 = 5;
    }
    if (v11 == (char *)401) {
      unsigned int v25 = 3;
    }
    if (v11 == (char *)100) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = v25;
    }
    v22 = [(http_ipp_response_t *)v24 initWithTransportStatus:v26];
    uint64_t v27 = +[NSString stringWithFormat:@"http statusCode: %d", v11];
    goto LABEL_21;
  }
  id v12 = v10;
  id v13 = [v9 valueForHTTPHeaderField:@"Content-Type"];
  __int16 v14 = v13;
  if (v13)
  {
    v15 = [v13 lowercaseString];
    unsigned __int8 v16 = [v15 hasPrefix:@"application/ipp"];

    if (v16)
    {
LABEL_5:
      v17 = +[PKIPP responseFromData:v12];
      if (v17)
      {
        if (self->_boundInterfaceFixer)
        {
          v18 = _PKLogCategory(PKLogCategoryDefault[0]);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rewriting urls in ipp response for bound interface", buf, 2u);
          }

          uint64_t v19 = [v17 rewriteURLAttributes:self->_boundInterfaceFixer];

          v17 = (void *)v19;
        }
        v20 = [[http_ipp_response_t alloc] initWithResponse:v17 transportStatus:0];

        v21 = 0;
        v22 = v20;
LABEL_22:
        v28 = v22;
        if (v22) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      v22 = 0;
      uint64_t v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"couldn't parse ipp data (length %d)", [v12 length]);
LABEL_21:
      v21 = (__CFString *)v27;
      goto LABEL_22;
    }
  }
  else if ((unint64_t)[v12 length] >= 9 {
         && (id v29 = v12,
  }
             v30 = [v29 bytes],
             v31 = (unsigned __int8 *)[v29 length],
             *v30 == 2))
  {
    int v32 = v31[(void)v30 - 1];

    if (v32 == 3) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  v21 = @"data not ipp";
LABEL_30:
  v28 = [[http_ipp_response_t alloc] initWithTransportStatus:1];
LABEL_31:
  v33 = [(IPPSession *)self->_session controlLogging];

  if (v33)
  {
    v34 = [(http_ipp_response_t *)v28 ippResponse];

    if (v34)
    {
      v35 = [(IPPSession *)self->_session controlLogging];
      v36 = [(http_ipp_response_t *)v28 ippResponse];
      [v35 preserveResponse:v36 forSequence:self->_seq];
    }
    else
    {
      if (!v21) {
        v21 = @"Unknown";
      }
      v35 = [(IPPSession *)self->_session controlLogging];
      [v35 preserveResponseFailure:v21 forSequence:self->_seq];
    }
  }

  return v28;
}

- (void)_streamedTaskCompleted:(id)a3 response:(id)a4 data:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(platform_http_t *)self createTransactionResult:v13 response:v8 data:v9];
  streamedTaskResponse = self->_streamedTaskResponse;
  self->_streamedTaskResponse = v10;

  streamedTask = self->_streamedTask;
  self->_streamedTask = 0;
}

- (id)startStreamedIPPRequest:(const Real_IPP_Message *)a3
{
  v5 = [(platform_http_t *)self makeTask:@"streamed" forRequest:a3];
  streamedTask = self->_streamedTask;
  self->_streamedTask = v5;

  if (self->_documentCompression)
  {
    id v7 = +[DocumentCompressor documentCompresorForName:](DocumentCompressor, "documentCompresorForName:");
    [(IPPSessionTransaction *)self->_streamedTask setDocumentCompressor:v7];
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000DD50;
  v24[3] = &unk_100095360;
  id v8 = dispatch_semaphore_create(0);
  unsigned int v25 = v8;
  [(IPPSessionTransaction *)self->_streamedTask setInitialPayloadSentCallback:v24];
  id v9 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  streamedTaskFinishedSemaphore = self->_streamedTaskFinishedSemaphore;
  self->_streamedTaskFinishedSemaphore = v9;

  v11 = self->_streamedTaskFinishedSemaphore;
  objc_initWeak(&location, self);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  uint64_t v19 = sub_10000DD58;
  v20 = &unk_100095590;
  objc_copyWeak(&v22, &location);
  id v12 = v11;
  v21 = v12;
  [(IPPSessionTransaction *)self->_streamedTask setTransactionCompletedCallback:&v17];
  -[platform_http_t debugLogIPP:ipp:](self, "debugLogIPP:ipp:", "SEND_IPP", a3->var1, v17, v18, v19, v20);
  [(IPPSessionTransaction *)self->_streamedTask start];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = [(IPPSessionTransaction *)self->_streamedTask transportError];
  if (v13)
  {
    [(platform_http_t *)self _teardownTask];
    __int16 v14 = [(platform_http_t *)self httpResponseForError:v13];
  }
  else
  {
    __int16 v14 = [[http_ipp_response_t alloc] initWithTransportStatus:2];
  }
  v15 = v14;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v15;
}

- (int64_t)writeIPPDocumentPayload:(const char *)a3 length:(unint64_t)a4
{
  streamedTask = self->_streamedTask;
  if (!streamedTask
    || (unint64_t v6 = a4,
        -[IPPSessionTransaction writeDocumentDataBlocking:length:](streamedTask, "writeDocumentDataBlocking:length:", a3), id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    [(platform_http_t *)self _teardownTask];
    return -1;
  }
  return v6;
}

- (id)finishStreamedIPPRequest
{
  streamedTask = self->_streamedTask;
  if (streamedTask && self->_streamedTaskFinishedSemaphore)
  {
    [(IPPSessionTransaction *)streamedTask finishedWriting];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_streamedTaskFinishedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  streamedTaskResponse = self->_streamedTaskResponse;
  if (!streamedTaskResponse)
  {
    v5 = [[http_ipp_response_t alloc] initWithTransportStatus:1];
    unint64_t v6 = self->_streamedTaskResponse;
    self->_streamedTaskResponse = v5;

    streamedTaskResponse = self->_streamedTaskResponse;
  }
  if (![(http_ipp_response_t *)streamedTaskResponse transportStatus])
  {
    id v7 = [(http_ipp_response_t *)self->_streamedTaskResponse ippResponse];
    [(platform_http_t *)self debugLogIPP:"RECV_IPP" ipp:v7];
  }
  [(IPPSessionTransaction *)self->_streamedTask invalidate];
  id v8 = self->_streamedTaskResponse;

  return v8;
}

- (NSString)documentCompression
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDocumentCompression:(id)a3
{
}

- (id)trust_callback
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setTrust_callback:(id)a3
{
}

- (id)pass_callback
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setPass_callback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pass_callback, 0);
  objc_storeStrong(&self->_trust_callback, 0);
  objc_storeStrong((id *)&self->_documentCompression, 0);
  objc_storeStrong(&self->_boundInterfaceFixer, 0);
  objc_storeStrong((id *)&self->_streamedTaskResponse, 0);
  objc_storeStrong((id *)&self->_streamedTask, 0);
  objc_storeStrong((id *)&self->_streamedTaskFinishedSemaphore, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_logLeader, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end