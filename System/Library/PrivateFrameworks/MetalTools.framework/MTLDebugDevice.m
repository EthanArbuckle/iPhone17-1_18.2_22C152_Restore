@interface MTLDebugDevice
+ (BOOL)complainAboutSloppyTextureUsage;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3;
- (BOOL)areWritableHeapsEnabled;
- (BOOL)loadValidationEnabled;
- (BOOL)storeValidationEnabled;
- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5;
- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4;
- (MTLDebugDevice)initWithBaseObject:(id)a3 parent:(id)a4;
- (const)targetDeviceInfo;
- (id).cxx_construct;
- (id)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)_newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5;
- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4;
- (id)getDepthStencilStateForBaseObject:(id)a3 descriptor:(id)a4;
- (id)getDynamicLibraryForBaseObject:(id)a3;
- (id)getFunctionForBaseObject:(id)a3 library:(id)a4;
- (id)getSamplerStateForBaseObject:(id)a3 descriptor:(id)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newArgumentEncoderWithArguments:(id)a3;
- (id)newArgumentEncoderWithBufferBinding:(id)a3;
- (id)newArgumentEncoderWithLayout:(id)a3;
- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4;
- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithIOSurface:(__IOSurface *)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDagStringWithGraphs:(id)a3;
- (id)newDefaultLibrary;
- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4;
- (id)newDepthStencilStateWithDescriptor:(id)a3;
- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)newDynamicLibrary:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newEvent;
- (id)newFence;
- (id)newHeapWithDescriptor:(id)a3;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5;
- (id)newIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newLateEvalEvent;
- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5;
- (id)newLibraryWithData:(id)a3 error:(id *)a4;
- (id)newLibraryWithFile:(id)a3 error:(id *)a4;
- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4;
- (id)newProfileWithExecutionSize:(unint64_t)a3;
- (id)newRasterizationRateMapWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4;
- (id)newSamplerStateWithDescriptor:(id)a3;
- (id)newSharedEvent;
- (id)newSharedEventWithHandle:(id)a3;
- (id)newSharedEventWithMachPort:(unsigned int)a3;
- (id)newSharedTextureWithDescriptor:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3 withResourceIndex:(unint64_t)a4;
- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4;
- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5;
- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (void)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)_newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)addReferenceTrackingCommandBuffer:(id)a3;
- (void)clearRenderEncoder:(id)a3 writeMask:(unint64_t)a4 withCheckerboard:(float *)a5;
- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5;
- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)notifyExternalReferencesNonZeroOnDealloc:(id)a3;
- (void)notifySamplerStateDeallocated:(id)a3;
- (void)removeReferenceTrackingCommandBuffer:(id)a3;
- (void)setWritableHeapsEnabled:(BOOL)a3;
- (void)validateAddressRanges:(id)a3 expectedTotalSize:(unint64_t)a4 context:(_MTLMessageContext *)a5;
- (void)validateImageblockTypes:(id)a3 reflection:(id)a4 context:(_MTLMessageContext *)a5;
- (void)validateLinkedFunctions:(id)a3 context:(_MTLMessageContext *)a4;
- (void)validateMemorylessResource:(id)a3 context:(_MTLMessageContext *)a4;
- (void)validateNewBufferArgs:(unint64_t)a3 options:(unint64_t)a4 context:(_MTLMessageContext *)a5;
- (void)validateRaytracing;
- (void)validateResourceOptions:(unint64_t)a3 isTexture:(BOOL)a4 isIOSurface:(BOOL)a5 context:(_MTLMessageContext *)a6;
@end

@implementation MTLDebugDevice

+ (BOOL)complainAboutSloppyTextureUsage
{
  return complain_about_sloppy_texture_usage;
}

- (MTLDebugDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugDevice;
  v4 = [(MTLToolsDevice *)&v8 initWithBaseObject:a3 parent:a4];
  v5 = v4;
  if (v4)
  {
    MTLSamplerDescriptorHashMap::setLimitForDevice(&v4->_argumentBufferSamplers, v4);
    if (-[MTLDebugDevice initWithBaseObject:parent:]::once_token != -1) {
      dispatch_once(&-[MTLDebugDevice initWithBaseObject:parent:]::once_token, &__block_literal_global_2);
    }
    v5->_storeValidationEnabled = 0;
    uint64_t v6 = MTLGetEnvDefault();
    v5->_storeValidationEnabled = v6 != 0;
    if (v6) {
      CheckerboardRenderTargetPipelineCache::init(&v5->_checkerboardRTPipelineCache, v5);
    }
    v5->_loadValidationEnabled = 0;
    v5->_loadValidationEnabled = MTLGetEnvDefault() != 0;
  }
  return v5;
}

const char *__44__MTLDebugDevice_initWithBaseObject_parent___block_invoke()
{
  result = getenv("METAL_COMPLAIN_ABOUT_SLOPPY_TEXTURE_USAGE");
  if (result)
  {
    result = (const char *)strcmp(result, "1");
    if (!result) {
      complain_about_sloppy_texture_usage = 1;
    }
  }
  return result;
}

- (id)newCommandQueue
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueue");
  if (result)
  {
    id v4 = result;
    v5 = [(MTLToolsCommandQueue *)[MTLDebugCommandQueue alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithMaxCommandBufferCount:", a3);
  if (result)
  {
    id v5 = result;
    uint64_t v6 = [(MTLToolsCommandQueue *)[MTLDebugCommandQueue alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    uint64_t v6 = [(MTLToolsCommandQueue *)[MTLDebugCommandQueue alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id v5 = [(MTLToolsObject *)self baseObject];

  unint64_t v6 = [v5 heapTextureSizeAndAlignWithDescriptor:a3];
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  unint64_t v7 = [v6 heapBufferSizeAndAlignWithLength:a3 options:a4];
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)validateAddressRanges:(id)a3 expectedTotalSize:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  uint64_t v7 = *MEMORY[0x263EF8AE0];
  uint64_t v8 = [a3 ranges];
  if ([a3 count])
  {
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = v7 - 1;
    v12 = (void *)(v8 + 8);
    while (1)
    {
      uint64_t v13 = *v12;
      BOOL v14 = __CFADD__(v10, *v12);
      v10 += *v12;
      if (v14) {
        break;
      }
      if ((*(v12 - 1) & v11) != 0)
      {
        _MTLMessageContextPush_();
        uint64_t v13 = *v12;
      }
      if ((v13 & v11) != 0) {
        _MTLMessageContextPush_();
      }
      ++v9;
      v12 += 2;
      if (v9 >= [a3 count]) {
        goto LABEL_12;
      }
    }
    _MTLMessageContextPush_();
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_12:
  if (v10 != a4) {
    _MTLMessageContextPush_();
  }
}

- (id)newHeapWithDescriptor:(id)a3
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _MTLMessageContextBegin_();
  if ([a3 type] == 2
    && ([a3 type] != 2 || !-[MTLToolsDevice supportsSparseHeaps](self, "supportsSparseHeaps")))
  {
    _MTLMessageContextPush_();
  }
  if (!objc_msgSend(a3, "size", v9, v10, v11, v12)) {
    _MTLMessageContextPush_();
  }
  if ([a3 storageMode] != 2
    && ([a3 storageMode]
     || ![(MTLToolsDevice *)self supportsSharedStorageHeapResources]))
  {
    _MTLMessageContextPush_();
  }
  if ([a3 cpuCacheMode] && objc_msgSend(a3, "cpuCacheMode") != 1) {
    _MTLMessageContextPush_();
  }
  if ((unint64_t)[a3 hazardTrackingMode] >= 3) {
    _MTLMessageContextPush_();
  }
  if ([a3 type] == 2 && objc_msgSend(a3, "storageMode") != 2) {
    _MTLMessageContextPush_();
  }
  if ([a3 addressRanges])
  {
    if (![(MTLToolsDevice *)self supportsHeapWithAddressRanges]) {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateAddressRanges:expectedTotalSize:context:](self, "validateAddressRanges:expectedTotalSize:context:", [a3 addressRanges], objc_msgSend(a3, "size"), &v9);
  }
  if ((void)v9
    || (uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newHeapWithDescriptor:", a3)) == 0)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v7 = (void *)v6;
    id v5 = [[MTLDebugHeap alloc] initWithHeap:v6 device:self];
  }
  _MTLMessageContextEnd();
  return v5;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a3) {
      goto LABEL_16;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![a3 usage] && complain_about_sloppy_texture_usage) {
      _MTLMessageContextPush_();
    }
    if (objc_msgSend(a3, "pixelFormat", v9, v10, v11, v12) == 261) {
      _MTLMessageContextPush_();
    }
    if ([a3 storageMode] != 2) {
      _MTLMessageContextPush_();
    }
    if ([a3 textureType] == 9) {
      _validateTextureBufferDescriptor(a3, [(MTLToolsObject *)self baseObject]);
    }
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", [a3 resourceOptions], 1, 0, &v9);
    if (!(void)v9)
    {
      uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithDescriptor:", a3);
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        id v5 = [[MTLDebugTexture alloc] initWithBaseTexture:v7 device:self];

        goto LABEL_17;
      }
    }
  }
LABEL_16:
  id v5 = 0;
LABEL_17:
  _MTLMessageContextEnd();
  return v5;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  if (!validateSharedTextureHandleWithDevice(a3, self)) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithHandle:", a3);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [[MTLDebugTexture alloc] initWithBaseTexture:v5 device:self];

  return v7;
}

- (id)newSharedTextureWithHandle:(id)a3 withResourceIndex:(unint64_t)a4
{
  if (!validateSharedTextureHandleWithDevice(a3, self)) {
    return 0;
  }
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithHandle:withResourceIndex:", a3, a4);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = (void *)v7;
  long long v9 = [[MTLDebugTexture alloc] initWithBaseTexture:v7 device:self];

  return v9;
}

- (void)validateMemorylessResource:(id)a3 context:(_MTLMessageContext *)a4
{
  if ([a3 storageMode] == 3)
  {
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    _MTLMessageContextPush_();
    if (objc_msgSend(a3, "textureType", 0) != 2
      && [a3 textureType] != 4
      && [a3 textureType] != 3
      && [a3 textureType] != 8)
    {
      _MTLMessageContextPush_();
    }
  }
}

- (void)validateResourceOptions:(unint64_t)a3 isTexture:(BOOL)a4 isIOSurface:(BOOL)a5 context:(_MTLMessageContext *)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  if ((a3 & 0xF) >= 2)
  {
    unint64_t v11 = a3;
    unint64_t v12 = a3 & 0xF;
    _MTLMessageContextPush_();
  }
  int v10 = a3 & 0xF0;
  if ((a3 & 0xF0) != 0 && v6) {
    _MTLMessageContextPush_();
  }
  if (v10 != 48)
  {
    if (v10 != 32
      && ((a3 & 0xF0) != 0
       || v7 && ![(MTLToolsDevice *)self supportsSharedStorageTextures]))
    {
      goto LABEL_17;
    }
LABEL_15:
    if ((a3 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (!v7) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self supportsMemorylessRenderTargets]) {
    goto LABEL_15;
  }
LABEL_17:
  _MTLMessageContextPush_();
  if ((a3 & 0x100) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  if ((a3 & 0x300) != 0x100) {
    _MTLMessageContextPush_();
  }
LABEL_20:
  if ((a3 & 0xFFFFFFFFFFE3FC00) != 0) {
    _MTLMessageContextPush_();
  }
}

- (void)validateNewBufferArgs:(unint64_t)a3 options:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self maxBufferLength] < a3)
  {
    [(MTLToolsDevice *)self maxBufferLength];
    _MTLMessageContextPush_();
  }

  [(MTLDebugDevice *)self validateResourceOptions:a4 isTexture:0 isIOSurface:0 context:a5];
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  [(MTLDebugDevice *)self validateNewBufferArgs:a3 options:a4 context:v11];
  _MTLMessageContextEnd();
  BOOL v7 = 0;
  if (!*(void *)&v11[0])
  {
    uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
    if (v8)
    {
      long long v9 = (void *)v8;
      BOOL v7 = [[MTLDebugBuffer alloc] initWithBuffer:v8 device:self options:a4];
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if ((a5 & 0xF0) == 0x20) {
    _MTLMessageContextPush_();
  }
  [(MTLDebugDevice *)self validateNewBufferArgs:a4 options:a5 context:v13];
  if (!a3) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (*(void *)&v13[0]) {
    return 0;
  }
  uint64_t v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytes:length:options:", a3, a4, a5);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = (void *)v10;
  long long v9 = [[MTLDebugBuffer alloc] initWithBuffer:v10 device:self options:a5];

  return v9;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if ((a5 & 0xF0) == 0x20) {
    _MTLMessageContextPush_();
  }
  [(MTLDebugDevice *)self validateNewBufferArgs:a4 options:a5 context:v15];
  if (!a3) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (*(void *)&v15[0]) {
    return 0;
  }
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, a5, a6);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = (void *)v12;
  unint64_t v11 = [[MTLDebugBuffer alloc] initWithBuffer:v12 device:self bytes:a3 options:a5];

  return v11;
}

- (id)newBufferWithDescriptor:(id)a3
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (([a3 contents] || objc_msgSend(a3, "noCopy"))
    && ([a3 resourceOptions] & 0xF0) != 0)
  {
    _MTLMessageContextPush_();
  }
  if ([a3 noCopy] && !objc_msgSend(a3, "contents")) {
    _MTLMessageContextPush_();
  }
  if ([a3 addressRanges])
  {
    if (![(MTLToolsDevice *)self supportsBufferWithAddressRanges]) {
      _MTLMessageContextPush_();
    }
    if ([a3 contents]) {
      _MTLMessageContextPush_();
    }
    if ([a3 noCopy]) {
      _MTLMessageContextPush_();
    }
    if ([a3 deallocator]) {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateAddressRanges:expectedTotalSize:context:](self, "validateAddressRanges:expectedTotalSize:context:", [a3 addressRanges], objc_msgSend(a3, "length"), v9);
  }
  _MTLMessageContextEnd();
  if (*(void *)&v9[0]) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithDescriptor:", a3);
  if (!v6) {
    return 0;
  }
  BOOL v7 = (void *)v6;
  uint64_t v5 = -[MTLDebugBuffer initWithBuffer:device:bytes:options:]([MTLDebugBuffer alloc], "initWithBuffer:device:bytes:options:", v6, self, [a3 contents], objc_msgSend(a3, "resourceOptions"));

  return v5;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  [(MTLDebugDevice *)self validateResourceOptions:a5 isTexture:0 isIOSurface:0 context:v27];
  uint64_t v9 = [a3 commandTypes] & 0x60;
  uint64_t v10 = [a3 commandTypes] & 0x18F;
  if (v9 && v10 || !(v9 | v10))
  {
    uint64_t v15 = [a3 commandTypes];
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend(a3, "commandTypes", v15) & 0xFFFFFFFFFFFFFE10) == 0)
  {
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v16 = [a3 commandTypes];
  _MTLMessageContextPush_();
  if (v10)
  {
LABEL_6:
    [(MTLToolsObject *)self originalObject];
    MTLValidateFeatureSupport();
  }
LABEL_7:
  if (v9)
  {
    [(MTLToolsObject *)self originalObject];
    MTLValidateFeatureSupport();
  }
  if ((objc_msgSend(a3, "commandTypes", v16) & 0x40) != 0)
  {
    [(MTLToolsObject *)self originalObject];
    MTLValidateFeatureSupport();
  }
  if (([a3 commandTypes] & 0xC) != 0)
  {
    [(MTLToolsObject *)self originalObject];
    MTLValidateFeatureSupport();
  }
  if (([a3 commandTypes] & 0x180) != 0)
  {
    [(MTLToolsObject *)self originalObject];
    MTLValidateFeatureSupport();
  }
  if (v10)
  {
    if ((unint64_t)[a3 maxVertexBufferBindCount] >= 0x20)
    {
      uint64_t v17 = [a3 maxVertexBufferBindCount];
      uint64_t v22 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxFragmentBufferBindCount", v17, v22) >= 0x20)
    {
      uint64_t v18 = [a3 maxFragmentBufferBindCount];
      uint64_t v23 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxObjectBufferBindCount", v18, v23) >= 0x20)
    {
      uint64_t v19 = [a3 maxObjectBufferBindCount];
      uint64_t v24 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxMeshBufferBindCount", v19, v24) >= 0x20)
    {
      uint64_t v20 = [a3 maxMeshBufferBindCount];
      uint64_t v25 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxObjectThreadgroupMemoryBindCount", v20, v25) >= 0x20)
    {
      uint64_t v17 = [a3 maxObjectThreadgroupMemoryBindCount];
      uint64_t v22 = 31;
      _MTLMessageContextPush_();
    }
  }
  if (!v9)
  {
    if (![a3 supportRayTracing]) {
      goto LABEL_38;
    }
    goto LABEL_35;
  }
  if ((unint64_t)[a3 maxKernelBufferBindCount] >= 0x20)
  {
    uint64_t v17 = [a3 maxKernelBufferBindCount];
    uint64_t v22 = 31;
    _MTLMessageContextPush_();
  }
  if ((unint64_t)objc_msgSend(a3, "maxKernelThreadgroupMemoryBindCount", v17, v22) >= 0x20)
  {
    uint64_t v21 = [a3 maxKernelThreadgroupMemoryBindCount];
    uint64_t v26 = 31;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "supportRayTracing", v21, v26))
  {
    if (![(MTLToolsDevice *)self supportsRaytracing]) {
      _MTLMessageContextPush_();
    }
LABEL_35:
    if (v10 && ![(MTLToolsDevice *)self supportsRaytracingFromRender]) {
      _MTLMessageContextPush_();
    }
  }
LABEL_38:
  _MTLMessageContextEnd();
  if (*(void *)&v27[0]) {
    return 0;
  }
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", a3, a4, a5);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = (void *)v12;
  unint64_t v11 = [[MTLDebugIndirectCommandBuffer alloc] initWithIndirectCommandBuffer:v12 device:self descriptor:a3 maxCommandCount:a4 options:a5];

  return v11;
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!(void)v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    uint64_t v10 = [a3 count];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = objc_msgSend(a3, "objectAtIndexedSubscript:", v12, v14, v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((unint64_t)([v13 dataType] - 121) > 0xE
            || [(MTLToolsDevice *)self supportsBfloat16Buffers])
          {
            goto LABEL_16;
          }
          uint64_t v14 = v12;
          uint64_t v15 = MTLDataTypeString();
        }
        else
        {
          uint64_t v14 = v12;
        }
        _MTLMessageContextPush_();
LABEL_16:
        if (v11 == ++v12) {
          goto LABEL_7;
        }
      }
    }
    _MTLMessageContextPush_();
  }
LABEL_7:
  _MTLMessageContextEnd();
  uint64_t v16 = 0;
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithArguments:structType:", a3, &v16);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)v5;
  BOOL v7 = [MTLDebugArgumentEncoder alloc];
  uint64_t v8 = [(MTLDebugArgumentEncoder *)v7 initWithBaseObject:v6 structType:v16 parent:self];

  return v8;
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithLayout:", a3);
  if (result)
  {
    id v5 = result;
    uint64_t v6 = [[MTLDebugArgumentEncoder alloc] initWithBaseObject:result structType:0 parent:self];

    return v6;
  }
  return result;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  unint64_t v11 = [(MTLToolsDevice *)self minBufferNoCopyAlignmentBytes];
  uint64_t v12 = [a5 resourceOptions];
  if ((v12 & 0xF0) != 0) {
    _MTLMessageContextPush_();
  }
  [(MTLDebugDevice *)self validateNewBufferArgs:a4 options:v12 context:v17];
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (((v11 - 1) & (unint64_t)a3) != 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (*(void *)&v17[0]) {
    return 0;
  }
  uint64_t v14 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a3, a4, a5, a6);
  if (!v14) {
    return 0;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v13 = [[MTLDebugTexture alloc] initWithBaseTexture:v14 device:self];

  return v13;
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a3) {
      return 0;
    }
  }
  else
  {
    MTLReportFailure();
    if (!a3) {
      return 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6.receiver = self;
    v6.super_class = (Class)MTLDebugDevice;
    return [(MTLToolsDevice *)&v6 newDepthStencilStateWithDescriptor:a3];
  }
  return 0;
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a3) {
      goto LABEL_21;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_21;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![a3 usage] && complain_about_sloppy_texture_usage) {
      _MTLMessageContextPush_();
    }
    if ([a3 pixelFormat] == 261) {
      _MTLMessageContextPush_();
    }
    [(MTLDebugDevice *)self validateMemorylessResource:a3 context:v9];
    if (([a3 usage] & 0x20) != 0)
    {
      if (([a3 usage] & 3) == 0) {
        _MTLMessageContextPush_();
      }
      if ([a3 pixelFormat] != 53
        && [a3 pixelFormat] != 54
        && [a3 pixelFormat] != 103)
      {
        _MTLMessageContextPush_();
      }
    }
    if ([a3 textureType] == 9) {
      _validateTextureBufferDescriptor(a3, [(MTLToolsObject *)self baseObject]);
    }
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", [a3 resourceOptions], 1, 0, v9);
    if (!*(void *)&v9[0])
    {
      uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        id v5 = [[MTLDebugTexture alloc] initWithBaseTexture:v7 device:self];

        goto LABEL_22;
      }
    }
  }
LABEL_21:
  id v5 = 0;
LABEL_22:
  _MTLMessageContextEnd();
  return v5;
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  validateMTLSamplerDescriptor([(MTLToolsObject *)self originalObject], a3);
  if ([a3 supportArgumentBuffers]) {
    MTLSamplerDescriptorHashMap::add(&self->_argumentBufferSamplers, (MTLSamplerDescriptor *)a3);
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugDevice;
  return [(MTLToolsDevice *)&v6 newSamplerStateWithDescriptor:a3];
}

- (void)notifySamplerStateDeallocated:(id)a3
{
  id v4 = (MTLSamplerDescriptor *)[a3 descriptor];
  if ([(MTLSamplerDescriptor *)v4 supportArgumentBuffers])
  {
    MTLSamplerDescriptorHashMap::remove(&self->_argumentBufferSamplers, v4);
  }
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibraryWithBundle:error:", a3, a4);
  if (result)
  {
    id v7 = result;
    uint64_t v8 = -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", result, self, 0, [a3 pathForResource:@"default" ofType:@"metallib"], 0);

    return v8;
  }
  return result;
}

- (id)newDefaultLibrary
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibrary");
  if (result)
  {
    id v4 = result;
    id v5 = [[MTLDebugLibrary alloc] initWithLibrary:result parent:self type:0 code:0 options:0];

    return v5;
  }
  return result;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  id v7 = (void *)[a3 url];
  if (v7 && ([v7 isFileURL] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryArchiveWithDescriptor:error:", a3, a4);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [(MTLToolsObject *)[MTLDebugBinaryArchive alloc] initWithBaseObject:v8 parent:self];

  return v10;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  if (a4 && ([a4 isFileURL] & 1) == 0) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryLibraryWithOptions:url:error:", a3, a4, a5);
  if (result)
  {
    id v10 = result;
    unint64_t v11 = [(MTLToolsObject *)[MTLDebugBinaryArchive alloc] initWithBaseObject:result parent:self];

    return v11;
  }
  return result;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  return [(MTLDebugDevice *)self newDynamicLibraryWithURL:a3 options:0 error:a4];
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!(void)v11 && ([a3 isFileURL] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
    && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStatefulDynamicLibraries") & 1) == 0)
  {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugDevice;
  return [(MTLToolsDevice *)&v10 newDynamicLibraryWithURL:a3 options:a4 error:a5];
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a4) {
    _MTLMessageContextPush_();
  }
  if (!(void)v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a4 computeFunction]) {
      _MTLMessageContextPush_();
    }
  }
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStatefulDynamicLibraries"))
  {
    if (!a3)
    {
LABEL_13:
      _MTLMessageContextPush_();
      goto LABEL_11;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  _MTLMessageContextEnd();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugDevice;
  return [(MTLToolsDevice *)&v10 newDynamicLibrary:a3 computeDescriptor:a4 error:a5];
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!(void)v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
  }
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugDevice;
  return [(MTLToolsDevice *)&v8 newDynamicLibrary:a3 error:a4];
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!(void)v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a3 computeFunction]) {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugDevice;
  return [(MTLToolsDevice *)&v10 loadDynamicLibrariesForComputeDescriptor:a3 options:a4 error:a5];
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v13 = 0;
  memset(&v12[1], 0, 48);
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3)
  {
    _MTLMessageContextPush_();
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  _MTLMessageContextEnd();
  v12[0].receiver = self;
  v12[0].super_class = (Class)MTLDebugDevice;
  return [(objc_super *)v12 loadDynamicLibrariesForFunction:a3 insertLibraries:a4 options:a5 error:a6];
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0) {
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  return [v9 validateDynamicLibrary:v10 state:v6 error:a5];
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0) {
    MTLReportFailure();
  }
  id v7 = [(MTLToolsObject *)self baseObject];

  return [v7 validateDynamicLibraryURL:a3 error:a4];
}

- (void)validateLinkedFunctions:(id)a3 context:(_MTLMessageContext *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v26 = [(MTLToolsObject *)self baseObject];
    if ([a3 functions]
      && objc_msgSend((id)objc_msgSend(a3, "functions"), "count")
      && ([v26 supportsFunctionPointers] & 1) == 0)
    {
      _MTLMessageContextPush_();
    }
    if ([a3 groups])
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = (id)[a3 groups];
      uint64_t v29 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v29)
      {
        LOBYTE(v31) = 0;
        uint64_t v28 = *(void *)v49;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v49 != v28)
            {
              uint64_t v6 = v5;
              objc_enumerationMutation(obj);
              uint64_t v5 = v6;
            }
            uint64_t v30 = v5;
            v33 = *(void **)(*((void *)&v48 + 1) + 8 * v5);
            BOOL v7 = v31
              || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "groups"), "objectForKeyedSubscript:", v33), "count") != 0;
            BOOL v31 = v7;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            objc_super v8 = objc_msgSend((id)objc_msgSend(a3, "groups", v23), "objectForKeyedSubscript:", v33);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v54 count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v45;
              do
              {
                for (uint64_t i = 0; i != v9; ++i)
                {
                  if (*(void *)v45 != v10) {
                    objc_enumerationMutation(v8);
                  }
                  long long v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                  long long v40 = 0u;
                  long long v41 = 0u;
                  long long v42 = 0u;
                  long long v43 = 0u;
                  uint64_t v13 = objc_msgSend(a3, "functions", v23, v25);
                  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v53 count:16];
                  if (v14)
                  {
                    uint64_t v15 = *(void *)v41;
LABEL_22:
                    uint64_t v16 = 0;
                    while (1)
                    {
                      if (*(void *)v41 != v15) {
                        objc_enumerationMutation(v13);
                      }
                      if (*(void **)(*((void *)&v40 + 1) + 8 * v16) == v12) {
                        break;
                      }
                      if (v14 == ++v16)
                      {
                        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v53 count:16];
                        if (v14) {
                          goto LABEL_22;
                        }
                        goto LABEL_28;
                      }
                    }
                  }
                  else
                  {
LABEL_28:
                    uint64_t v23 = objc_msgSend((id)objc_msgSend(v12, "name"), "UTF8String");
                    uint64_t v25 = (__CFString *)[v33 UTF8String];
                    _MTLMessageContextPush_();
                  }
                }
                uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v54 count:16];
              }
              while (v9);
            }
            uint64_t v5 = v30 + 1;
          }
          while (v30 + 1 != v29);
          uint64_t v29 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v29);
        if (v31 && ([v26 supportsFunctionPointers] & 1) == 0) {
          _MTLMessageContextPush_();
        }
      }
    }
    long long v17 = objc_msgSend(a3, "binaryFunctions", v23);
    uint64_t v18 = v17;
    if (v17 && [v17 count])
    {
      if (([v26 supportsFunctionPointers] & 1) == 0)
      {
        uint64_t v24 = @"binaryFunctions";
        _MTLMessageContextPush_();
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v52, 16, v24);
      if (v19)
      {
        uint64_t v20 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v37 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (!objc_msgSend(v22, "precompiledOutput", v24, v25))
            {
              uint64_t v24 = (__CFString *)objc_msgSend((id)objc_msgSend(v22, "name"), "UTF8String");
              uint64_t v25 = @"binaryFunctions";
              _MTLMessageContextPush_();
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v52 count:16];
        }
        while (v19);
      }
    }
    memset(v34, 0, sizeof(v34));
    int v35 = 1065353216;
    _validateUniqueNames((uint64_t)a4, v34, objc_msgSend(a3, "functions", v24), (uint64_t)"functions");
    _validateUniqueNames((uint64_t)a4, v34, (void *)[a3 privateFunctions], (uint64_t)"privateFunctions");
    _validateUniqueNames((uint64_t)a4, v34, (void *)[a3 binaryFunctions], (uint64_t)"binaryFunctions");
    std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)v34);
  }
}

- (void)validateImageblockTypes:(id)a3 reflection:(id)a4 context:(_MTLMessageContext *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if ([a4 tileBindings])
    {
      if (objc_msgSend((id)objc_msgSend(a3, "tileFunction"), "functionType") == 3)
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v6 = (void *)[a4 tileBindings];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v32 != v9) {
                objc_enumerationMutation(v6);
              }
              long long v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v11 type] == 17 && !objc_msgSend(v11, "imageBlockKind"))
              {
                if (objc_msgSend((id)objc_msgSend(v11, "dataTypeDescription"), "dataType") == 1)
                {
                  long long v27 = 0u;
                  long long v28 = 0u;
                  long long v29 = 0u;
                  long long v30 = 0u;
                  obuint64_t j = (id)objc_msgSend((id)objc_msgSend(v11, "dataTypeDescription"), "members");
                  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
                  if (v12)
                  {
                    uint64_t v13 = v12;
                    uint64_t v14 = *(void *)v28;
                    do
                    {
                      for (uint64_t j = 0; j != v13; ++j)
                      {
                        if (*(void *)v28 != v14) {
                          objc_enumerationMutation(obj);
                        }
                        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                        if (objc_msgSend(v16, "dataType", v22, v23, v24))
                        {
                          uint64_t v17 = [v16 renderTargetIndex];
                          uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", v17), "pixelFormat");
                          MTLPixelFormatGetInfoForDevice();
                          MTLDataTypeGetComponentType();
                          int ComponentCount = MTLDataTypeGetComponentCount();
                          uint64_t ShaderTypeName = MTLDataTypeGetShaderTypeName();
                          uint64_t v23 = v17;
                          uint64_t v24 = 0;
                          uint64_t v22 = ShaderTypeName;
                          _MTLMessageContextPush_();
                          BOOL v21 = v18 == 1 && ComponentCount == 4;
                          if (!v21 && v18 == 1)
                          {
                            uint64_t v23 = v17;
                            uint64_t v24 = 0;
                            uint64_t v22 = ShaderTypeName;
                            _MTLMessageContextPush_();
                          }
                        }
                      }
                      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
                    }
                    while (v13);
                  }
                }
                return;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
}

- (id)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v18[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (([a3 isRasterizationEnabled] & 1) == 0
      && (([a3 isRasterizationEnabled] & 1) != 0 || objc_msgSend(a3, "fragmentFunction")))
    {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 vertexLinkedFunctions], v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 fragmentLinkedFunctions], v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 objectLinkedFunctions], v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 meshLinkedFunctions], v18);
    if (!*(void *)&v18[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "vertexPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  id v11 = [(MTLToolsDevice *)self unwrapMTLRenderPipelineDescriptor:a3];
  uint64_t v17 = 0;
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, objc_msgSend(a3, "pipelineLibrary") == 0), &v17, a6);
  uint64_t v13 = (void *)v12;
  if (a5)
  {
    if ((~(_BYTE)a4 & 3) != 0)
    {
      [v11 setResourceIndex:*MEMORY[0x263F12CA0]];
      [v11 setForceResourceIndex:0];

      if (v13) {
        goto LABEL_27;
      }
      return 0;
    }
    *a5 = v17;
  }
  if (!v12) {
    return 0;
  }
LABEL_27:
  uint64_t v14 = [MTLDebugRenderPipelineState alloc];
  uint64_t v15 = [(MTLDebugRenderPipelineState *)v14 initWithPipelineState:v13 reflection:v17 parent:self descriptor:a3];

  return v15;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLDebugDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLDebugDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:0x20000 reflection:&v5 error:a4];
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__MTLDebugDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12DD8;
  v4[4] = a4;
  [(MTLDebugDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:0x20000 completionHandler:v4];
}

uint64_t __73__MTLDebugDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__MTLDebugDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12DD8;
  v5[4] = a5;
  [(MTLDebugDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __81__MTLDebugDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v15[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (([a3 isRasterizationEnabled] & 1) == 0
      && (([a3 isRasterizationEnabled] & 1) != 0 || objc_msgSend(a3, "fragmentFunction")))
    {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 vertexLinkedFunctions], v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 fragmentLinkedFunctions], v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 objectLinkedFunctions], v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 meshLinkedFunctions], v15);
    if (!*(void *)&v15[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "vertexPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  uint64_t v9 = (void *)[a3 copy];
  id v10 = [(MTLToolsDevice *)self unwrapMTLRenderPipelineDescriptor:v9];
  unint64_t v11 = -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, [v9 pipelineLibrary] == 0);
  id v12 = [(MTLToolsObject *)self baseObject];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  _OWORD v13[3] = &unk_264E12E28;
  v13[4] = self;
  v13[5] = v9;
  BOOL v14 = (~a4 & 3) != 0;
  v13[7] = a5;
  v13[8] = a4;
  v13[6] = v10;
  [v12 newRenderPipelineStateWithDescriptor:v10 options:v11 completionHandler:v13];
}

void __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugRenderPipelineState *a2, uint64_t a3)
{
  v3 = a2;
  if (a2) {
    v3 = [[MTLDebugRenderPipelineState alloc] initWithPipelineState:a2 reflection:a3 parent:*(void *)(a1 + 32) descriptor:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 48) setResourceIndex:*MEMORY[0x263F12CA0]];
    [*(id *)(a1 + 48) setForceResourceIndex:0];
    uint64_t v5 = (void *)[*(id *)(a1 + 32) baseObject];
    uint64_t v6 = *(void *)(a1 + 64);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    _OWORD v9[3] = &unk_264E13E48;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9[4] = v3;
    v9[5] = v8;
    [v5 newRenderPipelineStateWithDescriptor:v7 options:v6 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLDebugDevice *)self _newComputePipelineStateWithDescriptor:a3 options:0x20000 reflection:&v5 error:a4];
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLDebugDevice *)self _newComputePipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (id)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v18[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 linkedFunctions], v18);
    if (!*(void *)&v18[0]
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStatefulDynamicLibraries") & 1) == 0
      && objc_msgSend((id)objc_msgSend(a3, "preloadedLibraries"), "count"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  id v11 = [(MTLToolsDevice *)self unwrapMTLComputePipelineDescriptor:a3];
  uint64_t v17 = 0;
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, objc_msgSend(a3, "pipelineLibrary") == 0), &v17, a6);
  uint64_t v13 = (void *)v12;
  if (a5)
  {
    if ((~(_BYTE)a4 & 3) != 0)
    {
      [v11 setResourceIndex:*MEMORY[0x263F12CA0]];
      [v11 setForceResourceIndex:0];

      if (v13) {
        goto LABEL_15;
      }
      return 0;
    }
    *a5 = v17;
  }
  if (!v12) {
    return 0;
  }
LABEL_15:
  BOOL v14 = [MTLDebugComputePipelineState alloc];
  uint64_t v15 = [(MTLDebugComputePipelineState *)v14 initWithComputePipelineState:v13 reflection:v17 parent:self descriptor:a3];

  return v15;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__MTLDebugDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12E50;
  v4[4] = a4;
  [(MTLDebugDevice *)self _newComputePipelineStateWithDescriptor:a3 options:0x20000 completionHandler:v4];
}

uint64_t __74__MTLDebugDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__MTLDebugDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12E50;
  v5[4] = a5;
  [(MTLDebugDevice *)self _newComputePipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __82__MTLDebugDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  uint64_t v9 = (void *)[a3 copy];
  id v10 = [(MTLToolsDevice *)self unwrapMTLComputePipelineDescriptor:v9];
  unint64_t v11 = -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, [v9 pipelineLibrary] == 0);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  BOOL v15 = (~(_BYTE)a4 & 3) != 0;
  id v12 = [(MTLToolsObject *)self baseObject];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  _OWORD v13[3] = &unk_264E13E98;
  v13[4] = self;
  v13[5] = v9;
  v13[8] = v14;
  void v13[9] = a4;
  v13[6] = v10;
  v13[7] = a5;
  [v12 newComputePipelineStateWithDescriptor:v10 options:v11 completionHandler:v13];

  _Block_object_dispose(v14, 8);
}

void __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugComputePipelineState *a2, uint64_t a3)
{
  v3 = a2;
  if (a2) {
    v3 = [[MTLDebugComputePipelineState alloc] initWithComputePipelineState:a2 reflection:a3 parent:*(void *)(a1 + 32) descriptor:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 48) setResourceIndex:*MEMORY[0x263F12CA0]];
    [*(id *)(a1 + 48) setForceResourceIndex:0];
    uint64_t v5 = (void *)[*(id *)(a1 + 32) baseObject];
    uint64_t v6 = *(void *)(a1 + 72);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    _OWORD v9[3] = &unk_264E13E70;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9[4] = v3;
    v9[5] = v8;
    [v5 newComputePipelineStateWithDescriptor:v7 options:v6 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLDebugDevice *)self _newComputePipelineStateWithFunction:a3 options:0x20000 reflection:&v5 error:a4];
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLDebugDevice *)self _newComputePipelineStateWithFunction:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (id)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v17 = 0;
  uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:options:reflection:error:", objc_msgSend(a3, "baseObject"), -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1), &v17, a6);
  id v12 = (void *)v11;
  if (a5)
  {
    if ((~a4 & 3) != 0)
    {

      if (v12) {
        goto LABEL_5;
      }
      return 0;
    }
    *a5 = v17;
  }
  if (!v11) {
    return 0;
  }
LABEL_5:
  uint64_t v13 = objc_opt_new();
  [v13 setComputeFunction:a3];
  BOOL v14 = [MTLDebugComputePipelineState alloc];
  BOOL v15 = [(MTLDebugComputePipelineState *)v14 initWithComputePipelineState:v12 reflection:v17 parent:self descriptor:v13];

  return v15;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__MTLDebugDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v4[3] = &unk_264E12E50;
  v4[4] = a4;
  [(MTLDebugDevice *)self _newComputePipelineStateWithFunction:a3 options:0x20000 completionHandler:v4];
}

uint64_t __72__MTLDebugDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__MTLDebugDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12E50;
  v5[4] = a5;
  [(MTLDebugDevice *)self _newComputePipelineStateWithFunction:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __80__MTLDebugDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  char v9 = ~(_BYTE)a4;
  unint64_t v10 = [(MTLToolsDevice *)self debugPipelineOptions:a4 includePipelinePerfStats:1];
  BOOL v11 = (v9 & 3) != 0;
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  void v14[3] = &unk_264E13EC0;
  v14[4] = a3;
  v14[5] = self;
  BOOL v15 = v11;
  v14[6] = a5;
  v14[7] = a4;
  [v12 newComputePipelineStateWithFunction:v13 options:v10 completionHandler:v14];
}

void __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1, MTLDebugComputePipelineState *a2, uint64_t a3)
{
  id v4 = a2;
  if (a2)
  {
    uint64_t v6 = objc_opt_new();
    [v6 setComputeFunction:*(void *)(a1 + 32)];
    id v4 = [[MTLDebugComputePipelineState alloc] initWithComputePipelineState:v4 reflection:a3 parent:*(void *)(a1 + 40) descriptor:v6];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v7 = (void *)[*(id *)(a1 + 40) baseObject];
    uint64_t v8 = [*(id *)(a1 + 32) baseObject];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2;
    _OWORD v11[3] = &unk_264E13E70;
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v11[4] = v4;
    v11[5] = v10;
    [v7 newComputePipelineStateWithFunction:v8 options:v9 completionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v17[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 linkedFunctions], v17);
    if (!*(void *)&v17[0]
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
      && objc_msgSend((id)objc_msgSend(a3, "preloadedLibraries"), "count"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  id v11 = [(MTLToolsDevice *)self unwrapMTLTileRenderPipelineDescriptor:a3];
  uint64_t v16 = 0;
  id v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1), &v16, a6);
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  [(MTLDebugDevice *)self validateImageblockTypes:v11 reflection:v16 context:v17];
  _MTLMessageContextEnd();
  if (a5)
  {
    if ((~a4 & 3) != 0)
    {

      if (v12) {
        goto LABEL_14;
      }
      return 0;
    }
    *a5 = v16;
  }
  if (!v12) {
    return 0;
  }
LABEL_14:
  uint64_t v13 = [MTLDebugRenderPipelineState alloc];
  BOOL v14 = [(MTLDebugRenderPipelineState *)v13 initWithPipelineState:v12 reflection:v16 parent:self tileDescriptor:a3];

  return v14;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLDebugDevice *)self _newRenderPipelineStateWithTileDescriptor:a3 options:0x20000 reflection:&v5 error:a4];
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLDebugDevice *)self _newRenderPipelineStateWithTileDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (void)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v15[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 linkedFunctions], v15);
    if (!*(void *)&v15[0]
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
      && objc_msgSend((id)objc_msgSend(a3, "preloadedLibraries"), "count"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  uint64_t v9 = (void *)[a3 copy];
  id v10 = [(MTLToolsDevice *)self unwrapMTLTileRenderPipelineDescriptor:v9];
  unint64_t v11 = [(MTLToolsDevice *)self debugPipelineOptions:a4 includePipelinePerfStats:1];
  id v12 = [(MTLToolsObject *)self baseObject];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  _OWORD v13[3] = &unk_264E12E28;
  v13[4] = self;
  v13[5] = v9;
  BOOL v14 = (~a4 & 3) != 0;
  v13[7] = a5;
  v13[8] = a4;
  v13[6] = v10;
  [v12 newRenderPipelineStateWithTileDescriptor:v10 options:v11 completionHandler:v13];
}

void __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugRenderPipelineState *a2, uint64_t a3)
{
  v3 = a2;
  if (a2) {
    v3 = [[MTLDebugRenderPipelineState alloc] initWithPipelineState:a2 reflection:a3 parent:*(void *)(a1 + 32) tileDescriptor:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) baseObject];
    uint64_t v6 = *(void *)(a1 + 64);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2;
    _OWORD v9[3] = &unk_264E13E48;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9[4] = v3;
    v9[5] = v8;
    [v5 newRenderPipelineStateWithTileDescriptor:v7 options:v6 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12DD8;
  v4[4] = a4;
  [(MTLDebugDevice *)self _newRenderPipelineStateWithTileDescriptor:a3 options:0x20000 completionHandler:v4];
}

uint64_t __77__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12DD8;
  v5[4] = a5;
  [(MTLDebugDevice *)self _newRenderPipelineStateWithTileDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __85__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v18[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
  }
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "supportsMeshShaders") & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v18[0])
  {
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 objectLinkedFunctions], v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 meshLinkedFunctions], v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 fragmentLinkedFunctions], v18);
    if (!*(void *)&v18[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  id v11 = [(MTLToolsDevice *)self unwrapMTLMeshRenderPipelineDescriptor:a3];
  uint64_t v17 = 0;
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1), &v17, a6);
  uint64_t v13 = (void *)v12;
  if (a5)
  {
    if ((~(_BYTE)a4 & 3) != 0)
    {
      [v11 setResourceIndex:*MEMORY[0x263F12CA0]];
      [v11 setForceResourceIndex:0];

      if (v13) {
        goto LABEL_23;
      }
      return 0;
    }
    *a5 = v17;
  }
  if (!v12) {
    return 0;
  }
LABEL_23:
  BOOL v14 = [MTLDebugRenderPipelineState alloc];
  BOOL v15 = [(MTLDebugRenderPipelineState *)v14 initWithPipelineState:v13 reflection:v17 parent:self meshDescriptor:a3];

  return v15;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLDebugDevice *)self _newRenderPipelineStateWithMeshDescriptor:a3 options:0x20000 reflection:&v5 error:a4];
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLDebugDevice *)self _newRenderPipelineStateWithMeshDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (void)_newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v15[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
  }
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "supportsMeshShaders") & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v15[0])
  {
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 objectLinkedFunctions], v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 meshLinkedFunctions], v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", [a3 fragmentLinkedFunctions], v15);
    if (!*(void *)&v15[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  uint64_t v9 = (void *)[a3 copy];
  id v10 = [(MTLToolsDevice *)self unwrapMTLMeshRenderPipelineDescriptor:v9];
  unint64_t v11 = [(MTLToolsDevice *)self debugPipelineOptions:a4 includePipelinePerfStats:1];
  id v12 = [(MTLToolsObject *)self baseObject];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  _OWORD v13[3] = &unk_264E12E28;
  v13[4] = self;
  v13[5] = v9;
  BOOL v14 = (~a4 & 3) != 0;
  v13[7] = a5;
  v13[8] = a4;
  v13[6] = v10;
  [v12 newRenderPipelineStateWithMeshDescriptor:v10 options:v11 completionHandler:v13];
}

void __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugRenderPipelineState *a2, uint64_t a3)
{
  v3 = a2;
  if (a2) {
    v3 = [[MTLDebugRenderPipelineState alloc] initWithPipelineState:a2 reflection:a3 parent:*(void *)(a1 + 32) meshDescriptor:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 48) setResourceIndex:*MEMORY[0x263F12CA0]];
    [*(id *)(a1 + 48) setForceResourceIndex:0];
    uint64_t v5 = (void *)[*(id *)(a1 + 32) baseObject];
    uint64_t v6 = *(void *)(a1 + 64);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2;
    _OWORD v9[3] = &unk_264E13E48;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9[4] = v3;
    v9[5] = v8;
    [v5 newRenderPipelineStateWithMeshDescriptor:v7 options:v6 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12DD8;
  v4[4] = a4;
  [(MTLDebugDevice *)self _newRenderPipelineStateWithMeshDescriptor:a3 options:0x20000 completionHandler:v4];
}

uint64_t __77__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12DD8;
  v5[4] = a5;
  [(MTLDebugDevice *)self _newRenderPipelineStateWithMeshDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __85__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(a4);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      uint64_t v11 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  BOOL v14 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithDAG:functions:error:", a3, v9, a5);

  if (!v14) {
    return 0;
  }
  BOOL v15 = [(MTLToolsObject *)[MTLDebugLibrary alloc] initWithBaseObject:v14 parent:self];

  return v15;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLStitchedLibraryDescriptor:a3];
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptor:error:", v6, a4);

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(MTLToolsObject *)[MTLDebugLibrary alloc] initWithBaseObject:v7 parent:self];

  return v8;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLStitchedLibraryDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__MTLDebugDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E13030;
  v8[4] = v6;
  v8[5] = self;
  v8[6] = a4;
  [v7 newLibraryWithStitchedDescriptor:v6 completionHandler:v8];
}

void __69__MTLDebugDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [(MTLToolsObject *)[MTLDebugLibrary alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)newDagStringWithGraphs:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newDagStringWithGraphs:a3];
}

- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "baseObject"));
      }
      uint64_t v11 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
  id v14 = [(MTLToolsObject *)self baseObject];
  char v15 = objc_opt_respondsToSelector();
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
  if (v15) {
    uint64_t v17 = [v14 newLibraryWithCIFiltersForComputePipeline:v16 imageFilterFunctionInfo:a4 error:a5];
  }
  else {
    uint64_t v17 = [v14 newLibraryWithCIFilters:v16 imageFilterFunctionInfo:a4 error:a5];
  }
  long long v18 = (void *)v17;

  if (!v18) {
    return 0;
  }
  long long v19 = [[MTLDebugLibrary alloc] initWithLibrary:v18 parent:self type:4 code:0 options:0];
  [(MTLDebugLibrary *)v19 setImageFilterFunctions:a3 imageFilterFunctionInfo:a4];

  return v19;
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v7 = -[MTLDebugDevice newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:](self, "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", a3, a4);
  uint64_t v8 = (void *)[v7 newFunctionWithName:@"ciKernelMain"];
  id v9 = [(MTLDebugDevice *)self newComputePipelineStateWithFunction:v8 error:a5];

  return v9;
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithFile:error:", a3, a4);
  if (result)
  {
    id v8 = result;
    id v9 = [[MTLDebugLibrary alloc] initWithLibrary:result parent:self type:1 code:a3 options:0];

    return v9;
  }
  return result;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure();
    }
    uint64_t v7 = [a3 fileSystemRepresentation];
    if (!v7) {
      MTLReportFailure();
    }
  }
  else
  {
    MTLReportFailure();
    uint64_t v7 = 0;
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithURL:error:", a3, a4);
  if (result)
  {
    id v9 = result;
    uint64_t v10 = (void *)[[NSString alloc] initWithUTF8String:v7];
    uint64_t v11 = [[MTLDebugLibrary alloc] initWithLibrary:v9 parent:self type:1 code:v10 options:0];

    return v11;
  }
  return result;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (!(void)v26)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = (void *)[a4 libraries];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v8);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v19 = v11 + v13;
              _MTLMessageContextPush_();
            }
            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          v11 += v13;
        }
        while (v10);
      }
    }
  }
  if (a3)
  {
    objc_opt_class();
    id v14 = a5;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
  }
  else
  {
    id v14 = a5;
  }
  _MTLMessageContextPush_();
LABEL_16:
  _MTLMessageContextEnd();
  if (a4) {
    a4 = [(MTLToolsDevice *)self unwrapMTLCompileOptions:a4];
  }
  char v15 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v19), "newLibraryWithSource:options:error:", a3, a4, v14);
  sourceLibraryObjectCache = self->super.sourceLibraryObjectCache;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__MTLDebugDevice_newLibraryWithSource_options_error___block_invoke;
  v21[3] = &unk_264E13EE8;
  v21[4] = v15;
  v21[5] = self;
  v21[6] = a3;
  v21[7] = a4;
  id v17 = [(MTLToolsObjectCache *)sourceLibraryObjectCache getCachedObjectForKey:v15 onMiss:v21];

  return v17;
}

uint64_t __53__MTLDebugDevice_newLibraryWithSource_options_error___block_invoke(void *a1)
{
  v2 = [MTLDebugLibrary alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];

  return (uint64_t)[(MTLDebugLibrary *)v2 initWithLibrary:v3 parent:v4 type:2 code:v5 options:v6];
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (!(void)v25)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = (void *)[a4 libraries];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v22;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v8);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v18 = v11 + v13;
              _MTLMessageContextPush_();
            }
            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          v11 += v13;
        }
        while (v10);
      }
    }
  }
  if (a3)
  {
    objc_opt_class();
    id v14 = a5;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
  }
  else
  {
    id v14 = a5;
  }
  _MTLMessageContextPush_();
LABEL_16:
  _MTLMessageContextEnd();
  if (a4) {
    id v15 = [(MTLToolsDevice *)self unwrapMTLCompileOptions:a4];
  }
  else {
    id v15 = 0;
  }
  uint64_t v16 = objc_msgSend(v15, "copy", v18);
  id v17 = [(MTLToolsObject *)self baseObject];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v20[3] = &unk_264E13F10;
  v20[4] = self;
  v20[5] = a3;
  v20[6] = v16;
  v20[7] = v14;
  [v17 newLibraryWithSource:a3 options:v16 completionHandler:v20];
}

void __65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke_2;
  v6[3] = &unk_264E13EE8;
  v6[4] = a2;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v5 = (void *)[v4 getCachedObjectForKey:a2 onMiss:v6];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke_2(void *a1)
{
  v2 = [MTLDebugLibrary alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];

  return (uint64_t)[(MTLDebugLibrary *)v2 initWithLibrary:v3 parent:v4 type:2 code:v5 options:v6];
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  if (!a3) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithData:error:", a3, a4);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLDebugLibrary alloc] initWithLibrary:result parent:self type:3 code:a3 options:0];

    return v9;
  }
  return result;
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newPipelineLibraryWithFilePath:error:", a3, a4);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLDebugPipelineLibrary alloc] initWithLibrary:result parent:self filePath:a3];

    return v9;
  }
  return result;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  if (![(MTLToolsDevice *)self supportsFamily:1006]) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newResidencySetWithDescriptor:error:", a3, a4);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLDebugResidencySet alloc] initWithResidencySet:result device:self];

    return v9;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a3) {
      goto LABEL_21;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_21;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![a3 usage] && complain_about_sloppy_texture_usage) {
      _MTLMessageContextPush_();
    }
    if ([a3 pixelFormat] == 261) {
      _MTLMessageContextPush_();
    }
    [(MTLDebugDevice *)self validateMemorylessResource:a3 context:v13];
    if (([a3 usage] & 0x20) != 0)
    {
      if (([a3 usage] & 3) == 0) {
        _MTLMessageContextPush_();
      }
      if ([a3 pixelFormat] != 53
        && [a3 pixelFormat] != 54
        && [a3 pixelFormat] != 103)
      {
        _MTLMessageContextPush_();
      }
    }
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", [a3 resourceOptions], 1, 1, v13);
    if (!a4) {
      _MTLMessageContextPush_();
    }
    if (!*(void *)&v13[0])
    {
      uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:", a3, a4, a5);
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v9 = [[MTLDebugTexture alloc] initWithBaseTexture:v11 device:self plane:a5];

        goto LABEL_22;
      }
    }
  }
LABEL_21:
  uint64_t v9 = 0;
LABEL_22:
  _MTLMessageContextEnd();
  return v9;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a3) {
      goto LABEL_23;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_23;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![a3 usage] && complain_about_sloppy_texture_usage) {
      _MTLMessageContextPush_();
    }
    if ([a3 pixelFormat] == 261) {
      _MTLMessageContextPush_();
    }
    [(MTLDebugDevice *)self validateMemorylessResource:a3 context:v15];
    if (([a3 usage] & 0x20) != 0)
    {
      if (([a3 usage] & 3) == 0) {
        _MTLMessageContextPush_();
      }
      if ([a3 pixelFormat] != 53
        && [a3 pixelFormat] != 54
        && [a3 pixelFormat] != 103)
      {
        _MTLMessageContextPush_();
      }
    }
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", [a3 resourceOptions], 1, 1, v15);
    if (!a4) {
      _MTLMessageContextPush_();
    }
    if (a6 >= 0x801) {
      _MTLMessageContextPush_();
    }
    if (!*(void *)&v15[0])
    {
      uint64_t v13 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:slice:", a3, a4, a5, a6);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v11 = [[MTLDebugTexture alloc] initWithBaseTexture:v13 device:self plane:a5];

        goto LABEL_24;
      }
    }
  }
LABEL_23:
  uint64_t v11 = 0;
LABEL_24:
  _MTLMessageContextEnd();
  return v11;
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithIOSurface:", a3);
  if (result)
  {
    id v6 = result;
    long long v7 = [[MTLDebugBuffer alloc] initWithBuffer:result device:self options:0];

    return v7;
  }
  return result;
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureLayoutWithDescriptor:isHeapOrBufferBacked:", a3, a4);
  if (result)
  {
    id v7 = result;
    id v8 = [[MTLDebugTextureLayout alloc] initWithBaseTextureLayout:result device:self descriptor:a3];

    return v8;
  }
  return result;
}

- (const)targetDeviceInfo
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (const MTLTargetDeviceArch *)[v2 targetDeviceInfo];
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minLinearTextureAlignmentForPixelFormat:", a3);
}

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0), "minimumLinearTextureAlignmentForPixelFormat:", a3);
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  if (a3) {
    [a3 screenSize];
  }
  uint64_t v16 = 0;
  uint64_t v5 = [a3 layerPointer:&v16];
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = v17;
  uint64_t v7 = v18;
  uint64_t v9 = v16;
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  _MTLMessageContextBegin_();
  unint64_t v10 = [v6 maxRasterizationRateLayerCount];
  if (!v10) {
    _MTLMessageContextPush_();
  }
  if ((unint64_t)(v8 - 16385) <= 0xFFFFFFFFFFFFBFFFLL) {
    _MTLMessageContextPush_();
  }
  if ((unint64_t)(v7 - 16385) <= 0xFFFFFFFFFFFFBFFFLL) {
    _MTLMessageContextPush_();
  }
  if (v9 - 1 >= v10)
  {
    _MTLMessageContextPush_();
    if (v5) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!v5)
  {
LABEL_20:
    _MTLMessageContextPush_();
    goto LABEL_21;
  }
  uint64_t v11 = 0;
  do
  {
    if (*(void *)(v5 + 8 * v11) || (_MTLMessageContextPush_(), *(void *)(v5 + 8 * v11)))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _MTLMessageContextPush_();
      }
    }
    ++v11;
  }
  while (v9 != v11);
LABEL_21:
  _MTLMessageContextEnd();
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRasterizationRateMapWithDescriptor:", a3);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = (void *)v12;
  uint64_t v14 = [(MTLToolsObject *)[MTLToolsRasterizationRateMap alloc] initWithBaseObject:v12 parent:self];

  return v14;
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCounterSampleBufferWithDescriptor:error:", a3, a4);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLDebugCounterSampleBuffer alloc] initWithCounterSampleBuffer:result device:self descriptor:a3];

    return v9;
  }
  return result;
}

- (id)newEvent
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newEvent");
  if (result)
  {
    id v4 = result;
    uint64_t v5 = [(MTLToolsObject *)[MTLDebugEvent alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newSharedEvent
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEvent");
  if (result)
  {
    id v4 = result;
    uint64_t v5 = [(MTLToolsObject *)[MTLDebugSharedEvent alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithMachPort:", *(void *)&a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLDebugSharedEvent alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newSharedEventWithHandle:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithHandle:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLDebugSharedEvent alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newLateEvalEvent
{
  [(MTLToolsObject *)self baseObject];
  _MTLMessageContextBegin_();
  if (![(MTLToolsDevice *)self supportsLateEvalEvent]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLateEvalEvent");
  if (!v4) {
    return 0;
  }
  id v5 = (void *)v4;
  uint64_t v3 = [(MTLToolsObject *)[MTLDebugLateEvalEvent alloc] initWithBaseObject:v4 parent:self];

  return v3;
}

- (id)newFence
{
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugDevice;
  id v3 = [(MTLToolsDevice *)&v6 newFence];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLDebugDevice;
    [(MTLToolsDevice *)&v5 maxFenceInstances];
    MTLReportFailure();
  }
  return v3;
}

- (void)addReferenceTrackingCommandBuffer:(id)a3
{
  id v5 = a3;
  p_referenceTrackingCommandBufferLock = &self->_referenceTrackingCommandBufferLock;
  os_unfair_lock_lock(&self->_referenceTrackingCommandBufferLock);
  std::__hash_table<MTLDebugCommandBuffer *,std::hash<MTLDebugCommandBuffer *>,std::equal_to<MTLDebugCommandBuffer *>,std::allocator<MTLDebugCommandBuffer *>>::__emplace_unique_key_args<MTLDebugCommandBuffer *,MTLDebugCommandBuffer * const&>((uint64_t)&self->_referenceTrackingCommandBuffers, &v5, &v5);
  os_unfair_lock_unlock(p_referenceTrackingCommandBufferLock);
}

- (void)removeReferenceTrackingCommandBuffer:(id)a3
{
  id v7 = a3;
  p_referenceTrackingCommandBufferLock = &self->_referenceTrackingCommandBufferLock;
  os_unfair_lock_lock(&self->_referenceTrackingCommandBufferLock);
  p_referenceTrackingCommandBuffers = &self->_referenceTrackingCommandBuffers;
  objc_super v6 = std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::find<MTLToolsObject *>(p_referenceTrackingCommandBuffers, &v7);
  if (v6) {
    std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::erase(p_referenceTrackingCommandBuffers, v6);
  }
  os_unfair_lock_unlock(p_referenceTrackingCommandBufferLock);
}

- (void)notifyExternalReferencesNonZeroOnDealloc:(id)a3
{
  id v5 = (id)[a3 baseObject];
  p_referenceTrackingCommandBufferLock = &self->_referenceTrackingCommandBufferLock;
  os_unfair_lock_lock(&self->_referenceTrackingCommandBufferLock);
  next = self->_referenceTrackingCommandBuffers.__table_.__p1_.__value_.__next_;
  if (next)
  {
    id v8 = 0;
    uint64_t v9 = 0;
    do
    {
      unint64_t v10 = (void *)next[2];
      char v12 = 0;
      if ([v10 testObjectReferenced:a3 wasInternallyRetained:&v12]) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 0;
      }
      if (v11)
      {
        id v8 = (id)[v10 label];
        uint64_t v9 = v10;
      }
      next = (void *)*next;
    }
    while (next);
    os_unfair_lock_unlock(p_referenceTrackingCommandBufferLock);
    if (v9)
    {
      [v5 description];
      MTLReportFailure();
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_referenceTrackingCommandBufferLock);
    id v8 = 0;
  }
}

- (void)validateRaytracing
{
  if (![(MTLToolsDevice *)self supportsRaytracing])
  {
    MTLReportFailure();
  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  [(MTLDebugDevice *)self validateRaytracing];
  checkAccelerationStructureDescriptor(self, a4, 0);
  id v7 = [(MTLToolsObject *)self baseObject];
  id result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)unwrapAccelerationStructureDescriptor(a4);
  if (v7)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[v7 accelerationStructureSizesWithDescriptor:result];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  [(MTLDebugDevice *)self validateRaytracing];
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:", a3);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  [(MTLDebugDevice *)self validateRaytracing];
  checkAccelerationStructureDescriptor(self, a3, 0);
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithDescriptor:", unwrapAccelerationStructureDescriptor(a3));
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  [(MTLDebugDevice *)self validateRaytracing];
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:resourceIndex:", a3, a4);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  [(MTLDebugDevice *)self validateRaytracing];
  if (!a3) {
    goto LABEL_12;
  }
  if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
  if ([a3 length] <= a4)
  {
    unint64_t v11 = a4;
    uint64_t v12 = [a3 length];
LABEL_12:
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v11, v12), "newAccelerationStructureWithBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
  if (result)
  {
    id v9 = result;
    unint64_t v10 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v10;
  }
  return result;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  [(MTLDebugDevice *)self validateRaytracing];
  if (!a3) {
    goto LABEL_12;
  }
  if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
  if ([a3 length] <= a4)
  {
    unint64_t v13 = a4;
    uint64_t v14 = [a3 length];
LABEL_12:
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v13, v14), "newAccelerationStructureWithBuffer:offset:resourceIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  if (result)
  {
    id v11 = result;
    uint64_t v12 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v12;
  }
  return result;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  if (!a3) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:", a3, unwrapAccelerationStructureDescriptor(a4));
  if (result)
  {
    id v8 = result;
    id v9 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  if (!a3) {
    MTLReportFailure();
  }
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super._device, (void *)[a4 objectAtIndexedSubscript:v10], 0, @"Primitive acceleration structure");
      objc_msgSend(v9, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v10), "baseObject"));
      uint64_t v10 = v11;
    }
    while ([a4 count] > (unint64_t)v11++);
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:", a3, v9, unwrapAccelerationStructureDescriptor(a5));
  if (result)
  {
    id v14 = result;
    id v15 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v15;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:withDescriptor:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    MTLReportFailure();
    if (a4) {
      goto LABEL_3;
    }
  }
  MTLReportFailure();
LABEL_3:
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  id v11 = unwrapAccelerationStructureDescriptor(a5);

  [v9 deserializePrimitiveAccelerationStructure:v10 fromBytes:a4 withDescriptor:v11];
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    MTLReportFailure();
    if (a4) {
      goto LABEL_3;
    }
  }
  MTLReportFailure();
LABEL_3:
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a5, "count"));
  if ([a5 count])
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super._device, (void *)[a5 objectAtIndexedSubscript:v11], 0, @"Primitive acceleration structure");
      objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v11), "baseObject"));
      uint64_t v11 = v12;
    }
    while ([a5 count] > (unint64_t)v12++);
  }
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  id v16 = unwrapAccelerationStructureDescriptor(a6);

  [v14 deserializeInstanceAccelerationStructure:v15 fromBytes:a4 primitiveAccelerationStructures:v10 withDescriptor:v16];
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLDebugVisibleFunctionTable alloc] initWithVisibleFunctionTable:result parent:self descriptor:a3 stage:0];

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  [(MTLDebugDevice *)self validateRaytracing];
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLDebugIntersectionFunctionTable alloc] initWithIntersectionFunctionTable:result parent:self descriptor:a3 stage:0];

    return v7;
  }
  return result;
}

- (void)clearRenderEncoder:(id)a3 writeMask:(unint64_t)a4 withCheckerboard:(float *)a5
{
  id v9 = (void *)[a3 baseObject];
  p_checkerboardRTPipelineCache = &self->_checkerboardRTPipelineCache;
  unint64_t v16 = a4;
  uint64_t ColorPipelineState = CheckerboardRenderTargetPipelineCache::getColorPipelineState((uint64_t)p_checkerboardRTPipelineCache, (void *)[a3 descriptor], &v16);
  if (ColorPipelineState)
  {
    uint64_t v12 = ColorPipelineState;
    unint64_t v13 = (void *)[a3 descriptor];
    BOOL v14 = (a4 & 0x100000000) != 0 && objc_msgSend((id)objc_msgSend(v13, "depthAttachment"), "storeAction") == 0;
    uint64_t v15 = p_checkerboardRTPipelineCache->_depthStencilState[v14];
    [v9 setCullMode:0];
    [v9 setRenderPipelineState:v12];
    [v9 setDepthStencilState:v15];
    [v9 setFragmentBytes:a5 length:32 atIndex:0];
    [v9 setVisibilityResultMode:0 offset:0];
    [v9 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newProfileWithExecutionSize:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLDebugDeadlineProfile alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)getDynamicLibraryForBaseObject:(id)a3
{
  dynamicLibraryObjectCache = self->super.dynamicLibraryObjectCache;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__MTLDebugDevice_getDynamicLibraryForBaseObject___block_invoke;
  v5[3] = &unk_264E12EC8;
  v5[4] = a3;
  void v5[5] = self;
  return [(MTLToolsObjectCache *)dynamicLibraryObjectCache getCachedObjectForKey:a3 onMiss:v5];
}

uint64_t __49__MTLDebugDevice_getDynamicLibraryForBaseObject___block_invoke(uint64_t a1)
{
  id v2 = [MTLDebugDynamicLibrary alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLToolsObject *)v2 initWithBaseObject:v3 parent:v4];
}

- (id)getFunctionForBaseObject:(id)a3 library:(id)a4
{
  functionObjectCache = self->super.functionObjectCache;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__MTLDebugDevice_getFunctionForBaseObject_library___block_invoke;
  v6[3] = &unk_264E12EF0;
  v6[4] = a3;
  void v6[5] = a4;
  return [(MTLToolsObjectCache *)functionObjectCache getCachedObjectForKey:a3 onMiss:v6];
}

uint64_t __51__MTLDebugDevice_getFunctionForBaseObject_library___block_invoke(uint64_t a1)
{
  id v2 = [MTLDebugFunction alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLToolsFunction *)v2 initWithFunction:v3 library:v4];
}

- (id)getDepthStencilStateForBaseObject:(id)a3 descriptor:(id)a4
{
  depthStencilObjectCache = self->super.depthStencilObjectCache;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__MTLDebugDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_264E13080;
  v6[4] = a3;
  void v6[5] = a4;
  void v6[6] = self;
  return [(MTLToolsObjectCache *)depthStencilObjectCache getCachedObjectForKey:a3 onMiss:v6];
}

uint64_t __63__MTLDebugDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke(void *a1)
{
  id v2 = [MTLDebugDepthStencilState alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return (uint64_t)[(MTLDebugDepthStencilState *)v2 initWithDepthStencilState:v3 descriptor:v4 device:v5];
}

- (id)getSamplerStateForBaseObject:(id)a3 descriptor:(id)a4
{
  samplerObjectCache = self->super.samplerObjectCache;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__MTLDebugDevice_getSamplerStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_264E130A8;
  v6[4] = a3;
  void v6[5] = a4;
  void v6[6] = self;
  return [(MTLToolsObjectCache *)samplerObjectCache getCachedObjectForKey:a3 onMiss:v6];
}

uint64_t __58__MTLDebugDevice_getSamplerStateForBaseObject_descriptor___block_invoke(void *a1)
{
  id v2 = [MTLDebugSamplerState alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return (uint64_t)[(MTLDebugSamplerState *)v2 initWithSamplerState:v3 descriptor:v4 device:v5];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  unint64_t v5 = [v4 heapAccelerationStructureSizeAndAlignWithSize:a3];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  checkAccelerationStructureDescriptor(self, a3, 0);
  id v5 = [(MTLToolsObject *)self baseObject];
  id v6 = unwrapAccelerationStructureDescriptor(a3);

  unint64_t v7 = [v5 heapAccelerationStructureSizeAndAlignWithDescriptor:v6];
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  id v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferBinding:", a3);
  id v6 = -[MTLDebugArgumentEncoder initWithBaseObject:structType:parent:]([MTLDebugArgumentEncoder alloc], "initWithBaseObject:structType:parent:", v5, [a3 bufferStructType], self);

  return v6;
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![a3 fileSystemRepresentation]) {
LABEL_7:
  }
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  unint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:error:", a3, a4);
  unint64_t v8 = [[MTLDebugIOHandle alloc] initWithBaseObject:v7 parent:self];

  return v8;
}

- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![a3 fileSystemRepresentation]) {
LABEL_9:
  }
    _MTLMessageContextPush_();
  if ((unint64_t)a4 >= 5) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  id v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:compressionType:error:", a3, a4, a5);
  uint64_t v10 = [[MTLDebugIOHandle alloc] initWithBaseObject:v9 parent:self];

  return v10;
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![a3 fileSystemRepresentation]) {
LABEL_7:
  }
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  unint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:error:", a3, a4);
  unint64_t v8 = [[MTLDebugIOHandle alloc] initWithBaseObject:v7 parent:self];

  return v8;
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![a3 fileSystemRepresentation]) {
LABEL_9:
  }
    _MTLMessageContextPush_();
  if ((unint64_t)a4 >= 5) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  id v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:compressionType:error:", a3, a4, a5);
  uint64_t v10 = [[MTLDebugIOHandle alloc] initWithBaseObject:v9 parent:self];

  return v10;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 priority] && objc_msgSend(a3, "priority") != 1 && objc_msgSend(a3, "priority") != 2) {
      _MTLMessageContextPush_();
    }
    if ([a3 type] && objc_msgSend(a3, "type") != 1) {
      _MTLMessageContextPush_();
    }
    if ([a3 scratchBufferAllocator]
      && (objc_msgSend((id)objc_msgSend(a3, "scratchBufferAllocator"), "conformsToProtocol:", &unk_26EFA2BA8) & 1) == 0)
    {
LABEL_17:
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  unint64_t v7 = (void *)[a3 copy];
  if ([a3 scratchBufferAllocator])
  {
    unint64_t v8 = -[MTLDebugIOScratchBufferAllocator initWithBaseObject:parent:]([MTLDebugIOScratchBufferAllocator alloc], "initWithBaseObject:parent:", [a3 scratchBufferAllocator], self);
    [v7 setScratchBufferAllocator:v8];
  }
  id v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOCommandQueueWithDescriptor:error:", v7, a4);
  uint64_t v10 = [(MTLToolsIOCommandQueue *)[MTLDebugIOCommandQueue alloc] initWithBaseObject:v9 parent:self];

  return v10;
}

- (BOOL)areWritableHeapsEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 areWritableHeapsEnabled];
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setWritableHeapsEnabled:v3];
}

- (BOOL)storeValidationEnabled
{
  return self->_storeValidationEnabled;
}

- (BOOL)loadValidationEnabled
{
  return self->_loadValidationEnabled;
}

- (void).cxx_destruct
{
  CheckerboardRenderTargetPipelineCache::~CheckerboardRenderTargetPipelineCache(&self->_checkerboardRTPipelineCache);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_referenceTrackingCommandBuffers);

  MTLSamplerDescriptorHashMap::~MTLSamplerDescriptorHashMap(&self->_argumentBufferSamplers);
}

- (id).cxx_construct
{
  self->_referenceTrackingCommandBuffers.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_referenceTrackingCommandBuffers.__table_.__p1_.__value_.__next_ = 0u;
  self->_referenceTrackingCommandBuffers.__table_.__p3_.__value_ = 1.0;
  self->_checkerboardRTPipelineCache._cache.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_checkerboardRTPipelineCache._cache.__table_.__p1_.__value_.__next_ = 0u;
  self->_checkerboardRTPipelineCache._cache.__table_.__p3_.__value_ = 1.0;
  return self;
}

@end