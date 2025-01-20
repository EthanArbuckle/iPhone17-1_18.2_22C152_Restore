@interface PXGMetalRenderContext
+ (BOOL)deviceSupportsSharedTextures;
+ (id)privateContextWithDevice:(id)a3;
+ (id)privateContextWithDevice:(id)a3 commandQueue:(id)a4;
+ (id)sharedContextWithDevice:(id)a3 commandQueue:(id)a4;
- (BOOL)supportsSharedTextures;
- (BOOL)wantsMutableSharedTextures;
- (BOOL)wantsUniformThreadgroups;
- (MTLCommandQueue)commandQueue;
- (MTLComputePipelineState)textureCopyRegionKernelPipelineState;
- (MTLDevice)device;
- (MTLLibrary)library;
- (PXGMetalRenderContext)initWithDevice:(id)a3 commandQueue:(id)a4;
- (id)newMipmappedTextureFromTexture:(id)a3;
- (id)newTextureWithDescriptor:(id)a3;
- (void)_blitFromBuffer:(id)a3 toTexture:(id)a4 inRegion:(id *)a5 bytesPerRow:(unint64_t)a6 offset:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)_blitFromTexture:(id)a3 toTexture:(id)a4 mipmapped:(BOOL)a5;
- (void)_createComputePipelinesIfNeeded;
- (void)blitBuffer:(id)a3 toTexture:(id)a4 count:(unint64_t)a5 blitEncoder:(id)a6;
- (void)blitTexture:(id)a3 toTexture:(id)a4 blitEncoder:(id)a5;
- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)encodeCopyKernelWithSourceTexture:(id)a3 targetTexture:(id)a4 sourceRegions:(id)a5 sourceRegionsOffset:(unint64_t)a6 targetRegionSize:(id *)a7 regionsCount:(unint64_t)a8 computeEncoder:(id)a9;
- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)setTextureCopyRegionKernelPipelineState:(id)a3;
- (void)setWantsUniformThreadgroups:(BOOL)a3;
@end

@implementation PXGMetalRenderContext

- (MTLDevice)device
{
  return self->_device;
}

+ (id)privateContextWithDevice:(id)a3 commandQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(PXGMetalRenderContext *)[PXGPrivateMetalRenderContext alloc] initWithDevice:v6 commandQueue:v5];

  return v7;
}

- (PXGMetalRenderContext)initWithDevice:(id)a3 commandQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGMetalRenderContext;
  v9 = [(PXGMetalRenderContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_commandQueue, a4);
    v10->_wantsUniformThreadgroups = 0;
  }

  return v10;
}

- (MTLLibrary)library
{
  library = self->_library;
  if (!library)
  {
    device = self->_device;
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = 0;
    id v7 = (MTLLibrary *)[(MTLDevice *)device newDefaultLibraryWithBundle:v6 error:&v12];
    id v8 = v12;
    v9 = self->_library;
    self->_library = v7;

    if (v8)
    {
      v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXGMetalRenderContext.m", 45, @"Error creating library:%@", v8 object file lineNumber description];

      abort();
    }
    library = self->_library;
  }

  return library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureCopyRegionKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)setWantsUniformThreadgroups:(BOOL)a3
{
  self->_wantsUniformThreadgroups = a3;
}

- (BOOL)wantsUniformThreadgroups
{
  return self->_wantsUniformThreadgroups;
}

- (void)setTextureCopyRegionKernelPipelineState:(id)a3
{
}

- (MTLComputePipelineState)textureCopyRegionKernelPipelineState
{
  return self->_textureCopyRegionKernelPipelineState;
}

- (BOOL)wantsMutableSharedTextures
{
  return self->_wantsMutableSharedTextures;
}

- (BOOL)supportsSharedTextures
{
  return self->_supportsSharedTextures;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)_blitFromTexture:(id)a3 toTexture:(id)a4 mipmapped:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  id v8 = a3;
  v9 = [(PXGMetalRenderContext *)self commandQueue];
  v10 = [v9 commandBuffer];

  v11 = [v10 blitCommandEncoder];
  [v11 setLabel:@"PXGTextureUtilities Texture Blit Encoder"];
  [v11 copyFromTexture:v8 toTexture:v12];

  if (v5) {
    [v11 generateMipmapsForTexture:v12];
  }
  [v11 endEncoding];
  [v10 commit];
}

- (void)_blitFromBuffer:(id)a3 toTexture:(id)a4 inRegion:(id *)a5 bytesPerRow:(unint64_t)a6 offset:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  kdebug_trace();
  v16 = [(PXGMetalRenderContext *)self commandQueue];
  v17 = [v16 commandBuffer];

  v18 = [v17 blitCommandEncoder];
  [v18 setLabel:@"PXGMetalRenderContext Buffer Blit Encoder"];
  unint64_t var2 = a5->var1.var2;
  long long v22 = *(_OWORD *)&a5->var1.var0;
  unint64_t v23 = var2;
  long long v20 = *(_OWORD *)&a5->var0.var0;
  unint64_t v21 = a5->var0.var2;
  [v18 copyFromBuffer:v14 sourceOffset:a7 sourceBytesPerRow:a6 sourceBytesPerImage:a8 sourceSize:&v22 toTexture:v15 destinationSlice:0 destinationLevel:0 destinationOrigin:&v20];

  [v18 endEncoding];
  [v17 commit];
  kdebug_trace();
}

- (void)_createComputePipelinesIfNeeded
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_textureCopyRegionKernelPipelineState)
  {
    int v16 = 0;
    memset(v15, 0, sizeof(v15));
    BOOL v17 = [(PXGMetalRenderContext *)self wantsUniformThreadgroups];
    id v4 = objc_alloc_init(MEMORY[0x263F128B0]);
    objc_msgSend(v4, "setConstantValues:type:withRange:", v15, 29, 0, 10);
    BOOL v5 = [(PXGMetalRenderContext *)self library];
    id v14 = 0;
    id v6 = (void *)[v5 newFunctionWithName:@"copy_texture_region" constantValues:v4 error:&v14];
    id v7 = v14;

    if (v7)
    {
      id v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXGMetalRenderContext.m", 169, @"Error creating copy_texture_region function:%@", v7 object file lineNumber description];
    }
    else
    {
      id v8 = [(PXGMetalRenderContext *)self device];
      id v13 = 0;
      v9 = (MTLComputePipelineState *)[v8 newComputePipelineStateWithFunction:v6 error:&v13];
      id v10 = v13;
      textureCopyRegionKernelPipelineState = self->_textureCopyRegionKernelPipelineState;
      self->_textureCopyRegionKernelPipelineState = v9;

      if (!v10)
      {

        return;
      }
      id v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXGMetalRenderContext.m", 175, @"Error creating pipelineState:%@", v10 object file lineNumber description];
    }

    abort();
  }
}

- (void)encodeCopyKernelWithSourceTexture:(id)a3 targetTexture:(id)a4 sourceRegions:(id)a5 sourceRegionsOffset:(unint64_t)a6 targetRegionSize:(id *)a7 regionsCount:(unint64_t)a8 computeEncoder:(id)a9
{
  id v14 = a9;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  [(PXGMetalRenderContext *)self _createComputePipelinesIfNeeded];
  uint64_t v18 = [(PXGMetalRenderContext *)self textureCopyRegionKernelPipelineState];
  unint64_t v19 = [v18 threadExecutionWidth];

  long long v20 = [(PXGMetalRenderContext *)self textureCopyRegionKernelPipelineState];
  unint64_t v29 = [v20 maxTotalThreadsPerThreadgroup] / v19;

  unint64_t var0 = a7->var0;
  unint64_t var1 = a7->var1;
  LODWORD(v23) = a7->var0;
  HIDWORD(v23) = var1;
  uint64_t v38 = v23;
  v24 = [(PXGMetalRenderContext *)self textureCopyRegionKernelPipelineState];
  [v14 setComputePipelineState:v24];

  [v14 setTexture:v17 atIndex:0];
  [v14 setTexture:v16 atIndex:1];

  [v14 setBuffer:v15 offset:a6 atIndex:0];
  [v14 setBytes:&v38 length:8 atIndex:1];
  if ([(PXGMetalRenderContext *)self wantsUniformThreadgroups])
  {
    unint64_t v25 = (v19 + a7->var0 * a8 - 1) / v19;
    unint64_t v26 = v29 + a7->var1 - 1;
    int v37 = a8;
    unint64_t v27 = v26 / v29;
    [v14 setBytes:&v37 length:4 atIndex:2];
    unint64_t v34 = v25;
    unint64_t v35 = v27;
    uint64_t v36 = 1;
    unint64_t v31 = v19;
    unint64_t v32 = v29;
    uint64_t v33 = 1;
    [v14 dispatchThreadgroups:&v34 threadsPerThreadgroup:&v31];
  }
  else
  {
    unint64_t v34 = var0 * a8;
    unint64_t v35 = var1;
    uint64_t v36 = 1;
    unint64_t v31 = v19;
    unint64_t v32 = v29;
    uint64_t v33 = 1;
    [v14 dispatchThreads:&v34 threadsPerThreadgroup:&v31];
  }
  [v14 endEncoding];
}

- (void)blitBuffer:(id)a3 toTexture:(id)a4 count:(unint64_t)a5 blitEncoder:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  kdebug_trace();
  unint64_t v12 = [v11 width];
  if (v12 >= a5) {
    unint64_t v13 = a5;
  }
  else {
    unint64_t v13 = v12;
  }
  v14[2] = 1;
  memset(v15, 0, sizeof(v15));
  v14[0] = v13;
  v14[1] = (a5 + v12 - 1) / v12;
  [v10 copyFromBuffer:v9 sourceOffset:0 sourceBytesPerRow:4 * (int)v13 sourceBytesPerImage:0 sourceSize:v14 toTexture:v11 destinationSlice:0 destinationLevel:0 destinationOrigin:v15];

  [v10 endEncoding];
  kdebug_trace();
}

- (void)blitTexture:(id)a3 toTexture:(id)a4 blitEncoder:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  id v8 = a4;
  [v9 width];
  [v9 height];
  kdebug_trace();
  [v7 copyFromTexture:v9 toTexture:v8];

  [v7 endEncoding];
  kdebug_trace();
}

- (id)newMipmappedTextureFromTexture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pixelFormat];
  uint64_t v6 = [v4 width];
  uint64_t v7 = [v4 height];
  id v8 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v5 width:v6 height:v7 mipmapped:1];
  [v8 setUsage:1];
  id v9 = [(PXGMetalRenderContext *)self newTextureWithDescriptor:v8];
  -[PXGMetalRenderContext _blitFromTexture:toTexture:mipmapped:](self, "_blitFromTexture:toTexture:mipmapped:", v4, v9, (unint64_t)[v9 mipmapLevelCount] > 1);

  return v9;
}

- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v10 = a4;
  id v11 = [MEMORY[0x263F08690] currentHandler];
  unint64_t v12 = (objc_class *)objc_opt_class();
  unint64_t v13 = NSStringFromClass(v12);
  [v11 handleFailureInMethod:a2, self, @"PXGMetalRenderContext.m", 80, @"Method %s is a responsibility of subclass %@", "-[PXGMetalRenderContext fastCopyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:]", v13 object file lineNumber description];

  abort();
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v10 = a4;
  id v11 = [MEMORY[0x263F08690] currentHandler];
  unint64_t v12 = (objc_class *)objc_opt_class();
  unint64_t v13 = NSStringFromClass(v12);
  [v11 handleFailureInMethod:a2, self, @"PXGMetalRenderContext.m", 76, @"Method %s is a responsibility of subclass %@", "-[PXGMetalRenderContext copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:]", v13 object file lineNumber description];

  abort();
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXGMetalRenderContext.m", 72, @"Method %s is a responsibility of subclass %@", "-[PXGMetalRenderContext newTextureWithDescriptor:]", v8 object file lineNumber description];

  abort();
}

+ (BOOL)deviceSupportsSharedTextures
{
  return 1;
}

+ (id)sharedContextWithDevice:(id)a3 commandQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(PXGMetalRenderContext *)[PXGSharedMetalRenderContext alloc] initWithDevice:v6 commandQueue:v5];

  return v7;
}

+ (id)privateContextWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[PXGPrivateMetalRenderContext alloc] initWithDevice:v3];

  return v4;
}

@end