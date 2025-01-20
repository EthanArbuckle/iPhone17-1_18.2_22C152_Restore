@interface CRLScrollViewAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxAssistiveTechnologyPerformingScroll;
- (void)_accessibilityScrollPageInDirection:(int)a3;
- (void)_crlaxSetAssistiveTechnologyPerformingScroll:(BOOL)a3;
- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5;
@end

@implementation CRLScrollViewAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLScrollView";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)_crlaxAssistiveTechnologyPerformingScroll
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9D93);
}

- (void)_crlaxSetAssistiveTechnologyPerformingScroll:(BOOL)a3
{
}

- (void)_accessibilityScrollPageInDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(CRLScrollViewAccessibility *)self _crlaxAssistiveTechnologyPerformingScroll];
  [(CRLScrollViewAccessibility *)self _crlaxSetAssistiveTechnologyPerformingScroll:1];
  v6.receiver = self;
  v6.super_class = (Class)CRLScrollViewAccessibility;
  [(CRLScrollViewAccessibility *)&v6 _accessibilityScrollPageInDirection:v3];
  [(CRLScrollViewAccessibility *)self _crlaxSetAssistiveTechnologyPerformingScroll:v5];
}

- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double y = a3.y;
  double x = a3.x;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    unsigned int v10 = [(CRLScrollViewAccessibility *)self _crlaxAssistiveTechnologyPerformingScroll];
    if (a4 > 0.0 && v10 != 0)
    {
      v12 = [(CRLScrollViewAccessibility *)self crlaxTarget];
      [v12 contentOffset];
      double v14 = v13;
      double v16 = v15;

      if (x != v14 || y != v16)
      {
        v17 = [(CRLScrollViewAccessibility *)self crlaxTarget];
        v18 = [v17 delegate];

        v19 = NSProtocolFromString(@"CRLScrollViewDelegate");
        if ([v18 conformsToProtocol:v19])
        {
          char v20 = objc_opt_respondsToSelector();

          if (v20) {
            [v18 scrollView:self willAnimateToContentOffset:x, y];
          }
        }
        else
        {
        }
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)CRLScrollViewAccessibility;
  -[CRLScrollViewAccessibility _setContentOffset:duration:animationCurve:](&v21, "_setContentOffset:duration:animationCurve:", v5, x, y, a4);
}

@end