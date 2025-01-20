@interface MTLLegacySVIndirectCommandBuffer
- (BOOL)inheritsBuffers;
- (BOOL)inheritsPipelineState;
- (BOOL)mayContainDrawMeshes;
- (MTLBuffer)internalDispatchIDBuffer;
- (MTLBuffer)internalFragmentDrawIDBuffer;
- (MTLBuffer)internalICBBuffer;
- (MTLBuffer)internalMeshDrawIDBuffer;
- (MTLBuffer)internalObjectDrawIDBuffer;
- (MTLBuffer)internalVertexDrawIDBuffer;
- (MTLLegacySVIndirectCommandBuffer)initWithIndirectCommandBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5 resourceOptions:(unint64_t)a6 device:(id)a7;
- (MTLResourceID)gpuResourceID;
- (id)indirectComputeCommandAtIndex:(unint64_t)a3;
- (id)indirectRenderCommandAtIndex:(unint64_t)a3;
- (unint64_t)commandByteStride;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)handleForOffset:(unint64_t)a3;
- (unint64_t)hazardTrackingMode;
- (unint64_t)length;
- (unint64_t)maxCommands;
- (unint64_t)maxFragmentBindings;
- (unint64_t)maxKernelBindings;
- (unint64_t)maxMeshBindings;
- (unint64_t)maxObjectBindings;
- (unint64_t)maxVertexBindings;
- (unint64_t)resourceOptions;
- (unint64_t)storageMode;
- (void)dealloc;
- (void)resetAtIndex:(unint64_t)a3;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5 forStage:(unint64_t)a6 commandIndex:(unint64_t)a7;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6 forStage:(unint64_t)a7 commandIndex:(unint64_t)a8;
- (void)setComputePipelineStateBuffers:(id)a3 commandIndex:(unint64_t)a4;
- (void)setRenderPipelineStateBuffers:(id)a3 commandIndex:(unint64_t)a4;
- (void)setTessellationControlPointIndexBuffer:(id)a3 offset:(unint64_t)a4 commandIndex:(unint64_t)a5;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4 commandIndex:(unint64_t)a5;
- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4;
- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
@end

@implementation MTLLegacySVIndirectCommandBuffer

- (MTLLegacySVIndirectCommandBuffer)initWithIndirectCommandBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5 resourceOptions:(unint64_t)a6 device:(id)a7
{
  v24.receiver = self;
  v24.super_class = (Class)MTLLegacySVIndirectCommandBuffer;
  v12 = [(MTLToolsResource *)&v24 initWithBaseObject:a3 parent:a7];
  if (v12)
  {
    v12->_hasRender = ([a4 commandTypes] & 0x18F) != 0;
    v12->_hasCompute = ([a4 commandTypes] & 0x60) != 0;
    v12->_inheritsBuffers = [a4 inheritBuffers];
    v12->_inheritsPipelineState = [a4 inheritPipelineState];
    v12->_maxCommands = a5;
    v12->_maxVertexBindings = [a4 maxVertexBufferBindCount];
    v12->_maxFragmentBindings = [a4 maxFragmentBufferBindCount];
    v12->___int16 maxKernelBindings = [a4 maxKernelBufferBindCount];
    v12->_int maxThreadgroupBindings = 32;
    v12->_maxObjectBindings = [a4 maxObjectBufferBindCount];
    v12->_maxMeshBindings = [a4 maxMeshBufferBindCount];
    v12->_mayContainDrawMeshes = ([a4 commandTypes] & 0x180) != 0;
    if (v12->_hasCompute)
    {
      __int16 v13 = v12->_maxKernelBindings + v12->_maxThreadgroupBindings + 2;
      v12->_commandByteStride = 8 * v13;
      __int16 maxKernelBindings = v12->_maxKernelBindings;
    }
    else
    {
      __int16 v15 = v12->_maxVertexBindings + v12->_maxFragmentBindings + 2;
      v12->_commandByteStride = 8 * v15;
      __int16 v13 = v15 + v12->_maxVertexBindings;
      v12->_commandByteStride = 8 * v13;
      __int16 maxKernelBindings = v12->_maxObjectBindings + v12->_maxMeshBindings;
    }
    v12->_commandByteStride = 8 * (v13 + maxKernelBindings);
    v12->_originalResourceOptions = a6;
    v16 = (void *)MEMORY[0x23ECD5710]();
    v17 = objc_opt_new();
    v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    [v17 setAccess:1];
    [v17 setIndex:0];
    [v17 setArrayLength:1];
    [v17 setDataType:80];
    objc_msgSend(v18, "addObject:", (id)objc_msgSend(v17, "copy"));
    v19 = objc_msgSend((id)objc_msgSend(a7, "baseObject"), "newArgumentEncoderWithArguments:", v18);

    uint64_t v20 = [a7 newInternalBufferWithLength:v12->_commandByteStride * a5 + 40 options:0];
    v12->_argumentStorage = (MTLBuffer *)v20;
    [v19 setArgumentBuffer:v20 offset:0];
    [v19 setIndirectCommandBuffer:a3 atIndex:0];

    v21 = (_DWORD *)[(MTLBuffer *)v12->_argumentStorage contents];
    v21[2] = v12->_maxCommands;
    v21[3] = v12->_maxVertexBindings;
    v21[4] = v12->_maxFragmentBindings;
    v21[5] = v12->_maxKernelBindings;
    int maxThreadgroupBindings = v12->_maxThreadgroupBindings;
    v21[6] = v12->_commandByteStride >> 3;
    v21[7] = maxThreadgroupBindings;
    if (!v12->_inheritsPipelineState)
    {
      v12->_vertexKernelDrawOrDispatchIDBuffer = (MTLBuffer *)[a7 newInternalBufferWithLength:24 * a5 options:0];
      if (v12->_hasRender)
      {
        v12->_fragmentDrawIDBuffer = (MTLBuffer *)[a7 newInternalBufferWithLength:24 * a5 options:0];
        v12->_meshDrawIDBuffer = (MTLBuffer *)[a7 newInternalBufferWithLength:24 * a5 options:0];
        v12->_objectDrawIDBuffer = (MTLBuffer *)[a7 newInternalBufferWithLength:24 * a5 options:0];
      }
    }
  }
  return v12;
}

- (unint64_t)maxCommands
{
  return self->_maxCommands;
}

- (unint64_t)maxVertexBindings
{
  return self->_maxVertexBindings;
}

- (unint64_t)maxFragmentBindings
{
  return self->_maxFragmentBindings;
}

- (unint64_t)maxKernelBindings
{
  return self->_maxKernelBindings;
}

- (unint64_t)maxObjectBindings
{
  return self->_maxObjectBindings;
}

- (unint64_t)maxMeshBindings
{
  return self->_maxMeshBindings;
}

- (BOOL)mayContainDrawMeshes
{
  return self->_mayContainDrawMeshes;
}

- (unint64_t)commandByteStride
{
  return self->_commandByteStride;
}

- (BOOL)inheritsBuffers
{
  return self->_inheritsBuffers;
}

- (BOOL)inheritsPipelineState
{
  return self->_inheritsPipelineState;
}

- (MTLBuffer)internalICBBuffer
{
  return self->_argumentStorage;
}

- (MTLBuffer)internalDispatchIDBuffer
{
  return self->_vertexKernelDrawOrDispatchIDBuffer;
}

- (MTLBuffer)internalVertexDrawIDBuffer
{
  return self->_vertexKernelDrawOrDispatchIDBuffer;
}

- (MTLBuffer)internalFragmentDrawIDBuffer
{
  return self->_fragmentDrawIDBuffer;
}

- (MTLBuffer)internalMeshDrawIDBuffer
{
  return self->_meshDrawIDBuffer;
}

- (MTLBuffer)internalObjectDrawIDBuffer
{
  return self->_objectDrawIDBuffer;
}

- (void)resetAtIndex:(unint64_t)a3
{
  int v3 = a3;
  v5 = (int *)[(MTLBuffer *)self->_argumentStorage contents];
  int v6 = v5[6] * v3;
  v7 = &v5[2 * v6];
  *((void *)v7 + 5) = 0;
  v8 = v7 + 10;
  if (self->_maxKernelBindings)
  {
    unint64_t v9 = 0;
    v10 = v8 + 4;
    uint64_t v11 = (uint64_t)&v5[2 * v5[3] + 14 + 2 * v5[5] + 2 * v6];
    do
    {
      *(void *)&v10[2 * v9] = 0;
      *(void *)(v11 + 8 * v9++) = -1;
    }
    while (v9 < self->_maxKernelBindings);
  }
  if (self->_maxThreadgroupBindings)
  {
    unint64_t v12 = 0;
    uint64_t v13 = (uint64_t)&v5[4 * v5[3] + 14 + 4 * v5[5] + 2 * v5[4] + 2 * v6];
    do
      *(void *)(v13 + 8 * v12++) = 0;
    while (v12 < self->_maxThreadgroupBindings);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5 forStage:(unint64_t)a6 commandIndex:(unint64_t)a7
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6 forStage:(unint64_t)a7 commandIndex:(unint64_t)a8
{
  int v8 = a8;
  v14 = (int *)[(MTLBuffer *)self->_argumentStorage contents];
  switch(a7)
  {
    case 1uLL:
    case 3uLL:
      uint64_t v15 = [a3 handleForOffset:a4];
      uint64_t v16 = v14[5];
      uint64_t v17 = (uint64_t)&v14[2 * v14[6] * v8 + 14];
      *(void *)(v17 + 8 * a6) = v15;
      uint64_t v18 = v17 + 8 * v14[3] + 8 * v16;
      goto LABEL_8;
    case 2uLL:
      a5 = [a3 handleForOffset:a4];
      uint64_t v19 = v14[5];
      uint64_t v20 = (uint64_t)&v14[2 * v14[6] * v8 + 2 * v14[3] + 2 * v19 + 2 * v14[3]];
      goto LABEL_6;
    case 7uLL:
      a5 = [a3 handleForOffset:a4];
      uint64_t v21 = (uint64_t)&v14[2 * v14[6] * v8
                        + 2 * v14[3]
                        + 2 * v14[5]
                        + 2 * v14[3]
                        + 2 * v14[5]
                        + 2 * v14[4]
                        + 2 * v14[7]
                        + 2 * v14[8]];
      goto LABEL_7;
    case 8uLL:
      a5 = [a3 handleForOffset:a4];
      uint64_t v20 = (uint64_t)&v14[2 * v14[6] * v8 + 2 * v14[3] + 2 * v14[5] + 2 * v14[3] + 2 * v14[5] + 2 * v14[4]];
      uint64_t v19 = v14[7];
LABEL_6:
      uint64_t v21 = v20 + 8 * v19;
LABEL_7:
      uint64_t v18 = v21 + 56;
LABEL_8:
      *(void *)(v18 + 8 * a6) = a5;
      break;
    default:
      return;
  }
}

- (void)setTessellationControlPointIndexBuffer:(id)a3 offset:(unint64_t)a4 commandIndex:(unint64_t)a5
{
  int v5 = a5;
  uint64_t v8 = [(MTLBuffer *)self->_argumentStorage contents];
  *(void *)(v8 + 8 * *(_DWORD *)(v8 + 24) * v5 + 48) = [a3 handleForOffset:a4];
}

- (void)setRenderPipelineStateBuffers:(id)a3 commandIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v6 = [(MTLBuffer *)self->_argumentStorage contents];
  if (a3) {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "underlyingGPUAddress");
  }
  else {
    uint64_t v7 = 0;
  }
  *(void *)(v6 + 8 * *(_DWORD *)(v6 + 24) * v4 + 40) = v7;
}

- (void)setComputePipelineStateBuffers:(id)a3 commandIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v6 = [(MTLBuffer *)self->_argumentStorage contents];
  if (a3) {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "underlyingGPUAddress");
  }
  else {
    uint64_t v7 = 0;
  }
  *(void *)(v6 + 8 * *(_DWORD *)(v6 + 24) * v4 + 40) = v7;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4 commandIndex:(unint64_t)a5
{
  int v5 = a5;
  int v7 = a3;
  uint64_t v8 = (int *)[(MTLBuffer *)self->_argumentStorage contents];
  v8[2 * v8[6] * v5 + 15 + 2 * v8[3] + 2 * v8[5] + 2 * v8[3] + 2 * v8[5] + 2 * v8[4] + 2 * a4] = v7;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  int v3 = -[MTLLegacySVIndirectRenderCommand initWithIndirectRenderCommand:commandIndex:indirectCommandBuffer:]([MTLLegacySVIndirectRenderCommand alloc], "initWithIndirectRenderCommand:commandIndex:indirectCommandBuffer:", -[MTLToolsObject indirectRenderCommandAtIndex:](self->super.super.super._baseObject, "indirectRenderCommandAtIndex:"), a3, self);

  return v3;
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  int v3 = -[MTLLegacySVIndirectComputeCommand initWithIndirectComputeCommand:commandIndex:indirectCommandBuffer:]([MTLLegacySVIndirectComputeCommand alloc], "initWithIndirectComputeCommand:commandIndex:indirectCommandBuffer:", -[MTLToolsObject indirectComputeCommandAtIndex:](self->super.super.super._baseObject, "indirectComputeCommandAtIndex:"), a3, self);

  return v3;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->super.super.super._baseObject);
  [a3 useResourceInternal:self->_argumentStorage usage:a4];
  if (self->_vertexKernelDrawOrDispatchIDBuffer)
  {
    objc_msgSend(a3, "useResourceInternal:usage:");
  }
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  unint64_t var1 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->super.super.super._baseObject);
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_argumentStorage, a4, var1, v5);
  if ((_BYTE)v5) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = self->_vertexKernelDrawOrDispatchIDBuffer == 0;
  }
  if (!v10 || (var1 & 1) != 0) {
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
  }
  if ((_BYTE)v5) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = self->_fragmentDrawIDBuffer == 0;
  }
  if (!v12 || (var1 & 2) != 0) {
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
  }
  if ((_BYTE)v5) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = self->_meshDrawIDBuffer == 0;
  }
  if (!v14 || (var1 & 0x10) != 0) {
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
  }
  if ((_BYTE)v5) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = self->_objectDrawIDBuffer == 0;
  }
  if (!v16 || (var1 & 8) != 0)
  {
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
  }
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return [(MTLToolsObject *)self->super.super.super._baseObject gpuResourceID];
}

- (unint64_t)gpuAddress
{
  return [(MTLToolsObject *)self->super.super.super._baseObject gpuAddress];
}

- (MTLResourceID)gpuResourceID
{
  v2 = [(MTLLegacySVIndirectCommandBuffer *)self internalICBBuffer];

  return (MTLResourceID)[(MTLBuffer *)v2 gpuAddress];
}

- (unint64_t)length
{
  return 0;
}

- (unint64_t)storageMode
{
  return self->_originalResourceOptions >> 4;
}

- (unint64_t)cpuCacheMode
{
  return self->_originalResourceOptions & 0xF;
}

- (unint64_t)hazardTrackingMode
{
  return (self->_originalResourceOptions >> 8) & 3;
}

- (unint64_t)resourceOptions
{
  return self->_originalResourceOptions;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVIndirectCommandBuffer;
  [(MTLToolsResource *)&v3 dealloc];
}

@end