@interface PXUIDefaultBadgeTheme
+ (id)sharedBadgeTheme;
- (CAFilter)imageCompositingFilter;
- (CAFilter)labelCompositingFilter;
- (Class)backgroundViewClass;
- (PXUIDefaultBadgeTheme)init;
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

@implementation PXUIDefaultBadgeTheme

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

- (PXUIDefaultBadgeTheme)init
{
  v26.receiver = self;
  v26.super_class = (Class)PXUIDefaultBadgeTheme;
  v2 = [(PXUIDefaultBadgeTheme *)&v26 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    uint64_t v4 = [MEMORY[0x1E4FB1830] configurationWithFont:v3];
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    *((void *)v2 + 2) = 0x3FE3333340000000;
    uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
    v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    uint64_t v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v9 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v8;

    uint64_t v10 = *MEMORY[0x1E4F3A2B8];
    uint64_t v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2B8]];
    v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    v13 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;
    id v14 = v3;

    *((void *)v2 + 7) = 0x3FE3333340000000;
    uint64_t v15 = [MEMORY[0x1E4FB1618] labelColor];
    v16 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v15;

    uint64_t v17 = [MEMORY[0x1E4F39BC0] filterWithType:v10];
    v18 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v17;

    uint64_t v19 = objc_opt_class();
    v20 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v19;

    *(_OWORD *)(v2 + 88) = xmmword_1AB30AC50;
    *((void *)v2 + 13) = 0x3FE99999A0000000;
    uint64_t v21 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v22 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v21;

    v23 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = 0;

    v24 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = 0;
  }
  return (PXUIDefaultBadgeTheme *)v2;
}

+ (id)sharedBadgeTheme
{
  if (sharedBadgeTheme_onceToken != -1) {
    dispatch_once(&sharedBadgeTheme_onceToken, &__block_literal_global_290210);
  }
  v2 = (void *)sharedBadgeTheme_badgeTheme;
  return v2;
}

void __41__PXUIDefaultBadgeTheme_sharedBadgeTheme__block_invoke()
{
  v0 = objc_alloc_init(PXUIDefaultBadgeTheme);
  v1 = (void *)sharedBadgeTheme_badgeTheme;
  sharedBadgeTheme_badgeTheme = (uint64_t)v0;
}

@end