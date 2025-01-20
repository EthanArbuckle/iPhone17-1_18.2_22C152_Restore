@interface SKUIProductImageDataConsumer
+ (SKUIProductImageDataConsumer)consumerWithSize:(CGSize)a3;
+ (id)cardConsumer;
+ (id)chartsConsumer;
+ (id)giftComposeConsumer;
+ (id)giftComposeLetterboxConsumer;
+ (id)giftComposePosterConsumer;
+ (id)giftResultConsumer;
+ (id)giftThemeConsumer;
+ (id)giftThemeLetterboxConsumer;
+ (id)giftThemePosterConsumer;
+ (id)gridConsumer;
+ (id)lockupConsumerWithSize:(int64_t)a3 itemKind:(int64_t)a4;
+ (id)productPageConsumer;
+ (id)purchasedConsumer;
+ (id)smartBannerConsumer;
+ (id)swooshConsumer;
+ (id)updatesConsumer;
+ (id)wishlistConsumer;
+ (void)cardConsumer;
+ (void)chartsConsumer;
+ (void)giftComposeConsumer;
+ (void)giftComposeLetterboxConsumer;
+ (void)giftComposePosterConsumer;
+ (void)giftResultConsumer;
+ (void)giftThemeConsumer;
+ (void)giftThemeLetterboxConsumer;
+ (void)giftThemePosterConsumer;
+ (void)gridConsumer;
+ (void)productPageConsumer;
+ (void)purchasedConsumer;
+ (void)smartBannerConsumer;
+ (void)swooshConsumer;
+ (void)updatesConsumer;
+ (void)wishlistConsumer;
- (CGSize)iconSize;
- (CGSize)imageSize;
- (SKUIColorScheme)colorScheme;
- (UIColor)backgroundColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForColor:(id)a3;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (void)imageSize;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
@end

@implementation SKUIProductImageDataConsumer

+ (SKUIProductImageDataConsumer)consumerWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUIProductImageDataConsumer consumerWithSize:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v14 = [a1 consumer];
  v14[2] = width;
  v14[3] = height;

  return (SKUIProductImageDataConsumer *)v14;
}

+ (id)gridConsumer
{
  v2 = [a1 consumer];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer gridConsumer];
      }
    }
  }
  v2[1] = vdupq_n_s64(0x4052C00000000000uLL);

  return v2;
}

+ (id)lockupConsumerWithSize:(int64_t)a3 itemKind:(int64_t)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUIProductImageDataConsumer lockupConsumerWithSize:itemKind:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [a1 consumer];
  *(double *)(v15 + 16) = SKUILockupImageSizeForLockupSize(a3, a4);
  *(void *)(v15 + 24) = v16;

  return (id)v15;
}

+ (id)cardConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer cardConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 64.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = 72.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)chartsConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer chartsConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 64.0;
  if (v13 == 1) {
    double v14 = 67.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)updatesConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer updatesConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 57.0;
  if (v13 == 1) {
    double v14 = 72.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)purchasedConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer purchasedConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 57.0;
  if (v13 == 1) {
    double v14 = 72.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)productPageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer productPageConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 100.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = 170.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)swooshConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer swooshConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 72.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = 90.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)giftComposeConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer giftComposeConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  v11[1] = vdupq_n_s64(0x4052C00000000000uLL);

  return v11;
}

+ (id)giftComposeLetterboxConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer giftComposeLetterboxConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  v11[1] = xmmword_1C1CCC810;

  return v11;
}

+ (id)giftComposePosterConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer giftComposePosterConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  uint64_t v14 = qword_1C1CCC820[(v13 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)giftThemeConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer giftThemeConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  v11[1] = vdupq_n_s64(0x404C800000000000uLL);

  return v11;
}

+ (id)giftThemeLetterboxConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer giftThemeLetterboxConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  v11[1] = xmmword_1C1CCC830;

  return v11;
}

+ (id)giftThemePosterConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer giftThemePosterConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  v11[1] = vdupq_n_s64(0x404C800000000000uLL);

  return v11;
}

+ (id)giftResultConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer giftResultConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 72.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = 144.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)smartBannerConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        +[SKUIProductImageDataConsumer smartBannerConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 64.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v14 = 75.0;
  }
  v11[2] = v14;
  v11[3] = v14;

  return v11;
}

+ (id)wishlistConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIProductImageDataConsumer wishlistConsumer];
      }
    }
  }
  uint64_t v11 = [a1 consumer];
  v11[1] = vdupq_n_s64(0x4050000000000000uLL);

  return v11;
}

- (CGSize)imageSize
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUIProductImageDataConsumer *)v3 imageSize];
      }
    }
  }
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)imageForColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductImageDataConsumer imageForColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = -[SKUIProductImageDataConsumer imageForColor:size:](self, "imageForColor:size:", v4, self->_iconSize.width, self->_iconSize.height);

  return v13;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v41[2] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        -[SKUIProductImageDataConsumer imageForColor:size:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = 0;
  if (width > 0.0 && height > 0.0)
  {
    long long v40 = 0uLL;
    long long v39 = 0u;
    long long v38 = 0u;
    SKUIIconFrameForIconSize((double *)&v40, (double *)&v38, width, height, self->_iconSize.width, self->_iconSize.height, 0.0);
    colorScheme = self->_colorScheme;
    id v36 = 0;
    id v37 = 0;
    id v35 = 0;
    SKUIIconColorsForColorScheme(colorScheme, &v37, &v36, &v35);
    id v17 = v37;
    id v18 = v36;
    id v19 = v35;
    id v20 = v17;
    v41[0] = [v20 CGColor];
    id v21 = v18;
    v41[1] = [v21 CGColor];
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    v23 = [MEMORY[0x1E4F39BD0] layer];
    objc_msgSend(v23, "setBounds:", v38, v39);
    [v23 setColors:v22];
    [v23 setLocations:&unk_1F1D620F0];
    v24 = [MEMORY[0x1E4FB17E0] preferredFormat];
    v25 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v25 scale];
    objc_msgSend(v24, "setScale:");

    id v26 = objc_alloc(MEMORY[0x1E4FB17D8]);
    v27 = (void *)[v26 initWithSize:v24 format:v40];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __51__SKUIProductImageDataConsumer_imageForColor_size___block_invoke;
    v30[3] = &unk_1E642A880;
    long long v32 = v40;
    long long v33 = v38;
    long long v34 = v39;
    v30[4] = self;
    id v31 = v23;
    id v28 = v23;
    uint64_t v15 = [v27 imageWithActions:v30];
  }

  return v15;
}

void __51__SKUIProductImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v5) {
    [v5 setFill];
  }
  objc_msgSend(v6, "clipToRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(v6, "fillRect:", 0.0, 0.0, v3, v4);
  objc_msgSend(*(id *)(a1 + 40), "renderInContext:", objc_msgSend(v6, "CGContext"));
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductImageDataConsumer imageForImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v26.double width = 0.0;
  v26.double height = 0.0;
  long long v24 = 0u;
  long long v25 = 0u;
  [v4 size];
  SKUIIconFrameForIconSize(&v26.width, (double *)&v24, v13, v14, self->_iconSize.width, self->_iconSize.height, 0.0);
  colorScheme = self->_colorScheme;
  id v23 = 0;
  SKUIIconColorsForColorScheme(colorScheme, 0, 0, &v23);
  id v16 = v23;
  BOOL v17 = self->_backgroundColor != 0;
  id v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 scale];
  UIGraphicsBeginImageContextWithOptions(v26, v17, v19);

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    [(UIColor *)backgroundColor set];
    v28.size.double width = v26.width;
    v28.size.double height = v26.height;
    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    UIRectFill(v28);
  }
  objc_msgSend(v4, "drawInRect:", v24, v25);
  id v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductImageDataConsumer copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v13 + 8), self->_backgroundColor);
  objc_storeStrong((id *)(v13 + 32), self->_colorScheme);
  *(CGSize *)(v13 + 16) = self->_iconSize;
  return (id)v13;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (void)consumerWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)gridConsumer
{
}

+ (void)lockupConsumerWithSize:(uint64_t)a3 itemKind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)cardConsumer
{
}

+ (void)chartsConsumer
{
}

+ (void)updatesConsumer
{
}

+ (void)purchasedConsumer
{
}

+ (void)productPageConsumer
{
}

+ (void)swooshConsumer
{
}

+ (void)giftComposeConsumer
{
}

+ (void)giftComposeLetterboxConsumer
{
}

+ (void)giftComposePosterConsumer
{
}

+ (void)giftThemeConsumer
{
}

+ (void)giftThemeLetterboxConsumer
{
}

+ (void)giftThemePosterConsumer
{
}

+ (void)giftResultConsumer
{
}

+ (void)smartBannerConsumer
{
}

+ (void)wishlistConsumer
{
}

- (void)imageSize
{
}

- (void)imageForColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForColor:(uint64_t)a3 size:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end