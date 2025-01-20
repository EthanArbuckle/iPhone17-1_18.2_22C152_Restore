@interface MTLToolsRenderPipelineState
- (BOOL)supportIndirectCommandBuffers;
- (BOOL)threadgroupSizeMatchesTileSize;
- (MTLDebugInstrumentationData)fragmentDebugInstrumentationData;
- (MTLDebugInstrumentationData)meshDebugInstrumentationData;
- (MTLDebugInstrumentationData)objectDebugInstrumentationData;
- (MTLDebugInstrumentationData)tileDebugInstrumentationData;
- (MTLDebugInstrumentationData)vertexDebugInstrumentationData;
- (MTLDevice)device;
- (MTLResourceID)gpuResourceID;
- (MTLToolsRenderPipelineState)initWithBaseObject:(id)a3 parent:(id)a4;
- (NSString)label;
- (id)fragmentFunctionHandleWithFunction:(id)a3;
- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4;
- (id)meshFunctionHandleWithFunction:(id)a3;
- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newFragmentShaderDebugInfo;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 selector:(SEL)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5;
- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVertexShaderDebugInfo;
- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 selector:(SEL)a4;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)objectFunctionHandleWithFunction:(id)a3;
- (id)pipelineBinaries;
- (id)tileFunctionHandleWithFunction:(id)a3;
- (id)vertexFunctionHandleWithFunction:(id)a3;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)imageblockSampleLength;
- (unint64_t)maxTotalThreadgroupsPerMeshGrid;
- (unint64_t)maxTotalThreadsPerMeshThreadgroup;
- (unint64_t)maxTotalThreadsPerObjectThreadgroup;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)meshThreadExecutionWidth;
- (unint64_t)objectThreadExecutionWidth;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
- (unsigned)explicitVisibilityGroupID;
- (unsigned)getFragmentShaderTelemetryID;
- (unsigned)getVertexShaderTelemetryID;
- (void)dealloc;
@end

@implementation MTLToolsRenderPipelineState

- (MTLToolsRenderPipelineState)initWithBaseObject:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLToolsRenderPipelineState;
  return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLToolsRenderPipelineState;
  [(MTLToolsObject *)&v2 dealloc];
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

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTotalThreadsPerThreadgroup];
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 threadgroupSizeMatchesTileSize];
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

- (id)newVertexShaderDebugInfo
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 newVertexShaderDebugInfo];
}

- (id)newFragmentShaderDebugInfo
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 newFragmentShaderDebugInfo];
}

- (unsigned)getVertexShaderTelemetryID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getVertexShaderTelemetryID];
}

- (unsigned)getFragmentShaderTelemetryID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getFragmentShaderTelemetryID];
}

- (unint64_t)imageblockSampleLength
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 imageblockSampleLength];
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  return [v4 imageblockMemoryLengthForDimensions:&v6];
}

- (unint64_t)resourceIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceIndex];
}

- (unsigned)explicitVisibilityGroupID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 explicitVisibilityGroupID];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (unint64_t)uniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 uniqueIdentifier];
}

- (unint64_t)allocatedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allocatedSize];
}

- (MTLDebugInstrumentationData)vertexDebugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 vertexDebugInstrumentationData];
}

- (MTLDebugInstrumentationData)fragmentDebugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 fragmentDebugInstrumentationData];
}

- (MTLDebugInstrumentationData)tileDebugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 tileDebugInstrumentationData];
}

- (MTLDebugInstrumentationData)objectDebugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 objectDebugInstrumentationData];
}

- (MTLDebugInstrumentationData)meshDebugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 meshDebugInstrumentationData];
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTotalThreadsPerObjectThreadgroup];
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTotalThreadsPerMeshThreadgroup];
}

- (unint64_t)objectThreadExecutionWidth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 objectThreadExecutionWidth];
}

- (unint64_t)meshThreadExecutionWidth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 meshThreadExecutionWidth];
}

- (unint64_t)maxTotalThreadgroupsPerMeshGrid
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTotalThreadgroupsPerMeshGrid];
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "vertexFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject"));

  return (id)MTLFunctionHandleToToolsFunctionHandle(v5, a3, (uint64_t)self);
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fragmentFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject"));

  return (id)MTLFunctionHandleToToolsFunctionHandle(v5, a3, (uint64_t)self);
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tileFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject"));

  return (id)MTLFunctionHandleToToolsFunctionHandle(v5, a3, (uint64_t)self);
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "objectFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject"));

  return (id)MTLFunctionHandleToToolsFunctionHandle(v5, a3, (uint64_t)self);
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "meshFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject"));

  return (id)MTLFunctionHandleToToolsFunctionHandle(v5, a3, (uint64_t)self);
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:stage:", objc_msgSend(a3, "baseObject"), a4);

  return (id)MTLFunctionHandleToToolsFunctionHandle(v6, a3, (uint64_t)self);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 selector:(SEL)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a4, a3);
  if (result)
  {
    id v6 = result;
    v7 = [(MTLToolsResource *)[MTLToolsVisibleFunctionTable alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    id v6 = result;
    v7 = [(MTLToolsResource *)[MTLToolsVisibleFunctionTable alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  v8 = unwrapArray((NSArray *)a3);
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:", v8, unwrapArray((NSArray *)a4), a5);
  if (result)
  {
    id v10 = result;
    v11 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v11;
  }
  return result;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", unwrapArray((NSArray *)a3), a4);
  if (result)
  {
    id v6 = result;
    v7 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263F129D0]);
  objc_msgSend(v7, "setVertexAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "vertexAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setFragmentAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "fragmentAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setTileAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "tileAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setObjectAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "objectAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setMeshAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "meshAdditionalBinaryFunctions")));
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);

  if (!v8) {
    return 0;
  }
  v9 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:v8 parent:self];

  return v9;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 selector:(SEL)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a4, a3);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsResource *)[MTLToolsIntersectionFunctionTable alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLToolsRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 selector:a2];
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsResource *)[MTLToolsIntersectionFunctionTable alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
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