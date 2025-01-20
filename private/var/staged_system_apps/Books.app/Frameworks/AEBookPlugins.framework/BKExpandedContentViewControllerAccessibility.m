@interface BKExpandedContentViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)close:(BOOL)a3;
- (void)setToolbarVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)stopActivityIndicator:(BOOL)a3;
@end

@implementation BKExpandedContentViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKExpandedContentViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)setToolbarVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() || v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKExpandedContentViewControllerAccessibility;
    [(BKExpandedContentViewControllerAccessibility *)&v7 setToolbarVisible:v5 animated:v4];
  }
}

- (void)close:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKExpandedContentViewControllerAccessibility;
  [(BKExpandedContentViewControllerAccessibility *)&v3 close:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)stopActivityIndicator:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKExpandedContentViewControllerAccessibility;
  [(BKExpandedContentViewControllerAccessibility *)&v8 stopActivityIndicator:a3];
  UIAccessibilityNotifications v4 = UIAccessibilityAnnouncementNotification;
  BOOL v5 = AEAXLocString(@"preview.visible");
  UIAccessibilityPostNotification(v4, v5);

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E3100;
  block[3] = &unk_1DAB88;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end