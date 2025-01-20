@interface PUPhotosAlbumViewControllerPhoneSpec
- (id)gridSpec;
- (int64_t)fullMomentsSectionHeaderStyle;
@end

@implementation PUPhotosAlbumViewControllerPhoneSpec

- (int64_t)fullMomentsSectionHeaderStyle
{
  return 0;
}

- (id)gridSpec
{
  v2 = objc_alloc_init(PUPhotosGridViewControllerPhoneSpec);
  return v2;
}

@end