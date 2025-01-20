@interface THBookmarkMenuPopoverViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation THBookmarkMenuPopoverViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THBookmarkMenuPopoverViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THBookmarkMenuPopoverViewControllerAccessibility;
  -[THBookmarkMenuPopoverViewControllerAccessibility tableView:didSelectRowAtIndexPath:](&v9, "tableView:didSelectRowAtIndexPath:");
  id v6 = objc_msgSend(objc_msgSend(a3, "cellForRowAtIndexPath:", a4), "accessibilityLabel");
  if ([v6 length])
  {
    UIAccessibilityNotifications v7 = UIAccessibilityAnnouncementNotification;
    v8 = +[NSString stringWithFormat:THAccessibilityLocalizedString(@"moved.to.format %@"), v6];
    UIAccessibilityPostNotification(v7, v8);
  }
}

@end