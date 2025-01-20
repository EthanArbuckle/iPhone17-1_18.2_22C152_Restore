@interface UIImage(VideosUI)
+ (id)imageWithColor:()VideosUI;
+ (id)vui_videosUIImageNamed:()VideosUI;
- (id)vui_aspectFitImageOfSize:()VideosUI;
- (id)vui_croppedImageOfSize:()VideosUI;
- (id)vui_iconImageOfSize:()VideosUI radius:stroke:;
- (uint64_t)vui_iconImageOfSize:()VideosUI;
- (uint64_t)vui_iconImageOfSize:()VideosUI radius:;
@end

@implementation UIImage(VideosUI)

+ (id)vui_videosUIImageNamed:()VideosUI
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = objc_msgSend(v3, "vui_videosUIBundle");
  v6 = [MEMORY[0x1E4FB1818] imageNamed:v4 inBundle:v5];

  return v6;
}

+ (id)imageWithColor:()VideosUI
{
  id v3 = a3;
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  [v3 setFill];

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  id v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v4;
}

- (uint64_t)vui_iconImageOfSize:()VideosUI
{
  +[VUIAppIconImageService iconCornerRadiusForSize:](VUIAppIconImageService, "iconCornerRadiusForSize:");
  return objc_msgSend(a1, "vui_iconImageOfSize:radius:", a2, a3, v6);
}

- (uint64_t)vui_iconImageOfSize:()VideosUI radius:
{
  CGRect v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  double v10 = 1.0 / v9;

  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 2) {
    double v13 = 0.0;
  }
  else {
    double v13 = v10;
  }
  return objc_msgSend(a1, "vui_iconImageOfSize:radius:stroke:", a2, a3, a4, v13);
}

- (id)vui_iconImageOfSize:()VideosUI radius:stroke:
{
  double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  CGFloat v12 = v11;

  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v15 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E4F1DAD8], v14, a2, a3, a4);
  [v15 setLineWidth:a5];
  v22.width = a2;
  v22.height = a3;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  [v15 addClip];
  v17 = (void *)[a1 copy];
  objc_msgSend(v17, "drawInRect:blendMode:alpha:", 17, v13, v14, a2, a3, 1.0);
  if (a5 != 0.0)
  {
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    [v18 setStroke];

    [v15 strokeWithBlendMode:5 alpha:1.0];
  }
  v19 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();
  return v19;
}

- (id)vui_aspectFitImageOfSize:()VideosUI
{
  v5 = (void *)[a1 copy];
  [v5 size];
  double v8 = a2 / v6;
  if (a2 / v6 < a3 / v7) {
    double v8 = a3 / v7;
  }
  double v9 = floor(v6 * v8);
  double v10 = floor(v7 * v8);
  id v11 = objc_alloc_init(MEMORY[0x1E4FB17E0]);
  [v11 setScale:1.0];
  CGFloat v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v11, v9, v10);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__UIImage_VideosUI__vui_aspectFitImageOfSize___block_invoke;
  v16[3] = &unk_1E6DFA878;
  id v17 = v5;
  double v18 = v9;
  double v19 = v10;
  id v13 = v5;
  double v14 = [v12 imageWithActions:v16];

  return v14;
}

- (id)vui_croppedImageOfSize:()VideosUI
{
  id v5 = (id) [a1 copy];
  double Width = (double)CGImageGetWidth((CGImageRef)[v5 CGImage]);
  id v7 = v5;
  CGFloat v8 = floor(((double)CGImageGetHeight((CGImageRef)[v7 CGImage]) - a3) * 0.5);
  id v9 = v7;
  double v10 = (CGImage *)[v9 CGImage];
  v17.origin.x = floor((Width - a2) * 0.5);
  v17.origin.y = v8;
  v17.size.width = a3;
  v17.size.height = a2;
  CGImageRef v11 = CGImageCreateWithImageInRect(v10, v17);
  if (v11)
  {
    CGFloat v12 = v11;
    objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", v11, objc_msgSend(v9, "imageOrientation"), 1.0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v12);
  }
  else
  {
    double v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[UIImage(VideosUI) vui_croppedImageOfSize:](v14);
    }

    id v13 = v9;
  }

  return v13;
}

- (void)vui_croppedImageOfSize:()VideosUI .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIImage::croppedImageOfSize - The created imageRef is nil. Returning unaltered image", v1, 2u);
}

@end