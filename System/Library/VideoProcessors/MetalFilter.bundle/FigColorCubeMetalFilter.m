@interface FigColorCubeMetalFilter
+ (int)createCubeTexture:(id *)a3 ofSize:(int)a4 cubesCount:(int)a5 textureType:(unint64_t)a6 withDevice:(id)a7;
+ (int)loadCube:(id)a3 ofSize:(int)a4 intoTexture:(id)a5 toSliceIndex:(int)a6;
- ($C7AD2F4C285567854F02E01F06575F34)filterDescriptor;
- (CGRect)targetRectangle;
- (FigColorCubeMetalFilter)initWithCommandQueue:(id)a3;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSString)debugDescription;
- (__CVBuffer)inputPixelBuffer;
- (__CVBuffer)mattePixelbuffer;
- (__CVBuffer)outputPixelBuffer;
- (id)createPipelineStateWithVertexFunction:(id)a3 fragmentName:(id)a4 isLuma:(BOOL)a5 useBgCube:(BOOL)a6 manyFgCubes:(BOOL)a7 colorSpace:(int)a8 mixInGammaDomain:(BOOL)a9;
- (int)_prewarmWithTuningParameters:(id)a3;
- (int)allocateResources;
- (int)createKernels;
- (int)createPipelineStatesForCubeConversionWithVertexFunction:(id)a3;
- (int)createPipelineStatesWithFragmentName:(id)a3 vertexFunction:(id)a4;
- (int)finishProcessing;
- (int)matteToInputPixelBufferRotationDegrees;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)releaseResources;
- (int)resetState;
- (int)runWithInputPixelBuffer:(__CVBuffer *)a3 mattePixelBuffer:(__CVBuffer *)a4 outputPixelBuffer:(__CVBuffer *)a5 targetRectangle:(CGRect)a6;
- (int)setBackgroundCubeWithName:(id)a3 data:(id)a4;
- (int)setForegroundCubesWithNames:(id)a3 data:(id)a4;
- (int)setup;
- (void)convertCubeWithSrcTexture:(id)a3 dstTexture:(id)a4 isP3Cube:(BOOL)a5;
- (void)dealloc;
- (void)prewarmMetalInternalShader;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setFilterDescriptor:(id *)a3;
- (void)setInputPixelBuffer:(__CVBuffer *)a3;
- (void)setMattePixelbuffer:(__CVBuffer *)a3;
- (void)setMatteToInputPixelBufferRotationDegrees:(int)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutputPixelBuffer:(__CVBuffer *)a3;
- (void)setTargetRectangle:(CGRect)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation FigColorCubeMetalFilter

- (int)setup
{
  return 0;
}

+ (int)createCubeTexture:(id *)a3 ofSize:(int)a4 cubesCount:(int)a5 textureType:(unint64_t)a6 withDevice:(id)a7
{
  id v11 = a7;
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    v13 = 0;
    goto LABEL_12;
  }
  v12 = objc_opt_new();
  v13 = v12;
  if (!v12) {
    goto LABEL_14;
  }
  switch(a6)
  {
    case 2uLL:
      [v12 setTextureType:2];
      [v13 setHeight:(a4 * a4)];
      [v13 setWidth:a4];
      break;
    case 3uLL:
      [v12 setTextureType:3];
      [v13 setHeight:(a4 * a4)];
      [v13 setWidth:a4];
      [v13 setArrayLength:a5];
      break;
    case 7uLL:
      [v12 setTextureType:7];
      [v13 setHeight:a4];
      [v13 setWidth:a4];
      [v13 setDepth:a4];
      break;
    default:
      int v16 = -1;
      goto LABEL_12;
  }
  [v13 setPixelFormat:70];
  [v13 setUsage:7];
  v14 = (void *)[v11 newTextureWithDescriptor:v13];
  if (!v14)
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    goto LABEL_12;
  }
  id v15 = v14;
  *a3 = v15;

  int v16 = 0;
LABEL_12:

  return v16;
}

+ (int)loadCube:(id)a3 ofSize:(int)a4 intoTexture:(id)a5 toSliceIndex:(int)a6
{
  id v9 = a3;
  id v10 = a5;
  int v11 = [v9 length];
  uint64_t v12 = (a4 * a4);
  if (16 * a4 * v12 == v11)
  {
    id v13 = [MEMORY[0x263EFF990] dataWithLength:(uint64_t)v11 >> 2];
    v14 = (void *)[v13 mutableBytes];
    id v15 = v9;
    src.data = (void *)[v15 bytes];
    src.height = (a4 * a4);
    src.width = 4 * a4;
    src.rowBytes = 4 * src.width;
    dest.data = v14;
    dest.height = src.height;
    dest.width = src.width;
    dest.rowBytes = src.width;
    vImageConvert_PlanarFtoPlanar8(&src, &dest, 1.0, 0.0, 0);

    id v9 = v13;
  }
  if ([v9 length] != (int)v12 * (uint64_t)(4 * a4)) {
    goto LABEL_10;
  }
  uint64_t v16 = [v9 bytes];
  if ([v10 textureType] != 7)
  {
    memset(v25, 0, 24);
    v25[3] = a4;
    v25[4] = (a4 * a4);
    v25[5] = 1;
    uint64_t v21 = a6;
    uint64_t v17 = 4 * a4;
    v19 = v25;
    v20 = v10;
    uint64_t v22 = v16;
    uint64_t v18 = 0;
    goto LABEL_8;
  }
  if (a6)
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    goto LABEL_9;
  }
  memset(v26, 0, 24);
  v26[3] = a4;
  uint64_t v17 = 4 * a4;
  uint64_t v18 = 4 * v12;
  v26[4] = a4;
  v26[5] = a4;
  v19 = v26;
  v20 = v10;
  uint64_t v21 = 0;
  uint64_t v22 = v16;
LABEL_8:
  [v20 replaceRegion:v19 mipmapLevel:0 slice:v21 withBytes:v22 bytesPerRow:v17 bytesPerImage:v18];
  int v23 = 0;
LABEL_9:

  return v23;
}

- (NSString)debugDescription
{
  return (NSString *)@"FigColorCubeMetalFilter";
}

- (FigColorCubeMetalFilter)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FigColorCubeMetalFilter;
  v5 = [(FigColorCubeMetalFilter *)&v19 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:v4];
    v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    id v9 = (void *)*((void *)v5 + 1);
    if (v9)
    {
      uint64_t v10 = [v9 commandQueue];
      int v11 = (void *)*((void *)v5 + 66);
      *((void *)v5 + 66) = v10;

      *((void *)v5 + 2) = 540;
      uint64_t v12 = [*((id *)v5 + 1) device];
      MTLPixelFormatGetInfoForDevice();

      byte_26ABE8C90 = 1;
      v5[504] = 0;
      id v13 = malloc_type_malloc(0x14uLL, 0x1000040742B88DAuLL);
      *((void *)v5 + 67) = v13;
      *(void *)id v13 = 0x100000020;
      v13[3] = 0;
      *((unsigned char *)v13 + 16) = 0;
      long long v14 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
      *(_OWORD *)(v5 + 568) = *MEMORY[0x263F001A0];
      *(_OWORD *)(v5 + 584) = v14;
      *((_DWORD *)v5 + 115) = 0;
      *((_DWORD *)v5 + 125) = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v18 = FigSignalErrorAt();

      id v15 = 0;
      if (v18) {
        goto LABEL_5;
      }
    }
  }
  id v15 = v5;
LABEL_5:
  uint64_t v16 = v15;

  return v16;
}

- (int)finishProcessing
{
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  if ([(FigColorCubeMetalFilter *)self createKernels]
    || (int result = [(FigColorCubeMetalFilter *)self allocateResources]) != 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)prewarm
{
  v2 = self;
  v3 = [[FigColorCubeMetalFilter alloc] initWithCommandQueue:self->_metalCommandQueue];
  LODWORD(v2) = [(FigColorCubeMetalFilter *)v3 _prewarmWithTuningParameters:v2->_tuningParameters];

  return (int)v2;
}

- (int)_prewarmWithTuningParameters:(id)a3
{
  int result = [(FigColorCubeMetalFilter *)self createKernels];
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)allocateResources
{
  filterDescriptor = self->_filterDescriptor;
  uint64_t var1 = filterDescriptor->var1;
  self->_isSingleFgCube = var1 == 1;
  id v62 = 0;
  uint64_t var0 = filterDescriptor->var0;
  uint64_t v7 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v62 ofSize:var0 cubesCount:var1 textureType:3 withDevice:v7];
  id v9 = (MTLTexture *)v62;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
LABEL_24:
    FigDebugAssert3();
    goto LABEL_25;
  }
  uint64_t v10 = self->_fgCubesTexture[0];
  self->_fgCubesTexture[0] = v9;
  int v11 = v9;

  v61 = v11;
  uint64_t v12 = self->_filterDescriptor;
  uint64_t v13 = v12->var0;
  uint64_t v14 = v12->var1;
  id v15 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v61 ofSize:v13 cubesCount:v14 textureType:3 withDevice:v15];
  uint64_t v16 = v61;
  id v9 = v61;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_fgCubesTexture[1], v16);
  if (!self->_isSingleFgCube) {
    goto LABEL_7;
  }
  v60 = v9;
  uint64_t v17 = self->_filterDescriptor;
  uint64_t v18 = v17->var0;
  uint64_t v19 = v17->var1;
  v20 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v60 ofSize:v18 cubesCount:v19 textureType:7 withDevice:v20];
  uint64_t v21 = v60;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
LABEL_20:
    FigDebugAssert3();
    id v9 = v21;
LABEL_25:
    [(FigColorCubeMetalFilter *)self releaseResources];
    goto LABEL_14;
  }
  uint64_t v22 = self->_fgCubesTextureTemp[0];
  self->_fgCubesTextureTemp[0] = v21;
  int v23 = v21;

  v59 = v23;
  v24 = self->_filterDescriptor;
  uint64_t v25 = v24->var0;
  uint64_t v26 = v24->var1;
  v27 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v59 ofSize:v25 cubesCount:v26 textureType:7 withDevice:v27];
  v28 = v59;
  id v9 = v59;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_fgCubesTextureTemp[1], v28);
LABEL_7:
  v29 = self->_filterDescriptor;
  if (!v29->var2)
  {
    int v8 = 0;
    goto LABEL_14;
  }
  v58 = v9;
  uint64_t v30 = v29->var0;
  uint64_t v31 = v29->var1;
  v32 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v58 ofSize:v30 cubesCount:v31 textureType:2 withDevice:v32];
  uint64_t v21 = v58;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
    goto LABEL_20;
  }
  v33 = self->_bgCubeTexture[0];
  self->_bgCubeTexture[0] = v21;
  v34 = v21;

  v57 = v34;
  v35 = self->_filterDescriptor;
  uint64_t v36 = v35->var0;
  uint64_t v37 = v35->var1;
  v38 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v57 ofSize:v36 cubesCount:v37 textureType:2 withDevice:v38];
  id v9 = v57;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
    goto LABEL_24;
  }
  v39 = self->_bgCubeTexture[1];
  self->_bgCubeTexture[1] = v9;
  v40 = v9;

  v56 = v40;
  v41 = self->_filterDescriptor;
  uint64_t v42 = v41->var0;
  uint64_t v43 = v41->var1;
  v44 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v56 ofSize:v42 cubesCount:v43 textureType:7 withDevice:v44];
  id v9 = v56;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
    goto LABEL_24;
  }
  v45 = self->_bgCubeTextureTemp[0];
  self->_bgCubeTextureTemp[0] = v9;
  v46 = v9;

  v55 = v46;
  v47 = self->_filterDescriptor;
  uint64_t v48 = v47->var0;
  uint64_t v49 = v47->var1;
  v50 = [(FigMetalContext *)self->_metal device];
  int v8 = +[FigColorCubeMetalFilter createCubeTexture:&v55 ofSize:v48 cubesCount:v49 textureType:7 withDevice:v50];
  v51 = v55;
  id v9 = v55;

  if (v8)
  {
    fig_log_get_emitter();
    uint64_t v54 = v2;
    LODWORD(v53) = v8;
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_bgCubeTextureTemp[1], v51);
LABEL_14:

  return v8;
}

- (int)setForegroundCubesWithNames:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = (void *)MEMORY[0x263F00640];
    id v9 = [v6 objectAtIndexedSubscript:0];
    uint64_t v10 = [v8 filterWithName:v9];

    if (objc_opt_respondsToSelector())
    {
      int v11 = [v10 cubeColorSpaceName];
      BOOL v12 = v11 == (void *)*MEMORY[0x263F001E8];
    }
    else
    {
      BOOL v12 = 1;
    }
    if ([v6 count] == 1) {
      int v13 = v12 ^ (self->_filterDescriptor->var3 == 0);
    }
    else {
      int v13 = 0;
    }
    BOOL v23 = v12;
  }
  else
  {
    BOOL v23 = 0;
    int v13 = 0;
  }
  if ([v7 count])
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    uint64_t v16 = 424;
    if (v13) {
      uint64_t v16 = 440;
    }
    uint64_t v17 = (char *)self + v16;
    while (1)
    {
      uint64_t v18 = [v7 objectAtIndexedSubscript:v14];
      int v19 = +[FigColorCubeMetalFilter loadCube:v18 ofSize:self->_filterDescriptor->var0 intoTexture:*(void *)&v17[8 * (self->_fgCubeToUseIndex ^ 1)] toSliceIndex:v15];

      if (v19) {
        break;
      }
      unint64_t v14 = (v15 + 1);
      unint64_t v15 = v14;
      if ([v7 count] <= v14) {
        goto LABEL_16;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = 1;
  }
  else
  {
LABEL_16:
    if (v13)
    {
      v20 = &self->super.isa + (self->_fgCubeToUseIndex ^ 1);
      [(FigColorCubeMetalFilter *)self convertCubeWithSrcTexture:v20[55] dstTexture:v20[53] isP3Cube:v23];
    }
    os_unfair_lock_lock(&self->_fgCubesHaveBeenUpdatedLock);
    self->_fgCubesHaveBeenUpdated = 1;
    os_unfair_lock_unlock(&self->_fgCubesHaveBeenUpdatedLock);
    int v21 = 0;
  }

  return v21;
}

- (int)setBackgroundCubeWithName:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v11 = 0;
    self->_useBgCube = 0;
    goto LABEL_15;
  }
  if (v6)
  {
    int v8 = [MEMORY[0x263F00640] filterWithName:v6];
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 cubeColorSpaceName];
      BOOL v10 = v9 == (void *)*MEMORY[0x263F001E8];
    }
    else
    {
      BOOL v10 = 1;
    }
    BOOL v13 = v10 ^ (self->_filterDescriptor->var3 == 0);

    uint64_t var0 = self->_filterDescriptor->var0;
    if (v13)
    {
      int v14 = 1;
      uint64_t v15 = 480;
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v10 = 0;
    uint64_t var0 = self->_filterDescriptor->var0;
  }
  int v14 = 0;
  uint64_t v15 = 464;
LABEL_11:
  if (+[FigColorCubeMetalFilter loadCube:v7 ofSize:var0 intoTexture:*(Class *)((char *)&self->super.isa + 8 * (self->_bgCubeToUseIndex ^ 1) + v15) toSliceIndex:0])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v11 = 1;
  }
  else
  {
    self->_useBgCube = 1;
    if (v14)
    {
      uint64_t v16 = &self->super.isa + (self->_bgCubeToUseIndex ^ 1);
      [(FigColorCubeMetalFilter *)self convertCubeWithSrcTexture:v16[60] dstTexture:v16[58] isP3Cube:v10];
    }
    os_unfair_lock_lock(&self->_bgCubesHaveBeenUpdatedLock);
    self->_bgCubesHaveBeenUpdated = 1;
    os_unfair_lock_unlock(&self->_bgCubesHaveBeenUpdatedLock);
    int v11 = 0;
  }
LABEL_15:

  return v11;
}

- (void)convertCubeWithSrcTexture:(id)a3 dstTexture:(id)a4 isP3Cube:(BOOL)a5
{
  BOOL v5 = a5;
  int v8 = (void *)MEMORY[0x263F129A0];
  id v9 = a4;
  id v10 = a3;
  int v11 = [v8 renderPassDescriptor];
  BOOL v12 = [(FigMetalContext *)self->_metal commandQueue];
  id v17 = [v12 commandBuffer];

  BOOL v13 = [v11 colorAttachments];
  int v14 = [v13 objectAtIndexedSubscript:0];
  [v14 setTexture:v9];

  uint64_t v15 = [v17 renderCommandEncoderWithDescriptor:v11];
  [v15 setRenderPipelineState:self->_cubeConvert[v5]];
  uint64_t v16 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
  [v15 setVertexBuffer:v16 offset:0 atIndex:0];

  [v15 setFragmentTexture:v10 atIndex:0];
  [v15 setFragmentBytes:self->_filterDescriptor length:4 atIndex:0];
  [v15 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v15 endEncoding];
  [v17 setLabel:@"FigColorCube::convert"];
  [v17 commit];
}

- (void)dealloc
{
  [(FigColorCubeMetalFilter *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)FigColorCubeMetalFilter;
  [(FigColorCubeMetalFilter *)&v3 dealloc];
}

- (int)purgeResources
{
  return 0;
}

- (int)releaseResources
{
  int v3 = [(FigColorCubeMetalFilter *)self purgeResources];
  id v4 = self->_fgCubesTexture[0];
  self->_fgCubesTexture[0] = 0;

  BOOL v5 = self->_fgCubesTexture[1];
  self->_fgCubesTexture[1] = 0;

  id v6 = self->_fgCubesTextureTemp[0];
  self->_fgCubesTextureTemp[0] = 0;

  id v7 = self->_fgCubesTextureTemp[1];
  self->_fgCubesTextureTemp[1] = 0;

  int v8 = self->_bgCubeTexture[0];
  self->_bgCubeTexture[0] = 0;

  id v9 = self->_bgCubeTexture[1];
  self->_bgCubeTexture[1] = 0;

  id v10 = self->_bgCubeTextureTemp[0];
  self->_bgCubeTextureTemp[0] = 0;

  int v11 = self->_bgCubeTextureTemp[1];
  self->_bgCubeTextureTemp[1] = 0;

  free(self->_filterDescriptor);
  self->_filterDescriptor = 0;
  return v3;
}

- (int)process
{
  int v2 = -[FigColorCubeMetalFilter runWithInputPixelBuffer:mattePixelBuffer:outputPixelBuffer:targetRectangle:](self, "runWithInputPixelBuffer:mattePixelBuffer:outputPixelBuffer:targetRectangle:", self->_inputPixelBuffer, self->_mattePixelbuffer, self->_outputPixelBuffer, self->_targetRectangle.origin.x, self->_targetRectangle.origin.y, self->_targetRectangle.size.width, self->_targetRectangle.size.height);
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2 != 0;
}

- (int)resetState
{
  return 0;
}

- (int)runWithInputPixelBuffer:(__CVBuffer *)a3 mattePixelBuffer:(__CVBuffer *)a4 outputPixelBuffer:(__CVBuffer *)a5 targetRectangle:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v84 = *MEMORY[0x263EF8340];
  p_bgCubesHaveBeenUpdatedLock = &self->_bgCubesHaveBeenUpdatedLock;
  os_unfair_lock_lock(&self->_bgCubesHaveBeenUpdatedLock);
  if (self->_bgCubesHaveBeenUpdated)
  {
    self->_bgCubeToUseIndex ^= 1u;
    self->_bgCubesHaveBeenUpdated = 0;
  }
  os_unfair_lock_unlock(p_bgCubesHaveBeenUpdatedLock);
  os_unfair_lock_lock(&self->_fgCubesHaveBeenUpdatedLock);
  if (self->_fgCubesHaveBeenUpdated)
  {
    self->_fgCubeToUseIndex ^= 1u;
    self->_fgCubesHaveBeenUpdated = 0;
  }
  os_unfair_lock_unlock(&self->_fgCubesHaveBeenUpdatedLock);
  fgCubesTexture = self->_fgCubesTexture;
  int v15 = [(MTLTexture *)self->_fgCubesTexture[self->_fgCubeToUseIndex] width];
  bgCubeTexture = self->_bgCubeTexture;
  uint64_t v16 = self->_bgCubeTexture[self->_bgCubeToUseIndex];
  if (!v16 || v15 == [(MTLTexture *)v16 width])
  {
    v17.i64[0] = v15;
    v17.i64[1] = v15 * v15;
    float64x2_t v18 = vcvtq_f64_s64(v17);
    v19.f64[0] = v18.f64[0] + -1.0;
    __asm { FMOV            V3.2D, #1.0 }
    v19.f64[1] = 1.0 / (v18.f64[0] + -1.0);
    float32x4_t v76 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v19), vdivq_f64(_Q3, v18));
    unint64_t v24 = byte_26ABE8C90 ? 10 : self->_yuvFormat;
    uint64_t v25 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:v24 usage:17 plane:0];
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      uint64_t v27 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a5 pixelFormat:v24 usage:22 plane:0];
      if (!v27)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v68 = FigSignalErrorAt();
        goto LABEL_46;
      }
      v28 = (void *)v27;
      if (byte_26ABE8C90)
      {
        uint64_t v29 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:30 usage:17 plane:1];
        if (!v29)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v68 = FigSignalErrorAt();
          goto LABEL_45;
        }
        uint64_t v30 = (void *)v29;
        v72 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a5 pixelFormat:30 usage:22 plane:1];
        if (!v72)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v68 = FigSignalErrorAt();
LABEL_58:

          goto LABEL_45;
        }
        if (a4) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v30 = 0;
        v72 = 0;
        if (a4)
        {
LABEL_16:
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
          metal = self->_metal;
          if (PixelFormatType == 1278226536)
          {
            uint64_t v33 = [(FigMetalContext *)metal bindPixelBufferToMTL2DTexture:a4 pixelFormat:25 usage:17 plane:0];
            if (!v33) {
              goto LABEL_57;
            }
          }
          else
          {
            uint64_t v33 = [(FigMetalContext *)metal bindPixelBufferToMTL2DTexture:a4 pixelFormat:10 usage:17 plane:0];
            if (!v33)
            {
LABEL_57:
              fig_log_get_emitter();
              FigDebugAssert3();
              int v68 = FigSignalErrorAt();

              goto LABEL_58;
            }
          }
LABEL_22:
          v71 = v30;
          v74 = (void *)v33;
          BOOL v35 = self->_useBgCube && v33 != 0;
          unint64_t v36 = [v28 height];
          unint64_t v37 = [v26 height];
          v38 = [MEMORY[0x263F129A0] renderPassDescriptor];
          v39 = [(FigMetalContext *)self->_metal commandQueue];
          v40 = [v39 commandBuffer];

          if (v40)
          {
            v75 = v28;
            v41 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
            v86.origin.double x = x;
            v86.origin.double y = y;
            v86.size.double width = width;
            v86.size.double height = height;
            if (CGRectIsNull(v86))
            {
LABEL_32:
              BOOL v52 = v36 > v37;
              uint64_t v53 = [v38 colorAttachments];
              uint64_t v54 = [v53 objectAtIndexedSubscript:0];
              [v54 setTexture:v75];

              v55 = [v40 renderCommandEncoderWithDescriptor:v38];
              v56 = v55;
              filterDescriptor = self->_filterDescriptor;
              uint64_t var3 = filterDescriptor->var3;
              BOOL var4 = filterDescriptor->var4;
              uint64_t v60 = 152;
              if (!byte_26ABE8C90) {
                uint64_t v60 = 24;
              }
              [v55 setRenderPipelineState:*(Class *)((char *)&self->super.isa + 64 * v35 + 32 * v52 + 16 * var3 + 8 * var4 + v60)];
              [v56 setVertexBuffer:v41 offset:0 atIndex:0];
              [v56 setFragmentTexture:v26 atIndex:0];
              if (byte_26ABE8C90) {
                [v56 setFragmentTexture:v71 atIndex:1];
              }
              [v56 setFragmentTexture:fgCubesTexture[self->_fgCubeToUseIndex] atIndex:2];
              if (v35)
              {
                [v56 setFragmentTexture:bgCubeTexture[self->_bgCubeToUseIndex] atIndex:3];
                [v56 setFragmentTexture:v74 atIndex:4];
              }
              [v56 setFragmentBytes:&v76 length:16 atIndex:0];
              unsigned int v61 = [v26 width];
              unint64_t v77 = __PAIR64__([v26 height], v61);
              [v56 setFragmentBytes:&v77 length:8 atIndex:1];
              [v56 setFragmentBytes:&self->_matteToInputPixelBufferRotationDegrees length:4 atIndex:2];
              [v56 drawPrimitives:4 vertexStart:0 vertexCount:4];
              [v56 endEncoding];
              if (byte_26ABE8C90)
              {
                id v62 = [v38 colorAttachments];
                v63 = [v62 objectAtIndexedSubscript:0];
                [v63 setTexture:v72];

                v64 = [v40 renderCommandEncoderWithDescriptor:v38];

                [v64 setRenderPipelineState:self->_colorCubePipelineStateUV[v35][v52][self->_filterDescriptor->var3][self->_filterDescriptor->var4]];
                v65 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
                [v64 setVertexBuffer:v65 offset:0 atIndex:0];

                [v64 setFragmentTexture:v26 atIndex:0];
                v66 = v71;
                [v64 setFragmentTexture:v71 atIndex:1];
                [v64 setFragmentTexture:fgCubesTexture[self->_fgCubeToUseIndex] atIndex:2];
                if (v35)
                {
                  [v64 setFragmentTexture:bgCubeTexture[self->_bgCubeToUseIndex] atIndex:3];
                  [v64 setFragmentTexture:v74 atIndex:4];
                }
                [v64 setFragmentBytes:&v76 length:16 atIndex:0];
                unsigned int v67 = [v71 width];
                unint64_t v77 = __PAIR64__([v71 height], v67);
                [v64 setFragmentBytes:&v77 length:8 atIndex:1];
                [v64 drawPrimitives:4 vertexStart:0 vertexCount:4];
                [v64 endEncoding];
                v28 = v75;
              }
              else
              {
                v64 = v56;
                v28 = v75;
                v66 = v71;
              }
              [v40 setLabel:@"FigColorCube::run"];
              [v40 commit];

              int v68 = 0;
              goto LABEL_44;
            }
            *(float *)&unsigned int v42 = x * 2.0 + -1.0;
            *(float *)&unsigned int v43 = y * -2.0 + 1.0;
            unint64_t v77 = __PAIR64__(v43, v42);
            float v44 = (x + width) * 2.0 + -1.0;
            float v78 = v44;
            unsigned int v79 = v43;
            float v45 = (y + height) * -2.0 + 1.0;
            unsigned int v80 = v42;
            float v81 = v45;
            float v82 = v44;
            float v83 = v45;
            v46 = [(FigMetalContext *)self->_metal device];
            uint64_t v47 = [v46 newBufferWithBytes:&v77 length:32 options:0];

            if (v47)
            {
              uint64_t v48 = [v38 colorAttachments];
              uint64_t v49 = [v48 objectAtIndexedSubscript:0];
              [v49 setLoadAction:1];

              v50 = [v38 colorAttachments];
              v51 = [v50 objectAtIndexedSubscript:0];
              [v51 setStoreAction:1];

              v41 = (void *)v47;
              goto LABEL_32;
            }
            fig_log_get_emitter();
            FigDebugAssert3();
            int v68 = FigSignalErrorAt();
            v28 = v75;
          }
          else
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            int v68 = FigSignalErrorAt();
          }
          v66 = v71;
LABEL_44:

LABEL_45:
LABEL_46:

          return v68;
        }
      }
      uint64_t v33 = 0;
      goto LABEL_22;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (id)createPipelineStateWithVertexFunction:(id)a3 fragmentName:(id)a4 isLuma:(BOOL)a5 useBgCube:(BOOL)a6 manyFgCubes:(BOOL)a7 colorSpace:(int)a8 mixInGammaDomain:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  BOOL v51 = a5;
  BOOL v50 = a6;
  BOOL v49 = a7;
  int v48 = a8;
  BOOL v47 = a9;
  int64x2_t v17 = objc_opt_new();
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
LABEL_21:
    unsigned int v42 = 0;
    goto LABEL_13;
  }
  float64x2_t v18 = [(FigMetalContext *)self->_metal pipelineLibrary];
  [v17 setPipelineLibrary:v18];

  [v17 setVertexFunction:v15];
  float64x2_t v19 = objc_opt_new();
  v20 = v19;
  if (!v19)
  {
    fig_log_get_emitter();
LABEL_20:
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();

    goto LABEL_21;
  }
  [v19 setConstantValue:&v51 type:53 atIndex:1];
  [v20 setConstantValue:&byte_26ABE8C90 type:53 atIndex:2];
  [v20 setConstantValue:&v50 type:53 atIndex:3];
  [v20 setConstantValue:&v49 type:53 atIndex:4];
  [v20 setConstantValue:&v48 type:29 atIndex:5];
  [v20 setConstantValue:&v47 type:53 atIndex:7];
  int v21 = [(FigMetalContext *)self->_metal library];
  uint64_t v22 = [(FigMetalContext *)self->_metal pipelineLibrary];
  BOOL v23 = (void *)[v21 newFunctionWithName:v16 constantValues:v20 pipelineLibrary:v22 error:0];
  [v17 setFragmentFunction:v23];

  unint64_t v24 = [v17 fragmentFunction];

  if (!v24)
  {
    fig_log_get_emitter();
    goto LABEL_20;
  }

  uint64_t v25 = objc_opt_new();
  uint64_t v26 = v25;
  if (!v25) {
    goto LABEL_22;
  }
  uint64_t v27 = [v25 attributes];
  v28 = [v27 objectAtIndexedSubscript:0];
  [v28 setFormat:29];

  uint64_t v29 = [v26 attributes];
  uint64_t v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setBufferIndex:0];

  uint64_t v31 = [v26 attributes];
  v32 = [v31 objectAtIndexedSubscript:0];
  [v32 setOffset:0];

  uint64_t v33 = [v26 layouts];
  v34 = [v33 objectAtIndexedSubscript:0];
  [v34 setStride:8];

  [v17 setVertexDescriptor:v26];
  if (byte_26ABE8C90)
  {
    BOOL v35 = v51;
    unint64_t v36 = [v17 colorAttachments];
    unint64_t v37 = [v36 objectAtIndexedSubscript:0];
    v38 = v37;
    uint64_t v39 = v35 ? 10 : 30;
  }
  else
  {
    unint64_t yuvFormat = self->_yuvFormat;
    unint64_t v36 = [v17 colorAttachments];
    unint64_t v37 = [v36 objectAtIndexedSubscript:0];
    v38 = v37;
    uint64_t v39 = yuvFormat;
  }
  [v37 setPixelFormat:v39];

  v41 = [(FigMetalContext *)self->_metal device];
  unsigned int v42 = (void *)[v41 newRenderPipelineStateWithDescriptor:v17 error:0];

  if (v42)
  {
    int v43 = 0;
  }
  else
  {
LABEL_22:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
    unsigned int v42 = 0;
  }

LABEL_13:
  if (v43) {
    float v44 = 0;
  }
  else {
    float v44 = v42;
  }
  id v45 = v44;

  return v45;
}

- (int)createPipelineStatesForCubeConversionWithVertexFunction:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = 0;
    cubeConvert = self->_cubeConvert;
    char v9 = 1;
    while (1)
    {
      char v10 = v9;
      char v34 = v6 & 1;
      [v5 setConstantValue:&v34 type:53 atIndex:6];
      int v11 = objc_opt_new();
      if (!v11) {
        goto LABEL_10;
      }
      BOOL v12 = [(FigMetalContext *)self->_metal pipelineLibrary];
      [v11 setPipelineLibrary:v12];

      [v11 setVertexFunction:v4];
      BOOL v13 = [(FigMetalContext *)self->_metal library];
      int v14 = [(FigMetalContext *)self->_metal pipelineLibrary];
      id v15 = (void *)[v13 newFunctionWithName:@"cubeColorConvertFrag" constantValues:v5 pipelineLibrary:v14 error:0];
      [v11 setFragmentFunction:v15];

      id v16 = [v11 fragmentFunction];

      if (!v16)
      {
LABEL_10:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v32 = FigSignalErrorAt();
        goto LABEL_12;
      }
      int64x2_t v17 = objc_opt_new();
      float64x2_t v18 = v17;
      if (!v17) {
        break;
      }
      float64x2_t v19 = [v17 attributes];
      v20 = [v19 objectAtIndexedSubscript:0];
      [v20 setFormat:29];

      int v21 = [v18 attributes];
      uint64_t v22 = [v21 objectAtIndexedSubscript:0];
      [v22 setBufferIndex:0];

      BOOL v23 = [v18 attributes];
      unint64_t v24 = [v23 objectAtIndexedSubscript:0];
      [v24 setOffset:0];

      uint64_t v25 = [v18 layouts];
      uint64_t v26 = [v25 objectAtIndexedSubscript:0];
      [v26 setStride:8];

      [v11 setVertexDescriptor:v18];
      uint64_t v27 = [v11 colorAttachments];
      v28 = [v27 objectAtIndexedSubscript:0];
      [v28 setPixelFormat:70];

      uint64_t v29 = [(FigMetalContext *)self->_metal device];
      uint64_t v30 = [v29 newRenderPipelineStateWithDescriptor:v11 error:0];
      uint64_t v31 = cubeConvert[v7];
      cubeConvert[v7] = (MTLRenderPipelineState *)v30;

      if (!cubeConvert[v7]) {
        break;
      }

      char v9 = 0;
      char v6 = 1;
      uint64_t v7 = 1;
      if ((v10 & 1) == 0)
      {
        int v32 = 0;
        goto LABEL_9;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();

LABEL_12:
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
  }
LABEL_9:

  return v32;
}

- (int)createPipelineStatesWithFragmentName:(id)a3 vertexFunction:(id)a4
{
  id v34 = a3;
  char v6 = 0;
  uint64_t v7 = 0;
  id v33 = a4;
  char v8 = 1;
  while (2)
  {
    char v9 = 0;
    uint64_t v10 = 0;
    char v30 = v8;
    char v11 = 1;
    do
    {
      uint64_t v12 = 0;
      char v31 = v11;
      char v13 = 1;
      while (2)
      {
        char v14 = 0;
        uint64_t v15 = 0;
        char v32 = v13;
        char v16 = 1;
        do
        {
          char v17 = v16;
          int v18 = byte_26ABE8C90;
          LOBYTE(v29) = v14 & 1;
          uint64_t v19 = [(FigColorCubeMetalFilter *)self createPipelineStateWithVertexFunction:v33 fragmentName:v34 isLuma:1 useBgCube:v9 & 1 manyFgCubes:v6 & 1 colorSpace:v12 mixInGammaDomain:v29];
          if (v18)
          {
            v20 = self->_colorCubePipelineStateY[v10][v7][v12];
            int v21 = v20[v15];
            v20[v15] = (MTLRenderPipelineState *)v19;

            if (!v20[v15]
              || (LOBYTE(v29) = v14,
                  [(FigColorCubeMetalFilter *)self createPipelineStateWithVertexFunction:v33 fragmentName:v34 isLuma:0 useBgCube:v9 & 1 manyFgCubes:v6 & 1 colorSpace:v12 mixInGammaDomain:v29], uint64_t v22 = objc_claimAutoreleasedReturnValue(), v23 = self->_colorCubePipelineStateUV[v10][v7][v12], v24 = v23[v15], v23[v15] = (MTLRenderPipelineState *)v22, v24, !v23[v15]))
            {
LABEL_15:
              fig_log_get_emitter();
              FigDebugAssert3();
              int v27 = FigSignalErrorAt();
              goto LABEL_16;
            }
          }
          else
          {
            uint64_t v25 = self->_colorCubePipelineState[v10][v7][v12];
            uint64_t v26 = v25[v15];
            v25[v15] = (MTLRenderPipelineState *)v19;

            if (!v25[v15]) {
              goto LABEL_15;
            }
          }
          char v16 = 0;
          char v14 = 1;
          uint64_t v15 = 1;
        }
        while ((v17 & 1) != 0);
        char v13 = 0;
        uint64_t v12 = 1;
        if (v32) {
          continue;
        }
        break;
      }
      char v11 = 0;
      char v9 = 1;
      uint64_t v10 = 1;
    }
    while ((v31 & 1) != 0);
    char v8 = 0;
    char v6 = 1;
    uint64_t v7 = 1;
    if (v30) {
      continue;
    }
    break;
  }
  int v27 = 0;
LABEL_16:

  return v27;
}

- (void)prewarmMetalInternalShader
{
  int v2 = self;
  v40[1] = *MEMORY[0x263EF8340];
  int v3 = [(FigMetalContext *)self->_metal commandQueue];
  id v4 = [v3 commandBuffer];

  BOOL v5 = objc_opt_new();
  char v6 = objc_opt_new();
  [v6 setWidth:2];
  [v6 setHeight:2];
  [v6 setDepth:1];
  [v6 setArrayLength:1];
  [v6 setUsage:7];
  if (!byte_26ABE8C90)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v39 = *MEMORY[0x263F04130];
    v40[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 8uLL, 8uLL, 0x34323066u, v7, &pixelBufferOut);
    if (!pixelBufferOut)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_13;
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v8 = [&unk_26DB36398 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      CFDictionaryRef v31 = v7;
      char v32 = v2;
      uint64_t v10 = v4;
      char v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v34;
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = v11;
        char v16 = v12;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(&unk_26DB36398);
          }
          char v17 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
          [v6 setTextureType:2];
          objc_msgSend(v6, "setPixelFormat:", (int)objc_msgSend(v17, "intValue"));
          int v18 = [(FigMetalContext *)v32->_metal device];
          char v11 = (void *)[v18 newTextureWithDescriptor:v6 iosurface:CVPixelBufferGetIOSurface(pixelBufferOut) plane:0];

          uint64_t v19 = [v5 colorAttachments];
          v20 = [v19 objectAtIndexedSubscript:0];
          [v20 setTexture:v11];

          uint64_t v12 = [v10 renderCommandEncoderWithDescriptor:v5];

          [v12 endEncoding];
          ++v14;
          uint64_t v15 = v11;
          char v16 = v12;
        }
        while (v9 != v14);
        uint64_t v9 = [&unk_26DB36398 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);

      id v4 = v10;
      int v2 = v32;
      CFDictionaryRef v7 = v31;
    }
    CFRelease(pixelBufferOut);
  }
  [v6 setTextureType:3];
  [v6 setPixelFormat:70];
  int v21 = [(FigMetalContext *)v2->_metal device];
  uint64_t v22 = (void *)[v21 newTextureWithDescriptor:v6];
  BOOL v23 = [v5 colorAttachments];
  unint64_t v24 = [v23 objectAtIndexedSubscript:0];
  [v24 setTexture:v22];

  uint64_t v25 = [v4 renderCommandEncoderWithDescriptor:v5];
  [v25 endEncoding];
  [v6 setTextureType:7];
  [v6 setPixelFormat:70];
  uint64_t v26 = [(FigMetalContext *)v2->_metal device];
  int v27 = (void *)[v26 newTextureWithDescriptor:v6];
  v28 = [v5 colorAttachments];
  uint64_t v29 = [v28 objectAtIndexedSubscript:0];
  [v29 setTexture:v27];

  char v30 = [v4 renderCommandEncoderWithDescriptor:v5];

  [v30 endEncoding];
  [(FigMetalContext *)v2->_metal prewarmInternalMetalShadersForFormatsList:&unk_26DB363F8];

LABEL_13:
}

- (int)createKernels
{
  int v3 = [(FigMetalContext *)self->_metal library];
  id v4 = (void *)[v3 newFunctionWithName:@"colorCubeVertex"];

  if (v4)
  {
    int v5 = [(FigColorCubeMetalFilter *)self createPipelineStatesWithFragmentName:@"colorCubeFragment2D" vertexFunction:v4];
    if (v5
      || (int v5 = [(FigColorCubeMetalFilter *)self createPipelineStatesForCubeConversionWithVertexFunction:v4]) != 0)
    {
      int v6 = v5;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_22703C664;
      block[3] = &unk_2647FC408;
      block[4] = self;
      if (qword_26ABE8C88 != -1) {
        dispatch_once(&qword_26ABE8C88, block);
      }
      int v6 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v6 = FigSignalErrorAt();
  }

  return v6;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- ($C7AD2F4C285567854F02E01F06575F34)filterDescriptor
{
  return self->_filterDescriptor;
}

- (void)setFilterDescriptor:(id *)a3
{
  self->_filterDescriptor = a3;
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  self->_inputPixelBuffer = a3;
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  self->_outputPixelBuffer = a3;
}

- (__CVBuffer)mattePixelbuffer
{
  return self->_mattePixelbuffer;
}

- (void)setMattePixelbuffer:(__CVBuffer *)a3
{
  self->_mattePixelbuffer = a3;
}

- (CGRect)targetRectangle
{
  double x = self->_targetRectangle.origin.x;
  double y = self->_targetRectangle.origin.y;
  double width = self->_targetRectangle.size.width;
  double height = self->_targetRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetRectangle:(CGRect)a3
{
  self->_targetRectangle = a3;
}

- (int)matteToInputPixelBufferRotationDegrees
{
  return self->_matteToInputPixelBufferRotationDegrees;
}

- (void)setMatteToInputPixelBufferRotationDegrees:(int)a3
{
  self->_matteToInputPixelBufferRotationDegrees = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_bgCubeTextureTemp[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_bgCubeTexture[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_fgCubesTextureTemp[k + 1], 0);
  for (uint64_t m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_fgCubesTexture[m + 1], 0);
  for (uint64_t n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_cubeConvert[n + 1], 0);
  for (iuint64_t i = 0; ii != -16; --ii)
    objc_storeStrong((id *)&self->_colorCubePipelineStateUV[1][1][1][ii + 1], 0);
  for (juint64_t j = 272; jj != 144; jj -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
    jj -= 8;
  }
  while (jj != 16);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end