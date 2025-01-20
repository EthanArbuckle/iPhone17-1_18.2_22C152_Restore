@interface _PXActionableSectionHeaderViewConfiguration
- (BOOL)avoidsTintedButtonsAtHighSpeeds;
- (BOOL)showsActionButton;
- (BOOL)showsSecondaryButton;
- (BOOL)showsTopSeparator;
- (BOOL)supportsMultipleLinesInCompactLayout;
- (NSString)actionText;
- (NSString)backdropViewGroupName;
- (NSString)primaryText;
- (NSString)secondaryText;
- (PXActionableSectionHeaderLayout)weakLayout;
- (PXCuratedLibrarySectionHeaderLayoutSpec)buttonSpec;
- (PXSimpleIndexPath)sectionIndexPath;
- (UIEdgeInsets)edgeInsets;
- (UIImage)gradientImage;
- (double)gradientAlpha;
- (double)gradientOverhang;
- (id)filterButtonControllerFactory;
- (int64_t)actionType;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)backgroundStyle;
- (unint64_t)buttonStyle;
- (void)setActionText:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setAvoidsTintedButtonsAtHighSpeeds:(BOOL)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setButtonSpec:(id)a3;
- (void)setButtonStyle:(unint64_t)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setFilterButtonControllerFactory:(id)a3;
- (void)setGradientAlpha:(double)a3;
- (void)setGradientImage:(id)a3;
- (void)setGradientOverhang:(double)a3;
- (void)setPreferredUserInterfaceStyle:(int64_t)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setShowsActionButton:(BOOL)a3;
- (void)setShowsSecondaryButton:(BOOL)a3;
- (void)setShowsTopSeparator:(BOOL)a3;
- (void)setSupportsMultipleLinesInCompactLayout:(BOOL)a3;
- (void)setWeakLayout:(id)a3;
@end

@implementation _PXActionableSectionHeaderViewConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakLayout);
  objc_storeStrong((id *)&self->_buttonSpec, 0);
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong(&self->_filterButtonControllerFactory, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

- (void)setWeakLayout:(id)a3
{
}

- (PXActionableSectionHeaderLayout)weakLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakLayout);
  return (PXActionableSectionHeaderLayout *)WeakRetained;
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)setShowsSecondaryButton:(BOOL)a3
{
  self->_showsSecondaryButton = a3;
}

- (BOOL)showsSecondaryButton
{
  return self->_showsSecondaryButton;
}

- (void)setShowsActionButton:(BOOL)a3
{
  self->_showsActionButton = a3;
}

- (BOOL)showsActionButton
{
  return self->_showsActionButton;
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  self->_showsTopSeparator = a3;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (void)setSupportsMultipleLinesInCompactLayout:(BOOL)a3
{
  self->_supportsMultipleLinesInCompactLayout = a3;
}

- (BOOL)supportsMultipleLinesInCompactLayout
{
  return self->_supportsMultipleLinesInCompactLayout;
}

- (void)setAvoidsTintedButtonsAtHighSpeeds:(BOOL)a3
{
  self->_avoidsTintedButtonsAtHighSpeeds = a3;
}

- (BOOL)avoidsTintedButtonsAtHighSpeeds
{
  return self->_avoidsTintedButtonsAtHighSpeeds;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[5].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[5].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setButtonSpec:(id)a3
{
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)buttonSpec
{
  return self->_buttonSpec;
}

- (void)setGradientOverhang:(double)a3
{
  self->_gradientOverhang = a3;
}

- (double)gradientOverhang
{
  return self->_gradientOverhang;
}

- (void)setGradientAlpha:(double)a3
{
  self->_gradientAlpha = a3;
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (void)setGradientImage:(id)a3
{
}

- (UIImage)gradientImage
{
  return self->_gradientImage;
}

- (void)setBackdropViewGroupName:(id)a3
{
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setButtonStyle:(unint64_t)a3
{
  self->_buttonStyle = a3;
}

- (unint64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setFilterButtonControllerFactory:(id)a3
{
}

- (id)filterButtonControllerFactory
{
  return self->_filterButtonControllerFactory;
}

- (void)setActionText:(id)a3
{
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setSecondaryText:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setPrimaryText:(id)a3
{
}

- (NSString)primaryText
{
  return self->_primaryText;
}

@end