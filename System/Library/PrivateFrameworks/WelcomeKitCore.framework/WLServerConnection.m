@interface WLServerConnection
- (BOOL)_isTerminated:(const char *)a3 length:(int64_t)a4;
- (WLServerConnection)init;
- (WLServerConnectionDelegate)delegate;
- (int)_listen:(int)a3;
- (void)_accept:(int)a3;
- (void)_read:(int)a3;
- (void)close;
- (void)dealloc;
- (void)listen:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WLServerConnection

- (WLServerConnection)init
{
  v9.receiver = self;
  v9.super_class = (Class)WLServerConnection;
  v2 = [(WLServerConnection *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_sockfd = -1;
    dispatch_queue_t v4 = dispatch_queue_create("WLServerConnection Connection Pool Queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    connections = v3->_connections;
    v3->_connections = v6;
  }
  return v3;
}

- (void)dealloc
{
  [(WLServerConnection *)self close];
  v3.receiver = self;
  v3.super_class = (Class)WLServerConnection;
  [(WLServerConnection *)&v3 dealloc];
}

- (void)listen:(int)a3
{
  if (self->_sockfd == -1)
  {
    int v4 = [(WLServerConnection *)self _listen:*(void *)&a3];
    if (v4 != -1)
    {
      int v5 = v4;
      self->_sockfd = v4;
      objc_initWeak(&location, self);
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__WLServerConnection_listen___block_invoke;
      block[3] = &unk_26490C3F8;
      objc_copyWeak(&v8, &location);
      int v9 = v5;
      dispatch_async(queue, block);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __29__WLServerConnection_listen___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accept:*(unsigned int *)(a1 + 40)];
}

- (void)close
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v3 = self->_connections;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v4 = self->_connections;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        close(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "intValue", (void)v9));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_connections removeAllObjects];
  objc_sync_exit(v3);

  int sockfd = self->_sockfd;
  if (sockfd != -1) {
    close(sockfd);
  }
}

- (int)_listen:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = socket(2, 1, 0);
  if (v4 == -1)
  {
    _WLLog();
  }
  else
  {
    _WLLog();
    *(void *)&v7.sa_len = 512;
    *(void *)&v7.sa_data[6] = 0;
    *(_DWORD *)v7.sa_data = bswap32(a3) >> 16;
    int v6 = 1;
    if (setsockopt(v4, 0xFFFF, 4, &v6, 4u) || bind(v4, &v7, 0x10u) || (_WLLog(), listen(v4, 5)))
    {
      _WLLog();
      return -1;
    }
  }
  return v4;
}

- (void)_accept:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  socklen_t v14 = 0;
  _WLLog();
  if (a3 != -1)
  {
    *(void *)&v15.sa_len = 0;
    *(void *)&v15.sa_data[6] = 0;
    socklen_t v14 = 16;
    for (uint64_t i = accept(a3, &v15, &v14); (i & 0x80000000) == 0; uint64_t i = accept(a3, &v15, &v14))
    {
      _WLLog();
      int v6 = dispatch_queue_create("WLServerConnection Connection Read Queue", 0);
      sockaddr v7 = self->_connections;
      objc_sync_enter(v7);
      connections = self->_connections;
      long long v9 = [NSNumber numberWithInt:i];
      [(NSMutableSet *)connections addObject:v9];

      objc_sync_exit(v7);
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __30__WLServerConnection__accept___block_invoke;
      block[3] = &unk_26490C3F8;
      objc_copyWeak(&v11, &location);
      int v12 = i;
      dispatch_async(v6, block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

      *(void *)&v15.sa_len = 0;
      *(void *)&v15.sa_data[6] = 0;
      socklen_t v14 = 16;
    }
    _WLLog();
  }
  _WLLog();
}

void __30__WLServerConnection__accept___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _read:*(unsigned int *)(a1 + 40)];
}

- (BOOL)_isTerminated:(const char *)a3 length:(int64_t)a4
{
  int v4 = a3[a4 - 1];
  if (a3[a4 - 1])
  {
    if (a4 < 4)
    {
      if (a4 < 2) {
        return 0;
      }
    }
    else if (a3[a4 - 4] == 13 && a3[a4 - 3] == 10 && v4 == 10 && a3[a4 - 2] == 13)
    {
      return 1;
    }
    if (v4 != 10 || a3[a4 - 2] != 13) {
      return 0;
    }
  }
  return 1;
}

- (void)_read:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v19[128] = *MEMORY[0x263EF8340];
  _WLLog();
  ssize_t v5 = read(v3, v19, 0x400uLL);
  if (v5 <= 0) {
    goto LABEL_20;
  }
  int v6 = 0;
  size_t v7 = 0;
  do
  {
    if (!v6 && [(WLServerConnection *)self _isTerminated:v19 length:v5])
    {
      uint64_t v8 = (void *)[[NSString alloc] initWithUTF8String:v19];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_delegate);
        [v10 connection:self didReceiveText:v8];
      }
LABEL_15:

      int v6 = 0;
      goto LABEL_17;
    }
    size_t v11 = v5 + v7;
    int v12 = (char *)malloc_type_malloc(v5 + v7 + 1, 0xEDEE1FE6uLL);
    strncpy(v12, v6, v7);
    v13 = (char *)v19;
    do
    {
      char v14 = *v13++;
      v12[v7++] = v14;
      --v5;
    }
    while (v5);
    v12[v11] = 0;
    if (v6) {
      free(v6);
    }
    if ([(WLServerConnection *)self _isTerminated:v12 length:v11])
    {
      uint64_t v8 = (void *)[[NSString alloc] initWithUTF8String:v12];
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        [v16 connection:self didReceiveText:v8];
      }
      free(v12);
      size_t v7 = 0;
      goto LABEL_15;
    }
    size_t v7 = v11;
    int v6 = v12;
LABEL_17:
    _WLLog();
    ssize_t v5 = read(v3, v19, 0x400uLL);
  }
  while (v5 > 0);
  if (v6) {
    free(v6);
  }
LABEL_20:
  _WLLog();
  close(v3);
  v17 = self->_connections;
  objc_sync_enter(v17);
  v18 = [NSNumber numberWithInt:v3];
  [(NSMutableSet *)self->_connections removeObject:v18];

  objc_sync_exit(v17);
}

- (WLServerConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WLServerConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end