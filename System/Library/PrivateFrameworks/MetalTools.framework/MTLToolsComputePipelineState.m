@interface MTLToolsComputePipelineState
- (BOOL)supportIndirectCommandBuffers;
- (MTLDebugInstrumentationData)debugInstrumentationData;
- (MTLDevice)device;
- (MTLResourceID)gpuResourceID;
- (NSString)label;
- (id)functionHandleWithFunction:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)pipelineBinaries;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)resourceIndex;
- (unint64_t)staticThreadgroupMemoryLength;
- (unint64_t)threadExecutionWidth;
- (unint64_t)uniqueIdentifier;
- (unsigned)getComputeKernelTelemetryID;
- (void)dealloc;
@end

@implementation MTLToolsComputePipelineState

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsComputePipelineState;
  [(MTLToolsObject *)&v3 dealloc];
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (MTLDevice)device
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  parent = self->super._parent;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v5 = objc_opt_isKindOfClass();
    parent = self->super._parent;
    if ((v5 & 1) == 0) {
      return (MTLDevice *)self->super._parent;
    }
  }

  return [(MTLToolsObject *)parent device];
}

- (id)functionHandleWithFunction:(id)a3
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:", objc_msgSend(a3, "baseObject"));

  return (id)MTLFunctionHandleToToolsFunctionHandle(v5, a3, (uint64_t)self);
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3
{
  return [(MTLToolsComputePipelineState *)self newComputePipelineStateWithAdditionalBinaryFunctions:a3 error:0];
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11++), "baseObject"));
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);
  if (!v12) {
    return 0;
  }
  v13 = (void *)v12;
  v14 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:v12 parent:self];

  return v14;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    v6 = [(MTLToolsResource *)[MTLToolsVisibleFunctionTable alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    v6 = [(MTLToolsResource *)[MTLToolsIntersectionFunctionTable alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (BOOL)supportIndirectCommandBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportIndirectCommandBuffers];
}

- (int64_t)textureWriteRoundingMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 textureWriteRoundingMode];
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTotalThreadsPerThreadgroup];
}

- (unint64_t)threadExecutionWidth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 threadExecutionWidth];
}

- (unint64_t)staticThreadgroupMemoryLength
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 staticThreadgroupMemoryLength];
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  return [v4 imageblockMemoryLengthForDimensions:&v6];
}

- (unsigned)getComputeKernelTelemetryID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getComputeKernelTelemetryID];
}

- (unint64_t)resourceIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceIndex];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (unint64_t)allocatedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allocatedSize];
}

- (unint64_t)uniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 uniqueIdentifier];
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 debugInstrumentationData];
}

- (id)pipelineBinaries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 pipelineBinaries];
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

@end