@interface SSHTTPServerRequestHandler
- (BOOL)_handleReceivedDataWithError:(id *)a3;
- (BOOL)_shouldKeepRunning;
- (SSHTTPServerRequestHandler)initWithReadStream:(id)a3 writeStream:(id)a4 runLoop:(id)a5;
- (SSHTTPServerRequestHandlerDelegate)delegate;
- (id)_errorResponseDataWithStatus:(signed __int16)a3 message:(id)a4;
- (int)downloadSpeed;
- (int64_t)_throttledWriteSpeed;
- (int64_t)_writeResponseData:(id)a3 error:(id *)a4;
- (void)_close;
- (void)_respondWithRequest:(id)a3 error:(id)a4;
- (void)close;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDownloadSpeed:(int)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation SSHTTPServerRequestHandler

- (SSHTTPServerRequestHandler)initWithReadStream:(id)a3 writeStream:(id)a4 runLoop:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SSHTTPServerRequestHandler;
  v12 = [(SSHTTPServerRequestHandler *)&v16 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.StoreServices.HTTPServerResponse", 0);
    requestQueue = v12->_requestQueue;
    v12->_requestQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_output, a4);
    [(NSOutputStream *)v12->_output open];
    objc_storeStrong((id *)&v12->_input, a3);
    [(NSInputStream *)v12->_input scheduleInRunLoop:v11 forMode:*MEMORY[0x1E4F1C3A0]];
    [(NSInputStream *)v12->_input setDelegate:v12];
    [(NSInputStream *)v12->_input open];
  }

  return v12;
}

- (void)dealloc
{
  [(SSHTTPServerRequestHandler *)self _close];
  incommingMessage = self->_incommingMessage;
  if (incommingMessage)
  {
    CFRelease(incommingMessage);
    self->_incommingMessage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSHTTPServerRequestHandler;
  [(SSHTTPServerRequestHandler *)&v4 dealloc];
}

- (void)close
{
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSHTTPServerRequestHandler_close__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_sync(requestQueue, block);
}

uint64_t __35__SSHTTPServerRequestHandler_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  requestQueue = self->_requestQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SSHTTPServerRequestHandler_stream_handleEvent___block_invoke;
  v5[3] = &unk_1E5BA8DA8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(requestQueue, v5);
}

void __49__SSHTTPServerRequestHandler_stream_handleEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  switch(v2)
  {
    case 16:
      id v5 = 0;
      int v4 = 1;
      break;
    case 8:
      id v5 = [*(id *)(*(void *)(a1 + 32) + 32) streamError];
      int v4 = 0;
      break;
    case 2:
      v3 = *(void **)(a1 + 32);
      id v11 = 0;
      int v4 = [v3 _handleReceivedDataWithError:&v11];
      id v5 = v11;
      break;
    default:
      int v4 = 0;
      id v5 = 0;
      break;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5) {
    int v7 = 1;
  }
  else {
    int v7 = v4;
  }
  if (*(void *)(v6 + 40)) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [*(id *)(v6 + 32) setDelegate:0];
    [*(id *)(*(void *)(a1 + 32) + 32) close];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = 0;

    [*(id *)(a1 + 32) _respondWithRequest:*(void *)(*(void *)(a1 + 32) + 48) error:v5];
  }
}

- (BOOL)_handleReceivedDataWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if ([(NSInputStream *)self->_input hasBytesAvailable])
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      NSInteger v6 = [(NSInputStream *)self->_input read:v26 maxLength:1024];
      if (v6 < 0) {
        break;
      }
      CFIndex v7 = v6;
      if (!v6) {
        return 1;
      }
      if (self->_incommingHeadersComplete)
      {
        incommingMessageBody = self->_incommingMessageBody;
        if (!incommingMessageBody)
        {
          uint64_t v9 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
          id v10 = self->_incommingMessageBody;
          self->_incommingMessageBody = v9;

          incommingMessageBody = self->_incommingMessageBody;
        }
        [(NSMutableData *)incommingMessageBody appendBytes:v26 length:v7];
      }
      else
      {
        incommingMessage = self->_incommingMessage;
        if (!incommingMessage)
        {
          incommingMessage = CFHTTPMessageCreateEmpty(v5, 1u);
          self->_incommingMessage = incommingMessage;
        }
        CFHTTPMessageAppendBytes(incommingMessage, v26, v7);
        if (CFHTTPMessageIsHeaderComplete(self->_incommingMessage))
        {
          self->_incommingHeadersComplete = 1;
          v12 = (NSMutableURLRequest *)objc_alloc_init(MEMORY[0x1E4F28E88]);
          request = self->_request;
          self->_request = v12;

          CFURLRef v14 = CFHTTPMessageCopyRequestURL(self->_incommingMessage);
          v15 = (__CFString *)CFHTTPMessageCopyRequestMethod(self->_incommingMessage);
          CFDictionaryRef v16 = CFHTTPMessageCopyAllHeaderFields(self->_incommingMessage);
          [(NSMutableURLRequest *)self->_request setURL:v14];
          [(NSMutableURLRequest *)self->_request setHTTPMethod:v15];
          [(NSMutableURLRequest *)self->_request setAllHTTPHeaderFields:v16];
          CFDataRef v17 = CFHTTPMessageCopyBody(self->_incommingMessage);
          CFDataRef v18 = v17;
          if (v17 && [(__CFData *)v17 length])
          {
            v19 = self->_incommingMessageBody;
            if (!v19)
            {
              v20 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
              v21 = self->_incommingMessageBody;
              self->_incommingMessageBody = v20;

              v19 = self->_incommingMessageBody;
            }
            [(NSMutableData *)v19 appendData:v18];
          }
        }
      }
      if (![(NSInputStream *)self->_input hasBytesAvailable]) {
        goto LABEL_19;
      }
    }
    if (a3)
    {
      SSError(@"SSHTTPServerResponseErrorDomain", 500, @"Socket Read Error", @"Length < 0");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_19:
    if (!self->_incommingHeadersComplete) {
      return 0;
    }
    v22 = [(NSMutableURLRequest *)self->_request allHTTPHeaderFields];
    v23 = [v22 objectForKeyedSubscript:@"Content-Length"];
    unint64_t v24 = [v23 integerValue];

    if ([(NSMutableData *)self->_incommingMessageBody length] < v24) {
      return 0;
    }
    [(NSMutableURLRequest *)self->_request setHTTPBody:self->_incommingMessageBody];
  }
  return 1;
}

- (void)_respondWithRequest:(id)a3 error:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  BOOL v8 = [(SSHTTPServerRequestHandler *)self delegate];
  uint64_t v9 = [v6 URL];
  id v10 = [v9 path];
  uint64_t v11 = [v8 responseBlockForPath:v10];

  v37 = (void *)v11;
  if (v7)
  {
    v12 = -[SSHTTPServerResponse initWithStatusCode:]([SSHTTPServerResponse alloc], "initWithStatusCode:", (__int16)[v7 code]);
    __int16 v13 = [v7 code];
    CFURLRef v14 = [v7 description];
    v15 = [(SSHTTPServerRequestHandler *)self _errorResponseDataWithStatus:v13 message:v14];
    [(SSHTTPServerResponse *)v12 setBody:v15];
  }
  else if (v11)
  {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    v12 = (SSHTTPServerResponse *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = [[SSHTTPServerResponse alloc] initWithStatusCode:404];
    CFDictionaryRef v16 = [(SSHTTPServerRequestHandler *)self _errorResponseDataWithStatus:404 message:@"Page Not Found"];
    [(SSHTTPServerResponse *)v12 setBody:v16];
  }
  CFDataRef v17 = [(SSHTTPServerResponse *)v12 copyHTTPMessage];
  CFDataRef v18 = CFHTTPMessageCopySerializedMessage(v17);
  CFRelease(v17);
  id v38 = 0;
  int64_t v19 = [(SSHTTPServerRequestHandler *)self _writeResponseData:v18 error:&v38];
  id v20 = v38;
  uint64_t v21 = +[SSLogConfig sharedStoreServicesConfig];
  v22 = (void *)v21;
  if (v20)
  {
    if (!v21)
    {
      v22 = +[SSLogConfig sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      v23 |= 2u;
    }
    unint64_t v24 = [v22 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      v23 &= 2u;
    }
    if (!v23) {
      goto LABEL_25;
    }
    v25 = objc_opt_class();
    int v39 = 138412802;
    v40 = v25;
    __int16 v41 = 2048;
    v42 = (SSHTTPServerRequestHandler *)v19;
    __int16 v43 = 2112;
    id v44 = v20;
    id v26 = v25;
    LODWORD(v36) = 32;
  }
  else
  {
    if (!v21)
    {
      v22 = +[SSLogConfig sharedConfig];
    }
    int v27 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      v27 |= 2u;
    }
    unint64_t v24 = [v22 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      v27 &= 2u;
    }
    if (!v27) {
      goto LABEL_25;
    }
    v28 = objc_opt_class();
    int v39 = 138412546;
    v40 = v28;
    __int16 v41 = 2114;
    v42 = self;
    id v26 = v28;
    LODWORD(v36) = 22;
  }
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    unint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v39, v36, v37);
    free(v29);
    SSFileLog(v22, @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v24);
LABEL_25:
  }
  [(SSHTTPServerRequestHandler *)self _close];
}

- (void)_close
{
  input = self->_input;
  if (input)
  {
    [(NSInputStream *)input close];
    int v4 = self->_input;
    self->_input = 0;
  }
  output = self->_output;
  if (output)
  {
    [(NSOutputStream *)output close];
    id v6 = self->_output;
    self->_output = 0;
  }
  id v7 = [(SSHTTPServerRequestHandler *)self delegate];
  [v7 requestDidFinish:self];
}

- (id)_errorResponseDataWithStatus:(signed __int16)a3 message:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v6, "appendFormat:", @"<html><head><title>%d</title></head><body><div align='center'><h1>%d</h1>", v4, v4);
  if (v5) {
    [v6 appendFormat:@"<p>%@</p>", v5];
  }
  [v6 appendString:@"</div></body></html>"];
  id v7 = [v6 dataUsingEncoding:4];

  return v7;
}

- (int64_t)_throttledWriteSpeed
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  int v3 = self->_downloadSpeed - 1;
  if (v3 > 5) {
    return 0;
  }
  else {
    return qword_1A52F6698[v3];
  }
}

- (BOOL)_shouldKeepRunning
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  requestQueue = self->_requestQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SSHTTPServerRequestHandler__shouldKeepRunning__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(requestQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__SSHTTPServerRequestHandler__shouldKeepRunning__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 32)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *(void *)(v1 + 40) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)_writeResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if (v6 && [v6 length])
  {
    unint64_t v7 = [(SSHTTPServerRequestHandler *)self _throttledWriteSpeed];
    unint64_t v8 = 0;
    if (v7) {
      double v9 = 0.5;
    }
    else {
      double v9 = 0.0;
    }
    if (v7) {
      unint64_t v10 = (unint64_t)((double)v7 * 0.5);
    }
    else {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    while (1)
    {
      if (v8 >= [v6 length])
      {
        id v17 = 0;
        goto LABEL_26;
      }
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      unint64_t v12 = v10;
      if (v10 >= [v6 length] - v8) {
        unint64_t v12 = [v6 length] - v8;
      }
      NSInteger v13 = -[NSOutputStream write:maxLength:](self->_output, "write:maxLength:", [v6 bytes] + v8, v12);
      if (v13 < 0) {
        break;
      }
      v8 += v13;
      [v11 timeIntervalSinceNow];
      if (v14 >= 0.0)
      {
        [v11 timeIntervalSinceNow];
      }
      else
      {
        [v11 timeIntervalSinceNow];
        double v16 = -v15;
      }
      if (v9 - v16 > 0.0) {
        objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:");
      }
    }
    SSError(@"SSHTTPServerResponseErrorDomain", 500, @"Write Error", @"Error writing data to socket. [2]");
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    if (a4 && v17)
    {
      id v17 = v17;
      *a4 = v17;
    }
LABEL_26:
  }
  else if (a4)
  {
    SSError(@"SSHTTPServerResponseErrorDomain", 500, @"Write Error", @"No data to write");
    unint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (SSHTTPServerRequestHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSHTTPServerRequestHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(int)a3
{
  self->_downloadSpeed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_incommingMessageBody, 0);
}

@end