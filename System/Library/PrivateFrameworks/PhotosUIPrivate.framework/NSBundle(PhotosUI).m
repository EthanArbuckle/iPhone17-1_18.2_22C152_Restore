@interface NSBundle(PhotosUI)
+ (id)pu_PhotosUIFrameworkBundle;
@end

@implementation NSBundle(PhotosUI)

+ (id)pu_PhotosUIFrameworkBundle
{
  if (pu_PhotosUIFrameworkBundle_onceToken != -1) {
    dispatch_once(&pu_PhotosUIFrameworkBundle_onceToken, &__block_literal_global_26445);
  }
  v0 = (void *)pu_PhotosUIFrameworkBundle_frameworkBundle;
  return v0;
}

@end