@interface QLPlatformImage
+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5;
+ (id)imageWithUIImage:(id)a3;
- (CGImage)CGImage;
- (CGSize)size;
- (UIImage)UIImage;
- (double)scale;
- (id)cleanupDataBlock;
- (unsigned)orientation;
- (void)dealloc;
- (void)setCGImage:(CGImage *)a3;
- (void)setCleanupDataBlock:(id)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation QLPlatformImage

- (void)dealloc
{
  v3 = [(QLPlatformImage *)self cleanupDataBlock];

  if (v3)
  {
    v4 = [(QLPlatformImage *)self cleanupDataBlock];
    v4[2]();

    [(QLPlatformImage *)self setCleanupDataBlock:0];
  }
  cgImage = self->_cgImage;
  if (cgImage) {
    CGImageRelease(cgImage);
  }
  v6.receiver = self;
  v6.super_class = (Class)QLPlatformImage;
  [(QLPlatformImage *)&v6 dealloc];
}

- (void)setCGImage:(CGImage *)a3
{
  cgImage = self->_cgImage;
  if (cgImage != a3)
  {
    CGImageRelease(cgImage);
    self->_cgImage = CGImageRetain(a3);
    double Width = (double)CGImageGetWidth(a3);
    double Height = (double)CGImageGetHeight(a3);
    -[QLPlatformImage setSize:](self, "setSize:", Width, Height);
  }
}

- (CGImage)CGImage
{
  return self->_cgImage;
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = objc_alloc_init(QLPlatformImage);
  [(QLPlatformImage *)v8 setCGImage:a3];
  [(QLPlatformImage *)v8 setScale:a4];
  [(QLPlatformImage *)v8 setOrientation:v5];
  return v8;
}

+ (id)imageWithUIImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && (id v6 = v4, [v6 CGImage]))
  {
    unint64_t v7 = [v6 imageOrientation];
    if (v7 > 7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = dword_217F4A420[v7];
    }
    id v10 = v6;
    uint64_t v11 = [v10 CGImage];
    [v10 scale];
    v9 = objc_msgSend(a1, "imageWithCGImage:scale:orientation:", v11, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIImage)UIImage
{
  v3 = (void *)QLTImageClassWithError();
  id v4 = [(QLPlatformImage *)self CGImage];
  [(QLPlatformImage *)self scale];
  double v6 = v5;
  unsigned int v7 = [(QLPlatformImage *)self orientation] - 2;
  if (v7 > 6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = dword_217F4A440[v7];
  }
  return (UIImage *)[v3 imageWithCGImage:v4 scale:v8 orientation:v6];
}

- (id)cleanupDataBlock
{
  return self->_cleanupDataBlock;
}

- (void)setCleanupDataBlock:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
}

@end