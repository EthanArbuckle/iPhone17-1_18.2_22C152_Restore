@interface VUIImage
+ (id)imageWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5;
+ (id)imageWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4;
+ (id)imageWithData:(id)a3;
+ (id)imageWithPath:(id)a3;
+ (id)imageWithPath:(id)a3 cacheImmediately:(BOOL)a4;
+ (id)imageWithRotationFromPath:(id)a3;
+ (id)imageWithRotationFromURL:(id)a3;
+ (id)imageWithURL:(id)a3;
+ (id)imageWithURL:(id)a3 cacheImmediately:(BOOL)a4;
+ (int)exifOrientationForImageOrientation:(int64_t)a3;
+ (int64_t)imageOrientationForExifOrientation:(int)a3;
- (BOOL)enableCache;
- (BOOL)hasAlpha;
- (BOOL)isImageBufferInMemory;
- (BOOL)isPowerOfTwo;
- (BOOL)rotationEnabled;
- (BOOL)sourceRequiresRotation;
- (CGImage)image;
- (CGRect)largestSquareRect;
- (CGSize)pixelBounds;
- (VUIImage)initWithCGImageRef:(CGImage *)a3 exifOrientation:(int)a4 preserveAlpha:(BOOL)a5;
- (VUIImage)initWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5;
- (VUIImage)initWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4;
- (VUIImage)initWithData:(id)a3;
- (VUIImage)initWithURL:(id)a3;
- (VUIImage)initWithURL:(id)a3 cacheImmediately:(BOOL)a4;
- (float)aspectRatio;
- (id)_initWithCGImageSourceRotationEnabled:(CGImageSource *)a3;
- (id)imageType;
- (id)squareImageFromNearSquareImageWithAspectRatioLimit:(float)a3;
- (id)uiImage;
- (int)orientation;
- (int64_t)_uiImageOrientation;
- (void)_initializeCGImageWithRotation;
- (void)dealloc;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)setEnableCache:(BOOL)a3;
- (void)setRotationEnabled:(BOOL)a3;
@end

@implementation VUIImage

void __42__VUIImage__initializeCGImageWithRotation__block_invoke(uint64_t a1, CGContextRef c)
{
  CGRect ClipBoundingBox = CGContextGetClipBoundingBox(c);
  v4 = *(CGImage **)(*(void *)(a1 + 32) + 8);
  CGContextDrawImage(c, ClipBoundingBox, v4);
}

+ (id)imageWithPath:(id)a3 cacheImmediately:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    v6 = (objc_class *)MEMORY[0x1E4F1CB10];
    id v7 = a3;
    v8 = (void *)[[v6 alloc] initFileURLWithPath:v7];

    v9 = [a1 imageWithURL:v8 cacheImmediately:v4];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)imageWithURL:(id)a3 cacheImmediately:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = (void *)[objc_alloc((Class)a1) initWithURL:v6 cacheImmediately:v4];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (VUIImage)initWithURL:(id)a3 cacheImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v7 = (const __CFURL *)a3;
  if (v7
    && (v23.receiver = self,
        v23.super_class = (Class)VUIImage,
        (self = [(VUIImage *)&v23 init]) != 0))
  {
    uint64_t v26 = *MEMORY[0x1E4F2FF08];
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    v27[0] = MEMORY[0x1E4F1CC38];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    self->_cacheImmediately = v4;
    if (v4)
    {
      uint64_t v24 = *MEMORY[0x1E4F2FF18];
      uint64_t v25 = v8;
      CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

      v9 = v10;
    }
    else
    {
      CFDictionaryRef v10 = 0;
    }
    v12 = CGImageSourceCreateWithURL(v7, v10);
    self->_imageSource = v12;
    if (v12)
    {
      CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v12, 0, (CFDictionaryRef)v9);
      v14 = [(__CFDictionary *)v13 objectForKey:*MEMORY[0x1E4F2FD00]];
      [v14 floatValue];
      self->_imageWidth = v15;

      v16 = [(__CFDictionary *)v13 objectForKey:*MEMORY[0x1E4F2FCE8]];
      [v16 floatValue];
      self->_imageHeight = v17;

      v18 = [(__CFDictionary *)v13 objectForKey:*MEMORY[0x1E4F2FCA0]];
      self->_imageOrientation = [v18 intValue];

      Type = (__CFString *)CGImageSourceGetType(self->_imageSource);
      if (Type)
      {
        v20 = (NSString *)[(__CFString *)Type copy];
        imageType = self->_imageType;
        self->_imageType = v20;
      }
      self->_enableCache = 0;
      if (v13) {
        CFRelease(v13);
      }
      objc_storeStrong((id *)&self->_imageURL, a3);
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)uiImage
{
  v2 = (void *)MEMORY[0x1E4F42A80];
  v3 = self;
  uint64_t v4 = [(VUIImage *)v3 image];
  v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 scale];
  CFURLRef v7 = objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v4, -[VUIImage _uiImageOrientation](v3, "_uiImageOrientation"), v6);

  return v7;
}

- (void)setEnableCache:(BOOL)a3
{
  self->_enableCache = a3;
  if (!self->_imageBufferInMemory && a3) {
    self->_imageBufferInMemory = 1;
  }
}

- (CGImage)image
{
  v2 = self;
  objc_sync_enter(v2);
  image = v2->_image;
  if (!image)
  {
    [(VUIImage *)v2 _initializeCGImageWithRotation];
    image = v2->_image;
  }
  objc_sync_exit(v2);

  return image;
}

- (int64_t)_uiImageOrientation
{
  v3 = objc_opt_class();
  uint64_t v4 = [(VUIImage *)self orientation];
  return [v3 imageOrientationForExifOrientation:v4];
}

- (int)orientation
{
  return self->_imageOrientation;
}

- (void)_initializeCGImageWithRotation
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (self->_image || !self->_imageSource) {
    return;
  }
  v3 = VUICImageLogObject();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = VUICImageLogObject();
  double v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E29E1000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Perf.VUIImage.InitCGImage", "", buf, 2u);
  }

  CFURLRef v7 = VUICImageLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [MEMORY[0x1E4F29060] isMainThread];
    BOOL cacheImmediately = self->_cacheImmediately;
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = cacheImmediately;
    _os_log_impl(&dword_1E29E1000, v7, OS_LOG_TYPE_DEFAULT, "VUIImage::InitCGImage (%p), isMainThread: %d, cacheImmediately: %d", buf, 0x18u);
  }

  if ([(VUIImage *)self rotationEnabled])
  {
    unsigned int imageOrientation = self->_imageOrientation;
    if (imageOrientation - 9 > 0xFFFFFFF8)
    {
      imagedouble Height = self->_imageHeight;
      imagedouble Width = self->_imageWidth;
      float v30 = imageHeight;
      if (imageOrientation <= 4) {
        float v31 = self->_imageWidth;
      }
      else {
        float v31 = imageHeight;
      }
      if (imageOrientation <= 4) {
        imagedouble Width = v30;
      }
      if (v31 >= imageWidth) {
        float v32 = v31;
      }
      else {
        float v32 = imageWidth;
      }
      float valuePtr = v32;
      if (v31 <= 1920.0 && imageWidth <= 1080.0) {
        goto LABEL_53;
      }
      if ((float)(v31 / imageWidth) <= 1.7778)
      {
        int v34 = 1149698048;
        if (v31 > imageWidth)
        {
          float valuePtr = (float)((float)(imageWidth + (float)(v31 * 1080.0)) + -1.0) / imageWidth;
          goto LABEL_53;
        }
      }
      else
      {
        int v34 = 1156579328;
      }
      float valuePtr = *(float *)&v34;
LABEL_53:
      CFNumberRef v36 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
      if (v36)
      {
        CFNumberRef v37 = v36;
        v38 = (void *)*MEMORY[0x1E4F1CFD0];
        uint64_t v39 = *MEMORY[0x1E4F2FE48];
        *(void *)buf = *MEMORY[0x1E4F2FE28];
        *(void *)&buf[8] = v39;
        values[0] = v38;
        values[1] = v38;
        *(void *)&buf[16] = *MEMORY[0x1E4F2FF68];
        values[2] = v36;
        CFDictionaryRef v40 = CFDictionaryCreate(0, (const void **)buf, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFRelease(v37);
      }
      else
      {
        CFDictionaryRef v40 = 0;
      }
      ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(self->_imageSource, 0, v40);
      self->_image = ThumbnailAtIndex;
      self->_imagedouble Width = (double)CGImageGetWidth(ThumbnailAtIndex);
      self->_imagedouble Height = (double)CGImageGetHeight(self->_image);
      self->_unsigned int imageOrientation = 1;
      if (v40) {
        CFRelease(v40);
      }
      goto LABEL_22;
    }
  }
  if (self->_cacheImmediately)
  {
    uint64_t v45 = *MEMORY[0x1E4F2FF18];
    uint64_t v46 = MEMORY[0x1E4F1CC38];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
LABEL_14:
    CFDictionaryRef v12 = (const __CFDictionary *)v11;
    goto LABEL_15;
  }
  if (self->_enableCache)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F2FF08], 0);
    goto LABEL_14;
  }
  if (self->_imageURL)
  {
    CFRelease(self->_imageSource);
    imageSource = CGImageSourceCreateWithURL((CFURLRef)self->_imageURL, 0);
    self->_imageSource = imageSource;
    if (!imageSource)
    {
      v35 = VUICImageLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
LABEL_63:
        _os_log_impl(&dword_1E29E1000, v35, OS_LOG_TYPE_INFO, "Null image source after creation", buf, 2u);
        goto LABEL_64;
      }
      goto LABEL_64;
    }
    goto LABEL_60;
  }
  if (self->_imageData)
  {
    CFRelease(self->_imageSource);
    imageSource = CGImageSourceCreateWithData((CFDataRef)self->_imageData, 0);
    self->_imageSource = imageSource;
    if (!imageSource)
    {
      v35 = VUICImageLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        goto LABEL_63;
      }
LABEL_64:

      goto LABEL_65;
    }
LABEL_60:
    CFDictionaryRef v12 = 0;
    goto LABEL_16;
  }
LABEL_65:
  CFDictionaryRef v12 = 0;
LABEL_15:
  imageSource = self->_imageSource;
  if (imageSource)
  {
LABEL_16:
    ImageAtIndex = CGImageSourceCreateImageAtIndex(imageSource, 0, v12);
    self->_image = ImageAtIndex;
    if (self->_cacheImmediately && ImageAtIndex)
    {
      double Width = (double)CGImageGetWidth(ImageAtIndex);
      double Height = (double)CGImageGetHeight(self->_image);
      float v17 = +[VUIGraphicsImageRenderer formatWithCGImage:self->_image];
      [v17 setScale:1.0];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __42__VUIImage__initializeCGImageWithRotation__block_invoke;
      v43[3] = &unk_1E6DDDAC8;
      v43[4] = self;
      v18 = +[VUIGraphicsImageRenderer imageWithSize:format:cgContextActions:](VUIGraphicsImageRenderer, "imageWithSize:format:cgContextActions:", v17, v43, Width, Height);
      if (v18)
      {
        CGImageRelease(self->_image);
        v19 = (CGImage *)[v18 CGImage];
        self->_image = v19;
        CGImageRetain(v19);
      }
    }
  }

LABEL_22:
  v20 = self->_imageSource;
  if (v20)
  {
    CFRelease(v20);
    self->_imageSource = 0;
  }
  else
  {
    v21 = VUICImageLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      imageURL = self->_imageURL;
      imageData = self->_imageData;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = imageURL;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = imageData;
      _os_log_impl(&dword_1E29E1000, v21, OS_LOG_TYPE_INFO, "_imageSource is unexpectedly NULL. %@, %p", buf, 0x16u);
    }
  }
  uint64_t v24 = self->_imageURL;
  self->_imageURL = 0;

  uint64_t v25 = self->_imageData;
  self->_imageData = 0;

  uint64_t v26 = VUICImageLogObject();
  v27 = v26;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E29E1000, v27, OS_SIGNPOST_INTERVAL_END, v4, "Perf.VUIImage.InitCGImage", "", buf, 2u);
  }
}

- (BOOL)rotationEnabled
{
  return self->_rotationEnabled;
}

+ (int64_t)imageOrientationForExifOrientation:(int)a3
{
  if ((a3 - 2) > 6) {
    return 0;
  }
  else {
    return qword_1E2A15758[a3 - 2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    CGImageRelease(image);
  }
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  imageURL = self->_imageURL;
  self->_imageURL = 0;

  imageData = self->_imageData;
  self->_imageData = 0;

  imageType = self->_imageType;
  self->_imageType = 0;

  v8.receiver = self;
  v8.super_class = (Class)VUIImage;
  [(VUIImage *)&v8 dealloc];
}

+ (id)imageWithURL:(id)a3
{
  return (id)[a1 imageWithURL:a3 cacheImmediately:0];
}

+ (id)imageWithPath:(id)a3
{
  return (id)[a1 imageWithPath:a3 cacheImmediately:0];
}

+ (id)imageWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)[objc_alloc((Class)a1) initWithData:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)imageWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithCGImageRef:a3 imageOrientation:0 preserveAlpha:a4];
  return v4;
}

+ (id)imageWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  if (a3)
  {
    double v6 = (void *)[objc_alloc((Class)a1) initWithCGImageRef:a3 imageOrientation:a4 preserveAlpha:a5];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

+ (id)imageWithRotationFromURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  CFURLRef v5 = v4;
  if (v4 && (CGImageSourceRef v6 = CGImageSourceCreateWithURL(v4, 0)) != 0)
  {
    CGImageSourceRef v7 = v6;
    objc_super v8 = (void *)[objc_alloc((Class)a1) _initWithCGImageSourceRotationEnabled:v6];
    CFRelease(v7);
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

+ (id)imageWithRotationFromPath:(id)a3
{
  if (a3)
  {
    CFURLRef v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
    CFURLRef v5 = [a1 imageWithRotationFromURL:v4];
  }
  else
  {
    CFURLRef v5 = 0;
  }
  return v5;
}

- (VUIImage)initWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4
{
  return [(VUIImage *)self initWithCGImageRef:a3 imageOrientation:0 preserveAlpha:a4];
}

- (VUIImage)initWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    v14.receiver = self;
    v14.super_class = (Class)VUIImage;
    self = [(VUIImage *)&v14 init];
    objc_super v8 = self;
    if (self)
    {
      self->_image = a3;
      CFRetain(a3);
      v8->_imagedouble Width = (double)CGImageGetWidth(v8->_image);
      v8->_imagedouble Height = (double)CGImageGetHeight(v8->_image);
      v8->_unsigned int imageOrientation = [(id)objc_opt_class() exifOrientationForImageOrientation:a4];
      v8->_enableCache = 0;
      CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
      if (v5 && (AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0)) {
        CFDictionaryRef v10 = (id *)MEMORY[0x1E4F22678];
      }
      else {
        CFDictionaryRef v10 = (id *)MEMORY[0x1E4F22610];
      }
      uint64_t v11 = [*v10 copy];
      imageType = v8->_imageType;
      v8->_imageType = (NSString *)v11;

      v8->_imageBufferInMemory = 1;
      self = v8;
      objc_super v8 = self;
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (VUIImage)initWithCGImageRef:(CGImage *)a3 exifOrientation:(int)a4 preserveAlpha:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    v14.receiver = self;
    v14.super_class = (Class)VUIImage;
    self = [(VUIImage *)&v14 init];
    objc_super v8 = self;
    if (self)
    {
      self->_image = a3;
      CFRetain(a3);
      v8->_imagedouble Width = (double)CGImageGetWidth(v8->_image);
      v8->_imagedouble Height = (double)CGImageGetHeight(v8->_image);
      v8->_unsigned int imageOrientation = a4;
      v8->_enableCache = 0;
      CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
      if (v5 && (AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0)) {
        CFDictionaryRef v10 = (id *)MEMORY[0x1E4F22678];
      }
      else {
        CFDictionaryRef v10 = (id *)MEMORY[0x1E4F22610];
      }
      uint64_t v11 = [*v10 copy];
      imageType = v8->_imageType;
      v8->_imageType = (NSString *)v11;

      v8->_imageBufferInMemory = 1;
      self = v8;
      objc_super v8 = self;
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (VUIImage)initWithURL:(id)a3
{
  return [(VUIImage *)self initWithURL:a3 cacheImmediately:0];
}

- (VUIImage)initWithData:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (const __CFData *)a3;
  if (v5
    && (v19.receiver = self,
        v19.super_class = (Class)VUIImage,
        (self = [(VUIImage *)&v19 init]) != 0))
  {
    uint64_t v20 = *MEMORY[0x1E4F2FF18];
    v21[0] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    CGImageSourceRef v7 = CGImageSourceCreateWithData(v5, v6);
    self->_imageSource = v7;
    if (v7)
    {
      CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v6);
      v9 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FD00]];
      [v9 floatValue];
      self->_imagedouble Width = v10;

      uint64_t v11 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FCE8]];
      [v11 floatValue];
      self->_imagedouble Height = v12;

      CFDictionaryRef v13 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FCA0]];
      self->_unsigned int imageOrientation = [v13 intValue];

      Type = (__CFString *)CGImageSourceGetType(self->_imageSource);
      if (Type)
      {
        float v15 = (NSString *)[(__CFString *)Type copy];
        imageType = self->_imageType;
        self->_imageType = v15;
      }
      self->_enableCache = 0;
      self->_imageBufferInMemory = 1;
      self->_BOOL cacheImmediately = !+[VUICoreUtilities canHandleDecodingOnRenderThread];
      if (v8) {
        CFRelease(v8);
      }
      objc_storeStrong((id *)&self->_imageData, a3);
      float v17 = self;
    }
    else
    {
      float v17 = 0;
    }
  }
  else
  {
    float v17 = 0;
  }

  return v17;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = [(VUIImage *)self image];
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  CGContextDrawImage(a3, *(CGRect *)&v10, v9);
}

- (id)imageType
{
  return self->_imageType;
}

- (BOOL)hasAlpha
{
  return [(NSString *)self->_imageType isEqualToString:*MEMORY[0x1E4F22678]];
}

- (CGSize)pixelBounds
{
  imagedouble Width = self->_imageWidth;
  imagedouble Height = self->_imageHeight;
  result.CGFloat height = imageHeight;
  result.CGFloat width = imageWidth;
  return result;
}

- (float)aspectRatio
{
  imagedouble Height = self->_imageHeight;
  if (imageHeight == 0.0) {
    return 0.0;
  }
  else {
    return self->_imageWidth / imageHeight;
  }
}

- (BOOL)isPowerOfTwo
{
  return ((unint64_t)self->_imageWidth & ((unint64_t)self->_imageWidth - 1)) == 0
      && ((unint64_t)self->_imageHeight & ((unint64_t)self->_imageHeight - 1)) == 0;
}

- (BOOL)sourceRequiresRotation
{
  return (self->_imageOrientation - 2) < 7;
}

- (BOOL)enableCache
{
  return self->_enableCache;
}

- (CGRect)largestSquareRect
{
  [(VUIImage *)self pixelBounds];
  float v4 = v2;
  if (v3 >= v4)
  {
    float v6 = v2;
  }
  else
  {
    float v5 = v3;
    float v6 = v5;
  }
  BOOL v7 = v2 == v6;
  double v8 = floorf((float)(v4 * 0.5) - (float)(v6 * 0.5));
  double v9 = floor(v3 * 0.5 - (float)(v6 * 0.5));
  if (v7) {
    double v8 = 0.0;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = floorf(v6);
  double v11 = v10;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (id)squareImageFromNearSquareImageWithAspectRatioLimit:(float)a3
{
  float v4 = self;
  uint64_t v5 = [(VUIImage *)v4 image];
  if (!v5) {
    goto LABEL_10;
  }
  imagedouble Height = v4->_imageHeight;
  if (imageHeight == 0.0) {
    goto LABEL_10;
  }
  imagedouble Width = v4->_imageWidth;
  if (imageWidth == 0.0 || imageWidth == imageHeight) {
    goto LABEL_10;
  }
  BOOL v9 = imageWidth < imageHeight;
  double v10 = imageHeight / imageWidth;
  double v11 = imageWidth / imageHeight;
  if (!v9) {
    double v11 = v10;
  }
  float v12 = v11;
  if (v12 < a3)
  {
LABEL_10:
    CGFloat v13 = v4;
  }
  else
  {
    float v15 = (CGImage *)v5;
    [(VUIImage *)v4 largestSquareRect];
    v16 = CGImageCreateWithImageInRect(v15, v18);
    CGFloat v13 = +[VUIImage imageWithCGImageRef:v16 preserveAlpha:0];
    CGImageRelease(v16);
  }
  return v13;
}

- (BOOL)isImageBufferInMemory
{
  return self->_imageBufferInMemory;
}

+ (int)exifOrientationForImageOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 1;
  }
  else {
    return dword_1E2A15738[a3 - 1];
  }
}

- (id)_initWithCGImageSourceRotationEnabled:(CGImageSource *)a3
{
  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)VUIImage;
    self = [(VUIImage *)&v15 init];
    float v4 = self;
    if (self)
    {
      self->_imageSource = a3;
      CFRetain(a3);
      Type = (__CFString *)CGImageSourceGetType(v4->_imageSource);
      if (Type)
      {
        uint64_t v6 = [(__CFString *)Type copy];
        imageType = v4->_imageType;
        v4->_imageType = (NSString *)v6;
      }
      CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v4->_imageSource, 0, 0);
      BOOL v9 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FD00]];
      [v9 floatValue];
      v4->_imagedouble Width = v10;

      double v11 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FCE8]];
      [v11 floatValue];
      v4->_imagedouble Height = v12;

      CGFloat v13 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x1E4F2FCA0]];
      v4->_unsigned int imageOrientation = [v13 intValue];

      v4->_rotationEnabled = 1;
      v4->_enableCache = 0;
      if (v8) {
        CFRelease(v8);
      }
      [(VUIImage *)v4 _initializeCGImageWithRotation];
      self = v4;
      float v4 = self;
    }
  }
  else
  {
    float v4 = 0;
  }

  return v4;
}

- (void)setRotationEnabled:(BOOL)a3
{
  self->_rotationEnabled = a3;
}

@end