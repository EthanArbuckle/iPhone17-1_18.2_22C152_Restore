@interface VideosExtrasGridViewControllerStyle
- (BOOL)adjustsContentInsetByBottomNavBar;
- (BOOL)showsScrollFade;
- (NSDictionary)detailDefaultFontAttributes;
- (NSString)detailTextStyle;
- (UIColor)backgroundColor;
- (UIColor)detailTextColor;
- (UIEdgeInsets)collectionViewInsets;
- (UIEdgeInsets)defaultCellSectionInsets;
- (UIEdgeInsets)detailInsets;
- (UIEdgeInsets)imageCellSectionInsets;
- (UIEdgeInsets)productCellSectionInsets;
- (UIEdgeInsets)videoCellSectionInsets;
- (VideosExtrasGridCellStyle)defaultCellStyle;
- (VideosExtrasGridCellStyle)imageCellStyle;
- (VideosExtrasGridCellStyle)productCellStyle;
- (VideosExtrasGridCellStyle)videoCellStyle;
- (VideosExtrasGridHeaderStyle)headerStyle;
- (VideosExtrasGridSectionHeaderStyle)sectionHeaderStyle;
- (double)cellLineSpacing;
- (double)defaultSpacing;
- (double)imageSpacing;
- (double)productSpacing;
- (double)videoSpacing;
- (void)setAdjustsContentInsetByBottomNavBar:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCellLineSpacing:(double)a3;
- (void)setCollectionViewInsets:(UIEdgeInsets)a3;
- (void)setDefaultCellSectionInsets:(UIEdgeInsets)a3;
- (void)setDefaultCellStyle:(id)a3;
- (void)setDefaultSpacing:(double)a3;
- (void)setDetailDefaultFontAttributes:(id)a3;
- (void)setDetailInsets:(UIEdgeInsets)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setDetailTextStyle:(id)a3;
- (void)setHeaderStyle:(id)a3;
- (void)setImageCellSectionInsets:(UIEdgeInsets)a3;
- (void)setImageCellStyle:(id)a3;
- (void)setImageSpacing:(double)a3;
- (void)setProductCellSectionInsets:(UIEdgeInsets)a3;
- (void)setProductCellStyle:(id)a3;
- (void)setProductSpacing:(double)a3;
- (void)setSectionHeaderStyle:(id)a3;
- (void)setShowsScrollFade:(BOOL)a3;
- (void)setVideoCellSectionInsets:(UIEdgeInsets)a3;
- (void)setVideoCellStyle:(id)a3;
- (void)setVideoSpacing:(double)a3;
@end

@implementation VideosExtrasGridViewControllerStyle

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIEdgeInsets)collectionViewInsets
{
  double top = self->_collectionViewInsets.top;
  double left = self->_collectionViewInsets.left;
  double bottom = self->_collectionViewInsets.bottom;
  double right = self->_collectionViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCollectionViewInsets:(UIEdgeInsets)a3
{
  self->_collectionViewInsets = a3;
}

- (NSString)detailTextStyle
{
  return self->_detailTextStyle;
}

- (void)setDetailTextStyle:(id)a3
{
}

- (NSDictionary)detailDefaultFontAttributes
{
  return self->_detailDefaultFontAttributes;
}

- (void)setDetailDefaultFontAttributes:(id)a3
{
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (void)setDetailTextColor:(id)a3
{
}

- (UIEdgeInsets)detailInsets
{
  double top = self->_detailInsets.top;
  double left = self->_detailInsets.left;
  double bottom = self->_detailInsets.bottom;
  double right = self->_detailInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDetailInsets:(UIEdgeInsets)a3
{
  self->_detailInsets = a3;
}

- (VideosExtrasGridHeaderStyle)headerStyle
{
  return self->_headerStyle;
}

- (void)setHeaderStyle:(id)a3
{
}

- (VideosExtrasGridSectionHeaderStyle)sectionHeaderStyle
{
  return self->_sectionHeaderStyle;
}

- (void)setSectionHeaderStyle:(id)a3
{
}

- (VideosExtrasGridCellStyle)defaultCellStyle
{
  return self->_defaultCellStyle;
}

- (void)setDefaultCellStyle:(id)a3
{
}

- (VideosExtrasGridCellStyle)imageCellStyle
{
  return self->_imageCellStyle;
}

- (void)setImageCellStyle:(id)a3
{
}

- (VideosExtrasGridCellStyle)videoCellStyle
{
  return self->_videoCellStyle;
}

- (void)setVideoCellStyle:(id)a3
{
}

- (VideosExtrasGridCellStyle)productCellStyle
{
  return self->_productCellStyle;
}

- (void)setProductCellStyle:(id)a3
{
}

- (double)defaultSpacing
{
  return self->_defaultSpacing;
}

- (void)setDefaultSpacing:(double)a3
{
  self->_defaultSpacing = a3;
}

- (double)imageSpacing
{
  return self->_imageSpacing;
}

- (void)setImageSpacing:(double)a3
{
  self->_imageSpacing = a3;
}

- (double)videoSpacing
{
  return self->_videoSpacing;
}

- (void)setVideoSpacing:(double)a3
{
  self->_videoSpacing = a3;
}

- (double)productSpacing
{
  return self->_productSpacing;
}

- (void)setProductSpacing:(double)a3
{
  self->_productSpacing = a3;
}

- (UIEdgeInsets)defaultCellSectionInsets
{
  double top = self->_defaultCellSectionInsets.top;
  double left = self->_defaultCellSectionInsets.left;
  double bottom = self->_defaultCellSectionInsets.bottom;
  double right = self->_defaultCellSectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDefaultCellSectionInsets:(UIEdgeInsets)a3
{
  self->_defaultCellSectionInsets = a3;
}

- (UIEdgeInsets)imageCellSectionInsets
{
  double top = self->_imageCellSectionInsets.top;
  double left = self->_imageCellSectionInsets.left;
  double bottom = self->_imageCellSectionInsets.bottom;
  double right = self->_imageCellSectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImageCellSectionInsets:(UIEdgeInsets)a3
{
  self->_imageCellSectionInsets = a3;
}

- (UIEdgeInsets)videoCellSectionInsets
{
  double top = self->_videoCellSectionInsets.top;
  double left = self->_videoCellSectionInsets.left;
  double bottom = self->_videoCellSectionInsets.bottom;
  double right = self->_videoCellSectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVideoCellSectionInsets:(UIEdgeInsets)a3
{
  self->_videoCellSectionInsets = a3;
}

- (UIEdgeInsets)productCellSectionInsets
{
  double top = self->_productCellSectionInsets.top;
  double left = self->_productCellSectionInsets.left;
  double bottom = self->_productCellSectionInsets.bottom;
  double right = self->_productCellSectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setProductCellSectionInsets:(UIEdgeInsets)a3
{
  self->_productCellSectionInsets = a3;
}

- (double)cellLineSpacing
{
  return self->_cellLineSpacing;
}

- (void)setCellLineSpacing:(double)a3
{
  self->_cellLineSpacing = a3;
}

- (BOOL)showsScrollFade
{
  return self->_showsScrollFade;
}

- (void)setShowsScrollFade:(BOOL)a3
{
  self->_showsScrollFade = a3;
}

- (BOOL)adjustsContentInsetByBottomNavBar
{
  return self->_adjustsContentInsetByBottomNavBar;
}

- (void)setAdjustsContentInsetByBottomNavBar:(BOOL)a3
{
  self->_adjustsContentInsetByBottomNavBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCellStyle, 0);
  objc_storeStrong((id *)&self->_videoCellStyle, 0);
  objc_storeStrong((id *)&self->_imageCellStyle, 0);
  objc_storeStrong((id *)&self->_defaultCellStyle, 0);
  objc_storeStrong((id *)&self->_sectionHeaderStyle, 0);
  objc_storeStrong((id *)&self->_headerStyle, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_detailDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_detailTextStyle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end