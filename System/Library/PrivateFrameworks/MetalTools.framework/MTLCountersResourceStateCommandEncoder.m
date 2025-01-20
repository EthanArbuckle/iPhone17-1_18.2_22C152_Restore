@interface MTLCountersResourceStateCommandEncoder
- (MTLCountersResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8;
- (void)dealloc;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
- (void)updateFence:(id)a3;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7;
- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8;
- (void)waitForFence:(id)a3;
@end

@implementation MTLCountersResourceStateCommandEncoder

- (MTLCountersResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLCountersResourceStateCommandEncoder;
  v6 = [(MTLToolsResourceStateCommandEncoder *)&v8 initWithResourceStateCommandEncoder:a3 parent:a4 descriptor:a5];
  if (v6) {
    v6->_traceEncoder = (MTLCountersTraceResourceStateCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a4, "traceBuffer"), "resourceStateCommandEncoder");
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCountersResourceStateCommandEncoder;
  [(MTLToolsObject *)&v3 dealloc];
}

- (void)insertDebugSignpost:(id)a3
{
  -[MTLCountersTraceCommandEncoder insertDebugSignpost:](self->_traceEncoder, "insertDebugSignpost:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 insertDebugSignpost:a3];
}

- (void)pushDebugGroup:(id)a3
{
  -[MTLCountersTraceCommandEncoder pushDebugGroup:](self->_traceEncoder, "pushDebugGroup:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  [(MTLCountersTraceCommandEncoder *)self->_traceEncoder popDebugGroup];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 popDebugGroup];
}

- (void)setLabel:(id)a3
{
  -[MTLCountersTraceCommandEncoder setLabel:](self->_traceEncoder, "setLabel:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 setLabel:a3];
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  -[MTLCountersTraceResourceStateCommandEncoder updateTextureMappings:mode:regions:mipLevels:slices:numRegions:](self->_traceEncoder, "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:");
  id v15 = [(MTLToolsObject *)self baseObject];

  [v15 updateTextureMappings:a3 mode:a4 regions:a5 mipLevels:a6 slices:a7 numRegions:a8];
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  traceEncoder = self->_traceEncoder;
  long long v14 = *(_OWORD *)&a5->var0.var2;
  v18[0] = *(_OWORD *)&a5->var0.var0;
  v18[1] = v14;
  v18[2] = *(_OWORD *)&a5->var1.var1;
  -[MTLCountersTraceResourceStateCommandEncoder updateTextureMapping:mode:region:mipLevel:slice:](traceEncoder, "updateTextureMapping:mode:region:mipLevel:slice:", a3, a4, v18);
  id v15 = [(MTLToolsObject *)self baseObject];
  long long v16 = *(_OWORD *)&a5->var0.var2;
  v17[0] = *(_OWORD *)&a5->var0.var0;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&a5->var1.var1;
  [v15 updateTextureMapping:a3 mode:a4 region:v17 mipLevel:a6 slice:a7];
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  -[MTLCountersTraceResourceStateCommandEncoder updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:](self->_traceEncoder, "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:");
  id v11 = [(MTLToolsObject *)self baseObject];

  [v11 updateTextureMapping:a3 mode:a4 indirectBuffer:a5 indirectBufferOffset:a6];
}

- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8
{
  -[MTLCountersTraceResourceStateCommandEncoder copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:](self->_traceEncoder, "copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:");
  id v15 = [(MTLToolsObject *)self baseObject];

  [v15 copyMappingStateFromTexture:a3 mipLevel:a4 slice:a5 toBuffer:a6 offset:a7 numTiles:a8];
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  traceEncoder = self->_traceEncoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a11;
  -[MTLCountersTraceResourceStateCommandEncoder moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](traceEncoder, "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, &v25, &v24, a9, a10, &v23);
  id v19 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a11;
  [v19 moveTextureMappingsFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v22 sourceSize:&v21 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v20];
}

- (void)updateFence:(id)a3
{
  -[MTLCountersTraceResourceStateCommandEncoder updateFence:](self->_traceEncoder, "updateFence:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 updateFence:a3];
}

- (void)waitForFence:(id)a3
{
  -[MTLCountersTraceResourceStateCommandEncoder waitForFence:](self->_traceEncoder, "waitForFence:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 waitForFence:a3];
}

- (void)endEncoding
{
  [(MTLCountersTraceCommandEncoder *)self->_traceEncoder endEncoding];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 endEncoding];
}

@end