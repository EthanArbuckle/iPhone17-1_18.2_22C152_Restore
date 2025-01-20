@interface PVImageBuffer
+ (id)imageWithCGImage:(CGImage *)a3;
+ (id)imageWithCGImage:(CGImage *)a3 withGainMap:(CGImage *)a4;
+ (id)imageWithCGImage:(CGImage *)a3 withSourceColorSpace:(id)a4 withDestColorSpace:(id)a5;
+ (id)imageWithCVPixelBuffer:(__CVBuffer *)a3;
+ (id)imageWithHGBitmap:(HGRef<HGBitmap>)a3;
+ (id)imageWithHGCVPixelBuffer:(HGRef<HGCVPixelBuffer>)a3;
+ (id)imageWithMTLTexture:(id)a3;
+ (id)imageWithProResLogCGImage:(CGImage *)a3 forColorSpace:(int)a4;
+ (id)imageWithProResLogCVPixelBuffer:(__CVBuffer *)a3 forColorSpace:(int)a4;
+ (id)imageWithProResLogUIImage:(id)a3 forColorSpace:(int)a4;
+ (id)imageWithUIImage:(id)a3;
- (BOOL)canCreateCVPixelBuffer;
- (BOOL)canCreateHGBitmap;
- (BOOL)cvPixelBufferRequiresCopy;
- (BOOL)cvPixelBufferRequiresRender;
- (CGImage)cgImage;
- (CGSize)size;
- (HGRef<HGBitmap>)hgBitmap;
- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3;
- (PVImageBuffer)initWithImageBufferImpl:(id)a3;
- (__CVBuffer)cvPixelBuffer;
- (__CVBuffer)cvPixelBufferWithColorSpace:(id)a3;
- (id)description;
- (id)uiImage;
- (void)dealloc;
@end

@implementation PVImageBuffer

+ (id)imageWithUIImage:(id)a3
{
  id v3 = a3;
  v4 = [PVCGImageBufferImpl alloc];
  id v5 = v3;
  v6 = -[PVCGImageBufferImpl initWithCGImage:](v4, "initWithCGImage:", [v5 CGImage]);
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v6];

  return v7;
}

+ (id)imageWithCGImage:(CGImage *)a3
{
  id v3 = [[PVCGImageBufferImpl alloc] initWithCGImage:a3];
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v3];

  return v4;
}

+ (id)imageWithCGImage:(CGImage *)a3 withGainMap:(CGImage *)a4
{
  v4 = [[PVCGImageBufferImpl alloc] initWithCGImage:a3 withGainMap:a4];
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v4];

  return v5;
}

+ (id)imageWithCGImage:(CGImage *)a3 withSourceColorSpace:(id)a4 withDestColorSpace:(id)a5
{
  id v6 = a4;
  v7 = [[PVCGImageBufferImpl alloc] initWithCGImage:a3 withSourceColorSpace:v6];
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v7];

  return v8;
}

+ (id)imageWithCVPixelBuffer:(__CVBuffer *)a3
{
  id v3 = [[PVCVPixelBufferImageBufferImpl alloc] initWithCVPixelBuffer:a3];
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v3];

  return v4;
}

+ (id)imageWithHGCVPixelBuffer:(HGRef<HGCVPixelBuffer>)a3
{
  v4 = [PVCVPixelBufferImageBufferImpl alloc];
  uint64_t v5 = *(void *)a3.m_Obj;
  uint64_t v9 = v5;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
  }
  id v6 = [(PVCVPixelBufferImageBufferImpl *)v4 initWithHGCVPixelBuffer:&v9];
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v6];

  return v7;
}

+ (id)imageWithHGBitmap:(HGRef<HGBitmap>)a3
{
  CVBitmapStorage = HGCVBitmap::getCVBitmapStorage(*(HGBitmap **)a3.m_Obj, (HGBitmap *)a2);
  if (CVBitmapStorage)
  {
    uint64_t v5 = CVBitmapStorage[16];
    if (v5) {
      (*(void (**)(void))(*(void *)v5 + 16))(CVBitmapStorage[16]);
    }
    id v6 = objc_opt_class();
    uint64_t v13 = v5;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
    }
    v7 = [v6 imageWithHGCVPixelBuffer:&v13];
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
    }
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
    }
  }
  else
  {
    v8 = [PVHGBitmapImageBufferImpl alloc];
    uint64_t v9 = *(void *)a3.m_Obj;
    uint64_t v12 = v9;
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 16))(v9);
    }
    v10 = [(PVHGBitmapImageBufferImpl *)v8 initWithHGBitmap:&v12];
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 24))(v12);
    }
    v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v10];
  }

  return v7;
}

+ (id)imageWithMTLTexture:(id)a3
{
  id v3 = a3;
  v4 = [[PVMTLTextureImageBufferImpl alloc] initWithMTLTexture:v3];
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v4];

  return v5;
}

- (PVImageBuffer)initWithImageBufferImpl:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVImageBuffer;
  id v6 = [(PVImageBuffer *)&v8 init];
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageBufferImpl, a3);
    operator new();
  }

  return 0;
}

+ (id)imageWithProResLogUIImage:(id)a3 forColorSpace:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = objc_msgSend(a1, "imageWithProResLogCGImage:forColorSpace:", objc_msgSend(v6, "CGImage"), v4);

  return v7;
}

+ (id)imageWithProResLogCGImage:(CGImage *)a3 forColorSpace:(int)a4
{
  if (a4) {
    +[PVColorSpace rec2100HLGColorSpace];
  }
  else {
  id v5 = +[PVColorSpace rec709GammaColorSpace];
  }
  id v6 = [PVCGImageBufferImpl alloc];
  v7 = +[PVColorSpace ProResLogColorSpace];
  objc_super v8 = [(PVCGImageBufferImpl *)v6 initWithCGImage:a3 withSourceColorSpace:v7];

  if (v8) {
    [(PVCGImageBufferImpl *)v8 cvPixelBufferWithColorSpace:v5];
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v9 = [PVCVPixelBufferImageBufferImpl alloc];
  uint64_t v13 = v14;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
  }
  v10 = [(PVCVPixelBufferImageBufferImpl *)v9 initWithHGCVPixelBuffer:&v13];

  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
  }
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v10];
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
  }

  return v11;
}

+ (id)imageWithProResLogCVPixelBuffer:(__CVBuffer *)a3 forColorSpace:(int)a4
{
  if (a4) {
    +[PVColorSpace rec2100HLGColorSpace];
  }
  else {
  id v5 = +[PVColorSpace rec709GammaColorSpace];
  }
  id v6 = [PVCVPixelBufferImageBufferImpl alloc];
  v7 = +[PVColorSpace ProResLogColorSpace];
  objc_super v8 = [(PVCVPixelBufferImageBufferImpl *)v6 initWithCVPixelBuffer:a3 withSourceColorSpace:v7];

  if (v8) {
    [(PVCVPixelBufferImageBufferImpl *)v8 cvPixelBufferWithColorSpace:v5];
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v9 = [PVCVPixelBufferImageBufferImpl alloc];
  uint64_t v13 = v14;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
  }
  v10 = [(PVCVPixelBufferImageBufferImpl *)v9 initWithHGCVPixelBuffer:&v13];

  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
  }
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImageBufferImpl:v10];
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
  }

  return v11;
}

- (void)dealloc
{
  lock = self->_lock;
  if (lock) {
    (*((void (**)(HGSynchronizable *, SEL))lock->var0 + 1))(lock, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVImageBuffer;
  [(PVImageBuffer *)&v4 dealloc];
}

- (id)uiImage
{
  lock = self->_lock;
  char v9 = 0;
  HGSynchronizable::Lock(lock);
  id v3 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v4 = [(PVImageBufferImpl *)self->_imageBufferImpl cgImage];
  id v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 nativeScale];
  id v6 = objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v4, 0);

  HGSynchronizer::~HGSynchronizer(&lock);

  return v6;
}

- (CGImage)cgImage
{
  lock = self->_lock;
  char v6 = 0;
  HGSynchronizable::Lock(lock);
  id v3 = (CGImage *)[(PVImageBufferImpl *)self->_imageBufferImpl cgImage];
  HGSynchronizer::~HGSynchronizer(&lock);
  return v3;
}

- (BOOL)canCreateCVPixelBuffer
{
  v2 = self;
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = [(PVImageBufferImpl *)v2->_imageBufferImpl canCreateCVPixelBuffer];
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (BOOL)canCreateHGBitmap
{
  v2 = self;
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = [(PVImageBufferImpl *)v2->_imageBufferImpl canCreateHGBitmap];
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (BOOL)cvPixelBufferRequiresCopy
{
  v2 = self;
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = [(PVImageBufferImpl *)v2->_imageBufferImpl cvPixelBufferRequiresCopy];
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (BOOL)cvPixelBufferRequiresRender
{
  v2 = self;
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  LOBYTE(v2) = [(PVImageBufferImpl *)v2->_imageBufferImpl cvPixelBufferRequiresRender];
  HGSynchronizer::~HGSynchronizer(&lock);
  return (char)v2;
}

- (__CVBuffer)cvPixelBuffer
{
  return [(PVImageBuffer *)self cvPixelBufferWithColorSpace:0];
}

- (HGRef<HGBitmap>)hgBitmap
{
  return (HGRef<HGBitmap>)[(PVImageBuffer *)self hgBitmapWithColorSpace:0];
}

- (__CVBuffer)cvPixelBufferWithColorSpace:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  char v14 = 0;
  HGSynchronizable::Lock(lock);
  imageBufferImpl = self->_imageBufferImpl;
  if (imageBufferImpl
    && ([(PVImageBufferImpl *)imageBufferImpl cvPixelBufferWithColorSpace:v4], v12))
  {
    if ([(PVImageBufferImpl *)self->_imageBufferImpl cvPixelBufferRequiresCopy])
    {
      char v6 = [PVCVPixelBufferImageBufferImpl alloc];
      v11 = v12;
      (*(void (**)(void *))(*v12 + 16))(v12);
      v7 = [(PVCVPixelBufferImageBufferImpl *)v6 initWithHGCVPixelBuffer:&v11];
      if (v11) {
        (*(void (**)(void *))(*v11 + 24))(v11);
      }
      objc_super v8 = self->_imageBufferImpl;
      self->_imageBufferImpl = v7;
    }
    char v9 = (__CVBuffer *)v12[3];
    (*(void (**)(void *))(*v12 + 24))(v12);
  }
  else
  {
    char v9 = 0;
  }
  HGSynchronizer::~HGSynchronizer(&lock);

  return v9;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  char v5 = v3;
  id v6 = a3;
  lock = self->_lock;
  char v10 = 0;
  HGSynchronizable::Lock(lock);
  imageBufferImpl = self->_imageBufferImpl;
  if (imageBufferImpl) {
    [(PVImageBufferImpl *)imageBufferImpl hgBitmapWithColorSpace:v6];
  }
  else {
    *char v5 = 0;
  }
  HGSynchronizer::~HGSynchronizer(&lock);

  return v8;
}

- (CGSize)size
{
  lock = self->_lock;
  char v10 = 0;
  HGSynchronizable::Lock(lock);
  [(PVImageBufferImpl *)self->_imageBufferImpl size];
  double v4 = v3;
  double v6 = v5;
  HGSynchronizer::~HGSynchronizer(&lock);
  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)description
{
  lock = self->_lock;
  char v15 = 0;
  HGSynchronizable::Lock(lock);
  [(PVImageBufferImpl *)self->_imageBufferImpl size];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v7 = NSString;
  double v8 = (objc_class *)objc_opt_class();
  char v9 = NSStringFromClass(v8);
  char v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  uint64_t v12 = [v7 stringWithFormat:@"<%@ (%@): %p>, [%.1f x %.1f]", v9, v11, self, v4, v6];

  HGSynchronizer::~HGSynchronizer(&lock);

  return v12;
}

- (void).cxx_destruct
{
}

@end