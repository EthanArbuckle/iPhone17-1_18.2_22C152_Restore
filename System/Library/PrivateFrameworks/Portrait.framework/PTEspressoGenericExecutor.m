@interface PTEspressoGenericExecutor
+ (unint64_t)getEspressoMetalDeviceId:(id)a3;
- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3;
- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3 url:(id)a4 inputNames:(id)a5 outputNames:(id)a6 tensorSwapNames:(id)a7 reshapeNetworkSize:(id *)a8 configuration:(id)a9;
- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3 url:(id)a4 inputNames:(id)a5 outputNames:(id)a6 tensorSwapNames:(id)a7 reshapeNetworkSize:(id *)a8 configuration:(id)a9 ANEConfig:(id)a10;
- (id)getInputResourceWithName:(id)a3;
- (id)getOutputResourceWithName:(id)a3;
- (id)getResourceWithName:(id)a3 fromMap:(id)a4;
- (id)networkVersion;
- (signed)bindBuffers:(id)a3 toMap:(id)a4 isInput:(BOOL)a5;
- (signed)bindTensorSwaps:(id)a3;
- (unsigned)bindInputResourceWithName:(id)a3 to:(__CVBuffer *)a4;
- (unsigned)convertBindInput:(id)a3;
- (unsigned)convertBindOutput:(id)a3;
- (unsigned)execute;
- (unsigned)executeAsync;
- (unsigned)executeAsync:(id)a3;
- (unsigned)executeAsync:(id)a3 metalContext:(id)a4;
- (unsigned)tensorSwap:(int)a3;
- (void)convertInterleavedWithMetalContext:(id)a3 inInterleaved:(id)a4 outPlanar:(id)a5;
- (void)convertPlanarWithMetalContext:(id)a3 inPlanarTexture:(id)a4 outInterleaved:(id)a5;
- (void)dealloc;
- (void)execute;
@end

@implementation PTEspressoGenericExecutor

- (signed)bindBuffers:(id)a3 toMap:(id)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v8;
  uint64_t v49 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (!v49)
  {
    signed __int16 v39 = 0;
    goto LABEL_49;
  }
  uint64_t v48 = *(void *)v63;
  BOOL v45 = v5;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v43 = (uint64_t *)&v67;
  uint64_t v10 = 64;
  if (v5) {
    uint64_t v10 = 56;
  }
  uint64_t v44 = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v49; ++i)
    {
      if (*(void *)v63 != v48) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v62 + 1) + 8 * i);
      v13 = objc_msgSend(v9, "objectForKeyedSubscript:", v12, v43);

      if (v13)
      {
        v40 = _PTLogSystem();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[PTEspressoGenericExecutor bindBuffers:toMap:isInput:].cold.4();
        }

        goto LABEL_48;
      }
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      *(_OWORD *)surface = 0u;
      long long v52 = 0u;
      id v14 = v12;
      [v14 UTF8String];
      if (espresso_network_bind_buffer())
      {
        v41 = _PTLogSystem();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[PTEspressoGenericExecutor bindBuffers:toMap:isInput:]();
        }

LABEL_48:
        signed __int16 v39 = -1;
        goto LABEL_49;
      }
      IOSurfaceRef v15 = surface[0];
      CVPixelBufferRef pixelBufferOut = 0;
      if (CVPixelBufferCreateWithIOSurface(allocator, surface[0], 0, &pixelBufferOut))
      {
        v16 = _PTLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[PTTensorSwapPair initWithIOSurfaces:names:](buf, &v69, v16);
        }
      }
      CVPixelBufferRef v17 = pixelBufferOut;
      v18 = [(PTMetalContext *)self->_metalContext device];
      v19 = +[PTPixelBufferUtil getMTLTextureDescriptor:v17 device:v18];

      uint64_t v20 = [v19 height];
      if (v20 == *((void *)&v56 + 1))
      {
        uint64_t v21 = [v19 width];
        if (v21 == (void)v56)
        {
          v22 = [(PTMetalContext *)self->_metalContext device];
          v23 = (void *)[v22 newTextureWithDescriptor:v19 iosurface:v15 plane:0];
          [v9 setObject:v23 forKeyedSubscript:v14];
          goto LABEL_38;
        }
      }
      int v24 = v57;
      CVPixelBufferRef v25 = pixelBufferOut;
      v26 = [(PTMetalContext *)self->_metalContext device];
      v22 = +[PTPixelBufferUtil getMTLTextureDescriptor:v25 device:v26];

      if ([v22 pixelFormat] == 10)
      {
        BOOL v27 = v24 == 2;
        uint64_t v28 = 80;
        uint64_t v29 = 30;
      }
      else
      {
        if ([v22 pixelFormat] != 25)
        {
          v31 = _PTLogSystem();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[PTEspressoGenericExecutor bindBuffers:toMap:isInput:](v66, v22, v43, v31);
          }

          goto LABEL_28;
        }
        BOOL v27 = v24 == 2;
        uint64_t v28 = 115;
        uint64_t v29 = 65;
      }
      if (v27) {
        uint64_t v30 = v29;
      }
      else {
        uint64_t v30 = v28;
      }
      [v22 setPixelFormat:v30];
LABEL_28:
      uint64_t v32 = [v22 height];
      if (v32 == *((void *)&v56 + 1))
      {
        [v22 setWidth:(void)v56];
        v23 = [(PTMetalContext *)self->_metalContext device];
        uint64_t v33 = [v23 newTextureWithDescriptor:v22 iosurface:v15 plane:0];
        v34 = (void *)v33;
      }
      else
      {
        objc_msgSend(v22, "setHeight:");
        v35 = [(PTMetalContext *)self->_metalContext device];
        uint64_t v33 = [v35 newTextureWithDescriptor:v22];

        v36 = [(PTMetalContext *)self->_metalContext device];
        v34 = (void *)[v36 newTextureWithDescriptor:v19 iosurface:v15 plane:0];

        if (v45) {
          v37 = (void *)v33;
        }
        else {
          v37 = v34;
        }
        if (v45) {
          v38 = v34;
        }
        else {
          v38 = (void *)v33;
        }
        [*(id *)((char *)&self->super.isa + v44) addObject:v37];
        [*(id *)((char *)&self->super.isa + v44) addObject:v38];
        v23 = (void *)v33;
      }
      [v9 setObject:v33 forKeyedSubscript:v14];

LABEL_38:
      CVPixelBufferRelease(pixelBufferOut);
    }
    signed __int16 v39 = 0;
    uint64_t v49 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v49) {
      continue;
    }
    break;
  }
LABEL_49:

  return v39;
}

- (id)getResourceWithName:(id)a3 fromMap:(id)a4
{
  return (id)[a4 objectForKeyedSubscript:a3];
}

- (id)getInputResourceWithName:(id)a3
{
  return [(PTEspressoGenericExecutor *)self getResourceWithName:a3 fromMap:self->_inputsMap];
}

- (id)networkVersion
{
  return self->_networkVersion;
}

- (id)getOutputResourceWithName:(id)a3
{
  return [(PTEspressoGenericExecutor *)self getResourceWithName:a3 fromMap:self->_outputsMap];
}

- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3 url:(id)a4 inputNames:(id)a5 outputNames:(id)a6 tensorSwapNames:(id)a7 reshapeNetworkSize:(id *)a8 configuration:(id)a9
{
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = +[PTInference ANEConfigForSynchronousWork];
  v23 = [(PTEspressoGenericExecutor *)self initWithMetalContext:v21 url:v20 inputNames:v19 outputNames:v18 tensorSwapNames:v17 reshapeNetworkSize:a8 configuration:v16 ANEConfig:v22];

  return v23;
}

- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3 url:(id)a4 inputNames:(id)a5 outputNames:(id)a6 tensorSwapNames:(id)a7 reshapeNetworkSize:(id *)a8 configuration:(id)a9 ANEConfig:(id)a10
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  v23 = [(PTEspressoGenericExecutor *)self initWithMetalContext:a3];
  int v24 = v23;
  if (!v23) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v23->_url, a4);
  dispatch_queue_t v25 = dispatch_queue_create("monocular-depth-sync", 0);
  espressoCallbackQueue = v24->_espressoCallbackQueue;
  v24->_espressoCallbackQueue = (OS_dispatch_queue *)v25;

  uint64_t v27 = objc_opt_new();
  inputInterleavedToPlanarConint version = v24->_inputInterleavedToPlanarConversion;
  v24->_inputInterleavedToPlanarConint version = (NSMutableArray *)v27;

  uint64_t v29 = objc_opt_new();
  outputPlanarToInterleavedConint version = v24->_outputPlanarToInterleavedConversion;
  v24->_outputPlanarToInterleavedConint version = (NSMutableArray *)v29;

  [v22 espressoEngine];
  uint64_t context = espresso_create_context();
  v24->_ctx = (void *)context;
  if (!context)
  {
    v34 = _PTLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:]();
    }
    goto LABEL_11;
  }
  v24->_plan = (void *)espresso_create_plan();
  id v32 = [v17 path];
  [v32 UTF8String];
  int v33 = espresso_plan_add_network();

  if (v33)
  {
    v34 = _PTLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:]0();
    }
  }
  else
  {
    [v22 espressoPlanPriority];
    if (espresso_plan_set_priority())
    {
      v34 = _PTLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.9();
      }
    }
    else
    {
      int version = espresso_network_get_version();
      v38 = _PTLogSystem();
      networkVersion = v38;
      if (version)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.8(networkVersion);
        }
      }
      else
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.7();
        }

        uint64_t v40 = [NSString stringWithUTF8String:v46];
        networkVersion = v24->_networkVersion;
        v24->_networkVersion = (NSString *)v40;
      }

      if (!v21
        || ([v21 UTF8String],
            !espresso_network_select_configuration()))
      {
        if (a8)
        {
          v34 = [v18 objectAtIndexedSubscript:0];
          [v34 UTF8String];
          if (espresso_network_change_input_blob_shapes_seq())
          {
            v41 = _PTLogSystem();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.5();
            }

            goto LABEL_11;
          }
        }
        if (espresso_plan_build())
        {
          v34 = _PTLogSystem();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.4();
          }
        }
        else
        {
          [(PTEspressoGenericExecutor *)v24 bindTensorSwaps:v20];
          uint64_t v42 = objc_opt_new();
          inputsMap = v24->_inputsMap;
          v24->_inputsMap = (NSMutableDictionary *)v42;

          if ([(PTEspressoGenericExecutor *)v24 bindBuffers:v18 toMap:v24->_inputsMap isInput:1])
          {
            v34 = _PTLogSystem();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:]();
            }
          }
          else
          {
            uint64_t v44 = objc_opt_new();
            outputsMap = v24->_outputsMap;
            v24->_outputsMap = (NSMutableDictionary *)v44;

            if (![(PTEspressoGenericExecutor *)v24 bindBuffers:v19 toMap:v24->_outputsMap isInput:0])
            {
              v35 = v24;
              goto LABEL_13;
            }
            v34 = _PTLogSystem();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:]();
            }
          }
        }
        goto LABEL_11;
      }
      v34 = _PTLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.6();
      }
    }
  }
LABEL_11:

LABEL_12:
  v35 = 0;
LABEL_13:

  return v35;
}

- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PTEspressoGenericExecutor;
  v6 = [(PTEspressoGenericExecutor *)&v29 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [v5 computePipelineStateFor:@"interleavedToPlanar" withConstants:0];
  interleavedToPlanar = v7->_interleavedToPlanar;
  v7->_interleavedToPlanar = (MTLComputePipelineState *)v8;

  if (!v7->_interleavedToPlanar)
  {
    v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTEspressoGenericExecutor initWithMetalContext:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_9;
  }
  uint64_t v10 = [v5 computePipelineStateFor:@"planarToInterleaved" withConstants:0];
  planarToInterleaved = v7->_planarToInterleaved;
  v7->_planarToInterleaved = (MTLComputePipelineState *)v10;

  if (!v7->_planarToInterleaved)
  {
    v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTEspressoGenericExecutor initWithMetalContext:](v13, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_9:

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v12 = v7;
LABEL_11:

  return v12;
}

- (signed)bindTensorSwaps:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSMutableArray *)objc_opt_new();
  tensorSwap = self->_tensorSwap;
  self->_tensorSwap = v5;

  v18[0] = 0;
  v18[1] = 0;
  if ([v4 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0);
      id v8 = objc_claimAutoreleasedReturnValue();
      [v8 UTF8String];
      int v9 = espresso_network_bind_buffer();

      if (v9) {
        break;
      }
      v18[v7 & 1] = v17;
      if (v7)
      {
        uint64_t v10 = [PTTensorSwapPair alloc];
        v11 = objc_msgSend(v4, "subarrayWithRange:", v7 - 1, 2);
        v12 = [(PTTensorSwapPair *)v10 initWithIOSurfaces:v18 names:v11];

        [(NSMutableArray *)self->_tensorSwap addObject:v12];
      }
      if ([v4 count] <= (unint64_t)++v7) {
        goto LABEL_7;
      }
    }
    uint64_t v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(PTEspressoGenericExecutor *)v4 bindTensorSwaps:v14];
    }

    int v13 = 1;
  }
  else
  {
LABEL_7:
    int v13 = 0;
  }

  return v13 << 31 >> 31;
}

+ (unint64_t)getEspressoMetalDeviceId:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = MTLCreateSystemDefaultDevice();
  v13[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  uint64_t v6 = [v5 count];
  uint64_t v7 = [v3 registryID];
  if (v6)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = [v5 objectAtIndexedSubscript:v9];
      uint64_t v11 = [v10 registryID];

      if (v11 == v8) {
        break;
      }
      if (v6 == ++v9) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v9 = -1;
  }

  return v9;
}

- (unsigned)bindInputResourceWithName:(id)a3 to:(__CVBuffer *)a4
{
  [a3 UTF8String];
  unsigned int result = espresso_network_bind_cvpixelbuffer();
  if (result)
  {
    id v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PTEspressoGenericExecutor bindInputResourceWithName:to:]();
    }

    return -1;
  }
  return result;
}

- (unsigned)convertBindInput:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_inputInterleavedToPlanarConversion count])
  {
    id v5 = [v4 commandBuffer];

    if (!v5)
    {
      uint64_t v6 = _PTLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[PTEspressoGenericExecutor convertBindInput:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    if ([(NSMutableArray *)self->_inputInterleavedToPlanarConversion count])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = [(NSMutableArray *)self->_inputInterleavedToPlanarConversion objectAtIndexedSubscript:v14];
        uint64_t v16 = [(NSMutableArray *)self->_inputInterleavedToPlanarConversion objectAtIndexedSubscript:v14 + 1];
        [(PTEspressoGenericExecutor *)self convertInterleavedWithMetalContext:v4 inInterleaved:v15 outPlanar:v16];

        v14 += 2;
      }
      while ([(NSMutableArray *)self->_inputInterleavedToPlanarConversion count] > v14);
    }
    [v4 commitAndWaitUntilScheduled];
  }

  return 0;
}

- (unsigned)convertBindOutput:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_outputPlanarToInterleavedConversion count])
  {
    id v5 = [v4 commandBuffer];

    if (!v5)
    {
      uint64_t v6 = _PTLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[PTEspressoGenericExecutor convertBindInput:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    if ([(NSMutableArray *)self->_outputPlanarToInterleavedConversion count])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = [(NSMutableArray *)self->_outputPlanarToInterleavedConversion objectAtIndexedSubscript:v14];
        uint64_t v16 = [(NSMutableArray *)self->_outputPlanarToInterleavedConversion objectAtIndexedSubscript:v14 + 1];
        [(PTEspressoGenericExecutor *)self convertPlanarWithMetalContext:v4 inPlanarTexture:v15 outInterleaved:v16];

        v14 += 2;
      }
      while ([(NSMutableArray *)self->_outputPlanarToInterleavedConversion count] > v14);
    }
    [v4 commitAndWaitUntilScheduled];
  }

  return 0;
}

- (unsigned)execute
{
  unsigned int result = [(PTEspressoGenericExecutor *)self convertBindInput:self->_metalContext];
  if (!result)
  {
    if (espresso_plan_execute_sync())
    {
      id v4 = _PTLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[PTEspressoGenericExecutor execute]();
      }

      return -2;
    }
    else
    {
      metalContext = self->_metalContext;
      return [(PTEspressoGenericExecutor *)self convertBindOutput:metalContext];
    }
  }
  return result;
}

- (unsigned)executeAsync:(id)a3
{
  return [(PTEspressoGenericExecutor *)self executeAsync:a3 metalContext:self->_metalContext];
}

- (unsigned)executeAsync:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  unsigned int v7 = [(PTEspressoGenericExecutor *)self convertBindInput:a4];
  if (!v7)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    id v11 = v6;
    if (espresso_plan_submit())
    {
      uint64_t v8 = _PTLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PTEspressoGenericExecutor executeAsync:metalContext:]();
      }

      unsigned int v7 = -2;
    }
    else
    {
      unsigned int v7 = -[PTEspressoGenericExecutor convertBindOutput:](self, "convertBindOutput:", self->_metalContext, v10, 3221225472, __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke, &unk_1E6884530, self, v11);
    }
  }
  return v7;
}

uint64_t __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke(uint64_t a1, int *a2)
{
  if (a2)
  {
    id v4 = _PTLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke_cold_1(a2, a1, v4);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unsigned)executeAsync
{
  return [(PTEspressoGenericExecutor *)self executeAsync:0];
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)PTEspressoGenericExecutor;
  [(PTEspressoGenericExecutor *)&v3 dealloc];
}

- (void)convertInterleavedWithMetalContext:(id)a3 inInterleaved:(id)a4 outPlanar:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v8 height];
  int v19 = v11 / [v9 height];
  uint64_t v12 = [v10 commandBuffer];

  uint64_t v13 = [v12 computeCommandEncoder];

  [v13 setComputePipelineState:self->_interleavedToPlanar];
  [v13 setTexture:v9 atIndex:0];
  [v13 setTexture:v8 atIndex:1];

  [v13 setBytes:&v19 length:4 atIndex:0];
  uint64_t v14 = [v9 width];
  uint64_t v15 = [v9 height];

  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  long long v16 = xmmword_1D081FED0;
  uint64_t v17 = 1;
  [v13 dispatchThreads:v18 threadsPerThreadgroup:&v16];
  [v13 endEncoding];
}

- (void)convertPlanarWithMetalContext:(id)a3 inPlanarTexture:(id)a4 outInterleaved:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v9 height];
  int v19 = v11 / [v8 height];
  uint64_t v12 = [v10 commandBuffer];

  uint64_t v13 = [v12 computeCommandEncoder];

  [v13 setComputePipelineState:self->_planarToInterleaved];
  [v13 setTexture:v9 atIndex:0];

  [v13 setTexture:v8 atIndex:1];
  [v13 setBytes:&v19 length:4 atIndex:0];
  uint64_t v14 = [v8 width];
  uint64_t v15 = [v8 height];

  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  long long v16 = xmmword_1D081FED0;
  uint64_t v17 = 1;
  [v13 dispatchThreads:v18 threadsPerThreadgroup:&v16];
  [v13 endEncoding];
}

- (unsigned)tensorSwap:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_tensorSwap;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5)
  {
    unsigned int v14 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      objc_msgSend(v9, "tensorNameWithIndex:", 0, (void)v17);
      id v10 = objc_claimAutoreleasedReturnValue();
      [v10 UTF8String];
      [v9 tensorWithIndex:v3];
      int v11 = espresso_network_bind_cvpixelbuffer();

      if (v11)
      {
        uint64_t v15 = _PTLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }
      id v12 = [v9 tensorNameWithIndex:1];
      [v12 UTF8String];
      [v9 tensorWithIndex:(v3 + 1)];
      int v13 = espresso_network_bind_cvpixelbuffer();

      if (v13)
      {
        uint64_t v15 = _PTLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
LABEL_15:
        }
          -[PTEspressoGenericExecutor bindInputResourceWithName:to:]();
LABEL_16:

        unsigned int v14 = -1;
        goto LABEL_17;
      }
    }
    uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    unsigned int v14 = 0;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_17:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkVersion, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_planarToInterleaved, 0);
  objc_storeStrong((id *)&self->_interleavedToPlanar, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_espressoCallbackQueue, 0);
  objc_storeStrong((id *)&self->_tensorSwap, 0);
  objc_storeStrong((id *)&self->_outputPlanarToInterleavedConversion, 0);
  objc_storeStrong((id *)&self->_inputInterleavedToPlanarConversion, 0);
  objc_storeStrong((id *)&self->_outputsMap, 0);

  objc_storeStrong((id *)&self->_inputsMap, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Error creating espresso context %s for %@", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Expresso cannot bind output buffer %s for %@", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Espresso cannot bind input buffer %s for %@", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.4()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Espresso error building plan: %s for %@", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.5()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Error espresso_network_change_input_blob_shapes_seq: %s for %@", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.6()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Error espresso_network_select_configuration: %s for %@", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.7()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D0778000, v1, OS_LOG_TYPE_DEBUG, "network version: %s for %@", v2, 0x16u);
}

- (void)initWithMetalContext:(os_log_t)log url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "unknown version of espresso model loaded", v1, 2u);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.9()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Error espresso set priority: %s for %@", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.10()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "Error espresso plan add network: %s for %@", v2, v3, v4, v5, v6);
}

- (void)bindTensorSwaps:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 objectAtIndexedSubscript:a2];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "espresso_network_bind_buffer %@ failed", v5, 0xCu);
}

- (void)bindBuffers:(uint64_t *)a3 toMap:(NSObject *)a4 isInput:.cold.1(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = [a2 pixelFormat];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_1D0778000, a4, OS_LOG_TYPE_ERROR, "MTLPixelFormatR16Float/MTLPixelFormatR8Unorm expected, got %lu", a1, 0xCu);
}

- (void)bindBuffers:toMap:isInput:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "espresso_network_bind_buffer %@ failed", v2, v3, v4, v5, v6);
}

- (void)bindBuffers:toMap:isInput:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "Name %@ not found", v2, v3, v4, v5, v6);
}

- (void)bindInputResourceWithName:to:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "espresso_network_bind_cvpixelbuffer: espresso error %s for %@", v2, v3, v4, v5, v6);
}

- (void)convertBindInput:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)execute
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "espresso_plan_execute_sync: espresso error %s for %@", v2, v3, v4, v5, v6);
}

- (void)executeAsync:metalContext:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  espresso_get_last_error();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1D0778000, v0, v1, "espresso_plan_submit: espresso error %s for %@", v2, v3, v4, v5, v6);
}

void __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *((void *)a1 + 1);
  int v4 = *a1;
  int v5 = a1[1];
  uint64_t v6 = *(void *)(*(void *)(a2 + 32) + 112);
  int v7 = 136315906;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 1024;
  int v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "espresso_plan_submit callback. %s %i %i for %@", (uint8_t *)&v7, 0x22u);
}

@end