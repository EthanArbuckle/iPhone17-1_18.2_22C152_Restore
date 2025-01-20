@interface WBSImageUtilities
+ (BOOL)image:(id)a3 isEqualToImage:(id)a4;
+ (BOOL)saveCGImage:(CGImage *)a3 toFile:(id)a4 options:(id)a5;
+ (CGSize)imageSizeScalingSize:(CGSize)result proportionallyToFitSize:(CGSize)a4;
+ (NSSet)safari_CGImageTypes;
+ (id)_pixelDataForImage:(id)a3;
+ (id)flatImage:(id)a3 withColor:(id)a4;
+ (id)handoffIconForDeviceType:(id)a3;
+ (id)readingListThumbnailDataFromImage:(id)a3;
+ (id)resizedImage:(id)a3 withSize:(CGSize)a4;
+ (id)squareThumbnailImageFromImage:(id)a3 thumbnailWidthInPixels:(double)a4;
@end

@implementation WBSImageUtilities

+ (NSSet)safari_CGImageTypes
{
  if (+[WBSImageUtilities safari_CGImageTypes]::once != -1) {
    dispatch_once(&+[WBSImageUtilities safari_CGImageTypes]::once, &__block_literal_global_21);
  }
  v2 = (void *)+[WBSImageUtilities safari_CGImageTypes]::supportedImageTypes;
  return (NSSet *)v2;
}

void __40__WBSImageUtilities_safari_CGImageTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  CFArrayRef v3 = CGImageSourceCopyTypeIdentifiers();
  uint64_t v1 = objc_msgSend(v0, "setWithArray:");
  v2 = (void *)+[WBSImageUtilities safari_CGImageTypes]::supportedImageTypes;
  +[WBSImageUtilities safari_CGImageTypes]::supportedImageTypes = v1;
}

+ (BOOL)saveCGImage:(CGImage *)a3 toFile:(id)a4 options:(id)a5
{
  CFURLRef v7 = (const __CFURL *)a4;
  CFDictionaryRef v8 = (const __CFDictionary *)a5;
  v9 = [(id)*MEMORY[0x1E4F44410] identifier];
  v10 = CGImageDestinationCreateWithURL(v7, v9, 1uLL, 0);

  if (v10)
  {
    CGImageDestinationAddImage(v10, a3, v8);
    BOOL v11 = CGImageDestinationFinalize(v10);
    CFRelease(v10);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)squareThumbnailImageFromImage:(id)a3 thumbnailWidthInPixels:(double)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F982B8];
  id v7 = v5;
  CFDictionaryRef v8 = objc_msgSend(v6, "imageWithCGImage:", objc_msgSend(v7, "CGImage"));
  CGImageGetWidth((CGImageRef)[v8 CGImage]);
  CGImageGetHeight((CGImageRef)[v8 CGImage]);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = a4;
  v18.size.height = a4;
  double Width = CGRectGetWidth(v18);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = a4;
  v19.size.height = a4;
  CGFloat Height = CGRectGetHeight(v19);
  v12 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, 0, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = a4;
  v20.size.height = a4;
  CGFloat v13 = CGRectGetWidth(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = a4;
  v21.size.height = a4;
  v22.size.height = CGRectGetHeight(v21);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v13;
  CGContextClearRect(v12, v22);
  CGContextSetBlendMode(v12, kCGBlendModeCopy);
  [v8 CGImage];
  CGContextDrawImageFromRect();
  v14 = [MEMORY[0x1E4F982B8] imageByAdoptingCGImage:CGBitmapContextCreateImage(v12)];
  CGContextRelease(v12);
  v15 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:", objc_msgSend(v14, "CGImage"));

  return v15;
}

+ (id)flatImage:(id)a3 withColor:(id)a4
{
  v4 = [a3 _flatImageWithColor:a4];
  return v4;
}

+ (id)_pixelDataForImage:(id)a3
{
  DataProvider = CGImageGetDataProvider((CGImageRef)[a3 CGImage]);
  CFDataRef v4 = CGDataProviderCopyData(DataProvider);
  return v4;
}

+ (BOOL)image:(id)a3 isEqualToImage:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _pixelDataForImage:a3];
  CFDictionaryRef v8 = [a1 _pixelDataForImage:v6];
  char v9 = [v7 isEqualToData:v8];

  return v9;
}

+ (CGSize)imageSizeScalingSize:(CGSize)result proportionallyToFitSize:(CGSize)a4
{
  if (result.width > a4.width || result.height > a4.height)
  {
    double v5 = a4.width / result.width;
    double v6 = a4.height / result.height;
    if (v5 >= v6) {
      double v7 = v6;
    }
    else {
      double v7 = v5;
    }
    result.width = result.width * v7;
    result.height = result.height * v7;
  }
  return result;
}

+ (id)resizedImage:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 size];
  if (v8 != width || v7 != height)
  {
    v14.double width = width;
    v14.double height = height;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
    objc_msgSend(v6, "drawInRect:", 0.0, 0.0, width, height);
    v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if ([v6 renderingMode])
    {
      uint64_t v11 = objc_msgSend(v10, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));

      v10 = (void *)v11;
    }

    id v6 = v10;
  }
  return v6;
}

+ (id)handoffIconForDeviceType:(id)a3
{
  CFArrayRef v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length])
  {
    if (UTTypeConformsTo(v3, @"com.apple.mac.laptop"))
    {
      CFDataRef v4 = @"HandoffMacBookTemplate";
    }
    else if (UTTypeConformsTo(v3, @"com.apple.mac"))
    {
      CFDataRef v4 = @"HandoffMacTemplate";
    }
    else if (UTTypeConformsTo(v3, @"com.apple.watch"))
    {
      CFDataRef v4 = @"HandoffWatchTemplate";
    }
    else if (UTTypeConformsTo(v3, @"com.apple.iphone") || UTTypeConformsTo(v3, @"com.apple.ipod"))
    {
      CFDataRef v4 = @"HandoffIphoneTemplate";
    }
    else if (UTTypeConformsTo(v3, @"com.apple.ipad"))
    {
      CFDataRef v4 = @"HandoffIpadTemplate";
    }
    else
    {
      UTTypeConformsTo(v3, @"public.device");
      CFDataRef v4 = @"HandoffGenericTemplate";
    }
    uint64_t v5 = [MEMORY[0x1E4F42A80] imageNamed:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42A80] imageNamed:@"HandoffGenericTemplate"];
  }
  id v6 = (void *)v5;

  return v6;
}

+ (id)readingListThumbnailDataFromImage:(id)a3
{
  CFArrayRef v3 = [a1 squareThumbnailImageFromImage:a3 thumbnailWidthInPixels:192.0];
  CFDataRef v4 = objc_msgSend(v3, "safari_pngData");

  return v4;
}

@end