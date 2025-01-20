@interface UIImage(ACMImage)
- (uint64_t)crop:()ACMImage;
@end

@implementation UIImage(ACMImage)

- (uint64_t)crop:()ACMImage
{
  [a1 scale];
  CGFloat v11 = a2 * v10;
  [a1 scale];
  CGFloat v13 = a3 * v12;
  [a1 scale];
  CGFloat v15 = a4 * v14;
  [a1 scale];
  CGFloat v17 = a5 * v16;
  v18 = (CGImage *)[a1 CGImage];
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  v19 = CGImageCreateWithImageInRect(v18, v24);
  v20 = (void *)MEMORY[0x263F1C6B0];
  [a1 scale];
  uint64_t v22 = [v20 imageWithCGImage:v19 scale:objc_msgSend(a1, "imageOrientation") orientation:v21];
  CGImageRelease(v19);
  return v22;
}

@end