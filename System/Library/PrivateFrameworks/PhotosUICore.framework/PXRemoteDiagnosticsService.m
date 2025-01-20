@interface PXRemoteDiagnosticsService
+ (void)startServerOnInternalDevicesWithAgentClass:(Class)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PXDiagnosticsAgent)agent;
- (PXRemoteDiagnosticsService)init;
- (void)_startListening;
- (void)setAgent:(id)a3;
@end

@implementation PXRemoteDiagnosticsService

void __45__PXRemoteDiagnosticsService__startListening__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = [MEMORY[0x1E4F29290] anonymousListener];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) endpoint];
    v6 = [v5 _endpoint];
    v7 = [*(id *)(a1 + 32) agent];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) agent];
      [v9 assetsdClient];
    }
    else
    {
      v9 = [MEMORY[0x1E4F8B980] systemLibraryURL];
      [MEMORY[0x1E4F8AA90] sharedAssetsdClientForPhotoLibraryURL:v9];
    v10 = };

    v11 = [v10 diagnosticsClient];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__PXRemoteDiagnosticsService__startListening__block_invoke_2;
    v12[3] = &unk_1E5DD3158;
    v12[4] = *(void *)(a1 + 32);
    [v11 setPhotosXPCEndpoint:v6 completionHandler:v12];
  }
}

- (PXDiagnosticsAgent)agent
{
  return self->_agent;
}

uint64_t __73__PXRemoteDiagnosticsService_startServerOnInternalDevicesWithAgentClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PXRemoteDiagnosticsService);
  uint64_t v3 = (void *)startServerOnInternalDevicesWithAgentClass__service;
  startServerOnInternalDevicesWithAgentClass__service = (uint64_t)v2;

  v4 = [*(id *)(a1 + 32) localDiagnosticsAgent];
  [(id)startServerOnInternalDevicesWithAgentClass__service setAgent:v4];

  v5 = (void *)startServerOnInternalDevicesWithAgentClass__service;
  return [v5 _startListening];
}

void __45__PXRemoteDiagnosticsService__startListening__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Error setting photos XPC endpoint: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 8) resume];
}

- (void)setAgent:(id)a3
{
}

- (PXRemoteDiagnosticsService)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXRemoteDiagnosticsService;
  uint64_t v2 = [(PXRemoteDiagnosticsService *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photosuicore.diagnostics", 0);
    diagnosticsQueue = v2->_diagnosticsQueue;
    v2->_diagnosticsQueue = (OS_dispatch_queue *)v3;

    id v5 = v2;
  }

  return v2;
}

- (void)_startListening
{
  diagnosticsQueue = self->_diagnosticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PXRemoteDiagnosticsService__startListening__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(diagnosticsQueue, block);
}

+ (void)startServerOnInternalDevicesWithAgentClass:(Class)a3
{
  if (!+[PXApplicationState isRunningInPhotosApp])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"PXRemoteDiagnosticsService.m", 49, @"Invalid parameter not satisfying: %@", @"PXApplicationState.isRunningInPhotosApp" object file lineNumber description];
  }
  if (PFOSVariantHasInternalUI())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PXRemoteDiagnosticsService_startServerOnInternalDevicesWithAgentClass___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = a3;
    if (startServerOnInternalDevicesWithAgentClass__onceToken != -1) {
      dispatch_once(&startServerOnInternalDevicesWithAgentClass__onceToken, block);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_diagnosticsQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  objc_super v7 = [v5 interfaceWithProtocol:&unk_1F050E6B8];
  [v6 setExportedInterface:v7];

  id v8 = [(PXRemoteDiagnosticsService *)self agent];
  [v6 setExportedObject:v8];

  [v6 resume];
  return 1;
}

@end