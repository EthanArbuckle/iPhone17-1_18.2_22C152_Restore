@interface MTLGPUDebugIntersectionFunctionTable
- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5;
- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5 computePipelineState:(id)a6;
- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5 renderPipelineState:(id)a6 stage:(unint64_t)a7;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)gpuAddress;
- (unint64_t)handleForOffset:(unint64_t)a3;
- (unint64_t)length;
- (void)_initHandleBuffer;
- (void)_setupIdentifier;
- (void)dealloc;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4;
- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
@end

@implementation MTLGPUDebugIntersectionFunctionTable

- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  v6 = [(MTLToolsResource *)&v8 initWithBaseObject:a3 parent:a4];
  if (v6)
  {
    v6->_functionCount = [a5 functionCount];
    v6->_handleBuffer = (MTLBuffer *)objc_msgSend(-[MTLToolsObject baseObject](v6->super.super.super._device, "baseObject"), "newBufferWithLength:options:", 248, 0);
    [(MTLGPUDebugIntersectionFunctionTable *)v6 _setupIdentifier];
    [(MTLGPUDebugIntersectionFunctionTable *)v6 _initHandleBuffer];
  }
  return v6;
}

- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5 computePipelineState:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  objc_super v8 = [(MTLToolsResource *)&v10 initWithBaseObject:a3 parent:a4];
  if (v8)
  {
    v8->_functionCount = [a5 functionCount];
    v8->_computePipelineState = (MTLGPUDebugComputePipelineState *)a6;
    v8->_handleBuffer = (MTLBuffer *)objc_msgSend(-[MTLToolsObject baseObject](v8->super.super.super._device, "baseObject"), "newBufferWithLength:options:", 248, 0);
    [(MTLGPUDebugIntersectionFunctionTable *)v8 _setupIdentifier];
    [(MTLGPUDebugIntersectionFunctionTable *)v8 _initHandleBuffer];
  }
  return v8;
}

- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5 renderPipelineState:(id)a6 stage:(unint64_t)a7
{
  v12.receiver = self;
  v12.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  objc_super v10 = [(MTLToolsResource *)&v12 initWithBaseObject:a3 parent:a4];
  if (v10)
  {
    v10->_functionCount = [a5 functionCount];
    v10->_renderPipelineState = (MTLGPUDebugRenderPipelineState *)a6;
    v10->_handleBuffer = (MTLBuffer *)objc_msgSend(-[MTLToolsObject baseObject](v10->super.super.super._device, "baseObject"), "newBufferWithLength:options:", 248, 0);
    v10->_stage = a7;
    [(MTLGPUDebugIntersectionFunctionTable *)v10 _setupIdentifier];
    [(MTLGPUDebugIntersectionFunctionTable *)v10 _initHandleBuffer];
  }
  return v10;
}

- (void)_initHandleBuffer
{
  uint64_t v3 = 0;
  for (uint64_t i = 0; i != 31; ++i)
  {
    *(void *)([(MTLBuffer *)self->_handleBuffer contents] + 8 * i) = 0;
    [(MTLToolsObject *)self->super.super.super._baseObject setBuffer:self->_handleBuffer offset:v3 atIndex:i];
    v3 += 8;
  }
}

- (void)_setupIdentifier
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  [v3 setDataType:116];
  [v3 setIndex:0];
  id v4 = [(MTLToolsObject *)self->super.super.super._device originalObject];
  v7[0] = v3;
  v5 = objc_msgSend(v4, "newArgumentEncoderWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 1));

  v6 = objc_msgSend(-[MTLToolsObject originalObject](self->super.super.super._device, "originalObject"), "newBufferWithLength:options:", 8, 0);
  [v5 setArgumentBuffer:v6 offset:0];
  objc_msgSend(v5, "setIntersectionFunctionTable:atIndex:", -[MTLToolsObject originalObject](self, "originalObject"), 0);

  self->_gpuIdentifier = *(void *)[v6 contents];
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->super.super.super._baseObject);
  handleBuffer = self->_handleBuffer;

  [a3 useResourceInternal:handleBuffer usage:a4];
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  unint64_t var1 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->super.super.super._baseObject);
  handleBuffer = self->_handleBuffer;

  objc_msgSend(a3, "useResourceInternal:usage:stages:", handleBuffer, a4, var1, v5);
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v6 = [a3 baseObject];
    [(MTLToolsObject *)baseObject setFunction:v6 atIndex:a4];
  }
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugIntersectionFunctionTable *)self setFunction:v8 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return *(void *)([(MTLBuffer *)self->_handleBuffer contents] + 8 * a3);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7 = [a3 handleForOffset:a4];
  *(void *)([(MTLBuffer *)self->_handleBuffer contents] + 8 * a5) = v7;
  baseObject = self->super.super.super._baseObject;
  handleBuffer = self->_handleBuffer;

  [(MTLToolsObject *)baseObject setBuffer:handleBuffer offset:8 * a5 atIndex:a5];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    for (uint64_t i = 0; i != length; ++i)
      [(MTLGPUDebugIntersectionFunctionTable *)self setBuffer:a3[i] offset:a4[i] atIndex:i];
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  uint64_t v6 = [a3 gpuResourceID];
  *(void *)([(MTLBuffer *)self->_handleBuffer contents] + 8 * a4) = v6;
  baseObject = self->super.super.super._baseObject;
  handleBuffer = self->_handleBuffer;

  [(MTLToolsObject *)baseObject setBuffer:handleBuffer offset:8 * a4 atIndex:a4];
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugIntersectionFunctionTable *)self setVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return self->_gpuIdentifier;
}

- (unint64_t)gpuAddress
{
  return self->_gpuIdentifier;
}

- (unint64_t)length
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  [(MTLToolsIntersectionFunctionTable *)&v3 dealloc];
}

@end