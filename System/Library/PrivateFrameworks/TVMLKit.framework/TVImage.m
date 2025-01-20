@interface TVImage
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
- (TVImage)initWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5;
- (TVImage)initWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4;
- (TVImage)initWithData:(id)a3;
- (TVImage)initWithURL:(id)a3;
- (TVImage)initWithURL:(id)a3 cacheImmediately:(BOOL)a4;
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

@implementation TVImage

+ (id)imageWithURL:(id)a3
{
  return (id)[a1 imageWithURL:a3 cacheImmediately:0];
}

+ (id)imageWithURL:(id)a3 cacheImmediately:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    v7 = (void *)[objc_alloc((Class)a1) initWithURL:v6 cacheImmediately:v4];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)imageWithPath:(id)a3
{
  return (id)[a1 imageWithPath:a3 cacheImmediately:0];
}

+ (id)imageWithPath:(id)a3 cacheImmediately:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = (objc_class *)NSURL;
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
  return (id)[a1 imageWithCGImageRef:a3 imageOrientation:0 preserveAlpha:a4];
}

+ (id)imageWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  if (a3)
  {
    id v6 = (void *)[objc_alloc((Class)a1) initWithCGImageRef:a3 imageOrientation:a4 preserveAlpha:a5];
  }
  else
  {
    id v6 = 0;
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
    v8 = (void *)[objc_alloc((Class)a1) _initWithCGImageSourceRotationEnabled:v6];
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)imageWithRotationFromPath:(id)a3
{
  if (a3)
  {
    CFURLRef v4 = objc_msgSend(NSURL, "fileURLWithPath:");
    CFURLRef v5 = [a1 imageWithRotationFromURL:v4];
  }
  else
  {
    CFURLRef v5 = 0;
  }
  return v5;
}

- (TVImage)initWithCGImageRef:(CGImage *)a3 preserveAlpha:(BOOL)a4
{
  return [(TVImage *)self initWithCGImageRef:a3 imageOrientation:0 preserveAlpha:a4];
}

- (TVImage)initWithCGImageRef:(CGImage *)a3 imageOrientation:(int64_t)a4 preserveAlpha:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    v14.receiver = self;
    v14.super_class = (Class)TVImage;
    self = [(TVImage *)&v14 init];
    v8 = self;
    if (self)
    {
      self->_image = a3;
      CFRetain(a3);
      v8->_imageWidth = (double)CGImageGetWidth(v8->_image);
      v8->_imageHeight = (double)CGImageGetHeight(v8->_image);
      v8->_imageOrientation = [(id)objc_opt_class() exifOrientationForImageOrientation:a4];
      v8->_enableCache = 0;
      CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
      if (v5 && (AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0)) {
        v10 = (id *)MEMORY[0x263F01AE0];
      }
      else {
        v10 = (id *)MEMORY[0x263F01A80];
      }
      uint64_t v11 = [*v10 copy];
      imageType = v8->_imageType;
      v8->_imageType = (NSString *)v11;

      v8->_imageBufferInMemory = 1;
      self = v8;
      v8 = self;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (TVImage)initWithURL:(id)a3
{
  return [(TVImage *)self initWithURL:a3 cacheImmediately:0];
}

- (TVImage)initWithURL:(id)a3 cacheImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  v27[1] = *MEMORY[0x263EF8340];
  CFURLRef v7 = (const __CFURL *)a3;
  if (v7
    && (v23.receiver = self,
        v23.super_class = (Class)TVImage,
        (self = [(TVImage *)&v23 init]) != 0))
  {
    uint64_t v26 = *MEMORY[0x263F0F600];
    uint64_t v8 = MEMORY[0x263EFFA88];
    v27[0] = MEMORY[0x263EFFA88];
    v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    self->_cacheImmediately = v4;
    if (v4)
    {
      uint64_t v24 = *MEMORY[0x263F0F608];
      uint64_t v25 = v8;
      CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

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
      objc_super v14 = [(__CFDictionary *)v13 objectForKey:*MEMORY[0x263F0F4F8]];
      [v14 floatValue];
      self->_imageWidth = v15;

      v16 = [(__CFDictionary *)v13 objectForKey:*MEMORY[0x263F0F4F0]];
      [v16 floatValue];
      self->_imageHeight = v17;

      v18 = [(__CFDictionary *)v13 objectForKey:*MEMORY[0x263F0F4C8]];
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
      uint64_t v11 = self;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (TVImage)initWithData:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  CFDataRef v5 = (const __CFData *)a3;
  if (v5
    && (v19.receiver = self,
        v19.super_class = (Class)TVImage,
        (self = [(TVImage *)&v19 init]) != 0))
  {
    uint64_t v20 = *MEMORY[0x263F0F608];
    v21[0] = MEMORY[0x263EFFA88];
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    CFURLRef v7 = CGImageSourceCreateWithData(v5, v6);
    self->_imageSource = v7;
    if (v7)
    {
      CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v6);
      v9 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4F8]];
      [v9 floatValue];
      self->_imageWidth = v10;

      uint64_t v11 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4F0]];
      [v11 floatValue];
      self->_imageHeight = v12;

      CFDictionaryRef v13 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4C8]];
      self->_imageOrientation = [v13 intValue];

      Type = (__CFString *)CGImageSourceGetType(self->_imageSource);
      if (Type)
      {
        float v15 = (NSString *)[(__CFString *)Type copy];
        imageType = self->_imageType;
        self->_imageType = v15;
      }
      self->_enableCache = 0;
      self->_imageBufferInMemory = 1;
      self->_cacheImmediately = !+[TVMLUtilities canHandleDecodingOnRenderThread];
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
  v8.super_class = (Class)TVImage;
  [(TVImage *)&v8 dealloc];
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = [(TVImage *)self image];
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  CGContextDrawImage(a3, *(CGRect *)&v10, v9);
}

- (id)uiImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = self;
  uint64_t v4 = [(TVImage *)v3 image];
  CFDataRef v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  CFURLRef v7 = objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v4, -[TVImage _uiImageOrientation](v3, "_uiImageOrientation"), v6);

  return v7;
}

- (CGImage)image
{
  v2 = self;
  objc_sync_enter(v2);
  image = v2->_image;
  if (!image)
  {
    [(TVImage *)v2 _initializeCGImageWithRotation];
    image = v2->_image;
  }
  objc_sync_exit(v2);

  return image;
}

- (id)imageType
{
  return self->_imageType;
}

- (BOOL)hasAlpha
{
  return [(NSString *)self->_imageType isEqualToString:*MEMORY[0x263F01AE0]];
}

- (CGSize)pixelBounds
{
  double imageWidth = self->_imageWidth;
  double imageHeight = self->_imageHeight;
  result.CGFloat height = imageHeight;
  result.CGFloat width = imageWidth;
  return result;
}

- (float)aspectRatio
{
  double imageHeight = self->_imageHeight;
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

- (void)setEnableCache:(BOOL)a3
{
  self->_enableCache = a3;
  if (!self->_imageBufferInMemory && a3) {
    self->_imageBufferInMemorCGFloat y = 1;
  }
}

- (BOOL)enableCache
{
  return self->_enableCache;
}

- (CGRect)largestSquareRect
{
  [(TVImage *)self pixelBounds];
  float v4 = v2;
  if (v3 < v4)
  {
    float v5 = v3;
    float v4 = v5;
  }
  double v6 = (float)(v4 * 0.5);
  BOOL v7 = v2 == v4;
  float v8 = v2 * 0.5 - v6;
  double v9 = floorf(v8);
  double v10 = floor(v3 * 0.5 - v6);
  if (v7) {
    double v9 = 0.0;
  }
  else {
    double v10 = 0.0;
  }
  double v11 = floorf(v4);
  double v12 = v11;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (id)squareImageFromNearSquareImageWithAspectRatioLimit:(float)a3
{
  float v4 = self;
  uint64_t v5 = [(TVImage *)v4 image];
  if (!v5) {
    goto LABEL_10;
  }
  double imageHeight = v4->_imageHeight;
  if (imageHeight == 0.0) {
    goto LABEL_10;
  }
  double imageWidth = v4->_imageWidth;
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
    [(TVImage *)v4 largestSquareRect];
    v16 = CGImageCreateWithImageInRect(v15, v18);
    CGFloat v13 = +[TVImage imageWithCGImageRef:v16 preserveAlpha:0];
    CGImageRelease(v16);
  }
  return v13;
}

- (BOOL)isImageBufferInMemory
{
  return self->_imageBufferInMemory;
}

- (int64_t)_uiImageOrientation
{
  double v3 = objc_opt_class();
  uint64_t v4 = [(TVImage *)self orientation];
  return [v3 imageOrientationForExifOrientation:v4];
}

+ (int)exifOrientationForImageOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 1;
  }
  else {
    return dword_230C38050[a3 - 1];
  }
}

+ (int64_t)imageOrientationForExifOrientation:(int)a3
{
  if ((a3 - 2) > 6) {
    return 0;
  }
  else {
    return qword_230C38070[a3 - 2];
  }
}

- (id)_initWithCGImageSourceRotationEnabled:(CGImageSource *)a3
{
  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)TVImage;
    self = [(TVImage *)&v15 init];
    uint64_t v4 = self;
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
      BOOL v9 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4F8]];
      [v9 floatValue];
      v4->_double imageWidth = v10;

      double v11 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4F0]];
      [v11 floatValue];
      v4->_double imageHeight = v12;

      CGFloat v13 = [(__CFDictionary *)v8 objectForKey:*MEMORY[0x263F0F4C8]];
      v4->_imageOrientation = [v13 intValue];

      v4->_rotationEnabled = 1;
      v4->_enableCache = 0;
      if (v8) {
        CFRelease(v8);
      }
      [(TVImage *)v4 _initializeCGImageWithRotation];
      self = v4;
      uint64_t v4 = self;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_initializeCGImageWithRotation
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "Null image source after creation", v1, 2u);
}

void __41__TVImage__initializeCGImageWithRotation__block_invoke(uint64_t a1, CGContextRef c)
{
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(c);
  uint64_t v4 = *(CGImage **)(*(void *)(a1 + 32) + 8);
  CGContextDrawImage(c, ClipBoundingBox, v4);
}

- (int)orientation
{
  return self->_imageOrientation;
}

- (BOOL)rotationEnabled
{
  return self->_rotationEnabled;
}

- (void)setRotationEnabled:(BOOL)a3
{
  self->_rotationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end