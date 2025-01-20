@interface PhotosAppPadSpec
- (id)importViewControllerSpec;
@end

@implementation PhotosAppPadSpec

- (id)importViewControllerSpec
{
  id v2 = objc_alloc_init((Class)PUPhotosGridViewControllerPadSpec);

  return v2;
}

@end