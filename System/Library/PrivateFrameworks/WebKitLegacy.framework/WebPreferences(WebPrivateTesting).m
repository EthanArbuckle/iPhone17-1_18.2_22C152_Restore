@interface WebPreferences(WebPrivateTesting)
+ (uint64_t)_clearNetworkLoaderSession:()WebPrivateTesting;
@end

@implementation WebPreferences(WebPrivateTesting)

+ (uint64_t)_clearNetworkLoaderSession:()WebPrivateTesting
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

@end