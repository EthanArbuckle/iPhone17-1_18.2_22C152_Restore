@interface NTKKaleidoscopeResourceManager
+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3;
+ (void)_deallocInstance:(id)a3;
- (NTKKaleidoscopeResourceManager)initWithPixelFormat:(unint64_t)a3;
- (id)_pipelineStateForShaderType:(unint64_t)a3 vertexName:(id)a4 fragmentName:(id)a5 inLibrary:(id)a6 archive:(id)a7 allowsBlending:(BOOL)a8;
- (id)getGeometryBuffer;
- (id)getPipelineForShaderType:(unint64_t)a3 blending:(BOOL)a4;
- (void)_asyncDeallocInstance;
- (void)_loadMTLBufferData;
- (void)_loadPrograms;
- (void)_queue_setupPipelineForType:(unint64_t)a3 vertexName:(id)a4 fragmentName:(id)a5 inLibrary:(id)a6 archive:(id)a7;
- (void)addClient;
- (void)dealloc;
- (void)removeClient;
@end

@implementation NTKKaleidoscopeResourceManager

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance_0)
  {
    v5 = [[NTKKaleidoscopeResourceManager alloc] initWithPixelFormat:a3];
    v6 = (void *)__sharedInstance_0;
    __sharedInstance_0 = (uint64_t)v5;
  }
  objc_sync_exit(v4);

  v7 = (void *)__sharedInstance_0;
  if (*(void *)(__sharedInstance_0 + 32) != a3) {
    +[NTKKaleidoscopeResourceManager sharedInstanceWithPixelFormat:]();
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

- (NTKKaleidoscopeResourceManager)initWithPixelFormat:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKKaleidoscopeResourceManager;
  id v4 = [(NTKKaleidoscopeResourceManager *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    bundle = v4->_bundle;
    v4->_bundle = (NSBundle *)v5;

    v4->_viewMtlPixelFormat = a3;
    uint64_t v7 = [off_1E62BDB78 sharedDevice];
    device = v4->_device;
    v4->_device = (MTLDevice *)v7;

    [(NTKKaleidoscopeResourceManager *)v4 _loadMTLBufferData];
    [(NTKKaleidoscopeResourceManager *)v4 _loadPrograms];
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKKaleidoscopeResourceManager;
  [(NTKKaleidoscopeResourceManager *)&v2 dealloc];
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
    [(NTKKaleidoscopeResourceManager *)v2 _asyncDeallocInstance];
  }
}

- (void)_loadMTLBufferData
{
  id v3 = (id) [(MTLDevice *)self->_device newBufferWithLength:128 options:0];
  id v4 = (float32x2_t *)[v3 contents];
  *(_OWORD *)v4->f32 = geomKaleidoscopeQuad;
  *(_OWORD *)v4[2].f32 = unk_1BC8A2268;
  uint64_t v5 = v4 + 5;
  int v6 = 17;
  uint64_t v7 = 6;
  float32x2_t v8 = (float32x2_t)vdup_n_s32(0x3F866666u);
  do
  {
    __float2 v9 = __sincosf_stret((float)(v7 + 10) * 0.5236);
    v5[-1] = vmul_f32((float32x2_t)__PAIR64__(LODWORD(v9.__sinval), LODWORD(v9.__cosval)), v8);
    __float2 v10 = __sincosf_stret((float)v6 * 0.5236);
    float32x2_t *v5 = vmul_f32((float32x2_t)__PAIR64__(LODWORD(v10.__sinval), LODWORD(v10.__cosval)), v8);
    v5 += 2;
    ++v6;
    --v7;
  }
  while (v7);
  mtlBuffer = self->_mtlBuffer;
  self->_mtlBuffer = (MTLBuffer *)v3;
}

- (id)_pipelineStateForShaderType:(unint64_t)a3 vertexName:(id)a4 fragmentName:(id)a5 inLibrary:(id)a6 archive:(id)a7 allowsBlending:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = @"off";
  if (v8) {
    v18 = @"on";
  }
  uint64_t v19 = [NSString stringWithFormat:@"%@_blend_%@", _pipelineNames[a3], v18];
  BOOL v50 = v8;
  v20 = objc_opt_new();
  [v20 setConstantValue:&v50 type:53 atIndex:0];
  v21 = [MEMORY[0x1E4F35238] functionDescriptor];
  v49 = v14;
  [v21 setName:v14];
  [v21 setConstantValues:v20];
  uint64_t v22 = [v17 newFunctionInLibrary:v16 withDescriptor:v21];
  v48 = v15;
  [v21 setName:v15];
  v46 = v16;
  v23 = (void *)[v17 newFunctionInLibrary:v16 withDescriptor:v21];
  id v24 = objc_alloc_init(MEMORY[0x1E4F352F0]);
  v47 = (void *)v19;
  [v24 setLabel:v19];
  v45 = (void *)v22;
  [v24 setVertexFunction:v22];
  [v24 setFragmentFunction:v23];
  unint64_t viewMtlPixelFormat = self->_viewMtlPixelFormat;
  v26 = [v24 colorAttachments];
  v27 = [v26 objectAtIndexedSubscript:0];
  [v27 setPixelFormat:viewMtlPixelFormat];

  if (v8)
  {
    v28 = [v24 colorAttachments];
    v29 = [v28 objectAtIndexedSubscript:0];
    [v29 setBlendingEnabled:1];

    v30 = [v24 colorAttachments];
    v31 = [v30 objectAtIndexedSubscript:0];
    [v31 setRgbBlendOperation:0];

    v32 = [v24 colorAttachments];
    v33 = [v32 objectAtIndexedSubscript:0];
    [v33 setAlphaBlendOperation:0];

    v34 = [v24 colorAttachments];
    v35 = [v34 objectAtIndexedSubscript:0];
    [v35 setSourceRGBBlendFactor:4];

    v36 = [v24 colorAttachments];
    v37 = [v36 objectAtIndexedSubscript:0];
    [v37 setSourceAlphaBlendFactor:4];

    v38 = [v24 colorAttachments];
    v39 = [v38 objectAtIndexedSubscript:0];
    [v39 setDestinationRGBBlendFactor:5];

    v40 = [v24 colorAttachments];
    v41 = [v40 objectAtIndexedSubscript:0];
    [v41 setDestinationAlphaBlendFactor:5];
  }
  uint64_t v42 = [v17 newRenderPipelineStateForDevice:self->_device withDescriptor:v24];
  if (!v42) {
    -[NTKKaleidoscopeResourceManager _pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:]();
  }
  v43 = (void *)v42;

  return v43;
}

- (void)_queue_setupPipelineForType:(unint64_t)a3 vertexName:(id)a4 fragmentName:(id)a5 inLibrary:(id)a6 archive:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = [(NTKKaleidoscopeResourceManager *)self _pipelineStateForShaderType:a3 vertexName:v15 fragmentName:v14 inLibrary:v13 archive:v12 allowsBlending:0];
  id v17 = (char *)self + 16 * a3;
  v18 = (void *)*((void *)v17 + 5);
  *((void *)v17 + 5) = v16;

  uint64_t v19 = [(NTKKaleidoscopeResourceManager *)self _pipelineStateForShaderType:a3 vertexName:v15 fragmentName:v14 inLibrary:v13 archive:v12 allowsBlending:1];

  v20 = (void *)*((void *)v17 + 6);
  *((void *)v17 + 6) = v19;
}

- (void)_loadPrograms
{
  device = self->_device;
  if (_cachedCurrentBundle_onceToken != -1) {
    dispatch_once(&_cachedCurrentBundle_onceToken, &__block_literal_global_157);
  }
  id v8 = 0;
  id v4 = (id)_cachedCurrentBundle___bundle;
  uint64_t v5 = (void *)[(MTLDevice *)device newDefaultLibraryWithBundle:v4 error:&v8];
  id v6 = v8;

  uint64_t v7 = [off_1E62BDB70 archiveWithName:@"NTKKaleidoscopeShaders" bundle:self->_bundle device:self->_device];

  [(NTKKaleidoscopeResourceManager *)self _queue_setupPipelineForType:0 vertexName:@"kal_circle_vert" fragmentName:@"kal_faceted_frag" inLibrary:v5 archive:v7];
  [(NTKKaleidoscopeResourceManager *)self _queue_setupPipelineForType:1 vertexName:@"kal_circle_vert" fragmentName:@"kal_radial_frag" inLibrary:v5 archive:v7];
  [(NTKKaleidoscopeResourceManager *)self _queue_setupPipelineForType:2 vertexName:@"kal_circle_vert" fragmentName:@"kal_rosette_frag" inLibrary:v5 archive:v7];
  [(NTKKaleidoscopeResourceManager *)self _queue_setupPipelineForType:3 vertexName:@"kal_fullscreen_vert" fragmentName:@"kal_faceted_fullscreen_frag" inLibrary:v5 archive:v7];
}

- (id)getPipelineForShaderType:(unint64_t)a3 blending:(BOOL)a4
{
  return self->_renderPipelines[a3][a4];
}

- (id)getGeometryBuffer
{
  return self->_mtlBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlBuffer, 0);
  for (uint64_t i = 96; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

+ (void)sharedInstanceWithPixelFormat:.cold.1()
{
  __assert_rtn("+[NTKKaleidoscopeResourceManager sharedInstanceWithPixelFormat:]", "NTKKaleidoscopeResourceManager.m", 75, "((NTKKaleidoscopeResourceManager*)__sharedInstance)->_viewMtlPixelFormat == pixFmt");
}

- (void)_pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:.cold.1()
{
  __assert_rtn("-[NTKKaleidoscopeResourceManager _pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:]", "NTKKaleidoscopeResourceManager.m", 232, "pipelineState != nil");
}

@end