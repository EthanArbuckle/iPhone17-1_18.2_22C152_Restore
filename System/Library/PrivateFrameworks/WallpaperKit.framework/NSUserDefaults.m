@interface NSUserDefaults
@end

@implementation NSUserDefaults

id __58__NSUserDefaults_WKAdditions__wk_wallpaperKitUserDefaults__block_invoke()
{
  if (WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_token_0, &__block_literal_global_10);
  }
  v0 = (void *)WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __58__NSUserDefaults_WKAdditions__wk_wallpaperKitUserDefaults__block_invoke_2()
{
  WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_object_0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WallpaperKit"];
  return MEMORY[0x1F41817F8]();
}

@end