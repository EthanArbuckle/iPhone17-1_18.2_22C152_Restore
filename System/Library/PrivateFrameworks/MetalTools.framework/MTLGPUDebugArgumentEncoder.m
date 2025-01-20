@interface MTLGPUDebugArgumentEncoder
- (MTLGPUDebugArgumentEncoder)initWithArgumentEncoder:(id)a3 layout:(const void *)a4 device:(id)a5;
- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3;
- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4;
- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4;
- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4;
@end

@implementation MTLGPUDebugArgumentEncoder

- (MTLGPUDebugArgumentEncoder)initWithArgumentEncoder:(id)a3 layout:(const void *)a4 device:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugArgumentEncoder;
  result = [(MTLToolsObject *)&v7 initWithBaseObject:a3 parent:a5];
  if (result) {
    result->_layout = a4;
  }
  return result;
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  baseObject = self->super.super._baseObject;
  uint64_t v7 = [a3 baseObject];
  unint64_t v8 = [a3 offset] + a4;

  [(MTLToolsObject *)baseObject setArgumentBuffer:v7 offset:v8];
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  baseObject = self->super.super._baseObject;
  uint64_t v9 = [a3 baseObject];
  unint64_t v10 = [a3 offset] + a4;

  [(MTLToolsObject *)baseObject setArgumentBuffer:v9 startOffset:v10 arrayElement:a5];
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7 = [a3 handleForOffset:a4];
  *(void *)[(MTLToolsObject *)self->super.super._baseObject constantDataAtIndex:a5] = v7;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      [(MTLGPUDebugArgumentEncoder *)self setBuffer:a3[v10] offset:a4[v10] atIndex:v10 + location];
      uint64_t v10 = v11;
    }
    while (length > v11++);
  }
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = [a3 handleForOffset:0];
  *(void *)[(MTLToolsObject *)self->super.super._baseObject constantDataAtIndex:a4] = v6;
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  baseObject = self->super.super._baseObject;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "baseObject");

  [(MTLToolsObject *)baseObject setBuffer:v6 offset:0 atIndex:a4];
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      [(MTLGPUDebugArgumentEncoder *)self setRenderPipelineState:a3[v8] atIndex:v8 + location];
      uint64_t v8 = v9;
    }
    while (length > v9++);
  }
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  baseObject = self->super.super._baseObject;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "baseObject");

  [(MTLToolsObject *)baseObject setBuffer:v6 offset:0 atIndex:a4];
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      [(MTLGPUDebugArgumentEncoder *)self setComputePipelineState:a3[v8] atIndex:v8 + location];
      uint64_t v8 = v9;
    }
    while (length > v9++);
  }
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  baseObject = self->super.super._baseObject;
  uint64_t v6 = [a3 internalICBBuffer];

  [(MTLToolsObject *)baseObject setBuffer:v6 offset:0 atIndex:a4];
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      [(MTLGPUDebugArgumentEncoder *)self setIndirectCommandBuffer:a3[v8] atIndex:v8 + location];
      uint64_t v8 = v9;
    }
    while (length > v9++);
  }
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  layout = (GPUDebugArgumentEncoderLayout *)self->_layout;
  if (!layout) {
    return 0;
  }
  v5 = GPUDebugArgumentEncoderLayout::sublayout(layout, a3);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self->super.super._device, "baseObject"), "newArgumentEncoderWithLayout:", *v5);
  uint64_t v8 = [[MTLGPUDebugArgumentEncoder alloc] initWithArgumentEncoder:v7 layout:v6 device:self->super.super._device];

  return v8;
}

@end