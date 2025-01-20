@interface RMSTouchRemoteSocket
- (BOOL)sendTouchCode:(int64_t)a3 timeInMilliseconds:(unsigned int)a4 location:(CGPoint)a5;
- (RMSTouchRemoteSocket)initWithHost:(id)a3 port:(int)a4 encryptionKey:(int)a5;
- (RMSTouchRemoteSocketDelegate)delegate;
- (id)_encryptData:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)setDelegate:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation RMSTouchRemoteSocket

- (RMSTouchRemoteSocket)initWithHost:(id)a3 port:(int)a4 encryptionKey:(int)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMSTouchRemoteSocket;
  v10 = [(RMSTouchRemoteSocket *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_host, a3);
    v11->_port = a4;
    v11->_encryptionKey = a5;
  }

  return v11;
}

- (void)dealloc
{
  [(RMSTouchRemoteSocket *)self disconnect];
  v3.receiver = self;
  v3.super_class = (Class)RMSTouchRemoteSocket;
  [(RMSTouchRemoteSocket *)&v3 dealloc];
}

- (void)disconnect
{
  objc_super v3 = RMSLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23C83A000, v3, OS_LOG_TYPE_DEFAULT, "Closing socket", v7, 2u);
  }

  [(NSOutputStream *)self->_outputStream close];
  outputStream = self->_outputStream;
  v5 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [(NSOutputStream *)outputStream removeFromRunLoop:v5 forMode:*MEMORY[0x263EFF478]];

  v6 = self->_outputStream;
  self->_outputStream = 0;
}

- (void)connect
{
  CFWriteStreamRef writeStream = 0;
  CFStreamCreatePairWithSocketToHost(0, (CFStringRef)self->_host, self->_port, 0, &writeStream);
  outputStream = self->_outputStream;
  self->_outputStream = (NSOutputStream *)writeStream;

  [(NSOutputStream *)self->_outputStream setDelegate:self];
  v4 = self->_outputStream;
  v5 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [(NSOutputStream *)v4 scheduleInRunLoop:v5 forMode:*MEMORY[0x263EFF478]];

  [(NSOutputStream *)self->_outputStream open];
}

- (BOOL)sendTouchCode:(int64_t)a3 timeInMilliseconds:(unsigned int)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v7 = *(void *)&a4;
  unsigned int v8 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v10 = [MEMORY[0x263EFF980] array];
  v11 = [NSNumber numberWithUnsignedInt:v7];
  [v10 addObject:v11];

  v12 = [NSNumber numberWithUnsignedInt:1];
  [v10 addObject:v12];

  objc_super v13 = [NSNumber numberWithUnsignedInt:(int)y | ((int)x << 16)];
  [v10 addObject:v13];

  unsigned int v14 = [v10 count];
  int v15 = v14;
  if (v14 < 0x15)
  {
    uint64_t v18 = 4 * v14 + 20;
    v37[0] = bswap32(v18);
    v37[1] = 256;
    v37[2] = bswap32(v8);
    v37[3] = 0;
    v37[4] = bswap32(4 * v14);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      int v23 = 5;
      do
      {
        uint64_t v24 = 0;
        int v25 = v23;
        v26 = &v37[v23];
        do
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          v26[v24] = bswap32(objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v24), "intValue", (void)v32));
          ++v24;
        }
        while (v21 != v24);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
        int v23 = v25 + v24;
      }
      while (v21);
    }

    v27 = [MEMORY[0x263EFF8F8] dataWithBytes:v37 length:v18];
    v28 = [(RMSTouchRemoteSocket *)self _encryptData:v27];
    outputStream = self->_outputStream;
    id v30 = v28;
    BOOL v17 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v30 bytes], objc_msgSend(v30, "length")) != 0;
  }
  else
  {
    v16 = RMSLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[RMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](v15, v16);
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 == 8)
  {
    v10 = RMSLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RMSTouchRemoteSocket stream:handleEvent:](v7, v10);
    }

    [(RMSTouchRemoteSocket *)self disconnect];
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    unsigned int v8 = RMSLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "Touch remote socket opened", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained touchRemoteSocketDidConnect:self];
    goto LABEL_14;
  }
  if ([v6 streamStatus] == 6)
  {
    v11 = RMSLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "Touch remote socket closed", v12, 2u);
    }

LABEL_13:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained touchRemoteSocketDidDisconnect:self];
LABEL_14:
  }
}

- (id)_encryptData:(id)a3
{
  id v4 = a3;
  v5 = (int *)[v4 bytes];
  unsigned int v6 = [v4 length];
  uint64_t v7 = malloc_type_malloc([v4 length], 0xF93B5430uLL);
  unsigned int v8 = v7;
  if (v6 >= 4uLL)
  {
    uint64_t v9 = v6 >> 2;
    v10 = (unsigned int *)v7;
    do
    {
      int v11 = *v5++;
      *v10++ = self->_encryptionKey ^ v11;
      --v9;
    }
    while (v9);
  }
  v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v6];
  free(v8);

  return v12;
}

- (RMSTouchRemoteSocketDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSTouchRemoteSocketDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

- (void)sendTouchCode:(int)a1 timeInMilliseconds:(NSObject *)a2 location:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_23C83A000, a2, OS_LOG_TYPE_ERROR, "Touch remote socket attempted to write too much data: %u", (uint8_t *)v2, 8u);
}

- (void)stream:(void *)a1 handleEvent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 streamError];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_23C83A000, a2, OS_LOG_TYPE_ERROR, "Stream error: %@", (uint8_t *)&v4, 0xCu);
}

@end