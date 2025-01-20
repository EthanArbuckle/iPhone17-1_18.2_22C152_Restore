@interface SIResourceFactory
- (MTLDevice)device;
- (MTLLibrary)library;
- (SIResourceFactory)initWithDevice:(id)a3;
- (id)binaryArchive;
- (id)commandBuffer;
- (id)commandBufferOnCustomQueue;
- (id)commandBufferOnCustomQueueWithoutComputePreemption;
- (id)customCommandQueue;
- (id)dictionaryFromTexture:(id)a3;
- (id)newComputePipelineStateWithName:(id)a3;
- (id)newComputePipelineStateWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newCubemapWithFormat:(SIImageFormat_struct *)a3;
- (id)newFunctionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newIOSurfaceBackedTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5;
- (id)newTextureFromIOSurface:(__IOSurface *)a3;
- (id)newTextureFromPixelBuffer:(__CVBuffer *)a3;
- (id)newTextureWithFormat:(SIImageFormat_struct *)a3;
- (id)newTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5;
- (id)sharedEvent;
@end

@implementation SIResourceFactory

- (SIResourceFactory)initWithDevice:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SIResourceFactory;
  v6 = [(SIResourceFactory *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [(MTLDevice *)v7->_device newCommandQueue];
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v8;

    v10 = objc_opt_new();
    [v10 setCommitSynchronously:1];
    [v10 setDisableAsyncCompletionDispatch:1];
    uint64_t v11 = [(MTLDevice *)v7->_device newCommandQueueWithDescriptor:v10];
    commandQueueSPI = v7->_commandQueueSPI;
    v7->_commandQueueSPI = (MTLCommandQueueSPI *)v11;

    uint64_t v13 = [(MTLDevice *)v7->_device newSharedEvent];
    sharedEvent = v7->_sharedEvent;
    v7->_sharedEvent = (MTLSharedEvent *)v13;

    v15 = v7;
  }

  return v7;
}

- (MTLLibrary)library
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  library = self->_library;
  if (!library)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    device = self->_device;
    id v11 = 0;
    v6 = (MTLLibrary *)[(MTLDevice *)device newDefaultLibraryWithBundle:v4 error:&v11];
    id v7 = v11;
    uint64_t v8 = self->_library;
    self->_library = v6;

    if (v7 || !self->_library)
    {
      v9 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136381187;
        uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        __int16 v14 = 1025;
        int v15 = 72;
        __int16 v16 = 2113;
        id v17 = v7;
        _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newLibraryWithURL failed: %{private}@ ***", buf, 0x1Cu);
      }
    }
    library = self->_library;
  }
  return library;
}

- (id)commandBuffer
{
  return (id)[(MTLCommandQueue *)self->_commandQueue commandBuffer];
}

- (id)commandBufferOnCustomQueue
{
  return (id)[(MTLCommandQueueSPI *)self->_commandQueueSPI commandBuffer];
}

- (id)commandBufferOnCustomQueueWithoutComputePreemption
{
  v3 = objc_opt_new();
  v4 = [(MTLCommandQueueSPI *)self->_commandQueueSPI commandBufferWithDescriptor:v3];

  return v4;
}

- (id)binaryArchive
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  binaryArchive = self->_binaryArchive;
  if (binaryArchive)
  {
LABEL_12:
    __int16 v14 = binaryArchive;
    goto LABEL_13;
  }
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 pathForResource:@"default-binaryarchive" ofType:@"metallib"];

  if (v5)
  {
    v6 = objc_opt_new();
    id v7 = [NSURL fileURLWithPath:v5];
    [v6 setUrl:v7];

    device = self->_device;
    id v16 = 0;
    v9 = (MTLBinaryArchive *)[(MTLDevice *)device newBinaryArchiveWithDescriptor:v6 error:&v16];
    id v10 = v16;
    id v11 = self->_binaryArchive;
    self->_binaryArchive = v9;

    if (v10 || !self->_binaryArchive)
    {
      v12 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        __int16 v19 = 1025;
        int v20 = 124;
        __int16 v21 = 2113;
        id v22 = v10;
        _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** newBinaryArchiveWithDescriptor failed:  %{private}@ ***", buf, 0x1Cu);
      }
    }
    binaryArchive = self->_binaryArchive;
    goto LABEL_12;
  }
  uint64_t v13 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136380931;
    uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
    __int16 v19 = 1025;
    int v20 = 114;
    _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** path for resource default-binaryarchive.metallib could not be found. ***", buf, 0x12u);
  }

  __int16 v14 = 0;
LABEL_13:
  return v14;
}

- (id)customCommandQueue
{
  return self->_commandQueueSPI;
}

- (id)sharedEvent
{
  return self->_sharedEvent;
}

- (id)newFunctionWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SIResourceFactory *)self library];
  v6 = (void *)[v5 newFunctionWithName:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136381187;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      __int16 v12 = 1025;
      int v13 = 142;
      __int16 v14 = 2113;
      id v15 = v4;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newFunctionWithName failed: %{private}@ ***", (uint8_t *)&v10, 0x1Cu);
    }
  }
  return v6;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  int v10 = [(SIResourceFactory *)self library];
  id v11 = (void *)[v10 newFunctionWithName:v9 constantValues:v8 error:a5];

  if (*a5)
  {
    __int16 v12 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a5;
      int v16 = 136381187;
      id v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      __int16 v18 = 1025;
      int v19 = 152;
      __int16 v20 = 2113;
      id v21 = v13;
      _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newFunctionWithName constantValues failed with error :%{private}@ ***", (uint8_t *)&v16, 0x1Cu);
    }

    id v14 = 0;
  }
  else
  {
    id v14 = v11;
  }

  return v14;
}

- (id)newComputePipelineStateWithName:(id)a3
{
  return [(SIResourceFactory *)self newComputePipelineStateWithName:a3 constantValues:0 error:0];
}

- (id)newComputePipelineStateWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  int v10 = [(SIResourceFactory *)self library];
  id v11 = v10;
  if (v9) {
    uint64_t v12 = [v10 newFunctionWithName:v8 constantValues:v9 error:a5];
  }
  else {
    uint64_t v12 = [v10 newFunctionWithName:v8];
  }
  id v13 = (void *)v12;

  if (v13)
  {
    id v14 = objc_opt_new();
    [v14 setComputeFunction:v13];
    [v14 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:0];
    id v15 = [(SIResourceFactory *)self binaryArchive];

    if (v15)
    {
      int v16 = [(SIResourceFactory *)self binaryArchive];
      v25 = v16;
      id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
      [v14 setBinaryArchives:v17];
    }
    __int16 v18 = (void *)[(MTLDevice *)self->_device newComputePipelineStateWithDescriptor:v14 options:0 reflection:0 error:a5];
    int v19 = v18;
    if (a5 || !v18)
    {
      uint64_t v22 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        if (a5) {
          uint64_t v23 = (__CFString *)*a5;
        }
        else {
          uint64_t v23 = &stru_26CB7E380;
        }
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        __int16 v28 = 1025;
        int v29 = 187;
        __int16 v30 = 2113;
        v31 = v23;
        _os_log_impl(&dword_21B697000, v22, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newComputePipelineStateWithDescriptor failed: %{private}@ ***", buf, 0x1Cu);
      }

      id v20 = 0;
    }
    else
    {
      id v20 = v18;
    }
  }
  else
  {
    id v14 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        id v21 = (__CFString *)*a5;
      }
      else {
        id v21 = &stru_26CB7E380;
      }
      *(_DWORD *)buf = 136381443;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      __int16 v28 = 1025;
      int v29 = 167;
      __int16 v30 = 2113;
      v31 = v8;
      __int16 v32 = 2113;
      v33 = v21;
      _os_log_impl(&dword_21B697000, v14, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** newFunctionWithName %{private}@ failed %{private}@ ***", buf, 0x26u);
    }
    id v20 = 0;
  }

  return v20;
}

- (id)newCubemapWithFormat:(SIImageFormat_struct *)a3
{
  id v4 = [MEMORY[0x263F12A50] textureCubeDescriptorWithPixelFormat:a3->var3 size:a3->var0 mipmapped:1];
  [v4 setUsage:23];
  id v5 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v4];

  return v5;
}

- (id)newTextureWithFormat:(SIImageFormat_struct *)a3
{
  uint64_t var2 = a3->var2;
  if (!var2) {
    uint64_t var2 = SIOSTypeFromMTLPixelFormat(a3->var3);
  }
  unint64_t var0 = a3->var0;
  unint64_t var1 = a3->var1;
  return [(SIResourceFactory *)self newTextureWithWidth:var0 height:var1 pixelFormat:var2];
}

- (id)newTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v9 = SIMTLPixelFormatFromOSType(a5);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = objc_opt_new();
    [v11 setTextureType:2];
    [v11 setWidth:a3];
    [v11 setHeight:a4];
    [v11 setPixelFormat:v10];
    [v11 setUsage:23];
    uint64_t v12 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      int v16 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136380931;
        int v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        __int16 v20 = 1025;
        int v21 = 238;
        _os_log_impl(&dword_21B697000, v16, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** Texture allocation failed ***", (uint8_t *)&v18, 0x12u);
      }
    }
  }
  else
  {
    id v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v15 = SIPixelFormatToStr(a5);
      int v18 = 136381187;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      __int16 v20 = 1025;
      int v21 = 223;
      __int16 v22 = 2113;
      uint64_t v23 = v15;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Textures do not currently support format %{private}@ ***", (uint8_t *)&v18, 0x1Cu);
    }
    id v13 = 0;
  }

  return v13;
}

- (id)newIOSurfaceBackedTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  v6 = SICreateCVPixelBuffer(a3, a4, a5, 1);
  id v7 = [(SIResourceFactory *)self newTextureFromPixelBuffer:v6];
  CVPixelBufferRelease(v6);
  return v7;
}

- (id)newTextureFromPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    return [(SIResourceFactory *)self newTextureFromIOSurface:IOSurface];
  }
  else
  {
    v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136380931;
      id v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      __int16 v9 = 1025;
      int v10 = 267;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Pixel buffer missing IOSurface backing ***", (uint8_t *)&v7, 0x12u);
    }

    return 0;
  }
}

- (id)newTextureFromIOSurface:(__IOSurface *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  OSType PixelFormat = IOSurfaceGetPixelFormat(a3);
  uint64_t v6 = SIMTLPixelFormatFromOSType(PixelFormat);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void *)MEMORY[0x263F12A50];
    size_t Width = IOSurfaceGetWidth(a3);
    int v10 = [v8 texture2DDescriptorWithPixelFormat:v7 width:Width height:IOSurfaceGetHeight(a3) mipmapped:0];
    [v10 setUsage:7];
    uint64_t v11 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v10 iosurface:a3 plane:0];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v15 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136380931;
        int v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
        __int16 v19 = 1025;
        int v20 = 300;
        _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Texture allocation failed ***", (uint8_t *)&v17, 0x12u);
      }
    }
  }
  else
  {
    int v10 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v14 = SIPixelFormatToStr(PixelFormat);
      int v17 = 136381187;
      int v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIResourceFactory.m";
      __int16 v19 = 1025;
      int v20 = 281;
      __int16 v21 = 2113;
      __int16 v22 = v14;
      _os_log_impl(&dword_21B697000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Textures do not currently support format %{private}@ ***", (uint8_t *)&v17, 0x1Cu);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)dictionaryFromTexture:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 width];
  uint64_t v5 = [v3 height];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v4];
  [v6 setObject:v7 forKey:@"width"];

  id v8 = [NSNumber numberWithUnsignedInteger:v5];
  [v6 setObject:v8 forKey:@"height"];

  return v6;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_commandQueueSPI, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_binaryArchive, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end