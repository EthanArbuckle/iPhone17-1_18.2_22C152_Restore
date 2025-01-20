@interface SingleColorCubeCorrectionStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)canApplyMaskedCube;
- (id)init:(id)a3 alternateCubeSize:(unsigned int)a4 alternateCubeData:(const char *)a5 defaultCubeSize:(unsigned int)a6 defaultCubeData:(const char *)a7;
- (id)init:(id)a3 cubeSize:(unsigned int)a4 data:(const char *)a5;
- (int)load3DTextureFromData:(const char *)a3 cubeSize:(unsigned int)a4 metal:(id)a5 outTexture:(id *)a6;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6;
@end

@implementation SingleColorCubeCorrectionStage

- (id)init:(id)a3 cubeSize:(unsigned int)a4 data:(const char *)a5
{
  return [(SingleColorCubeCorrectionStage *)self init:a3 alternateCubeSize:0 alternateCubeData:0 defaultCubeSize:*(void *)&a4 defaultCubeData:a5];
}

- (id)init:(id)a3 alternateCubeSize:(unsigned int)a4 alternateCubeData:(const char *)a5 defaultCubeSize:(unsigned int)a6 defaultCubeData:(const char *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a4;
  id v13 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SingleColorCubeCorrectionStage;
  v14 = [(SingleColorCubeCorrectionStage *)&v21 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v14->_metal, a3);
  v16 = +[SingleColorCubeCorrectionStageShared sharedInstance];
  uint64_t v17 = [v16 getShaders:v15->_metal];
  shaders = v15->_shaders;
  v15->_shaders = (ColorCubeCorrectionShaders *)v17;

  if (!v15->_shaders)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_14:
    v19 = 0;
    goto LABEL_10;
  }
  if (v10 && a5)
  {
    v15->_canApplyMaskedCube = 1;
    if ([(SingleColorCubeCorrectionStage *)v15 load3DTextureFromData:a5 cubeSize:v10 metal:v13 outTexture:&v15->_alternateCubeTexture])
    {
      goto LABEL_13;
    }
  }
  else
  {
    v15->_canApplyMaskedCube = 0;
  }
  if ([(SingleColorCubeCorrectionStage *)v15 load3DTextureFromData:a7 cubeSize:v8 metal:v13 outTexture:&v15->_defaultCubeTexture])
  {
LABEL_13:
    FigDebugAssert3();
    goto LABEL_14;
  }
  v19 = v15;
LABEL_10:

  return v19;
}

- (int)load3DTextureFromData:(const char *)a3 cubeSize:(unsigned int)a4 metal:(id)a5 outTexture:(id *)a6
{
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263F12A50]);
  v11 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  [v10 setTextureType:7];
  [v11 setWidth:a4];
  [v11 setHeight:a4];
  [v11 setDepth:a4];
  [v11 setPixelFormat:70];
  [v11 setUsage:1];
  v12 = [v9 device];
  id v13 = (void *)[v12 newTextureWithDescriptor:v11];
  id v14 = *a6;
  *a6 = v13;

  id v15 = *a6;
  if (*a6)
  {
    memset(v18, 0, 24);
    v18[3] = a4;
    v18[4] = a4;
    v18[5] = a4;
    [v15 replaceRegion:v18 mipmapLevel:0 slice:0 withBytes:a3 bytesPerRow:4 * a4 bytesPerImage:4 * a4 * a4];
    int v16 = 0;
  }
  else
  {
LABEL_5:
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
  }

  return v16;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = +[SingleColorCubeCorrectionStageShared sharedInstance];
  v5 = [v4 getShaders:v3];

  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = -12786;
  }

  return v6;
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12 && ![(SingleColorCubeCorrectionStage *)self canApplyMaskedCube])
  {
    FigDebugAssert3();
  }
  else
  {
    id v14 = [(FigMetalContext *)self->_metal commandQueue];
    id v15 = [v14 commandBuffer];

    if (!v15)
    {
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
      goto LABEL_11;
    }
    int v16 = [v15 computeCommandEncoder];
    if (!v16)
    {
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();

      goto LABEL_11;
    }
    uint64_t v17 = v16;
    uint64_t v18 = 16;
    if (!v12) {
      uint64_t v18 = 8;
    }
    [v16 setComputePipelineState:*(Class *)((char *)&self->_shaders->super.isa + v18)];
    [v17 setImageblockWidth:32 height:32];
    [v17 setTexture:v10 atIndex:0];
    [v17 setTexture:v11 atIndex:1];
    [v17 setTexture:v13 atIndex:2];
    [v17 setTexture:self->_defaultCubeTexture atIndex:4];
    if (v12)
    {
      [v17 setTexture:self->_alternateCubeTexture atIndex:3];
      [v17 setTexture:v12 atIndex:5];
    }
    v23[0] = [v13 width];
    v23[1] = [v13 height];
    v23[2] = 1;
    int64x2_t v21 = vdupq_n_s64(0x10uLL);
    uint64_t v22 = 1;
    [v17 dispatchThreads:v23 threadsPerThreadgroup:&v21];
    [v17 endEncoding];
    [v15 commit];
  }
  int v19 = 0;
LABEL_11:

  return v19;
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5
{
  return [(SingleColorCubeCorrectionStage *)self runOnLuma:a3 andChroma:a4 withMask:0 outChroma:a5];
}

- (BOOL)canApplyMaskedCube
{
  return self->_canApplyMaskedCube;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_alternateCubeTexture, 0);

  objc_storeStrong((id *)&self->_defaultCubeTexture, 0);
}

@end