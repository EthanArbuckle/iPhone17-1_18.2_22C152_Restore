@interface UIImage(SBFImageCGBitmapDrawing)
+ (id)sbf_imageFromBGRAContextWithSize:()SBFImageCGBitmapDrawing scale:colorSpace:withAlpha:pool:drawing:encapsulation:;
+ (id)sbf_imageFromContextWithSize:()SBFImageCGBitmapDrawing scale:type:pool:drawing:;
+ (id)sbf_imageFromContextWithSize:()SBFImageCGBitmapDrawing scale:type:pool:drawing:encapsulation:;
+ (uint64_t)sbf_bytesNeededForSize:()SBFImageCGBitmapDrawing scale:withContextType:;
- (id)sbf_downscaledImageByDrawingIntoContextOfType:()SBFImageCGBitmapDrawing downscaleFactor:;
- (id)sbf_memoryMappedImageWithPool:()SBFImageCGBitmapDrawing;
- (uint64_t)sbf_imageByDrawingIntoContextOfType:()SBFImageCGBitmapDrawing;
@end

@implementation UIImage(SBFImageCGBitmapDrawing)

+ (uint64_t)sbf_bytesNeededForSize:()SBFImageCGBitmapDrawing scale:withContextType:
{
  unint64_t v6 = vcvtpd_u64_f64(a2 * a3);
  _SBFGraphicsContextComponentsCountForType(a6);
  return CGBitmapGetAlignedBytesPerRow() * v6;
}

+ (id)sbf_imageFromContextWithSize:()SBFImageCGBitmapDrawing scale:type:pool:drawing:encapsulation:
{
  v9 = (void *)_SBFCGBitmapImageCreate(a6, 0, a7, a8, a9, a1, a2, a3);
  return v9;
}

+ (id)sbf_imageFromContextWithSize:()SBFImageCGBitmapDrawing scale:type:pool:drawing:
{
  v8 = (void *)_SBFCGBitmapImageCreate(a6, 0, a7, a8, 0, a1, a2, a3);
  return v8;
}

+ (id)sbf_imageFromBGRAContextWithSize:()SBFImageCGBitmapDrawing scale:colorSpace:withAlpha:pool:drawing:encapsulation:
{
  v10 = (void *)_SBFCGBitmapImageCreate(a7 ^ 1u, a6, a8, a9, a10, a1, a2, a3);
  return v10;
}

- (uint64_t)sbf_imageByDrawingIntoContextOfType:()SBFImageCGBitmapDrawing
{
  return objc_msgSend(a1, "sbf_downscaledImageByDrawingIntoContextOfType:downscaleFactor:", 1.0);
}

- (id)sbf_downscaledImageByDrawingIntoContextOfType:()SBFImageCGBitmapDrawing downscaleFactor:
{
  v7 = objc_msgSend(a1, "sbf_CGImageBackedImage");
  [a1 size];
  double v9 = v8;
  double v11 = v10;
  [a1 scale];
  double v13 = v12 / a2;
  v14 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__UIImage_SBFImageCGBitmapDrawing__sbf_downscaledImageByDrawingIntoContextOfType_downscaleFactor___block_invoke;
  v18[3] = &unk_1E548CA88;
  id v19 = v7;
  id v15 = v7;
  v16 = objc_msgSend(v14, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", a4, 0, v18, v9, v11, v13);

  return v16;
}

- (id)sbf_memoryMappedImageWithPool:()SBFImageCGBitmapDrawing
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C132FE0]();
  id v6 = a1;
  v7 = (CGImage *)[v6 CGImage];
  size_t Height = CGImageGetHeight(v7);
  size_t BytesPerRow = CGImageGetBytesPerRow(v7);
  unint64_t v10 = [v4 slotLength];
  if (BytesPerRow * Height <= v10
    && (unint64_t v11 = v10, (DataProvider = CGImageGetDataProvider(v7)) != 0)
    && (CFDataRef v13 = CGDataProviderCopyData(DataProvider)) != 0)
  {
    CFDataRef v14 = v13;
    unint64_t Length = CFDataGetLength(v13);
    if (Length <= v11)
    {
      CFDataRef v18 = [v4 nextSlotWithBytes:CFDataGetBytePtr(v14) length:Length];
      CFDataRef v19 = v18;
      if (v18 && (CGDataProviderRef v20 = CGDataProviderCreateWithCFData(v18)) != 0)
      {
        v21 = v20;
        size_t Width = CGImageGetWidth(v7);
        size_t BitsPerComponent = CGImageGetBitsPerComponent(v7);
        size_t bitsPerPixel = CGImageGetBitsPerPixel(v7);
        ColorSpace = CGImageGetColorSpace(v7);
        CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(v7);
        CGImageRef v24 = CGImageCreate(Width, Height, BitsPerComponent, bitsPerPixel, BytesPerRow, ColorSpace, BitmapInfo, v21, 0, 0, kCGRenderingIntentDefault);
        if (v24)
        {
          v25 = v24;
          id v26 = objc_alloc(MEMORY[0x1E4F42A80]);
          [v6 scale];
          v16 = objc_msgSend(v26, "initWithCGImage:scale:orientation:", v25, objc_msgSend(v6, "imageOrientation"), v27);
          CGImageRelease(v25);
        }
        else
        {
          v16 = 0;
        }
        CGDataProviderRelease(v21);
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end