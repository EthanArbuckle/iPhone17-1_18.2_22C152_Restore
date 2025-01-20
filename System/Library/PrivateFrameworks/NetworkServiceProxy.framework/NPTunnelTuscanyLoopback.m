@interface NPTunnelTuscanyLoopback
- (BOOL)addNewFlow:(id)a3;
- (BOOL)selectBestEdge;
- (NPTunnelFlow)flow;
- (NPTunnelTuscanyLoopback)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 onRamp:(id)a7 delegate:(id)a8;
- (int64_t)currentMTU;
- (unint64_t)initialWindowSize;
- (unint64_t)maxFrameSize;
- (unsigned)dayPassSessionCounter;
- (void)cancelConnection;
- (void)createTuscanyClient;
- (void)dealloc;
- (void)pingWithCompletionHandler:(id)a3;
- (void)removeFlow:(unint64_t)a3;
- (void)setFlow:(id)a3;
- (void)setWindow:(void *)a3;
- (void)window;
- (void)write:(id)a3;
@end

@implementation NPTunnelTuscanyLoopback

- (NPTunnelTuscanyLoopback)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 onRamp:(id)a7 delegate:(id)a8
{
  v10.receiver = self;
  v10.super_class = (Class)NPTunnelTuscanyLoopback;
  v8 = [(NPTunnelTuscany *)&v10 initWithEndpoint:a3 parameters:a4 appRule:a5 flowProperties:a6 onRamp:a7 delegate:a8];
  if (v8)
  {
    [(NPTunnelTuscanyLoopback *)v8 initialWindowSize];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3 = [(NPTunnelTuscanyLoopback *)self window];
  if (v3) {
    MEMORY[0x1A622A8A0](v3, 0x1000C40451B5BE8);
  }
  v4.receiver = self;
  v4.super_class = (Class)NPTunnelTuscanyLoopback;
  [(NPTunnelTuscany *)&v4 dealloc];
}

- (void)createTuscanyClient
{
}

- (unsigned)dayPassSessionCounter
{
  return 1;
}

- (BOOL)addNewFlow:(id)a3
{
  id v4 = a3;
  [(NPTunnelTuscanyLoopback *)self setFlow:v4];
  v6.receiver = self;
  v6.super_class = (Class)NPTunnelTuscanyLoopback;
  LOBYTE(self) = [(NPTunnel *)&v6 addNewFlow:v4];

  return (char)self;
}

- (void)removeFlow:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPTunnelTuscanyLoopback;
  [(NPTunnel *)&v4 removeFlow:a3];
  [(NPTunnelTuscanyLoopback *)self setFlow:0];
}

- (unint64_t)maxFrameSize
{
  return 256;
}

- (int64_t)currentMTU
{
  return [(NPTunnelTuscanyLoopback *)self maxFrameSize] - 16;
}

- (BOOL)selectBestEdge
{
  return 0;
}

- (unint64_t)initialWindowSize
{
  return 1024;
}

- (void)write:(id)a3
{
  objc_super v4 = a3;
  uint64_t v5 = [v4 bytes];
  if ((unint64_t)[v4 length] <= 0x14) {
    __assert_rtn("tuscanyClientGetDataSize", "NPTuscanyClient.mm", 562, "dataLen > sizeof(Frame::Header)");
  }
  if (*(unsigned char *)(v5 + 18) == 1)
  {
    uint64_t v6 = *(unsigned __int16 *)(v5 + 16);
    uint64_t v7 = v6 - 24;
    if (v6 != 24)
    {
      v8 = [(NPTunnelTuscanyLoopback *)self window];
      if (v8)
      {
        int v9 = v8[1];
        int v10 = *v8 + v7;
        int v11 = v10 < v9 ? *v8 + v7 : 0;
        _DWORD *v8 = v11;
        if (v10 >= v9 && v10 >= 1)
        {
          v13 = [(NPTunnelTuscany *)self clientRef];
          v14 = [(NPTunnelTuscanyLoopback *)self flow];
          int v15 = [v14 identifier];
          if (v13) {
            FrameStream::acknowledge(v13, v15, v10, 1);
          }
        }
      }
      if (v7 == 4)
      {
        size_t size_ptr = 0;
        buffer_ptr = 0;
        dispatch_data_t v16 = dispatch_data_create_map(v4, (const void **)&buffer_ptr, &size_ptr);
        dispatch_data_t v17 = v16;
        if (v16 && buffer_ptr && size_ptr >= 5 && *(_DWORD *)((char *)buffer_ptr + size_ptr - 4) == 1701736292)
        {
          v18 = [(NPTunnelTuscany *)self clientRef];
          v19 = [(NPTunnelTuscanyLoopback *)self flow];
          tuscanyClientSendClose(v18, v19);

          goto LABEL_22;
        }
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)NPTunnelTuscanyLoopback;
  [(NPTunnel *)&v20 write:v4];
LABEL_22:
}

- (void)cancelConnection
{
  if ([(NPTunnel *)self connectionState] != 5)
  {
    [(NPTunnel *)self setConnectionState:5];
    v3 = [(NPTunnel *)self parameters];
    objc_super v4 = (void *)nw_parameters_copy_context();
    nw_queue_context_async();
  }
}

uint64_t __43__NPTunnelTuscanyLoopback_cancelConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) destroyConnection];
}

- (void)pingWithCompletionHandler:(id)a3
{
}

- (void)window
{
  return self->_window;
}

- (void)setWindow:(void *)a3
{
  self->_window = a3;
}

- (NPTunnelFlow)flow
{
  return (NPTunnelFlow *)objc_getProperty(self, a2, 304, 1);
}

- (void)setFlow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end