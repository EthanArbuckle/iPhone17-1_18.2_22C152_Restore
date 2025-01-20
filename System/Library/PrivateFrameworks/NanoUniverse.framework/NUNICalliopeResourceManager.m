@interface NUNICalliopeResourceManager
+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3;
+ (void)_deallocInstance:(id)a3;
- ($5AFC0E169F343DF89EAE37A2F834CF53)patchTextureGroupForSpheroid:(unint64_t)a3 index:(unint64_t)a4 suffix:(id)a5;
- (NUNICalliopeResourceManager)initWithDisplayPixelFormat:(unint64_t)a3;
- (_TtC12NanoUniverse22AegirCloudCoverService)cloudsService;
- (const)patchBoundingBoxForSpheroid;
- (const)patchBoundingBoxes;
- (id)_generatePipelineCshName:(id)a3;
- (id)_generatePipelineTshName:(id)a3 pixelFormat0:(unint64_t)a4 pixelFormat1:(unint64_t)a5;
- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9;
- (id)_provideEarthCloudsAtlasBacking:(id)a3;
- (id)atmosphereRingVerticesBuffer;
- (id)computePipelineForBloomChainDownsample;
- (id)computePipelineForBloomChainUpsample;
- (id)discVerticesBuffer;
- (id)patchIndicesBufferForLod:(unint64_t)a3;
- (id)patchVerticesBuffer;
- (id)provideAtlasBacking:(id)a3;
- (id)rectVerticesBuffer;
- (id)renderDisplayPipeline;
- (id)renderOffscreenPipelineForAtmosphere;
- (id)renderOffscreenPipelineForBloomDownsample;
- (id)renderOffscreenPipelineForBloomDownsampleUsingTileShader;
- (id)renderOffscreenPipelineForDebugDraw;
- (id)renderOffscreenPipelineForLocationDot;
- (id)renderOffscreenPipelineForPost;
- (id)renderOffscreenPipelineForSaturnRing;
- (id)renderOffscreenPipelineForSpheroid:(unint64_t)a3 layer:(int)a4 config:(unint64_t)a5;
- (id)renderOffscreenPipelineForStar;
- (id)renderOffscreenPipelineForStarfield;
- (id)resourceProviderKey;
- (id)saturnRingVerticesBuffer;
- (id)starVerticesBuffer;
- (id)starfieldIndicesBuffer;
- (id)starfieldVerticesBuffer;
- (id)textureGroupWithSuffix:(id)a3;
- (unsigned)patchIndexCountForLod:(unint64_t)a3;
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

@implementation NUNICalliopeResourceManager

+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance_0)
  {
    v5 = [[NUNICalliopeResourceManager alloc] initWithDisplayPixelFormat:a3];
    v6 = (void *)__sharedInstance_0;
    __sharedInstance_0 = (uint64_t)v5;
  }
  objc_sync_exit(v4);

  v7 = (void *)__sharedInstance_0;
  if (*(void *)(__sharedInstance_0 + 32) != a3)
  {
    v8 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[NUNICalliopeResourceManager sharedInstanceWithDisplayPixelFormat:](a3, v8);
    }

    v7 = (void *)__sharedInstance_0;
  }
  return v7;
}

+ (void)_deallocInstance:(id)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance_0;
  __sharedInstance_0 = 0;

  objc_sync_exit(obj);
}

- (NUNICalliopeResourceManager)initWithDisplayPixelFormat:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NUNICalliopeResourceManager;
  id v4 = [(NUNICalliopeResourceManager *)&v23 init];
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

    [(NUNICalliopeResourceManager *)v4 _loadGeometry];
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NUNICalliopeResourceManager;
  [(NUNICalliopeResourceManager *)&v2 dealloc];
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
    [(NUNICalliopeResourceManager *)v2 _asyncDeallocInstance];
  }
}

- (void)setPipelineConstants:(uint64_t)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = 0;
  id obj = v5;
  do
  {
    [v5 setConstantValue:a3 type:16 atIndex:v6];
    uint64_t v5 = obj;
    ++v6;
    a3 += 2;
  }
  while (v6 != 35);
  objc_storeStrong((id *)(a1 + 968), obj);
  uint64_t v7 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;

  v8 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0;

  v9 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;

  v10 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = 0;

  uint64_t v11 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = 0;

  uint64_t v12 = 0;
  char v13 = 1;
  do
  {
    uint64_t v14 = 0;
    char v15 = v13;
    uint64_t v16 = a1 + 384 * v12;
    do
    {
      uint64_t v17 = *(void **)(v16 + v14 + 104);
      *(void *)(v16 + v14 + 104) = 0;

      v18 = *(void **)(v16 + v14 + 112);
      *(void *)(v16 + v14 + 112) = 0;

      v14 += 16;
    }
    while (v14 != 384);
    char v13 = 0;
    uint64_t v12 = 1;
  }
  while ((v15 & 1) != 0);
}

- (void)_loadGeometry
{
  uint64_t v3 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopeQuadVertices length:16 options:1];
  rectVerticesBuffer = self->_rectVerticesBuffer;
  self->_rectVerticesBuffer = v3;

  uint64_t v5 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopeDiscVertices length:64 options:1];
  discVerticesBuffer = self->_discVerticesBuffer;
  self->_discVerticesBuffer = v5;

  uint64_t v7 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopeStarVertices length:44928 options:1];
  starVerticesBuffer = self->_starVerticesBuffer;
  self->_starVerticesBuffer = v7;

  v9 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytesNoCopy:&_NUNICalliopeStarfieldVertices length:518184 options:1 deallocator:&__block_literal_global];
  starfieldVerticesBuffer = self->_starfieldVerticesBuffer;
  self->_starfieldVerticesBuffer = v9;

  uint64_t v11 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytesNoCopy:&_NUNICalliopeStarfieldIndices length:768300 options:1 deallocator:&__block_literal_global_27];
  starfieldIndicesBuffer = self->_starfieldIndicesBuffer;
  self->_starfieldIndicesBuffer = v11;

  char v13 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopeAtmosphereRingVertices length:200 options:1];
  atmosphereRingVerticesBuffer = self->_atmosphereRingVerticesBuffer;
  self->_atmosphereRingVerticesBuffer = v13;

  char v15 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopeSaturnRingVertices length:104 options:1];
  saturnRingVerticesBuffer = self->_saturnRingVerticesBuffer;
  self->_saturnRingVerticesBuffer = v15;

  uint64_t v17 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytesNoCopy:&_NUNICalliopePatchVertices length:110976 options:1 deallocator:&__block_literal_global_29];
  patchVerticesBuffer = self->_patchVerticesBuffer;
  self->_patchVerticesBuffer = v17;

  v19 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:_NUNICalliopePatchIndices1 length:3072 options:1];
  v20 = self->_patchIndicesBuffer[0];
  self->_patchIndicesBuffer[0] = v19;

  v21 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopePatchIndices2 length:768 options:1];
  v22 = self->_patchIndicesBuffer[1];
  self->_patchIndicesBuffer[1] = v21;

  objc_super v23 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopePatchIndices3 length:192 options:1];
  v24 = self->_patchIndicesBuffer[2];
  self->_patchIndicesBuffer[2] = v23;

  v25 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&_NUNICalliopePatchIndices4 length:48 options:1];
  v26 = self->_patchIndicesBuffer[3];
  self->_patchIndicesBuffer[3] = v25;

  uint64_t v27 = 0;
  int32x4_t v28 = vdupq_n_s32(0x7F7FFFFFu);
  do
  {
    uint64_t v29 = 0;
    v30.i64[0] = 0x80000000800000;
    v30.i32[2] = 0x800000;
    float32x4_t v31 = (float32x4_t)v28;
    do
    {
      v32 = (float16x4_t *)((char *)&_NUNICalliopePatchVertices
                          + 4624 * v27
                          + 16 * (unsigned __int16)_NUNICalliopePatchIndices1[v29]);
      v33.i64[0] = vcvtq_f32_f16(*v32).u64[0];
      _H4 = v32->i16[2];
      __asm { FCVT            S4, H4 }
      v31.i32[3] = 0;
      v33.i64[1] = _S4;
      float32x4_t v31 = vminnmq_f32(v31, v33);
      v30.i32[3] = 0;
      float32x4_t v30 = vmaxnmq_f32(v30, v33);
      ++v29;
    }
    while (v29 != 1536);
    v40 = &self->_anon_4c10[32 * v27];
    *(float32x4_t *)v40 = v31;
    *((float32x4_t *)v40 + 1) = v30;
    ++v27;
  }
  while (v27 != 24);
  float32x4_t v41 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
  v42.i64[0] = 0x80000000800000;
  v42.i32[2] = 0x800000;
  uint64_t v43 = -768;
  do
  {
    float32x4_t v44 = *(float32x4_t *)((char *)&self[1].super.isa + v43);
    v41.i32[3] = 0;
    v44.i32[3] = 0;
    float32x4_t v41 = vminnmq_f32(v41, v44);
    float32x4_t v45 = *(float32x4_t *)((char *)&self[1]._resourceProviderKey + v43);
    v42.i32[3] = 0;
    v45.i32[3] = 0;
    float32x4_t v42 = vmaxnmq_f32(v42, v45);
    v43 += 32;
  }
  while (v43);
  *(float32x4_t *)&self[1].super.isa = v41;
  *(float32x4_t *)&self[1]._resourceProviderKey = v42;
}

- (id)rectVerticesBuffer
{
  return self->_rectVerticesBuffer;
}

- (id)discVerticesBuffer
{
  return self->_discVerticesBuffer;
}

- (id)starVerticesBuffer
{
  return self->_starVerticesBuffer;
}

- (id)starfieldVerticesBuffer
{
  return self->_starfieldVerticesBuffer;
}

- (id)starfieldIndicesBuffer
{
  return self->_starfieldIndicesBuffer;
}

- (id)atmosphereRingVerticesBuffer
{
  return self->_atmosphereRingVerticesBuffer;
}

- (id)saturnRingVerticesBuffer
{
  return self->_saturnRingVerticesBuffer;
}

- (id)patchVerticesBuffer
{
  return self->_patchVerticesBuffer;
}

- (id)patchIndicesBufferForLod:(unint64_t)a3
{
  unint64_t v3 = 3;
  if (a3 < 3) {
    unint64_t v3 = a3;
  }
  return self->_patchIndicesBuffer[v3];
}

- (unsigned)patchIndexCountForLod:(unint64_t)a3
{
  unint64_t v3 = 3;
  if (a3 < 3) {
    unint64_t v3 = a3;
  }
  return patchIndexCountForLod__counts[v3];
}

- (const)patchBoundingBoxes
{
  return (const $8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_anon_4c10;
}

- (const)patchBoundingBoxForSpheroid
{
  return (const $8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self[1];
}

- ($5AFC0E169F343DF89EAE37A2F834CF53)patchTextureGroupForSpheroid:(unint64_t)a3 index:(unint64_t)a4 suffix:(id)a5
{
  patchTextureGroupTable = self->_patchTextureGroupTable;
  uint64_t v6 = ($5AFC0E169F343DF89EAE37A2F834CF53 *)&self->_patchTextureGroupTable[a3][a4];
  if (!v6->var0)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"p%02d-i%02d", patchTextureGroupForSpheroid_index_suffix__spheroidIndex[a3], a4);
    uint64_t v12 = (void *)MEMORY[0x263F32178];
    char v13 = [v11 stringByAppendingFormat:@"-a-%@", a5];
    uint64_t v14 = [v12 textureWithProviderDelegate:self uuid:v13 streaming:1];
    id var0 = v6->var0;
    v6->id var0 = (id)v14;

    uint64_t v16 = [v6->var0 atlas];
    [v16 setMaxPlaceholderSize:128];

    if (patchTextureGroupForSpheroid_index_suffix__spheroidHasNormal[a3])
    {
      uint64_t v17 = (void *)MEMORY[0x263F32178];
      v18 = [v11 stringByAppendingFormat:@"-n-%@", a5];
      uint64_t v19 = [v17 textureWithProviderDelegate:self uuid:v18 streaming:1];
      unint64_t v20 = (unint64_t)&patchTextureGroupTable[a3][a4];
      v21 = *(void **)(v20 + 8);
      *(void *)(v20 + 8) = v19;

      v22 = [*(id *)(v20 + 8) atlas];
      [v22 setMaxPlaceholderSize:128];
    }
    if (patchTextureGroupForSpheroid_index_suffix__spheroidHasCloud[a3])
    {
      objc_super v23 = (void *)MEMORY[0x263F32178];
      v24 = [v11 stringByAppendingFormat:@"-e-%@", a5];
      uint64_t v25 = [v23 textureWithProviderDelegate:self uuid:v24 streaming:1];
      unint64_t v26 = (unint64_t)&patchTextureGroupTable[a3][a4];
      uint64_t v27 = *(void **)(v26 + 16);
      *(void *)(v26 + 16) = v25;

      int32x4_t v28 = [*(id *)(v26 + 16) atlas];
      [v28 setMaxPlaceholderSize:128];
    }
    if (patchTextureGroupForSpheroid_index_suffix__spheroidHasCloud[a3])
    {
      uint64_t v29 = (void *)MEMORY[0x263F32178];
      float32x4_t v30 = [v11 stringByAppendingFormat:@"-c-%@", a5];
      uint64_t v31 = [v29 textureWithProviderDelegate:self uuid:v30 streaming:1];
      unint64_t v32 = (unint64_t)&patchTextureGroupTable[a3][a4];
      float32x4_t v33 = *(void **)(v32 + 24);
      *(void *)(v32 + 24) = v31;

      v34 = [*(id *)(v32 + 24) atlas];
      [v34 setMaxPlaceholderSize:128];
    }
  }
  return v6;
}

- (id)textureGroupWithSuffix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_textureGroupHashTable objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = objc_alloc_init(NUNICalliopeTextureGroup);
    uint64_t v6 = [MEMORY[0x263F32178] nullTexture2D];
    uint64_t v7 = objc_opt_new();
    for (uint64_t i = 0; i != 24; ++i)
    {
      v9 = (void *)textureGroupWithSuffix__uuidGradients[i];
      if (v9)
      {
        v10 = [v9 stringByAppendingString:v4];
        uint64_t v11 = [MEMORY[0x263F32178] textureWithProviderDelegate:self uuid:v10 nullTexture:v6];
        [v7 addObject:v11];
      }
      else
      {
        [v7 addObject:v6];
      }
    }
    [(NUNICalliopeTextureGroup *)v5 setGradients:v7];

    [(NSMapTable *)self->_textureGroupHashTable setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)renderDisplayPipeline
{
  unint64_t v3 = self->_pipelineStateDisplay;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_pass_vsh" fshName:@"calliope_display_fsh" config:0 blend0:0 blend1:4 pixelFormat0:self->_displayPixelFormat pixelFormat1:0];
    pipelineStateDisplay = self->_pipelineStateDisplay;
    self->_pipelineStateDisplay = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForPost
{
  unint64_t v3 = self->_pipelineStatePost;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_post_vsh" fshName:@"calliope_post_fsh" config:0 blend0:2 blend1:3 pixelFormat0:555 pixelFormat1:10];
    pipelineStatePost = self->_pipelineStatePost;
    self->_pipelineStatePost = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStarfield
{
  unint64_t v3 = self->_pipelineStateStarfield;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_starfield_vsh" fshName:@"calliope_starfield_fsh" config:0 blend0:0 blend1:0 pixelFormat0:555 pixelFormat1:10];
    pipelineStateStarfield = self->_pipelineStateStarfield;
    self->_pipelineStateStarfield = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStar
{
  unint64_t v3 = self->_pipelineStateStar;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_star_vsh" fshName:@"calliope_star_fsh" config:0 blend0:1 blend1:4 pixelFormat0:555 pixelFormat1:10];
    pipelineStateStar = self->_pipelineStateStar;
    self->_pipelineStateStar = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForSaturnRing
{
  p_pipelineStateSaturnRing = &self->_pipelineStateSaturnRing;
  id v4 = self->_pipelineStateSaturnRing;
  if (!v4)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_saturn_ring_vsh" fshName:@"calliope_saturn_ring_fsh" config:0 blend0:1 blend1:1 pixelFormat0:555 pixelFormat1:10];
    objc_storeStrong((id *)p_pipelineStateSaturnRing, v4);
  }
  return v4;
}

- (id)renderOffscreenPipelineForAtmosphere
{
  p_pipelineStateAtmosphere = &self->_pipelineStateAtmosphere;
  id v4 = self->_pipelineStateAtmosphere;
  if (!v4)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_atmosphere_vsh" fshName:@"calliope_atmosphere_fsh" config:0 blend0:1 blend1:1 pixelFormat0:555 pixelFormat1:10];
    objc_storeStrong((id *)p_pipelineStateAtmosphere, v4);
  }
  return v4;
}

- (id)renderOffscreenPipelineForLocationDot
{
  unint64_t v3 = self->_pipelineStateLocationDot;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_locdot_vsh" fshName:@"calliope_locdot_fsh" config:0 blend0:1 blend1:4 pixelFormat0:555 pixelFormat1:10];
    pipelineStateLocationDot = self->_pipelineStateLocationDot;
    self->_pipelineStateLocationDot = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForSpheroid:(unint64_t)a3 layer:(int)a4 config:(unint64_t)a5
{
  v9 = (char *)self + 384 * a4 + 16 * a3 + 8 * a5;
  uint64_t v11 = (void *)*((void *)v9 + 13);
  v10 = (void **)(v9 + 104);
  id v12 = v11;
  if (!v12)
  {
    char v13 = (void *)renderOffscreenPipelineForSpheroid_layer_config__spheroridFshs[24 * a4 + a3];
    if (v13)
    {
      uint64_t v14 = (void *)renderOffscreenPipelineForSpheroid_layer_config__spheroridVshs[24 * a4 + a3];
      id v15 = v13;
      id v16 = v14;
      uint64_t v17 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:v16 fshName:v15 config:a5 blend0:1 blend1:1 pixelFormat0:555 pixelFormat1:10];
      v18 = *v10;
      void *v10 = v17;

      id v12 = v17;
    }
    else
    {
      id v12 = 0;
    }
  }
  return v12;
}

- (id)renderOffscreenPipelineForDebugDraw
{
  unint64_t v3 = self->_pipelineStateDebugDraw;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_debugdraw_vsh" fshName:@"calliope_debugdraw_fsh" config:0 blend0:0 blend1:4 pixelFormat0:555 pixelFormat1:10];
    pipelineStateDebugDraw = self->_pipelineStateDebugDraw;
    self->_pipelineStateDebugDraw = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForBloomDownsampleUsingTileShader
{
  unint64_t v3 = self->_pipelineStateForBloomDownsampleUsingTileShader;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineTshName:@"calliope_bloom_downsample_tsh" pixelFormat0:555 pixelFormat1:10];
    pipelineStateForBloomDownsampleUsingTileShader = self->_pipelineStateForBloomDownsampleUsingTileShader;
    self->_pipelineStateForBloomDownsampleUsingTileShader = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForBloomDownsample
{
  unint64_t v3 = self->_pipelineStateForBloomDownsample;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineVshName:@"calliope_bloom_downsample_vsh" fshName:@"calliope_bloom_downsample_fsh" config:0 blend0:0 blend1:4 pixelFormat0:10 pixelFormat1:0];
    pipelineStateForBloomDownsample = self->_pipelineStateForBloomDownsample;
    self->_pipelineStateForBloomDownsample = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)computePipelineForBloomChainDownsample
{
  unint64_t v3 = self->_pipelineStateForBloomChainDownsample;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineCshName:@"calliope_bloom_chain_downsample_csh"];
    pipelineStateForBloomChainDownsample = self->_pipelineStateForBloomChainDownsample;
    self->_pipelineStateForBloomChainDownsample = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)computePipelineForBloomChainUpsample
{
  unint64_t v3 = self->_pipelineStateForBloomChainUpsample;
  if (!v3)
  {
    id v4 = [(NUNICalliopeResourceManager *)self _generatePipelineCshName:@"calliope_bloom_chain_upsample_csh"];
    pipelineStateForBloomChainUpsample = self->_pipelineStateForBloomChainUpsample;
    self->_pipelineStateForBloomChainUpsample = v4;

    unint64_t v3 = v4;
  }
  return v3;
}

- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9
{
  char v12 = a5;
  v46[2] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  BOOL v44 = (v12 & 3) == 1;
  BOOL v43 = (v12 & 2) != 0;
  uint64_t v17 = (void *)[(MTLFunctionConstantValues *)self->_pipelineConstants copy];
  [v17 setConstantValue:&v44 type:53 atIndex:35];
  [v17 setConstantValue:&v43 type:53 atIndex:36];
  v46[0] = a6;
  v46[1] = a7;
  v18 = (void *)MEMORY[0x263F32140];
  uint64_t v19 = NUNIBundle();
  unint64_t v20 = [v18 archiveWithName:@"NUNICalliopeShaders" bundle:v19 device:self->_device];

  v21 = [MEMORY[0x263F128B8] functionDescriptor];
  v40 = v17;
  [v21 setConstantValues:v17];
  [v21 setName:v15];
  uint64_t v22 = [v20 newFunctionInLibrary:self->_library withDescriptor:v21];
  [v21 setName:v16];
  float32x4_t v42 = v20;
  objc_super v23 = (void *)[v20 newFunctionInLibrary:self->_library withDescriptor:v21];
  v24 = objc_opt_new();
  float32x4_t v41 = v16;
  uint64_t v25 = [NSString stringWithFormat:@"(%@)+(%@)", v15, v16];
  [v24 setLabel:v25];

  v39 = (void *)v22;
  [v24 setVertexFunction:v22];
  [v24 setFragmentFunction:v23];
  uint64_t v26 = 0;
  v45[0] = a8;
  v45[1] = a9;
  char v27 = 1;
  do
  {
    char v28 = v27;
    uint64_t v29 = v45[v26];
    if (v29)
    {
      float32x4_t v30 = [v24 colorAttachments];
      uint64_t v31 = [v30 objectAtIndexedSubscript:v26];

      [v31 setPixelFormat:v29];
      [v31 setBlendingEnabled:0];
      switch(v46[v26])
      {
        case 1:
          [v31 setBlendingEnabled:1];
          [v31 setRgbBlendOperation:0];
          [v31 setAlphaBlendOperation:0];
          [v31 setSourceRGBBlendFactor:4];
          [v31 setSourceAlphaBlendFactor:4];
          [v31 setDestinationRGBBlendFactor:5];
          unint64_t v32 = v31;
          uint64_t v33 = 5;
          goto LABEL_8;
        case 2:
          [v31 setBlendingEnabled:1];
          [v31 setRgbBlendOperation:0];
          v34 = v31;
          uint64_t v35 = 0;
          goto LABEL_7;
        case 3:
          [v31 setBlendingEnabled:1];
          [v31 setRgbBlendOperation:2];
          v34 = v31;
          uint64_t v35 = 2;
LABEL_7:
          [v34 setAlphaBlendOperation:v35];
          [v31 setSourceRGBBlendFactor:1];
          [v31 setSourceAlphaBlendFactor:1];
          [v31 setDestinationRGBBlendFactor:1];
          unint64_t v32 = v31;
          uint64_t v33 = 1;
LABEL_8:
          [v32 setDestinationAlphaBlendFactor:v33];
          break;
        case 4:
          [v31 setWriteMask:0];
          break;
        default:
          break;
      }
    }
    char v27 = 0;
    uint64_t v26 = 1;
  }
  while ((v28 & 1) != 0);
  uint64_t v36 = [v42 newRenderPipelineStateForDevice:self->_device withDescriptor:v24];
  if (!v36) {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:]();
  }
  v37 = (void *)v36;

  return v37;
}

- (id)_generatePipelineTshName:(id)a3 pixelFormat0:(unint64_t)a4 pixelFormat1:(unint64_t)a5
{
  v31[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = objc_opt_new();
  v10 = [NSString stringWithFormat:@"(%@)", v8];
  [v9 setLabel:v10];

  uint64_t v11 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v8];
  [v9 setTileFunction:v11];

  [v9 setThreadgroupSizeMatchesTileSize:0];
  uint64_t v12 = 0;
  v31[0] = a4;
  v31[1] = a5;
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = v31[v12];
    if (v15)
    {
      id v16 = [v9 colorAttachments];
      uint64_t v17 = [v16 objectAtIndexedSubscript:v12];

      [v17 setPixelFormat:v15];
    }
    char v13 = 0;
    uint64_t v12 = 1;
  }
  while ((v14 & 1) != 0);
  device = self->_device;
  id v24 = 0;
  uint64_t v19 = (void *)[(MTLDevice *)device newRenderPipelineStateWithTileDescriptor:v9 options:0 reflection:0 error:&v24];
  id v20 = v24;
  if (!v19)
  {
    v21 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_super v23 = self->_device;
      *(_DWORD *)buf = 138412802;
      id v26 = v8;
      __int16 v27 = 2112;
      char v28 = v23;
      __int16 v29 = 2112;
      id v30 = v20;
      _os_log_error_impl(&dword_21E8AA000, v21, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: Metal compilation failure Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
  }
  return v19;
}

- (id)_generatePipelineCshName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [NSString stringWithFormat:@"(%@)", v4];
  [v5 setLabel:v6];

  uint64_t v7 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v4];
  [v5 setComputeFunction:v7];

  device = self->_device;
  id v14 = 0;
  v9 = (void *)[(MTLDevice *)device newComputePipelineStateWithDescriptor:v5 options:0 reflection:0 error:&v14];
  id v10 = v14;
  if (!v9)
  {
    uint64_t v11 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v13 = self->_device;
      *(_DWORD *)buf = 138412802;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl(&dword_21E8AA000, v11, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: Metal compilation failure Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
  }
  return v9;
}

- (void)_handleCloudCoverTextureExpired
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NUNICalliopeResourceManager__handleCloudCoverTextureExpired__block_invoke;
  block[3] = &unk_2644CDE18;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__NUNICalliopeResourceManager__handleCloudCoverTextureExpired__block_invoke(uint64_t a1)
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
        id v8 = [MEMORY[0x263F32160] sharedInstance];
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
    v7[2] = __62__NUNICalliopeResourceManager__deferredCloudDataFetchIfNeeded__block_invoke;
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

uint64_t __62__NUNICalliopeResourceManager__deferredCloudDataFetchIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeAllCloudCoverTextures];
}

- (id)_provideEarthCloudsAtlasBacking:(id)a3
{
  id v4 = a3;
  [(NUNICalliopeResourceManager *)self _deferredCloudDataFetchIfNeeded];
  BOOL v5 = [(AegirCloudCoverService *)self->_cloudsService currentURLForCloudLevelWith:v4];
  uint64_t v6 = (void *)MEMORY[0x263F32110];
  uint64_t v7 = [v5 path];
  id v8 = [v6 atlasBackingWithArt:v7 uuid:v4];

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
    uint64_t v7 = [(NUNICalliopeResourceManager *)self _provideEarthCloudsAtlasBacking:v4];
  }
  else
  {
    id v8 = NUNIBundle();
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
        -[NUNICalliopeResourceManager provideAtlasBacking:]((uint64_t)v4, v11);
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
  BOOL v3 = &self->_patchTextureGroupTable[23][23];
  uint64_t v4 = -18432;
  do
  {
    __destructor_8_s0_s8_s16_s24((uint64_t)v3--);
    v4 += 32;
  }
  while (v4);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_patchIndicesBuffer[i + 3], 0);
  objc_storeStrong((id *)&self->_patchVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_cloudsService, 0);
  objc_storeStrong((id *)&self->_textureGroupHashTable, 0);
  objc_storeStrong((id *)&self->_pipelineConstants, 0);
  objc_storeStrong((id *)&self->_starfieldIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_starfieldVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_saturnRingVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_atmosphereRingVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_starVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_discVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_rectVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomChainUpsample, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomChainDownsample, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomDownsample, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomDownsampleUsingTileShader, 0);
  objc_storeStrong((id *)&self->_pipelineStateDebugDraw, 0);
  for (uint64_t j = 864; j != 96; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_pipelineStateAtmosphere, 0);
  objc_storeStrong((id *)&self->_pipelineStateSaturnRing, 0);
  objc_storeStrong((id *)&self->_pipelineStateStar, 0);
  objc_storeStrong((id *)&self->_pipelineStateStarfield, 0);
  objc_storeStrong((id *)&self->_pipelineStateDisplay, 0);
  objc_storeStrong((id *)&self->_pipelineStatePost, 0);
  objc_storeStrong((id *)&self->_pipelineStateLocationDot, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)sharedInstanceWithDisplayPixelFormat:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(__sharedInstance_0 + 32);
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_21E8AA000, a2, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: DisplayPixelFormat %d != %d", (uint8_t *)v3, 0xEu);
}

- (void)_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:.cold.1()
{
  __assert_rtn("-[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:]", "NUNICalliopeResourceManager.m", 913, "pipelineState != nil");
}

- (void)provideAtlasBacking:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E8AA000, a2, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: missing artwork for %@", (uint8_t *)&v2, 0xCu);
}

@end