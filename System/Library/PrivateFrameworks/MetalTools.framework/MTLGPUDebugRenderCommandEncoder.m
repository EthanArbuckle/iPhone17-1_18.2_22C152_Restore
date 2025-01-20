@interface MTLGPUDebugRenderCommandEncoder
- (MTLGPUDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6;
- (MTLGPUDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parallelEncoder:(id)a4 encoderID:(unsigned int)a5;
- (id).cxx_construct;
- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4;
- (id)temporaryBufferWithLength:(unint64_t)a3;
- (unsigned)encoderID;
- (void)_useResourceCommon:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
- (void)dispatchThreadsPerTile:(id *)a3;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5;
- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)endEncoding;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)flushBindings;
- (void)restoreInternalState:(id)a3;
- (void)setBufferUsageTable:(id)a3 textureUsageTable:(id)a4 textureTypeTable:(id)a5 forStage:(unint64_t)a6;
- (void)setDepthStencilState:(id)a3;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFragmentReportBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setMeshReportBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectReportBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setRenderPipelineStateBuffers:(id)a3;
- (void)setTessellationControlPointIndexBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTileReportBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexReportBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)useHeap:(id)a3;
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResourceInternal:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
@end

@implementation MTLGPUDebugRenderCommandEncoder

- (MTLGPUDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6
{
  v12.receiver = self;
  v12.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  v8 = [(MTLToolsRenderCommandEncoder *)&v12 initWithRenderCommandEncoder:a3 parent:a4 descriptor:a5];
  v9 = v8;
  if (v8)
  {
    v8->_commandBuffer = (MTLGPUDebugCommandBuffer *)a4;
    v8->_encoderType = 0;
    uint64_t p_deviceWrapper = (uint64_t)&v8->super.super.super._device[2]._deviceWrapper;
    v8->_options = (Options *)p_deviceWrapper;
    v8->_drawID.encoderID = a6;
    v8->_drawID.eventID = 0;
    *(&v8->_enableUseResourceValidation + 4) = (*(void *)(p_deviceWrapper + 20) & 0x200000001) != 0;
    MTLGPUDebugStageBufferHandles::clear(&v8->_vertexHandles);
    if ((*((unsigned char *)&v9->_options->var0 + 2) & 0x80) == 0) {
      [(MTLGPUDebugRenderCommandEncoder *)v9 _initBufferArgumentData:v9->super.super.super._device];
    }
    *(_WORD *)&v9->_vertexAmpState.count = 1;
  }
  return v9;
}

- (MTLGPUDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parallelEncoder:(id)a4 encoderID:(unsigned int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:](&v10, sel_initWithRenderCommandEncoder_parent_, a3);
  if (v7)
  {
    v7->_commandBuffer = (MTLGPUDebugCommandBuffer *)[a4 commandBuffer];
    v7->_encoderType = 3;
    uint64_t p_deviceWrapper = (uint64_t)&v7->super.super.super._device[2]._deviceWrapper;
    v7->_options = (Options *)p_deviceWrapper;
    *(&v7->_enableUseResourceValidation + 4) = (*(void *)(p_deviceWrapper + 20) & 0x200000001) != 0;
    v7->_drawID.encoderID = a5;
    v7->_drawID.eventID = 0;
    MTLGPUDebugStageBufferHandles::clear(&v7->_vertexHandles);
    if ((*((unsigned char *)&v7->_options->var0 + 2) & 0x80) == 0) {
      [(MTLGPUDebugRenderCommandEncoder *)v7 _initBufferArgumentData:v7->super.super.super._device];
    }
  }
  return v7;
}

- (unsigned)encoderID
{
  return self->_drawID.encoderID;
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v6 = [(MTLToolsCommandEncoder *)self commandBuffer];

  return (id)[(MTLToolsRetainingContainer *)v6 temporaryBufferWithBytes:a3 length:a4];
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  v4 = [(MTLToolsCommandEncoder *)self commandBuffer];

  return (id)[(MTLToolsRetainingContainer *)v4 temporaryBufferWithLength:a3];
}

- (void)flushBindings
{
  if (*(&self->_enableUseResourceValidation + 1))
  {
    self->_drawID.entryPointImageID = (unint64_t)[(MTLGPUDebugRenderPipelineState *)self->_currentPipeline vertexFunctionData];
    -[MTLToolsObject setVertexBytes:length:atIndex:](self->super.super.super._baseObject, "setVertexBytes:length:atIndex:");
  }
  if (self->_enableUseResourceValidation)
  {
    self->_drawID.entryPointImageID = (unint64_t)[(MTLGPUDebugRenderPipelineState *)self->_currentPipeline fragmentFunctionData];
    -[MTLToolsObject setFragmentBytes:length:atIndex:](self->super.super.super._baseObject, "setFragmentBytes:length:atIndex:");
    if ((*(void *)&self->_options->var0 & 0x400000001) != 0)
    {
      int v3 = [(MTLGPUDebugRenderPipelineState *)self->_currentPipeline fragmentMaxCallStackDepth];
      baseObject = self->super.super.super._baseObject;
      options = self->_options;
      LODWORD(v78) = v3;
      if ((*(void *)&options->var0 & 0x10000) != 0) {
        uint64_t v6 = 22;
      }
      else {
        uint64_t v6 = 52;
      }
      [(MTLToolsObject *)baseObject setFragmentBytes:&v78 length:4 atIndex:v6];
    }
  }
  if (self->_objectStageActive)
  {
    self->_drawID.entryPointImageID = (unint64_t)[(MTLGPUDebugRenderPipelineState *)self->_currentPipeline tileFunctionData];
    -[MTLToolsObject setTileBytes:length:atIndex:](self->super.super.super._baseObject, "setTileBytes:length:atIndex:");
    if ((*(void *)&self->_options->var0 & 0x400000001) != 0)
    {
      LODWORD(v78) = 0;
      int v7 = [(MTLGPUDebugRenderPipelineState *)self->_currentPipeline tileMaxCallStackDepth];
      v8 = self->super.super.super._baseObject;
      v9 = self->_options;
      LODWORD(v78) = v7;
      if ((*(void *)&v9->var0 & 0x10000) != 0) {
        uint64_t v10 = 22;
      }
      else {
        uint64_t v10 = 52;
      }
      [(MTLToolsObject *)v8 setTileBytes:&v78 length:4 atIndex:v10];
    }
  }
  if (*(&self->_enableUseResourceValidation + 2))
  {
    self->_drawID.entryPointImageID = (unint64_t)[(MTLGPUDebugRenderPipelineState *)self->_currentPipeline objectFunctionData];
    -[MTLToolsObject setObjectBytes:length:atIndex:](self->super.super.super._baseObject, "setObjectBytes:length:atIndex:");
    if ((*(void *)&self->_options->var0 & 0x400000001) != 0)
    {
      LODWORD(v78) = 0;
      int v11 = [(MTLGPUDebugRenderPipelineState *)self->_currentPipeline objectMaxCallStackDepth];
      objc_super v12 = self->super.super.super._baseObject;
      v13 = self->_options;
      LODWORD(v78) = v11;
      if ((*(void *)&v13->var0 & 0x10000) != 0) {
        uint64_t v14 = 22;
      }
      else {
        uint64_t v14 = 52;
      }
      [(MTLToolsObject *)v12 setObjectBytes:&v78 length:4 atIndex:v14];
    }
  }
  if (*(&self->_enableUseResourceValidation + 3))
  {
    self->_drawID.entryPointImageID = (unint64_t)[(MTLGPUDebugRenderPipelineState *)self->_currentPipeline meshFunctionData];
    -[MTLToolsObject setMeshBytes:length:atIndex:](self->super.super.super._baseObject, "setMeshBytes:length:atIndex:");
    if ((*(void *)&self->_options->var0 & 0x400000001) != 0)
    {
      LODWORD(v78) = 0;
      int v15 = [(MTLGPUDebugRenderPipelineState *)self->_currentPipeline meshMaxCallStackDepth];
      v16 = self->super.super.super._baseObject;
      v17 = self->_options;
      LODWORD(v78) = v15;
      if ((*(void *)&v17->var0 & 0x10000) != 0) {
        uint64_t v18 = 22;
      }
      else {
        uint64_t v18 = 52;
      }
      [(MTLToolsObject *)v16 setMeshBytes:&v78 length:4 atIndex:v18];
    }
  }
  $75A86BEFE5181BCE6D1FBDE93997BD40 var0 = self->_options->var0;
  if ((*(void *)&var0 & 0x200000001) != 0)
  {
    [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] encodeResourceTableBuffers:self type:0];
    $75A86BEFE5181BCE6D1FBDE93997BD40 var0 = self->_options->var0;
  }
  uint64_t v20 = *(_DWORD *)&var0 & 0x7000000;
  if (*(&self->_enableUseResourceValidation + 3))
  {
    unsigned int v21 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline meshDebugInstrumentationData] activeThreadgroupMask];
    unsigned int v22 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline meshDebugInstrumentationData] threadgroupArgumentOffset];
    if (v20)
    {
      if (self->_meshThreadgroup.needsFlush)
      {
        unsigned int v77 = v21;
        unint64_t v23 = MTLGPUDebugThreadgroupLengths::setupTableEntries((uint64_t)&self->_meshThreadgroup, &v77, v22);
        if (v23)
        {
          unint64_t v24 = v23;
          if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
            uint64_t v25 = 4;
          }
          else {
            uint64_t v25 = 34;
          }
          [(MTLToolsObject *)self->super.super.super._baseObject setMeshBytes:self->_meshThreadgroup.entries length:256 atIndex:v25];
          [(MTLToolsObject *)self->super.super.super._baseObject setThreadgroupMemoryLength:v24 offset:0 atIndex:0];
        }
        self->_meshThreadgroup.needsFlush = 0;
      }
    }
  }
  int v26 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline tileDebugInstrumentationData] activeThreadgroupMask];
  int v27 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline fragmentDebugInstrumentationData] activeThreadgroupMask];
  if (v20 && self->_tileThreadgroup.needsFlush)
  {
    int v76 = v27 | v26;
    uint64_t v28 = MTLGPUDebugTileThreadgroup::setupTableEntries((uint64_t)&self->_tileThreadgroup, (unsigned int *)&v76);
    if (v28)
    {
      uint64_t v29 = v28;
      if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
        uint64_t v30 = 4;
      }
      else {
        uint64_t v30 = 34;
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setTileBytes:&self->_tileThreadgroup length:256 atIndex:v30];
      if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
        uint64_t v31 = 4;
      }
      else {
        uint64_t v31 = 34;
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBytes:&self->_tileThreadgroup length:256 atIndex:v31];
      [(MTLToolsObject *)self->super.super.super._baseObject setThreadgroupMemoryLength:v29 offset:0 atIndex:0];
    }
    self->_tileThreadgroup.needsFlush = 0;
  }
  $75A86BEFE5181BCE6D1FBDE93997BD40 v32 = self->_options->var0;
  if ((*(_DWORD *)&v32 & 0x800000) != 0)
  {
    [(MTLToolsObject *)self->super.super.super._baseObject useResource:self->super.super.super._device[3].samplerObjectCache usage:1];
    int v49 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 1);
    uint64_t v50 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline vertexDebugInstrumentationData] bufferAccessMask];
    if (v49)
    {
      unint64_t v51 = v50;
      if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
        [(MTLToolsObject *)self->super.super.super._baseObject setVertexBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
      }
      if (self->_vertexHandles.needsFlush)
      {
        unint64_t v78 = v51;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::VertexEncoderClass>>((uint64_t)&self->_vertexHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    BOOL enableUseResourceValidation = self->_enableUseResourceValidation;
    uint64_t v53 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline fragmentDebugInstrumentationData] bufferAccessMask];
    if (enableUseResourceValidation)
    {
      unint64_t v54 = v53;
      if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
        [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
      }
      if (self->_fragmentHandles.needsFlush)
      {
        unint64_t v78 = v54;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::FragmentEncoderClass>>((uint64_t)&self->_fragmentHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    BOOL objectStageActive = self->_objectStageActive;
    uint64_t v56 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline tileDebugInstrumentationData] bufferAccessMask];
    if (objectStageActive)
    {
      unint64_t v57 = v56;
      if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
        [(MTLToolsObject *)self->super.super.super._baseObject setTileBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
      }
      if (self->_tileHandles.needsFlush)
      {
        unint64_t v78 = v57;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::TileEncoderClass>>((uint64_t)&self->_tileHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    int v58 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 2);
    uint64_t v59 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline objectDebugInstrumentationData] bufferAccessMask];
    if (v58)
    {
      unint64_t v60 = v59;
      if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
        [(MTLToolsObject *)self->super.super.super._baseObject setObjectBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
      }
      if (self->_objectHandles.needsFlush)
      {
        unint64_t v78 = v60;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::ObjectEncoderClass>>((uint64_t)&self->_objectHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
    int v61 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
    uint64_t v62 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline meshDebugInstrumentationData] bufferAccessMask];
    if (v61)
    {
      unint64_t v63 = v62;
      if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
        [(MTLToolsObject *)self->super.super.super._baseObject setMeshBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
      }
      if (self->_meshHandles.needsFlush)
      {
        unint64_t v78 = v63;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::MeshEncoderClass>>((uint64_t)&self->_meshHandles, &v78, (id *)&self->super.super.super.super.isa, 20, 23);
      }
    }
  }
  else
  {
    int v33 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 1);
    uint64_t v34 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline vertexDebugInstrumentationData] bufferAccessMask];
    p_vertexHandles = &self->_vertexHandles;
    v36 = self->_options;
    if ((*(_DWORD *)&v32 & 0x10000) != 0)
    {
      if (v33)
      {
        if ((*((unsigned char *)&v36->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setVertexBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_vertexHandles.needsFlush)
        {
          unint64_t v78 = v34;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::VertexEncoderClass>>((uint64_t)p_vertexHandles, &v78, self, 20, 23);
        }
      }
      BOOL v64 = self->_enableUseResourceValidation;
      uint64_t v65 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline fragmentDebugInstrumentationData] bufferAccessMask];
      if (v64)
      {
        unint64_t v66 = v65;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_fragmentHandles.needsFlush)
        {
          unint64_t v78 = v66;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::FragmentEncoderClass>>((uint64_t)&self->_fragmentHandles, &v78, self, 20, 23);
        }
      }
      BOOL v67 = self->_objectStageActive;
      uint64_t v68 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline tileDebugInstrumentationData] bufferAccessMask];
      if (v67)
      {
        unint64_t v69 = v68;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setTileBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_tileHandles.needsFlush)
        {
          unint64_t v78 = v69;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::TileEncoderClass>>((uint64_t)&self->_tileHandles, &v78, self, 20, 23);
        }
      }
      int v70 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 2);
      uint64_t v71 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline objectDebugInstrumentationData] bufferAccessMask];
      if (v70)
      {
        unint64_t v72 = v71;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setObjectBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_objectHandles.needsFlush)
        {
          unint64_t v78 = v72;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::ObjectEncoderClass>>((uint64_t)&self->_objectHandles, &v78, self, 20, 23);
        }
      }
      int v73 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
      uint64_t v74 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline meshDebugInstrumentationData] bufferAccessMask];
      if (v73)
      {
        unint64_t v75 = v74;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setMeshBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_meshHandles.needsFlush)
        {
          unint64_t v78 = v75;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::MeshEncoderClass>>((uint64_t)&self->_meshHandles, &v78, self, 20, 23);
        }
      }
    }
    else
    {
      if (v33)
      {
        if ((*((unsigned char *)&v36->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setVertexBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_vertexHandles.needsFlush)
        {
          unint64_t v78 = v34;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::VertexEncoderClass>>((uint64_t)p_vertexHandles, &v78, self);
        }
      }
      BOOL v37 = self->_enableUseResourceValidation;
      uint64_t v38 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline fragmentDebugInstrumentationData] bufferAccessMask];
      if (v37)
      {
        unint64_t v39 = v38;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_fragmentHandles.needsFlush)
        {
          unint64_t v78 = v39;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::FragmentEncoderClass>>((uint64_t)&self->_fragmentHandles, &v78, self);
        }
      }
      BOOL v40 = self->_objectStageActive;
      uint64_t v41 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline tileDebugInstrumentationData] bufferAccessMask];
      if (v40)
      {
        unint64_t v42 = v41;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setTileBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_tileHandles.needsFlush)
        {
          unint64_t v78 = v42;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::TileEncoderClass>>((uint64_t)&self->_tileHandles, &v78, self);
        }
      }
      int v43 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 2);
      uint64_t v44 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline objectDebugInstrumentationData] bufferAccessMask];
      if (v43)
      {
        unint64_t v45 = v44;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setObjectBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_objectHandles.needsFlush)
        {
          unint64_t v78 = v45;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::ObjectEncoderClass>>((uint64_t)&self->_objectHandles, &v78, self);
        }
      }
      int v46 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
      uint64_t v47 = [(MTLDebugInstrumentationData *)[(MTLToolsRenderPipelineState *)self->_currentPipeline meshDebugInstrumentationData] bufferAccessMask];
      if (v46)
      {
        unint64_t v48 = v47;
        if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
          [(MTLToolsObject *)self->super.super.super._baseObject setMeshBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
        }
        if (self->_meshHandles.needsFlush)
        {
          unint64_t v78 = v48;
          MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::MeshEncoderClass>>((uint64_t)&self->_meshHandles, &v78, self);
        }
      }
    }
  }
  ++self->_drawID.eventID;
}

- (void)setTessellationControlPointIndexBuffer:(id)a3 offset:(unint64_t)a4
{
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markBuffer:a3 usage:1 stages:1];
  }
  if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    uint64_t v7 = [a3 handleForOffset:a4];
    [(MTLToolsObject *)self->super.super.super._baseObject setVertexBytes:&v7 length:8 atIndex:13];
    if (!a3) {
      return;
    }
    goto LABEL_7;
  }
  -[MTLToolsObject setVertexBuffer:offset:atIndex:](self->super.super.super._baseObject, "setVertexBuffer:offset:atIndex:", [a3 baseObject], a4, 13);
  if (a3)
  {
LABEL_7:
    [(MTLGPUDebugRenderCommandEncoder *)self useResource:a3 usage:1 stages:1];
    [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  }
}

- (void)setBufferUsageTable:(id)a3 textureUsageTable:(id)a4 textureTypeTable:(id)a5 forStage:(unint64_t)a6
{
  if (*((unsigned char *)&self->_options->var0 + 2))
  {
    switch(a6)
    {
      case 1uLL:
        [(MTLToolsObject *)self->super.super.super._baseObject setVertexBuffer:a3 offset:0 atIndex:5];
        [(MTLToolsObject *)self->super.super.super._baseObject setVertexBuffer:a4 offset:0 atIndex:6];
        [(MTLToolsObject *)self->super.super.super._baseObject setVertexBuffer:a5 offset:0 atIndex:7];
        self->_vertexBufferUsageTable = (MTLBuffer *)a3;
        self->_vertexTextureUsageTable = (MTLBuffer *)a4;
        uint64_t v10 = 9064;
        break;
      case 2uLL:
        [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBuffer:a3 offset:0 atIndex:5];
        [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBuffer:a4 offset:0 atIndex:6];
        [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBuffer:a5 offset:0 atIndex:7];
        self->_fragmentBufferUsageTable = (MTLBuffer *)a3;
        self->_fragmentTextureUsageTable = (MTLBuffer *)a4;
        self->_fragmentTextureTypeTable = (MTLBuffer *)a5;
        goto LABEL_8;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
LABEL_8:
        if ([(MTLToolsDevice *)self->super.super.super._device supportsTileShaders])
        {
          [(MTLToolsObject *)self->super.super.super._baseObject setTileBuffer:a3 offset:0 atIndex:5];
          [(MTLToolsObject *)self->super.super.super._baseObject setTileBuffer:a4 offset:0 atIndex:6];
          baseObject = self->super.super.super._baseObject;
          [(MTLToolsObject *)baseObject setTileBuffer:a5 offset:0 atIndex:7];
        }
        return;
      case 8uLL:
        if (![(MTLToolsDevice *)self->super.super.super._device supportsMeshShaders]) {
          return;
        }
        -[MTLGPUDebugRenderCommandEncoder useResourceInternal:usage:stages:](self, "useResourceInternal:usage:stages:", a3, 3, 8, 1);
        [(MTLToolsObject *)self->super.super.super._baseObject setObjectBuffer:a3 offset:0 atIndex:5];
        [(MTLToolsObject *)self->super.super.super._baseObject setObjectBuffer:a4 offset:0 atIndex:6];
        [(MTLToolsObject *)self->super.super.super._baseObject setObjectBuffer:a5 offset:0 atIndex:7];
        self->_objectBufferUsageTable = (MTLBuffer *)a3;
        self->_objectTextureUsageTable = (MTLBuffer *)a4;
        uint64_t v10 = 9080;
        break;
      default:
        if (a6 != 16 || ![(MTLToolsDevice *)self->super.super.super._device supportsMeshShaders]) {
          return;
        }
        -[MTLGPUDebugRenderCommandEncoder useResourceInternal:usage:stages:](self, "useResourceInternal:usage:stages:", a3, 3, 16, 1);
        [(MTLToolsObject *)self->super.super.super._baseObject setMeshBuffer:a3 offset:0 atIndex:5];
        [(MTLToolsObject *)self->super.super.super._baseObject setMeshBuffer:a4 offset:0 atIndex:6];
        [(MTLToolsObject *)self->super.super.super._baseObject setMeshBuffer:a5 offset:0 atIndex:7];
        self->_meshBufferUsageTable = (MTLBuffer *)a3;
        self->_meshTextureUsageTable = (MTLBuffer *)a4;
        uint64_t v10 = 9088;
        break;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + v10) = (Class)a5;
  }
}

- (void)setVertexReportBuffer:(id)a3 offset:(unint64_t)a4
{
  p_vertexReportBuffer = &self->_vertexReportBuffer;
  id v8 = a3;

  p_vertexReportBuffer->buffer = (MTLBuffer *)a3;
  p_vertexReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  uint64_t v10 = [a3 baseObject];
  if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 32;
  }

  [(MTLToolsObject *)baseObject setVertexBuffer:v10 offset:a4 atIndex:v11];
}

- (void)setFragmentReportBuffer:(id)a3 offset:(unint64_t)a4
{
  p_fragmentReportBuffer = &self->_fragmentReportBuffer;
  id v8 = a3;

  p_fragmentReportBuffer->buffer = (MTLBuffer *)a3;
  p_fragmentReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  uint64_t v10 = [a3 baseObject];
  if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 32;
  }

  [(MTLToolsObject *)baseObject setFragmentBuffer:v10 offset:a4 atIndex:v11];
}

- (void)setTileReportBuffer:(id)a3 offset:(unint64_t)a4
{
  p_tileReportBuffer = &self->_tileReportBuffer;
  id v8 = a3;

  p_tileReportBuffer->buffer = (MTLBuffer *)a3;
  p_tileReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  uint64_t v10 = [a3 baseObject];
  if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 32;
  }

  [(MTLToolsObject *)baseObject setTileBuffer:v10 offset:a4 atIndex:v11];
}

- (void)setObjectReportBuffer:(id)a3 offset:(unint64_t)a4
{
  p_objectReportBuffer = &self->_objectReportBuffer;
  id v8 = a3;

  p_objectReportBuffer->buffer = (MTLBuffer *)a3;
  p_objectReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  uint64_t v10 = [a3 baseObject];
  if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 32;
  }

  [(MTLToolsObject *)baseObject setObjectBuffer:v10 offset:a4 atIndex:v11];
}

- (void)setMeshReportBuffer:(id)a3 offset:(unint64_t)a4
{
  p_meshReportBuffer = &self->_meshReportBuffer;
  id v8 = a3;

  p_meshReportBuffer->buffer = (MTLBuffer *)a3;
  p_meshReportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  uint64_t v10 = [a3 baseObject];
  if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 32;
  }

  [(MTLToolsObject *)baseObject setMeshBuffer:v10 offset:a4 atIndex:v11];
}

- (void)setRenderPipelineStateBuffers:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (*(&self->_enableUseResourceValidation + 1)) {
    v5 = (void *)[a3 vertexConstantsBuffer];
  }
  else {
    v5 = 0;
  }
  if (self->_enableUseResourceValidation) {
    uint64_t v6 = (void *)[a3 fragmentConstantsBuffer];
  }
  else {
    uint64_t v6 = 0;
  }
  if (self->_objectStageActive) {
    uint64_t v7 = [a3 tileConstantsBuffer];
  }
  else {
    uint64_t v7 = 0;
  }
  if (*(&self->_enableUseResourceValidation + 3)) {
    uint64_t v8 = [a3 meshConstantsBuffer];
  }
  else {
    uint64_t v8 = 0;
  }
  if (*(&self->_enableUseResourceValidation + 2)) {
    uint64_t v9 = [a3 objectConstantsBuffer];
  }
  else {
    uint64_t v9 = 0;
  }
  if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    v17 = (void *)v7;
    uint64_t v18 = (void *)v8;
    v19 = (void *)v9;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = (void *)[a3 binaryFunctionData];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if (*(void *)(v16 + 8))
          {
            -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
            [(MTLGPUDebugRenderCommandEncoder *)self useResource:*(void *)(v16 + 8) usage:1];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
    if (v5)
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:v5];
      [(MTLGPUDebugRenderCommandEncoder *)self useResource:v5 usage:1 stages:1];
    }
    if (v6)
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:v6];
      [(MTLGPUDebugRenderCommandEncoder *)self useResource:v6 usage:1 stages:2];
    }
    if (*(&self->_enableUseResourceValidation + 1))
    {
      uint64_t v20 = [v5 handleForOffset:0];
      [(MTLToolsObject *)self->super.super.super._baseObject setVertexBytes:&v20 length:8 atIndex:12];
    }
    if (self->_enableUseResourceValidation)
    {
      uint64_t v20 = [v6 handleForOffset:0];
      [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBytes:&v20 length:8 atIndex:12];
    }
    if (self->_objectStageActive)
    {
      uint64_t v20 = [v17 handleForOffset:0];
      [(MTLToolsObject *)self->super.super.super._baseObject setTileBytes:&v20 length:8 atIndex:12];
    }
    if (*(&self->_enableUseResourceValidation + 3))
    {
      uint64_t v20 = [v18 handleForOffset:0];
      [(MTLToolsObject *)self->super.super.super._baseObject setMeshBytes:&v20 length:8 atIndex:12];
    }
    if (*(&self->_enableUseResourceValidation + 2))
    {
      uint64_t v20 = [v19 handleForOffset:0];
      [(MTLToolsObject *)self->super.super.super._baseObject setObjectBytes:&v20 length:8 atIndex:12];
    }
    if (v17)
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:v17];
      [(MTLGPUDebugRenderCommandEncoder *)self useResource:v17 usage:1 stages:4];
    }
    if (*(&self->_enableUseResourceValidation + 3) && v18)
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:v18];
      [(MTLGPUDebugRenderCommandEncoder *)self useResource:v18 usage:1 stages:16];
    }
    if (*(&self->_enableUseResourceValidation + 2) && v19)
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:v19];
      [(MTLGPUDebugRenderCommandEncoder *)self useResource:v19 usage:1 stages:8];
    }
  }
  else
  {
    if (v5) {
      [(MTLToolsObject *)self->super.super.super._baseObject setVertexBuffer:v5 offset:0 atIndex:12];
    }
    if (v6) {
      [(MTLToolsObject *)self->super.super.super._baseObject setFragmentBuffer:v6 offset:0 atIndex:12];
    }
    if (v7) {
      [(MTLToolsObject *)self->super.super.super._baseObject setTileBuffer:v7 offset:0 atIndex:12];
    }
    if (v8) {
      [(MTLToolsObject *)self->super.super.super._baseObject setMeshBuffer:v8 offset:0 atIndex:12];
    }
    if (v9)
    {
      baseObject = self->super.super.super._baseObject;
      [(MTLToolsObject *)baseObject setObjectBuffer:v9 offset:0 atIndex:12];
    }
  }
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markBuffer:a3 usage:3 stages:1];
  }
  MTLGPUDebugStageBufferHandles::setBuffer(&self->_vertexHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, (void *)a5, a6);

  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  std::vector<unsigned long>::vector(__p, a5.length);
  uint64_t v10 = __p[0];
  if (length)
  {
    uint64_t v11 = 0;
    do
      v10[v11++] = -1;
    while (length > v11);
  }
  -[MTLGPUDebugRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:](self, "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    NSUInteger length = a6.length;
    NSUInteger location = a6.location;
    do
    {
      uint64_t v13 = (uint64_t)*a3++;
      uint64_t v12 = v13;
      uint64_t v15 = *a4++;
      uint64_t v14 = v15;
      uint64_t v16 = *a5++;
      [(MTLGPUDebugRenderCommandEncoder *)self setVertexBuffer:v12 offset:v14 attributeStride:v16 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v9 = [(MTLGPUDebugRenderCommandEncoder *)self temporaryBufferWithBytes:a3 length:a4];

  [(MTLGPUDebugRenderCommandEncoder *)self setVertexBuffer:v9 offset:0 attributeStride:a5 atIndex:a6];
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer(&self->_fragmentHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markBuffer:a3 usage:3 stages:2];
  }

  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    do
    {
      uint64_t v11 = (uint64_t)*a3++;
      uint64_t v10 = v11;
      uint64_t v12 = *a4++;
      [(MTLGPUDebugRenderCommandEncoder *)self setFragmentBuffer:v10 offset:v12 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] temporaryBufferWithBytes:a3 length:a4];

  [(MTLGPUDebugRenderCommandEncoder *)self setFragmentBuffer:v7 offset:0 atIndex:a5];
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer(&self->_tileHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markBuffer:a3 usage:3 stages:4];
  }

  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    do
    {
      uint64_t v11 = (uint64_t)*a3++;
      uint64_t v10 = v11;
      uint64_t v12 = *a4++;
      [(MTLGPUDebugRenderCommandEncoder *)self setTileBuffer:v10 offset:v12 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] temporaryBufferWithBytes:a3 length:a4];

  [(MTLGPUDebugRenderCommandEncoder *)self setTileBuffer:v7 offset:0 atIndex:a5];
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v6 = a3;
  if ((*((unsigned char *)&self->_options->var0 + 3) & 7) != 0)
  {
    MTLGPUDebugTileThreadgroup::setThreadgroupMemoryLength(&self->_tileThreadgroup, a3, a4, a5);
    MTLGPUDebugThreadgroupLengths::setThreadgroupMemoryLength(&self->_meshThreadgroup, v6, a5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
    [(MTLToolsRenderCommandEncoder *)&v8 setThreadgroupMemoryLength:a3 offset:a4 atIndex:a5];
  }
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer(&self->_objectHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markBuffer:a3 usage:3 stages:8];
  }

  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    do
    {
      uint64_t v11 = (uint64_t)*a3++;
      uint64_t v10 = v11;
      uint64_t v12 = *a4++;
      [(MTLGPUDebugRenderCommandEncoder *)self setObjectBuffer:v10 offset:v12 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] temporaryBufferWithBytes:a3 length:a4];

  [(MTLGPUDebugRenderCommandEncoder *)self setObjectBuffer:v7 offset:0 atIndex:a5];
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBuffer(&self->_meshHandles, (MTLGPUDebugBuffer *)a3, (char *)a4, a5);
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markBuffer:a3 usage:3 stages:16];
  }

  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    do
    {
      uint64_t v11 = (uint64_t)*a3++;
      uint64_t v10 = v11;
      uint64_t v12 = *a4++;
      [(MTLGPUDebugRenderCommandEncoder *)self setMeshBuffer:v10 offset:v12 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] temporaryBufferWithBytes:a3 length:a4];

  [(MTLGPUDebugRenderCommandEncoder *)self setMeshBuffer:v7 offset:0 atIndex:a5];
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 baseObject];
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4)) {
      [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:a3 usage:3 stages:1];
    }
    [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  }
  baseObject = self->super.super.super._baseObject;

  [(MTLToolsObject *)baseObject setVertexTexture:v7 atIndex:a4];
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      objc_super v8 = *a3;
      uint64_t v9 = [(id)*a3 baseObject];
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4)) {
          [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:v8 usage:3 stages:1];
        }
        [(MTLToolsCommandEncoder *)self addRetainedObject:v8];
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setVertexTexture:v9 atIndex:location++];
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 baseObject];
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4)) {
      [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:a3 usage:3 stages:2];
    }
    [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  }
  baseObject = self->super.super.super._baseObject;

  [(MTLToolsObject *)baseObject setFragmentTexture:v7 atIndex:a4];
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      objc_super v8 = *a3;
      uint64_t v9 = [(id)*a3 baseObject];
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4)) {
          [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:v8 usage:3 stages:2];
        }
        [(MTLToolsCommandEncoder *)self addRetainedObject:v8];
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setFragmentTexture:v9 atIndex:location++];
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 baseObject];
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4)) {
      [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:a3 usage:3 stages:4];
    }
    [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  }
  baseObject = self->super.super.super._baseObject;

  [(MTLToolsObject *)baseObject setTileTexture:v7 atIndex:a4];
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      objc_super v8 = *a3;
      uint64_t v9 = [(id)*a3 baseObject];
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4)) {
          [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:v8 usage:3 stages:4];
        }
        [(MTLToolsCommandEncoder *)self addRetainedObject:v8];
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setTileTexture:v9 atIndex:location++];
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 baseObject];
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4)) {
      [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:a3 usage:3 stages:16];
    }
    [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  }
  baseObject = self->super.super.super._baseObject;

  [(MTLToolsObject *)baseObject setMeshTexture:v7 atIndex:a4];
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      objc_super v8 = *a3;
      uint64_t v9 = [(id)*a3 baseObject];
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4)) {
          [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:v8 usage:3 stages:16];
        }
        [(MTLToolsCommandEncoder *)self addRetainedObject:v8];
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setMeshTexture:v9 atIndex:location++];
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 baseObject];
  if (a3)
  {
    if (*(&self->_enableUseResourceValidation + 4)) {
      [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:a3 usage:3 stages:8];
    }
    [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  }
  baseObject = self->super.super.super._baseObject;

  [(MTLToolsObject *)baseObject setObjectTexture:v7 atIndex:a4];
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      objc_super v8 = *a3;
      uint64_t v9 = [(id)*a3 baseObject];
      if (v8)
      {
        if (*(&self->_enableUseResourceValidation + 4)) {
          [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:v8 usage:3 stages:8];
        }
        [(MTLToolsCommandEncoder *)self addRetainedObject:v8];
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setObjectTexture:v9 atIndex:location++];
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v9 drawPrimitives:a3 vertexStart:a4 vertexCount:a5];
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v9 drawPrimitives:a3 indirectBuffer:a4 indirectBufferOffset:a5];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v11 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v13.receiver = self;
  v13.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v13 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6 baseInstance:a7];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v13.receiver = self;
  v13.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v13 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:a6 indexBufferOffset:a7];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v15.receiver = self;
  v15.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v15 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:a6 indexBufferOffset:a7 instanceCount:a8];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v15.receiver = self;
  v15.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v15 drawIndexedPrimitives:a3 indexType:a4 indexBuffer:a5 indexBufferOffset:a6 indirectBuffer:a7 indirectBufferOffset:a8];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v17.receiver = self;
  v17.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v17 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:a6 indexBufferOffset:a7 instanceCount:a8 baseVertex:a9 baseInstance:a10];
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v12.receiver = self;
  v12.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v12 drawPatches:a3 patchIndexBuffer:a4 patchIndexBufferOffset:a5 indirectBuffer:a6 indirectBufferOffset:a5];
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  v16.receiver = self;
  v16.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v16 drawPatches:a3 patchStart:a4 patchCount:a5 patchIndexBuffer:a6 patchIndexBufferOffset:a7 instanceCount:a8 baseInstance:a9];
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    [(MTLGPUDebugRenderCommandEncoder *)self setTessellationControlPointIndexBuffer:a6 offset:a7];
    [(MTLGPUDebugRenderCommandEncoder *)self drawPatches:a3 patchIndexBuffer:a4 patchIndexBufferOffset:a5 indirectBuffer:a8 indirectBufferOffset:a9];
  }
  else
  {
    [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
    v16.receiver = self;
    v16.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
    [(MTLToolsRenderCommandEncoder *)&v16 drawIndexedPatches:a3 patchIndexBuffer:a4 patchIndexBufferOffset:a5 controlPointIndexBuffer:a6 controlPointIndexBufferOffset:a7 indirectBuffer:a8 indirectBufferOffset:a9];
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    [(MTLGPUDebugRenderCommandEncoder *)self setTessellationControlPointIndexBuffer:a8 offset:a9];
    -[MTLGPUDebugRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:](self, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a10);
  }
  else
  {
    [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
    v18.receiver = self;
    v18.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
    [(MTLToolsRenderCommandEncoder *)&v18 drawIndexedPatches:a3 patchStart:a4 patchCount:a5 patchIndexBuffer:a6 patchIndexBufferOffset:a7 controlPointIndexBuffer:a8 controlPointIndexBufferOffset:a9 instanceCount:a10 baseInstance:a11];
  }
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v5 dispatchThreadsPerTile:&v6];
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  long long v7 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v8 = *(_OWORD *)&a4->var0.var2;
  v10[0] = *(_OWORD *)&a4->var0.var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a4->var1.var1;
  long long v11 = v7;
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v9 dispatchThreadsPerTile:&v11 inRegion:v10];
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  long long v9 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v10 = *(_OWORD *)&a4->var0.var2;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  long long v13 = v9;
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v11 dispatchThreadsPerTile:&v13 inRegion:v12 withRenderTargetArrayIndex:v5];
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a5;
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v9 drawMeshThreadgroups:&v12 threadsPerObjectThreadgroup:&v11 threadsPerMeshThreadgroup:&v10];
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a5;
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v9 drawMeshThreads:&v12 threadsPerObjectThreadgroup:&v11 threadsPerMeshThreadgroup:&v10];
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  [(MTLGPUDebugRenderCommandEncoder *)self flushBindings];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a6;
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v11 drawMeshThreadgroupsWithIndirectBuffer:a3 indirectBufferOffset:a4 threadsPerObjectThreadgroup:&v13 threadsPerMeshThreadgroup:&v12];
}

- (void)restoreInternalState:(id)a3
{
  id v5 = [(MTLToolsObject *)self baseObject];
  int v6 = [a3 inheritsBuffers];
  char v7 = [a3 inheritsPipelineState];
  if (!v6 || (v7 & 1) == 0)
  {
    self->_vertexHandles.needsFlush = 1;
    self->_fragmentHandles.needsFlush = 1;
    uint64_t count = self->_vertexAmpState.count;
    if (self->_vertexAmpState.mappingsValid) {
      mappings = self->_vertexAmpState.mappings;
    }
    else {
      mappings = 0;
    }
    [v5 setVertexAmplificationCount:count viewMappings:mappings];
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v9 = LODWORD(a4.location) | ((unint64_t)LODWORD(a4.length) << 32);
  int v10 = 1;
  [(MTLGPUDebugRenderCommandEncoder *)self prepareExecuteIndirect:a3 variant:&v9];
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder executeCommandsInBuffer:withRange:](&v8, sel_executeCommandsInBuffer_withRange_, a3, location, length);
  [(MTLGPUDebugRenderCommandEncoder *)self restoreInternalState:a3];
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  v10[0] = a4;
  v10[1] = a5;
  int v11 = 0;
  [(MTLGPUDebugRenderCommandEncoder *)self prepareExecuteIndirect:a3 variant:v10];
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v9 executeCommandsInBuffer:a3 indirectBuffer:a4 indirectBufferOffset:a5];
  [(MTLGPUDebugRenderCommandEncoder *)self restoreInternalState:a3];
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  self->_vertexAmpState.uint64_t count = a3;
  self->_vertexAmpState.mappingsValid = a4 != 0;
  if (a3 && a4) {
    memmove(self->_vertexAmpState.mappings, a4, 8 * a3);
  }
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v7 setVertexAmplificationCount:a3 viewMappings:a4];
}

- (void)useResourceInternal:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  if (a5.var1) {
    [(MTLToolsObject *)self->super.super.super._baseObject useResource:a3 usage:a4 stages:a5.var0.var1];
  }
  else {
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", a3, a4, a5.var0.var1);
  }
}

- (void)_useResourceCommon:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  unint64_t var1 = a5.var0.var1;
  -[MTLGPUDebugRenderCommandEncoder useResourceInternal:usage:stages:](self, "useResourceInternal:usage:stages:", [a3 baseObject], a4, a5.var0.var1, *(void *)&a5.var1);
  if ((_BYTE)v5) {
    uint64_t v10 = var1;
  }
  else {
    uint64_t v10 = 27;
  }
  if (*(&self->_enableUseResourceValidation + 4))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markBuffer:a3 usage:a4 stages:v10];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markTexture:a3 usage:a4 stages:v10];
      }
    }
  }

  objc_msgSend(a3, "useWithRenderEncoder:usage:stages:", self, a4, var1, v5);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  if (a4)
  {
    unint64_t v6 = a4;
    do
    {
      uint64_t v9 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self useResource:v9 usage:a5];
      --v6;
    }
    while (v6);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  if (a4)
  {
    unint64_t v8 = a4;
    do
    {
      uint64_t v11 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self useResource:v11 usage:a5 stages:a6];
      --v8;
    }
    while (v8);
  }
}

- (void)useHeap:(id)a3
{
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markHeap:a3 stages:31];
  }
  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  baseObject = self->super.super.super._baseObject;
  uint64_t v6 = [a3 baseObject];

  [(MTLToolsObject *)baseObject useHeap:v6];
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  if (*(&self->_enableUseResourceValidation + 4)) {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer markHeap:a3 stages:a4];
  }
  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  baseObject = self->super.super.super._baseObject;
  uint64_t v8 = [a3 baseObject];

  [(MTLToolsObject *)baseObject useHeap:v8 stages:a4];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      uint64_t v7 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self useHeap:v7];
      --v4;
    }
    while (v4);
  }
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  if (a4)
  {
    unint64_t v6 = a4;
    do
    {
      uint64_t v9 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self useHeap:v9 stages:a5];
      --v6;
    }
    while (v6);
  }
}

- (void)useResidencySet:(id)a3
{
  if ((*(void *)&self->_options->var0 & 0x200000001) != 0) {
    [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addResidencySetGPUDebug:a3 fromEncoder:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v5 useResidencySet:a3];
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if ((*(void *)&self->_options->var0 & 0x200000001) != 0 && a4 != 0)
  {
    uint64_t v8 = a3;
    unint64_t v9 = a4;
    do
    {
      uint64_t v10 = (uint64_t)*v8++;
      [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addResidencySetGPUDebug:v10 fromEncoder:self];
      --v9;
    }
    while (v9);
  }
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v11 useResidencySets:a3 count:a4];
}

- (void)setDepthStencilState:(id)a3
{
  self->_currentDepthStencil = (MTLToolsDepthStencilState *)a3;
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setDepthStencilState:](&v3, sel_setDepthStencilState_);
}

- (void)setRenderPipelineState:(id)a3
{
  self->_drawID.pipelineStateID = (unint64_t)a3;
  *(&self->_enableUseResourceValidation + 1) = [a3 vertexFunctionData] != 0;
  self->_BOOL enableUseResourceValidation = [a3 fragmentFunctionData] != 0;
  BOOL v5 = [a3 tileFunctionData] != 0;
  self->_BOOL objectStageActive = v5;
  self->_meshStageActive |= v5;
  BOOL v6 = !*(&self->_enableUseResourceValidation + 1) && [a3 objectFunctionData] != 0;
  *(&self->_enableUseResourceValidation + 2) = v6;
  int v7 = !*(&self->_enableUseResourceValidation + 1) && [a3 meshFunctionData] != 0;
  *(&self->_enableUseResourceValidation + 3) = v7;
  if (*(&self->_enableUseResourceValidation + 2) || v7 != 0)
  {
    [(MTLGPUDebugCommandBuffer *)self->_commandBuffer beginUseOfMeshShadersInEncoder:self];
    int v7 = *((unsigned __int8 *)&self->_enableUseResourceValidation + 3);
  }
  if (v7)
  {
    if (self->_currentPipeline != a3)
    {
      unint64_t v9 = (void *)[a3 meshDebugInstrumentationData];
      if ([v9 activeThreadgroupMask]
        || [v9 threadgroupArgumentOffset])
      {
        self->_meshThreadgroup.needsFlush = 1;
      }
    }
  }
  if (self->_meshStageActive && self->_currentPipeline != a3)
  {
    uint64_t v10 = (void *)[a3 tileDebugInstrumentationData];
    objc_super v11 = (void *)[a3 fragmentDebugInstrumentationData];
    if ([v10 activeThreadgroupMask]
      || [v11 activeThreadgroupMask])
    {
      self->_tileThreadgroup.needsFlush = 1;
    }
  }
  if (self->_currentPipeline != a3)
  {
    if ((*((unsigned char *)&self->_options->var0 + 2) & 0x40) != 0) {
      [(MTLGPUDebugRenderCommandEncoder *)self setRenderPipelineStateBuffers:a3];
    }
    self->_vertexHandles.needsFlush |= *(&self->_enableUseResourceValidation + 1);
    self->_fragmentHandles.needsFlush |= self->_enableUseResourceValidation;
    self->_tileHandles.needsFlush |= self->_objectStageActive;
  }
  self->_currentPipeline = (MTLGPUDebugRenderPipelineState *)a3;
  v12.receiver = self;
  v12.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v12 setRenderPipelineState:a3];
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_vertexHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:1];
  }
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setVertexVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_fragmentHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:2];
  }
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setFragmentVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_tileHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:4];
  }
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setTileVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_objectHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:8];
  }
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setObjectVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_meshHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:16];
  }
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setMeshVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_vertexHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:1];
  }
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setVertexIntersectionFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_fragmentHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:2];
  }
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setFragmentIntersectionFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_tileHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:4];
  }
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setTileIntersectionFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setObjectIntersectionFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_meshHandles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1 stages:16];
  }
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugRenderCommandEncoder *)self setMeshIntersectionFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)endEncoding
{
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] endingEncoder:self type:self->_encoderType];
  MTLGPUDebugStageBufferHandles::clear(&self->_vertexHandles);
  MTLGPUDebugStageBufferHandles::clear(&self->_fragmentHandles);
  MTLGPUDebugStageBufferHandles::clear(&self->_tileHandles);
  MTLGPUDebugStageBufferHandles::clear(&self->_objectHandles);
  MTLGPUDebugStageBufferHandles::clear(&self->_meshHandles);

  self->_vertexReportBuffer.buffer = 0;
  self->_vertexReportBuffer.offset = 0;

  self->_fragmentReportBuffer.buffer = 0;
  self->_fragmentReportBuffer.offset = 0;

  self->_tileReportBuffer.buffer = 0;
  self->_tileReportBuffer.offset = 0;

  self->_objectReportBuffer.buffer = 0;
  self->_objectReportBuffer.offset = 0;

  self->_meshReportBuffer.buffer = 0;
  self->_meshReportBuffer.offset = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugRenderCommandEncoder;
  [(MTLToolsCommandEncoder *)&v3 endEncoding];
}

- (id).cxx_construct
{
  *((unsigned char *)self + 1688) = 0;
  *((unsigned char *)self + 3312) = 0;
  *((unsigned char *)self + 4936) = 0;
  *((unsigned char *)self + 5200) = 0;
  *((unsigned char *)self + 6824) = 0;
  *((unsigned char *)self + 8448) = 0;
  *((unsigned char *)self + 8836) = 0;
  *((void *)self + 1112) = 0;
  *((void *)self + 1114) = 0;
  *((void *)self + 1116) = 0;
  *((void *)self + 1118) = 0;
  *((void *)self + 1120) = 0;
  return self;
}

@end