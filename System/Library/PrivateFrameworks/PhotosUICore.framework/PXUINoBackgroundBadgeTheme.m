@interface PXUINoBackgroundBadgeTheme
+ (id)sharedBadgeTheme;
- (CAFilter)imageCompositingFilter;
- (CAFilter)labelCompositingFilter;
- (Class)backgroundViewClass;
- (PXUINoBackgroundBadgeTheme)init;
- (UIBlurEffect)backgroundBlurEffect;
- (UIColor)afterLabelImageTintColor;
- (UIColor)backgroundBorderColor;
- (UIColor)backgroundColor;
- (UIColor)imageTintColor;
- (UIColor)labelTextColor;
- (UIFont)labelFont;
- (UIImageSymbolConfiguration)imageConfiguration;
- (double)backgroundAlpha;
- (double)backgroundBorderWidth;
- (double)backgroundCornerRadius;
- (double)imageAlpha;
- (double)labelAlpha;
@end

@implementation PXUINoBackgroundBadgeTheme

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
  objc_storeStrong((id *)&self->_backgroundBorderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundViewClass, 0);
  objc_storeStrong((id *)&self->_labelCompositingFilter, 0);
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_imageCompositingFilter, 0);
  objc_storeStrong((id *)&self->_afterLabelImageTintColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_imageConfiguration, 0);
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (UIColor)backgroundBorderColor
{
  return self->_backgroundBorderColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (double)backgroundBorderWidth
{
  return self->_backgroundBorderWidth;
}

- (double)backgroundCornerRadius
{
  return self->_backgroundCornerRadius;
}

- (Class)backgroundViewClass
{
  return self->_backgroundViewClass;
}

- (CAFilter)labelCompositingFilter
{
  return self->_labelCompositingFilter;
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (double)labelAlpha
{
  return self->_labelAlpha;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (CAFilter)imageCompositingFilter
{
  return self->_imageCompositingFilter;
}

- (UIColor)afterLabelImageTintColor
{
  return self->_afterLabelImageTintColor;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (double)imageAlpha
{
  return self->_imageAlpha;
}

- (UIImageSymbolConfiguration)imageConfiguration
{
  return self->_imageConfiguration;
}

- (PXUINoBackgroundBadgeTheme)init
{
  v20.receiver = self;
  v20.super_class = (Class)PXUINoBackgroundBadgeTheme;
  v2 = [(PXUINoBackgroundBadgeTheme *)&v20 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    uint64_t v4 = [MEMORY[0x1E4FB1830] configurationWithFont:v3];
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    *((void *)v2 + 2) = 0x3FF0000000000000;
    uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
    v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    objc_storeStrong((id *)v2 + 4, *((id *)v2 + 3));
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0;

    v9 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;
    id v10 = v3;

    *((void *)v2 + 7) = 0x3FF0000000000000;
    uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
    v12 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v11;

    v13 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = 0;

    uint64_t v14 = objc_opt_class();
    v15 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v14;

    *(_OWORD *)(v2 + 88) = 0u;
    v16 = (void *)*((void *)v2 + 14);
    *(_OWORD *)(v2 + 104) = 0u;

    v17 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = 0;

    v18 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = 0;
  }
  return (PXUINoBackgroundBadgeTheme *)v2;
}

+ (id)sharedBadgeTheme
{
  if (sharedBadgeTheme_onceToken_138 != -1) {
    dispatch_once(&sharedBadgeTheme_onceToken_138, &__block_literal_global_140);
  }
  v2 = (void *)sharedBadgeTheme_badgeTheme_137;
  return v2;
}

void __46__PXUINoBackgroundBadgeTheme_sharedBadgeTheme__block_invoke()
{
  v0 = objc_alloc_init(PXUINoBackgroundBadgeTheme);
  v1 = (void *)sharedBadgeTheme_badgeTheme_137;
  sharedBadgeTheme_badgeTheme_137 = (uint64_t)v0;
}

@end