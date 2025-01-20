@interface PBUIWallpaperServer
- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forLocations:(id)a5;
- (BOOL)setWallpaperGradient:(id)a3 forLocations:(id)a4;
- (BOOL)setWallpaperImage:(id)a3 adjustedImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forLocations:(id)a8 currentWallpaperMode:(id)a9;
- (BOOL)setWallpaperWithVideo:(id)a3 sandboxToken:(id)a4 cropRect:(id)a5 wallpaperMode:(id)a6;
- (PBUIWallpaperServer)init;
- (PBUIWallpaperServerDelegate)delegate;
- (id)getWallpaperLegibilitySettingsForVariant:(id)a3;
- (id)getWallpaperOptionsForVariant:(id)a3;
- (void)_queue_addConnection:(id)a3;
- (void)_queue_removeConnection:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeWallpaperVideo;
- (void)restoreDefaultWallpaper;
- (void)setDelegate:(id)a3;
- (void)setProceduralWallpaperIdentifier:(id)a3 options:(id)a4 locations:(id)a5;
@end

@implementation PBUIWallpaperServer

- (PBUIWallpaperServer)init
{
  v16.receiver = self;
  v16.super_class = (Class)PBUIWallpaperServer;
  v2 = [(PBUIWallpaperServer *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.paperboard.wallpaper-access" additionalCredentials:2];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.PaperBoard.WallpaperServer.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E4F50BC8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __27__PBUIWallpaperServer_init__block_invoke;
    v14[3] = &unk_1E62B43F0;
    v8 = v2;
    v15 = v8;
    uint64_t v9 = [v7 listenerWithConfigurator:v14];
    connectionListener = v8->_connectionListener;
    v8->_connectionListener = (BSServiceConnectionListener *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    connections = v8->_connections;
    v8->_connections = (NSMutableArray *)v11;
  }
  return v2;
}

void __27__PBUIWallpaperServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.paperboard"];
  uint64_t v3 = +[PBUIWallpaperServiceInterfaceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = PBUILogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_INFO, "PBUIWallpaperServer received connection: %{public}@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke;
  v15[3] = &unk_1E62B4440;
  v15[4] = self;
  [v6 configureConnection:v15];
  clientAuthenticator = self->_clientAuthenticator;
  uint64_t v9 = [v6 remoteProcess];
  v10 = [v9 auditToken];
  LODWORD(clientAuthenticator) = [(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v10];

  if (clientAuthenticator)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_8;
    block[3] = &unk_1E62B2C38;
    block[4] = self;
    id v12 = v6;
    id v14 = v12;
    dispatch_async(queue, block);
    [v12 activate];
  }
  else
  {
    [v6 invalidate];
  }
}

void __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PBUIWallpaperServiceInterfaceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  dispatch_queue_t v5 = +[PBUIWallpaperServiceInterfaceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E62B4418;
  v6[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
}

void __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PBUILogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1BC4B3000, v4, OS_LOG_TYPE_INFO, "PBUIWallpaperServer received connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __65__PBUIWallpaperServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(void *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections addObject:v4];
}

- (void)_queue_removeConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_INFO, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections removeObject:v4];
}

- (void)activate
{
}

- (BOOL)setWallpaperImage:(id)a3 adjustedImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forLocations:(id)a8 currentWallpaperMode:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [(PBUIWallpaperServer *)self delegate];
  char v24 = [v23 setWallpaperImage:v22 adjustedImage:v21 thumbnailData:v20 imageHashData:v19 wallpaperOptions:v18 forLocations:v17 currentWallpaperMode:v16];

  return v24;
}

- (void)setProceduralWallpaperIdentifier:(id)a3 options:(id)a4 locations:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PBUIWallpaperServer *)self delegate];
  [v11 setProceduralWallpaperIdentifier:v10 options:v9 locations:v8];
}

- (void)removeWallpaperVideo
{
  id v2 = [(PBUIWallpaperServer *)self delegate];
  [v2 removeWallpaperVideo];
}

- (BOOL)setWallpaperWithVideo:(id)a3 sandboxToken:(id)a4 cropRect:(id)a5 wallpaperMode:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(PBUIWallpaperServer *)self delegate];
  char v15 = [v14 setWallpaperWithVideo:v13 sandboxToken:v12 cropRect:v11 wallpaperMode:v10];

  return v15;
}

- (void)restoreDefaultWallpaper
{
  id v2 = [(PBUIWallpaperServer *)self delegate];
  [v2 restoreDefaultWallpaper];
}

- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forLocations:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PBUIWallpaperServer *)self delegate];
  char v12 = [v11 setWallpaperColor:v10 darkColor:v9 forLocations:v8];

  return v12;
}

- (BOOL)setWallpaperGradient:(id)a3 forLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PBUIWallpaperServer *)self delegate];
  char v9 = [v8 setWallpaperGradient:v7 forLocations:v6];

  return v9;
}

- (id)getWallpaperOptionsForVariant:(id)a3
{
  id v4 = a3;
  int v5 = [(PBUIWallpaperServer *)self delegate];
  id v6 = [v5 getWallpaperOptionsForVariant:v4];

  return v6;
}

- (id)getWallpaperLegibilitySettingsForVariant:(id)a3
{
  id v4 = a3;
  int v5 = [(PBUIWallpaperServer *)self delegate];
  id v6 = [v5 getWallpaperLegibilitySettingsForVariant:v4];

  return v6;
}

- (PBUIWallpaperServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIWallpaperServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

@end