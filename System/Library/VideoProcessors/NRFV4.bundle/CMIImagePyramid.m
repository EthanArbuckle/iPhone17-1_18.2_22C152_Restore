@interface CMIImagePyramid
+ (int)prewarmShaders:(id)a3;
- (BOOL)_levelArrayHasAllTextures;
- (BOOL)_levelArrayHasAnyTextures;
- (CMIImagePyramid)initWithMetalContext:(id)a3;
- (CMIImagePyramid)initWithMetalContext:(id)a3 descriptor:(id)a4;
- (id)getTextureAtLevel:(unint64_t)a3;
- (int)allocateLevel:(unint64_t)a3 withCompressionLevel:(int)a4 withLabel:(id)a5;
- (int)allocateLevel:(unint64_t)a3 withLabel:(id)a4;
- (int)allocateWithLabel:(id)a3;
- (int)configureWithDescriptor:(id)a3;
- (int)generate;
- (int)releaseAll;
- (int)releaseTextureAtLevel:(unint64_t)a3;
- (int)setTexture:(id)a3 atLevel:(int)a4;
- (unint64_t)getLevelCount;
@end

@implementation CMIImagePyramid

- (BOOL)_levelArrayHasAnyTextures
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  levelArray = self->_levelArray;
  if (levelArray)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = levelArray;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "texture", (void)v9);

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_levelArrayHasAllTextures
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  levelArray = self->_levelArray;
  if (!levelArray) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = levelArray;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "texture", (void)v11);

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (CMIImagePyramid)initWithMetalContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMIImagePyramid;
  uint64_t v6 = [(CMIImagePyramid *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v8 = +[CMIImagePyramidShared sharedInstance];
  uint64_t v9 = [v8 getShaders:v7->_metalContext];
  shaders = v7->_shaders;
  v7->_shaders = (CMIImagePyramidShaders *)v9;

  if (!v7->_shaders)
  {
LABEL_5:
    long long v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_6:
    long long v13 = 0;
    goto LABEL_7;
  }
  uint64_t v11 = objc_opt_new();
  levelArray = v7->_levelArray;
  v7->_levelArray = (NSMutableArray *)v11;

  *(_OWORD *)&v7->_width = 0u;
  *(_OWORD *)&v7->_levelCount = 0u;
  long long v13 = v7;
LABEL_7:

  return v13;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CMIImagePyramid alloc] initWithMetalContext:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (CMIImagePyramid)initWithMetalContext:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CMIImagePyramid;
  v8 = [(CMIImagePyramid *)&v12 init];
  if (!v8)
  {
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  uint64_t v9 = [(CMIImagePyramid *)v8 initWithMetalContext:v6];
  if ([(CMIImagePyramid *)v9 configureWithDescriptor:v7])
  {
LABEL_5:
    long long v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = v9;
  long long v10 = v9;
LABEL_6:

  return v10;
}

- (int)allocateWithLabel:(id)a3
{
  id v4 = a3;
  if (self->_levelCount)
  {
    uint64_t v5 = 0;
    while (1)
    {
      int v6 = [(CMIImagePyramid *)self allocateLevel:v5 withLabel:v4];
      if (v6) {
        break;
      }
      if (self->_levelCount <= ++v5) {
        goto LABEL_5;
      }
    }
    int v7 = v6;
    FigDebugAssert3();
  }
  else
  {
LABEL_5:
    int v7 = 0;
  }

  return v7;
}

- (int)allocateLevel:(unint64_t)a3 withLabel:(id)a4
{
  return [(CMIImagePyramid *)self allocateLevel:a3 withCompressionLevel:0xFFFFFFFFLL withLabel:a4];
}

- (int)allocateLevel:(unint64_t)a3 withCompressionLevel:(int)a4 withLabel:(id)a5
{
  id v8 = a5;
  levelArray = self->_levelArray;
  if (levelArray
    && self->_levelCount
    && [(NSMutableArray *)levelArray count] == self->_levelCount
    && [(NSMutableArray *)self->_levelArray count] > a3
    && ([(FigMetalContext *)self->_metalContext allocator],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = (void *)[v10 newTextureDescriptor],
        v10,
        v11))
  {
    objc_super v12 = [v11 desc];
    [v12 setUsage:7];

    uint64_t v13 = (self->_width >> a3);
    long long v14 = [v11 desc];
    [v14 setWidth:v13];

    uint64_t v15 = (self->_height >> a3);
    objc_super v16 = [v11 desc];
    [v16 setHeight:v15];

    if ((a4 & 0x80000000) == 0)
    {
      uint64_t v17 = [v11 desc];
      [v17 setCompressionFootprint:a4];
    }
    if (self->_type == 1)
    {
      v18 = [v11 desc];
      v19 = v18;
      uint64_t v20 = 25;
    }
    else
    {
      v18 = [v11 desc];
      v19 = v18;
      uint64_t v20 = 115;
    }
    [v18 setPixelFormat:v20];

    v21 = [(NSMutableArray *)self->_levelArray objectAtIndexedSubscript:a3];
    v22 = [v21 texture];

    if (!v22)
    {
      [v11 setLabel:0];
      v23 = [(FigMetalContext *)self->_metalContext allocator];
      v22 = (void *)[v23 newTextureWithDescriptor:v11];

      if (!v22)
      {
        v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
        int v34 = -73431;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v22 = 0;
        goto LABEL_18;
      }
      v24 = [(NSMutableArray *)self->_levelArray objectAtIndexedSubscript:a3];
      [v24 setTexture:v22];
    }
    uint64_t v25 = [v22 width];
    v26 = [v11 desc];
    uint64_t v27 = [v26 width];

    if (v25 != v27) {
      goto LABEL_20;
    }
    uint64_t v28 = [v22 height];
    v29 = [v11 desc];
    uint64_t v30 = [v29 height];

    if (v28 != v30) {
      goto LABEL_20;
    }
    uint64_t v31 = [v22 pixelFormat];
    v32 = [v11 desc];
    uint64_t v33 = [v32 pixelFormat];

    if (v31 == v33)
    {
      int v34 = 0;
    }
    else
    {
LABEL_20:
      v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      int v34 = -73431;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    int v34 = -73431;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v22 = 0;
    uint64_t v11 = 0;
  }
LABEL_18:

  return v34;
}

- (int)configureWithDescriptor:(id)a3
{
  id v4 = a3;
  if (([v4 _isValidWithLogError:1] & 1) == 0
    || !self->_levelArray
    || [(CMIImagePyramid *)self _levelArrayHasAnyTextures])
  {
    goto LABEL_13;
  }
  unint64_t v5 = [v4 levelCount];
  unint64_t v6 = [(NSMutableArray *)self->_levelArray count];
  if (v6 <= v5)
  {
    if (v6 >= v5 || [(NSMutableArray *)self->_levelArray count] >= v5) {
      goto LABEL_11;
    }
    while (1)
    {
      uint64_t v7 = objc_opt_new();
      if (!v7) {
        break;
      }
      id v8 = (void *)v7;
      *(void *)(v7 + 16) = [(NSMutableArray *)self->_levelArray count];
      [(NSMutableArray *)self->_levelArray addObject:v8];

      if ([(NSMutableArray *)self->_levelArray count] >= v5) {
        goto LABEL_11;
      }
    }
LABEL_13:
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    int v9 = -73431;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_12;
  }
  while ([(NSMutableArray *)self->_levelArray count] > v5)
    [(NSMutableArray *)self->_levelArray removeLastObject];
LABEL_11:
  self->_width = [v4 width];
  self->_height = [v4 height];
  self->_type = [v4 type];
  int v9 = 0;
  self->_levelCount = [v4 levelCount];
LABEL_12:

  return v9;
}

- (int)releaseTextureAtLevel:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_levelArray count] <= a3)
  {
    uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -73431;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->_levelArray objectAtIndexedSubscript:a3];
    [v5 setTexture:0];

    return 0;
  }
}

- (int)releaseAll
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_levelArray;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setTexture:", 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return 0;
}

- (unint64_t)getLevelCount
{
  return self->_levelCount;
}

- (id)getTextureAtLevel:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_levelArray count] <= a3)
  {
    long long v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_levelArray objectAtIndexedSubscript:a3];
    uint64_t v6 = [v5 texture];
  }

  return v6;
}

- (int)setTexture:(id)a3 atLevel:(int)a4
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_levelArray count] <= (unint64_t)a4)
  {
    long long v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v8 = -73431;
  }
  else
  {
    if (v6) {
      FigMetalIncRef();
    }
    uint64_t v7 = [(NSMutableArray *)self->_levelArray objectAtIndexedSubscript:a4];
    [v7 setTexture:v6];

    int v8 = 0;
  }

  return v8;
}

- (int)generate
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (![(CMIImagePyramid *)self _levelArrayHasAllTextures]) {
    goto LABEL_20;
  }
  if ((unint64_t)[(NSMutableArray *)self->_levelArray count] < 2) {
    return 0;
  }
  if (!self->_shaders
    || (int v3 = [(NSMutableArray *)self->_levelArray count],
        [(FigMetalContext *)self->_metalContext commandBuffer],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_20:
    unsigned int v26 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    int v16 = -73431;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_19:

    return v16;
  }
  uint64_t v5 = v4;
  [v4 setLabel:@"CMIImagePyramidDownscale"];
  if (v3 >= 2)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = (v3 - 1);
    int64x2_t v21 = vdupq_n_s64(0x10uLL);
    while (1)
    {
      long long v9 = v7;
      long long v10 = [(NSMutableArray *)self->_levelArray objectAtIndexedSubscript:v6];
      long long v11 = [v10 texture];

      objc_super v12 = [(NSMutableArray *)self->_levelArray objectAtIndexedSubscript:++v6];
      uint64_t v13 = [v12 texture];

      uint64_t v7 = [v5 computeCommandEncoder];

      if (!v7) {
        break;
      }
      [v7 setTexture:v11 atIndex:0];
      [v7 setTexture:v13 atIndex:1];
      [v7 setComputePipelineState:self->_shaders->_downscale2x];
      [v7 setImageblockWidth:16 height:16];
      uint64_t v14 = [v13 width];
      uint64_t v15 = [v13 height];
      v24[0] = v14;
      v24[1] = v15;
      v24[2] = 1;
      int64x2_t v22 = v21;
      uint64_t v23 = 1;
      [v7 dispatchThreads:v24 threadsPerThreadgroup:&v22];
      [v7 endEncoding];

      if (v8 == v6)
      {

        goto LABEL_10;
      }
    }
    unsigned int v26 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v19 = v26;
    if (os_log_type_enabled(v18, type)) {
      unsigned int v20 = v19;
    }
    else {
      unsigned int v20 = v19 & 0xFFFFFFFE;
    }
    if (v20)
    {
      int v27 = 136315138;
      uint64_t v28 = "-[CMIImagePyramid generate]";
      _os_log_send_and_compose_impl();
    }
    int v16 = -73431;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_19;
  }
LABEL_10:
  [(FigMetalContext *)self->_metalContext commit];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelArray, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end