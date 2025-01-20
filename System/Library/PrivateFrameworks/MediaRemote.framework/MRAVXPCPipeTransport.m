@interface MRAVXPCPipeTransport
- (BOOL)getInputStream:(id *)a3 outputStream:(id *)a4 userInfo:(id)a5;
- (BOOL)requiresCustomPairing;
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (MRAVOutputDevice)outputDevice;
- (MRAVXPCPipeTransport)initWithOutputDevice:(id)a3 pipeEndpoint:(id)a4;
- (NSString)description;
- (NSXPCListenerEndpoint)pipeEndpoint;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)uid;
- (int64_t)port;
- (void)_onQueue_resetStreams;
- (void)dealloc;
- (void)reset;
- (void)sendData:(id)a3;
- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation MRAVXPCPipeTransport

- (MRAVXPCPipeTransport)initWithOutputDevice:(id)a3 pipeEndpoint:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"MRAVXPCPipeTransport.m", 37, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"MRAVXPCPipeTransport.m", 38, @"Invalid parameter not satisfying: %@", @"pipeEndpoint" object file lineNumber description];

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)MRAVXPCPipeTransport;
  v11 = [(MRAVXPCPipeTransport *)&v35 init];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mediaremote.externalDeviceTransport/serialQueue", v12);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v11->_outputDevice, a3);
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v10];
    pipeConnection = v11->_pipeConnection;
    v11->_pipeConnection = (NSXPCConnection *)v15;

    objc_initWeak(&location, v11);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke;
    v31[3] = &unk_1E57D12A8;
    objc_copyWeak(&v33, &location);
    v17 = v11;
    v32 = v17;
    v18 = (void *)MEMORY[0x1997190F0](v31);
    v19 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE68B1F8];
    [(NSXPCConnection *)v11->_pipeConnection setRemoteObjectInterface:v19];
    [(NSXPCConnection *)v11->_pipeConnection setExportedInterface:v19];
    [(NSXPCConnection *)v11->_pipeConnection setExportedObject:v17];
    [(NSXPCConnection *)v11->_pipeConnection setInterruptionHandler:v18];
    [(NSXPCConnection *)v11->_pipeConnection setInvalidationHandler:v18];
    [(NSXPCConnection *)v11->_pipeConnection resume];
    v17->_useSystemAuthenticationPrompt = 1;
    if (!v17->_runLoop)
    {
      if (!v17->_runLoopThread)
      {
        v20 = (CURunLoopThread *)objc_alloc_init(getCURunLoopThreadClass());
        runLoopThread = v17->_runLoopThread;
        v17->_runLoopThread = v20;

        [(CURunLoopThread *)v17->_runLoopThread setDispatchQueue:v11->_serialQueue];
        [(CURunLoopThread *)v17->_runLoopThread activate];
      }
      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      v23 = v17->_runLoopThread;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke_2;
      v28[3] = &unk_1E57D0790;
      v29 = v17;
      v24 = v22;
      v30 = v24;
      [(CURunLoopThread *)v23 performBlock:v28];
      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) reset];
    id WeakRetained = v3;
  }
}

intptr_t __58__MRAVXPCPipeTransport_initWithOutputDevice_pipeEndpoint___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(void *)(v3 + 120) = v2;

  v5 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v5);
}

- (void)dealloc
{
  [(MRAVXPCPipeTransport *)self reset];
  [(CURunLoopThread *)self->_runLoopThread invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRAVXPCPipeTransport;
  [(MRAVXPCPipeTransport *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromMRAVEndpointConnectionType(self->super._connectionType);
  v6 = [v3 stringWithFormat:@"<%@: %p connectionType=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)deviceInfo
{
  return 0;
}

- (id)uid
{
  return [(MRAVOutputDevice *)self->_outputDevice uid];
}

- (id)name
{
  return [(MRAVOutputDevice *)self->_outputDevice name];
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVXPCPipeTransport_shouldUseSystemAuthenticationPrompt__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__MRAVXPCPipeTransport_shouldUseSystemAuthenticationPrompt__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 104);
  return result;
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MRAVXPCPipeTransport_setShouldUseSystemAuthenticationPrompt___block_invoke;
  v4[3] = &unk_1E57D1CB0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __63__MRAVXPCPipeTransport_setShouldUseSystemAuthenticationPrompt___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 104) = *(unsigned char *)(result + 40);
  return result;
}

- (id)error
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__MRAVXPCPipeTransport_error__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __29__MRAVXPCPipeTransport_error__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v8 = 0;
  id v9 = 0;
  BOOL v3 = [(MRAVXPCPipeTransport *)self getInputStream:&v9 outputStream:&v8 userInfo:a3];
  id v4 = v9;
  id v5 = v8;
  uint64_t v6 = 0;
  if (v3) {
    uint64_t v6 = [[MRStreamTransportConnection alloc] initWithInputStream:v4 outputStream:v5];
  }

  return v6;
}

- (BOOL)getInputStream:(id *)a3 outputStream:(id *)a4 userInfo:(id)a5
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  id v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__13;
  v12[4] = __Block_byref_object_dispose__13;
  id v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__13;
  v10[4] = __Block_byref_object_dispose__13;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRAVXPCPipeTransport_getInputStream_outputStream_userInfo___block_invoke;
  block[3] = &unk_1E57D3C50;
  block[4] = self;
  block[5] = &v20;
  block[6] = v10;
  block[7] = v12;
  block[8] = &v14;
  dispatch_sync(serialQueue, block);
  if (a3) {
    *a3 = (id) v21[5];
  }
  if (a4) {
    *a4 = (id) v15[5];
  }
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return 1;
}

void *__61__MRAVXPCPipeTransport_getInputStream_outputStream_userInfo___block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[4];
  if (!*(void *)(v2 + 72))
  {
    uint64_t v3 = *(void *)(result[5] + 8);
    id v4 = *(void **)(v3 + 40);
    uint64_t v5 = *(void *)(result[6] + 8);
    id v11 = *(id *)(v5 + 40);
    id obj = v4;
    [MEMORY[0x1E4F1CAE0] getBoundStreamsWithBufferSize:35840 inputStream:&obj outputStream:&v11];
    objc_storeStrong((id *)(v3 + 40), obj);
    objc_storeStrong((id *)(v5 + 40), v11);
    objc_storeStrong((id *)(v1[4] + 72), *(id *)(*(void *)(v1[5] + 8) + 40));
    objc_storeStrong((id *)(v1[4] + 96), *(id *)(*(void *)(v1[6] + 8) + 40));
    [*(id *)(v1[4] + 96) scheduleInRunLoop:*(void *)(v1[4] + 120) forMode:*MEMORY[0x1E4F1C4B0]];
    result = (void *)[*(id *)(v1[4] + 96) open];
    uint64_t v2 = v1[4];
  }
  if (!*(void *)(v2 + 88))
  {
    uint64_t v6 = *(void *)(v1[7] + 8);
    v7 = *(void **)(v6 + 40);
    uint64_t v8 = *(void *)(v1[8] + 8);
    id v9 = *(id *)(v8 + 40);
    id v10 = v7;
    [MEMORY[0x1E4F1CAE0] getBoundStreamsWithBufferSize:35840 inputStream:&v10 outputStream:&v9];
    objc_storeStrong((id *)(v6 + 40), v10);
    objc_storeStrong((id *)(v8 + 40), v9);
    objc_storeStrong((id *)(v1[4] + 80), *(id *)(*(void *)(v1[7] + 8) + 40));
    objc_storeStrong((id *)(v1[4] + 88), *(id *)(*(void *)(v1[8] + 8) + 40));
    objc_msgSend(*(id *)(v1[4] + 80), "setDelegate:");
    [*(id *)(v1[4] + 80) scheduleInRunLoop:*(void *)(v1[4] + 120) forMode:*MEMORY[0x1E4F1C4B0]];
    return (void *)[*(id *)(v1[4] + 80) open];
  }
  return result;
}

- (void)reset
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MRAVXPCPipeTransport_reset__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __29__MRAVXPCPipeTransport_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_resetStreams");
}

- (BOOL)requiresCustomPairing
{
  return 0;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a4 == 2 && self->_inputStreamInternal == a3)
  {
    uint64_t v5 = [a3 read:v8 maxLength:35840];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:v5];
      v7 = [(NSXPCConnection *)self->_pipeConnection remoteObjectProxy];
      [v7 sendData:v6];
    }
  }
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  runLoop = self->_runLoop;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__MRAVXPCPipeTransport_sendData___block_invoke;
  v7[3] = &unk_1E57D12A8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(NSRunLoop *)runLoop performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__MRAVXPCPipeTransport_sendData___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    objc_msgSend(WeakRetained[12], "write:maxLength:", objc_msgSend(*(id *)(a1 + 32), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));
    id WeakRetained = v3;
  }
}

- (void)_onQueue_resetStreams
{
  objc_initWeak(&location, self);
  runLoop = self->_runLoop;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MRAVXPCPipeTransport__onQueue_resetStreams__block_invoke;
  v4[3] = &unk_1E57D12D0;
  objc_copyWeak(&v5, &location);
  [(NSRunLoop *)runLoop performBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__MRAVXPCPipeTransport__onQueue_resetStreams__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    [WeakRetained[10] close];
    [v7[12] close];
    uint64_t v2 = *MEMORY[0x1E4F1C4B0];
    [v7[10] removeFromRunLoop:v7[15] forMode:*MEMORY[0x1E4F1C4B0]];
    [v7[12] removeFromRunLoop:v7[15] forMode:v2];
    id v3 = v7[9];
    v7[9] = 0;

    id v4 = v7[11];
    v7[11] = 0;

    id v5 = v7[10];
    v7[10] = 0;

    id v6 = v7[12];
    v7[12] = 0;

    id WeakRetained = v7;
  }
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (NSXPCListenerEndpoint)pipeEndpoint
{
  return self->_pipeEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeEndpoint, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
  objc_storeStrong((id *)&self->_runLoopThread, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_pipeConnection, 0);
  objc_storeStrong((id *)&self->_outputStreamInternal, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStreamInternal, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end