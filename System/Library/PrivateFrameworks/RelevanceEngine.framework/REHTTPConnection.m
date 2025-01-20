@interface REHTTPConnection
- (BOOL)isValid;
- (BOOL)open;
- (REHTTPConnection)initWithConnection:(_CFHTTPServerConnection *)a3;
- (REHTTPConnectionDelegate)delegate;
- (_CFHTTPServerConnection)connection;
- (void)_handleCompleteRequest:(id)a3 stream:(id)a4 error:(id)a5;
- (void)_sendResponse:(id)a3;
- (void)dealloc;
- (void)didCompleteResponse:(_CFHTTPServerResponse *)a3 error:(id)a4;
- (void)didRecieveRequest:(_CFHTTPServerRequest *)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation REHTTPConnection

- (REHTTPConnection)initWithConnection:(_CFHTTPServerConnection *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)REHTTPConnection;
  v4 = [(REHTTPConnection *)&v12 init];
  if (v4)
  {
    v4->_connection = (_CFHTTPServerConnection *)CFRetain(a3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.HTTPConnection", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    pendingRequests = v4->_pendingRequests;
    v4->_pendingRequests = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    pendingResponse = v4->_pendingResponse;
    v4->_pendingResponse = (NSMutableArray *)v9;

    [MEMORY[0x263F08D40] valueWithWeakObject:v4];
    _CFHTTPServerConnectionSetClient();
  }
  return v4;
}

- (void)dealloc
{
  [(REHTTPConnection *)self invalidate];
  connection = self->_connection;
  if (connection) {
    CFRelease(connection);
  }
  v4.receiver = self;
  v4.super_class = (Class)REHTTPConnection;
  [(REHTTPConnection *)&v4 dealloc];
}

- (BOOL)isValid
{
  connection = self->_connection;
  if (connection) {
    LOBYTE(connection) = _CFHTTPServerConnectionIsValid() != 0;
  }
  return (char)connection;
}

- (void)invalidate
{
  if ([(REHTTPConnection *)self isValid])
  {
    connection = self->_connection;
    MEMORY[0x270EE29C8](connection);
  }
}

- (BOOL)open
{
  BOOL v2 = [(REHTTPConnection *)self isValid];
  if (v2) {
    _CFHTTPServerConnectionSetDispatchQueue();
  }
  return v2;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__REHTTPConnection_stream_handleEvent___block_invoke;
  block[3] = &unk_2644BF9C0;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __39__REHTTPConnection_stream_handleEvent___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 == 2 || v3 == 16)
  {
    uint64_t v5 = [*(id *)(a1 + 40) read:v10 maxLength:1024];
    if (v5 < 1)
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      if (!v5)
      {
        [v8 _handleCompleteRequest:v2 stream:v7 error:0];
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    id v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v10 length:v5 freeWhenDone:0];
    [v2 appendData:v6];
  }
  else if (v3 == 8)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
LABEL_11:
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFF488] code:500 userInfo:0];
    [v8 _handleCompleteRequest:v2 stream:v7 error:v9];
  }
LABEL_12:
}

- (void)_handleCompleteRequest:(id)a3 stream:(id)a4 error:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x263EFF9F0];
  id v10 = a4;
  uint64_t v11 = [v9 mainRunLoop];
  [v10 removeFromRunLoop:v11 forMode:*MEMORY[0x263EFF478]];

  [v10 close];
  [(NSMapTable *)self->_pendingRequests removeObjectForKey:v10];

  if (a5)
  {
    objc_super v12 = [v8 responseWithStatusCode:500];
    [(REHTTPConnection *)self _sendResponse:v12];
  }
  else
  {
    objc_super v12 = [(REHTTPConnection *)self delegate];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke;
    v13[3] = &unk_2644BF9E8;
    v13[4] = self;
    [v12 connection:self didReceiveRequest:v8 completion:v13];
  }
}

void __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke_2;
  v7[3] = &unk_2644BC688;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendResponse:*(void *)(a1 + 40)];
}

- (void)_sendResponse:(id)a3
{
  pendingResponse = self->_pendingResponse;
  id v4 = a3;
  [(NSMutableArray *)pendingResponse addObject:v4];
  uint64_t v5 = [v4 response];

  MEMORY[0x270EE2A38](v5);
}

- (void)didRecieveRequest:(_CFHTTPServerRequest *)a3
{
  id v6 = [[REHTTPRequest alloc] initWithConnect:self request:a3];
  id v4 = [(REHTTPRequest *)v6 stream];
  [v4 setDelegate:self];
  [(NSMapTable *)self->_pendingRequests setObject:v6 forKey:v4];
  if ([v4 streamStatus] == 7)
  {
    [(REHTTPConnection *)self stream:v4 handleEvent:8];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v4 scheduleInRunLoop:v5 forMode:*MEMORY[0x263EFF478]];

    [v4 open];
  }
}

- (void)didCompleteResponse:(_CFHTTPServerResponse *)a3 error:(id)a4
{
  id v6 = a4;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  pendingResponse = self->_pendingResponse;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__REHTTPConnection_didCompleteResponse_error___block_invoke;
  v8[3] = &unk_2644BFA10;
  v8[4] = &v9;
  v8[5] = a3;
  [(NSMutableArray *)pendingResponse enumerateObjectsUsingBlock:v8];
  if (v10[3] != 0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingResponse, "removeObjectAtIndex:");
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __46__REHTTPConnection_didCompleteResponse_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 response];
  if (result == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (REHTTPConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REHTTPConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_CFHTTPServerConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingResponse, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end