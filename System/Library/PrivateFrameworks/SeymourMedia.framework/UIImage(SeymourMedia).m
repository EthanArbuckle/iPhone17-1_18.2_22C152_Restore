@interface UIImage(SeymourMedia)
+ (double)centerRect:()SeymourMedia inRect:;
+ (id)compositedImageWithSize:()SeymourMedia images:cornerRadius:blendMode:legacyMode:;
+ (id)imageWithSize:()SeymourMedia format:actions:;
- (uint64_t)initWithData:()SeymourMedia immediateLoadWithMaxSize:scale:;
@end

@implementation UIImage(SeymourMedia)

- (uint64_t)initWithData:()SeymourMedia immediateLoadWithMaxSize:scale:
{
  return objc_msgSend(a1, "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", a3, 0, 0);
}

+ (id)imageWithSize:()SeymourMedia format:actions:
{
  id v9 = a6;
  v10 = (objc_class *)MEMORY[0x263F827A0];
  id v11 = a5;
  v12 = objc_msgSend([v10 alloc], "initWithSize:format:", v11, a1, a2);

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__UIImage_SeymourMedia__imageWithSize_format_actions___block_invoke;
  v16[3] = &unk_264799628;
  double v18 = a1;
  double v19 = a2;
  id v17 = v9;
  id v13 = v9;
  v14 = [v12 imageWithActions:v16];

  return v14;
}

+ (id)compositedImageWithSize:()SeymourMedia images:cornerRadius:blendMode:legacyMode:
{
  id v14 = a6;
  id v15 = [v14 firstObject];
  v16 = (CGImage *)[v15 CGImage];
  uint64_t v17 = [v14 count];
  if (a4 <= 0.0
    && v17 == 1
    && v16
    && ((double Width = (double)CGImageGetWidth(v16),
         double Height = (double)CGImageGetHeight(v16),
         double v20 = round(a2),
         round(a3) == Height)
      ? (BOOL v21 = v20 == Width)
      : (BOOL v21 = 0),
        !v21 ? (BOOL v22 = a8 == 0) : (BOOL v22 = 0),
        !v22))
  {
    id v23 = v15;
  }
  else if ([v14 count])
  {
    if ((unint64_t)[v14 count] > 1) {
      objc_msgSend(MEMORY[0x263F827B0], "smu_preferredRendererFormat");
    }
    else {
    v24 = objc_msgSend(MEMORY[0x263F827B0], "smu_formatForImage:", v15);
    }
    [v24 setOpaque:1];
    v25 = objc_opt_class();
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __90__UIImage_SeymourMedia__compositedImageWithSize_images_cornerRadius_blendMode_legacyMode___block_invoke;
    v27[3] = &unk_264799650;
    double v29 = a4;
    double v30 = a2;
    double v31 = a3;
    int v33 = a7;
    id v28 = v14;
    uint64_t v32 = a1;
    objc_msgSend(v25, "imageWithSize:format:actions:", v24, v27, a2, a3);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (double)centerRect:()SeymourMedia inRect:
{
  return round(a5 + (a7 - a3) * 0.5);
}

@end