@interface NUNIAegirResourceManager
+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3;
+ (void)_deallocInstance:(id)a3;
- (AegirCloudCoverService)cloudsService;
- (NUNIAegirResourceManager)initWithDisplayPixelFormat:(unint64_t)a3;
- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9;
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
- (id)textureGroupWithSuffix:(id)a3 device:(id)a4;
- (unint64_t)pixelFormat0For:(id)a3;
- (void)_asyncDeallocInstance;
- (void)_handleCloudCoverTextureExpired;
- (void)_loadGeometry;
- (void)addClient;
- (void)dealloc;
- (void)prepareForRendering;
- (void)removeClient;
- (void)setPipelineConstants:(uint64_t)a3;
@end

@implementation NUNIAegirResourceManager

+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance)
  {
    v5 = [[NUNIAegirResourceManager alloc] initWithDisplayPixelFormat:a3];
    v6 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v5;
  }
  objc_sync_exit(v4);

  v7 = (void *)__sharedInstance;
  if (*(void *)(__sharedInstance + 32) != a3)
  {
    v8 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[NUNIAegirResourceManager sharedInstanceWithDisplayPixelFormat:](a3, v8);
    }

    v7 = (void *)__sharedInstance;
  }
  return v7;
}

+ (void)_deallocInstance:(id)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance;
  __sharedInstance = 0;

  objc_sync_exit(obj);
}

- (NUNIAegirResourceManager)initWithDisplayPixelFormat:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NUNIAegirResourceManager;
  id v4 = [(NUNIAegirResourceManager *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    resourceProviderKey = v4->_resourceProviderKey;
    v4->_resourceProviderKey = (CLKUIResourceProviderKey *)v5;

    v4->_displayPixelFormat = a3;
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    textureGroupHashTable = v4->_textureGroupHashTable;
    v4->_textureGroupHashTable = (NSMapTable *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v4 selector:sel__handleCloudCoverTextureExpired name:@"CloudCoverExpiredNotification" object:0];
  }
  return v4;
}

- (void)prepareForRendering
{
  if (!self->_device)
  {
    v3 = +[CLKUIMetalResourceManager sharedDevice];
    device = self->_device;
    self->_device = v3;

    uint64_t v5 = self->_device;
    v6 = NUNIBundle();
    uint64_t v7 = (MTLLibrary *)[(MTLDevice *)v5 newDefaultLibraryWithBundle:v6 error:0];
    library = self->_library;
    self->_library = v7;

    [(NUNIAegirResourceManager *)self _loadGeometry];
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NUNIAegirResourceManager;
  [(NUNIAegirResourceManager *)&v2 dealloc];
}

- (void)_asyncDeallocInstance
{
  int v2 = [MEMORY[0x1E4F29060] isMainThread];
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
  MEMORY[0x1F41817F8]();
}

- (id)rectVerticesBuffer
{
  return self->_rectVerticesBuffer;
}

- (id)starVerticesBuffer
{
  return self->_starVerticesBuffer;
}

- (id)textureGroupWithSuffix:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMapTable *)self->_textureGroupHashTable objectForKey:v6];
  if (!v8)
  {
    v48 = objc_alloc_init(NUNIAegirTextureGroup);
    v9 = +[CLKUITexture nullTexture2D];
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:24];
    do
      [v10 setObject:&stru_1F0D25AA0 atIndexedSubscript:v8++];
    while (v8 != (char *)24);
    uint64_t v11 = +[MetalDeviceInfo sharedInfo];
    id v47 = v7;
    int v12 = [v11 supportXR10ForDevice:v7];

    if (v12) {
      v13 = @"c4a";
    }
    else {
      v13 = @"c4a_b";
    }
    [v10 setObject:v13 atIndexedSubscript:4];
    v14 = objc_opt_new();
    for (uint64_t i = 0; i != 24; ++i)
    {
      v16 = [v10 objectAtIndexedSubscript:i];
      v17 = v16;
      if (v16)
      {
        v18 = [v16 stringByAppendingFormat:@"-%@", v6];
        v19 = +[CLKUITexture textureWithProviderDelegate:self uuid:v18 nullTexture:v9];
        [v14 addObject:v19];
      }
      else
      {
        [v14 addObject:v9];
      }
    }
    [(NUNIAegirTextureGroup *)v48 setAlbedos:v14];

    v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:24];
    for (uint64_t j = 0; j != 24; ++j)
      [v20 setObject:&stru_1F0D25AA0 atIndexedSubscript:j];
    v22 = +[MetalDeviceInfo sharedInfo];
    int v23 = [v22 supportXR10ForDevice:v47];

    if (v23) {
      v24 = @"c4n";
    }
    else {
      v24 = @"c4n_b";
    }
    [v20 setObject:v24 atIndexedSubscript:4];
    v25 = objc_opt_new();
    for (uint64_t k = 0; k != 24; ++k)
    {
      v27 = [v20 objectAtIndexedSubscript:k];
      v28 = v27;
      if (v27)
      {
        v29 = [v27 stringByAppendingFormat:@"-%@", v6];
        v30 = +[CLKUITexture textureWithProviderDelegate:self uuid:v29 nullTexture:v9];
        [v25 addObject:v30];
      }
      else
      {
        [v25 addObject:v9];
      }
    }
    [(NUNIAegirTextureGroup *)v48 setNormals:v25];

    v31 = objc_opt_new();
    for (uint64_t m = 0; m != 24; ++m)
    {
      v33 = (void *)textureGroupWithSuffix_device__uuidEmissives[m];
      if (v33)
      {
        v34 = [v33 stringByAppendingFormat:@"-%@", v6];
        v35 = +[CLKUITexture textureWithProviderDelegate:self uuid:v34 nullTexture:v9];
        [v31 addObject:v35];
      }
      else
      {
        [v31 addObject:v9];
      }
    }
    [(NUNIAegirTextureGroup *)v48 setEmissives:v31];

    v36 = objc_opt_new();
    v37 = objc_opt_new();
    v38 = objc_opt_new();
    for (uint64_t n = 0; n != 24; ++n)
    {
      if (!textureGroupWithSuffix_device__uuidClouds[n])
      {
        [v36 addObject:v9];
        [v37 addObject:v9];
        [v38 addObject:v9];
      }
    }
    [(NUNIAegirTextureGroup *)v48 setCloudsLo:v36];
    [(NUNIAegirTextureGroup *)v48 setCloudsMd:v37];
    [(NUNIAegirTextureGroup *)v48 setCloudsHi:v38];

    v40 = objc_opt_new();
    for (iuint64_t i = 0; ii != 24; ++ii)
    {
      if ((0x40B7FuLL >> ii))
      {
        [v40 addObject:v9];
      }
      else
      {
        v42 = [textureGroupWithSuffix_device__uuidGradients[ii] stringByAppendingFormat:@"-%@", v6];
        v43 = +[CLKUITexture textureWithProviderDelegate:self uuid:v42 nullTexture:v9];
        [v40 addObject:v43];
      }
    }
    v8 = (char *)v48;
    [(NUNIAegirTextureGroup *)v48 setGradients:v40];

    v44 = [@"s1a" stringByAppendingFormat:@"-%@", v6];
    v45 = +[CLKUITexture textureWithProviderDelegate:self uuid:v44 nullTexture:v9];
    [(NUNIAegirTextureGroup *)v48 setStarfield:v45];

    [(NSMapTable *)self->_textureGroupHashTable setObject:v48 forKey:v6];
    id v7 = v47;
  }

  return v8;
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
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_pass_vsh" fshName:@"aegir_post_fsh" config:0 blend0:2 blend1:3 pixelFormat0:[(NUNIAegirResourceManager *)self pixelFormat0For:self->_device] pixelFormat1:10];
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
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_pass_vsh" fshName:@"aegir_starfield_fsh" config:0 blend0:0 blend1:4 pixelFormat0:[(NUNIAegirResourceManager *)self pixelFormat0For:self->_device] pixelFormat1:10];
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
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_star_vsh" fshName:@"aegir_star_fsh" config:0 blend0:1 blend1:4 pixelFormat0:[(NUNIAegirResourceManager *)self pixelFormat0For:self->_device] pixelFormat1:10];
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
    id v4 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:@"aegir_locdot_vsh" fshName:@"aegir_locdot_fsh" config:0 blend0:1 blend1:4 pixelFormat0:[(NUNIAegirResourceManager *)self pixelFormat0For:self->_device] pixelFormat1:10];
    pipelineStateLocationDot = self->_pipelineStateLocationDot;
    self->_pipelineStateLocationDot = v4;

    uint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForSpheroid:(unint64_t)a3 config:(unint64_t)a4
{
  id v7 = (char *)self + 32 * a3 + 8 * a4;
  v9 = (void *)*((void *)v7 + 12);
  v8 = (void **)(v7 + 96);
  id v10 = v9;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:24];
    for (uint64_t i = 0; i != 24; ++i)
      [v11 setObject:&stru_1F0D25AA0 atIndexedSubscript:i];
    v13 = +[MetalDeviceInfo sharedInfo];
    int v14 = [v13 supportXR10ForDevice:self->_device];

    if (v14) {
      v15 = @"aegir_luna_fsh";
    }
    else {
      v15 = @"aegir_luna_fsh_intel";
    }
    [v11 setObject:v15 atIndexedSubscript:4];
    id v16 = renderOffscreenPipelineForSpheroid_config__spheroridVshs[a3];
    v17 = [v11 objectAtIndexedSubscript:a3];
    if (v17)
    {
      v18 = [(NUNIAegirResourceManager *)self _generatePipelineVshName:v16 fshName:v17 config:a4 blend0:1 blend1:1 pixelFormat0:[(NUNIAegirResourceManager *)self pixelFormat0For:self->_device] pixelFormat1:10];
      v19 = *v8;
      char *v8 = v18;

      id v10 = v18;
    }
    else
    {
      id v10 = 0;
    }
  }
  return v10;
}

- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9
{
  char v12 = a5;
  v52[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  char v42 = v12 & 1;
  BOOL v41 = (v12 & 2) != 0;
  v17 = (void *)[(MTLFunctionConstantValues *)self->_pipelineConstants copy];
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
      _os_log_error_impl(&dword_1B41E7000, v35, OS_LOG_TYPE_ERROR, "AegirResourceManager: Metal compilation failure Shader=%@+%@ Device=%@ Error=%@", buf, 0x2Au);
    }
  }
  return v33;
}

- (void)_handleCloudCoverTextureExpired
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NUNIAegirResourceManager__handleCloudCoverTextureExpired__block_invoke;
  block[3] = &unk_1E609E290;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__NUNIAegirResourceManager__handleCloudCoverTextureExpired__block_invoke(uint64_t a1)
{
  int v2 = NUNILoggingObjectForDomain(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B41E7000, v2, OS_LOG_TYPE_DEFAULT, "Received cloud cover texture expired update. It will purge current textures.", v4, 2u);
  }

  return [*(id *)(a1 + 32) purgeAllCloudCoverTextures];
}

- (id)provideAtlasBacking:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = NUNIBundle();
  uint64_t v5 = [v4 pathForResource:v3 ofType:@"art"];

  id v6 = NUNILoggingObjectForDomain(0);
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1B41E7000, v7, OS_LOG_TYPE_DEFAULT, "providing artwork for %@ at %@", (uint8_t *)&v10, 0x16u);
    }

    v8 = +[CLKUIAtlasBacking atlasBackingWithArt:v5 uuid:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NUNIAegirResourceManager provideAtlasBacking:]((uint64_t)v3, v7);
    }

    v8 = 0;
  }

  return v8;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (unint64_t)pixelFormat0For:(id)a3
{
  id v4 = +[MetalDeviceInfo sharedInfo];
  if ([v4 supportXR10ForDevice:self->_device]) {
    unint64_t v5 = 555;
  }
  else {
    unint64_t v5 = 81;
  }

  return v5;
}

- (AegirCloudCoverService)cloudsService
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
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(__sharedInstance + 32);
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1B41E7000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: DisplayPixelFormat %d != %d", (uint8_t *)v3, 0xEu);
}

- (void)provideAtlasBacking:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B41E7000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: missing artwork for %@", (uint8_t *)&v2, 0xCu);
}

@end