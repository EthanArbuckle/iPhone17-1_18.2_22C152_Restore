@interface NDANFHelperProxy
- (NDANFHelperProxy)init;
- (NFUnfairLock)xpcConnectionLock;
- (NSXPCConnection)xpcConnection;
- (id)_connectionToXPCService;
- (id)manifestFromANFDocumentData:(id)a3;
- (id)manifestFromANFDocumentData:(id)a3 reachedService:(BOOL *)a4;
- (int64_t)xpcConnectionInterest;
- (void)dealloc;
- (void)popInterest;
- (void)pushInterest;
- (void)setXpcConnection:(id)a3;
- (void)setXpcConnectionInterest:(int64_t)a3;
- (void)setXpcConnectionLock:(id)a3;
@end

@implementation NDANFHelperProxy

- (NDANFHelperProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)NDANFHelperProxy;
  v2 = [(NDANFHelperProxy *)&v6 init];
  if (v2)
  {
    v3 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E4F81C18]);
    xpcConnectionLock = v2->_xpcConnectionLock;
    v2->_xpcConnectionLock = v3;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(NDANFHelperProxy *)self xpcConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)NDANFHelperProxy;
  [(NDANFHelperProxy *)&v4 dealloc];
}

- (id)manifestFromANFDocumentData:(id)a3 reachedService:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [(NDANFHelperProxy *)self pushInterest];
  v8 = [(NDANFHelperProxy *)self _connectionToXPCService];
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_5;
  v17[3] = &unk_1E6D3EA00;
  v19 = &v21;
  id v10 = v7;
  id v18 = v10;
  v20 = &v25;
  [v9 decodeANFDocumentData:v6 completion:v17];

  [(NDANFHelperProxy *)self popInterest];
  if (a4) {
    *a4 = *((unsigned char *)v22 + 24);
  }
  v11 = (void *)v26[5];
  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F7E1F0]);
    uint64_t v13 = [v12 initWithNonImageResourceIDs:MEMORY[0x1E4F1CBF0] optimalImageResourceIDs:MEMORY[0x1E4F1CBF0] smallestImageResourceIDs:MEMORY[0x1E4F1CBF0]];
    v14 = (void *)v26[5];
    v26[5] = v13;

    v11 = (void *)v26[5];
  }
  id v15 = v11;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = *MEMORY[0x1E4F7DDE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_ERROR)) {
    __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_5(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2;
    v14[3] = &unk_1E6D3E9D8;
    id v15 = v6;
    __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2((uint64_t)v14);
    v8 = v15;
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E4F7DDE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)a1[4];
      v11 = v9;
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = objc_msgSend(v10, "fc_millisecondTimeIntervalUntilNow");
      _os_log_impl(&dword_1E00ED000, v11, OS_LOG_TYPE_DEFAULT, "ANFDecoder returned manifest, time=%llums", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = v5;
    v8 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2(uint64_t a1)
{
  id v2 = *MEMORY[0x1E4F7DDE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_ERROR)) {
    __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2_cold_1(a1, v2);
  }
}

- (id)manifestFromANFDocumentData:(id)a3
{
  return [(NDANFHelperProxy *)self manifestFromANFDocumentData:a3 reachedService:0];
}

- (void)pushInterest
{
  v3 = [(NDANFHelperProxy *)self xpcConnectionLock];
  [v3 lock];

  [(NDANFHelperProxy *)self setXpcConnectionInterest:[(NDANFHelperProxy *)self xpcConnectionInterest] + 1];
  id v4 = [(NDANFHelperProxy *)self xpcConnectionLock];
  [v4 unlock];
}

- (void)popInterest
{
  v3 = [(NDANFHelperProxy *)self xpcConnectionLock];
  [v3 lock];

  [(NDANFHelperProxy *)self setXpcConnectionInterest:[(NDANFHelperProxy *)self xpcConnectionInterest] - 1];
  if (![(NDANFHelperProxy *)self xpcConnectionInterest])
  {
    id v4 = *MEMORY[0x1E4F7DDE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1E00ED000, v4, OS_LOG_TYPE_DEFAULT, "ANFDecoder will invalidate connection due to zero interest", v7, 2u);
    }
    id v5 = [(NDANFHelperProxy *)self xpcConnection];
    [v5 invalidate];

    [(NDANFHelperProxy *)self setXpcConnection:0];
  }
  id v6 = [(NDANFHelperProxy *)self xpcConnectionLock];
  [v6 unlock];
}

- (id)_connectionToXPCService
{
  v3 = [(NDANFHelperProxy *)self xpcConnectionLock];
  [v3 lock];

  id v4 = [(NDANFHelperProxy *)self xpcConnection];

  if (!v4)
  {
    id v5 = NDANFDecodingServiceXPCConnection();
    [(NDANFHelperProxy *)self setXpcConnection:v5];

    id v6 = [(NDANFHelperProxy *)self xpcConnection];
    [v6 setInvalidationHandler:&__block_literal_global_10];

    v7 = [(NDANFHelperProxy *)self xpcConnection];
    [v7 setInterruptionHandler:&__block_literal_global_13];

    v8 = [(NDANFHelperProxy *)self xpcConnection];
    [v8 activate];
  }
  v9 = [(NDANFHelperProxy *)self xpcConnection];
  id v10 = [(NDANFHelperProxy *)self xpcConnectionLock];
  [v10 unlock];

  return v9;
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke()
{
  v0 = *MEMORY[0x1E4F7DDE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_ERROR)) {
    __43__NDANFHelperProxy__connectionToXPCService__block_invoke_cold_1(v0);
  }
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke_11()
{
  v0 = *MEMORY[0x1E4F7DDE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_ERROR)) {
    __43__NDANFHelperProxy__connectionToXPCService__block_invoke_11_cold_1(v0);
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (int64_t)xpcConnectionInterest
{
  return self->_xpcConnectionInterest;
}

- (void)setXpcConnectionInterest:(int64_t)a3
{
  self->_xpcConnectionInterest = a3;
}

- (NFUnfairLock)xpcConnectionLock
{
  return self->_xpcConnectionLock;
}

- (void)setXpcConnectionLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionLock, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E00ED000, a2, OS_LOG_TYPE_ERROR, "ANFDecoder connection failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E00ED000, a2, OS_LOG_TYPE_ERROR, "ANFDecoder returned error: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E00ED000, log, OS_LOG_TYPE_ERROR, "ANFDecoder connection invalidated", v1, 2u);
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke_11_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E00ED000, log, OS_LOG_TYPE_ERROR, "ANFDecoder connection interrupted", v1, 2u);
}

@end