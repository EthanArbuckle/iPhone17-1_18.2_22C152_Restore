@interface MTLDebugArgumentEncoder
- (MTLDebugArgumentEncoder)initWithBaseObject:(id)a3 structType:(id)a4 parent:(id)a5;
- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3;
- (void)constantDataAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 elementIndex:(unint64_t)a5;
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

@implementation MTLDebugArgumentEncoder

- (MTLDebugArgumentEncoder)initWithBaseObject:(id)a3 structType:(id)a4 parent:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugArgumentEncoder;
  result = [(MTLToolsObject *)&v7 initWithBaseObject:a3 parent:a5];
  if (a4)
  {
    if (result) {
      operator new();
    }
  }
  return result;
}

- (void)dealloc
{
  reflectionParser = self->_reflectionParser;
  if (reflectionParser)
  {
    v5 = (void **)self->_reflectionParser;
    std::vector<MemberRef>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x23ECD5400](reflectionParser, 0x20C40960023A9);
    self->_reflectionParser = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugArgumentEncoder;
  [(MTLToolsObject *)&v4 dealloc];
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 elementIndex:(unint64_t)a5
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  unint64_t v9 = a4;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    uint64_t v10 = [a3 storageMode];
    id v11 = [(MTLToolsObject *)self baseObject];
    if (v10)
    {
      uint64_t v17 = MTLStorageModeString();
      _MTLMessageContextPush_();
    }
    unint64_t v9 = a4;
    if (a5 != -1) {
      unint64_t v9 = a4 + objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodedLength") * a5;
    }
    unint64_t v12 = objc_msgSend(v11, "encodedLength", v17) + v9;
    if (v12 > [a3 length])
    {
      uint64_t v16 = [v11 encodedLength];
      uint64_t v21 = [a3 length];
      _MTLMessageContextPush_();
      objc_msgSend(a3, "setIsContentExposedToCPU:", 1, v9, v16, v21);
    }
    else
    {
      objc_msgSend(a3, "setIsContentExposedToCPU:", 1, v18, v19, v20);
    }
  }
  _MTLMessageContextEnd();
  v13 = (void *)[a3 baseObject];
  id v14 = [(MTLToolsObject *)self baseObject];
  if (a5 == -1) {
    [v14 setArgumentBuffer:v13 offset:v9];
  }
  else {
    [v14 setArgumentBuffer:v13 startOffset:a4 arrayElement:a5];
  }
  self->_currentOffset = v9;
  currentBuffer = self->_currentBuffer;
  if (currentBuffer != a3)
  {

    self->_currentBuffer = (MTLBuffer *)v13;
  }
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  memset(&v11, 0, sizeof(v11));
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer)
  {
    _MTLMessageContextPush_();
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    if (a4) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    _MTLMessageContextPush_();
    goto LABEL_11;
  }
  unint64_t v9 = (MTLDevice *)[a3 device];
  if (v9 != [(MTLToolsArgumentEncoder *)self device]) {
    _MTLMessageContextPush_();
  }
  if ([a3 length] <= a4)
  {
    [a3 length];
    goto LABEL_8;
  }
LABEL_11:
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a5, 3, &v11);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  _NSRange v22 = a5;
  memset(&v21, 0, sizeof(v21));
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v22.location, 3, &v21);
  }
  std::vector<objc_object  {objcproto9MTLBuffer}*>::vector(__p, length);
  if (length)
  {
    unint64_t v11 = 0;
    while (!a3[v11])
    {
      uint64_t v15 = a4[v11];
      if (v15)
      {
        unint64_t v14 = v11;
LABEL_15:
        unint64_t v18 = v14;
        uint64_t v19 = v15;
        _MTLMessageContextPush_();
      }
LABEL_17:
      uint64_t v16 = objc_msgSend((id)a3[v11], "baseObject", v18, v19);
      *((void *)__p[0] + v11++) = v16;
      if (length == v11) {
        goto LABEL_18;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v18 = v11;
      _MTLMessageContextPush_();
      goto LABEL_17;
    }
    unint64_t v12 = (MTLDevice *)[(id)a3[v11] device];
    if (v12 != [(MTLToolsArgumentEncoder *)self device])
    {
      unint64_t v18 = v11;
      _MTLMessageContextPush_();
    }
    unint64_t v13 = a4[v11];
    if (v13 < objc_msgSend((id)a3[v11], "length", v18)) {
      goto LABEL_17;
    }
    unint64_t v14 = a4[v11];
    uint64_t v15 = [(id)a3[v11] length];
    goto LABEL_15;
  }
LABEL_18:
  _MTLMessageContextEnd();
  id v17 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v17, "setBuffers:offsets:withRange:", __p[0], a4, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 1, &v8);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange v14 = a4;
  memset(&v13, 0, sizeof(v13));
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v14.location, 1, &v13);
  }
  _MTLMessageContextEnd();
  std::vector<objc_object  {objcproto10MTLTexture}*>::vector(__p, length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v10 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v10;
    }
  }
  id v11 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v11, "setTextures:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 2, &v8);
  }
  if (a3 && (objc_msgSend((id)objc_msgSend(a3, "descriptor"), "supportArgumentBuffers") & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange v15 = a4;
  memset(&v14, 0, sizeof(v14));
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v15.location, 2, &v14);
  }
  std::vector<objc_object  {objcproto15MTLSamplerState}*>::vector(__p, length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v10 = (void *)a3[i];
      if (v10 && (objc_msgSend((id)objc_msgSend(v10, "descriptor"), "supportArgumentBuffers") & 1) == 0) {
        _MTLMessageContextPush_();
      }
      uint64_t v11 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v11;
    }
  }
  _MTLMessageContextEnd();
  id v12 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v12, "setSamplerStates:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a3, 0, &v7);
  }
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "constantDataAtIndex:", a3);
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 5, &v10);
  }
  if (a3)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0) {
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
    id v8 = [(MTLToolsObject *)self baseObject];
    uint64_t v9 = [a3 baseObject];
  }
  else
  {
    _MTLMessageContextEnd();
    id v8 = [(MTLToolsObject *)self baseObject];
    uint64_t v9 = 0;
  }
  [v8 setRenderPipelineState:v9 atIndex:a4];
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v13, 5, &v12);
  }
  if (length)
  {
    NSUInteger v9 = length;
    _MTLMessageContext v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      if (*a3)
      {
        uint64_t v11 = (void *)[(id)*a3 baseObject];
        *_MTLMessageContext v10 = v11;
        if (([v11 supportIndirectCommandBuffers] & 1) == 0) {
          _MTLMessageContextPush_();
        }
      }
      else
      {
        *_MTLMessageContext v10 = 0;
      }
      ++v10;
      ++a3;
      --v9;
    }
    while (v9);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineStates:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 6, &v10);
  }
  if (a3)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0) {
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
    id v8 = [(MTLToolsObject *)self baseObject];
    uint64_t v9 = [a3 baseObject];
  }
  else
  {
    _MTLMessageContextEnd();
    id v8 = [(MTLToolsObject *)self baseObject];
    uint64_t v9 = 0;
  }
  [v8 setComputePipelineState:v9 atIndex:a4];
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v13, 6, &v12);
  }
  if (length)
  {
    NSUInteger v9 = length;
    _MTLMessageContext v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      if (*a3)
      {
        uint64_t v11 = (void *)[(id)*a3 baseObject];
        *_MTLMessageContext v10 = v11;
        if (([v11 supportIndirectCommandBuffers] & 1) == 0) {
          _MTLMessageContextPush_();
        }
      }
      else
      {
        *_MTLMessageContext v10 = 0;
      }
      ++v10;
      ++a3;
      --v9;
    }
    while (v9);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineStates:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  StructType::indexIsValueType((StructType *)self->_reflectionParser, a4, 7, &v9);
  _MTLMessageContextEnd();
  id v7 = [(MTLToolsObject *)self baseObject];
  if (a3) {
    uint64_t v8 = [a3 baseObject];
  }
  else {
    uint64_t v8 = 0;
  }
  [v7 setIndirectCommandBuffer:v8 atIndex:a4];
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v13, 7, &v12);
  }
  _MTLMessageContextEnd();
  if (length)
  {
    NSUInteger v9 = length;
    _MTLMessageContext v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v11 = (void *)*a3;
      if (*a3) {
        uint64_t v11 = (void *)[v11 baseObject];
      }
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIndirectCommandBuffers:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  memset(&v12, 0, sizeof(v12));
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser)
  {
    MemberAtIndex = StructType::findMemberAtIndex(reflectionParser, a3, 0, &v12);
    id v7 = MemberAtIndex;
    if (!v12.var0 && !*((void *)MemberAtIndex + 3)) {
      _MTLMessageContextPush_();
    }
  }
  else
  {
    id v7 = 0;
  }
  _MTLMessageContextEnd();
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderForBufferAtIndex:", a3);
  if (!v8) {
    return 0;
  }
  NSUInteger v9 = (void *)v8;
  if (v7) {
    id v7 = (_DWORD *)*((void *)v7 + 3);
  }
  _MTLMessageContext v10 = [[MTLDebugArgumentEncoder alloc] initWithBaseObject:v8 structType:v7 parent:self];

  return v10;
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  checkAccelerationStructure((uint64_t)self->super.super._device, a3, 1, @"Acceleration structure");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setAccelerationStructure:v8 atIndex:a4];
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 8, &v8);
  }
  _MTLMessageContextEnd();
  if (a3) {
    a3 = (id)[a3 baseObject];
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v13, 8, &v12);
  }
  _MTLMessageContextEnd();
  if (length)
  {
    NSUInteger v9 = length;
    _MTLMessageContext v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v11 = (void *)*a3;
      if (*a3) {
        uint64_t v11 = (void *)[v11 baseObject];
      }
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTables:withBufferRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 9, &v8);
  }
  _MTLMessageContextEnd();
  if (a3) {
    a3 = (id)[a3 baseObject];
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v13, 9, &v12);
  }
  _MTLMessageContextEnd();
  if (length)
  {
    NSUInteger v9 = length;
    _MTLMessageContext v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v11 = (void *)*a3;
      if (*a3) {
        uint64_t v11 = (void *)[v11 baseObject];
      }
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTables:withBufferRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 8, &v8);
  }
  _MTLMessageContextEnd();
  if (a3) {
    a3 = (id)[a3 baseObject];
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atIndex:", a3, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v13, 8, &v12);
  }
  _MTLMessageContextEnd();
  if (length)
  {
    NSUInteger v9 = length;
    _MTLMessageContext v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v11 = (void *)*a3;
      if (*a3) {
        uint64_t v11 = (void *)[v11 baseObject];
      }
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTables:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexIsValueType(reflectionParser, a4, 9, &v8);
  }
  _MTLMessageContextEnd();
  if (a3) {
    a3 = (id)[a3 baseObject];
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atIndex:", a3, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsArgumentEncoder *)self device];
  _MTLMessageContextBegin_();
  if (!self->_currentBuffer) {
    _MTLMessageContextPush_();
  }
  reflectionParser = (StructType *)self->_reflectionParser;
  if (reflectionParser) {
    StructType::indexRangeIsValueType(reflectionParser, &v13, 9, &v12);
  }
  _MTLMessageContextEnd();
  if (length)
  {
    NSUInteger v9 = length;
    _MTLMessageContext v10 = (int64_t *)((char *)&v12.var0 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v11 = (void *)*a3;
      if (*a3) {
        uint64_t v11 = (void *)[v11 baseObject];
      }
      *v10++ = v11;
      ++a3;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTables:withRange:", (char *)&v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
}

@end