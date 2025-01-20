@interface PUAlbumListViewControllerCommonImagePickerSpec
- (BOOL)shouldUseCollageForCloudFeedPlaceholder;
- (BOOL)shouldUseTableView;
- (BOOL)showsDeleteButtonOnCellContentView;
- (CGSize)cellSizeForBounds:(CGRect)a3;
- (CGSize)imageSize;
- (CGSize)stackSize;
- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4;
- (double)sectionFooterHeight;
- (double)sectionHeaderHeight;
- (int64_t)cellContentViewLayout;
- (unint64_t)folderStackViewStyle;
- (unint64_t)stackViewStyle;
- (void)configureStackViewWithGridStyle:(id)a3;
@end

@implementation PUAlbumListViewControllerCommonImagePickerSpec

- (BOOL)shouldUseCollageForCloudFeedPlaceholder
{
  return 0;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return 0;
}

- (double)sectionFooterHeight
{
  return 0.0;
}

- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  UIEdgeInsetsAdd();
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)sectionHeaderHeight
{
  v2 = [(PUAlbumListViewControllerSpec *)self _fontManager];
  v3 = [v2 albumListSectionTitleLabelFont];

  [v3 _scaledValueForValue:34.0];
  double v5 = v4;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v6 = round(*(double *)&PUMainScreenScale_screenScale * v5) / *(double *)&PUMainScreenScale_screenScale;

  return v6;
}

- (CGSize)cellSizeForBounds:(CGRect)a3
{
  CGFloat width = a3.size.width;
  double v5 = [(PUAlbumListViewControllerSpec *)self _fontManager];
  double v6 = [v5 albumListTitleLabelFont];

  [v6 _scaledValueForValue:40.0];
  double v8 = v7;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v9 = *(double *)&PUMainScreenScale_screenScale;
  v10 = [(PUAlbumListViewControllerSpec *)self _fontManager];
  v11 = [v10 albumListSubtitleLabelFont];

  [v11 _scaledValueForValue:20.0];
  double v13 = v12;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v14 = *(double *)&PUMainScreenScale_screenScale;
  [v6 _scaledValueForValue:29.0];
  double v16 = v15;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v17 = round(v9 * v8) / v9
      + round(v14 * v13) / v14
      + round(*(double *)&PUMainScreenScale_screenScale * v16) / *(double *)&PUMainScreenScale_screenScale;

  double v18 = width;
  double v19 = v17;
  result.height = v19;
  result.CGFloat width = v18;
  return result;
}

- (int64_t)cellContentViewLayout
{
  return 0;
}

- (void)configureStackViewWithGridStyle:(id)a3
{
  id v5 = a3;
  v3 = +[PUInterfaceManager currentTheme];
  double v4 = [v3 folderCellBackgroundColor];
  [v5 setGridBackgroundColor:v4];

  [v5 setGridMargin:5.0];
  [v5 setGridItemSpacing:2.0];
}

- (CGSize)stackSize
{
  double v2 = 70.0;
  double v3 = 70.0;
  result.height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGSize)imageSize
{
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v2 = dbl_1AEFF7B40[*(double *)&PUMainScreenScale_screenScale > 1.0];
  double v3 = v2;
  result.height = v3;
  result.CGFloat width = v2;
  return result;
}

- (BOOL)shouldUseTableView
{
  return 1;
}

- (unint64_t)folderStackViewStyle
{
  return 4;
}

- (unint64_t)stackViewStyle
{
  return 0;
}

@end