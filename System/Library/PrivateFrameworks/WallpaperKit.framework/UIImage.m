@interface UIImage
@end

@implementation UIImage

uint64_t __77__UIImage_WKAdditions__wk_imageWithLightAppearanceImage_darkAppearanceImage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:1];
}

uint64_t __77__UIImage_WKAdditions__wk_imageWithLightAppearanceImage_darkAppearanceImage___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:2];
}

uint64_t __70__UIImage_WKAdditions__wk_overlayForegroundImage_overBackgroundImage___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) size];
  double v4 = (v2 - v3) * 0.5;
  double v5 = *(double *)(a1 + 56);
  [*(id *)(a1 + 32) size];
  double v7 = (v5 - v6) * 0.5;
  double v8 = *(double *)(a1 + 48);
  [*(id *)(a1 + 40) size];
  double v10 = (v8 - v9) * 0.5;
  double v11 = *(double *)(a1 + 56);
  [*(id *)(a1 + 40) size];
  double v13 = (v11 - v12) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", v4, v7);
  v14 = *(void **)(a1 + 40);
  return objc_msgSend(v14, "drawAtPoint:", v10, v13);
}

uint64_t __86__UIImage_WKAdditions__wk_splitThumbnailWithLightAppearanceImage_darkAppearanceImage___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 80);
  double v4 = (v2 - *(double *)(a1 + 88)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", 0.0, (v2 - *(double *)(a1 + 72)) * 0.5);
  double v5 = *(void **)(a1 + 40);
  return objc_msgSend(v5, "drawAtPoint:", v3, v4);
}

@end