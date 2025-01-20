@interface UIApplication
- (void)accessibilityInitialize;
@end

@implementation UIApplication

- (void)accessibilityInitialize
{
  v2 = +[TSAccessibility sharedInstance];

  [(TSAccessibility *)v2 loadAccessibilitySupport];
}

@end