@interface SSHTTPServer
+ (BOOL)_isPortOccupied:(signed __int16)a3;
+ (id)sharedServer;
- (BOOL)allowsSecure;
- (BOOL)start;
- (BOOL)verbose;
- (SSHTTPServer)init;
- (id)_ipAddress;
- (id)responseBlockForPath:(id)a3;
- (id)serverLocalhostURL;
- (id)serverURL;
- (int)downloadSpeed;
- (int)state;
- (int64_t)responsesDelivered;
- (signed)port;
- (void)_handleConnectWithType:(unint64_t)a3 handle:(int)a4;
- (void)dealloc;
- (void)requestDidFinish:(id)a3;
- (void)setDownloadSpeed:(int)a3;
- (void)setPort:(signed __int16)a3;
- (void)setResponseForPath:(id)a3 handler:(id)a4;
- (void)setVerbose:(BOOL)a3;
- (void)stop;
@end

@implementation SSHTTPServer

- (SSHTTPServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSHTTPServer;
  v2 = [(SSHTTPServer *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowsSecure = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    definedResponses = v3->_definedResponses;
    v3->_definedResponses = v4;

    v3->_downloadSpeed = 0;
    v3->_port = 8080;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.StoreServices.HTTPServer", 0);
    propertyQueue = v3->_propertyQueue;
    v3->_propertyQueue = (OS_dispatch_queue *)v6;

    v3->_state = 1;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    incomingRequests = v3->_incomingRequests;
    v3->_incomingRequests = v8;
  }
  return v3;
}

- (void)dealloc
{
  [(SSHTTPServer *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SSHTTPServer;
  [(SSHTTPServer *)&v3 dealloc];
}

- (signed)port
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  __int16 v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__SSHTTPServer_port__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  signed __int16 v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__SSHTTPServer_port__block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_WORD *)(*(void *)(result + 32) + 50);
  return result;
}

- (int64_t)responsesDelivered
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSHTTPServer_responsesDelivered__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSHTTPServer_responsesDelivered__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 64);
  return result;
}

- (void)setPort:(signed __int16)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__SSHTTPServer_setPort___block_invoke;
  v4[3] = &unk_1E5BA6F58;
  v4[4] = self;
  signed __int16 v5 = a3;
  dispatch_sync(propertyQueue, v4);
}

void __24__SSHTTPServer_setPort___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 56) == 1)
  {
    *(_WORD *)(v1 + 50) = *(_WORD *)(a1 + 40);
    return;
  }
  v2 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  signed __int16 v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_13;
  }
  LODWORD(v15) = 138543362;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    signed __int16 v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v15, v14, v15);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_13:
  }
}

- (int)state
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__SSHTTPServer_state__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__SSHTTPServer_state__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 56);
  return result;
}

- (id)responseBlockForPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSHTTPServer_responseBlockForPath___block_invoke;
  block[3] = &unk_1E5BA6F80;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(propertyQueue, block);
  v7 = (void *)MEMORY[0x1A6268200](v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __37__SSHTTPServer_responseBlockForPath___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)sharedServer
{
  if (sharedServer_onceToken != -1) {
    dispatch_once(&sharedServer_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)sharedServer_instance;
  return v2;
}

void __28__SSHTTPServer_sharedServer__block_invoke()
{
  v0 = objc_alloc_init(SSHTTPServer);
  uint64_t v1 = (void *)sharedServer_instance;
  sharedServer_instance = (uint64_t)v0;
}

- (id)serverURL
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__SSHTTPServer_serverURL__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__SSHTTPServer_serverURL__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 48)) {
    uint64_t v2 = @"https://";
  }
  else {
    uint64_t v2 = @"http://";
  }
  int v9 = v2;
  id v3 = [*(id *)(a1 + 32) _ipAddress];
  if ([(__CFString *)v3 isEqualToString:@"error"])
  {

    id v3 = @"localhost";
  }
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  signed __int16 v5 = [NSString stringWithFormat:@"%@%@:%d", v9, v3, *(__int16 *)(*(void *)(a1 + 32) + 50)];
  uint64_t v6 = [v4 URLWithString:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)serverLocalhostURL
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSHTTPServer_serverLocalhostURL__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__SSHTTPServer_serverLocalhostURL__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48)) {
    id v3 = @"https://";
  }
  else {
    id v3 = @"http://";
  }
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [NSString stringWithFormat:@"%@localhost:%d", v3, *(__int16 *)(v2 + 50)];
  uint64_t v5 = [v4 URLWithString:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setResponseForPath:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SSHTTPServer_setResponseForPath_handler___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(propertyQueue, block);
}

void __43__SSHTTPServer_setResponseForPath_handler___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)start
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__SSHTTPServer_start__block_invoke;
  block[3] = &unk_1E5BA6FC8;
  block[4] = self;
  void block[5] = &v22;
  dispatch_sync(propertyQueue, block);
  id v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  int v6 = [v4 shouldLogToDisk];
  id v7 = [v4 OSLogObject];
  id v8 = v7;
  if (v6) {
    v5 |= 2u;
  }
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_10;
  }
  id v9 = objc_opt_class();
  int v26 = 138543362;
  v27 = v9;
  id v10 = v9;
  LODWORD(v20) = 12;
  id v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v26, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v8);
LABEL_10:
  }
  char v18 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v18;
}

void __21__SSHTTPServer_start__block_invoke(uint64_t a1)
{
  *(void *)&v36[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56) != 1)
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (!v15) {
      goto LABEL_33;
    }
LABEL_30:
    *(_DWORD *)bytes = 138543362;
    *(void *)v36 = objc_opt_class();
    id v13 = *(id *)v36;
    LODWORD(v29) = 12;
    uint64_t v28 = bytes;
    goto LABEL_31;
  }
  *(_DWORD *)(v2 + 56) = 2;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *(void *)(*(void *)(a1 + 32) + 32) = CFSocketCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, 1, 6, 2uLL, (CFSocketCallBack)handleConnect, 0);
  id v4 = *(__CFSocket **)(*(void *)(a1 + 32) + 32);
  if (!v4)
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v16 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (!v17) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  int v32 = 1;
  CFSocketNativeHandle Native = CFSocketGetNative(v4);
  setsockopt(Native, 0xFFFF, 4, &v32, 4u);
  *(void *)&v36[1] = 0;
  *(_WORD *)bytes = 528;
  *(_WORD *)&bytes[2] = bswap32(*(unsigned __int16 *)(*(void *)(a1 + 32) + 50)) >> 16;
  v36[0] = 0;
  CFDataRef v6 = CFDataCreate(v3, bytes, 16);
  int v7 = CFSocketSetAddress(*(CFSocketRef *)(*(void *)(a1 + 32) + 32), v6);
  CFRelease(v6);
  if (v7)
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_33;
    }
    uint64_t v12 = objc_opt_class();
    int v33 = 138543362;
    v34 = v12;
    id v13 = v12;
    LODWORD(v29) = 12;
    uint64_t v28 = (UInt8 *)&v33;
LABEL_31:
    char v18 = (void *)_os_log_send_and_compose_impl();

    if (!v18)
    {
LABEL_34:

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, v28, v29);
    free(v18);
    SSFileLog(v8, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v11);
LABEL_33:

    goto LABEL_34;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 3;
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  int v26 = (void *)MEMORY[0x1E4F29060];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __21__SSHTTPServer_start__block_invoke_31;
  v30[3] = &unk_1E5BA7018;
  v30[4] = *(void *)(a1 + 32);
  dispatch_semaphore_t v31 = v25;
  v27 = v25;
  [v26 detachNewThreadWithBlock:v30];
  dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
}

void __21__SSHTTPServer_start__block_invoke_31(uint64_t a1)
{
  RunLoopSource = CFSocketCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFSocketRef *)(*(void *)(a1 + 32) + 32), 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  uint64_t v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  uint64_t v5 = *(void *)(a1 + 32);
  CFDataRef v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  uint64_t v7 = *MEMORY[0x1E4F1C3A0];
  do
  {
    if ([*(id *)(a1 + 32) state] != 3) {
      break;
    }
    id v8 = *(void **)(*(void *)(a1 + 32) + 40);
    int v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
    LOBYTE(v8) = [v8 runMode:v7 beforeDate:v9];
  }
  while ((v8 & 1) != 0);
}

- (void)stop
{
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__SSHTTPServer_stop__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_sync(propertyQueue, block);
}

void __20__SSHTTPServer_stop__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 4;
  uint64_t v2 = *(void *)(a1 + 32);
  CFAllocatorRef v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v9 setDelegate:0];
        [v9 close];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  int v10 = *(__CFSocket **)(*(void *)(a1 + 32) + 32);
  if (v10)
  {
    CFSocketInvalidate(v10);
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 32));
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  id v11 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v11)
  {
    id v11 = +[SSLogConfig sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  int v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_20;
  }
  int v15 = objc_opt_class();
  int v29 = 138543362;
  v30 = v15;
  id v16 = v15;
  LODWORD(v24) = 12;
  int v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    int v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v29, v24, (void)v25);
    free(v17);
    SSFileLog(v11, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
LABEL_20:
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 1;
}

- (void)_handleConnectWithType:(unint64_t)a3 handle:(int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    CFWriteStreamRef writeStream = 0;
    CFReadStreamRef readStream = 0;
    CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, &readStream, &writeStream);
    if (readStream) {
      BOOL v5 = writeStream == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      CFReadStreamRef v22 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v22)
      {
        CFReadStreamRef v22 = +[SSLogConfig sharedConfig];
      }
      int v6 = [(__CFReadStream *)v22 shouldLog];
      if ([(__CFReadStream *)v22 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      uint64_t v21 = [(__CFReadStream *)v22 OSLogObject];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        v7 &= 2u;
      }
      if (v7)
      {
        id v8 = objc_opt_class();
        int v30 = 138543362;
        dispatch_semaphore_t v31 = v8;
        id v9 = v8;
        LODWORD(v23) = 12;
        int v10 = (void *)_os_log_send_and_compose_impl();

        if (!v10)
        {
LABEL_18:

          return;
        }
        uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v30, v23);
        free(v10);
        SSFileLog(v22, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v21);
      }
    }
    else
    {
      CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F1D480];
      uint64_t v18 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFReadStreamSetProperty(readStream, (CFStreamPropertyKey)*MEMORY[0x1E4F1D480], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
      CFWriteStreamSetProperty(writeStream, v17, v18);
      CFReadStreamRef v19 = readStream;
      propertyQueue = self->_propertyQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__SSHTTPServer__handleConnectWithType_handle___block_invoke;
      block[3] = &unk_1E5BA7068;
      CFReadStreamRef v25 = readStream;
      CFWriteStreamRef v26 = writeStream;
      long long v27 = self;
      uint64_t v21 = writeStream;
      CFReadStreamRef v22 = v19;
      dispatch_sync(propertyQueue, block);
    }
    goto LABEL_18;
  }
}

void __46__SSHTTPServer__handleConnectWithType_handle___block_invoke(void *a1)
{
  uint64_t v2 = [[SSHTTPServerRequestHandler alloc] initWithReadStream:a1[4] writeStream:a1[5] runLoop:*(void *)(a1[6] + 40)];
  [(SSHTTPServerRequestHandler *)v2 setDelegate:a1[6]];
  [(SSHTTPServerRequestHandler *)v2 setDownloadSpeed:*(unsigned int *)(a1[6] + 52)];
  [*(id *)(a1[6] + 16) addObject:v2];
}

- (void)requestDidFinish:(id)a3
{
  id v4 = a3;
  propertyQueue = self->_propertyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SSHTTPServer_requestDidFinish___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(propertyQueue, v7);
}

uint64_t __33__SSHTTPServer_requestDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (id)_ipAddress
{
  int v10 = 0;
  int v2 = getifaddrs(&v10);
  CFAllocatorRef v3 = v10;
  id v4 = @"error";
  if (!v2 && v10)
  {
    do
    {
      if (v3->ifa_addr->sa_family == 2)
      {
        BOOL v5 = [NSString stringWithUTF8String:v3->ifa_name];
        int v6 = [v5 isEqualToString:@"en0"];

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v3->ifa_addr->sa_data[2];
          uint64_t v8 = [NSString stringWithUTF8String:inet_ntoa(v7)];

          id v4 = (__CFString *)v8;
        }
      }
      CFAllocatorRef v3 = v3->ifa_next;
    }
    while (v3);
    CFAllocatorRef v3 = v10;
  }
  MEMORY[0x1A6267DD0](v3);
  return v4;
}

+ (BOOL)_isPortOccupied:(signed __int16)a3
{
  unsigned int v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = CFSocketCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, 1, 6, 0, 0, 0);
  if (!v4) {
    return 0;
  }
  BOOL v5 = v4;
  int v10 = 1;
  CFSocketNativeHandle Native = CFSocketGetNative(v4);
  if (setsockopt(Native, 0xFFFF, 4, &v10, 4u))
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    *(_WORD *)bytes = 528;
    __int16 v13 = 0;
    unsigned int v12 = bswap32(v3) >> 16;
    CFDataRef v8 = CFDataCreate(0, bytes, 16);
    BOOL v7 = CFSocketSetAddress(v5, v8) != kCFSocketSuccess;
    CFRelease(v8);
  }
  CFSocketInvalidate(v5);
  CFRelease(v5);
  return v7;
}

- (BOOL)allowsSecure
{
  return self->_allowsSecure;
}

- (int)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(int)a3
{
  self->_downloadSpeed = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_incomingRequests, 0);
  objc_storeStrong((id *)&self->_definedResponses, 0);
}

@end