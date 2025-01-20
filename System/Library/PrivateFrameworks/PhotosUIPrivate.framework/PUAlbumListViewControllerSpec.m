@interface PUAlbumListViewControllerSpec
+ (id)emptyPlaceholderImageForSystemImageNamed:(id)a3 scale:(int64_t)a4;
+ (id)padSpec;
+ (id)phoneSpec;
+ (id)visionOSSpec;
- (BOOL)canShowVirtualCollections;
- (BOOL)shouldShowSectionHeaders;
- (BOOL)shouldUseCollageForCloudFeedPlaceholder;
- (BOOL)shouldUseShortTitleForStandInAlbumList;
- (BOOL)shouldUseTableView;
- (BOOL)showsDeleteButtonOnCellContentView;
- (CGPoint)_pixelRoundedOriginForCenteredImage:(id)a3 inRect:(CGRect)a4 window:(id)a5;
- (CGSize)cellSizeForBounds:(CGRect)a3;
- (CGSize)cellSizeForStackSize:(CGSize)a3;
- (CGSize)collageImageSize;
- (CGSize)contentSizeForViewInPopover;
- (CGSize)imageSize;
- (CGSize)stackSize;
- (CGSize)tileSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 stackViewStyle:(unint64_t)a5;
- (NSString)nameOfEmptyAlbumPlaceholderImage;
- (NSString)nameOfEmptyPeopleAlbumPlaceholderImage;
- (NSString)nameOfEmptySharedAlbumPlaceholderImage;
- (PUAlbumListViewControllerSpec)standInAlbumListViewControllerSpec;
- (PUFontManager)_fontManager;
- (PUPhotoDecoration)emptyStackPhotoDecoration;
- (PUPhotoDecoration)stackPhotoDecoration;
- (PUPhotosAlbumViewControllerSpec)albumViewControllerSpec;
- (PUPhotosGridViewControllerSpec)gridViewControllerSpec;
- (PXLayoutMetricInterpolator)_insetsInterpolator;
- (PXLayoutMetricInterpolator)_stackWidthInterpolator;
- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4;
- (UIEdgeInsets)stackPerspectiveInsets;
- (UIOffset)stackOffset;
- (UIOffset)stackPerspectiveOffset;
- (double)cellBackgroundCornerRadius;
- (double)collageSpacing;
- (double)posterSquareCornerRadius;
- (double)posterSubitemCornerRadius;
- (double)sectionFooterHeight;
- (double)sectionHeaderHeight;
- (id)emptyAlbumPlaceholderImageForWindow:(id)a3;
- (id)emptySharedAlbumPlaceholderImageForWindow:(id)a3;
- (int64_t)albumDeletionWarningStyle;
- (int64_t)cellContentViewLayout;
- (int64_t)collageImageContentMode;
- (int64_t)imageContentMode;
- (unint64_t)folderStackViewStyle;
- (unint64_t)stackViewStyle;
- (void)_getStackSize:(CGSize *)a3 outEdgeInsets:(UIEdgeInsets *)a4 forLayoutReferenceSize:(CGSize)a5 safeAreaInsets:(UIEdgeInsets)a6;
@end

@implementation PUAlbumListViewControllerSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumViewControllerSpec, 0);
  objc_storeStrong((id *)&self->_gridViewControllerSpec, 0);
  objc_storeStrong((id *)&self->__fontManager, 0);
  objc_storeStrong((id *)&self->_emptyStackPhotoDecoration, 0);
  objc_storeStrong((id *)&self->_stackPhotoDecoration, 0);
  objc_storeStrong((id *)&self->_emptySharedAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_emptyAlbumPlaceholderImage, 0);
}

- (PUPhotosAlbumViewControllerSpec)albumViewControllerSpec
{
  return self->_albumViewControllerSpec;
}

- (PUPhotosGridViewControllerSpec)gridViewControllerSpec
{
  return self->_gridViewControllerSpec;
}

- (int64_t)albumDeletionWarningStyle
{
  return self->_albumDeletionWarningStyle;
}

- (BOOL)canShowVirtualCollections
{
  return self->_canShowVirtualCollections;
}

- (BOOL)shouldUseShortTitleForStandInAlbumList
{
  return self->_shouldUseShortTitleForStandInAlbumList;
}

- (BOOL)shouldUseCollageForCloudFeedPlaceholder
{
  return self->_shouldUseCollageForCloudFeedPlaceholder;
}

- (double)sectionFooterHeight
{
  return self->_sectionFooterHeight;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (int64_t)cellContentViewLayout
{
  return self->_cellContentViewLayout;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return self->_showsDeleteButtonOnCellContentView;
}

- (double)collageSpacing
{
  return self->_collageSpacing;
}

- (int64_t)collageImageContentMode
{
  return self->_collageImageContentMode;
}

- (CGSize)collageImageSize
{
  objc_copyStruct(v4, &self->_collageImageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)posterSubitemCornerRadius
{
  return self->_posterSubitemCornerRadius;
}

- (double)posterSquareCornerRadius
{
  return self->_posterSquareCornerRadius;
}

- (UIOffset)stackPerspectiveOffset
{
  double horizontal = self->_stackPerspectiveOffset.horizontal;
  double vertical = self->_stackPerspectiveOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double top = self->_stackPerspectiveInsets.top;
  double left = self->_stackPerspectiveInsets.left;
  double bottom = self->_stackPerspectiveInsets.bottom;
  double right = self->_stackPerspectiveInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIOffset)stackOffset
{
  double horizontal = self->_stackOffset.horizontal;
  double vertical = self->_stackOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (CGSize)stackSize
{
  double width = self->_stackSize.width;
  double height = self->_stackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PUPhotoDecoration)emptyStackPhotoDecoration
{
  return self->_emptyStackPhotoDecoration;
}

- (PUPhotoDecoration)stackPhotoDecoration
{
  return self->_stackPhotoDecoration;
}

- (unint64_t)folderStackViewStyle
{
  return self->_folderStackViewStyle;
}

- (unint64_t)stackViewStyle
{
  return self->_stackViewStyle;
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)shouldUseTableView
{
  return self->_shouldUseTableView;
}

- (BOOL)shouldShowSectionHeaders
{
  return 1;
}

- (PUAlbumListViewControllerSpec)standInAlbumListViewControllerSpec
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return (PUAlbumListViewControllerSpec *)v2;
}

- (void)_getStackSize:(CGSize *)a3 outEdgeInsets:(UIEdgeInsets *)a4 forLayoutReferenceSize:(CGSize)a5 safeAreaInsets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double left = a6.left;
  double v11 = a5.width - a6.left - a6.right;
  v12 = [(PUAlbumListViewControllerSpec *)self _insetsInterpolator];
  [v12 valueForMetric:v11];
  double v14 = v13;

  if (a4)
  {
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    double v15 = round(*(double *)&PUMainScreenScale_screenScale * v14) / *(double *)&PUMainScreenScale_screenScale;
    a4->double top = 0.0;
    a4->double left = left + v15;
    a4->double bottom = 0.0;
    a4->double right = right + v15;
  }
  if (a3)
  {
    v16 = [(PUAlbumListViewControllerSpec *)self _stackWidthInterpolator];
    [v16 valueForMetric:v11 + v14 * -2.0];
    double v18 = v17;
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    CGFloat v19 = round(*(double *)&PUMainScreenScale_screenScale * v18) / *(double *)&PUMainScreenScale_screenScale;

    a3->double width = v19;
    a3->double height = v19;
  }
}

- (CGPoint)_pixelRoundedOriginForCenteredImage:(id)a3 inRect:(CGRect)a4 window:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a5;
  [a3 size];
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRectGetMidX(v18);
  UIRoundToViewScale();
  double v12 = v11;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRectGetMidY(v19);
  UIRoundToViewScale();
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (NSString)nameOfEmptySharedAlbumPlaceholderImage
{
  return (NSString *)@"icloud";
}

- (NSString)nameOfEmptyAlbumPlaceholderImage
{
  return (NSString *)@"photo.on.rectangle";
}

- (NSString)nameOfEmptyPeopleAlbumPlaceholderImage
{
  return (NSString *)@"person.crop.rectangle";
}

- (id)emptySharedAlbumPlaceholderImageForWindow:(id)a3
{
  emptySharedAlbumPlaceholderImage = self->_emptySharedAlbumPlaceholderImage;
  if (!emptySharedAlbumPlaceholderImage)
  {
    v5 = [(PUAlbumListViewControllerSpec *)self nameOfEmptySharedAlbumPlaceholderImage];
    v6 = +[PUAlbumListViewControllerSpec emptyPlaceholderImageForSystemImageNamed:v5 scale:3];
    v7 = self->_emptySharedAlbumPlaceholderImage;
    self->_emptySharedAlbumPlaceholderImage = v6;

    emptySharedAlbumPlaceholderImage = self->_emptySharedAlbumPlaceholderImage;
  }
  return emptySharedAlbumPlaceholderImage;
}

- (id)emptyAlbumPlaceholderImageForWindow:(id)a3
{
  emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  if (!emptyAlbumPlaceholderImage)
  {
    v5 = [(PUAlbumListViewControllerSpec *)self nameOfEmptyAlbumPlaceholderImage];
    v6 = +[PUAlbumListViewControllerSpec emptyPlaceholderImageForSystemImageNamed:v5 scale:3];
    v7 = self->_emptyAlbumPlaceholderImage;
    self->_emptyAlbumPlaceholderImage = v6;

    emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  }
  return emptyAlbumPlaceholderImage;
}

- (CGSize)tileSizeForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 stackViewStyle:(unint64_t)a5
{
  -[PUAlbumListViewControllerSpec stackSizeForLayoutReferenceSize:safeAreaInsets:](self, "stackSizeForLayoutReferenceSize:safeAreaInsets:", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  if (a5 > 6)
  {
    double v7 = 0.0;
    double v6 = 0.0;
  }
  else if (((1 << a5) & 0x67) == 0)
  {
    if (a5 == 3) {
      double v8 = 0.5;
    }
    else {
      double v8 = 0.330000013;
    }
    double v6 = v6 * v8;
    double v7 = v7 * v8;
  }
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (UIEdgeInsets)sectionInsetsForLayoutReferenceSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (double)cellBackgroundCornerRadius
{
  return 0.0;
}

- (CGSize)cellSizeForStackSize:(CGSize)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.width, a3.height);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PUAlbumListViewControllerSpec.m", 102, @"Method %s is a responsibility of subclass %@", "-[PUAlbumListViewControllerSpec cellSizeForStackSize:]", v7 object file lineNumber description];

  abort();
}

- (CGSize)cellSizeForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double v4 = 44.0;
  result.CGFloat height = v4;
  result.double width = width;
  return result;
}

- (CGSize)contentSizeForViewInPopover
{
  double v2 = 320.0;
  double v3 = 480.0;
  result.CGFloat height = v3;
  result.double width = v2;
  return result;
}

- (int64_t)imageContentMode
{
  return 1;
}

- (PXLayoutMetricInterpolator)_stackWidthInterpolator
{
  return (PXLayoutMetricInterpolator *)[MEMORY[0x1E4F902F8] albumsGridItemWidthInterpolator];
}

- (PXLayoutMetricInterpolator)_insetsInterpolator
{
  return (PXLayoutMetricInterpolator *)[MEMORY[0x1E4F902F8] albumsGridEdgeInsetsInterpolator];
}

- (PUFontManager)_fontManager
{
  fontManager = self->__fontManager;
  if (!fontManager)
  {
    double v4 = objc_alloc_init(PUFontManager);
    double v5 = self->__fontManager;
    self->__fontManager = v4;

    fontManager = self->__fontManager;
  }
  return fontManager;
}

+ (id)emptyPlaceholderImageForSystemImageNamed:(id)a3 scale:(int64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  double v7 = [v5 systemGray4Color];
  double v8 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
  v9 = (void *)MEMORY[0x1E4FB1830];
  v17[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v11 = [v9 configurationWithPaletteColors:v10];
  double v12 = [v8 configurationByApplyingConfiguration:v11];

  double v13 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2988] scale:a4];
  double v14 = [v12 configurationByApplyingConfiguration:v13];

  double v15 = [MEMORY[0x1E4FB1818] systemImageNamed:v6 withConfiguration:v14];

  return v15;
}

+ (id)visionOSSpec
{
  double v2 = objc_alloc_init(PUAlbumListViewControllerVisionOSSpec);
  return v2;
}

+ (id)padSpec
{
  double v2 = objc_alloc_init(PUAlbumListViewControllerPadSpec);
  return v2;
}

+ (id)phoneSpec
{
  double v2 = objc_alloc_init(PUAlbumListViewControllerPhoneSpec);
  return v2;
}

@end