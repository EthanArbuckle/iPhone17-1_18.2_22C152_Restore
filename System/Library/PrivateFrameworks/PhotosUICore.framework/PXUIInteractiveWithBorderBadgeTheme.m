@interface PXUIInteractiveWithBorderBadgeTheme
+ (id)sharedToggledOffBadgeTheme;
+ (id)sharedToggledOffOverContentBadgeTheme;
+ (id)sharedToggledOnBadgeTheme;
+ (id)sharedToggledOnOverContentBadgeTheme;
- (CAFilter)imageCompositingFilter;
- (CAFilter)labelCompositingFilter;
- (Class)backgroundViewClass;
- (PXUIInteractiveWithBorderBadgeTheme)init;
- (PXUIInteractiveWithBorderBadgeTheme)initWithIsToggledOn:(BOOL)a3 isOverContent:(BOOL)a4;
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

@implementation PXUIInteractiveWithBorderBadgeTheme

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

- (PXUIInteractiveWithBorderBadgeTheme)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUIBadgeTheme.m", 219, @"%s is not available as initializer", "-[PXUIInteractiveWithBorderBadgeTheme init]");

  abort();
}

- (PXUIInteractiveWithBorderBadgeTheme)initWithIsToggledOn:(BOOL)a3 isOverContent:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PXUIInteractiveWithBorderBadgeTheme;
  v6 = [(PXUIInteractiveWithBorderBadgeTheme *)&v29 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    uint64_t v8 = [MEMORY[0x1E4FB1830] configurationWithFont:v7];
    imageConfiguration = v6->_imageConfiguration;
    v6->_imageConfiguration = (UIImageSymbolConfiguration *)v8;

    v6->_imageAlpha = 1.0;
    if (v5) {
      [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    else {
    uint64_t v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    imageTintColor = v6->_imageTintColor;
    v6->_imageTintColor = (UIColor *)v10;

    objc_storeStrong((id *)&v6->_afterLabelImageTintColor, v6->_imageTintColor);
    uint64_t v12 = *MEMORY[0x1E4F3A2B8];
    uint64_t v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2B8]];
    imageCompositingFilter = v6->_imageCompositingFilter;
    v6->_imageCompositingFilter = (CAFilter *)v13;

    objc_storeStrong((id *)&v6->_labelFont, v7);
    v6->_labelAlpha = 1.0;
    if (v5)
    {
      uint64_t v15 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      double v16 = 1.0;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
      double v16 = 0.800000012;
    }
    labelTextColor = v6->_labelTextColor;
    v6->_labelTextColor = (UIColor *)v15;

    uint64_t v18 = [MEMORY[0x1E4F39BC0] filterWithType:v12];
    labelCompositingFilter = v6->_labelCompositingFilter;
    v6->_labelCompositingFilter = (CAFilter *)v18;

    uint64_t v20 = objc_opt_class();
    Class backgroundViewClass = v6->_backgroundViewClass;
    v6->_Class backgroundViewClass = (Class)v20;

    v6->_backgroundCornerRadius = 3.0;
    double v22 = 1.0;
    if (v5 || v4) {
      double v22 = 0.0;
    }
    v6->_backgroundBorderWidth = v22;
    v6->_backgroundAlpha = v16;
    if (v5) {
      [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else {
    uint64_t v23 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    backgroundColor = v6->_backgroundColor;
    v6->_backgroundColor = (UIColor *)v23;

    uint64_t v25 = [MEMORY[0x1E4FB1618] systemBlueColor];
    backgroundBorderColor = v6->_backgroundBorderColor;
    v6->_backgroundBorderColor = (UIColor *)v25;

    backgroundBlurEffect = v6->_backgroundBlurEffect;
    v6->_backgroundBlurEffect = 0;
  }
  return v6;
}

+ (id)sharedToggledOffBadgeTheme
{
  if (sharedToggledOffBadgeTheme_onceToken != -1) {
    dispatch_once(&sharedToggledOffBadgeTheme_onceToken, &__block_literal_global_156);
  }
  v2 = (void *)sharedToggledOffBadgeTheme_badgeTheme;
  return v2;
}

void __65__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOffBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveWithBorderBadgeTheme alloc] initWithIsToggledOn:0 isOverContent:0];
  v1 = (void *)sharedToggledOffBadgeTheme_badgeTheme;
  sharedToggledOffBadgeTheme_badgeTheme = (uint64_t)v0;
}

+ (id)sharedToggledOnBadgeTheme
{
  if (sharedToggledOnBadgeTheme_onceToken != -1) {
    dispatch_once(&sharedToggledOnBadgeTheme_onceToken, &__block_literal_global_154);
  }
  v2 = (void *)sharedToggledOnBadgeTheme_badgeTheme;
  return v2;
}

void __64__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOnBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveWithBorderBadgeTheme alloc] initWithIsToggledOn:1 isOverContent:0];
  v1 = (void *)sharedToggledOnBadgeTheme_badgeTheme;
  sharedToggledOnBadgeTheme_badgeTheme = (uint64_t)v0;
}

+ (id)sharedToggledOffOverContentBadgeTheme
{
  if (sharedToggledOffOverContentBadgeTheme_onceToken != -1) {
    dispatch_once(&sharedToggledOffOverContentBadgeTheme_onceToken, &__block_literal_global_152);
  }
  v2 = (void *)sharedToggledOffOverContentBadgeTheme_badgeTheme;
  return v2;
}

void __76__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOffOverContentBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveWithBorderBadgeTheme alloc] initWithIsToggledOn:0 isOverContent:1];
  v1 = (void *)sharedToggledOffOverContentBadgeTheme_badgeTheme;
  sharedToggledOffOverContentBadgeTheme_badgeTheme = (uint64_t)v0;
}

+ (id)sharedToggledOnOverContentBadgeTheme
{
  if (sharedToggledOnOverContentBadgeTheme_onceToken != -1) {
    dispatch_once(&sharedToggledOnOverContentBadgeTheme_onceToken, &__block_literal_global_149_290238);
  }
  v2 = (void *)sharedToggledOnOverContentBadgeTheme_badgeTheme;
  return v2;
}

void __75__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOnOverContentBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveWithBorderBadgeTheme alloc] initWithIsToggledOn:1 isOverContent:1];
  v1 = (void *)sharedToggledOnOverContentBadgeTheme_badgeTheme;
  sharedToggledOnOverContentBadgeTheme_badgeTheme = (uint64_t)v0;
}

@end