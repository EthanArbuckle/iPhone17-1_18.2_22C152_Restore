@interface BKZoomingScrollViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)_accessibilityScrollStatus;
- (void)accessibilityScrollDownPage;
- (void)accessibilityScrollLeftPage;
- (void)accessibilityScrollRightPage;
- (void)accessibilityScrollUpPage;
@end

@implementation BKZoomingScrollViewAccessibility

+ (id)imaxTargetClassName
{
  return @"BKZoomingScrollView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityScrollStatus
{
  v3 = [(BKZoomingScrollViewAccessibility *)self imaxValueForKey:@"visibleBounds"];
  [v3 rectValue];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(BKZoomingScrollViewAccessibility *)self imaxValueForKey:@"_accessibilityContentSize"];
  [v12 sizeValue];
  double v14 = v13;
  double v16 = v15;

  if (byte_100B4A3E0 == 1)
  {
    float v17 = v16 / v11;
    float v18 = ceilf(v17);
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    double v19 = CGRectGetMidY(v27) / v16;
  }
  else
  {
    float v20 = v14 / v9;
    float v18 = ceilf(v20);
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    double v19 = CGRectGetMidX(v28) / v14;
  }
  float v21 = v19 * (double)(uint64_t)v18;
  uint64_t v22 = (uint64_t)(float)(floorf(v21) + 1.0);
  v23 = sub_1000B86A8(@"picture.book.scroll.status %ld %ld");
  v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v22, (uint64_t)v18);

  return v24;
}

- (void)accessibilityScrollDownPage
{
  byte_100B4A3E0 = 1;
  [(BKZoomingScrollViewAccessibility *)self _bkaxIgnoreNextNotification:UIAccessibilityPageScrolledNotification];
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  [(BKZoomingScrollViewAccessibility *)&v5 accessibilityScrollDownPage];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  double v4 = [(BKZoomingScrollViewAccessibility *)self _accessibilityScrollStatus];
  UIAccessibilityPostNotification(v3, v4);
}

- (void)accessibilityScrollUpPage
{
  byte_100B4A3E0 = 1;
  [(BKZoomingScrollViewAccessibility *)self _bkaxIgnoreNextNotification:UIAccessibilityPageScrolledNotification];
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  [(BKZoomingScrollViewAccessibility *)&v5 accessibilityScrollUpPage];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  double v4 = [(BKZoomingScrollViewAccessibility *)self _accessibilityScrollStatus];
  UIAccessibilityPostNotification(v3, v4);
}

- (void)accessibilityScrollLeftPage
{
  byte_100B4A3E0 = 0;
  [(BKZoomingScrollViewAccessibility *)self _bkaxIgnoreNextNotification:UIAccessibilityPageScrolledNotification];
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  [(BKZoomingScrollViewAccessibility *)&v5 accessibilityScrollLeftPage];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  double v4 = [(BKZoomingScrollViewAccessibility *)self _accessibilityScrollStatus];
  UIAccessibilityPostNotification(v3, v4);
}

- (void)accessibilityScrollRightPage
{
  byte_100B4A3E0 = 0;
  [(BKZoomingScrollViewAccessibility *)self _bkaxIgnoreNextNotification:UIAccessibilityPageScrolledNotification];
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  [(BKZoomingScrollViewAccessibility *)&v5 accessibilityScrollRightPage];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  double v4 = [(BKZoomingScrollViewAccessibility *)self _accessibilityScrollStatus];
  UIAccessibilityPostNotification(v3, v4);
}

@end