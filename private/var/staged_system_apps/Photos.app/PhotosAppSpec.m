@interface PhotosAppSpec
+ (id)specForIdiom:(int64_t)a3;
- (PUPhotosGridViewControllerSpec)importViewControllerSpec;
@end

@implementation PhotosAppSpec

+ (id)specForIdiom:(int64_t)a3
{
  if (!a3)
  {
    v4 = &off_100061490;
LABEL_5:
    id v5 = objc_alloc_init(*v4);
    return v5;
  }
  if (a3 == 1)
  {
    v4 = off_100061488;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (PUPhotosGridViewControllerSpec)importViewControllerSpec
{
  return 0;
}

@end