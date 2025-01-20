@interface TVGraphicsImageRenderer
+ (id)decodedImage:(id)a3 opaque:(BOOL)a4;
+ (id)formatWithCGImage:(CGImage *)a3;
+ (id)formatWithUIImage:(id)a3;
+ (id)imageWithSize:(CGSize)a3 alpha:(BOOL)a4 actions:(id)a5;
+ (id)imageWithSize:(CGSize)a3 alpha:(BOOL)a4 cgContextActions:(id)a5;
+ (id)imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5;
+ (id)imageWithSize:(CGSize)a3 format:(id)a4 cgContextActions:(id)a5;
+ (id)preferredFormat;
@end

@implementation TVGraphicsImageRenderer

+ (id)preferredFormat
{
  v2 = (void *)MEMORY[0x263F1C688];
  v3 = [MEMORY[0x263F1C920] mainScreen];
  v4 = [v3 traitCollection];
  v5 = [v2 formatForTraitCollection:v4];

  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];

  return v5;
}

+ (id)formatWithCGImage:(CGImage *)a3
{
  v4 = objc_opt_class();
  v5 = [MEMORY[0x263F1C6B0] imageWithCGImage:a3];
  v6 = [v4 formatWithUIImage:v5];

  return v6;
}

+ (id)formatWithUIImage:(id)a3
{
  id v3 = a3;
  if (formatWithUIImage__onceToken != -1) {
    dispatch_once(&formatWithUIImage__onceToken, &__block_literal_global_38);
  }
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v5;

  v7 = [MEMORY[0x263F1C5C0] currentDevice];
  int v8 = [v7 _supportsDeepColor];

  if (!v8)
  {
    v9 = 0;
LABEL_9:
    uint64_t v10 = +[TVGraphicsImageRenderer preferredFormat];

    v9 = (void *)v10;
    goto LABEL_10;
  }
  v9 = [v3 imageRendererFormat];
  [v9 setScale:v6];
  if (!v9 || formatWithUIImage__sOverrideDefault && formatWithUIImage__sPrefersExtendedRange) {
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

uint64_t __45__TVGraphicsImageRenderer_formatWithUIImage___block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"PrefersExtendedRange", @"com.apple.TVMLKit", (Boolean *)&formatWithUIImage__sOverrideDefault);
  formatWithUIImage__sPrefersExtendedRange = result;
  return result;
}

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x263F1C680];
  id v10 = a4;
  v11 = objc_msgSend([v9 alloc], "initWithSize:format:", v10, width, height);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__TVGraphicsImageRenderer_imageWithSize_format_actions___block_invoke;
  v15[3] = &unk_264BA8840;
  id v16 = v8;
  id v12 = v8;
  v13 = [v11 imageWithActions:v15];

  return v13;
}

void __56__TVGraphicsImageRenderer_imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGContextSetInterpolationQuality((CGContextRef)[v3 CGContext], kCGInterpolationHigh);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 cgContextActions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x263F1C680];
  id v10 = a4;
  v11 = objc_msgSend([v9 alloc], "initWithSize:format:", v10, width, height);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__TVGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke;
  v15[3] = &unk_264BA8868;
  double v17 = width;
  double v18 = height;
  id v16 = v8;
  id v12 = v8;
  v13 = [v11 imageWithActions:v15];

  return v13;
}

uint64_t __65__TVGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

+ (id)imageWithSize:(CGSize)a3 alpha:(BOOL)a4 actions:(id)a5
{
  BOOL v5 = a4;
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  v9 = +[TVGraphicsImageRenderer preferredFormat];
  [v9 setOpaque:!v5];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v9, width, height);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__TVGraphicsImageRenderer_imageWithSize_alpha_actions___block_invoke;
  v14[3] = &unk_264BA8840;
  id v15 = v8;
  id v11 = v8;
  id v12 = [v10 imageWithActions:v14];

  return v12;
}

void __55__TVGraphicsImageRenderer_imageWithSize_alpha_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGContextSetInterpolationQuality((CGContextRef)[v3 CGContext], kCGInterpolationHigh);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)imageWithSize:(CGSize)a3 alpha:(BOOL)a4 cgContextActions:(id)a5
{
  BOOL v5 = a4;
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  v9 = +[TVGraphicsImageRenderer preferredFormat];
  [v9 setOpaque:!v5];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v9, width, height);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__TVGraphicsImageRenderer_imageWithSize_alpha_cgContextActions___block_invoke;
  v14[3] = &unk_264BA8868;
  double v16 = width;
  double v17 = height;
  id v15 = v8;
  id v11 = v8;
  id v12 = [v10 imageWithActions:v14];

  return v12;
}

uint64_t __64__TVGraphicsImageRenderer_imageWithSize_alpha_cgContextActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

+ (id)decodedImage:(id)a3 opaque:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    double v6 = +[TVGraphicsImageRenderer formatWithUIImage:v5];
    [v6 setScale:1.0];
    [v6 setOpaque:v4];
    [v5 size];
    double v8 = v7;
    double v10 = v9;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__TVGraphicsImageRenderer_decodedImage_opaque___block_invoke;
    v13[3] = &unk_264BA7790;
    id v14 = v5;
    id v11 = +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v6, v13, v8, v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __47__TVGraphicsImageRenderer_decodedImage_opaque___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  [v1 size];
  return objc_msgSend(v1, "drawInRect:", v2, v3, v4, v5);
}

@end