@interface MTLToolsBlitCommandEncoder
- (MTLToolsBlitCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLToolsBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8;
- (void)generateMipmapsForTexture:(id)a3;
- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9;
- (void)invalidateCompressedTexture:(id)a3;
- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForCPUAccess:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForGPUAccess:(id)a3;
- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation MTLToolsBlitCommandEncoder

- (MTLToolsBlitCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  return [(MTLToolsBlitCommandEncoder *)self initWithBlitCommandEncoder:a3 parent:a4 descriptor:0];
}

- (MTLToolsBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLToolsBlitCommandEncoder;
  v6 = [(MTLToolsCommandEncoder *)&v10 initWithBaseObject:a3 parent:a4];
  v7 = v6;
  if (a5 && v6)
  {
    for (uint64_t i = 0; i != 4; ++i)
      -[MTLToolsCommandEncoder addRetainedObject:](v7, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v7;
}

- (void)updateFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 updateFence:v6];
}

- (void)waitForFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 waitForFence:v6];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a7;
  uint64_t v20 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a11;
  [v18 copyFromTexture:v19 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v23 sourceSize:&v22 toTexture:v20 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v21];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a7;
  uint64_t v20 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a11;
  [v18 copyFromTexture:v19 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v24 sourceSize:&v23 toTexture:v20 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v22 options:a12];
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a7;
  uint64_t v20 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a11;
  [v18 copyFromBuffer:v19 sourceOffset:a4 sourceBytesPerRow:a5 sourceBytesPerImage:a6 sourceSize:&v22 toTexture:v20 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v21];
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a7;
  uint64_t v20 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a11;
  [v18 copyFromBuffer:v19 sourceOffset:a4 sourceBytesPerRow:a5 sourceBytesPerImage:a6 sourceSize:&v23 toTexture:v20 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v22 options:a12];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a7;
  objc_msgSend(v18, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v19, a4, a5, &v21, &v20, objc_msgSend(a8, "baseObject"), a9, a10, a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v19 = [(MTLToolsObject *)self baseObject];
  uint64_t v20 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a7;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", v20, a4, a5, &v22, &v21, objc_msgSend(a8, "baseObject"), a9, a10, a11, a12);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a5];
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a3 baseObject];
  uint64_t v15 = [a5 baseObject];

  [v13 copyFromBuffer:v14 sourceOffset:a4 toBuffer:v15 destinationOffset:a6 size:a7];
}

- (void)generateMipmapsForTexture:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 generateMipmapsForTexture:v6];
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  objc_msgSend(v10, "fillBuffer:range:value:", v11, location, length, v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  objc_msgSend(v10, "fillBuffer:range:pattern4:", v11, location, length, v5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  long long v17 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  [v15 fillTexture:v16 level:a4 slice:a5 region:v18 bytes:a7 length:a8];
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v16 = [(MTLToolsObject *)self baseObject];
  uint64_t v17 = [a3 baseObject];
  long long v18 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v18;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v16, "fillTexture:level:slice:region:color:", v17, a4, a5, v19, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  long long v20 = *(_OWORD *)&a6->var0.var2;
  v21[0] = *(_OWORD *)&a6->var0.var0;
  v21[1] = v20;
  v21[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v18, "fillTexture:level:slice:region:color:pixelFormat:", v19, a4, a5, v21, a8, var0, var1, var2, var3);
}

- (void)invalidateCompressedTexture:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 invalidateCompressedTexture:v6];
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 invalidateCompressedTexture:v10 slice:a4 level:a5];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a3 baseObject];
  uint64_t v19 = [a6 baseObject];

  objc_msgSend(v17, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", v18, a4, a5, v19, a7, a8);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a4];
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];
  uint64_t v9 = [a4 baseObject];

  [v7 copyFromTexture:v8 toTexture:v9];
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  BOOL v10 = a7;
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  long long v17 = *(_OWORD *)&a4->var0.var2;
  v18[0] = *(_OWORD *)&a4->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v15, "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:", v16, v18, a5, a6, v10, objc_msgSend(a8, "baseObject"), a9);
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];
  long long v12 = *(_OWORD *)&a4->var0.var2;
  v13[0] = *(_OWORD *)&a4->var0.var0;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a4->var1.var1;
  [v10 resetTextureAccessCounters:v11 region:v13 mipLevel:a5 slice:a6];
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 optimizeContentsForGPUAccess:v6];
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 optimizeContentsForGPUAccess:v10 slice:a4 level:a5];
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 optimizeContentsForCPUAccess:v6];
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 optimizeContentsForCPUAccess:v10 slice:a4 level:a5];
}

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  objc_msgSend(v8, "resetCommandsInBuffer:withRange:", v9, location, length);
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a5];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  uint64_t v14 = [a5 baseObject];

  objc_msgSend(v12, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", v13, location, length, v14, a6);
}

- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  objc_msgSend(v8, "optimizeIndirectCommandBuffer:withRange:", v9, location, length);
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a5];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  uint64_t v14 = [a5 baseObject];

  objc_msgSend(v12, "resolveCounters:inRange:destinationBuffer:destinationOffset:", v13, location, length, v14, a6);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 sampleCountersInBuffer:v10 atSampleIndex:a4 withBarrier:v5];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 endEncodingAndRetrieveProgramAddressTable];
}

@end