@interface UIImage(PRLikenessView)
+ (id)pr_imageWithCGImage:()PRLikenessView cropRect:;
+ (uint64_t)pr_imageWithCGImage:()PRLikenessView;
+ (uint64_t)pr_imageWithCGImage:()PRLikenessView size:scale:;
- (id)pr_circleImageOfDiameter:()PRLikenessView cropRect:;
- (uint64_t)pr_circleImageWithCropRect:()PRLikenessView;
- (uint64_t)pr_imageRef;
@end

@implementation UIImage(PRLikenessView)

+ (uint64_t)pr_imageWithCGImage:()PRLikenessView size:scale:
{
  return [MEMORY[0x263F1C6B0] imageWithCGImage:a6 scale:0 orientation:a3];
}

+ (uint64_t)pr_imageWithCGImage:()PRLikenessView
{
  return objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:");
}

+ (id)pr_imageWithCGImage:()PRLikenessView cropRect:
{
  CGImageRef v7 = PRImageCreateWithImageInRect(a7, a1, a2, a3, a4);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(MEMORY[0x263F1C6B0], "pr_imageWithCGImage:", v7);
    CGImageRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (uint64_t)pr_imageRef
{
  id v1 = a1;
  return [v1 CGImage];
}

- (id)pr_circleImageOfDiameter:()PRLikenessView cropRect:
{
  v10 = (CGImage *)objc_msgSend(a1, "pr_imageRef");
  if (v10 && (CGImageRef CircularImageInRect = PRImageCreateCircularImageInRect(v10, a3, a4, a5, a6)) != 0)
  {
    v12 = CircularImageInRect;
    v13 = objc_msgSend(MEMORY[0x263F1C6B0], "pr_imageWithCGImage:", CircularImageInRect);
    CGImageRelease(v12);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (uint64_t)pr_circleImageWithCropRect:()PRLikenessView
{
  if (CGRectIsEmpty(*(CGRect *)&a2))
  {
    [a1 size];
    double v11 = v10;
    [a1 size];
    if (v11 >= v12) {
      double v13 = v12;
    }
    else {
      double v13 = v11;
    }
  }
  else
  {
    double v13 = a4;
  }
  return objc_msgSend(a1, "pr_circleImageOfDiameter:cropRect:", v13, a2, a3, a4, a5);
}

@end