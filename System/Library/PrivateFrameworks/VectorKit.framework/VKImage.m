@interface VKImage
- (CGImage)image;
- (CGPoint)anchorPoint;
- (CGPoint)labelingPoint;
- (CGRect)collisionRect;
- (CGSize)size;
- (VKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a5;
- (VKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 usedAsTextureAndImage:(BOOL)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6;
- (VKImage)initWithData:(id)a3 scale:(double)a4 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a5;
- (VKImage)initWithData:(id)a3 scale:(double)a4 usedAsTextureAndImage:(BOOL)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6;
- (VKImage)initWithName:(id)a3 scale:(double)a4 resourceManager:(id)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6;
- (const)textureCoordinates;
- (double)scale;
- (handle<mre::Texture>)texture;
- (id).cxx_construct;
- (int)compareTo:(id)a3;
- (void)_prepareImage;
- (void)_prepareTextureWithAtlas:(TextureAtlas *)a3;
- (void)dealloc;
- (void)prepareTextureWithAtlas:(TextureAtlas *)a3;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setCollisionRect:(CGRect)a3;
- (void)setLabelingPoint:(CGPoint)a3;
@end

@implementation VKImage

- (handle<mre::Texture>)texture
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isTextureReady);
  if ((v3 & 1) == 0) {
    [(VKImage *)self prepareTextureWithAtlas:0];
  }
  ptr = self->_textureAtlasRegion.__ptr_;
  if (ptr)
  {
    v5 = *(uint64_t (**)(void))(*(void *)ptr + 24);
    return (handle<mre::Texture>)v5();
  }
  else
  {
    return self->_texture;
  }
}

- (id).cxx_construct
{
  *((_WORD *)self + 90) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  return self;
}

- (const)textureCoordinates
{
  ptr = self->_textureAtlasRegion.__ptr_;
  if (ptr) {
    return (const void *)(*(uint64_t (**)(void))(*(void *)ptr + 32))();
  }
  else {
    return &self->_textureCoordinates;
  }
}

- (void)prepareTextureWithAtlas:(TextureAtlas *)a3
{
  p_isTextureReady = &self->_isTextureReady;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isTextureReady);
  if ((v4 & 1) == 0)
  {
    obj = self;
    objc_sync_enter(obj);
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)p_isTextureReady);
    if ((v7 & 1) == 0)
    {
      [(VKImage *)obj _prepareTextureWithAtlas:a3];
      atomic_store(1u, (unsigned __int8 *)&self->_isTextureReady);
    }
    objc_sync_exit(obj);
  }
}

- (CGPoint)labelingPoint
{
  if (self->_hasLabelingPoint)
  {
    double x = self->_labelingPoint.x;
    double y = self->_labelingPoint.y;
  }
  else
  {
    [(VKImage *)self size];
    double x = v4 * 0.5;
    double y = v5 * 0.5;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)collisionRect
{
  if (self->_hasCollisionRect)
  {
    double x = self->_collisionRect.origin.x;
    double y = self->_collisionRect.origin.y;
    double width = self->_collisionRect.size.width;
    double height = self->_collisionRect.size.height;
  }
  else
  {
    [(VKImage *)self size];
    double width = v6;
    double height = v7;
    double y = 0.0;
    double x = 0.0;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)anchorPoint
{
  if (self->_hasAnchorPoint)
  {
    double x = self->_anchorPoint.x;
    double y = self->_anchorPoint.y;
  }
  else
  {
    [(VKImage *)self size];
    double x = v4 * 0.5;
    double y = v5 * 0.5;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_prepareTextureWithAtlas:(TextureAtlas *)a3
{
  [(VKImage *)self image];
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isImageReady);
  if ((v5 & 1) == 0) {
    return;
  }
  imageRef = self->_imageRef;
  if (!imageRef) {
    return;
  }
  unsigned int Width = CGImageGetWidth(imageRef);
  unsigned int Height = CGImageGetHeight(self->_imageRef);
  unsigned int v9 = Height;
  int v10 = 1 << -(char)__clz(Width - 1);
  int v11 = 1 << -__clz(Height - 1);
  if (a3) {
    unsigned int v12 = Height;
  }
  else {
    unsigned int v12 = v11;
  }
  if (a3) {
    unsigned int v13 = Width;
  }
  else {
    unsigned int v13 = v10;
  }
  {
    operator new();
  }
  uint64_t v14 = mdm::Allocator::instance(void)::alloc;
  v15 = (std::__shared_weak_count *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                                         + 16))(mdm::Allocator::instance(void)::alloc, 104, 8);
  v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF583AC0;
  v15->__shared_owners_ = 0;
  v15->__shared_weak_owners_ = 0;
  v15[1].__vftable = (std::__shared_weak_count_vtbl *)v14;
  v30 = ggl::TextureData2D::TextureData2D((uint64_t)&v15[1].__shared_owners_, v13, v12, 1u, 12, 1);
  v31 = v15;
  v16 = (void *)(*(uint64_t (**)(void *, void))(v15[1].__shared_owners_ + 16))(v30, 0);
  if (v16)
  {
    v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
    v18 = CGBitmapContextCreate(v16, Width, v9, 8uLL, 4 * v13, v17, 1u);
    CGColorSpaceRelease(v17);
    CGContextTranslateCTM(v18, 0.0, (double)v9);
    CGContextScaleCTM(v18, 1.0, -1.0);
    v32.size.double width = (double)Width;
    v32.origin.double x = 0.0;
    v32.origin.double y = 0.0;
    v32.size.double height = (double)v9;
    CGContextDrawImage(v18, v32, self->_imageRef);
    CGContextRelease(v18);
    MEMORY[0x1A62388D0](v16, *((unsigned int *)v30 + 16), 3, self->_imageHash);
  }
  if (a3)
  {
    (*((void (**)(shared_ptr<md::TextureAtlasRegion> *__return_ptr, TextureAtlas *, void **, uint64_t))a3->var0
     + 4))(&v29, a3, &v30, 1);
    shared_ptr<md::TextureAtlasRegion> v19 = v29;
    shared_ptr<md::TextureAtlasRegion> v29 = (shared_ptr<md::TextureAtlasRegion>)0;
    cntrl = self->_textureAtlasRegion.__cntrl_;
    self->_textureAtlasRegion = v19;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    v21 = (std::__shared_weak_count *)v29.__cntrl_;
    if (v29.__cntrl_ && !atomic_fetch_add((atomic_ullong *volatile)v29.__cntrl_ + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (!self->_textureAtlasRegion.__ptr_)
  {
    shared_ptr<md::TextureAtlasRegion> v29 = (shared_ptr<md::TextureAtlasRegion>)0;
    v23 = self->_resourceStore.__cntrl_;
    if (v23
      && (v29.__cntrl_ = (__shared_weak_count *)std::__shared_weak_count::lock((std::__shared_weak_count *)v23)) != 0)
    {
      ptr = self->_resourceStore.__ptr_;
      v29.__ptr_ = (TextureAtlasRegion *)ptr;
      if (!self->_texture.var0.var1) {
        goto LABEL_32;
      }
    }
    else
    {
      ptr = 0;
      if (!self->_texture.var0.var1)
      {
LABEL_32:
        v27 = v30;
        v28 = v31;
        if (v31) {
          atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        self->_texture.var0.var1 = (*(uint64_t (**)(GraphicsResourceStore *, void **))(*(void *)ptr + 8))(ptr, &v27);
        v25 = v28;
        if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
        self->_textureCoordinates._minimum = 0;
        self->_textureCoordinates._maximum._e[0] = (float)Width / (float)v13;
        self->_textureCoordinates._maximum._e[1] = (float)v9 / (float)v12;
        v26 = (std::__shared_weak_count *)v29.__cntrl_;
        if (v29.__cntrl_ && !atomic_fetch_add((atomic_ullong *volatile)v29.__cntrl_ + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
        goto LABEL_20;
      }
    }
    (*(void (**)(GraphicsResourceStore *))(*(void *)ptr + 56))(ptr);
    goto LABEL_32;
  }
LABEL_20:
  if (!self->_usedAsTextureAndImage)
  {
    CGImageRelease(self->_imageRef);
    self->_imageRef = 0;
  }
  v22 = v31;
  if (v31)
  {
    if (!atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
}

- (CGSize)size
{
  [(VKImage *)self image];
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGImage)image
{
  p_isImageReaddouble y = &self->_isImageReady;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isImageReady);
  if ((v4 & 1) == 0)
  {
    unsigned __int8 v5 = self;
    objc_sync_enter(v5);
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)p_isImageReady);
    if ((v6 & 1) == 0)
    {
      [(VKImage *)v5 _prepareImage];
      atomic_store(1u, (unsigned __int8 *)&self->_isImageReady);
    }
    objc_sync_exit(v5);
  }
  return self->_imageRef;
}

- (VKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a5
{
  unsigned __int8 v5 = (std::__shared_weak_count *)*((void *)a5.__ptr_ + 1);
  uint64_t v8 = *(void *)a5.__ptr_;
  unsigned int v9 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  unsigned __int8 v6 = [(VKImage *)self initWithCGImage:a3 scale:0 usedAsTextureAndImage:&v8 resourceStore:a4];
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  return v6;
}

- (VKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 usedAsTextureAndImage:(BOOL)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6
{
  ptr = a6.__ptr_;
  v19.receiver = self;
  v19.super_class = (Class)VKImage;
  int v10 = [(VKImage *)&v19 init];
  if (v10)
  {
    int v11 = CGImageRetain(a3);
    v10->_imageRef = v11;
    atomic_store(1u, (unsigned __int8 *)&v10->_isImageReady);
    size_t Width = CGImageGetWidth(v11);
    size_t Height = CGImageGetHeight(v10->_imageRef);
    v10->_size.double width = (double)Width;
    v10->_size.double height = (double)Height;
    v10->_scale = a4;
    v10->_usedAsTextureAndImage = a5;
    v15 = *(GraphicsResourceStore **)ptr;
    uint64_t v14 = *((void *)ptr + 1);
    if (v14) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v10->_resourceStore.__cntrl_;
    v10->_resourceStore.__ptr_ = v15;
    v10->_resourceStore.__cntrl_ = (__shared_weak_count *)v14;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v17 = v10;
  }

  return v10;
}

- (void)setLabelingPoint:(CGPoint)a3
{
  self->_hasLabelingPoint = 1;
  self->_labelingPoint = a3;
}

- (void)setCollisionRect:(CGRect)a3
{
  self->_hasCollisionRect = 1;
  self->_collisionRect = a3;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_hasAnchorPoint = 1;
  self->_anchorPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  cntrl = self->_textureAtlasRegion.__cntrl_;
  if (!cntrl || atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    unsigned __int8 v4 = self->_resourceStore.__cntrl_;
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  unsigned __int8 v4 = self->_resourceStore.__cntrl_;
  if (v4) {
LABEL_4:
  }
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
LABEL_5:
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (int)compareTo:(id)a3
{
  unsigned __int8 v4 = (unint64_t *)a3;
  if (self == (VKImage *)v4
    || ([(VKImage *)self prepareTextureWithAtlas:0],
        [v4 prepareTextureWithAtlas:0],
        unint64_t v5 = bswap64(*(void *)self->_imageHash),
        unint64_t v6 = bswap64(v4[24]),
        v5 == v6)
    && (unint64_t v5 = bswap64(*(void *)&self->_imageHash[8]), v6 = bswap64(v4[25]), v5 == v6))
  {
    int v7 = 0;
  }
  else if (v5 < v6)
  {
    int v7 = -1;
  }
  else
  {
    int v7 = 1;
  }

  return v7;
}

- (double)scale
{
  return self->_scale;
}

- (void)_prepareImage
{
  data = self->_data;
  if (data && [(NSData *)data length])
  {
    unsigned __int8 v4 = self->_data;
    if (_imageSourceOptions(void)::onceToken != -1) {
      dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_24477);
    }
    unint64_t v5 = CGImageSourceCreateWithData((CFDataRef)v4, (CFDictionaryRef)_imageSourceOptions(void)::options);
    unint64_t v6 = self->_data;
    self->_data = 0;

    if (v5)
    {
      if (CGImageSourceGetCount(v5))
      {
        if (_imageSourceOptions(void)::onceToken != -1) {
          dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_24477);
        }
        self->_imageRef = CGImageSourceCreateImageAtIndex(v5, 0, (CFDictionaryRef)_imageSourceOptions(void)::options);
        CFRelease(v5);
        imageRef = self->_imageRef;
        if (imageRef)
        {
          CGFloat Width = (double)CGImageGetWidth(imageRef);
          size_t Height = CGImageGetHeight(self->_imageRef);
          self->_size.double width = Width;
          self->_size.double height = (double)Height;
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
    return;
  }
  name = self->_name;
  if (!name || ![(NSString *)name length]) {
    return;
  }
  unint64_t v11 = vcvtpd_u64_f64(self->_scale);
  if (v11)
  {
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      unsigned int v13 = self->_name;
      uint64_t v14 = v13;
      if (v11 != 1)
      {
        uint64_t v15 = [(NSString *)v13 stringByAppendingFormat:@"@%lux", v11];

        uint64_t v14 = (void *)v15;
      }
      v16 = [v14 stringByAppendingPathExtension:@"png"];

      v17 = [(VKResourceManager *)self->_resourceManager pathForResourceWithName:v16];
      v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v19 = [v18 fileExistsAtPath:v17];

      if (v19)
      {
        ImageAtIndedouble x = CFURLCreateWithFileSystemPath(v12, v17, kCFURLPOSIXPathStyle, 0);
        if (!ImageAtIndex) {
          goto LABEL_29;
        }
        if (_imageSourceOptions(void)::onceToken != -1) {
          dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_24477);
        }
        v21 = CGImageSourceCreateWithURL(ImageAtIndex, (CFDictionaryRef)_imageSourceOptions(void)::options);
        CFRelease(ImageAtIndex);
        if (v21)
        {
          if (CGImageSourceGetCount(v21))
          {
            if (_imageSourceOptions(void)::onceToken != -1) {
              dispatch_once(&_imageSourceOptions(void)::onceToken, &__block_literal_global_24477);
            }
            ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v21, 0, (CFDictionaryRef)_imageSourceOptions(void)::options);
          }
          else
          {
            ImageAtIndedouble x = 0;
          }
          CFRelease(v21);
          goto LABEL_29;
        }
      }
      ImageAtIndedouble x = 0;
LABEL_29:

      self->_imageRef = ImageAtIndex;
      if (!ImageAtIndex)
      {
        if (--v11) {
          continue;
        }
      }
      break;
    }
  }
  v22 = self->_imageRef;
  if (v22)
  {
    CGFloat v23 = (double)CGImageGetWidth(v22);
    size_t v24 = CGImageGetHeight(self->_imageRef);
    self->_size.double width = v23;
    self->_size.double height = (double)v24;
    resourceManager = self->_resourceManager;
    self->_resourceManager = 0;
  }
}

- (void)dealloc
{
  ptr = self->_textureAtlasRegion.__ptr_;
  if (ptr)
  {
    (*(void (**)(TextureAtlasRegion *, SEL))(*(void *)ptr + 16))(ptr, a2);
    cntrl = self->_textureAtlasRegion.__cntrl_;
    self->_textureAtlasRegion.__ptr_ = 0;
    self->_textureAtlasRegion.__cntrl_ = 0;
    if (cntrl)
    {
      if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
        imageRef = self->_imageRef;
        if (!imageRef) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
  }
  imageRef = self->_imageRef;
  if (imageRef) {
LABEL_5:
  }
    CGImageRelease(imageRef);
LABEL_6:
  unint64_t v6 = self->_resourceStore.__cntrl_;
  if (v6)
  {
    int v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)v6);
    CFAllocatorRef v12 = v7;
    if (v7)
    {
      uint64_t v8 = v7;
      unsigned int v9 = self->_resourceStore.__ptr_;
      unint64_t v11 = v9;
      if (v9) {
        (*(void (**)(GraphicsResourceStore *, unint64_t))(*(void *)v9 + 56))(v9, self->_texture.var0.var1);
      }
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)VKImage;
  [(VKImage *)&v10 dealloc];
}

- (VKImage)initWithName:(id)a3 scale:(double)a4 resourceManager:(id)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6
{
  ptr = a6.__ptr_;
  id v10 = a3;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VKImage;
  CFAllocatorRef v12 = [(VKImage *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_scale = a4;
    objc_storeStrong((id *)&v12->_resourceManager, a5);
    v16 = *(GraphicsResourceStore **)ptr;
    uint64_t v15 = *((void *)ptr + 1);
    if (v15) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v12->_resourceStore.__cntrl_;
    v12->_resourceStore.__ptr_ = v16;
    v12->_resourceStore.__cntrl_ = (__shared_weak_count *)v15;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v18 = v12;
  }

  return v12;
}

- (VKImage)initWithData:(id)a3 scale:(double)a4 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a5
{
  ptr = a5.__ptr_;
  id v8 = a3;
  unsigned int v9 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v12 = *(void *)ptr;
  uint64_t v13 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  id v10 = [(VKImage *)self initWithData:v8 scale:0 usedAsTextureAndImage:&v12 resourceStore:a4];
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }

  return v10;
}

- (VKImage)initWithData:(id)a3 scale:(double)a4 usedAsTextureAndImage:(BOOL)a5 resourceStore:(weak_ptr<mre::GraphicsResourceStore>)a6
{
  ptr = a6.__ptr_;
  id v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VKImage;
  uint64_t v12 = [(VKImage *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v13->_usedAsTextureAndImage = a5;
    v13->_scale = a4;
    uint64_t v15 = *(GraphicsResourceStore **)ptr;
    uint64_t v14 = *((void *)ptr + 1);
    if (v14) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v13->_resourceStore.__cntrl_;
    v13->_resourceStore.__ptr_ = v15;
    v13->_resourceStore.__cntrl_ = (__shared_weak_count *)v14;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v17 = v13;
  }

  return v13;
}

@end