@interface _PXPhotosSectionHeaderViewConfiguration
- (BOOL)allowsPhotosDetailsInteraction;
- (NSArray)locationNames;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)backdropViewGroupName;
- (NSString)title;
- (PXCuratedLibrarySectionHeaderLayoutSpec)buttonSpec;
- (UIEdgeInsets)edgeInsets;
- (UIImage)gradientImage;
- (_PXAlbumSectionHeaderLayout)weakLayout;
- (double)gradientAlpha;
- (double)gradientOverhang;
- (int64_t)actionType;
- (int64_t)headerStyle;
- (unint64_t)backgroundStyle;
- (void)setActionType:(int64_t)a3;
- (void)setAllowsPhotosDetailsInteraction:(BOOL)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setButtonSpec:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setEndDate:(id)a3;
- (void)setGradientAlpha:(double)a3;
- (void)setGradientImage:(id)a3;
- (void)setGradientOverhang:(double)a3;
- (void)setHeaderStyle:(int64_t)a3;
- (void)setLocationNames:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWeakLayout:(id)a3;
@end

@implementation _PXPhotosSectionHeaderViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonSpec, 0);
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->_locationNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->weakLayout);
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

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
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

- (void)setAllowsPhotosDetailsInteraction:(BOOL)a3
{
  self->_allowsPhotosDetailsInteraction = a3;
}

- (BOOL)allowsPhotosDetailsInteraction
{
  return self->_allowsPhotosDetailsInteraction;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setHeaderStyle:(int64_t)a3
{
  self->_headerStyle = a3;
}

- (int64_t)headerStyle
{
  return self->_headerStyle;
}

- (void)setLocationNames:(id)a3
{
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setWeakLayout:(id)a3
{
}

- (_PXAlbumSectionHeaderLayout)weakLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->weakLayout);
  return (_PXAlbumSectionHeaderLayout *)WeakRetained;
}

@end