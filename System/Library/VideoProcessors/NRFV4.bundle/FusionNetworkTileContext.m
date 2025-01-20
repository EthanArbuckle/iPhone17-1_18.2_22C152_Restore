@interface FusionNetworkTileContext
- (FusionNetworkTileContext)initWithMetal:(id)a3 withInstance:(unint64_t)a4;
- (MTLTexture)srNoiseMap;
- (id)gaussianImagePyramidsForFrame:(int)a3;
- (id)gaussianNoisePyramidsForFrame:(int)a3;
- (id)laplacianImagePyramidsForFrame:(int)a3;
- (id)laplacianPyramid;
- (int)generatePyramidsWithCommandBuffer:(id)a3;
- (void)dealloc;
- (void)setSrNoiseMap:(id)a3;
@end

@implementation FusionNetworkTileContext

- (FusionNetworkTileContext)initWithMetal:(id)a3 withInstance:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FusionNetworkTileContext;
  v6 = [(FusionNetworkTileContext *)&v34 init];
  if (v6)
  {
    v7 = [v5 allocator];
    v8 = (void *)[v7 newTextureDescriptor];

    if (v8)
    {
      v9 = [v8 desc];
      [v9 setCompressionMode:2];

      v10 = [v8 desc];
      [v10 setCompressionFootprint:0];

      v11 = [v8 desc];
      [v11 setUsage:7];

      v12 = [v8 desc];
      [v12 setPixelFormat:115];

      v13 = [v8 desc];
      [v13 setWidth:568];

      v14 = [v8 desc];
      [v14 setHeight:496];

      [v8 setLabel:0];
      v15 = [v5 allocator];
      uint64_t v16 = [v15 newTextureWithDescriptor:v8];
      srNoiseMap = v6->_srNoiseMap;
      v6->_srNoiseMap = (MTLTexture *)v16;

      if (v6->_srNoiseMap)
      {
        uint64_t v18 = 0;
        gaussianImagePyramids = v6->_gaussianImagePyramids;
        laplacianImagePyramids = v6->_laplacianImagePyramids;
        gaussianNoisePyramids = v6->_gaussianNoisePyramids;
        char v22 = 1;
        while (1)
        {
          char v23 = v22;
          v24 = [[DeepFusionGaussianPyramid alloc] initWithMetalContext:v5 withFilter:1];
          v25 = gaussianImagePyramids[v18];
          gaussianImagePyramids[v18] = v24;

          if (!gaussianImagePyramids[v18]) {
            break;
          }
          v26 = [[DeepFusionLaplacianPyramid alloc] initWithMetalContext:v5];
          v27 = laplacianImagePyramids[v18];
          laplacianImagePyramids[v18] = v26;

          if (!laplacianImagePyramids[v18]) {
            break;
          }
          v28 = [[DeepFusionGaussianPyramid alloc] initWithMetalContext:v5 withFilter:1];
          v29 = gaussianNoisePyramids[v18];
          gaussianNoisePyramids[v18] = v28;

          if (!gaussianNoisePyramids[v18]
            || -[DeepFusionPyramidBaseClass setWidth:height:pixelFormat:numLevels:](gaussianImagePyramids[v18], "setWidth:height:pixelFormat:numLevels:", 568, 496, 115, 4)|| -[DeepFusionPyramidBaseClass setWidth:height:pixelFormat:numLevels:](laplacianImagePyramids[v18], "setWidth:height:pixelFormat:numLevels:", 568, 496, 115, 3)|| -[DeepFusionPyramidBaseClass setWidth:height:pixelFormat:numLevels:](gaussianNoisePyramids[v18], "setWidth:height:pixelFormat:numLevels:", 568, 496, 115,
                 4)
            || [(DeepFusionPyramidBaseClass *)gaussianImagePyramids[v18] allocateTextures:0]
            || [(DeepFusionPyramidBaseClass *)laplacianImagePyramids[v18] allocateTextures:0]
            || [(DeepFusionPyramidBaseClass *)gaussianNoisePyramids[v18] allocateTextures:0])
          {
            break;
          }
          char v22 = 0;
          uint64_t v18 = 1;
          if ((v23 & 1) == 0)
          {
            v30 = v6;
            goto LABEL_16;
          }
        }
      }
    }
    v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v30 = 0;
LABEL_16:
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;

  return v31;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  gaussianImagePyramids = self->_gaussianImagePyramids;
  laplacianImagePyramids = self->_laplacianImagePyramids;
  gaussianNoisePyramids = self->_gaussianNoisePyramids;
  char v7 = 1;
  do
  {
    char v8 = v7;
    [(DeepFusionPyramidBaseClass *)gaussianImagePyramids[v3] releaseTextures];
    [(DeepFusionPyramidBaseClass *)laplacianImagePyramids[v3] releaseTextures];
    [(DeepFusionPyramidBaseClass *)gaussianNoisePyramids[v3] releaseTextures];
    v9 = gaussianImagePyramids[v3];
    gaussianImagePyramids[v3] = 0;

    v10 = laplacianImagePyramids[v3];
    laplacianImagePyramids[v3] = 0;

    v11 = gaussianNoisePyramids[v3];
    gaussianNoisePyramids[v3] = 0;

    char v7 = 0;
    uint64_t v3 = 1;
  }
  while ((v8 & 1) != 0);
  FigMetalDecRef();
  srNoiseMap = self->_srNoiseMap;
  self->_srNoiseMap = 0;

  v13.receiver = self;
  v13.super_class = (Class)FusionNetworkTileContext;
  [(FusionNetworkTileContext *)&v13 dealloc];
}

- (id)gaussianImagePyramidsForFrame:(int)a3
{
  return [(DeepFusionPyramidBaseClass *)self->_gaussianImagePyramids[a3] outputTextureArray];
}

- (id)laplacianImagePyramidsForFrame:(int)a3
{
  return [(DeepFusionPyramidBaseClass *)self->_laplacianImagePyramids[a3] outputTextureArray];
}

- (id)gaussianNoisePyramidsForFrame:(int)a3
{
  return [(DeepFusionPyramidBaseClass *)self->_gaussianNoisePyramids[a3] outputTextureArray];
}

- (id)laplacianPyramid
{
  return self->_laplacianImagePyramids[0];
}

- (int)generatePyramidsWithCommandBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  gaussianImagePyramids = self->_gaussianImagePyramids;
  laplacianImagePyramids = self->_laplacianImagePyramids;
  gaussianNoisePyramids = self->_gaussianNoisePyramids;
  char v9 = 1;
  while (1)
  {
    char v10 = v9;
    v11 = gaussianImagePyramids[v5];
    v12 = [(DeepFusionPyramidBaseClass *)v11 outputTextureArray];
    objc_super v13 = [v12 objectAtIndexedSubscript:0];
    int v14 = [(DeepFusionGaussianPyramid *)v11 computeUsing:v4 inTex:v13];

    if (v14) {
      break;
    }
    int v15 = [(DeepFusionLaplacianPyramid *)laplacianImagePyramids[v5] computeUsing:v4 gaussianPyramid:gaussianImagePyramids[v5] upsamplingFilter:1];
    if (v15)
    {
      int v14 = v15;
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      goto LABEL_11;
    }
    uint64_t v16 = gaussianNoisePyramids[v5];
    v17 = [(DeepFusionPyramidBaseClass *)v16 outputTextureArray];
    uint64_t v18 = [v17 objectAtIndexedSubscript:0];
    int v14 = [(DeepFusionGaussianPyramid *)v16 computeUsing:v4 inTex:v18];

    if (v14) {
      break;
    }
    char v9 = 0;
    uint64_t v5 = 1;
    if ((v10 & 1) == 0)
    {
      int v14 = 0;
      goto LABEL_7;
    }
  }
  v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
LABEL_11:
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_7:
  return v14;
}

- (MTLTexture)srNoiseMap
{
  return self->_srNoiseMap;
}

- (void)setSrNoiseMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srNoiseMap, 0);
  for (uint64_t i = 48; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 16);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end