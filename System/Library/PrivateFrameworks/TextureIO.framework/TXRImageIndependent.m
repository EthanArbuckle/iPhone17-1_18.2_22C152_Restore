@interface TXRImageIndependent
- (BOOL)exportToURL:(id)a3 uttype:(__CFString *)a4 error:(id *)a5;
- (CGImage)newCGImageWithColorSpace:(CGColorSpace *)a3 error:(id *)a4;
- (TXRImageIndependent)initWithCGImage:(CGImage *)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
- (TXRImageIndependent)initWithCGImage:(CGImage *)a3 pixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7;
- (TXRImageIndependent)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(id)a5 bufferAllocator:;
- (TXRImageIndependent)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(unint64_t)a5 bytesPerRow:(unint64_t)a6 bytesPerImage:(id)a7 buffer:(unint64_t)a8 offset:;
- (TXRImageIndependent)initWithImage:(id)a3 dimensions:(unint64_t)a4 pixelFormat:;
- (TXRImageIndependent)initWithImage:(id)a3 dimensions:(unint64_t)a4 pixelFormat:(unint64_t)a5 alphaInfo:;
- (__n128)dimensions;
- (unint64_t)alphaInfo;
- (unint64_t)pixelFormat;
- (void)setAlphaInfo:(unint64_t)a3;
@end

@implementation TXRImageIndependent

- (TXRImageIndependent)initWithImage:(id)a3 dimensions:(unint64_t)a4 pixelFormat:(unint64_t)a5 alphaInfo:
{
  long long v15 = v5;
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TXRImageIndependent;
  v10 = [(TXRImageIndependent *)&v16 init];
  v11 = v10;
  if (v10)
  {
    *(_OWORD *)v10->_dimensions = v15;
    v10->_pixelFormat = a4;
    v10->_alphaInfo = a5;
    v10->super._bytesPerRow = [v9 bytesPerRow];
    v11->super._bytesPerImage = [v9 bytesPerImage];
    uint64_t v12 = [v9 buffer];
    buffer = v11->super._buffer;
    v11->super._buffer = (TXRBuffer *)v12;

    v11->super._offset = [v9 offset];
  }

  return v11;
}

- (TXRImageIndependent)initWithImage:(id)a3 dimensions:(unint64_t)a4 pixelFormat:
{
  return -[TXRImageIndependent initWithImage:dimensions:pixelFormat:alphaInfo:](self, "initWithImage:dimensions:pixelFormat:alphaInfo:", a3, a4, 0);
}

- (TXRImageIndependent)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(unint64_t)a5 bytesPerRow:(unint64_t)a6 bytesPerImage:(id)a7 buffer:(unint64_t)a8 offset:
{
  long long v20 = v8;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TXRImageIndependent;
  v17 = [(TXRImageIndependent *)&v21 init];
  v18 = v17;
  if (v17)
  {
    *(void *)v17->_dimensions = v20;
    *(_DWORD *)&v17->_dimensions[8] = DWORD2(v20);
    v17->_pixelFormat = a3;
    v17->_alphaInfo = a4;
    v17->super._bytesPerRow = a5;
    v17->super._bytesPerImage = a6;
    objc_storeStrong((id *)&v17->super._buffer, a7);
    v18->super._offset = a8;
  }

  return v18;
}

- (TXRImageIndependent)initWithCGImage:(CGImage *)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  v10 = (TXRDefaultBufferAllocator *)a4;
  id v11 = a5;
  if (!v10) {
    v10 = objc_alloc_init(TXRDefaultBufferAllocator);
  }
  uint64_t v12 = +[TXRParserImageIO decodeCGImage:a3 desiredPixelFormat:0 bufferAllocator:v10 options:v11 error:a6];

  return v12;
}

- (TXRImageIndependent)initWithCGImage:(CGImage *)a3 pixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v12 = (TXRDefaultBufferAllocator *)a5;
  id v13 = a6;
  if (!v12) {
    uint64_t v12 = objc_alloc_init(TXRDefaultBufferAllocator);
  }
  v14 = +[TXRParserImageIO decodeCGImage:a3 desiredPixelFormat:a4 bufferAllocator:v12 options:v13 error:a7];

  if (v14 && v14->_pixelFormat != a4)
  {
    id v15 = +[TXRDataConverter newImageFromSourceImage:v14 newPixelFormat:a4 bufferAllocator:v12 multiplyAlpha:0 gammaDegamma:0 error:a7];
    [(TXRImageIndependent *)v14 dimensions];
    v14 = [(TXRImageIndependent *)v14 initWithImage:v15 dimensions:a4 pixelFormat:[(TXRImageIndependent *)v14 alphaInfo] alphaInfo:v16];
  }
  return v14;
}

- (TXRImageIndependent)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(id)a5 bufferAllocator:
{
  long long v16 = v5;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TXRImageIndependent;
  v10 = [(TXRImageIndependent *)&v17 init];
  id v11 = v10;
  if (v10)
  {
    *(_OWORD *)v10->_dimensions = v16;
    v10->_pixelFormat = a3;
    v10->_alphaInfo = a4;
    v10->super._bytesPerRow = +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:](TXRPixelFormatInfo, "packedMemoryLayoutForFormat:dimensions:", a3);
    v11->super._bytesPerImage = v12;
    uint64_t v13 = [v9 newBufferWithLength:v12 * DWORD2(v16)];
    buffer = v11->super._buffer;
    v11->super._buffer = (TXRBuffer *)v13;

    v11->super._offset = 0;
  }

  return v11;
}

- (BOOL)exportToURL:(id)a3 uttype:(__CFString *)a4 error:(id *)a5
{
  return +[TXRParserImageIO exportImage:self url:a3 uttype:a4 colorSpace:0 orientation:1 error:a5];
}

- (CGImage)newCGImageWithColorSpace:(CGColorSpace *)a3 error:(id *)a4
{
  return +[TXRParserImageIO newCGImageFromImage:self colorSpace:a3 error:a4];
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void)setAlphaInfo:(unint64_t)a3
{
  self->_alphaInfo = a3;
}

- (__n128)dimensions
{
  return a1[6];
}

@end