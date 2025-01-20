@interface PUPhotosAlbumViewControllerSpec
+ (id)padSpec;
+ (id)phoneSpec;
- (BOOL)shouldUseAspectItems;
- (UIEdgeInsets)fullMomentsLevelSectionHeaderHighlightInset;
- (double)contentCornerRadius;
- (id)gridSpec;
- (int64_t)cellFillMode;
- (int64_t)fullMomentsSectionHeaderStyle;
- (void)configureCollectionViewGridLayout:(id)a3;
@end

@implementation PUPhotosAlbumViewControllerSpec

- (int64_t)fullMomentsSectionHeaderStyle
{
  return self->_fullMomentsSectionHeaderStyle;
}

- (BOOL)shouldUseAspectItems
{
  return self->_shouldUseAspectItems;
}

- (UIEdgeInsets)fullMomentsLevelSectionHeaderHighlightInset
{
  double v2 = -7.5;
  double v3 = 0.0;
  double v4 = 2.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)configureCollectionViewGridLayout:(id)a3
{
  id v6 = a3;
  [v6 setSectionTopPadding:1.0];
  double v3 = +[PUPhotosGridSettings sharedInstance];
  if ([v3 useFloatingHeaders])
  {
    double v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  [v6 setFloatingSectionHeadersEnabled:v5];
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (int64_t)cellFillMode
{
  return 1;
}

- (id)gridSpec
{
  return 0;
}

+ (id)padSpec
{
  double v2 = objc_alloc_init(PUPhotosAlbumViewControllerPadSpec);
  return v2;
}

+ (id)phoneSpec
{
  double v2 = objc_alloc_init(PUPhotosAlbumViewControllerPhoneSpec);
  return v2;
}

@end