@interface PUAlbumListViewControllerCommonPhoneSpec
- (BOOL)shouldUseCollageForCloudFeedPlaceholder;
- (BOOL)showsDeleteButtonOnCellContentView;
- (UIEdgeInsets)stackPerspectiveInsets;
- (UIOffset)stackOffset;
- (UIOffset)stackPerspectiveOffset;
- (double)posterSquareCornerRadius;
- (double)posterSubitemCornerRadius;
- (double)sectionFooterHeight;
- (double)sectionHeaderHeight;
- (id)albumViewControllerSpec;
- (id)emptyStackPhotoDecoration;
- (id)gridViewControllerSpec;
- (id)stackPhotoDecoration;
- (int64_t)albumDeletionWarningStyle;
@end

@implementation PUAlbumListViewControllerCommonPhoneSpec

- (BOOL)shouldUseCollageForCloudFeedPlaceholder
{
  return 0;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return 1;
}

- (int64_t)albumDeletionWarningStyle
{
  return 1;
}

- (id)albumViewControllerSpec
{
  v2 = objc_alloc_init(PUPhotosAlbumViewControllerPhoneSpec);
  return v2;
}

- (id)gridViewControllerSpec
{
  v2 = objc_alloc_init(PUPhotosGridViewControllerPhoneSpec);
  return v2;
}

- (double)sectionFooterHeight
{
  return 15.0;
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

- (double)posterSubitemCornerRadius
{
  return 4.0;
}

- (double)posterSquareCornerRadius
{
  v2 = +[PUInterfaceManager currentTheme];
  [v2 phoneAlbumCornerRadius];
  double v4 = v3;

  return v4;
}

- (UIOffset)stackOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIOffset)stackPerspectiveOffset
{
  double v2 = 0.0;
  double v3 = -4.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double v2 = 2.0;
  double v3 = 2.0;
  double v4 = 2.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
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

@end