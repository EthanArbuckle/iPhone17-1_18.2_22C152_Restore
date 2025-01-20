@interface MTLToolsIntersectionFunctionTable
- (MTLBuffer)globalBuffer;
- (MTLResourceID)gpuResourceID;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)globalBufferOffset;
- (unint64_t)gpuHandle;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setGlobalBuffer:(id)a3;
- (void)setGlobalBufferOffset:(unint64_t)a3;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
@end

@implementation MTLToolsIntersectionFunctionTable

- (unint64_t)resourceIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceIndex];
}

- (unint64_t)uniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 uniqueIdentifier];
}

- (unint64_t)gpuHandle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuHandle];
}

- (MTLResourceID)gpuResourceID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLResourceID)[v2 gpuResourceID];
}

- (MTLBuffer)globalBuffer
{
  return self->_globalBuffer;
}

- (void)setGlobalBuffer:(id)a3
{
  self->_globalBuffer = (MTLBuffer *)a3;
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 setGlobalBuffer:v6];
}

- (unint64_t)globalBufferOffset
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 globalBufferOffset];
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setGlobalBufferOffset:a3];
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setBuffer:v9 offset:a4 atIndex:a5];
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

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setFunction:v7 atIndex:a4];
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto17MTLFunctionHandle}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setFunctions:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setOpaqueTriangleIntersectionFunctionWithSignature:a3 atIndex:a4];
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v7, "setOpaqueTriangleIntersectionFunctionWithSignature:withRange:", a3, location, length);
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setOpaqueCurveIntersectionFunctionWithSignature:a3 atIndex:a4];
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v7, "setOpaqueCurveIntersectionFunctionWithSignature:withRange:", a3, location, length);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsIntersectionFunctionTable;
  [(MTLToolsResource *)&v3 dealloc];
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setVisibleFunctionTable:v7 atBufferIndex:a4];
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 bufferAddressAtIndex:a3];
}

@end