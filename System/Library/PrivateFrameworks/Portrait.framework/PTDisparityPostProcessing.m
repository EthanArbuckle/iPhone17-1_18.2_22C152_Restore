@interface PTDisparityPostProcessing
+ (int)prewarmForCameraCaptured;
+ (int)prewarmForMediaserverd;
+ (int)prewarmWithDescriptor:(id)a3;
+ (void)prewarmForCameraCaptured;
- (PTDisparityPostProcessing)initWithCommandQueue:(id)a3 disparitySize:(id *)a4 filteredDisparitySize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9;
- (PTDisparityPostProcessing)initWithDescriptor:(id)a3;
- (int)computeOpticalFlow:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5;
- (int)computeOpticalFlow:(id)a3 outDisplacement:(id)a4;
- (int)temporalDisparityFilter:(id)a3 inDisparity:(id)a4 inDisplacement:(id)a5 inDisparityFilteredPrev:(id)a6 outDisparityFiltered:(id)a7 disparityBias:(float)a8;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityFilteredPrev:(id)a5 outDisparityFiltered:(id)a6 disparityBias:(float)a7;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparityFiltered:(id)a7 outState:(id)a8;
- (int)temporalDisparityFilter:(id)a3 inStatePrev:(id)a4 inDisparity:(id)a5 outDisparityFiltered:(id)a6 outState:(id)a7;
- (void)reset;
@end

@implementation PTDisparityPostProcessing

- (PTDisparityPostProcessing)initWithCommandQueue:(id)a3 disparitySize:(id *)a4 filteredDisparitySize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v15 = a3;
  id v16 = a9;
  v50.receiver = self;
  v50.super_class = (Class)PTDisparityPostProcessing;
  v17 = [(PTDisparityPostProcessing *)&v50 init];
  if (!v17) {
    goto LABEL_10;
  }
  PTKTraceInit();
  kdebug_trace();
  long long v18 = *(_OWORD *)&a5->var0;
  *((void *)v17 + 5) = a5->var2;
  *(_OWORD *)(v17 + 24) = v18;
  unint64_t var2 = a4->var2;
  *((_OWORD *)v17 + 3) = *(_OWORD *)&a4->var0;
  *((void *)v17 + 8) = var2;
  unint64_t v20 = a7->var2;
  *(_OWORD *)(v17 + 72) = *(_OWORD *)&a7->var0;
  *((void *)v17 + 11) = v20;
  v21 = [[PTMetalContext alloc] initWithCommandQueue:v15 bundleClass:objc_opt_class()];
  v22 = (void *)*((void *)v17 + 2);
  *((void *)v17 + 2) = v21;

  if (!*((void *)v17 + 2))
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityPostProcessing initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:](v28, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_9;
  }
  v23 = [PTDisparityFilterDEMA_LKT alloc];
  uint64_t v24 = *((void *)v17 + 2);
  long long v48 = *(_OWORD *)&a4->var0;
  unint64_t v49 = a4->var2;
  long long v46 = *(_OWORD *)&a5->var0;
  unint64_t v47 = a5->var2;
  long long v44 = *(_OWORD *)&a7->var0;
  unint64_t v45 = a7->var2;
  uint64_t v25 = [(PTDisparityFilterDEMA_LKT *)v23 initWithMetalContext:v24 disparitySize:&v48 disparityFilteredSize:&v46 disparityPixelFormat:a6 colorSize:&v44 colorPixelFormat:a8 sensorPort:v16];
  v26 = (void *)*((void *)v17 + 1);
  *((void *)v17 + 1) = v25;

  if (!*((void *)v17 + 1))
  {
    v28 = _PTLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityPostProcessing initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:](v28, v36, v37, v38, v39, v40, v41, v42);
    }
LABEL_9:

LABEL_10:
    v27 = 0;
    goto LABEL_11;
  }
  kdebug_trace();
  v27 = v17;
LABEL_11:

  return v27;
}

- (PTDisparityPostProcessing)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 commandQueue];
  if (v4)
  {
    [v4 disparitySize];
    [v4 filteredDisparitySize];
    uint64_t v6 = [v4 disparityPixelFormat];
    [v4 colorSize];
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    memset(v12, 0, sizeof(v12));
    uint64_t v6 = [0 disparityPixelFormat];
    memset(v11, 0, sizeof(v11));
  }
  uint64_t v7 = [v4 colorPixelFormat];
  v8 = [v4 sensorPort];
  v9 = [(PTDisparityPostProcessing *)self initWithCommandQueue:v5 disparitySize:v13 filteredDisparitySize:v12 disparityPixelFormat:v6 colorSize:v11 colorPixelFormat:v7 sensorPort:v8];

  return v9;
}

+ (int)prewarmWithDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = [[PTDisparityPostProcessing alloc] initWithDescriptor:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -1;
  }

  return v5;
}

+ (int)prewarmForMediaserverd
{
  return +[PTDisparityPostProcessing prewarmForCameraCaptured];
}

+ (int)prewarmForCameraCaptured
{
  id v2 = MTLCreateSystemDefaultDevice();
  id v3 = (void *)[v2 newCommandQueue];
  long long v12 = xmmword_1D081FE70;
  uint64_t v13 = 1;
  long long v10 = xmmword_1D081FE70;
  uint64_t v11 = 1;
  long long v8 = xmmword_1D081FE70;
  uint64_t v9 = 1;
  id v4 = [[PTDisparityPostProcessingDescriptor alloc] initWithCommandQueue:v3 disparitySize:&v12 filteredDisparitySize:&v10 disparityPixelFormat:25 colorSize:&v8 colorPixelFormat:71 sensorPort:@"PortTypeBackSuperWide"];
  int v5 = +[PTDisparityPostProcessing prewarmWithDescriptor:v4];
  if (v5)
  {
    uint64_t v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PTDisparityPostProcessing prewarmForCameraCaptured];
    }
  }
  return v5;
}

- (int)computeOpticalFlow:(id)a3 outDisplacement:(id)a4
{
  int v5 = self;
  metalContext = self->_metalContext;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(PTMetalContext *)metalContext commandQueue];
  long long v10 = [v9 commandBuffer];

  LODWORD(v5) = [(PTDisparityPostProcessing *)v5 computeOpticalFlow:v10 inRGBA:v8 outDisplacement:v7];
  [v10 commit];

  return (int)v5;
}

- (int)computeOpticalFlow:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  $E8CF8C4D35898297CF58D66FCEA3D064 colorSize = self->_colorSize;
  if (isExpectedSize(v10, (uint64_t *)&colorSize, @"Invalid size of outDisplacement"))
  {
    if (!v8)
    {
      uint64_t v11 = _PTLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PTEffect updateEffectDelegate:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    int v19 = [(PTAbstractDisparityFilter *)self->_disparityFilter prepareFilter:v8 inRGBA:v9 outDisplacement:v10];
  }
  else
  {
    int v19 = -10;
  }

  return v19;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityFilteredPrev:(id)a5 outDisparityFiltered:(id)a6 disparityBias:(float)a7
{
  uint64_t v11 = self;
  metalContext = self->_metalContext;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [(PTMetalContext *)metalContext commandQueue];
  uint64_t v18 = [v17 commandBuffer];

  *(float *)&double v19 = a7;
  LODWORD(v11) = [(PTDisparityPostProcessing *)v11 temporalDisparityFilter:v18 inDisparity:v16 inDisplacement:v15 inDisparityFilteredPrev:v14 outDisparityFiltered:v13 disparityBias:v19];

  [v18 commit];
  return (int)v11;
}

- (int)temporalDisparityFilter:(id)a3 inDisparity:(id)a4 inDisplacement:(id)a5 inDisparityFilteredPrev:(id)a6 outDisparityFiltered:(id)a7 disparityBias:(float)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  $E8CF8C4D35898297CF58D66FCEA3D064 disparitySize = self->_disparitySize;
  if (isExpectedSize(v15, (uint64_t *)&disparitySize, @"Invalid size of inDisparity")
    && ($E8CF8C4D35898297CF58D66FCEA3D064 disparitySize = self->_colorSize,
        isExpectedSize(v16, (uint64_t *)&disparitySize, @"Invalid size of inDisplacement"))
    && ($E8CF8C4D35898297CF58D66FCEA3D064 disparitySize = self->_filteredDisparitySize,
        (isExpectedSize(v18, (uint64_t *)&disparitySize, @"Invalid size of outDisparity") & 1) != 0))
  {
    if (!v14)
    {
      unint64_t v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PTEffect updateEffectDelegate:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    *(float *)&double v19 = a8;
    int v28 = [(PTAbstractDisparityFilter *)self->_disparityFilter temporalDisparityFilter:v14 inDisplacement:v16 inDisparityPrev:v17 inDisparity:v15 outDisparity:v18 disparityBias:v19];
  }
  else
  {
    uint64_t v29 = _PTLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      unint64_t width = self->_disparitySize.width;
      unint64_t height = self->_disparitySize.height;
      uint64_t v35 = [v15 width];
      uint64_t v36 = [v15 height];
      LODWORD(disparitySize.width) = 134218752;
      *(unint64_t *)((char *)&disparitySize.width + 4) = width;
      WORD2(disparitySize.height) = 2048;
      *(unint64_t *)((char *)&disparitySize.height + 6) = height;
      HIWORD(disparitySize.depth) = 2048;
      uint64_t v38 = v35;
      __int16 v39 = 2048;
      uint64_t v40 = v36;
      _os_log_error_impl(&dword_1D0778000, v29, OS_LOG_TYPE_ERROR, "disparity size expected (%zu x %zu) was (%zu x %zu)", (uint8_t *)&disparitySize, 0x2Au);
    }

    uint64_t v30 = _PTLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:]();
    }

    uint64_t v31 = _PTLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:]();
    }

    int v28 = -10;
  }

  return v28;
}

- (int)temporalDisparityFilter:(id)a3 inStatePrev:(id)a4 inDisparity:(id)a5 outDisparityFiltered:(id)a6 outState:(id)a7
{
  uint64_t v11 = self;
  metalContext = self->_metalContext;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(PTMetalContext *)metalContext commandQueue];
  double v19 = [v18 commandBuffer];

  LODWORD(v11) = [(PTDisparityPostProcessing *)v11 temporalDisparityFilter:v19 inDisplacement:v17 inStatePrev:v16 inDisparity:v15 outDisparityFiltered:v14 outState:v13];
  [v19 commit];

  return (int)v11;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparityFiltered:(id)a7 outState:(id)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  $E8CF8C4D35898297CF58D66FCEA3D064 buf = self->_disparitySize;
  if (isExpectedSize(v17, (uint64_t *)&buf, @"Invalid size of inDisparity")
    && ($E8CF8C4D35898297CF58D66FCEA3D064 buf = self->_colorSize,
        isExpectedSize(v15, (uint64_t *)&buf, @"Invalid size of inDisplacement"))
    && ($E8CF8C4D35898297CF58D66FCEA3D064 buf = self->_filteredDisparitySize,
        (isExpectedSize(v18, (uint64_t *)&buf, @"Invalid size of outDisparityFiltered") & 1) != 0))
  {
    if (!v14)
    {
      unint64_t v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PTEffect updateEffectDelegate:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    int v28 = [(PTAbstractDisparityFilter *)self->_disparityFilter temporalDisparityFilter:v14 inDisplacement:v15 inStatePrev:v16 inDisparity:v17 outDisparity:v18 outState:v19];
  }
  else
  {
    uint64_t v29 = _PTLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      unint64_t width = self->_disparitySize.width;
      unint64_t height = self->_disparitySize.height;
      uint64_t v34 = [v17 width];
      uint64_t v35 = [v17 height];
      LODWORD(buf.width) = 134218752;
      *(unint64_t *)((char *)&buf.width + 4) = width;
      WORD2(buf.height) = 2048;
      *(unint64_t *)((char *)&buf.height + 6) = height;
      HIWORD(buf.depth) = 2048;
      uint64_t v38 = v34;
      __int16 v39 = 2048;
      uint64_t v40 = v35;
      _os_log_error_impl(&dword_1D0778000, v29, OS_LOG_TYPE_ERROR, "disparity size expected (%zu x %zu) was (%zu x %zu)", (uint8_t *)&buf, 0x2Au);
    }

    uint64_t v30 = _PTLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:]();
    }

    uint64_t v31 = _PTLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:]();
    }

    int v28 = -10;
  }

  return v28;
}

- (void)reset
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_disparityFilter, 0);
}

- (void)initWithCommandQueue:(uint64_t)a3 disparitySize:(uint64_t)a4 filteredDisparitySize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCommandQueue:(uint64_t)a3 disparitySize:(uint64_t)a4 filteredDisparitySize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prewarmForCameraCaptured
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Failed to prewarm PTDisparityPostProcessing (%d)", (uint8_t *)v2, 8u);
}

- (void)temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:.cold.2()
{
  OUTLINED_FUNCTION_3_4();
  [v0 width];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_2(&dword_1D0778000, v1, v2, "outDisparity size expected (%zu x %zu) was (%zu x %zu)", v3, v4, v5, v6, v7);
}

- (void)temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:.cold.3()
{
  OUTLINED_FUNCTION_3_4();
  [v0 width];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_2(&dword_1D0778000, v1, v2, "inDisplacement size expected (%zu x %zu) was (%zu x %zu)", v3, v4, v5, v6, v7);
}

@end