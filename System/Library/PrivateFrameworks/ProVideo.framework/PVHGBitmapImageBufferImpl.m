@interface PVHGBitmapImageBufferImpl
- (BOOL)canCreateCVPixelBuffer;
- (BOOL)canCreateHGBitmap;
- (BOOL)cvPixelBufferRequiresCopy;
- (BOOL)cvPixelBufferRequiresRender;
- (CGImage)cgImage;
- (CGSize)size;
- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3;
- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3;
- (PVHGBitmapImageBufferImpl)initWithHGBitmap:(HGRef<HGBitmap>)a3;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation PVHGBitmapImageBufferImpl

- (PVHGBitmapImageBufferImpl)initWithHGBitmap:(HGRef<HGBitmap>)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PVHGBitmapImageBufferImpl;
  v4 = [(PVHGBitmapImageBufferImpl *)&v9 init];
  v5 = v4;
  if (v4)
  {
    m_Obj = v4->_bitmap.m_Obj;
    v7 = *(HGBitmap **)a3.m_Obj;
    if (m_Obj != *(HGBitmap **)a3.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGBitmap *))(*(void *)m_Obj + 24))(v5->_bitmap.m_Obj);
        v7 = *(HGBitmap **)a3.m_Obj;
      }
      v5->_bitmap.m_Obj = v7;
      if (v7) {
        (*(void (**)(HGBitmap *))(*(void *)v7 + 16))(v7);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  generatedCGImage = self->_generatedCGImage;
  if (generatedCGImage) {
    CGImageRelease(generatedCGImage);
  }
  self->_generatedCGImage = 0;
  v4.receiver = self;
  v4.super_class = (Class)PVHGBitmapImageBufferImpl;
  [(PVHGBitmapImageBufferImpl *)&v4 dealloc];
}

- (CGImage)cgImage
{
  generatedCGImage = self->_generatedCGImage;
  if (!generatedCGImage)
  {
    objc_super v4 = +[PVColorSpace sRGBColorSpace];
    Storage = (const void *)HGBitmap::GetStorage(self->_bitmap.m_Obj);
    if (Storage)
    {
      if (v6)
      {
        if (v6[3])
        {
          v7 = (PVColorSpace *)v6[3];

          objc_super v4 = v7;
        }
      }
    }
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    CGColorSpaceRef space = 0;
    PVImagePropertiesForColorSpace(v4, 0, (uint64_t)&v12);
    m_Obj = self->_bitmap.m_Obj;
    if (m_Obj)
    {
      (*(void (**)(HGBitmap *))(*(void *)m_Obj + 16))(m_Obj);
      objc_super v9 = self->_bitmap.m_Obj;
    }
    else
    {
      objc_super v9 = 0;
    }
    v10 = CGDataProviderCreateWithData(v9, *((const void **)v9 + 10), *((void *)v9 + 8) * (*((_DWORD *)v9 + 8) - *((_DWORD *)v9 + 6)), (CGDataProviderReleaseDataCallback)freeUnderlyingHGBitmap);
    generatedCGImage = CGImageCreate((*((_DWORD *)v9 + 7) - *((_DWORD *)v9 + 5)), (*((_DWORD *)v9 + 8) - *((_DWORD *)v9 + 6)), SHIDWORD(v12), 4 * SHIDWORD(v12), *((void *)v9 + 8), space, v13, v10, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v10);
    self->_generatedCGImage = generatedCGImage;
  }
  return generatedCGImage;
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
  m_Obj = self->_bitmap.m_Obj;
  void *v3 = m_Obj;
  if (m_Obj) {
    return (HGRef<HGBitmap>)(*(uint64_t (**)(void))(*(void *)m_Obj + 16))();
  }
  return (HGRef<HGBitmap>)m_Obj;
}

- (CGSize)size
{
  double v2 = (double)(*((_DWORD *)self->_bitmap.m_Obj + 7) - *((_DWORD *)self->_bitmap.m_Obj + 5));
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  m_Obj = self->_bitmap.m_Obj;
  if (m_Obj) {
    (*(void (**)(HGBitmap *, SEL))(*(void *)m_Obj + 24))(m_Obj, a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end