@interface PVCVPixelBufferImageBufferImpl
- (BOOL)canCreateCVPixelBuffer;
- (BOOL)canCreateHGBitmap;
- (BOOL)cvPixelBufferRequiresCopy;
- (BOOL)cvPixelBufferRequiresRender;
- (CGImage)cgImage;
- (CGSize)size;
- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3;
- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3;
- (PVCVPixelBufferImageBufferImpl)initWithCVPixelBuffer:(__CVBuffer *)a3;
- (PVCVPixelBufferImageBufferImpl)initWithCVPixelBuffer:(__CVBuffer *)a3 withSourceColorSpace:(id)a4;
- (PVCVPixelBufferImageBufferImpl)initWithHGCVPixelBuffer:(HGRef<HGCVPixelBuffer>)a3;
- (PVColorSpace)sourceColorSpace;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation PVCVPixelBufferImageBufferImpl

- (PVCVPixelBufferImageBufferImpl)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  v4 = [(PVCVPixelBufferImageBufferImpl *)&v9 init];
  if (v4)
  {
    HGCVPixelBuffer::create((HGCVPixelBuffer *)a3, &v8);
    m_Obj = (HGObject *)v4->_pixelBuffer.m_Obj;
    v6 = v8;
    if (m_Obj == v8)
    {
      if (m_Obj) {
        (*(void (**)(HGObject *))(*(void *)m_Obj + 24))(m_Obj);
      }
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(HGObject *))(*(void *)m_Obj + 24))(m_Obj);
        v6 = v8;
      }
      v4->_pixelBuffer.m_Obj = (HGCVPixelBuffer *)v6;
    }
  }
  return v4;
}

- (PVCVPixelBufferImageBufferImpl)initWithHGCVPixelBuffer:(HGRef<HGCVPixelBuffer>)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  v4 = [(PVCVPixelBufferImageBufferImpl *)&v9 init];
  v5 = v4;
  if (v4)
  {
    m_Obj = v4->_pixelBuffer.m_Obj;
    v7 = *(HGCVPixelBuffer **)a3.m_Obj;
    if (m_Obj != *(HGCVPixelBuffer **)a3.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGCVPixelBuffer *))(*(void *)m_Obj + 24))(v5->_pixelBuffer.m_Obj);
        v7 = *(HGCVPixelBuffer **)a3.m_Obj;
      }
      v5->_pixelBuffer.m_Obj = v7;
      if (v7) {
        (*(void (**)(HGCVPixelBuffer *))(*(void *)v7 + 16))(v7);
      }
    }
  }
  return v5;
}

- (PVCVPixelBufferImageBufferImpl)initWithCVPixelBuffer:(__CVBuffer *)a3 withSourceColorSpace:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  v8 = [(PVCVPixelBufferImageBufferImpl *)&v13 init];
  if (v8)
  {
    HGCVPixelBuffer::create((HGCVPixelBuffer *)a3, &v12);
    m_Obj = (HGObject *)v8->_pixelBuffer.m_Obj;
    v10 = v12;
    if (m_Obj == v12)
    {
      if (m_Obj) {
        (*(void (**)(HGObject *))(*(void *)m_Obj + 24))(m_Obj);
      }
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(HGObject *))(*(void *)m_Obj + 24))(m_Obj);
        v10 = v12;
      }
      v8->_pixelBuffer.m_Obj = (HGCVPixelBuffer *)v10;
    }
    objc_storeStrong((id *)&v8->_sourceColorSpace, a4);
  }

  return v8;
}

- (void)dealloc
{
  generatedCGImage = self->_generatedCGImage;
  if (generatedCGImage) {
    CGImageRelease(generatedCGImage);
  }
  self->_generatedCGImage = 0;
  v4.receiver = self;
  v4.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  [(PVCVPixelBufferImageBufferImpl *)&v4 dealloc];
}

- (CGImage)cgImage
{
  generatedCGImage = self->_generatedCGImage;
  if (generatedCGImage) {
    return generatedCGImage;
  }
  CFTypeRef v4 = CVBufferCopyAttachment(*((CVBufferRef *)self->_pixelBuffer.m_Obj + 3), (CFStringRef)*MEMORY[0x1E4F24A90], 0);
  CFTypeRef v5 = CVBufferCopyAttachment(*((CVBufferRef *)self->_pixelBuffer.m_Obj + 3), (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  if (!v4) {
    goto LABEL_11;
  }
  if (CFEqual(v4, (CFTypeRef)*MEMORY[0x1E4F24AC0]))
  {
    uint64_t v6 = +[PVColorSpace p3d65GammaColorSpace];
    goto LABEL_12;
  }
  if (CFEqual(v4, (CFTypeRef)*MEMORY[0x1E4F24AB0]))
  {
LABEL_11:
    uint64_t v6 = +[PVColorSpace sRGBColorSpace];
    goto LABEL_12;
  }
  if (!v5 || !CFEqual(v4, (CFTypeRef)*MEMORY[0x1E4F24AA8]))
  {
    uint64_t v7 = objc_opt_class();
    NSLog(&cfstr_PUnknownColorP.isa, v7, self, v4);
    goto LABEL_11;
  }
  if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F24BD8]))
  {
    uint64_t v6 = +[PVColorSpace rec2100HLGColorSpace];
  }
  else
  {
    if (!CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F24BE8]))
    {
      v8 = 0;
      goto LABEL_13;
    }
    uint64_t v6 = +[PVColorSpace rec2020LinearColorSpace];
  }
LABEL_12:
  v8 = (PVColorSpace *)v6;
LABEL_13:
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  PVImagePropertiesForColorSpace(v8, 0, (uint64_t)&v14);
  m_Obj = self->_pixelBuffer.m_Obj;
  objc_super v13 = m_Obj;
  if (m_Obj) {
    (*(void (**)(HGCVPixelBuffer *))(*(void *)m_Obj + 16))(m_Obj);
  }
  long long v11 = v14;
  uint64_t v12 = v15;
  self->_generatedCGImage = PVCreateCGImageRefFromCVPixelBuffer(&v13, (uint64_t)&v11);
  if (v13) {
    (*(void (**)(HGCVPixelBuffer *))(*(void *)v13 + 24))(v13);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v5) {
    CFRelease(v5);
  }
  generatedCGImage = self->_generatedCGImage;

  return generatedCGImage;
}

- (BOOL)canCreateCVPixelBuffer
{
  return 1;
}

- (BOOL)canCreateHGBitmap
{
  return 0;
}

- (BOOL)cvPixelBufferRequiresCopy
{
  return 0;
}

- (BOOL)cvPixelBufferRequiresRender
{
  return self->_sourceColorSpace != 0;
}

- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3
{
  CFTypeRef v5 = v3;
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_pixelBuffer.m_Obj)
  {
    if ([v6 isProResLogColorSpace]) {
      NSLog(&cfstr_ProResLogAsAnO.isa);
    }
    if (v7 && self->_sourceColorSpace && ([v7 isProResLogColorSpace] & 1) == 0)
    {
      m_Obj = self->_generatedPixelBuffer.m_Obj;
      if (m_Obj)
      {
        PVCVPixelBufferImageBufferImpl *v5 = m_Obj;
LABEL_13:
        (*(void (**)(void))(*(void *)m_Obj + 16))();
        goto LABEL_14;
      }
      v10 = (__CVBuffer *)*((void *)self->_pixelBuffer.m_Obj + 3);
      sourceColorSpace = self->_sourceColorSpace;
      long long v14 = 0;
      PVCreateCVPixelBufferFromCVPixelBufferWithColorSpaces(v10, sourceColorSpace, v7, &v14, &v15);
      uint64_t v12 = (HGColorConform **)self->_generatedPixelBuffer.m_Obj;
      objc_super v13 = (HGCVPixelBuffer *)v15;
      if (v12 == v15)
      {
        if (v12) {
          (*((void (**)(HGColorConform **))*v12 + 3))(v12);
        }
      }
      else
      {
        if (v12)
        {
          (*((void (**)(HGColorConform **))*v12 + 3))(v12);
          objc_super v13 = (HGCVPixelBuffer *)v15;
        }
        self->_generatedPixelBuffer.m_Obj = v13;
        uint64_t v15 = 0;
      }
      if (v14) {
        (*(void (**)(const char *))(*(void *)v14 + 24))(v14);
      }
      m_Obj = self->_generatedPixelBuffer.m_Obj;
    }
    else
    {
      m_Obj = self->_pixelBuffer.m_Obj;
    }
    PVCVPixelBufferImageBufferImpl *v5 = m_Obj;
    if (!m_Obj) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  PVCVPixelBufferImageBufferImpl *v5 = 0;
LABEL_14:

  return v9;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  void *v3 = 0;
  return (HGRef<HGBitmap>)self;
}

- (CGSize)size
{
  double v3 = (double)HGCVPixelBuffer::w(self->_pixelBuffer.m_Obj, 0);
  double v4 = (double)HGCVPixelBuffer::h(self->_pixelBuffer.m_Obj, 0);
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (PVColorSpace)sourceColorSpace
{
  return self->_sourceColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceColorSpace, 0);
  m_Obj = self->_generatedPixelBuffer.m_Obj;
  if (m_Obj) {
    (*(void (**)(HGCVPixelBuffer *))(*(void *)m_Obj + 24))(m_Obj);
  }
  double v4 = self->_pixelBuffer.m_Obj;
  if (v4) {
    (*(void (**)(HGCVPixelBuffer *))(*(void *)v4 + 24))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end