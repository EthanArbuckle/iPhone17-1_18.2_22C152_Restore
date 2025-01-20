@interface WLSocketHandler
+ (id)_commandStringWithData:(id)a3;
+ (int)connectToHost:(id)a3 address:(hostent *)a4 port:(unsigned __int16)a5;
+ (void)lookupAndConnectToHost:(id)a3 port:(unsigned __int16)a4 completion:(id)a5;
+ (void)performDNSLookupForHost:(id)a3 completion:(id)a4;
- (BOOL)waitForCommand:(id)a3 fromReadCacheReturningError:(id *)a4;
- (WLSocketHandler)init;
- (char)readBytesFromSocket:(int)a3 maximumSize:(unint64_t)a4 bytesRead:(int64_t *)a5;
- (id)observeSocket:(int)a3 forSourceEventType:(dispatch_source_type_s *)a4 handler:(id)a5;
- (id)waitForBlobDataFromReadCacheReturningError:(id *)a3;
- (id)waitForDataFromReadCacheReturningError:(id *)a3;
- (id)waitForMessageFromReadCacheReturningError:(id *)a3;
- (void)_readIntoCacheFromSocket:(int)a3;
- (void)_writeBytes:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5 toSocket:(int)a6 completion:(id)a7;
- (void)beginReadingIntoCacheFromSocket:(int)a3;
- (void)cancel;
- (void)dealloc;
- (void)endReadingIntoCache;
- (void)sendCommand:(id)a3 toSocket:(int)a4 completion:(id)a5;
- (void)sendData:(id)a3 toSocket:(int)a4 completion:(id)a5;
- (void)writeBytes:(const void *)a3 length:(unint64_t)a4 toSocket:(int)a5 completion:(id)a6;
@end

@implementation WLSocketHandler

- (WLSocketHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)WLSocketHandler;
  v2 = [(WLSocketHandler *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Socket Read Serialization Queue", 0);
    readQueue = v2->_readQueue;
    v2->_readQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dataCache = v2->_dataCache;
    v2->_dataCache = v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    dataCacheSema = v2->_dataCacheSema;
    v2->_dataCacheSema = (OS_dispatch_semaphore *)v7;
  }
  return v2;
}

- (void)dealloc
{
  _WLLog();
  [(WLSocketHandler *)self endReadingIntoCache];
  v4.receiver = self;
  v4.super_class = (Class)WLSocketHandler;
  [(WLSocketHandler *)&v4 dealloc];
}

- (id)observeSocket:(int)a3 forSourceEventType:(dispatch_source_type_s *)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = dispatch_source_create(a4, a3, 0, MEMORY[0x263EF83A0]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__WLSocketHandler_observeSocket_forSourceEventType_handler___block_invoke;
  v11[3] = &unk_26490C758;
  id v12 = v7;
  int v13 = a3;
  id v9 = v7;
  dispatch_source_set_event_handler(v8, v11);
  dispatch_resume(v8);

  return v8;
}

uint64_t __60__WLSocketHandler_observeSocket_forSourceEventType_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned int *)(a1 + 40));
  }
  return result;
}

+ (void)performDNSLookupForHost:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, BOOL, hostent *))a4;
  id v8 = v5;
  id v7 = gethostbyname((const char *)[v8 UTF8String]);
  if (v7)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  _WLLog();
  if (v6) {
LABEL_3:
  }
    v6[2](v6, v7 != 0, v7);
LABEL_4:
}

+ (int)connectToHost:(id)a3 address:(hostent *)a4 port:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  *(void *)&v12.sa_len = 512;
  *(void *)&v12.sa_data[6] = 0;
  __memmove_chk();
  *(_WORD *)v12.sa_data = __rev16(v5);
  int v7 = socket(2, 1, 0);
  int v8 = v7;
  if (v7 == -1)
  {
    _WLLog();
  }
  else
  {
    int v11 = 1;
    setsockopt(v7, 0xFFFF, 4130, &v11, 4u);
    if (connect(v8, &v12, 0x10u) == -1)
    {
      id v9 = __error();
      strerror(*v9);
      _WLLog();
      int v8 = -1;
    }
  }

  return v8;
}

+ (void)lookupAndConnectToHost:(id)a3 port:(unsigned __int16)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__WLSocketHandler_lookupAndConnectToHost_port_completion___block_invoke;
  v12[3] = &unk_26490C780;
  id v14 = v9;
  id v15 = a1;
  unsigned __int16 v16 = a4;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  +[WLSocketHandler performDNSLookupForHost:v11 completion:v12];
}

void __58__WLSocketHandler_lookupAndConnectToHost_port_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  if (!a2)
  {
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 32);
    _WLLog();
    uint64_t v13 = *(void *)(a1 + 40);
    if (!v13) {
      return;
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F86308];
    uint64_t v25 = *MEMORY[0x263F08320];
    v26 = @"couldn't resolve host";
    unsigned __int16 v16 = NSDictionary;
    v17 = &v26;
    v18 = &v25;
LABEL_11:
    v19 = objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v21, v22, v23, v25, v26, v27, v28[0]);
    v20 = [v14 errorWithDomain:v15 code:1 userInfo:v19];
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 0xFFFFFFFFLL, v20);

    return;
  }
  v24 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 56)];
  _WLLog();

  LODWORD(a3) = +[WLSocketHandler connectToHost:address:port:](WLSocketHandler, "connectToHost:address:port:", *(void *)(a1 + 32), a3, *(unsigned __int16 *)(a1 + 56), v4, v5, v24);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 56)];
  id v10 = (void *)v9;
  if (a3 == -1)
  {
    uint64_t v22 = v8;
    uint64_t v23 = v9;
    uint64_t v21 = v7;
    _WLLog();

    uint64_t v13 = *(void *)(a1 + 40);
    if (!v13) {
      return;
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F86308];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28[0] = @"couldn't connect to host";
    unsigned __int16 v16 = NSDictionary;
    v17 = (__CFString **)v28;
    v18 = &v27;
    goto LABEL_11;
  }
  _WLLog();

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    sockaddr v12 = *(void (**)(void))(v11 + 16);
    v12();
  }
}

- (char)readBytesFromSocket:(int)a3 maximumSize:(unint64_t)a4 bytesRead:(int64_t *)a5
{
  uint64_t v15 = 0;
  unsigned __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  sockaddr v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  readQueue = self->_readQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__WLSocketHandler_readBytesFromSocket_maximumSize_bytesRead___block_invoke;
  v9[3] = &unk_26490C7A8;
  v9[5] = &v11;
  v9[6] = a4;
  int v10 = a3;
  v9[4] = &v15;
  dispatch_sync(readQueue, v9);
  if (a5) {
    *a5 = v16[3];
  }
  uint64_t v7 = (char *)v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

int64_t __61__WLSocketHandler_readBytesFromSocket_maximumSize_bytesRead___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  size_t v2 = *(void *)(a1 + 48);
  dispatch_queue_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = read(*(_DWORD *)(a1 + 56), v3, v2);
  int64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result >= 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = malloc_type_calloc(result, 1uLL, 0x440BB7D9uLL);
    return (int64_t)memcpy(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), v3, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  return result;
}

- (void)beginReadingIntoCacheFromSocket:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = self->_dataCache;
  objc_sync_enter(v5);
  dataCacheReadSource = self->_dataCacheReadSource;
  if (dataCacheReadSource)
  {
    dispatch_source_cancel(dataCacheReadSource);
    [(NSMutableArray *)self->_dataCache removeAllObjects];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__WLSocketHandler_beginReadingIntoCacheFromSocket___block_invoke;
  v9[3] = &unk_26490C7D0;
  v9[4] = self;
  uint64_t v7 = [(WLSocketHandler *)self observeSocket:v3 forSourceEventType:MEMORY[0x263EF83E8] handler:v9];
  uint64_t v8 = self->_dataCacheReadSource;
  self->_dataCacheReadSource = v7;

  objc_sync_exit(v5);
}

uint64_t __51__WLSocketHandler_beginReadingIntoCacheFromSocket___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _readIntoCacheFromSocket:a2];
}

- (void)_readIntoCacheFromSocket:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = self->_dataCache;
  objc_sync_enter(v5);
  uint64_t v11 = 0;
  id v6 = [(WLSocketHandler *)self readBytesFromSocket:v3 maximumSize:0x10000 bytesRead:&v11];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v8 = (void *)[v7 initWithBytesNoCopy:v6 length:v11 freeWhenDone:1];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"socket read got no bytes";
    int v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [v9 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v10];
  }
  [(NSMutableArray *)self->_dataCache addObject:v8];

  objc_sync_exit(v5);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataCacheSema);
}

- (void)endReadingIntoCache
{
  obj = self->_dataCache;
  objc_sync_enter(obj);
  dataCacheReadSource = self->_dataCacheReadSource;
  if (dataCacheReadSource)
  {
    dispatch_source_cancel(dataCacheReadSource);
    uint64_t v4 = self->_dataCacheReadSource;
    self->_dataCacheReadSource = 0;
  }
  [(NSMutableArray *)self->_dataCache removeAllObjects];
  objc_sync_exit(obj);
}

- (id)waitForDataFromReadCacheReturningError:(id *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataCacheSema, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v5 = self->_dataCache;
  objc_sync_enter(v5);
  id v6 = [(NSMutableArray *)self->_dataCache firstObject];
  if (v6)
  {
    [(NSMutableArray *)self->_dataCache removeObjectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      goto LABEL_9;
    }
    if (a3)
    {
      id v7 = 0;
      *a3 = v6;
      goto LABEL_9;
    }
  }
  else if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    v12[0] = @"read queue empty";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    *a3 = [v8 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v9];
  }
  id v7 = 0;
LABEL_9:

  objc_sync_exit(v5);
  return v7;
}

- (id)waitForBlobDataFromReadCacheReturningError:(id *)a3
{
  id v4 = 0;
  while (1)
  {
    id v19 = 0;
    uint64_t v5 = -[WLSocketHandler waitForDataFromReadCacheReturningError:](self, "waitForDataFromReadCacheReturningError:", &v19, v13, v15);
    id v6 = v19;
    id v7 = v6;
    if (!v4) {
      break;
    }
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    _WLLog();

    if (v7) {
      goto LABEL_9;
    }
    uint64_t v8 = objc_msgSend(v4, "mutableCopy", self, v17);
    [v8 appendData:v5];
    id v9 = v8;

    int v10 = NSNumber;
    uint64_t v11 = [v9 length];

    [v10 numberWithUnsignedInteger:v11];
    v16 = uint64_t v14 = self;
    _WLLog();

    id v4 = v9;
LABEL_7:
    if (objc_msgSend(v4, "wl_blobIsComplete", v14, v16)) {
      goto LABEL_12;
    }
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v15 = uint64_t v13 = self;
    _WLLog();
  }
  if (!v6)
  {
    id v4 = v5;
    goto LABEL_7;
  }
LABEL_9:
  if (a3) {
    *a3 = v7;
  }

  id v4 = 0;
LABEL_12:

  return v4;
}

- (BOOL)waitForCommand:(id)a3 fromReadCacheReturningError:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WLSocketHandler *)self waitForMessageFromReadCacheReturningError:a4];
  uint64_t v8 = v7;
  if (a4 && *a4 || !v7) {
    goto LABEL_9;
  }
  if ([v7 type] != 1)
  {
    [v8 type];
LABEL_9:
    _WLLog();
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  id v9 = [v8 command];
  char v10 = [v9 isEqualToString:v6];

  if ((v10 & 1) == 0)
  {
    uint64_t v13 = [v8 command];
    if (a4)
    {
      uint64_t v14 = [NSString stringWithFormat:@"expected '%@' but got '%@' instead", v6, v13];
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F86308];
      uint64_t v18 = *MEMORY[0x263F08320];
      v19[0] = v14;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a4 = [v15 errorWithDomain:v16 code:1 userInfo:v17];
    }
    _WLLog();

    goto LABEL_10;
  }
  BOOL v11 = 1;
  _WLLog();
LABEL_11:

  return v11;
}

- (id)waitForMessageFromReadCacheReturningError:(id *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = -[WLSocketHandler waitForDataFromReadCacheReturningError:](self, "waitForDataFromReadCacheReturningError:");
  if ([v4 length])
  {
    uint64_t v5 = +[WLSocketMessage messageWithData:v4 error:a3];
  }
  else
  {
    if (a3 && !*a3)
    {
      id v6 = [NSString stringWithFormat:@"expected data but got no data instead"];
      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F86308];
      uint64_t v11 = *MEMORY[0x263F08320];
      v12[0] = v6;
      id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *a3 = [v7 errorWithDomain:v8 code:1 userInfo:v9];
    }
    _WLLog();
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_commandStringWithData:(id)a3
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  id v9 = (void *)[v5 initWithBytesNoCopy:v7 length:v8 encoding:4 freeWhenDone:0];
  char v10 = [NSString stringWithFormat:@"\r\n"];
  LODWORD(v7) = [v9 hasSuffix:v10];

  if (v7)
  {
    uint64_t v11 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v9, "length") - 2, 2, &stru_26DF81F20);

    id v9 = (void *)v11;
  }
  return v9;
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4 toSocket:(int)a5 completion:(id)a6
{
}

- (void)_writeBytes:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5 toSocket:(int)a6 completion:(id)a7
{
  v30[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = (void (**)(id, uint64_t, void))a7;
  ssize_t v13 = write(a6, a3, a5);
  if (v13 == a5)
  {
    if (v12) {
      v12[2](v12, 1, 0);
    }
  }
  else if (v13 < 0)
  {
    if (v12)
    {
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F86308];
      uint64_t v29 = *MEMORY[0x263F08320];
      v30[0] = @"Socket write failed";
      id v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
      v20 = [v17 errorWithDomain:v18 code:1 userInfo:v19];
      ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v20);
    }
  }
  else
  {
    unint64_t v14 = v13 + a4;
    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x263EF8418], a6, 0, MEMORY[0x263EF83A0]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__WLSocketHandler__writeBytes_offset_length_toSocket_completion___block_invoke;
    v21[3] = &unk_26490C7F8;
    dispatch_source_t v22 = v15;
    uint64_t v23 = self;
    uint64_t v25 = a3;
    unint64_t v26 = v14;
    unint64_t v27 = a5;
    int v28 = a6;
    v24 = v12;
    uint64_t v16 = v15;
    dispatch_source_set_event_handler(v16, v21);
    dispatch_resume(v16);
  }
}

uint64_t __65__WLSocketHandler__writeBytes_offset_length_toSocket_completion___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(unsigned int *)(a1 + 80);
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  return [v6 _writeBytes:v2 offset:v3 length:v4 toSocket:v5 completion:v7];
}

- (void)sendCommand:(id)a3 toSocket:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = [NSString stringWithFormat:@"%@\r\n", a3];
  id v10 = [v9 dataUsingEncoding:4];
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__WLSocketHandler_sendCommand_toSocket_completion___block_invoke;
  v14[3] = &unk_26490C038;
  id v15 = v8;
  id v13 = v8;
  [(WLSocketHandler *)self writeBytes:v11 length:v12 toSocket:v5 completion:v14];
}

uint64_t __51__WLSocketHandler_sendCommand_toSocket_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)sendData:(id)a3 toSocket:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 bytes];
  uint64_t v11 = [v9 length];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __48__WLSocketHandler_sendData_toSocket_completion___block_invoke;
  v13[3] = &unk_26490C820;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(WLSocketHandler *)self writeBytes:v10 length:v11 toSocket:v5 completion:v13];
}

void __48__WLSocketHandler_sendData_toSocket_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    id v5 = v7;
  }
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "endReadingIntoCache", v5);
    id v5 = v7;
  }
}

- (void)cancel
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_dataCache;
  objc_sync_enter(v3);
  [(NSMutableArray *)self->_dataCache removeAllObjects];
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"SocketHandler is canceled.";
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v6 = [v4 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v5];

  [(NSMutableArray *)self->_dataCache addObject:v6];
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataCacheSema);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCacheSema, 0);
  objc_storeStrong((id *)&self->_dataCacheReadSource, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
}

@end