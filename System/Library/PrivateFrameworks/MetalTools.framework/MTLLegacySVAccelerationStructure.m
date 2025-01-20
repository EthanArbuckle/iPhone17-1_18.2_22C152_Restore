@interface MTLLegacySVAccelerationStructure
- (MTLBuffer)childrenWrappersBuffer;
- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4;
- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4 type:(unint64_t)a5;
- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 heap:(id)a4;
- (MTLResourceID)gpuResourceID;
- (id)debugBuf;
- (unint64_t)accelerationStructureHandle;
- (unint64_t)gpuAddress;
- (unint64_t)handleForOffset:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)underlyingGPUAddress;
- (void)_setupIdentifier;
- (void)dealloc;
- (void)setChildrenWrappersBuffer:(id)a3;
- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4;
- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
@end

@implementation MTLLegacySVAccelerationStructure

- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructure;
  v4 = [(MTLToolsAccelerationStructure *)&v6 initWithBaseObject:a3 parent:a4];
  v4->_accelerationStructureType = 0;
  [(MTLLegacySVAccelerationStructure *)v4 _setupIdentifier];
  return v4;
}

- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 heap:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructure;
  v4 = [(MTLToolsAccelerationStructure *)&v6 initWithBaseObject:a3 parent:a4 heap:a4];
  v4->_accelerationStructureType = 0;
  [(MTLLegacySVAccelerationStructure *)v4 _setupIdentifier];
  return v4;
}

- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4 type:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructure;
  objc_super v6 = [(MTLToolsAccelerationStructure *)&v8 initWithBaseObject:a3 parent:a4];
  v6->_accelerationStructureType = a5;
  [(MTLLegacySVAccelerationStructure *)v6 _setupIdentifier];
  return v6;
}

- (void)_setupIdentifier
{
  self->_unint64_t accelerationStructureHandle = LegacySVBufferDescriptorHeap::createHandle((std::mutex *)&self->super.super.super._device[2].functionObjectCache, (MTLLegacySVBuffer *)self);
  uint64_t v3 = [(MTLToolsObject *)self->super.super.super._baseObject buffer];
  uint64_t v4 = [(MTLToolsObject *)self->super.super.super._baseObject bufferOffset];
  p_functionObjectCache = &self->super.super.super._device[2].functionObjectCache;
  unint64_t accelerationStructureHandle = self->_accelerationStructureHandle;
  std::mutex::lock((std::mutex *)p_functionObjectCache);
  [(MTLToolsObjectCache *)p_functionObjectCache[15] setArgumentBuffer:p_functionObjectCache[16] offset:[(MTLToolsObjectCache *)p_functionObjectCache[15] encodedLength] * accelerationStructureHandle];
  v7 = p_functionObjectCache[15];
  [(MTLToolsObjectCache *)v7 setBuffer:v3 offset:v4 atIndex:0];
  *(_DWORD *)[(MTLToolsObjectCache *)v7 constantDataAtIndex:1] = -1;
  std::mutex::unlock((std::mutex *)p_functionObjectCache);
  objc_super v8 = (MTLBuffer *)[(MTLToolsDevice *)self->super.super.super._device newInternalBufferWithLength:32 options:0];
  self->_debugBuf = v8;
  v9 = (uint64_t *)[(MTLBuffer *)v8 contents];
  uint64_t *v9 = MTLLegacySVBufferHandleToOffset(self->_accelerationStructureHandle);
  uint64_t v10 = [(MTLToolsObject *)self->super.super.super._baseObject gpuResourceID];
  unint64_t accelerationStructureType = self->_accelerationStructureType;
  v9[1] = v10;
  v9[2] = accelerationStructureType;
  v9[3] = 0;
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return [(MTLBuffer *)self->_debugBuf gpuAddress];
}

- (unint64_t)length
{
  return 0;
}

- (unint64_t)gpuAddress
{
  return [(MTLBuffer *)self->_debugBuf gpuAddress];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLBuffer *)self->_debugBuf gpuAddress];
}

- (unint64_t)underlyingGPUAddress
{
  return [(MTLBuffer *)self->_debugBuf gpuAddress];
}

- (id)debugBuf
{
  return self->_debugBuf;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  [a3 useResourceInternal:self->_debugBuf usage:1];
  if ((*(uint64_t *)((unsigned char *)&self->super.super.super._device[2].dynamicLibraryObjectCache + 4) & 0x200000001) != 0)
  {
    objc_super v6 = (void *)[a3 commandBuffer];
    [v6 markAccelerationStructure:self usage:1 stages:3];
  }
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  BOOL var1 = a5.var1;
  unint64_t v6 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_debugBuf, 1);
  if ((*(uint64_t *)((unsigned char *)&self->super.super.super._device[2].dynamicLibraryObjectCache + 4) & 0x200000001) != 0)
  {
    v9 = (void *)[a3 commandBuffer];
    if (var1) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = 3;
    }
    [v9 markAccelerationStructure:self usage:1 stages:v10];
  }
}

- (void)dealloc
{
  LegacySVBufferDescriptorHeap::freeBufferHandle((std::mutex *)&self->super.super.super._device[2].functionObjectCache, self->_accelerationStructureHandle);

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVAccelerationStructure;
  [(MTLToolsAccelerationStructure *)&v3 dealloc];
}

- (unint64_t)accelerationStructureHandle
{
  return self->_accelerationStructureHandle;
}

- (MTLBuffer)childrenWrappersBuffer
{
  return self->_childrenWrappersBuffer;
}

- (void)setChildrenWrappersBuffer:(id)a3
{
}

@end