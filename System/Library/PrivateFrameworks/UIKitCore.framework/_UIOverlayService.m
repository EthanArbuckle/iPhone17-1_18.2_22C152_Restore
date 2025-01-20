@interface _UIOverlayService
- (BSServiceConnectionClient)serviceConnection;
- (OS_dispatch_queue)connectionQueue;
- (_UIOverlayService)init;
- (_UIOverlayServiceDelegate)delegate;
- (void)_asyncTargetWithHandler:(id)a3;
- (void)_makeConnectionIfNecessaryWithConnectionHandler:(id)a3;
- (void)dealloc;
- (void)performOverlayClientAction:(id)a3;
- (void)prewarmConnection;
- (void)sendOverlayAction:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServiceConnection:(id)a3;
@end

@implementation _UIOverlayService

- (_UIOverlayService)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIOverlayService;
  v2 = [(_UIOverlayService *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.uikit.uioverlayservice.connectionQueue", v3);
    [(_UIOverlayService *)v2 setConnectionQueue:v4];
  }
  return v2;
}

- (void)dealloc
{
  [(BSServiceConnectionClient *)self->_serviceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIOverlayService;
  [(_UIOverlayService *)&v3 dealloc];
}

- (void)_makeConnectionIfNecessaryWithConnectionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(_UIOverlayService *)self connectionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke;
  v7[3] = &unk_1E52FD268;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_asyncTargetWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45___UIOverlayService__asyncTargetWithHandler___block_invoke;
  v6[3] = &unk_1E5310340;
  id v7 = v4;
  id v5 = v4;
  [(_UIOverlayService *)self _makeConnectionIfNecessaryWithConnectionHandler:v6];
}

- (void)prewarmConnection
{
}

- (void)sendOverlayAction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39___UIOverlayService_sendOverlayAction___block_invoke;
  v6[3] = &unk_1E52FDC70;
  id v7 = v4;
  id v5 = v4;
  [(_UIOverlayService *)self _asyncTargetWithHandler:v6];
}

- (void)performOverlayClientAction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___UIOverlayService_performOverlayClientAction___block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (_UIOverlayServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIOverlayServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (BSServiceConnectionClient)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end