@interface NUNIAegirResourceManager
+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3;
+ (void)_deallocInstance:(id)a3;
- (NUNIAegirResourceManager)initWithDisplayPixelFormat:(unint64_t)a3;
- (_TtC12NanoUniverse22AegirCloudCoverService)cloudsService;
- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9;
- (id)_provideEarthCloudsAtlasBacking:(id)a3;
- (id)provideAtlasBacking:(id)a3;
- (id)rectVerticesBuffer;
- (id)renderDisplayPipeline;
- (id)renderOffscreenPipelineForLocationDot;
- (id)renderOffscreenPipelineForPost;
- (id)renderOffscreenPipelineForSpheroid:(unint64_t)a3 config:(unint64_t)a4;
- (id)renderOffscreenPipelineForStar;
- (id)renderOffscreenPipelineForStarfield;
- (id)renderOffscreenPipelineForThreshold;
- (id)resourceProviderKey;
- (id)starVerticesBuffer;
- (id)textureGroupWithSuffix:(id)a3;
- (void)_asyncDeallocInstance;
- (void)_deferredCloudDataFetchIfNeeded;
- (void)_handleCloudCoverTextureExpired;
- (void)_loadGeometry;
- (void)addClient;
- (void)dealloc;
- (void)purgeAllCloudCoverTextures;
- (void)removeClient;
- (void)setPipelineConstants:(uint64_t)a3;
@end

@implementation NUNIAegirResourceManager

+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance_1)
  {
    v5 = [[NUNIAegirResourceManager alloc] initWithDisplayPixelFormat:a3];
    v6 = (void *)__sharedInstance_1;
    __sharedInstance_1 = (uint64_t)v5;
  }
  objc_sync_exit(v4);

  v7 = (void *)__sharedInstance_1;
  if (*(void *)(__sharedInstance_1 + 32) != a3)
  {
    v8 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[NUNIAegirResourceManager sharedInstanceWithDisplayPixelFormat:](a3, v8);
    }

    v7 = (void *)__sharedInstance_1;
  }
  return v7;
}

+ (void)_deallocInstance:(id)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance_1;
  __sharedInstance_1 = 0;

  objc_sync_exit(obj);
}

- (NUNIAegirResourceManager)initWithDisplayPixelFormat:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NUNIAegirResourceManager;
  id v4 = [(NUNIAegirResourceManager *)&v23 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    resourceProviderKey = v4->_resourceProviderKey;
    v4->_resourceProviderKey = (CLKUIResourceProviderKey *)v5;

    uint64_t v7 = [MEMORY[0x263F32148] sharedDevice];
    device = v4->_device;
    v4->_device = (MTLDevice *)v7;

    v9 = v4->_device;
    v10 = NUNIBundle();
    uint64_t v11 = [(MTLDevice *)v9 newDefaultLibraryWithBundle:v10 error:0];
    library = v4->_library;
    v4->_library = (MTLLibrary *)v11;

    v4->_displayPixelFormat = a3;
    uint64_t v13 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    textureGroupHashTable = v4->_textureGroupHashTable;
    v4->_textureGroupHashTable = (NSMapTable *)v13;

    v15 = [_TtC12NanoUniverse22AegirCloudCoverService alloc];
    LODWORD(v16) = 0.25;
    uint64_t v17 = [(AegirCloudCoverService *)v15 initWithImageScale:v16];
    cloudsService = v4->_cloudsService;
    v4->_cloudsService = (_TtC12NanoUniverse22AegirCloudCoverService *)v17;

    v19 = v4->_cloudsService;
    v20 = objc_opt_new();
    [(AegirCloudCoverService *)v19 setFileConverter:v20];

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v4 selector:sel__handleCloudCoverTextureExpired name:@"CloudCoverExpiredNotification" object:0];

    [(NUNIAegirResourceManager *)v4 _loadGeometry];
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NUNIAegirResourceManager;
  [(NUNIAegirResourceManager *)&v2 dealloc];
}

- (void)_asyncDeallocInstance
{
  int v2 = [MEMORY[0x263F08B88] isMainThread];
  v3 = objc_opt_class();
  if (v2)
  {
    [v3 _deallocInstance:0];
  }
  else
  {
    [v3 performSelectorOnMainThread:sel__deallocInstance_ withObject:0 waitUntilDone:0];
  }
}

- (void)addClient
{
  id obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);
}

- (void)removeClient
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
  {
    [(NUNIAegirResourceManager *)v2 _asyncDeallocInstance];
  }
}

- (void)setPipelineConstants:(uint64_t)a3
{
  id obj = (id)objc_opt_new();
  [obj setConstantValue:a3 type:16 atIndex:0];
  [obj setConstantValue:a3 + 2 type:16 atIndex:1];
  [obj setConstantValue:a3 + 4 type:16 atIndex:2];
  [obj setConstantValue:a3 + 6 type:16 atIndex:3];
  [obj setConstantValue:a3 + 8 type:16 atIndex:4];
  [obj setConstantValue:a3 + 10 type:16 atIndex:5];
  [obj setConstantValue:a3 + 12 type:16 atIndex:6];
  [obj setConstantValue:a3 + 14 type:16 atIndex:7];
  [obj setConstantValue:a3 + 16 type:16 atIndex:8];
  [obj setConstantValue:a3 + 18 type:16 atIndex:9];
  [obj setConstantValue:a3 + 20 type:16 atIndex:10];
  [obj setConstantValue:a3 + 22 type:16 atIndex:11];
  [obj setConstantValue:a3 + 24 type:16 atIndex:12];
  [obj setConstantValue:a3 + 26 type:16 atIndex:13];
  [obj setConstantValue:a3 + 28 type:16 atIndex:14];
  [obj setConstantValue:a3 + 30 type:16 atIndex:15];
  [obj setConstantValue:a3 + 32 type:16 atIndex:16];
  [obj setConstantValue:a3 + 34 type:16 atIndex:17];
  [obj setConstantValue:a3 + 36 type:16 atIndex:18];
  [obj setConstantValue:a3 + 38 type:16 atIndex:19];
  [obj setConstantValue:a3 + 40 type:16 atIndex:20];
  [obj setConstantValue:a3 + 42 type:16 atIndex:21];
  [obj setConstantValue:a3 + 44 type:16 atIndex:22];
  [obj setConstantValue:a3 + 46 type:16 atIndex:23];
  [obj setConstantValue:a3 + 48 type:16 atIndex:24];
  [obj setConstantValue:a3 + 50 type:16 atIndex:25];
  [obj setConstantValue:a3 + 52 type:16 atIndex:26];
  [obj setConstantValue:a3 + 54 type:16 atIndex:27];
  [obj setConstantValue:a3 + 56 type:16 atIndex:28];
  [obj setConstantValue:a3 + 58 type:16 atIndex:29];
  [obj setConstantValue:a3 + 60 type:16 atIndex:30];
  [obj setConstantValue:a3 + 62 type:16 atIndex:31];
  [obj setConstantValue:a3 + 64 type:16 atIndex:32];
  [obj setConstantValue:a3 + 66 type:16 atIndex:33];
  [obj setConstantValue:a3 + 68 type:16 atIndex:34];
  objc_storeStrong((id *)(a1 + 880), obj);
  uint64_t v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;

  v6 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0;

  uint64_t v7 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;

  v8 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = 0;

  v9 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = 0;

  v10 = *(void **)(a1 + 88);
  *(void *)(a1 + 88) = 0;

  uint64_t v11 = 0;
  uint64_t v12 = a1 + 96;
  do
  {
    for (uint64_t i = 0; i != 32; i += 8)
    {
      v14 = *(void **)(v12 + i);
      *(void *)(v12 + i) = 0;
    }
    ++v11;
    v12 += 32;
  }
  while (v11 != 24);
}

- (void)_loadGeometry
{
  uint64_t v3 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&quadVertices length:16 options:1];
  rectVerticesBuffer = self->_rectVerticesBuffer;
  self->_rectVerticesBuffer = v3;

  self->_starVerticesBuffer = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&starVertices length:67392 options:1];
  MEMORY[0x270F9A758]();
}

- (id)rectVerticesBuffer
{
  return self->_rectVerticesBuffer;
}

- (id)starVerticesBuffer
{
  return self->_starVerticesBuffer;
}

- (id)textureGroupWithSuffix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_textureGroupHashTable objectForKey:v4];
  if (!v5)
  {
    v6 = objc_alloc_init(NUNIAegirTextureGroup);
    uint64_t v7 = [MEMORY[0x263F32178] nullTexture2D];
    v8 = objc_opt_new();
    do
    {
      v9 = *(void **)((char *)&textureGroupWithSuffix__uuidAlbedos + (void)v5);
      if (v9)
      {
        v10 = [v9 stringByAppendingFormat:@"-%@", v4];
        uint64_t v11 = [MEMORY[0x263F32178] textureWithProviderDelegate:self uuid:v10 nullTexture:v7];
        [v8 addObject:v11];
      }
      else
      {
        [v8 addObject:v7];
      }
      v5 += 8;
    }
    while (v5 != (char *)192);
    [(NUNIAegirTextureGroup *)v6 setAlbedos:v8];

    uint64_t v12 = objc_opt_new();
    for (uint64_t i = 0; i != 24; ++i)
    {
      v14 = (void *)textureGroupWithSuffix__uuidNormals[i];
      if (v14)
      {
        v15 = [v14 stringByAppendingFormat:@"-%@", v4];
        double v16 = [MEMORY[0x263F32178] textureWithProviderDelegate:self uuid:v15 nullTexture:v7];
        [v12 addObject:v16];
      }
      else
      {
        [v12 addObject:v7];
      }
    }
    [(NUNIAegirTextureGroup *)v6 setNormals:v12];

    uint64_t v17 = objc_opt_new();
    for (uint64_t j = 0; j != 24; ++j)
    {
      v19 = (void *)textureGroupWithSuffix__uuidEmissives[j];
      if (v19)
      {
        v20 = [v19 stringByAppendingFormat:@"-%@", v4];
        v21 = [MEMORY[0x263F32178] textureWithProviderDelegate:self uuid:v20 nullTexture:v7];
        [v17 addObject:v21];
      }
      else
      {
        [v17 addObject:v7];
      }
    }
    [(NUNIAegirTextureGroup *)v6 setEmissives:v17];

    v41 = objc_opt_new();
    v22 = objc_opt_new();
    objc_super v23 = objc_opt_new();
    for (uint64_t k = 0; k != 24; ++k)
    {
      if (textureGroupWithSuffix__uuidClouds[k])
      {
        v25 = (void *)MEMORY[0x263F32178];
        v26 = +[AegirCloudCoverService cloudLevelLowFileName];
        v27 = [v25 textureWithProviderDelegate:self uuid:v26 nullTexture:v7];
        [v41 addObject:v27];

        v28 = (void *)MEMORY[0x263F32178];
        v29 = +[AegirCloudCoverService cloudLevelMidFileName];
        v30 = [v28 textureWithProviderDelegate:self uuid:v29 nullTexture:v7];
        [v22 addObject:v30];

        v31 = (void *)MEMORY[0x263F32178];
        v32 = +[AegirCloudCoverService cloudLevelHighFileName];
        v33 = [v31 textureWithProviderDelegate:self uuid:v32 nullTexture:v7];
        [v23 addObject:v33];
      }
      else
      {
        [v41 addObject:v7];
        [v22 addObject:v7];
        [v23 addObject:v7];
      }
    }
    [(NUNIAegirTextureGroup *)v6 setCloudsLo:v41];
    [(NUNIAegirTextureGroup *)v6 setCloudsMd:v22];
    [(NUNIAegirTextureGroup *)v6 setCloudsHi:v23];

    v34 = objc_opt_new();
    for (uint64_t m = 0; m != 24; ++m)
    {
      if ((0x40B7FuLL >> m))
      {
        [v34 addObject:v7];
      }
      else
      {
        v36 = [textureGroupWithSuffix__uuidGradients_0[m] stringByAppendingFormat:@"-%@", v4];
        v37 = [MEMORY[0x263F32178] textureWithProviderDelegate:self uuid:v36 nullTexture:v7];
        [v34 addObject:v37];
      }
    }
    uint64_t v5 = (char *)v6;
    [(NUNIAegirTextureGroup *)v6 setGradients:v34];

    v38 = [@"s1a" stringByAppendingFormat:@"-%@", v4];
    v39 = [MEMORY[0x263F32178] textureWithProviderDelegate:self uuid:v38 nullTexture:v7];
    [(NUNIAegirTextureGroup *)v6 setStarfield:v39];

    [(NSMapTable *)self->_textureGroupHashTable setObject:v6 forKey:v4];
  }

  return v5;
}

- (id)renderDisplayPipeline
{
  uint64_t v3 = self->_pipelineStateDisplay;
  if (!v3)
  {
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_pass_vsh" fshName:@"aegir_display_fsh" config:0 blend0:0 blend1:4 pixelFormat0:self->_displayPixelFormat pixelFormat1:0];
    pipelineStateDisplay = self->_pipelineStateDisplay;
    self->_pipelineStateDisplay = v4;

    uint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForPost
{
  uint64_t v3 = self->_pipelineStatePost;
  if (!v3)
  {
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_pass_vsh" fshName:@"aegir_post_fsh" config:0 blend0:2 blend1:3 pixelFormat0:555 pixelFormat1:10];
    pipelineStatePost = self->_pipelineStatePost;
    self->_pipelineStatePost = v4;

    uint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStarfield
{
  uint64_t v3 = self->_pipelineStateStarfield;
  if (!v3)
  {
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_pass_vsh" fshName:@"aegir_starfield_fsh" config:0 blend0:0 blend1:4 pixelFormat0:555 pixelFormat1:10];
    pipelineStateStarfield = self->_pipelineStateStarfield;
    self->_pipelineStateStarfield = v4;

    uint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStar
{
  uint64_t v3 = self->_pipelineStateStar;
  if (!v3)
  {
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_star_vsh" fshName:@"aegir_star_fsh" config:0 blend0:1 blend1:4 pixelFormat0:555 pixelFormat1:10];
    pipelineStateStar = self->_pipelineStateStar;
    self->_pipelineStateStar = v4;

    uint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForThreshold
{
  uint64_t v3 = self->_pipelineStateThreshold;
  if (!v3)
  {
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_pass_vsh" fshName:@"aegir_threshold_fsh" config:0 blend0:0 blend1:4 pixelFormat0:10 pixelFormat1:0];
    pipelineStateThreshold = self->_pipelineStateThreshold;
    self->_pipelineStateThreshold = v4;

    uint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForLocationDot
{
  uint64_t v3 = self->_pipelineStateLocationDot;
  if (!v3)
  {
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_locdot_vsh" fshName:@"aegir_locdot_fsh" config:0 blend0:1 blend1:4 pixelFormat0:555 pixelFormat1:10];
    pipelineStateLocationDot = self->_pipelineStateLocationDot;
    self->_pipelineStateLocationDot = v4;

    uint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForSpheroid:(unint64_t)a3 config:(unint64_t)a4
{
  uint64_t v7 = (char *)self + 32 * a3 + 8 * a4;
  v9 = (void *)*((void *)v7 + 12);
  v8 = (void **)(v7 + 96);
  id v10 = v9;
  if (!v10)
  {
    if ((0x40801uLL >> a3))
    {
      id v10 = 0;
    }
    else
    {
      uint64_t v11 = (void *)renderOffscreenPipelineForSpheroid_config__spheroridVshs[a3];
      id v12 = renderOffscreenPipelineForSpheroid_config__spheroridFshs[a3];
      id v13 = v11;
      v14 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:v13 fshName:v12 config:a4 blend0:1 blend1:1 pixelFormat0:555 pixelFormat1:10];
      v15 = *v8;
      void *v8 = v14;

      id v10 = v14;
    }
  }
  return v10;
}

- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9
{
  char v12 = a5;
  v52[2] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  char v42 = v12 & 1;
  BOOL v41 = (v12 & 2) != 0;
  uint64_t v17 = (void *)[(MTLFunctionConstantValues *)self->_pipelineConstants copy];
  [v17 setConstantValue:&v42 type:53 atIndex:35];
  [v17 setConstantValue:&v41 type:53 atIndex:36];
  v52[0] = a6;
  v52[1] = a7;
  v18 = objc_opt_new();
  v19 = [NSString stringWithFormat:@"(%@)+(%@)", v15, v16];
  [v18 setLabel:v19];

  v39 = v15;
  v20 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v15];
  [v18 setVertexFunction:v20];

  v38 = v16;
  v21 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v16 constantValues:v17 error:0];
  [v18 setFragmentFunction:v21];

  uint64_t v22 = 0;
  v51[0] = a8;
  v51[1] = a9;
  char v23 = 1;
  do
  {
    char v24 = v23;
    uint64_t v25 = v51[v22];
    if (v25)
    {
      v26 = [v18 colorAttachments];
      v27 = [v26 objectAtIndexedSubscript:v22];

      [v27 setPixelFormat:v25];
      [v27 setBlendingEnabled:0];
      switch(v52[v22])
      {
        case 1:
          [v27 setBlendingEnabled:1];
          [v27 setRgbBlendOperation:0];
          [v27 setAlphaBlendOperation:0];
          [v27 setSourceRGBBlendFactor:4];
          [v27 setSourceAlphaBlendFactor:4];
          [v27 setDestinationRGBBlendFactor:5];
          v28 = v27;
          uint64_t v29 = 5;
          goto LABEL_8;
        case 2:
          [v27 setBlendingEnabled:1];
          [v27 setRgbBlendOperation:0];
          v30 = v27;
          uint64_t v31 = 0;
          goto LABEL_7;
        case 3:
          [v27 setBlendingEnabled:1];
          [v27 setRgbBlendOperation:2];
          v30 = v27;
          uint64_t v31 = 2;
LABEL_7:
          [v30 setAlphaBlendOperation:v31];
          [v27 setSourceRGBBlendFactor:1];
          [v27 setSourceAlphaBlendFactor:1];
          [v27 setDestinationRGBBlendFactor:1];
          v28 = v27;
          uint64_t v29 = 1;
LABEL_8:
          [v28 setDestinationAlphaBlendFactor:v29];
          break;
        case 4:
          [v27 setWriteMask:0];
          break;
        default:
          break;
      }
    }
    char v23 = 0;
    uint64_t v22 = 1;
  }
  while ((v24 & 1) != 0);
  device = self->_device;
  id v40 = 0;
  v33 = (void *)[(MTLDevice *)device newRenderPipelineStateWithDescriptor:v18 error:&v40];
  id v34 = v40;
  if (!v33)
  {
    v35 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = self->_device;
      *(_DWORD *)buf = 138413058;
      v44 = v39;
      __int16 v45 = 2112;
      v46 = v38;
      __int16 v47 = 2112;
      v48 = v37;
      __int16 v49 = 2112;
      id v50 = v34;
      _os_log_error_impl(&dword_21E8AA000, v35, OS_LOG_TYPE_ERROR, "AegirResourceManager: Metal compilation failure Shader=%@+%@ Device=%@ Error=%@", buf, 0x2Au);
    }
  }
  return v33;
}

- (void)_handleCloudCoverTextureExpired
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NUNIAegirResourceManager__handleCloudCoverTextureExpired__block_invoke;
  block[3] = &unk_2644CDE18;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__NUNIAegirResourceManager__handleCloudCoverTextureExpired__block_invoke(uint64_t a1)
{
  int v2 = NUNILoggingObjectForDomain(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E8AA000, v2, OS_LOG_TYPE_DEFAULT, "Received cloud cover texture expired update. It will purge current textures.", v4, 2u);
  }

  return [*(id *)(a1 + 32) purgeAllCloudCoverTextures];
}

- (void)purgeAllCloudCoverTextures
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [(AegirCloudCoverService *)self->_cloudsService allCloudLevelFileNames];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        v8 = [MEMORY[0x263F32160] sharedInstance];
        [v8 purge:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_deferredCloudDataFetchIfNeeded
{
  BOOL v3 = [(AegirCloudCoverService *)self->_cloudsService canFetchData];
  uint64_t v4 = NUNILoggingObjectForDomain(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E8AA000, v4, OS_LOG_TYPE_DEFAULT, "Will Fetch cloud cover data.", buf, 2u);
    }

    cloudsService = self->_cloudsService;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__NUNIAegirResourceManager__deferredCloudDataFetchIfNeeded__block_invoke;
    v7[3] = &unk_2644CDE40;
    v7[4] = self;
    [(AegirCloudCoverService *)cloudsService retrieveCloudTextureURLsWithNotifyOn:MEMORY[0x263EF83A0] completionHandler:v7];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E8AA000, v4, OS_LOG_TYPE_DEFAULT, "Will not fetch cloud cover data.", buf, 2u);
    }
  }
}

uint64_t __59__NUNIAegirResourceManager__deferredCloudDataFetchIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeAllCloudCoverTextures];
}

- (id)_provideEarthCloudsAtlasBacking:(id)a3
{
  id v4 = a3;
  [(NUNIAegirResourceManager *)self _deferredCloudDataFetchIfNeeded];
  BOOL v5 = [(AegirCloudCoverService *)self->_cloudsService currentURLForCloudLevelWith:v4];
  uint64_t v6 = (void *)MEMORY[0x263F32110];
  uint64_t v7 = [v5 path];
  v8 = [v6 atlasBackingWithArt:v7 uuid:v4];

  return v8;
}

- (id)provideAtlasBacking:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = +[AegirCloudCoverService cloudLevelPrefix];
  int v6 = [v4 hasPrefix:v5];

  if (v6)
  {
    uint64_t v7 = [(NUNIAegirResourceManager *)self _provideEarthCloudsAtlasBacking:v4];
  }
  else
  {
    v8 = NUNIBundle();
    long long v9 = [v8 pathForResource:v4 ofType:@"art"];

    long long v10 = NUNILoggingObjectForDomain(0);
    long long v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_21E8AA000, v11, OS_LOG_TYPE_DEFAULT, "providing artwork for %@ at %@", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v7 = [MEMORY[0x263F32110] atlasBackingWithArt:v9 uuid:v4];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[NUNIAegirResourceManager provideAtlasBacking:]((uint64_t)v4, v11);
      }

      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (_TtC12NanoUniverse22AegirCloudCoverService)cloudsService
{
  return self->_cloudsService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudsService, 0);
  objc_storeStrong((id *)&self->_textureGroupHashTable, 0);
  objc_storeStrong((id *)&self->_pipelineConstants, 0);
  objc_storeStrong((id *)&self->_starVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_rectVerticesBuffer, 0);
  for (uint64_t i = 856; i != 88; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_pipelineStateStar, 0);
  objc_storeStrong((id *)&self->_pipelineStateStarfield, 0);
  objc_storeStrong((id *)&self->_pipelineStateDisplay, 0);
  objc_storeStrong((id *)&self->_pipelineStatePost, 0);
  objc_storeStrong((id *)&self->_pipelineStateThreshold, 0);
  objc_storeStrong((id *)&self->_pipelineStateLocationDot, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)sharedInstanceWithDisplayPixelFormat:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(__sharedInstance_1 + 32);
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_21E8AA000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: DisplayPixelFormat %d != %d", (uint8_t *)v3, 0xEu);
}

- (void)provideAtlasBacking:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E8AA000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: missing artwork for %@", (uint8_t *)&v2, 0xCu);
}

@end