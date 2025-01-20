@interface TSWPKeyboardOrientationAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)contextChanged;
- (void)viewDidLoad;
@end

@implementation TSWPKeyboardOrientationAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPKeyboardOrientation";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)contextChanged
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPKeyboardOrientationAccessibility;
  [(TSWPKeyboardOrientationAccessibility *)&v2 contextChanged];
  UIAccessibilityPostNotification(TSAccessibilityFirstResponderChangedNotification, 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPKeyboardOrientationAccessibility;
  [(TSWPKeyboardOrientationAccessibility *)&v3 viewDidLoad];
  [-[TSWPKeyboardOrientationAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mDeleteButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"delete.button")];
  [-[TSWPKeyboardOrientationAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mMoveRightButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"move.right.button")];
  [self tsaxValueForKey:@"mMoveDownButton" setAccessibilityLabel:@"return.button"];
}

@end