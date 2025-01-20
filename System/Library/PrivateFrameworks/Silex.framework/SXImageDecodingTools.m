@interface SXImageDecodingTools
+ (id)sharedInstance;
- (BOOL)dataIsAnimatedImage:(id)a3;
- (CGColorSpace)P3ColorSpace;
- (CGColorSpace)RGBColorSpace;
- (CGImage)newImageByDecodingImage:(CGImage *)a3 size:(CGSize)a4;
- (__CFString)contentTypeForImageData:(id)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)decodeImage:(CGImage *)a3;
- (id)imageFromData:(id)a3;
- (id)imageFromData:(id)a3 size:(CGSize)a4;
- (id)loadAnimatedImageFromImageData:(id)a3 size:(CGSize)a4;
@end

@implementation SXImageDecodingTools

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __38__SXImageDecodingTools_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SXImageDecodingTools);
  return MEMORY[0x270F9A758]();
}

- (id)imageFromData:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v7 = (objc_class *)MEMORY[0x263F1C6B0];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithData:v8];

  v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 scale];
  double v12 = v11;

  id v13 = v9;
  v14 = -[SXImageDecodingTools newImageByDecodingImage:size:](self, "newImageByDecodingImage:size:", [v13 CGImage], width * v12, height * v12);
  v15 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v14 scale:0 orientation:v12];
  CGImageRelease(v14);

  return v15;
}

- (id)imageFromData:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
    uint64_t v8 = *MEMORY[0x263F0F608];
    v9[0] = *MEMORY[0x263EFFB40];
    CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, v4);
    v6 = [MEMORY[0x263F1C6B0] imageWithCGImage:ImageAtIndex];
    CGImageRelease(ImageAtIndex);
    CFRelease(v3);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (id)decodeImage:(CGImage *)a3
{
  v3 = -[SXImageDecodingTools newImageByDecodingImage:size:](self, "newImageByDecodingImage:size:", a3, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  id v4 = objc_alloc(MEMORY[0x263F1C6B0]);
  v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  v6 = objc_msgSend(v4, "initWithCGImage:scale:orientation:", v3, 0);

  CGImageRelease(v3);
  return v6;
}

- (CGImage)newImageByDecodingImage:(CGImage *)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGImageRetain(a3);
  size_t v8 = CGImageGetWidth(a3);
  size_t v9 = CGImageGetHeight(a3);
  v10 = [(SXImageDecodingTools *)self RGBColorSpace];
  if (objc_msgSend(MEMORY[0x263F1C5C0], "sx_isSpectreDevice"))
  {
    ColorSpace = CGImageGetColorSpace(a3);
    if (CGColorSpaceIsWideGamutRGB(ColorSpace)) {
      v10 = [(SXImageDecodingTools *)self P3ColorSpace];
    }
  }
  if (width <= 0.0 || height <= 0.0)
  {
    double height = (double)v9;
    double width = (double)v8;
  }
  double v12 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 0, v10, 2u);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.double width = width;
  v15.size.double height = height;
  CGContextDrawImage(v12, v15, a3);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  CGImageRelease(a3);
  return Image;
}

- (id)loadAnimatedImageFromImageData:(id)a3 size:(CGSize)a4
{
  return +[SXAnimatedImage animatedImageWithData:size:](SXAnimatedImage, "animatedImageWithData:size:", a3, a4.width, a4.height);
}

- (__CFString)contentTypeForImageData:(id)a3
{
  unsigned __int8 v5 = 0;
  [a3 getBytes:&v5 length:1];
  result = 0;
  if (v5 <= 0x4Cu)
  {
    if (v5 == 71)
    {
      id v4 = (__CFString **)MEMORY[0x263F01A40];
      return *v4;
    }
    if (v5 != 73) {
      return result;
    }
  }
  else if (v5 != 77)
  {
    if (v5 == 137)
    {
      id v4 = (__CFString **)MEMORY[0x263F01AE0];
    }
    else
    {
      if (v5 != 255) {
        return result;
      }
      id v4 = (__CFString **)MEMORY[0x263F01A80];
    }
    return *v4;
  }
  id v4 = (__CFString **)MEMORY[0x263F01B40];
  return *v4;
}

- (BOOL)dataIsAnimatedImage:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  unsigned __int8 v5 = [(SXImageDecodingTools *)self contentTypeForImageData:v4];
  if (v5 == (__CFString *)*MEMORY[0x263F01AE0] || v5 == (__CFString *)*MEMORY[0x263F01A40])
  {
    v7 = CGImageSourceCreateWithData(v4, 0);
    BOOL v8 = CGImageSourceGetCount(v7) > 1;
    CFRelease(v7);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CGColorSpace)RGBColorSpace
{
  if (RGBColorSpace_onceToken != -1) {
    dispatch_once(&RGBColorSpace_onceToken, &__block_literal_global_8);
  }
  return (CGColorSpace *)RGBColorSpace_colorSpace;
}

CGColorSpaceRef __37__SXImageDecodingTools_RGBColorSpace__block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  RGBColorSpace_colorSpace = (uint64_t)result;
  return result;
}

- (CGColorSpace)P3ColorSpace
{
  if (P3ColorSpace_onceToken != -1) {
    dispatch_once(&P3ColorSpace_onceToken, &__block_literal_global_10);
  }
  return (CGColorSpace *)P3ColorSpace_colorSpace;
}

CGColorSpaceRef __36__SXImageDecodingTools_P3ColorSpace__block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
  P3ColorSpace_colorSpace = (uint64_t)result;
  return result;
}

@end