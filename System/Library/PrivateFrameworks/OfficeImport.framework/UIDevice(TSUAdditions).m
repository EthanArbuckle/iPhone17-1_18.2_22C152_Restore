@interface UIDevice(TSUAdditions)
+ (uint64_t)platformString;
@end

@implementation UIDevice(TSUAdditions)

+ (uint64_t)platformString
{
  if (platformString_s_platformStringToken != -1) {
    dispatch_once(&platformString_s_platformStringToken, &__block_literal_global_0);
  }
  return platformString_s_platformString;
}

@end