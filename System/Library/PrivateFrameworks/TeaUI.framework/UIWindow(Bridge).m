@interface UIWindow(Bridge)
- (void)ts_installDebugMenuHandler:()Bridge;
@end

@implementation UIWindow(Bridge)

- (void)ts_installDebugMenuHandler:()Bridge
{
  id v4 = a3;
  id v6 = [a1 windowScene];
  v5 = [v6 statusBarManager];
  [v5 setDebugMenuHandler:v4];
}

@end