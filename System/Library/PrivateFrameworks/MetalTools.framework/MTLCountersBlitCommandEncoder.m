@interface MTLCountersBlitCommandEncoder
- (MTLCountersBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)dealloc;
- (void)endEncoding;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8;
- (void)generateMipmapsForTexture:(id)a3;
- (void)insertDebugSignpost:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForGPUAccess:(id)a3;
- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation MTLCountersBlitCommandEncoder

- (MTLCountersBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLCountersBlitCommandEncoder;
  v6 = [(MTLToolsBlitCommandEncoder *)&v8 initWithBlitCommandEncoder:a3 parent:a4 descriptor:a5];
  if (v6) {
    v6->_traceEncoder = (MTLCountersTraceBlitCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a4, "traceBuffer"), "blitCommandEncoder");
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCountersBlitCommandEncoder;
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

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  traceEncoder = self->_traceEncoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a11;
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, &v25, &v24, a9, a10, &v23);
  id v19 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a11;
  [v19 copyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v22 sourceSize:&v21 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v20];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  traceEncoder = self->_traceEncoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a11;
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, &v26, &v25, a9, a10, &v24, a12);
  id v19 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a11;
  [v19 copyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v23 sourceSize:&v22 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v21 options:a12];
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  traceEncoder = self->_traceEncoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a11;
  -[MTLCountersTraceBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](traceEncoder, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, a6, &v23, a9, a10, &v22);
  id v19 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a11;
  [v19 copyFromBuffer:a3 sourceOffset:a4 sourceBytesPerRow:a5 sourceBytesPerImage:a6 sourceSize:&v21 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v20];
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  traceEncoder = self->_traceEncoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a11;
  -[MTLCountersTraceBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](traceEncoder, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v24, a9, a10, &v23, a12);
  id v19 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a11;
  [v19 copyFromBuffer:a3 sourceOffset:a4 sourceBytesPerRow:a5 sourceBytesPerImage:a6 sourceSize:&v22 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v21 options:a12];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  traceEncoder = self->_traceEncoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a7;
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", a3, a4, a5, &v23, &v22, a9, a10, a11);
  id v19 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a7;
  [v19 copyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v21 sourceSize:&v20 toBuffer:a8 destinationOffset:a9 destinationBytesPerRow:a10 destinationBytesPerImage:a11];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  traceEncoder = self->_traceEncoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a7;
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v24, &v23, a9, a10, a11, a12);
  id v19 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a7;
  [v19 copyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v22 sourceSize:&v21 toBuffer:a8 destinationOffset:a9 destinationBytesPerRow:a10 destinationBytesPerImage:a11 options:a12];
}

- (void)generateMipmapsForTexture:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder generateMipmapsForTexture:](self->_traceEncoder, "generateMipmapsForTexture:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 generateMipmapsForTexture:a3];
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLCountersTraceBlitCommandEncoder fillBuffer:range:value:](self->_traceEncoder, "fillBuffer:range:value:");
  id v10 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v10, "fillBuffer:range:value:", a3, location, length, v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLCountersTraceBlitCommandEncoder fillBuffer:range:pattern4:](self->_traceEncoder, "fillBuffer:range:pattern4:");
  id v10 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v10, "fillBuffer:range:pattern4:", a3, location, length, v5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  traceEncoder = self->_traceEncoder;
  long long v16 = *(_OWORD *)&a6->var0.var2;
  v20[0] = *(_OWORD *)&a6->var0.var0;
  v20[1] = v16;
  v20[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLCountersTraceBlitCommandEncoder fillTexture:level:slice:region:bytes:length:](traceEncoder, "fillTexture:level:slice:region:bytes:length:", a3, a4, a5, v20);
  id v17 = [(MTLToolsObject *)self baseObject];
  long long v18 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v18;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  [v17 fillTexture:a3 level:a4 slice:a5 region:v19 bytes:a7 length:a8];
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  traceEncoder = self->_traceEncoder;
  long long v17 = *(_OWORD *)&a6->var0.var2;
  v21[0] = *(_OWORD *)&a6->var0.var0;
  v21[1] = v17;
  v21[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLCountersTraceBlitCommandEncoder fillTexture:level:slice:region:color:](traceEncoder, "fillTexture:level:slice:region:color:", a3, a4, a5, v21, a7.var0, var1);
  id v18 = [(MTLToolsObject *)self baseObject];
  long long v19 = *(_OWORD *)&a6->var0.var2;
  v20[0] = *(_OWORD *)&a6->var0.var0;
  v20[1] = v19;
  v20[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v18, "fillTexture:level:slice:region:color:", a3, a4, a5, v20, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  traceEncoder = self->_traceEncoder;
  long long v19 = *(_OWORD *)&a6->var0.var2;
  v23[0] = *(_OWORD *)&a6->var0.var0;
  v23[1] = v19;
  v23[2] = *(_OWORD *)&a6->var1.var1;
  [(MTLCountersTraceBlitCommandEncoder *)traceEncoder fillTexture:a3 level:a4 slice:a5 region:v23 color:a7.var0 pixelFormat:var1];
  id v20 = [(MTLToolsObject *)self baseObject];
  long long v21 = *(_OWORD *)&a6->var0.var2;
  v22[0] = *(_OWORD *)&a6->var0.var0;
  v22[1] = v21;
  v22[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v20, "fillTexture:level:slice:region:color:pixelFormat:", a3, a4, a5, v22, a8, var0, var1, var2, var3);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:](self->_traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", a9, a10);
  id v17 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v17, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", a3, a4, a5, a6, a7, a8);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:toTexture:](self->_traceEncoder, "copyFromTexture:toTexture:");
  id v7 = [(MTLToolsObject *)self baseObject];

  [v7 copyFromTexture:a3 toTexture:a4];
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  -[MTLCountersTraceBlitCommandEncoder copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:](self->_traceEncoder, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:");
  id v13 = [(MTLToolsObject *)self baseObject];

  [v13 copyFromBuffer:a3 sourceOffset:a4 toBuffer:a5 destinationOffset:a6 size:a7];
}

- (void)updateFence:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder updateFence:](self->_traceEncoder, "updateFence:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 updateFence:a3];
}

- (void)waitForFence:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder waitForFence:](self->_traceEncoder, "waitForFence:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 waitForFence:a3];
}

- (void)endEncoding
{
  [(MTLCountersTraceCommandEncoder *)self->_traceEncoder endEncoding];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 endEncoding];
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForGPUAccess:](self->_traceEncoder, "optimizeContentsForGPUAccess:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 optimizeContentsForGPUAccess:a3];
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForGPUAccess:slice:level:](self->_traceEncoder, "optimizeContentsForGPUAccess:slice:level:");
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 optimizeContentsForGPUAccess:a3 slice:a4 level:a5];
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForCPUAccess:](self->_traceEncoder, "optimizeContentsForCPUAccess:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 optimizeContentsForCPUAccess:a3];
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForCPUAccess:slice:level:](self->_traceEncoder, "optimizeContentsForCPUAccess:slice:level:");
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 optimizeContentsForCPUAccess:a3 slice:a4 level:a5];
}

@end