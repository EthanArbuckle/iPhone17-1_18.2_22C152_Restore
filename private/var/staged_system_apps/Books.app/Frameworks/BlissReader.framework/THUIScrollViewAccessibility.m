@interface THUIScrollViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollDownPageSupported;
- (BOOL)accessibilityScrollLeftPage;
- (BOOL)accessibilityScrollRightPage;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityScrollUpPageSupported;
- (BOOL)thaxIsVerticalScrollingDisabled;
- (THUIScrollViewAccessibilityDelegate)thaxScrollingDelegate;
- (UIEdgeInsets)_accessibilityContentInset;
- (id)_accessibilityScrollStatus;
- (void)_accessibilitySendScrollStatus;
- (void)thaxSetScrollingDelegate:(id)a3;
- (void)thaxSetVerticalScrollingDisabled:(BOOL)a3;
@end

@implementation THUIScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIScrollView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THUIScrollViewAccessibilityDelegate)thaxScrollingDelegate
{
  return (THUIScrollViewAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_573A80);
}

- (void)thaxSetScrollingDelegate:(id)a3
{
}

- (BOOL)thaxIsVerticalScrollingDisabled
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A81);
}

- (void)thaxSetVerticalScrollingDisabled:(BOOL)a3
{
}

- (void)_accessibilitySendScrollStatus
{
  [(THUIScrollViewAccessibility *)self thaxScrollingDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THUIScrollViewAccessibilityDelegate *)[(THUIScrollViewAccessibility *)self thaxScrollingDelegate] thaxShouldPreventPageScrolledNotificationForScrollView:self])
  {
    TSAccessibilityPostAnnouncementNotification((uint64_t)self, (uint64_t)[(THUIScrollViewAccessibility *)self _accessibilityScrollStatus]);
    UIAccessibilityNotifications v3 = UIAccessibilityLayoutChangedNotification;
    UIAccessibilityPostNotification(v3, 0);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THUIScrollViewAccessibility;
    [(THUIScrollViewAccessibility *)&v4 _accessibilitySendScrollStatus];
  }
}

- (id)_accessibilityScrollStatus
{
  UIAccessibilityNotifications v3 = [(THUIScrollViewAccessibility *)self thaxScrollingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = [(THUIScrollViewAccessibilityDelegate *)v3 thaxScrollStatusStringForScrollView:self]) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v14.receiver = self,
          v14.super_class = (Class)THUIScrollViewAccessibility,
          id v5 = [(TSUIScrollViewAccessibility *)&v14 _accessibilityScrollStatus],
          v6 = [(THUIScrollViewAccessibilityDelegate *)v3 thaxSuffixOfScrollStatusStringForScrollView:self], (id result = __TSAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6)) == 0))
    {
      v13.receiver = self;
      v13.super_class = (Class)THUIScrollViewAccessibility;
      return [(TSUIScrollViewAccessibility *)&v13 _accessibilityScrollStatus];
    }
  }
  return result;
}

- (UIEdgeInsets)_accessibilityContentInset
{
  long long v3 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  long long v10 = *(_OWORD *)&UIEdgeInsetsZero.top;
  long long v11 = v3;
  objc_super v4 = [(THUIScrollViewAccessibility *)self thaxScrollingDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THUIScrollViewAccessibilityDelegate *)v4 thaxScrollView:self shouldOverrideAccessibilityContentInsetWithValue:&v10])
  {
    double v6 = *((double *)&v10 + 1);
    double v5 = *(double *)&v10;
    double v8 = *((double *)&v11 + 1);
    double v7 = *(double *)&v11;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THUIScrollViewAccessibility;
    [(THUIScrollViewAccessibility *)&v9 _accessibilityContentInset];
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  if ([(THUIScrollViewAccessibility *)self thaxIsVerticalScrollingDisabled]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  return [(THUIScrollViewAccessibility *)&v4 accessibilityScrollDownPageSupported];
}

- (BOOL)accessibilityScrollUpPageSupported
{
  if ([(THUIScrollViewAccessibility *)self thaxIsVerticalScrollingDisabled]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  return [(THUIScrollViewAccessibility *)&v4 accessibilityScrollUpPageSupported];
}

- (BOOL)accessibilityScrollLeftPage
{
  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  if ([(TSUIScrollViewAccessibility *)&v4 accessibilityScrollLeftPage]) {
    return 1;
  }
  else {
    return [(THUIScrollViewAccessibilityDelegate *)[(THUIScrollViewAccessibility *)self thaxScrollingDelegate] accessibilityScrollLeftPage];
  }
}

- (BOOL)accessibilityScrollRightPage
{
  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  if ([(TSUIScrollViewAccessibility *)&v4 accessibilityScrollRightPage]) {
    return 1;
  }
  else {
    return [(THUIScrollViewAccessibilityDelegate *)[(THUIScrollViewAccessibility *)self thaxScrollingDelegate] accessibilityScrollRightPage];
  }
}

- (BOOL)accessibilityScrollUpPage
{
  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  if ([(THUIScrollViewAccessibility *)&v4 accessibilityScrollUpPage]) {
    return 1;
  }
  else {
    return [(THUIScrollViewAccessibilityDelegate *)[(THUIScrollViewAccessibility *)self thaxScrollingDelegate] accessibilityScrollUpPage];
  }
}

- (BOOL)accessibilityScrollDownPage
{
  char v14 = 0;
  long long v3 = (objc_class *)objc_opt_class();
  objc_super v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v14);
  if (v14) {
    abort();
  }
  double v5 = v4;
  [v4 contentSize];
  double v7 = v6;
  [v5 bounds];
  double v8 = v7 - CGRectGetMaxY(v15);
  [v5 bounds];
  double v10 = v9 * 0.5;
  if (v8 > v9 * 0.5)
  {
    v13.receiver = self;
    v13.super_class = (Class)THUIScrollViewAccessibility;
    if ([(THUIScrollViewAccessibility *)&v13 accessibilityScrollDownPage]) {
      return 1;
    }
  }
  BOOL result = [(THUIScrollViewAccessibilityDelegate *)[(THUIScrollViewAccessibility *)self thaxScrollingDelegate] accessibilityScrollDownPage];
  if (v8 <= v10 && !result)
  {
    v12.receiver = self;
    v12.super_class = (Class)THUIScrollViewAccessibility;
    return [(THUIScrollViewAccessibility *)&v12 accessibilityScrollDownPage];
  }
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  double v5 = [(THUIScrollViewAccessibility *)self thaxScrollingDelegate];
  if (v5)
  {
    double v6 = v5;
    switch(a3)
    {
      case 1:
      case 6:
        if ([(THUIScrollViewAccessibilityDelegate *)v5 tsaxBoolValueForKey:@"accessibilityScrollRightPageSupported"])
        {
          if ([(THUIScrollViewAccessibility *)self accessibilityScrollRightPage]
            || ([(THUIScrollViewAccessibilityDelegate *)v6 accessibilityScrollRightPage] & 1) != 0)
          {
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        LODWORD(v5) = [(THUIScrollViewAccessibilityDelegate *)v6 tsaxBoolValueForKey:@"accessibilityScrollUpPageSupported"];
        if (v5)
        {
          if ([(THUIScrollViewAccessibility *)self accessibilityScrollUpPage]
            || ([(THUIScrollViewAccessibilityDelegate *)v6 accessibilityScrollUpPage] & 1) != 0)
          {
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        return (char)v5;
      case 2:
      case 5:
        if ([(THUIScrollViewAccessibilityDelegate *)v5 tsaxBoolValueForKey:@"accessibilityScrollLeftPageSupported"])
        {
          if ([(THUIScrollViewAccessibility *)self accessibilityScrollLeftPage]
            || ([(THUIScrollViewAccessibilityDelegate *)v6 accessibilityScrollLeftPage] & 1) != 0)
          {
            goto LABEL_20;
          }
LABEL_21:
          LOBYTE(v5) = 0;
          return (char)v5;
        }
        LODWORD(v5) = [(THUIScrollViewAccessibilityDelegate *)v6 tsaxBoolValueForKey:@"accessibilityScrollDownPageSupported"];
        if (v5)
        {
          if ([(THUIScrollViewAccessibility *)self accessibilityScrollDownPage]
            || ([(THUIScrollViewAccessibilityDelegate *)v6 accessibilityScrollDownPage] & 1) != 0)
          {
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        break;
      default:
        v9.receiver = self;
        v9.super_class = (Class)THUIScrollViewAccessibility;
        LODWORD(v5) = [(THUIScrollViewAccessibility *)&v9 accessibilityScroll:a3];
        if (v5)
        {
LABEL_20:
          dispatch_time_t v7 = dispatch_time(0, 250000000);
          dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_46C920);
          LOBYTE(v5) = 1;
        }
        return (char)v5;
    }
  }
  return (char)v5;
}

@end