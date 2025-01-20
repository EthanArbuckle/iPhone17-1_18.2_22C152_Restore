@interface CLKUIMetalResourceManager
+ (MTLDevice)sharedDevice;
+ (MTLTexture)sharedNilTexture2D;
+ (MTLTexture)sharedNilTextureCube;
+ (id)sharedCommandQueue;
+ (void)addCompletedErrorCheckToCommandBuffer:(id)a3 forCase:(id)a4;
- (CLKUIMetalResourceManager)init;
- (id)_newAtlasForUuid:(id)a3 nilTexture:(id)a4;
- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4;
- (id)nullAtlas2D;
- (id)nullAtlasCube;
- (void)_purgeAtlases:(id)a3;
@end

@implementation CLKUIMetalResourceManager

- (CLKUIMetalResourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUIMetalResourceManager;
  v2 = [(CLKUIResourceManager *)&v6 init];
  if (v2)
  {
    v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v2->_device;
    v2->_device = v3;
  }
  return v2;
}

+ (MTLDevice)sharedDevice
{
  v2 = [a1 sharedMetalInstance];
  v3 = (MTLDevice *)v2[9];

  return v3;
}

+ (id)sharedCommandQueue
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(sharedCommandQueue__sharedCommandQueue);
  if (!WeakRetained)
  {
    v4 = [v2 sharedDevice];
    id WeakRetained = (id)[v4 newCommandQueue];

    objc_storeWeak(sharedCommandQueue__sharedCommandQueue, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (MTLTexture)sharedNilTexture2D
{
  v3 = [a1 sharedDevice];
  v4 = v3;
  if (v3)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __47__CLKUIMetalResourceManager_sharedNilTexture2D__block_invoke;
    v12 = &unk_1E609E308;
    id v13 = v3;
    id v14 = a1;
    if (sharedNilTexture2D_onceToken != -1) {
      dispatch_once(&sharedNilTexture2D_onceToken, &v9);
    }
    objc_msgSend(a1, "sharedMetalInstance", v9, v10, v11, v12);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    id v6 = v5[10];
  }
  else
  {
    v7 = [a1 sharedMetalInstance];
    id v6 = v7[10];
  }
  return (MTLTexture *)v6;
}

void __47__CLKUIMetalResourceManager_sharedNilTexture2D__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:80 width:4 height:4 mipmapped:0];
  [v2 setUsage:0];
  v3 = +[MetalDeviceInfo sharedInfo];
  objc_msgSend(v2, "setStorageMode:", objc_msgSend(v3, "defaultStorageModeForDevice:", *(void *)(a1 + 32)));

  v4 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v2];
  [v4 setLabel:@"CLKUIMetalResourceManager Nil Texture2D"];
  v5 = malloc_type_calloc(1uLL, 0x40uLL, 0x212AFB53uLL);
  memset(v8, 0, sizeof(v8));
  int64x2_t v9 = vdupq_n_s64(4uLL);
  uint64_t v10 = 1;
  [v4 replaceRegion:v8 mipmapLevel:0 slice:0 withBytes:v5 bytesPerRow:16 bytesPerImage:64];
  free(v5);
  id v6 = [*(id *)(a1 + 40) sharedMetalInstance];
  v7 = (void *)v6[10];
  v6[10] = v4;
}

+ (MTLTexture)sharedNilTextureCube
{
  v3 = [a1 sharedDevice];
  v4 = v3;
  if (v3)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __49__CLKUIMetalResourceManager_sharedNilTextureCube__block_invoke;
    v12 = &unk_1E609E308;
    id v13 = v3;
    id v14 = a1;
    if (sharedNilTextureCube_onceToken != -1) {
      dispatch_once(&sharedNilTextureCube_onceToken, &v9);
    }
    objc_msgSend(a1, "sharedMetalInstance", v9, v10, v11, v12);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    id v6 = v5[11];
  }
  else
  {
    v7 = [a1 sharedMetalInstance];
    id v6 = v7[11];
  }
  return (MTLTexture *)v6;
}

void __49__CLKUIMetalResourceManager_sharedNilTextureCube__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F35330] textureCubeDescriptorWithPixelFormat:80 size:4 mipmapped:0];
  [v2 setUsage:0];
  v3 = +[MetalDeviceInfo sharedInfo];
  objc_msgSend(v2, "setStorageMode:", objc_msgSend(v3, "defaultStorageModeForDevice:", *(void *)(a1 + 32)));

  v4 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v2];
  [v4 setLabel:@"CLKUIMetalResourceManager Nil TextureCube"];
  v5 = malloc_type_calloc(1uLL, 0x40uLL, 0xD8D31C23uLL);
  for (uint64_t i = 0; i != 6; ++i)
  {
    memset(v9, 0, sizeof(v9));
    int64x2_t v10 = vdupq_n_s64(4uLL);
    uint64_t v11 = 1;
    [v4 replaceRegion:v9 mipmapLevel:0 slice:i withBytes:v5 bytesPerRow:16 bytesPerImage:64];
  }
  free(v5);
  v7 = [*(id *)(a1 + 40) sharedMetalInstance];
  v8 = (void *)v7[11];
  v7[11] = v4;
}

+ (void)addCompletedErrorCheckToCommandBuffer:(id)a3 forCase:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CLKUIMetalResourceManager_addCompletedErrorCheckToCommandBuffer_forCase___block_invoke;
  v7[3] = &unk_1E609E330;
  id v8 = v5;
  id v6 = v5;
  [a3 addCompletedHandler:v7];
}

void __75__CLKUIMetalResourceManager_addCompletedErrorCheckToCommandBuffer_forCase___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [v7 status] == 4;
  v4 = v7;
  if (!v3)
  {
    id v5 = [v7 error];
    uint64_t v6 = [v5 code];
    if ([v5 code] == 4 && (CLKInternalBuild() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"CLKUIMTLCommandBufferException", @"GPU Error Code %lu found submitting MTLCommandBuffer for %@: %@", v6, *(void *)(a1 + 32), v5 format];
    }

    v4 = v7;
  }
}

- (id)nullAtlas2D
{
  if (nullAtlas2D_onceToken != -1) {
    dispatch_once(&nullAtlas2D_onceToken, &__block_literal_global_3);
  }
  id v2 = (void *)__nullAtlas2D;
  return v2;
}

void __40__CLKUIMetalResourceManager_nullAtlas2D__block_invoke()
{
  v0 = [CLKUIMetalAtlas alloc];
  id v3 = +[CLKUIMetalResourceManager sharedNilTexture2D];
  uint64_t v1 = [(CLKUIMetalAtlas *)v0 initWithUuid:0 nilTexture:v3];
  id v2 = (void *)__nullAtlas2D;
  __nullAtlas2D = v1;
}

- (id)nullAtlasCube
{
  if (nullAtlasCube_onceToken != -1) {
    dispatch_once(&nullAtlasCube_onceToken, &__block_literal_global_17);
  }
  id v2 = (void *)__nullAtlasCube;
  return v2;
}

void __42__CLKUIMetalResourceManager_nullAtlasCube__block_invoke()
{
  v0 = [CLKUIMetalAtlas alloc];
  id v3 = +[CLKUIMetalResourceManager sharedNilTextureCube];
  uint64_t v1 = [(CLKUIMetalAtlas *)v0 initWithUuid:0 nilTexture:v3];
  id v2 = (void *)__nullAtlasCube;
  __nullAtlasCube = v1;
}

- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4
{
  id v6 = a3;
  id v7 = [a4 atlas];
  id v8 = [v7 nilTexture];
  id v9 = [(CLKUIMetalResourceManager *)self _newAtlasForUuid:v6 nilTexture:v8];

  return v9;
}

- (id)_newAtlasForUuid:(id)a3 nilTexture:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CLKUIMetalAtlas alloc] initWithUuid:v6 nilTexture:v5];

  return v7;
}

- (void)_purgeAtlases:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) purge];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilTextureCube, 0);
  objc_storeStrong((id *)&self->_nilTexture2D, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end