@interface BEImageFilter
+ (BOOL)imageIsFilteringCandidate:(CGImage *)a3;
+ (BOOL)isBlackAndWhite:(CGImage *)a3;
+ (id)invertedImage:(CGImage *)a3;
+ (id)pngDataForCIImage:(id)a3;
@end

@implementation BEImageFilter

+ (BOOL)imageIsFilteringCandidate:(CGImage *)a3
{
  if (CGImageGetHeight(a3) > 0x77) {
    return 0;
  }

  return +[BEImageFilter isBlackAndWhite:a3];
}

+ (BOOL)isBlackAndWhite:(CGImage *)a3
{
  v4 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x9C40uLL, 0xA94D847FuLL);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7 = CGBitmapContextCreate(v5, 0x64uLL, 0x64uLL, 8uLL, 0x190uLL, DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  if (v7)
  {
    CGContextSetInterpolationQuality(v7, kCGInterpolationNone);
    v16.size.width = 100.0;
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.height = 100.0;
    CGContextDrawImage(v7, v16, a3);
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      int v10 = v5[v8];
      int v11 = v10 - v5[v8 + 1];
      if (v11 < 0) {
        int v11 = v5[v8 + 1] - v10;
      }
      if (v11 > 5) {
        goto LABEL_10;
      }
      int v12 = v10 - v5[v8 + 2];
      if (v12 < 0) {
        int v12 = v5[v8 + 2] - v10;
      }
      if (v12 >= 6) {
LABEL_10:
      }
        ++v9;
      BOOL v13 = v9 < 100;
      if (v9 > 99) {
        break;
      }
      BOOL v14 = v8 >= 0x9C3C;
      v8 += 4;
    }
    while (!v14);
    CGContextRelease(v7);
  }
  else
  {
    BOOL v13 = 0;
  }
  free(v5);
  return v13;
}

+ (id)invertedImage:(CGImage *)a3
{
  v4 = +[CIFilter filterWithName:@"CIColorInvert"];
  [v4 setDefaults];
  v5 = +[CIImage imageWithCGImage:a3];
  [v4 setValue:v5 forKey:@"inputImage"];

  v6 = [v4 outputImage];

  return v6;
}

+ (id)pngDataForCIImage:(id)a3
{
  id v3 = a3;
  v4 = +[CIContext context];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v6 = [v4 PNGRepresentationOfImage:v3 format:kCIFormatRGBA8 colorSpace:DeviceRGB options:&__NSDictionary0__struct];

  CGColorSpaceRelease(DeviceRGB);

  return v6;
}

@end