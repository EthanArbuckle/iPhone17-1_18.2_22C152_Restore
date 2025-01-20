@interface NSBundle
@end

@implementation NSBundle

void __40__NSBundle_VideosUI__vui_videosUIBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.VideosUI"];
  v1 = (void *)vui_videosUIBundle_bundle;
  vui_videosUIBundle_bundle = v0;
}

@end