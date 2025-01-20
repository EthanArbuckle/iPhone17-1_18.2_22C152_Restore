@interface NSURL(WebKit)
+ (uint64_t)nu_canHandleNavigationAction:()WebKit;
@end

@implementation NSURL(WebKit)

+ (uint64_t)nu_canHandleNavigationAction:()WebKit
{
  id v3 = a3;
  v4 = [v3 request];
  v5 = [v3 targetFrame];

  uint64_t v6 = [v5 isMainFrame];
  uint64_t v7 = [MEMORY[0x263F1FAA0] _canHandleRequest:v4 forMainFrame:v6];

  return v7;
}

@end