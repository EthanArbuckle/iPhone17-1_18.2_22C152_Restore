@interface NSBundle(PhotosUICore)
+ (id)px_bundle;
@end

@implementation NSBundle(PhotosUICore)

+ (id)px_bundle
{
  if (px_bundle_onceToken != -1) {
    dispatch_once(&px_bundle_onceToken, &__block_literal_global_286400);
  }
  v0 = (void *)px_bundle_frameworkBundle;
  return v0;
}

@end