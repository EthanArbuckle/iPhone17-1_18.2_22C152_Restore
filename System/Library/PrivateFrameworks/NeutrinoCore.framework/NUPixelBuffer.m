@interface NUPixelBuffer
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (NUPixelFormat)format;
- (const)bytes;
- (const)bytesAtPoint:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)privateInit;
- (int64_t)rowBytes;
- (void)dealloc;
@end

@implementation NUPixelBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)debugQuickLookObject
{
  uint64_t v3 = [(NUPixelBuffer *)self size];
  v5 = +[NUImageLayout contiguousLayoutForImageSize:](NUImageLayout, "contiguousLayoutForImageSize:", v3, v4);
  v6 = [(NUPixelBuffer *)self format];
  v7 = +[NUColorSpace genericRGBLinearColorSpace];
  v8 = +[NUImageFactory bufferImageWithLayout:v5 format:v6 colorSpace:v7];

  v12[0] = 0;
  v12[1] = 0;
  v12[2] = [(NUPixelBuffer *)self size];
  v12[3] = v9;
  +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v8, 0, 0, self, v12);
  id v10 = +[NUImageFactory newCIImageFromBufferImage:v8];

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NUMutablePixelBuffer alloc];
  uint64_t v5 = [(NUPixelBuffer *)self size];
  uint64_t v7 = v6;
  v8 = [(NUPixelBuffer *)self format];
  uint64_t v9 = -[NUMutablePixelBuffer initWithSize:format:](v4, "initWithSize:format:", v5, v7, v8);

  storage = v9->_storage;
  v11 = self->_storage;
  v15[0] = 0;
  v15[1] = 0;
  v15[2] = [(NUPixelBuffer *)self size];
  v15[3] = v12;
  v13 = +[NURegion regionWithRect:v15];
  [(_NUAbstractBufferStorage *)storage copyFromStorage:v11 region:v13];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NUPixelBuffer alloc];
  uint64_t v5 = [(NUPixelBuffer *)v4 privateInit];

  uint64_t v6 = +[NUFactory sharedFactory];
  uint64_t v7 = [v6 bufferFactory];
  uint64_t v8 = [(NUPixelBuffer *)self size];
  uint64_t v10 = v9;
  v11 = [(NUPixelBuffer *)self format];
  uint64_t v12 = objc_msgSend(v7, "newStorageWithSize:format:", v8, v10, v11);
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  v14 = *(void **)(v5 + 8);
  storage = self->_storage;
  v26[0] = 0;
  v26[1] = 0;
  v26[2] = [(NUPixelBuffer *)self size];
  v26[3] = v16;
  v17 = +[NURegion regionWithRect:v26];
  [v14 copyFromStorage:storage region:v17];

  v18 = [NUBufferAdapter alloc];
  uint64_t v19 = [(NUPixelBuffer *)self size];
  uint64_t v21 = v20;
  v22 = [(NUPixelBuffer *)self format];
  uint64_t v23 = -[NUBufferAdapter initWithSize:format:rowBytes:bytes:](v18, "initWithSize:format:rowBytes:bytes:", v19, v21, v22, [*(id *)(v5 + 8) rowBytes], objc_msgSend(*(id *)(v5 + 8), "bytes"));
  v24 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v23;

  return (id)v5;
}

- (id)privateInit
{
  v4.receiver = self;
  v4.super_class = (Class)NUPixelBuffer;
  v2 = [(NUPixelBuffer *)&v4 init];

  return v2;
}

- (const)bytesAtPoint:(id)a3
{
  return (const void *)-[NUBuffer bytesAtPoint:](self->_buffer, "bytesAtPoint:", a3.var0, a3.var1);
}

- (void)dealloc
{
  uint64_t v3 = +[NUFactory sharedFactory];
  objc_super v4 = [v3 bufferFactory];
  [v4 returnStorage:self->_storage];

  storage = self->_storage;
  self->_storage = 0;

  buffer = self->_buffer;
  self->_buffer = 0;

  v7.receiver = self;
  v7.super_class = (Class)NUPixelBuffer;
  [(NUPixelBuffer *)&v7 dealloc];
}

- (const)bytes
{
  return (const void *)[(NUBuffer *)self->_buffer bytes];
}

- (int64_t)rowBytes
{
  return [(NUBuffer *)self->_buffer rowBytes];
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)[(NUBuffer *)self->_buffer format];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2 = [(NUBuffer *)self->_buffer size];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end