@interface NSBundle(SharingUI)
+ (id)sfui_bundle;
@end

@implementation NSBundle(SharingUI)

+ (id)sfui_bundle
{
  if (sfui_bundle_onceToken != -1) {
    dispatch_once(&sfui_bundle_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)sfui_bundle_frameworkBundle;
  return v0;
}

@end