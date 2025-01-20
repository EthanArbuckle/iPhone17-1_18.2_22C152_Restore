@interface UIImage(WKAdditions)
+ (id)wk_dynamicImageWithTraitCollectionToImageMap:()WKAdditions baseImage:;
+ (id)wk_imageFromColor:()WKAdditions;
+ (id)wk_imageWithContentsOfURL:()WKAdditions;
+ (id)wk_imageWithLightAppearanceImage:()WKAdditions darkAppearanceImage:;
+ (id)wk_overlayForegroundImage:()WKAdditions overBackgroundImage:;
+ (id)wk_splitThumbnailWithLightAppearanceImage:()WKAdditions darkAppearanceImage:;
+ (uint64_t)wk_internalSystemName:()WKAdditions;
- (id)wk_cropImageToRect:()WKAdditions;
@end

@implementation UIImage(WKAdditions)

+ (id)wk_imageWithContentsOfURL:()WKAdditions
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    v7 = [v3 lastPathComponent];
    v8 = [v7 lowercaseString];
    int v9 = [v8 hasSuffix:@"cpbitmap"];

    v10 = (void *)MEMORY[0x1E4FB1818];
    v11 = [v3 path];
    if (v9) {
      [v10 imageWithContentsOfCPBitmapFile:v11 flags:0];
    }
    else {
    v12 = [v10 imageWithContentsOfFile:v11];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)wk_imageFromColor:()WKAdditions
{
  id v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  int v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v7;
}

+ (uint64_t)wk_internalSystemName:()WKAdditions
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:");
}

+ (id)wk_imageWithLightAppearanceImage:()WKAdditions darkAppearanceImage:
{
  v17[2] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3;
  unint64_t v7 = a4;
  v8 = (void *)v7;
  if (v6 | v7)
  {
    if (v7)
    {
      if (v6)
      {
        int v9 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
        CGSize v10 = [v9 traitCollectionByModifyingTraits:&__block_literal_global_12];
        CGRect v11 = [v9 traitCollectionByModifyingTraits:&__block_literal_global_5_3];
        v16[0] = v10;
        v16[1] = v11;
        v17[0] = v6;
        v17[1] = v8;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
        v13 = objc_msgSend(a1, "wk_dynamicImageWithTraitCollectionToImageMap:baseImage:", v12, v6);

        goto LABEL_9;
      }
      id v14 = (id)v7;
    }
    else
    {
      id v14 = (id)v6;
    }
  }
  else
  {
    id v14 = (id)objc_opt_new();
  }
  v13 = v14;
LABEL_9:

  return v13;
}

+ (id)wk_overlayForegroundImage:()WKAdditions overBackgroundImage:
{
  unint64_t v5 = a3;
  unint64_t v6 = a4;
  unint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      if (v5)
      {
        [(id)v6 size];
        double v9 = v8;
        [(id)v5 size];
        double v11 = fmax(v9, v10);
        [v7 size];
        double v13 = v12;
        [(id)v5 size];
        double v15 = fmax(v13, v14);
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v11, v15);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __70__UIImage_WKAdditions__wk_overlayForegroundImage_overBackgroundImage___block_invoke;
        v20[3] = &unk_1E6377088;
        double v23 = v11;
        double v24 = v15;
        id v21 = v7;
        id v22 = (id)v5;
        v17 = [v16 imageWithActions:v20];

        goto LABEL_9;
      }
      id v18 = (id)v6;
    }
    else
    {
      id v18 = (id)v5;
    }
  }
  else
  {
    id v18 = (id)objc_opt_new();
  }
  v17 = v18;
LABEL_9:

  return v17;
}

+ (id)wk_splitThumbnailWithLightAppearanceImage:()WKAdditions darkAppearanceImage:
{
  unint64_t v5 = a3;
  unint64_t v6 = a4;
  unint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      if (v5)
      {
        [(id)v5 size];
        CGFloat v9 = v8 * 0.5;
        [(id)v5 size];
        CGFloat v11 = v10;
        [(id)v5 scale];
        double v13 = WKSizeApplyScale(v9, v11, v12);
        double v15 = v14;
        [v7 size];
        CGFloat v17 = v16 * 0.5;
        [v7 size];
        CGFloat v19 = v18;
        [v7 scale];
        double v21 = WKSizeApplyScale(v17, v19, v20);
        double v23 = v22;
        double v24 = objc_msgSend((id)v5, "wk_cropImageToRect:", 0.0, 0.0, v13, v15);
        v25 = objc_msgSend(v7, "wk_cropImageToRect:", v21, 0.0, v21, v23);
        double v26 = fmax(v15, v23);
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v13 + v21, v26);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __86__UIImage_WKAdditions__wk_splitThumbnailWithLightAppearanceImage_darkAppearanceImage___block_invoke;
        v31[3] = &unk_1E63770B0;
        *(double *)&v31[6] = v13 + v21;
        *(double *)&v31[7] = v26;
        *(double *)&v31[8] = v13;
        *(double *)&v31[9] = v15;
        *(double *)&v31[10] = v21;
        *(double *)&v31[11] = v23;
        v31[4] = v24;
        v31[5] = v25;
        v28 = [v27 imageWithActions:v31];

        goto LABEL_9;
      }
      id v29 = (id)v6;
    }
    else
    {
      id v29 = (id)v5;
    }
  }
  else
  {
    id v29 = (id)objc_opt_new();
  }
  v28 = v29;
LABEL_9:

  return v28;
}

+ (id)wk_dynamicImageWithTraitCollectionToImageMap:()WKAdditions baseImage:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  id v8 = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    id v8 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        double v13 = [v5 objectForKeyedSubscript:v12];
        double v14 = v13;
        if (!v8) {
          id v8 = v13;
        }
        double v15 = [v8 imageAsset];
        [v15 registerImage:v14 withTraitCollection:v12];
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v8;
}

- (id)wk_cropImageToRect:()WKAdditions
{
  uint64_t v9 = (CGImage *)[a1 CGImage];
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  uint64_t v10 = CGImageCreateWithImageInRect(v9, v14);
  CGFloat v11 = [MEMORY[0x1E4FB1818] imageWithCGImage:v10];
  CGImageRelease(v10);
  return v11;
}

@end