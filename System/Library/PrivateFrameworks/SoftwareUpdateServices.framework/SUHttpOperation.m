@interface SUHttpOperation
- (BOOL)allowRedirects;
- (NSError)error;
- (NSMutableData)data;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (SUHttpOperation)initWithRequest:(id)a3;
- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (int64_t)statusCode;
- (void)_finished;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)main;
- (void)setAllowRedirects:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setStatusCode:(int64_t)a3;
@end

@implementation SUHttpOperation

- (SUHttpOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUHttpOperation;
  v5 = [(SUHttpOperation *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SUHttpOperation *)v5 setRequest:v4];
    v6->_allowRedirects = 1;
    v6->_done = 0;
  }

  return v6;
}

- (void)main
{
  v3 = (NSURLConnection *)[objc_alloc(MEMORY[0x263EFC608]) initWithRequest:self->_request delegate:self startImmediately:1];
  connection = self->_connection;
  self->_connection = v3;

  if (!self->_done)
  {
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE88];
    while ((CFRunLoopRunInMode(v5, 5.0, 1u) - 1) > 1)
    {
      if (self->_done) {
        return;
      }
    }
    self->_done = 1;
  }
}

- (void)_finished
{
  self->_done = 1;
}

- (void)connectionDidFinishLoading:(id)a3
{
  SULogDebug(@"Connection completed successfully.", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v9);
  [(SUHttpOperation *)self _finished];
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  SULogDebug(@"Connection failed with error: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  [(SUHttpOperation *)self setData:0];
  [(SUHttpOperation *)self setResponse:0];
  [(SUHttpOperation *)self setError:v5];

  [(SUHttpOperation *)self _finished];
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 URL];
  SULogDebug(@"Connection received redirect request to: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);

  if (self->_allowRedirects)
  {
    v17 = (void *)[v8 mutableCopy];
    v18 = [(NSURLRequest *)self->_request HTTPBody];
    [v17 setHTTPBody:v18];

    v19 = [(NSURLRequest *)self->_request HTTPMethod];
    [v17 setHTTPMethod:v19];

    objc_msgSend(v17, "setCachePolicy:", -[NSURLRequest cachePolicy](self->_request, "cachePolicy"));
    objc_msgSend(v17, "setHTTPShouldHandleCookies:", -[NSURLRequest HTTPShouldHandleCookies](self->_request, "HTTPShouldHandleCookies"));
    objc_msgSend(v17, "setHTTPShouldUsePipelining:", -[NSURLRequest HTTPShouldUsePipelining](self->_request, "HTTPShouldUsePipelining"));
    [(NSURLRequest *)self->_request timeoutInterval];
    objc_msgSend(v17, "setTimeoutInterval:");
    v20 = [(NSURLRequest *)self->_request allHTTPHeaderFields];
    [v17 setAllHTTPHeaderFields:v20];

    v21 = [v8 URL];
    [v17 setURL:v21];

    [(SUHttpOperation *)self setRequest:v17];
  }
  else
  {
    [v7 cancel];
    v17 = 0;
  }

  return v17;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  int64_t v7 = [v6 statusCode];
  self->_statusCode = v7;
  SULogDebug(@"Connection received response: %d", v8, v9, v10, v11, v12, v13, v14, v7);
  [(SUHttpOperation *)self setResponse:v6];

  [(SUHttpOperation *)self setData:0];
  if ((unint64_t)(self->_statusCode - 200) > 0x63)
  {
    self->_saveData = 0;
    [v16 cancel];
    uint64_t v15 = +[SUUtility errorWithCode:27];
    [(SUHttpOperation *)self setError:v15];
  }
  else
  {
    self->_saveData = 1;
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v16 = a4;
  uint64_t v5 = [v16 length];
  SULogDebug(@"Connection received %d bytes of data.", v6, v7, v8, v9, v10, v11, v12, v5);
  if (self->_saveData)
  {
    data = self->_data;
    if (data)
    {
      [(NSMutableData *)data appendData:v16];
    }
    else
    {
      uint64_t v14 = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithData:v16];
      uint64_t v15 = self->_data;
      self->_data = v14;
    }
  }
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (BOOL)allowRedirects
{
  return self->_allowRedirects;
}

- (void)setAllowRedirects:(BOOL)a3
{
  self->_allowRedirects = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end