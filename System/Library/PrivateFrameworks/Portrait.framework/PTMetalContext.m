@interface PTMetalContext
- (BOOL)allowCommandbufferAllocation;
- (BOOL)imageblocksSupported;
- (BOOL)isCommandBufferCommitted;
- (MTLCommandBuffer)commandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLLibrary)library;
- (MTLPipelineLibrarySPI)pipelineLibrary;
- (PTMetalContext)initWithCommandQueue:(id)a3 bundleClass:(Class)a4;
- (PTMetalContext)initWithDevice:(id)a3 bundleClass:(Class)a4;
- (PTMetalTextureUtil)textureUtil;
- (id)computePipelineStateFor:(id)a3 withConstants:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)functionWithName:(id)a3 withConstants:(id)a4;
- (void)commandBuffer;
- (void)commit;
- (void)commitAndWaitUntilCompleted;
- (void)commitAndWaitUntilScheduled;
- (void)setAllowCommandbufferAllocation:(BOOL)a3;
- (void)setCommandBuffer:(id)a3;
- (void)setCommandQueue:(id)a3;
- (void)setDevice:(id)a3;
- (void)setImageblocksSupported:(BOOL)a3;
- (void)setLibrary:(id)a3;
- (void)setPipelineLibrary:(id)a3;
- (void)setTextureUtil:(id)a3;
- (void)waitForIdle;
@end

@implementation PTMetalContext

- (BOOL)imageblocksSupported
{
  return self->_imageblocksSupported;
}

- (id)computePipelineStateFor:(id)a3 withConstants:(id)a4
{
  id v6 = a3;
  v7 = [(PTMetalContext *)self functionWithName:v6 withConstants:a4];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F35208]);
    [v8 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:1];
    [v8 setComputeFunction:v7];
    [v8 setPipelineLibrary:self->_pipelineLibrary];
    device = self->_device;
    id v14 = 0;
    v10 = (void *)[(MTLDevice *)device newComputePipelineStateWithDescriptor:v8 error:&v14];
    id v11 = v14;
    if (v11)
    {
      v12 = _PTLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PTMetalContext computePipelineStateFor:withConstants:](v6, v11, v12);
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)functionWithName:(id)a3 withConstants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v10 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v6];
    if (v10) {
      goto LABEL_20;
    }
    id v11 = 0;
    goto LABEL_12;
  }
  pipelineLibrary = self->_pipelineLibrary;
  library = self->_library;
  if (pipelineLibrary)
  {
    id v19 = 0;
    v10 = (void *)[(MTLLibrary *)library newFunctionWithName:v6 constantValues:v7 pipelineLibrary:pipelineLibrary error:&v19];
    id v11 = v19;
    if (!v10)
    {
      v12 = _PTLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PTMetalContext functionWithName:withConstants:].cold.4(v6);
      }

      v13 = self->_library;
      id v18 = v11;
      v10 = (void *)[(MTLLibrary *)v13 newFunctionWithName:v6 constantValues:v7 error:&v18];
      id v14 = v18;

      id v11 = v14;
      if (!v10) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    id v20 = 0;
    v10 = (void *)[(MTLLibrary *)library newFunctionWithName:v6 constantValues:v7 error:&v20];
    id v11 = v20;
    if (!v10)
    {
LABEL_7:
      v15 = _PTLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PTMetalContext functionWithName:withConstants:](v11);
      }

LABEL_12:
      v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PTMetalContext functionWithName:withConstants:](v6);
      }
      v10 = 0;
      goto LABEL_19;
    }
  }
  if (!v11) {
    goto LABEL_20;
  }
  v16 = _PTLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[PTMetalContext functionWithName:withConstants:](v11);
  }
LABEL_19:

LABEL_20:

  return v10;
}

- (void)commitAndWaitUntilScheduled
{
  [(PTMetalContext *)self checkCurrentThreadEqualsCommandBufferThread];
  [(MTLCommandBuffer *)self->_commandBuffer commit];
  [(MTLCommandBuffer *)self->_commandBuffer waitUntilScheduled];
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  [v4 setDevice:self->_device];
  [v4 setCommandQueue:self->_commandQueue];
  [v4 setLibrary:self->_library];
  [v4 setCommandBuffer:0];
  [v4 setPipelineLibrary:self->_pipelineLibrary];
  [v4 setAllowCommandbufferAllocation:self->_allowCommandbufferAllocation];
  [v4 setImageblocksSupported:self->_imageblocksSupported];
  [v4 setTextureUtil:self->_textureUtil];
  return v4;
}

- (void)setAllowCommandbufferAllocation:(BOOL)a3
{
  self->_allowCommandbufferAllocation = a3;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setCommandQueue:(id)a3
{
}

- (void)setTextureUtil:(id)a3
{
}

- (void)setPipelineLibrary:(id)a3
{
}

- (void)setLibrary:(id)a3
{
}

- (void)setImageblocksSupported:(BOOL)a3
{
  self->_imageblocksSupported = a3;
}

- (void)setDevice:(id)a3
{
}

- (void)setCommandBuffer:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (PTMetalTextureUtil)textureUtil
{
  return self->_textureUtil;
}

- (BOOL)isCommandBufferCommitted
{
  return self->_commandBuffer == 0;
}

- (MTLCommandBuffer)commandBuffer
{
  if (self->_allowCommandbufferAllocation)
  {
    if ([(MTLCommandBuffer *)self->_commandBuffer status])
    {
      v3 = _PTLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[PTMetalContext commandBuffer](v3);
      }
    }
    commandBuffer = self->_commandBuffer;
    if (!commandBuffer)
    {
      v5 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      id v6 = self->_commandBuffer;
      self->_commandBuffer = v5;

      commandBuffer = self->_commandBuffer;
    }
    id v7 = commandBuffer;
  }
  else
  {
    id v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PTMetalContext commandBuffer](v8);
    }

    id v7 = 0;
  }

  return v7;
}

- (MTLPipelineLibrarySPI)pipelineLibrary
{
  return self->_pipelineLibrary;
}

- (PTMetalContext)initWithCommandQueue:(id)a3 bundleClass:(Class)a4
{
  v52[1] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTMetalContext;
  id v8 = [(PTMetalContext *)&v50 init];
  if (!v8)
  {
    id v20 = 0;
    goto LABEL_42;
  }
  uint64_t v9 = [v7 device];
  device = v8->_device;
  v8->_device = (MTLDevice *)v9;

  objc_storeStrong((id *)&v8->_commandQueue, a3);
  v8->_allowCommandbufferAllocation = 0;
  v8->_imageblocksSupported = [(MTLDevice *)v8->_device supportsFamily:1006];
  id v11 = v8->_device;
  v12 = [(MTLDevice *)v11 name];
  if (![v12 containsString:@"Apple"])
  {
    v15 = &stru_1F269F3B0;
LABEL_20:

    goto LABEL_21;
  }
  NSSelectorFromString(&cfstr_Architecture.isa);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v12 = [(MTLDevice *)v11 architecture];
    id v14 = [v12 name];
    v15 = [v14 stringByReplacingOccurrencesOfString:@"applegpu_" withString:&stru_1F269F3B0];
    v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PTMetalContext initWithCommandQueue:bundleClass:].cold.6();
    }

    v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PTMetalContext initWithCommandQueue:bundleClass:].cold.5(v12);
    }

    id v18 = [v12 revision];
    if ([v18 containsString:@"A"])
    {
      char v19 = 0;
    }
    else if ([(__CFString *)v15 containsString:@"g16p"])
    {
      v21 = [v12 revision];
      char v19 = [v21 containsString:@"B0"] ^ 1;
    }
    else
    {
      char v19 = 1;
    }

    char v22 = [(__CFString *)v15 containsString:@"g17p"];
    if ((v19 & 1) == 0 && (v22 & 1) == 0)
    {
      v23 = NSString;
      v24 = [v12 revision];
      v25 = [v24 lowercaseString];
      uint64_t v26 = [v23 stringWithFormat:@"%@_%@", v15, v25];

      v15 = (__CFString *)v26;
    }

    goto LABEL_20;
  }
  v15 = &stru_1F269F3B0;
LABEL_21:
  v27 = _PTLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[PTMetalContext initWithCommandQueue:bundleClass:].cold.4();
  }

  v28 = [MEMORY[0x1E4F28B50] bundleForClass:a4];
  if (v28)
  {
    v52[0] = 0;
    uint64_t v29 = [(MTLDevice *)v11 newDefaultLibraryWithBundle:v28 error:v52];
    id v30 = v52[0];
    library = v8->_library;
    v8->_library = (MTLLibrary *)v29;

    if (v30)
    {
      v32 = _PTLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[PTMetalContext initWithCommandQueue:bundleClass:]();
      }

      id v33 = v30;
      v34 = v33;
    }
    else
    {
      if (PTDefaultsPublicGetBool(@"harvesting.enabled", 0))
      {
        pipelineLibrary = v8->_pipelineLibrary;
        v8->_pipelineLibrary = 0;
      }
      else
      {
        v41 = NSString;
        v42 = [v28 resourcePath];
        pipelineLibrary = [v41 stringWithFormat:@"%@/%@", v42, v15];

        id v51 = 0;
        uint64_t v43 = [(MTLDevice *)v11 newPipelineLibraryWithFilePath:pipelineLibrary error:&v51];
        id v44 = v51;
        v45 = v8->_pipelineLibrary;
        v8->_pipelineLibrary = (MTLPipelineLibrarySPI *)v43;

        if (v44)
        {
          v46 = _PTLogSystem();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            -[PTMetalContext initWithCommandQueue:bundleClass:]();
          }
        }
      }

      id v33 = 0;
      v34 = 0;
    }
  }
  else
  {
    v35 = _PTLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[PTMetalContext initWithCommandQueue:bundleClass:]();
    }

    v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28760];
    id v51 = (id)*MEMORY[0x1E4F28568];
    v38 = [NSString stringWithFormat:@"Cannot load bundle from %@", a4];
    v52[0] = v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v34 = [v36 errorWithDomain:v37 code:-12573 userInfo:v39];

    id v33 = 0;
  }

  v47 = [[PTMetalTextureUtil alloc] initWithMetalContext:v8];
  textureUtil = v8->_textureUtil;
  v8->_textureUtil = v47;

  if (v34) {
    id v20 = 0;
  }
  else {
    id v20 = v8;
  }

LABEL_42:
  return v20;
}

- (PTMetalContext)initWithDevice:(id)a3 bundleClass:(Class)a4
{
  id v6 = (void *)[a3 newCommandQueue];
  id v7 = [(PTMetalContext *)self initWithCommandQueue:v6 bundleClass:a4];

  return v7;
}

- (void)commit
{
  [(PTMetalContext *)self checkCurrentThreadEqualsCommandBufferThread];
  [(MTLCommandBuffer *)self->_commandBuffer commit];
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;
}

- (void)commitAndWaitUntilCompleted
{
  [(PTMetalContext *)self checkCurrentThreadEqualsCommandBufferThread];
  [(MTLCommandBuffer *)self->_commandBuffer commit];
  [(MTLCommandBuffer *)self->_commandBuffer waitUntilCompleted];
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;
}

- (void)waitForIdle
{
  id v3 = [(PTMetalContext *)self commandBuffer];

  [(PTMetalContext *)self commitAndWaitUntilCompleted];
}

- (MTLLibrary)library
{
  return self->_library;
}

- (BOOL)allowCommandbufferAllocation
{
  return self->_allowCommandbufferAllocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureUtil, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithCommandQueue:bundleClass:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D0778000, v0, OS_LOG_TYPE_ERROR, "Cannot load bundle from %@", v1, 0xCu);
}

- (void)initWithCommandQueue:bundleClass:.cold.2()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_6(&dword_1D0778000, v0, v1, "Error creating pipeline library %@ from className %@. Falling back to MTLLibrary");
}

- (void)initWithCommandQueue:bundleClass:.cold.3()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_6(&dword_1D0778000, v0, v1, "Error creating library %@ from %@");
}

- (void)initWithCommandQueue:bundleClass:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEBUG, "Resolved gpuName: %@", v1, 0xCu);
}

- (void)initWithCommandQueue:(void *)a1 bundleClass:.cold.5(void *a1)
{
  os_log_t v1 = [a1 revision];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "gpu revision: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCommandQueue:bundleClass:.cold.6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEBUG, "gpu name: %@", v1, 0xCu);
}

- (void)commandBuffer
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Invalid commandbuffer", v1, 2u);
}

- (void)functionWithName:(void *)a1 withConstants:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "Unable to load function %s.", v3, v4, v5, v6, v7);
}

- (void)functionWithName:(void *)a1 withConstants:.cold.2(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v2, v3, "Metal shader compilation error: %s", v4, v5, v6, v7, v8);
}

- (void)functionWithName:(void *)a1 withConstants:.cold.3(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "Metal shader compilation warnings: %s", v4, v5, v6, v7, v8);
}

- (void)functionWithName:(void *)a1 withConstants:.cold.4(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "Unable to load function %s from pipeline library. Retrying from library.", v3, v4, v5, v6, v7);
}

- (void)computePipelineStateFor:(NSObject *)a3 withConstants:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 UTF8String];
  id v6 = [a2 description];
  int v7 = 136315394;
  uint64_t v8 = v5;
  __int16 v9 = 2080;
  uint64_t v10 = [v6 UTF8String];
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "Unable to create pipelineState (%s): %s", (uint8_t *)&v7, 0x16u);
}

@end