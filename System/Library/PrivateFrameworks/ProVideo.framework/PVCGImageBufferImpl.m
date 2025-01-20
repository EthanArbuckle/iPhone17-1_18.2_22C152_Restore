@interface PVCGImageBufferImpl
- (BOOL)canCreateCVPixelBuffer;
- (BOOL)canCreateHGBitmap;
- (BOOL)cvPixelBufferRequiresCopy;
- (BOOL)cvPixelBufferRequiresRender;
- (CGImage)cgImage;
- (CGSize)size;
- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3;
- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3;
- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3;
- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3 withGainMap:(CGImage *)a4;
- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3 withSourceColorSpace:(id)a4;
- (PVColorSpace)sourceColorSpace;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation PVCGImageBufferImpl

- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PVCGImageBufferImpl;
  v4 = [(PVCGImageBufferImpl *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_image = a3;
    CGImageRetain(a3);
  }
  return v5;
}

- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3 withGainMap:(CGImage *)a4
{
  v5 = [(PVCGImageBufferImpl *)self initWithCGImage:a3];
  v6 = v5;
  if (v5)
  {
    v5->_gainMap = a4;
    CGImageRetain(a4);
  }
  return v6;
}

- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3 withSourceColorSpace:(id)a4
{
  id v7 = a4;
  v8 = [(PVCGImageBufferImpl *)self initWithCGImage:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_sourceColorSpace, a4);
  }

  return v9;
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  self->_image = 0;
  CGImageRelease(self->_gainMap);
  self->_gainMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)PVCGImageBufferImpl;
  [(PVCGImageBufferImpl *)&v3 dealloc];
}

- (CGImage)cgImage
{
  return self->_image;
}

- (BOOL)canCreateCVPixelBuffer
{
  double Width = (double)CGImageGetWidth(self->_image);
  double Height = (double)CGImageGetHeight(self->_image);
  double v5 = Width;

  return PVCanCreateCVPixelBuffer(*(CGSize *)&v5);
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
  return self->_gainMap || self->_sourceColorSpace != 0;
}

- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3
{
  double v5 = v3;
  id v6 = a3;
  m_Obj = self->_generatedPixelBuffer.m_Obj;
  if (m_Obj)
  {
    PVCGImageBufferImpl *v5 = m_Obj;
    (*(void (**)(HGCVPixelBuffer *))(*(void *)m_Obj + 16))(m_Obj);
    goto LABEL_44;
  }
  image = self->_image;
  if (!image)
  {
    PVCGImageBufferImpl *v5 = 0;
    goto LABEL_44;
  }
  if (v6)
  {
    v9 = (PVColorSpace *)v6;
LABEL_6:
    v10 = v9;
    goto LABEL_9;
  }
  v10 = +[PVColorSpace pvColorSpaceFromCGColorSpace:CGImageGetColorSpace(image)];
  if (!v10)
  {
    v9 = +[PVColorSpace sRGBColorSpace];
    goto LABEL_6;
  }
LABEL_9:
  long long v33 = 0uLL;
  uint64_t v34 = 0;
  PVImagePropertiesForColorSpace(v10, 0, (uint64_t)&v33);
  int v11 = 0;
  if (v6 && self->_sourceColorSpace) {
    int v11 = [v6 isProResLogColorSpace] ^ 1;
  }
  if ([v6 isProResLogColorSpace]) {
    NSLog(&cfstr_ProResLogAsAnO.isa);
  }
  if (v11)
  {
    v12 = self->_image;
    sourceColorSpace = self->_sourceColorSpace;
    v31 = 0;
    PVCreateCVPixelBufferFromCGImageRefWithColorSpaces(v12, sourceColorSpace, v10, &v31, (HGColorConform ***)&v32);
    v14 = (HGNode ***)self->_generatedPixelBuffer.m_Obj;
    v15 = (HGCVPixelBuffer *)v32;
    if (v14 == v32)
    {
      if (v14) {
        ((void (*)(HGNode ***))(*v14)[3])(v14);
      }
    }
    else
    {
      if (v14)
      {
        ((void (*)(HGNode ***))(*v14)[3])(v14);
        v15 = (HGCVPixelBuffer *)v32;
      }
      self->_generatedPixelBuffer.m_Obj = v15;
      v32 = 0;
    }
    if (v31) {
      (*(void (**)(const char *))(*(void *)v31 + 24))(v31);
    }
  }
  else
  {
    gainMap = self->_gainMap;
    if (gainMap)
    {
      v17 = self->_image;
      long long v29 = v33;
      uint64_t v30 = v34;
      v28 = 0;
      PVCreateCVPixelBufferFromCGImageRefAndGainMap(v17, gainMap, (uint64_t)&v29, &v28, &v32);
      v18 = (HGNode ***)self->_generatedPixelBuffer.m_Obj;
      v19 = (HGCVPixelBuffer *)v32;
      if (v18 == v32)
      {
        if (v18) {
          ((void (*)(HGNode ***))(*v18)[3])(v18);
        }
      }
      else
      {
        if (v18)
        {
          ((void (*)(HGNode ***))(*v18)[3])(v18);
          v19 = (HGCVPixelBuffer *)v32;
        }
        self->_generatedPixelBuffer.m_Obj = v19;
        v32 = 0;
      }
      if (v28) {
        (*(void (**)(const char *))(*(void *)v28 + 24))(v28);
      }
    }
    else
    {
      v20 = self->_image;
      long long v26 = v33;
      uint64_t v27 = v34;
      v25 = 0;
      PVCreateCVPixelBufferFromCGImageRef(v20, (uint64_t)&v26, &v25, (HGObject **)&v32);
      v21 = (HGNode ***)self->_generatedPixelBuffer.m_Obj;
      v22 = (HGCVPixelBuffer *)v32;
      if (v21 == v32)
      {
        if (v21) {
          ((void (*)(HGNode ***))(*v21)[3])(v21);
        }
      }
      else
      {
        if (v21)
        {
          ((void (*)(HGNode ***))(*v21)[3])(v21);
          v22 = (HGCVPixelBuffer *)v32;
        }
        self->_generatedPixelBuffer.m_Obj = v22;
        v32 = 0;
      }
      if (v25) {
        (*(void (**)(const char *))(*(void *)v25 + 24))(v25);
      }
    }
  }
  v23 = self->_generatedPixelBuffer.m_Obj;
  PVCGImageBufferImpl *v5 = v23;
  if (v23) {
    (*(void (**)(HGCVPixelBuffer *))(*(void *)v23 + 16))(v23);
  }

LABEL_44:
  return v24;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  double v5 = v3;
  id v6 = a3;
  m_Obj = self->_generatedBitmap.m_Obj;
  if (!m_Obj)
  {
    image = self->_image;
    if (!image)
    {
      PVCGImageBufferImpl *v5 = 0;
      goto LABEL_19;
    }
    if (v6)
    {
      v9 = (PVColorSpace *)v6;
    }
    else
    {
      v10 = +[PVColorSpace pvColorSpaceFromCGColorSpace:CGImageGetColorSpace(image)];
      if (v10)
      {
LABEL_9:
        PVCreateHGBitmapFromCGImageRefWithStorage(self->_image, v10, &v14);
        int v11 = self->_generatedBitmap.m_Obj;
        v12 = v14;
        if (v11 == v14)
        {
          if (!v11)
          {
            PVCGImageBufferImpl *v5 = 0;
LABEL_18:

            goto LABEL_19;
          }
          (*(void (**)(HGBitmap *))(*(void *)v11 + 24))(self->_generatedBitmap.m_Obj);
          v12 = self->_generatedBitmap.m_Obj;
        }
        else
        {
          if (v11)
          {
            (*(void (**)(HGBitmap *))(*(void *)v11 + 24))(self->_generatedBitmap.m_Obj);
            v12 = v14;
          }
          self->_generatedBitmap.m_Obj = v12;
        }
        PVCGImageBufferImpl *v5 = v12;
        if (v12) {
          (*(void (**)(HGBitmap *))(*(void *)v12 + 16))(v12);
        }
        goto LABEL_18;
      }
      v9 = +[PVColorSpace sRGBColorSpace];
    }
    v10 = v9;
    goto LABEL_9;
  }
  PVCGImageBufferImpl *v5 = m_Obj;
  (*(void (**)(HGBitmap *))(*(void *)m_Obj + 16))(m_Obj);
LABEL_19:

  return v13;
}

- (CGSize)size
{
  double Width = (double)CGImageGetWidth(self->_image);
  double Height = (double)CGImageGetHeight(self->_image);
  double v5 = Width;
  result.height = Height;
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
  m_Obj = self->_generatedBitmap.m_Obj;
  if (m_Obj) {
    (*(void (**)(HGBitmap *))(*(void *)m_Obj + 24))(m_Obj);
  }
  v4 = self->_generatedPixelBuffer.m_Obj;
  if (v4) {
    (*(void (**)(HGCVPixelBuffer *))(*(void *)v4 + 24))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end