@interface UIImage(PhotosUIFoundation)
+ (id)px_imageFromSolidColor:()PhotosUIFoundation;
+ (id)px_imageNamed:()PhotosUIFoundation bundle:;
+ (id)px_systemImageNamed:()PhotosUIFoundation withConfiguration:;
+ (uint64_t)px_imageNamed:()PhotosUIFoundation configuration:bundle:;
- (double)px_pixelSize;
- (id)px_tintedCircularImageWithColor:()PhotosUIFoundation backgroundColor:;
- (id)px_tintedCircularImageWithColor:()PhotosUIFoundation backgroundColor:backgroundInsets:;
- (id)px_tintedImageWithColor:()PhotosUIFoundation;
@end

@implementation UIImage(PhotosUIFoundation)

- (double)px_pixelSize
{
  [a1 size];
  double v3 = v2;
  [a1 scale];
  return v3 * v4;
}

+ (id)px_imageNamed:()PhotosUIFoundation bundle:
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "px_imageNamed:configuration:bundle:", v6, 0, v5);

  return v7;
}

+ (uint64_t)px_imageNamed:()PhotosUIFoundation configuration:bundle:
{
  return [MEMORY[0x263F827E8] imageNamed:a3 inBundle:a5 withConfiguration:a4];
}

- (id)px_tintedCircularImageWithColor:()PhotosUIFoundation backgroundColor:backgroundInsets:
{
  id v14 = a8;
  double v15 = *MEMORY[0x263F001A8];
  double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
  id v17 = a7;
  [a1 size];
  double v19 = v18;
  double v21 = v20;
  [a1 scale];
  CGFloat v23 = v22;
  v28.width = v19;
  v28.height = v21;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v23);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0);
  [v17 setFill];

  v29.origin.x = v15;
  v29.origin.y = v16;
  v29.size.width = v19;
  v29.size.height = v21;
  UIRectFillUsingBlendMode(v29, kCGBlendModeSourceIn);
  if (v14)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    [v14 setFill];
    CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationAtop);
    v30.origin.x = a3 + v15;
    v30.origin.y = a2 + v16;
    v30.size.width = v19 - (a3 + a5);
    v30.size.height = v21 - (a2 + a4);
    CGContextFillEllipseInRect(CurrentContext, v30);
  }
  v25 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v25;
}

- (id)px_tintedCircularImageWithColor:()PhotosUIFoundation backgroundColor:
{
  id v6 = a4;
  id v7 = a3;
  [a1 contentInsets];
  v8 = objc_msgSend(a1, "px_tintedCircularImageWithColor:backgroundColor:backgroundInsets:", v7, v6);

  return v8;
}

- (id)px_tintedImageWithColor:()PhotosUIFoundation
{
  CGFloat v4 = *MEMORY[0x263F001A8];
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  id v6 = a3;
  [a1 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [a1 scale];
  CGFloat v12 = v11;
  v16.width = v8;
  v16.height = v10;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v12);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0);
  [v6 setFill];

  v17.origin.x = v4;
  v17.origin.y = v5;
  v17.size.width = v8;
  v17.size.height = v10;
  UIRectFillUsingBlendMode(v17, kCGBlendModeSourceIn);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

+ (id)px_imageFromSolidColor:()PhotosUIFoundation
{
  id v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  id v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  double v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

+ (id)px_systemImageNamed:()PhotosUIFoundation withConfiguration:
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x263F827E8] systemImageNamed:v5 withConfiguration:v6];
  if (!v7)
  {
    double v7 = [MEMORY[0x263F827E8] _systemImageNamed:v5 withConfiguration:v6];
  }

  return v7;
}

@end