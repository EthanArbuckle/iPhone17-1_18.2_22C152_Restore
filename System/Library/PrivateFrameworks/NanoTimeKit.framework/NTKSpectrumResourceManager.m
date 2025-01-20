@interface NTKSpectrumResourceManager
+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3;
+ (void)_deallocInstance:(id)a3;
- (NTKSpectrumResourceManager)initWithPixelFormat:(unint64_t)a3;
- (id)_generatePipeline:(unint64_t)a3;
- (id)overlayTexture;
- (id)renderPipelineForConfig:(unint64_t)a3;
- (id)verticesBuffer;
- (id)vignetteTexture;
- (void)_asyncDeallocInstance;
- (void)_loadGeometry;
- (void)addClient;
- (void)dealloc;
- (void)removeClient;
@end

@implementation NTKSpectrumResourceManager

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance)
  {
    v5 = [[NTKSpectrumResourceManager alloc] initWithPixelFormat:a3];
    v6 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v5;
  }
  objc_sync_exit(v4);

  v7 = (void *)__sharedInstance;
  if (*(void *)(__sharedInstance + 24) != a3) {
    +[NTKSpectrumResourceManager sharedInstanceWithPixelFormat:]();
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

- (NTKSpectrumResourceManager)initWithPixelFormat:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKSpectrumResourceManager;
  id v4 = [(NTKSpectrumResourceManager *)&v12 init];
  if (v4)
  {
    uint64_t v5 = [off_1E62BDB78 sharedDevice];
    device = v4->_device;
    v4->_device = (MTLDevice *)v5;

    v7 = v4->_device;
    v8 = NTKBundle();
    uint64_t v9 = [(MTLDevice *)v7 newDefaultLibraryWithBundle:v8 error:0];
    library = v4->_library;
    v4->_library = (MTLLibrary *)v9;

    v4->_pixelFormat = a3;
    [(NTKSpectrumResourceManager *)v4 _loadGeometry];
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSpectrumResourceManager;
  [(NTKSpectrumResourceManager *)&v2 dealloc];
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
    [(NTKSpectrumResourceManager *)v2 _asyncDeallocInstance];
  }
}

- (id)vignetteTexture
{
  vignetteTexture = self->_vignetteTexture;
  if (!vignetteTexture) {
    NTKImageNamed(@"SpectrumVignette");
  }
  uint64_t v3 = vignetteTexture;
  return v3;
}

- (id)overlayTexture
{
  overlayTexture = self->_overlayTexture;
  if (!overlayTexture)
  {
    objc_msgSend( (id) -[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 2400, 0), "contents");
    CLKUIConvertToRGBfFromSRGB8_fast();
  }
  uint64_t v3 = overlayTexture;
  return v3;
}

- (void)_loadGeometry
{
  uint64_t v3 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:&quadVertices length:16 options:1];
  verticesBuffer = self->_verticesBuffer;
  self->_verticesBuffer = v3;
}

- (id)_generatePipeline:(unint64_t)a3
{
  unsigned __int8 v23 = a3 & 1;
  BOOL v22 = (a3 & 2) != 0;
  BOOL v21 = (a3 & 8) != 0;
  BOOL v20 = (a3 & 0x10) != 0;
  id v4 = @"spectrumConicOverlayFrgShader";
  if ((a3 & 4) == 0) {
    id v4 = @"spectrumConicFrgShader";
  }
  uint64_t v5 = v4;
  v6 = objc_opt_new();
  [v6 setConstantValue:&v23 type:53 atIndex:0];
  [v6 setConstantValue:&v22 type:53 atIndex:1];
  [v6 setConstantValue:&v21 type:53 atIndex:2];
  [v6 setConstantValue:&v20 type:53 atIndex:3];
  v7 = NTKBundle();
  device = self->_device;
  p_device = (uint64_t *)&self->_device;
  v10 = [off_1E62BDB70 archiveWithName:@"NTKSpectrumShaders" bundle:v7 device:device];

  v11 = [MEMORY[0x1E4F35238] functionDescriptor];
  [v11 setName:@"spectrumPassVrtShader"];
  objc_super v12 = (void *)[v10 newFunctionInLibrary:p_device[22] withDescriptor:v11];
  [v11 setName:v5];

  [v11 setConstantValues:v6];
  v13 = (void *)[v10 newFunctionInLibrary:p_device[22] withDescriptor:v11];
  id v14 = objc_alloc_init(MEMORY[0x1E4F352F0]);
  [v14 setLabel:@"Spectrum Pipeline"];
  [v14 setVertexFunction:v12];
  [v14 setFragmentFunction:v13];
  v15 = [v14 colorAttachments];
  v16 = [v15 objectAtIndexedSubscript:0];

  [v16 setPixelFormat:p_device[2]];
  if (v23 | v22)
  {
    [v16 setBlendingEnabled:1];
    [v16 setRgbBlendOperation:0];
    [v16 setAlphaBlendOperation:0];
    [v16 setSourceRGBBlendFactor:4];
    [v16 setSourceAlphaBlendFactor:4];
    [v16 setDestinationRGBBlendFactor:5];
    [v16 setDestinationAlphaBlendFactor:5];
  }
  v17 = (void *)[v10 newRenderPipelineStateForDevice:*p_device withDescriptor:v14];
  if (!v17)
  {
    v18 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      [(NTKSpectrumResourceManager *)v13 _generatePipeline:v18];
    }
  }
  return v17;
}

- (id)renderPipelineForConfig:(unint64_t)a3
{
  pipelineStates = self->_pipelineStates;
  v6 = self->_pipelineStates[a3];
  if (!v6)
  {
    v7 = [(NTKSpectrumResourceManager *)self _generatePipeline:a3];
    v8 = pipelineStates[a3];
    pipelineStates[a3] = v7;

    v6 = v7;
  }
  return v6;
}

- (id)verticesBuffer
{
  return self->_verticesBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_overlayTexture, 0);
  objc_storeStrong((id *)&self->_vignetteTexture, 0);
  for (uint64_t i = 160; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_verticesBuffer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)sharedInstanceWithPixelFormat:.cold.1()
{
  __assert_rtn("+[NTKSpectrumResourceManager sharedInstanceWithPixelFormat:]", "NTKSpectrumResourceManager.m", 73, "((NTKSpectrumResourceManager*)__sharedInstance)->_pixelFormat == pixelFormat");
}

- (void)_generatePipeline:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 name];
  uint64_t v6 = *a2;
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_fault_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_FAULT, "Spectrum Metal compilation failure: Shader=%@ Device=%@", (uint8_t *)&v7, 0x16u);
}

@end