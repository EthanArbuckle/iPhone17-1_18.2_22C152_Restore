@interface TSDMetalContext
- ($1AB5FA073B851C12C2339EC22442E995)timingInfo;
- (CGColorSpace)destinationColorSpace;
- (CGSize)layerSize;
- (MTLCommandBuffer)commandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)renderEncoder;
- (MTLRenderPassDescriptor)passDescriptor;
- (NSMutableSet)retainedObjects;
- (TSDMetalShader)shader;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)currentBuffer;
- (unint64_t)pixelFormat;
- (void)retainObject:(id)a3;
- (void)setCommandBuffer:(id)a3;
- (void)setCommandQueue:(id)a3;
- (void)setCurrentBuffer:(unint64_t)a3;
- (void)setDestinationColorSpace:(CGColorSpace *)a3;
- (void)setDevice:(id)a3;
- (void)setLayerSize:(CGSize)a3;
- (void)setPassDescriptor:(id)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setRenderEncoder:(id)a3;
- (void)setRetainedObjects:(id)a3;
- (void)setShader:(id)a3;
- (void)setTimingInfo:(id)a3;
@end

@implementation TSDMetalContext

- (void)setCommandBuffer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandBuffer);

  if (WeakRetained != obj)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    retainedObjects = self->_retainedObjects;
    self->_retainedObjects = v5;
  }
  objc_storeWeak((id *)&self->_commandBuffer, obj);
}

- (void)retainObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (!retainedObjects) {
      goto LABEL_5;
    }
    if ([(NSMutableSet *)retainedObjects count])
    {
LABEL_7:
      [(NSMutableSet *)self->_retainedObjects addObject:v4];
      goto LABEL_8;
    }
    if (!self->_retainedObjects)
    {
LABEL_5:
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      v7 = self->_retainedObjects;
      self->_retainedObjects = v6;
    }
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__14;
    v13[4] = __Block_byref_object_dispose__14;
    v8 = self;
    v14 = v8;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__14;
    v11[4] = __Block_byref_object_dispose__14;
    v12 = self->_retainedObjects;
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_commandBuffer);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__TSDMetalContext_retainObject___block_invoke;
    v10[3] = &unk_2646B1D48;
    v10[4] = v11;
    v10[5] = v13;
    [WeakRetained addCompletedHandler:v10];

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(v13, 8);

    goto LABEL_7;
  }
LABEL_8:
}

void __32__TSDMetalContext_retainObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(TSDMetalContext);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  [(TSDMetalContext *)v4 setDevice:WeakRetained];

  [(TSDMetalContext *)v4 setPixelFormat:self->_pixelFormat];
  -[TSDMetalContext setLayerSize:](v4, "setLayerSize:", self->_layerSize.width, self->_layerSize.height);
  [(TSDMetalContext *)v4 setCurrentBuffer:self->_currentBuffer];
  -[TSDMetalContext setTimingInfo:](v4, "setTimingInfo:", self->_timingInfo.currentTime, self->_timingInfo.displayLinkPresentationTime, self->_timingInfo.elapsedShowTime);
  id v6 = objc_loadWeakRetained((id *)&self->_commandQueue);
  [(TSDMetalContext *)v4 setCommandQueue:v6];

  id v7 = objc_loadWeakRetained((id *)&self->_commandBuffer);
  [(TSDMetalContext *)v4 setCommandBuffer:v7];

  id v8 = objc_loadWeakRetained((id *)&self->_passDescriptor);
  [(TSDMetalContext *)v4 setPassDescriptor:v8];

  id v9 = objc_loadWeakRetained((id *)&self->_shader);
  [(TSDMetalContext *)v4 setShader:v9];

  id v10 = objc_loadWeakRetained((id *)&self->_renderEncoder);
  [(TSDMetalContext *)v4 setRenderEncoder:v10];

  [(TSDMetalContext *)v4 setDestinationColorSpace:self->_destinationColorSpace];
  [(TSDMetalContext *)v4 setRetainedObjects:self->_retainedObjects];
  return v4;
}

- (MTLDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (MTLDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)layerSize
{
  double width = self->_layerSize.width;
  double height = self->_layerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLayerSize:(CGSize)a3
{
  self->_layerSize = a3;
}

- (unint64_t)currentBuffer
{
  return self->_currentBuffer;
}

- (void)setCurrentBuffer:(unint64_t)a3
{
  self->_currentBuffer = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)timingInfo
{
  double currentTime = self->_timingInfo.currentTime;
  double displayLinkPresentationTime = self->_timingInfo.displayLinkPresentationTime;
  double elapsedShowTime = self->_timingInfo.elapsedShowTime;
  result.var2 = elapsedShowTime;
  result.var1 = displayLinkPresentationTime;
  result.var0 = currentTime;
  return result;
}

- (void)setTimingInfo:(id)a3
{
  self->_timingInfo = ($54BC86A77F2B8FADC239F82CFC84E8FD)a3;
}

- (MTLCommandQueue)commandQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandQueue);

  return (MTLCommandQueue *)WeakRetained;
}

- (void)setCommandQueue:(id)a3
{
}

- (MTLCommandBuffer)commandBuffer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandBuffer);

  return (MTLCommandBuffer *)WeakRetained;
}

- (MTLRenderPassDescriptor)passDescriptor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passDescriptor);

  return (MTLRenderPassDescriptor *)WeakRetained;
}

- (void)setPassDescriptor:(id)a3
{
}

- (TSDMetalShader)shader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shader);

  return (TSDMetalShader *)WeakRetained;
}

- (void)setShader:(id)a3
{
}

- (MTLRenderCommandEncoder)renderEncoder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderEncoder);

  return (MTLRenderCommandEncoder *)WeakRetained;
}

- (void)setRenderEncoder:(id)a3
{
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (void)setDestinationColorSpace:(CGColorSpace *)a3
{
  self->_destinationColorSpace = a3;
}

- (NSMutableSet)retainedObjects
{
  return self->_retainedObjects;
}

- (void)setRetainedObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_destroyWeak((id *)&self->_renderEncoder);
  objc_destroyWeak((id *)&self->_shader);
  objc_destroyWeak((id *)&self->_passDescriptor);
  objc_destroyWeak((id *)&self->_commandBuffer);
  objc_destroyWeak((id *)&self->_commandQueue);

  objc_destroyWeak((id *)&self->_device);
}

@end