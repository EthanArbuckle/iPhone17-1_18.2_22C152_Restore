@interface NSBundle(MobileSafariFrameworkExtras)
+ (uint64_t)safari_isSafariViewServiceBundle;
+ (uint64_t)safari_isWebSheetApplicationBundle;
+ (uint64_t)sf_mobileSafariFrameworkBundle;
@end

@implementation NSBundle(MobileSafariFrameworkExtras)

+ (uint64_t)sf_mobileSafariFrameworkBundle
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = objc_opt_class();

  return [v0 bundleForClass:v1];
}

+ (uint64_t)safari_isWebSheetApplicationBundle
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.WebSheet"];

  return v2;
}

+ (uint64_t)safari_isSafariViewServiceBundle
{
  if (safari_isSafariViewServiceBundle_onceToken != -1) {
    dispatch_once(&safari_isSafariViewServiceBundle_onceToken, &__block_literal_global_38);
  }
  return safari_isSafariViewServiceBundle_isSafariViewService;
}

@end