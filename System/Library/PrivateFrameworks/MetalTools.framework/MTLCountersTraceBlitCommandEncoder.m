@interface MTLCountersTraceBlitCommandEncoder
- (id)init:(BinaryBuffer *)a3;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8;
- (void)generateMipmapsForTexture:(id)a3;
- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9;
- (void)optimizeContentsForCPUAccess:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForGPUAccess:(id)a3;
- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)synchronizeResource:(id)a3;
- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation MTLCountersTraceBlitCommandEncoder

- (id)init:(BinaryBuffer *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLCountersTraceBlitCommandEncoder;
  return [(MTLCountersTraceCommandEncoder *)&v4 init:a3 flags:1];
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  v21[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v21[1] = v21;
  __int16 __src = 1;
  char v9 = 109;
  id v10 = a3;
  char v11 = 100;
  unint64_t v12 = a4;
  char v13 = 109;
  id v14 = a5;
  char v15 = 100;
  unint64_t v16 = a6;
  char v17 = 100;
  unint64_t v18 = a7;
  char v19 = 16;
  v21[0] = &v20;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x30uLL);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  unint64_t v14 = a4;
  id v15 = a3;
  unint64_t v13 = a5;
  id v11 = a8;
  unint64_t v12 = a6;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long,MTLSize,objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin>((AppendBuffer *)self->super._stream, 1, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)a7, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  unint64_t v15 = a4;
  id v16 = a3;
  unint64_t v13 = a6;
  unint64_t v14 = a5;
  id v12 = a8;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long,MTLSize,objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,unsigned long>((AppendBuffer *)self->super._stream, 2, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)a7, (uint64_t *)&v12, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11, (uint64_t *)&a12);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  unint64_t v13 = a4;
  id v14 = a3;
  unint64_t v12 = a5;
  id v11 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto10MTLTexture},unsigned long,unsigned long,objc_object  {objcproto10MTLTexture}*>((AppendBuffer *)self->super._stream, 5, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  unint64_t v15 = a4;
  id v16 = a3;
  unint64_t v14 = a5;
  stream = self->super._stream;
  id v13 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto10MTLTexture},unsigned long,unsigned long,objc_object  {objcproto10MTLTexture}*,unsigned long>((AppendBuffer *)stream, 6, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v13, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11, (uint64_t *)&a12);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  unint64_t v13 = a4;
  id v14 = a3;
  unint64_t v12 = a5;
  id v11 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long>((AppendBuffer *)self->super._stream, 3, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)&a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  unint64_t v15 = a4;
  id v16 = a3;
  unint64_t v14 = a5;
  stream = self->super._stream;
  id v13 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long,unsigned long>((AppendBuffer *)stream, 4, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v13, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)&a11, (uint64_t *)&a12);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  _NSRange v7 = a4;
  id v6 = a3;
  unsigned __int8 v5 = a5;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,_NSRange,unsigned char>((AppendBuffer *)self->super._stream, 7, (uint64_t *)&v6, (uint64_t *)&v7, (char *)&v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  _NSRange v7 = a4;
  id v6 = a3;
  unsigned int v5 = a5;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,_NSRange,unsigned int>((AppendBuffer *)self->super._stream, 8, (uint64_t *)&v6, (uint64_t *)&v7, (int *)&v5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  unint64_t v11 = a4;
  id v12 = a3;
  char v9 = a7;
  unint64_t v10 = a5;
  unint64_t v8 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLRegion,void const*,unsigned long>((AppendBuffer *)self->super._stream, 9, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)a6, (uint64_t *)&v9, (uint64_t *)&v8);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v10 = a7;
  unint64_t v8 = a4;
  id v9 = a3;
  unint64_t v7 = a5;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLRegion,MTLClearColor>((AppendBuffer *)self->super._stream, 10, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7, (uint64_t *)a6, (uint64_t *)&v10);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v12 = a7;
  unint64_t v10 = a4;
  id v11 = a3;
  unint64_t v8 = a8;
  unint64_t v9 = a5;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLRegion,MTLClearColor,MTLPixelFormat>((AppendBuffer *)self->super._stream, 11, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)a6, (uint64_t *)&v12, (uint64_t *)&v8);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  unint64_t v15 = a4;
  id v16 = a3;
  unint64_t v14 = a5;
  unint64_t v12 = a7;
  id v13 = a6;
  stream = self->super._stream;
  unint64_t v11 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,objc_object  {objcproto10MTLTexture},unsigned long,unsigned long,unsigned long,unsigned long>((AppendBuffer *)stream, 12, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v12[1] = v12;
  __int16 __src = 3329;
  char v6 = 109;
  id v7 = a3;
  char v8 = 109;
  id v9 = a4;
  char v10 = 16;
  v12[0] = v11;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x15uLL);
}

- (void)generateMipmapsForTexture:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __int16 __src = 3585;
  char v5 = 109;
  id v6 = a3;
  char v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)synchronizeResource:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __int16 __src = 3841;
  char v5 = 109;
  id v6 = a3;
  char v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v15[1] = v15;
  __int16 __src = 4097;
  char v7 = 109;
  id v8 = a3;
  char v9 = 100;
  unint64_t v10 = a4;
  char v11 = 100;
  unint64_t v12 = a5;
  char v13 = 16;
  v15[0] = &v14;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x1EuLL);
}

- (void)updateFence:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __int16 __src = 29697;
  char v5 = 109;
  id v6 = a3;
  char v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)waitForFence:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __int16 __src = 32257;
  char v5 = 109;
  id v6 = a3;
  char v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __int16 __src = 4353;
  char v5 = 109;
  id v6 = a3;
  char v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v15[1] = v15;
  __int16 __src = 4609;
  char v7 = 109;
  id v8 = a3;
  char v9 = 100;
  unint64_t v10 = a4;
  char v11 = 100;
  unint64_t v12 = a5;
  char v13 = 16;
  v15[0] = &v14;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x1EuLL);
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __int16 __src = 4865;
  char v5 = 109;
  id v6 = a3;
  char v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v15[1] = v15;
  __int16 __src = 5121;
  char v7 = 109;
  id v8 = a3;
  char v9 = 100;
  unint64_t v10 = a4;
  char v11 = 100;
  unint64_t v12 = a5;
  char v13 = 16;
  v15[0] = &v14;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x1EuLL);
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  unint64_t v12 = a5;
  unint64_t v11 = a6;
  BOOL v10 = a7;
  id v9 = a8;
  BinaryBuffer::Append<MTLRegion,unsigned long,unsigned long,BOOL,objc_object  {objcproto9MTLBuffer}*,unsigned long>((AppendBuffer *)self->super._stream, 21, (uint64_t *)a4, (uint64_t *)&v12, (uint64_t *)&v11, &v10, (uint64_t *)&v9, (uint64_t *)&a9);
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  v10[2] = *MEMORY[0x263EF8340];
  stream = (AppendBuffer *)self->super._stream;
  v10[1] = v10;
  __int16 __src = 5633;
  char v8 = 16;
  v10[0] = v9;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 3uLL);
}

@end