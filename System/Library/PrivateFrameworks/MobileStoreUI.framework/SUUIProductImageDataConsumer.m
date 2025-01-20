@interface SUUIProductImageDataConsumer
+ (id)cardConsumer;
+ (id)chartsConsumer;
+ (id)consumerWithSize:(CGSize)a3;
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
- (CGSize)iconSize;
- (CGSize)imageSize;
- (SUUIColorScheme)colorScheme;
- (UIColor)backgroundColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForColor:(id)a3;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
@end

@implementation SUUIProductImageDataConsumer

+ (id)consumerWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id result = (id)[a1 consumer];
  *((CGFloat *)result + 2) = width;
  *((CGFloat *)result + 3) = height;
  return result;
}

+ (id)gridConsumer
{
  id result = (id)[a1 consumer];
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x4052C00000000000uLL);
  return result;
}

+ (id)lockupConsumerWithSize:(int64_t)a3 itemKind:(int64_t)a4
{
  uint64_t v6 = [a1 consumer];
  *(double *)(v6 + 16) = SUUILockupImageSizeForLockupSize(a3, a4);
  *(void *)(v6 + 24) = v7;
  return (id)v6;
}

+ (id)cardConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v5 = 72.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)chartsConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 67.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)updatesConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 57.0;
  if (v4 == 1) {
    double v5 = 72.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)purchasedConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 57.0;
  if (v4 == 1) {
    double v5 = 72.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)productPageConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 100.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v5 = 170.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)swooshConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 72.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v5 = 90.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)giftComposeConsumer
{
  id result = (id)[a1 consumer];
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x4052C00000000000uLL);
  return result;
}

+ (id)giftComposeLetterboxConsumer
{
  id result = (id)[a1 consumer];
  *((_OWORD *)result + 1) = xmmword_2568A0B00;
  return result;
}

+ (id)giftComposePosterConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v5 = qword_2568A0B10[(v4 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)giftThemeConsumer
{
  id result = (id)[a1 consumer];
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x404C800000000000uLL);
  return result;
}

+ (id)giftThemeLetterboxConsumer
{
  id result = (id)[a1 consumer];
  *((_OWORD *)result + 1) = xmmword_2568A0B20;
  return result;
}

+ (id)giftThemePosterConsumer
{
  id result = (id)[a1 consumer];
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x404C800000000000uLL);
  return result;
}

+ (id)giftResultConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 72.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v5 = 144.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)smartBannerConsumer
{
  v2 = [a1 consumer];
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v5 = 75.0;
  }
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)wishlistConsumer
{
  id result = (id)[a1 consumer];
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x4050000000000000uLL);
  return result;
}

- (CGSize)imageSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)imageForColor:(id)a3
{
  return -[SUUIProductImageDataConsumer imageForColor:size:](self, "imageForColor:size:", a3, self->_iconSize.width, self->_iconSize.height);
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v34[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = 0;
  if (width > 0.0 && height > 0.0)
  {
    long long v33 = 0uLL;
    long long v32 = 0u;
    long long v31 = 0u;
    SUUIIconFrameForIconSize((double *)&v33, (double *)&v31, width, height, self->_iconSize.width, self->_iconSize.height, 0.0);
    colorScheme = self->_colorScheme;
    id v29 = 0;
    id v30 = 0;
    id v28 = 0;
    SUUIIconColorsForColorScheme(colorScheme, &v30, &v29, &v28);
    id v10 = v30;
    id v11 = v29;
    id v12 = v28;
    id v13 = v10;
    v34[0] = [v13 CGColor];
    id v14 = v11;
    v34[1] = [v14 CGColor];
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    v16 = [MEMORY[0x263F157D0] layer];
    objc_msgSend(v16, "setBounds:", v31, v32);
    [v16 setColors:v15];
    [v16 setLocations:&unk_2705D09A0];
    v17 = [MEMORY[0x263F827B0] preferredFormat];
    v18 = [MEMORY[0x263F82B60] mainScreen];
    [v18 scale];
    objc_msgSend(v17, "setScale:");

    id v19 = objc_alloc(MEMORY[0x263F827A0]);
    v20 = (void *)[v19 initWithSize:v17 format:v33];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __51__SUUIProductImageDataConsumer_imageForColor_size___block_invoke;
    v23[3] = &unk_265401840;
    long long v25 = v33;
    long long v26 = v31;
    long long v27 = v32;
    v23[4] = self;
    id v24 = v16;
    id v21 = v16;
    v8 = [v20 imageWithActions:v23];
  }
  return v8;
}

void __51__SUUIProductImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(void **)(*(void *)(a1 + 32) + 8);
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
  v18.double width = 0.0;
  v18.double height = 0.0;
  long long v16 = 0u;
  long long v17 = 0u;
  [v4 size];
  SUUIIconFrameForIconSize(&v18.width, (double *)&v16, v5, v6, self->_iconSize.width, self->_iconSize.height, 0.0);
  colorScheme = self->_colorScheme;
  id v15 = 0;
  SUUIIconColorsForColorScheme(colorScheme, 0, 0, &v15);
  id v8 = v15;
  BOOL v9 = self->_backgroundColor != 0;
  id v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  UIGraphicsBeginImageContextWithOptions(v18, v9, v11);

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    [(UIColor *)backgroundColor set];
    v20.size.double width = v18.width;
    v20.size.double height = v18.height;
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    UIRectFill(v20);
  }
  objc_msgSend(v4, "drawInRect:", v16, v17);
  id v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_backgroundColor);
  objc_storeStrong((id *)(v4 + 32), self->_colorScheme);
  *(CGSize *)(v4 + 16) = self->_iconSize;
  return (id)v4;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (SUUIColorScheme)colorScheme
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

@end