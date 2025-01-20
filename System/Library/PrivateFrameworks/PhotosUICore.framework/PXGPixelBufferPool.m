@interface PXGPixelBufferPool
+ (id)pixelBufferPoolWithSize:(CGSize)a3 format:(unsigned int)a4;
- (CGColorSpace)colorSpace;
- (CGSize)pixelSize;
- (PXGPixelBufferPool)init;
- (PXGPixelBufferPool)initWithPixelBufferPool:(__CVPixelBufferPool *)a3;
- (__CVPixelBufferPool)pixelBufferPool;
- (unsigned)pixelFormatType;
- (void)dealloc;
@end

@implementation PXGPixelBufferPool

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  CVPixelBufferPoolRef v2 = CVPixelBufferPoolRetain(self->_pixelBufferPool);
  CFAutorelease(v2);
  return v2;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PXGPixelBufferPool;
  [(PXGPixelBufferPool *)&v3 dealloc];
}

- (PXGPixelBufferPool)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGPixelBufferPool.m", 58, @"%s is not available as initializer", "-[PXGPixelBufferPool init]");

  abort();
}

- (PXGPixelBufferPool)initWithPixelBufferPool:(__CVPixelBufferPool *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PXGPixelBufferPool;
  v5 = [(PXGPixelBufferPool *)&v18 init];
  if (v5)
  {
    if (!a3)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v5, @"PXGPixelBufferPool.m", 40, @"Invalid parameter not satisfying: %@", @"pixelBufferPool != NULL" object file lineNumber description];
    }
    v5->_pixelBufferPool = CVPixelBufferPoolRetain(a3);
    v6 = CVPixelBufferPoolGetPixelBufferAttributes(a3);
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
    uint64_t v8 = [v7 integerValue];

    v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
    uint64_t v10 = [v9 integerValue];

    if (v8 < 1 || v10 <= 0)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v5, @"PXGPixelBufferPool.m", 46, @"Invalid parameter not satisfying: %@", @"width > 0 && height > 0" object file lineNumber description];
    }
    v5->_pixelSize.double width = (double)v8;
    v5->_pixelSize.double height = (double)v10;
    v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    v5->_pixelFormatType = [v12 unsignedIntValue];

    if (!v5->_pixelFormatType)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v5, @"PXGPixelBufferPool.m", 50, @"Invalid parameter not satisfying: %@", @"_pixelFormatType != 0" object file lineNumber description];
    }
    v13 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F24A00]];
    v5->_colorSpace = CGColorSpaceRetain(v13);
  }
  return v5;
}

+ (id)pixelBufferPoolWithSize:(CGSize)a3 format:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.height;
  v16[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F24D20];
  v15[0] = *MEMORY[0x1E4F24D40];
  v15[1] = v6;
  v16[0] = MEMORY[0x1E4F1CC38];
  v16[1] = MEMORY[0x1E4F1CC08];
  v15[2] = *MEMORY[0x1E4F24E10];
  v7 = [NSNumber numberWithDouble:a3.width];
  v16[2] = v7;
  v15[3] = *MEMORY[0x1E4F24D08];
  uint64_t v8 = [NSNumber numberWithDouble:height];
  v16[3] = v8;
  v15[4] = *MEMORY[0x1E4F24D70];
  v9 = [NSNumber numberWithUnsignedInt:v4];
  v15[5] = *MEMORY[0x1E4F24D80];
  v16[4] = v9;
  v16[5] = &unk_1F02D59B0;
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];

  CVPixelBufferPoolRef pixelBufferPool = 0;
  v11 = 0;
  if (!CVPixelBufferPoolCreate(0, 0, v10, &pixelBufferPool))
  {
    v12 = [PXGPixelBufferPool alloc];
    v11 = [(PXGPixelBufferPool *)v12 initWithPixelBufferPool:pixelBufferPool];
    CVPixelBufferPoolRelease(pixelBufferPool);
  }

  return v11;
}

@end