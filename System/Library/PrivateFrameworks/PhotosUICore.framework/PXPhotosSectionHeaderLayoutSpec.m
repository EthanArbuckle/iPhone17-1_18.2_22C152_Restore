@interface PXPhotosSectionHeaderLayoutSpec
- (BOOL)dividerLineVisible;
- (BOOL)filterButtonLayoutForSearch;
- (BOOL)minimizeTitleBottomPadding;
- (BOOL)titleShouldFadeOnScroll;
- (CGSize)chevronSize;
- (PXCuratedLibrarySectionHeaderLayoutSpec)curatedLibraryHeaderSpec;
- (PXExtendedImageConfiguration)chevronImageConfiguration;
- (PXExtendedImageConfiguration)legibilityGradientImageConfiguration;
- (PXPhotosSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (UIButtonConfiguration)filterButtonConfiguration;
- (UIColor)badgeColor;
- (UIColor)buttonColor;
- (UIColor)dividerColor;
- (UIColor)gradientTitleColor;
- (UIColor)subtitleColor;
- (UIColor)titleColor;
- (UIEdgeInsets)padding;
- (UIFont)badgeFont;
- (UIFont)buttonFont;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (double)buttonSpacing;
- (double)chevronAlpha;
- (double)chevronSpacing;
- (double)dividerBaselineToTextBaselineSpacing;
- (double)gradientAlpha;
- (double)gradientOverhang;
- (double)minimumHeaderContentHeight;
- (double)titleHorizontalInset;
- (double)titleSubtitleHorizontalSpacing;
@end

@implementation PXPhotosSectionHeaderLayoutSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_curatedLibraryHeaderSpec, 0);
  objc_storeStrong((id *)&self->_legibilityGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_chevronImageConfiguration, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_badgeFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_gradientTitleColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

- (UIButtonConfiguration)filterButtonConfiguration
{
  return self->_filterButtonConfiguration;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)curatedLibraryHeaderSpec
{
  return self->_curatedLibraryHeaderSpec;
}

- (BOOL)filterButtonLayoutForSearch
{
  return self->_filterButtonLayoutForSearch;
}

- (BOOL)titleShouldFadeOnScroll
{
  return self->_titleShouldFadeOnScroll;
}

- (BOOL)minimizeTitleBottomPadding
{
  return self->_minimizeTitleBottomPadding;
}

- (BOOL)dividerLineVisible
{
  return self->_dividerLineVisible;
}

- (double)gradientOverhang
{
  return self->_gradientOverhang;
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXExtendedImageConfiguration)legibilityGradientImageConfiguration
{
  return self->_legibilityGradientImageConfiguration;
}

- (PXExtendedImageConfiguration)chevronImageConfiguration
{
  return self->_chevronImageConfiguration;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (double)chevronAlpha
{
  return self->_chevronAlpha;
}

- (CGSize)chevronSize
{
  double width = self->_chevronSize.width;
  double height = self->_chevronSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)chevronSpacing
{
  return self->_chevronSpacing;
}

- (double)dividerBaselineToTextBaselineSpacing
{
  return self->_dividerBaselineToTextBaselineSpacing;
}

- (double)titleSubtitleHorizontalSpacing
{
  return self->_titleSubtitleHorizontalSpacing;
}

- (double)titleHorizontalInset
{
  return self->_titleHorizontalInset;
}

- (double)minimumHeaderContentHeight
{
  return self->_minimumHeaderContentHeight;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (UIFont)badgeFont
{
  return self->_badgeFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)buttonColor
{
  return self->_buttonColor;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (UIColor)gradientTitleColor
{
  return self->_gradientTitleColor;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (PXPhotosSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosSectionHeaderLayoutSpec;
  if ([(PXFeatureSpec *)&v8 initWithExtendedTraitCollection:v6 options:a4])
  {
    PXSystemFontOfSizeAndWeight();
  }

  return 0;
}

@end