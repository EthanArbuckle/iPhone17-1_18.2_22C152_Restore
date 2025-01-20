@interface UIImage(SearchToShare)
- (id)sts_imageWithScalingFactor:()SearchToShare;
- (id)sts_nonAlphaImage;
@end

@implementation UIImage(SearchToShare)

- (id)sts_imageWithScalingFactor:()SearchToShare
{
  if (a2 <= 0.0)
  {
    v12 = 0;
  }
  else
  {
    double v2 = a2;
    id v3 = a1;
    v4 = (CGImage *)[v3 CGImage];
    float v5 = (double)CGImageGetWidth(v4) * v2;
    *(float *)&double v2 = (double)CGImageGetHeight(v4) * v2;
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v4);
    size_t BytesPerRow = CGImageGetBytesPerRow(v4);
    ColorSpace = CGImageGetColorSpace(v4);
    v9 = CGBitmapContextCreate(0, (unint64_t)v5, (unint64_t)*(float *)&v2, BitsPerComponent, BytesPerRow, ColorSpace, 0x2006u);
    v15.size.width = v5;
    v15.size.height = *(float *)&v2;
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    CGContextDrawImage(v9, v15, v4);
    Image = CGBitmapContextCreateImage(v9);
    CGContextRelease(v9);
    v11 = (void *)MEMORY[0x263F827E8];
    [v3 scale];
    v12 = objc_msgSend(v11, "imageWithCGImage:scale:orientation:", Image, 0);
    CGImageRelease(Image);
  }

  return v12;
}

- (id)sts_nonAlphaImage
{
  id v1 = a1;
  NonAlphaImageFromImage = createNonAlphaImageFromImage((CGImage *)[v1 CGImage]);
  id v3 = (void *)MEMORY[0x263F827E8];
  [v1 scale];
  v4 = objc_msgSend(v3, "imageWithCGImage:scale:orientation:", NonAlphaImageFromImage, 0);
  CGImageRelease(NonAlphaImageFromImage);

  return v4;
}

@end