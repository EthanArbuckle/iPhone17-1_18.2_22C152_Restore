@interface LTUIHostedDownloadViewBridge
+ (UIViewController)accessibilityViewController;
+ (UIViewController)viewController;
- (LTUIHostedDownloadViewBridge)init;
@end

@implementation LTUIHostedDownloadViewBridge

+ (UIViewController)viewController
{
  return (UIViewController *)sub_1DB10D02C((uint64_t)a1, (uint64_t)a2, 0);
}

+ (UIViewController)accessibilityViewController
{
  return (UIViewController *)sub_1DB10D02C((uint64_t)a1, (uint64_t)a2, 1);
}

- (LTUIHostedDownloadViewBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HostedDownloadViewBridge();
  return [(LTUIHostedDownloadViewBridge *)&v3 init];
}

@end