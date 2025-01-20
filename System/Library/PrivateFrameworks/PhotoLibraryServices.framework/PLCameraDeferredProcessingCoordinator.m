@interface PLCameraDeferredProcessingCoordinator
- (BOOL)cancelAllPrewarming:(id *)a3;
- (BOOL)prewarmWithPhotoSettings:(id)a3 error:(id *)a4;
- (PLAssetsdResourceInternalClient)resourceInternalClient;
- (PLCameraDeferredProcessingCoordinator)init;
- (PLCameraDeferredProcessingCoordinator)initWithAssetdClient:(id)a3;
- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3;
- (void)prewarmWithPhotoSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation PLCameraDeferredProcessingCoordinator

- (PLCameraDeferredProcessingCoordinator)init
{
  v3 = [MEMORY[0x1E4F8B868] sharedSystemLibraryAssetsdClient];
  v4 = [(PLCameraDeferredProcessingCoordinator *)self initWithAssetdClient:v3];

  return v4;
}

- (PLCameraDeferredProcessingCoordinator)initWithAssetdClient:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLCameraDeferredProcessingCoordinator;
  v6 = [(PLCameraDeferredProcessingCoordinator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetsdClient, a3);
    v8 = v7;
  }

  return v7;
}

- (void)prewarmWithPhotoSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = +[PLCapturePhotoSettings photoSettingsWithPhotoSettings:a3];
  v8 = [(PLCameraDeferredProcessingCoordinator *)self resourceInternalClient];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PLCameraDeferredProcessingCoordinator_prewarmWithPhotoSettings_completionHandler___block_invoke;
  v10[3] = &unk_1E5874DE8;
  id v11 = v6;
  id v9 = v6;
  [v8 prewarmWithCapturePhotoSettings:v7 completionHandler:v10];
}

- (PLAssetsdResourceInternalClient)resourceInternalClient
{
  return (PLAssetsdResourceInternalClient *)[(PLAssetsdClient *)self->_assetsdClient resourceInternalClient];
}

- (void).cxx_destruct
{
}

- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PLCameraDeferredProcessingCoordinator *)self resourceInternalClient];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PLCameraDeferredProcessingCoordinator_cancelAllPrewarmingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5874DE8;
  id v8 = v4;
  id v6 = v4;
  [v5 cancelAllPrewarmingWithCompletionHandler:v7];
}

uint64_t __82__PLCameraDeferredProcessingCoordinator_cancelAllPrewarmingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)cancelAllPrewarming:(id *)a3
{
  id v4 = [(PLCameraDeferredProcessingCoordinator *)self resourceInternalClient];
  LOBYTE(a3) = [v4 cancelAllPrewarming:a3];

  return (char)a3;
}

uint64_t __84__PLCameraDeferredProcessingCoordinator_prewarmWithPhotoSettings_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)prewarmWithPhotoSettings:(id)a3 error:(id *)a4
{
  id v6 = +[PLCapturePhotoSettings photoSettingsWithPhotoSettings:a3];
  v7 = [(PLCameraDeferredProcessingCoordinator *)self resourceInternalClient];
  LOBYTE(a4) = [v7 prewarmWithCapturePhotoSettings:v6 error:a4];

  return (char)a4;
}

@end