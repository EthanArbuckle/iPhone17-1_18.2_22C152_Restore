@interface MTLLegacySVBuffer
- (BOOL)isTracked;
- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4;
- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6;
- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 track:(BOOL)a7;
- (MTLLegacySVBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5;
- (MTLLegacySVBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 track:(BOOL)a8;
- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5;
- (unint64_t)bufferIndex;
- (unint64_t)gpuAddress;
- (unint64_t)handleForOffset:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)offset;
- (unint64_t)underlyingGPUAddress;
- (void)contents;
- (void)dealloc;
- (void)setBufferIndex:(unint64_t)a3;
- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4;
- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
@end

@implementation MTLLegacySVBuffer

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4
{
  uint64_t v7 = [a3 length];

  return [(MTLLegacySVBuffer *)self initWithBuffer:a3 device:a4 offset:0 length:v7 track:1];
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6
{
  return [(MTLLegacySVBuffer *)self initWithBuffer:a3 device:a4 offset:a5 length:a6 track:1];
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 track:(BOOL)a7
{
  return [(MTLLegacySVBuffer *)self initWithBuffer:a3 heap:0 device:a4 offset:a5 length:a6 track:a7];
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5
{
  uint64_t v9 = [a3 length];

  return [(MTLLegacySVBuffer *)self initWithBuffer:a3 heap:a4 device:a5 offset:0 length:v9 track:1];
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 track:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a4;
  if (!a4) {
    a4 = a5;
  }
  v16.receiver = self;
  v16.super_class = (Class)MTLLegacySVBuffer;
  v13 = [(MTLToolsResource *)&v16 initWithBaseObject:a3 parent:a4 heap:v12];
  v14 = v13;
  if (v13)
  {
    v13->_offset = a6;
    v13->_length = a7;
    if (v8 && (*((unsigned char *)a5 + 286) & 0x80) != 0)
    {
      v13->_descriptorHeap = (char *)a5 + 296;
      [(MTLLegacySVBuffer *)v13 setBufferIndex:LegacySVBufferDescriptorHeap::createHandle((std::mutex *)((char *)a5 + 296), v13)];
    }
  }
  return v14;
}

- (void)dealloc
{
  if (self->_descriptorHeap) {
    [(MTLLegacySVBuffer *)self setBufferIndex:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVBuffer;
  [(MTLToolsBuffer *)&v3 dealloc];
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  id result = (id)[(MTLToolsObject *)self->super.super.super._baseObject newLinearTextureWithDescriptor:a3 offset:a4 bytesPerRow:a5 bytesPerImage:a6];
  if (result)
  {
    return CreateTexture(result, (uint64_t)self);
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  id result = (id)[(MTLToolsObject *)self->super.super.super._baseObject newTextureWithDescriptor:a3 offset:a4 bytesPerRow:a5];
  if (result)
  {
    return CreateTexture(result, (uint64_t)self);
  }
  return result;
}

- (void)setBufferIndex:(unint64_t)a3
{
  unint64_t bufferIndex = self->_bufferIndex;
  if (bufferIndex != a3)
  {
    if (bufferIndex)
    {
      MTLLegacySVSetBufferForResourceHandle((MTLLegacySVDevice *)self->super.super.super._device, bufferIndex, 0);
      LegacySVBufferDescriptorHeap::freeBufferHandle((std::mutex *)self->_descriptorHeap, self->_bufferIndex);
    }
    self->_unint64_t bufferIndex = a3;
    if (a3)
    {
      device = self->super.super.super._device;
      MTLLegacySVSetBufferForResourceHandle((MTLLegacySVDevice *)device, a3, self);
    }
  }
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return a3 + (self->_bufferIndex << 40);
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)contents
{
  return (void *)([(MTLToolsObject *)self->super.super.super._baseObject contents] + self->_offset);
}

- (unint64_t)gpuAddress
{
  return [(MTLLegacySVBuffer *)self handleForOffset:0];
}

- (unint64_t)underlyingGPUAddress
{
  return self->_offset + [(MTLToolsObject *)self->super.super.super._baseObject gpuAddress];
}

- (BOOL)isTracked
{
  return self->_bufferIndex != 0;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
}

@end