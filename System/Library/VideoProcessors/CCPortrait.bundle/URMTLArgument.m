@interface URMTLArgument
- (BOOL)isDepthTexture;
- (MTLPointerType)bufferPointerType;
- (MTLStructType)bufferStructType;
- (NSString)name;
- (URMTLArgument)init;
- (unint64_t)access;
- (unint64_t)arrayLength;
- (unint64_t)bufferAlignment;
- (unint64_t)bufferDataSize;
- (unint64_t)bufferDataType;
- (unint64_t)index;
- (unint64_t)textureDataType;
- (unint64_t)textureType;
- (unint64_t)threadgroupMemoryAlignment;
- (unint64_t)threadgroupMemoryDataSize;
- (unint64_t)type;
- (void)setAccess:(unint64_t)a3;
- (void)setArrayLength:(unint64_t)a3;
- (void)setBufferAlignment:(unint64_t)a3;
- (void)setBufferDataSize:(unint64_t)a3;
- (void)setBufferDataType:(unint64_t)a3;
- (void)setBufferPointerType:(id)a3;
- (void)setBufferStructType:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setIsDepthTexture:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTextureDataType:(unint64_t)a3;
- (void)setTextureType:(unint64_t)a3;
- (void)setThreadgroupMemoryAlignment:(unint64_t)a3;
- (void)setThreadgroupMemoryDataSize:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation URMTLArgument

- (URMTLArgument)init
{
  v3.receiver = self;
  v3.super_class = (Class)URMTLArgument;
  return [(URMTLArgument *)&v3 init];
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)type
{
  return self->type;
}

- (void)setType:(unint64_t)a3
{
  self->type = a3;
}

- (unint64_t)access
{
  return self->access;
}

- (void)setAccess:(unint64_t)a3
{
  self->access = a3;
}

- (unint64_t)index
{
  return self->index;
}

- (void)setIndex:(unint64_t)a3
{
  self->index = a3;
}

- (unint64_t)bufferAlignment
{
  return self->bufferAlignment;
}

- (void)setBufferAlignment:(unint64_t)a3
{
  self->bufferAlignment = a3;
}

- (unint64_t)bufferDataSize
{
  return self->bufferDataSize;
}

- (void)setBufferDataSize:(unint64_t)a3
{
  self->bufferDataSize = a3;
}

- (unint64_t)bufferDataType
{
  return self->bufferDataType;
}

- (void)setBufferDataType:(unint64_t)a3
{
  self->bufferDataType = a3;
}

- (MTLStructType)bufferStructType
{
  return self->bufferStructType;
}

- (void)setBufferStructType:(id)a3
{
}

- (MTLPointerType)bufferPointerType
{
  return self->bufferPointerType;
}

- (void)setBufferPointerType:(id)a3
{
}

- (unint64_t)threadgroupMemoryAlignment
{
  return self->threadgroupMemoryAlignment;
}

- (void)setThreadgroupMemoryAlignment:(unint64_t)a3
{
  self->threadgroupMemoryAlignment = a3;
}

- (unint64_t)threadgroupMemoryDataSize
{
  return self->threadgroupMemoryDataSize;
}

- (void)setThreadgroupMemoryDataSize:(unint64_t)a3
{
  self->threadgroupMemoryDataSize = a3;
}

- (unint64_t)textureType
{
  return self->textureType;
}

- (void)setTextureType:(unint64_t)a3
{
  self->textureType = a3;
}

- (unint64_t)textureDataType
{
  return self->textureDataType;
}

- (void)setTextureDataType:(unint64_t)a3
{
  self->textureDataType = a3;
}

- (BOOL)isDepthTexture
{
  return self->isDepthTexture;
}

- (void)setIsDepthTexture:(BOOL)a3
{
  self->isDepthTexture = a3;
}

- (unint64_t)arrayLength
{
  return self->arrayLength;
}

- (void)setArrayLength:(unint64_t)a3
{
  self->arrayLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bufferPointerType, 0);
  objc_storeStrong((id *)&self->bufferStructType, 0);

  objc_storeStrong((id *)&self->name, 0);
}

@end