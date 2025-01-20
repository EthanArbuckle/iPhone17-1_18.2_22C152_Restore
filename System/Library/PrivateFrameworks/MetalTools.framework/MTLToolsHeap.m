@interface MTLToolsHeap
- (BOOL)detachBacking;
- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4;
- (NSString)label;
- (id)_newToolsAccelerationStructure:(id)a3;
- (id)_newToolsBuffer:(id)a3;
- (id)_newToolsTexture:(id)a3;
- (id)formattedDescription:(unint64_t)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (int64_t)type;
- (unint64_t)allocatedSize;
- (unint64_t)cpuCacheMode;
- (unint64_t)currentAllocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)hazardTrackingMode;
- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3;
- (unint64_t)memoryPoolId;
- (unint64_t)protectionOptions;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)usedSize;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsHeap

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

- (unint64_t)cpuCacheMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 cpuCacheMode];
}

- (unint64_t)storageMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 storageMode];
}

- (unint64_t)hazardTrackingMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 hazardTrackingMode];
}

- (unint64_t)resourceOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceOptions];
}

- (unint64_t)unfilteredResourceOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 unfilteredResourceOptions];
}

- (unint64_t)size
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 size];
}

- (id)formattedDescription:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 formattedDescription:a3];
}

- (unint64_t)usedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 usedSize];
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 maxAvailableSizeWithAlignment:a3];
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 setPurgeableState:a3];
}

- (unint64_t)allocatedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allocatedSize];
}

- (unint64_t)currentAllocatedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 currentAllocatedSize];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (int64_t)type
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 type];
}

- (unint64_t)protectionOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 protectionOptions];
}

- (unint64_t)memoryPoolId
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 memoryPoolId];
}

- (id)_newToolsBuffer:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [(MTLToolsResource *)[MTLToolsBuffer alloc] initWithBaseObject:a3 parent:self heap:self];

  return v4;
}

- (id)_newToolsTexture:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:a3 parent:self heap:self];

  return v4;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super._baseObject newBufferWithLength:a3 options:a4];

  return [(MTLToolsHeap *)self _newToolsBuffer:v5];
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v6 = [(MTLToolsObject *)self->super._baseObject newBufferWithLength:a3 options:a4 offset:a5];

  return [(MTLToolsHeap *)self _newToolsBuffer:v6];
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v4 = [(MTLToolsObject *)self->super._baseObject newTextureWithDescriptor:a3];

  return [(MTLToolsHeap *)self _newToolsTexture:v4];
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super._baseObject newTextureWithDescriptor:a3 offset:a4];

  return [(MTLToolsHeap *)self _newToolsTexture:v5];
}

- (id)_newToolsAccelerationStructure:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:a3 parent:self heap:self];

  return v4;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  uint64_t v4 = [(MTLToolsObject *)self->super._baseObject newAccelerationStructureWithSize:a3];

  return [(MTLToolsHeap *)self _newToolsAccelerationStructure:v4];
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  uint64_t v4 = [(MTLToolsObject *)self->super._baseObject newAccelerationStructureWithDescriptor:unwrapAccelerationStructureDescriptor(a3)];

  return [(MTLToolsHeap *)self _newToolsAccelerationStructure:v4];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super._baseObject newAccelerationStructureWithSize:a3 offset:a4];

  return [(MTLToolsHeap *)self _newToolsAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super._baseObject newAccelerationStructureWithDescriptor:unwrapAccelerationStructureDescriptor(a3) offset:a4];

  return [(MTLToolsHeap *)self _newToolsAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super._baseObject newAccelerationStructureWithSize:a3 resourceIndex:a4];

  return [(MTLToolsHeap *)self _newToolsAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  uint64_t v6 = [(MTLToolsObject *)self->super._baseObject newAccelerationStructureWithSize:a3 offset:a4 resourceIndex:a5];

  return [(MTLToolsHeap *)self _newToolsAccelerationStructure:v6];
}

- (BOOL)detachBacking
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 detachBacking];
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 replaceBackingWithRanges:a3 readOnly:v4];
}

@end