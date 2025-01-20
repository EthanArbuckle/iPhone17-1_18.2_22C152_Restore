@interface MTLLegacySVBlitCommandEncoder
- (MTLLegacySVBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6;
- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4;
- (id)temporaryBufferWithLength:(unint64_t)a3;
- (unsigned)encoderID;
- (void)copyFromInternalBuffer:(id)a3 sourceOffset:(unint64_t)a4 toInternalBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6;
@end

@implementation MTLLegacySVBlitCommandEncoder

- (MTLLegacySVBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVBlitCommandEncoder;
  return -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:](&v7, sel_initWithBlitCommandEncoder_parent_descriptor_, a3, a4, a5, *(void *)&a6);
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([a3 internalICBBuffer])
  {
    uint64_t v12 = [a3 commandByteStride];
    uint64_t v13 = v12 * location + 40;
    unint64_t v22 = v12 * a6 + 40;
    unint64_t v23 = a6;
    NSUInteger v14 = v12 * length;
    baseObject = self->super.super.super._baseObject;
    uint64_t v16 = [a3 internalICBBuffer];
    uint64_t v17 = [a5 internalICBBuffer];
    NSUInteger v18 = v14;
    a6 = v23;
    [(MTLToolsObject *)baseObject copyFromBuffer:v16 sourceOffset:v13 toBuffer:v17 destinationOffset:v22 size:v18];
  }
  v19 = self->super.super.super._baseObject;
  uint64_t v20 = [a3 baseObject];
  uint64_t v21 = [a5 baseObject];

  -[MTLToolsObject copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:](v19, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", v20, location, length, v21, a6);
}

- (void)copyFromInternalBuffer:(id)a3 sourceOffset:(unint64_t)a4 toInternalBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return (id)[(MTLToolsObject *)self->super.super.super._parent temporaryBufferWithBytes:a3 length:a4];
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  return (id)[(MTLToolsObject *)self->super.super.super._parent temporaryBufferWithLength:a3];
}

- (unsigned)encoderID
{
  return self->_encoderID;
}

@end