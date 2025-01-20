@interface PTRenderPipeline
+ (BOOL)isMetalDeviceSupported:(id)a3;
+ (BOOL)isRenderVersionSupported:(unint64_t)a3;
+ (id)debugRenderOptions;
+ (int)prewarmForCameraCaptured;
+ (int)prewarmForMediaserverd;
+ (int)prewarmWithDescriptor:(id)a3;
+ (unint64_t)latestVersion;
+ (void)prewarmForCameraCaptured;
- (PTRenderPipeline)initWithDescriptor:(id)a3;
- (id)createRenderStateWithQuality:(int)a3;
- (id)description;
- (int)encodeRenderTo:(id)a3 withRenderRequest:(id)a4;
- (unint64_t)activeVersion;
- (unint64_t)minimumResourceHeapSize;
- (void)minimumResourceHeapSize;
- (void)prewarm;
- (void)setActiveVersion:(unint64_t)a3;
- (void)setResourceHeap:(id)a3;
@end

@implementation PTRenderPipeline

- (id)createRenderStateWithQuality:(int)a3
{
  v3 = [[PTRenderPipelineState alloc] initWithPipelineDescriptor:self->_descriptor metalContext:self->_metalContext quality:*(void *)&a3];

  return v3;
}

- (PTRenderPipeline)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PTRenderPipeline;
  v5 = [(PTRenderPipeline *)&v39 init];
  if (v5
    && ([v4 device],
        v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = +[PTRenderPipeline isMetalDeviceSupported:v6],
        v6,
        v7))
  {
    PTKTraceInit();
    kdebug_trace();
    v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PTRenderPipeline initWithDescriptor:](v8);
    }

    if (!v4)
    {
      v9 = _PTLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PTRenderPipeline initWithDescriptor:](v9);
      }
    }
    uint64_t v10 = [v4 copy];
    descriptor = v5->_descriptor;
    v5->_descriptor = (PTRenderPipelineDescriptor *)v10;

    v5->_activeVersion = [v4 version];
    v12 = [v4 options];
    uint64_t v13 = [v12 objectForKeyedSubscript:&unk_1F26C0F40];
    metalContext = v5->_metalContext;
    v5->_metalContext = (PTMetalContext *)v13;

    if (!v5->_metalContext)
    {
      v15 = [PTMetalContext alloc];
      v16 = [v4 device];
      uint64_t v17 = [(PTMetalContext *)v15 initWithDevice:v16 bundleClass:objc_opt_class()];
      v18 = v5->_metalContext;
      v5->_metalContext = (PTMetalContext *)v17;

      [(PTMetalContext *)v5->_metalContext setAllowCommandbufferAllocation:0];
    }
    v19 = NSString;
    [v4 disparitySize];
    unint64_t v21 = (unint64_t)v20;
    [v4 disparitySize];
    unint64_t v23 = (unint64_t)v22;
    [v4 disparitySize];
    unint64_t v25 = (unint64_t)v24;
    [v4 disparitySize];
    unint64_t v27 = (unint64_t)v26;
    [v4 colorInputSize];
    unint64_t v29 = (unint64_t)v28;
    [v4 colorInputSize];
    unint64_t v31 = (unint64_t)v30;
    [v4 colorOutputSize];
    unint64_t v33 = (unint64_t)v32;
    [v4 colorOutputSize];
    uint64_t v35 = objc_msgSend(v19, "stringWithFormat:", @"i-disp: %lux%lu u-disp: %lux%lu colorInput: %lux%lu colorOutput: %lux%lu", v21, v23, v25, v27, v29, v31, v33, (unint64_t)v34);
    description = v5->_description;
    v5->_description = (NSString *)v35;

    kdebug_trace();
    v37 = v5;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

+ (BOOL)isMetalDeviceSupported:(id)a3
{
  char v3 = [a3 supportsNonUniformThreadgroupSize];
  if ((v3 & 1) == 0)
  {
    id v4 = _PTLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[PTRenderPipeline isMetalDeviceSupported:]();
    }
  }
  return v3;
}

- (id)description
{
  return self->_description;
}

+ (id)debugRenderOptions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (BOOL)isRenderVersionSupported:(unint64_t)a3
{
  return +[PTRenderPipelineState classForVersion:a3] != 0;
}

+ (unint64_t)latestVersion
{
  return 3;
}

- (unint64_t)activeVersion
{
  return self->_activeVersion;
}

- (void)setActiveVersion:(unint64_t)a3
{
  self->_activeVersion = a3;
}

+ (int)prewarmWithDescriptor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  kdebug_trace();
  id v4 = [[PTRenderPipeline alloc] initWithDescriptor:v3];
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [&unk_1F26C1180 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(&unk_1F26C1180);
          }
          v9 = -[PTRenderPipeline createRenderStateWithQuality:](v4, "createRenderStateWithQuality:", [*(id *)(*((void *)&v13 + 1) + 8 * i) intValue]);
          if (([v9 prepareForRendering:1] & 1) == 0)
          {
            v11 = _PTLogSystem();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              +[PTRenderPipeline prewarmWithDescriptor:]();
            }

            goto LABEL_14;
          }
        }
        uint64_t v6 = [&unk_1F26C1180 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    kdebug_trace();
    int v10 = 0;
  }
  else
  {
LABEL_14:
    int v10 = -1;
  }

  return v10;
}

+ (int)prewarmForMediaserverd
{
  return +[PTRenderPipeline prewarmForCameraCaptured];
}

+ (int)prewarmForCameraCaptured
{
  v44[3] = *MEMORY[0x1E4F143B8];
  double v2 = CACurrentMediaTime();
  kdebug_trace();
  id v3 = MTLCreateSystemDefaultDevice();
  id v4 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorSize:disparitySize:", v3, 1, 2112.0, 1188.0, 320.0, 180.0);
  v44[0] = v4;
  uint64_t v5 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorSize:disparitySize:", v3, 2, 2112.0, 1188.0, 512.0, 288.0);
  v44[1] = v5;
  unint64_t v31 = v3;
  uint64_t v6 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorSize:disparitySize:", v3, 3, 2112.0, 1188.0, 512.0, 288.0);
  v44[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (!v9)
  {

LABEL_11:
    long long v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[PTRenderPipeline prewarmForCameraCaptured]();
    }

    goto LABEL_14;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v37 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = [*(id *)(*((void *)&v36 + 1) + 8 * i) version];
      v11 |= v14 == +[PTRenderPipeline latestVersion];
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v43 count:16];
  }
  while (v10);

  if ((v11 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_14:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    int v19 = 0;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        unint64_t v23 = (void *)MEMORY[0x1D25E42A0]();
        int v24 = +[PTRenderPipeline prewarmWithDescriptor:v22];
        if (v24)
        {
          int v25 = v24;
          double v26 = _PTLogSystem();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v41 = v25;
            _os_log_error_impl(&dword_1D0778000, v26, OS_LOG_TYPE_ERROR, "Failed to prewarm PTRenderPipeline (%d)", buf, 8u);
          }

          int v19 = v25;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v18);
  }
  else
  {
    int v19 = 0;
  }

  double v27 = CACurrentMediaTime() - v2;
  kdebug_trace();
  double v28 = _PTLogSystem();
  unint64_t v29 = v28;
  if (v27 <= 1.0)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      +[PTRenderPipeline prewarmForCameraCaptured];
    }
  }
  else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    +[PTRenderPipeline prewarmForCameraCaptured];
  }

  return v19;
}

- (void)prewarm
{
  id v3 = [PTRenderPipelineDescriptor alloc];
  id v4 = [(PTMetalContext *)self->_metalContext device];
  unint64_t v5 = +[PTRenderPipeline latestVersion];
  [(PTRenderPipelineDescriptor *)self->_descriptor colorInputSize];
  double v7 = v6;
  double v9 = v8;
  [(PTRenderPipelineDescriptor *)self->_descriptor disparitySize];
  uint64_t v12 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:](v3, "initWithDevice:version:colorSize:disparitySize:", v4, v5, v7, v9, v10, v11);

  +[PTRenderPipeline prewarmWithDescriptor:v12];
}

- (int)encodeRenderTo:(id)a3 withRenderRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v5 renderState];
  int v8 = [v7 encodeRenderTo:v6 withRenderRequest:v5];

  return v8;
}

- (unint64_t)minimumResourceHeapSize
{
  double v2 = _PTLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[PTRenderPipeline minimumResourceHeapSize]();
  }

  return 0;
}

- (void)setResourceHeap:(id)a3
{
  id v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[PTRenderPipeline setResourceHeap:]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  double v2 = "descriptor != nil";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithDescriptor:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 20240705;
  _os_log_debug_impl(&dword_1D0778000, log, OS_LOG_TYPE_DEBUG, "PortraitRuntimeAPIVersion %i", (uint8_t *)v1, 8u);
}

+ (void)isMetalDeviceSupported:.cold.1()
{
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEBUG, "PTRenderPipeline requires Metal support for Non Uniform Threadgroup Size", v1, 2u);
}

+ (void)prewarmWithDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "prepareForRendering failed", v2, v3, v4, v5, v6);
}

+ (void)prewarmForCameraCaptured
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Failed to prewarm PTRenderPipeline: latest version not included", v2, v3, v4, v5, v6);
}

- (void)minimumResourceHeapSize
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "minimumResourceHeapSize currently unsupported", v2, v3, v4, v5, v6);
}

- (void)setResourceHeap:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "setResourceHeap currently unsupported", v2, v3, v4, v5, v6);
}

@end