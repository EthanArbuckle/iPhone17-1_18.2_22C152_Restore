@interface NSBundle(VideosUI)
+ (id)vui_videosUIBundle;
@end

@implementation NSBundle(VideosUI)

+ (id)vui_videosUIBundle
{
  if (vui_videosUIBundle_onceToken != -1) {
    dispatch_once(&vui_videosUIBundle_onceToken, &__block_literal_global_146);
  }
  v0 = (void *)vui_videosUIBundle_bundle;
  return v0;
}

@end