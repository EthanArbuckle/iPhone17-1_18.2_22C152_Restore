@interface PVMTLTextureImageBufferImpl
- (BOOL)canCreateCVPixelBuffer;
- (BOOL)canCreateHGBitmap;
- (BOOL)cvPixelBufferRequiresCopy;
- (BOOL)cvPixelBufferRequiresRender;
- (CGImage)cgImage;
- (CGSize)size;
- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3;
- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3;
- (PVMTLTextureImageBufferImpl)initWithMTLTexture:(id)a3;
@end

@implementation PVMTLTextureImageBufferImpl

- (PVMTLTextureImageBufferImpl)initWithMTLTexture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PVMTLTextureImageBufferImpl;
  v6 = [(PVMTLTextureImageBufferImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mtlTexture, a3);
  }

  return v7;
}

- (CGImage)cgImage
{
  return 0;
}

- (BOOL)canCreateCVPixelBuffer
{
  return 0;
}

- (BOOL)canCreateHGBitmap
{
  return 1;
}

- (BOOL)cvPixelBufferRequiresCopy
{
  return 1;
}

- (BOOL)cvPixelBufferRequiresRender
{
  return 0;
}

- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3
{
  void *v3 = 0;
  return (HGRef<HGCVPixelBuffer>)self;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  v4 = v3;
  id v5 = HGMetalTexture::createFromTexture(self->_mtlTexture, &v6);
  void *v4 = v6;
  return (HGRef<HGBitmap>)v5;
}

- (CGSize)size
{
  double v3 = (double)(unint64_t)[(MTLTexture *)self->_mtlTexture width];
  double v4 = (double)(unint64_t)[(MTLTexture *)self->_mtlTexture height];
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
}

@end