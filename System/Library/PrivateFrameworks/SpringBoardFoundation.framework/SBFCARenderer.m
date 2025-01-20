@interface SBFCARenderer
+ (BOOL)shouldUseXPCServiceForRendering;
+ (id)sharedInstance;
- (id)_remoteObjectProxy;
- (void)_createConnection;
- (void)warmup;
@end

@implementation SBFCARenderer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_25);
  }
  v2 = (void *)sharedInstance_renderer;
  return v2;
}

uint64_t __31__SBFCARenderer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBFCARenderer);
  uint64_t v1 = sharedInstance_renderer;
  sharedInstance_renderer = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_createConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.springboard.SBRendererService"];
  rendererServiceConnection = self->_rendererServiceConnection;
  self->_rendererServiceConnection = v3;

  [(NSXPCConnection *)self->_rendererServiceConnection setInterruptionHandler:&__block_literal_global_4_0];
  v5 = self->_rendererServiceConnection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SBFCARenderer__createConnection__block_invoke_5;
  v7[3] = &unk_1E548CA88;
  v7[4] = self;
  [(NSXPCConnection *)v5 setInvalidationHandler:v7];
  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED8E6010];
  [(NSXPCConnection *)self->_rendererServiceConnection setRemoteObjectInterface:v6];
  [(NSXPCConnection *)self->_rendererServiceConnection resume];
}

void __34__SBFCARenderer__createConnection__block_invoke()
{
  v0 = SBLogWallpaper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_18B52E000, v0, OS_LOG_TYPE_DEFAULT, "SBRendererService connection interrupted", v1, 2u);
  }
}

void __34__SBFCARenderer__createConnection__block_invoke_5(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBFCARenderer__createConnection__block_invoke_2;
  block[3] = &unk_1E548CA88;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v1 = SBLogWallpaper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_18B52E000, v1, OS_LOG_TYPE_DEFAULT, "SBRendererService connection invalidated", v2, 2u);
  }
}

void __34__SBFCARenderer__createConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (id)_remoteObjectProxy
{
  rendererServiceConnection = self->_rendererServiceConnection;
  if (!rendererServiceConnection)
  {
    [(SBFCARenderer *)self _createConnection];
    rendererServiceConnection = self->_rendererServiceConnection;
  }
  return [(NSXPCConnection *)rendererServiceConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_19_0];
}

void __35__SBFCARenderer__remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = SBLogWallpaper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, " SBRenderer's syncRemoteObjectProxy encountered an error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)warmup
{
  if (+[SBFCARenderer shouldUseXPCServiceForRendering])
  {
    v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__SBFCARenderer_warmup__block_invoke;
    block[3] = &unk_1E548CA88;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __23__SBFCARenderer_warmup__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObjectProxy];
  objc_msgSend(v1, "service_warmup:", &__block_literal_global_22_2);
}

void __23__SBFCARenderer_warmup__block_invoke_2()
{
  v0 = SBLogWallpaper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_18B52E000, v0, OS_LOG_TYPE_DEFAULT, "Renderer Service Launched successfully", v1, 2u);
  }
}

+ (BOOL)shouldUseXPCServiceForRendering
{
  id v2 = [MEMORY[0x1E4F42738] sharedApplication];
  char v3 = [v2 isFrontBoard];

  return v3;
}

- (void).cxx_destruct
{
}

@end