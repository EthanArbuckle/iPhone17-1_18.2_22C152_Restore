@interface BKScrubberControlAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_accessibilityIsRTL;
- (BOOL)_axIsLoading;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (double)bkaxProgress;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)bkaxDelegate;
- (id)bkaxTarget;
- (id)bkaxThumb;
- (int64_t)bkaxPageNumber;
- (unint64_t)accessibilityTraits;
- (void)_axTurnPage:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation BKScrubberControlAccessibility

+ (id)imaxTargetClassName
{
  return @"BKScrubberControl";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)bkaxTarget
{
  objc_opt_class();
  v2 = __IMAccessibilityCastAsClass();

  return v2;
}

- (id)bkaxDelegate
{
  objc_opt_class();
  v3 = [(BKScrubberControlAccessibility *)self bkaxTarget];
  v4 = [v3 bkAccessibilityDelegate];
  v5 = __IMAccessibilityCastAsClass();

  return v5;
}

- (int64_t)bkaxPageNumber
{
  v2 = [(BKScrubberControlAccessibility *)self bkaxTarget];
  id v3 = [v2 pageNumber];

  return (int64_t)v3;
}

- (double)bkaxProgress
{
  v2 = [(BKScrubberControlAccessibility *)self bkaxTarget];
  [v2 progress];
  double v4 = v3;

  return v4;
}

- (id)bkaxThumb
{
  v2 = [(BKScrubberControlAccessibility *)self bkaxTarget];
  double v3 = [v2 thumb];

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7 = [(BKScrubberControlAccessibility *)self bkaxTarget];
  v8 = [v7 track];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v21.origin.CGFloat x = v10;
  v21.origin.CGFloat y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  v20.CGFloat x = x;
  v20.CGFloat y = y;
  if (CGRectContainsPoint(v21, v20)) {
    v17 = self;
  }
  else {
    v17 = 0;
  }

  return v17;
}

- (void)_axTurnPage:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(BKScrubberControlAccessibility *)self bkaxDelegate];
  if (v5)
  {
    id v16 = v5;
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v6 = [v16 hasSpreadPages];
    }
    else {
      unsigned __int8 v6 = 0;
    }
    objc_opt_class();
    if ((v6 | objc_opt_isKindOfClass())) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    v8 = [(BKScrubberControlAccessibility *)self bkaxTarget];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      CGFloat v10 = [(BKScrubberControlAccessibility *)self bkaxTarget];
      id v11 = [v10 pageCount];
    }
    else
    {
      id v11 = 0;
    }
    int64_t v12 = [(BKScrubberControlAccessibility *)self bkaxPageNumber];
    if (v3) {
      uint64_t v13 = v7;
    }
    else {
      uint64_t v13 = -v7;
    }
    uint64_t v14 = v12 + v13;
    if (v14 >= (uint64_t)v11) {
      uint64_t v14 = (uint64_t)v11;
    }
    if (v14 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v14;
    }
    [(BKScrubberControlAccessibility *)self sendActionsForControlEvents:1];
    if (objc_opt_respondsToSelector()) {
      [(BKScrubberControlAccessibility *)self setPageNumber:v15];
    }
    if (objc_opt_respondsToSelector()) {
      [(BKScrubberControlAccessibility *)self setValue:(double)(v15 - 1) / (double)((unint64_t)v11 - 1)];
    }
    [(BKScrubberControlAccessibility *)self sendActionsForControlEvents:4096];
    [(BKScrubberControlAccessibility *)self sendActionsForControlEvents:64];
    v5 = v16;
  }
}

- (BOOL)_accessibilityIsRTL
{
  v2 = [(BKScrubberControlAccessibility *)self bkaxTarget];
  BOOL v3 = [v2 track];
  BOOL v4 = [v3 layoutDirection] == (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(BKScrubberControlAccessibility *)self bkaxDelegate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)accessibilityIncrement
{
  BOOL v3 = [(BKScrubberControlAccessibility *)self bkaxPageNumber];
  [(BKScrubberControlAccessibility *)self _axTurnPage:1];
  if (v3 != (void *)[(BKScrubberControlAccessibility *)self bkaxPageNumber])
  {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, kAXAnnouncementTypeScrollSound);
    UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;
    UIAccessibilityPostNotification(v4, 0);
  }
}

- (void)accessibilityDecrement
{
  BOOL v3 = [(BKScrubberControlAccessibility *)self bkaxPageNumber];
  [(BKScrubberControlAccessibility *)self _axTurnPage:0];
  if (v3 != (void *)[(BKScrubberControlAccessibility *)self bkaxPageNumber])
  {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, kAXAnnouncementTypeScrollSound);
    UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;
    UIAccessibilityPostNotification(v4, 0);
  }
}

- (CGRect)accessibilityFrame
{
  BOOL v3 = [(BKScrubberControlAccessibility *)self bkaxThumb];
  if (v3)
  {
    v25.receiver = self;
    v25.super_class = (Class)BKScrubberControlAccessibility;
    [(BKScrubberControlAccessibility *)&v25 accessibilityFrame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [v3 accessibilityFrame];
    v29.origin.CGFloat x = v12;
    v29.origin.CGFloat y = v13;
    v29.size.CGFloat width = v14;
    v29.size.CGFloat height = v15;
    v26.origin.CGFloat x = v5;
    v26.origin.CGFloat y = v7;
    v26.size.CGFloat width = v9;
    v26.size.CGFloat height = v11;
    CGRect v27 = CGRectUnion(v26, v29);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)BKScrubberControlAccessibility;
    [(BKScrubberControlAccessibility *)&v24 accessibilityFrame];
  }
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (BOOL)_axIsLoading
{
  [(BKScrubberControlAccessibility *)self bkaxProgress];
  return v2 < 1.0;
}

- (unint64_t)accessibilityTraits
{
  unsigned int v2 = [(BKScrubberControlAccessibility *)self _axIsLoading];
  BOOL v3 = &UIAccessibilityTraitUpdatesFrequently;
  if (!v2) {
    BOOL v3 = &UIAccessibilityTraitAdjustable;
  }
  return *v3;
}

- (CGPoint)accessibilityActivationPoint
{
  BOOL v3 = [(BKScrubberControlAccessibility *)self bkaxThumb];
  double v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BKScrubberControlAccessibility;
    [(BKScrubberControlAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (id)accessibilityHint
{
  if ([(BKScrubberControlAccessibility *)self _axIsLoading])
  {
    BOOL v3 = 0;
  }
  else
  {
    double v4 = [(BKScrubberControlAccessibility *)self bkaxTarget];
    unsigned int v5 = [v4 orientation];

    if (v5) {
      double v6 = @"page.control.hint.vertical";
    }
    else {
      double v6 = @"page.control.hint";
    }
    BOOL v3 = AEAXLocString(v6);
  }

  return v3;
}

- (id)accessibilityValue
{
  if ([(BKScrubberControlAccessibility *)self _axIsLoading]
    || (int64_t v3 = [(BKScrubberControlAccessibility *)self bkaxPageNumber], v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    double v4 = 0;
  }
  else
  {
    int64_t v5 = v3;
    double v6 = AEAXLocString(@"page.num %@");
    double v7 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v5];
    double v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
  }

  return v4;
}

- (id)accessibilityLabel
{
  if ([(BKScrubberControlAccessibility *)self _axIsLoading])
  {
    int64_t v3 = AEAXLocString(@"book.load.progress %@");
    [(BKScrubberControlAccessibility *)self bkaxProgress];
    double v4 = +[NSNumberFormatter imaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:](NSNumberFormatter, "imaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 0);
    int64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4);
  }
  else
  {
    int64_t v5 = AEAXLocString(@"page.control.type");
  }

  return v5;
}

@end