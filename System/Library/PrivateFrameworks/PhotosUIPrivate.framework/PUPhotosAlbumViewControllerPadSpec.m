@interface PUPhotosAlbumViewControllerPadSpec
- (double)contentCornerRadius;
- (id)gridSpec;
- (int64_t)fullMomentsSectionHeaderStyle;
@end

@implementation PUPhotosAlbumViewControllerPadSpec

- (double)contentCornerRadius
{
  v2 = +[PUInterfaceManager currentTheme];
  [v2 padAlbumCornerRadius];
  double v4 = v3;

  return v4;
}

- (int64_t)fullMomentsSectionHeaderStyle
{
  return 0;
}

- (id)gridSpec
{
  v2 = objc_alloc_init(PUPhotosGridViewControllerPadSpec);
  return v2;
}

@end