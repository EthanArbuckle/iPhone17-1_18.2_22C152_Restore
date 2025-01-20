@interface MTLToolsArgumentEncoder
- (MTLDevice)device;
- (NSString)label;
- (_MTLIndirectArgumentBufferLayout)layout;
- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3;
- (unint64_t)alignment;
- (unint64_t)encodedLength;
- (void)constantDataAtIndex:(unint64_t)a3;
- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4;
- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)setLabel:(id)a3;
- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
@end

@implementation MTLToolsArgumentEncoder

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (unint64_t)encodedLength
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 encodedLength];
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (void *)[v4 constantDataAtIndex:a3];
}

- (unint64_t)alignment
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 alignment];
}

- (MTLDevice)device
{
  do
    self = (MTLToolsArgumentEncoder *)self->super._parent;
  while (![(MTLToolsArgumentEncoder *)self conformsToProtocol:&unk_26EF95E08]);
  return (MTLDevice *)self;
}

- (_MTLIndirectArgumentBufferLayout)layout
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (_MTLIndirectArgumentBufferLayout *)[v2 layout];
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setArgumentBuffer:v7 offset:a4];
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setArgumentBuffer:v9 startOffset:a4 arrayElement:a5];
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setBuffer:v9 offset:a4 atIndex:a5];
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setTexture:v7 atIndex:a4];
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setSamplerState:v7 atIndex:a4];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  std::vector<objc_object  {objcproto9MTLBuffer}*>::vector(__p, a5.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v11 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v11;
    }
  }
  id v12 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v12, "setBuffers:offsets:withRange:", __p[0], a4, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto10MTLTexture}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setTextures:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto15MTLSamplerState}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setSamplerStates:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setRenderPipelineState:v7 atIndex:a4];
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLToolsArgumentEncoder *)self setRenderPipelineState:v8 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setComputePipelineState:v7 atIndex:a4];
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLToolsArgumentEncoder *)self setComputePipelineState:v8 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setIndirectCommandBuffer:v7 atIndex:a4];
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLToolsArgumentEncoder *)self setIndirectCommandBuffer:v8 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderForBufferAtIndex:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setAccelerationStructure:v7 atIndex:a4];
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setVisibleFunctionTable:v7 atBufferIndex:a4];
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
      [(MTLToolsArgumentEncoder *)self setVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setIntersectionFunctionTable:v7 atBufferIndex:a4];
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLToolsArgumentEncoder *)self setIntersectionFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setVisibleFunctionTable:v7 atIndex:a4];
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLToolsArgumentEncoder *)self setVisibleFunctionTable:v8 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setIntersectionFunctionTable:v7 atIndex:a4];
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLToolsArgumentEncoder *)self setIntersectionFunctionTable:v8 atIndex:location++];
      --length;
    }
    while (length);
  }
}

@end