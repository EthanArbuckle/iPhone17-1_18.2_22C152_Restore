@interface PUAlbumListViewControllerPadSpec
- (BOOL)canShowVirtualCollections;
- (BOOL)shouldShowSectionHeaders;
- (BOOL)shouldUseCollageForCloudFeedPlaceholder;
- (BOOL)showsDeleteButtonOnCellContentView;
- (CGSize)cellSizeForStackSize:(CGSize)a3;
- (CGSize)collageImageSize;
- (CGSize)imageSize;
- (CGSize)imageSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4;
- (CGSize)stackSize;
- (CGSize)stackSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4;
- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4;
- (UIEdgeInsets)stackPerspectiveInsets;
- (UIOffset)stackOffset;
- (UIOffset)stackPerspectiveOffset;
- (double)collageSpacing;
- (double)posterSquareCornerRadius;
- (double)posterSubitemCornerRadius;
- (double)sectionFooterHeight;
- (double)sectionHeaderHeight;
- (id)albumViewControllerSpec;
- (id)emptyStackPhotoDecoration;
- (id)gridViewControllerSpec;
- (id)stackPhotoDecoration;
- (int64_t)albumDeletionWarningStyle;
- (int64_t)cellContentViewLayout;
- (int64_t)collageImageContentMode;
- (unint64_t)folderStackViewStyle;
- (unint64_t)stackViewStyle;
- (void)configureGridLayout:(id)a3 forLayoutReferenceSize:(CGSize)a4 safeAreaInsets:(UIEdgeInsets)a5;
- (void)configureStackViewWithGridStyle:(id)a3;
@end

@implementation PUAlbumListViewControllerPadSpec

- (BOOL)canShowVirtualCollections
{
  return 1;
}

- (id)albumViewControllerSpec
{
  v2 = objc_alloc_init(PUPhotosAlbumViewControllerPadSpec);
  return v2;
}

- (id)gridViewControllerSpec
{
  v2 = objc_alloc_init(PUPhotosGridViewControllerPadSpec);
  return v2;
}

- (int64_t)albumDeletionWarningStyle
{
  return 0;
}

- (BOOL)shouldShowSectionHeaders
{
  return 1;
}

- (double)sectionFooterHeight
{
  return 20.0;
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

- (CGSize)imageSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4 = 256.0;
  double v5 = 256.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)configureGridLayout:(id)a3 forLayoutReferenceSize:(CGSize)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double height = a4.height;
  double width = a4.width;
  double v21 = 0.0;
  double v22 = 0.0;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = a3;
  -[PUAlbumListViewControllerSpec _getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:](self, "_getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:", &v21, &v19, width, height, top, left, bottom, right);
  double v13 = *((double *)&v19 + 1);
  double v15 = *((double *)&v20 + 1);
  double v14 = v21;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v16 = floor(*(double *)&PUMainScreenScale_screenScale* ((width - v13 - v15 - (double)(uint64_t)floor((width - v13 - v15 + 8.0) / (v14 + 8.0)) * v14)/ (double)(uint64_t)(vcvtmd_s64_f64((width - v13 - v15 + 8.0) / (v14 + 8.0)) - 1)* 0.5))/ *(double *)&PUMainScreenScale_screenScale;
  *((double *)&v19 + 1) = *((double *)&v19 + 1) - v16;
  double v17 = *((double *)&v19 + 1);
  *((double *)&v20 + 1) = *((double *)&v20 + 1) - v16;
  double v21 = v21 + v16 * 2.0;
  [(PUAlbumListViewControllerPadSpec *)self sectionFooterHeight];
  objc_msgSend(v12, "setSectionContentInset:", 0.0, v17, v18, *((double *)&v20 + 1));
  objc_msgSend(v12, "setInterItemSpacing:", 0.0, 0.0);
  -[PUAlbumListViewControllerPadSpec cellSizeForStackSize:](self, "cellSizeForStackSize:", v21, v22);
  objc_msgSend(v12, "setItemSize:");
}

- (CGSize)cellSizeForStackSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(PUAlbumListViewControllerSpec *)self _fontManager];
  double v6 = [v5 albumListTitleLabelFont];

  [v6 _scaledValueForValue:24.0];
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
  [v6 _scaledValueForValue:10.0];
  double v16 = v15;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v17 = *(double *)&PUMainScreenScale_screenScale;
  [v11 _scaledValueForValue:10.0];
  double v19 = v18;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v20 = height
      + round(v14 * v13) / v14
      + round(v9 * v8) / v9
      + round(v17 * v16) / v17
      + round(*(double *)&PUMainScreenScale_screenScale * v19) / *(double *)&PUMainScreenScale_screenScale;

  double v21 = width;
  double v22 = v20;
  result.double height = v22;
  result.CGFloat width = v21;
  return result;
}

- (CGSize)stackSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v6 = 0.0;
  double v7 = 0.0;
  -[PUAlbumListViewControllerSpec _getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:](self, "_getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:", &v6, 0, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  double v4 = v6;
  double v5 = v7;
  result.double height = v5;
  result.CGFloat width = v4;
  return result;
}

- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  long long v9 = *MEMORY[0x1E4FB2848];
  long long v10 = v4;
  -[PUAlbumListViewControllerSpec _getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:](self, "_getStackSize:outEdgeInsets:forLayoutReferenceSize:safeAreaInsets:", 0, &v9, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  double v6 = *((double *)&v9 + 1);
  double v5 = *(double *)&v9;
  double v8 = *((double *)&v10 + 1);
  double v7 = *(double *)&v10;
  result.double right = v8;
  result.double bottom = v7;
  result.double left = v6;
  result.double top = v5;
  return result;
}

- (BOOL)shouldUseCollageForCloudFeedPlaceholder
{
  return 1;
}

- (int64_t)cellContentViewLayout
{
  return 1;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return 1;
}

- (double)posterSubitemCornerRadius
{
  return 4.0;
}

- (double)posterSquareCornerRadius
{
  v2 = +[PUInterfaceManager currentTheme];
  [v2 padAlbumCornerRadius];
  double v4 = v3;

  return v4;
}

- (void)configureStackViewWithGridStyle:(id)a3
{
  id v5 = a3;
  double v3 = +[PUInterfaceManager currentTheme];
  double v4 = [v3 folderCellBackgroundColor];
  [v5 setGridBackgroundColor:v4];

  [v5 setGridMargin:0.0];
  [v5 setGridItemSpacing:3.0];
}

- (double)collageSpacing
{
  return 2.0;
}

- (int64_t)collageImageContentMode
{
  return 1;
}

- (CGSize)collageImageSize
{
  double v2 = 360.0;
  double v3 = 360.0;
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

- (UIOffset)stackPerspectiveOffset
{
  double v2 = -0.0;
  double v3 = 0.0;
  result.vertical = v2;
  result.horizontal = v3;
  return result;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (UIOffset)stackOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (CGSize)stackSize
{
  double v2 = 160.0;
  double v3 = 160.0;
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

- (id)emptyStackPhotoDecoration
{
  emptyStackPhotoDecoration = self->super._emptyStackPhotoDecoration;
  if (!emptyStackPhotoDecoration)
  {
    double v4 = +[PUPhotoDecoration defaultDecoration];
    double v5 = self->super._emptyStackPhotoDecoration;
    self->super._emptyStackPhotoDecoration = v4;

    emptyStackPhotoDecoration = self->super._emptyStackPhotoDecoration;
  }
  return emptyStackPhotoDecoration;
}

- (id)stackPhotoDecoration
{
  stackPhotoDecoration = self->super._stackPhotoDecoration;
  if (!stackPhotoDecoration)
  {
    double v4 = +[PUPhotoDecoration defaultDecoration];
    double v5 = self->super._stackPhotoDecoration;
    self->super._stackPhotoDecoration = v4;

    stackPhotoDecoration = self->super._stackPhotoDecoration;
  }
  return stackPhotoDecoration;
}

- (unint64_t)folderStackViewStyle
{
  return 3;
}

- (unint64_t)stackViewStyle
{
  return 5;
}

- (CGSize)imageSize
{
  double v2 = PUPixelSizeFromPointSize(160.0);
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

@end