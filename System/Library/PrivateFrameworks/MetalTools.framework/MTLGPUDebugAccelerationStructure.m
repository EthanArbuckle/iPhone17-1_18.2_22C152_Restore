@interface MTLGPUDebugAccelerationStructure
- (MTLBuffer)childrenWrappersBuffer;
- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4;
- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4 type:(unint64_t)a5;
- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 heap:(id)a4;
- (MTLResourceID)gpuResourceID;
- (id)debugBuf;
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

@implementation MTLGPUDebugAccelerationStructure

- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugAccelerationStructure;
  v4 = [(MTLToolsAccelerationStructure *)&v6 initWithBaseObject:a3 parent:a4];
  v4->_accelerationStructureType = 0;
  [(MTLGPUDebugAccelerationStructure *)v4 _setupIdentifier];
  return v4;
}

- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 heap:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugAccelerationStructure;
  v4 = [(MTLToolsAccelerationStructure *)&v6 initWithBaseObject:a3 parent:a4 heap:a4];
  v4->_accelerationStructureType = 0;
  [(MTLGPUDebugAccelerationStructure *)v4 _setupIdentifier];
  return v4;
}

- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4 type:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugAccelerationStructure;
  objc_super v6 = [(MTLToolsAccelerationStructure *)&v8 initWithBaseObject:a3 parent:a4];
  v6->_accelerationStructureType = a5;
  [(MTLGPUDebugAccelerationStructure *)v6 _setupIdentifier];
  return v6;
}

- (void)_setupIdentifier
{
  v3 = (MTLBuffer *)[(MTLToolsDevice *)self->super.super.super._device newInternalBufferWithLength:32 options:0];
  self->_debugBuf = v3;
  v4 = (void *)[(MTLBuffer *)v3 contents];
  void *v4 = [(MTLGPUDebugAccelerationStructure *)self gpuAddress];
  uint64_t v5 = [(MTLToolsObject *)self->super.super.super._baseObject gpuResourceID];
  unint64_t accelerationStructureType = self->_accelerationStructureType;
  v4[1] = v5;
  v4[2] = accelerationStructureType;
  v4[3] = 0;
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
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugAccelerationStructure;
  [(MTLToolsAccelerationStructure *)&v3 dealloc];
}

- (MTLBuffer)childrenWrappersBuffer
{
  return self->_childrenWrappersBuffer;
}

- (void)setChildrenWrappersBuffer:(id)a3
{
}

@end