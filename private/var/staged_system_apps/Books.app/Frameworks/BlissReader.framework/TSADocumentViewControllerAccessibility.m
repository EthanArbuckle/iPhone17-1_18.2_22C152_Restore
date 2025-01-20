@interface TSADocumentViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)loadApplicationToolbar;
@end

@implementation TSADocumentViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)loadApplicationToolbar
{
  v5.receiver = self;
  v5.super_class = (Class)TSADocumentViewControllerAccessibility;
  [(TSADocumentViewControllerAccessibility *)&v5 loadApplicationToolbar];
  [-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"toolsButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"tools")];
  [-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"insertButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"insert")];
  [-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"inspectorButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"inspector")];
  [-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"readModeButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"readmode")];
  [-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"sharingButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"share.button.label")];
  id v3 = [(TSADocumentViewControllerAccessibility *)self tsaxValueForKey:@"coachingTipsButton"];
  [v3 setAccessibilityLabel:TSAccessibilityLocalizedString(@"coaching.tips.button.label")];
  [v3 setAccessibilityHint:TSAccessibilityLocalizedString(@"coaching.tips.button.help.iOS")];
  id v4 = [(TSADocumentViewControllerAccessibility *)self tsaxValueForKey:@"rightApplicationToolbarItems"];
  if ([v4 count] == (char *)&dword_0 + 1) {
    objc_msgSend(objc_msgSend(v4, "lastObject"), "setAccessibilityLabel:", @"Debug menu");
  }
}

@end