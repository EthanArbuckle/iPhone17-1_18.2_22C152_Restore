@interface TSWPNumberKeyboardOrientationAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)viewDidLoad;
@end

@implementation TSWPNumberKeyboardOrientationAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPNumberKeyboardOrientation";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPNumberKeyboardOrientationAccessibility;
  [(TSWPNumberKeyboardOrientationAccessibility *)&v3 viewDidLoad];
  [-[TSWPNumberKeyboardOrientationAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mStarsButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"stars.rating.button")];
  [-[TSWPNumberKeyboardOrientationAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mNegativeButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"plus.or.minus.button")];
  [-[TSWPNumberKeyboardOrientationAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mBooleanButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"checkbox.creator.button")];
}

@end