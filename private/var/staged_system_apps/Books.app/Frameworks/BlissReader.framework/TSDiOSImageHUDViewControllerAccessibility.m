@interface TSDiOSImageHUDViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)loadView;
- (void)showHUDForRep:(id)a3;
@end

@implementation TSDiOSImageHUDViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDiOSImageHUDViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)showHUDForRep:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDiOSImageHUDViewControllerAccessibility;
  [(TSDiOSImageHUDViewControllerAccessibility *)&v5 showHUDForRep:a3];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  v4 = TSAccessibilityLocalizedString(@"image.mask.appeared");
  UIAccessibilityPostNotification(v3, v4);
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)TSDiOSImageHUDViewControllerAccessibility;
  [(TSDiOSImageHUDViewControllerAccessibility *)&v3 loadView];
  [-[TSDiOSImageHUDViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mSlider", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"mask.slider")];
}

@end