@interface PTGlobalReduction
- (PTGlobalReduction)initWithMetalContext:(id)a3 textureSize:(CGSize)a4;
- (PTGlobalReduction)initWithMetalContext:(id)a3 textureSize:(CGSize)a4 pixelFormat:(unint64_t)a5;
- (void)parallelReduction:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5 offset:(int)a6 pipelineState:(id)a7 reductionType:(int)a8 factor:(float)a9;
- (void)parallelReductionAverage:(id)a3 inTexture:(id)a4 outGlobalAverage:(id)a5;
- (void)parallelReductionMax:(id)a3 inTexture:(id)a4 globalMaxBuffer:(id)a5;
- (void)parallelReductionMin:(id)a3 inTexture:(id)a4 globalMinBuffer:(id)a5;
- (void)parallelReductionMinMax:(id)a3 inTexture:(id)a4 globalMinMaxBuffer:(id)a5;
- (void)parallelReductionTextureMinMaxSimd:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5;
- (void)parallelReductionTextureSimd:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5 offset:(int)a6 reductionType:(int)a7 factor:(float)a8;
@end

@implementation PTGlobalReduction

- (PTGlobalReduction)initWithMetalContext:(id)a3 textureSize:(CGSize)a4 pixelFormat:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  v125.receiver = self;
  v125.super_class = (Class)PTGlobalReduction;
  v11 = [(PTGlobalReduction *)&v125 init];
  v12 = v11;
  if (v11)
  {
    p_metalContext = (id *)&v11->_metalContext;
    objc_storeStrong((id *)&v11->_metalContext, a3);
    v14 = [(PTMetalContext *)v12->_metalContext device];
    v12->_supportGpuSIMD = [v14 supportsFamily:1007];

    if (v12->_supportGpuSIMD)
    {
      uint64_t v15 = [v10 computePipelineStateFor:@"parallelReductionTextureSimd" withConstants:0];
      parallelReductionTextureSimd = v12->_parallelReductionTextureSimd;
      v12->_parallelReductionTextureSimd = (MTLComputePipelineState *)v15;

      if (v12->_parallelReductionTextureSimd)
      {
        uint64_t v17 = [v10 computePipelineStateFor:@"parallelReductionTextureMinMaxSimd" withConstants:0];
        parallelReductionTextureMinMaxSimd = v12->_parallelReductionTextureMinMaxSimd;
        v12->_parallelReductionTextureMinMaxSimd = (MTLComputePipelineState *)v17;

        if (v12->_parallelReductionTextureMinMaxSimd)
        {
          unint64_t v19 = [(MTLComputePipelineState *)v12->_parallelReductionTextureSimd threadExecutionWidth];
          v12->simdReductionThreadsPerGroup.double width = 4;
          v12->simdReductionThreadsPerGroup.double height = v19 >> 2;
          v12->simdReductionThreadsPerGroup.depth = 1;
          if ([(MTLComputePipelineState *)v12->_parallelReductionTextureSimd maxTotalThreadsPerThreadgroup] < v12->simdReductionThreadsPerGroup.height* v12->simdReductionThreadsPerGroup.width)
          {
            v20 = _PTLogSystem();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:]0(v20, v21, v22, v23, v24, v25, v26, v27);
            }
          }
          id v124 = v10;
          v28 = objc_opt_new();
          int v29 = (int)width;
          signed int v30 = (int)height;
          int v31 = (int)height;
          int v32 = (int)width;
          while (1)
          {
            unint64_t v33 = 2 * v12->simdReductionThreadsPerGroup.width;
            unint64_t v34 = 2 * v12->simdReductionThreadsPerGroup.height;
            if (v33 >= v32 && v34 >= v31) {
              break;
            }
            int v32 = vcvtps_s32_f32((float)v32 / (float)v33);
            int v31 = vcvtps_s32_f32((float)v31 / (float)v34);
            v35 = [*p_metalContext textureUtil];
            v36 = [v35 createWithWidth:v32 height:v31 pixelFormat:a5];

            if (!v36)
            {
              v64 = _PTLogSystem();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.8(v64, v65, v66, v67, v68, v69, v70, v71);
              }
              goto LABEL_41;
            }
            [v28 addObject:v36];
          }
          uint64_t v93 = [v28 copy];
          simdTextures = v12->_simdTextures;
          v12->_simdTextures = (NSArray *)v93;

          for (i = objc_opt_new(); ; [i addObject:v28])
          {

            unint64_t v96 = 2 * v12->simdReductionThreadsPerGroup.width;
            unint64_t v97 = 2 * v12->simdReductionThreadsPerGroup.height;
            if (v96 >= v29 && v97 >= v30)
            {
              uint64_t v122 = [i copy];
              simdMinMaxTextures = v12->_simdMinMaxTextures;
              v12->_simdMinMaxTextures = (NSArray *)v122;

              id v10 = v124;
              goto LABEL_48;
            }
            int v29 = vcvtps_s32_f32((float)v29 / (float)v96);
            signed int v30 = 2 * vcvtps_s32_f32((float)v30 / (float)v97);
            v98 = [*p_metalContext textureUtil];
            v28 = [v98 createWithWidth:v29 height:v30 pixelFormat:a5];

            if (!v28) {
              break;
            }
          }
          v64 = _PTLogSystem();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.8(v64, v106, v107, v108, v109, v110, v111, v112);
          }
          v28 = i;
LABEL_41:
          id v10 = v124;

          goto LABEL_45;
        }
        v49 = _PTLogSystem();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.7(v49, v72, v73, v74, v75, v76, v77, v78);
        }
      }
      else
      {
        v49 = _PTLogSystem();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.6(v49, v57, v58, v59, v60, v61, v62, v63);
        }
      }
    }
    else
    {
      v37 = [(PTMetalContext *)v12->_metalContext textureUtil];
      uint64_t v38 = [v37 createWithWidth:(unint64_t)((width + 1.0) * 0.5) height:(unint64_t)((height + 1.0) * 0.5) pixelFormat:a5];
      texPing = v12->_texPing;
      v12->_texPing = (MTLTexture *)v38;

      if (v12->_texPing)
      {
        v40 = [(PTMetalContext *)v12->_metalContext textureUtil];
        uint64_t v41 = objc_msgSend(v40, "createWithWidth:height:pixelFormat:", (unint64_t)(-[MTLTexture width](v12->_texPing, "width") + 1) >> 1, (unint64_t)(-[MTLTexture height](v12->_texPing, "height") + 1) >> 1, a5);
        texPong = v12->_texPong;
        v12->_texPong = (MTLTexture *)v41;

        if (v12->_texPong)
        {
          uint64_t v43 = [v10 computePipelineStateFor:@"parallelReductionAverage" withConstants:0];
          parallelReductionAverage = v12->_parallelReductionAverage;
          v12->_parallelReductionAverage = (MTLComputePipelineState *)v43;

          if (v12->_parallelReductionAverage)
          {
            uint64_t v45 = [v10 computePipelineStateFor:@"parallelReductionMax" withConstants:0];
            parallelReductionMax = v12->_parallelReductionMax;
            v12->_parallelReductionMax = (MTLComputePipelineState *)v45;

            if (v12->_parallelReductionMax)
            {
              uint64_t v47 = [v10 computePipelineStateFor:@"parallelReductionMin" withConstants:0];
              parallelReductionMin = v12->_parallelReductionMin;
              v12->_parallelReductionMin = (MTLComputePipelineState *)v47;

              if (v12->_parallelReductionMin)
              {
LABEL_48:
                v120 = v12;
                goto LABEL_46;
              }
              v49 = _PTLogSystem();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.5(v49, v50, v51, v52, v53, v54, v55, v56);
              }
            }
            else
            {
              v49 = _PTLogSystem();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.4(v49, v113, v114, v115, v116, v117, v118, v119);
              }
            }
          }
          else
          {
            v49 = _PTLogSystem();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
              -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:](v49, v99, v100, v101, v102, v103, v104, v105);
            }
          }
        }
        else
        {
          v49 = _PTLogSystem();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:](v49, v86, v87, v88, v89, v90, v91, v92);
          }
        }
      }
      else
      {
        v49 = _PTLogSystem();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:](v49, v79, v80, v81, v82, v83, v84, v85);
        }
      }
    }
  }
LABEL_45:
  v120 = 0;
LABEL_46:

  return v120;
}

- (PTGlobalReduction)initWithMetalContext:(id)a3 textureSize:(CGSize)a4
{
  return -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:](self, "initWithMetalContext:textureSize:pixelFormat:", a3, 25, a4.width, a4.height);
}

- (void)parallelReductionAverage:(id)a3 inTexture:(id)a4 outGlobalAverage:(id)a5
{
  parallelReductionAverage = self->_parallelReductionAverage;
  id v9 = a5;
  id v10 = a4;
  id v13 = a3;
  uint64_t v11 = [v10 width];
  double v12 = 1.0 / (double)(unint64_t)([v10 height] * v11);
  *(float *)&double v12 = v12;
  [(PTGlobalReduction *)self parallelReduction:v13 inTexture:v10 globalBuffer:v9 offset:0 pipelineState:parallelReductionAverage reductionType:2 factor:v12];
}

- (void)parallelReductionMax:(id)a3 inTexture:(id)a4 globalMaxBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v10 length] <= 3)
  {
    double v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTGlobalReduction parallelReductionMax:inTexture:globalMaxBuffer:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  LODWORD(v11) = 1.0;
  [(PTGlobalReduction *)self parallelReduction:v8 inTexture:v9 globalBuffer:v10 offset:0 pipelineState:self->_parallelReductionMax reductionType:1 factor:v11];
}

- (void)parallelReductionMin:(id)a3 inTexture:(id)a4 globalMinBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v10 length] <= 3)
  {
    double v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTGlobalReduction parallelReductionMax:inTexture:globalMaxBuffer:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  LODWORD(v11) = 1.0;
  [(PTGlobalReduction *)self parallelReduction:v8 inTexture:v9 globalBuffer:v10 offset:0 pipelineState:self->_parallelReductionMin reductionType:0 factor:v11];
}

- (void)parallelReductionMinMax:(id)a3 inTexture:(id)a4 globalMinMaxBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v10 length] <= 7)
  {
    double v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTGlobalReduction parallelReductionMinMax:inTexture:globalMinMaxBuffer:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  if (self->_supportGpuSIMD)
  {
    [(PTGlobalReduction *)self parallelReductionTextureMinMaxSimd:v8 inTexture:v9 globalBuffer:v10];
  }
  else
  {
    LODWORD(v11) = 1.0;
    [(PTGlobalReduction *)self parallelReduction:v8 inTexture:v9 globalBuffer:v10 offset:0 pipelineState:self->_parallelReductionMin reductionType:0 factor:v11];
    LODWORD(v20) = 1.0;
    [(PTGlobalReduction *)self parallelReduction:v8 inTexture:v9 globalBuffer:v10 offset:4 pipelineState:self->_parallelReductionMax reductionType:1 factor:v20];
  }
}

- (void)parallelReduction:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5 offset:(int)a6 pipelineState:(id)a7 reductionType:(int)a8 factor:(float)a9
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v12 = *(void *)&a6;
  id v16 = a4;
  id v17 = a5;
  uint64_t v51 = (MTLComputePipelineState *)a7;
  if (self->_supportGpuSIMD)
  {
    *(float *)&double v18 = a9;
    [(PTGlobalReduction *)self parallelReductionTextureSimd:a3 inTexture:v16 globalBuffer:v17 offset:v12 reductionType:v10 factor:v18];
  }
  else
  {
    v49 = self;
    uint64_t v19 = [a3 computeCommandEncoder];
    if (!v19)
    {
      double v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    id v50 = v17;
    int v28 = [v16 width];
    int v29 = [v16 height];
    int v30 = v29;
    if (v28 > 1 || v29 >= 2)
    {
      int v31 = 0;
      p_texPing = &self->_texPing;
      p_texPong = &self->_texPong;
      uint64_t v46 = (int)v12;
      while (1)
      {
        int v32 = v30;
        *(float *)&uint64_t v33 = (double)v28 + -0.5;
        float v34 = (double)v30 + -0.5;
        *((float *)&v33 + 1) = v34;
        uint64_t v56 = v33;
        float v55 = 0.0;
        uint64_t v35 = objc_msgSend(v16, "width", v46);
        float v55 = (float)(unint64_t)([v16 height] * v35);
        if (v28 >= -1) {
          int v36 = v28 + 1;
        }
        else {
          int v36 = v28 + 2;
        }
        if (v30 >= -1) {
          int v37 = v30 + 1;
        }
        else {
          int v37 = v30 + 2;
        }
        if (v31) {
          uint64_t v38 = p_texPing;
        }
        else {
          uint64_t v38 = p_texPong;
        }
        v39 = *v38;
        if (v31) {
          v40 = (id *)p_texPong;
        }
        else {
          v40 = (id *)p_texPing;
        }
        id v41 = *v40;
        if (v31) {
          v42 = v39;
        }
        else {
          v42 = (MTLTexture *)v16;
        }
        uint64_t v43 = v42;
        if ((v28 - 1) <= 1 && (v32 - 1) <= 1)
        {

          id v41 = 0;
        }
        [v19 setComputePipelineState:v51];
        [v19 setTexture:v43 atIndex:0];
        [v19 setTexture:v41 atIndex:1];
        [v19 setBuffer:v50 offset:v46 atIndex:0];
        if (v49->_parallelReductionAverage == v51)
        {
          [v19 setBytes:&v56 length:8 atIndex:1];
          [v19 setBytes:&v55 length:4 atIndex:2];
        }
        int v44 = v36 >> 1;
        int v30 = v37 >> 1;
        v54[0] = v44;
        v54[1] = v30;
        v54[2] = 1;
        int64x2_t v52 = vdupq_n_s64(8uLL);
        uint64_t v53 = 1;
        [v19 dispatchThreads:v54 threadsPerThreadgroup:&v52];

        ++v31;
        BOOL v45 = v28 <= 2;
        int v28 = v44;
        if (v45)
        {
          int v28 = v44;
          if (v32 <= 2) {
            break;
          }
        }
      }
    }
    [v19 endEncoding];

    id v17 = v50;
  }
}

- (void)parallelReductionTextureSimd:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5 offset:(int)a6 reductionType:(int)a7 factor:(float)a8
{
  id v31 = a4;
  id v14 = a5;
  int v36 = a7;
  float v35 = a8;
  uint64_t v15 = [a3 computeCommandEncoder];
  if (!v15)
  {
    id v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  [(NSArray *)self->_simdTextures count];
  unint64_t v24 = 0;
  do
  {
    if (v24)
    {
      id v25 = [(NSArray *)self->_simdTextures objectAtIndexedSubscript:v24 - 1];
    }
    else
    {
      id v25 = v31;
    }
    uint64_t v26 = v25;
    if (v24 == [(NSArray *)self->_simdTextures count])
    {
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = [(NSArray *)self->_simdTextures objectAtIndexedSubscript:v24];
    }
    unint64_t v28 = (unint64_t)([v26 width] + 1) >> 1;
    unint64_t v29 = (unint64_t)([v26 height] + 1) >> 1;
    [v15 setComputePipelineState:self->_parallelReductionTextureSimd];
    [v15 setTexture:v26 atIndex:0];
    [v15 setTexture:v27 atIndex:1];
    [v15 setBytes:&v35 length:4 atIndex:0];
    [v15 setBuffer:v14 offset:a6 atIndex:1];
    [v15 setBytes:&v36 length:4 atIndex:2];
    v34[0] = v28;
    v34[1] = v29;
    v34[2] = 1;
    long long v32 = *(_OWORD *)&self->simdReductionThreadsPerGroup.width;
    unint64_t depth = self->simdReductionThreadsPerGroup.depth;
    [v15 dispatchThreads:v34 threadsPerThreadgroup:&v32];
  }
  while ([(NSArray *)self->_simdTextures count] > v24++);
  [v15 endEncoding];
}

- (void)parallelReductionTextureMinMaxSimd:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5
{
  *(void *)&v24[5] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v18 = a4;
  id v8 = a5;
  [(NSArray *)self->_simdMinMaxTextures count];
  unint64_t v9 = 0;
  do
  {
    if (v9)
    {
      id v10 = [(NSArray *)self->_simdMinMaxTextures objectAtIndexedSubscript:v9 - 1];
    }
    else
    {
      id v10 = v18;
    }
    double v11 = v10;
    if (v9 == [(NSArray *)self->_simdMinMaxTextures count])
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = [(NSArray *)self->_simdMinMaxTextures objectAtIndexedSubscript:v9];
    }
    uint64_t v13 = [v11 width];
    uint64_t v14 = [v11 height];
    uint64_t v15 = [v19 computeCommandEncoder];
    if (!v15)
    {
      id v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PTGlobalReduction parallelReductionTextureMinMaxSimd:inTexture:globalBuffer:](buf, v24, v16);
      }
    }
    [v15 setComputePipelineState:self->_parallelReductionTextureMinMaxSimd];
    [v15 setTexture:v11 atIndex:0];
    [v15 setTexture:v12 atIndex:1];
    [v15 setBuffer:v8 offset:0 atIndex:0];
    v22[0] = (unint64_t)(v13 + 1) >> 1;
    v22[1] = (unint64_t)(v14 + 1) >> 1;
    v22[2] = 1;
    long long v20 = *(_OWORD *)&self->simdReductionThreadsPerGroup.width;
    unint64_t depth = self->simdReductionThreadsPerGroup.depth;
    [v15 dispatchThreads:v22 threadsPerThreadgroup:&v20];
    [v15 endEncoding];
  }
  while ([(NSArray *)self->_simdMinMaxTextures count] > v9++);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallelReductionMin, 0);
  objc_storeStrong((id *)&self->_parallelReductionMax, 0);
  objc_storeStrong((id *)&self->_parallelReductionAverage, 0);
  objc_storeStrong((id *)&self->_parallelReductionTextureMinMaxSimd, 0);
  objc_storeStrong((id *)&self->_parallelReductionTextureSimd, 0);
  objc_storeStrong((id *)&self->_simdMinMaxTextures, 0);
  objc_storeStrong((id *)&self->_simdTextures, 0);
  objc_storeStrong((id *)&self->_texPong, 0);
  objc_storeStrong((id *)&self->_texPing, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parallelReductionMax:(uint64_t)a3 inTexture:(uint64_t)a4 globalMaxBuffer:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parallelReductionMinMax:(uint64_t)a3 inTexture:(uint64_t)a4 globalMinMaxBuffer:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parallelReductionTextureMinMaxSimd:(uint8_t *)buf inTexture:(void *)a2 globalBuffer:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "computeEncoder";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", buf, 0xCu);
}

@end