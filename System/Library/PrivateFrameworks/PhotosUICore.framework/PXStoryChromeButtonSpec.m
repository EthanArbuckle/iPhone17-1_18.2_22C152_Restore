@interface PXStoryChromeButtonSpec
- (BOOL)shouldDimWhenHighlighted;
- (CGSize)badgeImageSize;
- (CGSize)defaultImageSize;
- (CGSize)focusedShadowOffset;
- (NSDictionary)labelAttributes;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXStoryChromeButtonSpec)init;
- (PXStoryChromeButtonSpec)initWithExtendedTraitCollection:(id)a3;
- (UIColor)defaultFocusedTintColor;
- (UIColor)defaultTintColor;
- (UIEdgeInsets)labelPadding;
- (double)focusedShadowOpacity;
- (double)roundedRectCornerRadius;
- (double)shadowRadius;
- (double)systemImageSizeWithBackground;
- (double)systemImageSizeWithoutBackground;
- (int64_t)backgroundStyle;
- (int64_t)badgeSystemImageWeight;
- (int64_t)blurEffectStyle;
- (int64_t)highlightedBlurEffectStyle;
- (int64_t)systemImageScale;
- (int64_t)systemImageStyle;
- (int64_t)systemImageWeightWithBackground;
- (int64_t)systemImageWeightWithoutBackground;
- (int64_t)textOnlyBlurEffectStyle;
@end

@implementation PXStoryChromeButtonSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_defaultFocusedTintColor, 0);
  objc_storeStrong((id *)&self->_defaultTintColor, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)shouldDimWhenHighlighted
{
  return self->_shouldDimWhenHighlighted;
}

- (double)focusedShadowOpacity
{
  return self->_focusedShadowOpacity;
}

- (CGSize)focusedShadowOffset
{
  double width = self->_focusedShadowOffset.width;
  double height = self->_focusedShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (int64_t)systemImageStyle
{
  return self->_systemImageStyle;
}

- (double)roundedRectCornerRadius
{
  return self->_roundedRectCornerRadius;
}

- (int64_t)textOnlyBlurEffectStyle
{
  return self->_textOnlyBlurEffectStyle;
}

- (int64_t)highlightedBlurEffectStyle
{
  return self->_highlightedBlurEffectStyle;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (UIEdgeInsets)labelPadding
{
  double top = self->_labelPadding.top;
  double left = self->_labelPadding.left;
  double bottom = self->_labelPadding.bottom;
  double right = self->_labelPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSDictionary)labelAttributes
{
  return self->_labelAttributes;
}

- (UIColor)defaultFocusedTintColor
{
  return self->_defaultFocusedTintColor;
}

- (UIColor)defaultTintColor
{
  return self->_defaultTintColor;
}

- (int64_t)badgeSystemImageWeight
{
  return self->_badgeSystemImageWeight;
}

- (CGSize)badgeImageSize
{
  double width = self->_badgeImageSize.width;
  double height = self->_badgeImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)systemImageScale
{
  return self->_systemImageScale;
}

- (int64_t)systemImageWeightWithBackground
{
  return self->_systemImageWeightWithBackground;
}

- (int64_t)systemImageWeightWithoutBackground
{
  return self->_systemImageWeightWithoutBackground;
}

- (double)systemImageSizeWithBackground
{
  return self->_systemImageSizeWithBackground;
}

- (double)systemImageSizeWithoutBackground
{
  return self->_systemImageSizeWithoutBackground;
}

- (CGSize)defaultImageSize
{
  double width = self->_defaultImageSize.width;
  double height = self->_defaultImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PXStoryChromeButtonSpec)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChromeButton.m", 113, @"%s is not available as initializer", "-[PXStoryChromeButtonSpec init]");

  abort();
}

- (PXStoryChromeButtonSpec)initWithExtendedTraitCollection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXStoryChromeButtonSpec;
  v6 = [(PXStoryChromeButtonSpec *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extendedTraitCollection, a3);
    uint64_t v8 = [(PXExtendedTraitCollection *)v7->_extendedTraitCollection userInterfaceIdiom];
    [(PXExtendedTraitCollection *)v7->_extendedTraitCollection userInterfaceIdiom];
    uint64_t v9 = [(PXExtendedTraitCollection *)v7->_extendedTraitCollection userInterfaceIdiom];
    unint64_t v10 = [v5 contentSizeCategory] - 8;
    if (v9 == 5) {
      double v11 = 18.0;
    }
    else {
      double v11 = 22.0;
    }
    if (v9 == 5 || v10 >= 5) {
      double v13 = 44.0;
    }
    else {
      double v13 = 60.0;
    }
    BOOL v14 = [(PXExtendedTraitCollection *)v7->_extendedTraitCollection insideCollectionDetailsView];
    double v15 = 28.0;
    if (v14) {
      double v16 = 28.0;
    }
    else {
      double v16 = v13;
    }
    v7->_defaultImageSize.double width = v16;
    v7->_defaultImageSize.double height = v16;
    double v17 = 19.0;
    if (v14) {
      double v17 = 16.0;
    }
    uint64_t v18 = 2;
    if (v8 != 3)
    {
      uint64_t v18 = -1;
      double v15 = v17;
    }
    v7->_systemImageSizeWithoutBackground = v11;
    v7->_systemImageSizeWithBackground = v15;
    __asm { FMOV            V0.2D, #16.0 }
    v7->_badgeImageSize = _Q0;
    *(_OWORD *)&v7->_systemImageWeightWithoutBackground = xmmword_1AB35A150;
    v7->_systemImageScale = v18;
    v7->_badgeSystemImageWeight = 7;
    uint64_t v23 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    defaultTintColor = v7->_defaultTintColor;
    v7->_defaultTintColor = (UIColor *)v23;

    objc_storeStrong((id *)&v7->_defaultFocusedTintColor, v7->_defaultTintColor);
    v7->_roundedRectCornerRadius = 10.0;
    v25 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v26 = (void *)[v25 mutableCopy];

    [v26 setAlignment:1];
    uint64_t v29 = *MEMORY[0x1E4FB06F8];
    PXFontWithTextStyleSymbolicTraits();
  }

  return 0;
}

@end