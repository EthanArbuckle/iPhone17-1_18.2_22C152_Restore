@interface NUMutablePixelBuffer
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (NUMutablePixelBuffer)initWithSize:(id)a3 format:(id)a4;
- (NUPixelFormat)format;
- (const)bytes;
- (const)bytesAtPoint:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newRenderDestination;
- (id)privateInit;
- (int64_t)rowBytes;
- (void)dealloc;
- (void)mutableBytes;
- (void)mutableBytesAtPoint:(id)a3;
@end

@implementation NUMutablePixelBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)debugQuickLookObject
{
  uint64_t v3 = [(NUMutablePixelBuffer *)self size];
  v5 = +[NUImageLayout contiguousLayoutForImageSize:](NUImageLayout, "contiguousLayoutForImageSize:", v3, v4);
  v6 = [(NUMutablePixelBuffer *)self format];
  v7 = +[NUColorSpace genericRGBLinearColorSpace];
  v8 = +[NUImageFactory bufferImageWithLayout:v5 format:v6 colorSpace:v7];

  v12[0] = 0;
  v12[1] = 0;
  v12[2] = [(NUMutablePixelBuffer *)self size];
  v12[3] = v9;
  +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v8, 0, 0, self, v12);
  id v10 = +[NUImageFactory newCIImageFromBufferImage:v8];

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NUMutablePixelBuffer alloc];
  uint64_t v5 = [(NUMutablePixelBuffer *)self size];
  uint64_t v7 = v6;
  v8 = [(NUMutablePixelBuffer *)self format];
  uint64_t v9 = -[NUMutablePixelBuffer initWithSize:format:](v4, "initWithSize:format:", v5, v7, v8);

  storage = v9->_storage;
  v11 = self->_storage;
  v15[0] = 0;
  v15[1] = 0;
  v15[2] = [(NUMutablePixelBuffer *)self size];
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
  uint64_t v8 = [(NUMutablePixelBuffer *)self size];
  uint64_t v10 = v9;
  v11 = [(NUMutablePixelBuffer *)self format];
  uint64_t v12 = objc_msgSend(v7, "newStorageWithSize:format:", v8, v10, v11);
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  v14 = *(void **)(v5 + 8);
  storage = self->_storage;
  v26[0] = 0;
  v26[1] = 0;
  v26[2] = [(NUMutablePixelBuffer *)self size];
  v26[3] = v16;
  v17 = +[NURegion regionWithRect:v26];
  [v14 copyFromStorage:storage region:v17];

  v18 = [NUBufferAdapter alloc];
  uint64_t v19 = [(NUMutablePixelBuffer *)self size];
  uint64_t v21 = v20;
  v22 = [(NUMutablePixelBuffer *)self format];
  uint64_t v23 = -[NUBufferAdapter initWithSize:format:rowBytes:bytes:](v18, "initWithSize:format:rowBytes:bytes:", v19, v21, v22, [*(id *)(v5 + 8) rowBytes], objc_msgSend(*(id *)(v5 + 8), "bytes"));
  v24 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v23;

  return (id)v5;
}

- (id)newRenderDestination
{
  v2 = (void *)[(NUMutableBuffer *)self->_buffer newRenderDestination];
  [v2 setLabel:@"NUPixelBuffer-new"];
  return v2;
}

- (id)privateInit
{
  v4.receiver = self;
  v4.super_class = (Class)NUMutablePixelBuffer;
  v2 = [(NUMutablePixelBuffer *)&v4 init];

  return v2;
}

- (void)mutableBytesAtPoint:(id)a3
{
  return (void *)-[NUMutableBuffer mutableBytesAtPoint:](self->_buffer, "mutableBytesAtPoint:", a3.var0, a3.var1);
}

- (const)bytesAtPoint:(id)a3
{
  return (const void *)-[NUMutableBuffer bytesAtPoint:](self->_buffer, "bytesAtPoint:", a3.var0, a3.var1);
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
  v7.super_class = (Class)NUMutablePixelBuffer;
  [(NUMutablePixelBuffer *)&v7 dealloc];
}

- (void)mutableBytes
{
  return (void *)[(NUMutableBuffer *)self->_buffer mutableBytes];
}

- (const)bytes
{
  return (const void *)[(NUMutableBuffer *)self->_buffer bytes];
}

- (int64_t)rowBytes
{
  return [(NUMutableBuffer *)self->_buffer rowBytes];
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)[(NUMutableBuffer *)self->_buffer format];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2 = [(NUMutableBuffer *)self->_buffer size];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NUMutablePixelBuffer)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v18 = NUAssertLogger_26747();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      *(_DWORD *)buf = 138543362;
      v37 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_26747();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        __int16 v38 = 2114;
        v39 = v29;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutablePixelBuffer initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPixelBuffer.m", 93, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"format != nil");
  }
  uint64_t v8 = v7;
  v35.receiver = self;
  v35.super_class = (Class)NUMutablePixelBuffer;
  uint64_t v9 = [(NUMutablePixelBuffer *)&v35 init];
  uint64_t v10 = +[NUFactory sharedFactory];
  v11 = [v10 bufferFactory];
  uint64_t v12 = objc_msgSend(v11, "newStorageWithSize:format:", var0, var1, v8);
  storage = v9->_storage;
  v9->_storage = (NUBufferStorage *)v12;

  v14 = v9->_storage;
  v34[0] = 0;
  v34[1] = 0;
  v34[2] = var0;
  v34[3] = var1;
  [(_NUAbstractStorage *)v14 validateRect:v34];
  v15 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:]([NUMutableBufferAdapter alloc], "initWithSize:format:rowBytes:mutableBytes:", var0, var1, v8, [(NUBufferStorage *)v9->_storage rowBytes], [(NUBufferStorage *)v9->_storage mutableBytes]);
  buffer = v9->_buffer;
  v9->_buffer = (NUMutableBuffer *)v15;

  return v9;
}

@end