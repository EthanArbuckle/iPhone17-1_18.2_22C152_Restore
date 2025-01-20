@interface PhotosAppPhoneSpec
- (id)importViewControllerSpec;
@end

@implementation PhotosAppPhoneSpec

- (id)importViewControllerSpec
{
  id v2 = objc_alloc_init((Class)PUPhotosGridViewControllerPhoneSpec);

  return v2;
}

@end