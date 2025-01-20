@interface PXUIInteractiveBadgeTheme
+ (id)actionableBadgeTheme;
+ (id)disabledActionableBadgeTheme;
+ (id)sharedToggledOffBadgeTheme;
+ (id)sharedToggledOnBadgeTheme;
- (CAFilter)imageCompositingFilter;
- (CAFilter)labelCompositingFilter;
- (Class)backgroundViewClass;
- (PXUIInteractiveBadgeTheme)init;
- (PXUIInteractiveBadgeTheme)initWithIsToggledOn:(BOOL)a3 isActionable:(BOOL)a4 isDisabled:(BOOL)a5;
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

@implementation PXUIInteractiveBadgeTheme

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

- (PXUIInteractiveBadgeTheme)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUIBadgeTheme.m", 319, @"%s is not available as initializer", "-[PXUIInteractiveBadgeTheme init]");

  abort();
}

- (PXUIInteractiveBadgeTheme)initWithIsToggledOn:(BOOL)a3 isActionable:(BOOL)a4 isDisabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXUIInteractiveBadgeTheme;
  v8 = [(PXUIInteractiveBadgeTheme *)&v28 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    if (v6)
    {
      v10 = [MEMORY[0x1E4FB1618] labelColor];
      double v11 = 11.0;
      uint64_t v12 = 9;
    }
    else
    {
      if (v7) {
        [MEMORY[0x1E4FB1618] systemBlueColor];
      }
      else {
      v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      v14 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
      v10 = [v13 resolvedColorWithTraitCollection:v14];

      double v11 = 3.0;
      uint64_t v12 = 13;
    }
    uint64_t v15 = [MEMORY[0x1E4FB1830] configurationWithFont:v9];
    imageConfiguration = v8->_imageConfiguration;
    v8->_imageConfiguration = (UIImageSymbolConfiguration *)v15;

    if (v5) {
      double v17 = 0.600000024;
    }
    else {
      double v17 = 1.0;
    }
    v8->_imageAlpha = v17;
    if (v5) {
      double v18 = 0.800000012;
    }
    else {
      double v18 = 1.0;
    }
    objc_storeStrong((id *)&v8->_imageTintColor, v10);
    objc_storeStrong((id *)&v8->_afterLabelImageTintColor, v10);
    imageCompositingFilter = v8->_imageCompositingFilter;
    v8->_imageCompositingFilter = 0;

    objc_storeStrong((id *)&v8->_labelFont, v9);
    v8->_labelAlpha = v17;
    objc_storeStrong((id *)&v8->_labelTextColor, v10);
    labelCompositingFilter = v8->_labelCompositingFilter;
    v8->_labelCompositingFilter = 0;

    uint64_t v21 = objc_opt_class();
    Class backgroundViewClass = v8->_backgroundViewClass;
    v8->_Class backgroundViewClass = (Class)v21;

    v8->_backgroundCornerRadius = v11;
    v8->_backgroundBorderWidth = 0.0;
    v8->_backgroundAlpha = v18;
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = 0;

    backgroundBorderColor = v8->_backgroundBorderColor;
    v8->_backgroundBorderColor = 0;

    uint64_t v25 = [MEMORY[0x1E4FB14C8] effectWithStyle:v12];
    backgroundBlurEffect = v8->_backgroundBlurEffect;
    v8->_backgroundBlurEffect = (UIBlurEffect *)v25;
  }
  return v8;
}

+ (id)sharedToggledOffBadgeTheme
{
  if (sharedToggledOffBadgeTheme_onceToken_184[0] != -1) {
    dispatch_once(sharedToggledOffBadgeTheme_onceToken_184, &__block_literal_global_186);
  }
  v2 = (void *)sharedToggledOffBadgeTheme_badgeTheme_183;
  return v2;
}

void __55__PXUIInteractiveBadgeTheme_sharedToggledOffBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveBadgeTheme alloc] initWithIsToggledOn:0 isActionable:0 isDisabled:0];
  v1 = (void *)sharedToggledOffBadgeTheme_badgeTheme_183;
  sharedToggledOffBadgeTheme_badgeTheme_183 = (uint64_t)v0;
}

+ (id)sharedToggledOnBadgeTheme
{
  if (sharedToggledOnBadgeTheme_onceToken_180[0] != -1) {
    dispatch_once(sharedToggledOnBadgeTheme_onceToken_180, &__block_literal_global_182);
  }
  v2 = (void *)sharedToggledOnBadgeTheme_badgeTheme_179;
  return v2;
}

void __54__PXUIInteractiveBadgeTheme_sharedToggledOnBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveBadgeTheme alloc] initWithIsToggledOn:1 isActionable:0 isDisabled:0];
  v1 = (void *)sharedToggledOnBadgeTheme_badgeTheme_179;
  sharedToggledOnBadgeTheme_badgeTheme_179 = (uint64_t)v0;
}

+ (id)disabledActionableBadgeTheme
{
  if (disabledActionableBadgeTheme_onceToken != -1) {
    dispatch_once(&disabledActionableBadgeTheme_onceToken, &__block_literal_global_178_290254);
  }
  v2 = (void *)disabledActionableBadgeTheme_badgeTheme;
  return v2;
}

void __57__PXUIInteractiveBadgeTheme_disabledActionableBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveBadgeTheme alloc] initWithIsToggledOn:0 isActionable:1 isDisabled:1];
  v1 = (void *)disabledActionableBadgeTheme_badgeTheme;
  disabledActionableBadgeTheme_badgeTheme = (uint64_t)v0;
}

+ (id)actionableBadgeTheme
{
  if (actionableBadgeTheme_onceToken != -1) {
    dispatch_once(&actionableBadgeTheme_onceToken, &__block_literal_global_175);
  }
  v2 = (void *)actionableBadgeTheme_badgeTheme;
  return v2;
}

void __49__PXUIInteractiveBadgeTheme_actionableBadgeTheme__block_invoke()
{
  v0 = [[PXUIInteractiveBadgeTheme alloc] initWithIsToggledOn:0 isActionable:1 isDisabled:0];
  v1 = (void *)actionableBadgeTheme_badgeTheme;
  actionableBadgeTheme_badgeTheme = (uint64_t)v0;
}

@end