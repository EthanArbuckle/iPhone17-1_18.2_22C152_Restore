@interface RUIPlatform
+ (BOOL)isAppleTV;
+ (void)assertWebkitAllowed;
@end

@implementation RUIPlatform

+ (BOOL)isAppleTV
{
  if (isAppleTV_onceToken != -1) {
    dispatch_once(&isAppleTV_onceToken, &__block_literal_global);
  }
  return isAppleTV_isAppleTV;
}

uint64_t __24__RUIPlatform_isAppleTV__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isAppleTV_isAppleTV = result == 4;
  return result;
}

+ (void)assertWebkitAllowed
{
  if (MGGetBoolAnswer())
  {
    id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Webkit is not allowed in diagnostics mode" userInfo:0];
    objc_exception_throw(v2);
  }
}

@end